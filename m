Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 158104E3EF9
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186680; cv=none; b=Bo/A2GO+R9bGGOaNCK0wk/Cb9qLMAOcfvaaFaSiGlTV1bmzv7J+yP9/nL0/SRUqDIkQCTjdTXsbejW8rUZkC1iC490nBZ9cQIit/scZr/+GbOzBiQihIa6ukmIzMxQLL+Mm6BLxY14zuuOQAGciOataOlnFunyZG51xz/obnqFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186680; c=relaxed/simple;
	bh=aLoolg9BImnEQ49TD09/HL3uCXIv/k8JpAFXk4tdccU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=baT4DzshfoNrapEbkxa1PWiVCX6bQ2XSh9lknZuAEXiHxXTASLDO/WS1b6B7wU7VnMKqF8JR3ok1VMThPfVnNc0QaWxBNdtkctNERF/uhd81NPv/9DcE3pLotvsGM5+xHwsEbxNRPJ0IPYOcvStpO/u5LwDXybKUMpOwRnwWjQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oPbeSrNK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oPbeSrNK"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-852c481415fso4345867b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186678; x=1788791478; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tKzMSSG4dm+SqnSwk6c//CITfTw3SfOuV9ad48Ml/m0=;
        b=oPbeSrNKZLAcWfcMjX0P1Ltavs1/qDniSE8hDDoxs5EjkDti7Lyl4NR1q6xbMtot4L
         9E0+DKTceargfIKdRzdDoryR4PPe/5XFVsvU4jdcDPC6DMR8h0boCiLcpWtMVrkCTZQg
         wsOkmSwZDW3xkYph9HYrEFmvMnmCduBfahr7Q0pgdkxjgs01HJbvxn5ZFIRrQB5MnYOi
         Bup7TzOyviZ0cstnmP2cEghnn9iEizsr+ktyIlYcQk4Vv5/a3JQRqdVhcwxO8Uq8hTvy
         6WGlHuEX5jyHwMsQjmy6X/qBdOXkNa8wJfNRM22+SeWnYu938sefbUgwtP+9sIq2CDbN
         vy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186678; x=1788791478;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKzMSSG4dm+SqnSwk6c//CITfTw3SfOuV9ad48Ml/m0=;
        b=fiyNlr8nIrdaHFy17BXRhcIbpAU1gF+dWVb12RlZpEEt6T+dXxn/6jiBrPL1hot4Xt
         SR9ZuDVH8l4qHsb1Sf2ERimfS9Og20g3nYQWBBAGVPJEVHruoa3AWPYpZE80siC3kLz7
         3VvwyCcDLome4i4X3OXdS38Nz95+QF34QUXUaDa6hJruWrUCaqDOwQWSDaGWUvZyiG9D
         Ld9SxoABTkKRPiYyP0uTwM7FqlXAtwrssjhgbxrZUlO07K+WTp1qpuEK5+ZLzqHUYgD3
         0v68eLt3zGYZlE3I8uzCoKJWNQ0bmC9LFwtKmoE4NUYwJtVRLdOdUEMf22CRK5BBagYc
         GIRg==
X-Forwarded-Encrypted: i=1; AHgh+RoEoXTpGVbqAOJpN+YmOrG5Hw8tSQ6ESZuD5G9+GwsMV4amb8djbdnAFECBPvqi/EyRyyLCqZ04SkluevE=@vger.kernel.org
X-Gm-Message-State: AFuF++n75ckkcBoCKwY07T/0bq5k89K2/9PdO7zECFH2zedf8ru6dy5h
	JRB8RVFLaxfQtmm+BsltqfFAGRKaCw5pikuh3m0j1nK6uK4J+uphPUx1TemNxQ==
X-Gm-Gg: AR+sD11ijrx59352Y7R9sDlOZLFmTK+nof8nZw1Mxaoyt68Da0xCD7At6ZE5qbNK81k
	GlI/jJImEvHiTEeTRoi2WG0zgnO/TbK8CejqYsQJ4zM9QKvEiFE2TQRay6+W/1LnYbQyTJhJZGa
	Cd+a5fEflyYnLf+wIgxGnuSWzg3VYVV+w8yeERX7sIsvVh2SIJ0zfvTwzG0MwruUk7bah4eiLdq
	bWz0INhS6tI5SYzdqcMIPyyFnXjk/6ECw/w9C6FPpsKRbu8Li2hOhQFIHC7mrmzVjRlSppS4u1A
	7HyxWRKRRslxwqHjEmXHpGrnozYdmrYIRHqoomCNCRierXDEu1+RHyzv4A3IzKD4op+TjI2sgRk
	aDDrbPg+Kn848H0x4YN8aHGIPuBNX/3mBtQfEJKmC0V5mESF0ZSD1pHhajRNkk7a3nFkAmctjGF
	yR0fCN4CzJOmUkiqkLDylliyPLLmChPEsAmVoKwWyA1v9K9I7q80GpozP5YaN98La5J2OwBbLH+
	zD5IUvK9rXc
X-Received: by 2002:a05:6a20:43a2:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d265a3d2a2mr38918395637.1.1788186678297;
        Mon, 31 Aug 2026 07:31:18 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm4248961a12.10.2026.08.31.07.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:31:17 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v2 3/3] vdso/gettimeofday: Assert that the clock id fits the dispatch mask
Date: Mon, 31 Aug 2026 22:30:59 +0800
Message-ID: <20260831143059.1592875-4-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143059.1592875-1-zhanxusheng@xiaomi.com>
References: <20260831143059.1592875-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The clock id dispatch turns the id into a bit in a u32:

  if (!vdso_clockid_valid(clock))
      return false;
  msk = 1U << clock;

vdso_clockid_valid() admits everything up to CLOCK_AUX_LAST, which is 23,
so the shift is in range.  Nothing states the dependency though, and
raising MAX_AUX_CLOCKS past 16 would take CLOCK_AUX_LAST to 32 or beyond
and make the shift undefined.

Assert it at both dispatch sites.  The condition is on a parameter rather
than a constant, so it relies on the compiler deriving the range from the
vdso_clockid_valid() bail-out above it.  gcc 13 and clang 18 both do: x86
vdso64 and vdso32 build clean, and raising MAX_AUX_CLOCKS to 17 fails the
assert as intended.

Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
No change since v1.

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

