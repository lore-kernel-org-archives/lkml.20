Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AAF1318ED2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964499; cv=none; b=R1HsK2WFCIAjLYCXMju8S/urTAAEzCkMUZ5EkKz6wymPWG/ZRL7Jp2ou8kuxqjYRTsc9kF2HFF4UGZzs9F00jexEUSreMuP3CxzwAHONcgJ8HC1nFZ1qh2yk+DH12/zGny/ucrKuhov66vjwTkyEfefcnmckzvlFqMTxMDYBvE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964499; c=relaxed/simple;
	bh=RwHtqBYdbEO/oAX55Yv+KYB+yMJrjdlzXRbNRgBuHAQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ATuPpigVL0yiTTrwZiTdQEpGRUz15oV1dSVRLr4vy4kd7jZgp0QzaFel3SoR9Qc3Ejsx4Oc8P/JApKD5+u8DzldsAhTIqyC0xQSlUNuHMou+GXHxP3sOI7Qi6uqyBsv33CtwbEY5UtiXr5CiDoK+1p//bE59cHx9P0FdwfZXcVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=LjTp0sc6; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="LjTp0sc6"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791964493; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=A1srLPeeQpqMU1BY9DsdzVHBSRvgKY9TmGHXByiTkNk=;
	b=LjTp0sc6K1lOlW/cYg/IYft6rBlJ444z02dP/KUSDjrsjsvQqtV74yA33sJB9wyhY90+tAmrlmbNAj5U++FdIAhjKQ0mlxWyeoY82Ml3o96rSg615du5G+96GV0L+j9rw8GPU6RMc3jhPMKcgcvOQEp/NIzTmVyDoTym+ta9CCI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R131e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=tongweilin@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0XCoKjKf_1791964491;
Received: from 30.74.129.250(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0XCoKjKf_1791964491 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 Oct 2026 15:54:52 +0800
Message-ID: <82f099d8-e46d-481e-bba5-95bff118ffbb@linux.alibaba.com>
Date: Wed, 14 Oct 2026 15:54:51 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ipc/shm: fix RSS accounting for hugetlb shared memory
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>,
 Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 Lorenzo Stoakes <ljs@kernel.org>, Dan Carpenter <error27@gmail.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261014062705.1997201-1-tongweilin@linux.alibaba.com>
 <0B5B2CA9-8FA9-4DEE-BF78-8E280F337362@linux.dev>
Content-Language: en-US
From: Weilin Tong <tongweilin@linux.alibaba.com>
In-Reply-To: <0B5B2CA9-8FA9-4DEE-BF78-8E280F337362@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Muchun,

Thanks for the review and suggestion. The simplification makes sense. 
I'll update the patch accordingly and then send v2 after testing.

Thanks,
Weilin


在 2026/10/14 15:25, Muchun Song 写道:
>
>> On Oct 14, 2026, at 14:27, Weilin Tong <tongweilin@linux.alibaba.com> wrote:
>>
>> Commit a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in
>> filemap.c") changed mapping->nrpages to count base pages for hugetlb
>> folios. However, shm_add_rss_swap() still multiplies it by
>> pages_per_huge_page(), overcounting RSS in both SHM_INFO and
>> /proc/sysvipc/shm.
>>
>> Use mapping->nrpages directly and remove the unused hstate variable.
>>
>> Fixes: a08c7193e4f1 ("mm/filemap: remove hugetlb special casing in filemap.c")
>> Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
>>
>> ---
>> ipc/shm.c | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/ipc/shm.c b/ipc/shm.c
>> index 25190965c9a50..5ed2beef0f1d2 100644
>> --- a/ipc/shm.c
>> +++ b/ipc/shm.c
>> @@ -943,8 +943,7 @@ static void shm_add_rss_swap(struct shmid_kernel *shp,
>>
>> 	if (is_file_hugepages(shp->shm_file)) {
>> 		struct address_space *mapping = inode->i_mapping;
>> - 		struct hstate *h = hstate_file(shp->shm_file);
>> - 		*rss_add += pages_per_huge_page(h) * mapping->nrpages;
>> + 		*rss_add += mapping->nrpages;
> Hi Weilin,
>
> Thanks for fixing this. Using mapping->nrpages directly for hugetlb
> folios is correct.
>
> Could you please simplify shm_add_rss_swap() further as shown below?
>
> The info->lock taken here only serializes the read of info->swapped. It
> does not protect mapping->nrpages, which is updated under the page-cache
> XArray lock. Therefore, taking info->lock cannot provide a consistent
> snapshot of nrpages and swapped.
>
> These statistics are inherently best-effort, so READ_ONCE() should be
> sufficient for both fields. This is also consistent with
> shmem_swap_usage(), which reads info->swapped using READ_ONCE() without
> taking info->lock.
>
> With that, the nrpages accounting can be shared by all backing types,
> and only the swapped accounting needs to remain conditional on
> CONFIG_SHMEM and non-hugetlb files.
>
> Please also mention the lockless snapshot change in the commit message.
>
> Thanks,
> Muchun
>
> diff --git a/ipc/shm.c b/ipc/shm.c
> index bb1a721a3e74..6862f681373f 100644
> --- a/ipc/shm.c
> +++ b/ipc/shm.c
> @@ -936,26 +936,11 @@ static inline unsigned long copy_shminfo_to_user(void __user
> *buf, struct shminf
> static void shm_add_rss_swap(struct shmid_kernel *shp,
>       unsigned long *rss_add, unsigned long *swp_add)
> {
> -     struct inode *inode;
> +     struct inode *inode = file_inode(shp->shm_file);
>
> -     inode = file_inode(shp->shm_file);
> -
> -     if (is_file_hugepages(shp->shm_file)) {
> -             struct address_space *mapping = inode->i_mapping;
> -             struct hstate *h = hstate_file(shp->shm_file);
> -             *rss_add += pages_per_huge_page(h) * mapping->nrpages;
> -     } else {
> -#ifdef CONFIG_SHMEM
> -             struct shmem_inode_info *info = SHMEM_I(inode);
> -
> -             spin_lock_irq(&info->lock);
> -             *rss_add += inode->i_mapping->nrpages;
> -             *swp_add += info->swapped;
> -             spin_unlock_irq(&info->lock);
> -#else
> -             *rss_add += inode->i_mapping->nrpages;
> -#endif
> -     }
> +     *rss_add += READ_ONCE(inode->i_mapping->nrpages);
> +     if (IS_ENABLED(CONFIG_SHMEM) && !is_file_hugepages(shp->shm_file))
> +             *swp_add += READ_ONCE(SHMEM_I(inode)->swapped);
> }
>
>> 	} else {
>> #ifdef CONFIG_SHMEM
>> 		struct shmem_inode_info *info = SHMEM_I(inode);
>> -- 
>> 2.43.5
>>
