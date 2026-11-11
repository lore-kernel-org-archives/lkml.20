Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412287;
	b=kN2HRt5H17ySyX8fTztXCg3R/pq4vQZMNcgKjMREznWLVLvfD2YBXyPpkmQAR8kfHhmb
	 rj/PCFf9cZxvYOGbzq+2j1Ih3jsYhvPb2LIMo59edf4lwLVMBOeSmeUqJxWeWjq98GvEv
	 a+By2PFPy/yiOW/ulVGnCKU23iOlBbnD3Jkvb1tHobshbv8ChAJatyctSDYbH0ltOTl7k
	 0jsLjFpwwwb4AetPYh9gn1LOvRjCTBJYI4Lhbitmj1lq6OsjcpdSx7Hw3tpv5cb3AKRay
	 HaluEO8ViEZ+/OUyqO4+0aoUCxUd9H9DoJa4b0tS7Ora4Z0b+al0SRrMgsvHwlXKaXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Vl76NkBrsjra54BZPnVGhoYiAY72Zkf6QXN+CElH2+E=;
	b=0VruV4Va8aPyrtcQT8AZZEStxFm9qU5pAXfgUKbjrsAC1Ty4HZs6xWHDtwOZs1Pkn6oY
	 tUv1wQBACA/98HXvcHtGz0UHqEi1mB29dMeIm5khA+1LV6i1EEG4KBapWl1xhWfJpdYUj
	 /5gtUFMlCpWaCe+odhJr00h0NIM70Se81sHLpX8/z9Ku7d/Y3lOGemPQ6FDzwo3pai8nt
	 zNNqidml3vedxKf5fV5OH1yRiB9YMGG8C8BTDnaycRMvRpicNqk+S19LNihOwEtWoh4z+
	 CBnxsgrjkanR72+9lHPlptsZOJ+biM/vgmcitYg5CsnpqzdKDiq5wBvZIoR/77wulIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MyJJI0di;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4575B606A332
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:51:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4575B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=MyJJI0di
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-53644b28706so49449491cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794412286; x=1795017086; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vl76NkBrsjra54BZPnVGhoYiAY72Zkf6QXN+CElH2+E=;
        b=MyJJI0di1JWnjdifNmE39raOew4q/89RmtWKRO7XbhkqnBJmDhm4Xly/kgvhQJUdFg
         x/bFLXYrAZmYFbTByGvgDijddHld3rDGyllpuZFEo4riI1ChaU7VCKxn90NyICucAbHj
         Ph89ThUZb3k0bqnTQ6zucWJ347aQmSl2zZbQINjQMKMZHZtIJunEerxAi9r9YQSCFAC5
         hDujWMAAkFB8vKzhcEpMCbyp5o1IT8kyrXz2hLv1ZvG6RQ7YYlFRQN/anEEqws6ir71H
         Qqq/rk5vuHqB9ImSuG6/UIYefAVn9c/q2BQ+XMI+Y8yg5gzJLQ7S3kdHJvBepXpZwrh4
         o1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412286; x=1795017086;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vl76NkBrsjra54BZPnVGhoYiAY72Zkf6QXN+CElH2+E=;
        b=1uFv7er0NCi7BIERO4UwQ7QoBFYuZ7ePW39DGcMqORKZteh2Dj4lThi7wAdb2O0T8T
         nsBz/bsdyF17X+YePJMM2AACIaspN1FY2nCPse29hmpVKtcbAivpU+Z04K+SC7EtRuDR
         j105CWdYgHILM4Tl3q813PCiRqDugvNnKx4Z+TXQiOXRfDT9WLs/P2L3vNEVaztRqDHO
         zZPPyRXl+hLBWkh2uPOzGIrXKpbluTQ0cXR5vkej39ENTkB2n2fmGHM8ZBzla+c24yYZ
         Ge5y1vBzqiG0lS2wNEDgC83p6X6k4jlSVD5pPMuuU/YRPU29z9UalbQZOyT76hUONCdt
         n8kQ==
X-Forwarded-Encrypted: i=1; AL+hErHjOcGttjyRyRbRZrxWl37wwtp6nKPenllc6qej9dIn8PpEPlvBuuhASGae9Znk3gSq9hy8cOvR6GvPjyE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WJIO1yp9SwyZGueCGMdT2k7dwj9o3wE1Aj/xaQyJs1KKYVSZc
	uQhHPDcrkqySpz5laYox/eINspZVDS0li6a25PBEroslX5EnzmElSw66gczuJNfmAg==
X-Gm-Gg: AYBFou2tBBZILanXy15/OF7cWaaCQadpgVQDX7yPcqkIWXrEMp6ziYhbONJAdQEgrlY
	GfNp1AmWrLjS5YY5qwNZZWGdvhketRIDG6UVeGGR82MrqC6Ikc3KAt7vDpLpFD55FsISrzkuw54
	Tr5BWcuhdTR/QuYqpRUws6rZc3meZWNdmbHBZJgOgqNQOnOP4IUSSoXgIdUCODGkmnTkBioMhpV
	cbBIKAw/hvDgO3emEFNtHcKMariOe7q9fXTJZyUi5ZK+c43jZ/AE4EAdlP6/4TEN9pT37wy+0wE
	H/WS0qSKiBmETHg2+klUpGv1uMxZNnzroRMGUKkq0Ej3SEh1tw9gOtC2bUhBk49+DznFAcsP5GN
	9fRxb/jBC4Xp/kKRy2GUglDftrQqZ8EZoJf935PHwNL7E0ryyQuKzS5sCDvYTitAABHOl+fU/5s
	WNcPYD13rGwb4HSDIaZJKaOJqkInNXZWpc9HVzXxpOFQtr1NBLwwQFUHQxUvpDY8n1VPSoVhyht
	0AwgQkxojR6Z38vgHY7skuIbkN7uP05xNH8gItPKSJI+3V8uHjlQCnCHp/V+XcA3ppbLtA5URHx
	NGTFrhqkzMr0QJYTJh4iD5O3CcbqaQ==
X-Received: by 2002:a05:622a:1ba5:b0:538:68b:a2d9 with SMTP id d75a77b69052e-556bdfce39cmr42117721cf.3.1794412285943;
        Wed, 11 Nov 2026 07:51:25 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::d355])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550b9438dbsm53462371cf.19.2026.11.11.07.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:51:25 -0800 (PST)
Date: Wed, 11 Nov 2026 10:51:22 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Hongyu Xie <xiehongyu1@kylinos.cn>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	usb-storage@lists.one-eyed-alien.net,
	syzbot+30552b4cbe99d6d91306@syzkaller.appspotmail.com,
	Liu Qi <liuqi@longcheer.com>, stable@vger.kernel.org
Subject: Re: [usb-storage] [PATCH v4] usb-storage: ene_ub6250: don't let the
 card-type probe hang forever
Message-ID: <b07b5f5b-4722-4f1c-84b9-205ba9b8943f@rowland.harvard.edu>
References: <20261109085449.83117-1-xiehongyu1@kylinos.cn>
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
In-Reply-To: <20261109085449.83117-1-xiehongyu1@kylinos.cn>

On Mon, Nov 09, 2026 at 04:54:49PM +0800, Hongyu Xie wrote:
> ene_ub6250_probe() reads the card type with ene_get_card_type() right
> after usb_stor_probe2() has added the SCSI host.  The query is a
> bulk-only transaction (CBW, one-byte data-in, CSW) sent through
> ene_send_scsi_cmd(), which uses usb_stor_bulk_transfer_buf() and
> therefore waits for URB completion without any timeout.  That is safe
> only for transfers belonging to a SCSI command, where the command's
> timeout and abort handling terminate the wait.  A card-type query has
> no SCSI command behind it, so a device which enumerates but never
> services bulk transfers blocks the probe forever.
> 
> commit 445fc368c6bc ("usb-storage: ene_ub6250: fix race between scan
> work and probe") added us->dev_mutex around the query to keep it from
> racing with the scan work for us->current_urb.  usb_stor_probe2()
> queues that work with a one-second delay, so it now waits for a
> transfer which may never finish.  The query itself has been unbounded
> since commit 41e568d14ec0 ("Staging: Merge ENE UB6250 SD card codes
> from keucr to drivers/usb/storage"), but only the latter turns the
> hang into the lockup reported here, hence the Fixes tag.
> syzbot reports:
> 
>  INFO: task kworker/0:2:53 blocked for more than 143 seconds.
>  ...
>  __mutex_lock
>  usb_stor_scan_dwork
>  ...
>  INFO: task syz-executor339:5675 blocked for more than 143 seconds.
>  ...
>  device_lock
>  usbdev_open
> 
> with the hub worker holding both locks stalled in
> ene_ub6250_probe() -> ene_get_card_type() -> usb_stor_msg_common().
> 
> Run the query from ->initFunction instead.  usb_stor_acquire_resources()
> calls it before the control thread is started and before the scan work
> is queued, so nothing else can be using us->current_urb and the
> dev_mutex from that commit can go away.  A failed query now unwinds
> through usb_stor_probe2() before the SCSI host is registered, instead
> of going through usb_stor_disconnect() and cancel_delayed_work_sync()
> on a scan work which is itself stuck on the dead device.

Makes sense.

> Also bound the whole query with a 10-second budget covering the CBW,
> the data stage and the CSW.  Per-transfer timeouts would not be
> enough, since a device can stretch the query over the data stage and
> the two CSW retries; each transfer gets the time remaining in the
> budget.

I don't think this matters.  A timeout at any stage should cause the 
entire transfer to fail immediately.  As for the possibility of slow 
stages completing just before the timeout expires...  How often do you 
expect that case to come up?  Does we care if the initialization 
sometimes is a little slow, so long as the total time is still limited?

However, it's not a big deal one way or the other.

> diff --git a/drivers/usb/storage/ene_ub6250.c b/drivers/usb/storage/ene_ub6250.c
> index fea2614e767c7..2b4fab31e900d 100644
> --- a/drivers/usb/storage/ene_ub6250.c
> +++ b/drivers/usb/storage/ene_ub6250.c
> @@ -24,6 +24,15 @@
>  
>  #define DRV_NAME "ums_eneub6250"
>  
> +/*
> + * Time budget for the card-type query done while probing, in jiffies.  It
> + * is a bulk transfer with no SCSI command behind it, so nothing else would
> + * terminate the wait if the device stopped responding.
> + */

Detailed explanation not needed here; you explain the reasoning in 
ene_ub6250_init() below.

> +#define ENE_PROBE_TIMEOUT (10 * HZ)
> +
> +static int ene_ub6250_init(struct us_data *us);

Unnecessary forward declaration.

> +
>  MODULE_DESCRIPTION("Driver for ENE UB6250 reader");
>  MODULE_LICENSE("GPL");
>  MODULE_IMPORT_NS("USB_STORAGE");
> @@ -487,39 +496,76 @@ static void ene_ub6250_info_destructor(void *extra)
>  	kfree(info->bbuf);
>  }
>  
> -static int ene_send_scsi_cmd(struct us_data *us, u8 fDir, void *buf, int use_sg)
> +/*
> + * Return what is left of a budget of @timeout jiffies which started at
> + * @start, in jiffies, or -ETIMEDOUT if the budget has been used up.  A zero
> + * @timeout means no limit.
> + */
> +static int ene_time_left(unsigned long start, unsigned int timeout)
> +{
> +	unsigned long elapsed;
> +
> +	if (!timeout)
> +		return 0;
> +
> +	elapsed = jiffies - start;
> +	if (elapsed >= timeout)
> +		return -ETIMEDOUT;
> +
> +	return min_t(unsigned long, timeout - elapsed, INT_MAX);

You're mixing unsigned long and unsigned int in a confusing way.  Why 
can't elapsed be an unsigned int?  You don't expect ever to encounter 
delays longer than 4 billion jiffies, do you?

Also, if you don't care about an overall timeout, this routine isn't 
needed.

> +}
> +
> +/*
> + * Send an ENE SCSI command.  @timeout is the time budget for the whole
> + * transaction (CBW, data and CSW), in jiffies; zero means no limit.
> + */
> +static int ene_send_scsi_cmd_timeout(struct us_data *us, u8 fdir, void *buf,
> +				     int use_sg, unsigned int timeout)
>  {
>  	struct bulk_cb_wrap *bcb = (struct bulk_cb_wrap *) us->iobuf;
>  	struct bulk_cs_wrap *bcs = (struct bulk_cs_wrap *) us->iobuf;
> -
> -	int result;
> +	unsigned long start = jiffies;
> +	int result, left;
>  	unsigned int residue;
>  	unsigned int cswlen = 0, partial = 0;
>  	unsigned int transfer_length = bcb->DataTransferLength;
>  
> +	left = ene_time_left(start, timeout);
> +	if (left < 0)
> +		return USB_STOR_TRANSPORT_ERROR;

What point is there in checking for a timeout before anything has 
happened?

> +
>  	/* usb_stor_dbg(us, "transport --- ene_send_scsi_cmd\n"); */
>  	/* send cmd to out endpoint */
> -	result = usb_stor_bulk_transfer_buf(us, us->send_bulk_pipe,
> -					    bcb, US_BULK_CB_WRAP_LEN, NULL);
> +	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
> +						    bcb, US_BULK_CB_WRAP_LEN,
> +						    NULL, left);
>  	if (result != USB_STOR_XFER_GOOD) {
>  		usb_stor_dbg(us, "send cmd to out endpoint fail ---\n");
>  		return USB_STOR_TRANSPORT_ERROR;
>  	}
>  
>  	if (buf) {
> -		unsigned int pipe = fDir;
> +		unsigned int pipe = fdir;

Unnecessary initialization.

>  
> -		if (fDir  == FDIR_READ)
> +		if (fdir == FDIR_READ)
>  			pipe = us->recv_bulk_pipe;
>  		else
>  			pipe = us->send_bulk_pipe;
>  
>  		/* Bulk */
>  		if (use_sg) {
> +			/*
> +			 * Scatter-gather transfers belong to SCSI commands,
> +			 * whose timeout and abort machinery bound the wait.
> +			 */
>  			result = usb_stor_bulk_srb(us, pipe, us->srb);
>  		} else {
> -			result = usb_stor_bulk_transfer_sg(us, pipe, buf,
> -						transfer_length, 0, &partial);
> +			left = ene_time_left(start, timeout);
> +			if (left < 0)
> +				return USB_STOR_TRANSPORT_ERROR;
> +			result = usb_stor_bulk_transfer_buf_timeout(us, pipe,
> +								    buf, transfer_length, &partial,

Things like this are why I maintain that the policy of aligning 
continuation lines with the preceding open paren is a mistake.  Grumble.

The rest of the material looks pretty much okay.  However, I would 
prefer this to be made into a series of two patches, one with the 
modifications to transport.[ch] and the other with the modifications to 
ene_ub6250.

Alan Stern
