Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299336;
	b=ia5RG/MBzmt5Lpjogz4NoCdJe3/ObyJ6uknnkN/juA1vM+dmTzSoMec29a2a9t+/U0HI
	 457jXvINp7vQbDqvcUs9uh7AUlgEsg89gn4ZU/FDtYdlOntAm48HfvtLDpVB8hBRnrOd8
	 HWr1DDalikb3oNl/ljZPrlIvmE1Y42RGr20P8u9bBU/Q2NAhMgaWZYaZySPKA9wltrWXm
	 7Z53KApZc0SV4vEjwudGc/hXFkVGbNs8KIwbuHdiHRIsSxpT47RkIFjt48bEL+ygtgpso
	 0B6IKryxC0uJrnzLnjHAMsxLvTc/70GV5V+dLjHT7jRtuXfN0DYsqOBCRVNZyuTaY8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299336;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yyKfQb1ExiAMJfqfgRyzEb4vXsSpl0LrfEIT/OP5q7s=;
	b=Hh9DQfu3/CfTFi3BNi8BU7AyQAzyvn4eyDJbgT9enZ/1OtbzzSqHSsxotNiFANpP8eXc
	 Xsd5vHiM7HsvpTQb5ha7Bza54jJ10GpXE0n0yXf9mCCnDr89Mhcv8OZmGyYbpeOnolDaU
	 /Pxxu1XoG1+UeWZOVmy1ixFN0Zj1ehp+Dj22xJLP744SyTg5o5gZ9QQPIQMGQivWpQ7kc
	 FUeXgaOw6J8Qog456eaR5K+AoAZ9FoOTNLooIlLLQ3n1/+kvaJj/9SXr7kfRwvxmc/ZDA
	 qptYWr5Zv/ZckRVexczGd+haO1n0jNguMtRXkvNSRrJ60CoZj3wpyFy//MJlUGIHqvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=H0eMWThJ;
	arc=none smtp.remote-ip=209.85.210.52
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42237606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:42:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42237606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=H0eMWThJ
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-845f3fa7f38so1170910a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1793299334; x=1793904134; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yyKfQb1ExiAMJfqfgRyzEb4vXsSpl0LrfEIT/OP5q7s=;
        b=H0eMWThJs2MN1qHRZ6n07NBaKzzvrxDguMoSm5+Hfn96u+SGM1HpfnfaA62Qd01lqT
         tINCl0H0LgBWREnDZBTpiCZTaXcPGr2XkkiMjQs2sVflGQU/C4rrN9D75Hgmj+PrXUNf
         KHH+Lg8+BZPxcVZbw/8VVA7yLS72ryQdpugfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299334; x=1793904134;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyKfQb1ExiAMJfqfgRyzEb4vXsSpl0LrfEIT/OP5q7s=;
        b=hY4Sor15vd6EObgVqmLdmYdYpRZyArH/Jp43vYkFHWep9IVCME6hc2gtxI873lP484
         QSqU/H41ZLNL83tgCMr+TOn/sHmhYdeBCUy3qd8eESJKh53nTrlK8P98n2BHIpF9dgV8
         X9uYZS4CMhCVwgWM1eGYavHwCIcCriS8OHsGS+c9yXA1uji0V3kiIZeQu+7IzDGlxrIu
         Fd6eGqOZT+po1q9IjT8XyGmTHNkHrI6Jy6rKB6aCUCCNFHxtpwlKSsWDsZ7guW0ozhLR
         /jxe4mcCjc5TrCCRFaQwUx5T0VT73Z9LPF0DCgqMqOlX83btdk9dgk0X2gnXJlStWx6T
         L8hQ==
X-Forwarded-Encrypted: i=1; AKwUvBwG6CGZqRq03Z2KJe6TxTJ8HSHRF1nTDxHM3gjg931cr5jjI/JZ33i8w3VoVWOvWcnz4m3ZhpB+hKo5uiY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLW9YvYJsLLdvguzOx63CK81mKUtbg+dkOqLOJEBESr3hPqSZj
	zpdR7vGdAyvie8ve0H3YmSfQEqGb/vsMHFSxfiVCZIoAIaMFn2tExrevHUtAv/6hMJA=
X-Gm-Gg: AYBFou1wuWXE8OL/KEBLesd5/ta43TMMlt5QD+EYRq3zlHYe0mAOj3N1WTZUHy0Zc2u
	dVUyP2bU0yfS45XT940uyZ3UksPugdTy8LZDCw2b0T5J8AUgUm7a6LaGzrzkCKJSZG0dYOCjSWe
	PE009w+0Pyzv6IcOC9BgC8nPpIdxidJXWxN1NsKCbot2RLeV3dDKp/bkA91FjswnCaiJBAGdycZ
	wMLPcGHIrFlVvhNTsNg84DFlaNR7uC3jZ+nk9WBhGytvlzK5fZPWc+1EicjnZir1RApBQ/Q7ASo
	oL3KUHCgkR8kiKq7SeQwLqCTyn7m/fZEFFIPDsJIxZtR2jBN4P75qUAWx3Mg8w0oZjaXxnmwQzW
	zN7FFuqGdovhRzPW4t16wTtG1Gusuq7TUFafuPxVf75DGXtdM8w5T9XNNU7VzS1Zb3BTho0yl1Z
	UT59f0dGaJAKoi6AN03nufutf6h4ilUhCFCUbkFmSYmKEx6uK/wmZCwwUhMou+HqnzgRRKGYYx0
	yH/ILuRJkYNAGr+XTK9xsxiWcewD2Fj8DMV94kB+8kkXSHwsf5xM4XM5rjQzr8DYqRN/08JXXr+
	P+gL+XAXWgUhOB208JWJkYhXaZjEJ5kCTx6yoU0=
X-Received: by 2002:a05:6830:2308:b0:81b:864b:7f02 with SMTP id 46e09a7af769-85d362992d1mr53321a34.2.1793299334045;
        Thu, 29 Oct 2026 11:42:14 -0700 (PDT)
Received: from [192.168.1.128] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d3545bfebsm218042a34.4.2026.10.29.11.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 11:42:12 -0700 (PDT)
Message-ID: <a0772d9b-83e8-4502-9e02-f61345e406bb@linuxfoundation.org>
Date: Thu, 29 Oct 2026 12:42:09 -0600
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
Subject: Re: [PATCH 1/2] usbip: clear actual_length after a failed receive
To: Cheng Yongkang <teel4res@gmail.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan <shuah@kernel.org>
Cc: Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <179328314073.648427.8311262845412746237@gmail.com>
 <179328314074.648427.388274461758949120@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <179328314074.648427.388274461758949120@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/29/26 08:12, Cheng Yongkang wrote:
> vhci_recv_ret_submit() receives the transfer buffer for an IN URB.  When
> usbip_recv_xbuff() fails, it sets urb->status to -EPROTO and gives the URB
> back, but leaves urb->actual_length at the value supplied by the usbip
> peer.  A malicious peer can set actual_length larger than
> transfer_buffer_length; usbfs then copies that many bytes from the
> kmalloc(transfer_buffer_length) buffer to userspace:
> 
>    BUG: KASAN: slab-out-of-bounds in _copy_to_user+0x79/0xb0
>    Read of size 88 at addr ...
>    copy_urb_data_to_user+0x36f/0x480
> 
> Clear actual_length on the failure path so the failed URB never carries a
> peer-controlled length.  The URB is completed with -EPROTO and userspace
> observes a zero-length, failed transfer.
> 
> Fixes: aabb5b833872 ("usbip: Fix error path of vhci_recv_ret_submit()")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Cheng Yongkang <teel4res@gmail.com>
> ---
>   drivers/usb/usbip/vhci_rx.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
> index a678e7c..741107a 100644
> --- a/drivers/usb/usbip/vhci_rx.c
> +++ b/drivers/usb/usbip/vhci_rx.c
> @@ -79,6 +79,7 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,
>   	/* recv transfer buffer */
>   	if (usbip_recv_xbuff(ud, urb) < 0) {
>   		urb->status = -EPROTO;
> +		urb->actual_length = 0;
>   		goto error;
>   	}
>   

What happens without this code change? The code path follows the
error leg because of EPROTO? So how does setting actual_length to
zero help?

thanks,
-- Shuah

