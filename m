Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D49F43F8DE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 22:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790289024; cv=none; b=cZ7RgKTR/oVKQaFfJyXSrW8SLKCsBd80pdAXZZvuOUpujK4kp9e+NPwHf6LTXWNtiQr3wFwCAjeWotHdv7ZmB8j21QAGiooEp8Z07jBxm0QHwemBgwGgpc7p/PH+qdT7b0Uz8L0wkuj5Cgpf4qyqi5jfYi33z+KAYPG8H3l+mcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790289024; c=relaxed/simple;
	bh=LmjXCc6RedZvBeNFVQ+AmOCGCUAORsxPm6ipqXInPSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TAPJ3sLf09UFcWW3ZaJie7JzdvO6S/0yzDCgQV3Fn3M2af8a9WmuOMeh7znu8BZAmua7NY2M659m+Zwp8dTDLxmodwaZ62YRpLNatV+ZZ4CGBHNBCHQAiXmLe7n3Iy80T99pkIr1CqsYc3gcaYs0z01DYwVO4RWn9kOFF9gX+ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijWxt14F; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijWxt14F"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-33e619af891so213035eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790289022; x=1790893822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bLSkF4Eyp9+9NX5LRJPW22pjwKC+cVG5B2S/nl9djtM=;
        b=ijWxt14FdE7m3viBorp1Vt2v/uMk3tk1Z1f4n3RhZ2z6HcSrMz6ClRntkeZVr0kZVX
         i/cXrmTN1VswAXYckMfK/6qKkInWzmZPs1cxDlSVZqp3nWDesfmSzbUggYAXJtKqJzoY
         vSQubwwMDac8TPU8otfqHdbcB2OkxiYaDj9wHqjmDDzoNwtYr9Q5b6zkRx+yrh2LCewq
         ywq0Bp56FsIa26jvxOKP5XLm5qN1scTgQxkk8G5sPS/I/rtr4/ocZQ+JaoHQ7bcpvCGS
         nCc60rJKWlNRFOjaBuQBI09NF2xErJSVeQCTR7yio6RAwFoDbF1BtD2cwFWgXTWxGGT6
         AtAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790289022; x=1790893822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bLSkF4Eyp9+9NX5LRJPW22pjwKC+cVG5B2S/nl9djtM=;
        b=U9zQYHzdVIXdmPM7WfpGcnZPjDJWRAz4aRcQmZAJMeFDFri4d/Q66JSJnXkbzllBrg
         5nKtLf/JT28nQCNEN3K38WaxxoxwBB60NnEIbCaDSA5wpEof+FVftSCwUnSiHDXe+XRn
         9yhGF5FPDdKxR17gxRFp+2OztaSr5DJJ87tnRvM++btckIf2RshDma3ZCX5sPlwnmDsD
         QObXWfBkxRQ4wAxo2EAD5L82pHrir2rXF+t1yhnNPZiT646tILc5xd1NgdGvFm73KM9V
         foJJ5vj7cyBmuc2YauuhFxlFjgLWYVMM8UmlixiB3s7Kv/bDdyMNhxj77OjqbA2ifR20
         CvCQ==
X-Forwarded-Encrypted: i=1; AKwUvBwm/qrctjNLxwXPfxpVWH1O7T5t94BOc9qZAM/Pd5Z5vNttwAnXb+oFNS07Uf8Ib8pX4xv8+4dSd0wUels=@vger.kernel.org
X-Gm-Message-State: AFuF++lZdXCPeZE/61NU8xXkX1+/ohF2GUyS+tOdjmfHSDw07XqRwvI3
	Y4/V61tAFT4wGK4J2tp5xEWPSgAQqCIGitXkcL30rbkzNpxNmG28IHva
X-Gm-Gg: AYBFou0BI09IJh8bCPEuUdOsnOXTF+5qslRElLLyFjcHWYQJ4kJAZ0a9KCmFeeMtJ6H
	tmYpInXJzoKsZChGawR561GdpUTYAi9gY3I/DQjQk+xAx6hdXlkD885HPC/mawkkHJf4NbCEdZ3
	5ySLKvpkIkwEuLF8ecMqGm3j4psPwVv9hD8vBMV/WMKwZhy0CCi7375tpJypV3AgQl9UTOG8Z3U
	9GxN3xDf4VqBs9P4G89Kx0wRrQkvckllN+vEbBgSg+trxfFxzIyj6X7UdlBYz2WTO71glbjwjhi
	ZbdhXmZkkj3A/Op53K0qCFpsuQZCpRyfcElsgmpq/kqAb3zAL245J1L8p0kuf2vUFlhfjrVTuBv
	Rk/t7yfh2jOAKoqhPJrismReh4Z0gcOBSepE4D7wZ/VttIVEIyQp+tJZcmgeJeFrk4eZ+CAYunQ
	7+I4idl6PpROuPyKmzssbi4HgFawuezNajndw9Jy/8tptxYnL53JqGNaYGguS89DO/TLcrDH/mj
	xL720Qe8Q4FxkE9vBibJ9red1b60Idznw7Z5J7EijE=
X-Received: by 2002:a05:7300:5351:b0:332:946c:4778 with SMTP id 5a478bee46e88-3400596608fmr4348740eec.14.1790289022377;
        Thu, 24 Sep 2026 15:30:22 -0700 (PDT)
Received: from pop-os.scu.edu ([129.210.115.107])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144f4eb9esm1541989eec.19.2026.09.24.15.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 15:30:21 -0700 (PDT)
From: Cong Wang <xiyou.wangcong@gmail.com>
To: Andy Lutomirski <luto@amacapital.net>
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	Will Drewry <wad@chromium.org>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH 2/2] selftests/seccomp: test addfd with an O_PATH descriptor
Date: Thu, 24 Sep 2026 15:30:17 -0700
Message-ID: <20260924223018.564548-3-xiyou.wangcong@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924223018.564548-1-xiyou.wangcong@gmail.com>
References: <20260924223018.564548-1-xiyou.wangcong@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Wang <cwang@multikernel.io>

SECCOMP_IOCTL_NOTIF_ADDFD used to reject O_PATH source descriptors with
EBADF. Add a regression test that injects one into a notified task.

Verify that the injected descriptor retains O_PATH semantics and the
requested close-on-exec flag. The test fails on the original fget()
path and passes with fget_raw().

Assisted-by: Codex:gpt-6
Signed-off-by: Cong Wang <cwang@multikernel.io>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 59 +++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 0622bc2acad4..9765869f66b8 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -4298,6 +4298,65 @@ TEST(user_notification_addfd)
 	close(memfd);
 }
 
+TEST(user_notification_addfd_opath)
+{
+	struct seccomp_notif req = {};
+	struct seccomp_notif_addfd addfd = {};
+	struct seccomp_notif_resp resp = {};
+	pid_t pid;
+	int listener, pathfd, fd, status;
+
+	pathfd = open("/dev/null", O_PATH | O_CLOEXEC);
+	ASSERT_GE(pathfd, 0);
+	ASSERT_EQ(prctl(PR_SET_NO_NEW_PRIVS, 1, 0, 0, 0), 0);
+	listener = user_notif_syscall(__NR_getppid,
+				      SECCOMP_FILTER_FLAG_NEW_LISTENER);
+	ASSERT_GE(listener, 0);
+
+	pid = fork();
+	ASSERT_GE(pid, 0);
+	if (pid == 0) {
+		int flags;
+		char byte;
+
+		close(pathfd);
+		fd = syscall(__NR_getppid);
+		if (fd < 0)
+			_exit(1);
+		flags = fcntl(fd, F_GETFL);
+		if (flags < 0 || !(flags & O_PATH))
+			_exit(2);
+		flags = fcntl(fd, F_GETFD);
+		if (flags < 0 || !(flags & FD_CLOEXEC))
+			_exit(3);
+		errno = 0;
+		if (read(fd, &byte, 1) != -1 || errno != EBADF)
+			_exit(4);
+		_exit(0);
+	}
+
+	ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_RECV, &req), 0);
+	addfd.id = req.id;
+	addfd.flags = SECCOMP_ADDFD_FLAG_SEND;
+	addfd.srcfd = pathfd;
+	addfd.newfd_flags = O_CLOEXEC;
+	fd = ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd);
+	if (fd < 0) {
+		resp.id = req.id;
+		resp.error = -errno;
+		TH_LOG("ADDFD failed with errno %d", -resp.error);
+		ASSERT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_SEND, &resp), 0);
+	}
+
+	ASSERT_EQ(waitpid(pid, &status, 0), pid);
+	EXPECT_GE(fd, 0);
+	EXPECT_EQ(true, WIFEXITED(status));
+	if (WIFEXITED(status))
+		EXPECT_EQ(0, WEXITSTATUS(status));
+	close(pathfd);
+	close(listener);
+}
+
 TEST(user_notification_addfd_rlimit)
 {
 	pid_t pid;
-- 
2.43.0

