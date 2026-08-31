Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE767488210
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788185125; cv=none; b=omhXlK1AaiQO8PGOrdBSOmg9FZr1/3ExM0A4AWppVn6CQzOW010VvCChquk0r3zmX3SYdqV9gjYKRTHlsAVUJ1gFRfZzm5AdNoRe6WgLgvNxVLlsT5P0pRiBdowJwAO3+G6gXHHcyfu3jN6q9fTOFOhdoyxAIo1N6SGO6xzKWos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788185125; c=relaxed/simple;
	bh=dMgH3SXQVDef4+TvHTl+j6bjZM2Hmn9mYCLR0gMCleA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aIydh5U/YxbpMJvLOPeYUd/cTqz2+vh572ks1vfkAWl4HtudpBpCQc8+vwC8gwmET9zYOEsC5oMaNnr36SggimMGnDLJ/x9ZYVF1zvMOu8X5JM7t/C2lPPQy+j9G8UbDT03m90W3y4OFcMRVXmlhCqxHGQj6AN6H6NnuqfRzRIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yds0rmmQ; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yds0rmmQ"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-97c7afa485bso1829829241.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788185119; x=1788789919; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSG1bwsrNLkgaczjFVkO4Fp9+89s6DMBG6R8XlunJWE=;
        b=Yds0rmmQ9DmcJYt68JwBC2XePECRWxVNiREj4etor9Fx5JPVgyIhpk32EMrOAXmhdq
         VnULMwQ4JBgq28iqsVCIF5iq7bmOjkVqEOkxkOz9LN6+YHPhB64NcqjUPiNTMa4iJBQh
         elXDQgrLZoK7MZEoe/tRuO8k5zP5i80Y+WzM7MXE1w7ElzvW1x2JrafF5mUOEIhey7ut
         IUQkWNDvl3K+/yq63bEBP9VOq+dN2285tNQnkWhlSTVWGCNOMmbULGhZCypvsRJ6ntre
         W2MU9OLBdb0t4ArqbczFdPBCVkQd24A8Y/pILGGOBoSBKi9c11ZV8DA+hqWm2PMW3+WT
         ZNwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788185119; x=1788789919;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GSG1bwsrNLkgaczjFVkO4Fp9+89s6DMBG6R8XlunJWE=;
        b=dpw1zzzz3hYsIdjtoRU8KjuGA92t0t94XgrBipgqIgpnfHQpaS+xQEAgPGjlsmOMFp
         NAmN9m53uXPaj2HFIPaeFWDngNYeWmIyuC0PJprochOadkZdwzqVt4peevoE7N4BtJnk
         LUd8zKc13K1HYAeCVDPxUfcKgA/I4GxzCTNOzsLxn6bEQsihniIjZou90pyD5qVKuZhR
         R6NbodZUHv9eAdA7Ff9ajqnKw55HJ8dcjv7IOYOsiHhWbGvyO/giDtugOC/u0YzUXGxX
         FV5fg7GwTo585ht9ty+R24PHxdvTuwZ5CDLNbAxPqF81WkMe7UnPWK1RQgHMYOhMyG8y
         kLtQ==
X-Forwarded-Encrypted: i=1; AHgh+RrniTRoAci+CAFXclglBTl+o8FS6t/GYSt4ijqcAH4IDb+uAWzMO7NL9SZ34jBoTltrHjMuGnolSGpNGf4=@vger.kernel.org
X-Gm-Message-State: AFuF++mXa1dYupRo8SXTRgiPki1i5G5gaO2pBzOh7WEEX9jL/dT744HC
	Mo++sjOFlLC3P8l1G3yKHBt0l7yMdF7/DGQe4EbqLY0CQyh4L96EVdvl
X-Gm-Gg: AR+sD10sKsIAdKWBHSlVz6vqDON2R+RsRQbh6ONYOpS2JW53VLkHz2G28nXqbvilEQ/
	4LZvGzOL3liZJx+9Jdvq4/GQFJHnokmXq0gaqqtPXaloZ7mj/IrMBjPgLWJLICARisKkuSNk8A1
	PP96I0BR4WytfMfRB1YrB+AxNlGFOWkT+WhQAmb3DdtWmUl81KoEWgv0aVBOm5yoevC2nnle4Pi
	z6/oVcBEYUMAfIPOAC23oyLBqoXerbXon5TzYzQXQJabICfd8U5j70334+hOaFh3I/nyBmU38h4
	H2bOKc5afdAocE/pvaKRv4u2j0sr4PHIOJhMvITIZAkkfUTGZK8nKw33gk/iHYr8KTBiMPKqT+p
	SceT6GbyDt6F7A5JbwiYdF6d7985QNl8erLTig6+P8ZAMpX8IpLqiJiANkmHBj2HJORpNkLQu/i
	YonKtjOm5g/2Y4kbIIxTxH/bwdxGjs/pG83GBlSu8kYVkSiKPmqwbLpA==
X-Received: by 2002:a05:6102:41a3:b0:786:c223:ad84 with SMTP id ada2fe7eead31-786c223ae87mr6874119137.9.1788185118532;
        Mon, 31 Aug 2026 07:05:18 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-786b21c60fdsm5718410137.12.2026.08.31.07.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:05:17 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Elizabeth Figura <zfigura@codeweavers.com>,
	Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH] selftests: ntsync: add wait termination edge cases
Date: Mon, 31 Aug 2026 11:05:12 -0300
Message-ID: <20260831140512.136118-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The existing tests cover timeouts that expire while blocked, but not a
deadline that has already passed, and no test exercises interruption by
a signal even though the documented behaviour is EINTR. Also extend
wait_args_validation() with an invalid flags case.

Add coverage for:
 - an absolute timeout in the past, which must return ETIMEDOUT without
   blocking
 - a wait interrupted by a signal, which must return EINTR
 - undefined bits in ntsync_wait_args::flags, which must return EINVAL

Tested on v7.3-rc1 under QEMU with CONFIG_NTSYNC=y: 15/15 pass, and the
two new tests were run 50 times each at 1, 2, 4 and 8 vCPUs with no
intermittent failures.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 .../testing/selftests/drivers/ntsync/ntsync.c | 96 +++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/tools/testing/selftests/drivers/ntsync/ntsync.c b/tools/testing/selftests/drivers/ntsync/ntsync.c
index 1f0dc43bb4c0..7d944e2a9094 100644
--- a/tools/testing/selftests/drivers/ntsync/ntsync.c
+++ b/tools/testing/selftests/drivers/ntsync/ntsync.c
@@ -11,6 +11,7 @@
 #include <sys/wait.h>
 #include <fcntl.h>
 #include <sched.h>
+#include <signal.h>
 #include <time.h>
 #include <pthread.h>
 #include <linux/ntsync.h>
@@ -1381,6 +1382,13 @@ TEST(wait_args_validation)
 	EXPECT_EQ(-1, ret);
 	EXPECT_EQ(EINVAL, errno);
 
+	wait_args.pad = 0;
+	wait_args.flags = ~NTSYNC_WAIT_REALTIME;
+	ret = ioctl(fd, NTSYNC_IOC_WAIT_ANY, &wait_args);
+	EXPECT_EQ(-1, ret);
+	EXPECT_EQ(EINVAL, errno);
+	wait_args.flags = 0;
+
 	ret = wait_any(fd2, 1, &sem, 123, &index);
 	EXPECT_EQ(-1, ret);
 	EXPECT_EQ(EINVAL, errno);
@@ -1471,4 +1479,92 @@ TEST(wait_any_monotonic_timens)
 	close(fd);
 }
 
+TEST(wait_timeout_expired)
+{
+	struct ntsync_wait_args wait_args = {0};
+	struct ntsync_sem_args sem_args = {0};
+	struct timespec start, end;
+	__u64 elapsed_ns;
+	int fd, sem, ret;
+
+	fd = open("/dev/ntsync", O_CLOEXEC | O_RDONLY);
+	ASSERT_LE(0, fd);
+
+	sem_args.count = 0;
+	sem_args.max = 1;
+	sem = ioctl(fd, NTSYNC_IOC_CREATE_SEM, &sem_args);
+	EXPECT_LE(0, sem);
+
+	wait_args.timeout = 0;
+	wait_args.objs = (uintptr_t)&sem;
+	wait_args.count = 1;
+	wait_args.owner = 123;
+	wait_args.index = 0xdeadbeef;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+	ret = ioctl(fd, NTSYNC_IOC_WAIT_ANY, &wait_args);
+	clock_gettime(CLOCK_MONOTONIC, &end);
+	EXPECT_EQ(-1, ret);
+	EXPECT_EQ(ETIMEDOUT, errno);
+
+	elapsed_ns = (end.tv_sec - start.tv_sec) * 1000000000ULL +
+		     (end.tv_nsec - start.tv_nsec);
+	EXPECT_LT(elapsed_ns, 50 * 1000000ULL);
+
+	close(sem);
+	close(fd);
+}
+
+static void ntsync_test_signal_handler(int sig)
+{
+}
+
+TEST(wait_interrupted_by_signal)
+{
+	struct ntsync_wait_args wait_args = {0};
+	struct ntsync_sem_args sem_args = {0};
+	struct sigaction sa = {0}, old_sa;
+	struct wait_args thread_args;
+	int fd, sem, ret;
+	pthread_t thread;
+
+	fd = open("/dev/ntsync", O_CLOEXEC | O_RDONLY);
+	ASSERT_LE(0, fd);
+
+	sem_args.count = 0;
+	sem_args.max = 1;
+	sem = ioctl(fd, NTSYNC_IOC_CREATE_SEM, &sem_args);
+	EXPECT_LE(0, sem);
+
+	sa.sa_handler = ntsync_test_signal_handler;
+	ret = sigaction(SIGUSR1, &sa, &old_sa);
+	EXPECT_EQ(0, ret);
+
+	wait_args.timeout = get_abs_timeout(5000);
+	wait_args.objs = (uintptr_t)&sem;
+	wait_args.count = 1;
+	wait_args.owner = 123;
+	wait_args.index = 0xdeadbeef;
+	thread_args.fd = fd;
+	thread_args.args = &wait_args;
+	thread_args.request = NTSYNC_IOC_WAIT_ANY;
+	ret = pthread_create(&thread, NULL, wait_thread, &thread_args);
+	EXPECT_EQ(0, ret);
+
+	ret = wait_for_thread(thread, 50);
+	EXPECT_EQ(ETIMEDOUT, ret);
+
+	ret = pthread_kill(thread, SIGUSR1);
+	EXPECT_EQ(0, ret);
+
+	ret = wait_for_thread(thread, 1000);
+	EXPECT_EQ(0, ret);
+	EXPECT_EQ(-1, thread_args.ret);
+	EXPECT_EQ(EINTR, thread_args.err);
+
+	sigaction(SIGUSR1, &old_sa, NULL);
+	close(sem);
+	close(fd);
+}
+
 TEST_HARNESS_MAIN
-- 
2.43.0

