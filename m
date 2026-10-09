Received: from out28-53.mail.aliyun.com (out28-53.mail.aliyun.com [115.124.28.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D21299931;
	Fri,  9 Oct 2026 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536501; cv=none; b=Y/ymliSU+aa/Nc9P14nXsmWDstLioqCZDJ97CeKrH5PH0Lv18fQ69xEJUjdQngmAH5MFV9+JiUjmv5D+G9DOJU1jmo09RZ8atWVsCLD0oYOslVq1tU5R+gygIn1VZeAjlT7//lH8rr1fcJI4Gh8P3fdzmjXI3bcKksi1meUrVYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536501; c=relaxed/simple;
	bh=gHjR8ssTxdXz9Jo/UwoqfXGPb2EHkard40YPY+kEN5E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RwbPNjqG4pFo8ifRHH2zWoLYUke/hcq57rgheAzb6tOIWJ2f2aI4pSdz7KZUV47Ju6IWoEo2y9Jdo4drywG0yLALBtMH061L/f/bQYYhxZ0QR7pzFeW79kartfUpYlsTwDA9KX1Y1nm6aZhLAgibKaD6YLUF1j8QAOjQz91tGXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07482982|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00458822-0.00106667-0.994345;FP=13836655701913321691|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037017159;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jXYKwBd_1791536487;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jXYKwBd_1791536487 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 17:01:28 +0800
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
Subject: [PATCH v7 2/7] x86/hygon: Map CPU NodeIds to DF nodes
Date: Fri,  9 Oct 2026 17:01:06 +0800
Message-ID: <20261009090111.151878-3-wanglin@open-hieco.net>
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

On bare-metal Hygon systems, CPUID 0x8000001E ECX[7:0] encodes a
CPU's socket and local CDD ordinal. The value is sparse across sockets
and cannot directly index the dense DF node cache.

Resolve the encoded socket and local ordinal against CDD entries in the
cache, which are ordered by socket and DFID. The NodeId reported by
CPUID in a guest may not describe the physical DF topology, so return
-ENODEV in guests or when it does not identify an enumerated CDD.

Hygon EDAC and ATL support will use this mapping. Keep it local until
that support is added.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---
 arch/x86/kernel/hygon_node.c | 55 ++++++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
index b83b1c8c40ea..4d492513a433 100644
--- a/arch/x86/kernel/hygon_node.c
+++ b/arch/x86/kernel/hygon_node.c
@@ -17,6 +17,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/bitops.h>
+#include <linux/cpufeature.h>
 #include <linux/export.h>
 #include <linux/init.h>
 #include <linux/pci.h>
@@ -24,6 +25,7 @@
 #include <linux/processor.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/topology.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/hygon/node.h>
@@ -481,6 +483,44 @@ static int __init sort_and_classify(struct df_node_cache *cache)
 	return 0;
 }
 
+#define NODE_ID_SOCKET	GENMASK(7, 4)
+#define NODE_ID_LOCAL	GENMASK(3, 0)
+
+/*
+ * Translate a Hygon Fam18h phys_node_id (CPUID 8000001E ECX[7:0]) to a
+ * dense DF CDD index. On supported models, CPUID reports this
+ * encoding:
+ *
+ *   phys_node_id = (socket_id << 4) | local_cdd_index_in_dfid_order
+ *
+ * The CDD region of df_cache.nodes[] is sorted by (socket_id, dfid), so
+ * return the index of the CDD whose socket_id matches and whose
+ * socket-local ordinal is @local.
+ *
+ * Return -ENODEV if the cache is unavailable or no CDD matches.
+ */
+static int phys_nid_to_df_node(unsigned int phys_nid)
+{
+	unsigned int socket, local, ordinal = 0;
+	u16 i;
+
+	socket = FIELD_GET(NODE_ID_SOCKET, phys_nid);
+	local = FIELD_GET(NODE_ID_LOCAL, phys_nid);
+
+	if (!df_cache.nodes)
+		return -ENODEV;
+
+	for (i = 0; i < df_cache.num_cdd; i++) {
+		if (df_cache.nodes[i].socket_id != socket)
+			continue;
+
+		if (ordinal++ == local)
+			return i;
+	}
+
+	return -ENODEV;
+}
+
 static int __init build_cache(void)
 {
 	struct df_node_cache cache = { };
@@ -536,6 +576,21 @@ int hygon_node_get_info(u16 node, struct hygon_node_info *info)
 }
 EXPORT_SYMBOL_GPL(hygon_node_get_info);
 
+static int __maybe_unused cpu_to_df_node(unsigned int cpu)
+{
+	if (cpu >= nr_cpu_ids)
+		return -EINVAL;
+
+	/*
+	 * The NodeId reported by CPUID in a guest may not describe the
+	 * physical DF topology.
+	 */
+	if (cpu_feature_enabled(X86_FEATURE_HYPERVISOR))
+		return -ENODEV;
+
+	return phys_nid_to_df_node(topology_amd_node_id(cpu));
+}
+
 struct pci_dev *hygon_node_get_func(u16 node, u8 func)
 {
 	if (!df_cache.nodes)
-- 
2.43.0

