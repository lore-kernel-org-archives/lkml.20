Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.230.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525567;
	b=2aq9kk2hVcWVbTGemmiFX2yRVYXzSjKeQdlwC3OD5Yr6O7uU1okoTs41V5Jg3f85mkVO
	 n47WtZQzY+xDY1Pd3/g7Pqxe2NHcPpkP/eI38GZIeVeggehtymcPOjKSRTgVqulD1LCop
	 l7PeZAT0KPt/eA9lmc46ajzx3uuc2GJPnP5UDf8oZb+ZffjEjz7ucdgIKp8Juj+FQkE9Q
	 Qve8cqxSOND1ywsGKlVKZa8HBZReOWuSFviChRugj1NjFVcrqTcPow6tYIUJyavoHd/Da
	 xeK924IY832FXd5ZwDBwbiB7MElujUU03dSbxs1UjHjSvBOVayyzxL+Jz9DypDsU7jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525567;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=p6e7dDbW65lUB5780MXdw05Kr0ggowfzgS++oqUtaXo=;
	b=LTntsrObpVt+65unO+thWr3zrQ8qzqKYEBYvrSUHd0CQEatVCzZ3Z/1GIALeVGTaUXEK
	 KMF6YXgGy4E66kJKyifYlidIa2d2XKuiRqDzcKQHcjwWQ5iUdhpFQFvFYjRZbSvW2r4Z4
	 gLec+NWTMw7ka8KpwDx48nBZIlhig7vDpNvFdk2tmFykhl97hKkcluInn3dCzoMp/2Dit
	 KIOHMn39UgeTf7vpetPemF83mJ1OC7uYGRIIp4qmgNkRd1XHgTNDQlt2xb57RYAPR8rWo
	 1Y9MbY5OySmwX1d561npzeZf+pKt2UP88qTrAMekIueWOVDmk1DV3IbKv0aQeXFk/og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDZSN9Gg;
	arc=none smtp.remote-ip=74.125.230.137
Received: from mail-qv2-f9.google.com (mail-qv2-f9.google.com [74.125.230.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F71606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 19:46:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F71606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jDZSN9Gg
Received: by mail-qv2-f9.google.com with SMTP id 6a1803df08f44-91033ce28ceso356306d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792525566; x=1793130366; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=p6e7dDbW65lUB5780MXdw05Kr0ggowfzgS++oqUtaXo=;
        b=jDZSN9Gg74xk1ouM340nDY3cjpo17LA4WCg1MM1hRUrWf2dyYpr4u9hYF0iTGcnYfG
         PXJJUG4LSOq61ntg5nomKfwMyL/ypZ/IBL+nq0VM+3wdU6Jfn2LLeo8dTp01dA7WixbK
         Nvc5aDeyD4bBnjTYBm1bPP+uBr2amYzK3t9+wMC2v4pZp+onQhL5MgI9/LZNTEoTjxSx
         ODcbxVT3oWmnu/lUyBhcGnKZachM8KdYintB4xNKW+K4PJOvX6a4wKjhRUjNvXW8PPG7
         XVqSj6g9YWkPkY3Q4iNuZa3dCWDzT1hpkT6Gsc5g4Nca7yFwCn5ePKhLrDHruRIna9Nl
         nbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792525566; x=1793130366;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p6e7dDbW65lUB5780MXdw05Kr0ggowfzgS++oqUtaXo=;
        b=FakK6f0gyhoPaOjahhGfkRQNsuIrVp3EUaj/O6QZIxYOOcu/9Qxh4o0jbi4T9krKOQ
         LtAvJ4Cpl+HwP4KwW2H9THwl7poGX8+nbQmS+N3NCDNrsfcwZ5mc2YiJ3LxU81Q+NZPj
         W93kh1NyD6EmaIV78bwTaXRZH15uoZNv7XXX4PBKrGkIG2aI9Ib1D5oNSsxaH18E/hNm
         imrR30ysBBCQZj8FMgQRGHJhKPW4irUGUtOjydyIrW0qrLigOZMU7MOud5j5UTK0dRgr
         bIRsVBLYCUDi1l39INPRuS9A3Z2c0y9SU1bQdjvpcMW/kU02fY2jvu9xH3gd3/Umd9gd
         PgAg==
X-Forwarded-Encrypted: i=1; AKwUvByzrXfqhBzQLeCrEI3u40iOyFrIW9NEj3OU6dtr+rOlnKeFD4Xb9UPdxgt1imcdlZtIzE7CS+QgiD5LNkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLe2t94hPJKxmAdlGaAaev1qwF3oE6P9B1BSkX27UhiJKpoShx4
	gduYlDvMmhTVNh6uiLTNMhjLOQPq6qaG0zH1Jd0VNeVeHoJ0aGS5tB2T
X-Gm-Gg: AYBFou0/bJ6QBfwfflb40/89jKTbhqz+x+PMHbpxtuVXSu8/NsLK8cYNdRWDfLxDwYj
	OZJjdyOdIIcxuj6adFHs0Z2gAXaUNIW1VsTSbYGkjKtk7WCm+a2G3wIN4pDJK7HtUbBKouoD6sK
	vKfzW5vrnHxG5d6hjSOUwkYNHE+r3OYu55C8Qjio30Hy9wdicAP4OcDTULUkd1uDoWnMsyQHXkJ
	r0P6710nPZvrkp5z+3zMluTxMMH0hpeicVvTxcHKaIHvzm7EV9L3yft6z99XW1JN6vJgXB6347q
	JPT/VjcVRl9EGm892dUZd3UySm7pSpzVvok2k6yjCnHXScVfslRwFiDwMvmxux18eX+Hs56yHC3
	Xddyqlfk3+W7ZVmGrgkACmZhuUztrMspAkOaHFFFs5xYd/0g2DJ2l6A+pv/ShX0tqveLjVRpCI2
	PAFeq/orvo0FxdF4AynBwMWFMU+8VPJF4jmjNwU3izXkRgeStAjpXdnI7Ej3/VeY4Xc2BjADvQY
	d1c3sM=
X-Received: by 2002:a05:6214:262d:b0:91b:de4f:d3d9 with SMTP id 6a1803df08f44-91bdf19316dmr192640906d6.57.1792525565860;
        Tue, 20 Oct 2026 12:46:05 -0700 (PDT)
Received: from Fujo.localdomain ([142.188.41.221])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10b71583sm6336516d6.15.2026.10.20.12.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 12:46:05 -0700 (PDT)
From: fujo <hooyan2024@gmail.com>
To: linux-fsdevel@vger.kernel.org
Cc: Oleg Nesterov <oleg@redhat.com>, Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4] selftests/pidfd: wait for POLLHUP before reading exit info
Date: Tue, 20 Oct 2026 15:45:18 -0400
Message-ID: <179252551833.59967.12617794775210688694@gmail.com>
In-Reply-To: <atc59R5-oBnyOIb8@redhat.com>
References: <20261017054356.7874-1-hooyan2024@gmail.com>
 <179234213014.649.6368924662349703640@gmail.com>
 <atc59R5-oBnyOIb8@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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
 .../selftests/pidfd/pidfd_autoreap_test.c     | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/tools/testing/selftests/pidfd/pidfd_autoreap_test.c b/tools/testing/selftests/pidfd/pidfd_autoreap_test.c
index 1c586482f..59bf9b5b3 100644
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

