Received: from mail-yx2-f10.google.com (mail-yx2-f10.google.com [74.125.224.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B4339EF12
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181388; cv=none; b=Epo+TzqI4PlvrT52F1xazH5U/tPPoHMSLu2jMO6OqOhySsEuUlNgTRiWA3H6Au0BybYOQo/azxrjLu84X4AA1gczi0OcE+jC5RYu8qhnT6sjP9saoC8dZsPX4o8gkoQhJ89NkydZSYT4B8uuOmCJraIFxPY25UWKu0wavxEQfpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181388; c=relaxed/simple;
	bh=cqDDPS3cYLtnwCkJsHXJQJBfCWV8CGvTznOW39lWS4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqTNxVMeOnVLObNF8FcqjRJZC9AnioASCAxxulyPYOIQr5QsTsDprxdkpHjME5bCpLHIAn64nFu8AEPwrYWoYM6go/ZCb7WLmEX+KuSurYuGP2YcjgXvxye0hUKL8ychjPVO8vdmf6pwswLX8LminU1mQnQK7XKu2zLCPnSADNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev; spf=none smtp.mailfrom=northecho.dev; dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b=iw6I35BX; arc=none smtp.client-ip=74.125.224.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=northecho.dev
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=northecho.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=northecho-dev.20251104.gappssmtp.com header.i=@northecho-dev.20251104.gappssmtp.com header.b="iw6I35BX"
Received: by mail-yx2-f10.google.com with SMTP id 00721157ae682-85e68cd58a3so87947b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=northecho-dev.20251104.gappssmtp.com; s=20251104; t=1790181380; x=1790786180; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lgMfR/OpPXnvvBLqscXmXIgkpM0twhM7DvthfQZhSoo=;
        b=iw6I35BXyur708fjk3Q2KlD0EgHBfBbC2vJtlut7CxCThPCv7ppeRzyQ2AOafljU5f
         eMRMJJE9Y7ECYrgYiv1P3kWHsv96LnK7qUFBIjq3NESW7FaWjOR+vHexS/ukJbSTnB4M
         Gxs9OC1FzNDpxfyxgy+UxqhJ6UQq1bmQFG4WcRYiZZMirbxbOQXF76uruvAEn/Lbx5IQ
         LBF/ymflYLO8MstC/oUyqsi7sqZnTIEqwY6Nz9EIY+c4XURCBFa9XGGZHIDZ1ZOwqO5C
         dJlZzfncgzjVnrdMVKZUTJp3ZmFCqGpJYFZWv9BSANXWvSal+bwGhOdQOVmoPV/TAhFM
         ULRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181380; x=1790786180;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lgMfR/OpPXnvvBLqscXmXIgkpM0twhM7DvthfQZhSoo=;
        b=DTc31DD5HPpVGXD+zBB5+OONqwHSjHmApL0s6xkcJugn/Db8LV/kyxsyir2g2Uj2uO
         t8BREhOnWtiNMHSX1/pSOjJSYnmOiw5xxi+SNoCsER6OSkbcwJYTjHmKAnfCBlz+7Oqa
         rqYOuk5xd3srZBxskAfOTnvTX3luw7SuIOgceZpHvHBI4c7eVlzPPRNADkH0CBRZ8U14
         VasRyHOec57ul6i2hc5b4m7Y5RriIZyJFrV9WzHewdimSlGcNBoy3FqJAl4UGYM25lfl
         CINzBBIikpJUWgjjtyf00v3IQWETa7wZGYu3ghQXHLZX1HfLFI+/fN9LG634iz2cuuuX
         wJeg==
X-Forwarded-Encrypted: i=1; AKwUvBx5XOv7MZBFNoRQXPO7/3jvIrFo7sQfRFgaMaVDkk4puaqLHXsHuA+kXyU+O2kdUbQ6QJeRQ//JSRrsySk=@vger.kernel.org
X-Gm-Message-State: AFuF++nMxR6H4PrAWi1Ko38yBmw1/6gSLiV9ZI9jWPtTrPL10FRgXK18
	xvvdsXqCWNNC8Lr5kzFC08bKRrSm/xzbnx/RO3phlHWZ0I2IkcJJTekEEEOo3rqKI6kY
X-Gm-Gg: AYBFou3H98aksoMnSq4L/dL7+yeGn042NfNfUzGhP7IS2Hh5HwdaonF0A1KjdD077hl
	Pmy6tK/+EXk8d33TGkwDPTKyITblOFjqm+awAP8xyL8VF2mqi2Gg5W3/FbACH7trI46/KxMtAQR
	ouxjwjr4DoVGWrODS+Ma6GLm2mixUffVCLEwkuJ8NUY9dHSm/h8zqenIVB13ML4Vs4zRz24JAYP
	dTlfmPXJN24xllPSS557SfcC/x38t5NeI24dUOFr+HUyxQ/RmSBU2T970/ctJ6a9w0qBzD4R4ZI
	lYcyOlLPC31sq7HjS01/fsMhjI9Cp+9yxPwgGc51aK5P1BnK7R1ZrSK4ZcbQvUoC5gRc0RbukLd
	/uhQYDWkwPTEzhDHyArDwPbIh3tvAMKXNTJPtWtuW49iHtolTnBu2qlhOIr2YxEE/U6cCbDhBMv
	oUZIIrzkzLQx6Mvh+Xhia/5n2fPN14qlt1jj1ywQmG0yJsdwPTknmZslSGUmJXl24qdcKPSIfFg
	1c0cMnm8NeHdHKi09OQv4ZL21rX/zzzFHzNyj8=
X-Received: by 2002:a05:690c:6112:b0:853:bc96:d834 with SMTP id 00721157ae682-8a45aeac201mr36854287b3.2.1790181380453;
        Wed, 23 Sep 2026 09:36:20 -0700 (PDT)
Received: from kelso (99-10-92-174.lightspeed.rlghnc.sbcglobal.net. [99.10.92.174])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8a4658c9778sm12709257b3.8.2026.09.23.09.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:36:19 -0700 (PDT)
From: Christopher Lusk <clusk@northecho.dev>
To: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-security-module@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] selftests/landlock: cover TTY signal scoping
Date: Wed, 23 Sep 2026 12:33:21 -0400
Message-ID: <20260923163321.79770-3-clusk@northecho.dev>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923163321.79770-1-clusk@northecho.dev>
References: <20260923163321.79770-1-clusk@northecho.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LANDLOCK_SCOPE_SIGNAL blocks signaling an arbitrary out-of-domain process,
but a PTY master retains signal delivery to its terminal foreground process
group.

Add a test that enters a signal-scoped domain, checks that kill(SIGUSR1)
is denied with EPERM, and checks that TIOCSIG(SIGTSTP) succeeds and reaches
the target's signal handler.

Tested the focused case in three QEMU boots and ran the complete Landlock
selftest suite (12 programs, no failures).  Built all Landlock selftests
with W=1.

Link: https://lore.kernel.org/r/20260916152336.1589383-1-clusk@northecho.dev
Suggested-by: Günther Noack <gnoack@google.com>
Suggested-by: Mickaël Salaün <mic@digikod.net>
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Christopher Lusk <clusk@northecho.dev>
---
 .../selftests/landlock/scoped_signal_test.c   | 175 ++++++++++++++++++
 1 file changed, 175 insertions(+)

diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
index 259cdcc8aa5c..9a50817f33eb 100644
--- a/tools/testing/selftests/landlock/scoped_signal_test.c
+++ b/tools/testing/selftests/landlock/scoped_signal_test.c
@@ -9,9 +9,12 @@
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/landlock.h>
+#include <poll.h>
 #include <pthread.h>
 #include <sched.h>
 #include <signal.h>
+#include <stdio.h>
+#include <sys/ioctl.h>
 #include <sys/mount.h>
 #include <sys/prctl.h>
 #include <sys/types.h>
@@ -767,6 +770,178 @@ TEST(sigio_to_pgid_self)
 	EXPECT_EQ(0, close(trigger[1]));
 }
 
+struct tiocsig_result {
+	int kill_ret;
+	int kill_errno;
+	int ioctl_ret;
+	int ioctl_errno;
+};
+
+static int tty_effect_fd = -1;
+
+static void handle_tty_signal(int sig)
+{
+	const char effect = sig;
+
+	if (tty_effect_fd >= 0)
+		(void)write(tty_effect_fd, &effect, sizeof(effect));
+}
+
+static int setup_tty_signal_handler(int sig)
+{
+	struct sigaction action = {
+		.sa_handler = handle_tty_signal,
+		.sa_flags = SA_RESTART,
+	};
+
+	if (sigemptyset(&action.sa_mask))
+		return -1;
+	return sigaction(sig, &action, NULL);
+}
+
+static int create_pty_master(char *const slave_path,
+			     const size_t slave_path_size)
+{
+	int master_fd, pty_number, unlock = 0;
+
+	master_fd = open("/dev/ptmx", O_RDWR | O_NOCTTY | O_CLOEXEC);
+	if (master_fd < 0)
+		return -1;
+	if (ioctl(master_fd, TIOCSPTLCK, &unlock) < 0 ||
+	    ioctl(master_fd, TIOCGPTN, &pty_number) < 0) {
+		const int saved_errno = errno;
+
+		close(master_fd);
+		errno = saved_errno;
+		return -1;
+	}
+	if (snprintf(slave_path, slave_path_size, "/dev/pts/%d", pty_number) >=
+	    (int)slave_path_size) {
+		close(master_fd);
+		errno = ENAMETOOLONG;
+		return -1;
+	}
+	return master_fd;
+}
+
+/*
+ * A PTY master grants control over its attached terminal, including signal
+ * delivery to the foreground process group.  LANDLOCK_SCOPE_SIGNAL blocks
+ * arbitrary signal targets, but it does not restrict this terminal capability.
+ */
+TEST(tiocsig_to_foreground_pgrp)
+{
+	struct tiocsig_result result = {};
+	struct pollfd poll_fd = {
+		.events = POLLIN,
+	};
+	char slave_path[64], byte, effect_signal = 0;
+	int ready[2], release[2], effect[2], report[2];
+	int master_fd, poll_ret, status;
+	ssize_t report_size;
+	pid_t attacker, target;
+
+	drop_caps(_metadata);
+	master_fd = create_pty_master(slave_path, sizeof(slave_path));
+	if (master_fd < 0 && errno == ENOENT)
+		SKIP(return, "Unix98 PTY not available");
+	ASSERT_LE(0, master_fd);
+	ASSERT_EQ(0, pipe2(ready, O_CLOEXEC));
+	ASSERT_EQ(0, pipe2(release, O_CLOEXEC));
+	ASSERT_EQ(0, pipe2(effect, O_CLOEXEC));
+	ASSERT_EQ(0, pipe2(report, O_CLOEXEC));
+
+	target = fork();
+	ASSERT_LE(0, target);
+	if (target == 0) {
+		int slave_fd;
+
+		EXPECT_EQ(0, close(master_fd));
+		EXPECT_EQ(0, close(ready[0]));
+		EXPECT_EQ(0, close(release[1]));
+		EXPECT_EQ(0, close(effect[0]));
+		EXPECT_EQ(0, close(report[0]));
+		EXPECT_EQ(0, close(report[1]));
+		ASSERT_LE(0, setsid());
+		slave_fd = open(slave_path, O_RDWR | O_CLOEXEC);
+		ASSERT_LE(0, slave_fd);
+		ASSERT_NE(SIG_ERR, signal(SIGTTOU, SIG_IGN));
+		tty_effect_fd = effect[1];
+		ASSERT_EQ(0, setup_tty_signal_handler(SIGUSR1));
+		ASSERT_EQ(0, setup_tty_signal_handler(SIGTSTP));
+		ASSERT_EQ(0, tcsetpgrp(slave_fd, getpgrp()));
+		ASSERT_EQ(1, write(ready[1], ".", 1));
+		ASSERT_EQ(1, read(release[0], &byte, 1));
+		EXPECT_EQ(0, close(slave_fd));
+		EXPECT_EQ(0, close(effect[1]));
+		_exit(_metadata->exit_code);
+		return;
+	}
+	EXPECT_EQ(0, close(ready[1]));
+	EXPECT_EQ(0, close(release[0]));
+	EXPECT_EQ(0, close(effect[1]));
+	ASSERT_EQ(1, read(ready[0], &byte, 1));
+
+	attacker = fork();
+	ASSERT_LE(0, attacker);
+	if (attacker == 0) {
+		EXPECT_EQ(0, close(ready[0]));
+		EXPECT_EQ(0, close(release[1]));
+		EXPECT_EQ(0, close(effect[0]));
+		EXPECT_EQ(0, close(report[0]));
+		create_scoped_domain(_metadata, LANDLOCK_SCOPE_SIGNAL);
+
+		errno = 0;
+		result.kill_ret = kill(target, SIGUSR1);
+		result.kill_errno = errno;
+		errno = 0;
+		result.ioctl_ret = ioctl(master_fd, TIOCSIG, SIGTSTP);
+		result.ioctl_errno = errno;
+		ASSERT_EQ((ssize_t)sizeof(result),
+			  write(report[1], &result, sizeof(result)));
+		EXPECT_EQ(0, close(report[1]));
+		EXPECT_EQ(0, close(master_fd));
+		_exit(_metadata->exit_code);
+		return;
+	}
+	EXPECT_EQ(0, close(report[1]));
+	report_size = read(report[0], &result, sizeof(result));
+	EXPECT_EQ((ssize_t)sizeof(result), report_size);
+	EXPECT_EQ(0, close(report[0]));
+	EXPECT_EQ(attacker, waitpid(attacker, &status, 0));
+	EXPECT_TRUE(WIFEXITED(status));
+	if (WIFEXITED(status))
+		EXPECT_EQ(0, WEXITSTATUS(status));
+
+	EXPECT_EQ(-1, result.kill_ret);
+	EXPECT_EQ(EPERM, result.kill_errno);
+	EXPECT_EQ(0, result.ioctl_ret);
+	EXPECT_EQ(0, result.ioctl_errno);
+
+	poll_fd.fd = effect[0];
+	poll_ret = poll(&poll_fd, 1, 1000);
+	EXPECT_EQ(1, poll_ret);
+	if (poll_ret == 1 && (poll_fd.revents & POLLIN)) {
+		EXPECT_EQ((ssize_t)sizeof(effect_signal),
+			  read(effect[0], &effect_signal,
+			       sizeof(effect_signal)));
+		EXPECT_EQ(SIGTSTP, effect_signal);
+	} else {
+		EXPECT_TRUE(poll_ret == 1 && (poll_fd.revents & POLLIN));
+	}
+
+	ASSERT_EQ(1, write(release[1], ".", 1));
+	EXPECT_EQ(target, waitpid(target, &status, 0));
+	EXPECT_TRUE(WIFEXITED(status));
+	if (WIFEXITED(status))
+		EXPECT_EQ(0, WEXITSTATUS(status));
+
+	EXPECT_EQ(0, close(ready[0]));
+	EXPECT_EQ(0, close(release[1]));
+	EXPECT_EQ(0, close(effect[0]));
+	EXPECT_EQ(0, close(master_fd));
+}
+
 /* Trace tests */
 
 /* clang-format off */
-- 
2.55.0

