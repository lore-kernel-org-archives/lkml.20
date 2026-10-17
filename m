Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B38C145A1F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 03:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792208857; cv=none; b=dpm4ym5K+KRgLMQwbdW5oL+GkhscnP62tD+W8oj9L10aFQTlN6WOMrPS6/NRtEgSmS/9qY0xwP4Cgbr1aMdIWTktw9RwakYnTVSPARtb9GSa8TpWYMKyOK6C4rwhzPQe11CG7DfquioWEWQe4vEFWdNuwH6Ae6d5wJNyF952sK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792208857; c=relaxed/simple;
	bh=MUjE5UvY5TFLFvC88hAg/5brexNvPOfwVPQknculFAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References; b=SiDiDNH+bwS/E6iaaEhZAeD7Dnri3c8HLbsNYv6e17oHYntn7zymdelN55IH8e9KTyZWtI7CkzNb1mu4BiupzUmqBgAtje9lW8TaVCX9A2fx6N+PyV0YsX9QeId7hAd53na4u2ki+zwaKOlfbJr3YRKdu17CKS/MPx73tZka5eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=isanhlg1; arc=none smtp.client-ip=117.135.210.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="isanhlg1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID; bh=MUjE5UvY5TFLFvC
	88hAg/5brexNvPOfwVPQknculFAs=; b=isanhlg15h1X9VNJ+81jaAybXrHw16J
	jitZ1Che4XWDBdXwmomoLlkuy7KvD8eMm/mIQWxgJbirxbSxtheDZARb2RMZOb2+
	1U+hH7RKVuboeJf8ewOVPURCPH8usKi8Nn5spEB6CHqqtle3jPlkC/jMTlAtdxDx
	7+zIz6VZZxGo=
Received: from localhost (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wD3P7eM79JqJ3bMAg--.29230S2;
	Sat, 17 Oct 2026 11:46:21 +0800 (CST)
From: Hui Su <sh_def@163.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Hui Su <sh_def@163.com>,
	mingo@redhat.com,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] sched/idle: Make forced polling state race-safe
Date: Sat, 17 Oct 2026 12:35:00 +0900
Message-ID: <20261017123500.76882ea23304d57d9a3524ca@163.com>
In-Reply-To: <20261016090143.GR2009045@noisy.programming.kicks-ass.net>
References: <20261015094211.4156055-1-sh_def@163.com>
	<20261016090143.GR2009045@noisy.programming.kicks-ass.net>
X-CM-TRANSID:_____wD3P7eM79JqJ3bMAg--.29230S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrW7Kw4kZF13WF13Jry7KFg_yoWDuwb_ur
	Z8JFs5J3yrJay7t3Wvyr13XryxGasa9r9rZF18XFWft343AFWruF1UJrZ3uws7Jay5Ja17
	GrnIgr13ZFy7AjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7VUjaii7UUUUU==
X-CM-SenderInfo: xvkbvvri6rljoofrz/xtbC6g1uzWrS743okgAA3k
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> This is about cpu_idle_poll_ctr(), right? Is there any actual
> concurrency on that thing? Afaict there is just init time twiddling
> there.

Yes, cpu_idle_poll_ctrl(). There is an in-tree reader/writer path during
system suspend. OMAP4 calls omap_common_suspend_init(omap4_pm_suspend),
which installs omap_pm_ops; its .begin callback, omap_pm_begin(), calls
cpu_idle_poll_ctrl(true).

platform_suspend_begin() invokes that callback from
suspend_devices_and_enter() before suspend_enter() calls
pm_sleep_disable_secondary_cpus(). A secondary CPU can therefore still
be in do_idle() and read cpu_idle_force_poll while the suspend CPU updates
it.

I haven't found an in-tree pair of concurrent cpu_idle_poll_ctrl()
writers. The two-worker stress test exercised the counter's behavior with
concurrent writers; it does not establish an in-tree caller pair.

If cpu_idle_poll_ctrl() writers are expected to be serialized, I can
rework the patch around the actual reader/writer concurrency instead.

Thanks,
Hui

