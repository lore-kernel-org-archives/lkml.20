Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2430A4E3247
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 14:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791554855; cv=pass; b=XwlVycWjlLdXwFltq5OTmbOBfRfXLd88wzOv+lHrWBnY58PJiVN+ve+9uXcVAiARFlrD31PVUtvPHVZoQZUsoRv4T0+rASdhsbrzks8Vj9GR21V4L92TXpw7ipP58IbInjbdp/oKWXfWRUF7u7GciO1Pre6X+bcnqA/OHHb5hqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791554855; c=relaxed/simple;
	bh=b4rMtXSyvgzVOdG4ilTjHKgvnbsQsAYQrWnRRDEOIYQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q69eRzWgg0tokvQAUB7MilBQYjiRzk0wOS2da148NQLjii08rK/I3mHRL2g3fTcIuJ2o1qdlQfG9bqcqgWx0ioHXfbGyY6qXnz7yEzvycSuWdAfOySIfZSZlPvU6gMetSQgXeo0OYoSThLdKAwV7sbJoK93aIapAb0hGqdr4xnM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tI28d+vc; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tI28d+vc"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c2e3846d1caso619184466b.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 07:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791554848; cv=none;
        d=google.com; s=arc-20260327;
        b=CaOA/Scg/B9T8hMnyjFwqVxJIyLWt7Q7L5dVfwXYS8buAnR/QYaw8942a3TlL/XGGL
         r7cwctddrzlqaSr3UZE8upguywaGYL/FMGBVCXiE/DwH6JcqUhcHq1s0YHOi4ViYbSeB
         lUGEWlXyYjZoZAEnYPLfqgAToe88AdowJSiS8qe/ou8ibc6nkmghR3iZmSxnNvGB8b0g
         qgEJrEo9jLUBJ2uaoBTQt9MBMbJUG5nEcgioABBbf8B3m7qzFKGIARp05ENvkXXNzvjL
         NCr3C/c7y7rDWP8gESPtr4m8/IaiV4GCOlmfKd97uz9tfi5TffCieF0VzXFjeG7tjrJd
         617A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aPA7l/cDhFmUwI+RbBKmxxOCeGT4OK8rl1qxZjkWe6o=;
        fh=LPvw7NmBOE81hcRmiQT7zI0srVZQm08Nqn2d6NJ2yKM=;
        b=HkBCv4OyBfZan5ZHI6nySVlx7tK4No2pBKJvmk1e6a9kZAtHkI7CaQa95s3bdE8idV
         TVwyeSD/R6GtnDRShQVTJHsgQ9zWTP5OCxTYl91Jv7eTxW03yW6gZMuoe47DoipCcayS
         FeWNWyLGYJVXBEKLMYtrqd20IEotAYghLzY3OxGHlTNg3tQzIKLtgcN+rFfz7zSiN1iI
         2zjFqlBIrxQ7P+JAJxn6QnPTxMnsV2eTCCmSjpTMaHF44AjJVPne7wwKasTJxdPVSzk2
         CfbxNEvLIXD6k7Wd7e1LmtYW5+cGF1fB3iBagai/vBV9JUa01Q+zB9vbxZA+9Me4tkES
         h3qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791554848; x=1792159648; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aPA7l/cDhFmUwI+RbBKmxxOCeGT4OK8rl1qxZjkWe6o=;
        b=tI28d+vcT32QNDXXxD57CMlYBpY0uzxmVlYA4pTnMZtsVPZu9Te/6iN6ABoKOseL6t
         lJfdMeJgOEg8ikoXEV7KBGOKonFLFV5PKbp1v9w5fn+zSldEysQJCAKe92B4tEme8vmL
         eFEphO3THRBHvZFXl1gwAKRftY8Mxc3SknwTVYRKx8wBKTvHLEOpxflZQS+P6ON/EyaR
         61vWsa04MyOGvpqByi5YR0GDJIkjE33aX+gvyMWeEZuXPiSOr/GbISpEC+72vwkb4n8X
         xnihV0WnCUmla7yRP+dRJOs2kBHgIdiEIs4o49RIt60R8breNsnApwnSBMXlo0W9W/6O
         TiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791554848; x=1792159648;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aPA7l/cDhFmUwI+RbBKmxxOCeGT4OK8rl1qxZjkWe6o=;
        b=caAzio4QBz+Ep+v6HXFTc+6k1PW3WKqkvbMhVcIcv4/nqA2biPYoJCC6u8knJgJXpP
         t8arnmRkre3fUEsRe4E64c5QQA9/prfUNO/+77MIG5/T0ZpolKeevXoRIDRSo2IdAkhp
         OiDixQk5HQChg8FuBSC3vlu5hMledPBrBofK7y4FBYbeiHtN0uOjDqWOqDsEgE9Ed6e6
         GGQnk9GP4Eg39Z9bg/guQmGy9CknwATSweXBqwX5q8AnMZPigepe+7jiXgcWawFcUGe0
         DKDj3yPOME10EjzMPz8EAAZg/L1410TpDe01KFs03MBO4aXJcRLzZWin0cI/Ygr+oIs4
         dqwQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7Kk2R6HmKqL6mI6HNelEWWeTRuCDEdoyCcxT4yWMSfUh3TPWNnU/Vbfdb123QNBzCxrXH8lrPDomcV2Y=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1BsH2VtErxyyJB2JmfBHah/t0z6p7tTiMCvKEN1c8XqvYrk/T
	UFAPYJNDoLgFJm6CR8Oxh5WtUPRPwA/0Od/N4mYj75CgHdhUAX2D97Mn34z6U3o//CWTtCKTan/
	UV2PdwIG+/kUh+stLq4iqqSMBqk0vOjHPAUMFU2dxMw==
X-Gm-Gg: AYBFou03OK+ttQLElyCL+VJKIv+70Qrgdy2mTnJ9TuWTXuQyBt8mRtZbDOtOxWtGoLE
	1u4KEygvrDknF16/1bkloLJJ/vYR/8JaWnNV7wp84qkn/34ox6XyldnraEoHSHiegGBAvPdwaDU
	GA3FPhWBgv9pk1ivQHQgMENqA+Scohkrqd/hlwbT+ZdfDScNV8lon+V1CrBUTzNUpzKnry6DbVC
	1VtWeEPUSgYPH6thFozUNHkTEFujNmlyvNk8LuHHIJD5y/140e7geQ0KOx0Ckdi8fz1GGAcNPg2
	VObq2/AaXE7m+WTgS/NAl5nN/bA6fUgp0irnQ1oS7Q54fDXb7z3x9yeq+9mqtGyzAO1vP1Mg6s9
	x+IEYwA4JS4DqG4gDCXU+fQ==
X-Received: by 2002:a17:907:9618:b0:c24:4128:c19f with SMTP id
 a640c23a62f3a-c31a9d0a1efmr229344366b.11.1791554848238; Fri, 09 Oct 2026
 07:07:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002154415.2270586-15-vincent.guittot@linaro.org> <20261009111627.4861-1-kayracizmeci@gmail.com>
In-Reply-To: <20261009111627.4861-1-kayracizmeci@gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 9 Oct 2026 16:07:16 +0200
X-Gm-Features: AclHuK93qwibmCeDReqU3VlqkUs03L7RaL6WzAc8RexM6-c3eryuJOq2Yp8j9Do
Message-ID: <CAKfTPtCwv5f1D0uDqa2vePcYzavgut1W1Mab7pz3o7a1vTYO9w@mail.gmail.com>
Subject: Re: [PATCH 14/18 v2] sched/fair: Enable push task for preempt short
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

On Fri, 9 Oct 2026 at 13:16, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> > Enable push mecanism for the preempt short feature which is the
> > 1st feature using it.
>
> IDK typo count of 'mecanism'. It would be cool if I counted the typos I found in this thread.
> They're so important. But, I didn't counted them
>
> > @@ -3475,6 +3475,9 @@ static void partition_sched_domains_locked(int ndoms_new, cpumask_var_t doms_new
> >       sched_energy_set(has_eas);
> >  #endif
> >
> > +     if (sched_feat(PREEMPT_SHORT))
> > +             static_branch_inc_cpuslocked(&sched_push_task);
> > +
>
> Well, as I checked it seems like first user of the push 'mecanism' can't be disabled.
> This could be the correct behavior too tho? If we want to open it and do not let it
> close even when PREEMPT_SHORT is false...

I didn't want to make the push mechanism enabled by default but only
when something uses it. Short slice tasks are the 1st user.

I wanted to keep a simple way to disable it at boot when it isn't used.

>
> But I think you wanted to connect this to PREEMPT_SHORT, no?
> Well if no, then well I have no words. If yes, I have.
>
> I done a quick test, adding this line to here:
>
>         if (sched_feat(PREEMPT_SHORT))
>                 static_branch_inc_cpuslocked(&sched_push_task);
>        pr_info("push key count=%d\n", static_key_count(&sched_push_task.key)); <--- This
>
> And booting up the kernel. Playing with CPU1's online status and closing PREEMPT_SHORT.
> And...
>
> [    0.967146] push key count=1
> 0
> 1
> [    0.967146] push key count=1
> [   42.408439] push key count=2
> [   42.475103] push key count=3
> NO_PREEMPT_SHORT
> 0
> 1
> [    0.967146] push key count=1
> [   42.408439] push key count=2
> [   42.475103] push key count=3
> [   42.562426] push key count=3
> [   42.619255] push key count=3

This should not happen. I will fix it


>
> This is a bit messy since it's raw, but as you can see even when we
> close PREEMPT_SHORT this not decreases. It just stays on and grows over time.
>
> That's what I'll say, maybe I'm missing something.
>
> Thanks,
> Kayra
