Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 259BD463B9F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345561; cv=pass; b=ur6KfnWZKGgc5MLp6tlmYueaFFCLeO38hmPTueyqC9odpZSj+cv1nfFqx/C61Su8Ix27/cjHQHW+Uc48vwejqIa51NyYeQwrtyUOqNDTogUic8m9HQlCwfrlcT9gAjVsYRk+LQuRlsSiNNjMY0FDllnu6mPE/8TnB3QFIyDV+7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345561; c=relaxed/simple;
	bh=heZ7cGBAse9BTCJy7vhJdogj0R+c/uPyz2YOwQNAH68=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXmEQNlFd2KHLMhu5Um4W++zCSdBKJ2Dbe0C7tYkFbefU2MK7xvwcNVg2jKD3toqBPYZ98wqVQzxCNhwX0E4aMwbQ413EipxhXdRR2ZXojH1cDPeIxBCAW/yg4YbHvj/1hGvofH41KCqgxGEAhdhZUqpmbfhMO6bXPrIs0pyQxc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WlMtjAcZ; arc=pass smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WlMtjAcZ"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6a5e329c0f2so1118718a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:39:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788345554; cv=none;
        d=google.com; s=arc-20260327;
        b=HfBwhXtQFlQt1n6jtlNyYkGf2q6oIuEBABMtW2nc7wrXsDHelneUQjPazjFWOZbVqp
         ofF89b/OBFfESRfNMm3aofWnS4Kg3yejDu5Vr/SQ96iveSkXJ9M8BhcFk65jHXB2LOWI
         QdZXtnpWzCVFKEq0N62f+86I6a9BXYl61fE9VXNaUjFMP04q8UrNARurP3sa8V7FXaAX
         pSn8aWpuuR2VfI/WHnxmiUYEgUAh6cqdgN/JwqZ/vpfe0C4vieSzmfCa9nRpexwxia72
         tD5py1/9Xpmln3oePZLmSjpjHw0wOG4PQZiRF84DdciaPffupoLn7jaEbs6Q7jStVUp/
         3Pgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hOVU+yqDFuHRGHEzaL07u69gjqarCydj/l545dvY71c=;
        fh=mRjLXMvEoD3/ETExho4NlFE5DnAmwso1D8kmz4IarRk=;
        b=GF15ccVljGhFZfvs3x2hgwPNWCT7ahaqHYCMQgyqor+72bPhEUQa5ltorSdvpY5nyG
         JXLGhkRit6TfspvdsUb8dRV2s1Yd67o0SbPGKguBoonkV/e4B/05u6GDPcqhdL6op+Or
         XjZvHryhjmfv5gDPdK3TAJI4Z3o8pLG1fg5p4JL0JPmj9Zj1I2kPFTmZbWtuiDYXOSKT
         8IW0zHSKIsXC0a0mlnCrkxCtee2NYdpMwUEcPnDITQj7hhxHtbn/wRjmXONB1mj23Jbt
         MICXB70pGM34Uo5rnlzgP8efISSlwolI1Js1T2Di5N+cKcIeW2278gXNBPA48I/VWu7/
         t6yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788345554; x=1788950354; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOVU+yqDFuHRGHEzaL07u69gjqarCydj/l545dvY71c=;
        b=WlMtjAcZvr3bMqxIDfjDMKmx7qVYkbKBkP32ls46SWXFGTphtwLPS9vgm9rzmh8Rb3
         BrYPZisttNQT+35O55QBomjaS/KL1M/Kqm/KTXVvvuhIEJmodtvli4s8ZbL3t8a5d0gq
         EJHvnlKq+ckOuD8NStqxYAZlPbJrvOjL81nG5KcAKgFuY2+4B7o6ngnHGOVdVw7ocFoO
         VSoQqIs5HUYHurhPQp9Jw/RBg3byE2uyEOl67kObFgKLsK9L9gXnISYX5OUBlZdPbv1v
         hlA0mvZZdAqPg/UWCiuJMdxgkj+hj4Rypqe+7to3htNABkExWTtwSFHW7eF6dLwhzX/q
         aFjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345554; x=1788950354;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOVU+yqDFuHRGHEzaL07u69gjqarCydj/l545dvY71c=;
        b=DxkSPCUDjgIQIMzInYK248cKa/kkGTg6AUgVeztBlxjt4ilwdTfCDlmCGUI2ZE2MWS
         FAU/+EMPMi/gNpe4xz5gQZv9XstEjH63PzRxRi9d/Y2ADxL1IJArg8uYApVkoSSjKtGF
         SsVrPC/QyT9CLv+2ohCcb2oqX3iy5CONVVbGH8PH6QMLMQJ2E7zVNF99IWOaqdm9IKK5
         sVXNSBKd8HmdNtIY5vCAC6Iw4l/t8IbXhVcy03QRejgn+bWJZk8wqjT14ZEa/6vQY6vf
         hD8FfY3yw9GFv9ULExz+IqDrH/iHOHe7Fher3NSrLJyGhLXwZOLy9PRNQSYJCrvqWkCk
         QdlA==
X-Forwarded-Encrypted: i=1; AKwUvByPBbkn6vU8w+wFlmCesnMLoOS7wQZVd5zQaawkAtRxcJya4hv8hAtEC4PnUZL4IlrO4ITjO0fGvRmL0eo=@vger.kernel.org
X-Gm-Message-State: AFuF++mAtlCcQEAczGUk0I2XQCGtLMwXgobJJNTKLQnM8A6oUBY/pHnQ
	Dag5aG9llGpDYEorkcUm3fYatOfblIluO4TPu8xkpEGmy7mfH55O16U7DyrKK5Zj0wuIfg0HRH9
	EDkr3eqWrHQDuRDtUhkBwrjGbw8eW0KssVr4LyB1vRQ==
X-Gm-Gg: AYBFou09h1X1qD158JRI9yke0qThPJecivpU63G9vraC7ctD/ycoUdkXILmolBXnIIh
	EOlwpqaWMRuhv0Psa4lx4RBAAay+QuRsZ7BjDv7Qba2jrH+zkPe9g8yTKhreU05QFRtD4ZrIHqv
	sgSWe2EW4fNr1IN4iCDkJql3auPhN3EvWSmlQfbXCMgpeTPVlG9z5oQK1HkvMS0oOZyH5u41+yB
	Nwr+Ppcr4bu0B0HU/BjIpnbR76Tcc4+RFdETes6jhvNWub525b8gBdZ49aJ92LL2mqxOgnjOKVv
	YyZ6KZDjX9zDf1/Ttyme0taV/CtX83FEU5latVL0LXHLEDhkyfWYIouiO6D90yaNyWhfUM1cuR9
	QCA==
X-Received: by 2002:a05:6402:2552:b0:6a6:c4b:c92f with SMTP id
 4fb4d7f45d1cf-6a682550fb0mr2313330a12.9.1788345554290; Wed, 02 Sep 2026
 03:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828074059.232353141@infradead.org> <20260828075558.660152190@infradead.org>
 <apezcsScwu5hdNrr@fengwei-dev> <CAKfTPtBNAGQUQZbaDKYU7+Nsrcnj4M4p=54XkeML7rrLy+x+ZQ@mail.gmail.com>
 <20260902081301.GS4120091@noisy.programming.kicks-ass.net> <20260902103654.GB4121620@noisy.programming.kicks-ass.net>
In-Reply-To: <20260902103654.GB4121620@noisy.programming.kicks-ass.net>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Wed, 2 Sep 2026 12:39:01 +0200
X-Gm-Features: AcwNN1VCB4oiGFyWQ-tjGkyX50_GGSaqM5ZWnMz8NekSbj25hoec4Fm5aQNpFVo
Message-ID: <CAKfTPtBcshM-BGr1qzfT233E3tr_bxZX6xkMTBjqdSKWFXz61A@mail.gmail.com>
Subject: Re: [PATCH 4/4] sched/fair: Rework/fix task_h_load()
To: Peter Zijlstra <peterz@infradead.org>
Cc: Chen Yu <yu.c.chen@intel.com>, mingo@kernel.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, tj@kernel.org, 
	linux-kernel@vger.kernel.org, chen.yu@linux.dev, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Sept 2026 at 12:37, Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Wed, Sep 02, 2026 at 10:13:01AM +0200, Peter Zijlstra wrote:
>
> > Let me go and try and reproduce.
>
> Different physical machine.. *splat*, virtual machine it lives. Argh I
> hate computers.
>
> Anyway, confirmed on physical machine that triggered it, the blow seems
> to cure things. I'll fold it in.
>
> ---
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -15287,9 +15287,6 @@ static void set_next_task_fair(struct rq
>                         weight = __calc_prop_weight(cfs_rq, se, weight);
>         }
>
> -       for_each_sched_entity_bl(se, cfs_rq)
> -               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> -
>         if (throttled)
>                 task_throttle_setup_work(p);
>
> @@ -15309,11 +15306,15 @@ static void set_next_task_fair(struct rq
>                  */
>                 list_move(&se->group_node, &rq->cfs_tasks);
>         }
> -       if (!first)
> -               return;
>
>         WARN_ON_ONCE(se->sched_delayed);
>
> +       for_each_sched_entity_bl(se, cfs_rq)
> +               update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
> +

should work too

> +       if (!first)
> +               return;
> +
>         if (hrtick_enabled_fair(rq))
>                 hrtick_start_fair(rq, p);
>
>
>
