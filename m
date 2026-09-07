Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 893EA3A0EB8
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766414; cv=none; b=O4U/7fMStKucjUBdXjMXG4xNmhsRLfZ6olRgvMCWL1wP6W4AdJoX0Oa+SapAZAzK4Lr6QpwzPZO2rS0VPd/adxrSo+nGSIU/s3I4HKRuGtWyLfCOPx14oIGv9ucXIM/Vzv6BouS1Q+Pou5X/eiUabi68nU9zNHou3JVR1oCR6K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766414; c=relaxed/simple;
	bh=D/y2mdVBkFxfjmcBW7+2Mk9RHhNaZycvylrTlIPUPJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFkc8Ibpcy1Q3lxvbj+6zQYjTF2TMCa3+UueSp2kh7BzJHfbqKeve6zRyP7q65FoaLQxahXvjaq6enaGHR3Q7j06e+NkrEQ7uYNex19ORPhz1f0CmJgo3aVRC40EpttxKj5wjVoufqhECjAjjSX8TdAvNtvELbTOdOJpxttK7a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=x3+RDOpg; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="x3+RDOpg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788766402; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=LSq4ZQqaWk+5Q9B9WXTtDjEPfaekNXw7DoUsIzmzTV4=;
	b=x3+RDOpgVFdsc5nzsGV8pRT9pZJKJ2o47kxFCecOKSWdux1IXx0si1NLkuoxZdCoMGV73XJtwjscwzpPBH5Div2ujXWfBKteKmpzkU3DZviROs8nFtaVT2oR11GZjFF7/RDogP2BAUuV1+GX7s0Z3Jcxkat6pX5ywfA0c+avZz0=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=18;SR=0;TI=SMTPD_---0XAQkH3p_1788766399;
Received: from 30.74.144.134(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XAQkH3p_1788766399 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 07 Sep 2026 15:33:20 +0800
Message-ID: <30ab6d94-2053-4c32-88a1-36def010cb45@linux.alibaba.com>
Date: Mon, 7 Sep 2026 15:33:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/12] mm/khugepaged: drop redundant mm_struct pin in
 madvise_collapse()
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
 <1ff754df1d57154e01356f35d72b1cb06c0f8664.1788533997.git.kas@kernel.org>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <1ff754df1d57154e01356f35d72b1cb06c0f8664.1788533997.git.kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/4/26 11:10 PM, Kiryl Shutsemau wrote:
> From: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
> 
> madvise_collapse() holds an mmgrab() reference across its work. It is
> redundant. Every caller already holds mm_users:
> 
>   - madvise(2) works on current->mm, which lives as long as the task is in
>     the syscall;
>   - process_madvise(2) reaches a remote mm through mm_access(), which takes
>     an mm_users reference and holds it until the syscall returns;
>   - io_uring passes current->mm;
>   - DAMON takes one with get_task_mm() and drops it after the call.
> 
> Drop the mmgrab()/mmdrop() pair.
> 
> Assisted-by: Claude-Code:claude-opus-5
> Signed-off-by: Kiryl Shutsemau (Meta) <kas@kernel.org>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
