Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA9A52EFDA4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146459; cv=none; b=AND+0f4ZgiiuuEraHXKvRGMxcdVaX6IXC3V7o5JV4Ni67pPwdZ4GyrbTDTZO07y184FislBQb6FiaKj5tra5NyN8t/ccwbXyU6bviA9yBt32E7fDty2ZQWIAdgUUT8+TkSUYG5tmm8OJ5BfcVpR9ioGKTniJouOZu0kVxaqjiRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146459; c=relaxed/simple;
	bh=ub9lmV/vJgIvt/52cHA9hak78+wXdVZ+Y0e9MlYNLQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQlq1VpcNQiQGnyunjTr3d72wteoPDhdaJJQxjc6A0VGQy0XgJsDrl/oitJMTTPhDB1eLVi9DaKJIxGkPpIww2SoXnPQUnQ2NJKedLeE+LMMC+/YlQxv0KG64WzjLtI1tNzGeFqTTWofIjKN1hICtwmCcMUc7cnTASw04psBs4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRDZBxYA; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRDZBxYA"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so444618a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790146455; x=1790751255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBPFJ7pxrxjtZgenSu8SvKuqY5moK00ZFB2fToeyYWc=;
        b=NRDZBxYAy2bPOWNeTf5QXaE/7XzsdGjWfJLlNnNvz6ifxZM9DD6f7z97XheeW0xr0i
         MzTKfFyh7LE1X6AOzvlkV83TJRVpqFvq3Ph/8poL+sTmzvY4DilZhplT6Z+umr4aTmy5
         4VWLwoItw8L1qg0UFBriZi07FdvvAQlb5DFwTYMWvwbFfrAGuWwxFKCKO42iI50duK7N
         j0AGEk7Tga0SjpPa/wsL8Pn+CX2+mi8lb8LWpNUAvFLWIMwZ7Q9k9gpurKLQZQaTs91R
         AqEBx2iBdiDrbWm4ryBsGp/zh44/UWofiEa5776aKh12EAfqWT9iXAezNTipSL+hsli3
         vrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146455; x=1790751255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cBPFJ7pxrxjtZgenSu8SvKuqY5moK00ZFB2fToeyYWc=;
        b=H/oepKiCC76Teoq4vi3xwdV3Y2iJk7Z2EkuRstTVBY9H3nhLwzG5dzZPdp8fgzgSDA
         hg7o9H763jRH74F8aGcHnz4P8ZuraJdbUt8SEDlMJObQeXwIukANPAaX80qDqW1swohQ
         OGGI/jIHzwo+7ofGe5plUCEcwAkzk96/mQ4ovLxEkLmPldNuWQhTUg8SkCSWE2J/0wRC
         wESs6EEp3X1Rzs54lMGWfl7nFKRhcrwf2xcoTfjAlc4cIqGw6qaVo8qPzrScwpjOaJu2
         DAjdPPRcj5LW4RZdckNJsxzXzXFCBMA6yLljeidtVmXEVZwWYQIGruMk/lW0Wz6EsUoq
         PWBA==
X-Forwarded-Encrypted: i=1; AKwUvBx5XoJ+Iud6q7MPFFItxucQWjVqrAJ92hrcGIYNTTZCedZqEbRLe85DanjWQ/2SBydUTfO82rvF25nc55w=@vger.kernel.org
X-Gm-Message-State: AFuF++lcwiFRZ5uTA8XHEs7RS6/+E+7kWf48IfwaDo1DpUfRTVYscMBl
	SgwWb5u6qgbq6wGYs3N8ByjNGqnaOqUHe7fMRZ+TKlONfUv3kn6WbP2d
X-Gm-Gg: AYBFou0DdixjCGTh/4eK+ZR5YlaqpwXEXF4Sfb6ygHtJfGgtcAvrb1dUHabhNf9oSdj
	qOAjoh+aruJJIHyUwQMK2If82xmyYum8efO/8eig5UdHmNnw92Dx0n/ZqhgQSPXTpBTDLCtX1ww
	Gc1OKmb8ebrDUGZjN7eIvgHP6Dmv04m4nniRYBD1ee7/hsiYGfJRWI5/GyhgSjJZS0j1B9bK5v8
	+kcWhLX5xmA32i56tGNmOGY0xBL+bHHBBpLTAceEqxDqa5vdl5IQ+8jCOOcjtgNt80QcAsxOIWh
	9IedUIhSzjhsMrkxpbhalSDBKtBYV6AOlQ80aMebEs3Mv/tt/6OmyqqtBxDaLATwznfz1oCf8d6
	0Hib/Psqy1jjOuHDZF0kK3fyk8tQyqzHDufIms2OwmY72b50UNyQQ1w3tQjHJAj6rBh+cQlqWXj
	TOfu3ZVOrrAd0oJM+lYD8NC4cwUCq70BwqcLF6pkqMscDlRghyoWE6c8iMw49dzYi7RpEFgR+z/
	6+Y/UOPx0SB
X-Received: by 2002:a17:90b:3d8e:b0:39d:c3bb:98e7 with SMTP id 98e67ed59e1d1-3a07e568935mr1435549a91.6.1790146455101;
        Tue, 22 Sep 2026 23:54:15 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc2b2fdsm3321787a91.12.2026.09.22.23.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:54:14 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: Zhan Xusheng <zhanxusheng@xiaomi.com>,
	Ingo Molnar <mingo@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Stultz <jstultz@google.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Tim Chen <tim.c.chen@linux.intel.com>,
	"Chen, Yu C" <yu.c.chen@intel.com>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 04/13] sched/fair: Remove magic hardcoded margin in fits_capacity()
Date: Wed, 23 Sep 2026 14:54:06 +0800
Message-ID: <20260923065407.3451520-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260504020003.71306-5-qyousef@layalina.io>
References: <20260504020003.71306-1-qyousef@layalina.io> <20260504020003.71306-5-qyousef@layalina.io>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 05/04/26 02:59, Qais Yousef wrote:
> -#define fits_capacity(cap, max)	((cap) * 1280 < (max) * 1024)
> +static inline bool fits_capacity(unsigned long util, int cpu)
> +{
> +	return util < cpu_rq(cpu)->fits_capacity_threshold;
> +}

This does not hold on current tip anymore: fits_capacity() has picked up
a second caller that does not pass a capacity, and the new signature
accepts it silently.

kernel/sched/fair.c, invalid_llc_nr():

	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
			(scale * per_cpu(sd_llc_size, cpu)));

The second argument is a scaled count of the CPUs in an LLC. sd_llc_size
is a per-CPU int and scale is an int, so the product binds to the new @cpu
parameter with no conversion and no warning, and the test becomes

	cpu_rq(scale * per_cpu(sd_llc_size, cpu))->fits_capacity_threshold

With the defaults (CONFIG_SCHED_CACHE=y, sysctl_sched_cache_user=1,
llc_aggr_tolerance=1) scale is 1, so this is cpu_rq(sd_llc_size), which is
not a valid CPU id on a machine with a single LLC. invalid_llc_nr() is
called from account_mm_sched(), task_cache_work() and
can_migrate_llc_task().

Separating the two uses first makes 04/13 safe to apply. Something like
the below, against tip/sched/urgent (3cb0243767fd, where the cache-aware
fixes have just landed; sched/core still has the older mm->sc_stat form).
It is a no functional change, since x * 1280 < y * 1024 is equivalent to
x * 100 < y * 80. Built with CONFIG_SCHED_CACHE=y and =n, no new warnings.

I can post it as a standalone patch if you would rather not carry it in
the series.

---
 kernel/sched/fair.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 57360f5cdde4..97ce56fcaf85 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -1526,6 +1526,21 @@ static bool exceed_llc_capacity(struct sched_cache_group *grp, int cpu)
 	return false;
 }
 
+/*
+ * The margin used when comparing the number of a process' active threads
+ * with the number of CPUs in an LLC.
+ *
+ * Mirrors the ~20% margin of fits_capacity(), but is kept separate because
+ * fits_capacity() describes a utilization versus CPU capacity relation,
+ * which this is not.
+ *
+ * (default: ~80% of the LLC's CPUs)
+ */
+static inline bool fits_llc_nr(u64 nr_threads, unsigned int nr_cpus)
+{
+	return nr_threads * 100 < (u64)nr_cpus * 80;
+}
+
 static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
 			   int cpu)
 {
@@ -1542,8 +1557,8 @@ static bool invalid_llc_nr(struct sched_cache_group *grp, struct task_struct *p,
 	if (scale == INT_MAX)
 		return false;
 
-	return !fits_capacity((READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads),
-			(scale * per_cpu(sd_llc_size, cpu)));
+	return !fits_llc_nr(READ_ONCE(grp->nr_running_avg) * cpu_smt_num_threads,
+			    scale * per_cpu(sd_llc_size, cpu));
 }
 
 /*
