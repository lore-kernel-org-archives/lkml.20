Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478058;
	b=o+CVCHEL558Vu6icFRvLjQzuPXRaYB/UMgAyfjUYWRO6GY4B7TT0Cp+udbkZgmPGltO4
	 u2cePdSUzOLduzae+vqZ3HCAE/i3xYFcwbmEyWNwF1WHXiCXfxe6uYSkWhBXe+dhpTIG0
	 wrDJcXqPYIOSUUXCZHPfr8MvUJ7hlKMgEwuWnb7UboBJUf81DL/wjoXscBgDsaftaFp5h
	 UXwI9RtBwGfXp16S9db5gSTTcltbsz0n160jgogI/z0V8048WMmf5P++8yaFbZRwFDCgh
	 f3y6QxzUa0WxaQAzAIGMmJlwScA666DlHv/q/5jchvxwPQPoi7OtPendw7cg+pdJD4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WSyMz69A6pUqMMIP1tdJeB+vvEVUhzDjG6WadbBU72w=;
	b=r22+rq1tBICt6yxHoC+63iGBnOA5n8qc7pHcQTnwgIc9tO2OPf6lWR2Kl5xa3jlZHhge
	 vfb5PoNZnZbcnQJaKEMyW/AsI5X2B4vIbH83HngJQcv5efrHFhM6j2ZZx83FhL4VeOOcZ
	 4hMwJkWUjHE62BkECDKQW6hjjGLSQz2klYILWZCVeZvG/2poaAQxCI55pEdE8Jse43y90
	 RLSInj3MO/phB6aDp5lXNO6+NRi0Du5/hs/UQ69AR0fHHY8RFmPF5HrmFR8KijfFx2UE7
	 aQEIWF7GEjha9h4GQFI9bKY7Fz+mJGM2vFVcGCZoUVhDoCRJJZQMVcdThut3d7Oe79w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoAmwrF+;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB90606A327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:07:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EAB90606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoAmwrF+
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b581b6b0e9so3016241a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794478056; x=1795082856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WSyMz69A6pUqMMIP1tdJeB+vvEVUhzDjG6WadbBU72w=;
        b=NoAmwrF+qHlgKNfFuMoGUlPEiq9XwUuMNBk/mLnn8ZIcj6fotgLX3Zn0bi2r6ayy+H
         Hr9i7sqwEOm2YzwMF/fpXbtWuqTvFye4Kdi3T9lkwhD1CwTrAFSJEhm8ZGTEM9NLi9Ix
         0o51/0f9nj3dPM9/KjTVVG78xwAMaBUvsIASii0qE9kjlyLI+VtqwEwbzocqdUaq0yeJ
         4B7qR5YhqLStRR3zDyZNYf+UBeyNBYWo/DhpYed/p46N3ipvn4LUxKn1PBo0e8Y3sYnM
         K3kjurF/A/+rlqFIYpSPR38eQXClJmztRAqzvLhC4VhIK6qH1k31p8dL2CJFpcgEr5vw
         Jxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478056; x=1795082856;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WSyMz69A6pUqMMIP1tdJeB+vvEVUhzDjG6WadbBU72w=;
        b=JE/zf3c2RugDL0Hh1VuHKIw/MbJFmk6kN0k2KOiJjxxE4qMzv2NF7EPCxiSo0viiIb
         GnHC5RaP1RmlWYxAA3KK3lFVIRIqSSBOFMeisAEZOtyVrd8hDlZOg9lRt0sYTHp4HUym
         z5WgEHVJ1fUbDL/Z7P7or20q/nebxzXmc1J3hR7pxXTNwILDjb2t1tpmjHV/w9tE+eR0
         kCVJv9lMpdBdC1Cx8CUsiRl/BLMfZk0uEfI7x3RE+wOoX/OrGEG5YcbBdrh+faCM6pH4
         MYGRHYvt4lDoXk8WSOkPanY+2AWo+O0ygthUdr08uT3vZdoJFJKb2O+nwpXxGYI/lLKE
         EFIQ==
X-Forwarded-Encrypted: i=1; AL+hErG2LAm0V0K6bGkmn380aM9wnhWGAG+kCERmrN7/Uh/EAbABaoy4JdtaPEvjGoLqJ17PdPxHhDmNppf0Hlg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/uzZXRq27TbKV2DmNkTpM445OkMV7lGvfCqkL1J47tlYVOHY6U
	WSRKj7HnSxV59pdCp/8xiLpMsxOLleWdjhQc+fGewH/T+xlWDeYqVQ2r
X-Gm-Gg: AYBFou3xRTmFSFNRDeA44yoz1TUQdB/Aa5xLpLK+JBHzo9HmusZQho2PuiFjrSg7gpW
	2C6efleDOxkDG/c29CTp2s7N/Xj7JZnceXmFfSrcPbKAWpjq3HX6MqPCxcfTNn1vF0xZd+Bj8ux
	s12mEpqpSvciZSoU3gcC8H8Nc3W9W8cNfayAruFtFpK06lMcZi9tHYlkTuFly/zhRYpj5ls46CY
	3SENSl/R/F9EUxmvu/h+Ay1hMgIKaLd19bQuK9+sahQhnkpaOYhOHaQGoLlMDxcUzbhaB/mvXvi
	0XnBZNgejmsJCIvR0ykfhm8xtm8j/xAzG4ig3TBrONFKGIJsAOmDHeHBO+L8x0rvwKW+R6NoqNg
	5/wW3rcqy2Fg9nDb6vwkChojlDJvlUTfUzjjQNff3BG51viSyAAjazsMwqTSFMf2DHNANZVzri6
	GnSyG1PkRe1tpN/azg+yyZy0faeW3+0EUP6Iv6PJWGTsU/PAy2n+X30qMdmOF7tdP9rKs9AzStd
	F1JaQ0GTq7mJ3rYCB8jvj1n8guQWB3bG8ueyUJKx/TreD1kyfx5aifUigrosF3fslySPggXMrlH
	bf5jl0OrhdwRjk7vnRfxSPHp
X-Received: by 2002:aa7:c1c4:0:b0:6b5:8579:5404 with SMTP id 4fb4d7f45d1cf-6b7773edf1emr2460162a12.9.1794478056131;
        Thu, 12 Nov 2026 02:07:36 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm16175142f8f.37.2026.11.12.02.07.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:07:35 -0800 (PST)
Message-ID: <5411dadf-0df5-445f-a3a5-8d67489c7eb1@gmail.com>
Date: Thu, 12 Nov 2026 11:07:33 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] mm: don't report OOM when a huge PMD race blocks a
 pfn insert
To: Eliav Farber <farbere@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, William Kucharski <william.kucharski@linux.dev>,
 Vishal Moola <vishal.moola@gmail.com>, Alex Williamson <alex@shazbot.org>,
 Matthew Wilcox <willy@infradead.org>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20261112051440.16140-1-farbere@amazon.com>
 <20261112051440.16140-3-farbere@amazon.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261112051440.16140-3-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 6:14 AM, Eliav Farber wrote:
> insert_pfn() maps the PTE with get_locked_pte() and treats a NULL return
> as an allocation failure. pte_offset_map_lock() also returns NULL when
> the PMD is a leaf, which a VM_PFNMAP mapping with both ->fault and
> ->huge_fault can hit: an order-0 fault that passed handle_pte_fault()'s
> pmd_none() check can reach insert_pfn() after a concurrent huge fault
> installed a PMD leaf over the same address. The task then takes a
> VM_FAULT_OOM for a mapping that is perfectly healthy. Changing an mm's
> THP policy while another thread faults the same PMD, for example with
> prctl(PR_SET_THP_DISABLE), is enough to produce the mixed orders.
> 
> get_locked_pte() cannot tell the two apart, because pte_alloc_map_lock()
> folds the allocation and the map into one call. Walk to the PMD,
> allocate, and map as three steps, so that only a failed allocation
> returns VM_FAULT_OOM. A NULL from the map returns VM_FAULT_NOPAGE and
> the access refaults, which is what a PMD leaf, a PMD that is not present
> and a bad PMD that __pte_offset_map() cleared all want.
> 
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> Suggested-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
