Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E907F4E7801
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955104; cv=none; b=SRsupL/l412LcCoz6oE2iNU4KTHcaXaN6yBBGL/f9S2oxq9PYU/bkQP4aHaQnXUo1xdTmgsXL6ptT4dFcqryf3Dqr/qNb+VrxsHHizNkaHq/hQ1iVkttzamyg5HQKsPHeiKHujWwt7ViecqgwBI0/iXXK1PBZd8vvEpxBe/BmLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955104; c=relaxed/simple;
	bh=2J6SXiwkGloD50adt2uznCUJvmWrr+iY1RxYvqVx4yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pvYV/q1t5HABoAWScysYwr38MhAVAoDqy7SCzx4iQRgU1lSHmvFGpvMJw2wkjnxI4jVKlQb2pizZ8nnvEiDZdXq5qJjr/015VQ2l3Sk1zkpECsJvXm84EQMhOSSpPamKhjk6hWtVs2lsXgN7jwEdHMNEF9IMjb9yBjU5ZG1pzoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z22vnxow; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z22vnxow"
Received: by mail-pz2-f38.google.com with SMTP id 41be03b00d2f7-cc7a15ba46fso2466633a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790955102; x=1791559902; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lhWJv/Sr5r2WufVYqpSpDEuHYpseWlo5GmvOXtRn5ww=;
        b=Z22vnxowl/RKASTbPrddB19gfCLYVjChrl28m1i4KPjMZ2oF0Vu5x4pgW7sqdQl+VP
         SaWAM9EYXB47EY+zZoly8Y2mOXVOLJx9V+o/bf+Yy5tMdBO+r621FHG1EFXpGHIdi8fA
         50ndMAL4xOhZNSQahf6GYLtNEbz2l+5BpReG5GggrEogjrwmc1ucWJC2/WCnGE3A2hKj
         s/9dhDFdBePGgMHMR76Ey3cx39MZj84+mO+9tivCWlzlg8PbHv+ZFrvwwpRsKZ0Rn3L+
         JEcWELa1hE5/mJAgSs1smrGU/3p99Q5FNUS1A6ApdcXJOyoMRz81vXTwChIrB4HdtFbm
         tX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955102; x=1791559902;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhWJv/Sr5r2WufVYqpSpDEuHYpseWlo5GmvOXtRn5ww=;
        b=fLQSrSqdQbkjIfAFeTNfO1x6zTkrhGjxcJ3Nkb383uJ6uvblZBqP9S1lTyDC3VjBdS
         U1wRlUDtm4Ty2b0m4H23e6oBsDrbEAgGe82uRYQsb2eMzd4OdaDEJ79Z/1MxY41s33MJ
         b9R4LkidQTnAdPaGXoJpqCV81JJNSh6bbbFNuSUATrNzSn6t2628y+Lm49MVN+plkwZd
         zmrZqZ1a0At5b9+aLNPbIXirfIueYhvOwmPh7ncCC8XPEUXFu75rLgJqwseld1TtzPVk
         Raxmfag92gbRE0weJHklvpDFGblYabTDC5Va3ZzK39Sr8eamr7hWBix2Kta1LPWm/jl1
         UhXw==
X-Forwarded-Encrypted: i=1; AKwUvBw4G7w1qDs0KqlyXuV1UM/jprcAcdpXjrXLqn8BodF6pVjW/ZKaFXBPS91snZvaiP2CyNnpZ94N4yyVevI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4WHFmafgfiK2isLWsQYO0OKb5/jZ312Oj/hAexV7CTQJGvV40
	54Lmp67GOKA5lKgNmJ3GHBrtZgyVs8oPXrvzO8n5uQtNO/wwL7hqvE7L
X-Gm-Gg: AYBFou17pUGKk8HUcuU7LLeEIBHMX6/97kWDUsF3gTVjUuLXDemX0SPpLSehSJfBR3c
	7EOhc47eBDcTR2PD9wEpSLtru3JQ/TVpQ8CkrHTAN3LDyNVV77cvWtH5gp2A68g4VKk++Fb8Wbu
	FKn+1nRGvzjd8hdXO0K4m37lHevaop1nWYBgvp1UWzGsOsAEq/XSimRcgVIa6IJvnoFJpaZ44pc
	V2seMGgPrxy5B8X1WO0ssnWzNJ1Bn0NS0XbqiQEN8g451gRPpAYMGhVhFTobocruu+T4e2UD7MO
	BtV3Q+vRyuipUNM0zXJAEx7RlPST5S0gX/40x1m1Pp5sxsht+JaeHgH5lLT9OPQD5MpoilF+KRU
	jHI285wew8aBs/nz0QBCrLhvenMUd3/7ROa9pyr0xG4/JNHs2zFlkR2kygeuJOKULeYmemSAWdK
	PzUncke6rEaiv8Ud++05hKpXX+hmbAaeihPcInXEdqpKqG8tqYtJmQ/PoHopJz+oQajQEjgv39Z
	7h6NZGjKM++rgVSFevJDg==
X-Received: by 2002:a17:90b:5790:b0:3a4:a4d1:a987 with SMTP id 98e67ed59e1d1-3a6ce98c1afmr2755867a91.32.1790955101976;
        Fri, 02 Oct 2026 08:31:41 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6fc716b5esm1649468a91.14.2026.10.02.08.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:31:41 -0700 (PDT)
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
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v7 5/5] vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask
Date: Fri,  2 Oct 2026 23:31:03 +0800
Message-ID: <20261002153104.1347978-6-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
References: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
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
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609080117.XY9u2XZ9-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202609300510.Ej5t8KO8-lkp@intel.com/
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

