Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFB94F85C4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783118; cv=none; b=qV36OsuP3S6jpNjvgdqj8k80PbJIGr4Hti9TQOYFR2PqR5yluvNBrfnNqPnDxQa62c0vGPRtR+0ErTlZGlsJRpFYsVOJA73a2HwKa1eLeiA1ydCwBkbutTllSAgsQ4WDywtl36Xmu6CpsVt4CWY4j2hbkOxL2PYblRm7/ufMYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783118; c=relaxed/simple;
	bh=GQbBa6CHnNfUb9DKjXxRdQQLXR1WhYhhE4Qswr/Ui+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYZmz9DMga303CKsqgRJMACQfi9PayjrsNARDUs0pv0m1uh9aE9NLG7P0RXEMJxn4zSlGeZHAv1Vlxo+LkwFpXGM/xY+3Y+lQbgqGpnnToXgfbSfQ3gFGFWSk5yq1uqa+CIdo+mari7+djgTPmF9WvYHQQfVdwe8pXEZzWNEORM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TInWQOW3; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TInWQOW3"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd88a115ebso31889885ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783112; x=1791387912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xza0m8WSgHtBFmr77jh/0SIGm5QzN/lBTrXqXqcFKCY=;
        b=TInWQOW340tjoAfvDpb2RENBKCSN5ANEPO3ZiCoshMDs2b9lZhvSVAf7ILj04jTtZk
         kUlwL5aCDLO3BU4/OehOB7hpI1At4n/enM+Q5PsRulYRhNJo8Ex39JNrE+nL8yemVf6u
         rRfZiuzreit9+JJFsAI8y23mFjGUrxRVXKNvicuTZSeSpPeZC+m49XwwadoRsu2Rdskm
         1GQAtKd67eD06h0gTPALZ7aAfWCNf8KNeZHnbKgREricE3RnAo1ZP2c9yt4iO2aeYM5A
         FAeuQwDcY9lWHdJHjjq2IttUKYfY4DVqaTvvc/ziYxBu1q0SD1xdVyX8gXVqcmWNftbB
         bN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783112; x=1791387912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xza0m8WSgHtBFmr77jh/0SIGm5QzN/lBTrXqXqcFKCY=;
        b=1xj2yFMz9As/yvEsHKQLJKF9oxj8No9ArEJQyD3jcomKzaE7ErzTmNauXuvKXQQ52K
         46aWpyURoniWeTTJbl1SVY6/pTkdJCMhDj/fROVlpIPcoi8EYM3RUOFRK/30whq0YdF6
         wjmxL11FtXgpvK9B2Z0QxKxhYkvht6HlqI+/6HcAS+AliMudq+2J1iJXkrJ/Vg5fbbw7
         8s4vsXwnlspSr4evT8PDINveWgVsL3Gc3crFEnQPxOCmsawdtlZLX2A16di6oDpBJW38
         fq1jWw+tq7eCMXlDOGqjx0Lk8KTNW3RqxMzdAwDxUFh2HAlDGUS9s46II6B64Vi7Ktc9
         vCuA==
X-Forwarded-Encrypted: i=1; AKwUvBxnxReFjQBCsJfqETh3H4kC8fElsg09OwQM8dfHTjrV1m6+lS6kYrr1xHWsMiVZuv5cW4miIqDc20oeM78=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5dBUPhSQRYQLyus9Xt3+mIto08fnwrB173R60dUeGhn18bw2H
	uJRKIxECK0JV5ZdQG/P2Ih7Ydd6HxWLv2fWCbHPQPns1kSz3vS12oP3U
X-Gm-Gg: AYBFou3AD32J+wawdGL52vgp64fC71AiYg7k/FX1yMkIlSkpit/k74TGlnihqspQZ5h
	W+XCeb51XeZcFaldlvX42Ds6GJTzBANlOjtEX8l2693JcVc7VwWlKJEVL7SbLrcJzZFhkRERyXe
	CdKspZbEMfXI4aDSdS0mCwt0dBBXj0MLnUWf19qaNNuiQYZZa1+o0f04NqbvSQcSegCW++LfpV2
	CeiDExGu2aQ5U25EIgd3s8bobrMml5YMi6MF53fkgJEvbzSC+jWaIsqD58lnhSnzW+XOo7Ayjdt
	wMKDHeYVitvHN2GFZ2rEnTnQ/lxv/W138AAWFj8WUIi5SF13SCYtbqcYkfqoUXFNcFHAXWkhJEU
	oYvVFNHxqoOy031NpXJO88sY6us/RE2BtcXcuyw3FYDoaTQzol2v7vXqO+ZKJ7p6jnMiUdVLhO9
	fZ16JKr/65l7l63ZYG0PDDZvhuDgBUq+P69Sl/Kn0/E77qdNm1/hKh1fnDvfWPb4HVmYNGqU5Mx
	zrY9D5Yhgk=
X-Received: by 2002:a17:902:d489:b0:2e2:c2a6:48bf with SMTP id d9443c01a7336-2e2e4b33993mr14155535ad.26.1790783111898;
        Wed, 30 Sep 2026 08:45:11 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d178sm10313265ad.1.2026.09.30.08.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:45:11 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v6 1/5] vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
Date: Wed, 30 Sep 2026 23:44:56 +0800
Message-ID: <20260930154500.722828-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
References: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__iter_div_u64_rem() divides by repeated subtraction, because its callers
only ever produce a small quotient.  A barrier inside the subtraction loop
keeps the compiler from replacing the loop with a division:

	asm("" : "+rm"(dividend));

The "rm" constraint permits a memory operand.  clang picks it and spills
the dividend inside the loop, at 32-bit and 64-bit alike.  The helper sits
on the clock_gettime() fast path through vdso_set_timespec(), so the spill
is not free: with clang 18 the x86 vDSO is 64 bytes larger in vdso64 text
and 112 bytes larger in vdso32 text than with a register-only barrier.

Use OPTIMIZER_HIDE_VAR(), which is the register-only form of the same
barrier and the form the rest of the kernel uses.  gcc 13 generates
identical code either way, and neither compiler turns the loop into a
division at either width.

Put the function signature on one line while touching it, and reformat the
comment, which described the asm() that is now gone.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/math64.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212f8b28..c628d6cf447c 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -2,15 +2,16 @@
 #ifndef __VDSO_MATH64_H
 #define __VDSO_MATH64_H
 
-static __always_inline u32
-__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
+static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 {
 	u32 ret = 0;
 
 	while (dividend >= divisor) {
-		/* The following asm() prevents the compiler from
-		   optimising this loop into a modulo operation.  */
-		asm("" : "+rm"(dividend));
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		OPTIMIZER_HIDE_VAR(dividend);
 
 		dividend -= divisor;
 		ret++;
-- 
2.43.0

