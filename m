Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9926D3A63F3;
	Fri,  9 Oct 2026 09:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536503; cv=none; b=DsTWsmxs/bfPi/JUO2h2/SyE53/qZFBXokFy6cHb85IsSJgI2BHLsqhSPbgzkHsMdOJJagdE/ZhT+zqyA7S79j9wrKHjJEDIYh8adHRufjwFm22iXL4svdhY8CjkPZ2VxXeUVUI4kS/pqmMay/lwgCl7RDt1+kxRhaJXLkDMd1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536503; c=relaxed/simple;
	bh=Lal7zlevrfBd5o18R1QbACBUMlh3lgzbEUE0VoAbA7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlLx1F31vl2qH/KpNK96oy4EiM8+vG2v6zp1B5N3BVPNJQ5+q4Rs8+WTkRwZd44KBprnIsRfSH1+F6HvivXit53Z1zjbqqAOJncAHZX1T1rq5A8G+0/CzgER45sHIxVm45pdunZtqVEx+Bgimu1hHF5ALsLjemIRIaFZYOFW3aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.008401-4.41852e-05-0.991555;FP=17875187543762027754|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037017159;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jXYKwGi_1791536491;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jXYKwGi_1791536491 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 17:01:32 +0800
From: Lin Wang <wanglin@open-hieco.net>
To: Borislav Petkov <bp@alien8.de>,
	Yazen Ghannam <yazen.ghannam@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Cc: Pu Wen <puwen@hygon.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tony Luck <tony.luck@intel.com>,
	x86@kernel.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 7/7] x86/hygon: Add Family 0x18 SMN access
Date: Fri,  9 Oct 2026 17:01:11 +0800
Message-ID: <20261009090111.151878-8-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009090111.151878-1-wanglin@open-hieco.net>
References: <20261009090111.151878-1-wanglin@open-hieco.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All DF nodes in a Hygon socket share one SMN ingress, so SMN accesses
for a node have to go through a root of the node's socket rather than a
root per node.

After DF enumeration, map each DF node to the first root of its socket.
The root socket ID cannot be read back, so group the roots by socket
in PCI enumeration order. Hold a reference to every root, reserve its
config space, and serialize each index/data transaction. Enable SMN
access only after setup succeeds; on failure the DF node cache remains
usable without it.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 arch/x86/include/asm/hygon/node.h |  36 +++++
 arch/x86/kernel/hygon_node.c      | 233 +++++++++++++++++++++++++++++-
 2 files changed, 268 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/hygon/node.h b/arch/x86/include/asm/hygon/node.h
index 5a0a86e90ea2..321a40d41ed7 100644
--- a/arch/x86/include/asm/hygon/node.h
+++ b/arch/x86/include/asm/hygon/node.h
@@ -96,6 +96,30 @@ struct pci_dev *hygon_node_get_func(u16 node, u8 func);
  */
 int hygon_pci_dev_to_df_node(struct pci_dev *pdev);
 
+/**
+ * hygon_smn_read() - Read a 32-bit value from a Hygon SMN address
+ * @node: DF node index in [0, hygon_node_num())
+ * @address: SMN address
+ * @value: Output value
+ *
+ * Return: 0 on success, -EINVAL if @value is NULL, -ENODEV if Hygon
+ * SMN is not initialized or @node is out of range, or a negative
+ * errno from the underlying PCI config access.
+ */
+int __must_check hygon_smn_read(u16 node, u32 address, u32 *value);
+
+/**
+ * hygon_smn_write() - Write a 32-bit value to a Hygon SMN address
+ * @node: DF node index in [0, hygon_node_num())
+ * @address: SMN address
+ * @value: Value to write
+ *
+ * Return: 0 on success, -ENODEV if Hygon SMN is not initialized or
+ * @node is out of range, or a negative errno from the underlying
+ * PCI config access.
+ */
+int __must_check hygon_smn_write(u16 node, u32 address, u32 value);
+
 #else /* !CONFIG_HYGON_NODE */
 
 static inline u16 hygon_node_num(void)
@@ -123,6 +147,18 @@ static inline int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
 	return -ENODEV;
 }
 
+static inline int __must_check hygon_smn_read(u16 node, u32 address,
+					      u32 *value)
+{
+	return -ENODEV;
+}
+
+static inline int __must_check hygon_smn_write(u16 node, u32 address,
+					       u32 value)
+{
+	return -ENODEV;
+}
+
 #endif /* CONFIG_HYGON_NODE */
 
 #endif /* _ASM_X86_HYGON_NODE_H */
diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
index 4d492513a433..b4afa296b4ca 100644
--- a/arch/x86/kernel/hygon_node.c
+++ b/arch/x86/kernel/hygon_node.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Hygon Family 0x18 Data Fabric node enumeration
+ * Hygon Family 0x18 Data Fabric node enumeration and SMN access
  *
  * A DF instance exposes sibling PCI functions in one slot. Function 3
  * is the misc device used for enumeration, function 4 is the link
@@ -17,9 +17,11 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/cpufeature.h>
 #include <linux/export.h>
 #include <linux/init.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/processor.h>
@@ -633,6 +635,231 @@ int hygon_pci_dev_to_df_node(struct pci_dev *pdev)
 }
 EXPORT_SYMBOL_GPL(hygon_pci_dev_to_df_node);
 
+/*
+ * SMN index/data register pair offsets in the host-bridge PCI config
+ * space. Reads and writes to a (node, address) pair are issued as a
+ * two-step transaction: write the SMN address to the index register,
+ * then read or write the value at the data register.
+ */
+#define SMN_INDEX_OFFSET	0x60
+#define SMN_DATA_OFFSET		0x64
+
+/*
+ * Runtime SMN state.
+ *
+ * The smn_reserved_roots array owns the independent PCI references and
+ * config-space reservations for the lifetime of the built-in node layer. The
+ * smn_roots array contains per-node aliases and is published only after
+ * setup succeeds.
+ */
+static struct pci_dev	**smn_roots;
+static struct pci_dev	**smn_reserved_roots;
+static u16		smn_num_nodes;
+static DEFINE_MUTEX(smn_mutex);
+
+/*
+ * Walk PCI host-bridge devices matching the Hygon vendor. The SMN
+ * index/data registers live in function 0 of each root complex. This
+ * follows pci_get_class() iterator semantics: @root is consumed and the
+ * returned device has an iterator reference. A retained device needs an
+ * independent reference before the iterator advances.
+ */
+static struct pci_dev * __init get_next_root(struct pci_dev *root)
+{
+	while ((root = pci_get_class(PCI_CLASS_BRIDGE_HOST << 8, root))) {
+		if (root->devfn)
+			continue;
+		if (root->vendor != PCI_VENDOR_ID_HYGON)
+			continue;
+		break;
+	}
+	return root;
+}
+
+/* Release each config region before dropping its owning device reference. */
+static void __init release_reserved_roots(struct pci_dev **roots, u16 count)
+{
+	u16 i;
+
+	for (i = 0; i < count; i++) {
+		pci_release_config_region(roots[i], 0, PCI_CFG_SPACE_SIZE);
+		pci_dev_put(roots[i]);
+	}
+}
+
+/*
+ * Select one root from each contiguous per-socket enumeration group,
+ * then map every DF node to the root for its socket. The root socket ID
+ * cannot be read back, so the grouping follows PCI enumeration order.
+ *
+ * The smn_reserved_roots array owns the PCI references and config
+ * regions. The smn_roots array contains per-node aliases. Enable SMN
+ * access only after both arrays are complete.
+ */
+static int __init smn_setup(void)
+{
+	u16 num_roots, roots_per_socket, node, num_nodes, num_sockets, reserved;
+	struct pci_dev **reserved_roots, **roots;
+	struct pci_dev *root = NULL;
+	u8 socket_id;
+	int ret;
+
+	num_roots = 0;
+	while ((root = get_next_root(root)))
+		num_roots++;
+
+	pr_debug("Found %u Hygon SMN root devices\n", num_roots);
+
+	if (!num_roots)
+		return -ENODEV;
+
+	num_nodes = df_cache.num_nodes;
+	if (!num_nodes)
+		return -ENODEV;
+
+	num_sockets = df_cache.num_sockets;
+	if (!num_sockets)
+		return -ENODEV;
+
+	if (num_roots % num_sockets) {
+		pr_err("Root count %u not divisible by socket count %u\n",
+		       num_roots, num_sockets);
+		return -ENODEV;
+	}
+
+	roots = kzalloc_objs(*roots, num_nodes);
+	if (!roots)
+		return -ENOMEM;
+
+	reserved_roots = kzalloc_objs(*reserved_roots, num_roots);
+	if (!reserved_roots) {
+		kfree(roots);
+		return -ENOMEM;
+	}
+
+	/* Reserve every root before publishing the node-to-root mapping. */
+	roots_per_socket = num_roots / num_sockets;
+	reserved = 0;
+	while ((root = get_next_root(root))) {
+		if (reserved >= num_roots) {
+			ret = -ENODEV;
+			goto err_release;
+		}
+
+		pci_dbg(root, "Reserving PCI config space\n");
+
+		/*
+		 * Mark the entire PCI config space kernel-exclusive because it
+		 * contains the SMN index/data registers.
+		 */
+		if (!pci_request_config_region_exclusive(root, 0,
+							 PCI_CFG_SPACE_SIZE,
+							 NULL)) {
+			pci_err(root, "Failed to reserve config space\n");
+			ret = -EEXIST;
+			goto err_release;
+		}
+
+		reserved_roots[reserved++] = pci_dev_get(root);
+	}
+
+	if (reserved != num_roots) {
+		pr_err("Root enumeration changed: expected %u roots, got %u\n",
+		       num_roots, reserved);
+		ret = -ENODEV;
+		goto err_release;
+	}
+
+	for (node = 0; node < num_nodes; node++) {
+		socket_id = df_cache.nodes[node].socket_id;
+
+		if (socket_id >= num_sockets) {
+			ret = -ENODEV;
+			goto err_release;
+		}
+
+		roots[node] = reserved_roots[socket_id * roots_per_socket];
+
+		pci_dbg(roots[node],
+			"is root for Hygon node %u (socket %u)\n",
+			node, socket_id);
+	}
+
+	smn_reserved_roots = reserved_roots;
+	smn_num_nodes = num_nodes;
+	smn_roots = roots;
+	return 0;
+
+err_release:
+	pci_dev_put(root);
+	release_reserved_roots(reserved_roots, reserved);
+	kfree(reserved_roots);
+	kfree(roots);
+	return ret;
+}
+
+/*
+ * Serialize the PCI index/data pair between in-kernel SMN users.
+ * The access sequence follows amd_smn_read() and amd_smn_write().
+ * The Hygon node-to-root mapping comes from smn_setup().
+ */
+static int smn_rw(u16 node, u32 address, u32 *value, bool write)
+{
+	struct pci_dev *root;
+	int err;
+
+	if (!smn_roots || node >= smn_num_nodes)
+		return -ENODEV;
+
+	root = smn_roots[node];
+	if (!root)
+		return -ENODEV;
+
+	guard(mutex)(&smn_mutex);
+
+	err = pci_write_config_dword(root, SMN_INDEX_OFFSET, address);
+	if (err) {
+		pr_warn("SMN index write failed (addr 0x%x)\n", address);
+		return pcibios_err_to_errno(err);
+	}
+
+	err = write ? pci_write_config_dword(root, SMN_DATA_OFFSET, *value)
+		    : pci_read_config_dword(root, SMN_DATA_OFFSET, value);
+
+	return pcibios_err_to_errno(err);
+}
+
+int hygon_smn_read(u16 node, u32 address, u32 *value)
+{
+	int err;
+
+	if (!value)
+		return -EINVAL;
+
+	err = smn_rw(node, address, value, false);
+
+	/* Clear the output so callers do not consume a stale value. */
+	if (err) {
+		*value = 0;
+		return err;
+	}
+
+	/* Treat the PCI all-ones value as a missing device. */
+	if (PCI_POSSIBLE_ERROR(*value)) {
+		*value = 0;
+		return -ENODEV;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(hygon_smn_read);
+
+int hygon_smn_write(u16 node, u32 address, u32 value)
+{
+	return smn_rw(node, address, &value, true);
+}
+EXPORT_SYMBOL_GPL(hygon_smn_write);
+
 static int __init df_node_init(void)
 {
 	int ret;
@@ -651,6 +878,10 @@ static int __init df_node_init(void)
 		df_cache.num_nodes - df_cache.num_cdd,
 		df_cache.num_sockets);
 
+	ret = smn_setup();
+	if (ret)
+		pr_warn("SMN setup failed: %d\n", ret);
+
 	return 0;
 }
 fs_initcall(df_node_init);
-- 
2.43.0

