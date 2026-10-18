Received: from mail-qk2-f9.google.com (mail-qk2-f9.google.com [74.125.230.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304483E49F5
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792342215; cv=none; b=ntPiJD3LVpgRN2qPm9Cak2gulEMIsbferCRwV52pdXOkwyEmjw35+ndD0Za8gpHY3spoYMRovFSifd/dfO0zm/hvmHl3s4anB0jHte8UzSMVgfFhLCACvmjHCwmOGrtiGkGBRm3fMSQR0nDkpNE8jcdAmmMmyB21YY4cfFEWhm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792342215; c=relaxed/simple;
	bh=7h/r53sko0vSWudiFtojFrTuAikIUnp9ZdZ+WcOFHN0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oE5Q6US6oVjR8s8mvNNMPAaMf6XItnqMoTNG4eNyh8F7v/eOcA0uQIYmDFJWD9UQjpYqJvyJE2r0UcIVRbx7Ynsknj7jfFYHYYPzBOQDbhb1VzzpKkf3fOBIsraxrqAOnsO99PgIA92tnuVO4QykjXvtbEjJFsU7lAwVn2M5J1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muWVtLgL; arc=none smtp.client-ip=74.125.230.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muWVtLgL"
Received: by mail-qk2-f9.google.com with SMTP id af79cd13be357-934956d1044so116648685a.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 09:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792342213; x=1792947013; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mf2HSPqnvA1xqXGaunmqORu34n5mJLaiCiNFi8iI+e4=;
        b=muWVtLgLgbDXCSWB9xP6TsM2bbYdm3UFxT6ZUOj3Yvy2burKZufhfrk6YvhDKJjMsj
         Qia5eIJPkBC2/Y3+spnsi03k3jz5VX0accQ/Prp1dIucDGskvGXJpDLVgVbaf+mxPwms
         K3Pd7seF/l8CjLNfHtOtai2G8HmbrHvQxm+tNjtaW8C1xDGn7CFRj16/emSplWkNl3Fp
         V+o6+UVJ18KUI454IsYT3nz/SyVjGu5HGHGUBzTT4+vljyeMyVzGANnIvukgmIC9mO6m
         KDetqa3+vg3X81hhD4S52fJEMP/Xxl2OPrx45kP/PdRzXB/9iXCQqG2Bu7NoT4CG3IAo
         QsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792342213; x=1792947013;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mf2HSPqnvA1xqXGaunmqORu34n5mJLaiCiNFi8iI+e4=;
        b=g1SxoQ2Py9eAeRJeqt1cvadzk6K6xdKXwE2Uf9T/A72tFMb48KBy/Bt3QWc13b9zSC
         vxKEA9o3zyDB7fs81ZMj2nKqATwDDz5WV/ltH1QNPBV+zZSZNuxEgCMLBt49AWfTtzJF
         CDCnaTV1cLv6gCAaYTTIDcvOfBCajdUe0cE2fYJdV9g82wNRaYCb5jo7pBvsys1tlCd1
         +1Tw+9SPDEWQa/lo+75HWPaFyRv9O48UQK2atO2kwJjN/hKR9E8PFvBg/CwSa9eD98TW
         FuheNergtwyjPaP5/S5lL1JQaXJi3fa9LnhAfCb0Pq6YHCGrjbN+NKlyNitlKYBIxHLC
         2jIg==
X-Forwarded-Encrypted: i=1; AKwUvBzfVP6acq3CIkQg1bZXF3pwprYdyLJkO2o5E8oJacrYb7rK8m9MKBC1Zp3s4BkDTLJnEX7zUqdzCHSHo5I=@vger.kernel.org
X-Gm-Message-State: AFq9FYIW7ystLAVx1zjlwca4P2GqKRqGVZ9idZGvhSpNhAMH4pqRuDR7
	vmmwkfj7tHSqtLIX0cYKSwkk3FS6pdwSINHnFC9HfHUnvqxQl/pwLn+N
X-Gm-Gg: AYBFou0gjsZExGQGrXVJJxl9QcVuUpZV9bWOYmcgBdRSM35weXccYZJy8Q8CxxzlAib
	JQ6mGdn5WO+vQ2oNeWrF8GlPIFkiUpjIbSUvDJIRhUxwPNqDlbzlZSP47tXyEcvpsXJKzQEYlhv
	IdeWJKMfWEMqANzxeo0KairjuGrA4xioj8+X70H817OuTIyZtv2E4OPDw/q0z13M072Ywz6NP+O
	enNeHMbYaqR/LHI7HwZHd6hpnM0O1Q1iJw6RAHCFmMRGgkzytk6ZXhYjK1lIfCdL/WR9mGaVSek
	tOlBDK/PHyiawAqSlVRE56uQgYhrGQhTx+1RrBcfDFxbU0FXdjN1iww6obqlAzMqZNmp2mgO/wn
	+i72ylMVIC256Ay1ulCNL34xHrk7i22C+i4tH96U6QzE2+REVaHXQtVpXyL3VjW1ExPJHiTcMil
	5GFgAcT0dqDoD6Px/6W4yv2wTphFMZiMWCjogcagdWxLiLt8A64yZizw0GrelJfD8lCoeHxSDEN
	WUljV4=
X-Received: by 2002:a05:620a:3903:b0:93e:fa30:f1dc with SMTP id af79cd13be357-93f29db40ccmr780679285a.72.1792342212904;
        Sun, 18 Oct 2026 09:50:12 -0700 (PDT)
Received: from Fujo.localdomain ([142.188.41.221])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f1a1688aesm740116685a.8.2026.10.18.09.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 09:50:11 -0700 (PDT)
From: fujo <hooyan2024@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] selftests/pidfd: wait for POLLHUP before reading exit info
Date: Sun, 18 Oct 2026 12:48:50 -0400
Message-ID: <179234213014.649.6368924662349703640@gmail.com>
In-Reply-To: <atTy6LziL5fdGTkn@redhat.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
 <179226499044.847.17334319321039510150@gmail.com>
 <atTy6LziL5fdGTkn@redhat.com>
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

The zero-timeout liveness check in autokill_pidfd_open_no_effect keeps
POLLIN; it verifies that the child has not exited yet.

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

