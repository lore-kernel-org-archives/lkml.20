Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794478143;
	b=HrKIDQx8vdMr6UT7C0YdE5bv1IY3DliI2234qyC62Am2vSCbfSkK6Sbl/+qZcvhx6uSg
	 V72pAUIFnk2hzKRfvwWSZIuGjwMG7JqOJeIGfqPQ2Wsymc7oJd3AZpVDyiBwZBwLVb8sT
	 MONOQn4s8UOupO5CeEaviS3ckaa21NZL2UjJu/qrfqxy1zmycFonOc8WKhSL8dv2O/Yao
	 tmXEYGU7tHqpPINbAoif8xBZVLPbyEiUx0ydsuIMbS8fk2tkJ1evWuJEHqvwiagrtU5nA
	 Y7/aKveVf2B6fMeollEu3ejAeC3EDHxGRdiVO57HT+7reclcSY9w/GOEz6OyO76WoHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794478143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=xPCtd0ewEaMYLBvmRKUfVVx6VAZUS9abtar/G6UrVBQ=;
	b=r5qOIC0dnVZz2Tao5Xnkl22iJPNcYCu1CMJ3EylWp+xs6WT3oAkot+d7Tif3eJ7N9gAn
	 UevSBGNia2NDHR+GQ9teIPJv8J1JSFA+E5V2SMRu5JUgrpsDPrpkobAY0/E9RZnQavzhr
	 FPVFA1tJmEMlo5VhRmrf5JICMUK4Yazuw/8VZA1fkdbY8ZweLiUCQJ8nCRyLFUtyaxb7Q
	 jvKuNZ2nchFx4TJlMBptRQ7PbaGNqcfZcLHJMXz9AJfwsA2XER787bjnRF+xRjQ3+x1nS
	 mPpKhSNg7upJgH9WN9UHLjELCKGwZdmbovPwCl7lWIZe+NTO4T3OgrPMZ/szPnaAKaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kR0Nxphh;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49518606A8BE
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 10:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49518606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kR0Nxphh
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-49412eb1474so2451709f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 02:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794478142; x=1795082942; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xPCtd0ewEaMYLBvmRKUfVVx6VAZUS9abtar/G6UrVBQ=;
        b=kR0NxphhiKL+KTZF8o5eVdEGBcFw16FPpJZbnJ6st++UfStJgVk7E7bNwBEldsJFxa
         sEPs5mXBmajfiaz4b/Qqs6NZL4+AorWUoVa+EDUq12Am62hTuxaxUcUIhFOJIY5yRxuG
         U/aNNlqiLbFRnk1jBxAW3nby+RwxWi05dCOUOLp/1XnmoNrqQ4iRj7cSLsQkH0VDLVp9
         VTS+9/PK8jUeU5eSst9LA3sgkAq0hI2LtGgyScjj49UYF2sYVfsFWBMZ9kPq6F66TrJJ
         mdoEelL4OBWpaTfbKN48wcySnScpPrn2HPpxlaIHeeYVDSpu5X9Dlq9QTxlbUit66j1M
         HNuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794478142; x=1795082942;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPCtd0ewEaMYLBvmRKUfVVx6VAZUS9abtar/G6UrVBQ=;
        b=EX9fEsG430FecZ7IHxi//wG3/G4rU9m940+gIKlOBUpLfRHNLPGVO5dNeEkBDw5OcA
         7tFrl+7+ECRbZIND939ppc3BBKFCBDDCJEW3NG5okM5wDAiFReOzjbyVq5Qj6hPggdgT
         A41ThPMR3k0Dy790U8GHVnX9OnJ2qsjegqRY1lfjC6GHaWz0pvhNgkbVf5JhVHLlCdkU
         6axyW2H1+tTSdn09g40iP1yJm5elnZmpC982X1ASUYfjOiactQgJZYrRFYA0tp8JY3eY
         QjZnRTTMx8xDP4PBD00Q7BVx6IjRVZEa3HjRDwvjeedsOcyfCAvJ7xMeXbnQLPH5B9Nw
         X8tA==
X-Forwarded-Encrypted: i=1; AL+hErEFviiBo3/ZNr82k05G1CELCZbKWtf87Oatv3ZiBU4clU0itgyygj33Nf+ZMMHfcaelGyBtRij1AX3gjpQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8V8qUk90sFQf9O6NHvP8zbKZ8xtLqgv1eHNtRRdcID30htyzOk
	NRlsW/gdMVUQckaLSo8gjOUowNTbmgJgQDSPIrPkNL4i+2nmqGhKCDEY
X-Gm-Gg: AYBFou0Lw+LfUbH4uSbXLQom4gFMmKlH4NyAOFC7khivM86A2LXTzCJwyh2QRxbItWJ
	bv8JSWHUquY5cbcAtg+BevVZfBxeGOw1G9B+2N+JCF+5onSMivXmpNqb6RLn/b9eQjoeL1BbYT1
	eIlnGcGhy1eQRDqPevPuEDtctM2T0SNjo8M8lQl8EhDsDjCxm80rgwXSUzeADcZsRxGXcIv3Qi9
	5p3FCsgTxKRL1oCt+D8W7ETdnsZbaysAZ9MuETVYta3rdZG7Ty7Pq5pLYL/IaJSyImCZPLHxOku
	BpLtz8FmK0Ff15e9sNG9/dF1iExaTZiovAB8IDQQHMkLrzxxGo2dKLNn4IhlolcHcRR+M6m7bYO
	LZSPtmZWnQFb0AM7jL8UhyNUfxSEdV6drxu8UF/dON0Xl9rO9904E9hN+2r5AHHd6Tu0hKu9o67
	UvcXUwMfuvZv+J3SfVNxEEQRc4aQnyEl8h+I2553B2JXlaZKuboVTJTysJwXorX9qjpox2CU3K4
	OYfdk2Gt3Im1qrSOFVZC86qquNUA8/IkurEg2m0KONWzboDnpdZuYMnTSM25vCFv9MQgMTD7LhC
	TqPa0pQsjSmwIN1NOf5FuK6x
X-Received: by 2002:a05:6000:4b06:b0:48e:7026:5243 with SMTP id ffacd0b85a97d-499c7270e9cmr8410567f8f.20.1794478141350;
        Thu, 12 Nov 2026 02:09:01 -0800 (PST)
Received: from [192.168.1.22] ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4983600bd6esm16211466f8f.28.2026.11.12.02.08.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 02:09:00 -0800 (PST)
Message-ID: <048ba947-e63c-4361-8982-b40372d4f062@gmail.com>
Date: Thu, 12 Nov 2026 11:08:58 +0100
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
Subject: Re: [PATCH v2 4/4] mm/huge_memory: use the large-page PAT encoding
 for huge pfn mappings
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
 <20261112051440.16140-5-farbere@amazon.com>
Content-Language: en-US
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
In-Reply-To: <20261112051440.16140-5-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/26 6:14 AM, Eliav Farber wrote:
> insert_pmd() and insert_pud() build the entry from the pgprot that
> vmf_insert_pfn_pmd()/_pud() took from vma->vm_page_prot and passed
> through pfnmap_setup_cachemode_pfn(). That pgprot carries the PTE-level
> cache mode encoding, but x86 keeps the high PAT bit at bit 7 for a PTE
> (_PAGE_BIT_PAT) and at bit 12 for a PMD or PUD (_PAGE_BIT_PAT_LARGE),
> where bit 7 is _PAGE_PSE.
> 
> A memtype that needs that bit, write-through or write-protect, loses it:
> the cache mode index of the huge entry drops from 4-7 to 0-3. With the
> PAT slots Linux programs, write-through (slot 7) becomes UC (slot 3),
> and write-protect (slot 5) becomes write-combining (slot 1), which loses
> the write protection. The other x86 paths that build a large entry from
> a PTE pgprot convert it first, see populate_pmd() and populate_pud().
> 
> Convert in the two huge pfn paths. Add a generic pgprot_4k_2_large()
> that returns its argument unchanged, so that only architectures which
> encode the levels differently have to define it, and x86's existing
> definition is picked up.
> 
> The folio paths keep using vma->vm_page_prot as is. They map
> struct-page-backed memory, which x86 maps write-back.
> 
> Fixes: 5cad465d7fa6 ("mm: add vmf_insert_pfn_pmd()")
> Signed-off-by: Eliav Farber <farbere@amazon.com>

LGTM:

Reviewed-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>

-- 
cheers,
jose a. p-a
