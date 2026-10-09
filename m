Received: from out28-4.mail.aliyun.com (out28-4.mail.aliyun.com [115.124.28.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CCE3BB689;
	Fri,  9 Oct 2026 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536502; cv=none; b=VHMO5AIlaTsZtHQCIBq9QGJmMRc69LPwPaBLup7UQbNucshSSYgZaxN6Vwq98nW3qJ8TNJwYcgvnM00GhSp3c5UsPK3wNT4o5Nf51fWie/gndYFwUAt/PLlIFUeWZ5dz66gqsu8RTc7aNsCcZKmTIlZsfWc7zvDVpcYjLTkfHwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536502; c=relaxed/simple;
	bh=NRLktEXE3cC/sk9YyRj+NJSOOuwJ3Oj2qTXhji7f1Fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HiNX0p46WowwBfwa6ybesJmB9mM0n9kVswvhtt95CiJ9cKWMCTvYVd4ogS+t+q6iCbRAnq6QqGgszp0fsVfw8gzSebnWpfOBTWXzdseKT4tmfNA0RFjDUpk5srlfytevoo48hvylXJ4cvYYPnxloTs8z2QjNNifZQpnoC7W9IAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=115.124.28.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07756163|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.00188333-0.000822852-0.997294;FP=16143513903817048203|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033037006180;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jXYKwFh_1791536491;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jXYKwFh_1791536491 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 17:01:31 +0800
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
Subject: [PATCH v7 6/7] x86/amd_node: Restrict SMN setup to AMD CPUs
Date: Fri,  9 Oct 2026 17:01:10 +0800
Message-ID: <20261009090111.151878-7-wanglin@open-hieco.net>
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

amd_smn_init() also runs on Hygon because Hygon sets X86_FEATURE_ZEN.
It reserves config space on the matching host-bridge roots and groups
them by the CPU-derived node count. Hygon DF nodes are enumerated by
PCI ID, CPU NodeIds are sparse, and the nodes in a socket share one SMN
ingress, so the resulting root map is wrong on Hygon. These reservations
also prevent the Hygon node layer from claiming roots for its own
node-to-root mapping.

The preceding patches remove the Hygon matches from amd64_edac and ATL.
This change also requires "hwmon: (k10temp) Stop matching Hygon devices".
The remaining users match AMD PCI IDs or check for an AMD CPU.
With these changes in place, no in-tree Hygon driver uses the AMD
SMN accessors.

Restrict SMN setup and root discovery to AMD CPUs.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
---

Notes (hygon-node-deps):
    Depends on commit 08e6615c909b ("hwmon: (k10temp) Stop matching Hygon
    devices") in hwmon-next, which is not in mainline yet. It must be merged
    before this patch.

 arch/x86/kernel/amd_node.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index b7926ba3610a..c36b410d04a4 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -229,8 +229,7 @@ static struct pci_dev *get_next_root(struct pci_dev *root)
 		if (root->devfn)
 			continue;
 
-		if (root->vendor != PCI_VENDOR_ID_AMD &&
-		    root->vendor != PCI_VENDOR_ID_HYGON)
+		if (root->vendor != PCI_VENDOR_ID_AMD)
 			continue;
 
 		break;
@@ -253,6 +252,9 @@ static int __init amd_smn_init(void)
 	u16 count, num_roots, roots_per_node, node, num_nodes;
 	struct pci_dev *root __free(pci_dev_put) = NULL;
 
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
+		return 0;
+
 	if (!cpu_feature_enabled(X86_FEATURE_ZEN))
 		return 0;
 
-- 
2.43.0

