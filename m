Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D62393DCD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790316293; cv=pass; b=D9MOPEFFlDapIqtZFmybRELdREKDWUa4MH89RMMITXW21lZ6M9PwU3XuMaKgWXG6YseUsSd5yxBOXBbM9XXztaBjBhPmo1c3S+5OW8IHkI1uTgwU7lQRvJGKwrKIb90segi0H0ZSnQ55KC4uoVLDy52jmVkm2aIN+CXeFUOGuEw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790316293; c=relaxed/simple;
	bh=n0g7ltFuYfHeB3lT/oFe6WHRBYKRGW2vhL03GPn2aJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr+9TJjbovJPv1+o9zmXlwhsA+nbNPnr58VVbCyUbPWTBxMQ4yFzvvbWbnlmPtZQ9jgEO18IhFhP37o/DW2NEPT48jQKIKKEMzjbAQiAQnIEHKPKJqNjBm5LMJExLGRNH/eCIfxiXJ2NQnFZvndFk1S7Kz4yaVeYZulMoQxxoUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EtN2XqN2; arc=pass smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EtN2XqN2"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-530e8c6fb80so121531cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 23:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790316290; cv=none;
        d=google.com; s=arc-20260327;
        b=qCtonnJkDPyWa6WoVQtuCDJe7Yvsw6oG1p17adp+1pg9uVY9XwquVtJXDXtpVYfR9g
         wsYlNkGH2xYlJsSDphmUcWsU9Fr99BKIhKVvgLflkwh7P8r/kKMKErxNS3ABxn7k+4vv
         J1IMELXDp4H8X46ll7mcogMO5OiRBlRRulXmqL6IjTOTKjDwEz6KO+Nazm/feLdTMjFN
         kZV2MVn1zPLXvOmqMgdcnWYC796B4NEVvtJ+IMmd+18Hb/RpMGcu96iBRlSbpRA8LVun
         UW1vFh4qG81lRlHOU4SD0prcB+erddC0G3hHxeABgOfwKNS5xq70+xgxhO3xNMnJEB1B
         m4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uFHv/NXcVHJN5o88N4eEkFmwnshWOqOMekRqytrwOao=;
        fh=nwtuyXdc+fjRgL61GSqKQubAZkhykAGeYhxDoFdknJ0=;
        b=nAVvCBm/V1WO4v9UdWO7bIixHr7sx83rhVYFWzeYE3rq6vy9Z0CY4sDVfvxEoBtQfE
         QCcKkE1ab8IZt39sWwvylXOsCmvCaxdtwIerur/VfBYJ1t/zW8I87x/LSyNGOWlnHO/p
         DmayjJjvpRGJu25UK7Y1cJ2h4fy788/dALbeTYi/Phr701IHU8s9X8pUvOIsg8gpyc8+
         YF817O5N4IxQJuB0qYensSF8XGtcIrn4cIyQy2ZMt1uETeZUyXcNB5ggEeQeYm07AJ+C
         G1R6Aeef07V+zSFE5aduk6WJkRECZAxHEIAHfvxEZmbu5yNDqKP0cXX18z4Ha6TN187H
         HFAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790316290; x=1790921090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uFHv/NXcVHJN5o88N4eEkFmwnshWOqOMekRqytrwOao=;
        b=EtN2XqN2MlO0waffGopAx9mOE+lFQVZ1aHVYdOxsGeI8PKGrS0OhjipWKFbzmO34l7
         OEsV8/IsOxcQ6LWni7uviclzclVq1/FXAZFzoKLx1OB6Gx4mdUFBffQEAKq9Jpy6D8V/
         4COa40Sat3qreKEDLCMF8/vnfLkjMBPzJdjvaf+6n5EoG9nenf012kXdTG66HyW/YN3R
         3JTw0wd0e0o3bBYtmbvNiA0u5ERDTNLWnEDZc8Z9QIwapACln2BH2k5DtBS5I31UprMR
         uTw5/R9hNa/+awBDiFdO3qhFWzxtqKfnkbxPGglpDxIhcZNz7Ag7+PTUbGES37Lm6YpK
         K4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790316290; x=1790921090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uFHv/NXcVHJN5o88N4eEkFmwnshWOqOMekRqytrwOao=;
        b=waE+/UXcYauO+n1mMJkOdXb3equLAdm2/Mp+Om0UuH1GG6zYFRzRdGQiihfZKS3NRQ
         3oBZtgfU8EQfC4BJukMpGJ1lBo5JQ20Iy+/Xi6HlyzYNtKk/7lCIRDgL7GVG4aWYtqxo
         bQDyMKm9TBnVo2t5cQK7JOORZuZ1Z/sRKEgTY9dzQ54L4RQuQIFuntXSrz5kZR+T+IJs
         Kw2Z/GL4pvvhF8K6fQqbex6WjKjdhEsMXJfIzhbaZ/+RXZ20zKBvwQoTkCJmAmIdgcGJ
         89TbjNzorlnBXnLDGSYrlUPg3LnKlwf41uNBwpsdyvo4OmDM9dBplkKZ72tQF7N4FmU9
         ZncQ==
X-Forwarded-Encrypted: i=1; AKwUvByki2yOj84J/p8t7zc5+ahARDAfKvMaJPRzX8mMae/eDfTJqzRFPSNN7NwN5lw2H+nzui2l3y5K/TsmFqE=@vger.kernel.org
X-Gm-Message-State: AFuF++nDPoihlMP9qOHmUIQNgIA5wKtJeRXUIGEcl3Gs6Xl/xz9dcsV5
	Qf3wI7CdLUF5g5nFFxEtPuzyP2uFZATHg0P9u5amCnlO0+CH80/i+Cu3Qy0W/5Arv4pnUW5YD8v
	xmv59cg/sfhtqUV86kv9lMGF+sWCV6impQwD9w3xc
X-Gm-Gg: AYBFou2Ub6SadisphZL59foaGqYSnRzEDFAT+Tlx6TRF0LlpmzmGQ68Th6W0mEJBtEt
	/au+yz60EAO/bttfYpeNeJzyIO6jF/v5eLGRnZ/ImSd1PO5jqdneekuIDxOdfScAPcmRCuVsm5C
	zi2gHRoDC4VVbnUKVZ+Tu2dm+f9h47VQyGkDZYvL9QZyR1RdTABG0WOd+0Zzhlb5ZHOgx5/tcmQ
	vak3KonvEVtNuomA9Fmv5E+Fjmpb0/V3+F+XcjZlE6I0NR+A/4YmWfgjED2rcZowpgAwQAm9jDC
	k0v4g1QIz/Tkg/lNdmvSETqlLf9IzOxYflUzzsiTy0Nd8ISQD9a5TA==
X-Received: by 2002:a05:622a:d3:b0:532:c8ca:5ae9 with SMTP id
 d75a77b69052e-5330e14c38bmr7040531cf.11.1790316289698; Thu, 24 Sep 2026
 23:04:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790025465.git.abhishekbapat@google.com> <057359f7-0e8f-416b-8b5e-0b60c1c936e9@linux.dev>
In-Reply-To: <057359f7-0e8f-416b-8b5e-0b60c1c936e9@linux.dev>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 24 Sep 2026 23:04:37 -0700
X-Gm-Features: AclHuK_lwpEJbAhWtQShe8aDhh_guZmjVwfh6KH-R_FEbCl9ftq7SLG9YWrva9A
Message-ID: <CAJuCfpGmChqsz5SMHaaTxJQLcj200USvxZ6SQ6vrAr6-M2Vg_Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] alloc_tag: Introduce selective tracing for MAP
To: Hao Ge <hao.ge@linux.dev>
Cc: Abhishek Bapat <abhishekbapat@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, Shuah Khan <shuah@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 2:52=E2=80=AFAM Hao Ge <hao.ge@linux.dev> wrote:
>
> Hi Abhishek
>
> Thanks for your patch.
>
> On 2026/9/22 05:26, Abhishek Bapat wrote:
> > The existing memory allocation profiling (MAP) tool accurately maintain=
s
> > aggregate counters for overall memory accounting. However, relying
> > purely on aggregated counters restrics the visibility needed for
> > targeted debugging.
> >
> > This patch series integrates three new tracepoints (alloc_tag_hit,
> > alloc_tag_mem_alloced and alloc_tag_mem_freed) directly into the
> > alloc_hooks_tag fast path.
> >
> > Enabling trace events globally for all allocations introduces a severe
> > baseline overhead. To limit the performance overhead, we let the admin
> > select specific allocations to be traced.
> >
> > A new IOCTL is introduced to allow privileged users to determine which
> > allocation tags need tracing enabled. The IOCTL utilizes the
> > pre-existing filtering mechanism to specify the allocation tags to
> > enable tracing on.
> >
>
> I think this cover=E2=80=91letter could go into more detail.
> Also, the cover=E2=80=91letter doesn't include any how=E2=80=91to=E2=80=
=91use.
>
> Looking over this series, it seems you expect users to first call
> ALLOCINFO_IOC_GET_AT to obtain a tag, then pass that tag into
> ALLOCINFO_IOC_TOGGLE_TRACE.
>
> This behaviour is not reflected in the existing cover=E2=80=91letter.
> Before reading the code, I assumed I could just pass a module
> name to trace all allocations from that module. After going
> through the implementation, that turns out not to be the case.
>
> Because patch 2 enforces a full mask requirement for the filter.
>
> struct allocinfo_filter filter =3D {
>         .mask =3D ALLOCINFO_FILTER_MASK_MODNAME |
>                 ALLOCINFO_FILTER_MASK_FUNCTION |
>                 ALLOCINFO_FILTER_MASK_FILENAME |
>                 ALLOCINFO_FILTER_MASK_LINENO,
>         .fields =3D params.fields,
> };
>
> So to trace all allocations from an entire module, users have to combine
> ALLOCINFO_IOC_GET_AT, ALLOCINFO_IOC_GET_NEXT and ALLOCINFO_IOC_TOGGLE_TRA=
CE
> together.
>
> I have no strong objections if this is the intended design.
> That said, we should settle on the expected usage model up=E2=80=91front.

Hmm, I don't see why we should limit how users filter tags for
tracing. We should not enforce them to filter on all available
attributes. I think it's easy to fix by adding the filter mask to
allocinfo_toggle_traces.

>
> Having corresponding Documentation would also be quite helpful. That way =
when others
> ask how to work with this feature, we can point them to existing written =
material.
>
> https://elixir.bootlin.com/linux/v7.3-rc3/source/Documentation/mm/allocat=
ion-profiling.rst
>
> Thanks
> Best Regards
> Hao
>
> > Abhishek Bapat (4):
> >   alloc_tag: Add trace events for tracing allocations
> >   alloc_tag: Introduce IOCTLs to toggle allocation tracepoints
> >   alloc_tag: extend allocinfo_filter to support tracing queries
> >   alloc_tag: add a test for trace state toggle and filtering
> >
> >  MAINTAINERS                                   |   1 +
> >  include/linux/alloc_tag.h                     |  94 +++++++++---
> >  include/linux/codetag.h                       |   5 +-
> >  include/trace/events/alloc_tag.h              | 122 +++++++++++++++
> >  include/uapi/linux/alloc_tag.h                |  17 ++-
> >  mm/alloc_tag.c                                | 142 +++++++++++++++++-
> >  .../alloc_tag/allocinfo_ioctl_test.c          | 111 +++++++++++++-
> >  7 files changed, 462 insertions(+), 30 deletions(-)
> >  create mode 100644 include/trace/events/alloc_tag.h
> >
> >
> > base-commit: 8d61431ed2607386b427752505379536eb634ce8
