Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982149;
	b=XtRYrQtwuooRvHNYKKHCrzQnMHqlHBxSlYYkRuA+vG0bL7HQTJa49YNC9CZbW+TqdBUH
	 132z80gpw+6NCAdaw+Xsfe3S4YTtPh5uSMKp6kJHi5kV63bs23AwMv+LWb4J3CqTzooW/
	 IossqWKY5fqgt2IZbhbe9VNYK281xeoUDaaOIT6ZbpLM84uH1tEu4Pt/hu/hTeGeJtmla
	 7rKSuXGRvNRliwImXAFUOWlltfgPEBidocTzohxFbIo6dCkTocRWZUbhiq85GNsBleteB
	 ZVdAVkUVVLwjTZMVRLpl6KLtYY3nq4glibP50Ms1X9PpFA9z71mCAx/62z0YeNYfSiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5qoJPw+qIEyXRRR0ruoMunl9bad/9mwg4HzwIER48nI=;
	b=K9NqKhOr+ndGKWUlG4xB0OFyzM3ekg5ptjwFjlEH09N8IZQ5a6vI5A74iwGVWTi9N7qn
	 /ncQ9nwTxINNV9yoiLXSAP3OtQwBtm1FFPdr+SfMUqt9I8DBhjp1FWS/5savs53O5asLr
	 idtlEr8zLL6Ay9nGMFgRqhERFh75mZdUvu3zG5+vzil1SzEX49NSAS5gQ6pi/7CkM4MVk
	 yV17jkFlCQizGS3tygXrOJEExE/btJZCVOZIqlZmmRLLZV+Jl11rmfG5ie1jhjdOn4g4u
	 ua2R3eHZ7tYOyAClZrg6lYMqwE0MmT/NIOkQQxRjWJXDqjK6mc91Bj60TVXS6Ry55rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+n5sxOE;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669C1606A32E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 669C1606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C+n5sxOE
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49083b985d2so39085f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:22:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982148; x=1794586948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5qoJPw+qIEyXRRR0ruoMunl9bad/9mwg4HzwIER48nI=;
        b=C+n5sxOE985uUnk8dQQXRVNC0HtjGMCyQUl2n3DTnj8kK0Qtw4uLms6awbAOzww2OG
         tS6nfpqghjSLyFOec3ubyoXM1rncg1Pjx0d0z4bFEJ+jr3ftkBZpc/yieqqiqm0V22DX
         KJqQ4QJlStK76jhQUIHUTJIdn/TjUZsUb8wkWkbp937yiVcl1jVJ/5YGg76sZ+n/SES6
         Y/mzex/btJgGGq+jbljBzOC1vlPCLUKTeT5VyeGANPGN69NYldmv35IoNBjcwOsjxsjp
         1nbKGaExDgWvD1TwZaGieH6wi4Sd6CD1CHc1X7Nl65O/C20M6j+1ERjcAUTdLFnplJpY
         9tXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982148; x=1794586948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5qoJPw+qIEyXRRR0ruoMunl9bad/9mwg4HzwIER48nI=;
        b=hZhAfXc1MH8TPeWb76BnyV2aT1+5segLaWwIznxltNx65OU/9aS+6CfNdV4aBKmWGi
         nH++TwcBt+6T9ZyKqqnChjyd+ZK3PLqP4INxpVXu4EQRG/NHRhkZ32fc+7RmEVDW1VcU
         41uJI6bcVQHu7yyIgtvS/erlB/+Fq5JOuWebIPXDGpXEkpR0BsB1BgagStBpfh7Vj+dU
         V9QOb0oOP5IUAKJKif0tyHv5syvctKpBAU4ll1I+TsuCHVX6Ealgkb+dAgly7mJiXdTx
         HyF9YIWkgp11mQlYS8TQro0pgcq8QzTx4Z6jjpmTtssVlaXCiz3cIQy9U0gdk6AlZKz2
         IHdA==
X-Forwarded-Encrypted: i=1; AL+hErEqCU5jQM5yGvPppoVxLXFn9MiLx9TLW7bJvIE6TsmbUIhlbGZQTtIhpQ+uhOXmbIoEXI7El8yssDvuO74=@vger.kernel.org
X-Gm-Message-State: APuU4Z+umSf2kEiaJPzUv3Hdfx0zG4EfXHDi6ggHwX4LS8D+PpC4ZFZE
	k5lZU7LfIHMEqZ5Xz7OBEaqNnbfSjr6HLgmi/M5wdhn1dtpo9dtxfb7S
X-Gm-Gg: AYBFou08+P3IxFWoSgEC/zZTJStHvh3Cq5UbD1vNflMXpGvNEVMt5NesMBikJ5Dfgvj
	SB1XFMEF3mBiapTzkrCpLsZj+7HxqS0+DQY1GLcdnbGED/L4L4A2LNV1I2TVJCBZskVhg1h3sIV
	d9OoNjomyWXuO0CVRcN0CYrUP5sr5gm7QQBbfNG5vDwrIoW3wQTXzc7V6deMzB6UE4f03a4aVow
	rTQg5zqDJpBw8S5jMPbqruGKLrLvHFM97VIgr0SN7krhSPUYTvOo4rLDtTLz6mVkzbHgAdCwGPg
	q1H0orcRB9xGSi1EVZYOjoKtV5S9dpyKzQpXJNkpD7Has0K8Zok3b/cIl0pwjIv8RL/hDGi1ira
	jgBBgeizwtEnokh4mcnTeGS760BxsAyt7ZIGinW2aksUsrveNMVmclBNiZdSP7Unr2toTiwzEQY
	G5Cw1RYirDHkpcBXs/Y6U8nRb4szlTQtyonVTBqw88nUIUnsTg62mm2dDnvD10Bz2JEk/qiuMXY
	3B3QONTrnM3tvBcOd8EhYMqGkQ1TwXIZuq1f05qbr2XKQtz8HjKZAV0/AOK+qc6E/WOC5GFTB5T
	kV8NvSKzXMqVLmjteUyf3YBVcYlOHos8+wPlqujHSxxJTLc9Iuo2Dzg=
X-Received: by 2002:a05:6000:645:b0:48c:6611:82 with SMTP id ffacd0b85a97d-49272a3ab3fmr5316957f8f.1.1793982147441;
        Fri, 06 Nov 2026 08:22:27 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d087a3c5sm3952650f8f.0.2026.11.06.08.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:22:26 -0800 (PST)
Date: Fri, 6 Nov 2026 19:22:22 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Subject: Re: [PATCH 02/20 v3] sched/eevdf: Reset lag at wakeup when prev CPU
 has been idle
Message-ID: <au38gSTzmvPKmqWT@scheduler.schedules>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-3-vincent.guittot@linaro.org>
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
In-Reply-To: <20261106151947.3991524-3-vincent.guittot@linaro.org>

On Fri, Nov 06, 2026 at 04:19:29PM +0100, Vincent Guittot wrote:
> @@ -8376,6 +8383,9 @@ static bool __dequeue_task(struct rq *rq, struct task_struct *p, int flags)
>  
>  	dequeue_hierarchy(p, flags);
>  
> +	if (!(flags & DEQUEUE_SAVE) && !cfs_rq->h_nr_queued)
> +		cfs_rq->idle_seq++;

This needs WRITE_ONCE, no?  3/20 uses READ_ONCE().


Cheers,

Kayra

