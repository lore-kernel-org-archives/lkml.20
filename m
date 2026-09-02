Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADD82DC792
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 03:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788320380; cv=none; b=FEAzCd1sHudBnXUssGrlmsNNNKEZPSzgI2k/taD6eUSjoqREgUt5MhnEEF8A/HT2t4cqTjt+0R6s69yhYyCCcM+MQBKzGtEoLyEO30Rs3lfD1dYNjDKc+XDzAyPWqsQX5mq4kA6ycdukTILKTQpkXX4DRmd18JR8ya7vhhFxjyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788320380; c=relaxed/simple;
	bh=bHwVtyoXVu2TVi4pOCw17jGirueig4po4LiRmrpAKas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QmigFvHLCt2GU+VI12AKDosmmsjNTTHj0CQidFlbERnSiJaRwGO/lx0v/345wIjPx8GRfJGMzwVIg5U/c2TPwLjbDh29F4+h+AlGDiaf+8zI3fTPiTlIfE1K0FzhTiBZ55E8eRr+9L2E4P1+1PuBVb6bl355B0wuyRm4HJKlKZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=obbS/Zcu; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="obbS/Zcu"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d91518a63fso4696815ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 20:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788320378; x=1788925178; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fqWDWsxv8wlgt756/7Sn//VhWsyTD+w5jVSYYxwonOo=;
        b=obbS/ZcumqZis68mMXFl5VYXpDX5sffA5FJUifrA+PxMeGVM/MdBppGFiTvBxkggeP
         DoFyJfCU8zhmZVN7YZQwSMNoK2repkv/0lPB+lwd2ejdhry8af4UBgyKJAAp9YstN8F/
         shafxlrEvN0MRLcj5oDqkxP52ylUcWmI9SxST4N/6GYeSZguQOhH8di+MMqW2JPgVadS
         vELGwzjMw7wuhsVtuJ7Vo7iV+PqXLZUr9ItGBqNXeuJfvGzuBKvZrpMi6blAtT9asB0K
         JuPa5PL/pVfS7RrhROQxOWbpyf3HPYFD/sZyY+r/qDCIb+YkpW75DBWn0qgRVqk4+Of5
         hGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788320378; x=1788925178;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fqWDWsxv8wlgt756/7Sn//VhWsyTD+w5jVSYYxwonOo=;
        b=LB9iT0ZRQM++NURPW4URLoAAKqc7jDj2y6ryU8fT8USZdTvXBj/uAUBLcpY9OQiQj7
         rRdplMOcBBIppvAhTnEckE+tqBq5cf+aMkHEUd6V7iBTfK7Yugsd9E3p9zbczstE6KjF
         i8zjLCGnmzY8qAV+BVoaUMmkPdiNiFBAN9Nbf/x1p5KVnbbgqf6lXYVW6b26b1D4cZ6d
         n7StoLQrOfZ0eUuuDzkaz2OIYRICr8wp0+LmHEzJf4n7H/Y4WsTMZtr13IqcDKoUq3Mi
         3gwot9qoVrj55UxePjO6iAMkCJVM708EZbYRRnbelPiuqdhbdqRZei0DcdgFydEeMSo9
         BwDw==
X-Forwarded-Encrypted: i=1; AKwUvBwPMO0zuxjBSg/4ZRhRUu0qPBrFZS14Gd5V8xl9EwI4i+NeeCddcQcO7rlDdn7NN9vULDH0nvOZo8/6um0=@vger.kernel.org
X-Gm-Message-State: AFuF++kmrLIC12oupcBpxhszs29NW2Ma946Vi4Zn8dkpIw6dwI+F1rlD
	zHxE28EWPij0Am4FJBVQPAMGeIrvjnLQUrwMYWoJ9ItA1AdMOWChy14m
X-Gm-Gg: AYBFou1d01D9gaaB66urLl0HF2/5NQhYPbxX+A20Ccsn4Fe/E8hWarf00xQAdTNYaLe
	12sMLCmEoKgEeQX41ZkRd0RidY/hcBJM3FtjPr0HeYKDkfuePJwlowNRMRGIs2YCFZq0Et1FSG5
	nIGTHc8rv/et97hOS7LpNHicLXLyYnF7hnmRpHIi40D7evYxiuClZ9nYp1bf74yWG2XghIjXsZQ
	8ao5JGhmXQC1PLK1RpA6EzzzqFBqjduKtNr5tq0+PQg+foN56rKncI87t1FJS2mfl9bZUPmdb0W
	RKyBLFekK9BkEw+UAAB5rD4abwW4764C0Ocf/O7xjhvWH1FJG/yvA1TnbB1xf+IKCFH+tiYtMNp
	ldKJhfx8GNyZJUNyxkSPfhexc2ie/HkyyeIxGoexAJ/tDn5se7bKXPVPaDOQo1rNGUuX2JtFSH5
	BmWoDRj7zW0ALOJ4btyys9yb6kEnVDKZ9jfP/yL/AcnlgI1hNehM4Ve3nk1gU3Fb2SQ6g4s0R+
X-Received: by 2002:a17:903:1a24:b0:2c9:e846:a57e with SMTP id d9443c01a7336-2daec457723mr29222385ad.0.1788320378515;
        Tue, 01 Sep 2026 20:39:38 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd386eefsm5715715ad.28.2026.09.01.20.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 20:39:38 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: thomas.weissschuh@linutronix.de
Cc: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com,
	david.laight.linux@gmail.com,
	zhanxusheng@xiaomi.com,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng1024@gmail.com>
Subject: [PATCH v4 4/4] vdso/gettimeofday: Assert that the clock id fits the dispatch mask
Date: Wed,  2 Sep 2026 11:38:01 +0800
Message-ID: <20260902033801.2912699-5-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
References: <20260902033801.2912699-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zhan Xusheng <zhanxusheng1024@gmail.com>

From: Zhan Xusheng <zhanxusheng@xiaomi.com>

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
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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

