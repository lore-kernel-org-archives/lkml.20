Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826577;
	b=I2GtrCjn2YSSrqLQSNtTueMw3V/6mcREptk5t9Hcph8Pb0pzrzvZypWM1oIx30nBEawt
	 hH9ShLL/B5FTp+GxsZ5u2ZWGBtVG6BOkKGIedF2jLGDshoH35IpAnFuPrQNEA1JG8xRi4
	 hRQdJK2uzMJQQ/c9OHdo52aodCEzYXWhHBkgRqFpTk/Xk2Tv2aNezj5WW7wJk1/PAdYYj
	 OBABa6cOSD/qDjYbE0fbWSJCqu5MlJjyD4cvwO4QStt+87mWhPqY18FZwp6yux67mTQSP
	 GVbnnrXJLxPGEfBPVh1hr73/uRLNAPl94lH3csUWCborAWjiONUOxj4Qh8YNdlah+Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=3194YaOP0F+FMB6I5klv6B2ufzZSORnnEQ/EVm90CVQ=;
	b=azL3Qlz9gkk0KLkVKLia149ZDPluJDUqXSr5GUvp4GrEt+GybJfDFZ1NK+MEOkEp65M3
	 ZHNMY8QWI2SZDYsiz7RNjil72TXaViYMZmAGLNNK7lQgOEW9TCko9Z9BgK7nsV4QrOSH6
	 dBqIjwPLheQmAUXL9dCCnqH07Vlbv5aH8HUz7bCGDIMKsC9YtzE8bYjUOtH1nMVmRyTpX
	 pRLqqtExMqvXP9UIRmhmOX51u1BmKMqLdl2EnQAqnA2eIfKWOFpg8lAhVBJDdy4vTpFQ5
	 ceaM0Je6k9U0dIombhZsct+xkKk54oFYq1G7FauzOm07jfRaNmRsIatST9a65628byg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3CiICk1;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF9F607F29E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABF9F607F29E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=D3CiICk1
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4910b863b84so10494f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826575; x=1794431375; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3194YaOP0F+FMB6I5klv6B2ufzZSORnnEQ/EVm90CVQ=;
        b=D3CiICk1IU3LYOkkUsP513zcLWLMA5i0GRg6LkkHP7BB1EcQ9D0tGOHgvlqQic9CyG
         V9De65zZ6pPKCjXt8CLX8huiMGmVM8Inj2UUFzrZY0nCvugX/vvz5/2JWSXbVIrBdXTU
         Re0JRKL42TnXy9iCrvGCJI5MoqYTj730qvHIH19f9+ROUvad/DUzXDNEgITCVKtx2Qp+
         oYXgOh34bDIWWKeKUvRqnI7wBV449fL2F+7jYT9no/Z00SI4itNxQLWOv/DNusGaCG45
         /SHfXt9/FBavBlhJuvypvpJYwYR0aHSalFMIqYLv5/ghs3VUk1YWys0LyB9z38PfEY45
         JGuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826575; x=1794431375;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3194YaOP0F+FMB6I5klv6B2ufzZSORnnEQ/EVm90CVQ=;
        b=e93PloIcMFYTCkJNOAhv3saeGya11dFoBP1JjOJYkI8ndLGgsOObIqVclZsweJGWLh
         YhX2zBVwJr8nO2CSAkNPbKVE9xZF0169nSdpxdeBZVaUbU6U+rfD3Et0pRLdmJEc2DGL
         vNH+eEJpyBcq2WSUHjq8jQyU4UzoPdqTV+5Q+e4W0P4crcOBUouUqwKhzpSlLuisLgP/
         GNzSiIODSnG+qYVrMAYHqtzAtnYqqiQ/VCb9dPq5uL5LXyYKYydwTxyG16NJHMh9HmeP
         hhzL7UI4kGjI9/PYlPbFklpjfHNk9wzrjGF4fHx33GphhSFWl0AsRSs8fH5yCpZ0go5c
         b4eA==
X-Forwarded-Encrypted: i=1; AKwUvBxAZ96QAYGnugWP7UR9GuvZZHjFImlQYlxkawLeB0JeN/TftylWBTOqCh7Xm3hBGsQMl/tnm8UcWLqCfx0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JjTFgY9Ww0S/sP0oqAQQxiBjGKarHcjh0oyitCIyVfBXC8V57
	5lV9JNu8996hT70n4fUbenMR9vmM3aVdHgytGhHGiiKAHIbc2BkyUKca
X-Gm-Gg: AYBFou1ZMjuZZH+BQiouZU8d++oyz5bQIKNtQwSxtNntq8b6A/rU1ZT/mN/IDKnAzqf
	9qFGBeNOa61GxH/iLyZEn9z0sc5fvR8gZa6rUpf4MaAiIWMoimtIE8lEozjARsFFPGCo98yxrfh
	aRUnmG1UhUSGlE/CAdYWJeMILUIXw7+A/Va6WJJm5YOY+GxNWp3FrNnoB5tNq5xl7KswK69IWn3
	A0IFAYtxZy1C7IMLO9WTqZykUf3ae9962K06qxp1/wkQ+N4r/ErRWWW3hyo+cR07a8ZbbnvXg5c
	yDq7dTSl7zclklucr5PoroMwXiFQF8JBuh793WKPVf0oF6QrV4ueHdYWo2OzzqA36PT4Iyhu2QO
	Us6iUkNRWT9ZykXWNea+l7h/rG+V0a5VO0QGi8jl6Q0d+w/slImFUlZ+/84xu9M8zX7kRiwr+l3
	5lsU/IicgSzispcAMpgXIGanbeh9/2hzwUtFVEfnkm4tKhBjUiW09ywtLs3D+pdE7RvRgq7ODwy
	HNcOU8GZtkzWk2YEafhZ0B8E2fZEp3/CXmlU94l5DcQ3WzrnfB/FywCPAwXGBEtx+QLZd8xItst
	sQdotmCJVnwE4HeFPXdX1555mJG2BFjFZ5jb3CJla/XB5rj075GpSg==
X-Received: by 2002:a05:600c:46cf:b0:4b0:b9ff:1e7c with SMTP id 5b1f17b1804b1-4b55e07e569mr10214435e9.15.1793826575088;
        Wed, 04 Nov 2026 13:09:35 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b4533873f0sm77710365e9.4.2026.11.04.13.09.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:09:34 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:09:03 +0100
Subject: [PATCH v2 17/27] selftests/landlock: Fix SIGURG handler setup in
 scoped_signal_test
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261104-selftests-refactor-v2-17-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Drop SA_SIGINFO, and rename the function to setup_sigurg_handler()
without the parameter.

* Drop the SA_SIGINFO flag: This flag implies that we use the
  three-argument sa_sigaction signal handlers, which is not the case
  here. (c.f. sigaction(2))
* Remove the "int signal" argument and rename the function:
  The function was already specific to SIGURG and this is better
  communicated through a different name.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/scoped_signal_test.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/landlock/scoped_signal_test.c b/tools/testing/selftests/landlock/scoped_signal_test.c
index 0f88a6af9c72..66fec3822812 100644
--- a/tools/testing/selftests/landlock/scoped_signal_test.c
+++ b/tools/testing/selftests/landlock/scoped_signal_test.c
@@ -392,7 +392,7 @@ static void handle_sigurg(int sig)
 		signal_received = -1;
 }
 
-static int setup_signal_handler(int signal)
+static int setup_sigurg_handler(void)
 {
 	struct sigaction sa = {
 		.sa_handler = handle_sigurg,
@@ -401,7 +401,7 @@ static int setup_signal_handler(int signal)
 	if (sigemptyset(&sa.sa_mask))
 		return -1;
 
-	sa.sa_flags = SA_SIGINFO | SA_RESTART;
+	sa.sa_flags = SA_RESTART;
 	return sigaction(SIGURG, &sa, NULL);
 }
 
@@ -506,7 +506,7 @@ TEST_F(fown, sigurg_socket)
 		EXPECT_EQ(0, close(pipe_parent[1]));
 		EXPECT_EQ(0, close(pipe_child[0]));
 
-		ASSERT_EQ(0, setup_signal_handler(SIGURG));
+		ASSERT_EQ(0, setup_sigurg_handler());
 		client_socket = socket(AF_UNIX, SOCK_STREAM, 0);
 		ASSERT_LE(0, client_socket);
 
@@ -612,7 +612,7 @@ TEST(sigio_to_pgid_members)
 	ASSERT_EQ(0, setpgid(0, 0));
 
 	/* The non-sandboxed parent is the protected (out-of-domain) target. */
-	ASSERT_EQ(0, setup_signal_handler(SIGURG));
+	ASSERT_EQ(0, setup_sigurg_handler());
 	signal_received = 0;
 
 	ASSERT_EQ(0, pipe2(trigger, O_CLOEXEC));
@@ -629,7 +629,7 @@ TEST(sigio_to_pgid_members)
 		EXPECT_EQ(0, close(sync_child[0]));
 
 		/* In-domain positive control: the child must be signaled. */
-		ASSERT_EQ(0, setup_signal_handler(SIGURG));
+		ASSERT_EQ(0, setup_sigurg_handler());
 		signal_received = 0;
 
 		create_scoped_domain(_metadata, LANDLOCK_SCOPE_SIGNAL);
@@ -737,7 +737,7 @@ TEST(sigio_to_pgid_self)
 	ASSERT_EQ(0, setpgid(0, 0));
 
 	/* The non-sandboxed thread-group leader is the SIGIO target. */
-	ASSERT_EQ(0, setup_signal_handler(SIGURG));
+	ASSERT_EQ(0, setup_sigurg_handler());
 	signal_received = 0;
 
 	ASSERT_EQ(0, pipe2(trigger, O_CLOEXEC));
@@ -1062,7 +1062,7 @@ TEST_F(trace_fown, deny_scope_fown)
 		EXPECT_EQ(0, close(pipe_parent[1]));
 		EXPECT_EQ(0, close(pipe_child[0]));
 
-		ASSERT_EQ(0, setup_signal_handler(SIGURG));
+		ASSERT_EQ(0, setup_sigurg_handler());
 		client_socket = socket(AF_UNIX, SOCK_STREAM, 0);
 		ASSERT_LE(0, client_socket);
 

-- 
2.56.0

