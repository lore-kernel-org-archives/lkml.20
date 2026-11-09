Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794205363;
	b=Rx2eoCkdyG2i/cJU7httVXZ2QUykaB0M85KJ05B9bYlDm3TRpjncKqTSkrIg7s8DliSa
	 Sv+guQ4TINJuSgZs6zE5jwfkTFqbZa7rlfIuyU3DMcyFPKmuRpqGEtoROGsEptEjnZ83p
	 PSmd3+XZXo5T2IZ7VqzRJMnwpzIFge3OA19HTPaQMF9WxGnejj9wrQwdg1SNQG0UMw5+0
	 JeN3N0wJ6yRtY7zE4kdPniDPejTK5JFOJzkr8HhE/FFYxYNwzklXawsAMr4VGzvnd2GNI
	 ft+BC/vzEgTliarJthjNJBPPLboDAzanDvG15tOtaH+NKdUiyNw323VNkcGxHZr6BCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794205363;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZA63luVCcUm/rcUMYSE6kbch+b4UxpuSVxYdwx6UVuY=;
	b=E+ng9nDb3r6a+vqyYPc7Rlu29CZHSKU95JQoMo5TRL4jNA3K1fuLLhZTHMNfMWfqmFxS
	 +4Kz1VtOFWTiITNQSV2i7PQml06fSmLyx47rkVDRTKKfr+QQ03wgef8vuOT7QttaM55/u
	 RWuVGyNjCfLhxkzreaFum5AvmGS5tFj+KMQYVVQNh07Hn5UMmaIoDqgvli4ZfNAbq1eA4
	 hEGS0Z4q9K6o0SK0PIZeom9/6On2M4EOx8MqPyyiPr5K5PJJVTECkNS7ofM4N+TdtnUwb
	 XJ+tKjeAzzmS2BazUYj3varobcrGMOll44HmGMYK8SRuG5HRmCe2EvxxtV3TzANYVnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTDmNLIg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF1D606A321;
	Mon,  9 Nov 2026 06:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mTDmNLIg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0B81F008A1;
	Mon,  9 Nov 2026 06:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794205363;
	bh=ZA63luVCcUm/rcUMYSE6kbch+b4UxpuSVxYdwx6UVuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mTDmNLIgFiFwQeKbp4CMfjVX+h4GlITRDvYMD8FO9glhG/g4prrJIRnsH/XA6mrqk
	 KZHT3JCdSldwDf+HAmkYhqyzNX7RIICj9z7FYzjFYp8Fuk/T7pkF0QeXLcG7AWIo9i
	 KgU8apAwsf8d7sKCxaPFkaNvCarJsW0jzSix1Pd0iao0MPfHPCmjyssAS/MB3ULpJQ
	 598v4SkCigLCevg13d7vrUze2LeVfCu9q4JUe230MOAe2131CzkMqCquO+EC35jHJw
	 bvKH9HXR2oRh463I4q+2R4nTIkUhSiLPzN98NzjIPb4tcVpYrgp+nUXVYIHhtubC95
	 40b+tagd1SqIg==
Date: Mon, 9 Nov 2026 11:52:33 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Will Deacon <will@kernel.org>,
	brendan.jackman@linux.dev, catalin.marinas@arm.com, rppt@kernel.org,
	akpm@linux-foundation.org, sudeep.holla@kernel.org,
	jenswi@kernel.org, robh@kernel.org, mark.rutland@arm.com,
	ardb@kernel.org, thierry.reding@kernel.org, david@kernel.org,
	danielmentz@google.com, linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org, op-tee@lists.trustedfirmware.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/8] arm64: Unmap FF-A lent memory from direct map
Message-ID: <avFmqak7gxqCW3UB@sumit-xelite>
References: <aruh86rd5FMv2i9G@willie-the-truck>
 <ar5TPvANFUoosxGW@sumit-xelite>
 <asOAYODGZa-7EIV1@google.com>
 <asOD31rTX6dNfD1o@google.com>
 <aszdnInyJxLhSQRp@sumit-xelite>
 <as3798SFCfKFirag@google.com>
 <as4ATqhp0bPI03PA@sumit-xelite>
 <auILvMVSXk9pZh6M@google.com>
 <auQ5hCdPFz0BmvDG@sumit-xelite>
 <au2vtZFyfUVWeils@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <au2vtZFyfUVWeils@google.com>

On Fri, 06 Nov 2026 at 10:45:09 +0000, Vincent Donnefort wrote:
>[...]
>
>> > > Yeah I saw that constraint too, let's leave it for future extension
>> > > then although having this reordering dependency fixed will be ideal.
>> > >
>> > > >
>> > > > So the only case it would work would be when a reserved memory has set
>> > > > "linux,cma-default".
>> > > >
>> > >
>> > > Let's rather just turn DT based default CMA pool to support PTE-level
>> > > mapping and keep it configurable via Kconfig or cmdline or DT.
>> >
>> > If we need a DT declaration anyway, a Kconfig and a cmdline option aren't really
>> > necessary.
>>
>> Agree, it rather makes sense for DT independent generic CMA pool.
>>
>> >
>> > Also, Rob wasn't very keen on having a DT option for the reserved memory and
>> > suggested to have a compatible string instead [1]. So perhaps we could have a
>> > a separate driver that handles the unmapping.
>> >
>> > 	linux,cma {
>> > 		compatible = "shared-dma-pool", "unmap-on-alloc";
>> > 		reusable;
>> > 		linux,cma-default;
>> > 		...
>> > 	}
>> >
>> > That "unmap-on-alloc" driver sets the memblock flags and register some cma hooks
>> > (to be defined) for cma_alloc/cma_free where it unmaps/re-maps into the linear
>> > map.
>> >
>> > The nice property is optee won't need to be modified anymore. The downside is
>> > the entire pool is now mapped at PTE-level.
>>
>> Sounds reasonable to me. If folks are really worried about performance
>> with generic CMA PTE-level map then OP-TEE already supports no-map based
>> reserved carveouts for protected DMABufs too.
>>
>> -Sumit
>>
>> >
>> > [1] http://lore.kernel.org/all/20260902172436.GB1440252-robh@kernel.org/
>> >
>> > --
>> > Vincent
>
>I have just looked deeper into and cma_alloc can't unmap automatically the
>default pool. Callers expect a valid linear mapping right after the alocation.
>dma_direct_alloc() and dma_direct_alloc_pages() zero the allocated page,
>dma_direct_alloc_no_mapping() runs cache maintenance on it, and the userspace
>available heap /dev/dma_heap/linux,cma zeroes it.
>
>Also, it isn't possible to use two compatible strings for the reserved memory.
>The registration stops at the first matching compatible string. Layering drivers
>won't work either.
>
>So while the pool can still be generic and serve as linux,cma-default:
>
>  linux,cma {
>      compatible = "unmappable-dma-pool";
>      reusable;
>      linux,cma-default;
>  }
>
>We can't escape providing an additional API to unmap/remap in the linear map.
>

Yeah it's fine to invoke these additional APIs post the CMA allocation
for protected DMA buffers.

-Sumit
