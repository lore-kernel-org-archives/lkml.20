Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793263280;
	b=Xhxp4NZrf4K7Bub6G85AZTkztr3bohiPtSsJ/pjAJJgpZW82F4mGWPNmUDivvdtOK+kE
	 dwBLhfOvz7ED5EuBX+uoLGKhLCpfnEooYX+MkP4mM5Noth/Las7ejkl1bAO9MXb9xYacC
	 MkzhacnGG52eOuQlvGyPeztsO6cXys033KGn3flLBHGXeBomp1yG6ZfK88boFPzgAMGvt
	 3ARCN3Ibk5A5JA3RcBlUkI/iMv0RRxDU8L2J+egcrFblZd9o3QI9TgwexRzo38LjfwsJp
	 U6QGhVBjR8xsBUlWoi/HC3zmUg3hYui9egqu5j6IFkrfkXGx7F1XiQAnasHgd86Qnrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793263280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x0wrBNXUFXOOwvo/hdPp6wfUItkr4kWTuq7oIiZlbIY=;
	b=q+2RmWJeC61rZKFTGTCmnt1bLyLzElU1rJa+OmcSW5XRNg4m2LPOUJLR32jim5PaF23z
	 EY0ZnEBOoI2HOT7ebXlT5kX13vCBpJnC8C8r12lMaaYUMIESNSOyz2AboufnxsszeBBJE
	 yazsd32pfqi9e0eP7Rp4cg0s2MAtpptwwurLmxTb/7tijzy2fQ60EYbldfBRzpi+ohH82
	 rmkZJAfA7Sx6pIFU3I14ENx6I1b5F+sg9zMbYgU7otI1goqDlaPPf1DscIbBnmpQQdQ1V
	 MhV1gdnpSAnKmw2iZL+L3c4DpKeBT4wZ5C0NMIA7TYmG4FoQ/OJZVVaBkC0jV+Z1tgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQSicNRO;
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36322606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36322606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQSicNRO
Received: by mail-pj2-f3.google.com with SMTP id 98e67ed59e1d1-3ada2f39f30so456385a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793263279; x=1793868079; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x0wrBNXUFXOOwvo/hdPp6wfUItkr4kWTuq7oIiZlbIY=;
        b=yQSicNROzs9fu6B0n28KQeLGDrDFUS8im3j2YaD6hystNri4y1JEtYhcUPGttzWd2D
         f7tJ0ibicoM66ZSDu+FHMGOIIk9Fq5YkKQg/fs7OOlLOcaV7mhnWuS8zhWHIY8460Ccc
         MLvPUTscOagEKjoXgV3yFlz58vld0mOJT8FXOPjz1Y9V/kMZQlmFJsZptZrXsOnVY8IT
         ZxuvqFxYy4noHQlD0QgxyQ04rovq7gGREzfKMPJ//ZZj7zojgOAiJlydXFV5qUR9N75E
         4hUX8lNXtrYs5wCzFUglHsanpIx7PvDowB63nhmNVtsGw5WfuPRysV94eR9dm6DBX4zY
         QW9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793263279; x=1793868079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x0wrBNXUFXOOwvo/hdPp6wfUItkr4kWTuq7oIiZlbIY=;
        b=fQRS2aTMla6mtLMjhwlyaC+IlarptrOQ/WuYGuvzNXeqzxkMlnR1plcgBDSBghFfPd
         k4+5VqOzF6QIg+E+aHhygHQkfy6UBGJRHLCDzYfMtKFkJaGJPtn3BWn75wsXvHdc6J86
         /7UvCIATPxvTOlX+ypXhH5xz5P6/z6jdCVK3ECC693TvkGIC5Qjm6KNytZPUZMomWVtx
         SkuZ6ch4l7mv+9sNGkBEgDWZ0BA/aDWNOnNJ6bFsCXYL0X969fOYubF9xSt/Fzb2E+P0
         4WiTxpUwhs5CUUb8PeFcjNkhYrfBpL54aEhtFBHkillTkaN+vhK5xhX2zl+oZkGINmGO
         SONw==
X-Forwarded-Encrypted: i=1; AKwUvBxL+S7MwFk8PrErn5o/GxAOi1s+8OUwe1LiZvZWp46+GInX8vXaVlhhZLG05Dp8Dp6Ww/oYfIKOjajXhBQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYQQHWWqcceI5pxWMGTcFAp0AZM2KoZR4pnBYVgEmKPF9H4EZZ
	l+jFPGRqYPT6DUob/KY48zV6XvrYmQVeakfHx1kjz+ErE7EBW5+nOfMx
X-Gm-Gg: AYBFou0Isz6Tm8tMJ7u8JaqEnqtGHg9AhWQKBPHgigJjHTwS5L8aysdc3dHl/bfYcnv
	lhzwTMj45oaNU9Qhiv+PxWg0whF9kL7UTyATzLvdPPBVkSspZMUqKFBgVcXp/Z5hsfuU8Fw/4bF
	/E7Ni4DJkcYCOKgnnqdXfIp9mp8a0qWkpLN+45I8TBzrAhKS44f5VxCFNKY+GJqtqqlBjnzTKD4
	QxNnfSNCsFiSEOutrV3hZgR8X5pTz5ha85EncvO4y49kzAR3S0yHy4MEqthWVEtj5UraM3E9Y/b
	on7OgCuAU5WT/EEsnCDJYwJlENdPNcf61q6k3nkuaYp0iA1xjcdgYsxYAhHDERpv/BQPUeAW72W
	k9xIoBtDe24eTuMZKdHaha1rDzfwn1/kNKyeuCZ0/NCzGZQ2eD/qRcNL2xaRpFh8Rhfet6xjXL9
	oa0MGKzzfGdsLo23VvJaWSbKPIH7rB0oIZq0Zqfi6OGoYFiCo9i43ulcP+JLnN3WhfrZimgIG29
	PmkkQElj0UVzkg6cDl2Xul2HNjdDllBMvYt73WeHY4M+EGjcgz84LjjdyprHkULxyKT7ddz/A9i
	eT9w1NEYl3H3JFrGE+oRyWJLIfnwUttpelnjEGGz/kSG40lGI36r/Thw
X-Received: by 2002:a17:90b:2650:b0:3ac:7556:8eed with SMTP id 98e67ed59e1d1-3ae5824dcc6mr3412242a91.44.1793263279412;
        Thu, 29 Oct 2026 01:41:19 -0700 (PDT)
Received: from lima-ubuntu.hz.ali.com ([47.246.98.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7ac878sm3215985a91.4.2026.10.29.01.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:41:19 -0700 (PDT)
From: Qing Wang <wangqing7171@gmail.com>
To: peterz@infradead.org
Cc: bsegall@google.com,
	davichazbh@gmail.com,
	dietmar.eggemann@arm.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	rostedt@goodmis.org,
	tim.c.chen@linux.intel.com,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	wangqing7171@gmail.com,
	yu.c.chen@intel.com
Subject: Re: [PATCH v3] sched/fair: Replace random newidle_balance with Bresenham accumulator
Date: Thu, 29 Oct 2026 16:41:10 +0800
Message-Id: <20261029084110.2467458-1-wangqing7171@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028090555.GF2668804@noisy.programming.kicks-ass.net>
References: <20261028090555.GF2668804@noisy.programming.kicks-ass.net>
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

Hi Peter,

Thanks for the review. The newidle balance throttling you added is a
really nice optimization. I only have a slightly different view on
how to implement it.

On Wed, 28 Oct 2026 at 17:05, Peter Zijlstra <peterz@infradead.org> wrote:
> On Wed, Oct 28, 2026 at 11:44:49AM +0800, Qing Wang wrote:
> > The current NI_RANDOM implementation uses a random dice roll to allow
> > newidle_balance attempts according to the success rate. There is a better
> > way to implement it.
> 
> Well, sorta. So Bresenham is a linear algorithm; it doesn't (and cannot)
> properly deal with slope changes, and that is exactly what we do here.
> 
> Your solution:
> 
> > @@ -14198,6 +14198,7 @@ static inline void update_newidle_stats(struct sched_domain *sd, unsigned int su
> >  		ratio += sd->newidle_success;
> >  
> >  		sd->newidle_ratio = min(1024, ratio);
> > +		sd->newidle_window_pos = 0;
> >  		sd->newidle_call /= 2;
> >  		sd->newidle_success /= 2;
> >  	}
> 
> is to simply delete the residual on slope change. If we were drawing
> actual lines (like Bresenham was), everybody would be yelling at you for
> creating jaggies.
> 
> Now, we can rescale the residual, but realistically this probably
> doesn't matter.

Sorry, the "sd->newidle_window_pos = 0" in update_newidle_stats() is
a bug and I'll send a v4 with it removed. I wrongly assumed that
newidle_ratio is updated once every 1024 calls. Since newidle_call
is halved after each update, the update actually happens every 512
calls, and the reset discards the accumulated value before it can
reach 1024.

Right, Bresenham assumes a constant slope. But the only effect of a
slope change is that the first attempt after it may come a bit earlier
or later.

A simulation where the ratio jumps to a random value in [0, 1023]
every 512 calls (20000 windows, ~10M calls):

                      accumulator    random dice
max per-window error  0.5 attempts   41 attempts (~16%)

> > Replace the random dice with a Bresenham accumulator that distributes the
> > allowed attempts uniformly across a 1024-step window:
> > 
> > Each step does the following:
> >   - Accumulate (1 + newidle_ratio) into newidle_window_pos.
> >   - If the accumulator reaches 1024, allow the balance attempt and
> >     subtract 1024.
> > 
> > This guarantees exactly (1 + newidle_ratio) newidle_balance operations per
> > 1024 steps, uniformly spaced for any ratio in [0, 1023].
> 
> Right, except you get the boundaries wrong. Also; as you mention, the
> new pattern is uniform, which might (but probably doesn't) matter.

I don't understand which boundaries you mean here. Could you spell
it out?

> But the thing is; you didn't call out any of this. Can you please update
> the Changelog to be explicit about these things and argue why it doesn't
> matter.

I'll add more explanation in the v4 changelog.

--
Best regards,
Qing
