Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFDC4B44D4
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791875428; cv=none; b=ragqoUJCN0lMCSj2q3hieZ+hZ+svbc7cLzDjs3GVoJabVNKwcqQa3xnaGUBIHI62C8mcZKrOF2CYOn9+jxjk4rcJPK15UZ8nhRtjUoIqRoUG/FiZoC8/SMdCvATMYB4CUulfyjSOXx3DdwGu/9jv1NWzJjkfaHhdYy1E9osAx7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791875428; c=relaxed/simple;
	bh=YC4l7vs6phBF/kwZPYqd6bhtkTN6nnOLPDyVW74IR1o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QiK1rvA+8fWowf4Gur0+w7WOzPgBcJzcKl9kD0PnnBEE/Gpl6noLzNPId1zTvMMwjEclZp1ijZ59Rsm/OIMFLjw9muCN73zpjlqQR8FrKSoBAva/qfYQdMFO5En7l8OHWKwHnC1LAtCEuyMWOvDgQM1BYBa0FlsoZT+Ehf3QXXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YdUCZbR5; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YdUCZbR5"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba357a1929so2135274e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791875425; x=1792480225; darn=vger.kernel.org;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YC4l7vs6phBF/kwZPYqd6bhtkTN6nnOLPDyVW74IR1o=;
        b=YdUCZbR59sndgbI3P34/lHcO0G/fRRWAKHnvwtv94VTPjZnZwGfRN6MF77V9+Z34Vr
         mosY+lnsCjFgdSKG40s3y8h5D2kjIBqCcWkYPE1pzTu+kj16pGHGgVZrvEOuuKapbrtl
         Y4XcCywfKx0jahc7aAC0E3D7Vf6PGw3v36vg/Fv8YKc3dOELhaIRVENBD9FUnY7Z37n6
         6vV0Mv4adKPXAdIULtb01BJhzr0QZVn1fsfSCzRKZVv79/iQt2xUDFfvDyWEwjbxIlmb
         yznhDisbxu31BTE09Ai2YmX24chIlY7OpbHApiCZN9LCUv3/GynuhMFaBRQxcTIuf4xL
         FFpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875425; x=1792480225;
        h=content-type:mime-version:content-transfer-encoding:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YC4l7vs6phBF/kwZPYqd6bhtkTN6nnOLPDyVW74IR1o=;
        b=CeZhHpmHdRvQ5pEdW2REhIizpfJZ4LGjlZ8lvcNjsVciasRijGYGSJ8zvb1yBuZSWx
         w4kLL+ynqlRNzvkMZkI+fTJPH3WQdM1zAyoZF85woPBmCsMuJbYiYLNEqtJ8n7qGyKkA
         R37FSvnZehidsWpLlOL2Y6XkHEVJj52Z8/c8rsyPUFyxNdrZJs1lJ7rZV0UygdDWH7A5
         8XuaGcks7E2cExa36CgvGpc1z4Ufnc7rkuFZ0fuf7P2dChTcUJTZqr8R+NX6oRcjg7Y3
         fiF+i5P9QHIlrC3d3xAF8JoU23H3sy2EfkzpMiY+mjlhe0pUqVsBmTexQI1ntycIdQhc
         /vqg==
X-Forwarded-Encrypted: i=1; AKwUvBz2ohdq+IGSEWzrPU8VBi59E/cT7Rbj9iw+S/+h7wQ+JVnynE9glh6U7WBKEx6/RmOmRXRQNZq7+FO7OiI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJw7c5o1aMzZWcIR8ViU5fVP5HWGPH/qxnx7qQzB473juhWFje1
	lVdwTLeET0cbzE+SNTmgx5mmH2BANN62mGcMe/wp/zlD/bLW00UgPv4qED4HJIsQJVnfcg==
X-Gm-Gg: AYBFou1wF+I9NlCuKM4AFpCWjJLtiU7pu/P9hbQH7eLSQKm7ALIsr5N8LxWuhvmJ+sS
	pvsKe8tAhlhL7HX2nhmJShEVY9+fRSvSpIBB5bNlLALEG6lht+KWWokUnh1te9LrGw3PoCTnGnJ
	Ofg7kjCxTc5/3fIRN3vvxxk9SXDF9RXSHnEKOTBQsuT5NpuEGdprvr/MnK6r1gnwkHSTW2vKZHJ
	Z1O8x/H9G0ueWYI/SGLdlP9qn4P8JnpF0qz0Ym+VEQsNl1zMqDXlRQybdDP/Jc2TMtfbg9GNk7i
	Uhj/CxQwzYp/EF0/7KpBzGcEjj7of/BePHCWRag+W3Anh0m+Nyf+Qfp61kyZbSlAm6tb9YMPua4
	OF+XR4LmlIXIoWKyNYWfXfMspUHzAOAKC9PCPpyepFgVUQfBBU5hxZp9QctWrPkuzBSS49764WY
	aggzhPr+0XIEsblNvbs/ALwMT0nslWy71A+7yjZ7pbSILQNCHd5ZNrlv9uaukK3XDZ0198RqEmL
	1L+nR8A8oXV2nEvm5ZFt27UvB7/OiL9a8FgarDdTEO9osjp0SSa5G0j
X-Received: by 2002:a05:6512:3989:b0:5bc:b15d:beb9 with SMTP id 2adb3069b0e04-5bcde6c3067mr3863262e87.29.1791875424914;
        Tue, 13 Oct 2026 00:10:24 -0700 (PDT)
Received: from [127.0.1.1] (ip-024-215.users.dtel.ru. [91.210.24.215])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36114sm3388236e87.1.2026.10.13.00.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 00:10:24 -0700 (PDT)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-watchdog@vger.kernel.org
Subject: Re: [PATCH 00/11] Cortina Systems CS75xx: interrupt controller, GPIO,
 I2C and TWD watchdog
In-Reply-To: <20261012-dreamlike-hazily-19bb60326f0a@spud>
References: <20261012-b4-cs75xx-s2-v1-0-8a7641b7b79c@gmail.com>
 <20261012-dreamlike-hazily-19bb60326f0a@spud>
Date: Tue, 13 Oct 2026 10:10:22 +0300
Message-ID: <179187542217.3247897.4323160442877168450@gmail.com>
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="fixed"

Hi Conor,

Sorry for the late reply, and for sending v2 and v3 without addressing
this - I missed your mail.

On Mon, Oct 12, 2026 at 07:48:00PM +0100, Conor Dooley wrote:
> I think what's here looks really suspect - regions of two registers
> wide, interlaced between devices etc.
> You mention syscons here, and really that's where I think that this
> should go. The region at 0xf007_0000 looks exactly like a syscon to me
> and should be modelled as one.

Understood. The block at 0xf007_0000 is the "peripheral" register block
of the vendor kernel: the interrupt status/enable pairs, the UARTs, GPIO
banks, the I2C (BIW), SPI, MDIO and timer registers are all packed into
it. Would you be fine with a "cortina,cs7542-peripheral", "syscon",
"simple-mfd" node covering it, with the interrupt controller as a child
node without its own reg that gets a regmap from the parent? The UART,
GPIO and I2C nodes would stay separate devices with their own reg, as
you suggest below.

> I think it's fine to make a GPIO controller at this point, and leave
> pinctrl to later, but I don't think that it is acceptable to pretend
> that the mux registers are part of the GPIO controller. The pinctrl-less
> GPIO controller would have to either rely on something else (e.g.
> firmware) setting the mux registers or be not entirely functional until
> the pinctrl arrives

Agreed. The next version drops the mux register from the GPIO binding
and driver and relies on the boot loader's pin mux. A line that the
boot loader leaves muxed to a peripheral then stays unusable as a GPIO
until the pin controller exists; I will check which of the Almond+
lines (reset button, touchscreen interrupt) that affects before
sending, and leave those out of the dts if needed.

I will not send it before the interrupt controller question is settled,
and not before 48 hours have passed in any case.

Thanks,
Fil

