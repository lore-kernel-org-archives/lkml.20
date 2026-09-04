Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2809043FD0B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788517818; cv=none; b=XOKV2rz8UdURMcqhHebNM4cTNMpzgR6HR8nKZI8bAr5VxX2puEIJyq95fJ3JX4CwodF1l/qsx7dQ06N4n7CnPLT3h55TlCvloXONM0hosqA4mS7ahGjBXLBjUdf9rYgem6q3kTLxFnfQesEXP+HNi1wX1tEAL8sg6FxQvyqDGz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788517818; c=relaxed/simple;
	bh=uVc0Haysmuy6CvaFK+dk8qOhVOt4yNfT0/lEf2bvims=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ze3JdUkj1MrEBCpaEcd+BNchy/f/ydIGsOc+whnQeZdKM3Pjr1cQ8r2W5Y7Sr3N8P+6QiKqYsNrazOTC5UnCQ6edkKuwn57XfDPXGfGYZ+Bado93R0iTDoteicx3kATXCfwOx29JGKV4gGCtMHUKrLOBT6E9STDa84RIrpv3ERM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=b/ki3fYX; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="b/ki3fYX"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so11363185e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788517813; x=1789122613; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cZQTL/pBpcVt07rJQmd4UdoWGK2B3BL5sj1p+ycgeVo=;
        b=b/ki3fYX1t4yYV2hW8vSywi+rFbVqvfkl3hGMS7ftZIqHJXy9ZK5aRpwnKVufeNMpK
         MD/DhW95IebR0eL7lFV3SDPM8/d5jJYcTTGCyJnV/6pH0AaUQnQszjBjIWEtLrlsZacN
         A5A2reM7wGWkjU9HRfFKkri+P9MZeuOdT1GspZSUmQIJ8juywrjEmS31uIze6HyCi+9Q
         ng5mQtElxqNxqkjSW8OGBEoBg8WpWFxJSFK8MAnL6oBxzV/Jd1TBIuEy0swwyUYZcB5t
         TRblCNqaCOaLV1H7TMXi/UVyHm742YZMqPsvkUUiKr8n9e0jrfh0s0RlNn9CMMU3LnbT
         sfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788517813; x=1789122613;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZQTL/pBpcVt07rJQmd4UdoWGK2B3BL5sj1p+ycgeVo=;
        b=NXf4yWvpTUkia5MIy5InhrWZP/Do6t10QT58HkWJMZUTay2bgLxOYkMSfyKXOdyTos
         z0dyE3m7XJzpnM9TrEMAVY5v//MJm+fMtaVxOj7qt5lMplBU+ohxgY3qwmDQ5rT42O5i
         EJbXNaQ05CfU8SlQ7nfoOnDhzw/3U2VxhyyTnDuUu4ZgV5ioSk+SuvNV/Lksd5zVi9CA
         lvdk90TFqes7U9pEeN5vQCE+vXB5AlDSZxiiBbWaESgmKwEqOjVufLF9c2R22ImdK/SV
         WhiLPJIZ5sBU+QWx7q1QEFq7ua6mjQix+TWU/VlRxTK2eeYS+2Og5EVyS0YSGxeluahf
         C8HA==
X-Forwarded-Encrypted: i=1; AKwUvBxwIB1eREQff8xxBMbDMBvUGLLq9f//eJpmWVbosReTPhN2zL+8FGkIEufJD0Tr1H2/oHKDQGnXYPCRwMA=@vger.kernel.org
X-Gm-Message-State: AFuF++myJ6JGjKwUT31bRFaEtve1cn1DnOzM855u9V39fSH+XH8ZtQlX
	1oGGaVDUW15GnIRnnSztPoEy6+x5GGChJVOdKvrDG2biINQEx4+Cf5uVIFAtR5CQlEk=
X-Gm-Gg: AYBFou3kP11lR0c0oq5YusLOKdQoD70M7EVk2LKNqnEIYQLAptg0FDVbcI1BxNcagLZ
	jzcUY9BXNpIUcQHqHr8VDbGpN8Cjc7pScJXs81is255vgaCc+1LyfZ+q/zM40IZw8ZVxA6iXaHg
	Z2mFed1oAepbkzmf9cg2gG0u5KnwQgOEiA+XETXgKfp/0uwe93oX45Zi5GzoV52WWJHpOWvm37t
	QVUuq62mbdJbRqF+sjHtTXHVcUxlmmMcSwHZRtiJ1ivCb01piH/fGL5JlxMaLE/44TJXwFbrL7f
	8IieKuJXytgUL+d8ksCoJRxVuasXmUcqUtm9nxG8oJhSHd+usTEKqT9MAUCOxorf5+FXIOHfDAI
	1g0cK+FcllgN8z9SHXLtPShD1IPpic+JjsuPfJprxCQp9aAB4njTr1xJVSDZlnCZqOdG+NNASRn
	a5c3Qeb3ojaJVxF4EK0MdJE1bAfStkqo6TB2qR30RQvMgQMKMC5gU8F5Xssg==
X-Received: by 2002:a05:600c:8708:b0:49c:fa21:1c7c with SMTP id 5b1f17b1804b1-49cfa211d48mr27435135e9.17.1788517813094;
        Fri, 04 Sep 2026 03:30:13 -0700 (PDT)
Received: from localhost ([194.183.24.73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883c5bc5sm5567744f8f.24.2026.09.04.03.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:30:12 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Fri, 4 Sep 2026 12:33:51 +0200
To: Gregor Herburger <gregor.herburger@linutronix.de>
Cc: Andrea della Porta <andrea.porta@suse.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: dts: broadcom: bcm2712-rpi-5-b: add spi0
 interface
Message-ID: <apqej5QyjOHu702A@apocalypse>
References: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-bcm2712-spi-v2-1-6f8fdfb030bc@linutronix.de>

Hi Gregor,

On 11:24 Fri 04 Sep     , Gregor Herburger wrote:
> The Raspberry Pi 5 routes the spi0 of the rp1 chip to the pin header.
> Add the rp1_spi0 node and its pinctrl node to the devicetree to enable
> the spi interface.

Just a nit-pick: in the comment it's stated that the spi interface is enabled,
which is not true since rp1_usb inherit status="disabled" from its node
definition. This is fine because the user would probably want to enable the
spi interface through some overlay, so no need to resend the patch (at least
for me), so:

Reviewed-by: Andrea della Porta <andrea.porta@suse.com>

Thanks!

Andrea

> 
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
> The RP1 chip, found on the raspberry Pi 5, has nine spi controllers. The
> spi0 is routed to the pin header. Add the rp1 nodes and enable it for
> the Raspberry Pi 5.
> ---
> Changes in v2:
> - Drop first patch as it got already applied: https://lore.kernel.org/lkml/20260903194624.2038562-1-florian.fainelli@broadcom.com/
> - add cs gpios to rp1_gpio for pinctrl
> - Link to v1: https://patch.msgid.link/20260811-bcm2712-spi-v1-0-4c1708d354bb@linutronix.de
> ---
>  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 0fc57e72632ed..0de3d78100a5d 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -69,6 +69,20 @@ usb_vbus_default_state: usb-vbus-default-state {
>  		groups = "vbus1";
>  	};
>  
> +	rp1_spi0_default_state: rp1-spi0-default-state {
> +		function = "spi0";
> +		groups = "spi0";
> +		bias-disable;
> +		drive-strength = <12>;
> +		slew-rate = <1>;
> +	};
> +
> +	rp1_spi0_cs_default_state: rp1-spi0-cs-default-state {
> +		function = "gpio";
> +		pins = "gpio7", "gpio8";
> +		bias-pull-up;
> +	};
> +
>  	rp1_i2c4_default_state: rp1-i2c4-default-state {
>  		function = "i2c4";
>  		groups = "i2c4_2";
> @@ -94,6 +108,14 @@ &rp1_i2c6 {
>  	pinctrl-names = "default";
>  };
>  
> +&rp1_spi0 {
> +	pinctrl-0 = <&rp1_spi0_default_state &rp1_spi0_cs_default_state>;
> +	pinctrl-names = "default";
> +
> +	num-cs = <2>;
> +	cs-gpios = <&rp1_gpio 8 GPIO_ACTIVE_LOW &rp1_gpio 7 GPIO_ACTIVE_LOW>;
> +};
> +
>  &rp1_usb0 {
>  	pinctrl-0 = <&usb_vbus_default_state>;
>  	pinctrl-names = "default";
> 
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> change-id: 20260811-bcm2712-spi-644b70fee3bf
> 
> Best regards,
> --  
> Gregor Herburger <gregor.herburger@linutronix.de>
> 
