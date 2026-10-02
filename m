Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB791361DA7
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 19:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790968712; cv=none; b=A+aK/I7JkIG47JrBMdkEcE1xurpcQniNqQUOUO7opFGPBpUarX5U9n1mGL06LzPtqCcTNNIabT23V5iutOa+XGsiVfAL1qmpfCJNRDqR9Yiq0Ex2joD1k5gV5OQJSKDWFI6fcoZ+WdlEqv3vWSdhPqtbj1YrlSQkw493Y8Yfxos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790968712; c=relaxed/simple;
	bh=Pf2eYD3pQa57HicLBb4Kno7K2tGCtiBdkwxTVm2pKiQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DqfKOBxp/oYaOA97c+oaTAMRw/pUMTY5yz/E7x9oXWmWxEh1hbCCzAnp2N7yEHxdcIK+TzEHTbDKEec40J5V/P6Ld6z5esEtmMu6NH9qjwRk6KtZObC6EaFHv3KlTcbv0DBk6linkKWDF0hNaajvpzNAS5JcP10PWRybVVijspo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mxVepR2y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mxVepR2y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC4D1F000FF;
	Fri,  2 Oct 2026 19:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790968710;
	bh=RzOk2QL0OgCI5tvLznmoGIaNPt/Rd6PFhWvBqhDM8Lc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=mxVepR2yA1QxnED8FzCtEOz582QxN9uuTNnGFji2vdtWNCN7lQHhZD7zwftelF/08
	 VFxj6aZX2kSwfVfwajp6icBBr+xwfU7lImqptC4kx87fkfZBqXhQVvJC8YSC8wVBqk
	 nm5CZ5aasm5cQxPz0A3RpQF2dvI0wv0L73Sh3hMSZM+X4uBIC4RE8FdyWc0RDjt5j/
	 iA3pVQldWMef/KZvCo9AummHAQzASV0pra5O4yvV5DJhiY0HXW7QTZbW0jHoeMPLJO
	 sci9JTfoywLYbLJDJ6vD6jnWy3io9W+UhsM9icIKgMFtBczI2p4ITQ5cKWPY412/Qz
	 I4Ph09sc7VGnw==
Message-ID: <f2d7be27-1000-479f-801b-7f49779ff675@kernel.org>
Date: Fri, 2 Oct 2026 21:18:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/14] drivers: nvdimm: use pgtable_has_pmd_leaves()
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, baolin.wang@linux.alibaba.com, ziy@nvidia.com,
 lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <55bb106b95979658b9f8e53d0388e84a8c8de90a.1789695931.git.luizcap@redhat.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <55bb106b95979658b9f8e53d0388e84a8c8de90a.1789695931.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/18/26 03:45, Luiz Capitulino wrote:
> nd_pfn_supported_alignments() and nd_pfn_default_alignment() use
> has_transparent_hugepage() to check if THP is supported with PMD-sized
> pages. Use pgtable_has_pmd_leaves() instead. Also, check for
> IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) to preserve the current
> implementation semantics.
> 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---
>  drivers/nvdimm/pfn_devs.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index 8fa9c16aba7e..457eb54e7ab6 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -94,7 +94,8 @@ static unsigned long *nd_pfn_supported_alignments(unsigned long *alignments)
>  
>  	alignments[0] = PAGE_SIZE;
>  
> -	if (has_transparent_hugepage()) {
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
> +	    pgtable_has_pmd_leaves()) {

Not sure if I mentioned it but we *could* provide a helper that checks for THP
PMD order support. But I would only add that if really used frequently.

Scanning your other patches, that doesn't seem to be the case :)

Acked-by: David Hildenbrand (Arm) <david@kernel.org>

-- 
Cheers,

David
