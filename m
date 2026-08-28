Received: from vps.xff.cz (vps.xff.cz [195.181.215.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA61348C54;
	Fri, 28 Aug 2026 18:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.181.215.36
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787941406; cv=none; b=NtehCCuYA3eDUvu6y7qgDb58vV31syC2JDN++l1+FQkFZmaZ8OfzFq+rDWGzxstZEr0fDPTbdjk6XIC4Pu3Sl8IbmBs3DZLwWdNqYY0mzRBfff5SLMq6JzOOJ/JL/k/ng4e5YLuLAjx+MAyvllQ5aWapCmrHFaqn8dl9KHAXkds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787941406; c=relaxed/simple;
	bh=2RFYSoKqJGT22zGyrVvSjO5r0HE8KLA3Lsz81RRvCco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AlMeHYv6wLaIhv21kWtKe9PxeTSNG1aC2cF+Q28p5dIi6iwtIzyIgKRaSduJxiwFjNOYh4EomHxEN96T3hQg7t89Md0Yj4IBeijmla7RW6jFWMPEh0e+4ktapZPLf6cpuWTMTv9IxBjORz4ItZr7QpZYjnYrFIcXGiuSixZXsaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz; spf=pass smtp.mailfrom=xff.cz; dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b=IGZ5KSFr; arc=none smtp.client-ip=195.181.215.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xff.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xff.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xff.cz header.i=@xff.cz header.b="IGZ5KSFr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1787940991; bh=2RFYSoKqJGT22zGyrVvSjO5r0HE8KLA3Lsz81RRvCco=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=IGZ5KSFriaQOtZwgxgbqYc1rTdQgmyhzRNaXU9M8etcO4Hw/un9ymroy6m+cTkI+A
	 Y+UPoWhS8O9But4Yb22yMjXb0SWwVWss8j3FK9P9QgS5AsSLm43+UMoCdw5JvM61To
	 BuZApJSz83W1JkrPx/Rtte79CKITGdF4VHm4Xkoo=
Date: Fri, 28 Aug 2026 20:16:30 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: muzafferkadir@mainlining.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx258: Add reset-gpio support
Message-ID: <ccydtgy5lwhesdlg5mtbxllwfcnzhm3k7g6m5xyyhprwizooof@s7qrku6yvqlk>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	muzafferkadir@mainlining.org, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, git@luigi311.com, pavel@ucw.cz, tomm.merciai@gmail.com, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828-imx258-add-reset-gpio-patch-v1-1-633972d2a700@mainlining.org>

Hello Muzaffer,

On Fri, Aug 28, 2026 at 01:51:47PM +0300, Muzaffer Kadir via B4 Relay wrote:
> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> reset-gpio is already documented in dt-bindings but never implemented
> in the driver.
> Reset deassert delay comes from Luis Garcia's and Ondrej Jirman's patch.
> 
> Link: https://lore.kernel.org/all/20240602201345.328737-22-git@luigi311.com
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>
> ---
> I have a device that is not upstreamed yet (General Mobile Shamrock)
> whose camera needs reset gpio to probe, it is documented for
> dts check but not implemented for some reason.
> With adding it rear camera on the device probes correctly.
> 
> I created this patch without knowing the older one that submitted
> before: https://lore.kernel.org/all/20240602201345.328737-22-git@luigi311.com/
> 
> I don't fully know the correct reset timing so I was using a random wait before,
> after I discovered existing patch I reused previous work for delay time after reset.
> ---
>  drivers/media/i2c/imx258.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx258.c b/drivers/media/i2c/imx258.c
> index bc9ee449a87c..af3f12c7452a 100644
> --- a/drivers/media/i2c/imx258.c
> +++ b/drivers/media/i2c/imx258.c
> @@ -9,6 +9,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/unaligned.h>
> +#include <linux/gpio/consumer.h>
>  
>  #include <media/v4l2-cci.h>
>  #include <media/v4l2-ctrls.h>
> @@ -681,6 +682,7 @@ struct imx258 {
>  
>  	struct clk *clk;
>  	struct regulator_bulk_data supplies[IMX258_NUM_SUPPLIES];
> +	struct gpio_desc *reset_gpio;
>  };
>  
>  static inline struct imx258 *to_imx258(struct v4l2_subdev *_sd)
> @@ -1128,6 +1130,18 @@ static int imx258_power_on(struct device *dev)
>  	if (ret) {
>  		dev_err(dev, "failed to enable clock\n");
>  		regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> +		return ret;
> +	}
> +
> +	if (imx258->reset_gpio) {
> +		ret = gpiod_set_value_cansleep(imx258->reset_gpio, 0);
> +		if (ret) {
> +			dev_err(dev, "failed to deassert reset\n");
> +			clk_disable_unprepare(imx258->clk);
> +			regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
> +			return ret;
> +		}
> +		usleep_range(400, 500);
>  	}

There are two times given in the datasheet. min 400 us between reset deassert
and ID register read over CCI. And minimum time between deassert and stream
start, which is 12ms.

  https://xff.cz/dl/tmp/b8efc244280a2b35.png

  https://xff.cz/dl/tmp/ed9b967a140bd347.png

I wonder if this driver satisfied the second constraint. That may perhaps depend
on how userspace uses it.

Best regards,
	o.

>  	return ret;
> @@ -1138,6 +1152,7 @@ static int imx258_power_off(struct device *dev)
>  	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>  	struct imx258 *imx258 = to_imx258(sd);
>  
> +	gpiod_set_value_cansleep(imx258->reset_gpio, 1);
>  	clk_disable_unprepare(imx258->clk);
>  	regulator_bulk_disable(IMX258_NUM_SUPPLIES, imx258->supplies);
>  
> @@ -1382,6 +1397,11 @@ static int imx258_probe(struct i2c_client *client)
>  		return ret;
>  	}
>  
> +	imx258->reset_gpio = devm_gpiod_get_optional(imx258->dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(imx258->reset_gpio))
> +		return dev_err_probe(imx258->dev, PTR_ERR(imx258->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
>  	ret = imx258_get_regulators(imx258);
>  	if (ret)
>  		return dev_err_probe(imx258->dev, ret,
> 
> ---
> base-commit: db2ddb87143519e20a95aa36c60b36107b736a58
> change-id: 20260825-imx258-add-reset-gpio-patch-c438dd35f9cc
> 
> Best regards,
> -- 
> Muzaffer Kadir <muzafferkadir@mainlining.org>
> 
> 
