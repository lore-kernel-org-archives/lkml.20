Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310A747CA63
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156957; cv=none; b=OCPH+rYaVzu9BeFnqeMDzQXLa8PiHngQIV8JGD8l2H60vfbi9C/DLceOWlG+czmdrjRFTuNYhkjmEwfILKanwy2yhZ7a+90j1pk1dc4ToLMBV2eEm1b2AX412XOTnGseM0eOKnO8VkZngxVgfQukbYPdXUK25LcyjaOCsUlVLbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156957; c=relaxed/simple;
	bh=GjWhhapekepSw3xDZhTubaOgG9SpMCtdY0jaTW4TErE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UvH1R2kLoxiTFdM9HxfFiiGmxkL4oJIIEVAfcrQRQTzGfq8x6azm1KSr3E9isPAlZ9aThQxBDPb9l8zCJJ8jxQEunGZZXkMAqrR3W/9Knaw3nbmEeQHPsAb+rdUOX1QIcUKeqnZzT/9dHVL3S/cU2MFYQGUa3QjaTVAAVrcLPoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HPCkuayi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HPCkuayi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso9147585e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1790156952; x=1790761752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gQY9+mxl5RQeElezYwhR5Xgjfp9BQCJuxwrhuNY8J6A=;
        b=HPCkuayi90S0BJAjAhbdq1lbdYMgDpMaqRkXNgCTZh5aAbk1j4Zfn25Kx255lkkrm+
         gA6uqW/ZXNHGC8e5vua2Bt4hzV9bPAvQXfUyc8Od68RmOXRvp1ZzWnFDXTSdLcX8OVnq
         E/xmjk9Z9WEOq0tYED15aQRBOop+r8kRvX7mM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156952; x=1790761752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gQY9+mxl5RQeElezYwhR5Xgjfp9BQCJuxwrhuNY8J6A=;
        b=BkmceDd7/oMIJzeLWezDX3zHgIwm6pvmrNRpZt4+wqCzHK6HAl9F4QWgd/2BavLlIJ
         U8yOVHPQBg4wDMIT0Jjz0KVXQ3kVZJpdadgl8rb9Gixl0Cd3DeB76VQXk9+6k3Rci99y
         5dHTpndcpBZ8D+lX+KprzBNipSBl5YbVhCYx2W2Y+stqAaLM0V8s+Kigq/nb6nyyB/fv
         chFCtPbf9+R27ej5/ItwPusDp+JzU9thA3GbMP++nGIADHESsEee+wDK44Lg8z37rwd4
         kLMpW9DCo5QaZ16iTMWJ1lbHCZ4NN/isXnlKK/rYVnpMF+CShcebYdr+r+9swyvQ2p0u
         WNWw==
X-Forwarded-Encrypted: i=1; AKwUvBxkOCPYVT3jnrKSmTiIBbSgLIhUvSiK4jSOEtnt0SiJ7H1iYylPRBXyafKvIkawMfTZ2tpfgaaFvybkWp8=@vger.kernel.org
X-Gm-Message-State: AFuF++lewDs7Laoz5POp/r4l2EjCCsLvZSr+7ybvvo2B6mnGc5uW10C8
	/NLaNEQigvQ5zTVyNa/T0618B26+tk83JgE4DCIyvSfmImx+vAoulbQkNP0pjtCw4ks=
X-Gm-Gg: AYBFou1/A2d7DUi/sXcHake2mh362dBWx5y6oDtyot1JNDGQ3iLYLpL7JJnLi6OdFyA
	Ts7V7Ljjwz0iFvGdrwEu3eUvffQgpqXKN6gH++XDvvrgPJKEDtVmrFKLoBdVV9jSXjeJ3u2gjIh
	cogz9klzimKBGzp3Erz+Ziuc4JuJjanTmKIcLWmkr+MIAL61Ch5sJ19tXQGhoVnFZaeWtQD+0RA
	frP+9NJKiUI8+OH2t56UL3JX9OB6jG5G1IpTkeDF1uithfdrfDUV+spFQGwNoylUOtxk9c9vmp4
	9/n+LrrtaT9PI7yPQpCatLid9rrD26v/ZEEGX9UQCX+JfPBhNw/x4qZ2wnkH3U3igzWzxdi93cm
	UMN2BrxauuCiDUvSNYUb8Eih50UimQK8VXYcjcvFXIONV4XhBfJgzTUNlwUcDYxjefnpimPw4If
	MUEPINyLuvA6wRzCU3tuZweRSGjnRC1yNoXWUzXgWiUP5T7NimJWSgHTBPwej2jrmkcLjFUTJx0
	CiVb83pbHYkHh7P
X-Received: by 2002:a05:600c:4e86:b0:493:f140:c3fb with SMTP id 5b1f17b1804b1-49fdeffcd07mr26633495e9.7.1790156952208;
        Wed, 23 Sep 2026 02:49:12 -0700 (PDT)
Received: from [10.214.128.75] ([149.7.5.83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe14322c0sm50931985e9.5.2026.09.23.02.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:49:11 -0700 (PDT)
Message-ID: <eeacd6db-3f4a-4f7f-a27f-b7bfacc0a981@linuxfoundation.org>
Date: Wed, 23 Sep 2026 03:48:42 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: host: ignore number_of_packets for non-isoc URBs
To: zjzhao@edatec.cn, linux-usb@vger.kernel.org
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260825033623.332537-1-zjzhao@edatec.cn>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260825033623.332537-1-zjzhao@edatec.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/26 21:36, zjzhao@edatec.cn wrote:
> From: zjzhao-eda <zjzhao@edatec.cn>
> 
> number_of_packets is only meaningful for isochronous URBs.  The USB/IP
> stub currently copies the value from the CMD_SUBMIT PDU into the local
> URB verbatim for all endpoint types.
> 
> Some clients (e.g. usbip-win) leave number_of_packets uninitialized for

Using usbip-win isn't a supported configuration.

> non-isoc URBs, so a garbage/huge value reaches usb_submit_urb().  Host
> controllers that size per-URB allocations by this field (e.g. dwc2's
> dwc2_hcd_urb_alloc(), which always sizes the iso descriptor array by
> urb->number_of_packets) then attempt a multi-gigabyte allocation that
> fails with -ENOMEM, making usbip-host reset the device in an endless
> loop (older dwc_otg crashes outright instead).
> 
> Sanitize number_of_packets to 0 for non-isochronous endpoints in the
> stub.  This is a strict no-op for well-behaved clients (Linux vhci
> already sends 0 for non-isoc URBs) and fixes the dwc2/dwc_otg failures.

Also how does this manifest? Where in the code path do we use the
number_of_packets without checking the usb_pipeisoc type first?

> Signed-off-by: zjzhao-eda <zjzhao@edatec.cn>
> ---
>   drivers/usb/usbip/stub_rx.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/usbip/stub_rx.c b/drivers/usb/usbip/stub_rx.c
> index 1e9ae578810d..ec9ecbf432f5 100644
> --- a/drivers/usb/usbip/stub_rx.c
> +++ b/drivers/usb/usbip/stub_rx.c
> @@ -481,6 +481,8 @@ static void stub_recv_cmd_submit(struct stub_device *sdev,
>   
>   	if (pipe == -1)
>   		return;
> +	if (!usb_pipeisoc(pipe))
> +		pdu->u.cmd_submit.number_of_packets = 0;
>   
>   	/*
>   	 * Smatch reported the error case where use_sg is true and buf_len is 0.

thanks,
-- Shuah
