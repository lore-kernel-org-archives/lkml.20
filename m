Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804751;
	b=0Z4nrWcOIM8nFpAxL2O1kRFnFwPWtauNdJB7qA4R9DNl9/IOgMACB1wtq9TmOjC46bfW
	 r6A/FAAaP2Z/Ya7CPwD8m4WtgwHTbL0N1o/nNpkX+5YBlJQg2vgOBKizixTLLoKpgAhcP
	 bDHOAxt0fHuItekB9C9kFDTn5YIeuH9xzbxuec7NT1FOyE6pXAe+1hZZIueLZoFJRXKAf
	 Fk8NejZdicEsfgfMpJyfCooaezjad3qpNdtC2+MiHwT2zkEz41OcXj+SpaC/1dv5HVw/K
	 VAMWDF0ZRpndOpb/O1K+hrgx0WEhIxadkg5X4lCpFzQMgAnlfuH9hI8P5rXYZ+5O2eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804751;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=PuP2zuTWqcFE3/oMam8ThzkjXoGsXsbiDEkxCNmKUIg=;
	b=A3GI8zSHsjDE4yNjigO3GDPvfe9DdRJBJb8iddHNtbCT3bCvG+hfDBOmDKfNYzwBbmL8
	 nLx7ifmquASOMyW+LVcuQ6z5cX6fPBJvScbmE6mZcAFAsdOGz1swRdw8D2KTR11uFSH49
	 gy9fh8NMSY3LoL3PAHg9ChtijxfIFWO+Fe4MwJAIyM22AOrCb5VyZQsKAfr7sRSpVQCnV
	 5L+IAyktqFvIWsZW7KRSzLqPSAXgdDOvYLDhaQOHFLU6ZSoamEIvMB0EpJoSXht+oBi8A
	 s0ngC6IzvB72rng9jgfjmfIpLSFoExNHVjkWGm978/5bcKytPWuG8gvCh+epzFI9TpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=evalinux.com;
	spf=pass smtp.mailfrom=evalinux.com;
	dkim=pass header.d=evalinux.com header.i=@evalinux.com header.a=rsa-sha256 header.s=google header.b=Eo68ob9V;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE53606A33E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:05:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAE53606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=evalinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evalinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=evalinux.com header.i=@evalinux.com header.a=rsa-sha256 header.s=google header.b=Eo68ob9V
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-84e513877a3so650431a34.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evalinux.com; s=google; t=1793804750; x=1794409550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PuP2zuTWqcFE3/oMam8ThzkjXoGsXsbiDEkxCNmKUIg=;
        b=Eo68ob9V2mMtODN+yQGPwYvGyhRGFcszgFohgee+JNSZmp3xyzODVTHwlW4Acy7Rg4
         Ff33jluJFSLdW6XwgrEhihnB0oPv7T+iIL1Q02aHTEhEeoRa0elL80KUpBkhCkj6t4gX
         l2kElfK85gdJgar89Nx9B6wGa6nmOX0eoVDn+6pP+AMeazWqa+qAJSjXPLsyfbnYunu3
         iwTmDdANMHGf4Nw9GTclU+Ozi4Onf+sNY3KIz777tzF5MCKQzXUzknfWbGgGiZE1o6A7
         D109HtTZw8iSaBNiOaSeufKtw0HDFor7NxHzHCFGjrnMUhFqknrz2Yt0wVVEpMQSWGO0
         Y5aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804750; x=1794409550;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PuP2zuTWqcFE3/oMam8ThzkjXoGsXsbiDEkxCNmKUIg=;
        b=zIrrsZtcsr2bI+FKMVZJDQ/DLnmURV26raxDUiRZcSg8oWMkUrZI4k73Gluhu1ZJ8Q
         aGQYhJXT2ivpMB9E7QHt2ULbp4528LGLlRSVd3gSrpp3V5dA2NQ4FrjB/K0hdWTDSOrx
         q8l30zl4TnHFs/IO5sSFNJ/dM+XhEnTi6XdhjJfJXDuR3G96gQ4dDjBmdF5XzbYJ+9oB
         b35tslN2dzJ83SEUbnCuqMHGdXcSbxftm6e6uHAbV2FcfpBJGncLpx+Z35hW02n41p5D
         TeNe9n/pAV4M+C/QPna1QxLp5veywETls5hK0q2cCC81HWTW4pcg1UN9IgyASRyBRFH2
         75rg==
X-Forwarded-Encrypted: i=1; AKwUvBwAKStzm/wDP8eBkAP6dAMZATrCxdaWdaA+Xc+FpChcGsZZ8KpyNlpijn9d/nr3lq3i6GhZZ9L5ogxv+KM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iYVOr5MnT0mPbhEOfNRzlDrs4ZyiOYgduEf0JqvtyzXJ/2dbz
	aAgOq/lEKXqLc2kQlFR6GWBtrYFO4NNzYihy97gURThJ+0O5i0oyiW91gg8cVvN7+t0=
X-Gm-Gg: AYBFou2Ri7ABtQOpN5NmGKnCD7TImYr+U910X4WQ6ITkgUyd0nmPzPC8I6xnKI9gOg9
	uzKUrKRqoPmfrgdmhUHzjOlXNGbxq2CHIW8/KoFl31i6iZhjIdVV8RVJg3kzwYGr74OYTxA6qQ6
	QY7FP2TJGjtDXoGoISV3RYr1uM0n31wToqqYHRk8LwUdzgIvB3ylNR3TDA40PBWGPl2sV2bqafl
	zGcXoFmzbFpR6fOUYVKsOFpVwL4ym/NnPkaOhkpRff3IIgSC5orEJ0wEqDAeuf9F7aI1ugGRs59
	VJPcpm2CzI13nGO6ywDB2C3BRdHma6CZBX1ueuZMTAFg6hMPy7TtkxEKaWHK2qUCIJ3x4VPTL0T
	z8IigW6bWdcF9vAizNwTACBqAZcweozRVmP96CDLwtxbjYHNqnqNGT+g2VBTL/sghBS5RF0QzZp
	3wE7xyVQMgFo8MR9eGzX87PrxucHPtv82PjO6CoUV2T+evM1n+71o9kaT8U42uf4/D9Jj2CJMQC
	26yfwaJ2j63wQJmBXjPNDXA1c0uwwc6FM8bFlMcaSvmp63kKCqMHQG5MYC8aln5WDU1ZpnPbBMh
	GVMDFKsvrPmSSoGbNxtRORvqu3TWCASozFweJkRra7kxU6FUqUF/v3TiLG63yjOHRTKlCto=
X-Received: by 2002:a05:6830:6412:b0:81d:9acd:ee04 with SMTP id 46e09a7af769-85d35ef0575mr8247769a34.0.1793804749819;
        Wed, 04 Nov 2026 07:05:49 -0800 (PST)
Received: from desktop.casa.g02.org ([187.247.185.7])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85ef3e98892sm1982467a34.19.2026.11.04.07.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:05:48 -0800 (PST)
From: =?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Shuah Khan <shuah@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Wake Liu <wakel@google.com>,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
Subject: [PATCH] selftests/futex: Skip futex_requeue_pi on unprivileged thread creation
Date: Wed,  4 Nov 2026 09:05:46 -0600
Message-ID: <20261104150546.1041422-1-renich@evalinux.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The futex_requeue_pi and futex_requeue_pi_signal_restart selftests
create threads with the SCHED_FIFO real-time scheduling policy to
exercise Priority Inheritance futex requeue operations.

When executed without root privileges or in environments lacking the
CAP_SYS_NICE capability, pthread_create() fails with EPERM. Currently,
create_rt_thread() asserts that ret == 0, causing all 24 parameterized
variants in futex_requeue_pi and futex_requeue_pi_signal_restart to fail
unconditionally. Missing execution permissions should be reported as
a skip rather than a hard test failure.

Handle EPERM from pthread_create() in create_rt_thread() by invoking
SKIP() and returning -EPERM. Update callers to check the return value
and exit early so the test harness records the test as skipped.
Privileged test execution with CAP_SYS_NICE or root remains unaffected
and continues to run all test assertions.

Fixes: b7d837c2d49e ("selftests/futex: Migrate futex_requeue_pi to harness")
Fixes: 7fe733f11215 ("selftests/futex: Migrate futex_requeue_pi_signal_restart to harness")
Signed-off-by: Rénich Bon Ćirić <renich@evalinux.com>
---
 .../futex/functional/futex_requeue_pi.c         | 17 ++++++++++++-----
 .../futex_requeue_pi_signal_restart.c           |  7 ++++++-
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi.c b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
index 65326cbef3a4..afcede02fe9c 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi.c
@@ -143,6 +143,10 @@ int create_rt_thread(struct __test_metadata *_metadata, pthread_t *pth, void*(*f
 		TH_LOG("pthread_attr_setschedparam failed");
 
 	ret = pthread_create(pth, &attr, func, arg);
+	if (ret == EPERM) {
+		SKIP(return -EPERM,
+		     "pthread_create failed with EPERM, need CAP_SYS_NICE for SCHED_FIFO");
+	}
 	ASSERT_EQ(ret, 0)
 		TH_LOG("pthread_create failed");
 
@@ -358,8 +362,9 @@ TEST_F(args, futex_requeue_pi)
 
 	if (third_party_owner) {
 		blocker_arg._metadata = _metadata;
-		create_rt_thread(_metadata, &blocker, third_party_blocker,
-				 (void *)&blocker_arg, SCHED_FIFO, 1);
+		if (create_rt_thread(_metadata, &blocker, third_party_blocker,
+				     (void *)&blocker_arg, SCHED_FIFO, 1))
+			return;
 	}
 
 	atomic_set(&waiters_woken, 0);
@@ -368,12 +373,14 @@ TEST_F(args, futex_requeue_pi)
 		args[i].id = i;
 		args[i].timeout = tsp;
 		TH_LOG("Starting thread %d", i);
-		create_rt_thread(_metadata, &waiter[i], waiterfn, (void *)&args[i],
-				 SCHED_FIFO, 1);
+		if (create_rt_thread(_metadata, &waiter[i], waiterfn, (void *)&args[i],
+				     SCHED_FIFO, 1))
+			return;
 	}
 	waker_arg._metadata = _metadata;
 	waker_arg.lock = lock;
-	create_rt_thread(_metadata, &waker, wakerfn, (void *)&waker_arg, SCHED_FIFO, 1);
+	if (create_rt_thread(_metadata, &waker, wakerfn, (void *)&waker_arg, SCHED_FIFO, 1))
+		return;
 
 	/* Wait for threads to finish */
 	/* Store the first error or failure encountered in waiter_ret */
diff --git a/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c b/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
index 4933612a7b55..69de80790bbd 100644
--- a/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
+++ b/tools/testing/selftests/futex/functional/futex_requeue_pi_signal_restart.c
@@ -61,6 +61,10 @@ int create_rt_thread(struct __test_metadata *_metadata, pthread_t *pth, void*(*f
 		TH_LOG("pthread_attr_setschedparam failed");
 
 	ret = pthread_create(pth, &attr, func, arg);
+	if (ret == EPERM) {
+		SKIP(return -EPERM,
+		     "pthread_create failed with EPERM, need CAP_SYS_NICE for SCHED_FIFO");
+	}
 	ASSERT_EQ(ret, 0)
 		TH_LOG("pthread_create failed");
 
@@ -111,7 +115,8 @@ TEST(futex_requeue_pi_signal_restart)
 
 	TH_LOG("m1:f2: %x", f2);
 	TH_LOG("Creating waiter");
-	create_rt_thread(_metadata, &waiter, waiterfn, _metadata, SCHED_FIFO, 1);
+	if (create_rt_thread(_metadata, &waiter, waiterfn, _metadata, SCHED_FIFO, 1))
+		return;
 
 	TH_LOG("Calling FUTEX_LOCK_PI on f2=%x @ %p", f2, &f2);
 	TH_LOG("m2:f2: %x", f2);
-- 
2.56.0

