Received: from mail-qk2-f3.google.com (mail-qk2-f3.google.com [74.125.230.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C0F3B19CA
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792265214; cv=none; b=V3gSrCLNF59HelcpWdrDGOKZywSo+MmM7zd94cZeiXNSlYs2i00hC6PCW1VPOy9tyLQ9Y0hw/81zkKk8OqOiRszFMnSEZlmovq2wjHPohQBExGSz61Z96XfdC9XOc0RyIAG0Ui+BKyZfXeoQzKhqVV6R97xtr0icNlCOpKTK3fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792265214; c=relaxed/simple;
	bh=ovgvca2sTQCkuo0abjJMCBhGt+FjMIENdXX+PywFOSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YTtB9knSruZNEbUIuqa8WWTredzBVyLevkkNTphcV5+e16i7oFw0JsoG1GT/rDR+HVh4VYn2GMCPXmcpa7qGmb27/y6ETdYFNWegC1Z0Je+OkTCDKzDo87k2XVZXVjAz/nWu7J5z3JHzdpCtI8HzyqfRTvk8n42OAsiFixRj1DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XkJQqIko; arc=none smtp.client-ip=74.125.230.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XkJQqIko"
Received: by mail-qk2-f3.google.com with SMTP id af79cd13be357-93f21bc9a5eso90325485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 12:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792265207; x=1792870007; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BMLx5qM62vWoOfAtAwn7HgXvltiKKbuv9z/3ifjwheI=;
        b=XkJQqIkoJttVjlzxdSKXNhVyfRpeRmuSBme19MXlVm88+ZZkE9iiO6AOgTlYDnd15E
         0oI5xLbLa8OSW46w/5ADarbGpN+o87ySEs3fNurOAqCWB0s5uUzY5PEGTu7q3KueNjZG
         whkUJPO7r1azDdHI2FJ0fYAx4MUvxYpl+19qpV295tOThfUa4UCEzLqE6mvUrnSu6OGP
         hf9cTaSvT4aMkp8tSlbp/ffPJpQycWk92UeqJSQ5TujUv8m6jTU2CC2/iM+PQldIxID2
         Q+8deHTaRftXXm7Fld0NAiQtuLQa+DH+VBqR6da3qmnxYv3QpEAMAktFY2UCblfNbkeV
         2CNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792265207; x=1792870007;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BMLx5qM62vWoOfAtAwn7HgXvltiKKbuv9z/3ifjwheI=;
        b=EyynbIKo1RAD8yJ+fRdYGFy8NMXH0bgQJu47z6LhB7Y5JePHIWzqcSKUIF65f2SLP7
         MDc9T3ilnE1UIScAWibf+iIPpIEVRFM6EOp2n0CVRBARB4Pvquh/sJtrcO+uyGVwKnin
         0YQyFfS5nWNUWDzy8fC5FlS1BhhtVNcT7WvCrxk7bDq8zCR/T0yKmDxVvWbpCKsJE6Kq
         IFQZMie6iLTQI3JJY1zD/o3yfgoeY2vmfDg4b0KALqvy6TCX5namv0PdyGD+B9yXR6Q5
         fcUVLv4QbL9tB4gavoq0Y66bKMaLvhW1Vhm4or90vc+nDJzhawG44ijJcMUbJ0QRCPVd
         3dIw==
X-Forwarded-Encrypted: i=1; AKwUvBzJ3j/m8aqpBTt0wqZ1a36EJ7piARqcUM5W93dBjbWPOLqZyOHjLJd9/rAQeEb3QJKLxHEuNMxGShyhecw=@vger.kernel.org
X-Gm-Message-State: AFq9FYISp8znY0qi8pUI1XyPmINTvjPFXd8YoCP9t8Yk2UUjC+0zAL/o
	HYUi12peJNIvP4dMGx7m83ktODBTzQbGhNpJhPEa1IVcsZWyuAz0ymWF
X-Gm-Gg: AYBFou1lrCIExW1ri/mOnlfXrM5URz/YWoJHUcZqy4L8XxcHNIEl68aWnqo3TbYuKdP
	9cBBSqaQ40fE7ZaF9GDhIcNPNb/na8anR4Sq7+TrphDGUSW7IKk4gMRkmVT1a/9w/QSkO3I2l5Y
	lit+QnTLYy3FZrnlP9fG3351YNHkrf1MTv6mwaBHThrnAcW8PG55WpvCt6qiWJqu9wmHzW7KLit
	ocnbU+uPYaJsiSBjS/wvsGI9NREJbqOtRp4keirj0GlFeBo/xPcM0tY4vvM6xKO98u7oNuA2ugo
	z/f6QdOqlbqkQchiF2i7Rqefe/NEzJnjFuYKOpleTVpkxsj04JXQ4u2LgYL2E0259xMExjayW4c
	E/h1qt2sR6P+4rZ4ilQ7eUJnrBQLX89zF+EtKhVRzx3zcNv4RxVoeJypwVMTwyM7hTl4TmWT2hI
	SS1bDhkHJHem9tkkJbKLQTTIk9Lbqui3fBtjjdXGyJ+Arh25kDpd2qGAuJdnaOhrp7MxEcKLFOh
	ngFCMY=
X-Received: by 2002:a05:620a:4448:b0:93f:22c4:e92f with SMTP id af79cd13be357-93f29d6744cmr621836085a.54.1792265206703;
        Sat, 17 Oct 2026 12:26:46 -0700 (PDT)
Received: from Fujo.localdomain ([142.188.41.221])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f29c5ae3fsm308636885a.40.2026.10.17.12.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:26:46 -0700 (PDT)
From: fujo <hooyan2024@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2] selftests/pidfd: wait for POLLHUP before reading exit info
Date: Sat, 17 Oct 2026 15:23:10 -0400
Message-ID: <179226499044.847.17334319321039510150@gmail.com>
In-Reply-To: <20261017054356.7874-1-hooyan2024@gmail.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

The CLONE_AUTOREAP tests poll for POLLIN and then immediately call
PIDFD_GET_INFO with PIDFD_INFO_EXIT.  PIDFD_INFO_EXIT is only published
from release_task() -> pidfs_exit(), which runs after the pidfd already
reported POLLIN for the exited task.  A poller woken by
do_notify_pidfd() can therefore read a mask without PIDFD_INFO_EXIT;
under KASAN the autoreap_multithreaded case fails this way.

POLLHUP is returned once the task linkage has been removed from
struct pid, which happens after pidfs_exit() has published the exit
information.  Wait for POLLHUP and check it in revents.

With this change all tests pass ten consecutive runs on an unpatched
kernel.

Signed-off-by: fujo <hooyan2024@gmail.com>
---
 .../selftests/pidfd/pidfd_autoreap_test.c     | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_autoreap_test.c b/tools/testing/selftests/pidfd/pidfd_autoreap_test.c
index 1c586482f..b4f3699ef 100644
--- a/tools/testing/selftests/pidfd/pidfd_autoreap_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_autoreap_test.c
@@ -149,7 +149,7 @@ TEST(autoreap_rejects_thread)
 
 /*
  * Basic test: create an autoreap child, let it exit, verify:
- * - pidfd becomes readable (poll returns POLLIN)
+ * - pidfd becomes readable (poll returns POLLHUP)
  * - PIDFD_GET_INFO returns the correct exit code
  * - waitpid() returns -1/ECHILD (no zombie)
  */
@@ -172,10 +172,10 @@ TEST(autoreap_basic)
 
 	/* Wait for the child to exit via pidfd poll. */
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
-	ASSERT_TRUE(pfd.revents & POLLIN);
+	ASSERT_TRUE(pfd.revents & POLLHUP);
 
 	/* Verify exit info via PIDFD_GET_INFO. */
 	ret = ioctl(pidfd, PIDFD_GET_INFO, &info);
@@ -225,10 +225,10 @@ TEST(autoreap_signaled)
 
 	/* Wait for exit via pidfd. */
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
-	ASSERT_TRUE(pfd.revents & POLLIN);
+	ASSERT_TRUE(pfd.revents & POLLHUP);
 
 	/* Verify signal info. */
 	ret = ioctl(pidfd, PIDFD_GET_INFO, &info);
@@ -334,10 +334,10 @@ TEST(autoreap_reparent)
 
 	/* Wait for it to exit via pidfd poll. */
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
-	ASSERT_TRUE(pfd.revents & POLLIN);
+	ASSERT_TRUE(pfd.revents & POLLHUP);
 
 	/*
 	 * The grandchild should have been autoreaped even though
@@ -421,10 +421,10 @@ TEST(autoreap_multithreaded)
 
 	/* Wait for the process to fully exit via pidfd poll. */
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
-	ASSERT_TRUE(pfd.revents & POLLIN);
+	ASSERT_TRUE(pfd.revents & POLLHUP);
 
 	/* Verify exit info. */
 	ret = ioctl(pidfd, PIDFD_GET_INFO, &info);
@@ -512,7 +512,7 @@ TEST(autoreap_no_inherit)
 
 	/* Wait for the autoreap child to exit. */
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
 
@@ -571,7 +571,7 @@ TEST(nnp_sets_no_new_privs)
 
 	/* Wait for child to exit. */
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
 
@@ -631,7 +631,7 @@ TEST(autoreap_no_new_privs_unset)
 	ASSERT_GE(pidfd, 0);
 
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
 
@@ -695,10 +695,10 @@ TEST(autokill_basic)
 
 	/* Wait for the child to die via the pidfd_open'd fd. */
 	pfd.fd = pollfd_fd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
-	ASSERT_TRUE(pfd.revents & POLLIN);
+	ASSERT_TRUE(pfd.revents & POLLHUP);
 
 	/* Child should be autoreaped — no zombie. */
 	usleep(100000);
@@ -799,7 +799,7 @@ TEST(autokill_pidfd_open_no_effect)
 
 	/* Verify child is still alive by polling the clone3 pidfd. */
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 0);
 	ASSERT_EQ(ret, 0) {
 		TH_LOG("Child died after closing pidfd_open fd — should still be alive");
@@ -813,10 +813,10 @@ TEST(autokill_pidfd_open_no_effect)
 	close(pidfd);
 
 	pfd.fd = open_fd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
-	ASSERT_TRUE(pfd.revents & POLLIN);
+	ASSERT_TRUE(pfd.revents & POLLHUP);
 
 	/* Child should be autoreaped — no zombie. */
 	usleep(100000);
@@ -884,7 +884,7 @@ TEST(autokill_without_nnp_with_cap)
 
 	/* Wait for child to exit. */
 	pfd.fd = pidfd;
-	pfd.events = POLLIN;
+	pfd.events = POLLHUP;
 	ret = poll(&pfd, 1, 5000);
 	ASSERT_EQ(ret, 1);
 
-- 
2.53.0

