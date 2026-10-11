Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E866336654F
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 11:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791718274; cv=none; b=bQyWiXSZbKnvJb2NwKFtZFYzECI7jr9OeXfY+LBJyNO9oFPTOGZCPNAbaiA7F2Veq6MaaanYHxBv6yi4qd/lUXwYkvKfHQNC/Cl/VHQDbRKpztSMdiRJ3Uun1kqWM5YiZw/RVoctN0f0hWHClwMwp/n/AdP2chP5oPfrmJXzc+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791718274; c=relaxed/simple;
	bh=nD0Q8trpa2s+VQazA20garhEVQ0h10j/Wd6ISAMY06M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B5y5I7P9Kjg7qc78E5sBhFou3O72saHufT5FCmV2mrYnQmy9sTT3tKDFEZu/JINILOrAoxONb7grMXtM4eeGdYmMvwg+FcK6/atacp8asa9dngiCV/FkDSy0VUQEEfv7GjoM16XdyTskPm1rVzfDeL0xmo72GU43UyO1FlXOAMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ooy8a1ed; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ooy8a1ed"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so8248205e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791718271; x=1792323071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EJJ/INsTbIeg+id7HIvFFqETJLWr/g2Eo73Obn7P+RY=;
        b=ooy8a1eduiKb0kDnF+eunW8vOgkP4eqBQrejKtZ+ciDY7pGNZ/cf6v4zJHsT5rtd6O
         1043kBHMd5UX+M5cs0Yx62D/Uy5CmPJOYkMicPxn2aUI8qyhKreJ8cecN+InBCTI8V0/
         UAXK++SH9DN9Od6AKpfFQYcpUvKtRpEm5ReD7BFCe7W/HyvZTWlOSdVbZRsLsJMoB5bK
         FAl/7iNer9S2dZcFZU+TzUVq8eLUPFgStPdgRLaq7v1IKk+wTj82DnvuIPCN8OTwgOz3
         QC44jugpUXV+uzHf8X+e6HnSzpR9TRTsWpLhbPTYOFAbSP1BiXvTaZrEegA/meW8nUo1
         IVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791718271; x=1792323071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EJJ/INsTbIeg+id7HIvFFqETJLWr/g2Eo73Obn7P+RY=;
        b=sFu09DHwwUCQyNpLhtLSqNEbQ1+gF4jJNXQCCyYnR29Ss7IothsCnUpc5Tlj8U8b6W
         kJn16oWZTxF+HCqay8/44fYtHwH5loxqRdPJ5ERS6qwpbAfTv6zvoaXsOptSINaln2gP
         aHJogGWfcMDKF9CrFI3MUZ546qoXs/UL3gEcMoZz1qHl0dPzj2vdScY8RDa3CvUThv9Z
         sdsYEqjP/ag8qwi9pb7N6aYzYeNyWnTwtgY6Y3QiHiWPLGZtVEPdAt07TtJw1EbIMtcm
         e0I9rpoyhHqvEIWL9N7lI9uZYxH23dG0zjO2jA+WV2gftaP++ruR46kcOvzh9bSGk+6N
         DNlg==
X-Forwarded-Encrypted: i=1; AKwUvBwgOHaIlC6kZMzvWxu5+TFP3XxHfkH7Hq4a0DodD87fxT+ci8XCPwJZWOvCD7G/urSITlSbdgvT7EsgNA0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCm0H7sC1e1auNorkif0QO66LKEf/65L2m1H05IT3aV0LAM6gv
	l1EXiJ6aL3SlYvsIcwH2HUAn/NmKfxsjpVeZMk2XUuvlYMAdW5zcPMhr
X-Gm-Gg: AYBFou0WvdJOYh5NK/KMSBvAHS9SREr6MNbjKEV6c4G1bC38Tf5HHo1xt0+XI66Wbhv
	YcGzFU+ENu0ArPcgEy5BFuz1VUrWP8/DLoe4qTuNYQYq65rrY6lBOVc0Qq4F3rFUS20w3n9JxYe
	IBFK90W7y4qm5vh9kfwY1r07Vw2qcIWoLjkP6/e21bLKzB1pqzGc5UNtZTEpNzqN9jNYxw5hjVH
	b681rDv309Z7U4DgBR+tiqZWjHk6givPygSlzMuKhiyc8fEoMUk84lUIcXCoauutuypLIfp/Dbb
	B1Mk55L4wvEJOcb0j3+YwGgAUJJYVPRISAa5XyydSspxOLDocubmhgriUEXzOduRZyFfe8i1CCQ
	vTHtbAxLxWo/jLmGNuO4hVwAvOqCx5J7zUHIGN38mgZmvtAILpuJElZyTAVhpkaXGyeQqFfBmpD
	5SdCNjKL6MVqnBRwPtNfjkv4PmphBcem9dmX99afDlk1ebzIJXvleVQZJy9TjS4FI1DfePuXvMH
	o1W7vskLcnQTXcnARyhudhYJVqY/v0=
X-Received: by 2002:a05:600d:6409:10b0:4a1:96cd:2f6e with SMTP id 5b1f17b1804b1-4a196cd3213mr35135595e9.4.1791718270878;
        Sun, 11 Oct 2026 04:31:10 -0700 (PDT)
Received: from nixos-office ([81.0.251.149])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bea0f1csm305044035e9.9.2026.10.11.04.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 04:31:10 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: maddy@linux.ibm.com
Cc: mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] powerpc/Kconfig: limit the PPC_85xx DATA_SHIFT range to STRICT_KERNEL_RWX
Date: Sun, 11 Oct 2026 12:31:08 +0100
Message-ID: <20261011113108.539470-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On PPC_85xx, enabling DEBUG_PAGEALLOC without STRICT_KERNEL_RWX activates
the DATA_SHIFT range of 20..24, but since the PAGE_SHIFT default is
outside the range (12), kconfig adjusts it to 20, causing 1mb alignment
instead of 4kb. However, the larger alignment is only needed for the
separate kernel permissions provided by STRICT_KERNEL_RWX.

Since PPC_85xx uses page poisoning for DEBUG_PAGEALLOC and does not
support KFENCE, let's restrict this range to STRICT_KERNEL_RWX.

This out-of-range default was detected by kconfirm, a static analysis tool
for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/powerpc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3b6cd655606..5e2a4799438d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -896,7 +896,7 @@ config DATA_SHIFT
 	default 24 if STRICT_KERNEL_RWX && PPC64
 	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	range 14 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
-	range 20 24 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_85xx
+	range 20 24 if STRICT_KERNEL_RWX && PPC_85xx
 	default 22 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
 	default 18 if (DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	default 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx && \
-- 
2.55.0

