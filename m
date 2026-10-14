Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E3F4FDE66
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:56:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791982576; cv=none; b=JjWlJu7Egv8U1NGFN4nGXrzATAYTzJNFa+FMhZN5nb3pzYnCLJ6cRtTBFeDQb60I4Bc9eWsyRe51hI9TLpjWWX+XrTSV3UBt2Sml32tuAhPKoBVzlKQsieQgAGggaN8ONlNR0n0CW9dRYVucOindoRVbBQX9jtJ5gqlsAMOebA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791982576; c=relaxed/simple;
	bh=QiRLY2I+dmsB482w65tPwSwtUHXEciYXGaPwGUm8SWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBcLBxmHIkXW/Q3LMPJUiOEQn6vHt6A94K1V/eJu7TqL+Y2fJTcYG6R0D44YDD6pDfgMivDw7F9XJqT3SWzPMwpKieeVWGpIIB+C6Mt8aT9FzVUpdneOCdakcaqA7TypNnQL1F3DrsT7e01Jhx2neo2yEPTBiHckWfsPPRuUSUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XVOjvUa7; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XVOjvUa7"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso29675795e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 05:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791982566; x=1792587366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx/fbzAbqnMStJvOu8HgXW+2ghzJGQTHCrd7OHKmmSY=;
        b=XVOjvUa7ZASY5dL5iHBo/QH6lFnoatRxhenGNDroHwXeb30D1orzq7/5ShpfgxZrqp
         vtvqAo0NVs6hWg38jORx9kXEH/uaoRAaz2UMcPsVBEFO5e7Xr/feveZV7tBPiGznCgXt
         lTTtIOOeZXToXiHPeHjQ9fuq1rC9puDPNGeL2GWg1SYdFbdJeizZFwnWqduabDQoxXiQ
         L+6jxhdpvnW9hPTXi81UCWWdLpikGb8x3harMfXTHKZxkGeGxvOWgDz4gh6m21xMy5J4
         MVKrpgNoDQ6Pb6bBCdee/d4T5tWGgxnxncIL3jbbZEwDjdWStgffZVI+zbd+PTljec39
         1slA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791982566; x=1792587366;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bx/fbzAbqnMStJvOu8HgXW+2ghzJGQTHCrd7OHKmmSY=;
        b=UCFBRZ16wlaeSKY2eyMy7rnpJujGyn6Wc4cs+GDe322mhruvHjWW5kmQqUTuj7+T8a
         H2O7OeLqPT48Fz32Dypem82Rmjafm9WLAFdM1wfzUri1Hvs+D8rnrXSXCs0kOXP4PQRG
         1ifMhil8bXdwARU/yggquTNIrCj/dln5RTRTllCFHwpdpbshxzgzr7m1vAoI81HAp8/d
         AJQ4Zz9uk0CnMGz8wi5UWvEIjbbjgmJ6prX/vDJrgVEp7vzCBUC+Jf6BHc5pZiiXFaQq
         yN2oswd/jtbcomr9OCfDk+HXdHPUYr4w+40leV2BbQS99P9Lfz3L7PvN4K6TvwCe85QQ
         b67Q==
X-Forwarded-Encrypted: i=1; AKwUvByHvWkqA3Em1yEAURHPcKSdxSU8B/0dsmPQmSebxepBAV0nVk7TCbcf2SNrSMVXFB9K2O9DBap8xfPFss8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKI14Ta2wwm51h33ink3FBN7RMD3+LGgYcXntY0ERgsxnpYV5f
	vAzLjrw0549KkjrLSY6cR+BSkP4ngrr/uuf55c87vTKetZ51zk/Qvic4
X-Gm-Gg: AYBFou1hrXbeR/B3feZW6UXnbe0xoqJeYWXZM5MCpqhfZ5DoixthnRun3v1WoAhXoxA
	dvFtxDfZmz5kVsRhcProms8/FS6erzH681Gbtwvrze40O0GEoStin6zMWfl7glG0/RpI+RtVmcW
	02uQ0BbyQF1QMiu9khvs553DcC8NvniLwZ3K6kpIDn/ah4emOGCOPk/t/OTEnux52wY8JG3GVTi
	lgDx7au1o+8C9BvF0hkGZE6/G6GKGWsEOKRhjx2MtdwJHo2PciWU60OLzC9HYcHhzp5M/HrroyK
	xy8WcxgY/00TDJsXPR2VRh38Z5Fgin/H3fcx+ECKhS58n/n9PAZU+35nC25EmD7hD4CskNnnOIk
	0Hio3f/IqtxdG37o5Ii+JDpCKAM649qyFLKM4LP0G2F3Zigo/LGAfKYZUvIzMvluuc6MC0epFDi
	v0KwhwUWANMgw+EfIRHQoHYKW7cRfUfIXFAlvlGw8cBDzjn+ob+spPkUyXvggyeYmPHtKBtQWNC
	UuR1HuoUhz9ynIWneZjloRxmXUUkd1omX9o5VsavR1czS25tvkMWhuTgggVOHU=
X-Received: by 2002:a05:600c:4fc1:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-4a19a9cf1e6mr200322795e9.30.1791982565922;
        Wed, 14 Oct 2026 05:56:05 -0700 (PDT)
Received: from nixos-office (29.pool92-59-2.dynamic.orange.es. [92.59.2.29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de7003982sm8989089f8f.8.2026.10.14.05.56.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 05:56:04 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
From: Julian Braha <julianbraha@gmail.com>
To: maddy@linux.ibm.com
Cc: chleroy@kernel.org,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ritesh.list@gmail.com,
	sshegde@linux.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH v2] powerpc/Kconfig: limit the PPC_85xx DATA_SHIFT range to STRICT_KERNEL_RWX
Date: Wed, 14 Oct 2026 13:55:53 +0100
Message-ID: <20261014125553.2280686-1-julianbraha@gmail.com>
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

This out-of-range default was found by kconfirm, a static analysis tool
for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
Changes since v1:
- add range for STRICT_KERNEL_RWX=n and DEBUG_PAGEALLOC=y

Link to v1:
https://lore.kernel.org/all/20261011113108.539470-1-julianbraha@gmail.com/
---
 arch/powerpc/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index c3b6cd655606..09e6027389b2 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -896,7 +896,8 @@ config DATA_SHIFT
 	default 24 if STRICT_KERNEL_RWX && PPC64
 	range 17 28 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	range 14 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx
-	range 20 24 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_85xx
+	range 20 24 if STRICT_KERNEL_RWX && PPC_85xx
+	range PAGE_SHIFT 24 if !STRICT_KERNEL_RWX && PPC_85xx
 	default 22 if STRICT_KERNEL_RWX && PPC_BOOK3S_32
 	default 18 if (DEBUG_PAGEALLOC || KFENCE) && PPC_BOOK3S_32
 	default 23 if (STRICT_KERNEL_RWX || DEBUG_PAGEALLOC || KFENCE) && PPC_8xx && \
-- 
2.55.0

