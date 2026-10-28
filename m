Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793228996;
	b=0nqiARTnYSH03EKSJAW/vjmnJwELn7qm0G0sxSPrc1BN1C0h+AaZSbGrvDSPzAWKFgSF
	 IpqPT0hwq5tOrIS46NJnjL9BcQ6Nlt2DOdxpHlVAsTglPIJYA3rZyLe3iNKvbFiC1Qavx
	 8/4fUZg1JVO+Db5rcgBIllqDlAatDvYX24xQmIgNI3fEYGXxmgkU/5OxOCYAsSwVy2TC0
	 I+nqb4f3afqrjHk3zkAw5CutjB5kyjWQRhzHRMdNX2ynfQaApXLZl17yxQ2hfOD7qd6+3
	 DeQbZCLXVe4oYIVTilV5lyTWidDAZNJCsP1hog2hahu4V3heEzMK1EoPIQldQ7WvPNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793228996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zvXLaiNtyYYitYdwgR8oZSNIHXteT3NWQoDApGH7D5w=;
	b=tZNQZK5Ew7gcEwFy9fqheUbjYUQtb0PD1/IAwgjuKHKRx7f9i8G65kCZ4CG7AyerB8v4
	 V65y8609DTzLNMeHz8bF1Oy2rn2QvYi2LL7zgrETveN9T0Hp18u51fQsnODVEIUL+Y6H4
	 3uIHUF4KEVcHlL0+ORg3GVGbLYGPS4skP34nX0SDVHyj7O6i6T0Bra8qWOMZv6OkPOha2
	 lg4MYAuCx6jaAijogJno70TipSrpbrweMtxM85p8EvHIEHss3CWcL/1tGpU1hMoGLbqTx
	 fFBekCOuqUi8oTNhzU1cjY7g+aIpAkD0M3Zi73e7eMbm105iJ+ylQ18cjdRYwydQ7Ig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WC8v59WQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36337606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 23:09:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36337606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WC8v59WQ
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so2216a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:09:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793228994; cv=none;
        d=google.com; s=arc-20260327;
        b=h8AmdraRCDDs91I4gLENdIVOBZbDyYHc6C3nQX2NXY8qLVeMczYwwSJrErVGQ5JG5l
         3CuARsjIXhmZOS/ZRr0uW+Y3Wm1/BMFI0KNRUvsIOSqNrVgKs5XvJzMqLn6b6jAXEC/e
         qirclESazebylhWmToLPL/PXoS8oKa7BiXhZ4N4i1OvNl6QvNVKITgw9fkgVQdXDqWOD
         k+65EAOdFwEbzzJrhyZJypU9xNVx7lYytmOnc6lgiOLqds8VaVsIjznpk+UoI5XUK+kp
         dk1mZvCMmHlDbGGHuUZIb9cP522wQYl27lkHqA7sUDCOSwv5h3cukMYjr0ktGD+U/Jw7
         qddA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zvXLaiNtyYYitYdwgR8oZSNIHXteT3NWQoDApGH7D5w=;
        fh=gNU3tV9p27/rPGpkXu6oc8PbATx+GhlpxVTNRyQzbJo=;
        b=dRgrq8bXOlJBcc+fm30igkdtbtqwKvr9F+9YfNcLplfceBk7lfsJCZnl4wWjwXS+qc
         ygPTWpww5K1Lnx+FyUSOFLEIGrdFrvhi4Zc7aQL0mX9RmAuQ9k/YRRGmb/E1oXo97m8A
         OfF/F7F1VWf5SxgsY3iUc9G8IXNZ0m8KuI2Hb832UMcIE3cKQOJuNl1fnQIH9On5HVQn
         8pxHvLBRWRyyMEw8aHF+hgLjUY/PmJjHJ/U4eXFZP1D2qog6UGdBlDybGJSfeZ7gANBC
         hn7JrdgYkdhEe/UR+ONCsm1Ikyy3Jk5wbVIJwpEBb/dqqAYwDKp1LhT0quuZQw0t7XIu
         AtXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793228994; x=1793833794; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zvXLaiNtyYYitYdwgR8oZSNIHXteT3NWQoDApGH7D5w=;
        b=WC8v59WQpMym+tCAEbtqGNDf5z/c3m8Yg4PN/2fiKrFMNaj9CbrhKrbDLGvBiNuXkD
         LbEsc0w+EXZ1/9rwJPC1F6TuYIQabxtxP2sXIMGDzlHmp/SzW3qDiQX+ZfULbUa/f4Wm
         ohefXJW0+MJjAqwCqGunV3ah5Xv0mhz8bTFECrBqwpAT67ZD9HHcbK1AJhcfjr1Jst6F
         +E5WD9ZlJU/7H5KorkZ/lyG4Y60FOdxF+O/fROG9bVP6fl+E9q0hIx1NlkxD8GZZfIAI
         /p/DpoDLfknq3MZzA+84Su62MjcLu+4vOjNNTHY3BJyIig/6Gay5WKlWjsjM6YF2mw6S
         zFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793228994; x=1793833794;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zvXLaiNtyYYitYdwgR8oZSNIHXteT3NWQoDApGH7D5w=;
        b=tFPJXO+MjYDpPC5NbU3JQDpeA2cIzjCbno32/m7NzzcOLHocP643O5hkEnQcvF2qqM
         wxL6nz2S994zItsw+ieJ366ul07TUgINUGQ+H2pyJ88VA1oqyolFNBx/20UTZNfqRhwW
         kxiCYM3dxLvho/ZKBK7ureLD66lEoaktYknLCOec5vcdTiber83a07nSUptN0ED4MdL3
         nYL6ynIYnJoJbU1xpq5prN5SeQPS8V8s2s2gppgMMcRMoEgnxu//sJpNkkRyJHIGiJVt
         +RO1Ihh9mnFZUGWlV3YcDqqd/40bIsUwSXb7hkuh+a1wkdeW8EkLyWPk/GcAp+UnVvqt
         M2rQ==
X-Forwarded-Encrypted: i=1; AKwUvByrK+kQRf4//o9IlK3JGlwMmjnnXw5QmgZk6/9ok0vpS7g2CyrlyPrh8aypLkCSKnEJ81NDE1CDG+s/Irs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKugTEW6dA62ezx3uuE5d2QQm403zW58w1PlnH4tL8NlHAWyLeZ
	YILsAoEJmSMUGFjbAZDSfrNbh95mQMTWbT2dSmBvG2zb7/AF8cIj1XKYjsAccNzcNdmepsuV/Z6
	3WW/BZ1LufS6Aqo5ynO16YlXVPMFJ1t1imIr1qKXV
X-Gm-Gg: AYBFou1csCVUxqFq38vGWVspzhLzaXeSdZuZtPtA383clXMNlFisj29HO2weqCm9gG+
	BjOg/HUdrT9lTCgshARRJyXdkSu9vNs0uO7aNFHlSjzmXyFUXrCuXBGvZaDVAz+5rFx0Fm8Hvn6
	5B8gZaGAIZFvXBJk1rRST5fVwXbG7+ihhPcTmUr6/9s7xeDhq2BJhnymZSeXVX2jPMCCMzw7MQQ
	ysR4H4FtP9Vvj2xUN9E5kxVsc0DoF9KOXCUpCJAle2Mk7r2Bx7HARAh5uIuGVa0PtfU6unpf7Fs
	ewMYhqj57Lqm/EEvV5Su73wuu4cFUTdQg2AupEf5/18IeQVtqdCP5sU/MvjfSAdiR0UQWpxAaQi
	EJPvnU28K1kzHyXpL6U8bYhAUfkpjBUdyaGa1iQ==
X-Received: by 2002:a05:6402:a24c:20b0:6b1:a517:5bce with SMTP id
 4fb4d7f45d1cf-6b4b459e6admr16181a12.16.1793228994188; Wed, 28 Oct 2026
 16:09:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260827223755.143247-1-zide.chen@intel.com> <20260827223755.143247-15-zide.chen@intel.com>
 <CALMp9eRypTqSvMUes6PVB8z30EcppLJ3i_votpMnJOawP1c4sA@mail.gmail.com> <82af5e57-c4f0-452a-b484-ec9270a960b8@intel.com>
In-Reply-To: <82af5e57-c4f0-452a-b484-ec9270a960b8@intel.com>
From: Jim Mattson <jmattson@google.com>
Date: Wed, 28 Oct 2026 16:09:41 -0700
X-Gm-Features: AclHuK-clTnps2FKEgApvJbvAL97jxbQ5SKxHh15_KZqqExdJoTLjZ3SwVK6MI4
Message-ID: <CALMp9eS53ow0xRh9B_u1EksUCZ=VRh3JDR6Qqv4UOw0vOJqTMg@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] KVM: x86/pmu: Ignore AnyThread bit if
 CPUID.0AH:EDX[15] is set
To: "Chen, Zide" <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:05=E2=80=AFPM Chen, Zide <zide.chen@intel.com> wr=
ote:
>
> On 10/28/2026 4:50 PM, Jim Mattson wrote:
> > On hardware with CPUID.0AH:EDX.ANYTHREAD_DEPRECATION[15] =3D 1, if soft=
ware
> > sets the AnyThread bit in IA32_PERFEVTSELx or IA32_FIXED_CTR_CTRL and t=
hen
> > reads the MSR back with RDMSR, does hardware return 0 for the AnyThread
> > bit, or does it return 1 but otherwise ignore the bit?
>
> It returns 1. That said, the current implementation, which clears the
> AnyThread bit in intel_pmu_set_msr(), breaks this behavior.
>
> To make matters more subtle, in the case of an invalid configuration
> where ANYTHREAD_DEPRECATION is set in the guest CPUID while deprecation
> is not supported by the host (Ice Lake, for instance), it is better for
> KVM not to pass the AnyThread bits to the host hardware and expect them
> to be ignored by the host.
>
> Is the complete solution to keep the AnyThread bits set in the
> guest-visible states (pmc->eventsel and pmu->fixed_ctr_ctrl) for RDMSR
> readback, but drop them from the hardware-visible states (their _hw
> counterparts)?

That makes sense to me.
