Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794257638;
	b=i5J/IFU9RVxH7+QlV9uRlQwTAMGyVMNfwEfJ0gCtwwa9CA0FNuAP7/97A4iVEl+QwioI
	 2apDBo2VIUie5+iJyesgAJjMVDSqZYRHLtHCQdspYcBUiAePeEnSLMeTxWNxgYmEi1nIe
	 tzZViOOO5ubHOjGWy4uO945KA0jHP/CuIC30ShWRSBpIoEbb2BWsyo/Jio+Jh+4Sj3Zsi
	 W56kquIkPiXK302jpqZ6w7meNLzhIv/I7d3cLr3wqIjXU1mnNO463IvGLPf/W2h5LxhPO
	 Yx6SellTHZHPjcG41PImwYnGVObDPG6pxfBnNbHzpzd3+l6Ba3oLA/FdsDrxbPyTEGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=Jmt38VSybUfRmaDQpT1smyRUpyrHpCkYyLBz6czP0+E=;
	b=PH5Vii4yjXnHX9JP8sffKKn42fX1nPMcW/M0tByzx9gBy36vDyzGlwal9w+L3sSYYOEE
	 u6L3xjOAW7NNd3zK2GMWpUKuTiCLlUVZQ6XVZaEXC1/rdrw0HAyp9kr1+XU1DbVYeFEYK
	 gkVIfPXzbE/JkaerJoon0BfjpRNeVSxAfqnl8EaIz0Uq/ZQIVICB3ma2Yl1zrrrqs4jEk
	 aQ88qfde1HDlvhaVDdwVa/IqhGwuHUrR6I6Wyt4+6SkVE9UxQhUhf+DCplLzJpsHMs17x
	 qqtehKije9bs8NTfRI8gwCZtBAO8Q076y7AZy/L0nRKHj3FcYAiPVvbIpX7dqVetLSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfOffgL1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB4F606A326
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 20:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DB4F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OfOffgL1
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-67be1e468a8so914952d50.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 12:53:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794257637; cv=none;
        d=google.com; s=arc-20260327;
        b=e5Xz9SD2sWrRkbcSQtjw63nAjvE2RZAvWkOZEOxi0C0DiIOgme2bDeBBprYSlOhNfL
         Zbje0QPng6TdTIAD42PjHZJ+stCwjEx02bPt+JaSNBr6dYN/LCNJMQSURs6eiM5Enc7P
         X+HxpV+La4BNJnSvAjeh+ZXmK0FUxzNz1SFwg1lJ8Rq4LYsMHZP+pY74oBurfXrl+mHy
         IlywyUbJCvZoRgMYv7ZH1TvjaEDA3++0hhzFKMVQpdamnOd6xza5F8mBoIV4ji0kbQBA
         YeRDduzTnnoizXx99jcUAH6wfGv7Z72+iHksuozDvgONLGqvCHCtsGBjkKPkMTuGTVcQ
         w09A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Jmt38VSybUfRmaDQpT1smyRUpyrHpCkYyLBz6czP0+E=;
        fh=8hEKQF+Y+jeS0uRGqAC+S0ZnLvkR7QnwJyXBuRH2g0Q=;
        b=Eg2GUDpz/4noGdOc9EC7MZJc1dhGiKYy0UIGn5yfQccKiVjnfkenlNNvrL4KwSaFnO
         pSDZ9cT6HcaZMBp/3udIjf9qu2pdS+FlchoSL8zp9VQ9Bty0kQYay5Rs1iRoIbt/Xtw+
         Fi+rd/gibi4c4kSM0gAMVlVVkbVLYATTFCbuoyw1swlrKUvxV0IukOP6UVEJYBlZXnMy
         Dtnlixr51yOOvF4ZByqMbR5qoSixM7CwRgzYNYdiasw5mlsVEiQ12vcdntyt+l2VEjO/
         uBHoa9hiVjZ1DjBUG5EwHhOQWueR2VD0GcWpEpJ2mBDNCrBDQMBIlGuPa0Es6NOQ5lnY
         wY9g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794257637; x=1794862437; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jmt38VSybUfRmaDQpT1smyRUpyrHpCkYyLBz6czP0+E=;
        b=OfOffgL1e5pS9KApLqMKSOtYp/PiC4nEGAGeABKgi0XaPguyLagXG4iTOIObju11mY
         ROboINMPx18T8yjS+hrOxAcZ1PoOSowoXNRoXA+OAXblcktUcyiJTHd8rK9ki3QFOZVF
         HLcPhfhHUHFtyDCymVL9EXd7xgGfN2NY6SSME7K1lEUir1iBe8Gz8HsuA5Gx6IRihVKZ
         JCC7REJDFMQ/yNTOJ1OwLEeF16uJME3Se+a9A0tLVgaFLbBQDN9Cn2ObQjWvF/sagiO6
         J2jvlkVdlK5SiAY2XBpq4ImK0D5Hz8ApR0zoHw8hZTG3l3r1QdI56yeLarMivwmfYTZ8
         +WKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794257637; x=1794862437;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jmt38VSybUfRmaDQpT1smyRUpyrHpCkYyLBz6czP0+E=;
        b=Wsc3zRvbX15IobC2HLkFBcShkjXHEfgUU4CvHc6upe7RMX9Bec2J7wtaduDydoOEoI
         9PO440jrGu0/0r5ZJkKqmohx2rz5IYLeQF/qrC4zgAJ3fQhuSZYHTGyMWlxEymvmAsPQ
         5G0vXhjlrUoPssoxSIBWcnst1men03EmHpl7yiTz9/eq+3pW5YVRbfAAomNGZwx8zx4h
         C8a3EhOhHf6NW6t+uv4GgIbE6WP4pw0xbAYvqFCPhC6Z0VqGp9B2ThnV/RZI9PBRaop8
         QtXb7Zh8eFsF4PhgAbhjDssv48buJZUQGyR+ixSIpRQfRk3C9S9LzzTuSE0W8j4bHhex
         q2sg==
X-Forwarded-Encrypted: i=1; AL+hErGL16MJw2dbfTszB0nKmF5NGjhYAiB/dR6nN92GQN01Zc5hYUfZ/abuHdUTjfVQqGNGwv3mvWWefRfpz1E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SDz2LIll4yD+lYSTUQDENd8gxV6WCzFONa9IbV/z9VMsAO7vv
	SnuTzPJ/TmoYsT1rX9LEyNJwKOfpnO0cy7lYc3ZQPgMiA76N4rFGPZEaakXi+OCehRIEBaPXc5V
	X6fPnzHQHGqk4JNf/inkZv97IevvN+ec=
X-Gm-Gg: AYBFou07qTQI5fftXGSzmf23tfkFPwpMpdzTJko66MCanXIOaihrBa+CO5ew6FWCd0U
	ZMvFu5LSV9dm8PVo+1QlUKj6/jgQu4UF6r91i6jb4bc3b9xbNWicRlZpSfHaQS06MZvbg18akJw
	PLFJruaydJU+ERSGCdJnP4uM0aM9dKzJz13CVyX76ZVa4FBKiV6WUNdd12/2PP/cABotn+ysIeR
	jfEmXC538YX6c5ynerR6vU9uWObd/4LKvvkMAk18oqpCC7ftSDfrlPz7nVjn5eW7GROmeOR9VQG
	RcwXqo62nIVzqzE4wDahKfguKn2eT/yKN/DxZrmC5Q314oQTgPl1WdfsgQfZugq+iN/cVdJRMgo
	zwMhzTDLvA8GiOyeRi5MAVclMrBXcbJ60cr240IyhTqkYKWg+Wxo13USGMDuo/6qEGULAZ3+lvz
	uGk8AGT6vyN7bKS6xiaKjBFCv7bfaZw5TOmpstL0RWB/8W4PQz1ewDaXiUrpaogj/xP9hXx0REJ
	p2nzo8=
X-Received: by 2002:a05:690e:1442:b0:67c:c1d:e5ff with SMTP id
 956f58d0204a3-67c56156f8amr601035d50.0.1794257637455; Mon, 09 Nov 2026
 12:53:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104234928.86458-1-sidchintamaneni@gmail.com>
 <DS1PR21MB4279C556CFB876C5562C7F1182772@DS1PR21MB4279.namprd21.prod.outlook.com>
 <b660d79f-887e-4594-ba76-c45dc5f75435@linux.microsoft.com>
 <CAE5sdEhozq5SVj-SJLndiaANx1N_sTiAMBD0zeA_aafUYAGOKw@mail.gmail.com>
 <CAE5sdEi9iOwEmuhzWZ=O5u30UVCbCerckhggBqEY9qU5jBce4A@mail.gmail.com>
 <avBSrChTZTQL2rNj@shikoro> <avG91GDyffzeuBVg@ashevche-desk.local>
In-Reply-To: <avG91GDyffzeuBVg@ashevche-desk.local>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Mon, 9 Nov 2026 12:53:46 -0800
X-Gm-Features: AclHuK-KDMKaM_e9NpAk3xqUpIS_Ve35CQkQb83drMO2sX7vNTmcfNH71KM102c
Message-ID: <CAE5sdEg5YMcJd0nkej92VKWDK5kpCzfyXSf279Ri+k6y9r=qNQ@mail.gmail.com>
Subject: Re: [EXTERNAL] [PATCH v1 1/1] i2c: designware: Add ACPI ID MSFT0006
 for Microsoft Cobalt SoCs
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Jarred White <jarredwhite@linux.microsoft.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, 
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Allen Pais <apais@microsoft.com>, 
	"rlmenge@gmail.com" <rlmenge@gmail.com>, 
	"hargar@linux.microsoft.com" <hargar@linux.microsoft.com>, Jeff Kirsher <jeff.kirsher@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 04:34, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, Nov 08, 2026 at 11:45:00AM +0100, Wolfram Sang wrote:
> >
> > > For Cobalt, the firmware exposes the designware input clock frequency
> > > through the ACPI HCLK object.
> > > Is there an existing way to retrieve or configure this clock frequency
> > > through the ACPI tables, rather than hardcoding it in the driver?
> >
> > Calling for Andy here for being the designware + ACPI expert.
>
> We don't have the common way, it's unspecified. However, many drivers and some
> firmwares adopted the "clock-frequency" property. Unfortunately for I2C it means
> the clock of the bus, and not functional clock of the controller. So, I'm
> afraid you will need to have your own custom solution. Also makes sense to look
> what ARM people do in the same situtions (I know that Qualcomm tries hard to
> enable ACPI on laptops, if I was you, I would ask them first).
>

Thanks Andy for the suggestion. Not sure how to reach out to Qualocomm
ppl, I'll figure that out. I'll re-spin the patch for now.

> --
> With Best Regards,
> Andy Shevchenko
>
>
