Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826554;
	b=Yrj8tbKfsVOVnmAw5AGhxc7UdfDH7NaMFgUn1L/VnJMC0ulLl5Te2QyuxlROswNSXrIh
	 akbETAT/HppiYIH6huFniJiAoPAx+WBNLMt+bMWPv8ImL9tEhLpMr0fegraYXNSYl6DzW
	 iDWo0oFf3uLzAPwu57AutU00wraG4U3X/dBjrlzmM1u0CFlROeAL15/toJJ69olNO9G40
	 2GIdLUK6V8VE2WpUaScncTUuB4oAUVsmipbC2ak3ayUjodLzqFlCgRS+if7mNQSzD8OnS
	 BBNaUjCjVPr+twceUQyV1e03g/gkm8d+aYQEIQxk0lFWvyt/HKkkM2KBNbt59Wl/7hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=FwmAXxaBahAboQnBQiZSfiZqfzogCrFIH3WtsyVwi2s=;
	b=LOS5HTGvAcTJByph7s9un1lIcvSIhhT0QoPKl0C29Iy06+X3acqujSmSC4jitgCTCseS
	 uSNuKOsU/nzVf6I8GVu7EnwNtgTylmdslFc5JtRPPWdSwBVkRuIB5agyxAcSFGgUA4bTO
	 zBw5ZX7bbGgQ7l2JsdrpkPGsxy21PFn9M+xXk+kSu+CtXskn59kShbxbiAtvW05zzG1sV
	 vzagvh4PO4d6VwHnbdsXnoOoKuBjR7tY5c+kDUCnAotnoG0200KKUycXtDT5rQq5bw00e
	 J+7v4TEpVd+eoRCe5rBahsPbqXsWlthXomjfukV8WKMWajlqIRTIV+GOTq+TuDW6JzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCHWRBMc;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021C760A4FA1
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 021C760A4FA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iCHWRBMc
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so8875985e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826552; x=1794431352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwmAXxaBahAboQnBQiZSfiZqfzogCrFIH3WtsyVwi2s=;
        b=iCHWRBMcQht93C+GJcUpbzIdEGz3IzwCqHXybDR+OVilK/BGP9+75mqet1wyp3kCqt
         C5sIzGZHzcoU4T/IuUdrz10/fQZ0CnX8rgDUDzUJa2nIZ8zzF/nl/eHo0htYoSi124Dc
         kSq6HBFe/Yd7iWW33Y3pgpBkI5e1Su5FsvGTMW5qYW9T85FGp7rnphbcJuqPJlBDF7CE
         FPy9N0YBSlAtVkda6gvjtVcCvM9mqZxur2aHKktmr3ephDmqD5qfYx9Gm0nnZaATzONt
         iBqFDQtqt8l2+HmGpwukEwSX4rHC0/Crls1Kq4Na3wp21xt+iUDkE87ohl5NbqDkCBC2
         DrQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826552; x=1794431352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwmAXxaBahAboQnBQiZSfiZqfzogCrFIH3WtsyVwi2s=;
        b=tASjQ6+SdRLymN1Q05fvYWPNfe3o94ywAlqTTIhCQjzkLurYfYW0hzIiJKbXNMc2Xs
         uSImSn1ecxYklrU2/GWdnjCNymkrDVi53MdB7CFRq9XurtdAvl17Cd3Yit+Ypmn84+Yu
         sMsiMbHqOQhe0x39qhH+/KtpPDACaTkG9Z2kZOwLU4/BfX7EPR3WLjzviWyQd6M75WcQ
         0Rsu1QS0KQE281BNvmg6tu8Ab3xuEcqjjNWd6eW8EYFEqmJGAKWopmrrL9990amq/THP
         oXYYyLf5fA9tbQvDoZXeDtCDjJjPXVz4TTvNRih4jvhXZCnqkKuE3hxNycJmcw0ABq4U
         2vTg==
X-Forwarded-Encrypted: i=1; AKwUvBwgsSWE6FIwPN5/15ISO8hJgG1FEQlTfWp3cDJ7aGjhO8KCJ7rh445yZ9T0NRquyRPYDBNL7Erk1tpPX1I=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uTtiHMZcrYwMQM9ugfwVYdneR/ATTfHpoguXTYgbZkAE+flCa
	4oqDnvdzsRaSyPkxHAcRUsrIKd8du/n3UsQN1TORlcaUIAKFIndCsls0
X-Gm-Gg: AYBFou2ScKYeIR3dDzjYoFNMNhUZtsXJEi+XnHSU/yoJguX+MNQ5ACV8Y1Lpm/qfV2b
	2jfP/jnX+ko2jSlROYcB+sidPrTZi1rd9jtjf6YycGrVGI9GDtIB0wa3URyUwVqenq7BdgzEmEA
	qYsgKd1zgcW559da2cY7FLW8DvfFRKIrHTo16E708xduIWTNtRI+GKNhqGZ4soyG1jQONeO1cb+
	fwiAnjPJ2a9dvzZdpAGnS47oG4B/B2NCW0bcIthmL0Ail1746gSqBS/8mmti/Noh0ouJ06FsGvY
	/48LEO8jQeTmLH8D0Tq6a4AaH1F9UVExoXmo6gLgFaiebQ856I6e90Bkq17AGAzHooEFHewttJ7
	zRTvf6RmJlwd2uVYcQARZNHLYSqnCCPvxzUDFf/KvkfuiMNYobnBo2Qx8yx0u5JzFbu3PJfObOK
	z4Fs9ZIaehf3FzShwWY5waQghzHQgjoJ8Fj7WWQr1/Y1WhjLdgoSv/6YWN5q9Ago1Il8Qcqdgie
	9knSTnGGJNA/3dDUqMhyW0w60Xguetr5IYZaNGqTmUy3phIzf330kVm4dpvpXJN6u1VsdrOMzag
	aiNBDnOREMR9GB2cFL4DSmptrhW3M8lwkm4vp8WIspF2x5UZbTVDjg==
X-Received: by 2002:a05:600c:5249:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4ac1228b5bfmr387058325e9.0.1793826552398;
        Wed, 04 Nov 2026 13:09:12 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56fca2a4fsm12960655e9.15.2026.11.04.13.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:12 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:57 +0100
Subject: [PATCH v2 11/27] selftests/landlock: Assert helper results that
 are used afterwards
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-11-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Some helpers check a result with EXPECT_*() and then use it:
cap_get_proc() in _init_caps() and _change_cap(), and
landlock_create_ruleset() in drop_access_rights(), create_domain() and
create_fs_domain().  On failure they pass NULL or -1 to the next calls,
which then fail with misleading messages.

Use ASSERT_*() for these checks, as create_scoped_domain() already does.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/common.h                    | 6 +++---
 tools/testing/selftests/landlock/ptrace_test.c               | 2 +-
 tools/testing/selftests/landlock/scoped_abstract_unix_test.c | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/landlock/common.h b/tools/testing/selftests/landlock/common.h
index 6c2aa913ff11..a662a68bee7b 100644
--- a/tools/testing/selftests/landlock/common.h
+++ b/tools/testing/selftests/landlock/common.h
@@ -55,7 +55,7 @@ static void _init_caps(struct __test_metadata *const _metadata, bool drop_all)
 		EXPECT_EQ(0, cap_set_secbits(noroot));
 
 	cap_p = cap_get_proc();
-	EXPECT_NE(NULL, cap_p);
+	ASSERT_NE(NULL, cap_p);
 	EXPECT_NE(-1, cap_clear(cap_p));
 	if (!drop_all) {
 		EXPECT_NE(-1, cap_set_flag(cap_p, CAP_PERMITTED,
@@ -91,7 +91,7 @@ static void _change_cap(struct __test_metadata *const _metadata,
 	cap_t cap_p;
 
 	cap_p = cap_get_proc();
-	EXPECT_NE(NULL, cap_p);
+	ASSERT_NE(NULL, cap_p);
 	EXPECT_NE(-1, cap_set_flag(cap_p, flag, 1, &cap, value));
 	EXPECT_NE(-1, cap_set_proc(cap_p))
 	{
@@ -227,7 +227,7 @@ drop_access_rights(struct __test_metadata *const _metadata,
 
 	ruleset_fd =
 		landlock_create_ruleset(ruleset_attr, sizeof(*ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}
diff --git a/tools/testing/selftests/landlock/ptrace_test.c b/tools/testing/selftests/landlock/ptrace_test.c
index 10371c1830ad..b951889cd6ca 100644
--- a/tools/testing/selftests/landlock/ptrace_test.c
+++ b/tools/testing/selftests/landlock/ptrace_test.c
@@ -37,7 +37,7 @@ static void create_domain(struct __test_metadata *const _metadata)
 
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}
diff --git a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
index 5e8224623780..55a1599819c8 100644
--- a/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
+++ b/tools/testing/selftests/landlock/scoped_abstract_unix_test.c
@@ -40,7 +40,7 @@ static void create_fs_domain(struct __test_metadata *const _metadata)
 
 	ruleset_fd =
 		landlock_create_ruleset(&ruleset_attr, sizeof(ruleset_attr), 0);
-	EXPECT_LE(0, ruleset_fd)
+	ASSERT_LE(0, ruleset_fd)
 	{
 		TH_LOG("Failed to create a ruleset: %s", strerror(errno));
 	}

-- 
2.56.0

