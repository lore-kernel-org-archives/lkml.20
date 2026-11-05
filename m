Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793838357;
	b=dniEUO6MtHme8U4GStq+gyRMk3/Tuu1rZliA1/Gr4fbEgtReRSlpK2yWoY3k56hSu8H2
	 8/+Lez5kPpWPZmw1+FLhbPOXnFoYReLwTRaIKNo2TrrIDwy9uS/AobRFE8GT5fcCUWoKb
	 iGrL5H2HT+XSZGsjwuW9nkuV22SKE0oV/OgtRuyalqmHpQcenkUguyG/dXPh65d3/T+kM
	 SIF9QvSO5va2iWSEOpc2hQ8loGVOGouwedDVZ5FEZUsVGDxMC+ATj+re1LLil1BGXrD6h
	 mKVjXnYLPnmbE+v3vF7kO1m68g6UlDBCcq7SerYyppUe1D7xKDIdeeDBk1OpYg+wteA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793838357;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=9xJPZil9brVxmY/ifi9xfR018LsF43MA5zg17UL7UkA=;
	b=E0GWpHBsSDdq6izqKj6whlwhqjSzrPZOcXMinWLoxAXgl3pkG4TLz913PIa3k9oRAyWp
	 sO7WXyJtEp7bqHqax/D+AtwWsmBvXQ5/TZCwTI9vacvxdToWr5FkK+8T1uVIQyyXZsTfZ
	 8G04kiyaTFeDwB+p7lt9Jhig+fGaMusO/BHP1PszpohZ039Hfk7b8CD5CTgaGnTK4izO7
	 pH0QrG0ZgfQ+1Ei1qZDSztcqIiHSNWucnbkM72sBxwFxVKnK6eB0rNLzYtN9XxwWSTEzu
	 qbmZDCOWrtrCO9JQo6ue7RGOMt+Awy7r16Hq7qNqtAe5coCbrErPwgedQ6FH8vkOKEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PMLUgNL1;
	arc=none smtp.remote-ip=209.85.210.199
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05C52606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05C52606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PMLUgNL1
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a086f5d91aso1910031b3a.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793838356; x=1794443156; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9xJPZil9brVxmY/ifi9xfR018LsF43MA5zg17UL7UkA=;
        b=PMLUgNL1dUmudPDpvtAPH2TTWxtNSP0FmllM7UZM2nnCiX92i9wXF6dmQXGeNrBzOl
         fI5NA0tJfFm44VDfuvUc7ZJye9sQBZ0tJ4fN/vgjUGc3wRQDIfpjNkmv/SL2EKXrNZNy
         5sjbEbvvuezc93+H2zYL3QlIrSYpTPJ0+rgoUuz24FqUnyTS1ZHucd1BItZo3PdMgQV/
         sqFzaK0XAjVka4qHEKYe8c1GYWue6tlb2HT6dJatJVce7Qb+PXr4c6O15GjWd02HdwgA
         uvool4PHIEjJtAzHYYeM5UitIx21g81fuT9JsVBFM0+7fscYuZmxU0rBNSCV+PvBhsb9
         1ybg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793838356; x=1794443156;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xJPZil9brVxmY/ifi9xfR018LsF43MA5zg17UL7UkA=;
        b=MSenyLgbAgp0Vg8WY42yRrpMxgMUjqJFOGcNf3ZwS7ly/epn2RUWHHQQhWeJ6UGomc
         p08wFgpSOci/TWaUSwsM6a12e6HKgPqI9hU99T5+FOa8xJ+FbY1+aN5fdtPSmJxr9jH9
         rwLgFtju/udkPCDb7z01SWi4mjMqDiOdCk/hMh7899sgLx06ItLXi7bi07KDuNbIJgUw
         xdTi3PXxnJIb3VnpGEeGKpdh3Qi+XZscAl9uQN3LbbPl0LdORJW6A8ndk/M8Li3+qn3A
         EQYKiV+26ufFmjDYksmMLRz+rF6Nfj3EaJ8tI/C5Bj89vRryyErcmHgBT21qlPjA3nO6
         q8bw==
X-Forwarded-Encrypted: i=1; AKwUvBwFFXtSVGmtAC/6r/27F2lJcsDPnKPDPED/WsGbmTsAlE8axnvaKXP0LoNioTk6CYxFAlhXUhfTxy0AgjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9csd/ParvCfOu70FWLfPRrTS7AbtdQTgeI8gZFfmYXj0kq04Xo
	vUSwS2oLmcOfJQQfITAfTyZ2vUoWoNYGlRp6J33UZrSdd+9i3Q3x0PmvRFIwCJnp+1S8feR7Xby
	DGy/m0A==
X-Received: from pfbbv15.prod.google.com ([2002:a05:6a00:414f:b0:88b:e728:b55f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:6de7:b0:89d:af47:905e
 with SMTP id d2e1a72fcca58-8a9bc34be56mr14519833b3a.25.1793838356026; Wed, 04
 Nov 2026 16:25:56 -0800 (PST)
Date: Wed, 4 Nov 2026 16:25:55 -0800
In-Reply-To: <CALMp9eRU6G-spTgzkKdh6E=U7omQsFDM_2nH4KEPZieg1e-zgQ@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020234535.3182385-1-jmattson@google.com> <20261020234535.3182385-3-jmattson@google.com>
 <auuZcZhBhrkZd9qM@google.com> <CALMp9eTpWP6XSYPJQjBwPsNWmPzLNh+EDGivMFZsUnixqpGkVA@mail.gmail.com>
 <CALMp9eRU6G-spTgzkKdh6E=U7omQsFDM_2nH4KEPZieg1e-zgQ@mail.gmail.com>
Message-ID: <auvNE28Xx7IF6Tes@google.com>
Subject: Re: [PATCH 2/4] KVM: VMX: Refresh LBR MSR intercepts on full MSR
 intercept recalc
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>, Like Xu <likexu@tencent.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 04, 2026, Jim Mattson wrote:
> On Wed, Nov 4, 2026 at 3:49=E2=80=AFPM Jim Mattson <jmattson@google.com> =
wrote:
> >
> > On Wed, Nov 4, 2026 at 12:45=E2=80=AFPM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Tue, Oct 20, 2026, Jim Mattson wrote:
> > > > Re-apply the LBR MSR intercepts in vmx_recalc_msr_intercepts() if t=
he
> > > > LBRs are currently passed through, so that changes to userspace MSR
> > > > filters are reflected in the MSR bitmap.  Unlike SVM, which can sim=
ply
> > > > rewrite the intercepts in either direction, leave the bitmap alone =
if
> > > > the LBRs aren't passed through, as a filter can only force intercep=
tion,
> > > > never prevent it, i.e. the bitmap is already correct.  Note, cleari=
ng
> > > > msr_passthrough to force vmx_passthrough_lbr_msrs() to re-apply the
> > > > intercepts on the next VM-Enter isn't an option, as doing so would
> > > > leave stale passthrough bits behind if the guest LBR event is no lo=
nger
> > > > active.
> > > >
> > > > vmx_recalc_msr_intercepts() is invoked in response to
> > > > KVM_REQ_RECALC_INTERCEPTS, which is raised on MSR filter updates, b=
ut it
> > > > skips the LBR MSRs, and vmx_enable_lbr_msrs_passthrough() does noth=
ing
> > > > if lbr_desc->msr_passthrough is already set.  If the LBR MSRs are p=
assed
> > > > through when userspace installs a filter that denies them, they rem=
ain
> > > > passed through, and the guest can access them without exiting to
> > > > userspace.  Conversely, if a filter forced interception when the gu=
est
> > > > LBR event became active, relaxing the filter leaves the MSRs needle=
ssly
> > > > intercepted.  Either way, the bitmap remains stale until the guest =
LBR
> > > > event is torn down and recreated.
> > > >
> > > > Only x2APIC MSRs are exempt from userspace filtering (see
> > > > kvm_msr_allowed() and the KVM_X86_SET_MSR_FILTER documentation), an=
d the
> > > > filter is honored when LBR passthrough is first enabled, so KVM's
> > > > behavior shouldn't depend on whether the filter is set before or af=
ter
> > > > the guest enables LBRs.  Drop the LBR MSRs from the comment claimin=
g
> > > > that they can't be filtered by userspace, and clarify that
> > > > lbr_desc.msr_passthrough tracks KVM's desired interception, which m=
ay
> > > > not match the MSR bitmap when userspace filters are in play.
> > > >
> > > > Fixes: 9254beaafd12 ("KVM: vmx/pmu: Reduce the overhead of LBR pass=
-through or cancellation")
> > > > Cc: stable@vger.kernel.org
> > >
> > > Meh, this isn't stable material.  Unlike SVM, where LBR virtualizatio=
n is tied
> > > to a pile of other crud, if userspace wants to filter LBRs on Intel i=
t should
> > > just not expose LBRs in the first place.
> >
> > The functionality is not equivalent. For whatever reason, MSR
> > filtering can be modified dynamically.
>=20
> Oh, and, duh, MSR filtering doesn't disallow the LBRs; it just
> reflects them to userspace.

Right, but how many real world deployments actually enable vLBR *and* want =
to
intercept accesses *and* want to do so dynamically?  This isn't a particula=
rly
dangerous change by any means, but sending things to stable@ does incur som=
e
amount of downstream work.  Unless there's an actual end user that's affect=
ed by
this flaw, I'd much prefer not to create more work.
