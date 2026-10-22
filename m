Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709067;
	b=Q5euomV0aR9Uatjvx9r8p4cgXMjYg4jSy5OTbT5Fp4+JvXv6KBU6jdM1PjapSAgFaT+6
	 K9M0vi4+HPcSYx5qvYlZoCu356gDRnra6GINXUZqd3c7sB6l07vngaq91GbnmpvfT4fF9
	 HyB+QQIW4jWE0ya/y/LjFqHZuDWGRO9dzZOSo45ZI2RqD4rAcjpnWKI2OjemT4wSqtTos
	 h0pdp8EsY05HOBPx0kTUdWYiYZ5eING87kFTmJKp8XvLChPploJq2GMNz7oHxvzvebfMU
	 6XuHGalla1hJSivphOZ0BsfyAQYWucqVmiLMXn22oUjq6kXmU3ZmGSuCyLE323Bjfrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=5J9MvBdhUxYTb7Mgm25rcoiZhjWHj9jpVpCDuA1tNH0=;
	b=kfO+lThLnTP9Gw3Oepntbsxf9kjw7mtmf+z0InjNr6q98VJQM4cyQjaRIao+5FIOLPZ5
	 R8mkUE2+SEZMtq3EvvnjoQ+6PSRx4CuFYNG14SvkSCYBq5cw9vKhurmrFa8d+NR/lLp5J
	 AlABRBd6+lbUTDE7jvui036LESSQYiwXmCdH6bshom9zXcK2alvQiEfWh7PjS5+xUOZJI
	 nrVFqIqDHNmLb1iVxfVvUeu0yrF+6c9743HA0dsDCv8hZI3t2pii2XLVtAMG/IouIm+4L
	 5b4q7vPXwEJY0ES0u0q38DwI1sMl2WoRkcjStWQEV5kpGgF+aedM6lCs4buPGkxyN7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nfI6Qgg4;
	arc=none smtp.remote-ip=209.85.210.197
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609C4606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 22:44:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 609C4606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nfI6Qgg4
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89e96c03cd0so236378b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709067; x=1793313867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5J9MvBdhUxYTb7Mgm25rcoiZhjWHj9jpVpCDuA1tNH0=;
        b=nfI6Qgg4MPKsp3F6kJ1b0R9Vo+gzsApTN/DbpOJg6b+GnddLliIN9U0QOE7rl5dLGi
         ONI4G4MYVEM7PszwqIUjiffKr9aFe1uczg6y4lTlJua5l9Sz7+Go5QhbsWwQmcT3hogk
         TVXpbGtid4lUILqbDkfzBCfH7m7PGXh9grXR+Q2U5MwiFc/H0O/LpYHJyXkjapNGrA43
         jVHr6mQMhv9CfxwuJ+XjJ6HXjN/awlEhl5Cx0acoyPa/BmemqhoSHNVLDiCGThDN6Yqo
         U9Pgn6iRF2WxMXPLYIBS712RrxEQft6PDD4YcUb9sEUNllXD3QatZbchvUgoKlcbeMnP
         5evA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709067; x=1793313867;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5J9MvBdhUxYTb7Mgm25rcoiZhjWHj9jpVpCDuA1tNH0=;
        b=eBGVqdsND8uycnYtjA1bg/MatUvPD+uGSkgq6kX/tck/BpZkwBXIJeqwgC9Xw5CJde
         1SIuMPd8d/a8vrWZMGZqPo4kScUHnGciEqzIdp2WfBVXTAs2QnqyBf9Z8mj+C+mVmOoF
         QBtgOvpB0NKj+L/zOGCXMEJMo887ByhvsTzfTV4YOWKrjcPFmsRJ5IEYgaI4VHCzRaVg
         PdyQGwQqqvQLpD1N863/cERx5vJp42p2KD2aLg20Cx0dngPLZttfmmnLIvWlUH/NTUHU
         rPCSESTh7H9412OXgAmkQ3pg3/MIW/tZtCm1CEZpZaux4W12ENcBS3DCI+/JDvOsAIMN
         rK0g==
X-Forwarded-Encrypted: i=1; AKwUvByBSyjD1Qv75b9dcuOkczUiV25OjoQkfiJoRnAMv8VfptfllXcAfZ08vnZtdU7DGC1eYV+rzqL33RsiV/k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIUkB9Nmogq1TXhR/QogmXivRc8AAvni9nBPnFbnPrGRg2psy4Y
	99N4R8EbDQXoytzW68KHw9nYqyt62YKKs9lNbXQHTvjNCsh2eybtClIXKZpXhBa6fOchLgxBANm
	FOWX5Rw==
X-Received: from pffk13.prod.google.com ([2002:aa7:88cd:0:b0:886:fe91:dda4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:a0c:b0:886:458a:42e9
 with SMTP id d2e1a72fcca58-8a2c767402dmr349482b3a.49.1792709066272; Thu, 22
 Oct 2026 15:44:26 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:44:25 -0700
In-Reply-To: <CALMp9eS8KDozNGT9J_uN69W32QEvTbg2JrtRqN0ESi00b_uq=A@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <20261012233638.2546339-27-yosry@kernel.org>
 <CALMp9eS8KDozNGT9J_uN69W32QEvTbg2JrtRqN0ESi00b_uq=A@mail.gmail.com>
Message-ID: <atqRyeqSXViiNIk6@google.com>
Subject: Re: [PATCH v3 26/27] KVM: nSVM: Use different ASIDs for L1 and L2
From: Sean Christopherson <seanjc@google.com>
To: Jim Mattson <jmattson@google.com>
Cc: Yosry Ahmed <yosry@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026, Jim Mattson wrote:
> On Mon, Oct 12, 2026 at 4:37=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> wr=
ote:
> Moreover, does this change the semantics of PV TLB flush? In
> record_steal_time(), we have:
>=20
> if (st_preempted & KVM_VCPU_FLUSH_TLB)
>         kvm_vcpu_flush_tlb_guest(vcpu);
>=20
> IIUC, an idle vCPU that wakes into L2 will flush only L2's ASID. In
> the past, with a shared ASID, L1's ASID was always flushed on emulated
> VM-exit anyway. Now, L1's ASID will be unaffected. Though I can't find
> any real documentation on PV TLB flush, it *seems* like the remote
> vCPU would want L1's ASID to be flushed. OTOH, this change makes nSVM
> behave just like nVMX.

That's a bug that absolutely needs to be fixed, probably relatively urgentl=
y.  We
should also document that passing through the steal_time shared information=
 to L2
to utilize PV TLB flushes for L2 is explicitly not supported.

I hate to re-introduce deferred actions for L2 =3D> L1 things, but that see=
ms like
the only sane way to handle this, because handling the !tdp_enabled case, w=
here
KVM needs to sync the current root, requires knowing what MMU is going to b=
e in
use when L1 regains control.  Yuck.
