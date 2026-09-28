Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C648648A2D8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790586854; cv=none; b=hER158yvPgGgL2/KquLgO3Zq8ghelzEFTpCY8Hpwy1S3TEo6A/Q1Zw4zLde8X5KQKGUlndyhm/H77bAOcQlKckzi+TeYF2Kt4r/OlnjUxaqNIEiEvVfdUt0y/4vJRs9LP3O88u914A9ZMx/aLJfHULyd9xGYhY5TSNnUxtVl65o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790586854; c=relaxed/simple;
	bh=1/BRcfIJFa/qC7oqq6HsmjAP7pPrWxTpVEek1viLASI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=scImHV6e/9v1cUs6TS8me5qORGloU6G94vaj9SvGh8ZXbAUiLPtBlP3nbQIbXASo2tWU84RpRolIZbWhdXOGyzO8ypB2wv1ueBCTyAtQkbOpTDDdFAYNneQNbRc98xzy6DGxp+yKbpy92rpSCtdfNwTXXTNSnwy8TYS5ilhOPsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCN9NmS3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCN9NmS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BE7B1F000FF;
	Mon, 28 Sep 2026 09:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790586853;
	bh=ojbopmmPdRq/zC/UNBXyGoZ8LTFlDLR7fEeeqgcm29E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UCN9NmS3qDbL/ypLkWhgpQEUgaZ4gIGG221Wvzif/dNp8eyiOSruzJowP8cP4pGFM
	 14MqP4+FI2MUDZPI3gOzpTrMdGAkfw2O+19mcqK3Seb3Eo0jFpe80JS8YW1c6x8aXC
	 u1k7LD3qLH/vDSBkX8kvu4uevFpj9agKp4H7WHYVUcsjAUFa+i/y3n1U5qpSNXMb4l
	 XaLBkmIHOZ9IDkwYn39br9fJBSdvYc/8HtRZcFJoiS28pFCpghc2b7EJYOlKx73fbN
	 RfATo7vhTs5x24kuA9ETBFJATiCEaWFvbYQvDJoSr34yiscNvuPtVduFQZKAdPcxCm
	 szeHHvmBGEIEA==
Message-ID: <21abd60c-e71b-40ed-9506-853d4485cf4b@kernel.org>
Date: Mon, 28 Sep 2026 11:14:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vmcoreinfo: export SECTION_HAS_MEM_MAP
To: Baoquan He <baoquan.he@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Carlier <devnexen@gmail.com>, Dave Young <ruirui.yang@linux.dev>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20260928-section_has_mem_map-v1-1-4129f6ba2838@kernel.org>
 <arovLO37djQderTB@MiWiFi-R3L-srv>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <arovLO37djQderTB@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/28/26 11:11, Baoquan He wrote:
> On 09/28/26 at 10:48am, David Hildenbrand (Arm) wrote:
>> The crash tool currently hardcodes SECTION_HAS_MEM_MAP, and makedumpfile
>> needs similar information (although still relying on
>> SECTION_MARKED_PRESENT, it should switch to SECTION_HAS_MEM_MAP).
>>
>> Let's just export the value instead, so tools that work on vmcoreinfo
>> will not have to guess.
>>
>> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
>> ---
>> Result of the discussion in reply to "[PATCH v2 00/13] mm/sparse: remove
>> SECTION_MARKED_PRESENT and further cleanups" [1]
>>
>> This patch can go in independently. It would be preferable if both
>> go into the same kernel release ;)
>>
>> [1] https://lore.kernel.org/r/20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org 
>> ---
>>  kernel/vmcore_info.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
>> index 5a417f8a922a..7833a36064a8 100644
>> --- a/kernel/vmcore_info.c
>> +++ b/kernel/vmcore_info.c
>> @@ -182,6 +182,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>>  	VMCOREINFO_STRUCT_SIZE(mem_section);
>>  	VMCOREINFO_OFFSET(mem_section, section_mem_map);
>>  	VMCOREINFO_NUMBER(SECTION_SIZE_BITS);
>> +	VMCOREINFO_NUMBER(SECTION_HAS_MEM_MAP);
>>  	VMCOREINFO_NUMBER(MAX_PHYSMEM_BITS);
>>  #endif
>>  	VMCOREINFO_STRUCT_SIZE(page);
> 
> It would be good to add one section in
> Documentation/admin-guide/kdump/vmcoreinfo.rst, e.g
> 
> SECTION_HAS_MEM_MAP
> -------------------
> 
> Indicates a memory section has struct page array (mem_map). User-space
> tools should read this value but not hardcode it since the bit position
> could change between kernel versions.

I'm not particularly happy about having core-kernel defines documented in
kdump/vmcoreinfo.rst, though?

If it would be something vmcoreinfo special, sure. But not for basic defines.

"See the kernel source code" is really what anybody using this should be doing?

-- 
Cheers,

David
