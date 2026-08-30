Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA233ACA5B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788099776; cv=none; b=LjQP3ewgWf4lSeZWB0fpnTH2tV4L9XPeIB+XwGn7H416t/dbAoPKz6UzTSojYgguE6iQ678blzb+vvy8JorHgJnTzeQjcjE5Jd7/h3CA6L7Tvdo9OCO/mCQGW1ohGohFQmR6yc2WpQQr15XEqnQwPAdZPTjDB2tpsiGYlltJQTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788099776; c=relaxed/simple;
	bh=2Vf0TxuMFqEMwslw0AZjsjEK/WEeXmGvhfNDCvu7/gs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LMV82VbUI+YqoxiMCnbemxG5oJjIwF1nd+/zhb7Xo+P9fWHjJwLZuA9F5AtlwKlf6eWpRHV+15u4vNWOFTvIjK3VRYsUqI7DIlMb6hAKOYMpffnTKYeN0znfv694JXCo/Eh0cNcyWRR/py3hTHhxq7YRbC6B3kPTt5S20i9/8NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAD3AUC2PJRqo7ObBg--.27880S2;
	Sun, 30 Aug 2026 22:22:46 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Dinh Nguyen <dinguyen@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: socfpga: select the PL310 erratum 753970 workaround
Date: Sun, 30 Aug 2026 22:22:44 +0800
Message-ID: <20260830142244.37216-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAD3AUC2PJRqo7ObBg--.27880S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4kXr4UKrWDCFW3CFyUZFb_yoWkXrb_Ja
	nxK3y7uF1F934Dur1jqF4kWrZ2vayDCFy8tryjvr1UZ3yDX3W7CaykJF1j93s5tw4UKryf
	u3yvvFn8u34FyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb4kFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJV
	W0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU089NUU
	UUU
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/

ARCH_INTEL_SOCFPGA selects CACHE_L2X0 and several PL310 erratum
workarounds. The 753970 workaround is still conditioned on PL310, but that
Kconfig symbol no longer exists, so this one selection is always disabled.

Select PL310_ERRATA_753970 directly, consistently with the other PL310
workarounds required by the platform.

Fixes: fbc125afdc50 ("ARM: socfpga: Turn on ARM errata for L2 cache")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/mach-socfpga/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-socfpga/Kconfig b/arch/arm/mach-socfpga/Kconfig
index eb72c240c2486..528c5c1368c37 100644
--- a/arch/arm/mach-socfpga/Kconfig
+++ b/arch/arm/mach-socfpga/Kconfig
@@ -16,7 +16,7 @@ menuconfig ARCH_INTEL_SOCFPGA
 	select ARM_ERRATA_775420
 	select PL310_ERRATA_588369
 	select PL310_ERRATA_727915
-	select PL310_ERRATA_753970 if PL310
+	select PL310_ERRATA_753970
 	select PL310_ERRATA_769419
 	select RESET_CONTROLLER

base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
-- 
2.50.1

