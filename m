Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614826F289
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 00:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791591816; cv=pass; b=iYOyLUORm/oqOybACUxMVJ4+RfD3Z6s97RRiiaBolEhYzGkY7115CWc48x6wfu2+vpedK1SswFW+xw/XF1zoIrRiTaE8Nt/jTo6IltY+f3/q5qnBxDTuZ4u59GqoNjf2gosmba+RxpRRjX6O40tiEeFFO9AEzAf/4TPkFc29q/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791591816; c=relaxed/simple;
	bh=Z2JW9LIkFMXkPvHGM0Dgtv4gTXM2c3LF5UF6k5I8+HM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b60bIPExCr3kN2Fv8FxWGfN2cSHXaFtQ+ufFht4bZHa2LLCR0+SC1+UKxUdbMh5iGzHGD7eb3D59Yn8R6ZqnVEyUa7rEmSx5YZwFGoIm9zr3GeCsOn1SF6sns9xpG5EZjTqaNQTw6qbb5M9E2flFbvfmuyu2SLrNlC+yZNaAho0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKy3OKgn; arc=pass smtp.client-ip=74.125.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKy3OKgn"
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6a5d790cce1so131826a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 17:23:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791591813; cv=none;
        d=google.com; s=arc-20260327;
        b=K4Ny6YUZwVmc2tlSy8QOtWiFLdzwqOTGoTR63c0lHJfhQP7cD/lbk/2ooIRpuKDrrI
         Txr9jjUnnEqGTzC0L5E81l2OFMFREnP77ab6jA2p9DPx3aHgzGbfe8a0au5++uECqmu2
         ardBzVP7JEBTmmmNPzGjUiz6l9I5IefE5vGNWiyIcs9Fki6bbYnceT23SsBjZcea+04O
         HvInalsaJuYGZezu91KoeVF43r/lvZGI0JdqvMAFffsPPhPu0N1AgFf4ntW7L7DnRaA3
         2bByyYrZVMn6NSF13tNot75RqeZHpMPw9ekmmapEaygsKCFBRet8QI+Oi8vBqsNq61/o
         2tMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E5Py6HL+QggVsOTpYoDRwjrwSN8ziJN3Kv+kCMYmLTg=;
        fh=+r5myJ4i6thLlvFsWYYoQoJN2bDH4Suyq/50DkuKg2A=;
        b=OC0iKNhX5Bx3/sN0omn+Rl+qPXnT07OcSfcklLFo+ZiJ7A/7F+7jkZR9HkkD7HFYse
         9SYrYeS6GNjFCZotUwvquFMiz2iR0oCsW++8hrmJaTt+L4JXugJFuNvj3KcdKDeDfbSJ
         0p8ldfAIIEa6cKHJe8mnz+W4i90PGmA4DNjeqSn2+sLo+mMlpyUB6emTbhEesuRzw7mD
         PGE6x2pG0hebZNpoFzuEkTANEqWUuhLDMiUhVXtKS35YUfweuNjNtS9Q+M2y6HUYw457
         MmxgJvpeK00hRGLpsccBzK8PayDzRp/OPIXTZDG40EOUFoLeS0sOSFVvLuTEFDPtce8O
         tGFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791591813; x=1792196613; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E5Py6HL+QggVsOTpYoDRwjrwSN8ziJN3Kv+kCMYmLTg=;
        b=PKy3OKgnPwyLIooBy0jhvouBj7Pts2kStw9yCGybwCw0Zd6Vw78EP+e0NvTWdXxc7P
         me7iCECjOF2nrYf3saNcKzp6hjJxxdHo0wEtL6NdK0hppcsSqbTmwZDFbCn2JdQSc0AX
         65sZRhZIeshp6nri3dCAKUlkwG6nc/XnYf2CvB3/V51sFQskjKyfIKFjukGr02eSdMbE
         7YOfdFnsXWsUJ14Gj2hfSTqs34NCsS+dUP6pw40zZeEpPDtXqq2a41bODSFAOXwfYhz8
         DBM1Vc6QlZeat3OvG4GD7j0GHQexUAxSHH1IH3kTuYdzl/U5MD6MJ30dwtvIzkJ6hFod
         Fe4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791591813; x=1792196613;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E5Py6HL+QggVsOTpYoDRwjrwSN8ziJN3Kv+kCMYmLTg=;
        b=yWx0BJg2lHL1BSIpXyJmzFM1JTg+Bre1TN0CNX+FgW+HqxdAUy+yy4QbcCjifQ3A97
         bNdcDc67MA8H4ds9ZMKaSC089C6GTXdMMZxFCHfj09QuB3tBiEhW25H1GEN0XyYmKlyG
         xYQ3tUYMdCpIaXY2joVz18KGH+3FEUX5MkL8BVWVMzATFEg6WzgppVKPuEWCwmLORDop
         6ONzd57V6ulOu3WmCAimL+6LyqvQUALfDV84VZc1i9z8Zs/XPoOZBk86bdtpOmr6NVip
         5z3UqJUTWR9r7jPW/Z7Wbgj+tcWHmsQZt4/D3pP12TRa6Or8tFAIDleBuw9FN1Zda5Vo
         Yngg==
X-Forwarded-Encrypted: i=1; AKwUvByaVxWH83sADW+oLeAxfcQSvpOQ01rldqIKnrF7hiryDsEfNKlSWFKeQb7F+CNnEen6HGmVlBCzC7jcHgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+03+GtogydT3Ot1MPLYDlTdwixGBfnxxMI/pnS8bTWeHxAZv2
	YYqpQVcJZpLzP7BZ7sms7hrHh1pSR3siwi4nOdmCzve3PktEGD2eL/kSlYbyMfdnonSJ4kvH54J
	R7HIoVC8ZpAY7BxnlgdFHBEGG2q79uA==
X-Gm-Gg: AYBFou3zoywFYfKs0JtNMZJJmnhc1J3kfYlRDKvMyE4jx9Z921ZOCbetFscXehSVK4e
	ZtiYukCwemgLnVdW7IlwlhAXknnU9NJAo7iBiEB0LXPaGRFjWGxLglLxiuNolhNkDGviIS+QBle
	uf21eA3bZJZRzt4kF3h9mKtkOmfGavRVKNUxpsTeoZ/MpqWEF/XUBjzW8zyHEM5/CK53l7MbzCZ
	hNiAjxrEW96Cjy0dG5nVDG+DAh4yxX9T6svVUVC56j8/dxjNrfMSdjbjbN2g6SwFElBmMAZR8bg
	4Plf2r3mJtE0ZHI2AX1Ku1mMsPISZO8M2iX9OwGbnPSHS0I+4LC23cxFBmsVmKOhddYY
X-Received: by 2002:a05:6402:4490:b0:6ac:9a44:d412 with SMTP id
 4fb4d7f45d1cf-6b17c25d32amr3176429a12.7.1791591812741; Fri, 09 Oct 2026
 17:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003202727.3673-1-ravis.opensrc@gmail.com> <20261005100435.1211485-1-kunwu.chan@gmail.com>
In-Reply-To: <20261005100435.1211485-1-kunwu.chan@gmail.com>
From: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Date: Fri, 9 Oct 2026 17:23:17 -0700
X-Gm-Features: AclHuK9H7NRLbSCaBe_aB3pxVn0sHlmdw2q3s22R7c9utOO5Z_szeWimYSsPy00
Message-ID: <CALa+Y17i9wN=0oLbbrsPafJY_KNEoKwZPLdLCrMq5Nf2k3aVKw@mail.gmail.com>
Subject: Re: [PATCH] mm/damon: add damos_node_eligible_mem_bp tracepoint
To: Kunwu Chan <kunwu.chan@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, SJ Park <sj@kernel.org>, damon@lists.linux.dev, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Bijan Tabatabai <bijan311@gmail.com>, Ajay Joshi <ajayjoshi@micron.com>, 
	Honggyu Kim <honggyu.kim@sk.com>, Yunjeong Mun <yunjeong.mun@sk.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Lian Wang <lianux.mm@gmail.com>, 
	Kunwu Chan <kunwu.chan@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 5, 2026 at 3:04=E2=80=AFAM Kunwu Chan <kunwu.chan@gmail.com> wr=
ote:
>
>
> Hi Ravi,
>
> I agree with SJ that this would be more useful as a general quota-goal
> tracepoint rather than being specific to NODE_ELIGIBLE_MEM_BP. The
> target_value and current_value fields are not metric-specific.

Hi Kunwu,

Thank you for the review.  Agreed; I will make it a general quota goal
tracepoint, as I wrote in my reply to SJ.

>
> On Sat,  3 Oct 2026 13:27:27 -0700 Ravi Jonnalagadda <ravis.opensrc@gmail=
.com> wrote:
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
>
> The comment says "Per-tick", but the event is emitted for each matching
> goal in damos_quota_score(). "Per quota-goal evaluation" would be more
> precise.

Right, I will fix the comment.

>
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
> > +             __field(unsigned long, target_value)
> > +             __field(unsigned long, current_value)
>
> Also, context_idx is currently always 0 here, since
> damos_quota_score() only has struct damon_ctx * and no context index.
> If this tracepoint is generalized, it may be worth considering how the
> context/scheme are identified rather than introducing another tracepoint
> field that is currently always 0.

I kept context_idx for consistency with damos_esz and
damos_before_apply, which carry the same field and also pass 0 today,
since a kdamond runs one context.  I will follow whatever SJ prefers
for identifying the context in the generalized event.

Thanks,
Ravi.

>
> Thanks,
> Kunwu
>
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
> > --
> > 2.54.0 (Apple Git-157)
> >
> >
>
> Sent using hkml (https://github.com/sjp38/hackermail)
