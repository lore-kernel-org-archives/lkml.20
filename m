Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B287C2D5C7A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 21:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791839754; cv=pass; b=DSSf9bIh190QeImquGFZ5zmqYna7ifddvp5/HAdgJhHJg6tKwubtf986jPdSgv6prXxN7fMRwzetNnL/KX7Njk43IxfAuG6swcWbs4uMMtrAGus3okUaYZ0wEAEYq8VGft9h2l4WxsbJVizxTgGzBdbYGlkdmTOvCHb2mVb8IaI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791839754; c=relaxed/simple;
	bh=MvRPWTrtyAjxzLPHNX4nRXVH1EEBCgyWdNoeqj5ZkMo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DAaceCFSMQLByW8mbpLvpxJ1eoX2iPtVYJeiGzLcoQKLlBmxUUA6u3hGXxOoabD9l5rFcjPkrIWRWnVoV908L3JfWEF+MS5YPkNb1COV3fMF6eivAMXS8t0hAeDZMOueJzN161ENNq4VzrHpl6K1IbWdP22Xfwuq+5QWc9c8vJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co; spf=pass smtp.mailfrom=x6u.co; dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b=d+7ApDRB; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=x6u.co
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=x6u.co
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=x6u.co header.i=@x6u.co header.b="d+7ApDRB"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3514e7cbbbaso5793851eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 14:15:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791839751; cv=none;
        d=google.com; s=arc-20260327;
        b=AO0t8O3ES3PJWwkFh8UKx3nZJy3OVGpxW6ZZBFDzAz51q166773tjUSsCtM1V20DWB
         aofxxbJOXpoHBxm/I3xDIcJ92Zuz22Fj1Iz3rBOnA3KY3KGnD+7gjAzlufmEVqrgMrPf
         EQxyUrMmt31fKkv7Ld6vvdwgIKtiZa5E8dsgB0j1QVXPRGdzTYRAjpDezUUWWOer9zbP
         Q5XbDj7sOZziu1dkQNU3mWf/2K3ocxhM+y0L9MlAyED+vaPI11piuiVaEA7Kr4Hcc95J
         2rwpdoDae8+gGIbFzI/OttIDcx4Ijc2UsaByCRaucVocjbldtLTZVprIfPU2Ga2bSofK
         v0Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IANbA/IjdpnwKKoezh+3TmukPF52GIFYfzBOkPdztNk=;
        fh=Jd3m6zag2kAklFAsBcKLQNoSDCw/WSL9mdJgE4Pjkvg=;
        b=KnQzqBiw6dYTm9f+EpDxcbNrk+9+i+5lNF4/wUqt6mkjcQPrJoZ9p4NlQnl4IRT8DY
         h2gLO4apk+jFVBUrAc2KSnZASTD1JSNnMv7koM6z3yGqYN5vNGDfL2DKDv65qw0A/YCA
         yWSkLdFQff1TEBcwkPqVGGXgd6iHhkibM1cgy2Yei540rS8dqyu7SmeJITZllgLqkBT2
         sUMyBpicI4XccmT8gfXV7+9kEO8+Amv5qjE9RPUU01i4TuhkfR4Y79/bQ4gmzYUpUjIW
         671k/TOlByc/Cwwpt9wM0y7u4WbKkbHm4gmlvBJfzE4x+yp7fcvn/qcQo4lkSmkaCsdY
         laQA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=x6u.co; s=google; t=1791839751; x=1792444551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IANbA/IjdpnwKKoezh+3TmukPF52GIFYfzBOkPdztNk=;
        b=d+7ApDRB9S456YfIHhXaDnZ4yDeqBgWD3BAdR+mY87zU9GT4rBNr+2f1ibjjiLCrvN
         MKOJxbjkdz4ooDSbUxxYiFI6ZDVPmLWy5Rl3hfXmgbpBGcM+ocE1f4MEQ0K1tCBv1lv4
         BVhsNC12MhzMdSJSX+s8lvT2ulkoSa/AO0tnPMnWr3KTtJNfdzAj5QyuKndrUtlo2cfj
         KFO4G6+mvEMk2iJFivdu6t6j0LLCx98nL4vFrIX0ejP3aNg/+b0vNzMtmtHGu3Q5rbws
         hble4YQp2ub6UE8LRYk7Y9TyGVmtgKF0ybm+GL2VmDr02FHYQUxhGwCf5AelcKSg+QIh
         TLxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839751; x=1792444551;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IANbA/IjdpnwKKoezh+3TmukPF52GIFYfzBOkPdztNk=;
        b=UlZ1CTjWGjVAZrIdVyUcDWFgR/bjShQ1HasfTd6mKj2EdfRUKcRVBTNsog+mcqsG1W
         TH/3VYDpaJIi0D9aPNH+JU0tq43BwPnf5rSE4GFPVm3vl9PE9FyoN/4/05WRX9zd35zI
         TqPdG7mQHMGXJCC3csU0Z6oDiP66Cdm92Rck8c/2PIv1sMp3q0TQlDjKFcBmnu8s+1mM
         4N72+ubdmpWpB/b/n7hTK7mPLy4abL3zyPhq1irFIL6JEaByotHIbe3ngBtrv1rN/k8o
         iAFJLSZamJL3op7aEXVdcB5SX+6dz4W5/H0FPnLqMpWZULK2EwSmrfVNlsmE3/NQ0J/m
         P70w==
X-Forwarded-Encrypted: i=1; AKwUvBzdBQtn+hLNR9RfuUKxBlXqV2iViigMoMqJM2JoqkNimLrAhEaedyvPQ+G5QCG5o2pwIo3ypSCQljPSyhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtslMmcG99FTPzx6jZa7gXFwRl0qZlrt1AvisxJK8ImZUjEOAR
	Lq6zNwVmGcoZREU9O+0M/SIj1M8bbV7He/OF8ZHl03JRwT1t2BWVHr4NR8wq8KjRA5oaVK319fN
	lpDFAA2PsL/gnZf4+OAMxxHEhIVh1mO+WbNX1Yv3a5LM=
X-Gm-Gg: AYBFou3x+RMJ9Dox/3e452sx3GLMW4MeZcwUcelQt147BIw8F/zoqpTCY2i+wPK5Y4S
	zxHwGYPVp8lN+Gt7nEj6U7qjlz5TervWYqrmnc+CKi/Zfg1Ojj+vv6fI5tbzV//pcGWkLEwOp5b
	W0q5OIL/k8NM7D70AuSvpZkTUWjwDzKr3MiJw4VxSKq1BkrizsEbkh/uh9TAr9TEwIzM9fkJD4e
	12VSp6i5SOV3QP6DvD3oOO+JuNbFxPk6W9q9PEeSXDatp7yaR7Ina7UA2oVLkATBTfRxDi6NC/A
	6LiazuHO6NDxtlLut8sAIMysLM43eh0+92NoZh9o/G15QWgPNsAHwJhOBQmyeQPsrfSMy0YKKdC
	3tHSbSZZlcWlQjaivnBITCNmYeX594So3b1r+SFwahw==
X-Received: by 2002:a05:7300:1c94:b0:351:4a80:d94c with SMTP id
 5a478bee46e88-3537dfbbe1bmr16689633eec.21.1791839750665; Mon, 12 Oct 2026
 14:15:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011011022.1445352-1-dhu@x6u.co> <20261011011022.1445352-5-dhu@x6u.co>
 <20261012141725.GG219304@unreal>
In-Reply-To: <20261012141725.GG219304@unreal>
From: David Hu <dhu@x6u.co>
Date: Mon, 12 Oct 2026 17:15:39 -0400
X-Gm-Features: AclHuK-WSsye-UZZ0-V6UWBm8gdg-DYRcfAamBGa6KpOmrjBSgQosSoXHhwrVLU
Message-ID: <CABdL-LRjOf3GiL+eq4ZvRTWmWRqsehrDE_rZsRUJYRqzxaTVxQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next 4/5] RDMA/irdma: Support UMEM attribute for CQ creation
To: Leon Romanovsky <leon@kernel.org>
Cc: Tatyana Nikolova <tatyana.e.nikolova@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, jmoroni@google.com, 
	eagleshaw@google.com, David Hu <xuehaohu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 10:17=E2=80=AFAM Leon Romanovsky <leon@kernel.org> =
wrote:
>
> On Sun, Oct 11, 2026 at 01:10:21AM +0000, David Hu wrote:

> > diff --git a/drivers/infiniband/hw/irdma/verbs.c b/drivers/infiniband/h=
w/irdma/verbs.c
> > index ab25445f3828..e4a02a6b2a11 100644
> > --- a/drivers/infiniband/hw/irdma/verbs.c
> > +++ b/drivers/infiniband/hw/irdma/verbs.c
> >
> > @@ -2708,29 +2719,94 @@ static int irdma_create_cq(struct ib_cq *ibcq,
> >               if (err_code)
> >                       goto cq_free_rsrc;
> >
> > -             spin_lock_irqsave(&ucontext->cq_reg_mem_list_lock, flags)=
;
> > -             iwcq->iwpbl =3D irdma_get_pbl((unsigned long)req.user_cq_=
buf,
> > -                                         &ucontext->cq_reg_mem_list);
> > -             spin_unlock_irqrestore(&ucontext->cq_reg_mem_list_lock, f=
lags);
> > -             if (!iwcq->iwpbl) {
> > -                     err_code =3D -EPROTO;
> > -                     goto cq_free_rsrc;
> > -             }
> > +             if (attrs && uverbs_attr_is_valid(attrs, UVERBS_ATTR_CREA=
TE_CQ_BUF_UMEM)) {
>
> While making this change, it=E2=80=99s a good opportunity to split
> irdma_create_cq() into kernel and user paths.
>
> Also, please keep commit-message lines around 75=E2=80=9380 characters. T=
here=E2=80=99s no
> need to wrap them at 50 characters.
>

Hi Leon,

Thank you for the review. I'll split `irdma_create_cq()` accordingly
and keep commit message lines around 75-80 for this patch and going
forward. I'll send out a v2 shortly.

Regards,
David
