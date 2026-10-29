Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793252019;
	b=QVGIBXkpobTxQsiAJkns31JPFh6gHDbn06qhwogtopxtlEtGSgrdRmWE+TMb+j5QutOh
	 XQkc0h9iR4s5Xqj15jeei1IvZ3kUBTmCtSxg+XtUoVGrg1SnlgyH4CtuJdkI/HHc2N52b
	 tEImu9oe7stzzQ5/8sieO+XH5GDuMpTAtjaw3yWH53Ju4e3QkK2loWkzEQxKO2FDRimzv
	 lkTogEIhWsD8nAQNl1+VyWO4306uzaERt2WiomGlwUFdvmLpsLbWdIELdH6PXZJHA0jKT
	 Ee3G3N3bFpZE14qKS1YyXCz2I5CEU2ZpgECo/99hBP7C1y/Wzapdp5Rf+1Fa7WUjBHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793252019;
	h=DMARC-Filter:X-Alimail-AntiSpam:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LO7kULQbd/RvNyzNlhIL/SC1uMZ4kwTcOMF3Y6R/cmw=;
	b=kLompjKJPXva0FNaW/kfWaywHF5ZC7zj23t9yFPC4plajdO9ht8/15Z7H3AlkWiqY+Tx
	 vVG44CiWK09+/nB4eHdqzdm0u2lFlG+clf8+zMqTbB5kELluaQR+8Ti7cDtQwom9L3ojB
	 DuYxPEGR8um7weUgo+0tsy7VlDW+3VQ3LxOFYYiNklG4Digso6+iKCPKkqFgSC5328nOp
	 YWFnrzBOPwJPE2vNVxrhHaiWFyg2EWsXO2dmk77e9pIGqyTJH7CC+XvoTLy9L1w7Fv5ww
	 wxXBf1w+P8MaNz0z3NAzD1BgXw1UW+QR1LyNfVne3XarnKEapQVlLI7GM09WTsC8QmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=open-hieco.net;
	spf=pass smtp.mailfrom=open-hieco.net;
	arc=none smtp.remote-ip=115.124.28.170
Received: from out28-170.mail.aliyun.com (out28-170.mail.aliyun.com [115.124.28.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7BC9606A32A;
	Thu, 29 Oct 2026 05:33:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7BC9606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.108361|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00706148-0.0109065-0.982032;FP=5300217981201550815|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045166233;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.js2ZbvY_1793252008;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.js2ZbvY_1793252008 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 29 Oct 2026 13:33:28 +0800
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
Subject: [PATCH v9 5/7] x86/amd_nb: Restrict the northbridge framework to AMD CPUs
Date: Thu, 29 Oct 2026 13:33:11 +0800
Message-ID: <20261029053313.46323-6-wanglin@open-hieco.net>
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

The AMD northbridge cache previously discovered Hygon F3 devices by PCI
ID. It now derives the node count from CPU topology and locates node
functions at fixed PCI slots. Hygon DF devices do not follow that
layout, so the Hygon branch no longer builds a usable cache.

amd64_edac and ATL no longer use this cache on Hygon. Restrict
northbridge initialization and the early northbridge check to AMD CPUs.
Keep amd_get_mmconfig_range() available on Hygon because it reads the
MMCONFIG MSR without using the northbridge cache.

Signed-off-by: Lin Wang <wanglin@open-hieco.net>
Reviewed-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
 arch/x86/kernel/amd_nb.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/amd_nb.c b/arch/x86/kernel/amd_nb.c
index 5d364540673d..848ed2ca17c3 100644
--- a/arch/x86/kernel/amd_nb.c
+++ b/arch/x86/kernel/amd_nb.c
@@ -125,8 +125,7 @@ bool __init early_is_amd_nb(u32 device)
 	const struct pci_device_id *id;
 	u32 vendor = device & 0xffff;
 
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
-	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
 		return false;
 
 	if (cpu_feature_enabled(X86_FEATURE_ZEN))
@@ -315,8 +314,7 @@ static __init void fix_erratum_688(void)
 
 static __init int init_amd_nbs(void)
 {
-	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD &&
-	    boot_cpu_data.x86_vendor != X86_VENDOR_HYGON)
+	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD)
 		return 0;
 
 	amd_cache_northbridges();
-- 
2.43.0

