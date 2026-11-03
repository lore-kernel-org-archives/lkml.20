Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793669709;
	b=r1cKkOOirhbc+rZze427mv7PusaG+033bC6QhevYvNpmFxgq+ixyOePw0S67IIbEH844
	 U5KYgVr+Zu8jZ9ZA6saA2IMxLv0rmPhgxXN26L76591HABOgXFtDfE1JDnBgDDfkCAR2G
	 pBU4nKHfY8ingBTzUPvrJZOIdlI9QMOKTMzcVD/9iYwuIIWLBSa2I3AaEo+PqnirZQusJ
	 WP1eikxFxdYMZ2dJPqYJFq+HQ0/IZcvrlEq7x4Dg7PGK1y9iyZ8fYO09orAwYe3GrDe48
	 3pbTIOxzHMSonUwYX7sRCZ3frgG2WDuy8msFYPHmmnf+goDqEu1lPGwQRWphsHF8Llg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793669709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=cmE3tFhLbp9XIfbD4gcsOZim0cWMbcIHyG8WKJckdko=;
	b=kK9IpTJhA8iYrhxf41V8MkB+kuE3LT6FirhLQWrqQe4oafqM+dCjnGwcY9sSRkzpOst7
	 av1iofFSXOIFa0MnObHnrLWAPQBjZmsWq2Y+TpCIr+t1cM6gxliWSVY2K9wAP7/KcfCT3
	 dj71363N1/lSmSSRKxJMoOAjiTXWjKMrIErGBTxhrWftl5SvknQRpwa8PLaVuPsNUE1Cf
	 mFs0eCaAeDjHvPJ/ZKdWl0WD3ei3DA+ok803QF/HylWWtlqxUaQ/Ip9e3bkR43Q/OJvZz
	 QEdluDkUwHYVx1xgLzD7GOZQqGWqeP1o/kko/WBUw1/z8iYCHZ/o1/tiPcSEExkvW0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=layalina.io;
	spf=pass smtp.mailfrom=layalina.io;
	dkim=pass header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NuoCxkJL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690C606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 01:35:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C690C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=layalina-io.20260707.gappssmtp.com header.i=@layalina-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=NuoCxkJL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so40558725e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20260707.gappssmtp.com; s=20260707; t=1793669707; x=1794274507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmE3tFhLbp9XIfbD4gcsOZim0cWMbcIHyG8WKJckdko=;
        b=NuoCxkJL96FXhxPfYM7AekE0pKHxaSSwTmhFn0RRgwt7DFojYvybKoFTLpR9aXuB6P
         Q66YtUbHI+b9aY/4WBtybV7IUkusslLVseefxk9ztImh/wKXWL0TrlE6s478zKJXvKgU
         Mkxm2054QyrjRTUBZbP9EzXmWhDffbenpwPiWnhhIVqn8u8skUtrc6wcFsTbxukcTGl/
         n+E+lrlfqllhnkoCudsi7ycFovRivm8YCpcewg1edHJbGmq/vUYBB2CkHHzH/cijFA40
         cOptCT11fQeylbkHozg+4iRTih8Y9VPQU6ORB6ZeriWM1tmJCrlk9rzHPNerNjwpBvhG
         sa3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793669707; x=1794274507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cmE3tFhLbp9XIfbD4gcsOZim0cWMbcIHyG8WKJckdko=;
        b=dgnTQToxD6p5DXifD+F1zVHVXcM7Pbq6IRqGfOGlCZU9xQHL3tCYboAbCxZcUKuIiS
         UY3aXL2haZzq2ES8gNpxIesJbrTIQR65Pv80Y91y6zfxwJ85NeWMsPnw2nFuxyCqrV3K
         NjGCBDec1HotUxQ7XFdBz/D9Wux4u/zGLBzvg6M2WTru20VLUbwo9n5PAmizASlGTuB9
         Diib1riahk5H331PnLya/+AT/vdlAj687edzZ3kqs5TN9F/2gFyCZs9XHPrOkmXj9fX6
         sRjZTSmEI8W6HMQM8jiabnXi7PGyU82Pa2o2uQ49XRB0TQvxNmvHiJR85UJDDUNCPGkl
         /aTA==
X-Forwarded-Encrypted: i=1; AKwUvBxGj4rGPj81UPA5SLDlJa4voUi+0iTfw3+ypCQtAagfHn9lNIDM8bhsLR06b4T8mzMmIbNHNYROm6aP7l8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIXdUfBJT6IaM6sWXCJahurUEKJ7ltLqctyc4qcEMvMq0g+ahnt
	qX8H0iB0vMZ+utqYocqKFZfRi4kZmHiJ03cifaLriwwO9iFDS0OvFZ5dhL3LRPnKk9A=
X-Gm-Gg: AYBFou2GYxOxSNecHE5/ED2tIvuoqegfCTATX65TEwb1FkUNdJuo6uV39uv1k32bJ1b
	X37TMI0C7RJgb3sqBtCxd17OHfcqZ4t49aTFTsElKC65cnRSt5jqYQjRaWVV1S4iY+KKdV6r7KR
	RjVurlWC0T2kUZcqkNvneUEufC09cc+2lnIBslvcqmuYApWnUlKBksSAbs3mYCclhig6dx1h1GO
	vynJmVFpm+NHS1/a8VEYBq3gkAxdksDIpoA4U9rlGvfkA+n6epOwqLKPQHK1JrY0NDhbGMd5LVo
	5cjFfoXhmoBSBhrk+OOZxcFUBEl9fKI3262V/nViQGk2306sr4fYxazJIKQbbEx/Va6LIfoHRD0
	RIXRhFx8v88md2XikIpgJ1nWdM7nLSzQ/DDiRdRXJ7OOWu/rOSLWvgw1TQCX5FIY2II5biumo5l
	8vhBratJB8jkqVAmpGQIYZAaIUDNzgQXhz+blYc7g+SIctMwKLY2ALIxnyi1/gQ7sjAc1eVHhD0
	3QSFG6ZHTguFJZ3XRM+BU1NA8980htYF6U2DeX013mCFrr00mHIiLA/Bu9p4Wf3bAxOYxsuCd2m
	eVe+pfn12TekxeHxLV0QC2lCcxQiuOzp7/d2zNIzgvz7eO/fyn8FYfXsYK1XBYtf88Za70KdwLT
	cedpuIY4pmBeU
X-Received: by 2002:a05:600c:4715:b0:4a3:598e:e7a8 with SMTP id 5b1f17b1804b1-4ac150b28bamr270781525e9.4.1793669707217;
        Mon, 02 Nov 2026 17:35:07 -0800 (PST)
Received: from [192.168.0.219] (host86-128-182-179.range86-128.btcentralplus.com. [86.128.182.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm25705915e9.0.2026.11.02.17.35.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 17:35:05 -0800 (PST)
Message-ID: <37a6df6f-7f25-4acf-a253-d00a40bc796a@layalina.io>
Date: Tue, 3 Nov 2026 01:35:05 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] sched/uclamp: Move uclamp_rq_{inc, dec}() from
 core.c
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Vincent Guittot <vincent.guittot@linaro.org>
Cc: Christian Loehle <christian.loehle@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, John Stultz <jstultz@google.com>,
 linux-kernel@vger.kernel.org
References: <20261103005953.56271-1-qyousef@layalina.io>
 <20261103005953.56271-5-qyousef@layalina.io>
Content-Language: en-US
From: Qais Yousef <qyousef@layalina.io>
In-Reply-To: <20261103005953.56271-5-qyousef@layalina.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/3/26 00:59, Qais Yousef wrote:

> @@ -2188,11 +2173,10 @@ void enqueue_task(struct rq *rq, struct task_struct *p, int flags)
>  		update_rq_clock(rq);
>  
>  	/*
> -	 * Can be before ->enqueue_task() because uclamp considers the
> -	 * ENQUEUE_DELAYED task before its ->sched_delayed gets cleared
> -	 * in ->enqueue_task().
> +	 * Need to be careful what operations are done here, some classes like
> +	 * fair and RT can enqueue tasks without going through core due to some
> +	 * features like throttling.
>  	 */
> -	uclamp_rq_inc(rq, p, flags);
>  
>  	p->sched_class->enqueue_task(rq, p, flags);
>  
> @@ -2222,10 +2206,11 @@ inline bool dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  	psi_dequeue(p, flags);
>  
>  	/*
> -	 * Must be before ->dequeue_task() because ->dequeue_task() can 'fail'
> -	 * and mark the task ->sched_delayed.
> +	 * Need to be careful what operations are done here, some classes like
> +	 * fair and RT can dequeue tasks without going through core due to some
> +	 * features like throttling.
>  	 */
> -	uclamp_rq_dec(rq, p);
> +
>  	return p->sched_class->dequeue_task(rq, p, flags);
>  }
psi_enqueue/dequeue() are done at core, not sure how much an impact this has on
it due to throttling dequeueing/enqueueing without going via core and missing
these updates.
