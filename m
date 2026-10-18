Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B05347604F
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322804; cv=pass; b=X1fY4HYcDLT/mtWybAJcrhgUcnYE7LhwyrczYqGKzZW3w1XzlWvYWLrdskI9NZOcu9xAAJBWocW4Lbtm1Ymn9IYGhlXBozVQO74p3cfYoELGCLCLJhiZfn2IjAKZF/++74khGs/ukHY6c7ximUJlWLhWkBmiBXibYGFVcu+9WCo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322804; c=relaxed/simple;
	bh=wuAeFFNq2fdrOzbi1+GSIoTO7DxjWt2Y01i92TMnYGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cHkDsgMxniael4GD2prjuajWNUzoqzysn2djDEzvzEB7uXOtVV77zqrqe3/MU8YLhG8jRTlW5tAyEhAMvQ9oD/FVGm9Hhj8DWWDzpVQFOXnk0gbn0UpSZEoHCcSFHK6nkSKpoOCJipg7DjE/m06SWn5afxW0l3uBWzzI30YUks0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFxlHW3T; arc=pass smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFxlHW3T"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-8a83d2706fdso7962497b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792322802; cv=none;
        d=google.com; s=arc-20260327;
        b=bl4FtK3gT1NcM8UuSzikrNavj5eb4Uo2tKVh99bavNvfmZd8G6DGqRuXN4uE6QdhyL
         8wJjeX1qJGV0qvpD1Ljp0i2YQz9+Cju6WOpsp9tEAekLmiCSJcoKizxvR9ataJF7MRYg
         LLz3Hu2c/DRVH8lMr244gOaiEFxu01GjKwi9ZF9FbHrcpUyUz4fPeftepASXiTehpQPj
         AWpIK1FCE4qO78DMuSMEMMkt3Flv/SlsZ7SHHxWnohmOB1qDNqb+M+y2kHPhtLC7Hu2l
         mZ4jEiuTaerdqd+M70Lj4KN7ybL6Px++FCOmyVl3Y7+2E2wl+g4X4udHYB0CBzjMCdw1
         S7tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NhzoLDMF9fIYZAWZHTa2hSuGikJ44i2nkFzcvTVosrg=;
        fh=A44YWjHDQXJTnBogmx9ndyU2t73bauCyEFEB+mVU5qw=;
        b=QAdvGfNA1EG9IjuY6A28WN8ep3FADRXMm3Y1/BJ0elxbGC5E7bDnynSzHd03AG/4pD
         WezIpW2fbnu/FxDK+2NxyHDXJtdPYcU8AqYoMxP17xtawFJNO1Ch6khhwh71hByJaKHT
         hYNzfcz08ekwY2WeXgWVCPJyYePbbPgOkEbwbMESxhego4Lgo1JVsM0eM06Jy4YKRJf6
         WGS37QC5JeG6inOvVNipMlV9uhUqa2PjPjzChRagpRL8yw2eqQiegKQr9/1y7ot7wlIK
         ALpnmr3IgwZYHdfHHnetS/U2dl+uYtAmOMtMq3PtuCXp9fGn99QFY3iR2KdS1xucjrr+
         lxRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792322802; x=1792927602; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NhzoLDMF9fIYZAWZHTa2hSuGikJ44i2nkFzcvTVosrg=;
        b=iFxlHW3TegqwCeXH0GL2mApRaEGCFmoby46yjmbwQ2gm/9ZjqsNMf9sLawiK302zt0
         szSj7wFeeJHf7+BUnNl1JFKyQHPbayuvQplA92TSyVvXv7LNTQCpHC8x/VsxvCwurCQM
         LFsJ5ztgVCGIA0JYqsNFRLH21iy2uZ7ToVmPq8CPJ3ClIPiCH8PPdVU3Xd7DMFeKexW1
         xUHTyTqATBAfr8qgdNCytW9arplqm1esraXTRFDqoUomPpSYvPgH91F6cKphZ9Ntw1pX
         hy5vYd76zRs6kOI2IrmSkHrvlpbKvNG24cZYIcVnrWvx7TXjmRFL9GWxbTvvX2w2248R
         Ga8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322802; x=1792927602;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NhzoLDMF9fIYZAWZHTa2hSuGikJ44i2nkFzcvTVosrg=;
        b=OiTU6IyMFgDyaiiGzvW+wK03/NiBURh6l9XwS35FkQvHFWM6wdqj4YKnrjFONAOK8Y
         I7tkA1tqVUxSqd+73hPCWOqkEN9ZyL7aPUOsBNPZ2chKClHqGsTpw+qRyZiy+WaUBevJ
         dHOYgyU1DqLGX0QaP1QNFcubUUgQ6g/JB7W+x0xozNwRJYJVOxVbDvHnr/jK8tiyTPlO
         SY9AYRJCCvX0l7e7ZjE9nHTANCEDCvdX6vQ1KeMEABEdQNogThaW71IFhsT4SG11EFI6
         cSHuVaFWcHnq2/8h93Grht8jYAENqdrk7A3QeEom7+Ky+sdfNZONU6d6If/kmvuKU+00
         Xffw==
X-Forwarded-Encrypted: i=1; AKwUvBzUalaMXUvbLzijBfKKaUHn7cQYGH5zsDHtT20W+2u1wnALUKzZzGxxNwzQzs64SuhPBmRvjQgEgobnfDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF7DJGAn1dmnprC/agkB7slrmLwxqi5/3rZYlT4iiSsuwBI0j0
	VfSG0Ehjsrc087SHpei6AeFxLM4RHvSy3n3/wbPcbreJdA7KTIbxQEaJWog8PH1B/GhpjeE5zc8
	ycmWqrPyisS7SrGMpzZMkl6GnQIFmgJW6+zxaL1g=
X-Gm-Gg: AYBFou1x6f3BzsXJLkzWN0ev4Dx4lyboaA9SqC7alvs5L5avcMF+lnPgjG77vADWTl0
	P2VzURcYsQvWV82hmeedHy/KU/Mw6pUA0v5z9USd6cyRl/S5C3hWjEbpF8x5Mrlx0WxTX4HyJBT
	rzLqXlBd2DiPJ6KwLno/D381jBJhg/73T2PoKj4cuteTszun55HjZJYhQCctq3GAJc23BPCuYQI
	GKwYCzQQVpZKi1y9tvRfPqUrT/SDyAyUNIBVTLjWqeKFAXPDEkusjo6JDaKsYrSNq7hWyDYrSNk
	P67BclVtfVM9nSpr7qt47FkbCvULO31QXc0BQ4V/nhZu6DO+rjFMoMGdJg1zqlCpFQ==
X-Received: by 2002:a05:690c:61c4:b0:8ab:43f7:f058 with SMTP id
 00721157ae682-8b0f220ed99mr12799007b3.107.1792322802028; Sun, 18 Oct 2026
 04:26:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-tlb_tracepoint-v4-1-f238a2bd8f7e@gmail.com>
 <20261016103846.73ff2980@gandalf.local.home> <CALsPMBMeXHd1TN89bHCtS3G0M8MFiimf8w=qKayxuYCad8v_Gw@mail.gmail.com>
In-Reply-To: <CALsPMBMeXHd1TN89bHCtS3G0M8MFiimf8w=qKayxuYCad8v_Gw@mail.gmail.com>
From: Roman Storozhenko <romeusmeister@gmail.com>
Date: Sun, 18 Oct 2026 13:26:31 +0200
X-Gm-Features: AclHuK_Bu-XBvleBAPZGj2NXrLZoPlWgyD8jpOn4PYJbzTp9oCFNZXr4st981AQ
Message-ID: <CALsPMBN6dii8mQNf=fxwBhcBGvs_Xr+7_fr=F3GTtp5Rwi8xGQ@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: mm: Trace TLB flush requests
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jisheng Zhang <jszhang@kernel.org>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 4:03=E2=80=AFPM Roman Storozhenko
<romeusmeister@gmail.com> wrote:
>
> On Fri, Oct 16, 2026 at 4:38=E2=80=AFPM Steven Rostedt <rostedt@goodmis.o=
rg> wrote:
> >
> >
> > [
> >   I realized I replied to v2 and not v4 as the thread of v2 pushed that=
 to
> >   the top. I'll repeat my statement here too.
> > ]
> >
> > On Thu, 15 Oct 2026 19:32:34 +0200
> > Roman 'Hedin' Storozhenko <romeusmeister@gmail.com> wrote:
> >
> > > diff --git a/include/trace/events/riscv_tlb.h b/include/trace/events/=
riscv_tlb.h
> >
> > Please do not put architecture specific events in include/trace.
> >
> > They belong in the architecture.
> >
> > See the example code in samples/trace_events/trace-events-sample.[ch]
> > as well as the Makefile there on how to put trace events in directories
> > outside of include/trace/
> >
> > Thanks,
> >
> > -- Steve
> >
>
> Hi Steve,
>
> Thanks for the review.
>
> I've moved the trace event definition to
> arch/riscv/include/asm/riscv_tlb.h in v5, following the existing
> RISC-V tracepoint convention.
>
> The updated patch is available here:
> https://lore.kernel.org/linux-riscv/20261017-tlb_tracepoint-v5-1-256fb539=
3a7f@gmail.com/
>
> Thanks for pointing this out.

Hi Steve,

A quick update: I've posted v6 with an additional fix for
the alignment of the dynamically stored CPU mask.

The trace event definition remains under
arch/riscv/include/asm/riscv_tlb.h, as in v5.

The updated patch is available here:

https://lore.kernel.org/linux-riscv/20261018-tlb_tracepoint-v6-1-1447642787=
0f@gmail.com/T/#u

> --
> Kind regards,
> Roman 'Hedin' Storozhenko

--=20
Kind regards,
Roman 'Hedin' Storozhenko
