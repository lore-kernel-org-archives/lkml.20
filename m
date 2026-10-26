Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792979395;
	b=3PqjVZtBlj0WZyGHNVMb1xsNMhvQEBO1RcL2sYTgU8f/AbHcLGm+T82uQtq/Q4wXX+zD
	 u7j9Cwv19KSqOsoUQXFh74oLIjmmsx3jZ0hnyscV/eust7JALN3erVb4VYmaMby1xaHPZ
	 HLWCQlGfHx2ZEW1mvzl9IC2d29P/TJC7gAwzf+AhnH7MWsrNh4mFmd7p1jOa8cALe8rhw
	 x0YWOmvVwr3iC8Rf9aZq5DjyqvxTW6JMfQk3gcZ6KatosbhbvTxZavn4Q7uAQJbmuY0Mb
	 64O0HG7QPK8qvGiRUhd+N/UeO4e9CBFMG+uwIC6p+waXByeE1kvRFghX7sBlepoM4zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792979395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=paepyu+lNzKcCGz2xys5Lce7GHF0FgZ1jCDDvPB5GKY=;
	b=je1bExT/iHFI4+XhSa2bHIkrfviRTWaE7E1z8hXzTG60GOA6AmoLwVMFdCVJU/djKk0G
	 q2uYpcdsjaN2TOkM8W6St8RvWsOYJSasU1m9VtdHuuQW/VFGwTr6Qu3bK0QeHDc7p/BFU
	 bVFmL6bRg/oDG43hwskfwhMrvBoPH8Du1nALiOaNLQzMvESSvJclHJQ5WV6fZ6wehwBqe
	 WGaATNyatBSDCzjvVaBmqXewap/K1wu3n07/HhNug7mxXXULQAOdT5dXHR/AvZI/VHkHy
	 YiT7bQEbup7J6/pF1jExzI1jyqkVTBMfGJoifsRsK0wDFpQsooGWU1xqTvSdiSZbD4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Iiv7giGh;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B36C606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:49:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B36C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=Iiv7giGh
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7c33cc572e6so2233465137.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792979394; x=1793584194; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=paepyu+lNzKcCGz2xys5Lce7GHF0FgZ1jCDDvPB5GKY=;
        b=Iiv7giGhBsVGDol1g2kcjcx1ZNxgJJlG5stlPsq/vFNxYfXp3+5IKnGYyEIqP8Xkff
         5XXcv9f6oSlQmddf5TGe5SY0sHXRE+kyvkjoMeprLuxBhKA5shYPzAoYZw3xsSJUXHf1
         oKzroWa+dqf1/MdmTWW76Vwnl19YfRVdgujFAB+xypvL6FgowvhceZOnSwGQWAlP9vLS
         qto6LIjj0zYnGFSyB4jY2NzF8TMaai1UFS/QHtI1UvHaBLK4Ac6fxrXEwwA6FiK3kg7D
         nukDI1FpjAglZ4AI/iy3H2fQlUZyhJq86cV5lNm2Ki7nUZbF/5kNZNJpaSltDZ4J+DST
         qUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792979394; x=1793584194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=paepyu+lNzKcCGz2xys5Lce7GHF0FgZ1jCDDvPB5GKY=;
        b=nrHQYkLCXaR86iCOljmYnfgE7gK8ALqQDUV2cwtHOyt3wOFOQkZDpfz585DEah2s31
         RnD9sRccz4JS2RD7stEdtu3kZuQuwVw5IG4OADFmDwGJwCWyHONHYz4pNfszZt6TY0Il
         4sk1Fi71rhvPgfcqwzIvDV7/lkYEz2VU178f1YjQWEfPC4VY/BshNfd+utWNgl4rRnCf
         n7ke6KL0dsudUgMaj6bbxw7kbzRqmIHLCgkk34CxyRMCEWHZtKL/d+HVZSZWYb8kn89n
         55l4yVt2Tnrq1zYY87GQy2WPiYPOvOjUitOsislvXLyzGDuMx7MhD/szrmGRoept0fG4
         94SA==
X-Forwarded-Encrypted: i=1; AKwUvBzgunnM4T38DbuAEQtUqq6nl8vy4L3MnV40X0WjVABOZZoNzQDxFvPnZfSzFXwQLYjeR5TXWs+XCZ2IHlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIgqOGH4pG/ohVwR6DdMRwkaRnfe2Xm+A0jREtbNMrA/auVOvMj
	wFbbbVviYbxCRIPJnVldTSG+LHDLOBJc11Sd9T5EMWXNmspbfwAs4Ogj9O/5kJn7L0g=
X-Gm-Gg: AYBFou10Mmel58PvPN6qAjPYV6NsDYnYV8PqI7Cfrqogv/O5eYqg9kQjdT9WtcTxgZF
	kP9rCJQTzx6McLaOtBaGiQ2O61QQjCCApfGIVgy+qCOS5SOWrTRCnaP0EhJM/tCB2hT7YB8Eu4T
	WoHyMtj0/6Bv7klQU43kcVFP9PpA2MJtou4QBV/IKE1ekQUPKRvcemhdUo+0LW1uqJfbQqi2oZQ
	CELvfKPtj6QVFWasTQCHEhcrT4iFGhsXP2o6eIz5o9MNm7U4JzircpDY2oGCcmPAtYoe+EMdPOf
	bdEZMm15xhByTRxts03lqtpzqgJz8YkTwlvPQtjq/MW+e28qGvMJFyBVDCC/nEOFIPLjAqDwuf4
	+XANb0Ya+Iad/gBC/ZhJ09i3wSQ2gSFEX5CGcBNARaQnLos/QcmhIqZAVat5p+9Few3o1BHuyD+
	YexbuQb9xWc14nGNmoudk28nmH5aLB+B0LX96iMFuixVMWT4s+YdjAtH+MRcqxLM66pPSZZeRrN
	h9qNwvlEFJkWJKD1H6RiO1SsEybwRZ8bcqnQWH7R6q67KqtCjba9+nOvLRGnY8Hnk4SEjbQ86GY
	sucP85VCPELX0aX59aE7Qe0xVhrTJYAlbyYhdUgGPjyHFqhy47KXJb/c7R3VvFOgTTMvB2kAoT/
	fiA==
X-Received: by 2002:a05:6102:290c:b0:7a5:673f:9a37 with SMTP id ada2fe7eead31-7ce5d3e4c67mr1068887137.15.1792979394230;
        Sun, 25 Oct 2026 18:49:54 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7ce5df73970sm6099917137.1.2026.10.25.18.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:49:53 -0700 (PDT)
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
Subject: [PATCH v4 3/3] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
Date: Sun, 25 Oct 2026 21:49:46 -0400
Message-ID: <20261026014948.162559-4-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261026014948.162559-1-pasha.tatashin@soleen.com>
References: <20261026014948.162559-1-pasha.tatashin@soleen.com>
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

Add a luo_session_freeze() helper and selftests for the
LIVEUPDATE_SESSION_FREEZE ioctl, including freezing a session before a
kexec reboot in luo_kexec_simple.c.

Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++++
 .../testing/selftests/liveupdate/liveupdate.c | 45 +++++++++++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  8 ++++
 4 files changed, 64 insertions(+)

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
index 2dedd5fc2534..c27f57eab870 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,49 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Session Freeze
+ *
+ * Verifies the LIVEUPDATE_SESSION_FREEZE ioctl on an outgoing session.
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
2.56.0.307.g5fe7bd680c-goog

