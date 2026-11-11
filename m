Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415958;
	b=DEh2S39N8jWNWuT5RTIdrAnLz2ilkZUynYf7FIRNXg4x6sftZUS0BQn6HeKWcYNOkfIF
	 spw28lEhbfuBlBKYzwys3X5GOJba8FKVjBBtVI1c4gwLWi6isRg24Eo+Y9BughsjoYuDS
	 1GKX7ZmIEAEU2VNWFTJuUjWCgfdlZ9KaTAoB/ep4VahIuvAaXCGd5CeXzMAgx3z0zDabl
	 nN/6z7UAGvTS7mmPseNZkbg5OZ7c0tEY4C7ntlwU+rbJF/WEpmP7wp2yRiHMm2XLepIsR
	 +C50mtnwvhsy25yGRN8rugLagahGpCeWTCB2LzM09ON/DMvCTjhjLo1dYeMs75bnNdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=OkZUJWdT/s5JOCVNB0A7LbBvMJ84RVXohV1PrRaEdAo=;
	b=E/5TzwFkVDiDH8yoCr1YkFcIeXlIRkkomJd7OQFsUujy4ZPLHlFXRYDKsi9HwkyC+wQS
	 FYLFXxe9JJ+5lXdQmF1uCnLMwB/FDxIB9EZYj4s2ehDdZFhFrVNEBPp/EqPIm1TRUrNRb
	 vWOxEKLGn5yrqQ9s45AttM0YT+YwePe+8KZIaAzeNkyCFRt3Uy95h1GoZQn95iBTfBVcG
	 oJgAxp7076gzsUypPvbJer7ZfvfUsmfZM8nqpN6i9V9uqan1BXFDCdwU5GoybkTsc9ND4
	 gJ9j65EsW8GeD+3Qe6R+51tMzlHbw+Y4uhMEk5DOCdvyzSVJO6B6qcdH/dqVE1T7Afw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAqU5aQm;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AEF4606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 16:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AEF4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rAqU5aQm
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so2264403f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794415956; x=1795020756; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OkZUJWdT/s5JOCVNB0A7LbBvMJ84RVXohV1PrRaEdAo=;
        b=rAqU5aQmDbl3ePR29OnKVYFslPpmzVV2P6NF3PZ+VvEdlOxp+R7IDHMbMkzLtxi6T7
         EdbOJC8TF95bNbCG2IM5Wxn4A1n9gKztU4eLD1KUOnWwwL9nVAF4IPErWYv2hMePO/uU
         L48gR85ixuLklqRLs+pqFbjrhcowqvEGcYKM0yXBOyFncp3WB9/de9XglRStwprKsH87
         oqgSQAyRdwDtZTsSWs4zqsTuTL9MLWl3xvc/kVj8tAs+aLce69EAYQI7uoBEU1mfrvPK
         zw7bTP8Ke9h0nTBdpEvdUoc1ouc0cWvnEP6rSr2JiMVimRrk7e0HCO9d8CXEnvb8gOc2
         l+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415956; x=1795020756;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OkZUJWdT/s5JOCVNB0A7LbBvMJ84RVXohV1PrRaEdAo=;
        b=LhMXs7LA83ho/rWvv9RQ31DA5EnfN9/ZcUWU5ELzgA+wH0pnPkQFs14JxE96wXHXGg
         CxYMHcP991BcPv4ru5JRQLRDuhcIPv7t4Y60P4J02iue66pwbh8SlwqsYvfgM4wEB6uz
         42wxewzph0N8U6TT8tNTxccVnfwgJGmGpz699nkedjVSMOkVXZHT5rzap5KMa5KLsemo
         Lu9tMaypICWBOyYiR/twNFiFMzS1hm+vzgF6buJmh1msi3ZUCAU9/kikyQqdjcFF7Ahq
         8J+4nKd5yUnvVO6j420q1t0hGIC016T9KGv/H9iwWA3hRBimL0XpSbWnBHVv4GymxugL
         DYug==
X-Forwarded-Encrypted: i=1; AL+hErEdbyV90A+tJqdqBwr/J/6C+kj/NctF8palxddvoPUwWPILj1rHD1o9H8YaY750CgNrPnC6A6K4+n2WuuQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SWNwbCJvb8rQ+vHu69oYljhc0LnxPvdrhsK1UHYCt8NgDMNt9
	5VfzWnjsHa8pdgzLB2kIzIHzjTsjY97q192lae+/yAq5y9zp3EmnPofZ
X-Gm-Gg: AYBFou1N0r21HT9gOHiuFWBaxAEAkuxmaMUQhKGmYeM5r9mhb8u0DT6LDgy3pBHLEal
	rIISBGqN/vs8ht4f/pgDLibBRhnnCwRE3XHO3Psd156FfQ7oCrxMuzzg/liAPIF3AvckAHwyBwn
	l34XylvbDgUTcpwBm0XkRBKeexxu5yMuubR+ct98vHojI6phuujKGN0uKa3/QB7il9CvVR/L9HO
	3mJWizRi5dQWY8Xg8DQmaTztX+3R8wtpvpweggoTvAQPTo4AQSeFIhJgDadNMgheP9/EckVAtYl
	WnfluYFBj0hVoVlCvv/OtrnDvQJDneCTm7fpGisyS2QjptrVYn4Q6yD8QF6YRk2gn8ndPCI0IAr
	+ylVKrq21aPeDdjTIJMpJZmCofx9eMcKdiBPXdYhZyRRAMgb0xPJhRH5hSW5u6BD0lCosWlW+lI
	qTFm8MGKqk6zDC5Km42ehSZPr4/164EWKL9nd/9cMUPOxqhzEFly/FY20oocg5d0Du+QjqeISlK
	d+Z46X/N1KNHb+bjwMKIsZMsytUqcvV+inndhC1Kepk8gHXCMK2Q+mcUaYgeQ9MRBrCYjHfqrKJ
	t/HEhAxo3bRDWDipce5fN8bomK6EndpTt3yt0C9zJk/eaZm5puLwCfPRzxSs3a4pBm0t
X-Received: by 2002:a05:6000:25c1:b0:48e:720a:ccaf with SMTP id ffacd0b85a97d-499c38bb2c8mr5760029f8f.5.1794415956141;
        Wed, 11 Nov 2026 08:52:36 -0800 (PST)
Received: from [172.31.15.113] (6.red-83-60-147.dynamicip.rima-tde.net. [83.60.147.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363dffa1sm11516874f8f.39.2026.11.11.08.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:52:35 -0800 (PST)
Message-ID: <9d4ce24b-7799-4d71-84ae-983028366ae1@gmail.com>
Date: Wed, 11 Nov 2026 17:52:33 +0100
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
Subject: Re: [PATCH 1/4] mm: drop the huge PMD assertion from walk_to_pmd()
To: Eliav Farber <farbere@amazon.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Kiryl Shutsemau <kas@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, William Kucharski <william.kucharski@linux.dev>,
 Vishal Moola <vishal.moola@gmail.com>, Alex Williamson <alex@shazbot.org>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261111140655.34281-1-farbere@amazon.com>
 <20261111140655.34281-2-farbere@amazon.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261111140655.34281-2-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/26 3:06 PM, Eliav Farber wrote:
> walk_to_pmd() asserts that the PMD it returns is not a huge entry. That
> held when commit c2febafc6773 ("mm: convert generic code to 5-level
> paging") added the assertion: nothing installed a huge PMD over the
> mappings its callers walk.
> 
> ARCH_SUPPORTS_HUGE_PFNMAP changed that. A VM_PFNMAP mapping whose driver
> provides both ->fault and ->huge_fault can have a PMD leaf installed by a
> concurrent huge fault over the same address, so a caller can observe one
> and BUG on CONFIG_DEBUG_VM=y.
> 
> The walk does not need the invariant. pmd_alloc() only allocates when the
> PUD is empty and otherwise returns pmd_offset(), so a leaf is returned
> rather than overwritten. Every caller already copes with one, because
> they all reach pte_offset_map_lock(), which refuses to walk a leaf and
> returns NULL: insert_pages() turns that into -EFAULT, get_locked_pte()
> passes the NULL to its callers, and insert_pfn() returns a fault code.
> 
> Fixes: f9e54c3a2f5b ("vfio/pci: implement huge_fault support")
> Signed-off-by: Eliav Farber <farbere@amazon.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
