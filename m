Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252022;
	b=rYO/WVwlQ05NL5CfL5XGHHdtu+17ljUM8jsLZc1XrbYnfIC0EY1UQhQMGjrD1bzj1hdK
	 hh4WeviccaDVh1l9JbdUmFvXVeDMMUDP2kipffxlVXqHx6K8HEkbXbpIG1jRFKcHbDiyC
	 iCwDhK2shwuJdZC2mZ1T2SqDDmPLYWcVObIfabTAl5/2Vjm0OA3QwLgQjUTFGSx38x5zZ
	 pJNaNSld24XFm6lyoMOVU5OtRISQVafW8MPon8v9tvx3d0oCT6L5HRnEJvx/jxLr3nZ6g
	 lFFrD81IGe2Gy//dvmyO3KWD2fwGnLGwPg8JVlkWMTL/7MMryT4yPDRiXLToykwJXPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252022;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=pIinx1Ki8F6iFvjWQ32gnssMER8EdEXbHyxdKukH47A=;
	b=vWMmcgnO7FHi+5O6zLYWVzmh3snj67N4FN7H9mFfyzB6y+JE/cb5pGEreYkizQz9vtxX
	 VhRhlppamPKEfp1ZiA7I0cndWz7jtTPwm7GLD89ESPxw8HWOGh5KLgE6HfkfsFhQR4wrz
	 Lg5Pi8lGemu5HS0y8xeDU1Ck3FFz7KkBzCS27Ky4+U1IGArhouFoJDjR0Zk+9qQKlO92x
	 zNElrFC9tQaw0uR2ns68tgYujt6zuzqXgqyWgdp6mSu/b+aKFBlq84qFLwbR7vbZhboh8
	 KxEiXkK5/7dGxWfIm+SilvtV0ovj+83XBzghRJg50Sy9yiq3BHOGhiVVl99xS5hZibg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.50
Received: from out28-50.mail.aliyun.com (out28-50.mail.aliyun.com [115.124.28.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE6E606A33F;
	Thu, 29 Oct 2026 05:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DE6E606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.0797666|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00219296-0.000961382-0.996846;FP=6920002228918435978|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.js2ZbwO_1793252008;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.js2ZbwO_1793252008 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 13:33:29 +0800
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
Subject: [PATCH v9 6/7] x86/amd_node: Restrict SMN setup to AMD CPUs
Date: Thu, 29 Oct 2026 13:33:12 +0800
Message-ID: <20261029053313.46323-7-wanglin@open-hieco.net>
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

amd_smn_init() also runs on Hygon because Hygon sets X86_FEATURE_ZEN.
It reserves config space on the matching host-bridge roots and groups
them by the CPU-derived node count. Hygon DF nodes are enumerated by
PCI ID, CPU NodeIds are sparse, and the nodes in a socket share one SMN
ingress, so the resulting root map is wrong on Hygon. These reservations
also prevent the Hygon node layer from claiming roots for its own
node-to-root mapping.

Hygon vendor matching has been removed from amd64_edac, amd_atl, and
k10temp modules. The remaining users match AMD PCI IDs or check for an
AMD CPU. With these changes in place, no in-tree Hygon driver uses the
AMD SMN accessors.

Restrict SMN setup and root discovery to AMD CPUs.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
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

