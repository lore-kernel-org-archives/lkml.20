Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10646347FCD
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 15:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792164744; cv=none; b=rXMtHBnqSlJynxBDt2RNPw3oRgGkCy1k4Gck+n5gF2fbwpDyShHm6NnmPmO6ZrclsiVeXkBGEmpY6sl2agCvceJMYuHPwK+47crp0eg8z5eDVH/SwhCUJEd1scUoMPL/KJIYZSFObpdCxrJfpjXqoLJUYCmt/TNfSs6TWkos5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792164744; c=relaxed/simple;
	bh=d8CkeO3hvIgsE71lwJ7bjdNUygz+IDV0AYjwlsll958=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IAq+w4B7S85ka49M5lsDpWSiSlvaRMVt+i774B6vGCWO94WIbmyMc4Rm7ArOPv0zRHDqKAV5qqwRpquVyRDur8tg6lXQ9T2nrheMZNQCguQAWQgOkeUONY1CZlFersoRntazreGvEXvSDC0WZd5AEgWIvS5hfZF6M1vqc79jr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CvM5rhfx; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CvM5rhfx"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-16ad92569b5so6460558c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 08:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792164742; x=1792769542; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6cvOCnomAGqeAv8bW88+u46zQxeUU+jn9Oy/sEFFJg=;
        b=CvM5rhfx4U/6PSbxV0jhWZ9HnD3Pc4ftEAglTguC8aJV5Qlkv/fKUouCTaGi5Ht1nI
         o5akVTKil0aIWtGWVCtbxnZBtm6sV5Xz646EuyLchPHg1huECG1snOIt0DTMQ3GDnL1b
         xMJ4pVcDWOoMJFB9QduPWLnlyJDqHXS8eASsWepiweQb4wnXq8CCZbPfaNRC8Lzjxsg0
         9cD/CoHp/I3OH9NsGAojATw6K51bBTndAMuAOYBsoiCZj+MX4Ngwz3aXq8c2amhIk604
         6q2P1Q1DxEuq5hKEnTKBFMUF672gkWfGrme5RdT0rPUEo9wcmzRXhWs9l3WDDVwEaw+f
         86pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792164742; x=1792769542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6cvOCnomAGqeAv8bW88+u46zQxeUU+jn9Oy/sEFFJg=;
        b=srp53YMm91jI9/XzvXCdTZgp+qFxZ8RJi1GBqjU4/zn6BgGhnlUsOOy+xVId691GfG
         QowEauFGDTHWOdVr6WSWVR8PLjVe8JIToVQNTdght92UKPERjN5D+k7hqlSbIATD/dO7
         P/NJlrM0Yxg9vTG05rhRtR/fvAyDUsyErTcmRs516ZAu+l8fWzCAqlA0HD3FRldM0mrH
         hJn2dz2/TXRKu0G0twuj99NpCY8SgKsFSKaqmjot+jWfXqGtSmd9HnbW2xL9hf5sfFgO
         WYxUWJisimvu8geNHDBHMntxvRdM80mhQ7/P/L1XAeeZuJO0wAKcvTv4whCNXz0iv55T
         XHmQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/8FD8yHdLwfxYdwmz9m9J5LLUDEKQAW/1f8JW/2A5BPi0Q9nNCD5al+xbItXg4lOrPeWOKeLleBAvfuA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJgqjycpZYtuyhOv1kZhnkDmi6N10i0NKQqpmM70mr8HpIr7o6t
	eN1hUD/DKsQ5QxoEL0ZklvqXtSja0Z0o1BW92FV8xppHLCAsbyGV+0Hd
X-Gm-Gg: AYBFou3gMNUlfBFnwroZa/6EdfWDv92BIWeMhhklCwyw4l67usx0KqK4hLtN2EEtBvo
	QwsyYp+CO4WaQ3zMhKzmTZ7EcnFTlYNIyTl38Uo5LewxMEqRgAjHKhZdsYT+xM60nEXhBAAQoPU
	volt3/SrgANA6GAB3fyuD3h6elsvdO8IsmBKVaV9a/DRCkyfi2Nr2YDSyRyD7rtj8tkgg0/mYhe
	e092y/psBwpgZUcHypCj5qDKw4QKVVkrYcpoJOrMIc/zEl+SBwSrJCkZYb1FCSMSbp/MHqluoba
	b2ZNLm7G4oASCTCOAe0a3B1aFR0Cu4UVBobdf0PMw6w8Od9n8lixBqxLgYuzGl2qxz0manUA1Zk
	Lq19KswuVbauQhWoMu5JX0MLE3shYQt2z6m4xjMtUZy67wB2yO5gdQ/Njc2GeHecWYhIW6m8RZl
	ZQEPjC1AaRCXuUn+6Mn346Zr4yCHEtbbCNkLchbM/VxC27MhHw2mQQfXStigpeHWU9t9gPCSpYy
	+crJTuojfsIlxk=
X-Received: by 2002:a05:701b:21c8:b0:144:c12d:c6a3 with SMTP id a92af1059eb24-18513f762a3mr275781c88.45.1792164741769;
        Fri, 16 Oct 2026 08:32:21 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm9403719c88.13.2026.10.16.08.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 08:32:20 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask
Date: Fri, 16 Oct 2026 23:32:12 +0800
Message-ID: <20261016153212.2733798-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

__cvdso_clock_gettime_common() and __cvdso_clock_getres_common() turn the
clockid into a bitmask:

	msk = 1U << clock;

The shift count stays in range because vdso_clockid_valid() rejects
anything above CLOCK_AUX_LAST, which is 23.  Nothing records that, so
raising MAX_AUX_CLOCKS past 16 would take CLOCK_AUX_LAST to 32 and make
the shift undefined.

Assert it in vdso_clockid_valid(), which is where the bound comes from
and covers both conversion sites.

8 * sizeof(u32) rather than BITS_PER_TYPE(): the latter lives in
linux/bits.h, which lib/vdso/gettimeofday.c only reaches on
architectures whose asm/vdso/gettimeofday.h happens to pull it in.

MAX_AUX_CLOCKS=16 still builds, 17 trips the assert.

Suggested-by: Thomas Gleixner <tglx@kernel.org>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
Last patch of

  https://lore.kernel.org/all/20261002153104.1347978-1-zhanxusheng@xiaomi.com/
  ("[PATCH v7 0/5] vdso: Keep the CLOCK_AUX base at full precision")

1-3 are in tip/timers/vdso.  Please drop 4/5: it moved BITS_PER_TYPE()
into vdso/bits.h only so this assert could use it.

Changes since v7 5/5: assert on CLOCK_AUX_LAST rather than the clock
parameter, and keep a single assert in vdso_clockid_valid().
 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index c0e81996532dc..6386f664b9a01 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -99,6 +99,12 @@ static __always_inline const struct vdso_time_data *__arch_get_vdso_u_time_data(
 
 static __always_inline bool vdso_clockid_valid(clockid_t clock)
 {
+	/*
+	 * The callers turn an accepted clockid into a bitmask with
+	 * 1U << clock, so the largest one has to fit into that u32.
+	 */
+	BUILD_BUG_ON(CLOCK_AUX_LAST >= 8 * sizeof(u32));
+
 	/* Check for negative values or invalid clocks */
 	return likely((u32) clock <= CLOCK_AUX_LAST);
 }

base-commit: 8d17190fae2caab89cd5df19257ed9dac0739e3b
-- 
2.43.0

