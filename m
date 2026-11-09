Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794238085;
	b=c5oZdiT+28o/9sayw1sNGXtzG1Bg+Sam5WjJPEgtjh3HxqpyRhiiHZ7KVFJ32UwQ33W8
	 Xdv3iO7wFs7XpiswRNG0BbHxVzSwirfvnNIRHXQOgMX4PCSjXLDrlTwOKlaDFsARojr/j
	 brD/I/gbu6U0iBLV8oF5uVA3EWLitnxLh61ikYFeZsvGxTXgaZKz6q5/2CB0PU2n/oSud
	 rmvMx1iLukkeoYyZk8oLhwwSm4pFqiBtRzNxPneaiKA0qQ7NgL63YfNOJHdr4VXMNwuxk
	 6YQYCAOV4tMe5Vfi4q7zU+xncQ9/dBGgJHTT+MoGZOZVuPV+wjKSfoTz8IOl0cl4/ig==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794238085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=rc8neeysb2lhJi4v3fQWNja46WdfiOwuQ6GoM/+JvzI=;
	b=Atr6O8EofRxqqSVzvYreJ8/X2pvjvib93bpDoxWpCc5A3HjQP6j2jFzzUnragad10MMs
	 7PZX2+nNnvlGWZNwGSU12drUqQcmOt27K/g2paGkoUUEFgZQeFw73JJ9DSa0U/qySAq7q
	 OzyqNVDXcIueMpBCzQTKSBjGpvJUrj0mg0Xnwj2htafb3tueXfnWW2MSZhQn3T37H+kID
	 oJ82jLk3ZguS/rAPlY3+h7ljJCZg2xG1W/iNHQe+k4lgOwVy/vKV5+ra71/OjxV9DvP+Y
	 w4WArAH3q3fg5g3bT5ASLhQNYwsZWnaQqb2+JfIcV+ZLtnF5BLXrPj9M03TFDHNZR1g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zHmolP8k;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3869606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 15:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3869606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zHmolP8k
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b633ddfad6so1305416a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 07:28:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794238083; cv=none;
        d=google.com; s=arc-20260327;
        b=knEEk6kyVkIbmq8zRrZjPg9wCVuhhgcs6S/ztlGYCeASA+rnC8I4GkGWtf2BIi4z+q
         zwU2j5zk02KAuNsW/eX4vBvOp/S0IT0d1uaMJep2cXYQk9lLK72jABxAA88TrMtUVVby
         wmzXuzKS5lJvA2lCXqN+7D5NoVe9HGuUyhaj5bc0J0Y/TaTv2IUEPV1lwbHyoKiXXm4m
         9VrQQC9bGy0wDNdhUMt3pELn71amklJpFP8JRgUn19DPrTFFuiMS7sPp/cBEsx15QAZw
         8ggFLzm21m/X9yAoQqYgvcj1BlPC/kM+p3X8TPlXmutl434Xf8WsGkUlQEc+RJoNfpCM
         JoEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rc8neeysb2lhJi4v3fQWNja46WdfiOwuQ6GoM/+JvzI=;
        fh=ksnsatCL3NwjpkSu+y89q51V1hUG957aJAcEmv5ELtg=;
        b=saMgPluAcyGPize9NGZznTxUa9xqpSSFVdRbMt1X4BvNAUy8anOPFuI6/6+1iI9FeR
         TLcGcuEx4yaiBKL6iNqJzXqLlH4/bMx9L572fiSvpouVZZpFPUaFbnfxjmmHGMmUY1ZK
         bl2mzj+4f2oty+j14+ZIv/J+7C//iOnJecpXvPkYjI3FSLQHB785wDWfif1v30NKx/GT
         zTjLgs8ud53eJ210uSsiPM2G4Gm2xbH6UJ5YjtNMZPRTFj8pXt7p7W9AOVCzE/79/eDs
         vWtfyKLZyZLF3jDXlxofkyr/zRiPz7vfqEzT3b26gYjORzjYHk1pq8ReGPWV8bGVvqHX
         cWYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794238083; x=1794842883; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rc8neeysb2lhJi4v3fQWNja46WdfiOwuQ6GoM/+JvzI=;
        b=zHmolP8kJzpNhKmXGS2JUdry8wd7hwRK2Fk6tq465Zy6uEp9nOp3OCbY4ANUd4YEWF
         xPIl0WZdHEcYrtwZNvQoCcSOgc1P3tWKyTyFVLPmorOnHudnj2LU+lg4DjXl5iB2PsQ0
         FEDRDDp/jVCw/TSQ2qydBzZcfMgi5J/4ZlT0suLyU6wmscIj07i8ciz7KHhhDBMj/h8L
         njOMLbxga9zrlTjCohbg5oj3C495NMsr9PzYOd1b7GGomW2a1jP69x4yDhaLJvCBEnXE
         G/vS/cgHvmdNowld9azpMV0CzMdlKKZBqlIbDJeOgTRw70tdC2cgeajqJ8rxDlqQVdwK
         hbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794238083; x=1794842883;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rc8neeysb2lhJi4v3fQWNja46WdfiOwuQ6GoM/+JvzI=;
        b=dvVyPEL69enfMyb1zHkTZkbzJtilqzoKiiAR8y2Cy1hsVQHm2gmGgtRaLO51fRNAER
         Uc9asTPfcRVyHO0LPeazlO6h1vhbZMWV3XOOpVkSU7espR9tuT+QH1+acV3/Feg5vmok
         JOkj9fFKCChKVwGz5ZBupClJHNLLIlmxaU0H3ZLYMlgYpps+c4MzcVaPWcq6neDaB2io
         Xhg888nKopR/XId2js7vtthDAUs8plcBKFxfpsKTwic2cMT7mvi176IDUJYeY4751suf
         4FEo+3fA5GASxFRPnV9jUQNIe49doY2GY182r00VFq1zKP+AAG4pHAA0UteTqlZkCz0r
         6Muw==
X-Forwarded-Encrypted: i=1; AL+hErF0UrGdzXFL/LzWxZv2McXF5BRkubp5dFK4COSfb6jSE2IflkuVN/RXfv7nIWCwH81UR1qXUP61RXV3QMc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8L/Mj2pCJRsxrnOz08vl5M+H8huj5F0FqNqvoWuhF40dOYd+du
	YW5wX45E4w4vGoVy7+GY74+g/tqyGv6ujpNk9krz+/hRFL/T6ZJuBANAkzZwE4egql1/jI3WD7M
	OnbTfbDegJvRGENGKVYJHhiHIBfjp9IjbrkYGCoOB7Q==
X-Gm-Gg: AYBFou1avTBgYx4ACCaYOMVM4r+QpGlKEA5RCfCsV537ZAVooCEKeUH1ryw8Msb+X6T
	Pt+OLVXrXgE8LBbMgcNABIVjN9ZaAoFjWkgZV/j98vucRcvN6W09LrqRGVvYxa8IDelCol169q+
	Wke+7xo4yil6HWp4ZOXIuuCpOMh9xq/Ua6wn9Huk9kkbROVxVdWcT1BFSwY2CHSUW2YtVI23OGh
	OLMjkPWNyCSfPTP5MjGGmU6cAxTsaJKnk0pZGuAhBV+KhONoqJjDC4Kz0MdjoPcMrTXJ1jmDrmz
	Ob6SW62xnh88rX/LaxB/qdJpAY1B6Q5FnwWJ/dmKRAmpPAjTxKVgxCHX73J9HYfoS1OCUOw0cKl
	h+sUwEWYapfKIaBp1141rnGb0+3N3u5dnRwpFaqg5L5cTBaTGT8yE2IGhAb3XqiZMLTqQOGHXHn
	gb72JTcc8C7MkvcIg=
X-Received: by 2002:a05:6402:4513:b0:6b7:28b9:f357 with SMTP id
 4fb4d7f45d1cf-6b728b9f818mr2731473a12.40.1794238083112; Mon, 09 Nov 2026
 07:28:03 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106151947.3991524-1-vincent.guittot@linaro.org>
 <20261106151947.3991524-6-vincent.guittot@linaro.org> <au4i4IWFvJw-7Q0Q@scheduler.schedules>
In-Reply-To: <au4i4IWFvJw-7Q0Q@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 9 Nov 2026 16:27:51 +0100
X-Gm-Features: AclHuK-rDLMXgdJprNmM67KERGYoPJj3EfP3DSZ08EHC8kkLhXMU79a1MZdCg4I
Message-ID: <CAKfTPtAwAkm1NaZac2HKDPgAOh=7OjasQRwgr=e5jfSeQe_R7A@mail.gmail.com>
Subject: Re: [PATCH 05/20 v3] sched/eevdf: Add per cpu cached min_slice
To: Kayra Cizmeci <kayracizmeci@gmail.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, 
	linux-kernel@vger.kernel.org, lukasz.luba@arm.com, rafael@kernel.org, 
	linux-pm@vger.kernel.org, tj@kernel.org, void@manifault.com, 
	arighi@nvidia.com, changwoo@igalia.com, sched-ext@lists.linux.dev, 
	qyousef@layalina.io, christian.loehle@arm.com, pierre.gondois@arm.com, 
	sshegde@linux.ibm.com, tim.c.chen@linux.intel.com
Content-Type: text/plain; charset="UTF-8"

On Sat, 7 Nov 2026 at 07:53, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> On Fri, Nov 06, 2026 at 04:19:32PM +0100, Vincent Guittot wrote:
> > In order to use min_slice during CPU selection, update a cached value when
> > needed after en/dequeing a new task. This cached value includes current
> > task.
> >
> > Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
> > ---
> >  kernel/sched/core.c  |  1 +
> >  kernel/sched/fair.c  | 28 ++++++++++++++++++++++++++++
> >  kernel/sched/sched.h |  1 +
> >  3 files changed, 30 insertions(+)
> >
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index d7c3b43158de..031efe7d49fb 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -9012,6 +9012,7 @@ void __init sched_init(void)
> >               rq->sd = NULL;
> >               rq->rd = NULL;
> >               rq->cpu_capacity = SCHED_CAPACITY_SCALE;
> > +             rq->min_slice = ULONG_MAX;
>
> This is already getting changed to 0 in 6/20, instead of changing there,
> wouldn't it be better if we changed it here from the start?

Yes, the rq->min_slice = 0 in patch 6 should have been part of this
patch. I merged it to the wrong patch



>
> Aside from that,
>
> Reviewed-by: Kayra Cizmeci <kayracizmeci@gmail.com>
