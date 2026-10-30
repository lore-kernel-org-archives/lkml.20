Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372246;
	b=VMjkoRCpC1gMnN+xSq9YhTxOQz2tfaB8XJfYrQlF7jLfa6CK2pQsWlaJ0cJ9f10OeF9y
	 jDdmEbStR7Ieyh/7NOLWM792RwL++1JxZNrb1sNbgWs9EFlgiqdjaFAwPE8kJ/ZUxvqUf
	 EEc9TEPnzolf1+LkGurboGXs8RF8A769FsMCSMirivrJWuLtSLUYJ19DGgL+Q1rfY73fF
	 bo6D7JsoJyuWbPnajr2ndomzA0v3rO81fqsrBQ3+rZyDahl/X5f8y8znYfpjQxBTo/Vji
	 VKXKGxMIvZkHGPam9VLcIiAxCGBy6DE61PwxPXS+BTABlMdyaD1Y1ntOu6zUGHNpuHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=F2Pj7JKnD9OROYQIHfbznlTHrkzxTN3qgN0zBq1dTtM=;
	b=5fmP26aQ+h06qpzjymodvEHaWYoly+mAQf7TImmekbaf2f3+kwBGIAOjagzbM65CTe1k
	 xx0XI4/JXXsQMyYDJDTiZ8MMps2PM7xkCADaGoWPA5f3iTW67TjkRNWF7MtZfc+/D51HF
	 faC3mBskIUa4yIvJeNckAPay8qzTuHc97YwrSF2jiLHuL3ZMceCM6BgiB0ydqkg6xteH5
	 TgmT335p8fTh7YfcgkypWKaamuPy1a9y8FRwpdp+9ytnunL6Ke3a+8DEDsW4WL272h0IV
	 sPKNU560lVO1zNDI/YxR2SxqVm7kOpgE2YffMgeO+g2Va7wbBCxA5rF84Xi/0qUxhNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsZMGr6W;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FDA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46FDA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HsZMGr6W
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48bbb06f29bso30273f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793372244; x=1793977044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F2Pj7JKnD9OROYQIHfbznlTHrkzxTN3qgN0zBq1dTtM=;
        b=HsZMGr6WtKGsD3UkneyxKtB12lZqbCuCs7D0ZrGEAPsaqzip26pJftO6jSkrKVmqJr
         nguL6Uw468NWoq203TBmMBmCntD76g9xhS1g8WMNV21+IpLw2SbFVWc/XZesneUaKoRP
         1TkJwpgbzLCMQ/hFKwp5njy1ngv/L4MQHPl1yYk/YzqPuSTYcfoVHhDlZg7Gka0RZoQN
         U6xN0x6Qi2fATuTm5dLabKWf9cwZqMNg23yWfLKtCY8l/iWZw4fAIZNYipxq9wobvz3z
         XQzVuyD16XXgFan5Lfbj8I3cioP6pWV+VwTuqm1mtYW1Fdo/a4XplPXb5KmfiJNSRuAb
         oofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793372244; x=1793977044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F2Pj7JKnD9OROYQIHfbznlTHrkzxTN3qgN0zBq1dTtM=;
        b=uA2fdoBOywrnQdz3XzK6KanaPop/PhMb+XSngbxnnoI5eyj8Ht+zeIDP/fmB6QtRn/
         qmAqSc2Ml54tZMWUmutDGIiGLImgX8pWnilof/iW33KZE5B4PblEhvUFB5wxjuiEG570
         XH04I+mCncyjOxYQRaknPFBHJs/WGtzv7EqnsxdagBUx9pIYyWJxI7Xkandmur51i0Bl
         5RYrCPHO0anECN0cfzVAEdzUmlgZDzUmTXFB3iJBTGY4AxZTIl/A7A/4nZP7SXXLiKvn
         Le6Nn2KAK+FISrAsgQyZb8pHrmaNOkaSbMy8BvnlWRGYWW1zlQbMNHCki0eVMsnEt53Z
         trPw==
X-Forwarded-Encrypted: i=1; AKwUvByCJV9Da1pFGIr+U/16rfKNmi7eJAFX3Yzg3TlLWuqObtmnLMq3tSIx6+a9FxEnuZKsbA313R92d1VcjCE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoR3WDnYMmNCCMcKa7zhuWimrNTOeZXoExJcIItHCjZBqj8Yuj
	mNvwKn9mP5hJa/0n4ioe9RYGGsVLbeMcmD4O3h7lvrK4fw2uN6v+PGppgslyGg==
X-Gm-Gg: AYBFou21JBggJADKk0igOb74TR06v5mieZRL9hwJizPqnM0v5WW0XpV38suFEisVtdv
	NDb9cRcEO5LzC/jafh4NcNU3YktvDZHo/NGiJRRvtIOeDIuLOEm/sJYd00/z8gWHZepyPWGIAMd
	F6DtNU6zivCE/QbiXSaYZQMu36hZNViTYPICnEFNYxQscQu7i0s59QHSI3aHFYSzP6Vwj39hfEU
	dajZmpYXjhkwcX1SpA05YLUNs+iE7WYoY1bWx3zfa6LD+s9iRNQczYsvvXjztt4m2isv7US6OwP
	/OwD6H7/ugHOX2HF3rXNOn94A5tmVPNkENz+tC4utz5pCSHTsgcJra6gMCiUQCbTaNrtRjYWdpV
	LaV5FHSNx4/W6ACvC99Hks7YioqCRQmdNiIxRZgqyuuHkqbToFfcUhwwJlClrcz8XTPt3aRrgza
	1T9suPsp8A1T//AWr6LIB4kKl984xk3iK21TXjUwGeve7PZR2stMCa0SeGZVb446cyRHguUnD8J
	djJkOOUm/NEyXW1YSzjZCOVyrWXegNxYUl4NKDPzc4P3jJRW0hU6nQD87DwhMYXzDxtpttj9UXR
	FPF8AB3rmhj5tulHj9KUPoDFkltupRK7NTM/ixCYtm1siXppLJtBdVsH
X-Received: by 2002:a5d:5f48:0:b0:48e:6ff2:606a with SMTP id ffacd0b85a97d-48e6ff2609dmr5765220f8f.6.1793372243902;
        Fri, 30 Oct 2026 07:57:23 -0700 (PDT)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b728f9sm3699310f8f.10.2026.10.30.07.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:57:23 -0700 (PDT)
Date: Fri, 30 Oct 2026 17:57:21 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Christian Loehle <christian.loehle@arm.com>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	John Stultz <jstultz@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] sched/uclamp: Use wrappers instead of open coding
 UCLAMP_FLAG_IDLE
Message-ID: <auSuIMloNE_R2T8z@scheduler.schedules>
References: <20261029131354.11030-1-qyousef@layalina.io>
 <20261029131354.11030-3-qyousef@layalina.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029131354.11030-3-qyousef@layalina.io>

On Thu, Oct 29, 2026 at 01:13:54PM +0000, Qais Yousef wrote:

Hi Qais,

> We already have uclamp_rq_is_idle(), but it wasn't used everywhere.
> Replace open coding with the function and add new wrapper to set and
> clear the flag which enhances readability.
> 
> Signed-off-by: Qais Yousef <qyousef@layalina.io>
> ---
>  kernel/sched/core.c  | 14 +++++++-------
>  kernel/sched/sched.h | 10 ++++++++++
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index c6780358a7975..a2035d66270b9 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -1626,7 +1626,7 @@ uclamp_idle_value(struct rq *rq, enum uclamp_id clamp_id,
>  	 * max-clamp.
>  	 */
>  	if (clamp_id == UCLAMP_MAX) {
> -		rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
> +		uclamp_rq_set_idle(rq);
>  		return clamp_value;
>  	}
>  
> @@ -1637,7 +1637,7 @@ static inline void uclamp_idle_reset(struct rq *rq, enum uclamp_id clamp_id,
>  				     unsigned int clamp_value)
>  {
>  	/* Reset max-clamp retention only on idle exit */
> -	if (!(rq->uclamp_flags & UCLAMP_FLAG_IDLE))
> +	if (!uclamp_rq_is_idle(rq))
>  		return;
>  
>  	uclamp_rq_set(rq, clamp_id, clamp_value);
> @@ -1890,8 +1890,8 @@ static inline void uclamp_rq_inc(struct rq *rq, struct task_struct *p, int flags
>  		uclamp_rq_inc_id(rq, p, clamp_id);
>  
>  	/* Reset clamp idle holding when there is one RUNNABLE task */
> -	if (rq->uclamp_flags & UCLAMP_FLAG_IDLE)
> -		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
> +	if (uclamp_rq_is_idle(rq))
> +		uclamp_rq_clear_idle(rq);
>  }
>  
>  static inline void uclamp_rq_dec(struct rq *rq, struct task_struct *p)
> @@ -1930,8 +1930,8 @@ static inline void uclamp_rq_reinc_id(struct rq *rq, struct task_struct *p,
>  	 * Make sure to clear the idle flag if we've transiently reached 0
>  	 * active tasks on rq.
>  	 */
> -	if (clamp_id == UCLAMP_MAX && (rq->uclamp_flags & UCLAMP_FLAG_IDLE))
> -		rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
> +	if (clamp_id == UCLAMP_MAX && uclamp_rq_is_idle(rq))
> +		uclamp_rq_clear_idle(rq);
>  }
>  
>  static inline void
> @@ -2122,7 +2122,7 @@ void init_uclamp_rq(struct rq *rq)
>  		};
>  	}
>  
> -	rq->uclamp_flags = UCLAMP_FLAG_IDLE;
> +	uclamp_rq_set_idle(rq);
>  }
>  
>  static void __init init_uclamp(void)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index d87bdbd2121df..4706f73838a86 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3743,6 +3743,16 @@ static inline void uclamp_rq_set(struct rq *rq, enum uclamp_id clamp_id,
>  	WRITE_ONCE(rq->uclamp[clamp_id].value, value);
>  }
>  
> +static inline void uclamp_rq_set_idle(struct rq *rq)
> +{
> +	rq->uclamp_flags |= UCLAMP_FLAG_IDLE;
> +}
> +
> +static inline void uclamp_rq_clear_idle(struct rq *rq)
> +{
> +	rq->uclamp_flags &= ~UCLAMP_FLAG_IDLE;
> +}
> +
>  static inline bool uclamp_rq_is_idle(struct rq *rq)
>  {
>  	return rq->uclamp_flags & UCLAMP_FLAG_IDLE;
> -- 
> 2.53.0
> 

Looks good to me.


Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>


Thanks,

Kayra

