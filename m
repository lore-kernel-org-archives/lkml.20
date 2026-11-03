Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720096;
	b=w0Itzilw/eIh6gdzfYDOBeAyw5yZu965wooxaaSnKWyT808hNYBMnUiVdLeQosUwcmsN
	 GtwJ+zVfUKnKdf2beVvE81lZ9Xpd8jTdONvLq1ZEhEfPEGsuUHqwCfajKranzCQCkvAMU
	 vgFSN28iuXhykbFFakvb4sAr4tvBPNEEt4kDnhVn1zMPmEz+0siMngPZMJ277bRL0RXkz
	 BQVjB0JOkz/e+YkW675bTkaQeSownhsKKyBL/aLJwFufGADP8GZK4HzceeUg8Bhhm+TNi
	 Q55d0OZw51DU5+UYaQXZdYTXfjq0mmymTMUgR11vXifKGbFdrVMBWJB5KE5O+p5/Jmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HhcRZEH+04vR9Ns2ermSLszSPV9tZtFpE1GJn9nCycI=;
	b=zw1NjyNBVSBBhkjUlhejbYay6+YjGAkPIEoBZSWcSVG/qkYHg6mXlr0cVfQgXubrjbTF
	 Blup/ju0kJWPFhBPsQNcl2t5A2bWgANYg6S8NqfF6ZMQ7DePMMJ6k9EIhBrXA3Kfsr+c8
	 v8FNAJ4JiIV1cUkp6Y0a0M9D/egh6nN7EV86DipBtyIyknK/7yZE0CR0R9rQvYf17LUHZ
	 VmEj74VfWKbPD8JiB58T3Wf6U4jokNXPwBM8T4B7AIRJrqDVWjx0hZld9Kklx5tk2XbIe
	 pqtpr45o8xN5TeJmTaQJQGPu5h+dtDtdut12NLEtJFkrMTYrqQIyIFOdcqIaDNwmTsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoC058uN;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25FBF606A32F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 15:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25FBF606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZoC058uN
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c49c32650adso561753866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793720094; x=1794324894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhcRZEH+04vR9Ns2ermSLszSPV9tZtFpE1GJn9nCycI=;
        b=ZoC058uNRTWONlApzCWduPnoHSTl5PrH3PXUOadVayVz2xPAN/D9/yRuD15nDZglKw
         hX1SClpHL2d783H8n6CKGaCCryw8waUpv6NIMS36LHtsKC504/ffd/Yz/r3d58idv+rN
         R01H9l5tvLSlgNwF/fUlVOXarN+/hhylGCRJfJlFmJFEiQ78gU7gv7BDSyxvjegsZhyx
         Sv469rGHWE8CpGn+1edBofd5mC/YmuMLt1ayCsiiFRBY+ZGc6vRGaMqpANV+HA3WJpyt
         inMtWt5SRsj8Mt2gKRzFJv38moinxiyOUu8R8xU0Zg6nNse4pMIvims8rufk3dI+7kVM
         B7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720095; x=1794324895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhcRZEH+04vR9Ns2ermSLszSPV9tZtFpE1GJn9nCycI=;
        b=zJ2iGZ7GOYEiJ6NdP0/e04HtfZLBuou0zX6dnt9QkhR831iZUP9VVyj0XoT3fJtaxB
         qJwc1b0nHWQQ3DIla/AGeHFW5U7aEH+pNxT0bBZ7wBCQj57HUB/Ioa27VlwYQ4ym3D7/
         7W10kg2GFUFEImqOsg9LXX8Fw2lGzcm3gRA0JmTWc2oFncc7vk2pLYHBeN+2qk4NxmA2
         p4vlFWBdSKz5Xp4nvWzUuGoEOqJ3aAiTWVutPq9QTDoYDk5tY4orPJ35FHiogX3KjMEG
         x5N39WNt3sMfYcoPhLW+xjuMGJpnrR+0fB+C1Ehn9/TLv4IwwXV2wH5hbB1LQj8bwG+a
         2inw==
X-Forwarded-Encrypted: i=1; AKwUvBxANT24lXeuvrm8lrzgL31L8cwFeMBEn8W/vJRP0aLnUW8u4uC8uHSXzc1yp0lWold2PyD/4E5LGdvGmyc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+oRw6n8fSnpHWb8Cvw3owJko/s9I6u5667igxyS0nzjn7J9uXn
	Hbl6+P1x2ilZv7TxeNNpIGyZxWFPiatp32GFq1nbYAlRdUhH2Usbjgyq
X-Gm-Gg: AYBFou1Y1bKKAVU4rHRlTiD5wPcvmNYDGQiFMuyBVEE9jsz03VqZNtyCUbth0ndPTe4
	XG5TrYIGXNzfgEeHtiLVp96tdZY1/d5BdIdF6WHnyAZw+RQGxJ8AWLzhJMieVvwnl9f0Fz6OrFG
	m8sDW8jUCzmgItnkhrvx5XRCqcVtSokGHVIP9LXc1tgnyLTyrcfy/yyOCw9BVEroPcNrLLI/co5
	Yb9QabMTbUwV+VGPb6P9Q+f7+nZmyVQdymVGBHGs/RNZS+TPvo1D+ImyZB5Fn7qZB5id744jxr6
	f/CVA3iGoStCVkUcvw/lX6mFvKZjfj06aaw4asY8klqlp05ChGbi4cFox2V/CTvg7kaxlOQQUDL
	Y2c/Y/7fC/NsTTIi+667iA0uBO5mwQSy2pK+uEYGUXMqg0hXZmH63VAuid+dmZmq71s0pUE/b+R
	x8nYfBQh5e4O+cs5nMDntNLDcXkZC95zGFhgMZ/jpuXsajeFAOPGTSVAvthyPRhPbHKG2nzf16Z
	f79siTQiRBPVCdOzu0epOtcQ7TyAT9A0qSin+QbkZZiTLQIx0smBogRlmfHQAPTCqY8lD4we2aI
	wqVwVErKt/X2MUbY/kFxXCYDNY5YhITGdbuSnKqzyHuEQv72szPkUDc+NTH+bLGjBOG/vxZFGO1
	cfw==
X-Received: by 2002:a17:907:9346:b0:c49:b9b6:4b5e with SMTP id a640c23a62f3a-c4ca7b1f727mr1085268366b.20.1793720094382;
        Tue, 03 Nov 2026 07:34:54 -0800 (PST)
Received: from andreayoga.wind3.hub ([31.189.68.219])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e7a1d9d71sm20358929f8f.48.2026.11.03.07.34.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:34:53 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-rt-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/deadline: Fix spurious -EPERM for migration-disabled tasks
Date: Tue,  3 Nov 2026 16:34:41 +0100
Message-ID: <20261103153443.187455-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103081149.DuyWNhVe@linutronix.de>
References: <20261102135420.244745-1-parri.andrea@gmail.com> <20261103081149.DuyWNhVe@linutronix.de>
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

On Tue, Nov 03, 2026 at 09:11:49AM +0100, Sebastian Andrzej Siewior wrote:

[...]

> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Thanks!

> Looking at sched_setaffinity(), there is dl_task_check_affinity() which
> makes the same check. It is skipped for !task_has_dl_policy(). This
> looks time like there is a small window in sched_setscheduler() where
> the affinity check passes, the task is not yet DL, and then
> sched_setaffinity() makes the affinity smaller.

Agreed.  __sched_setaffinity() calls dl_task_check_affinity() before
taking task_rq_lock(), which only __set_cpus_allowed_ptr() takes later,
whereas __sched_setscheduler() runs the admission check and switches the
policy under a single task_rq_lock().  So setaffinity can see a non-DL
task, setscheduler then admits it against the old, wide cpus_mask, and
setaffinity finally narrows it.

The window may be wider than it looks, too: it includes setaffinity
waiting for task_rq_lock() while setscheduler holds it, so the two only
need to overlap.

That's independent of this patch: the same happens with p->cpus_ptr.

restrict_cpus_allowed_ptr() already does its DL check under
task_rq_lock(), so doing the same in the setaffinity path looks like
the way to close it.  One thing to keep in mind there: when
__sched_setaffinity() races with a cpuset update, it calls
__set_cpus_allowed_ptr() again to reset the task to the cpuset's mask.
That second call should probably stay unchecked, as it is today, since
cpuset_update_tasks_cpumask() narrows DL tasks without a check anyway;
refusing it would leave the task allowed on CPUs outside its cpuset.

I'll follow up on this separately.

Thanks,
  Andrea
