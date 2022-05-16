const Articles = ({ articles }) => {
  return (
    <>
      {articles.map((article) => {
        return (
          <div key={article.id}>
            <p>{article.title}</p>
            <p>{article.body}</p>
          </div>
        );
      })}
    </>
  );
};

export default Articles;
