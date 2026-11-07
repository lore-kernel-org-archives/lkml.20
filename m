Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794058087;
	b=jm89wW/xvzjK0AGDFT+RzCDq4VYm7h3zlWIIQi1tG3xtJ6XrZw3JZOLhFSXfeYi9MIlW
	 prko20sPoBY3Rf/xlKctf2jdGEkJda8RSV6ZkRYakULlgqllb++OvYDStnqzGn0C7cY2s
	 EkWGVmLU6eehEjA7Twx3XylsBGpDOjxA45+rjM3Deah4V2tVg6gJGSF4fXuYN0F8TbFVN
	 3yIt0p0CUUgh74RUyXUxMEyemvdfDuF7Wohi427JY8CQT3l5Sr8PJ1Qk5X8z7SLa0jQ/e
	 P3akWffd7UlANKawUgw++9YF6/GW/lelUsIvVAnd8/IrGHggcZEEYs1Usc89GGa0ibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794058087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=RzNHZRxTloFNeuox4l1fnn7n2ZRYuRd2oE0NrztdOuA=;
	b=Tf+BMsCp1bICu/9X0aGwCOAYgOxqWarSK/ohrQye1ejvoNWhfflf2QaKRInmQ0oJbrOI
	 QVJVczSoxwPeryq8jl+7LCrpAXxLvE59i42ZNHPHNtCxA8znJPLh9gbBBRouvUszakqzy
	 0a/2Y1fSM8ffdNnzSswR5LnqJnT9YC1Zjd/tltAXzvgOFHa0fgnWlR4Jm3I12cmCrMXer
	 ydtJ6p2arxKvA/K4dActe1mBOn4I/CPcixbrNHO1vqKiUdomEEwY3gi1Dhzq7cNa1u2WZ
	 RUKof14HPfCyqq2Fk+IWsxFC6XIW1mh41eu4uqnc2fgKHZirkcd11rbkaWFG6mYr0GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iiNR4L3o;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB977606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:28:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB977606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iiNR4L3o
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4af520023fdso3788035e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:28:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794058085; x=1794662885; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RzNHZRxTloFNeuox4l1fnn7n2ZRYuRd2oE0NrztdOuA=;
        b=iiNR4L3oHF12kag37UHJAFxlxwEnxvtj5yEs0TUkJm7DAz3CKqbOLS0Nxdox+Y9k9h
         xd2qMXE4f3h5Ix2Z6RXGaUjkjCUTw3RvJ4D2lyAypJRJ4sPamBnIR4v4BhXARo1/qkX/
         WilSAwU/NAYERvm0DK6sd9CZQCXKALoRgJ+2tBa44vUZUIemaVsMYlcNH5FfL9BWlSkN
         45SNDcWigfmsqFRuyX1DOPmBvjnJCGHF7G2OSi8GfBQIC7IKvIGPL1F1UuTZYXxotVDI
         euMLXrnoTDyHNDLogOY+gWFdG+/JtSeNkEB/aSI3c9zTk4QpGuvI/kIWZZhvIsZ6gGQr
         ipBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794058085; x=1794662885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RzNHZRxTloFNeuox4l1fnn7n2ZRYuRd2oE0NrztdOuA=;
        b=aB+l/1CMkvN9h1MtFE2+FayXPOfRbk0BK48UJm2U12NFrTL7bwwOuNRJkcSA6HVnOg
         HJOUxvbNHsejhkvGGIap7pyPwDs2dwEMfRgukcxAek8S7HaP4+yRw5l+a6aeV/CEqXTM
         HFKNg7NbbA8Qc9u2z1+M5yZ1pyNlJQpP19DXq6NK+bx5JBk00tmF2ugTA0BNuV+gYOaM
         Nkt45L7vOvUVtzCBXDTmU7A2YgVXR4Szatr9FUhQEfwKZ1AT9MvdyiSp9NCx+qYLyGJM
         XA0rJ0ndX1pQpBHBzFCF8hwFpNmApHMvseRtKOZBGlcLPM+alKvlKmUDEZw/JFOUQgyU
         WhfA==
X-Forwarded-Encrypted: i=1; AKwUvByCIoU+22Hi0l9YyxyJtd0THaQtVc/fWFCFWtS7/gFEP0eoTTO+l43GG/sCAH/GeRJvlAxAlJ48eC3t1s0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/o1g2WYtaKU8lc74khQXvulYm2rze983aZD3L0gU9avvmd8RzD
	1vzPTUBXNEVmpfFTRulN+oRNaujAZ9QFScQZx24zpBzBsAjbGQsEi00a
X-Gm-Gg: AYBFou1qJd/0m6J2Za/4fIQqpvkUsJmpmYat8PEk6VjziaP3MWOud6NcDnxYRRpJnE6
	xtFFMmVrXpfAVViIR6lJ6o0gQbPfMvWvjW0le2C0csIo7Zqt0J19vowJWL86Ed17asKzOPtE/sN
	u5c+y6ksHsRRHVO5xMcMmdkNtzzx6A2uzK0Glcq1+sHMQWrOc4UvAJODGrsv9z/8uX4IHvMEESO
	QvYXX6G9IK2T8iJMvX1kSXcfZVrSws1/QnibW21GUrGhV1yZ0J8WwZZdPlJ7b9dNkJRbyrFFwqv
	RBYG+QndaGwVlRkHDarz+yiaYCd4vrXdlod77t8xhXkpPcMlRvYLmjrPLlKLSZSLwh/qlvUb/Hf
	zFl2L19YqyeDNdUCMgR+6VC7G58yMG3EI89ZkTLyWTjo03kGXBwXjHbhgjwts1p/u9GkEr3rSuo
	pE7FZGPpTBu6laJ+4xA9nSDvn822KihQRySx4FnoleEOZmQFy4Hf966KXVkftgjcfpz5f5VQQSw
	z/zypnCxKWX+whoYXSlwBFOlnhmvqf2PxYhPD84MV6eDV+R1TiWO7aQBo1L/db7p+fZyEvRJ28E
	Qnzl6AAsdJaJ4gcVdMTUf1iwZpoUF/EoJrhZFMCLLLqJeEfJvGEFpnI=
X-Received: by 2002:a05:600c:6d8f:b0:4b6:2242:d0be with SMTP id 5b1f17b1804b1-4b6d82b2c85mr77347165e9.0.1794058084910;
        Sat, 07 Nov 2026 05:28:04 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7e326b7afsm66823065e9.2.2026.11.07.05.28.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:28:04 -0800 (PST)
Date: Sat, 7 Nov 2026 16:28:01 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: mingo@kernel.org, linux-kernel@vger.kernel.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	joshdon@google.com, tj@kernel.org, jakub@okonski.org
Subject: Re: [RFC][PATCH 3/3] sched/eevdf: Fix sched idle task group
 preemption
Message-ID: <au8kpcCsy0ibRwe3@scheduler.schedules>
References: <20261105165525.011876858@infradead.org>
 <20261105170157.765325702@infradead.org>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261105170157.765325702@infradead.org>

On Thu, Nov 05, 2026 at 05:55:28PM +0100, Peter Zijlstra wrote:
> From: Vincent Guittot <vincent.guittot@linaro.org>
> 
> Even with flat hierarchy which puts all runnable tasks in the same cfs rq,
> we need to parse the hierarchy to check for sched_idle task group.
> 
> Fixes: 85570f10a4c6 ("sched/eevdf: Move to a single runqueue")
> Reported-by: Jakub Okoński <jakub@okonski.org>
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Link: https://lore.kernel.org/all/58dc8e8a-7260-43ce-aebb-8d9c29a6afc9@okonski.org/
> Link: https://patch.msgid.link/20261019182622.1584454-1-vincent.guittot@linaro.org

My first old concern is solved. So..

(Dramatic Wait With A Really Serious Song)

...

...

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
