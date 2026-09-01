Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2013DB655
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788228428; cv=none; b=Cl/MxwE2s96wh6mk9wlkaZesX9ewJzTfmQz7Nq1j8rOPgszW3t5kXNYU94GyCOiX7P0XtJpv/Ta2cbaUJ2sQeTPGAsleH92YpbjQoWkKVrtWyRSWBFZK8C1dLJh5rP3xqqmfCCticHQ500Ri3nIxoZHjvn+zVQ9wYnPW9tq7XEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788228428; c=relaxed/simple;
	bh=5P59Bq4up99u7gApt2KqPGKOUslznXyqU5ohN8siKF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kWU6CXpDDJAAx4jk49punC+1tba/sxwpbubSo8+FkiaH9SlhHC7xL2SO44ba0E7Nw+iBjc+sdRnsPZiTGbv/2EXSPRT/RVB6NzIXaCGv3uhSikK0Y1c/K2GKWmpvQE18TvXf+g5bpwRma9x6Ncdd0uw6x4lJDanJeiLdhgRrps0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SSXMbWD9; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SSXMbWD9"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cace91f112so34506805ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788228415; x=1788833215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9g52VuEJe5AvLEWV0/ViQW3w54tdOrLUo0OUaHcm9hs=;
        b=SSXMbWD9iWSiNky9IXQlHAhzmYE4QUpz3W6BmT9XGgBv+y/ho3ieRxw7PMpcsPyDir
         yS1RdhZ+ukolGjSVMc0NJWIl5jdKqlMPhlGzPXMC+3HD1L7EYlRI5I4WbCdeHYUA486+
         f6RE9iUbJWmqewJZG1SPPGSqvvbHlwe9L9FQxjJIYQctExihJw/Ns8bzUrMJWMrHnJw4
         S5OR/WO6xGYApM71+3nIDNjTYiTfB5dg5VXCiWejnBDRdtOScoSbKbe+O1aU7i8JCVWm
         SyoZJxzfcBEN2FdOw2InE/oHPa3e/8oNVkDD3qPnXmMnZW6GqE6BRmYd10rmBSCCPZY4
         NB6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788228415; x=1788833215;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9g52VuEJe5AvLEWV0/ViQW3w54tdOrLUo0OUaHcm9hs=;
        b=DzKhDiynrKzsg3S4I32JXLIRom8J/1Mf9gocxpqhGXRfPI/gUcP8vVwCSbxCd4tUvO
         Xc/g7jN72CciHezg4Ac6mA0iC0ck2mrbe06zHjop1asAeW0U3IUDEgSAM2uIJu6OZlnf
         /jG3zOQjvPM6x3wTnjTuD1kCfZUlEjJe3utfP2BjPzValpAYs94fV0hKmVGumD11EsjL
         3V+smCFnsqiNjDz1Xgt54iGzQsWeQ04oYOkt4/33M/ZvasMve10ydsKf/71uw1/YbEJR
         mdzU0QIpEY/nkPUNB8G90sZIQCmAwRIBalh1AUj0U4Gr0PlH5d852HLADbYLCAVq6rAu
         QUzQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWm9Em6+CudiTXQQ0lifnT7UOJMwKNJMrFWE3NqwbNOBjqc/rbFzoQHqW5mbxzxtxrmXfV3e8q1VuGUfY=@vger.kernel.org
X-Gm-Message-State: AFuF++mP9ns5UUGZQxoQQqHcaWZHoDD8XuFGheqEoXJPHa7t0UCNPdBN
	02gfE4TS7Uh2OfS0IVdyv/kepsjUHwbqZpJIgSugMjJK1jCHjqclzNvT
X-Gm-Gg: AYBFou2AQ9OvwVwCWs/P5wvQ3W2rGJGjUXxeOGUNjSeTwjx4zn0fsnato1vl7DxFU0P
	2WHqGV2V++AVwtbKsTXyH/GHLZgrKICvcEepSkmPeHafz9irYqkZ3u0zhL1LGgxqkrNiwKVNrI4
	cWcq0chaQefd8yLkoy2U7a33oT7wTwlOV0sY/X8wWCLeL7Nj0z72z0jeCEGIY6BJSWzah1s3fQC
	hCP8l7yVoMjS4ccVlHmOUeMsXhlH/uBundbEmptY2MmfGoj2hFfFBJCVa+Gjw3mmeLI00ooKcgO
	dnT1ljQEwFt8INt31ul79k5iu4Dd7Ll6ZsI3wxtzYvcjQAF7J8miHdLak1ZPRxtze4J3ZHYpT4i
	TURy2QLtqa4xpYhAVKi8vF3cMojtU0UhrkK4610TJ3Ep7reKbIWqqQQa35DQHWvVttCHQ7oXZos
	IvaQjeXtKOno1yRYd3OuLM97Op4I1Tih7+Ez8C4h3LUXuhGyo9NNlA3C8Z7Q5Jlc/6CN9jVhSY
X-Received: by 2002:a17:903:354b:b0:2d9:49b3:abac with SMTP id d9443c01a7336-2d949b3ac16mr76619425ad.18.1788228414590;
        Mon, 31 Aug 2026 19:06:54 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7596412c2sm43098735ad.37.2026.08.31.19.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 19:06:54 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: tglx@kernel.org,
	luto@kernel.org,
	vincenzo.frascino@arm.com
Cc: thomas.weissschuh@linutronix.de,
	david.laight.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	zhanxusheng@xiaomi.com
Subject: [PATCH v3 3/3] vdso/gettimeofday: Assert that the clock id fits the dispatch mask
Date: Tue,  1 Sep 2026 10:06:36 +0800
Message-ID: <20260901020636.1821993-4-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
References: <20260901020636.1821993-1-zhanxusheng@xiaomi.com>
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

