Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389315;
	b=0UA16vhJP5oFg4jKSMTJRjX9GHTzM9nJnzmJN0tdeIGnAh+ZI/U9B3BPQVc9lXg78f5S
	 QPWKuGNjiVTEQ/QPg0GfNa3CzWmoCwNFzQELXJW7CTLLMt6i2LUpbz5LkjN9HIK9Yn9Ki
	 HxPyrBkPLlXjajTiZ+5ibMCYlXu7pUOsIIYoWhMwhbsMclSYrhmgqoynWjlAz+vXpmh3m
	 +vi40lpZw2v6iIQn68YG8f7oj+zuTNYlzvqUOcAjvVsGCFjw2aAtbIif476Y3CfwzyZpJ
	 lRsp63t4oSKhsemLA6b6x68JmdLHDaNRhW/NcgyMtqxZjxf8OOexOF+MrQy0gALHkmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dTiMgOnQWSO1fXm1V5etvmBssPqHNLO/3CtDNAXggW4=;
	b=yL9aKjhd5LXJXRm3D9S6Dpkijm4J4UMGw2MSpBIX6UnhcpmV3Mmf2A83c35An/nWiDyp
	 F+FlIiFMPJdWD4gVOu6z8u99nRcILR58Moy1KQtdOmjh3hW0Cpr0xvwUJQvpZnR03Pg+M
	 c+DwfqQKJcr/vkkkh879uW6/rV2AYTMNXgMAIGmoNeNi1mOSd66VdEdej/90hQUAPvOjx
	 cxCDbYxKJXBVqMicZyIj4bq5FpS0EsGXGV4D8aVrATkqrXHBls0aGNvH+ID9i5M3WzFpC
	 DSYt9BK3z6IsXUdue47j+ReGWhY32G+HER3yWB+v0HgWIuXBM1ld+oKNdHu3XC9GBog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WxXzGHkz;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693B1606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:41:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693B1606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WxXzGHkz
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2eb0a52d605so12325ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793389315; x=1793994115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dTiMgOnQWSO1fXm1V5etvmBssPqHNLO/3CtDNAXggW4=;
        b=WxXzGHkzvWE4vrXsD7NvdxRYE9kGtHF7duKGC17xUlBFZsNLXQaRokvRERbQ+5XriH
         bKXbxpcikRbPD8xFQMaHwJ8q1fyPod8a4eiMz5jbvz2SrjkRWVzjmr0u3lx+tjn0Nevv
         buGBA9VSrIVTLdkqFglyCrktFfM4N0Dv3WCZF4MKtGJv7l8PmfVheZnwZMru91QADvox
         4HqWUCKOt2llEWcmx98vxQ/Nz3sx9x/GFLt9bM+uBhWM1CbwdxuMOMokSDs4wVzC3SBq
         HTWI9Z8G5IEb4pSwI839LNV6VIbvSNpF0i7TuRyN3cetGr58WBkMhgY6DfandYO9p8Km
         MLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389315; x=1793994115;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dTiMgOnQWSO1fXm1V5etvmBssPqHNLO/3CtDNAXggW4=;
        b=jHb4nu6/kPdHUjDuNoKwTGxa5ExusTkBnckphqQIzwJd9HAdO3naGIeIX4qrWHIKuK
         1EjIkCbYQ4Qi9Z/tUvaaDXyBuu0WnMhH/mdA0T35MiaHJ1gRvtfqxXjZZoNQdRhn/fBU
         l61uJq8lJWlJ7uH/833+q8DnWV/gCFvPPFHerPOzcH50RN0Ocr2JKvTvWAuopHXGKITQ
         zEPEHUTfyzMNXtgvQ5Qvz3FTfKVbX3fImUPNzzioMquVszCjAflUkF2wy8THNMn/TOrZ
         ByC+0mPWA5WA7YuKgm3yhVyEb0I02cu6zgXNV7IBSd8Kh9MUmhiDlrRe/yRA/6DXlThv
         CNBw==
X-Forwarded-Encrypted: i=1; AKwUvByIzAns1AQx/d+xfBQKf1vExjPMY2vcyndglcVfju3j+ryVrH7BK+kmZUak5ykL90IZWaQwmrktRhtQt28=@vger.kernel.org
X-Gm-Message-State: AFq9FYJPqwG1+DPxjfQbaLkNuZiRn/otXhUohxUuWromJyH5e/wFy3O3
	Y3UhRi4xL+QCpRceRiYiLW9qGQQ3zqnISVArC0V35nzukYC1BHD+o+bwC3tuQJYNsQ==
X-Gm-Gg: AYBFou2YUlyYmArlkglZOpPQhQzSxuoh7S1kpDVvogIZxOFRE5OBovGFfXsavcWX0Jv
	03iVsFhmaJkyXqUwA34+tbuysRuMkuOC4GgN3q7Tp/LzAyLUQecUdh6YBITsRY6rWUcbYBRtoiP
	OBmOxT2YN4pqQR4yoL0LJsuYWnUZFSEZmPKxtY+oreLoju95twaH870fCbfCf/ehEuqcCykVXiy
	yqcsevQecKSaRzLlq7nlfhgnKD5ItIXpxKSAffJrs8xBo+mXQpz5099TdfNcdHPX2rI9cpIY3ii
	3vijUzC5aBgBpWsKmLQIaz3Q/0/D6n++dRGv3mlJ58tG9Ba4YNX0IJVqtb8sOG9Yb4geqJS3mvq
	plvZJAi0dHhm3EEaaunkL/UANhznSpXiMmTbIuqlUG7BOKI7T36BPmfEb2t/hYVW9B3kIR8nSea
	WlyZmqmIf/kHhCNQykSCbqGAa2/BVEhIDQofQBTPqi+Ib0pnBdvDJCegqNVd4dMB0BtfRiuGwyr
	F8SWBwlDwQwZ0kU+CCfsFE/tFhbQaMy7daT93y2lJgkLqRWsOTX2BJB9lxmJ3yNtn8covIuhYNu
	59+59YG6xetNIiAswJBeq1XGZWif1yXLTer1cWKyL0AOaceJbMkdkVejmtAqJQHrBFH9AQpAN8N
	UK1JZs9l7RaxQKBeaaoBjSAM=
X-Received: by 2002:a17:903:2acc:b0:2e9:73e0:2a6e with SMTP id d9443c01a7336-2eb019ace41mr19649005ad.17.1793389314108;
        Fri, 30 Oct 2026 12:41:54 -0700 (PDT)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb096b7483sm1191940a12.9.2026.10.30.12.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:41:53 -0700 (PDT)
Date: Fri, 30 Oct 2026 19:41:50 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, David Woodhouse <dwmw2@infradead.org>, 
	Pranjal Shrivastava <praan@google.com>, Robin Murphy <robin.murphy@arm.com>, 
	Kevin Tian <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>, 
	Shuah Khan <shuah@kernel.org>, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Pratyush Yadav <pratyush@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, David Matlack <dmatlack@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vipin Sharma <vipinsh@google.com>, 
	Ankit Soni <Ankit.Soni@amd.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	John Starks <dev@jstarks.net>
Subject: Re: [PATCH v6 02/18] iommu/pages: Add APIs to
 preserve/unpreserve/restore iommu pages
Message-ID: <auTy6JtTflLq09eD@google.com>
References: <20261025021930.674647-1-skhawaja@google.com>
 <20261025021930.674647-3-skhawaja@google.com>
 <d6e6abad-c3c7-4f99-996a-0030bf6ef166@linux.intel.com>
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
In-Reply-To: <d6e6abad-c3c7-4f99-996a-0030bf6ef166@linux.intel.com>

On Fri, Oct 30, 2026 at 09:26:45AM +0800, Baolu Lu wrote:
>On 10/25/2026 10:19 AM, Samiullah Khawaja wrote:
>>IOMMU pages are allocated/freed using APIs using struct ioptdesc. For
>>the proper preservation and restoration of ioptdesc add helper
>>functions.
>>
>>Reviewed-by: Pranjal Shrivastava<praan@google.com>
>>Signed-off-by: Samiullah Khawaja<skhawaja@google.com>
>>---
>>  drivers/iommu/iommu-pages.c | 109 ++++++++++++++++++++++++++++++++++--
>>  drivers/iommu/iommu-pages.h |  30 ++++++++++
>>  2 files changed, 135 insertions(+), 4 deletions(-)
>>
>
>[...]
>
>>+
>>+/**
>>+ * iommu_restore_pages - Restore pages that were preserved in KHO
>>+ * @phys: Physical address of page to restore
>>+ */
>>+void iommu_restore_pages(u64 phys)
>>+{
>>+	struct ioptdesc *iopt;
>>+	struct folio *folio;
>>+	unsigned long pgcnt;
>>+	unsigned int order;
>>+
>>+	folio = kho_restore_folio(phys);
>>+	if (!folio)
>>+		panic("Failed to restore preserved IOMMU page %llx\n", phys);
>>+
>>+	iopt = folio_ioptdesc(folio);
>>+
>>+	/*
>>+	 * For the restored pages incoherent is set to false as these are not
>>+	 * mapped using the DMA_API. The remapping of these pages using DMA_API
>>+	 * is not needed as these are not going to be written to by the new
>>+	 * kernel.
>>+	 */
>>+	iopt->incoherent = false;
>>+
>>+	order = folio_order(folio);
>>+	pgcnt = 1UL << order;
>>+	iommu_folio_update_stats(folio, pgcnt);
>>+}
>>+EXPORT_SYMBOL_GPL(iommu_restore_pages);
>
>The pages were charged to the VMM's memcg in the old kernel (iommufd
>maps with GFP_KERNEL_ACCOUNT), but after the live update they are no
>longer charged to any memcg. I think that's fine, because the restored
>tables are immutable and will be replaced by ordinary ones after boot.
>
>This patch looks good to me,
>
>Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

Thanks for the review,
Sami
