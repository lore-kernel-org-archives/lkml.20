Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794317538;
	b=BvK0UeulqUGBhBbyB226W+Om1RNgCCfGbeEOIv2G3XVDYtPzEovkSN5eJ7QGlVodV7lA
	 UMGgW1SSMUx8N1yq25yF7bcK55eTkQQ9HB34efDf6SrVxFIrD2BSW06RfPIpBzabYZ0Rc
	 X8ONKnZ65y+Pei3TPE92BzIhS8E/N6m5bS0/nfbPW+szd85WfbXRDiuXzNqOusRK+9l+Y
	 r24G+9lA6e7oUlhC3+bVYYCBqhQ/6PW26gKBxeU4zE57zMoGyvixKAsxObLtnOtM/qMzm
	 UnCD5YfWtuGL7lF1Jw+HtJRmSYEpWVCGx6u6ipGy8QUtulmZekjhH7mZyjqFxszG79g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Pj4rH1eXEm9TWaNRKej2G25c6TaNFuIIDHh9BKw0CNc=;
	b=QCR5jmQlh8S9jpy4Vfnx5jGJq4L4oe4V7712Sl42LycBxZygt8JtYT0Th87a/Bj8RN5B
	 YQOaeJSXVCQsT9QXceKn2AKnxpiwwQ3kD71knJN1v/3qTvTSH57DunVblKAQTjJZZsi/z
	 zZUsDrdiPKeLZAoMXem/Mq586Y68nYtazDtVckc8bPlZjHguvm1hOFC+Bm+fuzJYkxwHI
	 mJ86VY5UqZaps/QCTWbSYjVZW9MnZFcCj8jODMZ+dbcxVvrH0Ra7WLDYOA7jf4Lu+PgJQ
	 idohpDMxjkjjs9tZyuURYqlspyLZ56sgPsMz7+mvUW9HLmS+PnzbM2oSu2Aj4OiHbkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AOSlpnfj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0B9606ACE0
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D0B9606ACE0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=AOSlpnfj
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3ada81853so1719970c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:32:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794317537; cv=none;
        d=google.com; s=arc-20260327;
        b=mASoMns9ZKvjVwFfi9E7W6WZGhLmAvycfBKl3XBlBbY4Saxm75R8LsWxvvYciBJjKJ
         DzAoS9iW3+U/SRGmJgua1n3xwR6TVsEIuDBDmG2CgMhHbfZEQoR5X0g9DtU7SwDsflcb
         9jKRqmPWwYMlB4c60iUv3REmi+xREA1Zws3YwN2HHfGo5eNPkf86+DRupGLk0qkSfEmw
         buIiuiHdlc8fQx5/fRKlTcaCeS6aWuOyxYRLTqDSQHTJoekJPUjnOAB0PReuCuS9qVjC
         oPpAhEmUFxR9qJlLjnZ+UIxMbcbmrL1Pi6d2vuiMnLKWoT1gHFlwMrGNpS/Z/9w6WEH4
         KYKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Pj4rH1eXEm9TWaNRKej2G25c6TaNFuIIDHh9BKw0CNc=;
        fh=q7j1t/UJ2JW90FDH4ETN2XUypHKuAeNvgWWAaNVdR5A=;
        b=Gw8fyuXQZcvc30RVpbFioTbpqzmA6BH9c0ArnNuBO2UYSph+ZMopsv1gDKO7uL2hmF
         xeNcBDjCbMDqlzNkdPeKvZj9qITQymn/BO5EADp7h8ZOCdG+wRr1IEtA6itREkoyRd6M
         dgByHXajh7fqqhHYoDdmaFd34n9Ji5pZ04p4C6amTsrc7uq7hbRZu9+VN1MPEtGpNfGM
         5nLzGu4sZWseS8/cLmw1GCkkTERsE8tgHb9+vJqewi2WCNBm3HQn//gGpesGrpS8DSRP
         Jwzw8ESE+soUAW0wwRinrKK5v3cQPoxbGZ49oHyHaBzOHkuaDXt2JHHoOliWWH1TaZiB
         NonA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794317537; x=1794922337; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pj4rH1eXEm9TWaNRKej2G25c6TaNFuIIDHh9BKw0CNc=;
        b=AOSlpnfjZLSdTii0+zDJrGn3cSjSlOKo01Bh6g/kFMKvSJ+DKq4x1l7SMLbeXpk79l
         3XWUq4INy0Oo9JBLC1491DiVPdhcxFeF9kQ+sBxrZD/39kaERAbhLvmdoP/LoT9jPERI
         +MYoqnOeqbXh/BRaZ93A+LPLN/1Ir7kG3cM/Xrvm5w/5y3OMagRaHGRW8VYyu+Xt2Hkd
         UVeiqRhVft42tCfpLwX1Q0L22lXby+7lchvA/nmYlPb1V04ePyu3dxYu2PpAzuHZCoS7
         aYnAcDdDkRF9cZDwn1D6moy7tDRvGM8p9KIdGPxR66oTIo3P1w8w5GMR0WKNi/mf4mA9
         F4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794317537; x=1794922337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Pj4rH1eXEm9TWaNRKej2G25c6TaNFuIIDHh9BKw0CNc=;
        b=WGQDMachQ7EiS/u/0YHB3MDnuqXMH7RFkeJ+jUE7s6jBisi9pLagNGD2bGilM1YI4W
         TS88Nh9raq68ndg/NHxH/aaFvvGGwY0tcQQRV2X5aH/h5p68/3su3uzeOJFPuvPi2WbN
         BDbXl0eqQQ+AjzAcqmmOWAywSSxmkCg/o0IUhJVBSjlS8fBQI4qlBQqYnBMf/rUJZ2sJ
         +bFtmdU8zarU5gV/ZViNeET2xhYK5AlsFK2NwlFf//5DohXAo6wZq0nRejrymQNJzXMv
         ADYhoswz8CDw1lTJ1DgxaePg0/oL/MdxOuw92cSqdpBAGOINA2Ve5udco3I6mcfmuQWD
         nCbA==
X-Forwarded-Encrypted: i=1; AL+hErHgyTUSBb0ya2EkCOribKGFAP1XzozT8NNNxOI/G4gHC09enA7iCrJaAbMv4wrfp0Pt71UwSD6kIh0gPFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8lNyeg+rCqAF+Lh1eBiBxFhJmF0TZ+/BUhITGudX3OZY4racTO
	1qpIjXTGhCcfb7tJfBYupcgr49J2EGKVb6mz/+B5SrPtrCyD7pklUY8mc7TWztnMHdIBA3+sD49
	zfDxG6f4TKAaeaFhFs1zrp7jFk7EH9yoA21CFcn49Xw==
X-Gm-Gg: AYBFou1dnWv450TtgiJS1VdFy5UvERfKNpdeOw6YQsSTfnX3UM0JGK68zNdfWhafF3M
	UE0MZCNaTNkHGV6QI2Xy5bIBr2PTNhJAoVsvlwW4T7JDG0n9eztrS3wE58eZSGUTV7YArdxF7T0
	dSOYwejeiuH6WxSFI/lekfnOc0dFpN8Z8dEsOIHggF7TZJHCI2s/YuvZl1M9SFx1DrZPorzf3Ib
	+f40PzyLK7uhLKvL0oNsNSme0gsMZY5MEQqm0ZHpfUmFT6i5UfY6fU0aR9JyPDreFfCTxNRMuN5
	N79fLgLgmM7kLipxfesE+OY+C7xh6H32ZBNirpxnI70oSNJK1zIl37rWHPDU1Pcrs55mO67YZU8
	3xksGLLcIFa0KRodpct+s8Rv9XFqcKdoAatPq/kmRUzinBnQsHBAxPtP+iKjesiL3zk8isw==
X-Received: by 2002:a05:7022:7f01:b0:1b2:43ac:d3a3 with SMTP id
 a92af1059eb24-1b3b5fee2aamr3361789c88.24.1794317537291; Tue, 10 Nov 2026
 05:32:17 -0800 (PST)
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
 <20261106151947.3991524-7-vincent.guittot@linaro.org> <au7SabL5pfbsApyB@scheduler.schedules>
 <CAKfTPtBfXOcAd=5RkYepRn15Hg=id9FQ3jh1tQoewOtUSrsjHw@mail.gmail.com> <avIh4MZjVyQuF6Yo@scheduler.schedules>
In-Reply-To: <avIh4MZjVyQuF6Yo@scheduler.schedules>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 10 Nov 2026 14:32:01 +0100
X-Gm-Features: AclHuK_-u2urQ3RFkBLSdBCNdaeJlRcvSlcfMQXUBnI1scU56PsAWcpbh6wLOOg
Message-ID: <CAKfTPtALwo_aQ_31nF631_7hs1YfYzNUXdY1zC=jUB7P7_QRmw@mail.gmail.com>
Subject: Re: [PATCH 06/20 v3] sched/eevdf: Add min slice check when selecting CPU
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

On Mon, 9 Nov 2026 at 20:56, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
>
> On Mon, Nov 09, 2026 at 04:55:23PM +0100, Vincent Guittot wrote:
> > On Sat, 7 Nov 2026 at 09:57, Kayra Cizmeci <kayracizmeci@gmail.com> wrote:
> > >
> > >
> > > Hi Vincent,
> > >
> > >
> > > Sashiko reviewed this one so I'll just put here my own concerns instead
> > > of repeating.
> >
> > Regarding sashiko's feedback about cpu state ranking, I chose this
> > ranking on purpose.
> > For !SMT :
> > - 7 CPU is idle and fully fits (i.e. return immediately)
> > - 6 CPU fully fits and is not idle but we can preempt current because
> > of slice so the task will run on the best CPU immediately
> > - 5 CPU is idle but doesn't fit uclamp min. On such a CPU, the task
> > can easily miss its deadline
> > - 4 CPU is idle but doesn't fit at all. This is even worse
> >
> > For SMT
> > - 7:CPU is idle and fully fits (i.e. return immediately)
> > - 6: CPU is busy and fully fits. Although CPU is not idle, task can
> > preempt current because of its slice and run immediately on a CPU.
> > This is similar to an idle CPU (and maybe even better). While writing
> > this, I realize that I should probably check the lag too
> > - 5: CPU is idle but doesn't fit uclamp min. On such a CPU, the task
> > can easily miss its deadline
> > - 4: CPU is idle but doesn't fit at all. This is even worse than -5
> > - 3: CPU is idle and fits for task but sibling is busy
> > - 2: CPU and sibling are busy and fits for task and like-6 task will
> > run immediately
> > - 1: CPU is idle and doesn't fit uclamp and sibling is busy
> >   0: CPU is idle but doesn't fit at all, and sibling is busy.
> >
> > Note that with the push mecanism we could look for another CPU for the
> > task that will be preempted
> >
>
> Thanks for the great explanation! My only concern is on 6 and 2, as I
> explained in my first message, below.
>
> Sashiko also pointed out other concerns, it would be good to check them
> all out.

Yeah, will fix the set_idle_cores too

>
> > >
> > >
> > > Look here:
> > >
> > > CPU1: CPU2:
> > > FA    RA
> > >       FC
> > >
> > > CPU2 has 1 RT and 1 Fair tasks named RA and FC.
> > > Let's say RA is running on CPU2 and FC's slice is 10 ms.
> > >
> > > And let's say FA has 8 ms slice, and a fair task named TC is waking up
> > > with 9 ms slice:
> > >
> > > * We look to CPU1, 9 < 8 is false so we return false
> > >
> > > * We look to CPU2, 9 < 10 is true so we return it.
> > >
> > > But the problem is, CPU2 has a RT task running and we are going to
> > > compete with the RT task. In that case it can be worse than CPU1.
> > >
>
>
> Thanks,
>
> Kayra
