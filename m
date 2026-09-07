Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8775F3AC0C3
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792494; cv=none; b=flMYylVDhq+Il56YUSfLWDSLhcpqiQI4q/OCULMmzzI/eHeuuS/wGELIUgxUk7mvxiOySuV3B0M6Ps4WRMfseFtIiRjZFVg40btm/4Nc/nvX01QFuMTsfRTpu11Pznr4Zb8NQrz1JVI0Mh3VDGxdN05c7XdirgUj/PXrj9vc/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792494; c=relaxed/simple;
	bh=3mn/eHEt7eJ+XUwd/2I98yZN+Si1N8CqkEPO1bZgotQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JBzfrdL8VoEEXdPyJddKlSmZYpVSp3vH8c2Pf9bQ2Zf4DJHN/51yXUSnaw3HJVRgRbUQlFHALTs09jBiFgFLFCr5dPIFyro2LFrwOZkwmfBnTdtpyUGBeFZP9PQolf/fIU09/4gryIt7XhBQm2wfGyn3bXCyrDUegfbtqvhboiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kt9KYkEs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kt9KYkEs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C73BD1F00A3A;
	Mon,  7 Sep 2026 14:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788792492;
	bh=Iy6owUYD+Cyh1bhoOnre5fjmLNF5JIU8NAVziF18F7U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=kt9KYkEsCfbD9dm+VVTaprLzLusq2rWJ2jIynnLBJ2bx410RackA+uvvuDGzpnxdn
	 NAxeKAd3r6AxY2P3hP+9EMKM5GLj3cuURDA8cswfqP0XczAW0XG4zULfNmCyENAwhW
	 pD1sxAG9oH4B/qtvnpENoP49KBCym1taieSCDgrs2Kcca8oVO7rxnWGUJJmEj5WDjP
	 RRDagBX+jz/ZKYQrI40wjff7hBOs04j3xebzbOL78NtIkU2zwO/lmZojcd/M+Yz2B5
	 xXZ8udJtB3+hI0wUtz6BdqD3nG06QmCLAN4ZnkCVaIVEvPF0um4PAHD7yVDlgGMFeG
	 IZBb8K21oKtRw==
Message-ID: <2e8dae0b-d81e-4c5d-b4d5-c80bde07a314@kernel.org>
Date: Mon, 7 Sep 2026 16:48:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/3] mm: make persistent huge zero folio read-only
To: Mike Rapoport <rppt@kernel.org>
Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>, akpm@linux-foundation.org,
 ljs@kernel.org, usama.arif@linux.dev, ziy@nvidia.com,
 baolin.wang@linux.alibaba.com, liam@infradead.org, nico.pache@linux.dev,
 ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org,
 lance.yang@linux.dev, kas@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, luto@kernel.org,
 peterz@infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260901151818.3191443-1-xueyuan.chen21@gmail.com>
 <20260901151818.3191443-2-xueyuan.chen21@gmail.com>
 <apk8ZRr6do_YAlzf@kernel.org>
 <CA+qSx6wqd5VSR=9yarFFmyN1SyvLJqEHpA7BwmzuxNQTHbS=Xg@mail.gmail.com>
 <ap05ue1pq3TgHOS6@kernel.org>
 <CA+qSx6y=OaMsvTKUbPP2DOan3Ym6c8L5z60512-tCYeUjLZz3w@mail.gmail.com>
 <ap5Tqu5yswJrj5UM@kernel.org>
 <69db9546-d14d-4107-96b7-30963292c2bd@kernel.org>
 <ap7L2UEriz6DJfif@kernel.org>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ap7L2UEriz6DJfif@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/7/26 16:36, Mike Rapoport wrote:
> On Mon, Sep 07, 2026 at 01:18:42PM +0200, David Hildenbrand (Arm) wrote:
>> On 9/7/26 08:03, Mike Rapoport wrote:
>>> Hi Xueyuan,
>>>
>>>
>>> And I believe this is an historical artifact rather than necessity. For
>>> configurations that allow set_direct_map on arm64, change_memory_common can
>>> update direct map too, it just need to be implemented there.
>>>
>>
>> Are we sure the other architectures do what we want in their set_memory_ro?
> 
> It's a zoo right now :(

Yeah, that's why I'm asking :)

> Although most of them do.
> 
> But we need to sort it out anyway because of increasingly growing demand
> for modifications of the kernel page tables.

The question really is whether we want to use a single interface for all page
tables.

I quite like a page-based directmap interface. Other page table areas are not
necessarily page-based. It also expresses which types of operations we expect on
the direct map.

One could, of course, use set_memory_ro() internally to implement
set_direct_map_ro() (and similarly for other variants); but at least
set_direct_map_*() would have clear, well documented semantics.

> 
> I started something here:
> https://lore.kernel.org/linux-mm/20260721-generic-set-memory-v0-1-v1-0-2c1fc62306b3@kernel.org/
> 
> Now that x86 CPA is nearly fixed, I can look into the next iteration.
> 
>> Having a dedicated set_direct_map_ro() with clear (documented ;)) semantics does
>> not sound too crazy to me.
> 
> It's not too crazy, no.
> 
> Still making arm64 more aligned with x86 and other arches that update the
> direct/linear map in the set_memory_ro() seem a good thing on it's own.

Right, but I'd much rather user set_memory_ro() later to implement
set_direct_map_ro() [initially on architectures where we made sure that it
actually does what we expect? later maybe generically]

-- 
Cheers,

David
