Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786975650ED
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965027; cv=none; b=Wzbt76hVFg4p5ZiyFD+I4TIUaEfdBd13R8IRy+y857IRg/3BlPQQPUhKjBl+ljeN6ykySuR/6fDOjVEz5rz9cqv7r2nbgEvI0jaDownUHlfEmSe8o7Llniqrsrp+5ZauIf7ZtobZUEGuEC/dPjdcY3wg+84O+56g3toMrw8JfBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965027; c=relaxed/simple;
	bh=DyMlPvFbWzlzyRQkr6wpkaRtoQ3anvGVl0nBoh+a4jc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PR9RSMbXSKRN+kTQt+Brxq3ViXvWip0DFF+IVKZJ0gOnspFxTiRYI1xwjjyqMrx362B8jphi6cQPB+m7kwt3meR2ACG8b0VRwn55PFgOFoppsKeY5JNZmSJXbV4mvdcoYvj/SGUmtcbPh6e7DGFwPfBMgf/tkLYxW4hut4FUBQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o8AfXbq0; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o8AfXbq0"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-484366874b0so659509f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788965024; x=1789569824; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wZae71d9OhtBZeeJosXyHI6vXicBpHlGo44Y/4JegXY=;
        b=o8AfXbq0My867Hcvg0SXEDhhqcJZnRXmOGN33r6+w/YKkfMT4++mVtdnNGJ0UQAOfy
         YclIQk7haqnOiHCp/htHQnDoOHY66JFz1+aT4qA9L8t7OaPRn2zmUxz+01mvS2NcFWGy
         5WLwc97b2kGGy382zQcpvC5GsOmrZaWd3scQD2qkLM5ryUYc5jdGjWSTqr7MKGPJqSoC
         veVP8Ldd1FUs5AbVYRjsgDObcfoar6S9PoeacNndQ0FPe/y2ajef3OD0jBFK4v2tlGQf
         Zi4OJ0YOkjRuM8F0AncJA2bLJYexP05mEvA37tnLAsnLrst7JcNSZEnLWyJDaNZvg7mx
         Lv3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788965024; x=1789569824;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZae71d9OhtBZeeJosXyHI6vXicBpHlGo44Y/4JegXY=;
        b=DquxZsoj4ZHAYt/D2HsnuNomRRUsS/JXRkCBsZmIuUVg1Jb1pAj8XKDh7qBngsxSar
         OJNoap4gSya0LsEvNi5grtWibDPixx4bdBVsNCBkvxwc/f4nnkNAsObUL1HU3jQ2KlDJ
         qfYX/RNyHTN5r+E7ytcdRG/GL/JTNdUMm2Mx1Gh8NYvak+ULPVT/sdDfZHO9t0133Yh4
         QxVAGDX1hWPWhZ4TCy5gOAQKYBHxQFG02v+AFWe6JG7RpOgm7jyejFI99i8r6PzlL5bi
         qWKqbkBz6TDQQvsK/X+ExYyJlnp5s6H2CsKPPUm6hvMRuEPEn40nPjboBI4pihS89DTk
         kBBA==
X-Forwarded-Encrypted: i=1; AKwUvByQ/bk8VWc1IkcuMJuZnBmW9QZgBdl/TVxS7HvhZia/lnyB69zszv88xy4btWysBtKhHKlsRfmFBKZK4ns=@vger.kernel.org
X-Gm-Message-State: AFuF++kyhrXqU0xQ3Pd8n7KNvTjUlDyN/Q8hQdOMPoL0pZMuY/LvaUPO
	HDNuvDoNv5Px/24l1YlSbz2JlyygSVbYHQd5ZMZbiIfYXFY9UVd+kciS
X-Gm-Gg: AYBFou3DS01R7UgY3WnnyBHoSaZ9ZeEa4W6JCw8fKXudldxE81cvy/nqaDqaPM/ryyM
	7t4ySzGrgXyC6+r83fnJvQQxtT80gNSaY4A/fuCwIPxtJCmptbr+pArk+3i9JMXCXxh0dzLLVOS
	FvpKkFj3Q2XXAoW6NbBt/VNzNW5OVPtqMwkFrhKUhWdZMxEDgQh1RGdoe58p8TOL5LFhT+fYtKr
	FeUOvd0gE/Wbk0AkNXD7TCwufSbmhgkIAe96p+wtMUtgsgyiyUegpdYrgeZvmEbdqTTFuvepGld
	jR1BthyItRG+KKewiWsjU5chuSZT3UQRVrsx67eRe3us+W7FndhBgPoxitZOOzjgRjS8nyiUN4w
	A/3CbLIi53vZBR9J681iDFYTsYk8fyLkfb0mO5RNflFoVWB+vPEs9pcWUgifeqCQoj0YYNyH/UF
	wQ6WO2Ss96Ux4bmLvOOgI0wmUpkIlXQAgcdnje1zyAkiZAQdwuRN8O8tZddKt/8inl6mBKF0uHW
	KcAE8an8t8vB0ncvmFx
X-Received: by 2002:a05:600c:3543:b0:49c:e3c3:5efd with SMTP id 5b1f17b1804b1-49d1f354321mr93264125e9.9.1788965023436;
        Wed, 09 Sep 2026 07:43:43 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6158e9sm562802765e9.12.2026.09.09.07.43.42
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 09 Sep 2026 07:43:43 -0700 (PDT)
Date: Wed, 9 Sep 2026 16:43:39 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: gregkh@linuxfoundation.org, mathias.nyman@intel.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 parth.pancholi@toradex.com, francesco.dolcini@toradex.com
Subject: Re: [PATCH 3/3] usb: xhci-pci: Put PWRON_POLARITY on a defined
 state
Message-ID: <20260909164339.7252469b.michal.pecio@gmail.com>
In-Reply-To: <20260909125842.528340-3-festevam@gmail.com>
References: <20260909125842.528340-1-festevam@gmail.com>
	<20260909125842.528340-3-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  9 Sep 2026 09:58:42 -0300, Fabio Estevam wrote:
> Currently, TUSB73X0_PWRON_POLARITY is set when the
> "ti,pwron-active-high" is present.
>
> However, when "ti,pwron-active-high" is absent, its status could have
> been set previously by a bootloader or by a previous running kernel.

or by EEPROM.

Do they bother to put the chip in a wrong, non-default state at boot?

> To make the state of PWRON_POLARITY deterministic, always write it
> when the "ti,pwron-active-high" is present.

That wouldn't be too dangereous, but...

> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  drivers/usb/host/xhci-pci.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index 75aa679f7d79..833c55c3213a 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -684,10 +684,16 @@ int xhci_pci_common_probe(struct pci_dev *dev, const struct pci_device_id *id)
>  	dma_set_max_seg_size(&dev->dev, UINT_MAX);
>  
>  	if (dev->vendor == PCI_VENDOR_ID_TI &&
> -	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0)
> +	    dev->device == PCI_DEVICE_ID_TI_TUSB73X0) {
> +		u32 pwron_polarity = 0;
> +
>  		if (device_property_read_bool(&dev->dev, "ti,pwron-active-high"))
> -			pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL, 0,
> -						       TUSB73X0_PWRON_POLARITY);
> +			pwron_polarity = TUSB73X0_PWRON_POLARITY;
> +
> +		pci_clear_and_set_config_dword(dev, TUSB73X0_USB_CTRL,
> +					       TUSB73X0_PWRON_POLARITY,
> +					       pwron_polarity);
> +	}

... isn't device_property_present() missing here?

Also, I don't know those DT rules, but doesn't "ti,something" imply
that this must be a TI chip, no need to check IDs?

Regards,
Michal
