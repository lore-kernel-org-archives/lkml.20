Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F9A3BE16E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 03:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788492633; cv=pass; b=mNIBHdDjEo4Px658fZMNy24FKIZK5CFkygl23ZYz2DYSAj4wuNw0HH2aY5LOFlHwYHUdWTLaT8lHPcbHrgQPPZoYyO/cmtcJPLPNofzXg99zAu2FjkywcDbOyd5auYu8pcOIUVkafcdkMAXSBwtChQ2BIxfmCsBhpkO/QY52xJg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788492633; c=relaxed/simple;
	bh=89OZ28yLXrgIx5/x+Z6isXYU+LEYVlikGayjBJlRd0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MquSGRVI5SW1W+dT7rPlIx9LcL51AyvnTPzwSbDeVLabQX2DPFpMwEvGHALb4uANOXweUn01EkymEV0B+ApV9v0QL2DMsi7F59chAsVLBlLzjjV0TjEldBgwNL8yfi5QQ8oF9ncFjTQ0edRNn1pGAjyh6dLx330k7VoW8ucE9X8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DScELcuC; arc=pass smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DScELcuC"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-84f3ab8750cso435215b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 20:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788492631; cv=none;
        d=google.com; s=arc-20260327;
        b=TzgEAlbalJgH1WgbayzdOgn/CnMz+7TeeW7vdiH+y0Y97UEJ3WMM6GKDJ0p91FGdUi
         QCYg0zLqcyaoOpDSvGVbGz2V+LkTDUUHEIJIJxTHQbOFFd5cALmAAxj1OQVgz1BrFK0b
         Plx9wWxheMA78/vb7ACRmzXKd44E1+VkWuRFvk4FfjTFpvrgxLsqXB9ErO9N66bk8imw
         G2DqAgb1w7zGyXvYz0MUm+v10n9cP4+sloHhiVUchLqzPx/KTUlEvYlTxFKELpIJsmGH
         QFz2J3LXyy3s2bnvjsqtBu6MIBt31yHIyz+9T3j8k9PorkM8mH/qlmk5xo9cCi9oKXRT
         1HiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=89OZ28yLXrgIx5/x+Z6isXYU+LEYVlikGayjBJlRd0o=;
        fh=SxfT17pEhuWP2UMEg4k0CzhQqXDlV6OdGnyce1liMi4=;
        b=GrGesZQtBUOpe10nqrXuzsfcIeGtgM8nKSi1e8RKRNgG0ZjOQonUmeQ0QmixE5TQDv
         UlrEWqupEqUvcgTvrYBd8x6W1eAExQRxNEcfNUTqoQiLfYKLyHsfPQ6WZZ/AZjuy2bb6
         VW3gL3FoEVZ5KXHVjtLdCcNt0oYfcmF6RAfV9LDrDprW0xkoyZWvugUpMe/tdirtUO4p
         xzt5LCHLU/HCofAHASptlRaHxEXL2UwNm5U/LXsHXkQWnhi7guDleAHHl38taGgumUhc
         +xMciR3qZonIKVqQ3zxN6LLF3ttxhIXqp1hZTqtbKYJOCJrQII5G5HQoq/k0WXe+VozG
         i9rA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788492631; x=1789097431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=89OZ28yLXrgIx5/x+Z6isXYU+LEYVlikGayjBJlRd0o=;
        b=DScELcuCtb9njzxK1FBbOSv40paWPLLE1GjOOkMorvsNbq84XSpo7TZu9tzsRDFEfd
         m4SnWnVQYv0Qv73p9Zts2mnoDB1GQmzVgnH7XAzwGZ5+r4MEY9jys8kRFkhkHeS++nVb
         fzRxtWsZqIDZ6E4vCoeBLXQWdM6R0mmarOqSgy1LofWrnJeqprtr3sVfzGUJeKFUWCB8
         etZt294N1SZHavEsg1D04JvYSX/vQ5FcXoT+f8S6PHe1hy/ZXTQyacttti+ddHRYz0DM
         tOx2Yo5D+RnJAV8dfsiFyk6Ia9D4eKhLmlgy7wG9fN6g7VfdY4RKJK5fqyYh+aozjMw7
         hfRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788492631; x=1789097431;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=89OZ28yLXrgIx5/x+Z6isXYU+LEYVlikGayjBJlRd0o=;
        b=gF3YTcL+4jT+k3MkFoobggKrI0qXrx1oXKzqYBA1/dIa2ubKOB+4/Y68iQjDesEQ9/
         2IIiXTqCoA4d5UM0r9/Zj1es92KfR3VlPQartG0FGLQov6A/2bRDQGlszNRIM5YBG/Ln
         ilKi6nzpB3DjMkp+uQ3atnFX1VzPSoCfk8oAv5k4DnQ912kps+8OkkBMt9G4gIXjRFCl
         SwT40h0BbxmKKSavc5UhKKe7fVFW/cmB5AeV78sE48HICkknU29o7Ll46JFuIfjOK4yH
         scaiaWPC5ICsygMV5iQFtGpplL4nn0g/3zmxopWyJKz4dgXEfu8v8MNvn9cfG8i+3V6F
         yYaQ==
X-Forwarded-Encrypted: i=1; AKwUvByktblZfGoNB2973Nue1Lcn6D5Vp/+f7BwFVFDZgGAgZn8GnRnoFvvFDAZF+ZN/oU1L9Lm51PV+qgCQQ+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++mdoXMnj+pCBACtBYg3VLjkfRhgkDL4qTXIImQytzJP3K3K/Hsq
	E3F8/krK03hs8nzzjQswsSARA7I5ldrrG3ks7o/qWUm++APyCeDjqqE46rGATgLWHTCR49lnhHU
	oYMglk9POPj5CEXsaj41+ZUbFWTHyGSU=
X-Gm-Gg: AYBFou3wMUHa5Uz4dPUihSkG3F/WUizVaBC4MxbjYUKgmr2bYC/d1zppf0v8RZcNa/V
	TMoq6jCxtixQMB2B1pRUNnclb1VmrjDLZgJDJPaRc833JhsswWUBk21Hv1dUZWB0ptfaF8Oy7iF
	KPe109hzr4Lk+qzcCf83UYaRRoZaB+eUNdZxzVqRV5/raxss2baqg/xarLZ1wFK/BrbQNXcQOct
	nWJNkGsX6YfVIKHHg7qP9wfB8mFRNwf55v3v9SU1tca3ArsASGPHPG4Xx372V+iTxt7BURxLATn
	L6iTaEn92T8R8wxiBB/yhgNvVoszMWpS6gT76Ps7ia+Bk/ZmBLQClWlKKjXnS1oY9eB2NHa0J4H
	jg81Fu62fq44bphyAJsSJ6QAoYK9ykTROJh7qb2M=
X-Received: by 2002:a05:6a20:e607:b0:3d3:adbf:777f with SMTP id
 adf61e73a8af0-3da3a16a54cmr4369460637.20.1788492631017; Thu, 03 Sep 2026
 20:30:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831090524.106845-1-gmonaco@redhat.com> <87se3sakgi.fsf@yellow.woof>
 <df6e9168cb06c35e21db7f9d17cfbca6bd87005b.camel@redhat.com>
 <DL5B40CU17WD.3KD75URQZ6RRR@gmail.com> <eb3dd8158942d663ec8ad4c529eacd666c5f96d9.camel@redhat.com>
 <20260903090211.50d15220@gandalf.local.home>
In-Reply-To: <20260903090211.50d15220@gandalf.local.home>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 3 Sep 2026 20:30:19 -0700
X-Gm-Features: AcwNN1WyvVt58Liz16r7F9vxR4fcT-OGFxVmu7RBiJk3u4EIptgNFRgcOxI3zUE
Message-ID: <CAADnVQK8e1Qp9rf1zThZxb3vr4Gc_bpo0nqpEO2LdnEwHdKokA@mail.gmail.com>
Subject: Re: [RFC PATCH 00/20] rv: Add support for BPF monitors
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Gabriele Monaco <gmonaco@redhat.com>, Nam Cao <namcao@linutronix.de>, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-trace-kernel <linux-trace-kernel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	Wen Yang <wen.yang@linux.dev>, Tobias Schaffner <tobias.schaffner@siemens.com>, 
	Viktor Malik <vmalik@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 6:01=E2=80=AFAM Steven Rostedt <rostedt@goodmis.org>=
 wrote:
>
> On Thu, 03 Sep 2026 09:21:18 +0200
> Gabriele Monaco <gmonaco@redhat.com> wrote:
>
> > On Wed, 2026-09-02 at 18:57 -0700, Alexei Starovoitov wrote:
> > > I don't think bpf fits here. I haven't seen active use of RV and even=
 less
> > > so of any request from people who want this kind of programmability.
> > >
> > > So Nack for now. Sorry.
> >
> > Thanks for your opinion, however it sounds a bit harsh to me.
> >
> > RV is clearly not a popular tool, but I wouldn't say it doesn't have ac=
tive use:
> > we're actively using it to validate the deadline scheduler/server chang=
es and it
> > already found a number of issues (e.g. [1], [2]).
> > The RTapp monitors are used to validate if userspace real-time applicat=
ions
> > interact with the kernel in the best way for predictability, as far as =
I'm aware
> > that's regularly used [3].
> >
> > In my eyes, the missing piece of RV is in fact this programmability. Ad=
ding a
> > monitor now requires to write in-tree built-in kernel code.
> >
> > There are strong use cases for domain-specific rules that aren't genera=
l enough
> > to belong in the kernel tree:
> > * stricter RTapp rules that may not apply to all use-cases
> > * verify some exotic system within Linux (e.g. a co-kernel [4])
> > * modelling for functional safety certification process (used for in-ve=
hicle
> > OSes like RHIVOS)
> >
> > BPF seems the natural tool for the job to me. Mind that RV monitors wou=
ld be
> > simple users of BPF, requiring only modifications in the RV subsystem b=
ut using
> > standard BPF facilities.
> >
>
> As RV would simply be a user of BPF and not modifying BPF infrastructure,
> I'm not so sure you have the jurisdiction to NAK it. It would be like me
> NAKing how you create a trace event.
>
> RV monitors are a very good way to make sure the system is preforming
> properly. This looks exactly like a perfect use case for using BPF instea=
d
> of having to install modules.
>
> Either BPF is a tool for the kernel or it isn't. You can't judge where BP=
F
> gets used. You can only judge on modifications to BFP.

Ok.
Please add
Nacked-by: Alexei Starovoitov <ast@kernel.org>

when you submit it to Linus.
Let him decide whether bpf maintainers have an authority
to say where bpf is used in the kernel.
