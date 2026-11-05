Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914005;
	b=QDOy9CHMvm68zzzipbDigqNDjDa7A1KqmxcgeTdiMVaPWshWzm4mANwx7ad6D1ZDQoeE
	 J4ieIkcIflS4QANHehCStdkDidOfeK5LwsJGlOLgmOKRv3tohZL6AbxUYBmJAml5NEopO
	 mT7rM9HNmPWcA91zev3CkapeFC4Gpv5WqEyxomb2O77zdk5GNx30ceZcEdGP6Z1Ybj3PQ
	 bN8RhE2ZYoeFPEAXUZPgM1p9+LJyQ9so4Nz1BvrL1n+4aiLqQ6f0Fy3q4uRwoM+3W5JsF
	 TaGXeRfypTkdwzm8knRj3mPda9O6KAA5y/2nQaQJoJW3lu64qydrPxP9bbexCgkIQCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914005;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=j6nLzJpF4CfBD1Utx6iKhdNHDK2kO6FZNPxEtGMJpzs=;
	b=lbgKOqmCJez3By9+/iZ9+IQ2jQuaAehfwuAvniABe/kiat6Zw51ge9TU1DgAs9Tbh/dC
	 yk4EG8wcK+MDK6J1PXArbOqckVL3iuaNIr98gfTHV7iCJP3xAJFIkfGshjBaKEDb+Bzko
	 QQbG25myJeSQp2C8OoleZ4RyUoLKLl1ADUMWMRZzLL5CM8ZXJy0EJmYN125SWlt5ooxCZ
	 ZX8YEzyv2mRaz6Cgl4LoU0P2suaHHGPWtqEAYkeniOiUsRh5VZxNKoT8+xGJSi0XwKm3z
	 ihqNLXZXh0I9W1yYiBqzatrmrFGyaz/pduuMeE06e0mX63/4Odq80gXy64h5CwEErqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Am3xs4yM;
	arc=none smtp.remote-ip=91.218.175.225
Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577B0606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 21:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 577B0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Am3xs4yM
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=50QvR5Rz1ijGbYHRRdoYsuy3eEKLOBbyuMDTHm2jZh0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793914001; v=1; x=1794518801;
 b=Am3xs4yM6/tjgZMQlaNS6DAHZ1cTQ7pKDOqHRyT9OFD+dfNifribuzZxlRop6kVPZWOmK7gK
 ulKfFwQrn14tRMSNR/7+wAAEuiVr3iWU+zAr5uqVFzq5dMWNlNawycn+A6JVNm34fQXIMWxQ1Fg
 zMSAKacEyE/Vp2zfzjzVUXu4=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 63581dc183f9fce4;
	Thu, 05 Nov 2026 21:26:41 +0000
X-Mizu-Trace-ID: 63581dc183f9fce4
X-Migadu-Flow: FLOW_OUT
Message-ID: <a2667ffd-3bbe-40b2-afc2-56fb54fb546b@linux.dev>
Date: Thu, 5 Nov 2026 22:26:36 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 for-next 2/3] block: allow error injection rules to delay
 bios
To: Mohamed Khalfella <mkhalfella@purestorage.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org
References: <20260928221634.43239-1-haris.iqbal@linux.dev>
 <20260928221634.43239-3-haris.iqbal@linux.dev>
 <20261020233441.GB1582237-mkhalfella@purestorage.com>
Content-Language: en-US
From: Haris Iqbal <haris.iqbal@linux.dev>
In-Reply-To: <20261020233441.GB1582237-mkhalfella@purestorage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/21/26 01:34, Mohamed Khalfella wrote:
> On Tue 2026-09-29 00:16:33 +0200, Md Haris Iqbal wrote:
>> Error injection can only fail a bio today. Add a delay_us option so that
>> a rule can hold a bio back first, to model a slow device.
>>
>> If a matching rule has delay_us set, the bio is held for that long. It is
>> then failed if the rule also has a status, or resubmitted otherwise.
>>
>> The resubmission is done through submit_bio_noacct_nocheck(), which is
>> where the injection hook sits. To avoid the same delay rule being applied
>> to it again, mark the bio with the BIO_ERROR_INJECTED flag before queueing
>> the work in blk_error_inject_delay(). This also prevents bios that are
>> split later and resubmitted from being evaluated for delay (or error
>> injection) again. __bio_clone() does not propagate the flag, so a clone a
>> stacking driver aims at a lower device is still evaluated.
>>
>> The bio is submitted from a workqueue rather than from the timer, because
>> submitting a bio can sleep. Bios with REQ_NOWAIT are never delayed, and
>> values above 600 seconds are rejected.
>>
>> Cc: Christoph Hellwig <hch@lst.de>
>> Assisted-by: Claude:claude-opus-5
>> Signed-off-by: Md Haris Iqbal <haris.iqbal@linux.dev>
>> ---
>>   block/error-injection.c   | 160 ++++++++++++++++++++++++++++++++++----
>>   block/error-injection.h   |   1 +
>>   include/linux/blk_types.h |   1 +
>>   3 files changed, 147 insertions(+), 15 deletions(-)
>>
>> diff --git a/block/error-injection.c b/block/error-injection.c
>> index db543fe27630..a35fe41a43e4 100644
>> --- a/block/error-injection.c
>> +++ b/block/error-injection.c
>> @@ -6,9 +6,17 @@
>>   #include <linux/blkdev.h>
>>   #include <linux/parser.h>
>>   #include <linux/seq_file.h>
>> +#include <linux/workqueue.h>
>>   #include "blk.h"
>>   #include "error-injection.h"
>>   
>> +/*
>> + * Cap the delay so that a typo can't wedge a device for good.  This is still
>> + * well beyond the default hung task timeout, which is one of the things a
>> + * delay is useful for triggering.
>> + */
>> +#define BLK_ERROR_INJECT_MAX_DELAY_US	(600 * USEC_PER_SEC)
> 
> DEFAULT_HUNG_TASK_TIMEOUT is 120 seconds (set in lib/Kconfig.debug)
> 
>> +
>>   struct blk_error_inject {
>>   	struct list_head		entry;
>>   	sector_t			start;
>> @@ -18,14 +26,104 @@ struct blk_error_inject {
>>   
>>   	/* only inject every 1 / chance times */
>>   	unsigned int			chance;
>> +
>> +	/* hold the bio for this long before submitting or failing it */
>> +	unsigned int			delay_us;
>> +};
>> +
>> +/*
>> + * A bio held by a delay rule.  It does not point back at the rule, so rules
>> + * can be removed while delayed bios are outstanding.  The submitter holds the
>> + * bdev open until the bio completes, so the disk and queue stay allocated.
>> + * A delayed bio holds no queue usage counter reference, so it does not hold
>> + * up a queue freeze either.
>> + */
>> +struct blk_error_inject_delay {
>> +	struct delayed_work		dwork;
>> +	struct bio			*bio;
>> +	blk_status_t			status;
>>   };
>>   
>> +static struct workqueue_struct *blk_error_inject_wq;
>> +
>>   DEFINE_STATIC_KEY_FALSE(blk_error_injection_enabled);
>>   
>> +static void blk_error_inject_delay_work(struct work_struct *work)
>> +{
>> +	struct blk_error_inject_delay *d = container_of(to_delayed_work(work),
>> +			struct blk_error_inject_delay, dwork);
>> +	struct bio *bio = d->bio;
>> +	struct gendisk *disk = bio->bi_bdev->bd_disk;
>> +	blk_status_t status = d->status;
>> +
>> +	kfree(d);
>> +
>> +	if (status != BLK_STS_OK) {
>> +		pr_info_ratelimited("%pg: injecting %s error for %s at sector %llu:%u\n",
>> +				disk->part0, blk_status_to_str(status),
>> +				blk_op_str(bio_op(bio)), bio->bi_iter.bi_sector,
>> +				bio_sectors(bio));
>> +		bio->bi_status = status;
>> +		bio_endio(bio);
>> +	} else {
>> +		/*
>> +		 * Resubmit.  The BIO_ERROR_INJECTED flag ensures that a bio
>> +		 * that was delayed once skips error injection entirely from
>> +		 * here on, including any other rule that covers it.
>> +		 */
>> +		submit_bio_noacct_nocheck(bio, false);
>> +	}
>> +}
>> +
>> +/*
>> + * Hand the bio to a workqueue that submits or fails it once the delay has
>> + * expired.  Both blk_mq_submit_bio() and ->submit_bio can sleep, so this can't
>> + * be completed from the timer itself.
>> + *
>> + * Returns false if the bio can't be delayed, in which case the caller handles
>> + * it immediately instead.
>> + */
>> +static bool blk_error_inject_delay(struct gendisk *disk, struct bio *bio,
>> +		blk_status_t status, unsigned int delay_us)
>> +{
>> +	struct blk_error_inject_delay *d;
>> +
>> +	/* never block a bio that asked not to be blocked */
>> +	if (bio->bi_opf & REQ_NOWAIT)
>> +		return false;
>> +
>> +	d = kmalloc_obj(*d, GFP_NOIO);
>> +	if (!d)
>> +		return false;
>> +
>> +	pr_info_ratelimited("%pg: delaying %s at sector %llu:%u by %uus\n",
>> +			disk->part0, blk_op_str(bio_op(bio)),
>> +			bio->bi_iter.bi_sector, bio_sectors(bio), delay_us);
>> +
>> +	d->bio = bio;
>> +	d->status = status;
>> +	INIT_DELAYED_WORK(&d->dwork, blk_error_inject_delay_work);
>> +
>> +	/*
>> +	 * Mark the bio before queueing the work, which can complete it as soon
>> +	 * as it is queued.  Splitting happens below the injection hook, but
>> +	 * bio_submit_split_bioset() resubmits the remainder through the hook
>> +	 * again, and as bio_split() only advances the original bio that
>> +	 * remainder still matches the same rule.  Without this a bio would be
>> +	 * delayed once per split.
>> +	 */
>> +	bio_set_flag(bio, BIO_ERROR_INJECTED);
>> +	queue_delayed_work(blk_error_inject_wq, &d->dwork,
>> +			usecs_to_jiffies(delay_us));
> 
> How about comparing the delay against sysctl_hung_task_timeout_secs in
> order not to trigger hung task detector?

Hitting the hung task detector is intentional; it's one of the things I 
imagine would be useful to test, which is why the cap is well above the 
default timeout.


The block layer's own waiters (blk_wait_io, blk_io_schedule) already 
avoid the detector, so it only fires for upper layers that wait 
uninterruptibly, which is what such a test is after.

> 
>> +	return true;
>> +}
>> +
>>   bool __blk_error_inject(struct bio *bio)
>>   {
>>   	struct gendisk *disk = bio->bi_bdev->bd_disk;
>>   	struct blk_error_inject *inj;
>> +	blk_status_t status = BLK_STS_OK;
>> +	unsigned int delay_us = 0;
>>   
>>   	rcu_read_lock();
>>   	list_for_each_entry_rcu(inj, &disk->error_injection_list, entry) {
>> @@ -45,29 +143,38 @@ bool __blk_error_inject(struct bio *bio)
>>   		if (inj->chance > 1 && (get_random_u32() % inj->chance) != 0)
>>   			continue;
>>   
>> -		pr_info_ratelimited("%pg: injecting %s error for %s at sector %llu:%u\n",
>> -				disk->part0, blk_status_to_str(inj->status),
>> -				blk_op_str(inj->op), bio->bi_iter.bi_sector,
>> -				bio_sectors(bio));
>> -		bio->bi_status = inj->status;
>> -		rcu_read_unlock();
>> -		bio_endio(bio);
>> -		return true;
>> +		status = inj->status;
>> +		delay_us = inj->delay_us;
>> +		break;
>>   	}
>>   	rcu_read_unlock();
>> -	return false;
>> +
>> +	if (delay_us && blk_error_inject_delay(disk, bio, status, delay_us))
>> +		return true;
>> +	if (status == BLK_STS_OK)
>> +		return false;
> 
> status == BLK_STS_OK is permitted only if delay_us != 0. It means we are
> here because blk_error_inject_delay() failed to inject a delay?

Yes, correct.

> 
> Also, in case delay injection fails, do we want to continue with error
> injection? Or inject nothing and return false instead?

I think there is no reason not to continue with error injection. The 
user wanted to delay and then fail the bio. There isn't a strict rule to 
execute both or none.

> 
>> +
>> +	pr_info_ratelimited("%pg: injecting %s error for %s at sector %llu:%u\n",
>> +			disk->part0, blk_status_to_str(status),
>> +			blk_op_str(bio_op(bio)), bio->bi_iter.bi_sector,
>> +			bio_sectors(bio));
>> +	bio->bi_status = status;
>> +	bio_endio(bio);
>> +	return true;
>>   }
>>   
>>   static int error_inject_add(struct gendisk *disk, enum req_op op,
>>   		sector_t start, u64 nr_sectors, blk_status_t status,
>> -		unsigned int chance)
>> +		unsigned int chance, unsigned int delay_us)
>>   {
>>   	struct blk_error_inject *inj;
>>   	int error = -EINVAL;
>>   
>>   	if (op == REQ_OP_LAST)
>>   		return -EINVAL;
>> -	if (status == BLK_STS_OK)
>> +	if (status == BLK_STS_OK && !delay_us)
>> +		return -EINVAL;
>> +	if (delay_us > BLK_ERROR_INJECT_MAX_DELAY_US)
>>   		return -EINVAL;
> 
> This could also compare against sysctl_hung_task_timeout_secs and maybe
> drop BLK_ERROR_INJECT_MAX_DELAY_US?

