Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054447;
	b=QaP1UenlQWyEpDiLf0rKEQJ789oc7St5V8SfM2jf76WP4scj1HA/0WPOxH3yoRpXU+RG
	 dFNTVTv/OLgxOZ21yvzLZ1SKDpJzO065X2oH342eyIzwjr2Nud+hYBQbieeOJnErD6wkM
	 q1romCwwHaC4eCUrTJZdhrCoyxsQDmvx9uR6lR6+HhgsPSGkwx76EVGYM7RxWu5Ik1AFe
	 hkELMX8kSKLDfPxbt/jCBmnjDiPZqAV30qQC1qFyL+xlApY7veAcwL8Bse0knuylVSQHQ
	 Gevd7erxrM0/pb9cN+j0UL/lVBogGcCVuqXc4jxx6k5zUZ4ZwHOzNm1cFhgAx7D4tIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054447;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Date:From:To:cc:Subject:
	 In-Reply-To:Message-ID:References:MIME-Version:Content-Type:
	 X-Scanned-By;
	bh=YP6wRYFIhZCRxP4D9VfxK3+WFpB2i8jRHWk/LlwwL9s=;
	b=AeBSB9VguzA8EoE8rLwn/4EjRhbMeL7u3IdyksBA1Ya3M9v+aMIJpPmEFHX01q+7F3iG
	 oO+mFOqZq1S3YMICwIyO5Uv5hcHm1jeSE9nMvvKcaNsBkPIO7N1AVSz/CV/ad6HhOZMXF
	 rznVMu+e2Qvd7gCzGa8Qpal0fOAsDO3SOJh/5dfH6gi3PV47ZzWpWv9SIyp0XjD49TqWj
	 Y3s9lStytVcE45U6xkh2FmBSZSF/Oc2HNIg5nsrxRU23v3SnHDEGm9M+tge5nDWmKWaRE
	 hQ2R8ISgFDI/gb+lwOqx2losoVZqzwZUEc5Xdq8TJ7AjMhKriet6TTeXyxn9I5DUdHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="WgCTP9/m";
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F7D606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 22:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50F7D606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WgCTP9/m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793054445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YP6wRYFIhZCRxP4D9VfxK3+WFpB2i8jRHWk/LlwwL9s=;
	b=WgCTP9/mwcYeS3hmuFSEak5X3/Ruw9vvjgKd64Pd/ICT/5GJgT2PsPCcu/D6hV8anduITU
	T81L8n9khL7JVQa/9VyLW6MXHET4p84wsxJtJGRdFQ9VK8tPn3/pcSJkljtAQ+0mQXmQul
	mZgD1EDY/XjLXXcEq7rKJxKk24wNxgI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-655-T05W93ZXMuSzeTTiDwmXRA-1; Mon,
 26 Oct 2026 18:40:36 -0400
X-MC-Unique: T05W93ZXMuSzeTTiDwmXRA-1
X-Mimecast-MFC-AGG-ID: T05W93ZXMuSzeTTiDwmXRA_1793054434
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 675CE1800146;
	Mon, 26 Oct 2026 22:40:34 +0000 (UTC)
Received: from mpatocka-thinkpadx1carbongen12.rmtcz.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE1E5300019F;
	Mon, 26 Oct 2026 22:40:31 +0000 (UTC)
Date: Mon, 26 Oct 2026 23:40:29 +0100 (CET)
From: Mikulas Patocka <mpatocka@redhat.com>
To: Eduard Zateev <hackerowskiy@gmail.com>, 
    Rahul Rao <shreeramrahul94@gmail.com>, 
    Drif Abdelmalek Mohamed Said <drifabdelmalekmohamedsaid@gmail.com>
cc: dm-devel@lists.linux.dev, agk@redhat.com, snitzer@kernel.org, 
    bmarzins@redhat.com, linux-kernel@vger.kernel.org, 
    syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
Subject: Re: [PATCH] dm thin: reject metadata and data device aliases
In-Reply-To: <20261026102740.241243-1-hackerowskiy@gmail.com>
Message-ID: <db1a5df3-c7b7-9e63-73c8-e75659295171@redhat.com>
References: <20261026102740.241243-1-hackerowskiy@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi

If dm_get_device spuriously closes a device that was already open, it is a 
bug in dm_get_device and it should be fixed there.

Note that we got 3 patches for this syzbot warning from 3 different 
people. Please, cooperate next time and send just one patch.

Mikulas


On Mon, 26 Oct 2026, Eduard Zateev wrote:

> From: angel <angel@localhost.localdomain>
> 
> The thin-pool target rejects identical argument strings, but two names for
> the same block device bypass the check. In read-only metadata mode, opening
> metadata first and data with write mode invokes dm_get_device()
> upgrade_mode().
> That swaps and frees the old dm_dev while pool_ctr retains metadata_dev,
> causing a slab-use-after-free when __pool_find() reads metadata_dev->bdev.
> 
> Open the data device before metadata so an alias cannot trigger a mode
> upgrade between the two references. Compare the opened block devices
> and reject aliases before using either device. Adjust the error paths to
> release the devices in the matching order.
> 
> Reported-by: syzbot+83827f9a59abe148bff4@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=83827f9a59abe148bff4
> Fixes: 70de2cbda8a5 ("dm thin: add sanity checks to thin-pool and external snapshot creation")
> Signed-off-by: Eduard Zateev <hackerowskiy@gmail.com>
> ---
>  drivers/md/dm-thin.c | 21 ++++++++++++++-------
>  1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
> index 358ed77ff..0899cbaf9 100644
> --- a/drivers/md/dm-thin.c
> +++ b/drivers/md/dm-thin.c
> @@ -3326,17 +3326,24 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  
>  	metadata_mode = BLK_OPEN_READ |
>  		((pf.mode == PM_READ_ONLY) ? 0 : BLK_OPEN_WRITE);
> +	r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
> +	if (r) {
> +		ti->error = "Error getting data device";
> +		goto out_unlock;
> +	}
> +
>  	r = dm_get_device(ti, argv[0], metadata_mode, &metadata_dev);
>  	if (r) {
>  		ti->error = "Error opening metadata block device";
> -		goto out_unlock;
> +		goto out_data;
>  	}
>  	warn_if_metadata_device_too_big(metadata_dev->bdev);
>  
> -	r = dm_get_device(ti, argv[1], BLK_OPEN_READ | BLK_OPEN_WRITE, &data_dev);
> -	if (r) {
> -		ti->error = "Error getting data device";
> -		goto out_metadata;
> +	/* make sure metadata and data are different devices */
> +	if (metadata_dev->bdev == data_dev->bdev) {
> +		ti->error = "Error setting metadata or data device";
> +		r = -EINVAL;
> +		goto out;
>  	}
>  
>  	if (kstrtoul(argv[2], 10, &block_size) || !block_size ||
> @@ -3426,9 +3433,9 @@ static int pool_ctr(struct dm_target *ti, unsigned int argc, char **argv)
>  out_free_pt:
>  	kfree(pt);
>  out:
> -	dm_put_device(ti, data_dev);
> -out_metadata:
>  	dm_put_device(ti, metadata_dev);
> +out_data:
> +	dm_put_device(ti, data_dev);
>  out_unlock:
>  	mutex_unlock(&dm_thin_pool_table.mutex);
>  
> 
> base-commit: 21a7f44fd0765fcc5194130b28767786eba1d1e7
> -- 
> 2.56.0
> 

