Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792779057;
	b=uZIE5N7P7OrbaS1mLmqWT9Ksk/l2VGt5lFoYIWm2J3N3ei5AA5764Y1BE3/Y/tnJXXgM
	 pY4V9HikUg3fJ+fT9jJmsIKAnQaq+a5M//+D43ZFhwqw1AcCtbUDzGDW4ySfYPlTiUp/q
	 zKnUItYhlWn2yt6Ye46JJBwQHdgTJ7AIRZ3KZ6VajTq/r6zFg25OXyQYZTK/MbJUJzbiq
	 S/fQhwx207bg4uCmxDwvAmaA5La3GGQYuY8ND3GPwssAqzJ0dxw0SMWPItwaAb+k8W1A+
	 IWcbkEWOnbR5d/alvLCWybaMcpbBK1EYiCOWnZmddfrBMr3HTYE9pN/bllTbCY4Rq2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792779057;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2To+V+OrITwmpsIJPMwp0u1jz/ATT8WX/QhkAuwIUvM=;
	b=RkarLj4GkWpHHYMcSPlOD7pOYiq5NUF1YRH9Zq/xT7Eir6O79yCoJpfOilTNRm21vReZ
	 YUe9ZMQCekwu0Yb6x5mQMb/CRzhRIqoJq78MEanrlLED+DVG7SiHXtAgByCfZCHj6hHhC
	 S3n5bwitmiqOm700yHBmU2aFbpVAO1X6KqJVMfnYmEFGZ2hn/22mVUHa4e6DxFLzxw4IE
	 Az9vjsI32/270aM1z52Ctpq1FTZZcoe8Am513Xl3iljZcGnbaIWeIv34acdXt9nKgV2G5
	 lHaWy0DVMNGg5gjsYbbBWoFEgfBOLsSe7sRP++DfPuJY9a+SzJX72RLAsTWaEXxdO6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=IJAyo4Dw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3524606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 18:10:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3524606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=IJAyo4Dw
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc751eddf25so621311a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 11:10:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792779056; cv=none;
        d=google.com; s=arc-20260327;
        b=d0XVP6BblfltNnSTRd8TnI9cCcexVcKVn62Lw3xJKb0KDfjagrgzX8z9evmcldsadM
         FCWcpMCJQDh+fPPMnsTreGBaPjI+bOB51ToZw3ayeAkoaIQzJQG17d4klLS6qdqG/YMs
         MILaAwqeswan+aGNy3EcoymdP4g2W1u8BqWgKyRXnZ8oWrvF5hgZYiDVzBaLvJTSaUlr
         JV6uT9lgiFoEr/AgOc5heVTF/gsDGExnRZ2GblGKKDJjQkVhFwChdxcoYixksWaplFt6
         klNWD1lzHVY0xUXEHiDYAbYH/4cy2DOlRFplRB0ITYj0SBGYbLPN791xntfuHCfzmjHH
         yANg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2To+V+OrITwmpsIJPMwp0u1jz/ATT8WX/QhkAuwIUvM=;
        fh=NGqTEL06iKomjTejqdkDzKKoNhkAjGt/6EwLx691sxU=;
        b=nZUc2WQjznfWH3pI4TlIAMh7ugvOEhaRoJajheXHTVjtFJN/5B8uRviy5ky8KAZRfi
         J1HWsu0cgUh4/QufLVr8PxJByw/xxrIfzoG9trT28VOw9W85opT6JQZm2P43ung/6N6p
         FK79hA0joeimnZxrUreNJAW8+2O/7LMfVnD2p7nSklwAY8C60oC/mzmD+ZCfCg2vXvT9
         Bmmi8BnWUeWQipJRWYSRTq/4SvSgqhJpJFkNNKNcy3KMAWon0fLgBZdiTQ2vfl/DNrGw
         2rhZFhVuIj/gfmEYeCVJJOwwfeAwfPCCkYbGg3Z0kngVt3SUPX9P6FgPhuBvs9J8E2Od
         kxBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1792779056; x=1793383856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2To+V+OrITwmpsIJPMwp0u1jz/ATT8WX/QhkAuwIUvM=;
        b=IJAyo4DwhUUNRVqNHCueZ8LsIOldUGOYSiuA455VEuYgkSbX5wQR4sITkKOq8qZZb6
         OzExRnJHaVZUeoQ1IrT+oGRTMROrrKGTvj5st9F66zQHNB1Mxnx29bdY/IVShBEa2Egj
         k37SK6g9lb9vFXBa4IJjR6EFg1atW7jvxJNhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792779056; x=1793383856;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2To+V+OrITwmpsIJPMwp0u1jz/ATT8WX/QhkAuwIUvM=;
        b=iarILcv32oLneXWm+Xi0cAvqbvZoKcpc/Jmvjs+AnJvlM1/b6fn+DpBgc9mFaS9GwJ
         wX+UTd9PhpNNohfrB8RBEPZj3ord0hyZ/+7BGC3MP4b4jg93pqZRuSCdXwDJV25bgs9b
         S6EpSu9u7oZ5lJ03es83chcPrawozCuRLcJln5qqxEw0WCXoYOtBPr3ICE86CR0Ph4MO
         QYK6t57LiL9vxelHaLh8tNl3npEbz1TIl3et8fwhDaEVifHrl//hrNGjRM6vujT8F9F5
         ggnmXCziSIG6WLr72r33QvYGxYVffl37PAR2T7WMAJQfwY3Ro/advzJOhkpWHQEmhZM4
         HjKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIQTMe1pU1BEDav4w3pjmcwJAolbeJvwbEPtOV19feSpvpfvQbw5E8Fda+PPPGmnaNAEa218qaTPYcalw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7rt5SlMiABv1EnlMLFjduu+NTN995oNCxnuEn6QHnxBuCUsaM
	Fre6arbTHnnOvpWSI10lXG6JO/69mssSFLjfU1hq8pfY+WBCbk0qx08FoiCRMcZldUY2EuQXiyh
	KDIS5+RZ5vNX7pCxlS1ZHIc609dKgdipBFogtJiHM
X-Gm-Gg: AYBFou1snCoy3tgz5J2J01X40JZauVLl8LUXNNCChItopJteIrN6gdYBYA9rYTr38FX
	kQ2urH42ZnAn4xAXfZJr9A+6blmT/WnwFdUy5QgvDaidaGc3/DcRZ0IQfFP5M1cthUSwT9nphT4
	hJ8IS0V7CX+mz8wBmilkuTuZl1Fee5FmQ6OZ9RAXE5OQXZRsWXXTDnLq2I8eD7hnL3kMHVCTBjA
	uxoDVvzDMESxio3u6UIlD6An5/sWC4FrjVDv4bq0z1Jdl4TS1319ETSZe61LCVpvR+yIz8qMEUz
	rB9G8NL4mL2i8qFIQ4feLPNSzgM+AV3lCgY4qNnfGS/d2gSSx3H9O2ssgtF4dxuRQ0VzdZmLol8
	hzdEpQoMKeb+X4/PhYBQ+AknVoQA3wWYa1UW7LQ5D8KAVSn1pVZAN6pDdowPG1L57WrICQ4BTrE
	DT3R8WJUYjxu3HYjE=
X-Received: by 2002:a17:90b:58e8:b0:3ac:3e42:60a2 with SMTP id
 98e67ed59e1d1-3adead5ca8emr71919a91.33.1792779056179; Fri, 23 Oct 2026
 11:10:56 -0700 (PDT)
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
 <CAC_etQESLytW5rhp0GfZU-mJqJhwk202a5u_nTXZ7W6wJN=AJw@mail.gmail.com>
 <CAC_etQHv2EBYfAhfkYHKrasnJAyDS+u5+a4os4aD1eSmKrck_A@mail.gmail.com>
 <CAM0EoMm=KbZgcGqLHDFee3mM1GxuNCvAWObP_K4AxsGAoEAedg@mail.gmail.com> <CAC_etQGXyhHe4vowrM4wLmhid56JcdsQZXdM+SFM-ZMnmG9wwg@mail.gmail.com>
In-Reply-To: <CAC_etQGXyhHe4vowrM4wLmhid56JcdsQZXdM+SFM-ZMnmG9wwg@mail.gmail.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Fri, 23 Oct 2026 14:10:44 -0400
X-Gm-Features: AclHuK-rmW3KxgaFWTvJ_7-SL5p5TCdMGqIzYH2WnxCwtRo3MCTsEGQlUOqyd8U
Message-ID: <CAM0EoMn7EE+zFDis0e_QDkfY2U59QRi52izi4dgNNWnOv9Awtg@mail.gmail.com>
Subject: Re: [PATCH] net/sched: sch_qfq: prevent aggregate self-replacement
To: David Lee <david.lee@trailofbits.com>
Cc: jiri@resnulli.us, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, Kyle Zeng <kylebot@openai.com>, 
	"Dominik 'Disconnect3d' Czarnota" <dominik.czarnota@trailofbits.com>, horms@kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 11:45=E2=80=AFAM David Lee <david.lee@trailofbits.c=
om> wrote:
>
> Hi Jamal,
>
> I reproduced the issue on upstream Linux at commit
> 734bef548a96e8774d6eef5dfa2026c6edc4e80b using the original PoC,
> confirming that it is still present at that revision.
>
> I've attached the KASAN log, the PoC, reproduction steps, and the bug rep=
ort.
>
> For reference, the original patch thread is:
> https://lore.kernel.org/netdev/20260731140533.566493-1-david.lee@trailofb=
its.com/
>

Thanks for persevering David - i have queued it to look at - so it
wont be lost this time.

cheers,
jamal
> Best regards,
> David
>
>
> On Thu, 22 Oct 2026 05:14:38 -0400, Jamal Hadi Salim <jhs@mojatatu.com> w=
rote:
> > On Wed, Oct 21, 2026 at 10:56=E2=80=AFAM David Lee <david.lee@trailofbi=
ts.com> wrote:
> > >
> > > Hi Jamal,
> > >
> > > Following up on this thread. Please let me know if you had a chance t=
o review the attached reproducer or if you need any additional information.
> > >
> >
> > Please resend to the list - I lost track.
> > And if you follow up after like 2 months(!) you will really have to
> > retest with the new kernel and likely look at the list to see if there
> > are other fixes that cover this issue.
> >
> >
> > cheers,
> > jamal
> >
> > > Best regards,
> > >
> > >
> > >
> > > On Mon, Aug 10, 2026 at 11:22=E2=80=AFAM David Lee <david.lee@trailof=
bits.com> wrote:
> > >>
> > >> Hi Jamal,
> > >>
> > >> Reproducer has been attached to this email.
> > >>
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D Reproduction =3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > >>
> > >> 1. Build Linux at 82a47586c0b9266622657009aa30573dddf09f53
> > >>    with the configuration options listed above and KASAN enabled.
> > >>    Use a system with at least two CPUs. If QFQ is configured as a
> > >>    module, make sch_qfq available before running the reproducer.
> > >>
> > >> 2. Build the attached poc.c:
> > >>
> > >> ~
> > >> gcc -static -O2 -pthread -Wall -Wextra -o poc poc.c
> > >> ~
> > >>
> > >> 3. Run the resulting binary:
> > >>
> > >> ~
> > >> ./poc
> > >> ~
> > >>
> > >> The reproducer creates user and network namespaces, brings up the
> > >> loopback device, installs a QFQ qdisc and class, and races class
> > >> changes against packet enqueue. Race timing varies between systems.
> > >> On the validated KASAN kernel, the expected result is a
> > >> slab-use-after-free report in qfq_add_to_agg(), followed by a kernel
> > >> panic. The full observed output is attached as splash.txt.
> > >>
> > >> he issue was reproduced on Linux 7.2-rc3 at:
> > >>
> > >> 82a47586c0b9266622657009aa30573dddf09f53
> > >>
> > >> It is also present in Linux 7.2-rc5 at:
> > >>
> > >> f5098b6bae761e346ebcd9da7f95622c04733cff
> > >>
> > >> As of July 27, 2026, the vulnerable sequence remains in upstream
> > >> master at:
> > >>
> > >> 62cc90241548d5570ee68e01aaba6506964e9811
> > >> https://github.com/torvalds/linux/commit/62cc90241548d5570ee68e01aab=
a6506964e9811
> > >>
> > >> Required configuration:
> > >>
> > >> * CONFIG_NET_SCHED
> > >> * CONFIG_NET_SCH_QFQ
> > >>
> > >> The attached reproducer additionally requires:
> > >>
> > >> * CONFIG_USER_NS
> > >> * CONFIG_NET_NS
> > >> * CONFIG_INET
> > >>
> > >> KASAN is recommended to observe the first invalid access.
> > >>
> > >> Regarding the format, I can send v2 if the reproducer looks good on =
your end.
> > >>
> > >> Thank you.
> > >>
> > >> Best regards,
> > >> David
> > >>
> > >> On Fri, Jul 31, 2026 at 12:33=E2=80=AFPM Jamal Hadi Salim <jhs@mojat=
atu.com> wrote:
> > >>>
> > >>> On Fri, Jul 31, 2026 at 10:05=E2=80=AFAM David Lee <david.lee@trail=
ofbits.com> wrote:
> > >>> >
> > >>> > qfq_change_class() snapshots the current aggregate settings while
> > >>> > holding the qdisc tree lock, but drops the lock before selecting =
the
> > >>> > destination aggregate. During that gap, qfq_enqueue() can move th=
e
> > >>> > class to an aggregate matching the requested settings.
> > >>> >
> > >>> > When qfq_change_class() resumes, qfq_find_agg() then returns cl->=
agg.
> > >>> > If it is a singleton, qfq_deact_rm_from_agg() frees the aggregate
> > >>> > before qfq_add_to_agg() immediately accesses the same pointer, ca=
using
> > >>> > a use-after-free.
> > >>> >
> > >>> > While holding the tree lock, skip the replacement when the destin=
ation
> > >>> > is already the current aggregate. Any estimator replacement has a=
lready
> > >>> > completed, so the class change can finish normally.
> > >>> >
> > >>> > Fixes: 462dbc9101ac ("pkt_sched: QFQ Plus: fair-queueing service =
at DRR cost")
> > >>> > Bug found and triaged by OpenAI Security Research and
> > >>> > validated by Trail of Bits.
> > >>> >
> > >>>
> > >>> Please always send a reproducer - either as a tdc test case or if i=
t
> > >>> is sensitive send it privately to me and Cc the other maintainers.
> > >>> As trivial as this looks I will not look at it without a repro.
> > >>>
> > >>> cheers,
> > >>> jamal
> > >>>
> > >>> > Assisted-by: Codex:gpt-5.6-sol gpt-5.5-cyber
> > >>> > Signed-off-by: Kyle Zeng <kylebot@openai.com>
> > >>> > ---
> > >>> > Trail of Bits has a reproducer for this bug that triggers a
> > >>> > KASAN use-after-free and can share if needed.
> > >>> >
> > >>> >  net/sched/sch_qfq.c | 3 +++
> > >>> >  1 file changed, 3 insertions(+)
> > >>> >
> > >>> > diff --git a/net/sched/sch_qfq.c b/net/sched/sch_qfq.c
> > >>> > index 6f3b7273c..e900890e9 100644
> > >>> > --- a/net/sched/sch_qfq.c
> > >>> > +++ b/net/sched/sch_qfq.c
> > >>> > @@ -517,11 +517,14 @@ static int qfq_change_class(struct Qdisc *s=
ch, u32 classid, u32 parentid,
> > >>> >                 sch_tree_lock(sch);
> > >>> >                 qfq_init_agg(q, new_agg, lmax, weight);
> > >>> >         }
> > >>> > +       if (existing && new_agg =3D=3D cl->agg)
> > >>> > +               goto unlock;
> > >>> >         if (existing)
> > >>> >                 qfq_deact_rm_from_agg(q, cl);
> > >>> >         else
> > >>> >                 qdisc_class_hash_insert(&q->clhash, &cl->common);
> > >>> >         qfq_add_to_agg(q, new_agg, cl);
> > >>> > +unlock:
> > >>> >         sch_tree_unlock(sch);
> > >>> >         qdisc_class_hash_grow(sch, &q->clhash);
> > >>> >
> > >>> > --
> > >>> > 2.53.0
> > >
> > >
> > >
> > > --
> > > David Lee
> > > Security Engineer I, Application Security | Trail of Bits
> > > trailofbits.com
