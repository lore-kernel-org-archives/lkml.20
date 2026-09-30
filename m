Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D47536921B
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783136; cv=none; b=WfiT1I5XPfpMGpK4q3eQYdHkPX1Zta3V986kpnQJgKdBSo1uPmosGfYyyZXabCSXtwrGK1aiI/9pE8EWCZvHyEvIZcnmW4/4OwbxYqPfkD2kL0ANJLqcPMFNI6eXlQyawe9fW5u2As/aYbPRovuSYbeRFoqUsL8tbitnTtzK1Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783136; c=relaxed/simple;
	bh=2J6SXiwkGloD50adt2uznCUJvmWrr+iY1RxYvqVx4yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cj0DPbwTjEMnc9EcorEWM/yKuCYkZaecPa/eekMze2oZ+5NvpVLPwsnCCe3+C04xj6s2VDpzaH0ssTOCODwsq+YnxiIEHigsc+qNXAmV8luyeT/DR5Pp3OF/C2uCF1NQk3uNhnM/hhb4lpuURGL9HTYjot1Xc8soIvBEuDZQzHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aLQkDrO0; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aLQkDrO0"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7d7111700so428852a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783128; x=1791387928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lhWJv/Sr5r2WufVYqpSpDEuHYpseWlo5GmvOXtRn5ww=;
        b=aLQkDrO0ei/OP8brGDK7gR4wC9ulBMSBQlQqdMNW8xnW2tC3X55eO+gdQ08vYZUjoN
         i5wwLz9aUF3mIULOJFCtVAtcZZz2o+aYvTnd5bjwiDxaSZSZ+cndc7Qk6thnzFaNH6xc
         avnTidkNT9oUlgINLr9l2+1lTeQa5MyM9SX2S+VI8KqeoykjJmW8gOR0BSFMH4MZvDIT
         lqPqp5S41tG/QOQ6VzORO7REjIfJprgtqy8S2XF9MBzwq3Yc1V/pToVgEG1aNtyBhEau
         ByCdB6MU1uuNKW8Z0XjtnTXGwq97Rn4Two+d3m6HKFRTYO5uN+38l8jZGjLy7km+P8bR
         zHYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783128; x=1791387928;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lhWJv/Sr5r2WufVYqpSpDEuHYpseWlo5GmvOXtRn5ww=;
        b=Ov8iqiC+IXDR/O0VHiP91g593xTg0Zx7PCreDHC62gdDUdRzK0jXio9KM2Q05rf4oo
         oRih/mLH61YCipX5eX5xGK+awx/IoatT8HZGKIq/L6pg4WXIYCbTCmJ6R+7FchazG4V5
         hfB+Z/ZNvN5b9WNcl42DOyYBX9TndtyXgoDp1H5iqBTlXQ23j7bYllsCaKnmR0CcPaUd
         txakOa+IifZOUmyT9OdAWczY6SMpZ35wLYWYvlhpMooLPQ5lbq29JHeY3/mi16W6HEQp
         zDCsoLuAcAa3fWxooJ1Q7T09+jkHai26/PgOA0zntILFrS1YRjMRDZP2WIS4aL1KyXnD
         mDwQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5x97KlfwBDETyYDqb4NOje92ioCQJxUwNzWILXIHP8VQnzk9wzVN1mw6C86XZZgoW9o9qXJ8vmrauN8w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMzG9m5Ay8kUl4UWcgfUPZseR2EQEz+QqM1ZlqnEh8habReHDC
	13c2Y0BetSl8BIGw5PStZB0iIvhnz4X0dyQl9kf7a1W3dD0jJi+iOtfu
X-Gm-Gg: AYBFou36AZNByIho5IlQWvjJidogjvaaRM2v5wxB3SazJDOp4DgYGuHVlyx8m0fp93C
	v4OIGRcV71JXJb64eT/i7I52dKGFEqhJ94Y+ba8EJgUEKjF0xfhIyfeZ64kTr3LEfQR9LT4VAGj
	0LR/Ux50BgroJ4/0yEJxh0I8I8GzGC4dw9dcI30pMJrynvF1PIeAyRs8Hjq5GC6mMFYCynzLbtv
	gP7qqampQZOWME2b26zUjia5e3+SbB14urYv2Rbyum+NzPHDbV6p8w2dVv26q5C06AGMpqWiriu
	6W/pX75rbjb5OVdZjg3eNaQ+EmlHykGhlzAP9PlgZnuFBtDFmXQ9L8H+iIB4Jlr/OUX9ygdyVtv
	ABMiVoyQFTt/J7cvAS9vVYs4cTCgK4wsqxr011tGrL0oUbWj/I0YvT/MmUBu3EfqvLF9G8jCY0/
	m++2wXKh+HSvZrb1o5PtK0nrEo82W5Rw7VWW6sCVlUs4Av5LmKQfE4qYLFgt1C4JMKjzZGvqmks
	StG+8AyyAdfFMBis5Lzig==
X-Received: by 2002:a17:902:ce92:b0:2dd:c053:e0f7 with SMTP id d9443c01a7336-2e2e4b4c2b6mr15020395ad.38.1790783127994;
        Wed, 30 Sep 2026 08:45:27 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d178sm10313265ad.1.2026.09.30.08.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:45:27 -0700 (PDT)
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
Subject: [PATCH v6 5/5] vdso/gettimeofday: Assert that the clockid fits into the u32 bitmask
Date: Wed, 30 Sep 2026 23:45:00 +0800
Message-ID: <20260930154500.722828-6-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
References: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
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

