Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793034633;
	b=MJbuU1wMDefQVnhrxgyx1qgrxwlTJk2xZX9aTyKXE4myfQ2mPOHUFqOdwXDwelFmyJAw
	 3f+t+SEhk0+t3sXOe1LTaRciSAXyHyVjP4/jxEjAWyw3IY2v8zon1ex9Dk7Zw+94jkV5f
	 LhhRwCunOXGvq4tLMf8h1Nbsp9amWvphQAqPiuO3lIr72xkcNo9P2UJN0wmclUPQGjMQ3
	 3E5pG3jNzVZrr0QkIPfm/4vnSu4A1Q/ObqNtz6RvCeSiAA8QSAOMNZJIHu2Jq51uA3huB
	 BxrzzfUZErbNhdw0GoZ6bz1rteqdDpCx4vp3T19Z3coaFOj+d1PuOnyBsmwAHRKQeHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793034633;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=PYgl4/AlR9E7qD/6t01/AqAhjtHt2uKRS8XnGrG05+A=;
	b=JWsfLA57qnABfL9E7Qse0PYsLgqMZWVldF/ybCDJOBaCNiTP/ARD5EGrjiBH0YL1vJuV
	 MpX107rnhkXXSIHLFjwShLmB4CBnwa5odIlQ73P160U+tqiC5r5w2h+8OtFpVdFhV0CUQ
	 SifOTdP7mmQ7eiD2b5wijIUvNgOnOcEAaQep4ttYEkN3eRritkcyIVkCAlY95hxSy9LU5
	 56vQIWsM7aZ9+bwrXrsyT/ZRq3epo/Heg4ngTrVAwG9FHnb8t4/Nq0DmLPHzd/zvX+eCT
	 nUrp0sKD+P1n0wn4CyTGbE7T8QtPNKDKxObr79ZX2IeA/w3o42zccdpxBoRitzXzYWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IvwcoIFU;
	arc=none smtp.remote-ip=91.218.175.165
Received: from mta0.migadu.com (out-165.mta0.migadu.com [91.218.175.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50106606A321
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 17:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50106606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=IvwcoIFU
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=pcthy6ORiWzW3EmGLV8zsnkU+qv48Vriy9rB5HlVHlU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793034629; v=1; x=1793639429;
 b=IvwcoIFUwnmW6X8wZFE90I/ZGEzZdt3lwnKHTcY0+9LG9Mtcg7nt7cEoqLCdMBmRRfD0LhWM
 JVLhwl5jKMKRCSYivSEJwdUT/jyAuzwbyolm8peKQwGdCOLlGRjVz+wcQUY1x8mEmWJ/B+cRdG6
 H2w+V2lRGYQSeRzRfQNIHgbk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ca7cc9c82adf714d;
	Mon, 26 Oct 2026 17:10:28 +0000
X-Mizu-Trace-ID: ca7cc9c82adf714d
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5be58ad9600so456e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:10:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByOmP079s8ADd+NzV9inf0DDHNPSV/ybtGt0EaTY3vP4eS0UaMnrxPjcUjGbWtVuY1B0+DQWs/2MXSw8DI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKFRRx/wQV2OIBncC5Gf+s2Va3WK2Ns12nmYFEkUa8od/dEZ6Se
	U5m2Z1oPF78iL19bNha1qE6n1NNcaD3zMXzezldBVqq1QJ1dVGThrnWiJoykLwpI7guT05x8JCb
	3McwJspBjegaaFK//RX5RrziuYBfDBSgafxBVOq1l
X-Received: by 2002:a05:6512:130c:b0:5bf:c1d8:b44b with SMTP id
 2adb3069b0e04-5bfc1d8b53amr122078e87.14.1793034623586; Mon, 26 Oct 2026
 10:10:23 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025075138.2919734-1-fuad.tabba@linux.dev>
 <20261025075138.2919734-4-fuad.tabba@linux.dev> <a86348e5-a55a-4a99-a3c6-24b3213ed3d1@arm.com>
In-Reply-To: <a86348e5-a55a-4a99-a3c6-24b3213ed3d1@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 26 Oct 2026 17:09:47 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxyenZzByhAckimWUSgG5fMFVBwyB8bsC15xaoaU1RPVQ@mail.gmail.com>
X-Gm-Features: AclHuK-pKf8gC2S2-5qJFUs5PfEVBnKKd1_HAZS3RuQB33ufSZ6ApBNWFpRYh6w
Message-ID: <CA+EHjTxyenZzByhAckimWUSgG5fMFVBwyB8bsC15xaoaU1RPVQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] KVM: arm64: Add context-switch of ACCDATA_EL1
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Arnd Bergmann <arnd@arndb.de>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026 at 15:41, Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
[...]
> > +static inline bool ctxt_has_accdata(struct kvm_cpu_context *ctxt)
> > +{
> > +     struct kvm_vcpu *vcpu;
> > +
> > +     /* The host never uses ACCDATA_EL1 */
> > +     if (!cpus_have_final_cap(ARM64_HAS_LS64_ACCDATA) || !ctxt_is_guest(ctxt))
> > +             return false;
> > +
> > +     vcpu = ctxt_to_vcpu(ctxt);
> > +     return kvm_has_feat(kern_hyp_va(vcpu->kvm), ID_AA64ISAR1_EL1, LS64, LS64_ACCDATA);
>
> minor nit: Aligning with the other kvm_has_feat() usecsaes, should we
> wrap this under kvm_has_accdata() (with moving the cpus_have_final_cap()
> to the wrapper ?)

Thanks Suzuki. I'll do this change if I respin.

Cheers,
/fuad
