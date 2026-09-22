Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EEC64DA9B8
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071353; cv=none; b=eiKVpC2QgUKf/pXDPMO+b+/tM9UJ3LAb4UptT01c9oXf/lWvYzyOIPo2hG+vzMQ51DnaFJahENn6fxoi74w61Tu2wfGY6CqK7XOrlyFoUBIxHP3mOkmEiVoi0pAo5tPk2PTyDSQjOyVQMJk2DBCWUhFZgK0FkiOvLZAqtPUHaWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071353; c=relaxed/simple;
	bh=Bea8wIAQm1SYAKyW65bI5chdCfHl9tUBCZIlF4kOWPY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JRofIidE2KpSBX353dQOrcVidOQKR4JMWOzMDY1qthxFJqpAaC7TLSFrewrRlFdQh5rQjDsNEFiVV2+PaZEmb66pqonlF0VHfYJFrClY0e1FZfytX53lE0B5dUCjyl9PDpnDEHROgUmnAfFsNyH6osYOwPN//tXFYZXr12fBCxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WSqhZwNy; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WSqhZwNy"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e6b885ef8so21861725e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790071350; x=1790676150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hq7WxrljjFtOruf6YuhnLlODqXetqWkez1dUK9LeLVQ=;
        b=WSqhZwNyyxsrewRJfbz4hj34PmsLJcMue74m+fZOqiA7d1OpFrsqSxkdeBaJkjelrK
         iUla2FLeJtBEauos+/ce1hU3GCBRtihaQOcnhJ9cGwx/0B9mkScDczM6wonBk2WMKNWg
         sMprCUgn+yqs70UtfJPsSbiuz/K6emh7SpKDWz3MQk8oE55gqoxAOHgwBfGRhJzZs9Q2
         KN+dhGEyZWuwM/Yjx1DQ0CgXIjXbFM/UECLI1QVkntPKU6hrZrIMSh9zmqcWc108acUM
         tXASdLmfRTRSKqMgOCLBcIdiMvre2pGQtg2Fwy6MLiEENcpU8VCE0J26YlSA2GFqLz64
         f4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071350; x=1790676150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hq7WxrljjFtOruf6YuhnLlODqXetqWkez1dUK9LeLVQ=;
        b=EL9+lBlIa1YXTmvh6lFnE9Cbcph0BMjozCbNnwnPvZhh1XiWCZqfc3tl4i3dJ//3iM
         PWIi7T2uK4SOUOlxaCEuilxwyfj/r6NDOng2JluOlk5Vl2RJ78GuHCgbW56fqB0Jrqt+
         WwyG7JHucziUlxrNCZhuPtjO6i78omokf9cJKT8m7BvSbniLb25zQ8nIVlqIDUCObK/i
         8w3EReoSWv8AXMo7ODJshAB3bikrh8hjMLSD7EEnY8tGhLpTJYaPlhzHgO8nGoLkK+As
         vdd6kcBVOKMGMrnf+aoLYUlC4dUaSauQR5XOtuaYfAraHIeJyz5w7cTpUSAN6ECA7zpx
         kDbw==
X-Gm-Message-State: AFuF++krJtXrSopPqVrhfeBxYHcKLeT0Zdqigaq26ln7vBnAVkEndFXu
	TxmxFsCo/O+SeNj94jxGwoVRYDMU/BYW/43yWqhw/qwwZ9Chy1v7g37kZdYNDSoc+28=
X-Gm-Gg: AYBFou0gqbp0USe8DY5MH6SjTF9H0uYKypLMj8HLkrztCqKHycIgvsud7f1L3ilfqeT
	9tk3FVswiIqSDMvLbQkghVBLxhPbnyggNA1hkqis8TWVmfputZgWsA7CeDqowBdaDz8P/8428Zz
	+B39gB6ddkECbt6M0F6GzRlL3Npr9GN1vcn8kmgPaMb3xp06p5+pecornms7/Jobag1q4bRMF9A
	C9JjfncoZ7siijeihdYtMKQsLBdo7ff2kCyBUqgqCBxJyBl6TbvxVkdDYlcetLkdb3dFZGrq7MR
	c6C2X9XHaLfGTLXjGz1Ptn5Ysw9ykJcNZlda11ei6aZnB5oNkcabNLcOC19HgOQUDAyWLoPpwum
	crErbboOWkeV035nu9MJYUT8QtB0O5boknvkKOli7EGWbZk9MzG+XJi1GtDwAOQWnfSFjOsqSHV
	KSVsBdvFEx+xnbHv5GS+A0qlxJtz89/5daBlbSBly3kC5TREpPOa1Gdgv80CyuOcZxkA5ASocT
X-Received: by 2002:a05:600c:4e8f:b0:49d:1916:59c7 with SMTP id 5b1f17b1804b1-49fc5687e05mr193988335e9.7.1790071350103;
        Tue, 22 Sep 2026 03:02:30 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdaa28fc8sm30620885e9.0.2026.09.22.03.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:02:29 -0700 (PDT)
Date: Tue, 22 Sep 2026 12:02:27 +0200
From: Petr Mladek <pmladek@suse.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v2] printk: Use two irq_works instead per-CPU
Message-ID: <arJSM8NaTAK_sN7Q@pathway.suse.cz>
References: <20260914143412.1sMcp89V@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914143412.1sMcp89V@linutronix.de>

On Mon 2026-09-14 16:34:12, Sebastian Andrzej Siewior wrote:
> In commit b845b517b5e37 ("printk: robustify printk") initially got its
> delayed wake up which is today implemented via the irq_work. Back then
> it was a variable which was assigned to 1 if a pending wake up was
> waiting. This variable was checked on each timer tick. Therefore it
> makes sense to assign a per-CPU variable with this task to avoid cache
> line bouncing when each CPU reads the variable on each timer tick
> simultaneously.
> 
> Today we have a irq_work which is enqueued onto a list and handled if it
> has work items assigned. This list is already per-CPU.
> 
> We could replace the per-CPU irq_work and the per-CPU printk_pending with
> two irq_work structs: One for PRINTK_PENDING_WAKEUP and the other for
> PRINTK_PENDING_OUTPUT.
> While unrolling the conditions in __wake_up_klogd() it becomes obvious
> that PRINTK_PENDING_WAKEUP is always passed as an argument but never
> checked. The return value wq_has_sleeper() of does not really matter
> it's sole purpose is to enforce the needed memory barrier.
> 
> Redo the irq_work by:
> - Use one irq_work (pending_wakeup_work) for klogd wakes. Schedule it
>   only if there is a sleeper waiting.
> - Use one irq_work (&pending_output_work) for output printing. Schedule
>   it only if PRINTK_PENDING_OUTPUT passed.
> - Drop unused PRINTK_PENDING_WAKEUP.
> - Remove the preempt_disable() section. Its purpose was to ensure that
>   printk_pending and wake_up_klogd_work is accessed from the same CPU.
> 
> Worst case is defer_console_output() where two irq_work are scheduled but
> those get processed one after the other during the HZ tick so it
> shouldn't get worse.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

I like this a lot. I always thought that using per-CPU variable was an
overkill. I had the clean up of this code on my TODO list for a
long time but I never came to it.

It looks good to me.

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr

PS: I am going to wait few more days and give others chance to look at
    it. I will commit it next week if nobody complains.
