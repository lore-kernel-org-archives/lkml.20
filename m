Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793613289;
	b=3jetQhSjStL3+HbFUq2rvZZHJfG6PHDanqmTvW8i+N5DChLLlCwove2HxMPIaql6QwDT
	 M0nomd5/lOUMdonfI7+PzIlnhEU8t246IsuGksJGRuSXtv6ysi22qoCgYoecs/cw413LJ
	 LpTMMlcqfoAKufZP4WDLkPKYJfO7pMO41j58o3O/tt2Wrv8vPNggCiuMQETVNcfSpJR7k
	 OUQcc0NfKUV2eMwVZyDjRmH9evF98FRw7ynf3r3FES5qg37ynNK17bHjmcKXYbuElKPaQ
	 gx3Fn9YbOAvt/EsEEAkCtO5ZVqGmSB4TRfJohSZ6is1vqsn5TYxWR3UsjL24BfnlJTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793613289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OtPUqDZyVtIcqGyOAPlThzTdLirAyOMXz5cBBQz5KzQ=;
	b=bKwsIsmHL9RMw5zqXbbnLE3jugZSfGIAOE8R6eRVfnxLhfeWlza7BdK+9OQEMDQz92XK
	 4hC8vVPO3nVlm+MKAcu9xAQTLNlkJCwkbgYSIa0lFImitNNG92aTKRbilZm2B2oHi6xEN
	 lLMFgflc6hYgN2ZLm4Cxp3C1naEd9rboGQZxsdeX08SwMs/TvPnETgnj1OLaOchYPmoui
	 bQf6sAuEOlzsRnotAROdZLbwKjVgkdmMTS9uYMdGfefnkVuoJLDqfHlxq03rqtvPy2zD0
	 MRf3cUXBmRS8DrgFFzn/aCoDlJU8WkhBWptK45aQiNOuVDDpBcoQFleuC6fv2WTrN/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=InXOzShJ;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86081606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86081606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=InXOzShJ
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a210470b49so22087825e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:54:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793613287; x=1794218087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OtPUqDZyVtIcqGyOAPlThzTdLirAyOMXz5cBBQz5KzQ=;
        b=InXOzShJ8qC8LKWA8u7NlxIxhNEUv4L9qlGVlMQLDnZHHT6a5GykEMJBpdh7+MCNFx
         TJQQfjXOOk+16e9ycoPKhLoiPI03FSngWDi4hbJBdATaMiJI/YZpQ0dlBTZS7AiroXxn
         1T8XhrkchWYp97mGIa9gNQ8s+9h1LKKTg49e3s15EIenuASA0/RBsqI6AUpQk6/uCf01
         GMaf+rYqx/oyamUqsDobhXKds9I3InYDnsj45ajqdwIxCartjWuKoMCMiuT7U3SbvJA+
         CanEoxdMHqoJv46XKQxz74jgwVEEJ9HKnHxmP6B5Q82dajvH7KDn7feCMaI7z/DppR/8
         spYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793613287; x=1794218087;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OtPUqDZyVtIcqGyOAPlThzTdLirAyOMXz5cBBQz5KzQ=;
        b=SclYLeEIxDo9XK6biyifoiFbPtqqEBrm5hI1AQPkcuXmxZ+GI6QKhjDafST80EjH8l
         lOrbeGj9S7GUUCmQ2pzXjJdmEBU1WnBcArpMYzLDJCluXnrlGU39KI+ykDvIqxc5SNxQ
         L6ObptUh/tjoLLcn9byvGRy9V9yZE360DWCKQ+Ih9G6VjYLRx9C3q6JhK1siMzHCD262
         vqiW3UgIFrI3kir+uvIYql/UfECOKZ1S6pS2lE0EgJN11qFzkOCt72v3cgYGUOk5ajM5
         XrUL+psG7Px5HoXjxR2bH0HCLmQv/GPQhLn1B07dWGt6qg3k7KLxpLYt9IFRfaifhCeX
         vJ5Q==
X-Forwarded-Encrypted: i=1; AKwUvBx498UbvMSyhJt00BiBY+xfAYT8YmWkTuJiEaPuCovw/ooI4MCEtZKnSGI0r93ofppIWBBo6q1xm9VZVl0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLUt0idGdJa4cGUq7ynZl3I+56gj0Y1cv2WCuwatcZvoxKJ405Q
	d1MgEa0lsw9b4rrSAXUO4VdKSDwmml7VTwbJA4I9fGNTUYWfNz5hPVlT
X-Gm-Gg: AYBFou1eAL4OMbBDa0wORnNS5rG3u0uMT7Zud0Vjcu0WRHa7UT1mrJrQZ/JEd3q1Srw
	X08oIlWGaSXNU0OXUX2i7AlETDUajszPoABWAx32GveR6phop0hGavHcccyizkZbIMmWev7ckNk
	esVMmrCDE4w+Y/waLYfnynzp9L6fqkCNkJIyVvtaQDncUAo6JISoXJ0nPuZxvLLsucBOH7Wz+bL
	Lz/7nCG0nwmPoDwA2abp99fgk98hudF5vEcnwqvbviAcnKo2ye5gHwQhj1QNeHOHqBL9ns9j4L2
	fBa7oow+yVutzcWRIsaz9iw0hkWE/n92NZDZEKg4RZk6cnqkC67T6hgedZZz0I0Dv/PCFH+M5sp
	zb+E0bYIQc/8GXXjTtAKvtYavYzxMqfwZcNOAuu2X9AnO/xbv1bEDkf5eKHNUAykYzc7wI+PBw7
	ioh5tNMzCIOC1q1ho7Wwd8LaJZjw9A95AnN7mGtd8IpLKa8jJwb5FXR2mPhOwR1sNOmBLHjvVxp
	q9zxXOQLkdOEzIrq+lZ+4nfP6Ck08wloAxoejJFzNf2MWH99rNQRYyx1W3QGdIQd4v9aOxH0dKz
	EP9kkchEv8axTBZ9/dR73YQ/m+LqjnfEFI5axAK70aVCkmf5XAmeMDiVPQ53KeGyIMNacnARE/4
	M7Ib1AjjbQKSjczU8Fr4bY9DJtDqL41LjrAmOtmbudhBHYs80jLjkwIfw0ztnUaSpv1EnQAJKXW
	B0WyFTlDun/cngMS+CQKVbaMYp1xa0M6faEBVwC/8XDw3jTEMYwnl4Df+Pwbo7mWk/bY04c9/de
	vpy+ARPZcR8RCGb/C4SchjvadUid22CSZkvmA==
X-Received: by 2002:a05:600c:3b1a:b0:4a7:9044:a87 with SMTP id 5b1f17b1804b1-4ac18c73df6mr218130165e9.27.1793613286827;
        Mon, 02 Nov 2026 01:54:46 -0800 (PST)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf60f1076sm277729555e9.6.2026.11.02.01.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:54:46 -0800 (PST)
Date: Mon, 2 Nov 2026 10:54:39 +0100
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Jaakko Koivisto <jmatko@utu.fi>
Cc: Andreas Klinger <ak@it-klinger.de>, Jonathan Cameron <jic23@kernel.org>,
 David Lechner <dlechner@baylibre.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 <linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/5] iio: chemical: sgp40: Do not convert I2C errors
 to EIO
Message-ID: <20261102105439.00004b83@gmail.com>
In-Reply-To: <20261102091258.247402-2-jmatko@utu.fi>
References: <20261102091258.247402-1-jmatko@utu.fi>
	<20261102091258.247402-2-jmatko@utu.fi>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
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
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 11:12:54 +0200
Jaakko Koivisto <jmatko@utu.fi> wrote:

> Any negative error returned by i2c_master_send() in
> sgp40_measure_resistance_raw() was caught by the
> branch guarding against short sends, and the error
> was subsequently replaced with -EIO.

Please wrap the commit message to ~75 characters per line next
time. Otherwise LGTM.

Reviewed-by: Joshua Crofts <crofts@kernel.org>

> Check for any negative errors first and propagate
> the error without conversion.
> 
> Fixes: 1081b9d97152 ("iio: chemical: Add driver support for sgp40")
>

Also, no blank lines in the tag block.

> Signed-off-by: Jaakko Koivisto <jmatko@utu.fi>
> ---
> Tested by forcing i2c clock to ground. The resulting ETIMEDOUT and
> EREMOTEIO are now correctly communicated to userspace instead of
> converting to EIO.
> 
>  drivers/iio/chemical/sgp40.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iio/chemical/sgp40.c b/drivers/iio/chemical/sgp40.c
> index b2b5e32a9eb2..3a239fb6847f 100644
> --- a/drivers/iio/chemical/sgp40.c
> +++ b/drivers/iio/chemical/sgp40.c
> @@ -187,6 +187,8 @@ static int sgp40_measure_resistance_raw(struct sgp40_data *data, u16 *resistance
>  	mutex_unlock(&data->lock);
>  
>  	ret = i2c_master_send(client, (const char *)&tg, sizeof(tg));
> +	if (ret < 0)
> +		return ret;
>  	if (ret != sizeof(tg)) {
>  		dev_warn(data->dev, "i2c_master_send ret: %d sizeof: %zu\n", ret, sizeof(tg));
>  		return -EIO;



-- 
Kind regards,
Joshua Crofts
