Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1077420490
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788457221; cv=none; b=ZryS749LwWZzHaMgr6NFp9nihdFU0W0DKN2o/WTXq/xioavZ7qnfWrnebNKL00kpOdgHoQhf2Mt803/cvErxtwkX47ZB7G+cuYs3n31plcAbssOSLOrFgZl4DRudtzZoRwyLAMqm9NyQfLSg6tyLrpLHD2ZHl4LP3PpB6YX2Pbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788457221; c=relaxed/simple;
	bh=SuOQAOtQywZJY4j9IpQ+ul6vkKdDfjLj9vesTCvyKd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOYc03phjZ2TjdIT7bJFP0j5HdUIYzWCFszGIL0m1laEb1ZnlqIJqiXYWOPLa186KZpAqjwUIgsw/JNG2Zuk3E2Anq8kJhUywft94k+Mx53Nw30UqVfGPMVF0HclPAsMcx1E87cLqFwAecHocDQiD1ZGgzYhf9Aaj5HL2V2bTiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T96eUvve; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T96eUvve"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso1441855e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788457218; x=1789062018; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MBKoFpt9THFLwdvM+DVkERDMkeUWCyAdDpd/d+wp8dc=;
        b=T96eUvveMLZ1jHKuZheDGL0yvWIJcMP2akY/W12A6+y15vnj/Mt01BNSUpyy7Yz5yl
         2A3BrF1YpMr+VhZvEuDVohT49abfItNNCGxqZKJnPHpYvjqqkdFzqFCoykSVspe/ywUz
         xbxHPmaWWR+MnluHmuHwNNFKs3IuLxRylG7SbINqUqf91ZWP9QkkYIX9ko0KxwJM5JRT
         Y7wtqqCJxvE0QvayDZ4046s2v4feUoVvGYTPy3IU4uaaKH+i2ZZc9gk9pIvsB78fH8Go
         9GdpZ0HdtlZqhLhI27VWtaYebjNl+Lj/y9dLJd0PpkWN+BWWfU7FCMtfm6vUoHgXnKa7
         nghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788457218; x=1789062018;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBKoFpt9THFLwdvM+DVkERDMkeUWCyAdDpd/d+wp8dc=;
        b=NOT/XFd8kbG3RJD3gHblyiRpKXf6wjtT1SMbBa/Ut191btA/A/ClLvU9/wmUP6qB1m
         AQltyj7Ia99FLnboQLDyhiidF8FPhW6wOti+a37AG2dFShja9H4DBFJ6LPzV1o16P6OM
         mWW+fC4d2lT8AndfdbYRHADeuxZhhgFnyxIt0ojYJqCt9Pf/cpoWHSYKTpuxZMRihPdy
         vyGjSOnjnrIEQ6WTSNSwzOfeRks5TKcONBlvlH4t35cYb0ZKyetjbu2NBTKxjWY1Ab2H
         RKCisOB9dZAgIhX3LSkxzhArmKWYKraPpCl+mageHPDwUp/W+yq64D8/l3Hrrlj+jsHe
         TYDw==
X-Gm-Message-State: AFuF++kK+JQbolwLuS9surZTlxPyHDU9DX+/YdPxPqKxYMBDmDjog1DG
	EVxRb+a8Wco/HW32Hxg3nWFFHjFnXVacNQtBzP46HvvIyH2SSa7kvJTflL+GIh0hGA==
X-Gm-Gg: AYBFou3U6aAB8Ev7XDuxAQ3qusbp4YmdFtQcMIcakPHWwcJ+sCWZqOTl5qiNM8ieQLA
	r20dJ3d5guKKCeAj9/FLDeaqZGbj8116HQlWfwihtIX6WBkYYA/XAM1a1/IoJNJM4Sa8C33JctL
	ge6RrWSlvMkd/p1fxnxql+PipKndo87N+96RQBanesxBGtGHoBU1U253/XdYoiDDDB2cVn+IVL/
	q0AqREQeI6QHQNwxLOq4vDQBWIFqgVG+VBmVBCYur9Whz5QSMU1m0ZD2aukCvVP1cT9Q+Vy54p2
	ojxlddVjhfD2/ASJmVQZnTW0KOKP5wjpE99BqFvTx8W5VbsgOe0kbP/tMqy2JlsZKnrN0OBSIBX
	3NIjg57kmWFaLNuDoW11ktljgDGs2eZJIlkc/WK8r1c7TaRsiw1Q5doAuH995fBkBf+oRnbGuB0
	VXMPuIYgM5cB/H6IGblBmCMnqufARuCZ6gMY7L+kDfLP9xJwCOBaVZufb0CaWrhpJiximkFTTuR
	qamQk/I0Nf4QwtRrhHO08f8loeqi0lq
X-Received: by 2002:a05:600c:83c8:b0:49c:d52e:d0ea with SMTP id 5b1f17b1804b1-49ce581779dmr270002055e9.4.1788457217723;
        Thu, 03 Sep 2026 10:40:17 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce7ac52c3sm109436735e9.4.2026.09.03.10.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:40:16 -0700 (PDT)
Date: Thu, 3 Sep 2026 18:40:13 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH] ftrace: Add checking nr_subbufs to persistent ring
 buffer validation
Message-ID: <apmw_fNwwGvUR-Sy@google.com>
References: <20260903132728.7fb27d34@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903132728.7fb27d34@gandalf.local.home>

On Thu, Sep 03, 2026 at 01:27:28PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> Sashiko reported that the code was using meta->nr_subbufs without making
> sure that it matched the nr_pages + 1 on data that was assuming the two
> were the same.
> 
> Add a check to the persistent ring buffer validation code to make sure
> that the saved nr_subbufs matches what we expect.
> 
> Fixes: f5b95f1fa2ef3 ("ring-buffer: Validate the persistent meta data subbuf array")
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/all/20260901164836.D962D1F000E9@smtp.kernel.org/
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  kernel/trace/ring_buffer.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
> index ef66f726e2e2..748d4ae8badf 100644
> --- a/kernel/trace/ring_buffer.c
> +++ b/kernel/trace/ring_buffer.c
> @@ -1869,6 +1869,11 @@ static bool rb_cpu_meta_valid(struct ring_buffer_cpu_meta *meta, int cpu,
>  		return false;
>  	}
>  
> +	if (meta->nr_subbufs != nr_pages + 1) {
> +		pr_info("Ring buffer boot meta [%d] invalid nr_subbufs\n", cpu);
> +		return false;
> +	}
> +
>  	buffers_start = meta->first_buffer;
>  	buffers_end = meta->first_buffer + (subbuf_size * meta->nr_subbufs);
>  
> -- 
> 2.53.0
> 
