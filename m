Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501912;
	b=LWX4LEZ/xEHKxU/sR5lTIDYhgDyEU5tZNWgGJEiJDWzqb08ajn9DjYlxqxX33KNnwJzE
	 YCOncm/2ZSKe/+5a7OnhqmWyheTHlOj6j83wOpNn5KZu0TOxziB3P7No1PCT9+sgitHz9
	 lqtyUeIaoIBSJZ5201w7rBE7iPwHIRUpeq9G1jQC1KZM7iAXzSW7WmyoddSWr57G6Vb1p
	 8jCfgpOfNgCOHrXHk3xupdilryyh4kveTYeavfoYjZcsby+biIrwYviY2rsg/AfTV5l+w
	 RuUr0SU361qECgyUSeUCYcZG+lgaQiijJYyfGPg7mPXqknd3jCTTkR/mHqhId1BkT9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501912;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=/SUtRRL7fFOVx3xS2Q3jVLLMRlhIGOOjpBbDS0FruaY=;
	b=dK0l30GQlspCwED5X/deS2JzVO4e7a0GdQ0U0oZW0wzg5VpToID+4obUjXgyT03eZbwh
	 VIsydX0JtZzOozucoJr+rei25P09D+25HWb4LJnmQ+AQpDQoDF+2/NX+gVK+d1HAwKy9G
	 rrKeOb+najTLqY+rgZCOQ71losW1CJspeVZK5kLpFbUgqnYAbeCoqntqh5whd3NX+lYgq
	 tYOowVfgUBmFNFo1X7y6yrbAOzXBhDoCYAgJZVL+EOgOeJKED+DRoeT8yeFddYZXajdsF
	 34Brb8FzKUhZLUlIyL/IOK1IYOkZ8sJxN0FRpbmfA6cyfLnhqouN9h1cBXzVUOstZEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H0KgaTdo;
	arc=none smtp.remote-ip=95.215.58.28
Received: from mta1.migadu.com (out-28.mta1.migadu.com [95.215.58.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2A9606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:11:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD2A9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=H0KgaTdo
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8VOtYkZ2466K3qFYYyJvUToJ0S8DZXQ+CH6HzzvGHMU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792501909; v=1; x=1793106709;
 b=H0KgaTdouydMMubHOwQkjMH4ttNbEc95v2qT8WuFYAddMJK1aFeT34qk89ht7BLrAGm5HGQ2
 WB/xpNUBWzlq2q8qIglV/tYgw82yFqgrNieb/AIfhbi1q42y6Fz7xn1RciwgMa8fdUlhczW9sSG
 T2ePtUXKetXpwL74WaCaIVHk=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c95b78804c15698c;
	Tue, 20 Oct 2026 13:11:49 +0000
X-Mizu-Trace-ID: c95b78804c15698c
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so6780e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:11:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx8QbEvclR5NwDl8kNU1A711/PVpijlm1tHk6xwpeyTNOVXUtcT7TQYqwFWujDbEjcx/W1uwMhGJjwN+8I=@vger.kernel.org
X-Gm-Message-State: AFq9FYJyxRuZg0hNGWX4mzQPJQc0ni6E5IMTksMnhWAZJCgK9GR9VrZO
	C2vu17gNUGmF8Lqs4joXe7qcqiVSaUJl5UfFsSv9x1Ol1Nv6y+2QyeT5xOuF3pTKMk4XFzq94Qw
	oCdqysQ6VvQE/ZTBlV810TgYme9vXv1VOLid6aqpo
X-Received: by 2002:a05:6512:32d5:b0:5bf:6c49:434c with SMTP id
 2adb3069b0e04-5bf6c4946d8mr42776e87.10.1792501908190; Tue, 20 Oct 2026
 06:11:48 -0700 (PDT)
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
 <20261019132103.3836646-3-fuad.tabba@linux.dev> <atdWIpk9Qh8ngs-Y@gremlin>
In-Reply-To: <atdWIpk9Qh8ngs-Y@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 14:11:11 +0100
X-Gmail-Original-Message-ID: <CA+EHjTwb9V+12siUswmUX0-jr=sidKdAJ+vht+HyqS0KgA6v6g@mail.gmail.com>
X-Gm-Features: AclHuK_VB8b2JJ7L3ieaAtlIC-DnIJuANGGUM1BoyrOPOd60UgfcMApklQSkE2I
Message-ID: <CA+EHjTwb9V+12siUswmUX0-jr=sidKdAJ+vht+HyqS0KgA6v6g@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: Clear the whole hugetlb folio when
 storing MTE tags
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

On Tue, 20 Oct 2026 12:58:13 +0100, Lorenzo Stoakes (ARM)
<ljs@kernel.org> wrote:
[...]
> > diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
[...]
> > @@ -1042,12 +1043,14 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
[...]
> > -                        if (folio_test_hugetlb(folio))
> > -                                folio_try_hugetlb_mte_tagging(folio);
> > -                        else
> > +                        if (!folio_test_hugetlb(folio))
> >                                  try_page_mte_tagging(page);
> > +                        else if (folio_try_hugetlb_mte_tagging(folio))
>
> Slightly awkward logic, testing a negative then the negative of the negative
> (i.e. else) plus folio_try_hugetlb_mte_tagging(), makes it a little harder to
> understand.
>
> With mte_clear_folio_tags() you can make life simpler:
>
>         if (folio_test_hugetlb(folio)) {
>                 if (folio_try_hugetlb_mte_tagging(folio))
>                         mte_clear_folio_tags(folio);
>         } else {
>                 try_page_mte_tagging(page);
>         }

Without the helper, the extra level of nesting takes the loop body
past 100 columns, so I'll switch to your version in the separate patch
that adds mte_clear_folio_tags() (see 1/3).

Thanks,
/fuad
