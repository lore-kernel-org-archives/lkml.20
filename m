Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F1D4E4C3C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623478; cv=pass; b=hlKRyDaDIGqbsBIS0OFeKn7ocDABeIwYAjBvuLp3wh4vhzCVG8xTM/2l9P2Dhxjk52KlK0JDAklyAk7rFqjiqzrSUo2zEdzLA4vnO7+NwQfxMh+GnaggD+q7ioEDTgUOeY804avUOzx+J9eOnb9sDpnCdAqKsCoNQzGlgzPL//E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623478; c=relaxed/simple;
	bh=R07dChNgz97uAb16cExXKaLp/1vzSHRrzI0UatQofQw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rGFEg08lkCtVzbx5k+s1fDfYBmGB/qd5/lZ5TpzGYCS/lGtX+sR6zWm8qmaXPaGV1zkDqps8UfkALDBafiv39cprA2zS0GWQ1NPY+eRNdtFvc56lOR3tcT0h7zBqF96zc+hEEFR7YMtJ8IbndWZRkoWxp5iQQkkUhLL6eOQrS0s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmRvuRFH; arc=pass smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmRvuRFH"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so652517b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790623476; cv=none;
        d=google.com; s=arc-20260327;
        b=G+4DCn1lIeSN58iO+HGKjWGnzgVFT9/rY72yiBRJ8VSx/jpkCepo3Knz3rRO/ONGka
         fyo70K9gxsb+oMx/pJy3VIwoeMJ0iOTOuLOaeB+wqwE2pBZxzhKfAxE7We++LmHUNjVn
         jP/eth8Y9M3jrzxwzmt/npnyETVR3kKKECxy6/ow2qGufTLeaA3l9P4+Iffm1V6oqSsN
         11IG2ZgaY4dAfNPY6w/45MHir+Uu/omOyXAN0et3/Myy6zFmIJmAGEXml/63Wgp1mQVg
         SljH4xPTwx6WR3vw9GeXQ6wlEiF2aO9DeNobL1ch/3jsQoJ8QRbRJyRi8Jy85TG2Y/qw
         AH6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x/6AePfqmUPTnHU7L6Sz6cTsQuJ8/0NdRudtX/a8olk=;
        fh=9GON5zgIJGhG9ycAyju/WI/cJxewp8MyYQMVW7voQBg=;
        b=eaPffUnueQs4q30jliUiuG2Umn+hWFUmbauK6Cq2xEecqUX3sQsv20x0WA/r4/1e1o
         SSbIBN1hmqLSJ6JG6Jl94NB6YUxjhEP7Hac/ruDiywARi2tjlaGt8eiGHyrw9/Chk627
         4TnvZzXYYwtqwjjAkY2JCOnBfYcMURMP6g39P/ea8Rt/0UebUmdnlZTLlo6xvEP6AamF
         BnLl2pY1eD+7cP4z2nT+1/8V7ffMDNkUZTUC8PzYEznCf24HF9mRWfOsaKrblytz2sOV
         MSQBF0XODA4CpEI9RVkr8zo18kD5brEeUQtlp41aoF2Nxyfmy1zsPhM5ZQxQZ915kDaO
         0xCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790623476; x=1791228276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x/6AePfqmUPTnHU7L6Sz6cTsQuJ8/0NdRudtX/a8olk=;
        b=lmRvuRFHzzlI8g7O/YRlvgeXMZs+pIsxulb5QHuixdG48AWzRq5d5kh5ytXdaA8gEX
         e0HyQ7XAEuHqaEv7GbPRg4aqH2TDARhzsBEMaggpaTdVabYYga4Ipb/ojfOxdFwxnELQ
         hD1pLzzQz4fFwKFIheLHXYAdP5bJD4C67E0/lXNPYQIqNkoCxTnFdxuJqRn7kgRpM/0u
         3x7pS8AzXZPES5nlOTm458TY3fxTE9pXN/PiCPqdNNXjhsPqLdJEN85R5ygN6UXZ8JXq
         LQqdY1y7uxFV0jMsJb5pf3LAXNrA9Rm/c3keMxDQxxKfZHJL2WdH5N21KarXiZu0aa3v
         rrsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790623476; x=1791228276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x/6AePfqmUPTnHU7L6Sz6cTsQuJ8/0NdRudtX/a8olk=;
        b=D3lNI76OAHRVsMEHzIlWD6lceb+uLHx3RMqcxAW4/QxXTp3eDmrD4zZGwAnoLoq/Y+
         j11BqNpq/ASOJqqt2RcFOeV3kNOqxQGyYPoVjrJ5meXGwcgXkVfHFnPGuHIDWRM4MXNd
         H2/sR7ySh0b5i7/PBcgSfO+E8GSVXVkmK2g0kDmMa1HrZ1MW77fSUtUj/kMOXGG9qGr9
         KFdAPhO8mMdmuAc8AlKo5oqtgEz6MM4n0FEGrujARcxrIATx+5cxtvKTbwh+MMP0UlW1
         64V4v4v/R6Ap/1+Ns2miaM8VB7n47V7y71xHaWWrYA6gFfDyKGZTh8Vnbkvxud70WmIr
         LxvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHCoTzbG7y+TpYPYovY+ulWPOAPv4NJzpmRp8qigRQ48LMLsg3AsMAULNcWrwwwgiXV9iJvLtZADf7bLI=@vger.kernel.org
X-Gm-Message-State: AFuF++nmg/GUKFxjx7O4QSai7JeYsnAorAIM5zhOHD+5P7qLV01mlYwt
	o7d1tj3ip5Aq6xR8kRaStEZ4BL5eP3goL3l7F6aQE+vAKU4t/H0g/3LOpYewPBjRITMJKnli+S5
	fT8DCznMLznRdHVOIsrmIzlk/wXPkTVhMsJucdgQ=
X-Gm-Gg: AYBFou0Qf3e2rbe7HH5Cyp1pznxJhCWKUFRao/THafztXr5X7W8PMoFEcqkoDf6jwuz
	5A84yzKL1cR2m2JgVRA7vAgjoMrNJvElmBRxh4JHJfVYkgtB6GwshioPpFxlUTN+OeUTmjeWHLT
	TtuEV7yGXMlm2W6iBhhH7gtJXBzVqIQM67D+HbAjQbRv0jx5S6ij5Q2SzRFZpnpGZam4w/GbxBV
	ZzbVlo7gG0inlzaSHj5U8TkSVipv4uHDwmL3qREuqlaqkfXrEUKtGzvkChB0hYFln82BJPcJKIm
	Wdie5Pgv0bW1OWPOX7JQ4A/lFAnwuWP+JW59T5CFAo19hTrwV5m7iFV/QsiAp9Qt3gxivvhtvwu
	Wrk/O0chhe8FM
X-Received: by 2002:a05:6a20:7348:b0:3de:60e0:5ca5 with SMTP id
 adf61e73a8af0-3de7ca7091emr226450637.9.1790623475412; Mon, 28 Sep 2026
 12:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928142233.1131459-1-adrianox@gmail.com> <CANn89i+dFQjW4vnTBWjtVGFmwY5KQZctrUrNYq=VYsOZz8okFQ@mail.gmail.com>
In-Reply-To: <CANn89i+dFQjW4vnTBWjtVGFmwY5KQZctrUrNYq=VYsOZz8okFQ@mail.gmail.com>
From: =?UTF-8?Q?Adriano_C=C3=B3rdova?= <adrianox@gmail.com>
Date: Mon, 28 Sep 2026 16:24:23 -0300
X-Gm-Features: AclHuK8iqVcTNxq2cQ2pAWBlrWBwn0YcpU2_45fv4awfOyaFyXSAB8MnKf2vzfk
Message-ID: <CAMGU2hXKPKtRr65SQt1fJGxPS22qA0zU7jJvo8OHPWTh4zYk3w@mail.gmail.com>
Subject: Re: [PATCH net-next] net: sched: revert tx_queue_len on partial qdisc
 resize failure
To: Eric Dumazet <edumazet@google.com>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El lun, 28 sept 2026 a las 11:38, Eric Dumazet (<edumazet@google.com>) escr=
ibi=C3=B3:
>
> On Mon, Sep 28, 2026 at 4:22=E2=80=AFPM Adriano Cordova <adrianox@gmail.c=
om> wrote:
> >
> > Pass the old length to dev_qdisc_change_tx_queue_len() and, when a queu=
e
> > fails to resize, use it to restore the queues already handled.
> >
> > Fixes: 48bfd55e7e41 ("net_sched: plug in qdisc ops change_tx_queue_len"=
)
> > Signed-off-by: Adriano Cordova <adrianox@gmail.com>
> > ---
> >  include/net/sch_generic.h |  2 +-
> >  net/core/dev.c            |  2 +-
> >  net/sched/sch_generic.c   | 15 +++++++++------
> >  3 files changed, 11 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/net/sch_generic.h b/include/net/sch_generic.h
> > index f35bd06a6bad..0ce97b4b2da1 100644
> > --- a/include/net/sch_generic.h
> > +++ b/include/net/sch_generic.h
> > @@ -720,7 +720,7 @@ void qdisc_class_hash_remove(struct Qdisc_class_has=
h *,
> >  void qdisc_class_hash_grow(struct Qdisc *, struct Qdisc_class_hash *);
> >  void qdisc_class_hash_destroy(struct Qdisc_class_hash *);
> >
> > -int dev_qdisc_change_tx_queue_len(struct net_device *dev);
> > +int dev_qdisc_change_tx_queue_len(struct net_device *dev, unsigned int=
 old_len);
> >  void dev_qdisc_change_real_num_tx(struct net_device *dev,
> >                                   unsigned int new_real_tx);
> >  void dev_init_scheduler(struct net_device *dev);
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index f660fccfc0db..57e1fa320d53 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
> > @@ -10002,7 +10002,7 @@ int netif_change_tx_queue_len(struct net_device=
 *dev, unsigned long new_len)
> >                 res =3D notifier_to_errno(res);
> >                 if (res)
> >                         goto err_rollback;
> > -               res =3D dev_qdisc_change_tx_queue_len(dev);
> > +               res =3D dev_qdisc_change_tx_queue_len(dev, orig_len);
> >                 if (res)
> >                         goto err_rollback;
> >         }
> > diff --git a/net/sched/sch_generic.c b/net/sched/sch_generic.c
> > index 6f6a6f0d5eb0..8fd0fce23cc4 100644
> > --- a/net/sched/sch_generic.c
> > +++ b/net/sched/sch_generic.c
> > @@ -1422,13 +1422,14 @@ void dev_deactivate(struct net_device *dev, boo=
l reset_needed)
> >  EXPORT_SYMBOL(dev_deactivate);
> >
> >  static int qdisc_change_tx_queue_len(struct net_device *dev,
> > -                                    struct netdev_queue *dev_queue)
> > +                                    struct netdev_queue *dev_queue,
> > +                                    unsigned int len)
> >  {
> >         struct Qdisc *qdisc =3D rtnl_dereference(dev_queue->qdisc_sleep=
ing);
> >         const struct Qdisc_ops *ops =3D qdisc->ops;
> >
> >         if (ops->change_tx_queue_len)
> > -               return ops->change_tx_queue_len(qdisc, dev->tx_queue_le=
n);
> > +               return ops->change_tx_queue_len(qdisc, len);
> >         return 0;
> >  }
> >
> > @@ -1465,7 +1466,7 @@ void mq_change_real_num_tx(struct Qdisc *sch, uns=
igned int new_real_tx)
> >  }
> >  EXPORT_SYMBOL(mq_change_real_num_tx);
> >
> > -int dev_qdisc_change_tx_queue_len(struct net_device *dev)
> > +int dev_qdisc_change_tx_queue_len(struct net_device *dev, unsigned int=
 old_len)
> >  {
> >         bool up =3D dev->flags & IFF_UP;
> >         unsigned int i;
> > @@ -1475,13 +1476,15 @@ int dev_qdisc_change_tx_queue_len(struct net_de=
vice *dev)
> >                 dev_deactivate(dev, false);
> >
> >         for (i =3D 0; i < dev->num_tx_queues; i++) {
> > -               ret =3D qdisc_change_tx_queue_len(dev, &dev->_tx[i]);
> > -
> > -               /* TODO: revert changes on a partial failure */
> > +               ret =3D qdisc_change_tx_queue_len(dev, &dev->_tx[i],
> > +                                               dev->tx_queue_len);
> >                 if (ret)
> >                         break;
> >         }
> >
> > +       while (ret && i--)
> > +               qdisc_change_tx_queue_len(dev, &dev->_tx[i], old_len);
> > +
>
> Ah... Probably driven by the TODO  comment and a LLM ?
>
> One caveat is that pfifo_fast_change_tx_queue_len() is currently the
> only ->change_tx_queue_len() implementation, and it only fails on
> -ENOMEM (inside skb_array_resize_multiple_bh() after freeing the
> previous ring arrays on already-processed queues).
>
> Trying to revert queues 0..i-1 back to old_len will therefore have to
> allocate new ptr_ring arrays right after an -ENOMEM failure (which is
> especially likely to fail again if old_len > new_len), and cannot
> recover packets already dropped if the ring was shrunk.
>
> pw-bot: cr

Yes.

So there is not much to do about the TODO. I could send a v2 where
qdisc_change_tx_queue_len returns void and emits a warning on failure.
