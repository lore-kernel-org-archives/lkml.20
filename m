Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6026947A88D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520972; cv=none; b=JzQY8zRs7ZEA2elU7GtLL6Ils9h6e/FJ3Lv234fGgQWVEkFmdXcT3jjn+54SCeH0vezpO6sJMFZuYUhj+y3kDNaDZ8cw0nBPgI79We3WsTBAIcsTz/8MP7zVaH4Ocdkon3yasXB0q7tw348up1tavbHs5GB4N+4IVtb9Zn1NLKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520972; c=relaxed/simple;
	bh=wz6YM46xHkXs4il6af+Vt1ZkBsZHlLckbjXtp0VAzrc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A/uAzMKGqXqarxV4M4BxVaq/7ezmS2HRpDr0SHlNFrecBS6RqMv4PGWsGPeBvzrE7ZRIVtrRmFymDmimd5Ft8klJdQC6kW4TCGUAWuk3DzSL2igN2LPrjfQRBAV0hJpVp1iwe0ekjwwbsQm1sAhj70mvP8o0JOUun4HQ7P7ie74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUAgM0Wg; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUAgM0Wg"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f4f53975e6so803043a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788520970; x=1789125770; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZZs6p2NyvyQpcXi5jWHBOyk2COwmthPP9SgDVrLOsXY=;
        b=HUAgM0WgfsOuxV9rHMP3pw9T2kHsyonMzQFrxs0IwU6tKiYQTV8VWvrgzZYsow7DQ8
         APl4BbxeNLYsX9KLphkril2UC0FH/oAeGD3adykFAw2iJbnVwdfqIWTDTZtIdsAjeYiN
         Mrca7YPXpGlKl4cWdVtTry+i5PnlraXwYAJlPpNpXW4P9kiwWERx2GKkdM2lEoN99SvY
         3cGmPnWqKQVuzuwb7V2foE+Lm5kzH2S9htQM8PXgQGEd+DrPB5n1L5E/tjnqLea2B5Qg
         UAVxjaD2BfzMsy5PDd9b80auErPVcvgqQOIpXvlyDUZnUZO7shvX2DY6610h5MIGylZk
         gR/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788520970; x=1789125770;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZZs6p2NyvyQpcXi5jWHBOyk2COwmthPP9SgDVrLOsXY=;
        b=KxjoMwzhmv8TltKq+Hfzmw93PujmBRDqCvFvyNV1Vdn+CDGsoM5geZGmnWL2iQJFp/
         nW5E9Cam1sz9qCrqDb14XVFghA5R0uatWdPG3uU/FGXq2QdgGGUr+ZjGcxsZN4Z7kCuE
         P3h6rTGA+AqXklWOZoLhvtN3dnRmu8q1lZuFabhr8QcGxlDx8i9dPEPQPdKYgtwcqpM5
         /XgbWYoGOhINkTG+d+I8Nt9YwLE7Nb2Mv01rObmcILStOjuSV8s6AhHCWywcGuv5PX6k
         lzNQI/dTtN53fx+gpOyooaSyJXMEe4HxNyIQt7hMKs8QepBnkdqhyS8bC6HuwIdWF4JK
         FE1Q==
X-Gm-Message-State: AFuF++liq1OLKUL7SnJJBMotsRcuV5c3kNAt5VMfwYLDReW5Wn1jFZS0
	4mz6GVyWsm/eBDO8LwL+mI2k0Jj/pHt15o1Z8t23D75i/dgNTtBZj6j1LmpxOJOARjE=
X-Gm-Gg: AYBFou3Uiffm/hvQidLiyPiGU34Gwmw6cQ6ecgLUPqkYyYew44FFqMNWiTB/eAW0KH/
	g5s8tMzJ087g1DhhKiD1qTUtEd0LOdsSonQZ5NOBD12IxSbDVxoc60W6kl29F9LAPn0yibGfsoF
	Ov5bkQAHLcBYCz+9DT7SgEyjwctBE7opmmbuDPt0wLG/dLfvyOsTIteIgLRFhQ5P5/00/poq8Mm
	33xZrko9+GWQlnCuGIkABCGyCJsDuwLbE9khBYgfj7bXDuDWFTuD1QBAf0QwRhFkO6D3AM962zS
	vAMpRmCa9qG+xoyQt9bpnHvGbpZYkkkE0tbgwxNUulepIpyPfV/B+MScHTZ3TvFJ/vb6496XO7f
	GaU3tzdGMHcZ0EfXviDBaecUK8lzFs2YUyUr1YoOA+UBQcjCg55M17nZ8qR2N0YrCvioBhLk++u
	xWsyV0GK2gBu+YWxdQ+IKcbDlHJTFK1C0YplqMOpzXumCat1Uutgqia6JN3ZEiLdmEvtVG0RIAc
	ITur03989BaBE8=
X-Received: by 2002:a05:6820:8108:b0:6b1:b771:bc43 with SMTP id 006d021491bc7-6b6fc5ce9b6mr3961712eaf.23.1788520970208;
        Fri, 04 Sep 2026 04:22:50 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339a534d0asm6398612eec.8.2026.09.04.04.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:22:49 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org
Subject: [PATCH] m68k: fix typo "eanble" in comment
Date: Fri,  4 Sep 2026 16:52:44 +0530
Message-ID: <20260904112245.37109-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "eanble" to "Enable", reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/m68k/include/asm/m53xxacr.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/include/asm/m53xxacr.h b/arch/m68k/include/asm/m53xxacr.h
index 692f90e7fecc..a29ad33aaf05 100644
--- a/arch/m68k/include/asm/m53xxacr.h
+++ b/arch/m68k/include/asm/m53xxacr.h
@@ -32,7 +32,7 @@
 #define CACR_DCM_PRE	0x00000200	/* Cache inhibited, precise */
 #define CACR_DCM_IMPRE	0x00000300	/* Cache inhibited, imprecise */
 #define CACR_WPROTECT	0x00000020	/* Write protect*/
-#define CACR_EUSP	0x00000010	/* Eanble separate user a7 */
+#define CACR_EUSP	0x00000010	/* Enable separate user a7 */
 
 /*
  * Define the Access Control register flags.
-- 
2.48.1

