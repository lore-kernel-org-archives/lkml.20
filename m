Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662116;
	b=eXtUiWYIcXQzbkGBTh5cUxrCOj1GH1KLNACcI2i9222n2FSnhSag607HAnwo3LTdcf4z
	 BQYmgCUeyIC4PVJJhNTrv+yDOGUR2FZfsz2ZCjRk85UBWBm4BZ5n4lr2NmjR6rlAI6vKK
	 SCr8tu1j5+3m9iG+JoWtzf7lUIpincsGAYKTua06IjehFKT/q6hiTdr9rH8LYNR6alNXH
	 6ijYDerc3IkVYC6RVnU3NkVIJfni1FUh7AtdhF1VyqeysAiPWp9egRGPhiaa1Vboibzjw
	 O04lk/b9f8tNdDM4d2LbNWO4+ZnxPs8ww+R8eroF52s6ehWmlDhKAtZHJV2/vTmgMEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
	b=y1san3h7/radCz7eVubAZ/r2PYZj6lpSrOVhLimuH/ukKmAAxGnr4PPuNDnup2xttR01
	 9+xqtWTOS302hGarQRYhM9I1tvTvbp6k2g9d8vVppK3ZWuOFOch9LKfbJ7P2RrddvNd21
	 oT8sroWxL8rHnKFjrRlpoV7IgEDSaO2wHwMdYIXOVk+vB01ChQ3fcL6m6TAG+SCgj1/mq
	 3EJatETqpNmyEkjb+tnX5ivgDNz1CcE1EKp3HTXr4CIyO9cjG+6Ph3tJD/ut4qlo+x91O
	 c6q4IGDg/q6ie7XxeJsGljbccdRCqJWt7jX/hUWyinA8PqRcnaXJX1jXkk0DPnbc7TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uWLG9vMd;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502F3606A337
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 23:28:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 502F3606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=uWLG9vMd
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e8b20a899fso24456965ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 15:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1793662114; x=1794266914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
        b=uWLG9vMdHRfPTQf8yd9B2J4pxCSDMU1Lyv+yKyLSFWcZ/0JjGOWoPfZTjIQeCA7c/F
         OhedkgLoE9Y6v/+A0GiDYtUdlHqMBMafuZG5l8XQG65zIrNDnLZdnfkXc751MGlMdG6e
         T+NnY/jViA3WbFwuN1QmnQRP3W3WcQbXnBXCMjsH5y8BHsPMy0m+YCGoTMQ6Uu9rBS/L
         +gZY/1AewV2MmqrMMKLSMyfjpsZSuav1FcnmSIOHFFw8pNp6K0I4X5UyoBO2upKDE2Xb
         AifxOTWB+utbQVyrtwcteTJXIrjPZIvf8XMjlVZXn0s8GYA8htbKQpMIKDDdw7mk8dfg
         /Sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793662114; x=1794266914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ZMaDJSQbb9QLkhHVRE64prZxAiTnxlvuwEcwQapvub8=;
        b=sFF62E39R8VEhQ3r16MmQDEeTKlshpUq+PCnbOv9Ia0ZIVwNIEcawTP4v4x5aG6bda
         Q0e1CzdUVwp8ANfe5tcXpkscJmFpjEwqFOyv0Bn4zw+OrM3bfOQtT/Kqcz1QaZ3XtSEH
         2GgaFmKOodSBcWDJCoHzNTqkONYhyM8HUGYxHDDxUAlFPi9hRNkS16FDn4OGk0qKfr+J
         ZMDdT5BZ9eoZSbL/4UDySYmT03K88QmjHDEjV83ldL0AaRftpURaaFN82i2GQFfCS7HG
         YI9Ev0N7ZcpK7+sSatu7jipTvZeBXlvVtBdzVBFSgXfL8wdo2ousjoNUtwwZke5R6ogC
         phPg==
X-Forwarded-Encrypted: i=1; AKwUvBwDL7harTNaY3fOJBJPiiooRgyXtWcZGckHffeRg/f8HpN6Vt/PofaGjYHWZRWa/Fwq3Aht8NbYH+OnMj4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mXE1qcxwM7+aQ0aQx5Z9829ePzgIxZQtwGnQj4jdDe1f4jcRG
	ZC6LRPIbctwu8wDRnYYz1D3xIgcXXes7cbTUhCERjAXjvAwWwQuZ6HOJb6c01dQLcoc=
X-Gm-Gg: AYBFou0nxBk+cDCdGvRXFjrO6e1OhvzylRFe0VEwyU0aamrYFdkbCgHriuMb04rtD9S
	9gWa3F+iDGvZjCxuGBg8V1dE4HHKFFqG5Rjooe0yaVAbsPkGVvv0Dldi8qaMuAbycAX9DUCf4Dt
	foMXME5RSqum7i+De0FUmDkAWa1f3GmTAwdhaPhtxsoXwLsl/j7xV1OCm5X1SqCRPlxZkJSi8FA
	1MZakc8bn19k236c8gVjsdlaSD4lwe2uHq3rp5IhjUeEgT0W0dsr4xCdR9kUcsDoxC7bAxRStm1
	lyZV6YSPgpko6VksHkp1G/EIYEJDG53wmBhX5MnvCpxz31Mwdwi1AHyeyW7pvOU3AQl/cazeABK
	Zb0UzQZk7pp12Jg24kztlpXiiqgf+YHwHtqADFaYKzPKrzmeYdofUdNagci8p11AYx1yN4c/w+v
	I15SvsOixTrOtMJoodzCv65cctMT5CQqlpMvSKiXv9kq7hh4r1J0HaayQglB354GEdPPP+ms96B
	KM4mC6r2qwzrUkd+j6+NMziksSpU8d/L7cC9PyK4gUEjCysmAde1jVwg+kysNnLlCRU94630/qP
	aqT71+0vzSoQNTu4ldiEnjeD0w+YJfOL08LjYA1r01ig9dHPD54TIMYdB78FU44=
X-Received: by 2002:a17:90b:580d:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3ae8970e5e9mr8946634a91.11.1793662114604;
        Mon, 02 Nov 2026 15:28:34 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6271ccsm1233086a91.7.2026.11.02.15.28.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:28:34 -0800 (PST)
Date: Mon, 2 Nov 2026 15:28:33 -0800
From: Joe Damato <joe@dama.to>
To: Frank.Li@oss.nxp.com
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH] net: dma: use dmaengine_desc_set_callback()
Message-ID: <aukcoWLVvSorX5a9@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, Frank.Li@oss.nxp.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephan Gerhold <stephan@gerhold.net>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Frank Li <Frank.Li@nxp.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Li Youhong <liyouhong@kylinos.cn>, Arnd Bergmann <arnd@arndb.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Yicong Hui <yiconghui@gmail.com>, Simon Horman <horms@kernel.org>,
	"open list:NETWORKING DRIVERS" <netdev@vger.kernel.org>,
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>,
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
	imx@lists.linux.dev, vkoul@kernel.org
References: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>
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
In-Reply-To: <20261102191922.4044912-1-Frank.Li@oss.nxp.com>

On Mon, Nov 02, 2026 at 02:19:16PM -0500, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across net drivers.
> 
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/net/ethernet/allwinner/sun4i-emac.c       |  3 +--
>  drivers/net/ethernet/micrel/ks8842.c              |  6 ++----
>  drivers/net/ethernet/xilinx/xilinx_axienet_main.c |  6 ++----
>  drivers/net/wwan/qcom_bam_dmux.c                  | 10 ++++------
>  4 files changed, 9 insertions(+), 16 deletions(-)

[...]

> diff --git a/drivers/net/wwan/qcom_bam_dmux.c b/drivers/net/wwan/qcom_bam_dmux.c
> index cc6ace8d64371..1479f8362e04e 100644
> --- a/drivers/net/wwan/qcom_bam_dmux.c
> +++ b/drivers/net/wwan/qcom_bam_dmux.c
> @@ -195,9 +195,8 @@ static bool bam_dmux_skb_dma_submit_tx(struct bam_dmux_skb_dma *skb_dma)
>  		return false;
>  	}
>  
> -	desc->callback = bam_dmux_tx_callback;
> -	desc->callback_param = skb_dma;
> -	desc->cookie = dmaengine_submit(desc);
> +	dmaengine_desc_set_callback(desc, bam_dmux_tx_callback, NULL, skb_dma);
> +	dmaengine_submit(desc);
>  	return true;
>  }
>  
> @@ -477,9 +476,8 @@ static bool bam_dmux_skb_dma_submit_rx(struct bam_dmux_skb_dma *skb_dma)
>  		return false;
>  	}
>  
> -	desc->callback = bam_dmux_rx_callback;
> -	desc->callback_param = skb_dma;
> -	desc->cookie = dmaengine_submit(desc);
> +	dmaengine_desc_set_callback(desc, bam_dmux_rx_callback, NULL, skb_dma);
> +	dmaengine_submit(desc);

I noticed in the above that the return value of dmaengine_submit is discarded
instead of stored.

Is that intentional? I suppose it might be because AFAICT cookie is never
used and the commit message says "no functional change intended".

Reviewed-by: Joe Damato <joe@dama.to>
