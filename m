Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675800;
	b=z9yf0oqQljfYGI965BsCrAbGwWiN0G1OiTT5lqC5nyGufpu2UiwIoPIXKTsNpi8Ph83b
	 nGYh0nrcj36wIsQRNZPHMOzBxBF4prM27QaezlPMs8/Xra5M1vqCetF4DAGAxJUf6gICn
	 OV7cEhOnws2o3M36rj0VFYq8Bdx12cPr8LD0CswOm09TRNsSBQ7Xf26HEhO+TNQyMkEBU
	 C3GkJo4nVjDjzb0Al6dWF4pxgLsdeB5QtSVCzD/1MzVPWTHh0dARd0zxpXHzA5KZ5gJlb
	 6fPL2gagkQe4XvaNJjCoyZYAy7vF89R0zjNmoEJvEO6CXonwJm+2UqEhrCJ+SARQVMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=qTs7ITGH5Vm0O/b2VvByjBvC5hRyxCKXY/CuqHg+goE=;
	b=sK5cYY05rYyJ7QDRy1k93DkbCCOjDBSfJ5YWuNYsMPUpvbabsKyfyG4wDZWDo/5Su+1d
	 7LxEBgoQrtg5JGaJ4tJZyjsFvpMkTeX+DZapeyn3FsxQLxOFajYbOCbFxoo7tlbvODq8Y
	 ptu6I1AZs/KJa+wHC4GCVzd00YSP2GOf9L7yiSjyTg1ZBgquM9mEl0t5pCI4lGHyC9aBx
	 RWbxd4Xx5wGHCXKCk6en1VGDGsKcAB3MiH0+xsRVuen394lasmRLSv4GAb6HDbB0wqxMw
	 LUU84zFN8jw0pqy2c183twFeDjgFRoAB41kAwtmyeobEkSGR5OP68bXSkdCWW5rETMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9E060A262C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D9E060A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso5772605e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1792675794; x=1793280594; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qTs7ITGH5Vm0O/b2VvByjBvC5hRyxCKXY/CuqHg+goE=;
        b=UnnznAkuDtGZE+MuoQei834/NZGnv+7Vu3YK0PkPpU0vwUPzY0P7vPsBfdCBwl1D7g
         cDMgvm6L11UCVY634uIvYXoT301cHNuxy6xCGZwomfA5BcqKkBKwgphDojJzmW42m7yF
         nZsOF3aj7f8myme7/ZAA5ACEV+B1OvvzCpRuMSqZGAZNuAiES68IdgYcIXt6kP5jlFRP
         lxaajb5lltKGetqki+6nThGI6mtu4BZ4gT4LPreda2Yr5ihTPSWO7PSOFLXvma0SlABy
         uOpEbcoLqT89POjef+36bd6+VJwTehl49AbT9dDCDWbVtSL3Kw3EDUgKzjdqTX4stHSI
         hTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675794; x=1793280594;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qTs7ITGH5Vm0O/b2VvByjBvC5hRyxCKXY/CuqHg+goE=;
        b=qCjzDuViRJ+9weOhqPSDZgIgxtSyFvdTGRBaf558Yp8SJ32RAonsq06C4P/Q08+coq
         +lkkM7zXomhDkbaPSytfrEnlSBRv8cmocDB3kS93Uw1gOw8zumSSCT+Wx61Wni4AZi7X
         a0dP5K6JfcxNSixBqfbCuw4/MvVVVPzVRq4hJq6dpoC2LwOWybJpW4XFxolijByJQpaA
         8m+nkGRLl2RsTTV426RCKdfoh6g86+5j/IEV6gzvlEjT3KteSo6SD7Coe9RnKggynRUi
         0zpjFUA996gFrzxFKh7NNuQW/P3p0hl1csP8T2pnvGfVEkY7CpelVZ0sBZ1/BmMtew70
         jWlw==
X-Forwarded-Encrypted: i=1; AKwUvBwx+yLyDNUju2r24Afl0SESynJKZ1EGa6q7FTPoz3zWaYkDbJ1wBFMSm2Z3ANMud2thUSlrvgyzrPWeW+4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKicEuYPLu9OiqpKMlOYn6zlFieEo2AlW/boYhTmutOa59yUm6O
	NmdwpjqufaBKr0GUyAM5OcpbvCEUVtLTDVne70Ks216ZX/WsP2BNPcjd25oBQRsWPnU=
X-Gm-Gg: AYBFou3oXlV7SYPuFl1rmateluEPEuvUfbP25Naw3J10zP5jGsMwYDxmF8h4IpDgUe6
	Cip60Ly30UOKpuaPy3xKDaGZl5M96Lo0zH5k6D/ylnitEZZtTgfaDy5k920SQBWF2Y9LGGz0cxB
	PSrPmUOyBmYSjBYGzBvjxD2jJHZ6fycovhQZJVtkVVKbnAkZg6+fjoOxqOauXB6yM2eaN08IdHm
	79a5FnlfRw9J/yJUIPz2rd62U9ERMSPJcC1NNbBOgq4JEJpDskE+Dl90AeVQo4LN1y1LT0BNJux
	L96jaWxDSwi9rdZq46Zfa9yvVabfdxvZTJXDXiaN+MEzmyXrHdqEUoIJbpMq0POKi5urzJvKWv1
	yS5cRHashcnOSXzdgwMLl8pGNwbpHII3PAbVCInKb+FWPQvqJuYQ11IjwmkE76IEauMnbgXfryU
	ol51QRHL25p5jZ/qNoDLGmrNJstipGaN067rWvWcCpKcQ9rkud3WQo50e2HlOTxh3xD7QUU6bpn
	glJgSgQLVkQShxRk9V6maME0LKcHNRWY3L0Bu7n2m8MGPMK4PRnFmvsavSrMggJ1GL7zT4e/5al
	YMnnitEgjeDRrUexn5o=
X-Received: by 2002:a05:600c:6085:b0:4a1:a7f8:c124 with SMTP id 5b1f17b1804b1-4a204b04321mr42997325e9.7.1792675793804;
        Thu, 22 Oct 2026 06:29:53 -0700 (PDT)
Received: from ?IPV6:2001:a61:1362:6c01:90a6:c895:55cc:41c? ([2001:a61:1362:6c01:90a6:c895:55cc:41c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a203a265afsm82566045e9.7.2026.10.22.06.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:29:53 -0700 (PDT)
Message-ID: <6015c40b-04ae-443e-8271-63e064f08ab0@suse.com>
Date: Thu, 22 Oct 2026 15:29:52 +0200
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
Subject: Re: [PATCH] usb: uas: wait for pending commands before unbinding
To: Jiayi Li <lijiayi@kylinos.cn>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Michal Pecio <michal.pecio@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-scsi@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
 linux-kernel@vger.kernel.org
References: <20261022123401.319479-1-lijiayi@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20261022123401.319479-1-lijiayi@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

thank you for doing this.

On 22.10.26 14:34, Jiayi Li wrote:

> +static void uas_pre_disconnect(struct usb_interface *intf)
> +{
> +	struct Scsi_Host *shost = usb_get_intfdata(intf);
> +	struct uas_dev_info *devinfo = (struct uas_dev_info *)shost->hostdata;
> +	unsigned long flags, start_time;
> +
> +	spin_lock_irqsave(shost->host_lock, flags);
> +	scsi_block_requests(shost);

No, on pure grounds of maintainability, please put the
blocking of the host in the direct handler for disconnect.
Unblocking in the caller something that was never blocked
would forever trip up anybody reading the code.

	Regards
		Oliver


