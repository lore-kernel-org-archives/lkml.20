Received: from mta0.migadu.com (out-32.mta0.migadu.com [91.218.175.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F56377A88
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788374676; cv=none; b=jdXplogam0o7qKlKhHpU/kko4WUvibUH6hppoaGypRU8Br3PgWIR0nY57Wd1ASwL6szwZj4gkxa/XjaJhS8Sx61mBezgyVv5rDS9RH9DOlsGiUKzcxHoMh9oCwxZ1zahHoK+Hg+yz5tkmpADfdh3ZB72bnG+4iUM78Av3K/CUZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788374676; c=relaxed/simple;
	bh=Ddjw7zlj/BLJwb6pjd0HWKmTkFMwnn2l93RRQwHOEuE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIF00TOwaCtW4sEd3c1RhYXnXJUTQsAjJKO078DbW3RGNYnjFnnnjAnzwpiY2TO4y5nTCpPupaTcBH0dMtb7N/07l0R/3YUBartwjyR9zg7/zNoxgyaLEiDDN7MDvIbSZXtHTyw4hKbjDfqJziL/mTQZasaSnR4Zmm+YfErq6iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=SfK0qm0N; arc=none smtp.client-ip=91.218.175.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="SfK0qm0N"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Ddjw7zlj/BLJwb6pjd0HWKmTkFMwnn2l93RRQwHOEuE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1788374671; v=1; x=1788979471;
 b=SfK0qm0NelTwu4DeGejYEzykDYmVznEZmDIbHcFdO88q11Bf4wM4FnNPn23wfNY49pFBG15t
 JUck7+Y7lLjoXRdslLMlo1zw0zSba1/xLy19A8Akhrxchtb313K7EQBlyuTt+bZSOJqeiwBpciK
 wp6dSLHWZXooJ1m8Q8Ieaujs=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 394edada4a2bcfaf;
	Wed, 02 Sep 2026 18:44:31 +0000
X-Mizu-Trace-ID: 394edada4a2bcfaf
X-Migadu-Flow: FLOW_OUT
Message-ID: <3e0e1a74-b6bf-426c-9248-4debddb15e70@linux.dev>
Date: Wed, 2 Sep 2026 20:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] platform/x86: asus-wmi: use named masks for TUF
 RGB commands
To: Idotoho Reimon Simanjuntak <idotohors@gmail.com>,
 platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Luke D . Jones" <luke@ljones.dev>, Corentin Chary <corentin.chary@gmail.com>
References: <20260902174718.16228-1-idotohors@gmail.com>
 <20260902174718.16228-2-idotohors@gmail.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20260902174718.16228-2-idotohors@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 9/2/26 19:47, Idotoho Reimon Simanjuntak wrote:
> Replace open-coded bit shifts and magic numbers in kbd_rgb_mode_store()
> and kbd_rgb_state_store() with FIELD_PREP() and named GENMASK() masks.
>
> Define ASUS_WMI_TUF_RGB_STATE_CMD_ID (0xbd) as a named constant instead
> of an inline literal, making the required arg0 command ID self-documenting.
>
> In kbd_rgb_state_store(), remove the unused intermediate "flags" variable
> entirely. The old BIT(1)/BIT(3)/BIT(5)/BIT(7) construction is replaced by
> FIELD_PREP with per-flag named masks (TUF_RGB_STATE_BOOT, _AWAKE, _SLEEP,
> _KEYBOARD), building arg0 directly. This preserves the exact sysfs input
> format ("cmd boot awake sleep keyboard") and the resulting WMI argument
> bit layout — no behavioral change.
>
> In kbd_rgb_mode_store(), replace the positional shift expressions for
> arg1 and arg2 with FIELD_PREP using TUF_RGB_MODE_{CMD,MODE,RED,GREEN}
> and TUF_RGB_MODE_{BLUE,SPEED} masks respectively.
>
> This is a preparatory cleanup to improve readability before adding
> model-specific quirks that depend on these definitions.
I can see that there is some code that I wrote and Ilpo already
reviewed: when you use the work of someone you have to include
his Signed-off-by (that has to be present in the original patch).

I already know that this works because I tried it in my TUF
when I wrote it:

Reviewed-by: Denis Benato <denis.benato@linux.dev>
> Signed-off-by: Idotoho Reimon Simanjuntak <idotohors@gmail.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 48 ++++++++++++++++++++++++++-------
>  1 file changed, 38 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index a65090429..efc730c2c 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -15,6 +15,7 @@
>  
>  #include <linux/acpi.h>
>  #include <linux/backlight.h>
> +#include <linux/bitfield.h>
>  #include <linux/bits.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
> @@ -1047,6 +1048,27 @@ static DEVICE_ATTR_RW(gpu_mux_mode);
>  #endif /* IS_ENABLED(CONFIG_ASUS_WMI_DEPRECATED_ATTRS) */
>  
>  /* TUF Laptop Keyboard RGB Modes **********************************************/
> +
> +/* Command IDs passed in arg0 byte 0 for TUF RGB WMI methods */
> +#define ASUS_WMI_TUF_RGB_STATE_CMD_ID	0xbd
> +
> +/* Bit mask for the save-to-BIOS command flag in kbd_rgb_state_store (arg0 bit 10) */
> +#define TUF_RGB_STATE_SAVE	GENMASK(10, 10)
> +
> +/* Bit masks for kbd_rgb_state_store flags field (arg0 bits [23:16]) */
> +#define TUF_RGB_STATE_BOOT	GENMASK(17, 17)
> +#define TUF_RGB_STATE_AWAKE	GENMASK(19, 19)
> +#define TUF_RGB_STATE_SLEEP	GENMASK(21, 21)
> +#define TUF_RGB_STATE_KEYBOARD	GENMASK(23, 23)
> +
> +/* Bit masks for kbd_rgb_mode_store fields */
> +#define TUF_RGB_MODE_CMD	GENMASK(7, 0)
> +#define TUF_RGB_MODE_MODE	GENMASK(15, 8)
> +#define TUF_RGB_MODE_RED	GENMASK(23, 16)
> +#define TUF_RGB_MODE_GREEN	GENMASK(31, 24)
> +#define TUF_RGB_MODE_BLUE	GENMASK(7, 0)
> +#define TUF_RGB_MODE_SPEED	GENMASK(15, 8)
> +
>  static ssize_t kbd_rgb_mode_store(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
> @@ -1093,7 +1115,12 @@ static ssize_t kbd_rgb_mode_store(struct device *dev,
>  	}
>  
>  	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS, asus->kbd_rgb_dev,
> -			cmd | (mode << 8) | (r << 16) | (g << 24), b | (speed << 8), NULL);
> +			FIELD_PREP(TUF_RGB_MODE_CMD, cmd) |
> +			FIELD_PREP(TUF_RGB_MODE_MODE, mode) |
> +			FIELD_PREP(TUF_RGB_MODE_RED, r) |
> +			FIELD_PREP(TUF_RGB_MODE_GREEN, g),
> +			FIELD_PREP(TUF_RGB_MODE_BLUE, b) |
> +			FIELD_PREP(TUF_RGB_MODE_SPEED, speed), NULL);
>  	if (err)
>  		return err;
>  
> @@ -1119,28 +1146,29 @@ static ssize_t kbd_rgb_state_store(struct device *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
>  {
> -	u32 flags, cmd, boot, awake, sleep, keyboard;
> +	u32 cmd, boot, awake, sleep, keyboard;
> +	u32 arg0;
>  	int err;
>  
>  	if (sscanf(buf, "%d %d %d %d %d", &cmd, &boot, &awake, &sleep, &keyboard) != 5)
>  		return -EINVAL;
>  
> +	arg0 = ASUS_WMI_TUF_RGB_STATE_CMD_ID;
> +
>  	if (cmd)
> -		cmd = BIT(2);
> +		arg0 |= FIELD_PREP(TUF_RGB_STATE_SAVE, 1);
>  
> -	flags = 0;
>  	if (boot)
> -		flags |= BIT(1);
> +		arg0 |= FIELD_PREP(TUF_RGB_STATE_BOOT, 1);
>  	if (awake)
> -		flags |= BIT(3);
> +		arg0 |= FIELD_PREP(TUF_RGB_STATE_AWAKE, 1);
>  	if (sleep)
> -		flags |= BIT(5);
> +		arg0 |= FIELD_PREP(TUF_RGB_STATE_SLEEP, 1);
>  	if (keyboard)
> -		flags |= BIT(7);
> +		arg0 |= FIELD_PREP(TUF_RGB_STATE_KEYBOARD, 1);
>  
> -	/* 0xbd is the required default arg0 for the method. Nothing happens otherwise */
>  	err = asus_wmi_evaluate_method3(ASUS_WMI_METHODID_DEVS,
> -			ASUS_WMI_DEVID_TUF_RGB_STATE, 0xbd | cmd << 8 | (flags << 16), 0, NULL);
> +			ASUS_WMI_DEVID_TUF_RGB_STATE, arg0, 0, NULL);
>  	if (err)
>  		return err;
>  
