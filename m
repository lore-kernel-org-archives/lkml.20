Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792660491;
	b=By0MQiB2uCMmt1BA3lv2a6sFrBdzGqA44oek3s/VobwCriUtclxqQDC9iXkacTik1Pt5
	 27HuLKIJvmlrOPFq0/sMDzZ1dvclYJwAMsjWswWGgItE1NJ02aUYjpgkbhHsSsBQXphef
	 7++gA+KGZ3z57QXdWkAQ9ZBAViAo5wYdcsvmOSYS7TOPZqJ64swv3ZcqEQ6vWl96XVpPW
	 KgPXuwPOl5rD1E5irP34QUSrN9Uvr5k0D8kuomghTcHW+hxqHsbR409lqnVFj+xZjrxgK
	 vc+LWEXzv0dnam5GU9A7CzKxhkvIYNu27qXgovS4Fojdn6vwKxktSoSeatorMjoos2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660491;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9co7tSosO1NT5+GsCtzpgr4VrYszNR5FX5+n+UHBqPo=;
	b=Ihbcq28SiBotAsPG/cVEh07i9zGMKYAS8vp1q1WsDWV/nWOSsq6ecqpgG4a03EM3u2Ha
	 vzBqdqt4Xsib0WvydPpFRuryCfSilqe1E/J2Xd12GmKkqgnL7C3DuzwYi8Lz53AmWPuM6
	 1V4Qd59AHJlGZqAEWZoa/U2L0P7320nb6NorPbCX1ExSRXW9uLYwEN51/29uPkesq073y
	 lNzQruERhYuUPD7CuVmqz46i9FOosl1GDolNMQQGcsV6x1yz8gkMhKxqZ624P9KcrUWl4
	 eonky23fJPefo0Qs5ZXEDGG0r0Mbr7+aBRaW9qoJER71bNIA1tCx1Km7eFAgkCYftPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=VCKtHp26;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475E8606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:14:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475E8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=VCKtHp26
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89ff475a152so599084b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792660490; cv=none;
        d=google.com; s=arc-20260327;
        b=LWsa4Q4lLqPIl0IBSt4CwZuJYDbOfJR262HbDtl6PHVF0HgFnyS5NjPKv4Zrcciqr8
         mI9E9k4iGlc2sy1q9rcJlqLTOHBC9px01IK4xQbbLPQSOu7UGZL1lI1Zjt8Zz+aStxp3
         Tgyi1pSduD9xyg0wjwS+SRu41mGps0RIcfa9po5U5qLersPdAFjMS+Xt/Rme6imJZ89S
         ylyUsVBlEc6/ocwV6+Ql2GEkHl5/1VAo8Ow9aB2Tvd1LPX4wrS/Dd3JoGBYmsBFS+w9t
         5EcjFX7SF0j3YZ3mqWcQt/wTvkFyBZGusxKAOcsMSkimWKBoQ3Y5rmVLFdjoxn1v8yMP
         +nHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9co7tSosO1NT5+GsCtzpgr4VrYszNR5FX5+n+UHBqPo=;
        fh=1tyFDC7UNZwZUfKi374OAlvUR+1smSkxAWh91453CgU=;
        b=Rsx7wjDIXh6ALSlQnTGHVTc5qEJXBKYfJovUXdlh+0C/jRe2KqC4nVYKG5OLDUQIB8
         XN0tF+Nlb0QnqVQdX3+n6j+gXDMKKCs33rRZAoRfShy5P1so0xdUKTxTIykFdEdDmMMC
         FtXS8AFb1NTK/3hZPJyLmrGLTyPhwb3TE2mJfWGDR+it+8v9Mvm6q8iI1KcBbG96Ddtw
         zloHN1mnRavZLcaNdYwavaXWEVeM6rfME79OJQm1AoBM7BTk0WvPj/e0tPQ34iZsUtDB
         nUxqflBWWvDQ3WlZkqlLfrayHMoUGnl99AXY2yosbmZ5Ip4bfGlfpKeTNCQx1GluccGt
         b0sA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792660490; x=1793265290; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9co7tSosO1NT5+GsCtzpgr4VrYszNR5FX5+n+UHBqPo=;
        b=VCKtHp26rMDwluZSd/4/1UR1dwqIILCPxqkGXCvCfuNEkAe0P3OWJcQsKIkGlxKq0B
         JauD0QYo+92KcNgN+orsj3BPfqhFgAmX6XE1ZD74KqleknvjesEpGgbXAtmdJAIJWw1i
         9WfJasMPArS51dKsT4e6fye9XILmy+qE4bNMQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660490; x=1793265290;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9co7tSosO1NT5+GsCtzpgr4VrYszNR5FX5+n+UHBqPo=;
        b=M4KkojW62rZ8g/M9KCHzPyUovYbr++qb+QRgHjoyZ9e/zHVpvfHRDuwvDxIrx9GVRG
         3rC0TYR+5Vi4K6TFol+jWeF/Tir4vmpHcGuuRH9P/0a/qkItEpm86UDf42kIrzdpKLmc
         1auME3EYNzG4bgQtIleyNRinT9c5dLVy9XYyHShgIYdpSFg20bh5m61T01fnJynU5pV0
         Bp2YkDT1QjXYQCtXHiQc3dG0jckfR27p3BkUt0wfDnjq5F4FvgSXxsD8+xEJwXdDjrKd
         aiT+2EBZrl8UyVVULtpmDsevmx9u8haWIP7PWqHxucoPJoWTysKnmChdKjltrYUBrGRI
         MvIA==
X-Forwarded-Encrypted: i=1; AKwUvBx4jSjwwhC94Cj6NX7TmejmILjPImtRbYQrhtTO0toNXs0SUI2sertG4xdafphAZq6dxQZumPxsiIVU5co=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQVEIlhINFCcboVl67istItouGWTvrYC+fxMZeaWQwB7jSlKCS
	6M0ODK/MLSy/AtYVWSyx7Rf8ywlvMdixzC1FQBQIgfrpUdEHi3YmN6v4zaIhsgImELa5eWdkik9
	VU0v5oDwweiW3f/ki5owEbDcPBH+pGVoWBHRIfsgv
X-Gm-Gg: AYBFou1cedpY9/NZlir8G8ZtsEmUbOx61VS+4Gvh5pJI7/n8p4fNcuwFvKTiktKtXVT
	6TempSVm3j7z34LziJiSdAKdyeCmF4gIAhKzMfbSd+/e1eooRXQPrhcnDW53+q/cpsRiOXJmUP7
	qnMxpR02RGNy/2oztggBuomMj3FN89VsZhuxD1qA83UZ5qUdY6QUda8JTOTZSaM5xIT145Q/ODj
	mMRogkPedlcTjw8iIyuss72I76R/zWfexLPB2ShlbETzI0B9GnCQnzUtVitwWsdzMdK/CP+7vGl
	3+Wjxut+5JjRQFKaic6A/ZU/nQIEx7/gVqHrLCSTuiSO9nVCxIjJb3Q4bb9kA/mwQYVvN8nbgoe
	jkItKBYNSvQluZPJ8iH6So942Xn/gSI2wi/nAdPNaXFSnXd7/OZHpc0q302qtueIIakHwzmSoKy
	ILYDterprotZP0YvU=
X-Received: by 2002:a05:6a00:1c94:b0:8a0:20e0:b131 with SMTP id
 d2e1a72fcca58-8a089f250cemr3406412b3a.19.1792660490595; Thu, 22 Oct 2026
 02:14:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260731140533.566493-1-david.lee@trailofbits.com>
 <CAM0EoM=UDkGKLivsdDS5JaVMuefR4jLC2rAWJcOR8XD-4N_EgA@mail.gmail.com>
 <CAC_etQESLytW5rhp0GfZU-mJqJhwk202a5u_nTXZ7W6wJN=AJw@mail.gmail.com> <CAC_etQHv2EBYfAhfkYHKrasnJAyDS+u5+a4os4aD1eSmKrck_A@mail.gmail.com>
In-Reply-To: <CAC_etQHv2EBYfAhfkYHKrasnJAyDS+u5+a4os4aD1eSmKrck_A@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Thu, 22 Oct 2026 05:14:38 -0400
X-Gm-Features: AclHuK_dV5iV-K-FqlLOG7EjQwj00HjHhl1qxOWtD1RjLWmEzwEJj7wLhmR3d8U
Message-ID: <CAM0EoMm=KbZgcGqLHDFee3mM1GxuNCvAWObP_K4AxsGAoEAedg@mail.gmail.com>
Subject: Re: [PATCH] net/sched: sch_qfq: prevent aggregate self-replacement
To: David Lee <david.lee@trailofbits.com>
Cc: jiri@resnulli.us, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, Kyle Zeng <kylebot@openai.com>, 
	"Dominik 'Disconnect3d' Czarnota" <dominik.czarnota@trailofbits.com>, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 10:56=E2=80=AFAM David Lee <david.lee@trailofbits.c=
om> wrote:
>
> Hi Jamal,
>
> Following up on this thread. Please let me know if you had a chance to re=
view the attached reproducer or if you need any additional information.
>

Please resend to the list - I lost track.
And if you follow up after like 2 months(!) you will really have to
retest with the new kernel and likely look at the list to see if there
are other fixes that cover this issue.


cheers,
jamal

> Best regards,
>
>
>
> On Mon, Aug 10, 2026 at 11:22=E2=80=AFAM David Lee <david.lee@trailofbits=
.com> wrote:
>>
>> Hi Jamal,
>>
>> Reproducer has been attached to this email.
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Reproduction =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
>>
>> 1. Build Linux at 82a47586c0b9266622657009aa30573dddf09f53
>>    with the configuration options listed above and KASAN enabled.
>>    Use a system with at least two CPUs. If QFQ is configured as a
>>    module, make sch_qfq available before running the reproducer.
>>
>> 2. Build the attached poc.c:
>>
>> ~
>> gcc -static -O2 -pthread -Wall -Wextra -o poc poc.c
>> ~
>>
>> 3. Run the resulting binary:
>>
>> ~
>> ./poc
>> ~
>>
>> The reproducer creates user and network namespaces, brings up the
>> loopback device, installs a QFQ qdisc and class, and races class
>> changes against packet enqueue. Race timing varies between systems.
>> On the validated KASAN kernel, the expected result is a
>> slab-use-after-free report in qfq_add_to_agg(), followed by a kernel
>> panic. The full observed output is attached as splash.txt.
>>
>> he issue was reproduced on Linux 7.2-rc3 at:
>>
>> 82a47586c0b9266622657009aa30573dddf09f53
>>
>> It is also present in Linux 7.2-rc5 at:
>>
>> f5098b6bae761e346ebcd9da7f95622c04733cff
>>
>> As of July 27, 2026, the vulnerable sequence remains in upstream
>> master at:
>>
>> 62cc90241548d5570ee68e01aaba6506964e9811
>> https://github.com/torvalds/linux/commit/62cc90241548d5570ee68e01aaba650=
6964e9811
>>
>> Required configuration:
>>
>> * CONFIG_NET_SCHED
>> * CONFIG_NET_SCH_QFQ
>>
>> The attached reproducer additionally requires:
>>
>> * CONFIG_USER_NS
>> * CONFIG_NET_NS
>> * CONFIG_INET
>>
>> KASAN is recommended to observe the first invalid access.
>>
>> Regarding the format, I can send v2 if the reproducer looks good on your=
 end.
>>
>> Thank you.
>>
>> Best regards,
>> David
>>
>> On Fri, Jul 31, 2026 at 12:33=E2=80=AFPM Jamal Hadi Salim <jhs@mojatatu.=
com> wrote:
>>>
>>> On Fri, Jul 31, 2026 at 10:05=E2=80=AFAM David Lee <david.lee@trailofbi=
ts.com> wrote:
>>> >
>>> > qfq_change_class() snapshots the current aggregate settings while
>>> > holding the qdisc tree lock, but drops the lock before selecting the
>>> > destination aggregate. During that gap, qfq_enqueue() can move the
>>> > class to an aggregate matching the requested settings.
>>> >
>>> > When qfq_change_class() resumes, qfq_find_agg() then returns cl->agg.
>>> > If it is a singleton, qfq_deact_rm_from_agg() frees the aggregate
>>> > before qfq_add_to_agg() immediately accesses the same pointer, causin=
g
>>> > a use-after-free.
>>> >
>>> > While holding the tree lock, skip the replacement when the destinatio=
n
>>> > is already the current aggregate. Any estimator replacement has alrea=
dy
>>> > completed, so the class change can finish normally.
>>> >
>>> > Fixes: 462dbc9101ac ("pkt_sched: QFQ Plus: fair-queueing service at D=
RR cost")
>>> > Bug found and triaged by OpenAI Security Research and
>>> > validated by Trail of Bits.
>>> >
>>>
>>> Please always send a reproducer - either as a tdc test case or if it
>>> is sensitive send it privately to me and Cc the other maintainers.
>>> As trivial as this looks I will not look at it without a repro.
>>>
>>> cheers,
>>> jamal
>>>
>>> > Assisted-by: Codex:gpt-5.6-sol gpt-5.5-cyber
>>> > Signed-off-by: Kyle Zeng <kylebot@openai.com>
>>> > ---
>>> > Trail of Bits has a reproducer for this bug that triggers a
>>> > KASAN use-after-free and can share if needed.
>>> >
>>> >  net/sched/sch_qfq.c | 3 +++
>>> >  1 file changed, 3 insertions(+)
>>> >
>>> > diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
>>> > index 6f3b7273c..e900890e9 100644
>>> > --- a/net/sched/sch_qfq.c
>>> > +++ b/net/sched/sch_qfq.c
>>> > @@ -517,11 +517,14 @@ static int qfq_change_class(struct Qdisc *sch, =
u32 classid, u32 parentid,
>>> >                 sch_tree_lock(sch);
>>> >                 qfq_init_agg(q, new_agg, lmax, weight);
>>> >         }
>>> > +       if (existing && new_agg =3D=3D cl->agg)
>>> > +               goto unlock;
>>> >         if (existing)
>>> >                 qfq_deact_rm_from_agg(q, cl);
>>> >         else
>>> >                 qdisc_class_hash_insert(&q->clhash, &cl->common);
>>> >         qfq_add_to_agg(q, new_agg, cl);
>>> > +unlock:
>>> >         sch_tree_unlock(sch);
>>> >         qdisc_class_hash_grow(sch, &q->clhash);
>>> >
>>> > --
>>> > 2.53.0
>
>
>
> --
> David Lee
> Security Engineer I, Application Security | Trail of Bits
> trailofbits.com
