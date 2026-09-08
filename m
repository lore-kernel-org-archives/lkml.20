Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E86361670
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 17:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788888555; cv=pass; b=LeB2jffbZY1/1hr87qf8ZnjXBWy+JpXrF64/rCA+oOvjL6kcvppbh2YjY+/iZ5W+Qwnp2jXfBfzXQRvWGLDeciczkRjuSFMfo5Y0muPBsavu64+wJn8EUhgCGGqCMSm7Q2intiq6ZIRQrXC+czKaCj+Y7lPT+gnDr5jxZy6yq40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788888555; c=relaxed/simple;
	bh=TV5fg2vDNwOsjIsuoNOpfutnb5SXppBqOtK/HP2PzCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rb2OYsNJK8MB9lenBzySEbgE3i5Yw8vdZT6AtyMFYfzb1tPHp0/GsEkIAZgOYsGT9BwhvK0fR5Qu6eHSwnQGAN7FjlUKax+SAipuXwOYT00YnA9kZRAcFJN6XVrcR5yUHeK6Pmw/JbuXQp0VMwCiaGIHoLA4OoLqlWFaKqLhtfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dLkJwBXh; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dLkJwBXh"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530411c7ee1so668751cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 10:29:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788888553; cv=none;
        d=google.com; s=arc-20260327;
        b=MfYxSkV8NhifBA7PdpcFBa74slhhd7/npiKyV3bJZxNxtjaPEKdxD0ZzLcJTTq9M61
         NjvSJ1ab+JXRgkr5k00gkSkb2b5TxL4pUA/UUvpLgoWM9Ng7s/AZsG9OeYF3TIcAe2TI
         l8gDLlVqnzrOFgf8g2PEyBo1CIEpp4+wBFaiO30h8VRzITyzpCt/SQK4yeEGfxpHCSoA
         A41ftuYWkcGRbDJKfnRTg6VCo3eqj+IvC8QxD8iRavbYW9gASBpru241tJN9FvUxr6RG
         43kcz7kOTtpb1UVScEgZjZA/7l8DQdkoqHsCqBtvSyXtMRqvVdRNGllRaECEaprSfhXy
         s3Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TV5fg2vDNwOsjIsuoNOpfutnb5SXppBqOtK/HP2PzCs=;
        fh=SkrG57OpWr/8hl8GXzRQAiCoakiwN3+4CVVNeLAr3Hc=;
        b=rRkNQYSGrGKZc6XjouERscSseePqjpu60F06UFT4ogo0jeUA947O1Iue7/MFAX2zQy
         f03HEgbSWM1VFH+AJYjxNp8I9Hy8AN7w2COCZEGljuRwlzDW5ripZ/6z7ECerYfazC/S
         R5yb1wQw/RN0Txhq421/N+fF5FiUGj1NoTZ6mC8Dafu0wbqjIybDTilkzRonf0H+IbGw
         tZa/lzrJfjoNJ7Lw8nF1QCuQaCkTI6sjTbTco6cT0gZp/Iwzs/TOwAv41ujRgz6RzWjU
         xhZ2lLXsAeuPIvK/QLMBsW2j7KdesXThv6P5w9SICyW2teHVWtSO0GteZCzvqmkKSkUc
         VYVw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788888553; x=1789493353; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TV5fg2vDNwOsjIsuoNOpfutnb5SXppBqOtK/HP2PzCs=;
        b=dLkJwBXhFfEok9Q0f5uB6Yr6USbLD7Gn6dXZN8VCmhwYIaNXjxGbdy+VgD0U186HVi
         ykmW+QzSfbrcT9do9TV/e5kufvSL601ojROJRglZdlRPr+Gfm7IHHjLVc8HDn4es9ED1
         Xp/rLz46mJgjkSDhARpgWcIoKesKmi5G30SRUf+0dtivINIl1BHomBFdCY0ZTHwQMsRU
         zuOBZBT75emukCf5nkiSoa0FvGQOmxE/iWV3Sw3ZzdgNHVDXTMn8c0fNbBsSEbws4lEk
         vyqa4LFgJcm5kvta2t6w62sWM0ZfVt7Wbl8BlCbmTBEnxZmhsQHXGZY1m8Wt+FNaxOVc
         wxPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788888553; x=1789493353;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TV5fg2vDNwOsjIsuoNOpfutnb5SXppBqOtK/HP2PzCs=;
        b=LF++5IdAOn1p3PHPJbArtzvxUJpzZ8ty4lz1+1w3Gy2gqruDAOFwqpAjTctF4Uh3r7
         MWiBVEGRZ40tjX7SwvEhIRm6NmBxmxwjaFc17msIHCfiZtmWqadkWp5MGIvm1I9/uN1Y
         FcgDWdACkSfoUvEwBrZKEQ2pO57VOo3+gJKuuF8jnp3bRZaT8HBNdaYhXh6nnXcYCCLW
         dcn5RelBcGqEx4LFRBLveYavCoH332OscEtThFrMQr6LNT9YEoDU7cmVogodY+8g4ei5
         1e1cYJfoDeksxV1/HDBWid43QD0y5RLiFJqzrLuBfbDztaiGra/U5l5cTL/5S+Kc2cpQ
         2RWw==
X-Forwarded-Encrypted: i=1; AKwUvBzPzPwy2Q+QnanD0v5a4+0f9f1sizBrg6lyNpYK6HuG3JSmH0kxeFyvugW8cHN86PNG1fxQeOZrFngY5Js=@vger.kernel.org
X-Gm-Message-State: AFuF++mo0b16avqhRQ8Q0D4EBzPkmHAn+lETG8UIKUR7eZCZzl9/k2wf
	6040W9DoMX3gpxEUlpVjseywb1wABwjElhUddUfAJNUHdrE4s6zpc2synQmtoHYqrGcZG0Y/vD4
	AqjcxEqUcBNMSq1L/0wVyrkFZnBNx/uHbJ60dJdaz
X-Gm-Gg: AYBFou1ODt0mS2lGQaf/YHjFdy4rHw6RgCRKkvI3Mb1d47n/1EJT7VzAlyyvKNpUjJT
	hZyzmBEgRCa4f2VxpqTx6aQLTnivT3PoJkKAJhR2CcaB2C7l39jw3wDHt9F4WQ8Y8mS70IifoUk
	iICr0npsPdxh1b/NWBiWc22xiY5jBX1o8pvMqLH14Fas8bXSW/ktg33bqgN0vOpHY/Kfzw36L4s
	fZkrOKrCLaU4q4sO2tWK+AMzIPhXqhFlvfJzmV/bgZTdAaIGnRMUTN55QT86Yb/lBQXDQEL5ylp
	r4ddN934u61Cyh3sJkRG69qLP31Yszb/6BIi/voG5aw3t7fEfiWLeNB0IPRbouUsTIV8xQVmeZ8
	=
X-Received: by 2002:a05:622a:1b17:b0:519:b82d:fe62 with SMTP id
 d75a77b69052e-530a3b7c7e8mr1827921cf.7.1788888547684; Tue, 08 Sep 2026
 10:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906-perf-gtk2-v7-0-1ece839fbca0@gmail.com>
 <CAADnVQLrga+tx0QCUkviGHqbk9Q6a7bmk3oAe51ZrLhQgRaw5Q@mail.gmail.com> <CAEdQ38EMGjp5RbvZn_RStu1=OOS3H+VT8xHFdnEaVC+dof7Thw@mail.gmail.com>
In-Reply-To: <CAEdQ38EMGjp5RbvZn_RStu1=OOS3H+VT8xHFdnEaVC+dof7Thw@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 10:28:56 -0700
X-Gm-Features: AcwNN1U0pzsDB7Ni4zxKoMakrdxYWC_p3L8TNTCtZOf0qYoAAkhxK8NQXfMaReU
Message-ID: <CAP-5=fWjxnoUxSHwrO3aQ=QPdz2zmjiE1kZZgj4o-eXYCx7Qdg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] perf tools: port UI from GTK2 to GTK4
To: Matt Turner <mattst88@gmail.com>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	"linux-perf-use." <linux-perf-users@vger.kernel.org>, bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 2:05=E2=80=AFPM Matt Turner <mattst88@gmail.com> wro=
te:
>
> On Sun, Sep 6, 2026 at 4:59=E2=80=AFPM Alexei Starovoitov
> <alexei.starovoitov@gmail.com> wrote:
> >
> > On Sun, Sep 6, 2026 at 1:13=E2=80=AFPM Matt Turner <mattst88@gmail.com>=
 wrote:
> > >
> > > GTK2 is long dead upstream and increasingly hard to keep building on
> > > current distros. This series ports perf's GTK-based report browser to
> > > GTK4 and fixes it up so it's actually loadable at runtime after the
> > > port.
> > >
> > > Patch 1 does the mechanical port (build system, widget API changes),
> > > including the leftover-GTK2-call and signal-handling fixes that were =
a
> > > separate patch 3 in v4. Patch 2 fixes a runtime issue found after the
> > > port that prevented the browser from loading. Patch 3 fixes two stack
> > > buffer overflows in the hierarchy view that predate the port.
> > >
> > > Signed-off-by: Matt Turner <mattst88@gmail.com>
> > > ---
> > > Changes in v7:
> >
> > Matt, please stop the spam.
> > Wait for humans to reply before respinning.
> > 7 revisions in one day is way too much.
>
> My apologies. I figured it would actually save humans time if I went
> ahead and addressed all the sashiko-generated feedback. Dunno.
>
> Is there a way to get feedback from sashiko without mailing the public li=
st?

TL;DR: drop bpf from the to/cc list when sending patches. This work is
most interesting to linux-perf-users where multiple versions of a
patch series within a short period of time are common.

I appreciate having the latest patches to review. If Sashiko provides
feedback, the change goes on my 'to be reviewed later' pile, which
hinders getting code/fixes landed.
It is possible to configure Sashiko to 'embargo' its feedback for a
set number of hours. Networking does this, and it can be frustrating
when you must wait for a patch to receive review before landing it. It
also slows down developers.

Sashiko isn't adopted on all mailing lists, and while it is a widely
praised, others don't want the email churn. In a year or so, when the
models are better, I imagine the churn will decrease as:
1) If AI is used to create the code then it should be better able to
predict Sashiko-like issues,
2) Sashiko itself can report all problems, suggest changes, etc.
rather than its current drip drip of issues.

Thanks for the contribution!
Ian
