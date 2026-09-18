Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C0F4C10F0
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722114; cv=none; b=GDwIat0XlijKG0frm6j8odevYsp3LzOp8MUb9Jddxjffmeqpb4mM2m4WWVY6dbgqRlS2m1MICwzXJoHc+ub9uo9t/67SOXc2e2kS8r982UCyCYdmq/oDVzwsLRhQHNKPK/s/6NQD2RQppvaz16cN2EjueGqzXIbszMqJLPz7Q7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722114; c=relaxed/simple;
	bh=vSEawGC5qLQKu6YqdtEsAl4S0/vmxd0TNhNzrJBaer8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FrO+hwf27jeUZ2MtFQ9JtTsw0uE7bM7IQ20YF2Z3AHLBicL2LRx3sW7wd1KnOPojpXFuCCk7TyYUY3F0ApH7b2z7Tl3469VhqD2Rjpk9srF3fshjfvhWCx6SKsn42jI9wlko4UMRx4KZNihFCh/d55Xp6vKMWMgs9ndg5e6pIFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Ii4BcVD+; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Ii4BcVD+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789722104; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7cXjWzaRtWxw32n4xjyS3mKbdHRC6dQcSY+YfxC7m4k=;
	b=Ii4BcVD+zUcvvb9iSqBAmbS/5ZQSy6HH5TPETd4FPT1xHBdJkvTXoGbO3bsm9w0p6oVUMzoTYOYorRoo++7V0sJjvbT64b+i8U8xKjYhGr4y6Q1/wBhgTr0A8mEw4X6E3zNquu8vW53/zwULgKtLad/wRdZpvhjaWNpeOL+7CvI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R161e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=27;SR=0;TI=SMTPD_---0XBArCsH_1789722100;
Received: from 30.74.144.124(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0XBArCsH_1789722100 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 17:01:42 +0800
Message-ID: <5ae6a85d-1e74-4ef2-905b-0bc3491d1450@linux.alibaba.com>
Date: Fri, 18 Sep 2026 17:01:40 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 14/14] mm: thp: always enable mTHP support
To: Luiz Capitulino <luizcap@redhat.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, david@kernel.org, ziy@nvidia.com, lance.yang@linux.dev
Cc: corbet@lwn.net, tsbogend@alpha.franken.de, maddy@linux.ibm.com,
 mpe@ellerman.id.au, agordeev@linux.ibm.com, gerald.schaefer@linux.ibm.com,
 hca@linux.ibm.com, gor@linux.ibm.com, x86@kernel.org, tglx@kernel.org,
 mingo@redhat.com, bp@alien8.de, hughd@google.com,
 dave.hansen@linux.intel.com, djbw@kernel.org, vishal.l.verma@intel.com,
 dave.jiang@intel.com, akpm@linux-foundation.org, yintirui@huawei.com,
 dev.jain@arm.com, usama.arif@linux.dev
References: <cover.1789695931.git.luizcap@redhat.com>
 <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <752f528f0fed5cdc9de12b54260b0495d4e5a6cb.1789695931.git.luizcap@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/18/26 9:45 AM, Luiz Capitulino wrote:
> If PMD-sized pages are not supported on an architecture (ie. the
> arch implements arch_has_pmd_leaves() and it returns false) then the
> current code disables all THP, including mTHP.
> 
> This commit fixes this by allowing mTHP to be always enabled for all
> archs. When PMD-sized pages are not supported, its sysfs entry won't be
> created and their mapping will be disallowed at page-fault time.
> 
> Similarly, this commit implements the following changes for shmem in
> shmem_allowable_huge_orders():
> 
>   - Drop the pgtable_has_pmd_leaves() check so that mTHP sizes are
>     considered
>   - Filter out PMD and PUD orders from allowable orders when
>     PMD-sized pages are not supported by the CPU
> 
> Signed-off-by: Luiz Capitulino <luizcap@redhat.com>
> ---

LGTM.
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
