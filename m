Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C62235677D
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789526012; cv=none; b=WzvOf7y+VPVJqL6JrDkRNvoptZvgJQzRO0+ijx5Oq7mEIv+4cvwHVG8Sy2VCpyIKlbFg5Ieah/1+eRDZQ5D+YRNTb49oyN2XfV0RHRqNe3GL35dmVx1Rxu4GRQV0/bjkfVLAYByBgbnRXH9YTwOk6NzBHvoq7RxptdG2OKOro3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789526012; c=relaxed/simple;
	bh=aKuxJWlKl+EhB5MpSS714HjjKEL4RuX7c5AfRZCYPnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tEbUYEgXllGEsahGEdWem5YZA6/8oOT3n7Hqq+sXeFNPxts/xYM0GyN18FKDHeicBs2XrT2G1IjlF8YTzXiKzFcEIm1yqNGfWwtm1rUf7/M9xIjpFuGunykqzqgBKP6KJREtTqdqLhgGc8UBLrKUCxwILeJ6Q7rBknp0BjQYE/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWYCnC6r; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWYCnC6r"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-86212a185dcso408509b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 19:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789526004; x=1790130804; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2pl4XdnoNke2GAPJ4SfLM15DICEb57hSAl0sGeGEkfs=;
        b=IWYCnC6rsze8RKj+n+weYU6RuYTlBaYnt33cuwm+YUVQJG9Moofbl90+n96iYI2KHv
         /UCleOUUyThEQq6BSIvgMgYJqitteEBcdVWKgthf+MEkxhAAT/xBAmRUwHKSIufl2PTm
         1+DrfzFUNCpJw060rUd+wcD2LYWdf2O+2shyZV/sFE3cfdRpxTKJmVClOfnCwXjNkq8y
         jRexlp0YChoKeUz3FY6ux7KIfmbJQ3nryKbRXTb9guvFCMuQ3upLz4SSiTLsGDOuHp1i
         aRQ+BuvzsiW4NorZB5eTjrKaZnodG9EuIq49SqhlIojqd43oSJCS4ytZRNNSTrPXr05q
         DZqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789526004; x=1790130804;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pl4XdnoNke2GAPJ4SfLM15DICEb57hSAl0sGeGEkfs=;
        b=LE8tCs+q45MR0wgLN3SkoBqYShCKQocWGSsoiVTlPtufZFnxFoGvaWFr+nSJjSn35k
         cAH7QWQAscfLqw6Sx3fETH2c1lv8RifU8Ply95qDuUSVZlzajJSq6SNaIRdq+p3uT9uc
         EJeCpkdqRFCmI2QTLgR+xQDTY03/yaCfoelXFv43kFZNg5HAWtFhq5oA/EV7l+6SfljM
         YNqqk41TW0oEiH1ekN1rdCkUGqY+/bWBJ+IZUBcS0VXcjMxparpFqo8iCsH13vMTv/ee
         VW5FILx1PdiEMHe9v+sWAKRoKCJnv56eDLTgB2aAUuBFz+5NCOdpGNlTgn0JezpAEoh5
         9Pag==
X-Forwarded-Encrypted: i=1; AKwUvBwD+nhTz/XnuoD8wqk/qABgLbe6tcsehEwHbnZ1CejigFlx3oAaaiZm6N6JeDPDPsuPUNbE38yc/NVlNTE=@vger.kernel.org
X-Gm-Message-State: AFuF++liivNyrm9Diz2cydcb2BEOjw+/BSFhklZU/w4NyYF4JiG758gd
	TSo2KjLXwSrzyQgkR+FlyVQ5owi+3N8Cjp/+BAa9DjEyaf/9U8XQyZoX
X-Gm-Gg: AYBFou36+x2zI7zMae6fORc3vY0wbJxaMSv6o/niZCB7ayxIQ1Ayl2NNXVhZJSigK0m
	XoPCNc6JcnDfprCQUmMAD+lDJT7/A/T16izJ6MDoL2IFtuOtOseQnVdPb4O4dyuuOOx5+2m0Jrt
	061daA8i46x83QjrR7uxepeWr6+FD6Wp1pIyNOviTK+3Vu8wNnO9wkS24pMhgWUUbGJJTfuhD7Y
	XogYJguPdxRLhdt+QBs/SHGYkj6NW+MM4JF+m9wwxFR0TOkBjyQy8qLabZqaGXy1ina2aagQYer
	ePMeaB5IKZaxH5Lvd5txu1xNlB89G+1nujzrshqJESWXexobQ8tedAm+CvKY8fXCH0VxhRKvNET
	tS+hNO4JDvYrMVgwMXNawvl1ua85upHQOZVr3oaJS7lIn8n/+8btB4c/FGAgHEALGrocOS3JgSn
	ngNB6Kn+Jg+9V5FUT1rAI10swDzmuIzETuN4GRRrE9vk0V2mgDGJ6oBIc409DELaSWc3IOZ6PHn
	KHTaQMUYxQW
X-Received: by 2002:a05:6a00:4613:b0:85f:3d78:79cc with SMTP id d2e1a72fcca58-8723b87e98fmr1325730b3a.9.1789526004220;
        Tue, 15 Sep 2026 19:33:24 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8720123e374sm381370b3a.24.2026.09.15.19.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 19:33:23 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	thomas.weissschuh@linutronix.de
Cc: luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v5 4/4] vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask
Date: Wed, 16 Sep 2026 10:32:52 +0800
Message-ID: <20260916023252.418473-5-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
References: <20260916023252.418473-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

__cvdso_clock_gettime_common() and __cvdso_clock_getres_common() convert
the clockid into a bitmask and match it against VDSO_HRES, VDSO_COARSE,
VDSO_RAW and VDSO_AUX:

	msk = 1U << clock;

vdso_clockid_valid() rejects anything above CLOCK_AUX_LAST beforehand,
and CLOCK_AUX_LAST is 23, so the shift count is in range.  Nothing
records that dependency though.  Raising MAX_AUX_CLOCKS beyond 16 moves
CLOCK_AUX_LAST to 32 and makes the shift undefined.

Add a BUILD_BUG_ON() at both conversion sites.  The condition is on a
function parameter rather than a constant, so it relies on the compiler
deriving the range from the vdso_clockid_valid() bail-out above it.  gcc
13 and clang 18 both do: the x86 vdso64 and vdso32 builds stay clean, and
raising MAX_AUX_CLOCKS to 17 trips the assert.

Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index f7a591aba59f..ef4dcc614489 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -285,6 +285,7 @@ __cvdso_clock_gettime_common(const struct vdso_time_data *vd, clockid_t clock,
 	 * Convert the clockid to a bitmask and use it to check which
 	 * clocks are handled in the VDSO directly.
 	 */
+	BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
 	msk = 1U << clock;
 	if (likely(msk & VDSO_HRES))
 		vc = &vc[CS_HRES_COARSE];
@@ -438,6 +439,7 @@ bool __cvdso_clock_getres_common(const struct vdso_time_data *vd, clockid_t cloc
 	 * Convert the clockid to a bitmask and use it to check which
 	 * clocks are handled in the VDSO directly.
 	 */
+	BUILD_BUG_ON(clock >= BITS_PER_TYPE(msk));
 	msk = 1U << clock;
 	if (msk & (VDSO_HRES | VDSO_RAW)) {
 		/*
-- 
2.43.0

