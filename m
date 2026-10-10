Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B42459E1
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791591672; cv=pass; b=ZREAw2WAuFAbO9OWYDU01wJ9oQu4u2X9dFHMqyJ+4gYkvJ4eMfZgl5hA7lpHRNI1axr9x46+FBQtGsMzwhJFvl6JXJgBQ7Nu5IqUlV4KAE45JRpbq4K5N0toDs3gnHV0SLakMh0QLCkPlJB4DmsnqQZ/OL7snCt/YI5u0piSTco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791591672; c=relaxed/simple;
	bh=HxAWx+vouM1rFRwo1u+RrW+BszfFH2h14d83b6DcrnY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEahN3hfjXYVElVrVgmP6bmXEuPs9ynqGCCYL4JnI1XhCX7vT8fRb4pTODeYc6ZUzDHVAYNIvKgsIeUDOs5Z0L7W/LKBJMYVz03CDupk9CI0I467cPKbYlDW9bWBcwcZFROC3sWMyXgovmrZSpbevuaIP/ozXPFTxgY75g8misg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPyBHTUI; arc=pass smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPyBHTUI"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e5ae86ff2so68624eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 17:21:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791591670; cv=none;
        d=google.com; s=arc-20260327;
        b=ezdCfrR3PdQmTVT1opownLJ/rMC3cSL9mGnN1zXcgd5H7SMifEkAE1doVP/eSetpio
         G6kBY9e4RiOnGk+ZgAmP77eSdpWyUclD1bv/ywJRGN9owU816Lg43w+cWLnwSAOcajMK
         EUhmRUJNw+A+gm+MYxtTnaMfT9gizYDNYROQKR+XRDN80jCkmTXvyx7oUp77lok5UiQK
         p3yx/x8c/vnkWu1Ds/dHH5aloC1pJ6OavA4AhHSysPWlv6LS+9PRf+CcR4eqcEI6HGAP
         3DxmaboDLGfHYKAU5ISyitzubkfNukeP4olDZBaBwsMhJXX/+DgE9Qw9cd1gmQcX9Wga
         pQtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aLhgNbsx0+wXZ0nMHKkwbYkJUXpFXWO/o3bDIihSveI=;
        fh=H1zdtd4kGIUzOgf/EItlhtj45N5p2Fx4kFXR+y9KD2o=;
        b=fOXu7KvFKaPVkr7fa99hw9E+3ZP7H7Rz0KWPhF7wGKC+u5l1Rkr0AVHZ6vop9QSA6z
         4FJc9gCgmIOD8KWW4I75yUnvja402wHNEIkw4YDpkF6SPwVtGDAZQtR/LLdrxepgtwYK
         LZjLtq/eZrYN5Fa1o02sLEWZ4FoVUxQaFnfKZK95105wu4v+sTFw+xyr18dogyg1t+5l
         CPY+an9DvSFyrvwhHAP32yvD2hKZ4EBO4w9lwr5dPk+aq5FUXwz4tOarVjJrnZ0AQGra
         1tMwEKYjO6tT5WgP685QMvwN5clsauyRhjclO+A+0F6es4A5vy6gzXA31LHRa6J6JwuM
         lTQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791591670; x=1792196470; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aLhgNbsx0+wXZ0nMHKkwbYkJUXpFXWO/o3bDIihSveI=;
        b=RPyBHTUIJTLM8EDj6zM7bb9At3/8AemAI460eoEv86Ei1zKVoA7WRdwl00JV7G1Saj
         ZKZqW26LLe1XP+D3H65FGqVBKPrco8y/6j2wZ7xQ87yUZzzWKvHAs8PC8CNker+5PuJI
         SPmBu5KTyVtkA+KYjhrP6E3Hk+gIRtC2UaJYQAq+kEk6Qhmvqt/nFGzBcxi3D1c+ppnW
         r2zvrlRzfC2iNF5UefefezwJeMwVzWxrhis+TOX4Nj1RpmlG8pOYEXA5KNaaTwgX1c12
         +CTg6m00q+Toh4/pRlB518jQ+n0HcNGsmDQrTuXFihQ3rwe98moyfk2Ol4Jak8+kCNLJ
         DLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791591670; x=1792196470;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aLhgNbsx0+wXZ0nMHKkwbYkJUXpFXWO/o3bDIihSveI=;
        b=K2KElh1ca2JzgumXqvHJwnZIQem0tATYSzUDTWdSywJprgDUiq0dVYRkKGT/fTWXl8
         S6xp1LUe2mDv26N9XDn4yeoCB6YY5OsH70v6n2G2qhSBhSJ3OH1JOezX88RvDKYG/nza
         3w4x/k52EPgq4pqmDrvEkpB+XXggxD6Y8+7nOUs0ZmnuK3tNknLdw4/SdFV1tF81rxnb
         V2iKQLaw2tsXQDG2/Pd5OAd8STYBxBddfJU6FEzXjMeThRpYHcgHxskU/ucWuBOFyRaY
         WtBMEeoS9nS1tzceT8Q00dEBIZ6Pa/XfwltNurKESk6yEUibN2LqE7GrrVcGidc3cHva
         RX/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwRG/+3Vddj4as0WNmPG30qD3Qti0YQyfUIZtPhmN/LRHXDk66yGxUpAX2UDRO3BcYTNlB3H1dhF8CTEvk=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4XFg4SgJvNMyrgZTqU1zsr60PCHPHj2cSohmk9qM6Fbk6+hrI
	DQYhnhv81yDk692exN3chmm+4PFbS83WOVoxh0YuO935es/xHC88rTsTi/GkVlHiO+2Xdgiq+mR
	Swxd+pCVcadK5XKQsfqWQIXb4l3P0NA==
X-Gm-Gg: AYBFou1Bf2L6gUB0tvO8ml+rhuL79VgCA7gETOXOJjHRsFSwRghZkMRfcR1B5IK0//A
	s5aOMlcNDRkzt9L3hp2fxOPgQIIvA3BkIAmAnGpKd65FYhI/4zhShjbsHt6g6cQntv7Wr9uW3pm
	CkAYdldVvbVYYh6/zrNEZWxYw2+IvgZfIq7JippuntqxAj8mbiIfltbisKDMm6D3d0fQJwBh+8i
	lUZDOUk+e6MegrGRcA4+yfMsZXLLKlrUIDyxdpLSkD0uf/s4Y2Y36rfw2TBQ75VOb5HIR+IxRRM
	KF2pXmNpuC9/LY7kfdS9kB9IIn9y6thynlPP6vg57z9EsE/OTo6AfG03sQCLL7Ln4VM=
X-Received: by 2002:a05:7022:1584:b0:143:4d12:396d with SMTP id
 a92af1059eb24-16a61a6def5mr6220928c88.26.1791591669725; Fri, 09 Oct 2026
 17:21:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003202727.3673-1-ravis.opensrc@gmail.com> <20261004051632.71726836@fedora>
In-Reply-To: <20261004051632.71726836@fedora>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Fri, 9 Oct 2026 17:20:58 -0700
X-Gm-Features: AclHuK9WQbXCtUH8jjgwOQuphF_nuOqJSSeO2P2D0u1Fn7EltapGuD6HQRfN-gs
Message-ID: <CALa+Y14+pGN+ZA90gALy30mvrmkTp21AVFrjfzP1AtYEo-uVPw@mail.gmail.com>
Subject: Re: [PATCH] mm/damon: add damos_node_eligible_mem_bp tracepoint
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, SJ Park <sj@kernel.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Masami Hiramatsu <mhiramat@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 2:16=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Sat,  3 Oct 2026 13:27:27 -0700
> Ravi Jonnalagadda <ravis.opensrc@gmail.com> wrote:
>
> > Add a tracepoint for DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP quota goal
> > evaluation.  The tracepoint fires once per quota-score computation when
> > the goal metric is DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP, exposing
> > context_idx, scheme_idx, nid, target_value, and current_value.
> > current_value is reported as the quota tuning sees it, after the goal's
> > complement setting is applied.
> >
> > The DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP metric expresses node memory
> > occupancy as basis points of eligible bytes.  This information is not
> > exposed through any existing external interface (perf stat, /proc, or
> > sysfs), so the tracepoint is the only way for userspace to observe the
> > target and current eligible-memory basis point values at quota-scoring
> > time.
> >
> > Link: https://lore.kernel.org/linux-mm/20260428030520.701-1-ravis.opens=
rc@gmail.com/
> > Signed-off-by: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
> > ---
> >  include/trace/events/damon.h | 31 +++++++++++++++++++++++++++++++
> >  mm/damon/core.c              | 16 ++++++++++++++++
> >  2 files changed, 47 insertions(+)
> >
> > diff --git a/include/trace/events/damon.h b/include/trace/events/damon.=
h
> > index 8851727ae162..2c7249cc7c88 100644
> > --- a/include/trace/events/damon.h
> > +++ b/include/trace/events/damon.h
> > @@ -74,6 +74,37 @@ TRACE_EVENT(damos_esz,
> >                       __entry->esz)
> >  );
> >
> > +/* Per-tick DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP goal evaluation. */
> > +TRACE_EVENT(damos_node_eligible_mem_bp,
> > +
> > +     TP_PROTO(unsigned int context_idx, unsigned int scheme_idx,
> > +             int nid,
> > +             unsigned long target_value, unsigned long current_value),
> > +
> > +     TP_ARGS(context_idx, scheme_idx, nid, target_value, current_value=
),
> > +
> > +     TP_STRUCT__entry(
> > +             __field(unsigned int, context_idx)
> > +             __field(unsigned int, scheme_idx)
> > +             __field(int, nid)
>
> Can you move the nid after the two unsigned long values below. This
> creates a structure, and on 64bit machines, this adds a 4 byte padding
> in the middle of the ring buffer.

Hi Steve,

Thank you.  Will do; in the next version the 8-byte fields come first
and nid follows them.

>
> > +             __field(unsigned long, target_value)
> > +             __field(unsigned long, current_value)
> > +     ),
> > +
> > +     TP_fast_assign(
> > +             __entry->context_idx =3D context_idx;
> > +             __entry->scheme_idx =3D scheme_idx;
> > +             __entry->nid =3D nid;
> > +             __entry->target_value =3D target_value;
> > +             __entry->current_value =3D current_value;
> > +     ),
> > +
> > +     TP_printk("ctx_idx=3D%u scheme_idx=3D%u nid=3D%d target_value=3D%=
lu current_value=3D%lu",
> > +                     __entry->context_idx, __entry->scheme_idx,
> > +                     __entry->nid,
> > +                     __entry->target_value, __entry->current_value)
> > +);
> > +
> >  TRACE_EVENT_CONDITION(damos_before_apply,
> >
> >       TP_PROTO(unsigned int context_idx, unsigned int scheme_idx,
> > diff --git a/mm/damon/core.c b/mm/damon/core.c
> > index b63e60ef8990..6ddd15dc4f55 100644
> > --- a/mm/damon/core.c
> > +++ b/mm/damon/core.c
> > @@ -3294,6 +3294,22 @@ static unsigned long damos_quota_score(struct da=
mon_ctx *c, struct damos *s)
> >               highest_score =3D max(highest_score,
> >                               mult_frac(goal->current_value, 10000,
> >                                       goal->target_value));
> > +
> > +             if (goal->metric =3D=3D DAMOS_QUOTA_NODE_ELIGIBLE_MEM_BP =
&&
> > +                 trace_damos_node_eligible_mem_bp_enabled()) {
>
> If you move the trace_damos_node_eligible_mem_bp_enabled() before the
> goal->metric check, you will save yourself a branch when tracing is
> off. As the trace_*_enabled() is a static branch (nop or jmp) it has no
> cmp branch, but the above will keep the goal->metric still exposed. By
> swapping the two compares, the goal->metric check will be hidder behind
> the 'nop' when tracing is disabled.
>
> -- Steve

Makes sense; I will put the trace_*_enabled() check first.  SJ asked for
the event to cover every quota goal rather than this metric only, so
the next version may not need the metric check at all, but the enabled
check will lead either way.

Thanks,
Ravi

>
>
> > +                     unsigned int cidx =3D 0, sidx =3D 0;
> > +                     struct damos *siter;
> > +
> > +                     damon_for_each_scheme(siter, c) {
> > +                             if (siter =3D=3D s)
> > +                                     break;
> > +                             sidx++;
> > +                     }
> > +                     trace_damos_node_eligible_mem_bp(cidx, sidx,
> > +                                     goal->nid,
> > +                                     goal->target_value,
> > +                                     goal->current_value);
> > +             }
> >       }
> >
> >       return highest_score;
> >
> > base-commit: 763ad0211c7b587344f03bc4d1299810aeb736f4
>
