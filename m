Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6ACF18A6DB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792048944; cv=none; b=Xi/XqoVldZ+HIlrS8OWO4K1xhLI6wrLxVeWaUzKtCtaaDwHxUQaM2wZXqfb53wdlKfYnPkGmbPrIYcmbdxJV20bZ8ggOSglQoqkPZ4icu30oqfFewdJBXoz0f5m358I5hE8d/4Deq1AmHFZP/txw7nFUN1kZz59eaGdN92w0Fig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792048944; c=relaxed/simple;
	bh=gz1WKUGf5PX+UDGS3YXbp6hbqvdkXs1OZo/RmbXh0Tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RGF3eTzp3Xl3ac8TMOlW6spu8DYZoOCfwdF0KdgqNnBYbealOfT2SWREyz+dQZBBKp8QN0IyS4PZgA0Jb0Ctk9e1fccWwqqW7cp/OuF4Z2tgNERrZ3HxyXJpomMDl5CIiEK6Vhi2GGBVpaHY5wKdOG/k2GJODSIniQb3WpmeOGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=dhB/h3to; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="dhB/h3to"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792048916; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=bvlFkN4iufResh8aUq5gkEp0wJLrW82dGbm62yfvPuo=;
	b=dhB/h3toyepzpe8s8VBz/MGZYh0hvm3gyAZZ40dyrrulBPXK7rMScJGySTMoICMSCRaKUZM9P6pkmuZl4v854l95vyqqLz8O5vZmcCgkoZZElJcmP4uEjRGIEr4NTbf4v8cMfWcJrV9NVW904YvB7l1iQvMzTZcF99VGRdsGVCM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R721e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XCr-GAv_1792048913;
Received: from 30.74.144.143(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XCr-GAv_1792048913 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 15 Oct 2026 15:21:54 +0800
Message-ID: <6cb37e99-c84d-4832-9f45-64b816281908@linux.alibaba.com>
Date: Thu, 15 Oct 2026 15:21:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/9] mm/collapse: call collapse_file() from
 collapse_single_pmd()
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 "Liam R. Howlett" <liam@infradead.org>, Nico Pache <nico.pache@linux.dev>,
 Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>,
 Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>,
 Usama Arif <usama.arif@linux.dev>, Vlastimil Babka <vbabka@kernel.org>,
 Jann Horn <jannh@google.com>
References: <20261014171145.3292736-1-kas@kernel.org>
 <20261014171145.3292736-9-kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <20261014171145.3292736-9-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/15/26 1:11 AM, Kiryl Shutsemau (Meta) wrote:
> collapse_scan_file() reads the page cache to decide whether a table is
> worth collapsing and, when it is, calls collapse_file() itself.  The
> caller cannot get between the decision and the collapse.
> 
> Move the collapse_file() call up into collapse_single_pmd(), so the scan
> stops at the decision.
> 
> Two things change with it.  The writeback retry re-runs collapse_file()
> alone instead of rescanning first; collapse_file() repeats the scan's
> checks under the page cache lock anyway.  And mm_khugepaged_scan_file
> fires before the collapse, so for an accepted table its status reads
> SCAN_SUCCEED; what the collapse made of the table is for
> mm_khugepaged_collapse_file to report.
> 
> Preparation for splitting a collapse into a scan under mmap_lock and a
> run without it.  The file scan has to stop where the anonymous one will.
> 
> Assisted-by: LLM
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
