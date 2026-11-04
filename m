Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793801606;
	b=PAUT/0fLdqjyFHbhNjOHG4om4w/8jf3RDWyWxIZBC0sRK5+0GxKrJLATeMahjxJl3gL9
	 mdZmabA59QF6AOhLxj3pPLEeQTUw5ykwQsGvsJy3Ft0qfulVFQXnKhzh64gRY1Ig4ClLJ
	 9aLG1gxYpBj0IHEu1RnoxalvyznQJ3+6k0D2kLF0fy4T3//cBXfG2S3EDcCQDAJPjiX4E
	 CI/qse3Z71kI+Of/tV+jcdt0lCB8Y9YUvyNlAOuvuh7C8OPlMmJZOY2qvhsLBx90CSbav
	 vKjP4vGCOL8EoVGnVVa62CPTfkcsqAekjVL6WHYryVLsZqgkBy6FfuBM2tohySMDkag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801606;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=iUHOBjNtLmRZQXhPYVgTk3a0efFKRJVz6WaQ1KW3eT4=;
	b=3VJnsEuIvu15mE/PvXArpNrbRf7YJvhawsbpD94fVePXrUlg/GerIhvhaHTiVnGh8L/u
	 Dgji1hNZ66ZZiDZZa964D1ep78Rq/h0f219rbv7aKxuUf+5GexeOLDA2vXYQ6EQUdvEhV
	 eKtjOPTcNfdIrgaZVrIMwh2W5GRk6GtFlKxuP/E2vDZsTyTqZP3MP+k0700EgXypJxcaS
	 IANkGmy1OnLjmuWbA8X1jwfJD20zoRLzJnEmMbsXKijBpwbsVUN067+i5hkmQsLXzxvp7
	 ajwPkw6H9koUH5aJ5/tYEtfVR+CvXkQdtwTC55MZ4kh7/BWs7NUwdg1c77cEw5qbE1A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=epTZ1ZtY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59032606A33C;
	Wed,  4 Nov 2026 14:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59032606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=epTZ1ZtY
ARC-Seal: i=1; a=rsa-sha256; t=1793801566; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HR8mwVxxXtpqO3r5Mh6STjyO33UMYReHL+LW03uGIJ42PHrOOk8mnWy6qLD+bTcqRbsC8tfHqW3PU9M2+7YAUaJCVc6PyIZmw/jEjpnaaulsQIUB96s3EzPBJPgUC38rgHcK5vA6pcth1KxQc91N1a3obHXBaic974yH5Nl1JKQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793801566; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iUHOBjNtLmRZQXhPYVgTk3a0efFKRJVz6WaQ1KW3eT4=; 
	b=YRCXcDHSr8ze7HAdvryNIFILWz8EvfVoUKFzgAtOzCyInJIwkrSl3YPpr1sa/0nxjtbnrSy23b0y+20XbklrNnIUvzdXIzB3A2C+TEXpys2Zjvo87Mea2nfgr/7Nz+k32xy27r8u9uX/uhE2bj9f2TrpZT35Wb3g7FHqBXfnOF4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: a=rsa-sha256; b=epTZ1ZtYUMoSD8ZmVaH8FgLmjZ334h/xw98WqpzVo1vlVk7izWHVCzEYGdK/d5ZtiQnIH+F9sskRRuBH4UQ/HxVCv0QPIgSeWzimT8V2YNFtAlBYU0xTuJ71tZZvRgJR5N1AssSf9b0y23OL7DSOP8nxk4jhRKVPfe2vdpUW+ss=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=iUHOBjNtLmRZQXhPYVgTk3a0efFKRJVz6WaQ1KW3eT4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1793801562925226.44317889922638;
	Wed, 4 Nov 2026 06:12:42 -0800 (PST)
Message-ID: <ae39979a-70c2-4f73-abed-bf5699a0addf@collabora.com>
Date: Wed, 4 Nov 2026 17:12:39 +0300
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
Subject: Re: [PATCH v3 07/10] media: synopsys: hdmirx: skip the 5V detect
 interrupt without a GPIO
To: Sascha Hauer <s.hauer@pengutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dingxian Wen <shawn.wen@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>
Cc: Gerald Loacker <gerald.loacker@wolfvision.net>,
 Lucas Sinn <lucas.sinn@wolfvision.net>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, kernel@collabora.com,
 linux-kernel@vger.kernel.org
References: <20261005-hdmirx-media-v3-0-71a11a2e3e76@pengutronix.de>
 <20261005-hdmirx-media-v3-7-71a11a2e3e76@pengutronix.de>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20261005-hdmirx-media-v3-7-71a11a2e3e76@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 10/5/26 16:28, Sascha Hauer wrote:
> From: Gerald Loacker <gerald.loacker@wolfvision.net>
> 
> The hpd GPIO is fetched with devm_gpiod_get_optional(), so a board that
> does not wire 5V detect to the receiver leaves detect_5v_gpio NULL.
> hdmirx_setup_irq() then calls gpiod_to_irq() on it anyway, which returns
> -EINVAL for a NULL descriptor, and probe fails. The GPIO is only
> optional as far as the fetch goes.
> 
> Set the interrupt up only when the GPIO is there. det_irq then keeps the
> zero devm_kzalloc() gave it, so hdmirx_enable_irq() and
> hdmirx_disable_irq() skip it as well.
> 
> Nothing else has to change for such a board to probe: 5V is then never
> reported as present, which is what gpiod_get_value_cansleep() on a NULL
> descriptor already returns. Getting the state from somewhere else is a
> separate matter.
> 
> Assisted-by: LLM
> Signed-off-by: Gerald Loacker <gerald.loacker@wolfvision.net>
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>   .../media/platform/synopsys/hdmirx/snps_hdmirx.c   | 34 ++++++++++++----------
>   1 file changed, 19 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> index a28eb86e0b83c..a937ee23e230c 100644
> --- a/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> +++ b/drivers/media/platform/synopsys/hdmirx/snps_hdmirx.c
> @@ -2521,7 +2521,8 @@ static void hdmirx_disable_irq(struct device *dev)
>   {
>   	struct snps_hdmirx_dev *hdmirx_dev = dev_get_drvdata(dev);
>   
> -	disable_irq(hdmirx_dev->det_irq);
> +	if (hdmirx_dev->det_irq > 0)
> +		disable_irq(hdmirx_dev->det_irq);
>   	disable_irq(hdmirx_dev->dma_irq);
>   	disable_irq(hdmirx_dev->hdmi_irq);
>   
> @@ -2535,7 +2536,8 @@ static void hdmirx_enable_irq(struct device *dev)
>   
>   	enable_irq(hdmirx_dev->hdmi_irq);
>   	enable_irq(hdmirx_dev->dma_irq);
> -	enable_irq(hdmirx_dev->det_irq);
> +	if (hdmirx_dev->det_irq > 0)
> +		enable_irq(hdmirx_dev->det_irq);
>   
>   	queue_delayed_work(system_dfl_wq,
>   			   &hdmirx_dev->delayed_work_hotplug,
> @@ -2619,21 +2621,23 @@ static int hdmirx_setup_irq(struct snps_hdmirx_dev *hdmirx_dev,
>   		return ret;
>   	}
>   
> -	irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
> -	if (irq < 0) {
> -		dev_err_probe(dev, irq, "failed to get hdmirx-5v irq\n");
> -		return irq;
> -	}
> +	if (hdmirx_dev->detect_5v_gpio) {
> +		irq = gpiod_to_irq(hdmirx_dev->detect_5v_gpio);
> +		if (irq < 0) {
> +			dev_err_probe(dev, irq, "failed to get hdmirx-5v irq\n");
> +			return irq;
> +		}
>   
> -	irq_set_status_flags(irq, IRQ_NOAUTOEN);
> +		irq_set_status_flags(irq, IRQ_NOAUTOEN);
>   
> -	hdmirx_dev->det_irq = irq;
> -	ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
> -			       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
> -			       "rk_hdmirx-5v", hdmirx_dev);
> -	if (ret) {
> -		dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
> -		return ret;
> +		hdmirx_dev->det_irq = irq;
> +		ret = devm_request_irq(dev, irq, hdmirx_5v_det_irq_handler,
> +				       IRQF_TRIGGER_FALLING | IRQF_TRIGGER_RISING,
> +				       "rk_hdmirx-5v", hdmirx_dev);
> +		if (ret) {
> +			dev_err_probe(dev, ret, "failed to request hdmirx-5v irq\n");
> +			return ret;
> +		}
>   	}
>   
>   	return 0;
> 

Acked-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

-- 
Best regards,
Dmitry
