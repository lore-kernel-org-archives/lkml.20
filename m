Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792507649;
	b=me0wvxgwr2Ab/2AFicVRI462KigyN8Ll1nFju45DtUTWABW1bTIGmlg4RehZn/6Cw0Lw
	 IpTrCJUzi2OE1nHR5dJBm9VpWe2jTcvvBouzm93E/WIhI9/0BYP7jvaTlZMveEDpV9yia
	 kTj8UFy8VxTn1fXKr2FSOAp0WJLLMAeNH/HzbOQFwuEOgzSt5Lkx6yrhs8anByYuoShDu
	 zC3yrQtuQupX0g5x5kWkyND/Frq9MvtFnozMSe1IFqidkSJRPKXA9hKzcFVruM5jqoSYG
	 vBGtb1IXcMmNzqslGCfL6mDqN+ZreV2F+y4WYYoYTKjeHWarXx67kc8DJjH2ivtwklw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792507649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8BnGO4/42KiDK1q900mgIYvccBVIMN3QrNthvM/m5KA=;
	b=qCUauQpkDmq+zDUHZJk7cm5eil7G4NGphmHVFFQoYHeUPFeMykGx+LAtAQ4LEW7HybUq
	 lyjHvW2LrBOYQ38cdk9sOfAmRSgKZgIUCroAq/xW4BrQ60dtzU7/vD+q1aTmSsSRpKVQP
	 ax805b5h1XhIVE2Vl4yu+/s2S59ANLzzjBjToX/hF00AD9BU2WjvPm2H6GcnfMaps3giR
	 IMoR9c2ZTOklhdFkf6w5AHirKNCrcaZd0mQju2JMhtjTIitdcBZzK2ezN0i3t75i/AmDG
	 rx+wQTdBb8RRWrLv90cN0pWm9Qvcd40jbii/GFY3Hjp/iCPJmA+WSP0zoUpONDkAn6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RjHbqNNn;
	arc=none smtp.remote-ip=209.85.217.53
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF699606A338
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 14:47:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF699606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=RjHbqNNn
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-77bf892b496so830937137.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 07:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792507648; x=1793112448; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8BnGO4/42KiDK1q900mgIYvccBVIMN3QrNthvM/m5KA=;
        b=RjHbqNNnRXOUwAzaGsC8B2dAL9RvpcNhU0+ZZyi0KA5RvjgvaMWDASTQt5fhU53TCM
         Ckon4JHOuy3SyVOBkqWP9Pozi/eRMZX0U1iv2HLN//OO+25gyvfDSKCHA6WbURsq3z/o
         onJtgPR4vwu0N4R8OolkhfDsA7pLh9qbT2m4LaKBMpKZ947XRJudpYIF+Lgt1oqMPxxu
         Lw/ngvdWBCaP/j+yLAN9YcmVSILZPOXoHT7vFdmzheunWSnHveRWSoiQ5MFtbUCuhOMk
         eLDNZxJ4YRjLVNvV/3wLYvLMHVa4cMx1WpoarMHnFZ4Fru6k5Rf91BZ4SQUTTfPnlVMR
         adTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792507648; x=1793112448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8BnGO4/42KiDK1q900mgIYvccBVIMN3QrNthvM/m5KA=;
        b=ydrQENGTBb+NwYlYPp4f3C8ipbYwzIHZVphuy1OPjM+bjMuIlpI8gCskpFAih2aah+
         MIDK9opFcM+TGIx5kNHaZ/0Z8mhW32umNdLhPGIxF4MpWp+1CdzM3J+WKT3Tvv2X7lfL
         IPeKSRprTaMa4pGbiJaJXMSELMAFfgLxdPHqZUTp64/+42QRNaG8x6MK4FZRi9vDorWS
         jeKRqVXVrpm0KAfxC909VLyAM3P8nZeSOjCRks0a/du+TDOnxHBZYpdXwa8yNGplFN4F
         A5476x1SfvBhiVVr2tKFUq/UUOJ72lGYKlb5Lq6F5g40xdDt1etxX5F4k5zKmYOSZcA6
         /TkA==
X-Forwarded-Encrypted: i=1; AKwUvBxqjWguxdZYf0xfdEbY3cslHKpplvLFprNqEvqj2yqoYJYDAbLt+pYsfSw6aJwFZL05a9LI52mj9m3vy50=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbuxxy9zxn4W70QusAbjdyqC7J2FjQp1fVubCTnILnlaUJ9Di0
	GHXbYIQoXvXseHMCXVautyHQAtpOlSuw1InPCl1Wcr1L7S3t+0oQs+2NTMDlEA5LWWM=
X-Gm-Gg: AYBFou1hAoNr42NH+soO5yoeH5tijkRkhSR3dkOb4MvHRmyeNfl9nEykMwg5C9UUdVM
	9J9WymP8JNZ5Qc/AsIxIkU+1QyfXGsmZfTd+CQKvc7a0E8fzThMzB2NKlt/Gm++pK/oE3LaN8k5
	RSkEhcnx4uxcY/aW5cGJQmoHyDOCN5RCPluri2yDSLMqwU0/9FXq6ym6BG1Pig1vOW3xnkZ/Le3
	ybjDomHxaxBvgXHsVttVNe7Koeox0Fr29aBs0kCW//7YJ6bWyiES5gHMCBvNi3ZJTi5iH/yOl2T
	nToV1AD3k9DimnrtGXofZHEWBESFF5OwuWgjRdLr0vnXZQbfQQy8ntxUqu9Jlg2nddiwc+DNqJk
	aF/PsDqdDo0ZgmwD4Kw18Q3xBUBOVl5apWozX6FWOKlLjf6pu6sgjBbTE11G94SQRJEo+09Jie5
	ApKA+e9XGtcbClm8eCQL/oV+hHLdkqVTygxhL+Hr8M99UNTgoGXMc446iO9ypMd5oEF0SPIL7lU
	ia198OuYCj2XGMHDM9OM3hWllMpdx+ht3gIVugKdP7PRXZ9/GMkY9f31SuuZdnEK1pfvx+SOI95
	yN/pwqkLg/IIQmRtfeY=
X-Received: by 2002:a05:6102:4487:b0:7cc:1045:610 with SMTP id ada2fe7eead31-7cc36ab3f59mr2581207137.27.1792507647537;
        Tue, 20 Oct 2026 07:47:27 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ea9b536ccdsm12920421e0c.13.2026.10.20.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:47:26 -0700 (PDT)
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
Subject: [PATCH v2 2/2] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
Date: Tue, 20 Oct 2026 10:47:04 -0400
Message-ID: <20261020144710.4154339-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
In-Reply-To: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
References: <20261020144710.4154339-1-pasha.tatashin@soleen.com>
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
2.56.0.212.g129ede20d9-goog

