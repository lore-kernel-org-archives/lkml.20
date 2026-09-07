Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0761E356766
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766813; cv=none; b=cHsoaqfQ0SRgC/SesMUepU/GBV7XQAQUUEdzWRbglgPAez1CoX2BU07xVtGrYbVEU4xJFhTBPrZtOft8MGZsfMOqipJWYKK6nO3gdiKWOZfMwd/XSqeR1a+qOF8jKQlf2wixTeW7K1Ii/GCSm4kK7Us4/QyKqa31QiGafVGMb1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766813; c=relaxed/simple;
	bh=02mINIJ30751fErALvbfcy6p491D7LShu8D9nQTARa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j+10o2a8Sx7g56yhzQDXotep8WIFPcwWCVEVuU4euw3G7qfbH+G0G3uCHCoHzNGTY4Zt5NylWApE2YwrEgBNUzayVhVnKOydq7HFt84vjrXFL+KMQPArHxvxVJv1yP+fcoIPxamE9FGxPAG4WWwLibcrTOZdu85yCq+MdNO0pZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rX0T68er; arc=none smtp.client-ip=115.124.30.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rX0T68er"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788766807; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=82c/cEDSh9maujXIA79HAPy5EQu+cpWevwisjM76zYI=;
	b=rX0T68er5ev/xW3bQX14oqnSFEQW1+FjmFjQTgma9Hn0Qv5gv8AXpzrKzUt5ReEfy5YtdlNtfIoMxu6f6SYjwOfnzShsPJ7oR7O9vpJJony5XWAV719BFbrx7lBBsN5jfUHa9TdUMT1ocXVpdiDfv5ka4Z+2o48NfuTzHtng838=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R111e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XAQpdfr_1788766804;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAQpdfr_1788766804 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 15:40:05 +0800
Message-ID: <814025eb-87cf-49d6-90df-ad1783fb220c@linux.alibaba.com>
Date: Mon, 7 Sep 2026 15:40:03 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/12] mm/khugepaged: count collapses where khugepaged
 makes them
To: Kiryl Shutsemau <kirill@shutemov.name>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 Zi Yan <ziy@nvidia.com>, "Liam R . Howlett" <liam@infradead.org>,
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
 "Kiryl Shutsemau (Meta)" <kas@kernel.org>
References: <cover.1788533997.git.kas@kernel.org>
 <ef229484e454d804ffbdbf8ae87798919594fd1b.1788533997.git.kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ef229484e454d804ffbdbf8ae87798919594fd1b.1788533997.git.kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 11:10 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_single_pmd() bumps khugepaged_pages_collapsed for its caller, and
> tests cc->is_khugepaged to know whether it should: the counter belongs to
> the daemon, and MADV_COLLAPSE must not touch it.
> 
> The daemon sees every result of every collapse it asks for, so it can keep
> its own counter without the shared path testing who called.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
