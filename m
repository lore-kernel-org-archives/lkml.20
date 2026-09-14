Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD7B1A9F8C
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789354857; cv=none; b=uuGZ9Vpp/P/JYqVAV1gPwsErAfGjFZPjlDpuPBd/t/6KbyKd6R7cfLf7eO7wN+447pT5s+jdKG/ukEutf4RXdLDHNBco1RaqHmKYE62e6ye4ozE3sjGIb9RBUdMBnApeJ/heSCo2Pee8kdSc1eG9AQiadApez/1rKtpO7GcgnGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789354857; c=relaxed/simple;
	bh=oEl58bP/UH+8tXLxbnzZOu4bTiFj6HAc0qcwIrjp0jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LMm1ETUrPbPMw3XNJeRIGV92wVZzmVxbx7F3Yiqz5C8yJAVqo8C8wqRX7/HO+boDibmIYbBc6Vh83isdqGbbUoLdCpP06PzthDnXDTMH19VczR21y/Dno6ZkdMAOg00BywI2N6B41MAN1YVGzhVG18cqZJJQnrLDEvCV51Qaek4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sn26i98n; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sn26i98n"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1848231f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789354854; x=1789959654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+1/RF4dnaWQrl22BIUng3R9TZwvSQPnvcZ+w1JR75g=;
        b=sn26i98n7/F6JXRMOm5ZtAVVL4LC7Oia0PxfKOOwu2Q9V/l7xX0TTQu5DEFkCilPPl
         COB07Ek69v158rlJv+1i/YNfjXlllZpq36KRqriKXG2MbCchu9zVV7ADTm8iLoJ2qdv/
         0jVqFCPHCkdLSmnJ9g9qHE2CEsYwu8PGvFexzsS1ph6iiSMP4H23gnVnSICIWman9DU3
         YTecf39ZAYgjqspYeN01kaIOgU5ymNidJb6JK8WsCWUytGh3q9s5P/GXQ8SvoNejKKfz
         khR7C/8M5P4FsaR28CJy6m1Gg8/AvuUOB2AhI2aidIBLO2zxI7RkfcokYaal7RwkfEGW
         t15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789354854; x=1789959654;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+1/RF4dnaWQrl22BIUng3R9TZwvSQPnvcZ+w1JR75g=;
        b=NWMwyc5TjPPDOl0GeFXXWCXPjoyU/5WQzrgMEOq9a6ZznicJ62WgQQ91D/c+SMnyUJ
         33C09gRd0md9qYKnJ2WvPYv+CRQ7dRlhD3dIiOGLB4Y7PMPB1LPTJUVsrXDBAKTe8ZmM
         scpGQNFsIoJdjAS3Ox+cpmXdz65lNv9uFqAiyt4zw2VgReNqofVMQYpkHz+bb+j8bgRi
         Uk9mCQgwPAfkC6X5w+4nRu9Hntj/p5QDGD+wqUro1qldkYrRbK5Zt8T6xne0meoxCWxl
         n61wQn/uiVnFnelH8/xDLqJYXnoId1ep7cE7ijPf79PeEDngCMGx0E+67XUp0yiev766
         kmkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzclcPdLxCVfoHIg6A3mq1LzF2T6lGyS3fQvbuOtFIGLPhpzossqzY+ZpxIokazYXEV9wq1Ma0WnGsFgzc=@vger.kernel.org
X-Gm-Message-State: AFuF++n99DMx/uYsQ++gn7ZVOf+cxlz4VFv9hBiGK6/Y17n221Q9GhJH
	BoBH8ilu7z5B7L5uHmeYGjj7r+hN7eb44Fqr7VTV03mLAbWJzA1MtRUn
X-Gm-Gg: AYBFou3ZHQ85pk4KaOPZxORulTB6IkVjnfOcbUG+Kj8mu/s4wOSgme5zJhOBinVRMUg
	oYaT793J5Jagcp0BKivrZDTfuOYQvLoy5Ee6KddJZf2lg6vtG+7WoOZ7Xgv+KAkhrSFubdHfiGZ
	GQGqyj2albqz5S2kXUDgSdvhiUPnJxOAC+qRECXmFE83TRdUdKHwt5kMGvSjBYQogrhPWQGMwJV
	vY+L/K2BAG3uOXDD/akB2Y56LGdeprjHXGG7WR1UXwIKtBUvCVoJPKz2SaZVSLG7r6FfSQ+Q2db
	DPQalUTmgbOXjMGq77lLCxqN+a2+MBmZWyWV9t9hbu+zICkctNxknMuCiwAKbMQCABOQNW9zD04
	9i4Irv6zckyJBABehaVLHf+I8LHWgHouFEzTCiVs2r9VcbD9DPVKJi+m8D0f5PJxwIq6L3+hvSQ
	jy8WvVcJV79aL5WKG0xN90XTagKJEey/yvsJ0zw3a6A7nFuhYqDfHks8L87GYtKhRVpERHnjW9b
	E2EitFwTo5MyLpdlXd13ODNq9JZEtNgZd859XaQcESM3GtnmkbWNY7IMVm5AvcG+fDS01ThYiaL
	4HgfnYcp+I/Faxjf1fUAeNvFi+UL2GyFx7ZrihJZco2u/dqFCuaHDV2x
X-Received: by 2002:a05:6000:4a0f:b0:485:7cb9:4ec4 with SMTP id ffacd0b85a97d-48702ab8ed9mr375913f8f.5.1789354854252;
        Sun, 13 Sep 2026 20:00:54 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-077-007-122-014.77.7.pool.telefonica.de. [77.7.122.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33e020sm24477516f8f.18.2026.09.13.20.00.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 13 Sep 2026 20:00:53 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH next] kunit: Initialize filter error before disabled cleanup
Date: Mon, 14 Sep 2026 04:59:33 +0200
Message-Id: <20260914025933.9832-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260901-kunit-void-v1-1-c91952391d66@linutronix.de>
References: <20260901-kunit-void-v1-1-c91952391d66@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

kunit_run_all_tests() jumps to free_out when KUnit execution is disabled.
If a boot filter is configured, free_out tests err even though
kunit_filter_suites() was never called to initialize it.

Clang's -Wconditional-uninitialized diagnoses this path. KMSAN confirms
the runtime use.

With CONFIG_KUNIT_DEFAULT_ENABLED=n,
CONFIG_KUNIT_DEFAULT_FILTER_GLOB="*", CONFIG_INIT_STACK_NONE=y and
CONFIG_KMSAN=y, KMSAN reports an uninitialized-value use in
kunit_run_all_tests() and identifies local variable err as its origin.

Restore the zero initializer. It remains necessary as cleanup state after
kunit_run_all_tests() was changed to return void.

Fixes: e38f53f04824 ("kunit: Return void from kunit_run_all_tests()")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/kunit/executor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kunit/executor.c b/lib/kunit/executor.c
index c798a02470d8..6e4664ad82ad 100644
--- a/lib/kunit/executor.c
+++ b/lib/kunit/executor.c
@@ -382,7 +382,7 @@ void kunit_run_all_tests(void)
 		__kunit_suites_start, __kunit_suites_end,
 	};
 	size_t init_num_suites = init_suite_set.end - init_suite_set.start;
-	int err;
+	int err = 0;
 
 	if (init_num_suites > 0) {
 		suite_set = kunit_merge_suite_sets(init_suite_set, normal_suite_set);

base-commit: 68142f986ff04b2b70b31db00f719bf690f64a9a
-- 
2.53.0
