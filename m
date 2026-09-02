Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B8A29B78F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320346; cv=none; b=W9FOJ9ZtGil++JaKKxejlv/5wDWoWufU+gfqSOG7hhn86SOdGubN7znU+b4yQv4BQa+pVv/3nYkcEF2vhhHqyS+wkVxkVmmdIfQMxyuP3ywJtVwXzjv0igHlYgd9UWE5OOBJ4G31QtdaZ54J7VVaSN/mpZGsz/rmmMpFvEqQKu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320346; c=relaxed/simple;
	bh=ymXB/kQ0oxAbSey+LXIW1PCx8yu1EEfH7MZyjtlc8ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IW4tco8eGH5n3e3JTa7h4iH9oGUwwsccU2HqmCnXJsccz446+pOCghXkV2Ot6VduGVyQSKVI/i5KsskgyAda/EqqL28aa6KU1G5WiL27jmw6st1WqK+sbT4M4qUMFHEgprbuttuySPeZ98zsvfzoFhiOQVvlbXiGWm/ZeF9asv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BxaE9lxj; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BxaE9lxj"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d94c868ea5so5498215ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788320345; x=1788925145; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/F8fpEp4iGHT0skiRxv7WJG5rGIQnzqOxwAlDHs2fo=;
        b=BxaE9lxjvUSU/1ZvsSGgwu1Lpb5xoHGZn2p1UzqeTMtUnQb+yJycBNoniGjgkAtRYW
         E0XCdYd+0PtxF8/pI9e/af7+eIhO21GraYDaDM2vAVwCoNHao8xb+yNci7bcq2gupiSc
         YZUCwgGqeT8qQcQprLa8iqQrhTAH+FkuPwESMsFgwsatrGec2Ny5dSw4uvpJNGgHUap3
         SjH7YahJCJUk2wVEtvlH8E9Tg8bm6/e6r/PaDNOxKDlrCYa3/at2WpaXR46ZYkclwpdE
         Xk+62tVnOhFvzu6mfmCPBw2NXlCVs12EYNdN2XW2gDqXk+ZCVz35ccCRGi1jfodUsPyC
         1uvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320345; x=1788925145;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d/F8fpEp4iGHT0skiRxv7WJG5rGIQnzqOxwAlDHs2fo=;
        b=F2fTOIKCDlTB/7CluaqPcvqiRnuieMJ5o5drc61HwzxXWWGds4XQK0P+J57iPkayg2
         QLyEAubfnO/V+MBqc2+ORg/zGoNTMRNsSHEohj39tgazS7pJTsAc8BPeb6QDd4S9t+kR
         825Gq3c0NjFqRf5etz47KVsmszmswpP6YZyoM6FWyjJrHIcxSlEUHkpK9NPawg4AB7+A
         Cf+zJvDuvy0EDpvTheNAHwyFEboBK7R6wCZ0A7wOM7cIuzXoIcya4YkUudhJkKu5qshP
         TTEcmIy4Ggm+5FaFfXBJIhoHGpzdb5DaDDASyDdsm32ja0D8cEbNjxT5OcDDr0Ya6FgX
         2Dyw==
X-Forwarded-Encrypted: i=1; AHgh+RqN+IZlqD8y3ws2/Cb87UoxDLsFZ4xZLSKH119v/hrbwD7FNM6xYasxhQtH1TqFk1foMlylnewSjq06sso=@vger.kernel.org
X-Gm-Message-State: AFuF++nqbLgwfy+7kwsVOOJf4gU25zk6ytM5DSHY2rSSeQuqOG2cHshG
	as4JshtcD5aMs6aXXHlQIbtoNwGa7LUf+e0gkYQjDvHwp4pVlrD7s+OF
X-Gm-Gg: AYBFou32kskTKIoquE8aa1gC/HcGdqBatVebqJOvMFlef0hyiEGxi0X5bOsPoWzouBO
	sFPIEcfTOpL2hFyzJql3IiKSNK85HREtIuw7/bmGAYY7ZsbOmzOrFN8awdLt4q1YXV9Xxjpeibx
	aR2vKFOn+umsbMo2gLDApA77bGG4aik747t9SxpsxidQLAhbva8h7JCUGVS+lvOJh432fK4Y/Qs
	TcUCQl+Jk8fs+ClYpE7xY8KwKANGb9a0uQGk1v0VEgJTrg3OXbSb7gDQLPVGV6AAKH90kgb2a8B
	hzySblAHlwV2+8aWG4Xcbu0fJKhs5my03Uz+JJ5X7sDdOLZqvsEVF8E6SBN/ymXLL1DqdD9ksDK
	wYr2rdaPvC//onLjWLToQZw4ymGVKMf5Hj21yiFQPKwARs2ckVEL+EYN3BDbh3fvKg0YcLyEqQH
	QppRkJj/NHx4gBEpNQ+QL7OXKxhhmzIE98LtzhCMk0YgqM5Qs2Qe1dZPugGVD8ScVRlXLU8uu/
X-Received: by 2002:a17:903:380d:b0:2d9:51bd:534f with SMTP id d9443c01a7336-2daec6fe7c7mr29796515ad.10.1788320344611;
        Tue, 01 Sep 2026 20:39:04 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd386eefsm5715715ad.28.2026.09.01.20.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:39:04 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: thomas.weissschuh@linutronix.de
Cc: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	zhanxusheng@xiaomi.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/4] vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
Date: Wed,  2 Sep 2026 11:37:58 +0800
Message-ID: <20260902033801.2912699-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
References: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The loop subtracts because the quotient is tiny at every caller, and the
asm() keeps the compiler from turning it into a division instead.  It
offers a memory alternative for the value:

	asm("" : "+rm"(dividend));

clang takes that alternative and spills the value inside the loop, on
64-bit as well as 32-bit.  OPTIMIZER_HIDE_VAR() is the register-only form
of the same barrier and is what the rest of the kernel uses for this.

The helper sits on the clock_gettime() path through vdso_set_timespec(),
so this is measurable: x86 vDSO built with clang 18 loses 64 bytes of
vdso64 text and 112 bytes of vdso32.  gcc 13 emits the same code either
way.  Neither compiler turns the loop into a division with the new form,
checked at both widths.

Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/math64.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212f8b28..83ebac2e5c1b 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -8,9 +8,11 @@ __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
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

