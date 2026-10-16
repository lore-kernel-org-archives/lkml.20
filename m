Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8743B40F720
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182673; cv=none; b=EFXZkFb1aG2ZVMSfYhRkgJvGX+zSagnZzdQxpW4/Qiz2YUhSFG6UyLIJMLto8N3rO4Rg+fsCPICmANuZ3roRJA0EsUP+kDs/9Nt+L/Z29Zww3RfGL4Snfysg9+xi90bZIv8F2a0Pvxpzc4UnymP9KJf0fgOjcFD/FyD1iIRDZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182673; c=relaxed/simple;
	bh=lDyZHR3QZcCnXTeGynA/UuEhqwRvu29SVJ6/GUSNRsg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tDl47AgfjnGpPJlG6U7y8HjhZ3XFwZJUqtHXPPokL101dUS0s2eSF88t/BVUyam+4kTF582djq4AmDkrnpoNFT7dHVUMrVwGhLfYxOXZ5iC7eLLBvbdefblqkKXa87JUCcCfgjKLurBn8TWz6JsOet8CQoD5bIx1tRNIJFlsU9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q3U0DcQZ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q3U0DcQZ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso2711965e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792182664; x=1792787464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Iop2qi+eFNESEc9uZHVm2CGO5WQwDSDngrKC7a0NKTs=;
        b=Q3U0DcQZxZ9/GvmSWyoVajnKHOJFC2b45zSdaUVu9Gx6US+ZlFTl+Q0q+BVA63HqC+
         NKNgrgrA5BGKy+BZCjmi3n1zPWU41pBsXdpuDTYrhTMlfhte+XF2NmP75re3KNTE9nI0
         zSQtJYYo3GrjMBmoeWwogPVX56YxNPRE/JnQS4YTwnMNTDZRRWb2etIseDtPI3mc2gk6
         MysQJmw8Nm14eiTzyGFNu0yJWizKfuuEj7/sI0BDrxCNcX2mpxeuzT3z86eaoOmMRugm
         3p9Af5gAsN+8K7LmhAuLRCyHOJ8+U5uGzGQRwXS6jmDSwPiZUqwynilhZScFHSnDUlgx
         +Xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792182664; x=1792787464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iop2qi+eFNESEc9uZHVm2CGO5WQwDSDngrKC7a0NKTs=;
        b=FFlwzvLSyLZmIvfm+4re4hxhSpUu5nLIo1ZTMeGRZTLdOJmktnrSp96xQ31bl8uQnL
         /NRHuBsUAOZmWrW4BGs64E+pHXRjuR29uFAzLvy9Avy9yBytBsPfwo11t0om7XF34Zue
         LB9dH8QWBruwnC/z4lo1nBL3JJDqS7CheW9WO72R1TT+uWZB6mSe9fVhHKAgRZrZWz/a
         Q/afWKuIdsWv5KhCeRfwTnAb80TTwdavMzLnnvmhEQSBE3vKl1Y8OEUpiaE9spV10WBs
         D/Gzwnas/bU/mLLp6FqLht1n+wZDaJ8brlRQPCgpaR2YTzuxBIuDMe46IhdVnY979Ctg
         Z36w==
X-Forwarded-Encrypted: i=1; AKwUvBxF1X9lsoLAaJadyKCzqRsRwOC5dWGaR+WipNZeF3KaPR3NIJC2g4rfI0ZhYuOASNFHuUqHfo2MPyEfnzY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOh+3FPEw32gOWHy2ttFgs36Z1aMFgLJtrQKUKE4I4xHEPmuWF
	ENzrxQx8mJkCUGN2OGYCinAdSTYCRk2yoAvxLVUyLVEiZ/BlKbILjCM/
X-Gm-Gg: AYBFou29K8h54CI82ni/TA+yQengyAx2lprnwyPNiIg/By2zqOBLAe7mrjb5JoZAz/k
	j5O5Qd+qOZyUgRrZnVW24F/4IIMtNPpD9JViYZPjttHF1U7XE57Lq95QJ1CMhzZC28XZvXHwFwx
	3RwM4kdOwe25vm22T/iAYy5ZQ918ynSCk5pkuUrkPzkQQ8h5rYTTjPpLTakgElQKYZtIQSfTp2i
	3lCkiOCkB6DrokpLbIG4Soc4/pxVPc39L++pX4XKM/AajgNiAl7KHU1e6gK1ttPXV6K+QSqkBFs
	zKywmUCbkzUff3XaChIHpzEAcAwlJuTO6PQLalwG2ruvkPtswSbY8pflfbGiUgQqqWfdC0z1QcC
	FYYpzOUK97Dcey3In0PZZ6SaNhKlIOjjdzGMDUH2sWuMs4o3iCD2aZnoWIV14DR7vdhN4kbVppr
	UYiCc0SHz7w7+rbAOIGPUe7+JDxYNEtLrAc19lIaU4tJRC5CDyW4hcf+6TrB9wP+xCqnedevXuD
	eOCaVtTVsJjYBXnPPtCQ1DQZCnJSVlOuEeXg1ewnvN1LMyySTgAjCZaclq/2/DvE9u7LZaP4qXB
	bL0UZJTERyUG5AcxKQwuKYXExJq95OrIiVdgdpx66aLIu3sdMqEhycE1xBZiwNsKMVIByMp6BZu
	2MA==
X-Received: by 2002:a05:600d:864c:20b0:4a1:cdd1:5144 with SMTP id 5b1f17b1804b1-4a1d7616470mr13719675e9.21.1792182664215;
        Fri, 16 Oct 2026 13:31:04 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a951-9501-1471-d90c-a21f-9dd7.310.pool.telefonica.de. [2a02:3100:a951:9501:1471:d90c:a21f:9dd7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd540bc4sm7177387f8f.2.2026.10.16.13.31.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 16 Oct 2026 13:31:03 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Michael Neuling <mikey@neuling.org>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFT PATCH] riscv: errata: mips: Skip vendor extension lookup during early alternatives
Date: Fri, 16 Oct 2026 22:30:52 +0200
Message-Id: <20261016203052.2026-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When an enabled erratum selects RISCV_ALTERNATIVE_EARLY,
apply_early_boot_alternatives() calls the MIPS errata callback from
setup_vm() with the MMU disabled. Each enabled P8700 probe calls
riscv_isa_vendor_extension_available() before rejecting
RISCV_ALTERNATIVES_EARLY_BOOT, although neither workaround is applied in
that stage.

KASAN instrumentation in __riscv_isa_vendor_extension_available() reads
shadow memory with satp=0. On QEMU's mips-p8700 model this raises a load
access fault, and the temporary trap vector parks the boot hart. The guest
prints nothing after the OpenSBI handoff.

Move the existing early-stage rejection before the extension lookup in both
probes. All later stages retain their existing lookup and patch selection.

Fixes: 0b0ca959d206 ("riscv: errata: Fix the PAUSE Opcode for MIPS P8700")
Fixes: 2cf0b2992203 ("riscv: Add ERRATA_MIPS_P8700_WFI to replace WFI with mips.pause")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Based on RISC-V for-next commit a5ae1bf65cee.

Tested with QEMU 11.0.2, virt/mips-p8700, four harts, and generic KASAN:

- The parent reached the OpenSBI handoff but produced no Linux output in
  120 seconds.
- The patched kernel initialized KASAN, brought all four harts online, and
  powered off cleanly.
- With a DTB advertising xmipsexectl, all 414 PAUSE and 6 WFI sites in live
  kernel text contained mips.pause.

QEMU does not model the physical WFI translation erratum or P8700 PAUSE
behavior. This was not tested on P8700 hardware. Please test with KASAN and
both P8700 errata enabled.

 arch/riscv/errata/mips/errata.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/errata/mips/errata.c b/arch/riscv/errata/mips/errata.c
index 6e71555274501..9bb1c3de9504e 100644
--- a/arch/riscv/errata/mips/errata.c
+++ b/arch/riscv/errata/mips/errata.c
@@ -18,10 +18,10 @@ static inline bool errata_probe_pause(unsigned int stage)
 	if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_PAUSE_OPCODE))
 		return false;
 
-	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
 		return false;
 
 	return true;
@@ -32,10 +32,10 @@ static inline bool errata_probe_wfi(unsigned int stage)
 	if (!IS_ENABLED(CONFIG_ERRATA_MIPS_P8700_WFI))
 		return false;
 
-	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return false;
 
-	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+	if (!riscv_isa_vendor_extension_available(MIPS_VENDOR_ID, XMIPSEXECTL))
 		return false;
 
 	return true;
base-commit: a5ae1bf65cee84bcc121d659e7e22a767853f5f5
-- 
2.39.5 (Apple Git-154)

