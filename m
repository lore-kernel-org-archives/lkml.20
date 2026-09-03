Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A4114FDE5F;
	Thu,  3 Sep 2026 17:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788458163; cv=none; b=Og4kTCNPeyOrtQG4h9qYuXr+xUE8q1DZecZuCUh5+qW0KG/CxBdplBdNd1WVl+xHl4oFi94M5ccwZMiEJTKQEYR/PnERm5R4JFIEmtdkR5sXUJ/jY0RaZTzS+v/QBFG4XTVgm+ugAk4pKnx85yCVhmp07X0aXz7iT4nWuWAFjI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788458163; c=relaxed/simple;
	bh=sfXom1ivoAe+etXrBUYyLT2U/hJeVJhTm1pbJcdw35w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=horlp2eTqeIAZTXexbdaf/dX/JtWcTs3ICixxSREcGkCbo6BKlQ4kd6opSNbSyp+PvRdA8NGdblsZCQWt68hteyKGhO0g3bLmXNfCICFB5lsdbw3Mz5voe+GR7ScOZ6kBVw82OK91ThOdaO+I2dwCXqBqEKxWkK+dlY0jUtphB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=mFjQFi3i; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="mFjQFi3i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1788458154; x=1789062954; i=wahrenst@gmx.net;
	bh=3roe8Ng4NJTO16r4A3+rVJKovF7kyFWXB/Do7RUIUeE=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=mFjQFi3i4QiAxv3jY4F98BrA5CT6YvD9swpDedd9/oSSGfDSziT+oTcSJyVjrzts
	 d1evph9SDul/aa+NhQdg7eR/CA89ILpUx65P/99zCXTq58vkLWShlBJS0cdSHKEJi
	 xS7uBl0NkSQt/LlMaKoCJC7sSdctKKBqRJoEo6fCV5Tkqn5ID5hNs2zRndCYYEdFP
	 l6tbDsQCW0jCEPdpCIhPb0pCwREzRSrZ6SpREoeSu1uIFC+IPBymPmbQ9jbqRjsmL
	 rHrlmUD7BzYC2rCFJ070ZaOo06zgkQ4jRcY88dNWiLU1IVFg8WuJy3U25FE2xSiIs
	 JON5TZRfpoPHOrzubw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MiJV6-1wQ5AF3tFm-00eYsx; Thu, 03
 Sep 2026 19:55:54 +0200
Message-ID: <95058f69-9d38-4367-aa8c-dffb0ea0ee54@gmx.net>
Date: Thu, 3 Sep 2026 19:55:53 +0200
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Eric Anholt <eric@anholt.net>
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
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:1sD70n8RviNjaoPpNOlqZON7E6GWVg/L24jNbZziqNLUHRrejJy
 hPna4Xcou4bjAzK9o7uKjBZfzgvpAM/zKglBdld+LzwIIL4Z57Tw2hbr7zqQ+rU4w/K2Dpc
 qgNPUa8zbBXYeEbDfdRp2+5YM+jxFgh7eTptneiY5OBsuKv3cXi4U7i5qNuNceNqDfz6Rec
 Ru9NygTT1oa7MKZj8aFCw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:/4772Nq1n/I=;iil9k5jZXbUB2b+yil5S04iZiCn
 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

Hi Gregor,

Am 03.09.26 um 16:48 schrieb Gregor Herburger:
> The Raspberry Pi firmware has a tryboot mode where it tries to boot from
> another partition. This can be used to create a A/B update scheme.
>
> To enable this on the next boot, the RPI_FIRMWARE_SET_REBOOT_FLAGS
> message must be sent to the firmware. Add support for this by
> registering a reboot mode driver.
sorry for the delay.

Do you know the consequences in case the firmware doesn't support=20
RPI_FIRMWARE_SET_REBOOT_FLAGS ?

Best regards
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
>   drivers/firmware/raspberrypi.c             | 40 ++++++++++++++++++++++=
++++----
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
>   	  This option enables support for communicating with the firmware on =
the
>   	  Raspberry Pi.
> diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberry=
pi.c
> index 0aa322e9a2e73..2a0c40b8052e5 100644
> --- a/drivers/firmware/raspberrypi.c
> +++ b/drivers/firmware/raspberrypi.c
> @@ -14,6 +14,7 @@
>   #include <linux/of.h>
>   #include <linux/of_platform.h>
>   #include <linux/platform_device.h>
> +#include <linux/reboot-mode.h>
>   #include <linux/slab.h>
>   #include <soc/bcm2835/raspberrypi-firmware.h>
>  =20
> @@ -29,6 +30,7 @@ struct rpi_firmware {
>   	struct mbox_client cl;
>   	struct mbox_chan *chan; /* The property channel. */
>   	struct completion c;
> +	struct reboot_mode_driver reboot_mode;
>   	u32 enabled;
>  =20
>   	struct kref consumers;
> @@ -273,10 +275,37 @@ static void devm_rpi_firmware_put(void *data)
>   	rpi_firmware_put(fw);
>   }
>  =20
> +static int rpi_firmware_reboot_mode_write(struct reboot_mode_driver *re=
boot,
> +					  unsigned int magic)
> +{
> +	struct rpi_firmware *fw =3D container_of(reboot, struct rpi_firmware,
> +					       reboot_mode);
> +	__le32 fw_magic =3D cpu_to_le32(magic);
> +
> +	if (!magic)
> +		return 0;
> +
> +	return rpi_firmware_property(fw, RPI_FIRMWARE_SET_REBOOT_FLAGS,
> +				     &fw_magic, sizeof(fw_magic));
> +}
> +
> +static void rpi_register_reboot_mode(struct device *dev, struct rpi_fir=
mware *fw)
> +{
> +	int ret;
> +
> +	fw->reboot_mode.dev =3D dev;
> +	fw->reboot_mode.write =3D rpi_firmware_reboot_mode_write;
> +	ret =3D devm_reboot_mode_register(dev, &fw->reboot_mode);
> +	if (ret)
> +		dev_err(dev, "Failed to register reboot mode: %d\n", ret);
> +
> +}
> +
>   static int rpi_firmware_probe(struct platform_device *pdev)
>   {
>   	struct device *dev =3D &pdev->dev;
>   	struct rpi_firmware *fw;
> +	int ret;
>  =20
>   	/*
>   	 * Memory will be freed by rpi_firmware_delete() once all users have
> @@ -292,7 +321,7 @@ static int rpi_firmware_probe(struct platform_device=
 *pdev)
>  =20
>   	fw->chan =3D mbox_request_channel(&fw->cl, 0);
>   	if (IS_ERR(fw->chan)) {
> -		int ret =3D PTR_ERR(fw->chan);
> +		ret =3D PTR_ERR(fw->chan);
>   		kfree(fw);
>   		return dev_err_probe(dev, ret, "Failed to get mbox channel\n");
>   	}
> @@ -302,9 +331,14 @@ static int rpi_firmware_probe(struct platform_devic=
e *pdev)
>  =20
>   	platform_set_drvdata(pdev, fw);
>  =20
> +	ret =3D devm_add_action_or_reset(dev, devm_rpi_firmware_put, fw);
> +	if (ret)
> +		return ret;
> +
>   	rpi_firmware_print_firmware_revision(fw);
>   	rpi_register_hwmon_driver(dev, fw);
>   	rpi_register_clk_driver(dev);
> +	rpi_register_reboot_mode(dev, fw);
>  =20
>   	return 0;
>   }
> @@ -321,14 +355,10 @@ static void rpi_firmware_shutdown(struct platform_=
device *pdev)
>  =20
>   static void rpi_firmware_remove(struct platform_device *pdev)
>   {
> -	struct rpi_firmware *fw =3D platform_get_drvdata(pdev);
> -
>   	platform_device_unregister(rpi_hwmon);
>   	rpi_hwmon =3D NULL;
>   	platform_device_unregister(rpi_clk);
>   	rpi_clk =3D NULL;
> -
> -	rpi_firmware_put(fw);
>   }
>  =20
>   static const struct of_device_id rpi_firmware_of_match[] =3D {
> diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bc=
m2835/raspberrypi-firmware.h
> index 66cc5a426c3c5..f905bff0fb3ea 100644
> --- a/include/soc/bcm2835/raspberrypi-firmware.h
> +++ b/include/soc/bcm2835/raspberrypi-firmware.h
> @@ -81,6 +81,7 @@ enum rpi_firmware_property_tag {
>   	RPI_FIRMWARE_GET_POE_HAT_VAL =3D                        0x00030049,
>   	RPI_FIRMWARE_SET_POE_HAT_VAL =3D                        0x00030050,
>   	RPI_FIRMWARE_NOTIFY_XHCI_RESET =3D                      0x00030058,
> +	RPI_FIRMWARE_GET_REBOOT_FLAGS =3D                       0x00030064,
>   	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =3D                    0x00030066,
>   	RPI_FIRMWARE_SET_CLOCK_STATE =3D                        0x00038001,
>   	RPI_FIRMWARE_SET_CLOCK_RATE =3D                         0x00038002,
> @@ -92,6 +93,7 @@ enum rpi_firmware_property_tag {
>   	RPI_FIRMWARE_SET_SDHOST_CLOCK =3D                       0x00038042,
>   	RPI_FIRMWARE_SET_GPIO_CONFIG =3D                        0x00038043,
>   	RPI_FIRMWARE_SET_PERIPH_REG =3D                         0x00038045,
> +	RPI_FIRMWARE_SET_REBOOT_FLAGS =3D                       0x00038064,
>  =20
>   	/* Dispmanx TAGS */
>   	RPI_FIRMWARE_FRAMEBUFFER_ALLOCATE =3D                   0x00040001,
>

