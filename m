Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844277;
	b=XTNS2IV0eJNLXdcnj2+bBc+d6BoZ/4swToAIGcAF7tMVMJEngA0M39kKchhJi/QVJcm9
	 WRHLLyzZrh2APzVDCVFOLBFQdz+LBM1yZVGLrx5tx2M16G/xgadjs/1yAfVimBYeSBt0k
	 c0WOEkWdBkp1wUiUJgU3djRpNLa9oZqyMRb7HJ+vlVh3+rdiwwcysf+TMz1ja3pbv/4IH
	 88hppCMhWKzwNyTi9MIRYIyTf3VztKZgMwiX/hwryOV5v+DvDd/ZYIOyrJA6iYRYistvY
	 9tOWTznEy0vGM7N5ImLz242NFjDLKpT2lPGDp1PEDxg9ZH32wS8mO/304+pCKSJyyrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Rg5cNiJebGHhgIuE4cUJ0t8nRcn5/8hpZBjlQUcMURw=;
	b=jE5Lnh2InefJFu5JgCpWSnpCYQdZXiHvEhvb9R4E1UIKXskuCNtBh0+mD4J0yNNE+6ej
	 3YQf9qIZGtFjnB2iP0/54vx55usDXnloddlEP7M0VLXiwPvPLBnqknc6wGv8yX/X55KFl
	 qx8ExPYfgPWXp4txay8lhFEXK0teUKkMGTr5IWxpEK/Pgt9PRwBKfhttVgI/tYQy7gQai
	 MGxWc3mblJ0Nh1qw+YcRMh8WDzqzVahVAz6BKw9BO5uNRiTegw4xqTi5H1V2WkwlTew52
	 T8as/OJDhrpM/+LIvY2pXRij4OpdI4QkxtHcv1Xn0ARnfaIAg9c4uxEay3T9SB9xQ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C18RzGPT;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE9D606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 15:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACE9D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=C18RzGPT
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb68c197c7so20308425e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 07:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794844275; x=1795449075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rg5cNiJebGHhgIuE4cUJ0t8nRcn5/8hpZBjlQUcMURw=;
        b=C18RzGPTl7UgD3Xc7eBTAmIjH+LDdKo1o5l8fdXJD51+gyX1ZRmWVGUiezfVpsSQLZ
         MC4FwYCN6zBVu6J1VtI66maf3dRweHU6FDPmMqD74gMUJ8Gxudq5oaV2/Ba7a97edolI
         u1eV2WPeWAmt6X3noQKC+HlCR5t0pGvc6U/sWiamakjposM0GScNSys5l+UoQ9KCxXyt
         Emf2ePI8kJCR3EwmHY3Pcr9a+ZOwTjKjG/BhNYOElLMwwxJOElc8ihKK0oF6Ij6jDJyR
         DUrtKfSDy2WcETigPmdpivjKNxf17ah8iE6Fvi6FhTwQ4HHqO2lufLduB6MmfEjF9C1H
         O5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844275; x=1795449075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rg5cNiJebGHhgIuE4cUJ0t8nRcn5/8hpZBjlQUcMURw=;
        b=gxuMRcocJOMwGvyYSGJyyVvgb5tdh8marqQ9CCOW8MQcv557UOu8K9pqpsrl0LOX8T
         8D9/j7K+EEUR86eKiSZOLEuW8hBQEhM9tmY/REd7kwBffTXdYqpxN8KXEnV5PGZMc1oi
         QfHZWGfQTxT5osTVPWx2ruGy1w8Kr/+XNjBfTwQxkA3OAiqKa0qUvk5AbrmD/LcTMdHb
         4ZVw6tLB0OqQezPHIXkSWUMWjASL+NwQrSTzq16EayrlB8SvD6+ep41BpXKhnI5vluWT
         afJRhSL/V4SqRCvKqANfd/xalxXACYnFX7DOxgLgzjdjANc0wbWxLjqFiUaOsXPHDIEB
         sW+A==
X-Gm-Message-State: APuU4Z8cw5IWgaWFTibeejuxXoyYT2qHovy+aVer1iZvbS/JyrunKHmh
	t3PyVirj6LpIMdzOODKWUziBXZMcM1bwPLAFwG+Lnm/1Te1YsFia6tVaVrznIBqtaHhDUTVAmyL
	lCoYC97g=
X-Gm-Gg: AYBFou37VOKOKkoHsz7kbYcRS2vMbKL3tg1oii5bs0wtWFB9D3UtrvP0r7h6QEie7WJ
	4HhmK74GbwrwDIJbZ00qruuAfmBUACS1oOTN+oCFvMp3dh+AjSAtCfgzDFhHpLnkk/trs7WCQ8n
	DfX/UmDIa/PY7FNlMVhKqpaYeIE4HryO34RQBe//4gNnpR9d1fYXYfYAizQx28S98Lt8IIaaTVt
	AKLTUOGK1iKuA8B7bD1rfJ5FMEbdr9AqbC7EVBCmKCBLbs1KG6jF6m3kfcXQFedBCKcPWBaOIYf
	BWUVM+PeAgUhCxaoX/2mBxI36FUcuq/30MvtlBSwvNIAnH2pYDff/g88+Ezznx2DBajGxzsWS5h
	5oVpYF96wOtTHFc+ffgTHc7vvHtVhSvek4Ij9ocNpwplzriQhhPuXTqphmcNCRxXuiSOjeLS2sy
	QQg57M3WD2fcFXgCKrNb0tZZm3NYW2zgyS3dJnNyv09BU393horq0ZDziAJRPGc8uB6EAsmm4Vd
	PfuotaiZ8Ri7RlheHTaGuVuRHk2ZAn3c3AxEn/IEsd5/FYDbDgs3LUegZHs0BdHjdh2/wNnCd1z
	J+wQKjLcZeZiWTS/Lz929eC8G7PtT14ig921uiFyDq1TIk1sQYE=
X-Received: by 2002:a05:600c:a114:b0:4a3:12fb:1ee7 with SMTP id 5b1f17b1804b1-4bb55aa7c58mr182844375e9.25.1794844275047;
        Mon, 16 Nov 2026 07:51:15 -0800 (PST)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb679b7e1asm298063515e9.6.2026.11.16.07.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:51:14 -0800 (PST)
From: Marco Crivellari <marco.crivellari@suse.com>
To: linux-kernel@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Frederic Weisbecker <frederic@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@suse.com>,
	Breno Leitao <leitao@debian.org>
Subject: [PATCH v6 1/2] workqueue: Make alloc_workqueue() unbound by default
Date: Mon, 16 Nov 2026 16:50:50 +0100
Message-ID: <20261116155051.157875-2-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261116155051.157875-1-marco.crivellari@suse.com>
References: <20261116155051.157875-1-marco.crivellari@suse.com>
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

Currently alloc_workqueue() ensures that one among WQ_PERCPU or WQ_UNBOUND
is present. Now every user has one among these two flags and if nothing
is specified the default is WQ_PERCPU.

Transition to unbound as the default: while some users benefit from the
strict affinity and concurrency management that per-CPU workqueues
provide, for a lot of users they don't matter and they put significant
restrictions on what the scheduler can do with the work items. Unbound
workqueues now have non-strict (soft) affinity scopes, so they don't lose
all the locality benefits while giving the scheduler more flexibility,
which helps system-level concerns such as power management and isolation.

In order to achieve the future goal of removing WQ_UNBOUND from the code,
start changing the default behavior making alloc_workqueue() act this way:

  - if WQ_PERCPU and WQ_UNBOUND are present: remove WQ_PERCPU (as before)
  - if neither are present: add WQ_UNBOUND

BH workqueues (WQ_BH) are always per-CPU and can't be unbound, so
WQ_PERCPU is now unconditionally forced for them before the above
defaulting logic runs.

The WARN_ONCE() when neither flag is present has been removed: from now
on, every alloc_workqueue() user without WQ_PERCPU will be considered
unbound.

The defaulting now happens before the workqueue is allocated, since
unbound workqueues need the node_nr_active[] array. Doing it before the
WQ_POWER_EFFICIENT override also makes sure that callers passing both
WQ_PERCPU and WQ_UNBOUND get the warning regardless of
wq_power_efficient.

Update the WQ_POWER_EFFICIENT comment accordingly.

Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
Suggested-by: Tejun Heo <tj@kernel.org>
Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
Reviewed-by: Breno Leitao <leitao@debian.org>
---
 .../admin-guide/kernel-parameters.txt         | 15 +++-----
 include/linux/workqueue.h                     | 23 +++++-------
 kernel/power/Kconfig                          |  7 ++--
 kernel/workqueue.c                            | 37 +++++++++++--------
 4 files changed, 39 insertions(+), 43 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 2e8ee12e06de..5d4b42e04c94 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8548,16 +8548,11 @@ Kernel parameters
 			The default is 4 times. 0 disables the warning.
 
 	workqueue.power_efficient
-			Per-cpu workqueues are generally preferred because
-			they show better performance thanks to cache
-			locality; unfortunately, per-cpu workqueues tend to
-			be more power hungry than unbound workqueues.
-
-			Enabling this makes the per-cpu workqueues which
-			were observed to contribute significantly to power
-			consumption unbound, leading to measurably lower
-			power usage at the cost of small performance
-			overhead.
+			Enabling workqueue.power_efficient kernel parameter makes
+			the per-cpu workqueues which were observed to contribute
+			significantly to power consumption unbound, leading to
+			measurably lower power usage at the cost of small
+			performance overhead.
 
 			The default value of this parameter is determined by
 			the config option CONFIG_WQ_POWER_EFFICIENT_DEFAULT.
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index 6a220a57a9c6..1caacdb5bc8e 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -378,11 +378,11 @@ enum wq_flags {
 	WQ_SYSFS		= 1 << 6, /* visible in sysfs, see workqueue_sysfs_register() */
 
 	/*
-	 * Per-cpu workqueues are generally preferred because they tend to
-	 * show better performance thanks to cache locality.  Per-cpu
-	 * workqueues exclude the scheduler from choosing the CPU to
-	 * execute the worker threads, which has an unfortunate side effect
-	 * of increasing power consumption.
+	 * Workqueues are unbound by default. Per-cpu (WQ_PERCPU) workqueues
+	 * exclude the scheduler from choosing the CPU to execute the worker
+	 * threads, which has an unfortunate side effect of increasing power
+	 * consumption. WQ_POWER_EFFICIENT workqueue are per-CPU only if explicitly
+	 * marked WQ_PERCPU.
 	 *
 	 * The scheduler considers a CPU idle if it doesn't have any task
 	 * to execute and tries to keep idle cores idle to conserve power;
@@ -392,19 +392,16 @@ enum wq_flags {
 	 * turn may lead to more scheduling choices which are sub-optimal
 	 * in terms of power consumption.
 	 *
-	 * Workqueues marked with WQ_POWER_EFFICIENT are per-cpu by default
-	 * but become unbound if workqueue.power_efficient kernel param is
-	 * specified.  Per-cpu workqueues which are identified to
-	 * contribute significantly to power-consumption are identified and
-	 * marked with this flag and enabling the power_efficient mode
-	 * leads to noticeable power saving at the cost of small
-	 * performance disadvantage.
+	 * Per-cpu workqueues observed to contribute significantly to power
+	 * consumption are marked with WQ_POWER_EFFICIENT. They become
+	 * unbound if the workqueue.power_efficient kernel param is
+	 * specified.
 	 *
 	 * http://thread.gmane.org/gmane.linux.kernel/1480396
 	 */
 	WQ_POWER_EFFICIENT	= 1 << 7,
 	WQ_PERCPU		= 1 << 8, /* bound to a specific cpu */
-	WQ_RT			= 1 << 9, /* real-time priority, valid only with WQ_UNBOUND */
+	WQ_RT			= 1 << 9, /* real-time priority, invalid with WQ_PERCPU */
 
 	__WQ_DESTROYING		= 1 << 15, /* internal: workqueue is destroying */
 	__WQ_DRAINING		= 1 << 16, /* internal: workqueue is draining */
diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
index 71165e7f04f4..1a1880d7867a 100644
--- a/kernel/power/Kconfig
+++ b/kernel/power/Kconfig
@@ -374,10 +374,9 @@ config WQ_POWER_EFFICIENT_DEFAULT
 	bool "Enable workqueue power-efficient mode by default"
 	depends on PM
 	help
-	  Per-cpu workqueues are generally preferred because they show
-	  better performance thanks to cache locality; unfortunately,
-	  per-cpu workqueues tend to be more power hungry than unbound
-	  workqueues.
+	  Workqueues are unbound by default. Per-cpu workqueues can
+	  benefit from cache locality, but tend to be more power hungry
+	  than unbound workqueues.
 
 	  Enabling workqueue.power_efficient kernel parameter makes the
 	  per-cpu workqueues which were observed to contribute
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index aed0516424be..558049dbb894 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -6121,6 +6121,7 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 						  unsigned int flags,
 						  int max_active, va_list args)
 {
+	bool wq_dropped_percpu = false;
 	struct workqueue_struct *wq;
 	size_t wq_size;
 	int name_len;
@@ -6130,6 +6131,23 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 			return NULL;
 		if (WARN_ON_ONCE(max_active))
 			return NULL;
+		flags |= WQ_PERCPU;
+	}
+
+	/*
+	 * Default to WQ_UNBOUND if neither WQ_PERCPU nor WQ_UNBOUND is set,
+	 * and drop WQ_PERCPU if both are. This must happen before the WQ_RT
+	 * check, which rejects workqueues without WQ_UNBOUND, and before
+	 * computing wq_size, which depends on WQ_UNBOUND. It must also
+	 * happen before the WQ_POWER_EFFICIENT override, which would
+	 * otherwise drop WQ_PERCPU when wq_power_efficient is enabled and
+	 * hide a caller passing both flags from the warning below.
+	 */
+	if (!(flags & (WQ_UNBOUND | WQ_PERCPU))) {
+		flags |= WQ_UNBOUND;
+	} else if (unlikely((flags & WQ_PERCPU) && (flags & WQ_UNBOUND))) {
+		flags &= ~WQ_PERCPU;
+		wq_dropped_percpu = true;
 	}
 
 	if (WARN_ON_ONCE((flags & WQ_RT) &&
@@ -6160,22 +6178,9 @@ static struct workqueue_struct *__alloc_workqueue(const char *fmt,
 		pr_warn_once("workqueue: name exceeds WQ_NAME_LEN. Truncating to: %s\n",
 			     wq->name);
 
-	/*
-	 * One among WQ_PERCPU and WQ_UNBOUND must be set, but not both.
-	 * - If neither is set, default to WQ_PERCPU
-	 * - If both are set, default to WQ_UNBOUND
-	 *
-	 * This code can be removed after workqueue are unbound by default
-	 */
-	if (unlikely(!(flags & (WQ_UNBOUND | WQ_PERCPU)))) {
-		WARN_ONCE(1, "workqueue: %s is using neither WQ_PERCPU or WQ_UNBOUND. "
-			  "Setting WQ_PERCPU.\n", wq->name);
-		flags |= WQ_PERCPU;
-	} else if (unlikely((flags & WQ_PERCPU) && (flags & WQ_UNBOUND))) {
-		WARN_ONCE(1, "workqueue: %s uses both WQ_PERCPU and WQ_UNBOUND. "
-			  "Dropped WQ_PERCPU, keeping WQ_UNBOUND.\n", wq->name);
-		flags &= ~WQ_PERCPU;
-	}
+	WARN_ONCE(wq_dropped_percpu,
+		  "workqueue: %s uses both WQ_PERCPU and WQ_UNBOUND. "
+		  "Dropped WQ_PERCPU, keeping WQ_UNBOUND.\n", wq->name);
 
 	if (flags & WQ_BH) {
 		/*
-- 
2.56.0

