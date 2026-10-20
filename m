Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.164
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792501828;
	b=46M1TZnPqZrYjrwtM8hsUAkNrQyWQbGMpl8UuYRKlv09tnQSbMO5/xeaDu6xrBqF9ZoC
	 tG7JZxNkoKN2hEzDmGCSr92ZGp47OQsiSsAdILTWjfMSMVhCH0Cpe+Rq9i0toD+fSm5ne
	 WCqq+FM2hdMuQHov+k4ZhuYEktUoCB4oSUaNzZNnoXUoJFkqZqH8eJIsSpFSStnmd2Uma
	 mS4zZ8dboTxdBoMHVX+bQSU2Hx3mGwa9wjwuG3kn8tRVjlaju2SS8K/ZPHOHQeigGx/ZK
	 rulLh9rqU2LavAy/wiYRn3E9FBcAgwHhNlL5LLNTXE9ZQiGTE9M04JCK0bSza+7pcxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792501828;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9m/I1RoZLvF6ehI7aCwLnUGlQK9U6ng9p3EUpENngvw=;
	b=3Johf6QnYQl9htile1gTQrMnz5DatVF5cW8BjETQMRYlELY2Ofa8fXpjeSSrPiZawYKr
	 KXnldmDZvKudl0l4mtnIA/XzBp14fj5BHn1WJZOGB+uTTFGk5K9Q94/hGylQ2osN+l511
	 ZzOjts0M1g9UI4hWLYXzXpCNWUYJs5fupcGDioeWVa7pS2MeS91xRzKkTPCPA88/ZYrXi
	 UuLvFhVyIiUj3EwqrNgmPOMKmQbGklD6sFK3+Hlv+jVuhWZgclfwajoXx3VfZajj/3tZP
	 JlwFDB5LhMi5v458ZxEgJFmABIbeEIwiYyyZRlug2cLlC8hJm8shHYVs0qIuXBxWFPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MdBGF8Iy;
	arc=none smtp.remote-ip=91.218.175.164
Received: from mta0.migadu.com (out-164.mta0.migadu.com [91.218.175.164])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D30606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:10:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94D30606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=MdBGF8Iy
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=yKLSf2H2uB/fvU8iF2pBxn3hRQc14Pjhc5mRWAVCgkA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792501825; v=1; x=1793106625;
 b=MdBGF8IyZH3vWs07hT9uc08LO/5YfqMomc4G1nWhFghFXWpd0ZK+OYfQWeaI2jL0ZbMxwBtV
 qDgkLaLjTOy6n8KC8CFjH8Mg/2d0FzXc7MQBHnsTXj3GN1ouz+sc9S+N/U1hQOM5A7sd+B/UcXN
 EW5Bdlzr0kATCcxY4qDmFDlI=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a8faf15bf44fae39;
	Tue, 20 Oct 2026 13:10:24 +0000
X-Mizu-Trace-ID: a8faf15bf44fae39
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be58ad9600so8497e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:10:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzGpd9fH1rOyR/iWkGx8rEpGb9ZkSIhV3EJcKmBoNRW00WBpGl6tqh7bki6cZXd95sgu/t70nl017kYm8s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQEkhNacVjr1nLN27MEc4IKPTl/asAVxZ53lGgMXegx8jjbICx
	QDTCsGy0MjrSFWUa11aM5irxMwaS7Fo0BQkIItEyJ17dWlxWiUKRtcUnbbHf7PANa1kkxbTP/WT
	XRZoIinKP4lPEFhDU409XzmkuDmTtCcOQSdCo82Ny
X-Received: by 2002:a05:6512:32d5:b0:5bf:6c49:434c with SMTP id
 2adb3069b0e04-5bf6c4946d8mr42473e87.10.1792501822812; Tue, 20 Oct 2026
 06:10:22 -0700 (PDT)
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
 <20261019132103.3836646-2-fuad.tabba@linux.dev> <atdUzfOA1Obd7Mir@gremlin>
In-Reply-To: <atdUzfOA1Obd7Mir@gremlin>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Tue, 20 Oct 2026 14:09:45 +0100
X-Gmail-Original-Message-ID: <CA+EHjTykGoHmDt82Cz=eEeBoqpjDRnhKEVGnOhTprn4dLxLZKQ@mail.gmail.com>
X-Gm-Features: AclHuK8UhwO50ViPhbRl1kWyZ66tD2KPFO0KN-W-K2Tt6gXRY6TnmJPvFFaY-jU
Message-ID: <CA+EHjTykGoHmDt82Cz=eEeBoqpjDRnhKEVGnOhTprn4dLxLZKQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] KVM: arm64: Clear the whole hugetlb folio when
 sanitising MTE tags
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

On Tue, 20 Oct 2026 12:52:54 +0100, Lorenzo Stoakes (ARM)
<ljs@kernel.org> wrote:
[...]
> On Mon, Oct 19, 2026 at 02:21:01PM +0100, Fuad Tabba wrote:
> > sanitise_mte_tags() clears the tags of the pages about to be mapped at
> > stage-2 before marking them tagged. For a hugetlb folio the flag covers
> > every page in the folio, but the loop only covers the mapping being
> > installed. Stage-2 maps a folio in pieces for the contiguous hugetlb
> > sizes, and for any size under dirty logging. The first fault then marks
> > the whole folio after clearing only its own piece, and the rest keeps
> > its previous owner's tags for the guest to read.
>
> I'm guessing the folio size is always >= size here?

Yes, the stage-2 mapping of a hugetlb VMA is never larger than its
hugetlb page size, so it always sits within one folio.

[...]
> > diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
> > @@ -1514,7 +1514,8 @@ static void sanitise_mte_tags(struct kvm *kvm, kvm_pfn_t pfn,
> >          if (folio_test_hugetlb(folio)) {
> >                  /* Hugetlb has MTE flags set on head page only */
>
> Is this comment redundant now?

I'd keep it: it's why the whole folio has to be cleared, as the flags
on the head page cover every page in it.

> >                  if (folio_try_hugetlb_mte_tagging(folio)) {
> > -                        for (i = 0; i < nr_pages; i++, page++)
> > +                        page = folio_page(folio, 0);
> > +                        for (i = 0; i < folio_nr_pages(folio); i++, page++)
>
> I know it's a stable fix, but the fact that this pattern exists in multiple
> places really argues for a mte_clear_folio_tags(), which would make this
> trivially:
>
>         mte_clear_folio_tags(folio);
>
> And avoid the re-use of page etc.
>
> It's not a huge change and makes the next patch in the series simpler too so
> arguably could be part of the series?

I think you're right about the helper, but I'd rather keep the fixes
as small as possible for the backports. I'll send
mte_clear_folio_tags() as a separate patch on top of these, using it
in mte_sync_tags() too. In v2 the loop uses folio_page(folio, i)
rather than reusing page.

Thanks,
/fuad
