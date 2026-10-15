Received: from canpmsgout03.his.huawei.com (canpmsgout03.his.huawei.com [113.46.200.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DE24A64EA
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062237; cv=none; b=aO5sng/a4lrZITsP1gJNKWAe6cXXcZo9M4gDeayGCwIogSxYZ/tFne+sI1T4BXygvbDT6AZOkNAjHz6hcuzrmPXjlQzXWIE40F7REe3OJnQRS+cp4ubjAaswP1TnK/hy9GmvJpsnDwE1S81Zzw02IVbJwE5zOnw6T/xtRDVFSho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062237; c=relaxed/simple;
	bh=F5bs0XB3kV365098hX6HTK0s2avukE9RjL4aR15VGWk=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=ldDoy7jExaCh/tKRlZUhjhM9rEVASwfkWWIyR7BHcPhdlgaaCSKmnJVPuLQoh2B80nmsmUf+wcMzOr9rN5MeDKvIWjHxuwnxqvVavww3ll2lJFH3a+mMLoSD29eeev7BPvCA1labK3eGsTWgha82KQlTi3mT42cfz+9PP6cnKuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=sOP1bESz; arc=none smtp.client-ip=113.46.200.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="sOP1bESz"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nc+mRntCZbE6AaA9IRRfmZusSjKwibC4JVgRA7v5cw0=;
	b=sOP1bESzum+fry0YPsCauk+npmZYNyrGXuCvxH0gbyONkpGTKvinhviCgDkLEMrZ1FDgRl4zk
	Typ26sOMTPAsrgkuKcCDfCFYsf2QnaCsXSiBDzj5GtN9R2gIpm5utlEnGxpfgzXFR81jZhl0U+Q
	CuSc4mZ2gVWEmurdzRBZqRs=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4j54cc3QrqzpT0F;
	Thu, 15 Oct 2026 18:51:12 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 9441F202E6;
	Thu, 15 Oct 2026 19:03:49 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 15 Oct 2026 19:03:48 +0800
Subject: Re: [PATCH 2/2] mtd: ubi: use GFP_NOIO for lock tree entry allocation
To: Yelin Fei <yelinfei66@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
 <8b4e0b970271095df8321b1662aa464c5b9002dc.1792046946.git.yelinfei@ruijie.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <f89c80cb-d879-ede2-9459-1778ff2f71c2@huawei.com>
Date: Thu, 15 Oct 2026 19:03:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8b4e0b970271095df8321b1662aa464c5b9002dc.1792046946.git.yelinfei@ruijie.com.cn>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/15 15:33, Yelin Fei Ð´µÀ:
> From: Ye Linfei <yelinfei@ruijie.com.cn>
> 
> The per-LEB lock tree entry can be allocated while UBI is executing on
> behalf of a synchronous block-layer consumer (ubiblock), where issuing
> further block I/O from direct reclaim would deadlock; see the
> preceding commit "mtd: ubi: block: forbid direct reclaim I/O during
> synchronous read" for the full analysis.
> 
> Make the allocation self-contained: GFP_NOIO restricts direct reclaim
> to dropping clean page cache and shrinking slabs, page (swap) reclaim
> is left to kswapd, and the worst case is -ENOMEM, which callers
> already propagate as an ordinary recoverable I/O error.
> 
> memalloc_noio_save()/memalloc_noio_restore() in ubiblock_read()
> already enforce this for the whole read scope; keeping the allocation
> here self-contained as well means the safety property does not depend
> on every future caller remembering to set up that scope.

The ltree_add_entry() has many callers that not need GFP_NOIO, I think 
'mtd: ubi: block: forbid direct reclaim I/O during
 > synchronous read' is enough.
> 
> Signed-off-by: Ye Linfei <yelinfei@ruijie.com.cn>
> ---
>   drivers/mtd/ubi/eba.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
> index f0c549e62c55..8fe68e7fff58 100644
> --- a/drivers/mtd/ubi/eba.c
> +++ b/drivers/mtd/ubi/eba.c
> @@ -247,7 +247,7 @@ static struct ubi_ltree_entry *ltree_add_entry(struct ubi_device *ubi,
>   {
>   	struct ubi_ltree_entry *le, *le1, *le_free;
>   
> -	le = kmalloc_obj(struct ubi_ltree_entry, GFP_NOFS);
> +	le = kmalloc_obj(struct ubi_ltree_entry, GFP_NOIO); /* see ubiblock_read() */
>   	if (!le)
>   		return ERR_PTR(-ENOMEM);
>   
> 

