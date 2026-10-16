Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8ABB3C10A9
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 19:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792179269; cv=pass; b=mQXFhzRIoA5EfPX4Z8J88btVFEYP5UKj6kgU5oCRY3e3nCQTrwFum7t3z/PqnCs/S+Vo8AHGEu1qjziBwyoP9OQs+RDEV2m4McRsNFQdRz4YY5fHuiVXzPStsNAnTZQBd58i5/pjrRK0j9wOSSGsmitf9hVv44VmZ6W9an0qibE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792179269; c=relaxed/simple;
	bh=uJFGFLzirY/vHBGqV0yRgabUC6JrYut6ZFglfLhuyZo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X6wsDasvVDHgTMY2BKArT+QHwZG3K0r4S/l63hboh0S4i9UOMsJ+cnf2w7PThHIQyxQjG/E7P+buq3pZilcD08mv7IYAGCZLlNUtJJQQ+qsf3LFNoEzlstuELRS/JtSYHYOTHU5yXo1jao226X6y9qSEtImzGAhpYZm9FPO1RdY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sLe0fX1R; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sLe0fX1R"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso48a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:34:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792179265; cv=none;
        d=google.com; s=arc-20260327;
        b=dKh7rATNTK1ob5n5yWL4rj9FguMR/TD3cuENiVqcxD8iCA1/RpfhxrepqZKJt6BtEt
         IXfFCqJxkDBTBrynN4ZO22vvAnA90TDzv3rAFAr2pJXDcfNX+QpUZCjgZ23YtTMnKvSe
         4azHwC8/KJpss8YcVmRHHJdG4ZQbtgOK96zT/z3RWsE20NsPG15yhKmEEY2WyV2Bv4I/
         it97gKQ0V427/7PJzUEbs1L5DkrdMcM2QTkp4efn83HpM+7Ft9xLB3mj0uD6qsESuoE5
         oOyX3OBfKVfKBCNJLBgixhhQKO5owfdWy65x/3EbXqvk3PU7hAvDRYm4z35WjewOUQOC
         MQHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XyqDYqvsBK9DCe2WChAIDKhJNBGuOpHFCMCEbXTik+E=;
        fh=bD9DuYIji7vEjMHA32Mit1XGTY9vTUyONh2kvGvh9y8=;
        b=OPLB1/XduHHD+oAj61lzxKLYbzGCaja6b0JUilbkaR1Icz77I/29Nd1sng7XAKnjh1
         wb7bQVmp42I1bFKsIeIK0OjcoBw4ZaQb6+slgyiT5gInVyXhQiYmG9bxLgu0dbv86wDb
         iGMtRGljo44HrhOshw9oPG+SW5Du6bjKHCB7wbIPBDDlwzOZHLA0BtFnD9IFhLLXy32P
         9ItFTATcFF8sYwpV65Ua2/fXR5sBeKccxyI0feARzy7/WwIGC0xLaWr2ijCnybPPyYAj
         bhiyWIOmsaD+HALlz5nJRKQ59cZKqvdCkmYLzde9IjRgLj0Zm2bSQAn9Dibo0H4S1fCQ
         Oqbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792179265; x=1792784065; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XyqDYqvsBK9DCe2WChAIDKhJNBGuOpHFCMCEbXTik+E=;
        b=sLe0fX1RT/tcPZmVprvWumTfrdWQvITCTBhFAsRB7d79PMqf7v4MQ/tU/Le+fVx6Px
         K0kj42Rqf8G3mtgaWGgycV11KkjkUieG/CUtnd2gvF1uXHySKrxxQqMH9FCeEleBKmYA
         mB2KVmRtLY7GJAa7sWyR+rAzBuQQI0EBe+sZtAaW+TkQ/cs+ow7eH2u2zPqFYuJS4cMN
         t9tlFgEiLeLN7qHM6XAUvXgDomgBjEzeFiUbkgjJLkafUQJwkCVpQrPhpV9EP5Mlcd4m
         vwUpB5zRL/xdfZFC0uC3TrS5OrzKztMuGrGb+Fhf4qay3XgpAEu5YVgWYYG0ixi1DNH0
         egoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792179265; x=1792784065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XyqDYqvsBK9DCe2WChAIDKhJNBGuOpHFCMCEbXTik+E=;
        b=20b1/g6ZVYRxEnbBx8Ix7PON5tcgPURf8BAVeuRI6+2D7sfJm/ROmNBadFsiKMIFmf
         0MEp0jX2R5cxUQ2TkbQL6eUqPZqlSbIro9o0Xm73/c7nilz9lwkLlqhTr5KTeOeFTl2g
         zucjO22AKkW47hUJ+x4JnGCd86r9ovNvf8mAizOS+RqWKHxVqrind8z6X/DFFi+cmHnY
         l8kkSa06B6+WUnnqsOtSpQdnSKN6v0BjLi1i86JTU5+qA3fvgLhAR+FV2a84Vb1DQoiZ
         pP1IKYuVatgn02vUuj30T3lmA5B4ysF4YqhszUs8uh4KEyaYGXBD9FBGgqb3xTyaLKU3
         1P5A==
X-Forwarded-Encrypted: i=1; AKwUvBxPjp/E/PtntjQBwjEhK5ZnCeK/l2lBfAJ8EIbgIu2618eBJYuSbii899IHjhy2Hk25bCPgzmQeGvt0XXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYL55tbFzMv1tc5x9Yze23cQWVmJQmWGhAuErtGAy+PUkTxq+beZ
	EIrXWKFUdLKNVGIWX2Y4g3NiDDJRFtvUYULasV0jFpEJ4wW/dn72aJU/Z4G4Vrs4x2LSpa5HSeK
	CpMxEtgIQN/zgXqB6RPh5DrLQpqX09exGsSeeknMh
X-Gm-Gg: AYBFou2HVaFf5gFUd0P3SLtbX8Sw8BLVFZ4RAfoBerTx2lNz3ZyP9mDfCKbO8Ihp4Aj
	M2zgxFdXqEz6sY+fRKC8X0qc5e6TfgOS+Gscmpwc2hks5jbB7VlSMPbiT24oB/o6uSr4cskvHh/
	K040hV33d2Q0OWktRr7CMjtoj3lPadbuQFrmQfseayipk4CzjxrFgRZeUHq+h6/JYWG3SSG45Oy
	WebPwHnJQoswAKPlooqnIJOwXWgnqQaCWE1n9MmND9uQXBirJAXqhTh4D84edhzfG7Wdtmk0s6T
	lsEbP0rGMn5nSEeXCFJurjXtymyRfdTqhdkGHN8Gro56JtB+hxWoAgU=
X-Received: by 2002:a05:6402:5177:b0:6b1:bce6:1220 with SMTP id
 4fb4d7f45d1cf-6b3a8c0a97dmr7268a12.12.1792179264501; Fri, 16 Oct 2026
 12:34:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-4-yosry@kernel.org>
 <CALMp9eT9xOFKSFnOg5OeXgmXV0pr-4-yJdBFFMORPx22BgHnHw@mail.gmail.com> <CAO9r8zMtrxJYN83_ht1wLfNrRvc_suLm7LyDhxZABQTBt-fN-w@mail.gmail.com>
In-Reply-To: <CAO9r8zMtrxJYN83_ht1wLfNrRvc_suLm7LyDhxZABQTBt-fN-w@mail.gmail.com>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 16 Oct 2026 12:34:12 -0700
X-Gm-Features: AclHuK8DdKpSponPWc_KxEn5sY4A6TFNT8lBSzHedmtJI_CHuTEi-RSJOFcs3_k
Message-ID: <CALMp9eTm1oR=uwoZfgHUF1d7rhH9PVJMZnmqxnNVA4t_bmpUyQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/27] KVM: VMX: Generalize VPID allocation to be vendor-neutral
To: Yosry Ahmed <yosry@kernel.org>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 1:38=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wrot=
e:
>
> On Wed, Oct 14, 2026 at 11:23=E2=80=AFAM Jim Mattson <jmattson@google.com=
> wrote:
> >
> > On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > > +static struct {
> > > +       spinlock_t      lock;
> > > +       unsigned long   *bitmap;
> > > +       unsigned int    nr;
> > > +} tlb_tags;
> >
> > Can we statically initialize this to avoid the call to spin_lock_init()=
?
> >
> > ... tlb_tags =3D {
> >         .lock =3D __SPIN_LOCK_UNLOCKED(tlb_tags.lock),
> > };
>
> The call to spin_lock_init() is less code, but I can make the change.
> I don't have a preference.

Your call.
