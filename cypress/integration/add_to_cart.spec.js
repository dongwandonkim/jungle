describe('Testing add cart', () => {
  beforeEach(() => {
    cy.visit('/');
  });

  it('can click add button', () => {
    cy.get('.products article:first').find('.button_to').submit();

    cy.get('.nav-item.end-0').find('.nav-link').contains('1');
  });
});
