Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342A2DCBE3
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 18:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790446746; cv=none; b=BZZFF0AV7fcAk7VffkoRBJiboF7p5myeGotddVk11ug9vIyUyLYNWgGyJcFCuNi69zOq4HZTFmATvTxXPb0x4ICkaL/r8Ulbcy/PW9eTz1wgWu5SjCUGzeuJmtDDiuAX4ZK6TtUTQ+s7ePXySKD9XaJ5o9coluvjnI/P/jHLjf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790446746; c=relaxed/simple;
	bh=cpF9jUuOal1P3jLM51JPKvAUhUnT39Pojo2P5ZrPNoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t7o4W06PaY5ik8c2YI4KopYAQithYfGW2NElJD2twbMgS+fQtk8McCzhS+bEKhpFZ/v8ZGOpeO7AMQ3FOLj6noxmhEWjQXD6aWCA3h8qizJlqFsJ7xz7c9bJg8wthcmySTlRWIG47N0v+aiwz1yxbcr0911PLnzy3WwAodN2Vzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSpnFZ0h; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSpnFZ0h"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48882bfcbadso170510f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 11:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790446743; x=1791051543; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AVxJYsueLGzmq5Sv5/va4SD2sa8Mw9i6BNlW0/izabk=;
        b=kSpnFZ0hRl+rwJ8uAtnOnNmAfdh7pZdzdxfAMprhoT9ImclRvsymvPtAZCBk3mMLPn
         sT4faYpPgbQH+lnWhJSZjh85f07/BA62yn1ZBf9UXHsTnXOSHxlYKHEVYwsyGPjgt5dS
         c9eMy7zdP2+S9/5WZTQ7YXwqKOuGNsQpk+W6nWqfXv9O/IhYrphy8zsxOeU9wnXOJATI
         bL5ajOIVsanUtP2RX2lUOhVDfzR3TDyyLjKBuJKDWI0nremR38yGCBdNDCKpY30qDiz8
         ZM5Nkn6rXKkIcHpncerrGQJUgkSkNmgTXR7Xk2asMvNKiHqMuaw1rNdYCK3wtslExWL2
         QjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790446743; x=1791051543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AVxJYsueLGzmq5Sv5/va4SD2sa8Mw9i6BNlW0/izabk=;
        b=AYYXG0cKFD8/rOHJaeS5mmPy7GHbGqksrZsEp7ihpJNKAFEomuSeYDmcGSvDdvpMlv
         dgceAznlOi6FowsD/cXi0W1mF+F8HoeRKQSsKfSrsvD6of9ZlMlahk8HwTy6QLfhpRC9
         u08LR+bp5DUHGW8b3JKbgyeW5uKNLK+sNsiWbCDz6V7zNOnCTBWl/pPhZPbtV++Wu/Dy
         FwtXUt2WrHO1tt4djt96kTcgja7LnhZdYEWMcv/aSrykzU++DcDcw4aXJ57K/UMDJXWo
         9dPX+n94MsxwqQVCLn7FbYP4oBLt7PmrpJ3eooCXaNdyWadxblgVs75w4lEdTqlAvRBO
         T4NA==
X-Gm-Message-State: AFq9FYIPrkMhuys8Na7Y4NUiscIvHqJQECQMCQhbg7oq+NlLGvEjRDX0
	BLk5pa0SaL2bQqQQmwgjiaJa7YNSi1FNpfTxIp30dkW551lZSTqP9Du0
X-Gm-Gg: AYBFou2ZSP/S0h9F/JdS96GD55TeEYw4NJZMnJ/wswnOVMV5KDXkI6G6euTDtW+lUE7
	xNAJ0w4UTNjvjFjbdD7D18TGgk/7shCfyvgFOVZkroxzm4PCZzDv5qecY9hqeSJNuRl/gJZrlsG
	8gq99AIMKpdvGzLP987rajLcbjRwQVOAaQYxjDS9Zvs4vB9vmJQ+Usg/L+3QBbUfLsEJYdI99mC
	HKr6/uDWIQc6mQJc4rXhIHEewk2u4JPpPc4tLkoqnBGuzfKXV76rv8dgYZ45DUy/DSe6zp5F5J3
	LD0FlDOBFnjfuwcngM2psD/rEnRoPnKMklg4wnrqYBrXMGjs3jjllccAvq6oDLGwFh/3vbIiots
	LLMHydM3ydiX4Ba+uW3724nZQkU7kqaLSD7/n8MRB/GlpOaNnaZGrMcQ4co39FzSbQ2i3lmOjbS
	TDTBd7ElY50LGgr7d/u2GqWQ1NGow9RrTrCmgNuoI8bFvisFxXvLZ+qINGV7v6eSFXMIArFaLur
	R0xbthOSayUYla4cgbGqoR57Z6sD+0=
X-Received: by 2002:a05:6000:220f:b0:487:14e9:5cba with SMTP id ffacd0b85a97d-4887ace3cd2mr10551538f8f.6.1790446742977;
        Sat, 26 Sep 2026 11:19:02 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b9aesm14297056f8f.5.2026.09.26.11.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 11:19:02 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>
Cc: linux-kernel@vger.kernel.org,
	qyousef@layalina.io
Subject: Re: [PATCH 7/8] sched/eevdf: Compare min slice during wake_affine
Date: Sat, 26 Sep 2026 21:18:40 +0300
Message-ID: <20260926181840.3107-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921152238.3804392-8-vincent.guittot@linaro.org>
References: <20260921152238.3804392-8-vincent.guittot@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Vincent,

> Add a new level in wake affine where we check on which CPU the task
> would most probably run 1st between this and prev CPUs.

> @@ -8402,6 +8402,9 @@ static int wake_wide(struct task_struct *p)
>   * wake_affine_idle() - only considers 'now', it check if the waking CPU is
>   *			cache-affine and is (or	will be) idle.
>   *
> + * wake_affine_slice() - only considers 'now', it check if the waking CPU can
> + *			 be preempted because using longer slice.
> + *
>   * wake_affine_weight() - considers the weight to reflect the average
>   *			  scheduling latency of the CPUs. This seems to work
>   *			  for the overloaded case.
> @@ -8437,6 +8440,20 @@ wake_affine_idle(int this_cpu, int prev_cpu, int sync)
>  	return nr_cpumask_bits;
>  }

> +static int
> +wake_affine_slice(struct task_struct *p, int this_cpu, int prev_cpu)
> +{
> +	struct sched_entity *se = &p->se;
> +
> +	if (se->slice < get_rq_min_slice(cpu_rq(prev_cpu)))
> +		return prev_cpu;
> +
> +	if (se->slice < get_rq_min_slice(cpu_rq(this_cpu)))
> +		return this_cpu;
> +
> +	return nr_cpumask_bits;
> +}
> +
>  static int
>  wake_affine_weight(struct sched_domain *sd, struct task_struct *p,
>  		   int this_cpu, int prev_cpu, int sync)
> @@ -8488,6 +8505,9 @@ static int wake_affine(struct sched_domain *sd, struct task_struct *p,
>  	if (sched_feat(WA_IDLE))
>  		target = wake_affine_idle(this_cpu, prev_cpu, sync);
>  
> +	if (sched_feat(PREEMPT_SHORT) && target == nr_cpumask_bits)
> +		target = wake_affine_slice(p, this_cpu, prev_cpu);
> +
>  	if (sched_feat(WA_WEIGHT) && target == nr_cpumask_bits)
>  		target = wake_affine_weight(sd, p, this_cpu, prev_cpu, sync);
>  
> -- 
> 2.53.0

this_cpu has min_slice of 7 while prev_cpu has min_slice of 5.
se->slice == 4, so on wake_affine_slice() prev_cpu is chosen.

Ain't getting onto a cpu with bigger min_slice is better for us?
If so, is this works for you?


diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 09f0667e97a2..e50c339e5c2d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8444,14 +8444,13 @@ static int
 wake_affine_slice(struct task_struct *p, int this_cpu, int prev_cpu)
 {
 	struct sched_entity *se = &p->se;
+	u64 min_prev = get_rq_min_slice(cpu_rq(prev_cpu));
+	u64 min_this = get_rq_min_slice(cpu_rq(this_cpu));
 
-	if (se->slice < get_rq_min_slice(cpu_rq(prev_cpu)))
-		return prev_cpu;
-
-	if (se->slice < get_rq_min_slice(cpu_rq(this_cpu)))
-		return this_cpu;
+	if (se->slice >= max(min_prev, min_this))
+		return nr_cpumask_bits;
 
-	return nr_cpumask_bits;
+	return min_prev >= min_this ? prev_cpu : this_cpu;
 }
 
 static int

Thanks, 
Kayra


