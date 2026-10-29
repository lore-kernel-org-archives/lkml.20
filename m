Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252024;
	b=DlZp9L50b+fedyyI4PZdDNzaE6GH3QskW6a2bDQnpJNoolUkOWU7R8Kkvl2ubxEzhbhC
	 ubMBEVq/aA7KI1eVm006GVf4hvfXUmjQxgyb3xtk+Yozdlz1s5LEy9Hmul09On1F47zIj
	 h7Cjo7NcRdXeOtW7LWThsdQoYvtq8IiygETxLHDAg71DQXF0xNvejSL/brj39+YJapuvK
	 Vl6HTaQxChIDsE3cyirWC2+iiZisBDi0pAUb6R/WYP2VnjyqZyK1Kn0LqUDLCnNrFY+Ug
	 Lxya0HQmtEqKihjLeFv6YkOSxEr7emRP1LIm0xYZtfit/0Yh36/NQbcZOsMgnQzfK9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252024;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C5yqtES/TPSzXsUed/vIpDcErBvZGlodbkqMIwo/huc=;
	b=yCdHvK7KFKWRozHPXwA/B6epuzrc7xeoytOPPfUJ3Y7yVg2yQiISiPWcqJA6vh5i/lXS
	 0mPWokSWPjLJWRNqIBQG+MYUZEQs2KZqFKyhECwo324XHdde3xQe5Xy0LanNk000aptzt
	 U3kgwl/JfZ2F51zJg6I1671WJA9ArrdM/3jOh2tI9xAFCSIir2d9EHPnn9bqXNjWux+gw
	 mT6Sa2USSZ7ObHP/OjKmWMQNOM5bLYIgs+FWG+AA8I7HlycTNYDOhg2RGoybESC2FbkZo
	 +xbPG1uOR5hrAePcaL/ChWZlVt7LTU/goZsMGYB11NeOaxvH4tJKw33MjX7wkMoO77A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.121
Received: from out28-121.mail.aliyun.com (out28-121.mail.aliyun.com [115.124.28.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193C160A2625;
	Thu, 29 Oct 2026 05:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193C160A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436259|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00535388-5.43335e-05-0.994592;FP=16866519898018104554|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.js2ZbxR_1793252009;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.js2ZbxR_1793252009 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 13:33:30 +0800
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
Subject: [PATCH v9 7/7] x86/hygon: Add Family 0x18 SMN access
Date: Thu, 29 Oct 2026 13:33:13 +0800
Message-ID: <20261029053313.46323-8-wanglin@open-hieco.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029053313.46323-1-wanglin@open-hieco.net>
References: <20261029053313.46323-1-wanglin@open-hieco.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All DF nodes in a Hygon socket share one SMN ingress, so SMN accesses
for a node have to go through a root of the node's socket rather than a
root per node.

After DF enumeration, map each DF node to the first root of its socket.
The roots do not expose their socket IDs, so group them by socket in
PCI enumeration order. Each DF node holds its own reference to its
socket's root. Keep config space reserved on all roots for the lifetime
of the node layer and free the temporary root table after setup.

Serialize each index/data transaction. A setup failure releases all
acquired resources without invalidating the DF node cache.

Hygon drivers such as EDAC need SMN access. Keep the SMN read and write
helpers local to hygon_node.c until such drivers are added.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 arch/x86/kernel/hygon_node.c | 200 ++++++++++++++++++++++++++++++++++-
 1 file changed, 199 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
index 03c723aab97e..5dc766197d4e 100644
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
@@ -17,8 +17,10 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/cpufeature.h>
 #include <linux/init.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci_ids.h>
 #include <linux/processor.h>
@@ -77,6 +79,7 @@
 struct df_node {
 	struct pci_dev	*misc;
 	struct pci_dev	*link;
+	struct pci_dev	*smn_root;
 	u8		socket_id;
 	u8		dfid;
 	bool		is_cdd;
@@ -629,6 +632,197 @@ static int __maybe_unused hygon_pci_dev_to_df_node(struct pci_dev *pdev)
 	return -ENODEV;
 }
 
+/*
+ * SMN index/data register pair offsets in the host-bridge PCI config
+ * space. Reads and writes to a (node, address) pair are issued as a
+ * two-step transaction: write the SMN address to the index register,
+ * then read or write the value at the data register.
+ */
+#define SMN_INDEX_OFFSET	0x60
+#define SMN_DATA_OFFSET		0x64
+
+/* Protect the SMN index/data transaction. */
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
+/*
+ * Select one root from each contiguous per-socket enumeration group,
+ * then map every DF node to the root for its socket. The roots do not
+ * expose their socket IDs, so the grouping follows PCI enumeration order.
+ * DF enumeration guarantees dense socket IDs starting at zero.
+ *
+ * Cached roots own independent PCI references. Keep the config regions
+ * reserved after setup; release them only when setup fails.
+ */
+static int __init smn_setup(void)
+{
+	u16 num_roots, roots_per_socket, node, num_nodes, num_sockets, reserved;
+	struct pci_dev **reserved_roots;
+	struct pci_dev *root = NULL;
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
+	reserved_roots = kzalloc_objs(*reserved_roots, num_roots);
+	if (!reserved_roots)
+		return -ENOMEM;
+
+	/* Reserve every root before publishing the node-to-root mapping. */
+	roots_per_socket = num_roots / num_sockets;
+	reserved = 0;
+	while ((root = get_next_root(root))) {
+		if (reserved >= num_roots) {
+			ret = -ENODEV;
+			goto out;
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
+			goto out;
+		}
+
+		reserved_roots[reserved++] = pci_dev_get(root);
+	}
+
+	if (reserved != num_roots) {
+		pr_err("Root enumeration changed: expected %u roots, got %u\n",
+		       num_roots, reserved);
+		ret = -ENODEV;
+		goto out;
+	}
+
+	for (node = 0; node < num_nodes; node++) {
+		struct df_node *n = &df_cache.nodes[node];
+
+		n->smn_root = pci_dev_get(reserved_roots[n->socket_id * roots_per_socket]);
+
+		pci_dbg(n->smn_root,
+			"is root for Hygon node %u (socket %u)\n",
+			node, n->socket_id);
+	}
+
+	ret = 0;
+
+out:
+	pci_dev_put(root);
+	while (reserved) {
+		root = reserved_roots[--reserved];
+		if (ret)
+			pci_release_config_region(root, 0, PCI_CFG_SPACE_SIZE);
+		pci_dev_put(root);
+	}
+	kfree(reserved_roots);
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
+	if (!df_cache.nodes || node >= df_cache.num_nodes)
+		return -ENODEV;
+
+	root = df_cache.nodes[node].smn_root;
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
+static int __must_check __maybe_unused hygon_smn_read(u16 node, u32 address, u32 *value)
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
+
+static int __must_check __maybe_unused hygon_smn_write(u16 node, u32 address, u32 value)
+{
+	return smn_rw(node, address, &value, true);
+}
+
 static int __init df_node_init(void)
 {
 	int ret;
@@ -648,6 +842,10 @@ static int __init df_node_init(void)
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

