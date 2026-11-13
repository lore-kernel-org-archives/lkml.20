Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533461;
	b=j0chPatqwMcZbhCL801toIVaXS43ZrPTDmPBP0ehpCfncQjWd4TPshlDMlz6ag2/gM9x
	 z0OtnD3rk58hOynf/RAnbf1ETh+sBtNsIPFG6Zq0yaF/u/BERy9Ixxe9NlrF4wz1WAbok
	 wz0vSMzuHoNUBHjMK9DPO/J+EA3AQ+Kj5pa6PyPgZAXK4SA45rTA+iRAUs7iZRlKXhAYG
	 xN71eOGqyMvqxC5SmJVoEbIeE/Dsgf5udWFIHZeumO29XGY6pjd6gPpLxQuLhZKADc5Hy
	 3KWAA4UF9xetW2wXFNa9Ez6L8AA8ZKpGQCrZdAjK04NXcBinXtrVePnSR5qlf1sx0oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533461;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=;
	b=TZk3bDX9ADTOay7SeSiesVLT3/1DIHIjVZdqPQ6zthX+WWypwcfOk06FXvDXmWtQ2vaR
	 CPEhiIa7Bst0UivzicS/Z/oKUmigwNGCxszHQnqKDBxPVcwLFD+SEj6fDTKSmprTE3Wss
	 mquUiW0+mIiLt4t3kABYR+mwFHzEoprSLedGj7RFOHBrBV/SAdfF3x0iu822B4Fdmguti
	 6GK4SXwpbvGxOlAiojJzDftWuIqJ9VRDWxPv3ypde3mSXp+c5QW9yt+uDrIZbh1UXWsxx
	 V/NxzJtbeeZyUvyqMZTUW1iR+orY7IuLzv7GAA8ERGJbiQTXm1lZGT8dvteVoSmxKMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mllq87Q;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9986A606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9986A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0mllq87Q
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso603949eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794533460; x=1795138260; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=;
        b=0mllq87Q4vcSKU/7bYi3BXWQEiGb4EYY1qiaiiL2oBy1LFuLkqH+Wkv/ClFrNU0CSa
         CG3W88tPRpIe1OxH4YIipMzoQGhzdx5mbZ36zkLoVEHkoYRIZAT7P20dQwoG6oXcWI2f
         CPTpNYDcog81Arvm0uJ2VqpmWVx6IQQ6TICylR9dBQafWDnQPtJgEp6ckNKAJsicH/b/
         CTcCI+S18NroZm9E0qZnQ1XPZaHvW5gtXNs+Z7Fys6VTCRdWbbJs4FcX4U6UxQkL1e2q
         HrfNBNlOdhGUBTdGOKspgTVk2Gz6SD3ZRk7dMuWF1E/UwSTYeGxY+yMtqJM4ejXR8H7b
         6EHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533460; x=1795138260;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/7uHJFgSP2wdQKFM07aMj/DeGGfpQo0FBIAi1jAGJLo=;
        b=WIbe8w3rIQOjf+5pyuLTCOBjEHYWWlS5tUUosuq9aya8wjqsHOgfHcT41ms2riCzUo
         OimivoApmy82Q4a1ehZuxZ2rxoluUwB4yB1SBC3g4Q9Ca13ojzdhyUAL99fy5VeKDpBE
         1AUb5E/V8nKrIv04YPYQBg2YwHp3S5zXxq7I/ZIwkCLPki0CwR1I79zWq/yVqPKX2BLQ
         IlSGI/wftKEbchvTqWeQHRYWvgPCMR6dU79xEDru8hwTaO+Xeh9mDlB0i21QxL3eKTDC
         Lwnt140IkOHFGiB8fdP9DEgeA2ffYmh2t0PIIjf5lRBUmiPpl6A3QEsHTPtdvfrMSesx
         w8PA==
X-Forwarded-Encrypted: i=1; AL+hErFF1n1DiBZruXquaH255KRRhIZZY85L0wvGiN4LWr18DryvYpF0fHzc6crsKhGO6x9U16U4UQZ7fiAMXPc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cpfoCSKctgPILjyV3OcW3S3FV9J6NEYaxLOpdKbkNSxNJZgoB
	X4FSMXZ4EVOHkWijMEUsuxstersW7FvkGWcMYT81mxV36LJlBqE27mfP
X-Gm-Gg: AYBFou0ArjrZQre+GwipDuR4iEZIWlzDmUvfZYamSRdT5H6/Gwy6V54josliD36A4P6
	G5/Ch98mALhoP9876SR1U8PujHAGciGWX5WLRUFMTYZHgSrmN2yVQfrKs6puQLK8WQZw3QMgNuR
	NPd7hHC6Uz+sbaox/LtQRFns/BmkYWRUf5gsT2uNthiuWe8tpYPUUJ7yl86jT9p96KjIl+2grhm
	NIhNeQX9pplo6KHvcqsGUztQ5S8R48P7GGKgyG/752l+0VIDJIbvcAUM80tP6uqzaIzPAFmKMEw
	P2mqTK//PzbOGluFbPkx8lqkAbxpWABzMvAvJOiqudU1PFkrOOPoMyF3lcq3fbZrwTteMcKQ2dJ
	iw65rfGY3j+d8J9lJJLHUesiCUwovzyYu41faXTfa1UqG+ULDEQyoAdGeYIkVIg95eOzX+hQ1EE
	WfMBaTb3KVn+fKIq7icVqzZRBBU3jLoIpfjIt0PfvYckGDtnekcgYmju42h5As0F4vcaG8fMz/h
	UbCaRc0bdrUGiwCbOBu4E6ZjbQCp/PrpJaed7zhHHuhwE8ODG9CvGS1k1LpteO5QqKYcNodz6zc
	jBsDoRICACJF8NozixdbHsAFwlr/ZmGrSw8SZBIKd1JQTjnUZ3I5qpJCgiFaDU5fusNDzC8=
X-Received: by 2002:a05:7300:6d03:b0:36c:3b8a:8090 with SMTP id 5a478bee46e88-37963a4ef35mr1313899eec.2.1794533459424;
        Thu, 12 Nov 2026 17:30:59 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:48f1:7a0b:9bfb:4205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0c40sm2333563eec.28.2026.11.12.17.30.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:30:58 -0800 (PST)
Date: Thu, 12 Nov 2026 17:30:55 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-input@vger.kernel.org, Hans de Goede <hansg@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Input: goodix - sync the irq controller while starting
 firmware
Message-ID: <avZiZoGO4jXjIP7D@google.com>
References: <20261020122712.526797-1-l.scorcia@gmail.com>
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
In-Reply-To: <20261020122712.526797-1-l.scorcia@gmail.com>

Hi Luca,

On Tue, Oct 20, 2026 at 02:26:48PM +0200, Luca Leonardo Scorcia wrote:
> On the Lenovo Tab E7 TB-7104F which has a Goodix GT-912F touch screen,
> the touch screen fails to come online after loading firmware, producing
> the error "Error reading 1 bytes from 0x8041: -6".
> 
> Comparing the upstream code with the Android stock sources a call to
> goodix_int_sync is required between the upload of the firmware and the
> watchdog restart. With this change the touchscreen is correctly detected
> and working.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
> Relevant bit of the stock source driver at [1].
> 
> Credits for noticing the issue and finding its cause go to matemiller992
> on the postmarketOS forums, I cannot provide tags as he wants to stay
> anonymous.
> 
> [1] https://github.com/lscorcia/linux-lenovo-tb7104f/blob/2dad69c9f28611ac6d3db2f1ee11b480a60d83ee/kernel-4.4/drivers/input/touchscreen/mediatek/gt912_p98996/gt9xx_driver.c#L1529
> 
>  drivers/input/touchscreen/goodix_fwupload.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/input/touchscreen/goodix_fwupload.c b/drivers/input/touchscreen/goodix_fwupload.c
> index 5ae9a109ba0d..01e7705ef515 100644
> --- a/drivers/input/touchscreen/goodix_fwupload.c
> +++ b/drivers/input/touchscreen/goodix_fwupload.c
> @@ -155,6 +155,7 @@ static int goodix_enter_upload_mode(struct i2c_client *client)
>  
>  static int goodix_start_firmware(struct i2c_client *client)
>  {
> +	struct goodix_ts_data *ts = i2c_get_clientdata(client);
>  	int error;
>  	u8 val;
>  
> @@ -168,6 +169,10 @@ static int goodix_start_firmware(struct i2c_client *client)
>  	if (error)
>  		return error;
>  
> +	error = goodix_int_sync(ts);
> +	if (error)
> +		return error;
> +

There is call to goodix_int_sync() right after call to
goodix_start_firmware(). Is it still needed if we call it here? I think
the vendor drivers does not do it.

>  	error = goodix_i2c_read(client, GOODIX_REG_SW_WDT, &val, 1);
>  	if (error)
>  		return error;

Thanks.

-- 
Dmitry
