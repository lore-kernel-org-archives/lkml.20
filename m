Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019417;
	b=n/9ccRlS28ULDJY20bfKU/HYqH3/rbubZo2d3QHmzVIoR0b5LoLBpeV1aLfDkqE8Vlcf
	 ODtyXunpT4PJk/wqYFGPRORgMO0pIs5RBNWi8raw5VZdMqiLK9pBbTd2YkjAQwwrwY2ZY
	 vp4VC6WULat134SjNhreyHqjAjLbOkE4Xv8Mj5HVY+SNDew3TPfmAidqZiiX98mxMPxSV
	 IMGfXS8d3Ru2ZNrYnithVISvUeAvPLGb5Nnx7ghPMjrDoAWoLdrdYNBOfi5sRs76e8i0b
	 Fqcl/TiW/zmvvgbQeLvf0PVMnUs+llcYSpNZK0/6SbZFYFC2XgKn2Ji2VKTtb8/0O3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019417;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=UCy5buCAAPRaMG/y5EzdlGNeV9SlawrqadrCQjrrMrA=;
	b=jwVvnOadOBicgFvaDqRnTYfzCCyDjnZVvWHJUO8s82kDTo7rPLSArr/NMbMejnXV388u
	 RIXpF+xyAqYAuKJZckw0fnerAw4LD9GJzNWce6fTT6cGXTFN3Nlgo//RBktiMEa742mCJ
	 OUDXKpmWoOpXBEF/Vezv7aLVDg/NeVg64xBX19Etd2d+icJbmPcMEgdh6mZK48D/nLrdU
	 XQXpkLHPzQZ27wcpkxpNtKIvT9Ku4HUAjyy7sxZ+Ar+guIYFNUEQ9AQIZpD8UYMGG7GbP
	 yjdyjVJrN25dNB2MjvwyaHDq7UJvwIvXNTy+m8wGE/5QxHSv6/MsNs1nW0UIaXr8JIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ano9C4vd;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E53606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:56:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8E53606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Ano9C4vd
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso16385635e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793019415; x=1793624215; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UCy5buCAAPRaMG/y5EzdlGNeV9SlawrqadrCQjrrMrA=;
        b=Ano9C4vdkZuL2/qSA4Ya2bAb+80zZZnOYy82mM5+aY0M0+EE0WBERm9y/9zHGUYLFy
         A/J/afpuP84nvAjI7rcWqD6f0urPAT2qX3EWcO3VeEtngqOUYd3aDpRGLNUhvut54c9J
         Z1oAYUcsTgHRMSyRg/6cngtzc2vKPTxT0qQx543O0cXOcKyyzdbGswe0Pw5NjqBW+gdt
         EXQvMoI64JA/RKiM50EE+XpViU3oNBn1mlYqcO6RCyOleq+hN9EHTwgjQKFKLeoLXggd
         Wp3fgb+3J/jrJqkzmwYP507AQJxFQsK/0FYali9ZlKn3vzAijooDOJ+PaOUjZOT4sBXF
         SZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019415; x=1793624215;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UCy5buCAAPRaMG/y5EzdlGNeV9SlawrqadrCQjrrMrA=;
        b=rIzfBSy63A34io46cXbysLpeL4K02WoupmcDOD5bqHgxYv8MQd8H2aH7iYhhjJ8B0K
         MSveYLPwsZgQX3tKhW3dKhVeYucvIi8GVzGoLzb1MDVfmf9w0W/xCv48Y+rAiUpeiyZC
         ViOHqqpiVdxWbggQ5uFMpwjcXGfrGpssoVH3Y0AVCMjzAC4H8ls+OPlCfkrdeDg38MQo
         Ju3gIWf2uXrlMP5pYdI+EPhOLqmbDR3EMS8btBwqPzVYa+uP6rIUMpXFsFjHvETplJih
         K9RBE9WKl8jcnR9HoJ1LDdLY944HnyJpht+gVgDD80Ta7vjeYvY06/RsZNgZ/h2HpVsc
         aDIA==
X-Forwarded-Encrypted: i=1; AKwUvByvQuuhvrc4ibkQ5AMHpQ4kq5GgyZRaaWL2+iarkzUOTpD/OqRoqyZQ1IG2hyndjPCRqMDN+xkZ/JH9u0E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOhSU2X9Fjx5UkWnsIgQGAmhVIUcinwWNlQTviDrvJEiwa1MJU
	IeYBzMLb7ru8Kt8d68rUmUgXkHmMd08rS49XWBu6g1OwhaqyMUjTZPbFeSMTXW2q+3Q=
X-Gm-Gg: AYBFou35N75ZJkr8n5VW5BYh68ntol1EHmfQGZE2F2nqsvMF9+RhEI8xBDKQM2cufQb
	K0Eoky7XAIkFxXEzFv3pxhagxWzU4YPomplawXU51FrSntvUjB0n3g2Z6teJEm7Jp9jU19vMhsQ
	hpdEKaG8thg1QLHXfs1LiRln37rugVqKZ+b+SC23aG3lKuZuFkLIdHUHSddtlPHjrkfnwDvHavD
	uOZ63D/J4TSbgVfqKLjooZcPZbgtDfHY0Nf/goGf5DAzmDioJPclQufls+YBWQPXSxygwju/TO/
	Yd44LNwMoofckGmpD2Dh/v1yz39jLSUMVfTYpNp0ZCoAcNTjnp4YiwpSm9NNQx3K2klX1xqd2lY
	+En3IPgJpOLZ7RTlT3PIWpJZApLSCy8Gryehg3Y35TiP7TSEgxmntq4hnKpekWsJN4AfmLLsiex
	aNljCguDeMv9PLDjnnOx3u6v5SnzbPY4yyQneoHhMwWAMH+8D41SPkLdEUIYnocks0aUjZWbB7C
	69Mrp7kzAgItUytUuQzKzwIGYRhbuWuvhjkG8hLEEBZRs0hcZ9sBLha9BOm/b+VbOgjoaMqCrcB
	Jts0zaByNLO6TvfrnDMgpg==
X-Received: by 2002:a05:600c:c0c8:b0:4a4:de70:2ad4 with SMTP id 5b1f17b1804b1-4a4de702b8bmr75813525e9.22.1793019415369;
        Mon, 26 Oct 2026 05:56:55 -0700 (PDT)
Received: from ?IPV6:2001:a61:1396:ca01:48fa:543c:8ef8:4075? ([2001:a61:1396:ca01:48fa:543c:8ef8:4075])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3932sm17562810f8f.18.2026.10.26.05.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:56:55 -0700 (PDT)
Message-ID: <e6009e1b-2d95-4350-8374-d5930200ed24@suse.com>
Date: Mon, 26 Oct 2026 13:56:54 +0100
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
Subject: Re: [PATCH v2] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261023013931.388916-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261023013931.388916-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23.10.26 03:39, Jiayi Li wrote:
> USB core normally disables interface endpoints before calling
> uas_disconnect(). This cancels pending URBs while the device may still
> be processing the associated commands. Some storage bridges then stop
> responding after a driver rebind and need a disconnect and reconnect
> to recover.

I am afraid there are some issues left. Let me address them inline
to the code.

  
> +static void uas_pre_disconnect(struct usb_interface *intf)
> +{
> +	struct Scsi_Host *shost = usb_get_intfdata(intf);
> +	struct uas_dev_info *devinfo = (struct uas_dev_info *)shost->hostdata;
> +	unsigned long start_time;
> +
> +	start_time = jiffies;
> +	for (;;) {
> +		if (READ_ONCE(devinfo->udev->state) == USB_STATE_NOTATTACHED)
> +			return;
> +
> +		flush_work(&devinfo->work);

This raises two questions:

1. If an error happens while disconnect is running, why do we want to schedule
work?
2. Why only this and not also scan_work?
> +		if (!usb_wait_anchor_empty_timeout(&devinfo->sense_urbs, 5000))
> +			break;

Some commands run longer
> +		if (!usb_wait_anchor_empty_timeout(&devinfo->data_urbs, 500))
> +			break;
> +
> +		if (time_after(jiffies, start_time + 5 * HZ))
> +			break;
> +		if (uas_cmnd_list_empty(devinfo))
> +			return;
> +
> +		msleep(20);
> +	}
> +
> +	shost_printk(KERN_ERR, shost, "%s: timed out\n", __func__);
> +}
> +
>   static void uas_disconnect(struct usb_interface *intf)
>   {
>   	struct Scsi_Host *shost = usb_get_intfdata(intf);
>   	struct uas_dev_info *devinfo = (struct uas_dev_info *)shost->hostdata;
>   	unsigned long flags;
>   
> +	spin_lock_irqsave(&shost->host_lock, flags);
> +	scsi_block_requests(shost);
> +	spin_unlock_irqrestore(&shost->host_lock, flags);
> +
> +	uas_pre_disconnect(intf);
> +
>   	spin_lock_irqsave(&devinfo->lock, flags);
>   	devinfo->resetting = 1;
>   	spin_unlock_irqrestore(&devinfo->lock, flags);

Is the resetting flag even needed anymore?
If it is needed, why set it so late?

	Regards
		Oliver

