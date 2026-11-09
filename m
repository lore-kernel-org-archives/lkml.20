Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794262063;
	b=HFNSdUsdJtaKnObS7bf6S/Wk8o7DrmsHZGpK1yl8iszuuT7AWTvtY5irc+pK5WSlN+I3
	 wsQbkhQi1TbHLZDiFVeul+RL7N0IizOuUrlnfmUBr/nHpKatU1+LSkZFtotzn7nhH7CCJ
	 W9JUONIPmj71bchXWaRqSUxR13VYHyh6W2zJpHKwtk9ZRL2n/UAFD5goNghms0zZuhmFx
	 60V6mvoICF/szaM7lqjv5hFMpIP5hAKlHwUXK+wDA2a3pR+UTXXlPMBImCtR6Tw+vY7G6
	 vXZVBJbWIAI0SlLwvYbLD3WqzQuglHWmb0U4J1kR1QURiS2zsUHAG5sHU3TuVD5icYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794262063;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=/Jiqd0tBE0ZLezzleQnFIB6zQfFW4nQzZquT/KqFgKI=;
	b=B8r1gMfCEN7+Wn6AxDnbpofm3dnsV0UcIe1qQvPzDhOmdDch+hNZKSLrORt9BNbPJVom
	 kqzAFazjnmLdYV9SComBes7QgQeMftG5982HqfvEQSpAeSJlk3GAUxJwx/B9P6wB4n/i3
	 XhFfk2K86tGlu2UBNbrnM4lqDFUBAORfjWnJu7IBeZ9JkllUUyHJtcM4aPv1KVycmTJ8t
	 xx4ReLKs3WD04YP/O1/6f8NtOWmTTTGUhKWDVbw3FK4JVyVeTXnY4c+Xeq+H+I7Zbo0e2
	 6vtFT5R0OUiyb7R0rw3pI8Bz6XfiNHjhgzdQs++WDnfL455TjCGnp2BpM8oeY3ATdhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fehpc9+Z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C2C606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fehpc9+Z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0F81F0089F
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 22:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794262062;
	bh=/Jiqd0tBE0ZLezzleQnFIB6zQfFW4nQzZquT/KqFgKI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fehpc9+Z+TqgkyOzbUQBTd9qRYAqw8jOiIMd3KRPoQ2TwVE+s+WAwLOJgQ80q5MV7
	 YMa5Cc7g0w35Q0+mNFj7KfmxGe7bsGVCPobGitM7eZyrxGQ1/NV3HURm4/2L23LXBz
	 iJ5eiKJq2DtaS0crHkTd3zbNQrEOmtoL6od6zaZULMLdmMN6UqdnXFDTp3xr/eacnB
	 OOHoHmh+xzKheFzml5kRZWZMPR17ehps5qaCzCvPEfkdvYgRLm9tdgi0VnMADX61C6
	 +tCG/iy1Qwi7LmvIaI7hnS5i4QWH/iPiWjipBe1ESBV783lVL0WOGd9tKAhp8rGNLG
	 G/bVwG/BZ5ItA==
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c411e139259so13757066b.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 14:07:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEGuU4riJRjj65TgAECjHsj1TLaIZcqCTTyc/HRjkja5uSKE5W0Cg0Vu9WMzH9E3Bo9WLOwnVhtOyXdULY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+NHmr6VHGvIWjcvpaVz1HlBkN6PSs3VSVh4s2RhJaNWIbNGqiN
	R5rUBDJ6A6krfTm9Q0cHwzs2y641MyXeVMTVhcqfut9qctJvfB3SMGgPX704Qp4uoT0X+uOouUI
	AOHigm640KsAdJV+1GDmNxDNmqx/uxMk=
X-Received: by 2002:a17:907:3ccb:b0:c40:80eb:c541 with SMTP id
 a640c23a62f3a-c5049320f8cmr52819266b.2.1794262061283; Mon, 09 Nov 2026
 14:07:41 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106013927.166209-1-zide.chen@intel.com> <20261106013927.166209-5-zide.chen@intel.com>
 <au4kyULjUYdqbfIq@google.com> <531bd088-dc5e-4b2e-953a-6d9d6f14b61e@intel.com>
 <CAO9r8zMs+aBPN-w7L3nZxwVV-Dr2f0tBYBjicDsdYVp_Mc2AWg@mail.gmail.com>
 <e977b107-7762-46d3-ba31-832eb9ae609c@intel.com> <CAO9r8zPVt++jgZD3-Jd-DYKMjYyAfUuQkvEXD4pKqe0bdYE29A@mail.gmail.com>
 <c2844568-f8f6-450e-a718-1e9e3b7b3e4b@intel.com> <avI20tEzyvIshy2f@google.com>
 <650a864a-2f20-4864-b29f-7cbe822e894a@intel.com>
In-Reply-To: <650a864a-2f20-4864-b29f-7cbe822e894a@intel.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 9 Nov 2026 14:07:29 -0800
X-Gmail-Original-Message-ID: <CAO9r8zOOub+rY-6twk8jBkKJZJsvQnJGMqXBo-eEEyD5+1rang@mail.gmail.com>
X-Gm-Features: AclHuK_wkAMoz3bhZrOB8V7yo2pVD8uY4oTcxfe0z36IThxkzt1RLmUTYiwHlKU
Message-ID: <CAO9r8zOOub+rY-6twk8jBkKJZJsvQnJGMqXBo-eEEyD5+1rang@mail.gmail.com>
Subject: Re: [PATCH v3 04/18] KVM: x86/pmu: Add PMC bitmap accessor helpers
To: "Chen, Zide" <zide.chen@intel.com>
Cc: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, kvm@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, 
	Mingwei Zhang <mizhang@google.com>, Das Sandipan <Sandipan.Das@amd.com>, 
	Shukla Manali <Manali.Shukla@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Xudong Hao <xudong.hao@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > diff --git a/arch/x86/kvm/pmu.h b/arch/x86/kvm/pmu.h
> > index 98e6f2443b82e..37a6664fdb9c9 100644
> > --- a/arch/x86/kvm/pmu.h
> > +++ b/arch/x86/kvm/pmu.h
> > @@ -149,11 +149,11 @@ static inline struct kvm_pmc *kvm_pmc_idx_to_pmc(=
struct kvm_pmu *pmu, int idx)
> >   * which is already constrained by KVM_MAX_NR_{AMD,INTEL}_{GP,FIXED}_C=
OUNTERS,
> >   * so iteration up to KVM's maximum counter count is safe.
> >   */
> > -#define kvm_for_each_gp_counter(i, mask)     \
> > -     for_each_set_bit((i), &(mask), KVM_MAX_NR_GP_COUNTERS)
> > +#define kvm_for_each_gp_counter(i, pmu)      \
> > +     for_each_set_bit((i), &(unsigned long){ kvm_gp_pmc_mask(pmu) }, K=
VM_MAX_NR_GP_COUNTERS)
> >
> > -#define kvm_for_each_fixed_counter(i, mask)  \
> > -     for_each_set_bit((i), &(mask), KVM_MAX_NR_FIXED_COUNTERS)
> > +#define kvm_for_each_fixed_counter(i, pmu)   \
> > +     for_each_set_bit((i), &(unsigned long){ kvm_fixed_pmc_mask(pmu) }=
, KVM_MAX_NR_FIXED_COUNTERS)
>
> Right, I didn't realize C99 compound literals could be used here.
>
> However, with this suggested code, kvm_gp_pmc_mask() would be
> re-evaluated on every iteration. It seems this =E2=80=9Cexpression with s=
ide
> effects evaluated more than once=E2=80=9D is not encouraged by the coding=
 style,
> is it?

kvm_gp_pmc_mask() and kvm_fixed_pmc_mask() have no side effects, right?
