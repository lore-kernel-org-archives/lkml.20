Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F54D40F721
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788180976; cv=none; b=HzZKd+jy/jOu4dribgU8Nw33eR0qQlg2m21THWdcwJ0u9rJuSniiY6wLhm+z0ENnI8nUcVpCrucZgvGu4/Qw7Lpf+R9dTrZUMJnsx9NNXlZfuK7U8ZMjeD5lD6ftpbobSlq37MSXrBptAK8CyVVQoahbjEnIX3PIu5vkyQNbSqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788180976; c=relaxed/simple;
	bh=Gz7pvYkZxkfDOb3BqtG9/tccf8rcqr8M6u5ct3ddE8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kG5bdCGD3D3XVlxKfuj6a/B8Ub2sPuVIY7aCmUUMSdIH2KN7yCtgB7hY69py6DXVVhjjXcRJvipc5D5tosfTq40Cerey98M/DzhYOfc8twhoBSgzEewNyu1gU/9uTUXnOrBbgkB1wllX/s+sqOC7nwmkKrfdb0IYm5ZfaxXfKak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKqXS0cy; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKqXS0cy"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so4821027a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180974; x=1788785774; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JU/mOXCgWiPXwkuQqSrTtqCfDr2fiWKeTyG73VGlOc0=;
        b=AKqXS0cy/W4tzTgmR1gI7Y5LH5pd5GfgG9D0d183/Jr268L+YBaH2SDIcR771kNe/4
         n3oddSfnPrVJJl2Ko7FKccHfoudegzL7QVMwTOL1YfsG6WWylL6aPZwACZD28hJyOaiA
         AlwDMl9L8GN/HJWUxTJpSRQct589mW2yKaVZ+ykRZNbe78LfcbvpR1vprrPLc/AzOl4n
         lpFY7ApB2RMazcbNJ1qVeiJhwFxxwGzcPSAaZ6KGIwxbiOPqT4URUfPfy8EWD032KHrp
         MmlGUhftj1pmays1TWzjxqE+cgtsszzENkFU4udEgoSZudOvpd/FFBACGR4o3H2pZu6J
         zkoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180974; x=1788785774;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JU/mOXCgWiPXwkuQqSrTtqCfDr2fiWKeTyG73VGlOc0=;
        b=MPiQMoVtZG1MIRirUsZY3RBkRj1XxOdDhDL+IMQ7MBnvvurJPq6wyOjnQvWLL5KnrB
         ZJ5R9p9UIm9jupNm6647tby2iWoC+ngiNC0eIcWFhFWVo+HlP/Rz+tpGfR49/Wgeqzox
         5fG9qDGP8tEoz2F7D+WLLaewC79Y2QbCk6nfTMVHekDcbJxOks+Q02RLnAq8W7qjS7Ek
         iAWbp/hzbYWxCMUI+9KIFibu7ebtywT40DBg2G0Mc6fohjdnzM0ivkNW1gHDAPG+BFu2
         PFewSizw2gIWoc0I1ce4vZ27Hsgys0e+oV+WhAPOqe9dSPYPMe6JhhmHyr8bK0Kw7E1R
         M+UQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQRa2omwDFqwE6bG0Bx0ivXFpyHFiEdNi5i2HUiH+18apsqFHmVmLMiVHvyFmh2xX6m5zwPOHLrliUfsw=@vger.kernel.org
X-Gm-Message-State: AFuF++ksmH/+66HENWQXLec6FBKpFZfmoNhs89/mIwnf7cAVYJVJaB4p
	oOeBCwattjFZZkX3WMwnlW6etXat8fGerFWJqWXLGF9XEtPGO/F6Y7UM
X-Gm-Gg: AYBFou2FEKJedYml7gHX/c6qmm5PuHlSdBglO4MUDPdMh3GLWq5J9vzsmw0MV48DRD0
	HWahnLmsfS11BydBbYkCjYZNpYRRedGOYhcpBLncvF1z/J4ZuOlNmdM5xY7AgzkogxNukz02REc
	YR6jvHDVU2OLZxtdE4zPVOt/QFBYRSsWlmDbIhqZzKMptGyRBr2V344wXqVAIWItFewbKvY4t5l
	7myqJWKq4vEP7liL0hd4WOe4mBdwGinty5o9qebrJRKo3qlJlNxRhUWM/3WZYCyvKZJN78w8pia
	S68v5dPUlF1mXyOov9lNu2u2x8NRLxoteJcaX5JubqoEfWLiUzWe2Rdh7RWsdjSCMHp2AAN9e7g
	HgowCVi78uYJ0t7lzlza1ErHe7Dr6LNvUF/lwWqK7mcslkHE91LJpul5B+IDhYZiFI5JwxNpJjE
	ThJMRW3DuMYzgtZdhHUEEbKavoyLLmjbhVYtJ9iC0nVMUoqURVEuDervQO2YG34ClP9qanRlXIV
	N/I72m8PaU=
X-Received: by 2002:a17:90b:3c48:b0:398:9bd4:d1a with SMTP id 98e67ed59e1d1-39907ed3bcdmr776019a91.25.1788180974327;
        Mon, 31 Aug 2026 05:56:14 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396d776d0dcsm5645997a91.4.2026.08.31.05.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:56:13 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH 3/3] vdso/gettimeofday: Assert that the clock id fits the dispatch mask
Date: Mon, 31 Aug 2026 20:55:57 +0800
Message-ID: <20260831125557.1490398-4-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
References: <20260831125557.1490398-1-zhanxusheng@xiaomi.com>
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
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
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

