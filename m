Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794690191;
	b=cmJLjDL8eEFBxh2AqzKAvFKziuqd2sUfuw72LAxiOJQCI5gnwrbVtIgq6kcRtN4Xhbcg
	 Hwj90EzkPGeox6M0HTXQu9tdfUTUmar5Bv7CJvpkrgS1cRSEVRMav4q+wNbaivc1Ro/wC
	 O2ojKS3k7LlKyuXGvhzPNxC9fL+8Pp0wXrIDsp3PNYh9/9nDtUIVhNdc+IP3X4eZ+u4DR
	 VeZIsgDVA1HWx4p/x6rFDPoZGI4itAT7UFWSysRw64cFwT9v5PIiOUOu5qh5icbDCyEOb
	 f7Kl0fk1BXwauzFrfWRTueLvjlRD+zf2hkPzp8rYHjtVFegl9oFxfrCoQMZ5HyfpJWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794690191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VF3+5ckqjkWo1/tuEiCb28KnOUZrUPKvSXLeZGTLF5Y=;
	b=J4eq/YRVIN/VH5Wwsx1XvO8AbAUhxsioccHJunKCPdvJ6OKE+uVomRpNcUclMwrf+Lxw
	 Zs9wqtJcSlx2VkpgvNwcHQ6qWt1v10N1OtEyHMJn1Pt17bZ21OkLerRS2ssHyc05J6P2j
	 g7pWDmOMSJlHjyO3ZM572D/tDzV1zlJEZYPycTnI+Y8QvlDeiIUcYl1AIbEQt1LoOaz5t
	 YfZrPZlriV5JstS0hnYQ6B0UlMBNDcmc2MtrRGvN5Z7C7vL0VTR+qQY1ULItXbRw11FTC
	 Z74dHvBoeouEX3WHdPBueOTxB3i/obJ2oVV9WZ+GR4TDq6MX67Tq72bLuJ8V/AyMjHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=njza3wTA;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E809606A329
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 21:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E809606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=njza3wTA
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5364d86f7f0so2105881cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 13:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794690190; x=1795294990; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VF3+5ckqjkWo1/tuEiCb28KnOUZrUPKvSXLeZGTLF5Y=;
        b=njza3wTA94nlZ4biRy1rA18jY9hYlEQqvtu6o8uuNZmpbwAyBvWF3zxdtdfC6KDZ7S
         Fb3onuJoOjLXeXKcU/4EXQ8jEuRnMkjTYTX7DXsYjlTGfumZaP17roaMT7KFPVF13oHE
         y8zDyzvIfgegWnYbs3dCWO9cs3viq+AzzRW8WRSvWg+jYOjpM3RAqfprMlaRJuJp82S8
         bpesaZdJf2oL16toVLPEBMotiWo00LN9egC1p6cFLDfbXVFycFylTjLEWbLhSyWNP6NY
         /rvqHv0xJtkvd4tY4azMTT+mgnrOcNjrlagBncohReHsGRYDysYwiT2VLFGnaW9yZnG/
         jFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794690190; x=1795294990;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VF3+5ckqjkWo1/tuEiCb28KnOUZrUPKvSXLeZGTLF5Y=;
        b=ShmpD8DrjAbxLPdTGMCFIz27wWqz/X031vJbeA8lZ2qJcNPlT1Xl8bMLF9lLhubc00
         WPbprYffswvBi1fKHP6oxISqzuNlTFfChmJX8Fb5f2aySAZMlNBwBe7KhyOUcxAWLAS2
         DxSNs6ZPVx3qFItPyqnarwe7tXxKaHGaUUiXv3bAWA6lzwQ5pucW+sSpnRtGVT0Dqia+
         kgLJ7Xa3mqxoBXswlvIU7/6ZG5U3HPy8BZXwCH1rUi3N+5nZmFCBZ4oJUhZMUd+QEvHT
         3zR5Mektt4/CUTy90QUaYwWfmXYH4+Eqo4e+uI8fxw5tGRRjYGSSX+a9opyKPss6dArV
         eqmQ==
X-Forwarded-Encrypted: i=1; AL+hErFzsrBd7rm8TXOTKNMor8geVFDfPBoLQDbUIUiesj9FPTcJRH+N5VHhmJuwf8mphV5wIW0K4y7+GgxCEMo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sSIXvFhcDbjL7AB90Ccmp4xfw9bXZPJz8KeTKXsuICP3GTmrf
	URDxy9S1WW38OFFUzBkVonOKifpMMCPg4UPObT0iv8rJ8ku94Kdd9k7lgK6BaK5Eyw==
X-Gm-Gg: AYBFou0ufrFx4Yu7Im0rQtBgNi2Yoh1z51qYwYd3VwU9DIsi+nHhfdhxfvnrUOZ2P1b
	h0sj5Ofn5kPsHIFtIVogt6qNqJr9ZzNIXu7uW6f1NLXqCAzeOrDs5K+6cFc5DCpG1IfgV9w0zA4
	5mDjVz1ex1onpjZSv/fHkv1ombPl96W238MeMHYLllPfYOtdz2sMFdZoothRqlQvJzskMFkDV2N
	ZgcIzLHWATJ+2Mm5gGFZRHVmuWzD01jegTaoMEPbzfjDk0xgw4JZ/aSIlzFZ79BlwN8uPbKXCG6
	Tgq9489iwnK3XYwnMqBtH9eJKwLLWEUTPO/AAWBXsct2HTXM+w640hLUwqtZfIeQu4166AmPzTh
	nUOPa7y/HFDXn2hkqPGIBbLd9EGU3SfNGkC6H2oRXBmoWEacE8ZSq9y6e3bGfLuZLrRURDiSjcW
	Rsy/+S1sM7cJeVDnbXTsTHwBBdkts3Yb4Wo8TOUBvKmXfNZL/azxTPxEs0UoorSrHtLncBULjMo
	Gl6jLNFqct+3Sof12bIONRMkIMcC4opFbMDVbw14lgnTw3854sBiZ7OAf2N3488TbbrIM7CJgT+
	/u2R/D+IACT/aOdieFgIcW5ZcsaCjOY1ivSmF+rmfZ3LJXE/k+g=
X-Received: by 2002:a05:622a:5a11:b0:535:a5f7:d586 with SMTP id d75a77b69052e-55ac9089b1amr95896921cf.64.1794690190346;
        Sat, 14 Nov 2026 13:03:10 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d00:161a::d398])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d458fdsm50228666d6.9.2026.11.14.13.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 13:03:09 -0800 (PST)
Date: Sat, 14 Nov 2026 16:03:06 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Alexey Charkov <alchark@flipper.net>
Cc: Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Xu Yang <xu.yang_2@nxp.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] usb: gadget: udc: Clear a pending connection when
 starting the UDC
Message-ID: <fac47d51-885c-4d83-be9f-860cf70816cd@rowland.harvard.edu>
References: <20261113-udc-connect-v2-0-f51b11f07eb8@flipper.net>
 <20261113-udc-connect-v2-1-f51b11f07eb8@flipper.net>
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
In-Reply-To: <20261113-udc-connect-v2-1-f51b11f07eb8@flipper.net>

On Fri, Nov 13, 2026 at 01:28:16PM +0400, Alexey Charkov wrote:
> Since commit 62911bc82b03 ("usb: gadget: udc: skip pullup() if already
> connected"), usb_gadget_connect_locked() returns early when
> gadget->connected is set. A connection requested while the UDC is
> stopped sets that flag too, without enabling the pullup. A later
> gadget_bind_driver() or soft_connect "connect" then finds it set and
> never enables the pullup, so the host doesn't see the gadget until it is
> unbound and bound again.
> 
> This happens whenever a UDC driver reports VBUS through
> usb_udc_vbus_handler() while no gadget driver is bound, e.g. when a
> Type-C port controller switches the controller to the device role at
> boot, seconds before userspace binds a configfs gadget.
> 
> The pullup is never enabled while the UDC is stopped, so clear
> gadget->connected once it starts. The bind connects according to the
> VBUS state that the core tracks anyway, and a function that deactivates
> the gadget during bind still has the connection recorded for
> usb_gadget_activate().
> 
> Fixes: 62911bc82b03 ("usb: gadget: udc: skip pullup() if already connected")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>

>  drivers/usb/gadget/udc/core.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/core.c b/drivers/usb/gadget/udc/core.c
> index d5844384c368..577bc15f61a1 100644
> --- a/drivers/usb/gadget/udc/core.c
> +++ b/drivers/usb/gadget/udc/core.c
> @@ -1236,8 +1236,16 @@ static inline int usb_gadget_udc_start_locked(struct usb_udc *udc)
>  	}
>  
>  	ret = udc->gadget->ops->udc_start(udc->gadget, udc->driver);
> -	if (!ret)
> +	if (!ret) {
>  		udc->started = true;
> +		/*
> +		 * The pullup is never enabled while the UDC is stopped, so any
> +		 * connection recorded meanwhile was only a request. Forget it,
> +		 * so that the next usb_gadget_connect_locked() enables the
> +		 * pullup rather than returning early.
> +		 */
> +		udc->gadget->connected = false;
> +	}
>  
>  	return ret;
>  }
> 
> -- 
> 2.56.0
> 
