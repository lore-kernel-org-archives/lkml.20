Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794274080;
	b=bkbfHJ/BZkjQZjtiqBGt9ie5yKyVK3cQWpCEu7+Mr3ElkZqploiAAZSzm8c3oU6dU/qu
	 lqAEkwI9ervMxgp9DdY28NmQ7l6Tza0Gf5oyY+1Hsq5UPyvNkfP/t54eecEO8e4zocSDX
	 r8OVfipvzgzmyGO4ZfrwCK4rhuH/7DaHOU1mYtoZPyQloPoMihYcCJiQw+z5rfxTJNjfI
	 MYXr81zdX5aXFyjMuYmZYeoQP8eGUVO3jO5Of7FJOarx657x5+rDlxIHpVDJZk0+EWK/0
	 5pe4dNwhKZIFm0ivxNaeDm3X1b45S7mEpPDtP9lFhPB/DifAq/mf2QSoSacps+qkyzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794274080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YoekcW5M6HBeqAKu+dPMxxseHZI0rbbZ9FvBEYHmiH0=;
	b=Et2ePdyQ5C9v0ogYqwurfCLIU2al/fHNqRkfKRQOUqe2Ob4GCw66W58+T+nQsemZuYlf
	 80WknMiAbOrR7L04RMYljSZp2+9aA5TMQMgOGcdeFHVDSZaeOL5BysKhDFOFmoFX2zUDN
	 eALnQ9bA6qBbk27fQVgiH1d/lkmRaraqPykSRsv/bl2x37V4EkISK4/icTeVPi/req6Yi
	 bfZ8m7QAwhXhRjqAutgH9PaliaWF1kLr3QpmvuPdxX8ys2vQzl+XBgiaNGZyHa+2lwZiO
	 7jJfYfRJIzNwQJUlAt1sjy1fxfGUxNj6m0FbWgKZULYE6NGxj3AR0n8tFNYibJeygNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7yHftr0;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C051606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 01:28:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C051606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a7yHftr0
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-49429181ce9so886466fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 17:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794274079; x=1794878879; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YoekcW5M6HBeqAKu+dPMxxseHZI0rbbZ9FvBEYHmiH0=;
        b=a7yHftr0d0Ms5sFOlelLvEoWuEVYQDOQj/PKzXEMTL+2qG6P7NEXXRaF33KlfqFUZv
         gWakab0GEKhj0C6HIWEC+XmJi5HYP5sACKmrfz37nUS5lw/UMN5Hw6ix7TXNsPj53krz
         wqo1Rag+KsgatT6Hi91F7BpLoIYWz+TxmwhUuVIOAncp8bvLtDyf6CzPrLF3hSx3w0PX
         UsInBJrWh7LLbh1cTIqHutmUk2UTBC/N3UdvXgKCa8SvtTo0rZdoCltpxYfDET0iaR2p
         H29etj3Yz5FNZMzOk1bu71Wo+XQJrHNaNmLc/KLPu27c07KB85kWBKuKl07/E0mmQjdm
         L7lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794274079; x=1794878879;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoekcW5M6HBeqAKu+dPMxxseHZI0rbbZ9FvBEYHmiH0=;
        b=FdKtjpm99Aou5daQGRrNx03UD8cCgk2ke0nB/XnLZAoGmDYr9PYyHJlvpW3Z4b0ya+
         C0LPHRoHTlKUSmnbRDwYs165sJKFpcUhP1rif0ImIqjmoKn7kcPJmzstesblL8eKronL
         B9T6ynSK3wBcSIJP81PMN9X3rXpOnCC9tKK+1Hli2Wd8qGQL90J2VmmzLPIBx9KaToN2
         GMqW7vWfAJpl0o8thjoi6tDqdQN+fLAeD8DLc1/qw105lAZ7DkR2t4m7ywYPSPAlSiP8
         Q4tdfg3D1umTVgV67hlM+QEf1zUDONlQcAo2M+9O8wRiqbO3aO/KVuAujPUwOi2VpdBX
         DwUQ==
X-Forwarded-Encrypted: i=1; AL+hErGs5dFmfP/gx7rTCC6IL3hmyWzekhNVVqUtqBx3CKPe05+3AbHw/ZYwvxaeGBHTKiIAFNJiYX6ntqw5LB4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+5AK0HihNeANTwgHeMg5av6o0KLnGuRGISz4fDDICwyPZ9vaG5
	Lmr+PmxcR2qb20krtmXzjfcZBPNF5SUX5E2iUYw2a9l8Z/vzw/TfgpvK
X-Gm-Gg: AYBFou0BbMQ7OurNX92jX2ocgL85T/fBuWsk9eRpYFv0lyYbpjnkK73pIEwAv9S+D5p
	OEDG3hllLteNhLmeT2W+u/+GAZ4gWmX0njFmAamB2/ZH5691A+OgPlhaodr1H9AyV1zkiu1H2OK
	0tz6xntXcg9w7UQ6KurIt5UVz1xq26eZjEvHQQB0brCxB3QcFsECpemPqmvB9NIdrYtr3S0GnVY
	x/81gPm+cKBFI9puXi4Lz28Hua4Y+n37dQvEJvB3YkyzBxFuzydzWrElJR7tZM4uL0CxGC/qR6V
	lAfVeOnsRoTchg7VApEbLvhmDdkVFqCd1WTiCBGYaiaB/7JeGUpGFGOKFKokpVNr+Ik6ZuTXg/w
	/f0bZ70WgGqPd832kOKHAcugIwxpWkbaLEsa/MWQIiIqZwrLBcSc2aM9DCC6SBOEvL6IPqlFRkz
	z6GnpHxNbo9FpfCV6KJd6obFFm5T0gK9JIMSU/6AVxV6MLih8KESt/LgyF4wKMreHR8ZYC923Pl
	dNyDZXH+0PX0ZJ9iAbwLVNqlePLnUIRge6WUYkzTCotG/Zkentf/Y2RPECgg9acCDacXK2BZOSg
	t25Iiv0FXelm7JKve+3DrAhLRmZaXNgIgORqGWCIV7SZI8xMb4AaLvWMGvi4FQgraqRGcKAXSJr
	bMxplX9pomJ3dDSun1fSmNa3D0xmdZxI=
X-Received: by 2002:a05:6870:d1c7:b0:48f:e363:5cc8 with SMTP id 586e51a60fabf-4ae227a302fmr611212fac.54.1794274078752;
        Mon, 09 Nov 2026 17:27:58 -0800 (PST)
Received: from fedora-laptop ([172.245.82.59])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae22d1d541sm657257fac.2.2026.11.09.17.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 17:27:57 -0800 (PST)
Date: Mon, 9 Nov 2026 19:27:52 -0600
From: Ming Lei <tom.leiming@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: linux-block@vger.kernel.org, axboe@kernel.dk,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ublk: stop reporting zones on an empty response
Message-ID: <avJzGIqp5ZUehCGx@fedora-laptop>
References: <20261109225110056QQJAEflTHzwYHzwXlMBb_@zte.com.cn>
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
In-Reply-To: <20261109225110056QQJAEflTHzwYHzwXlMBb_@zte.com.cn>

On Mon, Nov 09, 2026 at 10:51:10PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> ublk_report_zones() treats a zero-length zone as the end of a server
> response, but only breaks out of the inner loop.  If the server returns
> an empty report, done_zones and sector do not advance, so the driver
> keeps issuing REPORT ZONES requests at the same sector indefinitely.
> 
> Finish the report when the zero-length marker is encountered and return
> the number of zones already reported.  Use the existing exit path to
> release the report buffer, including when the first response is empty.

The issue is real, I can reproduce it with one ublk server which
completes UBLK_IO_OP_REPORT_ZONES without filling any zone: both
BLKREPORTZONE and START_DEV(blk_revalidate_disk_zones()) loop forever,
and the task can't be killed.

> 
> Fixes: 29802d7ca33b ("ublk: enable zoned storage support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/block/ublk_drv.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
> index 3d322fa1bc83..5c14daeaebbf 100644
> --- a/drivers/block/ublk_drv.c
> +++ b/drivers/block/ublk_drv.c
> @@ -693,8 +693,10 @@ static int ublk_report_zones(struct gendisk *disk, sector_t sector,
>  			struct blk_zone *zone = buffer + i;
>  
>  			/* A zero length zone means no more zones in this response */
> -			if (!zone->len)
> -				break;
> +			if (!zone->len) {
> +				ret = done_zones;
> +				goto out;
> +			}

But this terminates the whole report on any zero-length zone, not only
on an empty response.

A zero-length zone means "no more zones in this response", and so far
the driver continues from the advanced sector and asks for the remaining
zones. With this patch, a server returning fewer zones than requested
gets a truncated report. For example, when the server fills half of
the requested zones each time:

- BLKREPORTZONE for 256 zones returns 128 zones

- START_DEV fails:

	ublkb0: last zone and capacity mismatch (1048576 != 2097152)
	ublkb0: failed to revalidate zones

Both work fine before this patch.

How about stopping only if the response doesn't carry any zone? That is
what sd_zbc and virtio_blk do too. Something like:

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -661,6 +661,7 @@ static int ublk_report_zones(struct gendisk *disk, sector_t sector,
 		struct request *req;
 		struct ublk_zoned_report_desc desc;
 		blk_status_t status;
+		unsigned int i;
 
 		memset(buffer, 0, buffer_length);
 
@@ -689,7 +690,7 @@ static int ublk_report_zones(struct gendisk *disk, sector_t sector,
 		if (ret)
 			goto out;
 
-		for (unsigned int i = 0; i < zones_in_request; i++) {
+		for (i = 0; i < zones_in_request; i++) {
 			struct blk_zone *zone = buffer + i;
 
 			/* A zero length zone means no more zones in this response */
@@ -704,6 +705,10 @@ static int ublk_report_zones(struct gendisk *disk, sector_t sector,
 			sector += zone_size_sectors;
 
 		}
+
+		/* empty response: no progress, don't ask again */
+		if (!i)
+			break;
 	}
 
 	ret = done_zones;

With the above, empty response is handled as in your patch
(BLKREPORTZONE returns 0 zones, START_DEV fails with "No zones
reported"), and partial response still works.


Thanks,
Ming
