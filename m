Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDB4199FB0
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 00:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792109693; cv=none; b=hxdR7HIHqCCLSeee+6UOZVf0HmrxqqKdUWgnxdI05qZarbBb9jLyPyvI9Ih9yKUrHly9g+hk0abyH1lkJAJ2arwn9MNzlnu+4Bn4GXvK/FqNCUCAr7jV6Z66cc8eIc+e7CSgrGB4DHMAWRq49i9pTB7Kv00CBEOQxrAOItRa4/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792109693; c=relaxed/simple;
	bh=N3hAyy7nTu0uD6uxxEosrsvSAc05WwQLSTSIID6INNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oQL4ihDAGmXWvS783iA18OArqFb6kN/OAbu65qwzlQJiTYgUVpb7l8ls0Il5N197RVMZ7Xuhr2xKyfHqH6bIqwbBfSiQyvNjfGkSVS6A4CcTgBsHE7Pj9YFR+XPoym8V80TD3jOjo6N/9xQ0hrZIBGS8zCpo/fz75ioJjAa/AAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=T/StiSJg; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="T/StiSJg"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-5351d76e1baso5830021cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792109691; x=1792714491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V2saNd2pf5xXpmgizEGMG+P83blHZRupazL/vtIJhv4=;
        b=T/StiSJg9NKkj9ibcSWBMEe5hjKjl5QSwtnEiP3tJzvpn/R0nSFhQSE2BteEpHDzDF
         4uRGBFJHEJaC8NsxylpA+ABes7IxI2+87ROJ6dQn0dhETh3oLKejUQcI3XVrCeooZ0jN
         LBuzzRkKgdH7XqHEVZM1mVh+4VYM5srvaGbH7cRqoiS+NpWHcQ3PPJ8hSNCRl3zf0jSx
         OC8glC/BwOAeoVt/aqPc6qBd/KOujSyKOKYhxMVH9idVTMQYEAS0+Dk3trwFqSQzgoDP
         Ukq63JkewdwSwFPWIY5gvBVoi5Iy7viGPaetFhiagl3amNV78U7Bh5Yi+uua5qHdSPpB
         aUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792109691; x=1792714491;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V2saNd2pf5xXpmgizEGMG+P83blHZRupazL/vtIJhv4=;
        b=CQdFT0NVHZEVs96SPJFKpHXTB9t/qSmlL7B0x8/PN6w08Ht56cCeafHPZGGjPbPCf3
         rg6bxvp5EfKiiSysuugpj2fUBLGQluOuKy/I+eL+eZxK/3Q+uiRBnfXyge2Vb2bZckSb
         Wxdz1RsszUIJuTb2N5J81TJmh6sZxX4MBFBEwZhbqmxSwV9B9PTLnncDj7TeGH52eIwy
         JYLM5iYOooO58ShP8mYFuis7LNkCUApwpoV3TSDFce2YAGljfUcVuo+mzAYzd1E9joD6
         bMgB2yYiPqKq4d59tQAzlT/6mTUhtwZM7/Dbfh4/6uLQlWchqi9wJM83EMXnN64yyQY0
         860g==
X-Forwarded-Encrypted: i=1; AKwUvBwrYpwCFUbW5q3zoXfK8wz8kiwHMxab85a78CVFpfiCwsFJ06JPH60LsusvvAbTgYwvsc4eVp2FLVxK2R0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlpVqRJp8F9Zq0Tj4K8dg6kpd3uyMh7KqjF/lzOXFHhQ/1Vjq/
	9mjzItPz2QAkfOUbAJKJTMyfBEOCmCoQXP2Y1r/ZPxHyCOF1glLS8UxVL3FaheSqVEY=
X-Gm-Gg: AYBFou3s55ljsWMX7WCaTy4aR6kw6Vq5MxC91AWIIh+3MJlTFyJH3UYtZP1MR+kR8oU
	jJfyWCtTKKdM5JHd2LM8Knsm7Ea2yxoL3l+LfaRxCVgbZ76Repyx1VJQNv95HAAJXJkLA9mm6KY
	yHdo44C1ANrORLfdd7kf0NKxmiioUFW+vPGfaiB191VgimTSsl9qlWQyuWOfCO2RctOqqoGKPrl
	eDckAGGTaq/ai4AhD2VJrqkhOgkIlMzp45uvrIxcEoYD54njl7GfiaoSQoLL6hEQX/+Znbu4SyV
	gEx7OiMf/aIASMrZSa/iV6/882K5Qo/2GDnbcBC8PZ7lgPfeAU8W7C8CDMG+t3T8RvoALh6XSYM
	ADZ9xsVXBTUktGQiZY7ws9yiXFgSL3CJ+1+Y/R4g9hJZZjexDsJPMcEBdPOLFDlRWIU4NHXUUgw
	vFMg5WJDHa3MLpz84WevSmYJXHr3SaeoM3mgT2dGXahBV+dfGnLCe0+1gQCFOmtgB1vCVx4ftmk
	R2odj2PC2VFkTUM4EIgaWT6TrVkx1eNA36v5Y4dKWv0HwMToBYVo30M
X-Received: by 2002:a05:622a:990:b0:535:ba01:d95 with SMTP id d75a77b69052e-536272c2d55mr30900421cf.19.1792109690637;
        Thu, 15 Oct 2026 17:14:50 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5362aa57106sm7257071cf.28.2026.10.15.17.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 17:14:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xHVay-00000000IxD-2c33;
	Thu, 15 Oct 2026 21:14:48 -0300
Date: Thu, 15 Oct 2026 21:14:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Fred Griffoul <griffoul@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Kevin Tian <kevin.tian@intel.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Ackerley Tng <ackerleytng@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Steffen Eiden <seiden@linux.ibm.com>, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [RFC PATCH v2 07/11] iommufd: Use large IOMMU pages for provider
 mappings
Message-ID: <20261016001448.GC14213@ziepe.ca>
References: <20261014093733.90312-1-griffoul@gmail.com>
 <20261014093733.90312-8-griffoul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014093733.90312-8-griffoul@gmail.com>

On Wed, Oct 14, 2026 at 09:37:29AM +0000, Fred Griffoul wrote:
> From: Fred Griffoul <fgriffo@amazon.co.uk>
> 
> Provider pages are mapped with one PAGE_SIZE entry each. A device that
> uses a large provider block then misses in the IOTLB on every page, and
> the IOMMU needs more page table memory than the block requires. A
> revoke also flushes the IOTLB once per run of pages it unmaps.
> 
> Map each block that the provider reports with large IOMMU pages where
> the IOVA and the frames are aligned alike, and with smaller ones where
> they are not. Only the pages of the block are mapped, as before.
> 
> A large IOMMU page can only be unmapped whole, so a revoke that cuts
> one widens its range to the whole page. It maps back what the provider
> backs now, and a device may also fault on the rest of that page while
> it is remapped. The widening finds the page with iova_to_phys():
> pages that only look like one large page make the revoke remap more
> than it must, which is harmless.

You are going to need to go into generic_pt and implement cut and a
more suitable unmap to make this stuff work properly. We can't over
unmap on conversions.

> iommu_unmap() may not split the range of one map call either, and
> virtio-iommu refuses to. Map each IOMMU page with its own call: the
> widened range ends on IOMMU page boundaries, so it also ends on map
> call boundaries.

Also please don't write commit messages with AI. WTF is this even
trying to say? The subject is "use large pages" and this text says
"map each page with its own call"

Jason
