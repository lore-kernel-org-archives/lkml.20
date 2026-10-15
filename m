Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8337E5EB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 22:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102922; cv=pass; b=aIp6P0gqm85uDiwKYC+Q9GB9dVv7qDR9YmEa8wLqSdPTGlty4T+2l8kXTrXlML7/AEiIWM8sQfNS5S+F5ltr3sQPqPgeFKGZiLJcPmqAqBNk3DvyWs/9ZEq+qTcIy2Vlt8Kp+fZobkfczpWYWOu5nUbAJPPvKXawu+NNmd72RwU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102922; c=relaxed/simple;
	bh=KkikMvxH3rj0L/VOvDtY/bRGTj4Z8RjW0M+5LNXlXjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t5kF64MCH8S6f1b4nEGwk3HYJrcNWVlQKxtScmIKtPK7u9DD5epGL8TYsQ3jkyGI0zXQuucaQVuCbk186VzxMJ4TMc+zMZyYOAa1k1VG7nxDaEFL7ZQxq3gn2rlk4mQlHxP4uEf+0BYdKvSJXINoAXooRATPcqsEsZo4azjAEVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EHqFSQWq; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EHqFSQWq"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-535f598d126so52191cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 15:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792102920; cv=none;
        d=google.com; s=arc-20260327;
        b=gFJWwffrl5M6f2Zap5g0mmaZdJWBj/cBt5Pi1K/SxV0WpOCchUoP1hP+Uf4dLuXLcQ
         9fwCm8iR34nIqXQnv4iwiJnw/sC3iAS/DCz4JxVIcykykI/XmGtnYX8gw2FZlUYsJzz/
         mmemWBRnjozXZZ14SCyo6TFt9h0LV/f5O43BzuvG831QtxJD+v/6QsKHVTldZoZXLrAi
         8Bnp7NPjJJNMxVNIyZ82FK2MbOlft6RXS8IVlwgZV9KvWZPwaz5dt0//9lCBAu03/M2y
         +tMnv7lb5gD7YNfmPMizeQkBsxwc0gAfbAnnkeN33FTd9N2004UchdwmtA/sL0NiJ3rO
         g76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MBd6hEpKZ3r3K7vlYPpR9Slc2f6PtJ/lO71I2D8m3Vg=;
        fh=BYHwC8EFdSwW3AVfUmqc/MRJVumRhXnFLqJ24inVNbc=;
        b=FKRpmoiz15zJWIqChuSM/s1oeXwVCNnkETMuPqSglmAA9elS1KjKtpGGqwPJuUP4me
         RBb6GvQ4E55u5oAHlO6J/XvhZa4fQNv1IKtVHQBHrycF7iJEqD99A3BKHTfM3h0TH9kN
         xbsSIILo8iRb4YkQWF7ifO3rfOld9VOk39b8bmEJsLXwrTrleFf2HSKS07Jcsm7cOx/A
         B5jF5RVyVwN0g9EjEvYdGmtDfVPJMkYSh/TZNYj6RXAXDEABv8yk5uGZ86LAbnWNR/qW
         Gejh2Oev884mhdC8kWvO1E1oot3qSo82DXuXioSZvjiViNf2lbDkTHZXrNk9V4nmyCAL
         jJow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792102920; x=1792707720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MBd6hEpKZ3r3K7vlYPpR9Slc2f6PtJ/lO71I2D8m3Vg=;
        b=EHqFSQWqJpC5N2wLj90e/qttXm3uHg9Qatv/SYQQFuty/RQ8TMquFHe1ZNoM1NmorP
         nC7YKlgnHqDefg/SkiQDoKt1b1imjP6iaJfRuO7tGM0nrIoPzWjDWkkrX1SaV3YpDXnA
         KaxU527o0yW54qJ2z7VRj/uYJslWqZ7tIt2TtUyEGnNgU/7cIHMy2Jgql0s3QzmcyFn7
         zOW9hng2R2fn6ZX9boa//nNxZA8Ej95uLLkzSxbDhqf8qpQPbVg+y/Fko/lyIcSqmAUv
         B//QA7qb8fx6Uj+MmhL+SrcpRcryEAV3jE6YAvKaZitc3E045jpQaWD8uyyaN2NLRfgO
         4m9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792102920; x=1792707720;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MBd6hEpKZ3r3K7vlYPpR9Slc2f6PtJ/lO71I2D8m3Vg=;
        b=WwVmHpqnQAuHwt+srtZY/pKpE3huFxdDa9L79aoIR3nN4g/dUfdquMExSx5C0bVSr2
         VzzrIxPib1Mda7xoij+HvAbIyW5SNeThkcJGa/rH+KzjzPCSsQ8VFcaL7nc1S76+66tP
         6gQb5MtLS9lrkGuJCQUwO6GV4LWFMkD7xvLmemNtc9Qkh9beOSFR73RZg5psofY+HJ7s
         yOFCKHDQzPTpubjcjGX2lAmdYjMjdfra1VXTWotio9m1O3LYPPy/V200EUizq9/aGtbM
         MptTGPJwLK28/jCoubkC1W/vE3eq+t8hiOvR6tv5UKfuVegLqjRjwlaw1dQLOT+W1M7A
         tWig==
X-Forwarded-Encrypted: i=1; AKwUvBxbOUWxDoqgXMETu/dy7r/fHt3A9QZ5V1FnAGZwzbCZljhPB4FrpA0kXQ+ip6MoHGreikJ+PdMvplOoMEk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAgGyCDuDQ7ptsxv5OfIWRrQckNz7jalN8uVkz3r1VgRXAloQv
	azbDemi7+YZumsknXygLBVsIRVih8eIS8scERW54VSk0iiHl/cMDE4ZhYk+pEQYuPis9KnwtJ+c
	U5yNqHrNNMcSjlR8dn6tZWpNj6IP9dnl46/qsZPkKc5MxuziUFviaA/sr
X-Gm-Gg: AYBFou2ETzDXmiG38J+w07kwg7nf54CxJMmCYikVWXHP6gjB6lj2QhTQc2PVwbY7om8
	RanP8UcGWA/7yEo4TQfhXL41CNB6js7x3YrEkHRCcn+oJCQeV2naSOVvzAwW8kqzVUiPwASdOuX
	1+WZj3effgJdBbDvXpoSB8GPaIgcSlefdwY7UPvn1ym9FVlIFOoRkom0AyPX4vOX7DUOV9DyHjD
	ao3MVBytNbD/m1rhooZg8z2OubHX7GZssylZs9qP6N1dkvB0vT5KJHo/89hM2Owj+kdqLm4q7Zl
	9KnGh9eDmyZ10c+Es16ox0okgfSwRzvRuF7PhSnV02l8ekaVZHEuUxE=
X-Received: by 2002:ac8:5ace:0:b0:534:b7b2:634f with SMTP id
 d75a77b69052e-5362b38a8fbmr3075541cf.8.1792102919565; Thu, 15 Oct 2026
 15:21:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-14-yosry@kernel.org>
 <CALMp9eSV0ikZ8CDoah_vCKYFXEm5syYh_sCMQ8wXhGB0+E=vcg@mail.gmail.com> <CAO9r8zOUjXMvhmK7TBmgKkbs+JjFMEmcLgW589_N_smC6k-hrw@mail.gmail.com>
In-Reply-To: <CAO9r8zOUjXMvhmK7TBmgKkbs+JjFMEmcLgW589_N_smC6k-hrw@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Thu, 15 Oct 2026 15:21:44 -0700
X-Gm-Features: AclHuK9oby-Dpii1wjubWP9C6KcK5dMj-1Uqq3YqdbPUbcRMGTZKMun0ZwqmmKg
Message-ID: <CALMp9eQ_RJV4-+FKewTFdFacY=LJbn7Pd2T-ET_cDU+-HXHd7g@mail.gmail.com>
Subject: Re: [PATCH v3 13/27] KVM: nSVM: Add a placeholder ASID for L2
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 3:10=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Thu, Oct 15, 2026 at 2:55=E2=80=AFPM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > In preparation for introducing a separate ASID for L2, introduce a
> > > 'placeholder' ASID that is still the same as L1's ASID. This will
> > > facilitate future changes that need to distinguish L1 and L2's ASIDs,
> > > before actually using a different ASID for L1 and L2.
> > >
> > > On SEV VM migration, copy the new SEV ASID into asid02 and vmcb02, in
> > > case nested was already initialized on the destination vCPU before
> > > migration.
> > >
> > > No functional change intended.
> > >
> > > Signed-off-by: Yosry Ahmed <yosry@kernel.org>
> > > ---
> > >  arch/x86/kvm/svm/nested.c | 5 +++--
> > >  arch/x86/kvm/svm/sev.c    | 9 +++++++++
> > >  arch/x86/kvm/svm/svm.h    | 2 ++
> > >  3 files changed, 14 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> > > index bfb297b7d71ab..780132725bb79 100644
> > > --- a/arch/x86/kvm/svm/nested.c
> > > +++ b/arch/x86/kvm/svm/nested.c
> > > @@ -701,7 +701,6 @@ static void nested_svm_transition_tlb_flush(struc=
t kvm_vcpu *vcpu)
> > >          *  - Honor L1's request to flush an ASID on nested VMRUN
> > >          *  - Sync nested NPT MMU on VMRUN that flushes L2's ASID[*]
> > >          *  - Don't crush a pending TLB flush in vmcb02 on nested VMR=
UN
> > > -        *  - Flush L1's ASID on KVM_REQ_TLB_FLUSH_GUEST
> >
> > Um...How does this patch either do this TODO or render it moot?
>
> L1 now has a separate ASID from L2, and it's the one we're already
> flushing with KVM_REQ_TLB_FLUSH_GUEST. It's kinda already moot because
> we already flush L1's ASID on KVM_REQ_TLB_FLUSH_GUEST.. or maybe it's
> actually *wrong* because KVM_REQ_TLB_FLUSH_GUEST needs to flush the
> current ASID, not always L1's ASID.
>
> I can drop it separately if that helps.

You could just explain it in the commit message.
