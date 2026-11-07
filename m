Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034408;
	b=QRMIg90F4VP47DilhIg9abQH3XzFklZyc6tIwC4xeEZKBRG6PV+i1WYLAjLN2k+GOCZo
	 Vo4Q1qJ9eh5vQi56N0314lBrX9vEisBRwAFxiDDAbRHoGH4674aBCL5yV7F0matnE282T
	 PA1qiVGQCqBifA6uOPsHJaxTIaZUXbhpktPFAzyhE/D83Zhv8+L08+N+Yds3UY+2RFBMd
	 PvZYdjqvDoeqicGeynQZ9leFKrvZuAiLAZ39mWbBtDs0ickDm2jynulok7tGaQmrvLIlJ
	 ai8Dw6iKm9wFyA8UTkHiD8KOqsUU199+rOlfB3LkGFvJMWXZoaVt++zR9PcB49NJNFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Eto4368JR2hmRW7wKGSiDlCRlUrolYOPtl6iuMGKc+w=;
	b=W6YrIBXPtw1AqQDiCnKOLVKQcW7C1brHPWJDU0JU7MHJxN54+yV1/Eb8EH8HnP93LvWT
	 S9hHAC/FIc+/nNss5L1Mzs8g2dqSD+mf40DWC85qCfqjc8Xb8pFz62DEbhbf62aH0Gnj6
	 xhOM+TJtQq6naVuGP0TYkM+JIw3078l4ZuZOZdylzOl4GePyMML9SoKusR89QtpM7qMzd
	 sVw6znNXdjZnPQO19VYKKWe4ima6Xw8aQI7huCAZ899uCQtAHRVnIUcliQ99z7ObMkl8R
	 A/uyENqJdq6QfIh49RVKDSaaos5rjBZNnjvnLhP1epsK//oRX3dqAt8kMI187IC55FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mY+3oYdC;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448D1606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 06:53:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 448D1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mY+3oYdC
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-49083b985d2so52586f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794034407; x=1794639207; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Eto4368JR2hmRW7wKGSiDlCRlUrolYOPtl6iuMGKc+w=;
        b=mY+3oYdCiSGPTWaKrvVd9svyYYnxgUHya25yRswOZEN/Er+kukrUrCdwZfyVZejP9X
         GUXexxRtk4JsB0CgOp4UTsQgF8jsrHiLYXIZDtdTLA25587Rk+1tlYx3yrI1iudpKpJD
         FzBmWZC+DspYwu5AFCgfqdpbCueeT7r7AIWvWscWNFv9UorWUi5DK58WJe6ojB33JMIT
         UIMKzd3bIxmYXgClNX+Xkuq8oiUX9JYxG/Ym6dQXTUbZYS/EmF9kbJzxUIegeasuXBV5
         oUyP506SrftH2aLOykclmV5dVvdPSt4ibMQ1koik9WRPUAtD0pEpirDpqTtsSzySyiv1
         /OBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794034407; x=1794639207;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Eto4368JR2hmRW7wKGSiDlCRlUrolYOPtl6iuMGKc+w=;
        b=12Y1B2mbvDy2S4BQZ8XVbM7F3JcKkQsP5EtX4k0lHdGfJoI2+Lbcc3u+yX+EuuRf+y
         wGKwqX5sg1MtNLllBlF8+zU2J1cGL+AxGVZ4juTe3zcYGFfoctCzZKYHuTP+08fMkFpW
         LLV3prC7StI4vRq71WE84QobE+VPcc4aaUlnf5cECbSlYtev1tJR0ojrBEfC+oc6zqhx
         XoZEASAvq9fFmZG4bdhzIGzyCljY60NUB+iyp3Iha+IlJ9hXsehq4DCT+HrRJi07zjMz
         wYvfTQhZHVIgPMYM0wzqf0ZdGQQgT2xubg1Y3lOyxmwQ9KvRi050XQoG48/aOXoEc9tg
         ywAA==
X-Forwarded-Encrypted: i=1; AL+hErEKrbOKPs7G7F1g8UZ9ZZKp8nrJ6Tj/L3n5SA2Ek3am6H+oXD+hZnJeFzgFTjPISnHtQZIQlVtJN3OE7xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JJNj7VcMXFZkqHrT2DL1XKKouGEL3XGVEcIgePOXAAvYHwjzQ
	HLUskOnq55DTGJ06blwLCIcwrG5vVMksIg9bQj1lTa/+TkJs5lM+AfYz
X-Gm-Gg: AYBFou2Nc4G4DPLi/skcXS/7td26Si/CfqhslzOxPXoqtqKYP8oOSXUVVvBK5KoxYGe
	FO9R+4HinYa073mL0a1lW9iUOkzQrW/Yi5y13bgnhSoCnkzXGzN3sREcj047rwuxnKGl01Cqs7/
	iefmmzDEbmar6LA7gx+gsu0gC9/JzK1EXRZ6HLQCjhMzQKZIXBRBlQQUFRLUVjDmA/nTtR1ORMN
	0DqpLF/kfXl4vpsXyBrr+eLuLr230/Aj3UnOVFKGy9+3dJk50EQTwl4clQgwpYL4tUAemyvD8bp
	F0KnzhuVh3DKOfrkGe07Wl7KffG3ztGoIzlMV4SsDtzWyzQ3SGvHNk5Y14jA/Sdl9TKN6sdBvda
	J8dUOg+IHjQHp3N+qQpj+ZUWo27djUssHoNj3yGrbFX7GIxHVyJiLrFBPtXAlq6x8Je7vFVivQM
	x5t4/qseTTwTtw+SEG50vxjceV+lTfKeG0EzBXpaWS2PVoa1eRAmjT6oTro7ecSIQQp6mKf4Tr1
	s8Kg9pTAGVC8PuPG1PvWeWRdUC6Gnn5JDWpq+JIEczDCmWywWA6095YCi2QFdaTdQhCGF6GfNrj
	fM639agfHq/Bg0f128RBf/5YPIISb7dhovUZST88BtZxZ3OnsHuPPt0=
X-Received: by 2002:a5d:5a45:0:b0:493:9233:ce65 with SMTP id ffacd0b85a97d-4939233ce93mr3783631f8f.0.1794034406420;
        Fri, 06 Nov 2026 22:53:26 -0800 (PST)
Received: from scheduler.schedules ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d837e3f5sm8000337f8f.56.2026.11.06.22.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 22:53:25 -0800 (PST)
Date: Sat, 7 Nov 2026 09:53:22 +0300
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, 
	vschneid@redhat.com, kprateek.nayak@amd.com, linux-kernel@vger.kernel.org, 
	lukasz.luba@arm.com, rafael@kernel.org, linux-pm@vger.kernel.org, tj@kernel.org, 
	void@manifault.com, arighi@nvidia.com, changwoo@igalia.com, 
	sched-ext@lists.linux.dev, qyousef@layalina.io, christian.loehle@arm.com, 
	pierre.gondois@arm.com, sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Subject: Re: [PATCH 05/20 v3] sched/eevdf: Add per cpu cached min_slice
Message-ID: <au4i4IWFvJw-7Q0Q@scheduler.schedules>
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-6-vincent.guittot@linaro.org>
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
In-Reply-To: <20261106151947.3991524-6-vincent.guittot@linaro.org>

On Fri, Nov 06, 2026 at 04:19:32PM +0100, Vincent Guittot wrote:
> In order to use min_slice during CPU selection, update a cached value when
> needed after en/dequeing a new task. This cached value includes current
> task.
> 
> Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> ---
>  kernel/sched/core.c  |  1 +
>  kernel/sched/fair.c  | 28 ++++++++++++++++++++++++++++
>  kernel/sched/sched.h |  1 +
>  3 files changed, 30 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index d7c3b43158de..031efe7d49fb 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -9012,6 +9012,7 @@ void __init sched_init(void)
>  		rq->sd = NULL;
>  		rq->rd = NULL;
>  		rq->cpu_capacity = SCHED_CAPACITY_SCALE;
> +		rq->min_slice = ULONG_MAX;

This is already getting changed to 0 in 6/20, instead of changing there,
wouldn't it be better if we changed it here from the start?

Aside from that,

Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
