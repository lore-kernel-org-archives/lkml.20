Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE604A64D5
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792403760; cv=pass; b=QSB1Om87oKemWXOhW8PxVDJFxONQLejV5dWQZ4eb4HiJvfo9JimuwaXDNdMhLde8tcqy0P7/DyEjqxPRM7JFLheTduvfAIZlC5ddgF5G8x+oP7OHbq8Xmy7sBZvXxrAJHErzr3pcgfAyb9yLXxK0ALT/Wv5EPWKcY8RbpyWAvl0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792403760; c=relaxed/simple;
	bh=gqi3U7n/QtDsR5wlhBbyg7CifMun5YBwGtD8IH4Foxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyXlFep5OGQcG2PSHDr9P3LYcU6VD+kDAiJZEK1OQcwamTVb5nVktGVZhJrECGl6Cnxhk+MeWf4znFNssE/8TkVh9ToO4uU0CmZRdR15C/qiMnEcc84ko7KbPsMm0bP6B9yPs7WH+h4BIu76t2TeiAqkQMLYAKhwOnPN9nyQkvw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EDWJ/FlJ; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EDWJ/FlJ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be47159f2bso1481036e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 02:55:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792403756; cv=none;
        d=google.com; s=arc-20260327;
        b=gG5LHEY+pQMp+k9id+lxRwevBeUIuUU//z/T8rWlls5yYDUmFvNupxsZUzHG9E9CHe
         NlQUsVa86ETzF7d2WZuxOUsHbhchGwiTcxs+rnrDfJ3iUGQVjxv/Px2oAb/lFHgDdILo
         OtCXn7Ap17h8h3Ygk/KVJIsVSHBWExZ+t+M7FDx9ftNk1jhQGdVGRlzk/1yNZpMUOJmA
         Owzxb6ACLIRoHg+PtHs/3hqlxFY7vjpJzt2L5IfSWH9vAtHvlInop0XJEdzW4gyMtnyJ
         8tHZsRoHsNXwBLLMb6I//O3KuKOKl7PiOfgrQFI0NvOKetrUqkVgYom9hGE+OwIeyqm9
         uzeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MuJPDRdTy81KjotvArVXlt4OrVu92Si9O0HYOV8J+9o=;
        fh=ddSD6dtglg4/xLQOhTrMUpNb5wYQtkxGCVzsyec4HYg=;
        b=Rmo+LP1KEq4vYYnWo6RxKdW6/X1K1Vz5jmd19fF4fGAYD3C71mnnnXA2lMfhlfDOWC
         3aTSUBIQwRWVSRcb4ygLkm2teusKsX88mL0cUIvTtMCAYHZ94IgYZvxcMqPKWRfKlYJd
         pxSKkr/e31aFh4XL8Rq7s9DHWkDXenotJyoHhw9goWQMKmC5f76O2PVUqwZhpp/vb7fx
         P7rstGFm/84WtPmCph5YluIa55/OXR8i3MQ2HQCGVq3tEb/ILUrLsQ/4IUOMbuBL+2Ph
         dgeQuNgNpb1scdpq8f4JLF//+FDwtbsX3lExQJ2IRvKftxSkq8nqiRGNae52Hhve6mLK
         zKPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792403756; x=1793008556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MuJPDRdTy81KjotvArVXlt4OrVu92Si9O0HYOV8J+9o=;
        b=EDWJ/FlJfmX2v91zxOsOCF5x37Q+IOa7JfFvjNDfGzKEGuln9OB68EyqJy2UUbI4gc
         Wb4gnUxCZ980F3gu4kb3Ij+tVs1Av7GEDtUn+uRl9cVtzENZOQ9CukFcZjetedHS51Md
         X9LDDE6x6VeZH8ElMQhQWYH+w2ws3vhusxHlcx//gNLmMouR9CEGiJuzVYY7Ly/isvZy
         Zk/gLvTmM7q/r61NxW5tb1pEwc4nZ/Ue5PFARi7C1cwJF0IbtAq8xzh+ulda1xUmeQB7
         P2TKv0Eu26dlJ5jleLFovEBr8qmdTHzfthmhRPTQFN9YrXMo+kKzvnsSK1LjHm58thb6
         hp3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792403756; x=1793008556;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MuJPDRdTy81KjotvArVXlt4OrVu92Si9O0HYOV8J+9o=;
        b=W3g2rMw0xKypGz/CBkn64pf+7Sl6C+TdLLITs37dTYgWEJ0pXhDU8x6wKUQ+wmPOra
         b1aoSvPcIUKM5vPpn+yc+b3lt/7c6IBER+0t2tKFnYYHxdSuyCfV1d2y7GXTritfL6V2
         FLMa/m1ufvMv5Q5OwfLiTTQY4LI0SkpubsFXBsr4Z14Z+nINpyrU3gR4s/Cg/2H6R38V
         12GE+RLP6DT0ZksffkWFOfVRSBOaw/pAPwmU0E3Gc0Xq51SEvVBfIr/HWZpl18FLQ/QA
         fjKReI4E+G4I9yJFumZ6SabjFY6o7tFQroiYeVzV9QqN7x2CgImAF2qaziFL945nbl+D
         zDWA==
X-Forwarded-Encrypted: i=1; AKwUvBxGBtGXDSqPsJmj9BLrWF/hyyZAWQqFWV09qaLX+xky/8hqcTjjAcZO+kD37FNsv76RUH/degsG7R3qZf4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN4Yl0ZhPlqet8FpaVl2RscizcMno3JXY2ffKQ9CgshWg1XMsJ
	EMsaNN8wuhpbaTjigORSLduoZ8d7ffC14iY94shAs8uL94bM961JUgOF2s4BZJxPlR7obCzdu3e
	EeI6ki7hP19U7uQKPX7gA1tutUMqmMwdQQQP+aQipLA==
X-Gm-Gg: AYBFou1gS1iNcUGNNbQAYkneSTzVke5lSKp3OLvwDVWR2NEUuHIk5lMX1zRGmd7OkDW
	1M1YPG0h2OEORcstz8VCQVPGG9pNFO6rZdO21Ok3VNTtkDqMCpYig1ZQE8APOb8E6/ntM+CViLy
	cQB6wzjnAlgSvSodepnUFa431jbP1PCYhnS4wOQa7tRyYZ7yHv0HEDBGz2EGE0Ry7R8ReT6bKll
	FW9CdpKfKOZEYNiXi/ZVmuNEJkzMNrR8BzaI2VaQXzPtfxVT703Pb6OUGn+Z11seoS5PCcM52gi
	pR5qG5/gKe8uL/V34cwsyYm4eQVb6ilwgHgZeWIqF/ZunBxFmVcCFKSGLinD/TsmndgPasvaYmO
	pNimhdToAQecH
X-Received: by 2002:a05:6512:b84:b0:5bc:bb39:1b53 with SMTP id
 2adb3069b0e04-5be50a73b7dmr2347028e87.31.1792403756369; Mon, 19 Oct 2026
 02:55:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012095452.135828-3-marco.crivellari@suse.com>
 <179188543192.434549.4257004266357227847@kernel.org> <20261018143442.GM503057@horms.kernel.org>
In-Reply-To: <20261018143442.GM503057@horms.kernel.org>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Mon, 19 Oct 2026 11:55:45 +0200
X-Gm-Features: AclHuK_6oFqzh3TbYN_-CW7N1nWbLX95zNftyFclNTBVaLpWf8RWHFN24zLVM5Q
Message-ID: <CAAofZF4YxqKihS3TtYXyT6y-f5pH9XjYiXKo2VzjXWWZ3OWjRw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 2/6] net: ti: icssg-stats: Move long delayed
 work on system_dfl_long_wq
To: Simon Horman <horms@kernel.org>
Cc: netdev-bot+sashiko@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, tj@kernel.org, jiangshanlai@gmail.com, 
	frederic@kernel.org, bigeasy@linutronix.de, mhocko@suse.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, enelsonmoore@gmail.com, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 18, 2026 at 4:34=E2=80=AFPM Simon Horman <horms@kernel.org> wro=
te:
>
> On Tue, Oct 13, 2026 at 09:57:11AM +0000, netdev-bot+sashiko@kernel.org w=
rote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider.
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
> >
> > If you believe none of the issues are legitimate, please reply to each
> > issue of Medium severity or higher and explain why the AI is wrong.
> > If any of them are legitimate and you plan to respin, please let patchw=
ork
> > know by including "pw-bot: cr" as a separate line at the end of your re=
ply
> > (one such reply per series is enough).
> >
> > - [Medium] The conversion is incomplete, so one delayed_work is queued =
on
> >   two different workqueues.
> >
> > --
> >
> > net: ti: icssg-stats: Move long delayed work on system_dfl_long_wq
> >
> > This commit changes the self-requeue in icssg_stats_work_handler() from
> > the per-cpu system_long_wq to the unbound system_dfl_long_wq. The goal =
is
> > to let the periodic stats work benefit from scheduler task placement.
> >
> > > diff --git a/drivers/net/ethernet/ti/icssg/icssg_stats.c b/drivers/ne=
t/ethernet/ti/icssg/icssg_stats.c
> > > index 7159baa0155cf..7d6d6692d8192 100644
> > > --- a/drivers/net/ethernet/ti/icssg/icssg_stats.c
> > > +++ b/drivers/net/ethernet/ti/icssg/icssg_stats.c
> > > @@ -69,7 +69,7 @@ void icssg_stats_work_handler(struct work_struct *w=
ork)
> > >                                             stats_work.work);
> > >     emac_update_hardware_stats(emac);
> > >
> > > -   queue_delayed_work(system_long_wq, &emac->stats_work,
> > > +   queue_delayed_work(system_dfl_long_wq, &emac->stats_work,
> > >                        msecs_to_jiffies((STATS_TIME_LIMIT_1G_MS * 100=
0) / emac->speed));
> > >  }
> >
> > [Severity: Medium]
> > Is this conversion complete?
> >
> > Both ICSSG drivers use icssg_stats_work_handler() for the same
> > emac->stats_work. Both prueth_netdev_init() functions, in icssg_prueth.=
c
> > and icssg_prueth_sr1.c, do this:
> >
> >     INIT_DELAYED_WORK(&emac->stats_work, icssg_stats_work_handler);
> >
> > However, the first run is still queued on the per-cpu workqueue from
> > the ndo_open path:
> >
> > drivers/net/ethernet/ti/icssg/icssg_prueth_sr1.c:emac_ndo_open() {
> >     ...
> >       queue_work(system_long_wq, &emac->stats_work.work);
> >     ...
> > }
> >
> > The follow-up patch "net: ti: icssg-prueth: Move long delayed work on
> > system_dfl_long_wq" converts the matching call in icssg_prueth.c. No
> > patch in the series seems to change icssg_prueth_sr1.c.
> >
> > On SR1.0 hardware, the first stats run after each open would still go t=
o
> > a per-cpu worker. Every later run would go to system_dfl_long_wq.
> >
> > Could mixing the two workqueues also bypass the non-reentrancy check in
> > __queue_work()?
> >
> > kernel/workqueue.c:__queue_work() {
> >     ...
> >               if (worker && worker->current_pwq->wq =3D=3D wq) {
> >     ...
> > }
> >
> > The instance running on system_long_wq re-arms onto system_dfl_long_wq,
> > so this check fails. If the timer expires before the first worker
> > returns, a second instance could start at the same time on another
> > worker.
> >
> > Today this looks harmless. The handler does nothing after
> > queue_delayed_work(), and emac_update_hardware_stats() takes
> > prueth->stats_lock.
> >
> > Should emac_ndo_open() in icssg_prueth_sr1.c also switch to
> > system_dfl_long_wq, so stats_work is only ever queued on one workqueue?
>
> It seem to me that it would be worth getting this right upfront.

Thanks for your comment on this Simon.
It likely makes sense to change it there as well. I will check for the v5.

Thanks!

--=20

Marco Crivellari

SUSE Labs
