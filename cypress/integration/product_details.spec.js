describe('Testing product_details', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('can navigate to the product detail page by clicking on a product', () => {
    cy.get('.products article').first().click();
  });
});
