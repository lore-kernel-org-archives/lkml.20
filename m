Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793234096;
	b=COWMlORJxdxPt5j7CoMDCjQXjC8fDoqmi9a8hp/tYzU6uLur8Z8qOQFR44GrMay5JxBF
	 oMnzdSrTmUMPnJ6Kaobvo7Lcqt5dg8DhV07p/wvsrfYDd4JJ96NDIQUC/9piMhUMQjJU3
	 W7UThycxX59N85LPpQ0rwd1YksYWVxXxHS5yUhQeGWt0mmvQtcLLX8JAvVG4hNbKtw4SN
	 JJvM/cv/CW2JYX+HBKfrKhMuTsxcDAeD05rVp68EwMa197LLzJmhAyHWpfgtnC0fizNCR
	 PgVXtPgW9sV8N7ZphzCgDnpxtBWaVB52G9u5uyKL2Uiplv5a8OzHy+QRcgnTcJg595A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793234096;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=D5QSZtmmBwsZEse/gnhOiul6mMk02INnjVORNY8/ULQ=;
	b=jPqu4EgifKerqN2dpx47UBrnaLaMqJVjXV7GE3Wuep3RtB/6JM+xPJQWRWE5aG93hbGk
	 d7cOlqHD1q1B6qlaRvQNe38YRaQFNVhbvd5zipgoD+Yd7hYaHDvm44rWjr6APQAmKqfxk
	 z57QHpBp6//Jop4qCrsQwKohfSUTd9v5JgfN1kW8uG/0AvWVx5KnS/+juKyOiKzpernbd
	 SZa5uk4G+t19W7Ce1AzdJuUJog43g32rzTQ9TpJDqqrd2mgyGIEJl3y/n8we2q9Vtr+hN
	 fkIiBA8DSRisw8qZVF4XWDwQpQAHpXNTXGa0+OF3bzuwzaWzg0HJhoYDnU/3CsKeMEg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="LTuOScZ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0342606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:34:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0342606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LTuOScZ/
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1b12de661so5411a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793234094; cv=none;
        d=google.com; s=arc-20260327;
        b=O7mEjnrhYv9nk8GIDbt2gJB5EEZL10uj0orjaOZSxtw7BACTiuefEylkClX3lTfgDz
         O4ZBTfCSv9hwDTj5d3MJK1iBAOpFQN6+cEp9PpmH4NPjZjNqz+Cio+JEXWRRwfv5a/dZ
         /uNAv5Ks+El7SUKEQeoBu4iqClCGp3lq64GJhM4W5sbRwzaltOc1YMj5hj+VDhfsVLLG
         TVAOa3LOENeJWYuWsYvIYr5jnaipKyk0gGKkUscmC+KWLWUU+J0AoWSLS2ctr8iGIjB1
         mO2ueoYquz5iA2jay5i/+3K+725SrvI8IYlizQlP0sjc7JSpbhCM0sXf/BZzvSP132oo
         xXdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D5QSZtmmBwsZEse/gnhOiul6mMk02INnjVORNY8/ULQ=;
        fh=AlO32YRoJhPFv04z11k1i0gKEKKVKRh8wAX8t8qoXPw=;
        b=I3XOL0SD8p6S1RAfuJtZHJXmlWWQJwTrh4VKlETxeyhml8C3dPZlraEFH1pM5pMWL5
         +5xGWVAe31ZwqzE+jiwKWpiqC0YVCneNX6AJAo/5TvtjfGYyH6Uu0L3dJLRgi8Lqzc4d
         FKX1sN1+QPCt2/qQfWvnc0+vL/qTnpPdWWgQq0hVCFL3jK/TCMdqOxCOeq6AJ63GrgPr
         VVT6c3DLufGhkUuPXrye0P95PTrvmUIzvvR+qf3mpDAYfPOp9GNCzzcLgAh06/yY+81x
         +G3gzA0JPpNxCh7Gj2n/ykbkmzNdJcQm5yBLjn59Js5wgRl6M3tBWAoO0hep/jgEkL2a
         eEng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793234094; x=1793838894; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D5QSZtmmBwsZEse/gnhOiul6mMk02INnjVORNY8/ULQ=;
        b=LTuOScZ/rCyXq7B5fLImJnjGGPTOLIzzasDSv/Z2p6PqPJmRziQoJ1O7d3oaCjTkUu
         B+UHp0mCDOqLT7ySUAsfMBcv688Sc68emao2JjBm3Syd9L14UCbTocBopLtZNwXltSci
         HcqWledHcX8p09HWoTLVR80kTnAZQcRSkhylRdoAza5tG0xqU7TwwmGevDAUcWKSh11Y
         9YDiNIWspFnhubbtnWM7EBU3tZ0dBU7xUESfQOxDhxTvEfuHr9LkhNSpQYZ8XJy+yUO/
         teru1PJg3c97n+a1D2DSbuwNmLncH5DCw5M9qjOf/bmJLehvizG/8LO6jXR8ahHWR1Rh
         erKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793234094; x=1793838894;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5QSZtmmBwsZEse/gnhOiul6mMk02INnjVORNY8/ULQ=;
        b=ZC4xaqeipdOMOvUiChUGk0ikJwSqyzI6A/nkWMjSghGWuddFDBDyeJiEr4asiY3t2c
         sS99U/oHnhYlyI9SS2ND4UsZL/PGDNbj2D74JrpzNIfhley90x7p1qj26Gkj1ddXfnyj
         5oDpwuBx/R43V4Mz3lsPMhCNSXahdNCsmwYq5CxGtma9jnZ+6EbHInDdKryzeVn3joWz
         Uo1ZO0D+e0/QOBS1bq2PwVEsSb6t4zU27PCXNDe2P8BDQCf+jvm+OSy7wrGlWIIml4AB
         3bLfXJBb2w3lxz4thuBO4mhRVRUITyjyql5xR/CjcaNMW78Y9PXiJymzHsX+X/EjOvEM
         2UqA==
X-Forwarded-Encrypted: i=1; AKwUvBxlcac+51TZxsgaG4PO7HyWDsYR0YusWiZkgkB4lGzrFuisFPvdYhzEh0jrnMX2yZ67fLMNFtiv69AyMjM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQ1RjdpzXDFlJ0/tB3GrhCFzX2FnWtU7fMq8xza1R2fo33ro2t
	6jZ+cYfHgjxJYSpeFLDKr5VAOcT2ysJWsFULrmcVTNzdZMyLhogKbNMmELb0JRMwsZLB+RRTw04
	vMdeejeU39ZsYAu1rntVNBN6KD/ThFEIBQcGM2mS7
X-Gm-Gg: AYBFou2BZHpPwenuDDVePEDjVRFkA3tRcYxTCwIbN/hyVVl9DGEutVRCqvBIoNKHeP+
	IFm+TN1hcPdU9MSnd8i+Cxr9549TBR9CypmBKXdD0QTZXNnMR1FwvRk6xPm0NJItrqbx0Znlp5Q
	o1yMV9+1b5SoNbr1HxKZMcZ0DG82YDEKnmkPQ4c8z/cO80zTgfq9O2DKqS9+eSEWR+BvsPZyc6O
	HJxs40mLLn5S8SGNsSO8xZ+Ig70oW7SyAAu4R5u+8vlMhMqPVMkPkA2SekJaxOXzgelfrsQ1PPO
	EbSW/T9zbFrojo+HE2niQ0YxDb4xpm77gOTtTbanV4T3Wl0SL8w7b2PJEXrtetA+ZrxzbYpIyyw
	jDXCE3heQPszuQLSIYw+Mfs/YZ3l/p9SoF3w=
X-Received: by 2002:a05:6402:305b:20b0:6ae:188e:e119 with SMTP id
 4fb4d7f45d1cf-6b4b38e71bamr17357a12.9.1793234093746; Wed, 28 Oct 2026
 17:34:53 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-fix-vma-lock-overflow-v2-1-9eb778b79b58@kernel.org>
 <atXjbsDn7DJybsHU@pedro-suse.tail5790ac.ts.net> <atYJA7nIu_RwpoCC@gremlin>
 <auIIxSorX0bhZNZc@gremlin> <auIPRjj2t0BcYlOa@pedro-suse.tail5790ac.ts.net>
In-Reply-To: <auIPRjj2t0BcYlOa@pedro-suse.tail5790ac.ts.net>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 28 Oct 2026 17:34:38 -0700
X-Gm-Features: AclHuK9v-C5aWQDQlkF49lUxmcEnZFv5OCriejxPhNjzEUORWR_RPAcdszPg35Y
Message-ID: <CAJuCfpFVv-t08YGMPR3YHCyiOK4HY-YjMk5rB6tdBa=mq2MvKQ@mail.gmail.com>
Subject: Re: [PATCH v2] mm/vma: avoid spurious write locks when
 mm->mm_lock_seq overflows
To: Pedro Falcato <pfalcato@suse.de>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Randy Dunlap <rdunlap@infradead.org>, Jann Horn <jannh@google.com>, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>, Daehyeon Ko <4ncienth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:06=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> wr=
ote:
>
> On Wed, Oct 28, 2026 at 03:04:07PM +0000, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Oct 19, 2026 at 01:19:45PM +0100, Lorenzo Stoakes (ARM) wrote:
> > > On Mon, Oct 19, 2026 at 10:53:27AM +0100, Pedro Falcato wrote:
> > > > On Fri, Oct 16, 2026 at 12:34:33PM +0100, Lorenzo Stoakes (ARM) wro=
te:
> > > > I'm concerned by the possible latency when doing this to many VMAs.=
 Do you
> > > > have any numbers?
> > >
> > > No, somebody schloppened a patch for a real issue and I haven't the t=
ime to do
> > > even the things I need to do let alone 'here's a new task' stuff :)
> > >
> > > However, this is a simple write to every VMA, done at the point the m=
map write
> > > lock is held with all VMA write locks dropped.
> > >
> > > It was implemented such that:
> > >
> > > * No VMA write lock is taken on the VMAs.
> > > * VMA read locks can proceed.
> > >
> > > I.e. it amounts to a loop over VMAs and a write to a field.
> > >
> > > I don't think you could possibly do more to reduce latency here, and =
you
> > > absolutely have to update this field across the board.
> > >
> > > Under any realistic workloads this will occur at worst ~days interval=
s, often
> > > far longer, and likely you will see quite some gaps between separate =
processes
> > > experiencing it.
> > >
> > > There's also an upper bound of vm.max_map_count per-process, so it ca=
n't explode
> > > into something truly insane.
> > >
> > > Most processes don't have that many VMAs, other than certain steam ga=
mes :) so
> > > it's hard to imagine there really would be that much latency here.
> > >
> > > And the latency is occurring on one thread, which is performing an mm=
ap unlock,
> > > so nobody sane will put that on a hot path.
> >
> > Sorry, I forgot about this and didn't get numbers to back this.
> >
> > I had an LLM go get numbers on this, all in ms on my threadripper (but =
numbers
> > should scale similarly) with fork() + munmap() all VMAs for comparison:
> >
> > (all ms)
> >
> >       VMAs      reset    reset     fork()     munmap()
> >                 (warm)   (cold)    (cold)     all VMAs
> >   --------    -------  -------    -------    ---------
> >      1,000      0.006    0.041       0.33         0.43
> >     10,000      0.072    0.36        2.1          4.2
> >     65,500      0.61     2.4        14.1         33.5 (default)
> >    262,144      5.3      9.6        60          168
> >  1,048,000     34.7     39.2       237          691
> >  4,194,304    162      163         954         2810
> >
> > It happens on a random VMA write lock release, so there could be tail
> > latency, but it'd be tail latency on the scale of ~weeks for normal
> > workloads, and (assuming max map count reached at default limit) a ~2ms
> > latency for an operation such as mprotect(), madvise(), mmap() or munma=
p()
> > which shouldn't be placed in any situation where the latency of that ca=
ll
> > matters.
> >
> > One call in 2^31 is the
> > 99.99999995th percentile, far beyond any latency target anyone measures=
.
> >
> > The amortised time per write-lock cycle is ~18 picoseconds (0.018 ns).
>
> Thanks, this addresses my concerns :)

Sorry for missing this fix before (due to my vacation) and only now
finding it. From a quick look it seems correct but I'll spend some
more time reviewing and testing it.
Thanks Lorenzo for the fix! I completely overlooked this overflow
side-effect. And thanks to Liam for flagging it!

>
> >
> > Interestingly, the runner observed khugepaged-induced mmap lock stalls =
of
> > ~100ms, far far more regularly, which seriously exceeds any of these
> > numbers, about which I assume we haven't had too much complaint.
>
> Wow, that's horrible.
>
> --
> Pedro
