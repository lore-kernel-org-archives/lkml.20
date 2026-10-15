Received: from canpmsgout09.his.huawei.com (canpmsgout09.his.huawei.com [113.46.200.224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F367D4FDE55
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=113.46.200.224
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792056644; cv=none; b=lDeCNTGmWkTz1eT4hn9sZh0ya/6tGuqW4PrLbbh7QZSO2XWBvdcmBue+rt2qVnOT8P6JUMyFj62jUG4zhpw05RnMk2om6UFnKgFVw9aTQWk4dUFebVFj7c0sHu5jYbwflB7/6WkcTd0/tRbL3E4vMvUP2KNX5DS80ECM4rmr/V0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792056644; c=relaxed/simple;
	bh=F4jROp+pxstN2YWid5Oa8iSjin4tTc4C3N2J9g07TCs=;
	h=Subject:To:CC:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=hDecDVLuHkCF27onDChCiWRCT9+6kMpJXS4Swd3EOjNFmq4QxRuX02PAEKARozTcIG6rGNBb5POi6JLhuST+TGicpEuEuMVOvqDDs3oQACkjlmgZMLl1WPgUuO0mWI5aphxhnMEzUwrrjOeLZrZUMdV25hPz1uuzfITyKNyRv8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b=Yzj0lm5D; arc=none smtp.client-ip=113.46.200.224
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.b="Yzj0lm5D"
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iRaXeKhUNjHXGpTHHMq9qJh0jfK4pRDZnGKPUhbBq/w=;
	b=Yzj0lm5DlwcUf1WeGfqGOu/OHAt4yjNR1H9xjxXI3DtulLV9fAp76rw8QynbmLRgXWh95Sz7w
	Q2bO8cJFOEGH8WjSALlk3zeJGxoFgqButvjALLzF+pHIlcqDNdQrNicD8W7r77kFeVDhONVtqiA
	bNzZdJOEvpPE/YW+GyLcB80=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4j52ZY4h8dz1cyPY;
	Thu, 15 Oct 2026 17:19:17 +0800 (CST)
Received: from whupemo200011.china.huawei.com (unknown [7.152.185.179])
	by mail.maildlp.com (Postfix) with ESMTPS id 980BE40572;
	Thu, 15 Oct 2026 17:30:33 +0800 (CST)
Received: from [10.174.178.46] (10.174.178.46) by
 whupemo200011.china.huawei.com (7.152.185.179) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 15 Oct 2026 17:30:31 +0800
Subject: Re: [PATCH 1/2] mtd: ubi: block: forbid direct reclaim I/O during
 synchronous read
To: Yelin Fei <yelinfei66@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <richard@nod.at>, <miquel.raynal@bootlin.com>, <vigneshr@ti.com>,
	<linux-kernel@vger.kernel.org>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn>
 <d2657317d2d8f9cca201f09dbcd6d9b9b82744ba.1792046946.git.yelinfei@ruijie.com.cn>
From: Zhihao Cheng <chengzhihao1@huawei.com>
Message-ID: <7fa1fa75-df70-a721-3403-53ec43162aca@huawei.com>
Date: Thu, 15 Oct 2026 17:30:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <d2657317d2d8f9cca201f09dbcd6d9b9b82744ba.1792046946.git.yelinfei@ruijie.com.cn>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 whupemo200011.china.huawei.com (7.152.185.179)

ÔÚ 2026/10/15 15:33, Yelin Fei Ð´µÀ:
> From: Ye Linfei <yelinfei@ruijie.com.cn>
> 
> ubiblock implements ->queue_rq() synchronously: the task submitting the
> bio executes the whole UBI/MTD read itself, from inside the block layer
> submission loop (current->bio_list is non-empty) and while holding the
> tag_set SRCU read lock (blk_mq_run_dispatch_ops(), taken for
> BLK_MQ_F_BLOCKING drivers).
> 
> An allocation in that context may trigger direct reclaim, which with
> GFP_NOFS - used by all UBI allocations - may synchronously write dirty
> pages to swap.  On systems where swap is backed by a device with
> BLK_FEAT_SYNCHRONOUS (zram), that ends in swap_writepage_bdev_sync()
> -> submit_bio_wait().  The swap bio is only queued onto
> current->bio_list, never dispatched: per submit_bio_noacct_nocheck(),
> bios submitted while a submission loop is active are only collected on
> current->bio_list, and their sole dispatcher is the task currently
> executing ->queue_rq() - which is now sleeping waiting for the very
> same bio's completion.  The task hangs forever, the pending SRCU read
> lock freezes grace periods (blk_mq_timeout_work() -> synchronize_srcu()
> never returns), and the unfinished request blocks all other I/O to the
> device.
> 
> This was observed in the field on a 1 GiB RISC-V networking product
> running squashfs-on-ubiblock with zram swap: 47 tasks stuck in disk
> sleep for 600+ seconds, ending in a hung task panic.  The allocator
> never reached the OOM decision point, because the task died inside
> try_to_free_pages().
> 
> Mark the whole read with memalloc_noio_save()/memalloc_noio_restore()
> so direct reclaim never issues block I/O while this driver executes:
> reclaim is restricted to dropping clean page cache and shrinking slabs,
> page (swap) reclaim is performed asynchronously by kswapd, and the
> worst case is -ENOMEM, which propagates to the caller as an ordinary
> recoverable I/O error - a recoverable read failure instead of a total
> system hang.
> 
> This covers every allocation performed below ubi_read_sg(), including
> lock-tree entries, VID buffers and I/O helpers, regardless of the gfp
> flags they use internally.
> 
> Fixes: 9d54c8a33eec ("UBI: R/O block driver on top of UBI volumes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ye Linfei <yelinfei@ruijie.com.cn>
> ---
>   drivers/mtd/ubi/block.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)

Looks like other block drivers(eg. nvme/nbd/rbd..)  won't trigger direct 
mem reclaim by using flags 
GFP_ATOMIC(nvme_pci_setup_meta_iter)/GFP_NOIO(nbd 
sock_xmit)/GFP_NOWAIT(loop).

Reviewed-by: Zhihao Cheng <chengzhihao1@huawei.com>
> 
> diff --git a/drivers/mtd/ubi/block.c b/drivers/mtd/ubi/block.c
> index 29c0d6941a81..c9d42181bf64 100644
> --- a/drivers/mtd/ubi/block.c
> +++ b/drivers/mtd/ubi/block.c
> @@ -38,6 +38,7 @@
>   #include <linux/blkdev.h>
>   #include <linux/blk-mq.h>
>   #include <linux/hdreg.h>
> +#include <linux/sched/mm.h>
>   #include <linux/scatterlist.h>
>   #include <linux/idr.h>
>   #include <asm/div64.h>
> @@ -189,6 +190,7 @@ static blk_status_t ubiblock_read(struct request *req)
>   	int leb = pos;
>   	struct req_iterator iter;
>   	struct bio_vec bvec;
> +	unsigned int noio_flags;
>   	int ret;
>   
>   	blk_mq_start_request(req);
> @@ -201,6 +203,18 @@ static blk_status_t ubiblock_read(struct request *req)
>   	ubi_sgl_init(&pdu->usgl);
>   	blk_rq_map_sg(req, pdu->usgl.sg);
>   
> +	/*
> +	 * This entire callback runs in the synchronous dispatch path of
> +	 * blk-mq: submit_bio_noacct_nocheck() only queues a bio submitted
> +	 * from here onto current->bio_list, and the sole dispatcher of
> +	 * that list is this very task, busy inside ->queue_rq().  Any
> +	 * block I/O issued from below would therefore deadlock against
> +	 * itself (e.g. synchronous swap writeback reached via direct
> +	 * reclaim).  Forbid it for the whole read instead of relying on
> +	 * every callee using safe allocation flags.
> +	 */
> +	noio_flags = memalloc_noio_save();
> +
>   	while (bytes_left) {
>   		/*
>   		 * We can only read one LEB at a time. Therefore if the read
> @@ -221,6 +235,7 @@ static blk_status_t ubiblock_read(struct request *req)
>   
>   	rq_for_each_segment(bvec, req, iter)
>   		flush_dcache_page(bvec.bv_page);
> +	memalloc_noio_restore(noio_flags);
>   
>   	blk_mq_end_request(req, errno_to_blk_status(ret));
>   
> 

