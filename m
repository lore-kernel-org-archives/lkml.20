Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF32430794
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788768266; cv=none; b=AMP+eC+im8TMwUACpvbudRx3Hfnzj+w6WQehPqKTlIKYCMNiGQXKRhiwjtcdomu9bIIbptFhFoyAP8p8mXBRuVXxcicF6QfcYL6G/wniRXg8VibhcX8DYtwkxyRGQn2PLd17cFMqDFixNMjU42as2VxTcq/pOhMsu3R6SPpvoQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788768266; c=relaxed/simple;
	bh=b+OSBB7UacxAa2Ru3pf5yCv3jBIfpDG/oVpxk0NiODA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4LRgueoAKmgx34CDCD04ck8uJEvwFLhfPsoTfPquLWTkWLyUm5jB2wVOC55gxGYlhx3U6SkvTzSLIp/xJz+DB4Z73ynCqimETDC3l4oi9XDS2VfkbOHgsvbnq1Yi95SqbvLitDM0tqGu7tQ3ZdPkirHyjAagPt2sMfS5owxHZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=tyUIaPE9; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="tyUIaPE9"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788768261; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Q6I4xw0xnOtAHkDCMQZgtHQlZ6+NllaxbRPZMgDJ1jw=;
	b=tyUIaPE99DVxkKK2DolqVABlHAB3VkeXTtEdovWM30UhC2+6cAgbMyVbnkSZYS9jcioblDBpgGcaJXra78xsgw7RWGjLUWS/TGERzDY/YqGVyZaLufsZSiv55aKU6V9nNOu3bM9pQMo+yJ3CzRz1mDmcpR05FwqTmyQGn2VzQ1w=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XARLZAw_1788768258;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XARLZAw_1788768258 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 16:04:19 +0800
Message-ID: <7e0cdf3c-d922-4c53-9a76-75451327d894@linux.alibaba.com>
Date: Mon, 7 Sep 2026 16:04:18 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] mm/collapse: add collapse.h for the collapse
 interface
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
 <ec5230f43af7153e18aed02c6ee38f010106d8e8.1788533997.git.kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <ec5230f43af7153e18aed02c6ee38f010106d8e8.1788533997.git.kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 11:10 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> khugepaged.c holds both the users of collapse and the machinery that
> performs it.  The daemon's scan loop, the sysfs tunables, MADV_COLLAPSE's
> entry point and the collapse itself all sit in one file and reach into
> each other freely.  Nothing marks where a user ends and the engine
> begins.
> 
> Start drawing that line.
> 
> Add mm/collapse.h for what the two sides have to agree on:
> 
>    - enum scan_result - what the engine hands back;
>    - struct collapse_control - the state a request carries.
> 
> And two constants move with them:
> 
>    - KHUGEPAGED_MAX_PTES_LIMIT -> COLLAPSE_MAX_PTES_LIMIT;
>    - KHUGEPAGED_MIN_MTHP_ORDER -> COLLAPSE_MIN_MTHP_ORDER.
> 
> Neither is a fact about the daemon, so both lose the KHUGEPAGED_ prefix.
> 
> No functional change.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---
>   MAINTAINERS     |  1 +
>   mm/collapse.h   | 67 +++++++++++++++++++++++++++++++++++++++++
>   mm/khugepaged.c | 79 ++++++++-----------------------------------------
>   3 files changed, 81 insertions(+), 66 deletions(-)
>   create mode 100644 mm/collapse.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a9245d827ddb..4d1ff4c76496 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17433,6 +17433,7 @@ F:	Documentation/admin-guide/mm/transhuge.rst
>   F:	include/linux/huge_mm.h
>   F:	include/linux/khugepaged.h
>   F:	include/trace/events/huge_memory.h
> +F:	mm/collapse.h
>   F:	mm/huge_memory.c
>   F:	mm/khugepaged.c
>   F:	mm/mm_slot.h
> diff --git a/mm/collapse.h b/mm/collapse.h
> new file mode 100644
> index 000000000000..1c40229b9554
> --- /dev/null
> +++ b/mm/collapse.h
> @@ -0,0 +1,67 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef __MM_COLLAPSE_H
> +#define __MM_COLLAPSE_H
> +
> +#include <linux/mm.h>
> +#include <linux/nodemask.h>
> +#include <linux/pgtable.h>
> +#include <linux/types.h>
> +
> +/* The most the max_ptes_* tunables accept */
> +#define COLLAPSE_MAX_PTES_LIMIT		(HPAGE_PMD_NR - 1)
> +
> +/* The smallest order a collapse will build */
> +#define COLLAPSE_MIN_MTHP_ORDER		2

These 2 macros are already self-explanatory, and the comments are 
over-documented. I'd prefer to drop them. With that,

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
