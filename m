Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD885502552
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057110; cv=none; b=iU8ugmerQRWGxrbDJ5WKYq33U9m7AR6EGqDhXqT1RRbcvCxLEmpjU8Dr0bRJLvUnow+3vOoxZNYMR3aizdpHNK9uaSQ1vsg4vY8t59hP3LFIyLFrUf59UOUCMX9MwwG5kkOf3Tr4s1HbATw5T8/WWLQ6cil02I4bteUuIgI7uZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057110; c=relaxed/simple;
	bh=xGSW1HB9xuLPOxOviM6j5dkn3NfHltnvNZ07I548HfY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MK9KwUXYRhq3NQewlQJwdqi2tBSMqNOXaR/ys0rtNloIMAxfAimT0X4p01ffp1J6banINsdwNjX1VkV1Q6BZZRk0LO3uM4S0fe/5QbTgbFlPHZEBJlYeGYQ9EVb4NAjqZZNTQMiNBSMPW6x5vZaooXVnxycHWgECdVZXybo+vV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=Gj40T3WJ; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="Gj40T3WJ"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5ea93a316aaso43491e0c.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 02:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1792057105; x=1792661905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QvPtbhrFSm5FoNNWvwj4y3Q4nd03scqDRxnUx7itX/Q=;
        b=Gj40T3WJrU4PlZ0H6cGKc5KPdahOaeRHUgFJjxqL6gPGDKHpXBUAUxN+lOaCkuGIPF
         EcpAjnOpeqE8K9q7B4AeQ2eSThX9+grNnSlvq+abqk2e64aSmtHhE+Z57sucXn68K99Z
         vwYApeooPhk9TyeVXKEIzYiR41+2iZq6qs4irRzddLGssr4U0PYnDipLN0PFqYY75CQU
         kGRKLB30xfbnm8IZaJFP6ky9zS7DaLWl4zKTnOlYaV4/pqujA1fLBFAWlwY+DoNwZgm7
         PIDc+xwV9gOAG47506FO/zqJG1UhpvE94+E/iwpb8y5vRKZSeluxzsMY2BKr97iOwgQq
         XG+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057105; x=1792661905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QvPtbhrFSm5FoNNWvwj4y3Q4nd03scqDRxnUx7itX/Q=;
        b=UakNiX5Qio+f+TSn5WoxoegIngYY0hnw1JMyxTA7aKivzJPm0XVysk4C1/TbjBhpYY
         XwWSAKsmKKX1bPlatA3TLGh89jvENRwx8e4nAxYp+EQzSTvhdN1Ze+1yDn2Debngclu4
         ZDXlA6hTAgUwhnzbQFUuLZCaqaqM9/91JoUcXufjvrT8uzZY22g7eMsRN6pjAZAUTPub
         a2xMYDEJZF3bfhyNuLatI/We4K+hzPhLEeB4UUHSogUFQydbN+wLIOw2GQrbRVSKCktk
         TYPD+1NmlkyHwn1dh6XwbTSKhAxjQn/mUXh1FzlxtTu6dpdx7U6zEWVuFxW3lmtgvPhs
         Gkug==
X-Forwarded-Encrypted: i=1; AKwUvBz0GAEdsxyRVw8mpzWOPDYxNyu2ugz5f8F+NL7i8itr0LXOIwKYgtteDQYIFjkMjBNoaX+9vYoKnbkjr/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSEHt3XZHQAjK8R6wYHZL9n06/P0Y4nESzHu1AsLoX/PPqKWUT
	+MD7NJextWp2wP79On2j+4FnKCA2KteXKBr/D+KoSPnQSjexurQCHMEdjLnaUpRPsIo=
X-Gm-Gg: AYBFou2/Tw+D3XppOnmbQukay3FrPK8fiZEHGb8GYlbV7eEvwtIZeESgVccLDp93ONI
	2mE4tgjvBUaYAOeaRrofDq5SWJI/KztNYO8hMIcWWQN/OQab8LI3Z+d8s82Kit5HyaPXvs7CheS
	mgr8eXEA41PWK2/CLzx+mF5qFIMd26qnSG9muA00kaEC24CHfn3R+WejdIkcE/Q7oAJaUbu/z5U
	Z6z//FIf/Kl+LCp+wqDHPzS4553rec2nlGWFbd0t495su+hqatACebhaDR8ekSs1xmnaCgMbs+B
	3Huls7EYLEUnHVhi0Zm9JJ/duFUulb/6zHkMxBqgYEktsKASdJclmHTe16qp8vlSyMctsEL3R40
	Hmt2LybMFIIst/lq5SWmuvb7FSOJDnVoR1NHE/5AFw9ylfvT6fhm6cwEFATG2iExO7ufjdpJqwm
	QBeU8HsuDmPy/N/ZBVtkwIm68bRUzjyAze6TbG/v5KwabWeiO1yWn633jb2G2+dSc4sLFZ6WX5f
	TwJMPXPqaIUQVmu/OjlyEwr54VhGW0BgHEQEMq3ZWn+EZ/qrVdzqOj0zPD0ueoezD/cmgKZZpQr
	wYUWxfI6KrUo7UjGjsA/CDMAo1UT0cs=
X-Received: by 2002:a05:6102:c07:b0:7c3:873c:b3fa with SMTP id ada2fe7eead31-7cb36885ff2mr3914174137.4.1792057105254;
        Thu, 15 Oct 2026 02:38:25 -0700 (PDT)
Received: from soleen.c.googlers.com.com (16.49.199.35.bc.googleusercontent.com. [35.199.49.16])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003d37009sm12275672241.2.2026.10.15.02.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:38:24 -0700 (PDT)
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
Subject: [PATCH v1 2/7] selftests: liveupdate: Add tests for LIVEUPDATE_SESSION_FREEZE
Date: Thu, 15 Oct 2026 05:38:11 -0400
Message-ID: <20261015093816.2438942-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
In-Reply-To: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
References: <20261015093816.2438942-1-pasha.tatashin@soleen.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Provide luo_session_freeze() in the liveupdate test library and add unit
tests in liveupdate.c covering the LIVEUPDATE_SESSION_FREEZE ioctl. The
tests verify that an outgoing session with preserved files can be frozen
early, that freezing an already frozen session returns -EBUSY, and that
attempting to preserve an additional file descriptor into a frozen session
fails with -EBUSY.

Also freeze the test session early in luo_kexec_simple.c to exercise
LIVEUPDATE_SESSION_FREEZE across a kexec reboot.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../liveupdate/lib/include/libliveupdate.h    |  1 +
 .../selftests/liveupdate/lib/lu_utils.c       | 10 +++++
 .../testing/selftests/liveupdate/liveupdate.c | 40 +++++++++++++++++++
 .../selftests/liveupdate/luo_kexec_simple.c   |  5 +++
 4 files changed, 56 insertions(+)

diff --git a/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h b/tools/testing/selftests/liveupdate/lib/include/libliveupdate.h
index fa07fed083646..15a7db3a6b3e8 100644
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
index 74d41115c2815..6315746ff08f8 100644
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
index 2dedd5fc2534f..9de068f31c3ec 100644
--- a/tools/testing/selftests/liveupdate/liveupdate.c
+++ b/tools/testing/selftests/liveupdate/liveupdate.c
@@ -530,4 +530,44 @@ TEST_F(liveupdate_device, preserve_many_files)
 	ASSERT_EQ(close(session_fd), 0);
 }
 
+/*
+ * Test Case: Session Freeze
+ *
+ * Verifies that an outgoing session can be frozen early via
+ * LIVEUPDATE_SESSION_FREEZE, that subsequent freeze attempts return -EBUSY,
+ * and that attempting to preserve an additional file descriptor into a frozen
+ * session fails with -EBUSY.
+ */
+TEST_F(liveupdate_device, session_freeze)
+{
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
index 786ac93b9ae38..ab108c7f1d855 100644
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
-- 
2.56.0.385.gd3acb90ef8-goog

