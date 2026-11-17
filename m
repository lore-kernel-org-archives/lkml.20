Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929079;
	b=CoeDeBCZb1d/wHpAdc/ubdr2dEm5/Vr4WBR2YPEVntG/gb82YppmaAAF9m6T66pC2per
	 Bez3d93FefybQsZ0Sdz2m9asKKFd5dFbqy8L77NICCuhxKpTXosy6fykJ8pvwOCMpFsvr
	 iMro9DNSVDZa094W6hQFvVS/H9/kVHcTeGT1ZpiT2FHNyIFd6KzlY0U3593H4JBB1dZau
	 ZWvUa6UIN+JkeV4fjQVfxtGUyhUjPi0UPY7DUfsSkZGMTgATf7fMuM/wg22cNmKaJQ9g/
	 BS/Y4gSz+VAi4S9pQ1ly5Nj7F7Eu+CfNEEEgSXqAiA6lgUbZBkI9W58v09MWvcf8ehg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929079;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=QytR4D/8pfr26rJ2lN3lFwyHa1r4NNacXwQ6mOgcs9Q=;
	b=ZvszpUUy6RWyQl9ZitW+0Jfweh1NUS/1cBJFkJuraxGPhuuYwrqcrzHDXo8e6A51NWJM
	 r6HWfoORQTo7YHJGTd2kztVPvAm8x3obP5YEkARSO+hmnt3OG7q51K60XQZqlnW8m57o6
	 ce+lrvp6YkRYwj1qeqbQgABCALGEKcvCsfoW6pN1pdiSB/9DWZjhrd517xuJkw5tON1ll
	 CYcL4Eoj47z5yj5GJAslGA2SjGw4Be+zOVajmlMpuT6WrhoI5KehFfH17N9kEnxo/Nrlt
	 vtPFEqiDR4PDJ/FbkoSaUaMrrE9oeNxQTJKuuAvCEoDb2JPoTfFScf3/fnTFTUJlMLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knIZtXHX;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75642606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75642606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=knIZtXHX
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2ea19c28a50so2432805ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794929079; x=1795533879; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QytR4D/8pfr26rJ2lN3lFwyHa1r4NNacXwQ6mOgcs9Q=;
        b=knIZtXHXnYHrMUTT2JW65bkHnI6h9Q1Z+tKVaqFCRHFtqWJcuUaCTRq+2VE5zyiDp7
         b5BS4+ppl2QI9YQa+GKXLiGVl5UZ1ZGUFTIMA1oO2PtdIIb4DiVz6kt609vPm3B1D1gK
         NewfLKDC1pN6E3C/51zQmSxeRzLNvyI45StNjz0gkzdjRXtf2KZsQmNkfhuZOPW9LmF7
         Hj1MomHib+2VmgzlzGEAGsAHKGXR2uc/4xmr1+5xztYT0focv7MoelkuGZeZAlT7WPq8
         zPAL64JmoLBwMMWcjBySSqLJUJtN7l6sqZdtUeEEvfGFw1CK1zN69AJMsIvGZsJKEyzb
         6c8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794929079; x=1795533879;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QytR4D/8pfr26rJ2lN3lFwyHa1r4NNacXwQ6mOgcs9Q=;
        b=JJNl/PFN5JTnp+94ODyqVDjQ8KJC5zRHjjqDD5Zm62C+1lIohvJLQqIWLVQwQkJi8I
         8DCpm8lfDDDkOXDoSRE5l2shfYlXP6YahbW3JwEqIrHDWnEKvO+9LPiR6M09/Q70wPpI
         /g2B2xoduvqPkPifv4HBRcs+qMkDuKVRzuURClqOCCTemy6GfibxZzk/w7+PAkm/RVku
         KxiENVnuKoK+hjy87WHhYgyyTwm3+zwEXspXD79LiagAtDbjgJ01Nq6W9Ggv8Ci495x6
         xJ+AUk1EOYW+U4Qnsb/tro/pyji1N2uVj6xC/tgoXx7o3U76+KqDpaqqAYYUpP5OFUSF
         ZTxQ==
X-Forwarded-Encrypted: i=1; AL+hErEt6mVhXBktP4q41211C6E85k4Es1hBrOrRaEyzbOmMfTxr55HUmJYKCUW1R1+5k0XnbF1DOfeW4unt7/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8711CmszV45tWBKN2hZtK4YABRzxJhvGhumQIRFJYX5kKq36Eu
	hkRgkxiHuF3iLbHvq4yQ0xetDaZ40XwqsS7FubvTtjzRdYANKnFqmBku
X-Gm-Gg: AZFdTZfjHMMHERodBtnay6Vm/i3CjeMQztcuxlnIVtZiZyB5Q9KLDZ7iLwJ+lUgEmjm
	3D6++uYhHlFuOZAR41In0quXnEOSt9R471rrYkXFQx6l6vjgJJQDkUP/Lb9s+UbNM0ypg8pBx4A
	EYGrz5xSpBldZvlhunvYBsW6kn0Hs2pcDR9QuLcHem7ZfAlzH157AI5nOr0YZzPuq1Snn9/PIYJ
	ravNegBSNVuZlNrhma57grSd6mpOHdwL0V+IQ+fmJH/Szo7aOnZLlMuZPgxfkyPEZ6T9STFUyQg
	SrtJkfYHqkx6C/HmqyemYAaplhKccX+f/kmXhaQXBGTcbFTO7TAFGoTUU4GRdkFiAgdRTN3meyw
	PsIEDy4YvKcalaFs00mt77M0OJ6u57aYFYZTln13bmwmaMbXPc+0aLxOFaCMnEMZdmnp/YXh90W
	ASa7XiHdfreh6pk+aU6zIZ+nnVugEHNoMBXIrQVm3n+Y8o2Ds7/AVJvCdYvwy0ojLig9XG8xMGk
	dYj88rSSnLNsLPltKUjZ6TjPZzJ9IqaDj+iLoqGPSQ1x6FXNlTB8jkwbe4y7oBJb/SJHXnGjaNz
	FPgkcLP5HjIfDhSSYG2Et1w6qIoqyPIzM5+GR5oB3BHlqyV3xbAaMKy1WrRwxvE5zQulNEf8HO/
	I770=
X-Received: by 2002:a17:903:4410:b0:2e9:9263:a58 with SMTP id d9443c01a7336-2ee0d9e2804mr210962175ad.1.1794929078716;
        Tue, 17 Nov 2026 07:24:38 -0800 (PST)
Received: from DESKTOP-CJ1L666.localdomain ([211.198.99.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7a5867asm18050795ad.42.2026.11.17.07.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 07:24:38 -0800 (PST)
From: Jiwoo Kim <arpe1618@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] futex: Don't check lock_ptr of an unqueued requeue-PI waiter
Date: Wed, 18 Nov 2026 00:24:28 +0900
Message-ID: <20261117152428.1477-1-arpe1618@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Since commit bc7304f3ae20 ("futex: Prevent lockup in requeue-PI during
signal/ timeout wakeup"), futex_proxy_trylock_atomic() unqueues a top
waiter in Q_REQUEUE_PI_IGNORE state from hb1 itself, and
handle_early_requeue_pi_wakeup() only unqueues the futex_q when it is
still queued.

A futex_q unqueued this way keeps q->lock_ptr pointing to the lock of
its hash bucket. futex_rehash_private() only moves futex_qs which are
on a hash bucket chain, so a resize of the private hash before the
waiter gets to handle_early_requeue_pi_wakeup() leaves q->lock_ptr
pointing into the old hash:

  Task A (waiter)                 Task B (requeue), Task C (resize)
  futex_wait_requeue_pi()
    times out, requeue_state
    = Q_REQUEUE_PI_IGNORE
                                  B: futex_proxy_trylock_atomic()
                                       unqueues A from hb1
                                  C: futex_rehash_private()
                                       does not move A
    locks its hash bucket in
    the new hash
    handle_early_requeue_pi_wakeup()
      WARN_ON_ONCE(&hb->lock != q->lock_ptr)

The warning triggers, although the futex_q is not queued anymore and
q->lock_ptr is not used. Besides PR_FUTEX_HASH_SET_SLOTS, the private
hash is also resized when threads are created, see
futex_hash_allocate_default().

This was observed as an unprivileged user in a QEMU guest, with threads
of one process doing FUTEX_WAIT_REQUEUE_PI with short timeouts,
FUTEX_CMP_REQUEUE_PI and PR_FUTEX_HASH_SET_SLOTS at the same time:

  WARNING: kernel/futex/requeue.c:734 at futex_wait_requeue_pi+0x67a/0x6f0

It did not trigger with the requeue or the resize left out.

Only check q->lock_ptr while the futex_q is queued.

This was found with an AI coding assistant, which also drafted this
patch and its changelog. The problem was reproduced in a QEMU guest,
and the fix was tested there.

Fixes: bc7304f3ae20 ("futex: Prevent lockup in requeue-PI during signal/ timeout wakeup")
Cc: stable@vger.kernel.org
Signed-off-by: Jiwoo Kim <arpe1618@gmail.com>
---
This is a different case from the one in [1], which was about unlocking
through q.lock_ptr after a requeue. Locking through q->lock_ptr would
not help here, as it can point into the old hash, which is freed after
the resize.

A reproducer is available on request.

[1] https://lore.kernel.org/all/20260919221730.3707261-1-benquike@gmail.com/

 kernel/futex/requeue.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/kernel/futex/requeue.c b/kernel/futex/requeue.c
index 842d852302dd..6e3557a9f409 100644
--- a/kernel/futex/requeue.c
+++ b/kernel/futex/requeue.c
@@ -730,14 +730,17 @@ int handle_early_requeue_pi_wakeup(struct futex_hash_bucket *hb,
 	 * wakeup code can't change q.key from uaddr to uaddr2 if we hold hb.
 	 * It can't be requeued from uaddr2 to something else since we don't
 	 * support a PI aware source futex for requeue.
-	 */
-	WARN_ON_ONCE(&hb->lock != q->lock_ptr);
-
-	/*
+	 *
 	 * We were woken prior to requeue by a timeout or a signal.
 	 * Conditionally unqueue the futex_q and determine which it was.
+	 *
+	 * If futex_proxy_trylock_atomic() unqueued the futex_q already, a
+	 * resize of the private hash since then did not move it, so
+	 * q->lock_ptr can still point into the old hash, which may have
+	 * been freed. Only check it while the futex_q is queued.
 	 */
 	if (!plist_node_empty(&q->list)) {
+		WARN_ON_ONCE(&hb->lock != q->lock_ptr);
 		plist_del(&q->list, &hb->chain);
 		futex_hb_waiters_dec(hb);
 	}

base-commit: 408b129aac48b574c0c9d11137a89eefba825d5d
-- 
2.43.0

