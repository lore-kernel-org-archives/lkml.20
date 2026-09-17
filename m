Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1FD55821F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 13:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653370; cv=none; b=p8jRUUw1Z/SkOy01HxkBoiLAMkyds10vsWwonWlnsBnPQMABxrvVBD6VkdndduyswA069I4ZkE7I2FUlR4QDrNAQALCDOGH16Pg8ldRZmhlPvKErh8e2z+JDUuVlG2OFXKzj5VPpjrFnHkjEPd6iKNDyD8dLLg1qh8PMUJTLVrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653370; c=relaxed/simple;
	bh=sYno5MhzgVoeuOLG6AaOilw+sKgLZLHW0ctGKrL1wuA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=F1pzpAn342G7kI1ra4Gq49jHn6VM5yaEHP10FoypMYe3ev8WeKzBBOzGy/djsBdI4wvgVYcTJKlkM6hyKupNpb9v0UNQYFt1LeQWE+ganroZihslwN5KWL7NA/37vIxrfv0QTb0yh41JXRZcl3ty/YDIfTyUM6xcLXUjxwm94Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f0o1NCLo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f0o1NCLo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB311F000FF;
	Thu, 17 Sep 2026 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653362;
	bh=AU8CGgy6Pa5vfZgK02vvr6pONCCFzHgT9ly82BtluUM=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=f0o1NCLoIaKYvHe6FBZBBPQIdVjNHSj17+boe4ixXC3+KOmFDflYlsRC5fnT5VKxe
	 HiRy4SVb68ngiM7azj5+u6m0xyNju5V08cQfHJi2NV7PnWKPKN0HohbudLio9W316d
	 /edQAOX6ErcG27FlD7aI7nIlFvgogzkRyJF2d47a43MYtpOIbd3z+9IDQOratubN4N
	 ZuFV4D+qsmLiDJtiANyhBpkxPnBMa9HwkwVS+ElI9GOaUk8mXNshPSlsKTwpKcv5iZ
	 W69f14zdA0DevKSl2Y8ooTN16Hqf4yJJ0lXRIWagnyzIQCBiYdtgcfS7LhiSuDGGLp
	 iwWBqDVpHt2jw==
Message-ID: <c92a1202-1fa6-4cd8-9d82-b46a1b5d8f56@kernel.org>
Date: Thu, 17 Sep 2026 15:55:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/10] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 baohua@kernel.org, david@kernel.org, dev.jain@arm.com, jiangwen6@xiaomi.com,
 leo.yan@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
 ryan.roberts@arm.com
References: <20260917052933.188679-1-jiangwenxiaomi@gmail.com>
 <493ef264-eab3-4be3-a80e-357f01ae1b37@kernel.org>
Content-Language: fr-FR
In-Reply-To: <493ef264-eab3-4be3-a80e-357f01ae1b37@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 17/09/2026 à 14:17, Christophe Leroy (CS GROUP) a écrit :
> Hi,
> 
> Le 17/09/2026 à 07:29, Wen Jiang a écrit :
>> From: Wen Jiang <jiangwen6@xiaomi.com>
>>
>> This patchset accelerates ioremap, vmalloc, and vmap when the memory is
>> physically fully or partially contiguous. Two techniques are used:
>>
>> 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
>>     segments
>> 2. Use batched mappings wherever possible in both vmalloc and ARM64
>>     layers
>>
>> Besides accelerating the mapping path, this also enables large
>> mappings (PMD and cont-PTE) for vmap, which are currently not
>> supported.
> 
> This series doesn't apply. I tried to apply it on top of v7.2, v7.3-rc3 
> and next-20260916
> 
> Can you tell how to apply it ?


Finaly I was able to apply it on top of v7.1

Christophe
