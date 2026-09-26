Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B5735E926
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 04:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790397523; cv=none; b=IpXDv1zAV9PhhZipuAYYDV1eOXun4DQk8Nfxr8D/UrSq2QK60kG+jdjMRyCCAjBhI9ZgtQgnGPskpQXpLTPMbX4dbL+IMId9VEaPxMEcS1LY3zWXIkMkdPQvbGJJsUwmNn5d6Dy2WQbRFFFbhfabud6w0zt33Kbavpp83KRQgEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790397523; c=relaxed/simple;
	bh=o96/nTPgLaU3nU2R7/joPhaB9h1p4PmJ1veyXH4bPkw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FYT84IATCWnrQlsQ0x78YJAc4iEgVya1BfFBOAHR57rmdbtmnZTe1JZo6V2ztUm4jHP3w3NoedPwTc9U1uFX90S70PWodrkT2cvENY+qWgnCwS8BtasygmKddJs5GO1lCk0ew9L5ENc4fcbhtFeXc2yrhyBUciYSYVaXFvA4Xd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SX2fISSk; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SX2fISSk"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-3396cec93b6so1773595eec.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 21:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790397521; x=1791002321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iH2mnKMaWDn5GtGVfUjR2kRVjPqFYOwfwYCMea7YYrs=;
        b=SX2fISSkl6VGjbp7UmGhjvtkz2LO244XoAlujkyc1So9hHXdnoA8X38tYAjUwPvvRV
         rCko4nWQJEVwprKmR5o3iN6vJuaWKI6S2SVfsFuEJFKR+ru1T0PJvciI/p+4nl1pxWl6
         F0nFKaEZaTOozI6c8TZru75Z3ZPms352LHK3/paTg+sehUlAQ5nCmUPZ3R3hcjHdZDCh
         EKlBGcjDDP2tgJE2xBQHA9NrBQi193eZ81xX9G1TeIzXS9F7aDuv9mRwLQrKLaWW9Jna
         H+g1uv63zxslkrL9rmYjlkcKZGecR+7HUBW+PE9tVItvaxjdDYE5/FekcQMJxXm+jNE4
         HhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790397521; x=1791002321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iH2mnKMaWDn5GtGVfUjR2kRVjPqFYOwfwYCMea7YYrs=;
        b=T2a9YWoipnuerjnyKFAXV+gw1Po0XUv1KNkeH5rOgkFtiJHVC7Ar9T7Q7/Awa3KvZ6
         WTwyboIKmeG2Kk8+6C2zwF7t1w1yutxKeSHzm409VUkxil3g6cmzq1/wWye6MtL81II4
         K92A4oyQfoRq1p+DHTkjQrLd/GniCBAd3C7QL/gAyrNg/bhSam9ETunkqChbFoqidLPO
         z0geazKL9l/5zpeKF8JhfXAJY5quV6JwEyyg1YjMUULj2tCCQ8VqEccPz98JX/Y+3XfS
         7PXUX4ActVr6Y4ONnMSH6Z67HCh/MMkdYw+Q7E0H6SoNXGDZ33UlVB14O07+B3UyTHrW
         kYfQ==
X-Gm-Message-State: AFuF++kxJSIdaK/lH/YcHd+mKQPHEzZTOImaoqIRdtFXKo2nF+uVLE+X
	zVFY5w3bGrYHJYeEkANwv/9FnXRtly/cq79EwijoMQJL4f39VBSFje//
X-Gm-Gg: AYBFou08FgU+iMqeIW9O3NwgoYiLtRPeHXMYBV/VPxjMrBUEVdCl3n1uCfT6MnP14/p
	fCRzUEWwoR1qye0p8ca1SaN7TaVPJBu1fq7m6Par8NVSdUE16q5J4L4q3U/D74HjFg1Yxh+DENo
	1p0Z9uSW/adnxf0Z80UEmcRTisIAJ61Ikf9shqNk/8Enn0riEvYr31qzzSpvIVRMkZ5WPFOgCDV
	4VcIhgxzszEomKX1AtqYjmHJalHCBe41qY0nvP3dI9+5IHcHCjVKn/Y9IQVJo1bHoF1g98iaMw5
	Xwt/B0NmGPZ7FD57NLw1i/w7pmbO17dWATN9ugNDYmMXXdvtiJiFd1SwNmkLDWe0KtaCnTlNTEr
	WnyQ1NIEgrjBKWGY+vVNsYeNX3RTOPq1w2Gr6zLMRTBHvNmTSNM+6pVvI3JD8wXl6RcE9r3HthR
	I826vG4CYzG0Okcgxh2CmqOVaHvfdUG1FzO3g+RGO1g2Ie1tp+OJh1QYdXsqhZT8Eb56UhhBMh6
	Ln3qw8NQUMgb7WRIpZTn0vYqNYsyjSwkKKgOJWb+A38RIHhRTsk1HfWPKBt1dhsJUjF6bmmxy8g
	MtrphXQjorkpY5ZmBgjTgyG07DMObS+yeFM6cmqmvucw2k0pVsnYadqP5Rc=
X-Received: by 2002:a05:7300:ff42:b0:33e:bbcc:eb99 with SMTP id 5a478bee46e88-34270ab2d32mr2087923eec.18.1790397520853;
        Fri, 25 Sep 2026 21:38:40 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-343025a591csm2171406eec.12.2026.09.25.21.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 21:38:40 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz
Cc: linux-kernel@vger.kernel.org,
	hch@infradead.org,
	djwong@kernel.org,
	david@fromorbit.com,
	amir73il@gmail.com,
	ansgar.loesser@kom.tu-darmstadt.de,
	Matthias Goergens <matthias.goergens@gmail.com>
Subject: [PATCH v5 0/2] vfs: add FILE_DEDUPE_RANGE_REPORT_PROGRESS flag to FIDEDUPERANGE
Date: Sat, 26 Sep 2026 12:38:34 +0800
Message-ID: <20260926043836.3301898-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Dedupe tools advance their file offsets by bytes_deduped, but when the
kernel shortens a request to a block boundary it still reports the
requested length. Patch 2 adds a flag under which bytes_deduped is what
the filesystem actually deduplicated. Patch 1 fixes the DAX comparator,
whose return value would otherwise surface through the flag.

Amir, thanks for the review; both points are taken in v5.

Changes since v4
(https://lore.kernel.org/linux-fsdevel/cover.1789653814.git.matthias.goergens@gmail.com/):
- flags is a plain rename of reserved2, without the union (Amir).
- Dropped the paragraph about old callers and old kernels (Amir).
- Documented the flag's effect on bytes_deduped in the UAPI header.
- Patch 1 unchanged.

The fstests test follows as generic/806 v3 in reply to its v2 on the
fstests list.

Matthias Goergens (2):
  dax: return the comparison error from dax_dedupe_file_range_compare()
  vfs: add FILE_DEDUPE_RANGE_REPORT_PROGRESS flag to FIDEDUPERANGE

 fs/dax.c                |  2 +-
 fs/remap_range.c        |  4 +++-
 include/uapi/linux/fs.h | 11 ++++++++++-
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.55.0

