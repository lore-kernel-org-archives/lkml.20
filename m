Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793826541;
	b=3Br568tcnZkqhMENIhOzvsougtn1oRguVTJegkq2/TWhlOlnTarxKmXeTUIWaEm+OjY5
	 SMWMK8toDdt0R4fWiMFOWqhxU7s++ORMpprw3EOzrvR5PTuPWdBzniHdImYLoTIaUFKeb
	 DFC2DhPt2vpwtSG+ZCgD+0biXjb4m8DH1oWEO8VDLu9uzAio1yO4mogrgHdrYmyJLJ+LR
	 NfRg7qLknaeIbSPTqPbAMOhJM022jUZnf3yJHVdPmAqSvUtuo3SBFyphOWXVbBppo/oH4
	 Cp9SnTc25nxKK4ulUENqt6rArcwQqkZ0bOGi/j3p2ACZeeQRmsZcA0ENOF83dT7TYOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793826541;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eVQTW/JXU3QoFsiEVwefLqQuHI3QztXWs28WnRbhTu0=;
	b=rycJCrDuidwi/kNFPDYuWm87IjZOCd/faHe1/999z0f27AzGJUwvof1Wf3M0HOBTvWm5
	 8sftydXblZM+ckK+62aHddw1mIOkK8DHLdf+5Pbp/iiORY+WJzPSpKH4h1qk2qzE1iE2F
	 NKYo2kGUMPfgv8uJHRBMdk22abIgCBcFG40JZDmeXL6D8dSgJdiumJL2hBJCISj1H8WQw
	 fnA31ZvU7khb+mz5ORtzZFmqpKEf+evVZYWg9Haga1Q/lo4oYt8leGRczdDejWR6nNk5V
	 ZwxzbigT7yAQOoqkbZCJokdAR61qKZpfhDEVJX7CTiMAyjuURj1Yr2FI2B4q8Uo3gBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLSgcH4i;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732DD6070F2A
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:09:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 732DD6070F2A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fLSgcH4i
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso8900575e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 13:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793826539; x=1794431339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eVQTW/JXU3QoFsiEVwefLqQuHI3QztXWs28WnRbhTu0=;
        b=fLSgcH4i/dzvkJSRKSDMNrc6SjSUPCpo58LZ4L7HayI6Xp9uXKaWbXBFNzxdk/xC7l
         74+r684UMRnZgko5aoMtN2Ip+omTLmmoZFPmOKhHWZRjAcTyUL65zl/E6yX7suI4ayuN
         a3mCtguZb1xBJoR9OZ/FJBTc487bLDZxdUFgeddjL7dxYAj4IsPdTZ827tLQEPkTBypI
         JARrhXiSsJ2v0KK+y4KhZv679QGGdPXapFc+0h4jdISXOspNpbIrCOW/bdwqjhcRP4MT
         h4M06dT/S5UWD0LwmIwN88BpRoAt/s29QO1DQYvz/wyQPem648MgJVTyF0ZakMSMyZyd
         15tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793826539; x=1794431339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVQTW/JXU3QoFsiEVwefLqQuHI3QztXWs28WnRbhTu0=;
        b=E5HkzPsaUl2iXbVqLTCLCiXxPnRKPmu549N5iezLvFEx8d2SAWQ70M5ulXlDD5HVH4
         Et3UL3OAqYJDYO6uIMKmdOKMsWdCphNsKpxeEiMFC0IYVWhPKdH+xOJI843y8PBRfbEg
         xErKp7foNxJ1xq9p25kRVtJstUj78thKeNsFdNHNDJpWTqog4vyotkaHB7sJbZqbOOVK
         Ur/xZa0TrgHkiI9hmO1WdWRUlpUhoRf11YZAs6psgtkfisbO86PukqjG+Y7JMWStlNov
         BRyjATVPmRxrWjpBfu81Zg4hf9JpzwlPHDDpXvarfy6y8JSyDzCDIiZI1hNolqDzMGdJ
         od6Q==
X-Forwarded-Encrypted: i=1; AKwUvByzCmlfIFbWxEXH4uNAbpQqqjphXDRAkhSVJa1fzBoMbZ/q67dyttCMo2B23HAqcG76IL1U7I5zkkrzX5g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OrRs3qT0Kro8El2s/EKcTemhpdCEQGUxJA86pR3bG65ionbHW
	yJmlciEf/YXFntYVNZzGaPj9ChL+uY7k5WRyCeJDy0D5MsXJjs7JK6bWjEgCrXMe
X-Gm-Gg: AYBFou0+HHo7jzOo2wPdd1ZH6tu551DmOVSWoqEBc86Q4t+Mdmj7LwhduKP3QTJE9z7
	npMgqrDlTI148uvwwhoDImeCabhhQkdsn/oaHV6+cKHhaOfmk+hX60YB6CNGQMHbsH6MxweyQZN
	88EuKJnqlP7oAgUSRyw9ar0bfEn0slkcjDwW+BWj+GPAio2IeTtqSOHIgZyQOacMN1TtEoSV/fC
	CfdIUJYRouOj4ihm1ackF4g5yIMVwCpSHRudTGKT4LWpxAAE50PeaUl+IS9w45F254hdDKcsw+B
	JwgIvPPnpLl8TStO8JCLrxgsJ3ruzYhEybUU0VH6zjeXY97YwUPO7w8xzuPCEjVjGUZS9Tdt2Pc
	UQJWyHm8tis1qCPf4T8y4TpZI3/zlMFRW8Hqt7ACj/X8hCkpyqQ4fZ1P/dsjy0kFiT4as9/5U/q
	1O3FzwqHjVDX3kv//zuuBmXC6Z1Wkw+wkNpdik3OQE7e1cX85UNVYeoDJzXy2plQgiRoxveHJ1S
	ea0VqsG7hYSj3pthue583HL803VyFnCGr8/IQrewCDR8DzF+lIKBVBp8QqnpOSW++hALJvCXOSh
	Z0ldtUmujuIe/06kprK6EdaEFknWW69hKidD87DM/MudoCoJQZuVyPKXeVM4jUuK3zgpM4OtU8Y
	=
X-Received: by 2002:a05:600c:314a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ac1775316amr367177345e9.12.1793826538751;
        Wed, 04 Nov 2026 13:08:58 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48feda2007esm5673249f8f.47.2026.11.04.13.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 13:08:58 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Wed, 04 Nov 2026 22:08:49 +0100
Subject: [PATCH v2 03/27] selftests/landlock: Check the thread result in
 audit.thread
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
Message-Id: <20261104-selftests-refactor-v2-3-c52f23f7ce33@gmail.com>
References: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
In-Reply-To: <20261104-selftests-refactor-v2-0-c52f23f7ce33@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

thread_audit_test() reports failures through its return value, but
audit.thread joins the thread with a NULL result pointer, so these
failures go unnoticed.

Check the returned value, as the other thread-based audit tests do.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 tools/testing/selftests/landlock/audit_test.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/landlock/audit_test.c b/tools/testing/selftests/landlock/audit_test.c
index 502a0825d877..81cb31aa32ad 100644
--- a/tools/testing/selftests/landlock/audit_test.c
+++ b/tools/testing/selftests/landlock/audit_test.c
@@ -227,6 +227,7 @@ TEST_F(audit, thread)
 	__u64 allocated_dom = 2;
 	__u64 deallocated_dom = 3;
 	pthread_t thread;
+	void *thread_ret;
 	int pipe_child[2], pipe_parent[2];
 	char buffer;
 	struct thread_data child_data;
@@ -270,7 +271,8 @@ TEST_F(audit, thread)
 	/* Signals the thread to exit, which will generate a domain deallocation. */
 	ASSERT_EQ(1, write(pipe_parent[1], ".", 1));
 	EXPECT_EQ(0, close(pipe_parent[1]));
-	ASSERT_EQ(0, pthread_join(thread, NULL));
+	ASSERT_EQ(0, pthread_join(thread, &thread_ret));
+	EXPECT_EQ(NULL, thread_ret);
 
 	EXPECT_EQ(0, matches_log_domain_deallocated(
 			     self->audit_fd, 1, denial_dom, &deallocated_dom));

-- 
2.56.0

