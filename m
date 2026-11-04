Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793788672;
	b=Jd6jXCLmE5aA56IW2vgWx0Wvnv3bDrbOjFZjCpjnhil15+GZCHxMjkpbqbpuUjVpny9c
	 AQpWKE2hKjQyUsMvZs57X/+7Viy9Z6LSW4msajpJP2D47YSbp82XMprC+VuVIuSpVyIou
	 Tqw8d3ELqONwVMxSGyX1PTuUryyHIEwiOPFHA4hGJZYnvQ4z0+HM5WgcJ5bQ9Qi1i1ZNT
	 uoYP+SFKMZ4wR+qB7ZzZTREly8jzr2gP1/QJocNjKIrTuZm6Dk/ejBUH161tfEddIp9RF
	 x3EE+di+zH1HGNy+WGZjpgIRgTuCwQMnPj2MXE2cYnA2CAl8/mN0ILSWCGisLMChrCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793788672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c6s18SHud2joSSbqm0LBuEFJwdrHkA0w4Rbf3bJemKY=;
	b=qicicqajYtf9FpY6ChlCtpMAZLTacn22blm0lSDhz+Wb/sUNpeNVTlhmiYlBANbApXcU
	 izqcoUBP3ejcGKNzkWosdvfMvTbGfVaXY9vnyBMqVxmFCFjLh07+jV0o3R6nwoZLWoJA3
	 U3+RkF1pYd7KclYNy9ViFHucWjF1s8HPksQdti9vIbn06axPCtwKIdy/oHD6e8CITu7JZ
	 6MTUSMqXQdnxR+3Om+gSlM/jMI6QptJal89N5QB5nf50qSbVzWl0M1wG4NHnRfOjtT9/y
	 4a7Y/2/JlBoFKWDbflb9y9X/7abtZ4RswET3Z3+AtL44UL6byl6LN2sRGZQX7XGKkTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwkzJ7GC;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADAA606A328
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ADAA606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uwkzJ7GC
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so5469075e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793788670; x=1794393470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6s18SHud2joSSbqm0LBuEFJwdrHkA0w4Rbf3bJemKY=;
        b=uwkzJ7GCJ9nR1ndt9h1W9f3rgIUyxdxq7Q7ujZbwOC9z6VNe8c/OvkDJyoQhaanT/u
         PGcFVT1yhVREuo6B4ppg/5krtaeASxfm35Dkpn4tz4xtnZ77LU0R7UbYlqVdiHQunjbe
         krLZNO5NUYUfKTh0A1vKM2V9cn7nsn5wqGGmaZD+RPu6jT84QFXFqhkWwDtrszcr892z
         dHjm3vWJ1iIfmQqbn2y0EI2GynMSepKxylgCOLMmbWA2owJyitlBAhf/LAK5vgWQeMm3
         BpYR5/m6I4XMREatGEFn4MpfXsj2rfph/+tGI/2I7nRDs6elT2nSbH8Wd2JDf3jF4kPe
         JNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793788670; x=1794393470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6s18SHud2joSSbqm0LBuEFJwdrHkA0w4Rbf3bJemKY=;
        b=GpTJv4BwKJ3rllgN09TAe2DUn2HcboM9C9chOqaK0+kOlRgihKk/7ceqe2vnJ9Q3qk
         Nzo/cxRti9HVaeMYqvj0yg9kgZldh0k1PrKJgtJL0MceDCjVs8MsihWrSPUmnBSoJB/b
         ZOww1ShWHYNd+m6Ixso61g5fXLe3R05oRGdKLqAve6nXW46XOnFqvhsCeKpSCxZGcMda
         9a3WCS5W9jTOHlG3y4aZQhV7hgntbQ33ChvTKzan8eNpDfIP6ODHnLOBjpmx3q3O8dED
         Yh8fzKatJAPeaWVKOMaUCRSLRPumi+yKlVEwizs+PupzNNaLfnxfIUBel1eCoOyM0cRB
         x2RA==
X-Forwarded-Encrypted: i=1; AKwUvBxffIczMO8gQeg9mVosFWGjJwfCnUltYW5CqbScjSqXS0J3YHITviD1o2PcmRZa1uF1DwkzCZzaSY3emCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yYq+ViaSYHCXfaHIu65Vg6uKoJgXzK00MuahBlZXNphWxLYei
	G7HOl35vuXAN12FH5U2J/4Fg5IusFYi6gki/SjiUjbAUHA4BwNfKS9q5
X-Gm-Gg: AYBFou21jeNlsDKTink6+EvaQkk1dEqpyVpM/yr+8i79rW0D4JRe1vpxgVL5/rXhwnI
	PcQLaELyEUHelgbws6hE2cAICD3cP5oyjZ5/VgIE462jlvxUkT3WPj1/fygQTV+ntNrmM2QVPqm
	g/FmXhEQGPe9Kk/vgbi2um9zSancJwqtlVhIYN6nnTbJkavOYRIwNRBCLC8BXEBT7usE3pE/Lha
	YdfCVPM+GxlpnWvwi0QTDR1Lr6/rlqx8UkTdnIXUNTjqRePwEa5scleoIeZSdHz11dnyHk68puy
	nXwH6/obql/K2CFkRCWcpDUldVAJ977GMKEGO5kpSk9RkJwHWxdbHwl7rKCYMvvqkNzNiLhlmsX
	McKsqukzhMcsqQRximeX/9jlJU5K7tp9kNtw+VGc4TvkCvLLXyKQegsA5IguxkE1zqI/yA3BAY6
	uWDrLkswKLqSvDfiFdsSfUqr/IzauWgt0qzuJnmWDa/5B7dmC7eriM2KsA5TOaL+FWnc6c4wW3r
	virvknDkhxmlCEgmytKLOG1tvPlx6yB2hKBrHl3a7wFl4S03D3r1Jjq2A1T4smPNToLZJAoVA2Q
	LcyPH0QGRyG32SqSWlkiNpeGG7rEOwgIPik8qbzwuJVPKt2T7NDRQIt3GwAVruUlBbzgypxx02C
	Z
X-Received: by 2002:a05:600c:4e12:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4ac1765cf2cmr372431045e9.19.1793788669356;
        Wed, 04 Nov 2026 02:37:49 -0800 (PST)
Received: from andreayoga.wind3.hub ([151.76.4.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f88sm36342995e9.0.2026.11.04.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:37:49 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Kees Cook <kees@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Rodrigo Campos <rodrigo@kinvolk.io>,
	Christian Brauner <brauner@kernel.org>,
	Tycho Andersen <tycho@tycho.pizza>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: [PATCH 1/4] seccomp: wake poll waiters after failed addfd send
Date: Wed,  4 Nov 2026 11:37:31 +0100
Message-ID: <20261104103736.71956-2-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104103736.71956-1-parri.andrea@gmail.com>
References: <20261104103736.71956-1-parri.andrea@gmail.com>
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

An atomic SECCOMP_IOCTL_NOTIF_ADDFD request stops the listener from
reporting EPOLLOUT for its notification while the request is pending.  If
installing the file descriptor fails, the notification becomes writable
again, but poll waiters are not woken.  A supervisor waiting for EPOLLOUT
can then remain asleep, leaving the target blocked in the trapped syscall.

This affects edge-triggered epoll if the supervisor consumed the event
before the request, and level-triggered epoll, poll() and select() if a
concurrent waiter found no EPOLLOUT while the request was pending.

The atomic path changes the state from SENT to REPLIED before asking the
target to install the descriptor.  seccomp_handle_addfd() restores SENT on
failure, but unlike seccomp_notify_recv(), it does not wake poll waiters.

Wake EPOLLOUT waiters on that failure path.  Extend the RLIMIT_NOFILE
test to consume the initial edge and require another after a failed
ADDFD+SEND.

The bug was found and the fix was written with the help of an LLM.

Fixes: 0ae71c7720e3a ("seccomp: Support atomic "addfd + send reply"")
Cc: stable@vger.kernel.org
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/seccomp.c                              |  7 +++++--
 tools/testing/selftests/seccomp/seccomp_bpf.c | 15 ++++++++++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/kernel/seccomp.c b/kernel/seccomp.c
index 3eecba5ccdef3..d74e66bcb5211 100644
--- a/kernel/seccomp.c
+++ b/kernel/seccomp.c
@@ -1125,7 +1125,9 @@ static u64 seccomp_next_notify_id(struct seccomp_filter *filter)
 	return filter->notif->next_id++;
 }
 
-static void seccomp_handle_addfd(struct seccomp_kaddfd *addfd, struct seccomp_knotif *n)
+static void seccomp_handle_addfd(struct seccomp_filter *filter,
+				 struct seccomp_kaddfd *addfd,
+				 struct seccomp_knotif *n)
 {
 	int fd;
 
@@ -1144,6 +1146,7 @@ static void seccomp_handle_addfd(struct seccomp_kaddfd *addfd, struct seccomp_kn
 		/* If we fail reset and return an error to the notifier */
 		if (fd < 0) {
 			n->state = SECCOMP_NOTIFY_SENT;
+			wake_up_poll(&filter->wqh, EPOLLOUT | EPOLLWRNORM);
 		} else {
 			/* Return the FD we just added */
 			n->flags = 0;
@@ -1224,7 +1227,7 @@ static int seccomp_do_user_notification(int this_syscall,
 						 struct seccomp_kaddfd, list);
 		/* Check if we were woken up by a addfd message */
 		if (addfd)
-			seccomp_handle_addfd(addfd, &n);
+			seccomp_handle_addfd(match, addfd, &n);
 
 	}  while (n.state != SECCOMP_NOTIFY_REPLIED);
 
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 66bb53bad93bc..6dd51efe8dff1 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -22,6 +22,7 @@
 
 #include <errno.h>
 #include <linux/filter.h>
+#include <sys/epoll.h>
 #include <sys/prctl.h>
 #include <sys/ptrace.h>
 #include <sys/time.h>
@@ -4391,7 +4392,10 @@ TEST(user_notification_addfd_rlimit)
 {
 	pid_t pid;
 	long ret;
-	int status, listener, memfd;
+	int epollfd, status, listener, memfd;
+	struct epoll_event event = {
+		.events = EPOLLOUT | EPOLLET,
+	};
 	struct seccomp_notif_addfd addfd = {};
 	struct seccomp_notif req = {};
 	struct seccomp_notif_resp resp = {};
@@ -4434,9 +4438,17 @@ TEST(user_notification_addfd_rlimit)
 	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd), -1);
 	EXPECT_EQ(errno, EMFILE);
 
+	epollfd = epoll_create1(EPOLL_CLOEXEC);
+	ASSERT_GE(epollfd, 0);
+	ASSERT_EQ(epoll_ctl(epollfd, EPOLL_CTL_ADD, listener, &event), 0);
+	ASSERT_EQ(epoll_wait(epollfd, &event, 1, 1000), 1);
+	ASSERT_NE(event.events & EPOLLOUT, 0);
+
 	addfd.flags = SECCOMP_ADDFD_FLAG_SEND;
 	EXPECT_EQ(ioctl(listener, SECCOMP_IOCTL_NOTIF_ADDFD, &addfd), -1);
 	EXPECT_EQ(errno, EMFILE);
+	EXPECT_EQ(epoll_wait(epollfd, &event, 1, 1000), 1);
+	EXPECT_NE(event.events & EPOLLOUT, 0);
 
 	addfd.newfd = 100;
 	addfd.flags = SECCOMP_ADDFD_FLAG_SETFD;
@@ -4454,6 +4466,7 @@ TEST(user_notification_addfd_rlimit)
 	EXPECT_EQ(true, WIFEXITED(status));
 	EXPECT_EQ(0, WEXITSTATUS(status));
 
+	close(epollfd);
 	close(memfd);
 }
 
-- 
2.53.0

