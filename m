Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763183F3289
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554514; cv=pass; b=VoTYMNjlAx2vZpug/UdZVTSxXSfzuz4s3OkjL4XrLeeSe7+zFA4FWIDh7MYt7n/LcZL261u/azCyt6A4vp046uO/orlrOfLfI5VmtYomIMcY1Zht8/wA87f+Xy7lkK2gVr5Qcb4QoKUeY0XKY0uLlDacmVqe1+H44itCjOaCidw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554514; c=relaxed/simple;
	bh=ITqMKvjpOuO0AQUkP3fW5wgzA4k30wtF5NYHyj6W6LM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FNjOfHgKKBHO8BBFHQAKrLsTyyU3LYUGwyfAj+PevF6urZo1CuCXBoPbNNRvdTvq7j3+Haf96yX/2ZU+9zZu9+fw4rLL7IRk3ZXj/IKaNbCgQw5+QpHoqxfaZ+9htYQ7ieTVDZdaJEBSubNBhIi38OyBpHHSldVWaRlVgxz55m8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JP/Ju+Ju; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JP/Ju+Ju"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso7519162a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:01:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791554512; cv=none;
        d=google.com; s=arc-20260327;
        b=JK7Ysf0GQxY3IZXXoQO5I/3SHiWHOdZcplv/K8tWOtNRPlsV3RC60183/iKpbMnai8
         kVVzBuWddXvcnDKpRukJk3VFd0NBhODiK9OQ5wWvOkz3YuTCaK08/DeSH2Dl/Jv62kkT
         5XSydKAyanP1JL3ZaM6vtwYlFxq/TRlzA+2TNyobyy5OO4UOtYnVcqFd+mfiKET9LO9c
         oAobDiX44vrUtUlSiNXym8Kw2DEGJ50YMQxCnHeDun4USf+4IErIYHrf2M0tPeL/Y1AH
         Eqm/b6w6znusyiLpXxSKDHtqaNc6AjqrTJw4cI89EIGSN25/IwXge5+uao/4/wdbAF3O
         10bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=VCymc19pFg1e7iTVrFtMCVn58qnf/FH0ex401YjyIug=;
        fh=9/Rqt10S+nh7FWry5NmjvoUGK8F6da71A7W+zkufDdY=;
        b=nzCOXQGv+XRy1UWk4iHRK0OxgAnbabtqovLC/VM9ez56C6cJaPfY4LiBFz19O68UqP
         cHyxj6KgSU7Tg+NVL9vK+XPkAhuXh/vXUA4pny5TnB5hTF/bcNftl+c1/LlCxgKdOU4o
         Q5veoImNnUQwIWXaJcDtXB2MrAz1CVQWfu9C6wF8E2t1oUthueOBTp3XX3rfSMHCPdnq
         2K/mhUXDCLTzQ+oeQFb65Ga5Juuu9+NQ+RWMdvnemXGPKwAGOAEyemLVuMFbFQwerZsW
         wVZIxLXcu/bAJSsBEnhKAuKerUG0l59v9fQzQr5yp2Av+SgqPXlWmgKuna2nd55n5l5i
         GM8Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791554512; x=1792159312; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VCymc19pFg1e7iTVrFtMCVn58qnf/FH0ex401YjyIug=;
        b=JP/Ju+JucxyZCap1ahAmJmSKZgIFPDG5IOIhVREm+s7HkmXheWaz/b1ShFBzGAo5yk
         S8iNUUQsDc1lsgO4Kjobwzud+3xA+MT76NpGP/cN261v3MWt6pgEQTRPQXjgGqtnxJZz
         MjWbJeUWOxjrKF1EGrRlTDfwIdiAAJa/i54iyvHD7hdhp8dbYMJ826CITzrLWWTQgnJF
         MlIbaHZRKJJqqFB/mGBNDV3Cczhnhd/ujhNX65sMNT41CVGUs9sWCc8feCBDyINSDtRk
         E4nLjKQ1OP1uHu0wMemWlDfDHtbaS58orlXKvly1Zg2g4OR0vxU+TakVxFdd63TDUlJr
         b6Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554512; x=1792159312;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VCymc19pFg1e7iTVrFtMCVn58qnf/FH0ex401YjyIug=;
        b=slOrZSaQ3BafYy9picvAsia7ocR+GzWkn3R78L7/Hu0yshE0sbobOlnfDEjkrVr+7T
         UgmogC1W3ox7LxESPWhBwLqq4roeyn+gs5oL9733j/w/gWYAV7ziyB9iwxL2ZoNcLoX4
         f7rtYTpZsXzn29IapLyklwxoS/0GwkY3hOv2MFthB/JI6S0+YG8v7kbBDkyz2sqC/kcu
         U1+e3vf8n6VpEOo778It/oCtEIu7mWXww8LmcW+ErSxmcMzeFAciyDsWqUKDZpPoAbPm
         aNzh7QwbpcydBr/r/q1HZoaGOyDopCQ7BXzp0FtzMdQ78dQnPoH5aC17uS80iT2CQBns
         CcTA==
X-Forwarded-Encrypted: i=1; AKwUvBzOWHByW3AnKxe7hnOyPv7HFT7ORkCPQdLfxaSMxoaY6/VHtLDj51G/3cXmgjsaWRCpdxspdJnpwNExdoA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJc4ZR85+1cRLPyP5RdWndMrAKv+mB8fynj21Yt6rck41IAs/E8
	SNI5LQ2pHXIP/t4GPAdXC4UANGcVnl44brnK7K5V01/ImPpGy//lA2SzPcCkfBWwQjyTyMKYRpK
	gKaNDOq7d8NeDuNmWJ5wpSCaam5UquC0OWSly5DsZQA==
X-Gm-Gg: AYBFou23tdmkUCk4vwJ/Kp4JjWhXaddsx//jn6wjcaODXAYYic/4lh4E/I4Bvl7pasB
	q4rSEHTj2h8w+510ADc0qjkKm0WU0/Qyc2y2FtiO8LlrhpTQBKiPcODvp6CZlPGv+VLsT7Vk78w
	39rJQ5YTRZ1hiXkBntliQv2JfewEW8JK7i2S5LAll/II4sC3WTajL4kSN/CXiAcDSP6/IWapMfw
	DGLCzD6UoTdouu7V2Xr0hJ6nfeq0S4BFs26rHrIgKkyIVhLt5Pa0CrA2MvOrwGUKS/1ZbP1rwxO
	jwj7G+W+T14ciN9uaE7191MjWIb7CC71UZEt3vTaKCbOvCa4248sZuW7bRMgDD9ihfXzBg1Arv5
	PBl+ufHQToXA=
X-Received: by 2002:a17:907:97c2:b0:c2e:2b9b:f16a with SMTP id
 a640c23a62f3a-c31aa0db298mr219331566b.39.1791554511699; Fri, 09 Oct 2026
 07:01:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-11-vincent.guittot@linaro.org> <20261006192414.7308-1-kayracizmeci@gmail.com>
In-Reply-To: <20261006192414.7308-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 16:01:39 +0200
X-Gm-Features: AclHuK9YZ_WP4WP9H5H0CuoIx36QiVr2v73i8ApazR67nIerBidlId3PkJRLutQ
Message-ID: <CAKfTPtCqz8AVqzo5gEfidftPj2Uebd+QDZs8RKmY4mvi01QRDw@mail.gmail.com>
Subject: Re: [PATCH 10/18 v2] sched/fair: Add force push task mechanism for fair
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: arighi@nvidia.com, bsegall@google.com, changwoo@igalia.com, 
	christian.loehle@arm.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com, 
	kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, lukasz.luba@arm.com, mgorman@suse.de, 
	mingo@redhat.com, peterz@infradead.org, pierre.gondois@arm.com, 
	qyousef@layalina.io, rafael@kernel.org, rostedt@goodmis.org, 
	sched-ext@lists.linux.dev, sshegde@linux.ibm.com, tj@kernel.org, 
	void@manifault.com, vschneid@redhat.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 Oct 2026 at 21:24, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> > When the task is alone on the CPU, it's never put back in the enqueued
> > list; In this special case, we use the tick to run the check used to push
> > runnable task on a btter CPU.
>
> I love typos. Like, in here. 'btter'. I think it should be bitter. Like:
> "In this special case, we use the tick to run the check used to push runnable task on a bitter
> CPU."
> (Or maybe by a really low chance, it could be 'better' too. Maybe tho... :>)
>
> > +static int active_load_balance_cpu_stop(void *data);
> > +
> > +/*
> > + * See if the alone task running on the CPU should migrate on a better than
> > + * the local one.
> > + */
> > +static inline bool tick_pushable_task(struct task_struct *p, struct rq *rq, struct rq_flags *rf)
> > +{
> > +     int new_cpu, cpu = cpu_of(rq);
> > +
> > +     if (!sched_push_task_enabled())
> > +             return false;
> > +
> > +     if (!rf)
> > +             return false;
> > +
> > +     if (WARN_ON(!p))
> > +             return false;
> > +
> > +     if (WARN_ON(!task_current(rq, p)))
> > +             return false;
> > +
>
> OK. So, this is called from task_tick_fair() and task_tick_fair() is
> called from sched_tick() with rq->donor. So on Proxy bla bla
> this could get true. Or maybe I'm missing something. Dunno.

good point


>
> NOTE: Some more places could have the same case. Again, dunno.
>
> I need more tea. And sleep for not having to drink that much tea.
>
> Thanks,
> Kayra :>
