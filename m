Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4904B2CD3
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792016572; cv=pass; b=VL37EhWTlaTJCghbr+mCExM42zK/pfA40kz1zmTW3g7ybyHpOkyPOiQVQf8n8oXdJ4Qbl5MlE8EdO85MXF7VY/zEzb44V0YOqne3PDVjP7PcuDAZItc75Kb+UNOucqCOTh5cQrv6QlEDFacrg0bgL5Bnpon8LQMrwX04HpKy0cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792016572; c=relaxed/simple;
	bh=659rxB8qF0PyHFwmXrqMLBeNoOW89CSuZ4MILSiw6W0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSO+cRRRS4GtIQYVD/C3jEurDaJRvtloUE8bawqSPR3UP06K42taoFFH76Vs9Hs7N5JoVkI1x+ZrhS0HEbQadWmfgK50hQ4XgazQ2LNS0iLzyfi4BOiJ9Z3xox7y3jkGKXCsMoKe2t2nipc7kZdhLLEx252Byo/3y/xpUpUWFa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cByaM3ZQ; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cByaM3ZQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso527a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:22:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792016569; cv=none;
        d=google.com; s=arc-20260327;
        b=SF35vZtEs8Drs+OO9RM2x86MMw/OVL9QP1Gn2bx5w4wTGRoiF4grTH+rTxXBVK1hbL
         0avucq924Pj1OdjoK1m3lRZ8DOtRUy2VbIIgTm2dlJwlg6drnaYsy1iNmV6UhaRNJB1W
         whoiOuk/OJwckxNbqbbqlV5ScbgWBm2J+sTFQDvnPBwLSPITQpIe7e2gXo+c4VYiTHAS
         Ih9IkExBrAswi5cNhCs0Uf1gJNEmgQFNYHjhmr5bpL+QiKB2f0YqIJgwPrHQG5Jq3ELC
         jUyyeSNCrx7qHOzme7W7Dtn1u2+OET6AQ5BEp9jGMe2h1e1qt9uPHS6hL3l2cB5KPvGv
         Xt4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FL0U2r+nt0Qijvo9WgkBvBQ6bZzc2yB8WX2jx5CtVnA=;
        fh=UC2ModIIHQ+4DdY5EYPzlBvg5jxmwX2kwLoHo4H9iOA=;
        b=K4/RD78FLrmlOlC79p2sVSDIyP9ZJ1QQj2YdzaldPtpb0/QqwAnfUwEjPX6AMLoTiv
         9qochZwlMTj0yKQ34SpMyPfcwIzi/cMn7pSrKKGvQZvFP03ZDwStb+lWjsAzy9es9PT1
         OMrRMVz7ZClCVNIDXji9EAJ3GghEKylU5YlacXGdh2LsGsnBx60NvOnhHY0v+Uw0ZkJi
         PYDDZ9ALWxFu/MksGUtwGOFQOJ/Sz/Jci6ZSqoM/r9NCMlCTcYjLsnxLRTe50omllJQH
         lYJuAvslTEb+y5Aezbmjrgx69t555dI4ut+pobvZPgm+s4yZA5EviSuTqZxmZCuMLAPO
         CpZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792016569; x=1792621369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FL0U2r+nt0Qijvo9WgkBvBQ6bZzc2yB8WX2jx5CtVnA=;
        b=cByaM3ZQKKZfO3wW5WWAzXkPLQAbg4MBCC/BfRVwj7imgr5ZrCN8f7IoQIqLQduNBX
         7JX/B+hAk7cIhrBvgK/03UarLpisi4dunmgk2hfw1ckxzH80yvqyFrGQIkslLgYyCDFy
         a/KaHs4c7eYvuMiJpJ95w6LxvGYFfirNf4jhX8j7gyzMwOu2M8QJHCof1NB6eUU5n0j1
         lhgWRa7L6lyJDqntQMjmkvWhNr0+xUjJCy9JayQ4zgC91jJ1N+FyJcgdpsP+loRF5T75
         nTNVZr23Zr3ai/uTZZURcZyP08IDKfxoicS4bwd4tSQU8GpC1L4CG06qZQ0inl19ovnq
         YFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792016569; x=1792621369;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FL0U2r+nt0Qijvo9WgkBvBQ6bZzc2yB8WX2jx5CtVnA=;
        b=O9LpgpKifTeIqZR6D7A8cVYpjLtIpjXruv1irtIPTzomcEe13a6CBKg/JDtNjz2e6E
         zFIBqQlxVKynuojSX4rQfalabuO5yRKSHzHtPN9GlPN9a8Ko1oevzhRCUiAxCaQafMzO
         f5T16sJPgIDYMB3LyFgYHIrl9lFfiX3gqvZ2ecec/e011QWfVhL2V+woBwD7pVxxPqkF
         v6kPnTa+s9Ph2pUwIrWJXtzr3UCdTIonCbXQbM35c7lfIlEcvarInya8lsVWPpwVeboj
         5TYM6bm6aC6Ymydj/+72oosSZdHk7WkpSjV7Vp0SLrIh4WS0xzj6mz/fO4Cioz25RtDf
         ///Q==
X-Forwarded-Encrypted: i=1; AKwUvByw+/I2dz7/iM5hH8476haVzFh6DWqtzL63lRj2hicITYqcDqpljYfLxmeyJ/3Y+hMDUNSqGW8ycJbSxmQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9FZubKs8bNnEBeJ0Sl+LGuamaXAp4s6vtDMovKQZx4BEbMErG
	oBtvldRYoD5wMcCCzuz8WQscksXAd1xCwRapvNiujARsZhCWyY2rbx6p5pF4o/A+8XBvP4lwnF6
	OY8o7IdOLCrk5hwr4ITzKIMqy0EFI4ivfg16HqjfqtB1AfAFyHKtt2OlGGEE=
X-Gm-Gg: AYBFou2qBNg1c/P1M3YOb98aPqzHPsCOXE2P8/5ofIUcg7bLg1SYLkb9EVWI0jJoNfv
	Z7KQGQqYO5I+OjWV7SaQfXYWDfNMh/5i353n6GtPYP8KGluFjOsiPNjA3JDjUlw09TN6F6TMG3T
	4a8OeyYA2vZj/c10woBqTXKUehakH+Xh/t4UtAzvdS55j/BIzjKvKKuJWShlan+R3FPGPNC4tYL
	7c1PDSyakG5hCE1wt86waGgAOshinIaqZ8/qXJQFojnnO1ezfVXKSz43ympd2JtLq6wN3hBcTRp
	9GJ910yl9ZLAGbWgWdALmxRGhPlQgP919CpX+KWIhzj+5Us0FdMenjs=
X-Received: by 2002:aa7:d5c5:0:b0:6b1:b3bd:1576 with SMTP id
 4fb4d7f45d1cf-6b20aacf5d7mr30772a12.8.1792016568616; Wed, 14 Oct 2026
 15:22:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-6-yosry@kernel.org>
 <CALMp9eSWazT=0tXKvGb9UNWBv62di33QgugQHOa+Bo2sq0qUCQ@mail.gmail.com> <CAO9r8zPPR9LMtcwhH=D8gJLjmC6800mJdyV+nKT83TnMti7wJw@mail.gmail.com>
In-Reply-To: <CAO9r8zPPR9LMtcwhH=D8gJLjmC6800mJdyV+nKT83TnMti7wJw@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 14 Oct 2026 15:22:36 -0700
X-Gm-Features: AclHuK8zY_028QGyLFVl6ruOrvRrdz_5D5Cg9q6Chzm3VcD3FEl3g5nWoBYKnaE
Message-ID: <CALMp9eTyzxwjKnWXem=dAGiwJsUsArssQTcQhg56HVd+js5pSQ@mail.gmail.com>
Subject: Re: [PATCH v3 05/27] KVM: SVM: Add helpers to set/clear ASID flush in VMCB
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 3:03=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Oct 14, 2026 at 3:00=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > Introduce set/clear helpers to set tlb_ctl to
> > > TLB_CONTROL_FLUSH_ASID or TLB_CONTROL_DO_NOTHING. Incoming changes wi=
ll
> > > eliminate the use of TLB_CONTROL_FLUSH_ALL_ASID except as a fallback
> > > when FLUSHBYASID is not available, so the helpers will create a commo=
n
> > > path for this.
> >
> > No functional change intended? :)
> >
> > >
> > > Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> > > ---
> > >  arch/x86/kvm/svm/nested.c |  2 +-
> > >  arch/x86/kvm/svm/sev.c    |  2 +-
> > >  arch/x86/kvm/svm/svm.c    |  4 ++--
> > >  arch/x86/kvm/svm/svm.h    | 10 ++++++++++
> > >  4 files changed, 14 insertions(+), 4 deletions(-)
> > >
> > [ ... ]
> > > diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> > > index 6d0242966dc87..ba5077b9838c0 100644
> > > --- a/arch/x86/kvm/svm/svm.h
> > > +++ b/arch/x86/kvm/svm/svm.h
> > > @@ -480,6 +480,16 @@ static inline void vmcb_set_gpat(struct vmcb *vm=
cb, u64 data)
> > >         vmcb_mark_dirty(vmcb, VMCB_NPT);
> > >  }
> > >
> > > +static inline void vmcb_set_flush_asid(struct vmcb *vmcb)
> > > +{
> > > +       vmcb->control.tlb_ctl =3D TLB_CONTROL_FLUSH_ASID;
> > > +}
> > > +
> > > +static inline void vmcb_clr_flush_asid(struct vmcb *vmcb)
> >
> > The name of this function makes it sound like the inverse of
> > vmcb_set_flush_asid(), which it isn't. Maybe vmcb_clr_tlb_ctl()?
>
> Why not? vmcb_set_flush_asid() sets FLUSH_ASID and
> vmcb_clr_flush_asid() clears it, right?

Not exactly. The tlb_ctl field is not a boolean.

vmcb_set_flush_asid() sets tlb_ctl to 3 (flush current ASID).
vmcb_clr_flush_asid() sets tlb_ctl to 0 (do not flush).

Other legal values are 1 (flush entire TLB) and 7 (flush non-global
entries of current ASID).

And, in fact, these values were chosen so that older hardware would
see both 3 and 7 as "flush entire TLB."

So, it's a little more nuanced than set and clear "flush by ASID."

Maybe vmcb_set_flush_asid() and vmcb_set_flush_nothing()?
