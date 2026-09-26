Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906C9145B27
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430218; cv=none; b=ceYbmfi/RmvqF5O6y07go9ITJH8uE07HoAEqZszFE68NOYzmhzecOEJY1C6XjHfN8oyk0JbcKxyCOToF4e3zVNr6zpLXb5pr7zwaIkWnwM0MBTRIwrQMFvMHOzGdWZHwYfEBEcLcJ+CtHOwZXcqK24FOCyfHhv5RMYuUChnE6X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430218; c=relaxed/simple;
	bh=1OgR6JG+wwnh8+xo0vSZjvHjsyMo44Qjvdr8iWZ5juo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OsTk0zstMGvl2tN+DBxL4GLIXvSxlYy0cSFOAncdTy13R0Vn5+3zLGWhxgtvjh+THK7HrFHZYH6Rm0pyL0/eTb85EsAoFD/20/lQu+F04Cf7M/VyNtG01oVvNTJ/+S4HB+SvzV0h9PnGDgt7+YVcNjqbQu/gTkrRPDEaOVCEniU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T8gtVcHt; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T8gtVcHt"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c5b53d710cso1141526b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 06:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790430216; x=1791035016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqPktwupdkqQOvJSb1FXG4s95BKEGPyJZ4WxNU1BDYo=;
        b=T8gtVcHttmR/uzvpOFdIL5ioAEfs9ZZS1BgihT8LMc7/cEjAgF/htt+VsvuE2z4Qzh
         N6WitnwOFXJpLxcpCvOSzmrsVXhEuTEy1XEx89mFonkQj8U1DSmihOyYKzLKxaAknKMm
         bfkgretzqHZ/acGuQ85mFj5dbosMR3clP6CKcCAlCJgsY8aH06Knw5kcgiLXmMFyI2sO
         OHsMfLThaW5HhF4IQUYPpR+OwmDZmqsN8S2EMgSmhv2aFHMRK+VkO576QYJXHYBvwU/c
         a36qTtnvYTfMKr+Zfo1YMKQ58uPM3gYEJvSJU4xffnhwLkNO1IwfJgLh+Nn7Rkzy1zMq
         nKUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430216; x=1791035016;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqPktwupdkqQOvJSb1FXG4s95BKEGPyJZ4WxNU1BDYo=;
        b=hcc+a3aOi4rPNCIjyZ3cxwl69tCfePrRfUuPd8VGxzHuznh7ja0GP096qDMEdAjSj7
         FJbTUbLfZqb49SqPLQ0lQ8QhUaAh94WFkDbMoI2yBm8eiIiznL1wBQEuGeEx0Y9zHj3Y
         QpbQ6mNIjCZ5sF7nL2xpyO3yDHMAyeOSskGg6UB+4a+F8/HDMmrztN1ZRL+e1BPLhOG2
         +KORqonoawWY+YLnAvzM5H9oCCUhwaI8owsKrO/eCNmiaxAomDlNDweCPuEAenbgM8wh
         /iCFVR5/lDRbnd+4Yx5fnbfCUyMgNnYrXBH+vCOHQe16CLSOGzXkwRrVEKR2IcqUlE90
         +r6g==
X-Forwarded-Encrypted: i=1; AKwUvByqqsugPWS0XKR/bUrIbL92VWBj7B9CVgOb0WW5EF09LG88fSokBFgfM+A3K1N7DRNjGotOsSTcFL8UWCI=@vger.kernel.org
X-Gm-Message-State: AFuF++mCaXjpFc7VNLr1sjVyUA+I0kEzdhixvrvr0RHUSYVV55Rqgk37
	1xWIM1CVZkUTUdPI65By0qbKTp7I7DEVti47B1K4aHaylOeg0XmgeMbeyBEIgg==
X-Gm-Gg: AYBFou1Z9gxUe6BsCziW53+e1TW30JqKpiVg2xaXAnRtUj386AzUWfCo8/Cb8pJv6Ra
	zyoQJXOgwLQMI8/xkKgG9w7EGv0YYGhdi86yIpaits1VJwDLpV0zFaT7fB/cZ2CXPBeYvMdXd8Y
	trA2NES9YcgQQga8wo/dI2nipiT0ZJYN9DNF+/b55Z6Rw9UnsC1aCg+o/I29sI32hqkqKpw4lpf
	Z7zbDzk6P3ixslVk46ynP4BaGosMSBjpmuQQqopfOQUYKkmvDpNyBNHOh682mpK5MrVLFj7nl6E
	lOZxOvMGT/OTL6eVGrshPi5niQXKh+uKsI3aD4P2YmSAzm/c8uSgvjQoCXmKyVXLJbfOwYFMVj9
	hCDqXcH1fCvwZQdn3nI2kiQxVSSfbEbulUCWFq2/CbIs5mExNsvjbJdbGCuvxDxph+Fir7LF5ZZ
	KEanN11DwcZ6GBrOCiSF50DkHcdZQRmfsmGD/AttMKp/4N1mHWFFp443kvSkcgG7pATgM2Nc6bF
	O2+nXEbVVzTjJiYbZcOm/d3NHaIjBcxPZyq8nnoKg4faQeE8vw=
X-Received: by 2002:a05:6808:5028:b0:4c3:e608:ade7 with SMTP id 5614622812f47-4d72c635fdemr9990262b6e.11.1790430216428;
        Sat, 26 Sep 2026 06:43:36 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf3d74281sm4452874b6e.5.2026.09.26.06.43.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 06:43:35 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/2] tools/nolibc: check for overflow in malloc()
Date: Sat, 26 Sep 2026 08:43:30 -0500
Message-ID: <20260926134332.58184-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

malloc() does not check its size arithmetic for overflow, so
malloc(SIZE_MAX), calloc(SIZE_MAX, 1) and realloc(ptr, SIZE_MAX) return
a single page instead of NULL, and slightly smaller sizes fail with
EINVAL instead of ENOMEM.

Patch 1 fixes it. Patch 2 adds nolibc-test cases for huge sizes, which
would have caught it.

Tested on top of nolibc/for-next 0e1c44b472e1, on x86_64 (GCC and
clang) and i386, and on arm, arm64 and sparc64 under qemu-user:

- nolibc-test, all tests: no failures with the series. The only
  difference from before is the three new tests, which pass. They also
  pass against glibc (make libc-test), which builds without warnings.

- Without patch 1, all three new tests fail on every build:
  malloc(SIZE_MAX) and calloc(SIZE_MAX, 1) return a pointer, and
  malloc(SIZE_MAX - 4096) fails with EINVAL.

- On x86_64, a separate program shows realloc(ptr, SIZE_MAX) returning
  a pointer before patch 1 and NULL with ENOMEM after it.

Danish Khateeb (2):
  tools/nolibc: check for overflow in malloc()
  selftests/nolibc: test malloc() and calloc() with huge sizes

 tools/include/nolibc/stdlib.h                | 12 +++++++++---
 tools/testing/selftests/nolibc/nolibc-test.c | 11 +++++++++++
 2 files changed, 20 insertions(+), 3 deletions(-)


base-commit: 0e1c44b472e1ec21efdad1df21b10e5c568b65b5
-- 
2.55.0

