Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792707634;
	b=ka3QAWTlwu3dShBgyV3egFXmCY0lfWj3xKlUfR/bzQJtCL8A0Wo39E0GrfyW6xuwRioy
	 /Pj/stDQN3NnAGPkadx8Vw2PwFwXUE010qKg8GJEZF8hFo2CLnYiaEf4LWoOP6wI69AMY
	 xxshoenKx8IK14DGf3nwZCKITyRL+hDbYYaArvafMkCojdhQpHCThQeEIF1b9EKyitrTx
	 I3DbUQqYx9AUljQqMYWk0/m3FGK5mUBtl88c+YECgQmt12xGgiY/mKbexaN/Wa/imn4Qs
	 DajfWh00r/7BsC0yuJo9lPWy12DEkUTWcSvor3DLjN4Yrzj/FeMFnzyuXwqeSCvfRLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792707634;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FPgAzjNkQiqM+WkpAExnh3Qvvaifknshl6X+/hr43fA=;
	b=rhv70g9xb1lI3io+VrzDhJ4C+PTOJbhJ1n5+PF21WHJagySo6ka63WqR/cY6AI3WkV64
	 jsbICmGfVj6xDinbxAsp1t4WVWTmgDh548iHHqa8fB6st7E+/D66bhVRjlKuTMzfwlROn
	 ryhAhcGwRYQVX/aCxcJQEpIDXUpcF/rWQ9QlZ+ZGjpbyoYO9alRbvAvXM0H/zCriWafpV
	 KRWyIAWSB3zDdu+Yig3kNRAaP9LUIsOwbidAc+KI3cE1ECf4XRE+VXJEjmWJNHFEX/IDV
	 tFAgr3vT9ErS2shGksCDjPLkOgbTAhRpY2wNeVequs4jOJptry0yY4UwkNH66+JATjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U7CI7iwW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EECF606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U7CI7iwW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169C41F01825
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792707634;
	bh=FPgAzjNkQiqM+WkpAExnh3Qvvaifknshl6X+/hr43fA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=U7CI7iwWy/UsWWO4i3RccVaPj+tzN6BNF90oNNKhhno5jxftGJSP0bPFEtpn6rkHu
	 RLrWnxoYMB3eFUIxb0xmTAn2DFpRboRc6wnUn+qFXog0d4qv1b68912bWXkMcJ5/FD
	 Ay3v2pbV4WEKxhGEvZcc8zWdukJzy8+6udHBFW/c3Zmb12ipmiUEEx1IoHhAP5scV9
	 gRl0h5DM1byicpESdI+HtndXbhNswRXtt9Ow0zOAK2UntREH6+W4hHDmXIBKQwb2m9
	 +JPs/fjgnC14iOicZUsZysJePS0MAkmqwXjdq2HdI42ZQkyZnwW4JdH3ww1ch1QVmF
	 VpYanze6gpCtg==
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-93f2b8cf037so23091585a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:20:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7reTN+v3UGutdmoo+SPwaxUA09douJatnHCZI6kNLuuCmfMZ2rGBrwiMDzDt8JhppL9pSQL586fTWKM8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLo8Cb4xIWH6rUz96r0T/WMCXeypBycT8iQu7IlmBzQe/BKnWNO
	+c2IkkIY2V778vozgmJ1eEEeLfIT4v6b18u6v1IWVnOa0HMqucpZSrACYiuEWU1xBY9ErT4bL+Z
	PZut9cidZPhB0ST9KYEk7FA5s7xSBGxY=
X-Received: by 2002:a05:620a:6848:b0:93e:e394:78df with SMTP id
 af79cd13be357-93f6f879ee3mr154580885a.58.1792707633528; Thu, 22 Oct 2026
 15:20:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015080157.269079-1-hui.zhu@linux.dev> <CAMgjq7C+EXJBdLUh-JxLGkZHb6wiuvLsq85V7ph6+gPND6mq2g@mail.gmail.com>
 <94afeb74-44cc-4e02-97dc-961309a12364@linux.dev>
In-Reply-To: <94afeb74-44cc-4e02-97dc-961309a12364@linux.dev>
From: Barry Song <baohua@kernel.org>
Date: Fri, 23 Oct 2026 06:20:22 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4yXe0hEG7pUhddas+ex6QmA1A6u_P04UKYF8mPxrW31xA@mail.gmail.com>
X-Gm-Features: AclHuK9qP1mgPJEEaUrfuuFK_eh9pkbInHEkTI7TgyHOfXSR0gKxedCumCxDQdU
Message-ID: <CAGsJ_4yXe0hEG7pUhddas+ex6QmA1A6u_P04UKYF8mPxrW31xA@mail.gmail.com>
Subject: Re: [PATCH mm-unstable v7] mm/vmscan: throttle MGLRU eviction when
 isolated folios pile up
To: Hui Zhu <hui.zhu@linux.dev>
Cc: Kairui Song <ryncsn@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
	Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, Hui Zhu <zhuhui@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 5:29=E2=80=AFPM Hui Zhu <hui.zhu@linux.dev> wrote:
[...]
> >
> > It seems a lot of trouble is caused by the design of the reclaim loop,
> > so will it work better if we calculate the number & type to reclaim
> > first like CLRU?
> >
> > There is a demonstration from Barry:
> > https://git.kernel.org/pub/scm/linux/kernel/git/baohua/linux.git/log/?h=
=3Dkairui_scanbalance_0.3
> >
> > And instead of throttle at the reclaim loop, balance the scan budge
> > based on (size - isolation) number, and throttle a while LRU simply
> > when the total isolated number is larger than total size /
> > MIN_NR_GENS.
> >
> > Just an idea for reference, seems could help get rid of a lot of comple=
x logic.
>
> Hi Kairui,
>
> Thanks for the pointer. I had a rough look at kairui_scanbalance_0.3 and
> I am quite interested in it.
>
> I think that branch still needs an over-isolation guard. The scan budget
> answers "which type and how much", but it is computed once per
> try_to_shrink_lruvec() and does not see what other reclaimers are
> holding. Each reclaimer's in-flight isolation is bounded by the batch
> size rather than by the budget, so N reclaimers entering together all
> see the same state and all proceed.
>
> On the other hand, that branch would also make the guard much simpler
> and clearer. Since evict_folios() already takes the type from its
> caller, the allowed mask, the type rewrite and the fallback restriction
> in isolate_folios() all go away, and the throttle reduces to a single
> check on the totals in the shrink loop, which is basically the second
> half of what you suggested.
>
> So I would like to ask what the development plan for this branch is,
> and whether you think it is worth moving the MGLRU too_many_isolated()
> work over to it.

FYI, here is the RFC:

https://lore.kernel.org/linux-mm/20261022220203.91911-1-baohua@kernel.org/

Best Regards
Barry
