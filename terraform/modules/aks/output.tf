output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}

output "kubelet_identity_object_id" {
  value = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}

output "role_assignment_id" {
  value = azurerm_role_assignment.aks_acr.id
}
