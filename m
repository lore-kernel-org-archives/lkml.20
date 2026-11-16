Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855373;
	b=My+EtRisCySzV6npKUpBpcpXO3lQcbd836oOCs8KCWDRjH1+HO3JJvMVPflBxeL75oIc
	 +4odto+xyJ5/ez8+dpPw1OTMCz02lMLZ2EQp2Q+VdjxhOeyE9lrNIqkCJJnHQnYHiUphl
	 FWA1K2NAhIBbkd78LVxomgCr9RVL30aJx6OgN9YJsEwtgydINWqs7uoUqCTmrd82j3Ef3
	 wWN/s28YpeyfKmQ9eqsB5XJz94sbnKObT7GbkU55uFm27UWd6X1tRBeEYY+qnaI98VKVN
	 KtNSsucMYKnDNInds4o6/MB4uVCix0feWqzzOF3LgP8HRv6X1swHACjygyR65TYgSYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855373;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qq6glhbhJ58HkVzMpkvkPAysJCirBwST/ZXZJ+yxSic=;
	b=QIv1t0R1aUlmDfGlcSjoPlHjxJPVFMnUBQoJ3qYc2RgzVajrms/RPPzsGPer4UJNSwFp
	 cX2FXjC09URXYBxza+X6f9hNZhKp0v0BfV0c4097fvx6hkv1GN5AHXabyeVYSawsTPUTo
	 mPZMhUQdprlKPfPE8+9YgzgmCaZksq/l2u9E3MpWacuLdiCcjBC7pSNLlTRb1gj0f9kNl
	 35SmiFG72L8q09Cayt6iCCvFeH36h0sFAN/G4IKyZL3WzxVdRIL2OZeJ28yJz9oqsJMSm
	 wl8NrqjEmtOgilwARu3Qik3ZhlD9xzdFWN9J+DEISH4BDRHILQ6DSFm/HqET7wg6qew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=prb93aDP;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9C7606A881
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:56:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D9C7606A881
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=prb93aDP
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-91ef011e338so46063656d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794855371; x=1795460171; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qq6glhbhJ58HkVzMpkvkPAysJCirBwST/ZXZJ+yxSic=;
        b=prb93aDPHbM4PkhU42SDnNuqiQ52r1qwsMJJOJBlfjVXwraNrmm7Fp0ZJlYiy7AhDb
         RFZcoczw17nHNZJl2Dq1/lz2x2Koem0UJlzEqsnHXWOCiHhcyhUOmn3ZeuxiLtXL2xV/
         cPuhq00K5vyqt9v7BBMjcsN2IAdUurpI7l7W2SBmJjLr3xUCy2+6PDo3KMCCcr+h3fLN
         ci5wwfAZHTeRWjsGX1E8M1YoGYqpAlBrLeKplVJ2ZHuyD0FgJHQ92/Jr37oeRlDDT/oK
         /bA54ELtG4w+vL9KReaEjrw3ARv0q5LGTT2/IfTomu+rfN/i2+9bV2QD4PEqmmkgd3mw
         f2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855371; x=1795460171;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qq6glhbhJ58HkVzMpkvkPAysJCirBwST/ZXZJ+yxSic=;
        b=DXrMMhdf5SYCtVFfrOCnMHNFeuLEMQky5PYeiefCZT8qRqH6VyMGSaTXFvIjvtPH4L
         bWyX8XchgyO0ZdVZjxe9oVwkczidzH1nqXjBtzAmlkZ9lh7AJkMNh1QiKy4alZ8VBCQi
         TPoDjOPmDqKCjIiXBWTSYw5uI6bYV8oUlndWZXQ/MWbIxWMXH+gM/EGe+LWEjMUUlGXt
         GMtgIUZ1Zf2Nnu3xa5UQePcWbdAAWbV9m/tqffuxm1ttQrKzgGilY1QL+xRsBJhB9+Kc
         SMwT7Ejm8DoTDyQT7yAly9Uz6Ofx7FEM3yiJ15DgZ0ef2BtTHWpR7k7iWjK1FglwvXwa
         5Vhg==
X-Forwarded-Encrypted: i=1; AL+hErGM3B96uHmLHp4evGP4I+q0/7LnZeC6nJGP+NWK15AX+/JVS4iWiUUhoJ6OWBYrgOAiXemD6Up8f8GXKK8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zY6QmL3GuX2OUlOT0Qak9ZZSMPbNHzdnbhun1fu3RcPWDwyUi
	/ZFG5puEm/tE4AlX4oTnv5hCqYOSYZ2U7d5n3IeqQ2ZKIxd46WdMfGCU/BC2H7iSog==
X-Gm-Gg: AZFdTZfzq1/eVaPLNGD+3Bu6L63Hcm8EK3Qaf9hNHs92rg2HwnjyhDVDSbwXxRudBbB
	DDQZbChpqhhZOEJRefsSXPML9shxC29MKL8WI+Qg5cuj1V9QhhTzZudPHLlf5GDlbVuyAE7A7Eu
	X6G9vQlzGSW4ILb4ugcyy2iBp/N+UZUMPkU2nase4pt0GESmVHyKeKxtH71dbbtqbbWrqwfHaxx
	VTpvKHQstPinYWBdy9R7rnF+ZRg00gRXegG0fEQ/ryQa/zrcn/Bmmqg3nr5QG8M3Hju7ceQq/KE
	q4Ht0PriytzbljgvphY2o7VA2N958FUciR5C8ederKDGPXMUwikH0kr0X7IE3f7dD+MqmQy1OJ0
	pwTnYE7X9BWOSZMNZ6B7nT4s04sTp9tBG5+M2NEVxE8LM6EtQO2UwfqrhnVk84Uad6CxVq3hZYU
	cBoERPaDyqs8++zEi+HdDvPheyQTnsm+KEa4dGkG16jiXuf+vTv1GGUK84og764phewSK6UBf4V
	djATWO4oX98ENlbl3ETORAn5pv4BXtLJMlYp1lPIoDVloiOlQvd8Hy9Ddd/7AlWe1fX/+ez9bOG
	OJGYU4Yk3/aECq8dAPZJNyT0Gi7XOoepJyC9uOXe0Zg/03cZnNQ=
X-Received: by 2002:a0c:e084:0:10b0:917:af36:df30 with SMTP id 6a1803df08f44-91f24194addmr143466866d6.16.1794855371264;
        Mon, 16 Nov 2026 10:56:11 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d452b0sm92039326d6.11.2026.11.16.10.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:56:10 -0800 (PST)
Date: Mon, 16 Nov 2026 13:56:08 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Pengfei Lv <lvpengfei20@huawei.com>
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.pecio@gmail.com,
	stable@vger.kernel.org, xuhaiyang5@hisilicon.com,
	xuetao09@huawei.com, caiyadong@huawei.com,
	suzhuangluan@hisilicon.com
Subject: Re: [PATCH v4] usb: core: hub: Re-guess ep0 maxpacket size after
 reset
Message-ID: <bbc753f4-4120-4274-85cb-a4e1e987156a@rowland.harvard.edu>
References: <20261109093935.2634235-1-lvpengfei20@huawei.com>
 <20261110033038.2882473-1-lvpengfei20@huawei.com>
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
In-Reply-To: <20261110033038.2882473-1-lvpengfei20@huawei.com>

On Tue, Nov 10, 2026 at 11:30:38AM +0800, Pengfei Lv wrote:
> Per USB 2.0 spec section 5.5.3, the ep0 maxpacket size is fixed for
> all device speeds except full-speed devices, where it can be 8, 16,
> 32, or 64 bytes and can only be determined by reading the device
> descriptor.  During initial enumeration the USB core guesses 64 bytes
> for full-speed devices; after reading the descriptor, the real value
> is stored in udev->ep0.desc.wMaxPacketSize and applied to hardware by
> usb_ep0_reinit().
> 
> Commit ff33299ec8bb ("USB: core: Fix race by not overwriting
> udev->descriptor in hub_port_init()") guarded the ep0 maxpacket guess
> block with "if (initial)", so on the reset path the guess is skipped
> and the host keeps using the value from the previous enumeration.  If
> a buggy full-speed device responds with one 8-byte packet and NAKs
> all further polling, the HC doesn't recognize a short transfer but
> keeps polling for the rest of the descriptor till unlink, and the
> device cannot be re-enumerated.
> 
> This was observed in production on a 6.6 LTS kernel with a full-speed
> USB banking token (bMaxPacketSize0 = 8) in a virtual-machine USB
> passthrough scenario; the reset re-enumeration hangs 100% of the time
> after the VM issues USBDEVFS_RESET.  The device is not strictly
> compliant (it should continue answering IN tokens), but this class of
> USB banking token is widely deployed in enterprise environments, and
> the regression breaks a configuration that previously worked.
> 
> The 18-byte GET_DESCRIPTOR that runs after SET_ADDRESS (wLength=18)
> is unaffected: the device sends the full 18 bytes as 8 + 8 + 2, and
> the final 2-byte packet is always a short packet regardless of
> maxpacket.  This is why the device completes initial enumeration yet
> hangs on reset re-enumeration.
> 
> Fix this by removing the "if (initial)" guard so that the ep0
> maxpacket size is re-guessed on every reset, and by calling
> usb_ep0_reinit() right after the maxpacket size is re-guessed so that
> the re-guessed value is applied to hardware before the GET_DESCRIPTOR
> data stage.
> 
> Fixes: ff33299ec8bb ("USB: core: Fix race by not overwriting udev->descriptor in hub_port_init()")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pengfei Lv <lvpengfei20@huawei.com>
> 
> ---
> 
> v4: Per further review by Alan Stern, move the usb_ep0_reinit() call
> to right after the ep0 maxpacket re-guess block.  Each layer does the
> right thing on its own side.
> 
> v3: https://lore.kernel.org/linux-usb/20261109093935.2634235-1-lvpengfei20@huawei.com/
> ---

Pending other comments by Michal Pecio:

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/core/hub.c | 48 +++++++++++++++++++++---------------------
>  1 file changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> index 199d3f535a89..e3d8ee3271cb 100644
> --- a/drivers/usb/core/hub.c
> +++ b/drivers/usb/core/hub.c
> @@ -4969,33 +4969,33 @@ hub_port_init(struct usb_hub *hub, struct usb_device *udev, int port1,
>  	}
>  	oldspeed = udev->speed;
>  
> -	if (initial) {
> -		/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> -		 * it's fixed size except for full speed devices.
> +	/* USB 2.0 section 5.5.3 talks about ep0 maxpacket ...
> +	 * it's fixed size except for full speed devices.
> +	 */
> +	switch (udev->speed) {
> +	case USB_SPEED_SUPER_PLUS:
> +	case USB_SPEED_SUPER:
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
> +		break;
> +	case USB_SPEED_HIGH:		/* fixed at 64 */
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> +		break;
> +	case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> +		/* to determine the ep0 maxpacket size, try to read
> +		 * the device descriptor to get bMaxPacketSize0 and
> +		 * then correct our initial guess.
>  		 */
> -		switch (udev->speed) {
> -		case USB_SPEED_SUPER_PLUS:
> -		case USB_SPEED_SUPER:
> -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(512);
> -			break;
> -		case USB_SPEED_HIGH:		/* fixed at 64 */
> -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> -			break;
> -		case USB_SPEED_FULL:		/* 8, 16, 32, or 64 */
> -			/* to determine the ep0 maxpacket size, try to read
> -			 * the device descriptor to get bMaxPacketSize0 and
> -			 * then correct our initial guess.
> -			 */
> -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> -			break;
> -		case USB_SPEED_LOW:		/* fixed at 8 */
> -			udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
> -			break;
> -		default:
> -			goto fail;
> -		}
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(64);
> +		break;
> +	case USB_SPEED_LOW:		/* fixed at 8 */
> +		udev->ep0.desc.wMaxPacketSize = cpu_to_le16(8);
> +		break;
> +	default:
> +		goto fail;
>  	}
>  
> +	usb_ep0_reinit(udev);
> +
>  	speed = usb_speed_string(udev->speed);
>  
>  	/*
> -- 
> 2.34.1
> 
