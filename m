Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7469C3BA22C
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033862; cv=none; b=cyy6z0GmDewgvXwtoAa0xc1fyuQ0OmBu/niyJvyErNd41vf9glvLfCPnPpObmq8FwWYYxmTFl/eMUR8QIqEZXpCsmfrJ7gTE5xUOECU0q0DBHjfnc7mRFLWKKleiU/LUkIcDatXwBA6+g+V7oaYKzGqoqHEBcqMB9kgMwoM42pY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033862; c=relaxed/simple;
	bh=hXVzNa9ZlZdfYYpHI2GPJxnoU3Y55Fe5BwsHyOwV9zw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tQN3dn5P1Q3prc07fVULJyFH9pljvk6It7Ho6ev33XzM4GFgkfFcmxW1fVqEJ2a/riN7owZ0txVpumPg4pjI+nRaX06WFleuXdKqNqhNGjBg96meR8r/6D7Xms1T9BY4i2SovG/DxPtGsHh7NdjP/KDZgOSuXRX2GxIn2XaxXTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WD+iiPSW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WD+iiPSW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc891373e0so71708105ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 02:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789033861; x=1789638661; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e0pNJdng574bxrNPyGtPZNhfKMoffShydr0b1ZjVxig=;
        b=WD+iiPSWBnHWVCzCHhEQxKuLD/9kLziAkXt0LMDW4OxQuubgiyaodqDLF1rGFRKzEf
         lMZs6O0Y5CMUe62p49UkUVjGS2xS520hR8bQEVk0CgnlNNZtouLp8oknuVlHRrJd2d9o
         Pv2URMNCF24MDVDgtaqnbtt+1fDv7T8i13PVbFJZtzj9neNunZj42CQeyxf11m/Sz/F4
         eHePmEqgmUhU0E0uZBRd7DDdvjgvvkFs3fW1FlTVUZlL3+HMFudu8ztLOoyvDWfy9ZQn
         xIpH1dP7hwVCoc6EyMSEdaLx/QxyB1axB0uRuvpB5ak5kd74878gv3FWAVeU38pzeaVI
         2YqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033861; x=1789638661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e0pNJdng574bxrNPyGtPZNhfKMoffShydr0b1ZjVxig=;
        b=k7lmstyzCoNIaNKSXnQxoDLGDSEZ4YqXt6F3wqnmV5pVY3lDxJJXycr1j/w4zAmTXn
         QuwWYoPp8JIM1LBqYTjl3PAA8eP7W4gLOUmVN5tZxgYvtaU4+RRP8qCA3FLJVyS4YHrg
         We7QruAvmg45DZjmWlnBQVpGTvnsocvBNrwIgxWsdx+/mxVpdJWaRPQDG7B/HXllRjFh
         yT8tODMY8mOyKYx4q5xsp4V+urEotRTpO2gDg1YlF3yL5spMhCQ8H56unUwZepBAKqhv
         FPI6IrCDo5xuRz7Tf18pZ8yZR8+mpAOckJ/ZvHIlkvrMW2oK62CQT8vPe31Cfe26bPPD
         o/bg==
X-Forwarded-Encrypted: i=1; AKwUvBwYVyivZUOZRMhbxxp5Qq0bPAn6IuVOGHZIch0ShYdismyN1ck9KoGc2qn815K72F5E+KnvydTg0XQZ0zg=@vger.kernel.org
X-Gm-Message-State: AFuF++moyzcrPR1ODNpaskKXdFuKsQLHC8nqLbDnuS66r996SbQQBHul
	wPqabd7IKSwe3QN5+30NLyTGLuvctOx29bLap2FcDwlTYF9TNGvr1xY=
X-Gm-Gg: AYBFou3HQb7t75QO2UsujKXv1yugUIo3TKEQy6vkzRdS3R3JE84wX0bpAAOptyJ8JRp
	VWqrcTE+OU24geWvDpICVhzMtJHNMvmhorvvvXn4a2ySsRWhMacM1IoWxZX47VdMd9NrE1gx2Ro
	7cZ4SxiSso4A5EsSPHt8wnOLS9Nu6zNWZ9mCebAoL4oMsUjrt1CrUK14eAy5H13ApNUL78RJyoT
	lx3PUOxsS/h6gyHPEQzmhVaqqVD0TiR40rTBKI/5GE847ZABputHT5wyza8fGKq26Au00Y/T2WS
	GhAs3XHtm1mOvr68ud6DPujRyO7uX+6x41r+nqGh6WhKF1Qap8OrevwaMDR8OJRY7r99zbzRJwa
	SZxG8wt9syjFk+cVD3K6UJa4yGx7DHBVnwUwseQBwgGGoWcHzSh3wHrgEqZInuw5GHq8S+kDuub
	VlWvws4wYUTu68hMCGBAnxA+eAF0jor488XV/O1cCc6fvJCZjFhHJyd5zwmgZEl1cSDxEi4Ciuw
	G2sLZbtLglxrzuhXrrqtxDtuQ==
X-Received: by 2002:a17:902:f708:b0:2dc:fcfc:bdeb with SMTP id d9443c01a7336-2dcfcfcbefbmr143111565ad.22.1789033860582;
        Thu, 10 Sep 2026 02:51:00 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:7f04:fd2a:f01d:1dc7:1e5:47d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db56c2a1f1sm54346945ad.78.2026.09.10.02.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:50:59 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Philipp Stanner <phasta@mailbox.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	phasta@kernel.org
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Danilo Krummrich <dakr@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: drm/sched: run queues freed before the TDR that drm_sched_fini() waits for
Date: Thu, 10 Sep 2026 18:50:53 +0900
Message-ID: <20260910095053.727808-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <608f03824420323f9c9d3bc29cfeb0bed714074e.camel@mailbox.org>
References: <20260910054605.634135-1-donggeunyoo.kernel@gmail.com> <6f52dcbb040b8ba796b56311e9a77465d111c868.camel@mailbox.org> <df7b0d1e-5a74-445b-90fe-fae30cee4cb3@amd.com> <20260910084408.703333-1-donggeunyoo.kernel@gmail.com> <608f03824420323f9c9d3bc29cfeb0bed714074e.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 9/10/26 10:51, Philipp Stanner wrote:
> Which KUnit test case exactly?

A local one. It is not in the tree - I wrote it for this, which is why you
could not find it. I should have said that explicitly.

It is a mock scheduler whose run_job() returns a hardware fence that is
never signaled, so the timeout always fires. timedout_job() then sleeps
long enough for the test thread to get into drm_sched_fini(), and calls
drm_sched_increase_karma() on the way out.

> I kindly asked you to provide more details about how and where the bug
> occurs. Can you post a longer stacktrace and also run
> scrips/decode_stacktrace.sh on it?

drm-misc-next 0878e6053d01, x86_64, KUNIT + KASAN + lockdep, run through
decode_stacktrace.sh (dropping the "? " speculative frames and shortening
the source paths, otherwise as emitted):

BUG: KASAN: slab-use-after-free in _raw_spin_lock (kernel/locking/spinlock.c:173)
Read of size 1 at addr ffff88800198b420 by task kworker/0:2/27

CPU: 0 UID: 0 PID: 27 Comm: kworker/0:2 Tainted: G                 N  7.3.0-rc2-00228-g483f69ec8ca2-dirty #7 PREEMPT(lazy)
Workqueue: events drm_sched_job_timedout
Call Trace:
 <TASK>
 dump_stack_lvl (lib/dump_stack.c:94 lib/dump_stack.c:120)
 print_report (mm/kasan/report.c:378 mm/kasan/report.c:482)
 kasan_report (mm/kasan/report.c:595)
 __kasan_check_byte (mm/kasan/common.c:574)
 lock_acquire (kernel/locking/lockdep.c:5916 kernel/locking/lockdep.c:5899)
 _raw_spin_lock (kernel/locking/spinlock.c:173)
 drm_sched_increase_karma (drivers/gpu/drm/scheduler/sched_main.c:1263)
 fini_uaf_timedout_job (drivers/gpu/drm/scheduler/tests/tests_fini_uaf.c:99)
 drm_sched_job_timedout (drivers/gpu/drm/scheduler/sched_main.c:355)
 process_one_work (kernel/workqueue.c:3396)
 worker_thread (kernel/workqueue.c:3479 kernel/workqueue.c:3560)
 kthread (kernel/kthread.c:436)
 ret_from_fork (arch/x86/kernel/process.c:158)
 ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
 </TASK>

Allocated by task 28:
 __kmalloc_cache_noprof (mm/slub.c:5563)
 drm_sched_init (drivers/gpu/drm/scheduler/sched_main.c:1148)
 drm_sched_fini_frees_rq_before_tdr (drivers/gpu/drm/scheduler/tests/tests_fini_uaf.c:140)
 kunit_try_run_case (lib/kunit/test.c:454 lib/kunit/test.c:499)

Freed by task 28:
 kfree (mm/slub.c:6792)
 drm_sched_fini (drivers/gpu/drm/scheduler/sched_main.c:1214)
 drm_sched_fini_frees_rq_before_tdr (drivers/gpu/drm/scheduler/tests/tests_fini_uaf.c:167)
 kunit_try_run_case (lib/kunit/test.c:454 lib/kunit/test.c:499)

The buggy address belongs to the object at ffff88800198b400
which belongs to the cache kmalloc-128 of size 128
The buggy address is located 32 bytes inside of
freed 128-byte region [ffff88800198b400, ffff88800198b480)

sched_main.c:1148 is sched->sched_rq[i] = kzalloc_obj(*sched->sched_rq[i])
in drm_sched_init(), :1214 is kfree(sched->sched_rq[i]) in
drm_sched_fini(), and :1263 is spin_lock(&rq->lock) in
drm_sched_increase_karma(). Task 28 is the thread in drm_sched_fini();
the reader is the timeout worker on PID 27. The tree is -dirty because the
test case is added to it. I hope this is what you asked for - say the word
if you want the untrimmed log.

> If the bug only exists because someone does not signal all hardware-
> fences (that's what we call the ones returned from run_job()), then I
> tend to think that this is not a scheduler bug.

Agreed.

> Though for robustness reasons we _could_ nevertheless stop the timeout
> work item before releasing other resources.

Right, that's what my patch does: drm_sched_wqueue_stop(), then
cancel_delayed_work_sync(&sched->work_tdr), then the frees. The report is
gone and nothing else in the suite fails.

As you say, that is closer to a cleanup - or to making the teardown order
state its intent - than to a fix. Do you still want the reordering patch?

Regards,
Donggeun
