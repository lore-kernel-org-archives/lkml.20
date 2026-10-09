Received: from out198-14.us.a.mail.aliyun.com (out198-14.us.a.mail.aliyun.com [47.90.198.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 827B549B5A9;
	Fri,  9 Oct 2026 09:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=47.90.198.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791536832; cv=none; b=FaLL0e1pfq1ttKrqWXcTnqYc/25xHEWnSVdn9ePbSooH86PibwR+B+Px5S92vnDHw5JeTZik5Czyu5ftmNQpH9KTDNEmIo7GaoP8siqKthvxoWdpza0QLXjtVyYATG4UOQ8fNTZneFe6NyhFrcI0uCcl8G1Iv/p3faw2m9Q/GcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791536832; c=relaxed/simple;
	bh=Y19hvtuGGIPWGRHUaLnout1jeLW6wcOtdMLMoTiH57s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nOYBWomjsC7vLIl1heGWeXoRfywlJmvnSbSo8XTXeAwUGc5+5zZzbKvKHDXoxK2GOt5KvEUR1XBd16BdZc/YeYG12Q/3+A0lZzO9bLByhbrRRmA7InmqKpOHc1+BxbjYDn55ro/xA2M7m/07GfwzqCkDuhVknPcCYMAtFzzmC0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net; spf=pass smtp.mailfrom=open-hieco.net; arc=none smtp.client-ip=47.90.198.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=open-hieco.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=open-hieco.net
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1068492|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.00706148-0.0109065-0.982032;FP=5300217843762597343|1|1|1|0|-1|-1|-1;HT=maildocker-contentspam033032053168;MF=wanglin@open-hieco.net;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.jXYKwEm_1791536490;
Received: from localhost.localdomain(mailfrom:wanglin@open-hieco.net fp:SMTPD_---.jXYKwEm_1791536490 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 09 Oct 2026 17:01:30 +0800
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
Subject: [PATCH v7 5/7] x86/amd_nb: Restrict the northbridge framework to AMD CPUs
Date: Fri,  9 Oct 2026 17:01:09 +0800
Message-ID: <20261009090111.151878-6-wanglin@open-hieco.net>
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

