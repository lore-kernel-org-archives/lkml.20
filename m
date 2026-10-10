Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD53325F98A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791638539; cv=none; b=rvuNKD35K611QhEPFihqo8o/fNnEpKNfirNJlGXTPx71i5Jbne4mFAr60ebVd/x7P1wgECSWBuc/fRo9yKNJKt38UiCFcjn4dR4Y2ZE3iYkJm4pEmS0wAKjsrj/DkboU2OffshsxYW/4dvmSTgulskVsgW5DlW43EdVc1vX45js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791638539; c=relaxed/simple;
	bh=bg81Uene0mrQk7yJ5eopVAud57kbmvXspQx31iw8xCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GkKrcgPbNERK2b94ZLEI2VSRmF1zcF8QYHvGX+5W/Q6LhDglWrD/NxENh30VOXSI2Zv3MHn/c3XcSKur2fD5mxaEK3MTZIq2KvvN1MKwgvWeiSuHrEXUKQb/d42LEGezxMqWzKwqn46s1t0NvT/xXA/sXIJggsDy4OYZDhm1fL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MQj5ABtR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MQj5ABtR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 411E41F000FF;
	Sat, 10 Oct 2026 13:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791638538;
	bh=XdlOeBzyuzL+cZQfBPFE/L33JfcDEYwdnatQB2L4s2Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MQj5ABtRRkRCBwUU24t/deVILPIJDNLcFf6yVEQQrVCzquJCgzHGFb8kez8EYGzHK
	 fNGk8fT79Wo4U11UdmF7pYk8BLZwIHh9hYQdbQqb/+wHKSgdoEfM8DftQIIvHDaBs7
	 4p+wNxwXBBzc7TsNSdPKBV7RaUqn9Uo0WyOeYlV18jmS+IUIonc/pxhK/LllTckl66
	 MDRJbHA4yVBsgm1KOuVeIo8yl06wr6AQRQMBOfXxrvIoXspMXYu70a6gNocjpwq4Q6
	 U0ZTUfWqrtolEfbT8DB6we3tyfaiXY2QYHM/A718Ff4xLMceOO3tA/DwxZxc2YKiaV
	 dMNbpnGALRq1Q==
Message-ID: <ba74de67-a687-4ccb-830a-ed018d4f66ee@kernel.org>
Date: Sat, 10 Oct 2026 15:18:52 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: avoid recursive i_mmap_rwsem in PMD sharing
To: Li Zhe <lizhe.67@bytedance.com>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>,
 akpm@linux-foundation.org, muchun.song@linux.dev, osalvador@suse.de,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260930064308.58159-1-lizhe.67@bytedance.com>
 <arzVaC2IYkqSb0_U@gmail.com>
 <9a7c026e-f5f2-40e0-84aa-919c988cc136@bytedance.com>
 <2b4571c5-8e51-4c91-9d88-11929f200875@kernel.org> <asjVUa6XBZ8ti-0_@gremlin>
 <70ea8ee6-6fc5-4209-8cee-362da37f5035@kernel.org>
 <ab1577d2-a9ce-41db-a632-8e25652dab31@bytedance.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <ab1577d2-a9ce-41db-a632-8e25652dab31@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/10/26 08:37, Li Zhe wrote:
> On 10/10/26 2:05 AM, David Hildenbrand (Arm) wrote:
>> On 10/9/26 13:52, Lorenzo Stoakes (ARM) wrote:
>>> Yeah I don't see why not! I don't think there's anything that needs to be
>>> private here.
>> Li, see below, can you work with the below?
> 
> 
> Thanks for the patch. I tested it with my original mremap reproducer, and
> I can no longer reproduce the hung task.
> 
> I also checked the hugetlb_change_protection() / uffd-wp path Jose
> mentioned. That path can reach hugetlb_change_protection() and
> huge_pte_alloc(), but it does not enter huge_pmd_share(), because
> VM_UFFD_WP makes want_pmd_share() return false via
> uffd_disable_huge_pmd_share().
> 
> My understanding of your patch is that we preallocate the destination
> hugetlb page tables before taking the mapping's i_mmap_rwsem in write
> mode. Then, while holding i_mmap_rwsem, we only walk the preallocated
> destination PTEs and move the source huge PTEs over. This avoids calling
> huge_pte_alloc(), and therefore huge_pmd_share(), while already holding
> i_mmap_rwsem for write.
> 
> Does that match your intended direction? If so, I will go through the
> details and make sure there are no issues, then send a v2 based on this
> approach.

Yes, please. make sure to keep Lorenzo's SOB/authorship. If you perform
modifications (patch/commit message) add your co-developed-by + SOB when sending
it out.

-- 
Cheers,

David
