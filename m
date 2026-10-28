Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194111;
	b=s1qrLG0YDl8gwaUssTsUGKxmGnoFB94NfcBU0qhEWpvHWCvmHv5Eu8rsDtbOr6hNTICJ
	 JObI+QLKFS8mgVr3gQbL/9CG/GJEBWzzQUc8RAbE98Ovn+2yVaNII2Y8pl8725iMZcJgz
	 rDEkf3+Owd2YgEXbIg6w3TSEcPRA0ZEUGJXk8W1hkldnlSs6qJcsMSY+Fuv1EpGn/rC/x
	 FCMbUYMwxLdQ0E/Z9TJeUMdXAeKgIGnTLbNCVV5NTV02MrGjSRe3sqo2QkqaI8YhT4xzE
	 No6e9J0BqapHSg/v0IkY9zhNBfePw9xUOJI45xxprwA1t8d0RoJhEsFydKom2ggyXqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194111;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=W1HmmaCLaDmxQDxSww48MVKAfAl+hw686KsydqXGP8E=;
	b=pdcpsmelMdudAWm3DkuOGW53yFXHILjuvNycpqTQz55Z/04iQNbD9SuWZhFthX99rGUe
	 CvELxvNh+9Yokh8Yj9HLy0A0vXiq+KMxqi9cvAEA1yjRkwg9xKPuK29FK3kmELpKzZhjf
	 41w85ld+PwPiNudgFyVE9WkvLAg1C+9WUIIjSZjy1P7Aar4IX6l3W9W6ZCAvdC5vw9vaa
	 IyWmqTUjBcLJvoTt3jasro95M+Xd8SR6j1yePE25kYl9JRHp0LejcTyBQqC+HpB1UjiaM
	 0tl1ubgXtiD+JMoQy3R5/lqJ6b107tKZu5aoYv3yRHQKMiLOZBuiNXLvdURqoqmW7/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CcZxcvL9;
	arc=none smtp.remote-ip=95.215.58.21
Received: from mta1.migadu.com (out-21.mta1.migadu.com [95.215.58.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3881606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3881606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CcZxcvL9
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9P2Z/y6NjVdpld2CTv7DpvYDbQvScjoFFhdxAr3DRcA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793194108; v=1; x=1793798908;
 b=CcZxcvL9sU+ey//rfsmDA1wHwj9YPuBtQvWdXjivRqdQ8FpeAzJChwP8zL3r3nVW6wj1dNge
 YgNwC0kpSYeMJNRFanXkHdGu9H3Td6EGjliruCrS89U8zwjOu4n4Uf1YxwMc0sSrBibc4Nw/uzG
 2JpLbzeHST/uNL6aYAmel/dY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 5714c97e61014e30;
	Wed, 28 Oct 2026 13:28:28 +0000
X-Mizu-Trace-ID: 5714c97e61014e30
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6483e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:28:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQs2oMuuy6oAXK3dPkOqa45CWeQhAsdUunu32HPGmow8l48iBpU93ujMAI06BdMay/CVQlZVtqN5ZI2bk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvo7ksaBND2KYrm0vhKN6HeJtA7+zkX//4FcJxokYOFpRzad7B
	QiFvwCBtBKiCNt+DlidO2I+Hs1bWkNgLV4Hta20BzI5RHwKWuHrMbouke4QePsLnIpIamFvMqE6
	VHTR/Ay/p79bNsbEUiIHBxomj7LnBH28ZylgPLubQ
X-Received: by 2002:a05:6512:3191:b0:5bf:a191:c132 with SMTP id
 2adb3069b0e04-5bfcadddf9cmr156064e87.2.1793194106543; Wed, 28 Oct 2026
 06:28:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028110739.2366566-1-fuad.tabba@linux.dev>
 <20261028110739.2366566-4-fuad.tabba@linux.dev> <86mrryxa0b.wl-maz@kernel.org>
In-Reply-To: <86mrryxa0b.wl-maz@kernel.org>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Wed, 28 Oct 2026 13:27:50 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzNWj06JAJsJJgojC1j+TuZbfQbyB-5s+h=9DbOtYU1BQ@mail.gmail.com>
X-Gm-Features: AclHuK-dO70Ki_OMkN_Ee00KAstB-ItAriaRWTmXYHNfORmvfHh-SoeIMyJdhEA
Message-ID: <CA+EHjTzNWj06JAJsJJgojC1j+TuZbfQbyB-5s+h=9DbOtYU1BQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] KVM: arm64: Disable host PMU counters for
 protected guests
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Vincent Donnefort <vdonnefort@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, Oculytic <oculytic@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Oct 2026 at 12:52, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 28 Oct 2026 11:07:39 +0000,
> Fuad Tabba <fuad.tabba@linux.dev> wrote:
[...]
> > +static u64 __pmu_stop_host_counters(struct kvm_vcpu *vcpu)
> > +{
> > +     u64 pmcnten;
> > +
> > +     if (!vcpu_is_protected(vcpu) || !system_supports_pmuv3())
> > +             return 0;
> > +
> > +     pmcnten = read_sysreg(pmcntenset_el0);
> > +     if (pmcnten)
> > +             write_sysreg(pmcnten, pmcntenclr_el0);
>
> It feels a bit odd to change the individual counter enables, rather
> than just use PMCR_EL0.E, which is designed for this purpose.
>
> It probably doesn't change much, but it'd certainly make the intent a
> bit more obvious. Or am I missing something?

Nope, my miss. I'll move to PMCR_EL0.E in v3.

Thanks,
/fuad
