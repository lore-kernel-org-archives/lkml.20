Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792634330;
	b=zqJWUgqTzZIBQKjxGUn+7b9Ey1Xngxop9+jy2e6U8SI5BeL9hRQNTvKBKECPROB9io29
	 OTq3xOFkjpocLdvV2oEqo2KM2/I0zZeO5p6ZW6F2DxCG++658cvuBKq06X2c+n3Vh1vGo
	 DA6MadeD2jM1b773xKsF3jrZ5v07ozoGHByFPFAjmDfME/rPYof9v3DRCBGpCfTzGBblW
	 l70mWDwFQSmWM9nf0zTY+7JNdQIBpk3DUSi93TpA3FdnZYuPlAUsSTzo+QWcI8POnmLkU
	 acUbml2dPCR6dOJVkw+iExZTjxmFlDUM2RRKYKIS0F4+8OSpyDVmPp6afNKgoG1nxaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792634330;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=J0kSQmA6WteBQ8jad2iaYF5h9jM/IeqgPz50Jq+mBV0=;
	b=Cr0hg1P9Q3jXIqTYaXkLUOmIyl5Cvtz4HyVQG2LQA+Y8W0Ytq3vXmff3rRkS+U5MT5l/
	 VShwBwsIAU7YUzYcEeRQyeaqiv4VRF5CStPK5yLOSGW69qkI+5dIwAgcIEVMOUyaEPWNb
	 sYrgB+BxTeCJ26fJZu4musAh10HzVtpA+rpAh7kN9UAow3PtS0H++IkXUIcGDlBPzONoi
	 0W+KPxGb1uwNC6CpxnMHIpurLafBhJeNJh4WkhGi0WXX3HKlkMlaeM0YwhGII0MMEehUh
	 muiZmkRui/2QzOIk7DinGBe+y80bRj7lWohc3opqr+jXjHRA4KISwssIwTbLfErGyqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PUmVa8P4;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72681606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72681606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=PUmVa8P4
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91b813ac020so18690576d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 18:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792634329; x=1793239129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J0kSQmA6WteBQ8jad2iaYF5h9jM/IeqgPz50Jq+mBV0=;
        b=PUmVa8P4GAgDqH00UYGRrrwYFCEVFzMNSlfWBitcFu8SGNBdJ/D+S4HRMeA088Bm0Z
         AaMm2p/uUMllBU8JfTriJUR2UgwEsFxFUpv/c3J82qXPLkg0mmDAn3ZJPQraciJ5STpP
         j0vb0ZNmKsF3XekJL7DOVsJNfVbdSRKciJUQIK7hjSuxpL4sB7CUdc7UQfcGdDh7uFNH
         YgUazbQ7VI25dJLLj6FpCgxawS5x1mymdqtjbBclGVeTZoaiXGP8e+YJTnoRvR3njh6Z
         a25nqsQ2dTRJvCocbJDn6oH7yFGnk6J8YgTLuZu7Qy8iZywDQWjzyWVPooFHjplp4r4W
         ME6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792634329; x=1793239129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=J0kSQmA6WteBQ8jad2iaYF5h9jM/IeqgPz50Jq+mBV0=;
        b=fhRiQ6GprfJoXKx6Ha7le/ZhuFmGQOkOxg3CFxYN8UEZqdaK8Bexe5K1UWNUkPA5Ot
         eEGVu+NWx9oEaPKD5suOy3beGCX3AleG0ZxLXsrSPZsjLm53jP1hczMXPJfYrlgYv6Jd
         AK39kHHDzF5mq6vMj+i8f25nPTMzYskOSE/FZrdFXUxyr5FBfXTz7m+9Qd9qPRNvZtXQ
         DoS9IBKmJYvZt22ij4zA25qkikMmDYDNiJ6hFH1dSRejgZPOY0+Oa6Uagj03kkO/sXxu
         xjYXO/eCMKChnLIfgdNKG8nJJ7SKxSB1R74pSnWninII7nzFYDrb0+HO7sBJoh0fyT3e
         R/Uw==
X-Forwarded-Encrypted: i=1; AKwUvBwpeRXSRRdhxeHhH+TcKL9HFhhO2ayYHI8E5HEd8Hp1pwdlpy9ZoqD/8/pr52tNxBcScoFe5zt+gKqbe0I=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2K9FjQKo1LUK7a14VtGdpRaHF7bnIbmHXc+5f2oQgvJfKkYUj
	VsERy9efhZ1c1ZzC9xsopUHWysFP8D6MC7JWq3Ame7Llj99OyZHe9oZTsfQ2wRsSyzA=
X-Gm-Gg: AYBFou2UCwLikCnlpKMkD/8dZ2ZYrCwEnGFa+6j6w0R0MY1AY7y7r1XLb3wCYNkMIee
	J6wh7pNo2Q/xGMaUrGvDbBk4bghgM7YoHpj4vTzAFIB0vhAfoBPXB0l2nJBWhOQBewmfJc0cDwj
	GH3PZLNWLHUVO/Mc+HbQiIEgRcdtpq0JbjHGa3JWSHr2RJBMBxmaMDZ9LOXexPscg+TRTisYgWM
	+xSsDsKPZVeafX7QlFlHwQQTB3g9zyyfJr5WL794OrZe+IyFo3QkG/feIysINkPIdUyAwcTQGSk
	OvsL/Hu0gdGe9sDzMpCaiUDKUAzeJQbRva5quDGdgjLwtReAyXyulCyDI2cUkEzAALNE4YA5KdZ
	fNqhfG+u0/OZ9/0o2zFP1DzC+Bm5Co3yCSi/49fvVkF9GD+btNeT6QP6RDOKEagO2DtR8gJZsN/
	KPyOfEtEbJJ2y3A+J6ze6KtaIf7BGRSB93akPxigaK8ZHVQwEiTt/my6X3CMMczqqIiKi5+vQ3q
	uSyuK77UOCMqLgATe743mG43PxIWpfaEUlluOqup765ipW04RY+ze1QGaY2xLPWxs9MPnPO7yih
	xByELSArII0PCy+Tm085S5NQgtHPX1k3Yk/hhRpiVXy7dXViDnprfvVHQns34GYGN3t0Seh3mS/
	movJx42wZnkbaMPIqH7NU3w==
X-Received: by 2002:a05:620a:2851:b0:93e:4d60:d389 with SMTP id af79cd13be357-93f57f1ecf1mr807656985a.25.1792634329416;
        Wed, 21 Oct 2026 18:58:49 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f56e247ffsm397383285a.39.2026.10.21.18.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 18:58:48 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	akpm@linux-foundation.org,
	linux-mm@kvack.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	graf@amazon.com
Subject: [PATCH v3 2/2] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
Date: Wed, 21 Oct 2026 21:58:40 -0400
Message-ID: <20261022015844.2795816-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261022015844.2795816-1-pasha.tatashin@soleen.com>
References: <20261022015844.2795816-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide luo_session_freeze() in the liveupdate test library and add unit
tests in liveupdate.c covering the LIVEUPDATE_SESSION_FREEZE ioctl. The
tests verify that non-zero reserved bits are rejected with -EINVAL, an
outgoing session with preserved files can be frozen early, freezing an
already frozen session returns -EBUSY, and attempting to preserve an
additional file descriptor into a frozen session fails with -EBUSY.

Also freeze the test session early in luo_kexec_simple.c to exercise
LIVEUPDATE_SESSION_FREEZE across a kexec reboot, and verify that
attempting to freeze a retrieved incoming session returns -EINVAL.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 ++++
 .../testing/selftests/liveupdate/liveupdate.c | 49 +++++++++++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 +++
 4 files changed, 68 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed08364..15a7db3a6b3e 100644
--- a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
+++ b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
@@ -26,6 +26,7 @@ int luo_create_session(int luo_fd, const char *name);
 int luo_retrieve_session(int luo_fd, const char *name);
 int luo_session_finish(int session_fd);
 int luo_get_session_name(int session_fd, char *name, size_t name_len);
+int luo_session_freeze(int session_fd);
 
 int luo_ensure_nofile_limit(long min_limit);
 int luo_session_preserve_fd(int session_fd, int fd, __u64 token);
diff --git a/tools/testing/selftests/liveupdate/lib/lu_utils.c b/tools/testing/selftests/liveupdate/lib/lu_utils.c
index 74d41115c281..6315746ff08f 100644
--- a/tools/testing/selftests/liveupdate/lib/lu_utils.c
+++ b/tools/testing/selftests/liveupdate/lib/lu_utils.c
@@ -198,6 +198,16 @@ int luo_session_finish(int session_fd)
 	return 0;
 }
 
+int luo_session_freeze(int session_fd)
+{
+	struct liveupdate_session_freeze arg = { .size = sizeof(arg) };
+
+	if (ioctl(session_fd, LIVEUPDATE_SESSION_FREEZE, &arg) < 0)
+		return -errno;
+
+	return 0;
+}
+
 void create_state_file(int luo_fd, const char *session_name, int token,
 		       int next_stage)
 {
diff --git a/tools/testing/selftests/liveupdate/liveupdate.c b/tools/testing/selftests/liveupdate/liveupdate.c
index 2dedd5fc2534..74004e4276f5 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,53 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Session Freeze
+ *
+ * Verifies that an outgoing session can be frozen early via
+ * LIVEUPDATE_SESSION_FREEZE, rejects non-zero reserved bits with -EINVAL,
+ * that subsequent freeze attempts return -EBUSY, and that attempting to
+ * preserve an additional file descriptor into a frozen session fails with
+ * -EBUSY.
+ */
+TEST_F(liveupdate_device, session_freeze)
+{
+	struct liveupdate_session_freeze bad_arg = {
+		.size = sizeof(bad_arg),
+		.reserved = 1,
+	};
+	int session_fd, mem_fd1, mem_fd2;
+
+	self->fd1 = open(LIVEUPDATE_DEV, O_RDWR);
+	if (self->fd1 < 0 && errno == ENOENT)
+		SKIP(return, "%s does not exist", LIVEUPDATE_DEV);
+	ASSERT_GE(self->fd1, 0);
+
+	session_fd = luo_create_session(self->fd1, "session-freeze-test");
+	ASSERT_GE(session_fd, 0);
+
+	mem_fd1 = memfd_create("freeze-memfd-1", 0);
+	ASSERT_GE(mem_fd1, 0);
+	ASSERT_EQ(luo_session_preserve_fd(session_fd, mem_fd1, 0x1111), 0);
+
+	/* Non-zero reserved field must fail with -EINVAL */
+	EXPECT_EQ(ioctl(session_fd, LIVEUPDATE_SESSION_FREEZE, &bad_arg), -1);
+	EXPECT_EQ(errno, EINVAL);
+
+	/* Freeze the session early */
+	ASSERT_EQ(luo_session_freeze(session_fd), 0);
+
+	/* Subsequent freeze attempt on an already frozen session must fail with -EBUSY */
+	EXPECT_EQ(luo_session_freeze(session_fd), -EBUSY);
+
+	/* Preserving a file after freeze must fail with -EBUSY */
+	mem_fd2 = memfd_create("freeze-memfd-2", 0);
+	ASSERT_GE(mem_fd2, 0);
+	EXPECT_EQ(luo_session_preserve_fd(session_fd, mem_fd2, 0x2222), -EBUSY);
+
+	ASSERT_EQ(close(session_fd), 0);
+	ASSERT_EQ(close(mem_fd1), 0);
+	ASSERT_EQ(close(mem_fd2), 0);
+}
+
 TEST_HARNESS_MAIN
diff --git a/tools/testing/selftests/liveupdate/luo_kexec_simple.c b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
index 786ac93b9ae3..9bc8dab2e074 100644
--- a/tools/testing/selftests/liveupdate/luo_kexec_simple.c
+++ b/tools/testing/selftests/liveupdate/luo_kexec_simple.c
@@ -40,6 +40,11 @@ static void run_stage_1(int luo_fd)
 			  TEST_MEMFD_TOKEN);
 	}
 
+	ksft_print_msg("[STAGE 1] Freezing session '%s' early...\n",
+		       TEST_SESSION_NAME);
+	if (luo_session_freeze(session_fd) < 0)
+		fail_exit("luo_session_freeze for '%s'", TEST_SESSION_NAME);
+
 	close(luo_fd);
 	daemonize_and_wait();
 }
@@ -60,6 +65,9 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (session_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", TEST_SESSION_NAME);
 
+	if (luo_session_freeze(session_fd) != -EINVAL)
+		fail_exit("luo_session_freeze on incoming session did not return -EINVAL");
+
 	ksft_print_msg("[STAGE 2] Restoring and verifying memfd (token %#x)...\n",
 		       TEST_MEMFD_TOKEN);
 	mfd = restore_and_verify_memfd(session_fd, TEST_MEMFD_TOKEN,
-- 
2.56.0.218.g1ec904b173-goog

