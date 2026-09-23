Received: from mail-oi2-f43.google.com (mail-oi2-f43.google.com [74.125.231.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1841446BFA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 20:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790196987; cv=none; b=uLZusAPYioecvSIkda7Ajv1anLlZ8g30kF0CViinaU5+JDtP5MlciEVPbJfq9Jdv8nUosDSXswDmgPCwjPHvI+N1MLI5etJygVBNYzXKaKXDw+98Jg8MxETQJfGSea//LAIdKG1814o0b26vrh9QaSwpQMKEAc4azMqZMcN4cx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790196987; c=relaxed/simple;
	bh=W1wFHElEz1b/dayThNRVFfN+kigL6G25ODCAEJSlsog=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jI9ugGNpzc4tl4uVYC9aD3EG6CT60bZe10bgLz04ihVen26F6kIs3hSjN6AXzBg1HH5Y5VAI2CrHgxkpXnyRGz8FE/Ad6ye5jX//7ZPGYC3IT4poKIpY/XQIIFWRETXzDh6KCtJqryCUbvbqfPFpu8wSfChBKowJRXfeg/rzvvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abznh2cR; arc=none smtp.client-ip=74.125.231.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abznh2cR"
Received: by mail-oi2-f43.google.com with SMTP id 46e09a7af769-7fccd4c3f36so1492659a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790196985; x=1790801785; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FcKyz98Jefny6nggmzRRJAKdNeUQm5PRvYIxlTnznGY=;
        b=abznh2cRfzonhhRyGmX6b6idZiAVQhhlq3kq28Dvbt2uwgGrHtTAfrNC5ZJ3DUSjIc
         xwnBrDhyyqNOKdL0dtOVkAbMBpHtVAUFsPZ2bAQJc6ycim8lIZzXF8wDDCfsd+6Kuj+5
         cYh0jS51WcXuInqDO6Dmn9f2qjpl2QXR32YbC7c0JRXJJa34tb66wcIML+7y8kc4qeXq
         23F2ssqKA9MfcthWpSc6cl1AKir++wE2slIe6DujIqSftGJavAmuCJ9gBK95+AOpHioi
         sHLp9KYCrQr6pwtt/rHZDgQBHyytwVCooRju7peiS8KwbrEGdqYCv9VKowKWGcRgbNdt
         hy3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790196985; x=1790801785;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FcKyz98Jefny6nggmzRRJAKdNeUQm5PRvYIxlTnznGY=;
        b=PStvIdQ4GD7XdRF9NaAAYGq5BMBwwTXjYgTXp1H7UlO6fnZtgmrGJveFEEzJXhw6kB
         f8yUk4axYOP7dTv1B2bdfhrxxjGToc4DPC7Svv2ZwZ+e5O26/Yvh37wa0WAI+wbtY/uH
         vTwEEIrn5kClXiBIHkvptU9686ph9YPcdGXzlkqKCEZC6ajkmJKzrw4chXBhAiGo78xW
         8oE49/+gFssbbG8hq+EI6W4o/3fCjQQRdAVxsAwWAGtTZorzJQNzbwz6ZMGbCYUPBOZ7
         axa/Nh4U+a0G951eDRNEMtwuye64JIKYh+U4FywUrziifTl0BzGq4D51a0ZlB+nYEcL+
         6ynQ==
X-Forwarded-Encrypted: i=1; AKwUvBwFHLUlbpJByfzyZKbz+z+BHSA2OUGy12sYkaSyBpl0SLNL5tS4nAbm2SncQfokiy+1LXz3IcAqis6Ux6w=@vger.kernel.org
X-Gm-Message-State: AFuF++lx463BI9K7F9ZsFWPEaWlVb/1fLF/KCMTWYgsFbYx8iPPtBhrC
	y5Hx9DLcSauRV34OvYxZaOyrrbJWXvclZ0S15OJJ0O99KUf8WGhp6UDoZZn8NB4V
X-Gm-Gg: AYBFou26WC+oFW38RS+vOlHyzBiA0fRGE+/b6/wwHGKq+BP25VIC7jd1CpA1qOwHWid
	j3Gh1fB4erb3ycTKXQXqx8UBOuc/PjJL6bmqk/jtvR9i4wH8kEI+24jn8qPgx2IqU2bC+nFN+Hs
	lD3W5KpyGsqJ04jgpfe5Xwvsac+my3As8uidqAk7OiKjRxNsiGV8jjBoHzzV/ohhW6YV6D3nX/1
	zLL4XvaQ/8y0jl1L2o2e+X+lvH+ttoxufW6hmekXibmD9x/NHOa+oWmO2qgzW9B80XaHDrRjL3M
	wXtGRCDpnG/HL/EhoSmOVT/DuGlNtgmEvBYeDblfuF1RvGAKaZrusT6HAHBfOsVADbRW5UGxsJX
	KA/Lw0ikDeJSF0mmc/yDA96f81nHJCCdZ8anLOee59cwYbsFWCgZgr10DX+5PeUAD39NoxsCoBy
	BwVWatGKJ8r+DP6ePTHui2gUNWa4sAPJK0Fl0hWmvSb2EcoDez3YqjG3u5ecZ+OMxzA6E7e/z99
	XLcYLN7zmSmltJVsWREDElRZV8BMAbkO3BuXqOF9qb+z6WozXU=
X-Received: by 2002:a05:6830:6308:b0:80c:d34f:5f61 with SMTP id 46e09a7af769-81783984e99mr475510a34.26.1790196984749;
        Wed, 23 Sep 2026 13:56:24 -0700 (PDT)
Received: from archlinux.lan ([136.34.156.120])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81603ad0f20sm4498893a34.9.2026.09.23.13.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 13:56:23 -0700 (PDT)
From: Danish Khateeb <danishkhateeb03@gmail.com>
To: Willy Tarreau <w@1wt.eu>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danish Khateeb <danishkhateeb03@gmail.com>
Subject: [PATCH 0/2] tools/nolibc: fix WIFSIGNALED() for status 0
Date: Wed, 23 Sep 2026 15:56:20 -0500
Message-ID: <20260923205622.1123270-1-danishkhateeb03@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nolibc's WIFSIGNALED() is true for status 0, so a child that exits with
0 looks as if it was killed by signal 0. I ran into it in a nolibc init
for a QEMU test, which reported every clean exit of a child that way.

Patch 1 fixes the macro. Patch 2 adds nolibc-test cases for the wait
status macros, which would have caught it.

Tested on top of nolibc/for-next f2212892b6a0:
- x86_64: without patch 1, the new wifsignaled_exit0 test fails, and
  the rest of nolibc-test gives the same results with and without it.
- x86_64, i386, and arm and sparc64 under qemu-user: all new tests pass.
- libc-test against glibc: all new tests pass, so the expected values
  match glibc.

Danish Khateeb (2):
  tools/nolibc: fix WIFSIGNALED() for status 0
  selftests/nolibc: add tests for the wait status macros

 tools/include/nolibc/types.h                 | 2 +-
 tools/testing/selftests/nolibc/nolibc-test.c | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)


base-commit: f2212892b6a0c2adab438783e9fa8093c90786d7
-- 
2.55.0

