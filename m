Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793783691;
	b=2Nhw4jgy+W1X5Riwu3ly1/lISSiucyvYSyc7hGIQ8x3ZR731Gp7DNWcg0a2sQ3ieDxQd
	 11odmjCFnvUQvu0nnsFxWn7Zu+vb2xLokS2/DBsWayC3zg7pWiMiW6EZi423yERdVNcOS
	 az1Yd7BG36W+B3YyILWki9TKGtacbIy/CGTHm6TRHRfTMK7d/c04LXI91OEZ+IrPw8ckF
	 M8x7v0s3/B1jRQVisY78gpomZ9Ha7ppTlB9AGzZezpmsFdE6QOTZ3dTMeEcLC9RQBhTNC
	 N0IQNROm56USwH69uRk1pj8QQ+P0SNpfBSHkkNn9ICQ9qQynmTT3+61p9tHl4xKJPqA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793783691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=czUbxv5EfuLpmjrkgw21CAlQ/JdV9gdYAJCXYckMMh4=;
	b=RfFLnSUCoRLitnFG1mLarmS+2IWk1ovikPxlTtS5SRrJY5x5J144l6ZalXKsZcwoBALF
	 3WUV9vFEpcKwflqo5Z09vm6ZHdyLycowKT1uNTnu6tkECmRU1e23FGwz8/MpULhAEWqNj
	 1IIqAxQwe265WN4uVzEMvUEt1R23jMDgtbJdTvfRpgfgOwRje39q5u0Y9QJ3asq1po5an
	 TiL8KtLhjTWohlZcU9jsWKo7S5pHQe5nQ2Vnwj7DGMm0sBpmx0mRl9UFRDpEDEbhdBk03
	 mpTcBFHi1ItKhlRpE7kZDcEra11r6gJJxDAaRwIslAWJHog4KrNYURclGYvwGMFBbvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=mojatatu.com;
	spf=none smtp.mailfrom=mojatatu.com;
	dkim=pass header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=AQqHQRIl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35623606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35623606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mojatatu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mojatatu.com header.i=@mojatatu.com header.a=rsa-sha256 header.s=google header.b=AQqHQRIl
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a06c60065fso368969b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:14:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793783689; cv=none;
        d=google.com; s=arc-20260327;
        b=Wp/S/p151iU0N03LjsPiCusxB15/TQw0ILHDDqyUbyhf444pcNv6ATtBHgxTGZq8Z0
         6/7iqZjazsiTnmdhRsi0ULKvIwWkkSRris9uIp75K75iCq/BEAhtvBoK8jCgBUhuhJ1+
         iXgb26QCsxSrb7CWRa8KKGhzrNQeK0rCWgISxSzrarFCk6xLIXjCSwNkO5TjeIxDqygh
         Z6ps8af1KGDO+HtCPLae7/DdbKDYFi1W5Gv54ym9s9QEGGiaiAbaPZ7mfSqLraMPETOl
         JAD3ahAmpobof2Vx1EucICAtCZcAVKhfE8mmaiUGd7jY3tRTIuE+yPUsKKZZ3sONEAQe
         a8og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=czUbxv5EfuLpmjrkgw21CAlQ/JdV9gdYAJCXYckMMh4=;
        fh=3CxajbkIdGkgMuZ+I/QQaQnImige5e40xb8gDP70Phg=;
        b=YldYUMQBqXXHnnESGaLT99pPrDHA0lep2UCpqRlkRHq3aH8y3g+LukB+92lsh3CP1e
         23sWpOtk8cUmmpsgKZ1JvIvlnn1YCbEWmW3EDHJRaviWJV/mPtP5hHPrv+NFhd4yW0zu
         Omcm7s23gXpEkb1faiSMIOfptgOnwKFO6moA1sHsWffbkwXnFwPDqpx9ngyr3kNG+kUm
         T9Snd4bspbNogrcxK81mAgDELROzfLt1kTNINmNprHXeYICVlOKLZ3doFnium8dfR/wJ
         2c1eyvs93fzywpI3mNI+wRgrHa+mvC927pi3X8eAwg1IWrmaSn159FcR+re7QUtMZuUE
         wJQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mojatatu.com; s=google; t=1793783689; x=1794388489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=czUbxv5EfuLpmjrkgw21CAlQ/JdV9gdYAJCXYckMMh4=;
        b=AQqHQRIlgEz6uzCGkg04TmOJsYG2eT4MvgX8UrzjPyNzZbEQwCB9itFh1O+e74qSrk
         +0mlDibQIRXNWIfyTomgiRrLRHHZOhnGIOrNSSSnZG4tCrSYL9c2r4MFvmFhmfNGTbVg
         UvVj59+PYDAcmXXiru/Roz+PEE2YVAl8Mj9Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793783689; x=1794388489;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=czUbxv5EfuLpmjrkgw21CAlQ/JdV9gdYAJCXYckMMh4=;
        b=XFA0mNqETFkt+wbs3K/UrHFyNAfqWvestQNFgSaopezbENxLo7zKuKFLt46diH4UJp
         xJjevhdUWeQ31WzO6D06++ik7O9ESAc2bpZVl2bFoe0SnZ2yTdZDEeQbfcXvhO4BbA97
         yugc6snMy0dXPFIB7Zkvam5Qz8yR2CVKekLtFJ9521WgHAfwpZg86cSkvLntgnFw5LXc
         e5N1bXKXmCRaMUsl61mhS2ulYFLxkjJhP4WC0gBLHpVTsBsiI2D2t+c+AYPX+Cy80Dd7
         Y5QujH6z7qtrxIe3K3lhCa6S9Z5SlVfCy/4Kxkxc4T5vwZcVblqn1ZSqnafnqOTyfM9P
         5Z0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrwQ5FHmZ5Cwy/cJlqlbdKLjls+h+5AZ5FGzOFbnBvPe2cA3Dq2Kb7ehccTLevhV+7mSdZEWpjKgB+2Yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GDpInlo5fsBWRh+wieztamtTQFBa62MB2hyIUOCS+J+ionKPf
	/1fQt385nD7/I+E/Z+nC/9HC1BkkpdYk/Cvb/LQTRiyy1XbtABhrw2RehHg4oG5eF0E+OT6J45r
	iQ5j0OZZKFp8SRXxyHfON3TrbAUP7fsPYVjdEiuae
X-Gm-Gg: AYBFou23YQczEoPJrNdyWZlxAqa5pagChcEdKUn5NFSZbiCBm+5UVzZK+8s4G1pVVRx
	FNWQJv07AWoDn0tmy6+DUF//12dFmAGL6islgOJFad/k+iR9CWupxkSWmn5pEoTKcHKLTHAUlxu
	LEaGiBzH4x4w7OaxK8kbQdk73ewSsuaPRPi44GVIynpoJJ/apw32uY+6X5zFYZMGAjDY928vl/P
	HvLSOfd5EG3H6MYemGAd/E5/UxAavjMX6jmM580sQEz9pmxL79pHfH8OTBzKVrinvKsHQaF52FS
	CoSUrVVdOaHEN88u0YctPX6j07cTL/h0EQHkVQCBXLwCytWD6iTUrl/Akmmpzj4uAswUuQgSLOh
	D8lJvwmMigX1QoXqNBSyu0fOxKfwW3aYhhztrWQWVA0iDxgC9sABfDTmV/wGW1INmz6NffdM4NX
	MxB2wMw5o56sFh+YY=
X-Received: by 2002:a05:6a00:a90:b0:89f:521:8089 with SMTP id
 d2e1a72fcca58-8a9bcff6a9dmr11969821b3a.19.1793783689421; Wed, 04 Nov 2026
 01:14:49 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030030453.31928-1-cenzhang@linux.microsoft.com> <1e517947-48cb-4733-9e51-8a165d3ba534@redhat.com>
In-Reply-To: <1e517947-48cb-4733-9e51-8a165d3ba534@redhat.com>
From: Jamal Hadi Salim <jhs@mojatatu.com>
Date: Wed, 4 Nov 2026 04:14:38 -0500
X-Gm-Features: AclHuK8QWfUruPb5mmDSb_oYTX82loMdqpI8kSB4xjZlQlMEjnsaHJgwVrRB1uY
Message-ID: <CAM0EoMn5ODpLK=OhPTy=0Zq1rgT7Gm6JGKnRs=Q=mzp_6x+JDw@mail.gmail.com>
Subject: Re: [PATCH net] net/sched: fix rate estimator use-after-free when
 clearing NOLOCK
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Cen Zhang (Microsoft)" <cenzhang@linux.microsoft.com>, Jiri Pirko <jiri@resnulli.us>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	AutonomousCodeSecurity@microsoft.com, tgopinath@linux.microsoft.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 3:10=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 10/30/26 04:04, Cen Zhang (Microsoft) wrote:
> > qdisc_create() creates the rate estimator requested by TCA_RATE before
> > qdisc_graft() converts a lockless child of a locking parent. The
> > conversion in qdisc_clear_nolock() frees the per-CPU statistics, but
> > the estimator keeps its own copy of the cpu_bstats pointer and its
> > timer keeps reading the freed per-CPU memory on every estimator tick.
> >
> > An unprivileged local user can trigger this.

This is a bit of an overstatement (Sashiko is infecting me with its
pedancity); you should qualify it with "needs CAP_NET_ADMIN in a
userns" or something like that. In general you should provide for
conditions on how to reproduce this in the commit (looks like straight
tc commands).

>> The estimator timer can
> > access freed per-CPU statistics in softirq context and panic the kernel=
:
> >
> >    BUG: unable to handle page fault for address: ff9d8b20ffa47920
> >    RIP: 0010:gnet_stats_add_basic+0x77/0xc0
> >    Call Trace:
> >     <IRQ>
> >     est_fetch_counters+0x31/0x50
> >     est_timer+0x52/0x170
> >     call_timer_fn+0x9f/0x210
> >     run_timer_softirq+0x6e/0xb0
> >     </IRQ>
> >    Kernel panic - not syncing: Fatal exception in interrupt
> >
> > Fix by doing the NOLOCK conversion in qdisc_create(), right before
> > the estimator is created, instead of in qdisc_graft(), so that the
> > estimator captures the final statistics pointer. Removing the
> > conversion from qdisc_graft() is safe: a new qdisc is created by
> > qdisc_create() with the parent it is grafted under, and since
> > commit bc50835e83f6 ("net: sched: Disallow replacing of child qdisc
> > from one parent to another") an existing qdisc can only be grafted
> > again under its original parent. Either way the qdisc was already
> > converted for that parent at creation.
> >
> > Fixes: 8a53e616de29 ("net: sched: when clearing NOLOCK, clear TCQ_F_CPU=
STATS, too")
> > Cc: stable@vger.kernel.org
> > Cc: AutonomousCodeSecurity@microsoft.com
> > Signed-off-by: Cen Zhang (Microsoft) <cenzhang@linux.microsoft.com>
> > ---
> >
> > The bug was found and this fix was developed with the assistance of an
> > LLM-based code analysis tool.
> >
> > Backport note: trees without commit bc50835e83f6 (v6.14) still allow
> > regrafting an existing child qdisc under a different parent and need
> > an additional fix for that path, for example cherry-picking that
> > commit as well.
> >

Good note - this fix is not safe in older kernels before bc50835e83f6.
Is this the protocol to signal backporters? My gut feel is they use
automated tools and would not be reading commit logs to backport?

> >   net/sched/sch_api.c | 14 ++++++++------
> >   1 file changed, 8 insertions(+), 6 deletions(-)
> >
> > diff --git a/net/sched/sch_api.c b/net/sched/sch_api.c
> > index f36c41224bcc..d89f3f0a3c5f 100644
> > --- a/net/sched/sch_api.c
> > +++ b/net/sched/sch_api.c
> > @@ -1247,10 +1247,6 @@ static int qdisc_graft(struct net_device *dev, s=
truct Qdisc *parent,
> >               unsigned long cl;
> >               int err;
> >
> > -             /* Only support running class lockless if parent is lockl=
ess */
> > -             if (new && (new->flags & TCQ_F_NOLOCK) && !(parent->flags=
 & TCQ_F_NOLOCK))
> > -                     qdisc_clear_nolock(new);
> > -

Please leave the above lines alone; they seem like a separate
unnecessary "fix." Follow up with net-next to remove this hunk.
On current main it is dead code, so it does not help you fix this
graft issue and for older kernels the backporters wouldnt have to
worry about the dependency on bc50835e83f6

The rest looks reasonable.

cheers,
jamal

> >               if (!cops || !cops->graft)
> >                       return -EOPNOTSUPP;
> >
> > @@ -1327,6 +1323,7 @@ static int qdisc_block_indexes_set(struct Qdisc *=
sch, struct nlattr **tca,
> >
> >   static struct Qdisc *qdisc_create(struct net_device *dev,
> >                                 struct netdev_queue *dev_queue,
> > +                               struct Qdisc *parent_qdisc,
> >                                 u32 parent, u32 handle,
> >                                 struct nlattr **tca, int *errp,
> >                                 struct netlink_ext_ack *extack)
> > @@ -1405,6 +1402,11 @@ static struct Qdisc *qdisc_create(struct net_dev=
ice *dev,
> >                       goto err_out4;
> >       }
> >
> > +     /* Only support running class lockless if parent is lockless */
> > +     if ((sch->flags & TCQ_F_NOLOCK) && parent_qdisc &&
> > +         !(parent_qdisc->flags & TCQ_F_NOLOCK))
> > +             qdisc_clear_nolock(sch);
> > +
> >       if (tca[TCA_RATE]) {
> >               err =3D -EOPNOTSUPP;
> >               if (sch->flags & TCQ_F_MQROOT) {
> > @@ -1817,7 +1819,7 @@ static int __tc_modify_qdisc(struct sk_buff *skb,=
 struct nlmsghdr *n,
> >   create_n_graft2:
> >       if (clid =3D=3D TC_H_INGRESS) {
> >               if (dev_ingress_queue(dev)) {
> > -                     q =3D qdisc_create(dev, dev_ingress_queue(dev),
> > +                     q =3D qdisc_create(dev, dev_ingress_queue(dev), N=
ULL,
> >                                        tcm->tcm_parent, tcm->tcm_parent=
,
> >                                        tca, &err, extack);
> >               } else {
> > @@ -1834,7 +1836,7 @@ static int __tc_modify_qdisc(struct sk_buff *skb,=
 struct nlmsghdr *n,
> >               else
> >                       dev_queue =3D netdev_get_tx_queue(dev, 0);
> >
> > -             q =3D qdisc_create(dev, dev_queue,
> > +             q =3D qdisc_create(dev, dev_queue, p,
> >                                tcm->tcm_parent, tcm->tcm_handle,
> >                                tca, &err, extack);
> >       }
>
> Jamal: could you please have a look?
>
> Side note: I'm not sure if you are aware but we process the pending patch=
es
> in this order:
>
> https://netdev.bots.linux.dev/suie.html?delegate=3Dnetdev
>
> And you can restrict the list to the tc subsystem selecting the appropria=
te
> filter with the funnel icon in the top right.
>
> /P
>
