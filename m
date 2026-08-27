Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6433CBE84
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 09:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787821315; cv=none; b=P9/M4RsL/RVQZeYUTeVlqKhHWao0dcJ+O9Oa3KGpJ1cQH25PEbjU1Qsp4CDC3kf2ZQib/sIfbggTtHLBorLk7Kl94lVg17Pn0OrEDrxLDh3WIuFRWDz2F/BIt6i6u9fOmFzVaCpt9t7c+shaIU5KtuC/D8jbQ1l0edLdAm7Tobk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787821315; c=relaxed/simple;
	bh=wkTjDvro31Z7Cb9CrOFouQ5u3R4WipcefR5jbWng4UI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cQNEDRxSaGESd047uAbVc5g62y4wZ9jRmc5XywiO+tRXBBP1biqinu5jSaSLdV6cFGKND1b61BKPMHnuda8JMtdbOA1/bmjwoWRUT+FXENBqDrjKtU4gMzzCJs5SHoFssc2A8c2Oz0uiQofUQFjIEB6FvcnOt5geTtJ221G3vio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o9WAhsox; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o9WAhsox"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-496bb7cdf51so5863205e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 02:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787821312; x=1788426112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kb/Wi6oNPcoOC248sdfl/gNH6Pq4KEL0EAbb7WYkBJ8=;
        b=o9WAhsoxAIRld9JGbZIgaeTZNTjm4YB8cYsQPng7L3rrmvV0cZuRc7F4ExpVQqvqoA
         OrqmekMz5S2Y47NEVTnK2ZHpgyYqbIPGOGe4UZZtprHjw4pExoaVB/J40sZBxaGTj32E
         IndRmnKlGJf9StqliZqUEZ972uGNNUbwyM0spIKQXnQ2Ww63trGxP4ipOmzyCzmZgkB/
         feucI8UWIdrtqi1h33hAJfBvbZM+f7LBpAA90RCy4tf8GHQsGKZcXMTc8ZJfebjTMN1X
         ofBlz5mJuuYEuI+i0H63OuKAGwBcr51wNcOa9gqRX4mMBI4RRlX8wMO7wTmm4jrAumgd
         2Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787821312; x=1788426112;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kb/Wi6oNPcoOC248sdfl/gNH6Pq4KEL0EAbb7WYkBJ8=;
        b=KlAJRwaQKtgEtBuDviKrhhbqTnTmsPviEbnsV9sfr4+i3WL2zJNhZZxotMdy7Q7DL1
         oJxGVQZ2bMl2YtuZ+GaXwJAHdvfSqfB3krPeNbL74TnPeKgUdHaNA0TtNuBpHkp/1DIJ
         ERjdtKROZgcJrHRmd+MDPinvvKlHbK711UinwhC2MtTte2xNWEJAyhmWw14NIkaKAcn7
         BaLZLYxM7LSvz7Nbf9XTENTHXhoL9CgNm0GgIyvzxsyZcU7ZoiyQrI94FfPqX6iVSG/e
         N31fnmTN9yA8OX//+9E02jGVAhpU5AH1PYgGM2DVzL4BdWKkUbE2QbbGw46hUKqFVPCU
         9WkA==
X-Forwarded-Encrypted: i=1; AHgh+RpNikUuD6nAFw6Jqgji0Qyz2V0HcM0nYKkNxYqzufp4lPXieBcxLNzxTk4CdWs9rofFEiiLtETsiivu17w=@vger.kernel.org
X-Gm-Message-State: AFuF++kW8rFm0iZxLrFKnILS0zjwSRTXd3JohDxSTBQoPVpf6EeDBtK2
	JoSIHE5EBtZdcpuriag7HQlje0Zdna2Bfe6/TBafqLoYCfgPU0khGfBW
X-Gm-Gg: AR+sD137w8newsypeAaK2W5vWc7ZGxuTUL/R7FN9s7TaxWKbScR620D3PRgX++++WKl
	4EIAUSBD8oZUP2n0NYgzxXuE4hfgHrzemA7TPjVNF5uvgR9tVQkYnpgki3DQ09DW+NgiQ6lOoIf
	ExsWLAcD+upXNF1Ke6lv5akEL3Nv9lOz0P8fyS8CuDhNO8XjiesE9fOK0GB8uDWeMFic7fAYBR9
	A8S5OqhBk/wQGZoLvplgMOeBU41fX4McITST66gyqquEnl22oKqqg48sVFLy4vHuNZY/BLlFvXR
	4oZLgyk5SP6aT7+qRNJ+kCYR4C30e0/IU5m7206Qs0+spLjzna3IB7wfP89DMnUIjKBmgtYx6m5
	LHwROzbXyABEAyMmBk4cao6gtjUR6vJfkUPoHhPcrFU4Js6EjxsJhnoHh5j48G7JU28oIvq2vSe
	uFTxKFruV8f3y4M9EOwAtIX7JDo3oRYUnRZ1Yx08/r3/U6iTrSLA6JixRg3qMxACBPZjhtbtdJH
	q0toE6s2B8Xi8h+X9tcxWx0qw==
X-Received: by 2002:a05:600c:c0da:b0:499:83f1:398 with SMTP id 5b1f17b1804b1-499dc820705mr140148765e9.9.1787821311647;
        Thu, 27 Aug 2026 02:01:51 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49236515sm53313005e9.1.2026.08.27.02.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 02:01:51 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:01:49 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: Dave Hansen <dave.hansen@intel.com>, Sairaj Kodilkar <sarunkod@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, Mathieu
 Desnoyers <mathieu.desnoyers@efficios.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, Thomas
 Gleixner <tglx@kernel.org>, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org, vasant.hegde@amd.com,
 suravee.suthikulpanit@amd.com
Subject: Re: [PATCH v3 1/2] x86/uaccess: Extend CMPXCHG user helpers to
 128-bit operands
Message-ID: <20260827100149.10004212@pumpkin>
In-Reply-To: <CAFULd4YFphkN4M0a_gC=vxN8Xgh4WWBGPo8dO-o6A3v9RGX4_g@mail.gmail.com>
References: <20260826070004.8100-1-sarunkod@amd.com>
	<20260826070004.8100-2-sarunkod@amd.com>
	<e32c1437-44ab-45d9-9534-124a9e09f029@intel.com>
	<CAFULd4YFphkN4M0a_gC=vxN8Xgh4WWBGPo8dO-o6A3v9RGX4_g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Aug 2026 15:19:57 +0200
Uros Bizjak <ubizjak@gmail.com> wrote:

> On Wed, Aug 26, 2026 at 2:30=E2=80=AFPM Dave Hansen <dave.hansen@intel.co=
m> wrote:
> >
> > On 8/26/26 00:00, Sairaj Kodilkar wrote: =20
> > > Extend the existing user CMPXCHG helpers to support 16-byte operands =
on
> > > x86-64, using LOCK_PREFIX "cmpxchg16b".  This mirrors the existing
> > > __try_cmpxchg64_user_asm() / cmpxchg8b path provided for 32-bit kerne=
ls,
> > > where KVM needs an atomic compare-exchange wider than the generic
> > > cmpxchg helper can provide. =20
> >
> > Please take a good look at the Sashiko review:
> >
> > https://sashiko.dev/#/patchset/20260826070004.8100-2-sarunkod%40amd.com
> >
> > It looks like the "A" constraint isn't one that you can cleanly mirror
> > from cmpxchg8b =3D> cmpxchg16b. =20
>=20
> Actually, "+A" will work for 64bit targets, as long as the variable is
> 128-bit. The comment in asm.h applies to 64-bit values, where on
> 32-bit targets they fit in eax *and* edx, while on 64-bit targets, the
> 64-bit values fit into rax *or* rdx.
>=20
...
>=20
> That said, the approach with union of two 64-bit halves can lead to
> slightly better code, because the compiler splits the value earlier in
> the compilation pipeline.

I think I agree...

=46rom experiments I did with 64bit values on 32bit it is more the case
that the value never gets assigned to a 64bit (on 32bit) 'virtual'
register. If that ever happens all the operations are initially done
with the 'wide' register and then later split (rather than being
generated as a pair of 32bit ops).
This causes excessive register pressure and even spilling of constant
zero values to stack.
You do seem to 'get away' with returning hi << 32 | lo.

I'd guess the same happens for 128bit values on 64bit.
(This is gcc, clang does a lot better.)

David

>=20
> > Uros, any chance you can give these a good once-over? This seems to be
> > just the kind of thing you've been fixing up lately. It would be nice to
> > get them right the first time. =20
>=20
> Based on the above explanation, these *can* be copied from 32-bit asm
> patterns. Even "q" constraint will include all integer registers on
> 64-bit targets.
>=20
> Uros.
>=20

