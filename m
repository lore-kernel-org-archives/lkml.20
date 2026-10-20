Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.237
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502315;
	b=bCwObh7qJKxdX2VZfh4Qdw4tYrPsu1IsFYvIzCI4b2VnOtRvJgIX89C9tfDZzTYCGo8G
	 Pd7TO8z4/YvwpZzJF6GC39bpzux2EXDGaWS/AeMeBoYIvLxWn9///qfznyk8Y0P+N2/x3
	 JETWJgKHsrma7qVpSlnxzYXO9QLamIIe9HBbwhtxhtfqyDqUGzBg8XTxeDTOZkjqkUR3s
	 v+bFlNlHmjN8zLvBeiKcki4JuGnaXwcmNoME5inLbpRGG54MQeOXtgFUzhalJztd2FAcv
	 YCw8NgR7HYsATzZ87laGYMX3Ik8pqN0Szo6Je+F1CRbbZu20dcuHqI9pxQTKe0wCXuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502315;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zhQTHhRDxrb17zR175fyiocPa+1wRm/9Uxlolic7thk=;
	b=DtMUh5L63zAKftAqxbbnFLSTnOfyu0Zij0yKBa1gIa4ocIiIiqV4IeNBlsR/6fusTLMW
	 sfi1JY/Kvm+YH2EDEJtDgmbeJC9UDKziYmWK4c4kvrynaim3HoEu/Y4svLZBbRCnWpUFp
	 baKDGV1GoJr9D/Ew14mxEWD5bi0I44ybwvgCkI0TlAaqfyWdSZ+csxUHGGrYYRKUf/HZT
	 i/qTEoetT2KBmJpFJi6KqPaIYuqHwMRBXDUvPhvhvd27kdcxFDwsnjiIaFTLwGqowZw7h
	 DDvgksIesVyMK/FCQnCNZQxO+vNuyUqs57ChpDvm9TZv2OtrKGYqZGiV5kBW62FFpow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HBbS2wsS;
	arc=none smtp.remote-ip=95.215.58.237
Received: from mta1.migadu.com (out-237.mta1.migadu.com [95.215.58.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80986606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80986606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HBbS2wsS
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=3yy/71fTKQCgcgYM/XB0wovh4NMYwl9+gtTV2Y2B9rQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792502312; v=1; x=1793107112;
 b=HBbS2wsS9fHLsWUpvBznfbcwV33HnhT9lV/rESE1ThDnpyuoEUVw6eYCAMF2U4atRzjEmKU7
 ekR6SNgspeMaWQgrTQi85ZzdV/ktr+y470wRM1cs/LOrrZvSBK0S0c7Kk/Bfy7sNWfyvUW9IC5m
 L0CPqLR3wPgV6F2GYmP0F/+s=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 6e98f1ea0d4109de;
	Tue, 20 Oct 2026 13:18:32 +0000
X-Mizu-Trace-ID: 6e98f1ea0d4109de
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6865e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:18:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwCcFjRpJ7n5TuPawer/xJgAd1FDZ06fhgW1q3dsPAJId7xKFri45wkWodf8ukaafDX41I4+IGQE7epU8A=@vger.kernel.org
X-Gm-Message-State: AFq9FYKNpiziZcdMb5HLq2Rq2MNLus+i/uIEv2Hpa9ssUw3p79HGG/ll
	572OHl61BsBLzSdnZ74vYx5ayYoChsdvq1I+XMvBLte3Go67w5Mm4f7ae9PeKUOnxakYwcoj+Yo
	jRR83z8+Dx36TLQACZo260ZT4W9hvGlWczUoaKPhc
X-Received: by 2002:a05:6512:10ca:b0:5b7:6707:e44c with SMTP id
 2adb3069b0e04-5be66f2d62fmr148849e87.12.1792502311357; Tue, 20 Oct 2026
 06:18:31 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019132103.3836646-1-fuad.tabba@linux.dev>
 <20261019132103.3836646-4-fuad.tabba@linux.dev> <atdXdtXXTH-6DWVt@gremlin>
In-Reply-To: <atdXdtXXTH-6DWVt@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 14:17:00 +0100
X-Gmail-Original-Message-ID: <CA+EHjTzH_GA=Vigd_nDXKDFAPCJStcANFFLeLXvsh3UqpjOpCQ@mail.gmail.com>
X-Gm-Features: AclHuK-euDF0wuuv5pnt6Njq_PrWwxGpuc1BgLKpLexvwAe-pbj6xoTqUlxrbHk
Message-ID: <CA+EHjTzH_GA=Vigd_nDXKDFAPCJStcANFFLeLXvsh3UqpjOpCQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] KVM: arm64: Sanitise MTE tags when a permission fault
 installs a mapping
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Steven Price <steven.price@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Lorenzo,

On Tue, 20 Oct 2026 13:14:01 +0100, Lorenzo Stoakes (ARM)
<ljs@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -2060,7 +2060,7 @@ static int kvm_s2_fault_map(const struct kvm_s2_fault_desc *s2fd,
> >                  }
> >          }
> >
> > -        if (!perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
> > +        if (mapping_size != perm_fault_granule && !s2vi->map_non_cacheable && kvm_has_mte(kvm))
>
> So 'translation fault or permission fault if this will install a mapping' rather
> than 'translation fault' alone right?

Right.

> Just after this code you have:
>
>         if (mapping_size == perm_fault_granule) {
>                 ...
>         } else {
>                 ...
>         }
>
> So you could put
>
>                 if (!s2vi->map_non_cacheable && kvm_has_mte(kvm))
>                         sanitise_mte_tags(kvm, pfn, mapping_size);
>
> In the else branch? Seems neater and clearer.

Agree, I'll move it there in v2.

> Also I wonder if the !s2vi->map_non_cacheable && kvm_has_mte(kvm) check could be
> abstracted?
>
> E.g.:
>
> static bool is_mte_fault(const struct kvm *kvm,
>                          const struct kvm_s2_fault_vma_info *s2vi)
> {
>         return !s2vi->map_non_cacheable && kvm_has_mte(kvm);
> }
>
> Then could be:
>
>         if (is_mte_fault(kvm, s2vi))
>                 sanitise_mte_tags(kvm, pfn, mapping_size);

I'd rather leave that out: the fix doesn't change that part of the
condition, and it only appears twice.

Thanks,
/fuad
