Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793830557;
	b=xwWlIspv3xg28KEkNAj6w+pFxnNWniRyy2a3Z1Aj7jMFpNvzxeELY4Qm9EGNNrp/tpM7
	 5HY6/fhI7MFWLwa45u05/Q17+ezaOFaJERYk5pV6oEjHLnzE8DUm3lRfZ1C+V3BYHZnBt
	 8XPGkvMX7uOu6uSEXZ6Rh1fL6CQ+xsp6uP/HDs9PJ7akqWh+n7g0D2TZ7jZwf8VSiXvyx
	 MnLD2IJzHXGR6eVzrDemwzjmkWG80vBIUjHqVcdk30s1fKCf/7fk9csxQfjZ3DGXiTf89
	 xbnKNK9auhibagb8iqjStww58aBmcxX+CVoOj/vji9u9QwcNQXnzTo/BqmDwF+1//oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793830557;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=e9Al2DEvIWLb6MWcheqyXmrjikqbykjExztYBLPRPTY=;
	b=XuZNIZ66BkrNj6SXS8FxT/8AXHvVk8whwtx3kbBWzbaLtn8G6AEE7x98MRREQzzmlogA
	 5BBTyFwOeWJqAvBLCQET4uBPs3RSxXlgFgk+PHJdvG8MJOiDPa8jPSBI3fH8HiQ8t8Nq1
	 Fe1jeLKt7SR7Lcq7m6wc/vVlseey07bAs6atMV1M1JA6TAsw/Ty9J3V5aOjeqkros2M7h
	 pvqHDpEezMpzVmntFWfupdD6MK0ZfN9uNPyahSDKoMJjGs66JugQ0pvP0/Ci9+xfRKnAx
	 gOgtHwtceYESGeYJ5GLykGWLu2c+hoZG0XnakHZwgzgleUkiSonEaitOFydxmtuXG+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LPrGVcha;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46561606AB06
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:15:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46561606AB06
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LPrGVcha
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e954d87b48so16515475ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:15:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793830557; x=1794435357; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e9Al2DEvIWLb6MWcheqyXmrjikqbykjExztYBLPRPTY=;
        b=LPrGVchao38f/SC+Kx9VugPICoxtMEPaCao5/c92/o1Bs8B/BIu+4gtCfeX3e3gyLd
         Z3o4jqUFbAXFK8HujH66pWdUMmxYxgsf9SPw7Jt8ZoxqoUcCbMikYmtlnXQpBH+3J1m2
         3aENwqZ/9DjS/k2WO1q8pfqKv39uVLlxNH0jxS28STi/1Xd21DJKH3xPRWKsLl3E6Bz3
         GtlxX9Y0PJST+9xpuRkwGl6OBrdTOUBsKEn2pwrUsAWWb7PRRY5zxpE7upKmJ7i63xxH
         gmqBGFhGgh7SC4GyfSoyTO5KEs+GXPKuJ9gsaTciS/Ww6PWriMd+2GzOaeuqEf0qbLG0
         tGnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793830557; x=1794435357;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9Al2DEvIWLb6MWcheqyXmrjikqbykjExztYBLPRPTY=;
        b=majF0wnwxXlSL2gBu9Pw8n50Ey7Bd1Ubv94iTt0o3YYut9le2mbFRWa9pqy0drrV+e
         ajzjxqrgSYvgZdZRNvtLHAe3bsD3BI2vyCad1eYyQAY0mMS42P+Je9vpWSUt1Rusrnxh
         x3O/pqL5MqPQoJrQQ7Ai91xKXgh6pnjfgNhUeENiZJsyM5EVy2VdpW7xbk841S/BKGLG
         k3Pf7QVVBzBTQ9X02vgZSE+EzAVP4RczK2di7K3WiKLDecFdXP/hjYvKceYt7KCMIgo2
         u0QSNLepmQepaizCbu2BnyOWesAE/IF4L5XvEv5iQ6G27A7WTgLKZkM9AEYS0B5hzQZi
         cKNg==
X-Forwarded-Encrypted: i=1; AKwUvBz0W9p9qXEQUQZseThD/Y727rL85kHL0+cK6GuJqcMLGMzKrjUzsuf+RPqyyLqwEPWDmmR8dqT2suqV32Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z1iGMYpzv1ZmXVplMIlKTO9uWnRTpCo8acF7H/lFr4J3knLEf
	GqOGt2ALXQ4tNxtv0LOaXTTyUD/SVGLT/TSjZ3Xbbif81YY9EbqJ/G3FvjYacejOCoFaQTYeRti
	ocPHE5Q==
X-Received: from plbmc12.prod.google.com ([2002:a17:903:2b0c:b0:2ea:7f9c:2ce])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e84c:b0:2e9:4008:6fda
 with SMTP id d9443c01a7336-2eb364b5c4bmr178143285ad.28.1793830556445; Wed, 04
 Nov 2026 14:15:56 -0800 (PST)
Date: Wed, 4 Nov 2026 14:15:55 -0800
In-Reply-To: <CAO9r8zOa315UTmR4fbGzyHMtKDfUjW=6ehTrdA9js+JOAb3d7w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261012233638.2546339-1-yosry@kernel.org> <CALMp9eSuH1xe7PQ_WtE9DjqWjnKanFD_AFiiR9rEYkSV+sj45w@mail.gmail.com>
 <CAO9r8zOa315UTmR4fbGzyHMtKDfUjW=6ehTrdA9js+JOAb3d7w@mail.gmail.com>
Message-ID: <auuum7Dq0w-swARW@google.com>
Subject: Re: [PATCH v3 00/27] KVM: nSVM: Optimize nSVM TLB flushes
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026, Yosry Ahmed wrote:
> On Wed, Oct 14, 2026 at 6:23=E2=80=AFAM Jim Mattson <jmattson@google.com>=
 wrote:
> >
> > On Mon, Oct 12, 2026 at 4:36=E2=80=AFPM Yosry Ahmed <yosry@kernel.org> =
wrote:
> > >
> > > This series optimizes TLB flushes for nested SVM by using and maintai=
ning
> > > a separate ASID for L2 for each vCPU (similar to VMX's handling of VP=
IDs),
> > > rather than sharing the same ASID and flushing everything on every ne=
sted
> > > transition.
> > >
> > > The series also drops the dynamic ASID allocation scheme and uses a
> > > static ASID per vCPU (or two if using nested), bringing it closer to =
how
> > > VMX handles VPIDs. Modern CPUs (Rome, Milan, Genoa, Turin) advertise =
32K
> > > ASIDs, so there is no need for dynamic allocation.
> >
> > I'm not convinced that this is the right direction. It's almost always
> > better to do things locally when possible. Why not keep the per-CPU
> > generational allocation, but allocate two ASIDs per vCPU=E2=80=94one fo=
r each
> > VMCB?
>=20
> This is what a much older version of this series did:
> https://lore.kernel.org/lkml/20250205182402.2147495-1-yosry.ahmed@linux.d=
ev/
>=20
> Then we moved on to per-VM fixed ASIDs to align with SEV, but the
> tracking of "which vCPU used this ASID last" was annoying, so we
> settled on per-vCPU fixed ASIDs, similar to VPIDs, with the caveat of
> not being able to disable ASID (Hence the fallback ASID thing).
>=20
> Other than alignment, dynamic allocation of ASIDs means that we need
> to handle the possibility of ASID reuse, which imo introduces more
> complexity than the fallback ASID logic, patch 10 lists three very
> recent fixups that we need to handle corner cases with dynamic ASID
> allocations:
> https://lore.kernel.org/kvm/20261012233638.2546339-11-yosry@kernel.org/
>=20
> There is a 4th one that was sent after patch 10.
>=20
> Also, the dynamic ASID allocations give the VMs more noisy neighbor
> power, I think the ASID is reallocated on INIT, so a VM can trigger
> running out of ASIDs on a pCPU and flushing the ASIDs of all other
> VMs. Yes, we can handle this in INIT, but the problem is completely
> side-stepped by using static ASIDs.
>=20
> > This would eliminate the need for a fallback ASID and remove any
> > possible concerns about contention for a global bitmap.
>=20
> The fallback ASID logic is annoying, yes, but it's only in a few
> places. I don't think there's a risk of real contention in most
> practical use cases, we can run 32k vCPUs per pCPU before we run into
> issues. I think we will hit other scalability limits before the
> fallback ASID becomes a problem.
>=20
> > Moreover, it would be much simpler to implement.
>=20
> The delta is smaller and simpler, yes. But I think the static ASIDs
> code ends up being simpler to reason about.

+1.  The per-pCPU tracking might require less code, but OMG is it hard to r=
eason
about.  I also hate having completely different schemes for VMX vs. SVM, it=
 makes
it extra difficult to reason about TLB stuff when looking at KVM x86 as a w=
hole.

The other big argument for per-vCPU ASIDs is that it will allow us to elide=
 TLB
flushes on task migration[*], which might not be a major performance win fo=
r bare
metal, but it can be a significant win when running nested.

https://lore.kernel.org/all/aHWjPSIdp5B-2UBl@google.com
