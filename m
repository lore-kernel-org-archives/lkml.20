Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677484;
	b=XQabV578ww1C8krY/ZxeZyFT2+15IcBn5bPXDB9USlCD7BOk7gvL50YKn1SzYFiQwr4E
	 UHKZXMkQf6NWDN2fJf7S8n2EIxUa+SK/84E4pBeKCE8VlUuuJXUXAnK+iLo7TNNp25dM/
	 yS5too35ls1bnzRRe3Pkfgt8Iy7yKp6Pz2n/CWJ/HudNs2wQOar20YtlfZ+EA+hCte7Zg
	 7aZQl6KK2EJAMeW39UDABUg5/U+ofi66kH7QZHRPTaJaOINyxMN+Si6hVTPaH/T8RZZZq
	 Ij48xjX2Vho3F4tkR/lAXznYMas45ykETrpfm5bkZiusrP9/JMFJFyN5sgtnxdvWsIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677484;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=cwXUAlnMiWoj8Tn0IFms+4D0McJmmdnmp8B0HBIb8HM=;
	b=uJRfwKgMyO8wIYn7njXbCVqwvK9ONGa0lvoUlRDZ9y0sS7BKD13oi+3jL6j7kyyX9Xg1
	 fUXEEIcNrvm0zTEPMn0b+wJbS4/tJ2/wj3hW6/I6pjXQBLij5dPUmGMMaqL2WlAezZOfX
	 HDmJnfuJbGaE7cL2ZUoH51w2PG/Ru901AUO9wTsM+8HqDwKA8Y4g5lGwGS3XRplzHd1Wy
	 6mrMjZ5iDXGcv/sNKIRm2Nvj92fSnsWGgdPAZJYoUGlyFPiHxUUYB59rCtiJLEu5AqYn6
	 dieysReLftaY5WJ5KTON38cAwdyp1nK0sa+pADBEd7w2wVVjWhr+sMH2h5Obevl7pFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="EjnN/his";
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FAB606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FAB606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EjnN/his
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae702d28c4so1668696a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 19:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793677483; x=1794282283; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwXUAlnMiWoj8Tn0IFms+4D0McJmmdnmp8B0HBIb8HM=;
        b=EjnN/hisQ+R5boKo3Tq6RDXFLaht5Oiw17XDwif9DQSVTapkxsAWdwkBMk213YYM53
         MOGHjjATiY7Znla6eOPqUASAbdAs/3s/K66nL5XXyhMWXzv4Myjt/98JcykkCZGvVpWq
         1Lyu2ns0p2i+P8wnVmUqL+mbn9cytldL3AgYBZp33Qx3g3twEehDQ0O1TdSdXcUIDuyC
         Y3Wr7hoc00fcmiDtEAvf/nLJusykfFJyRBURPkOtUZXXk3VfKGFrYLtUHTagzRyXhxHe
         WdrzNr7M7/dEMQyMwOvBSV/AWJBrsC5IV+2MZrvxFZhzI0NN43dCCa3eKlN5o66W/MKo
         AouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793677483; x=1794282283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwXUAlnMiWoj8Tn0IFms+4D0McJmmdnmp8B0HBIb8HM=;
        b=y2cuNG6lU6QckE+J+b2KUjgwaIdLm5jOsTNGdKWtMuK9DwtgGirNRBFmG+HZ+8aayN
         XTmydoovHrFeT4yrCQbr/v3Ol2KYBrzxLWTUthuOHqhvsHK6V0QfRFvOYC09jpcz3jRi
         9aXkvYr5hOcWAL6hpfzraFDn0IucRJ1tfbygxHcZgh/m919LEHWy7c+iKQgKFcC7zeuT
         VhMhLstA1OlcZAHwu48sU2sMSOMqLfRqvtnV9xv+N9HQdv+5jS5QHxVQ9OBVXnNSzG3+
         pDcVaPzKy5XjWt3z04d2ueb37JLa3DrP0QeDryOzKkW6/AFIRbqhnjTR8WsKOFJ+f34+
         E9EQ==
X-Forwarded-Encrypted: i=1; AKwUvBxoBrpNYLZpxUmiKO5Y7hmWQnxdkeSZ7iH1sZ1tl8Pyd8jd6xN55EKRQfaHkBP+NsBV343l9IJZLLbWz7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Bs/LsHTiTrHZNXcZ6lWTVJ3HVNiFKt1aQcCPu1vJOKf+FrQGd
	w4aKKIHprzwKft/iLl1m34iPHVcKJ7yMP6BQRRMNMEM4b/0A/YV49ZJ1
X-Gm-Gg: AYBFou1fRqu9z8ml4AS+Q4kEsgR/4FwV3ncl6xZ4BFrgQotVqMa4ZvyA5jnK8rBsEtt
	TBcULj2nl1HSv8RxsnHTGDRcCfjZLoolupX6ut8EC7lsyk9bImuxsVx+6kTR2W9h/3k0Ehbktbg
	CTIvQ/A9s8SpAxkjmH8Myst6223NjTjo5vNcKMHYE5h38g73i16i10spM703Lt2PoW0dIR1WYBK
	U0NVrCS/2jBILFKok4Z7yIglynXlSegEbhcCRcdWqDtmKK0U4zyoEq80PyBMBGKQ7BgKKJpVERo
	ZwuT74aG7eD7mSc70DCUfCLUYrGFjTQS0pNDB6UUoGDi9Wv0B6dPr545/9ePKDh0D9eYrQrzUOt
	RgKBlHQtzZZyFyHyJqXCD+eq/Iq57owfDZjHPKQc4O05yl6PlxQMCTmCRcjfHfh6WCLdN5c9BhS
	n6HfHoZGAGPqntKeUZc0lzUpDSoB3OEiTvGmIexOgouKn2N28HyyGp4f2viCW/Pq63IFO00GDMW
	u5PvKAXh8WtTQiZW0OPaN/wk6ofj4hmP6AWGSWp+XtT1oUVmV/19xhIYJpun+adSUt/w8fxh0W+
	6xkdh5abgOfIHxNnDl8gB2/LUnP0SyhDYcMTuNrrYHeCTVcLPVgIak1moYiYXRG5uSg=
X-Received: by 2002:a17:90a:ec90:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3ae898311d9mr9269860a91.48.1793677482493;
        Mon, 02 Nov 2026 19:44:42 -0800 (PST)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7dea24sm1820235a91.5.2026.11.02.19.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 19:44:42 -0800 (PST)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
To: tglx@kernel.org
Cc: thomas.weissschuh@linutronix.de,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH RESEND] vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask
Date: Tue,  3 Nov 2026 11:44:36 +0800
Message-ID: <20261103034436.1521751-1-zhanxusheng1024@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Resending since 7.4-rc1 is out. This replaces v7 5/5 of

  https://lore.kernel.org/all/20261002153104.1347978-1-zhanxusheng@xiaomi.com/

1-3 of that series are in 7.4-rc1; 4/5 is no longer needed. It now
asserts on CLOCK_AUX_LAST in vdso_clockid_valid(), as suggested.

 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index a324b2f2ec6c..67c9bcdd9aeb 100644
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
-- 
2.43.0

