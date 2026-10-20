Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792539285;
	b=x+DnaJhZKw9DU6oJ084i5Q/ZYYQnGfCzE2/ncVrq21nU8x78T/meIWNEyIMj/gnofK2e
	 QrbX6fK3ZqUF0IRs5FojPNP8Glun+V6TdU8kJTpTtQuOH+Lw3m/lQRnH/uFYIGqQfdK62
	 9trpD4aK1QDVAtmBlQ0EbtdyTiZCRoyaYl0jD1DBLGA4CPOo53gF5n6QuSYEQYbCT2L/p
	 RUttxQP+BwVtfT4B/LV13FjCXtCgbFBEnDmI3S1goU+k5H9IubXFPIFSMl+vAVGDDyCpd
	 N26xzWpqfRDxtl26rFvUbsNwbDZS28G+BnMZmWqlwl3pkf7yvWzXWEPsRDnUW+O3vGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792539285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=GpcM1fJhf9x8NSWa07Dia+kHSTr5ph/3LGk+KWZVdmw=;
	b=q6Wk5Sv7VY4euUMwhTdOG6K00kBd+jzhrUAj9YW1QYnZcr1+4oNfDUDXKWKYlmHX4Jes
	 BOVcUr7KqcmHPf8wycKsFPonCyWmrjA0KkuNQ58zneD6MW50HmWjqv3vSrRrVt7muQ+5Y
	 8jB/kfAsezyb3fYFq/L7Z7cHk3uT2A21973/ujD1CYo+NOqu8nPYuO5tJK+miLeKGuXcn
	 SdNwtKS+nZOfXHkOVe/yZpdCU/tXC+QCd5CoSuUsihAiaAM0jGWXU396o7oKueAHtBIWv
	 bbDYc+In4J8krC22DmwO/ETkqbp0LgBvynVQtUqbVCrQYZj0n6vHjGc3rYZFrvUoZ5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LUt846zj;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF8606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 23:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99BF8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=LUt846zj
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36681e85e87so174197eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792539284; x=1793144084; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GpcM1fJhf9x8NSWa07Dia+kHSTr5ph/3LGk+KWZVdmw=;
        b=LUt846zjDpI8UysTcs8KCF55jV782wQMWWqx4BiTI/pgDVpT+TESGn1UflxVz27uTf
         ie7Z9h93s8cjTzOesIfCgvskhZ5ln1Ph2f2+pfBsWVCmDCaIRT7aeUyGyoTMZFmKccwA
         V/wpBTldAF6N+1Bn8lQ/gSZwQbj2VaCQmQsWl+btTXSALf8Ka9qlM0DSuaorB05IyUBJ
         E+4scOSew3dz+iI/XYa8HiEPkif13Q8dGbOOWvwPXh7phrLlhdpU1PeL+G/mOqXRn0z0
         3KiX+SNF79wA4U36TbEiP+HnmFiDwn2YgGXizqHr73A5i7HSMVpQLRa0I3u2FhmGwrxJ
         6dEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792539284; x=1793144084;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GpcM1fJhf9x8NSWa07Dia+kHSTr5ph/3LGk+KWZVdmw=;
        b=RtMshZ427LPlw0dQZywnXBxytOzT5TpSI2I9v4QW7an4VIZbZpUNhmJlX40ueGBY3k
         hBGCKkf14A/lejVLBCayazdFoW+ps9N5w830nSKHvrnI16F2K7lmIZ1dSlhYB/r/LBCk
         u9il6K+5PSWTjqEvd4gIn1+HaPWqKB3fF8llt4vuRjOFZ3h0vlKZsFwQyz2dCdIgzNL3
         D62B+CNVxGbss16LXd1GnfpanrAbyW/TKhVk7cSclsqEC/8GvmZ/TcblXUgGz0m+Dyef
         BDwaMsJxRuD/9anYNCGJkY5nCi73d5+ZSGKlbQt0ucHJa4QMBmNxajXcV5xvZ3L37FKA
         QpCA==
X-Forwarded-Encrypted: i=1; AKwUvBwpvUz248KTDeNFqvllEfDtx7Bm0FpoDkD7NEMwUoqkmUFRfK8rqBgDJ+Ii/XLOsDsGc/J3d7l727s2xzU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJdGnUuTS2OkPn3SOeuXuVsKOWecaNSSYidu0VjXRyc1zSKxu4L
	y4iWkv9bwuFR6GPnEKeJrVtpSQfFWbN9FK+ZYfIDauU4mUSNCSqysFb18qPctXJhdLM=
X-Gm-Gg: AYBFou0KZ8Ye92ARJt1UsYuQZ2TWrNVIzhcW9d4Wyw3NDCKgtS14bLpHcwcSxWql93x
	0907aY2ovl7Bp8YC65pnMyH1/iZeMTdk5Q5yd2+zAdk92sddEiERx6qw454oIUNIlIO7CQSC5Jt
	6UqWnYokJU7nCU4aTS7U8Ev8/DwXFaZo0z8BtqCAvXOSgpmqifjnC6Fgfp/vrfkGeC+LuK2rHXc
	Mi/iZ2ck9kIteQsUiCnrQl5yDLEtqLBuIsQIjnnW9wZzSCZUFra7y65UgOo8n2329Dd1KE8YpMs
	5P7J3O1/tHn4YR1Mh31vI+YwBihEaqeXR/d22jxysoiz5tj+I4cnMpRnS2nOC3Ss0LwtaVNWLNS
	eMMsfVYoSf4BDxyUPa5sH26+TEPTgCeQkywQhR/A7TW1xHbOxfSDPRDBoJby69YbJrbhA/l6uGW
	gzo1rik5rn7KSQEkCGtntQKzqeKQFBwJ073pWoJcuxT0t9xrrV18p9To2GSPuKOUyos8FCsvjcD
	DyPfFHT4GWaJDEoMBc=
X-Received: by 2002:a05:7301:db0a:b0:35d:800:6344 with SMTP id 5a478bee46e88-3674b82b536mr1008617eec.4.1792539283366;
        Tue, 20 Oct 2026 16:34:43 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3673b1d0ab7sm2018107eec.0.2026.10.20.16.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 16:34:42 -0700 (PDT)
Date: Tue, 20 Oct 2026 16:34:41 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Md Haris Iqbal <haris.iqbal@linux.dev>
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
	Keith Busch <kbusch@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: Re: [v3 for-next 2/3] block: allow error injection rules to delay
 bios
Message-ID: <20261020233441.GB1582237-mkhalfella@purestorage.com>
References: <20260928221634.43239-1-haris.iqbal@linux.dev>
 <20260928221634.43239-3-haris.iqbal@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928221634.43239-3-haris.iqbal@linux.dev>

On Tue 2026-09-29 00:16:33 +0200, Md Haris Iqbal wrote:
> Error injection can only fail a bio today. Add a delay_us option so that
> a rule can hold a bio back first, to model a slow device.
> 
> If a matching rule has delay_us set, the bio is held for that long. It is
> then failed if the rule also has a status, or resubmitted otherwise.
> 
> The resubmission is done through submit_bio_noacct_nocheck(), which is
> where the injection hook sits. To avoid the same delay rule being applied
> to it again, mark the bio with the BIO_ERROR_INJECTED flag before queueing
> the work in blk_error_inject_delay(). This also prevents bios that are
> split later and resubmitted from being evaluated for delay (or error
> injection) again. __bio_clone() does not propagate the flag, so a clone a
> stacking driver aims at a lower device is still evaluated.
> 
> The bio is submitted from a workqueue rather than from the timer, because
> submitting a bio can sleep. Bios with REQ_NOWAIT are never delayed, and
> values above 600 seconds are rejected.
> 
> Cc: Christoph Hellwig <hch@lst.de>
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Md Haris Iqbal <haris.iqbal@linux.dev>
> ---
>  block/error-injection.c   | 160 ++++++++++++++++++++++++++++++++++----
>  block/error-injection.h   |   1 +
>  include/linux/blk_types.h |   1 +
>  3 files changed, 147 insertions(+), 15 deletions(-)
> 
> diff --git a/block/error-injection.c b/block/error-injection.c
> index db543fe27630..a35fe41a43e4 100644
> --- a/block/error-injection.c
> +++ b/block/error-injection.c
> @@ -6,9 +6,17 @@
>  #include <linux/blkdev.h>
>  #include <linux/parser.h>
>  #include <linux/seq_file.h>
> +#include <linux/workqueue.h>
>  #include "blk.h"
>  #include "error-injection.h"
>  
> +/*
> + * Cap the delay so that a typo can't wedge a device for good.  This is still
> + * well beyond the default hung task timeout, which is one of the things a
> + * delay is useful for triggering.
> + */
> +#define BLK_ERROR_INJECT_MAX_DELAY_US	(600 * USEC_PER_SEC)

DEFAULT_HUNG_TASK_TIMEOUT is 120 seconds (set in lib/Kconfig.debug)

> +
>  struct blk_error_inject {
>  	struct list_head		entry;
>  	sector_t			start;
> @@ -18,14 +26,104 @@ struct blk_error_inject {
>  
>  	/* only inject every 1 / chance times */
>  	unsigned int			chance;
> +
> +	/* hold the bio for this long before submitting or failing it */
> +	unsigned int			delay_us;
> +};
> +
> +/*
> + * A bio held by a delay rule.  It does not point back at the rule, so rules
> + * can be removed while delayed bios are outstanding.  The submitter holds the
> + * bdev open until the bio completes, so the disk and queue stay allocated.
> + * A delayed bio holds no queue usage counter reference, so it does not hold
> + * up a queue freeze either.
> + */
> +struct blk_error_inject_delay {
> +	struct delayed_work		dwork;
> +	struct bio			*bio;
> +	blk_status_t			status;
>  };
>  
> +static struct workqueue_struct *blk_error_inject_wq;
> +
>  DEFINE_STATIC_KEY_FALSE(blk_error_injection_enabled);
>  
> +static void blk_error_inject_delay_work(struct work_struct *work)
> +{
> +	struct blk_error_inject_delay *d = container_of(to_delayed_work(work),
> +			struct blk_error_inject_delay, dwork);
> +	struct bio *bio = d->bio;
> +	struct gendisk *disk = bio->bi_bdev->bd_disk;
> +	blk_status_t status = d->status;
> +
> +	kfree(d);
> +
> +	if (status != BLK_STS_OK) {
> +		pr_info_ratelimited("%pg: injecting %s error for %s at sector %llu:%u\n",
> +				disk->part0, blk_status_to_str(status),
> +				blk_op_str(bio_op(bio)), bio->bi_iter.bi_sector,
> +				bio_sectors(bio));
> +		bio->bi_status = status;
> +		bio_endio(bio);
> +	} else {
> +		/*
> +		 * Resubmit.  The BIO_ERROR_INJECTED flag ensures that a bio
> +		 * that was delayed once skips error injection entirely from
> +		 * here on, including any other rule that covers it.
> +		 */
> +		submit_bio_noacct_nocheck(bio, false);
> +	}
> +}
> +
> +/*
> + * Hand the bio to a workqueue that submits or fails it once the delay has
> + * expired.  Both blk_mq_submit_bio() and ->submit_bio can sleep, so this can't
> + * be completed from the timer itself.
> + *
> + * Returns false if the bio can't be delayed, in which case the caller handles
> + * it immediately instead.
> + */
> +static bool blk_error_inject_delay(struct gendisk *disk, struct bio *bio,
> +		blk_status_t status, unsigned int delay_us)
> +{
> +	struct blk_error_inject_delay *d;
> +
> +	/* never block a bio that asked not to be blocked */
> +	if (bio->bi_opf & REQ_NOWAIT)
> +		return false;
> +
> +	d = kmalloc_obj(*d, GFP_NOIO);
> +	if (!d)
> +		return false;
> +
> +	pr_info_ratelimited("%pg: delaying %s at sector %llu:%u by %uus\n",
> +			disk->part0, blk_op_str(bio_op(bio)),
> +			bio->bi_iter.bi_sector, bio_sectors(bio), delay_us);
> +
> +	d->bio = bio;
> +	d->status = status;
> +	INIT_DELAYED_WORK(&d->dwork, blk_error_inject_delay_work);
> +
> +	/*
> +	 * Mark the bio before queueing the work, which can complete it as soon
> +	 * as it is queued.  Splitting happens below the injection hook, but
> +	 * bio_submit_split_bioset() resubmits the remainder through the hook
> +	 * again, and as bio_split() only advances the original bio that
> +	 * remainder still matches the same rule.  Without this a bio would be
> +	 * delayed once per split.
> +	 */
> +	bio_set_flag(bio, BIO_ERROR_INJECTED);
> +	queue_delayed_work(blk_error_inject_wq, &d->dwork,
> +			usecs_to_jiffies(delay_us));

How about comparing the delay against sysctl_hung_task_timeout_secs in
order not to trigger hung task detector?

> +	return true;
> +}
> +
>  bool __blk_error_inject(struct bio *bio)
>  {
>  	struct gendisk *disk = bio->bi_bdev->bd_disk;
>  	struct blk_error_inject *inj;
> +	blk_status_t status = BLK_STS_OK;
> +	unsigned int delay_us = 0;
>  
>  	rcu_read_lock();
>  	list_for_each_entry_rcu(inj, &disk->error_injection_list, entry) {
> @@ -45,29 +143,38 @@ bool __blk_error_inject(struct bio *bio)
>  		if (inj->chance > 1 && (get_random_u32() % inj->chance) != 0)
>  			continue;
>  
> -		pr_info_ratelimited("%pg: injecting %s error for %s at sector %llu:%u\n",
> -				disk->part0, blk_status_to_str(inj->status),
> -				blk_op_str(inj->op), bio->bi_iter.bi_sector,
> -				bio_sectors(bio));
> -		bio->bi_status = inj->status;
> -		rcu_read_unlock();
> -		bio_endio(bio);
> -		return true;
> +		status = inj->status;
> +		delay_us = inj->delay_us;
> +		break;
>  	}
>  	rcu_read_unlock();
> -	return false;
> +
> +	if (delay_us && blk_error_inject_delay(disk, bio, status, delay_us))
> +		return true;
> +	if (status == BLK_STS_OK)
> +		return false;

status == BLK_STS_OK is permitted only if delay_us != 0. It means we are
here because blk_error_inject_delay() failed to inject a delay?

Also, in case delay injection fails, do we want to continue with error
injection? Or inject nothing and return false instead?

> +
> +	pr_info_ratelimited("%pg: injecting %s error for %s at sector %llu:%u\n",
> +			disk->part0, blk_status_to_str(status),
> +			blk_op_str(bio_op(bio)), bio->bi_iter.bi_sector,
> +			bio_sectors(bio));
> +	bio->bi_status = status;
> +	bio_endio(bio);
> +	return true;
>  }
>  
>  static int error_inject_add(struct gendisk *disk, enum req_op op,
>  		sector_t start, u64 nr_sectors, blk_status_t status,
> -		unsigned int chance)
> +		unsigned int chance, unsigned int delay_us)
>  {
>  	struct blk_error_inject *inj;
>  	int error = -EINVAL;
>  
>  	if (op == REQ_OP_LAST)
>  		return -EINVAL;
> -	if (status == BLK_STS_OK)
> +	if (status == BLK_STS_OK && !delay_us)
> +		return -EINVAL;
> +	if (delay_us > BLK_ERROR_INJECT_MAX_DELAY_US)
>  		return -EINVAL;

This could also compare against sysctl_hung_task_timeout_secs and maybe
drop BLK_ERROR_INJECT_MAX_DELAY_US?

