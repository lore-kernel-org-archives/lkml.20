Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445864F6462;
	Thu,  3 Sep 2026 18:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458911; cv=none; b=JK0FSaepZnu0WK5iO3SYoQcmiX5moPanMkJxXTRRbE6YeS/lFo8nKYUx6QkNkfepQBsElOMRRHlpNL7j8Fn4nTF2BYS3KHUgTLdt69i7ypsSC9YoDv6vftsHY3zrWbpSYsIxuaBoSSXVNEJu/lok890i4BUvbWyP6VplAD2rP8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458911; c=relaxed/simple;
	bh=+MuA+KQYFiQVCRmckwyn6HpghQmZsU89kDANw9fG4hA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MStdKhWVwbp6JsJ5ciqC3gDyIpjVbRfh7fVEsV+EqHX+40qdLYVaCMOurFk1xIW/OtyOElb06enrATsIxAmfX8pSIPab777qrKiCkL9mpT6rgoQIaruAGrhcdeNVU5DHZVbNJtBc1UXBjKGdK4Sn1PE8JUyHW+EfGqfMDGQAVe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=nYpWZzbE; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="nYpWZzbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1788458903; x=1789063703; i=wahrenst@gmx.net;
	bh=JnUgB1eMhX6Cp0XziuCeHm+S3ex9lO3radlwsfAGueU=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=nYpWZzbErXE3CGEZBOpy2ncsdFCC1NuTLOh3q1P+0n524qfR4ankErZspOYykScZ
	 mhj+LcYJ6YqT779DcwFeBd54Y2kxsix915ssckKpzUvrLjOfUFLNsTgpB3o4nAgjI
	 A4w1hDwrd+eu/55L3DjSwgqHm1khqmMpwDw2/Xgid9NDBibMqyL4E/2zuwuE2ms9L
	 50K/VlbbYO6omIbYVlVFdqPNaQ1d4grIRWzZYjU18Odi1dSgEjeObkd0sYmh8mw8+
	 J3m/iUBhA0aEzVSatDJyiPJuDMTCdnyv4FftimWw8kz24cJRQmtNYwx8H1/QvUr9R
	 SG2fG5kK8HcRqSlmtA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N63Ra-1wmgBT1O2a-017p9D; Thu, 03
 Sep 2026 20:08:23 +0200
Message-ID: <f85ebc81-c9e8-4014-bfed-66f9570eb1d2@gmx.net>
Date: Thu, 3 Sep 2026 20:08:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v3 3/4] firmware: raspberrypi: Add reboot mode
 support
To: Gregor Herburger <gregor.herburger@linutronix.de>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20260903-rpi-tryboot-v3-0-ce94c347e932@linutronix.de>
 <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260903-rpi-tryboot-v3-3-ce94c347e932@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:jNskIaBMKDcTzo3Zl6I9/I1cCpX/O0N//R/K4nCGTC9UJSm5anF
 V+P/FcKXLxpK6XQkuDRV+4U+i9xyEBm6Jadxg8DNGD+30JDYh2khRn/PMk/xj/sRY3sVFID
 lqPLkNhtANSuqUr2qANdKTnA3D4A9rZEtgpWiXOqKl3jmrrWUU9jF+xMJ8oK7lL+PD7Q6Bx
 ZjDjYlnl6KvYA2++oMvCA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:hOVo7hDy6Wg=;Vu2YyreP2Uji5l8Nkyx5xP8JtVo
 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
 sejK6e8OK53Z6exqtEvDj8qUPIvuu1d/POA==

Hi Gregor,

Am 03.09.26 um 16:48 schrieb Gregor Herburger:
> The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> another partition. This can be used to create a A/B update scheme.
>
> To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
> message must be sent to the firmware. Add support for this by
> registering a reboot mode driver.
>
> Furthermore, safely registering the reboot mode requires adjusting the
> teardown sequence. Replace the manually called rpi_firmware_put() with a
> devres-managed called (devm_add_action_or_reset). Without this, the
> cleanup function of devm_reboot_mode_register() would trigger a
> use-after-free error by attempting to access the firmware context after
> it had already been freed by rpi_firmware_remove().
>
> Signed-off-by: Gregor Herburger <gregor.herburger@linutronix.de>
> ---
>   drivers/firmware/Kconfig                   |  2 ++
>   drivers/firmware/raspberrypi.c             | 40 ++++++++++++++++++++++++++----
>   include/soc/bcm2835/raspberrypi-firmware.h |  2 ++
>   3 files changed, 39 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
> index bbd2155d84838..34605bf7c9734 100644
> --- a/drivers/firmware/Kconfig
> +++ b/drivers/firmware/Kconfig
> @@ -115,6 +115,8 @@ config ISCSI_IBFT
>   config RASPBERRYPI_FIRMWARE
>   	tristate "Raspberry Pi Firmware Driver"
>   	depends on BCM2835_MBOX
> +	select POWER_RESET
> +	select REBOOT_MODE
>   	help
>   	  This option enables support for communicating with the firmware on the
>   	  Raspberry Pi.
>
this part doesn't apply anymore. Did you rebased against 7.3-rc1 ?

Best regards
