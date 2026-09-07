Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E056143F0B9
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788769706; cv=none; b=Cp5W25x5TjD7UUdXryxxjL9Jin6CnAr6HCpXoPqE8AsGZI3Op/UfT7DGeXPxi8hoJoVLENBVOuotLQLeT/b8wxmbK77AjKyyMfUNtUeGWPCPEjGEBm9NlvNaX+8DW3DKS+jpoE+P9Ah+AQibyVZoLCS1Jo+FjghpcIWawqCWcCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788769706; c=relaxed/simple;
	bh=ifYPWKvQeaXHHlqSmPNNhJc6BGUoY4I399YgkUk1yRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CY4lYihE6coKxjbt1LCqkd5RUTwm9Xcp+odbDamQ0JG6A5V1fam6i/HGfbcgsC3m40FEA3FxHMI3WJgQ1lpzy4mGDtVzoYHH5Lr03siRiHVVpGze8zUyMsFym6dkP7Zkos4rrZHBHhCIce+9Dykm/dj526OmYf3YSYkdTaRnwpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=rvzAH21X; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="rvzAH21X"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788769700; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=OXBkqVELA+ZoClZ9gQ+v3PG6IJO4Th4rs/k5QhawMl4=;
	b=rvzAH21Xe/+yUxN0CcjpuJOtMdjNOGghgH0ngQDa4V1xWoj926Umo0cfFHBZSG0Z1HkhRqFTnCKuiMpt8RLXZW9Ol471zf0xyXDFd3P94C8+TZFd7QUy7GBZD/GZa8n0X1iHf+JS9cNFx3T+M/2r36BJv7v32P4YxVBA8dj0YEY=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R221e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XARiq-e_1788769697;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XARiq-e_1788769697 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 16:28:18 +0800
Message-ID: <fa681cd0-bc4b-4779-9540-c942d0573579@linux.alibaba.com>
Date: Mon, 7 Sep 2026 16:28:17 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/12] mm/collapse: drop the collapse_possible() wrapper
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
 <e6780351a3a29fc1a9efb7d2fb2ef6d1466a50dd.1788533997.git.kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <e6780351a3a29fc1a9efb7d2fb2ef6d1466a50dd.1788533997.git.kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 11:10 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> collapse_possible() only forwards to collapse_possible_orders() and turns
> its mask into a bool.  Its three callers can test the mask themselves.
> 
> No functional change.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
