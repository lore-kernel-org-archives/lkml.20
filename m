Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.149
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252017;
	b=3tAX6WdJuYVvOE993ek2Cxuv73Apxs/9TZsbzVIFWzb1cLJSTtSSHmsL2UlsWZkJrncX
	 jWGxbwmgOWrsti5oAEr1hdnB2G6nVoFG36ASedKfEsO9bh2+nT32dmEg9ZWGYmv9AaBeb
	 ZMPBMiwQYA8beZfF7Cwg8yHXN3InR7zNMC+qhSqtDDhXIYh+KHVNtJysQ/sG0yFOTEMqD
	 WJtEOc/HFlbqPcu4hxFz8WrBNetY0POCWvUG/qMCkYJMvXq6dE8EssXx34CLEIt8y80rv
	 YTCyaPHGmTeHhTAGSCC35gAi/5deHcU/yhH39x4CICKP82YGiC+HYswg176DbNq7ZBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252017;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3UDEKgZUPckUGfKZJ0o0xSTXDylJXQWn0mYSGDOxAlI=;
	b=K4GrgU2rzR3wBb3+Qrdg7l+BwqmngIkyV2BitI2lzksb5X3TqTKiXZKfOSpCq8hTv7QE
	 N/wdlXya1trUYnQLFfHqGm5nAtnOjNqSIQ4Vck6WEoB1FYJFdA59TF13M7EXu2kn3r7+T
	 C5BpoHiXeYpk3DRxA9cux022MsKwrB4Cho15IDT6q4RJ+uv+Dunn1wNJnloHVY7XqShkw
	 /E52yzaVM56sUBpDwU8/S5aOBnmO/AqtEdXxRa9l7zl8z6mK5uiozKY4jI1obCfyRQJmC
	 dMakbzhwZD2f0L79CCM7VWC9y9EspxY1CI7GWpABL4w+91MZFCynhOnArR/sACEPvug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.149
Received: from out28-149.mail.aliyun.com (out28-149.mail.aliyun.com [115.124.28.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478CF606A31E;
	Thu, 29 Oct 2026 05:33:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 478CF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07469158|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00447277-0.0011769-0.99435;FP=13836726345535406299|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.js2ZbtK_1793252005;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.js2ZbtK_1793252005 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 13:33:26 +0800
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
Subject: [PATCH v9 2/7] x86/hygon: Map CPU NodeIds to DF nodes
Date: Thu, 29 Oct 2026 13:33:08 +0800
Message-ID: <20261029053313.46323-3-wanglin@open-hieco.net>
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
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/hygon_node.c | 54 ++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/arch/x86/kernel/hygon_node.c b/arch/x86/kernel/hygon_node.c
index 6a5278f8e5ca..03c723aab97e 100644
--- a/arch/x86/kernel/hygon_node.c
+++ b/arch/x86/kernel/hygon_node.c
@@ -24,6 +24,7 @@
 #include <linux/processor.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
+#include <linux/topology.h>
 
 #include <asm/cpu_device_id.h>
 #include <asm/hygon/node.h>
@@ -481,6 +482,44 @@ static int __init sort_and_classify(struct df_node_cache *cache)
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
+	local  = FIELD_GET(NODE_ID_LOCAL, phys_nid);
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
@@ -533,6 +572,21 @@ static int __maybe_unused hygon_node_get_info(u16 node, struct hygon_node_info *
 	return 0;
 }
 
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
 /* Return a referenced DF device; the caller must call pci_dev_put(). */
 static __maybe_unused struct pci_dev *hygon_node_get_func(u16 node, u8 func)
 {
-- 
2.43.0

