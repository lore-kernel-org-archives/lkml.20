Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794575154;
	b=IGBPqgmqk4sTydFXTakefyr45IDuMVIkE2PVrKsEoWHEXZGRw3ELw+P7DLQHQao28mPf
	 YoE6kIrXp5mL78n30ByptvFACzWqgd4J3Az2fmfI4UmuwhlwxceP1x1yhei39Z2m212nP
	 80Ryh2L2k9hksJptXmc1JChd2sKphnUz5c5UuzyXls+R9SG0bSmRNursuK2XceBabWVkU
	 OJ1NoM5Qq6rVFuHed5H4WOiHG4Z1O4GijFxWo0Koh1sm3yb6UYsEIhxCnL0cjzsQ9lkWt
	 E9XFcqDY7zi0sTc6RC84trS3odrZ1MRKQywBsbwSt8AsW9yWmoCFBRxBSe3NmDkracQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794575154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=3Gv2/MKpyRqwLVCQK8qd3m6Sf9ERO4AXWX6+f6IJg18=;
	b=Cdl6T6socaJbsSwIeltUixMzSzK7rq6xflX7T0vTGIuFbtrMwO0TOOjGo+0N3XGDalJQ
	 1Y+tAWlZwnPIpKvMwcUSYnz96J+6Bgfwm6SVt3kDpLlr96KXdPA2JNu+QlEl6H4qF/pbB
	 18cMRkzOnGLMZLwW4F58fmC6fusgHFhvV+0Z4iidYSoXbZb+SiO0f7M/7xJ539ILziDwb
	 PEtazlyKr8O77/HriyYnGmqMH0wvuP2zStqzu5m0d0SpDsp9FhdD65ZWbxKcMRt+BAaqP
	 MNEUtZYTOkQdM1PEAh9H6B+sIQOEtPxIVyzaz082I/4edDUxYoeUiNVZbSH59u8ksZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=9elements.com;
	spf=pass smtp.mailfrom=9elements.com;
	dkim=pass header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=BiD8SRWY;
	arc=none smtp.remote-ip=74.125.225.139
Received: from mail-wm2-f11.google.com (mail-wm2-f11.google.com [74.125.225.139])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9CA360A2618
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9CA360A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=9elements.com header.i=@9elements.com header.a=rsa-sha256 header.s=google header.b=BiD8SRWY
Received: by mail-wm2-f11.google.com with SMTP id 5b1f17b1804b1-4b769975b2bso2925235e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1794575151; x=1795179951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Gv2/MKpyRqwLVCQK8qd3m6Sf9ERO4AXWX6+f6IJg18=;
        b=BiD8SRWYN7n/jNO5DzKRWAVZAbz3a50DdsPL+0KMTv/+UNfXRfYEl1PeyErSeUqldO
         h2x3Q+MTQtL6ukU5tUBv8jjknPVhiJBsYYSPNETXzTYEnL/cDUSgxqJFvOW7xa0b255a
         Eqyd4nZgjosw/NC/7yz8fUE0Mr8KbLiaBzg9uN2OvuM7+CgblrkbYfxvoFZ0XMFISich
         nXZLGCOZeZ42NMV+YNfb45kT/TkX36fShGS4u3QtipXqeFTQvlyGNmDcgo5naMKNHFBL
         g7ZE2TAlhY2kQ8NDg26Ha7pNq1mhtMPC8PQAzX32x2oC6gudJPs2JK9IjHdhBd8U2eWX
         BI9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575151; x=1795179951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Gv2/MKpyRqwLVCQK8qd3m6Sf9ERO4AXWX6+f6IJg18=;
        b=hR45vrnaVNPdFgWWvCIJQ9yFQfpyudXJR1JROc9tClQJqOWgLhEM3xUkx6ouuQQlVF
         Kp6O6YWcX3/yrFm4yV1mIt1AwbfSkaeewTRIEKQZwOERshDTkw1aG7XcxhF0Wykkkx+/
         J6GcWScB2CpdCNciY0imdFSP0rW5mInb1xVaKBmCs3O4JgeP+1Roeheax+vvf5whT+vr
         Mut36oxKODi50BTBwIbz6/ZSpt8jjad5jNO90ckyFG2DA8vN+NVV+bqVSlVJv5tarShv
         U4WRjvk/qOrkV2dTEh1gXyqdgWSNZNktqaGWygLAuNzrryedA4JLgeGtPJwqYcaridZ0
         Oz/Q==
X-Forwarded-Encrypted: i=1; AL+hErGolp+w6gBi2AQfjfW2nSu8sDMCrDuQG2jEk0grfZTNy52TLFsqTwQbEFlGkoiYa3wReRTUGzQSVfttkiU=@vger.kernel.org
X-Gm-Message-State: APuU4Z94B1tiWqH2HHQuF/2nGgC2vEOzO0R5WxwOEA9V043Bfmetqnmy
	pZLuZgaI6wgOmQAwzBJUMS1W5cKeNGJGM+hRh+Xk7z7bWFAYLXNdGosONGmYX+whV1U=
X-Gm-Gg: AYBFou0SDFLhxhGbgBklylQPYKXcx19+E2LprWnCA90DkBm7tKgrd46oQhIxw0bESvb
	FJJw47OhzWGW6gNX2p+osi3qX0aBsuxLSiKfLJpww6ffBjpqHHgTSMajZHwocmstx/UEb+JHGTI
	y5FJJkwA6M0ZfJZx8O2wZZNGajEyBnddukgz3RcHxBXCbmp99QNniLDXnWkRAgtrrsMZFkAaTPD
	R4uEm2DtdK0/6rj21uryNoKYyreze/ww71QAK3tfwqeqNRxKpwey4K68LPWVyXANKe0R/1hpsCX
	VQOgGDiTCl7fpbLOmHCFQsjKtj+Vx0nL2lOvbreQUDdg2lX1Ka+wKmgZNiNn5IJDOowzaOtVUpj
	HvFep9BwEsXKJBGCUB5QMRRkn3FsvcNXUPE56wQkyNM+/JAfli3kXdcE2ZlYcwx9vKcgkP5VqU+
	ed4wpITO75qqO9Vwsw56TKRTWUhzDN57oBBoBX7wKRPGifJ5dCdb1YIFjQ2YN46mZ8M6cKIILro
	ZmtVC0uwKFkdCsYKA/KnX+CiQk/VBLwKxGpJQX3L+WIElyQUYUUMptJrfLkmSyaAMFGmgY/t5CL
	xEYOsXX/+kUUqrQYVHee4XtU8CwoTXrHW5Mlww3/dF1Q0g8OpRKSuEc9O4VDztNZ1hyIGgaEQDs
	Q2cAZMyW3LdxX4lwYGM/BZT/cNtAz8AFDqPrOOL+yBsADcJwTBbQqedVvVLI1EgE5Nje/Rw==
X-Received: by 2002:a05:600c:4e56:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4bb55a48042mr50442305e9.13.1794575150222;
        Fri, 13 Nov 2026 05:05:50 -0800 (PST)
Received: from ?IPV6:2003:e6:6714:e500:cb5f:91bd:76cb:96be? (p200300e66714e500cb5f91bd76cb96be.dip0.t-ipconnect.de. [2003:e6:6714:e500:cb5f:91bd:76cb:96be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5720f6basm25742635e9.4.2026.11.13.05.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:05:49 -0800 (PST)
Message-ID: <c6c39058-ebb2-433a-ab0e-5e35f5ccae24@9elements.com>
Date: Fri, 13 Nov 2026 14:05:48 +0100
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
Subject: Re: [PATCH v1 1/1] nvmem: aspeed: Add read-only AST2600 OTP support
To: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>, srini@kernel.org
Cc: joel@jms.id.au, andrew@codeconstruct.com.au, ryan_chen@aspeedtech.com,
 billy_tsai@aspeedtech.com, neal_liu@aspeedtech.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org
References: <20261113034213.158390-1-prasanth.padarthi10@gmail.com>
 <20261113034213.158390-2-prasanth.padarthi10@gmail.com>
Content-Language: en-US
From: Tan Siewert <tan.siewert@9elements.com>
In-Reply-To: <20261113034213.158390-2-prasanth.padarthi10@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 4:42 AM, Prasanth Kumar Padarthi wrote:
> Expose permitted AST2600 OTP data through NVMEM using the existing SBC
> node. Serialize controller transactions, bound completion polling and
> reject reads into the configured secure prefix.

This only repeats what the code does. Please explain *why*. Who uses the 
data and which cells?

> 
> Adapt the read sequence from ASPEED's downstream driver, preserving its
> attribution. Register the driver for ASPEED review and restrict raw OTP
> access to root.

If you mean the MAINTAINERS hunk, just say so.

> 
> Link: https://github.com/AspeedTech-BMC/linux/blob/769f62b7baa84d6998723b0ea60280e380183553/drivers/soc/aspeed/ast2600-otp.c

No DCO Sign-off (neither from you nor Neal). And given that you've used 
the downstream driver as base it'd be cool if you can keep Neal as 
Co-developed-by in (with Neal's agreement).

> ---
> Tested on ASRock Rack B650D4U, AST2600 A3, OpenBMC Linux 6.18.24:

Please test against the base commit you've used (i.e. 7.4-rc3). Using a 
vendor / OpenBMC tree here is not useful at all.

> - Repeated, paired and cross-pair reads matched.
> - Four concurrent readers completed 40 matching reads.
> - Bytes 8172..8183 matched a separate vendor-derived reader.
> - Synthetic pre-MMIO timeout, failure latching and rebind recovery passed.
> Host fault-injection tests passed all 42 polling-timeout cases.
> 
>   MAINTAINERS                 |   1 +
>   drivers/nvmem/Kconfig       |  12 ++
>   drivers/nvmem/Makefile      |   1 +
>   drivers/nvmem/ast2600-otp.c | 259 ++++++++++++++++++++++++++++++++++++
>   4 files changed, 273 insertions(+)
>   create mode 100644 drivers/nvmem/ast2600-otp.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93abbb3..c92ea8e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2813,6 +2813,7 @@ F:	Documentation/devicetree/bindings/arm/aspeed/
>   F:	arch/arm/boot/dts/aspeed/
>   F:	arch/arm/mach-aspeed/
>   F:	arch/arm64/boot/dts/aspeed/
> +F:	drivers/nvmem/ast2600-otp.c
>   N:	aspeed
>   
>   ARM/AXIADO ARCHITECTURE
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index d2f5bb2..cdcd071 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -164,6 +164,18 @@ config NVMEM_APPLE_SPMI
>   	  This driver can also be built as a module. If so, the module
>   	  will be called apple-nvmem-spmi.
>   
> +config NVMEM_ASPEED_AST2600_OTP
> +	tristate "ASPEED AST2600 OTP support"
> +	depends on ARCH_ASPEED || COMPILE_TEST
> +	depends on HAS_IOMEM
> +	help
> +	  Read-only access to the AST2600 OTP data region. The configured
> +	  secure prefix is not exposed. Fuse programming is not supported.
> +	  The controller reads paired 32-bit words through command registers.

This is implementation-specific and doesn't help whether to enable the 
option. Drop.

> +	  Access to raw OTP data is restricted to root.
> +
> +	  If built as a module, the module will be called ast2600-otp.
> +

"If unsure, select N"?

>   config NVMEM_BCM_OCOTP
>   	tristate "Broadcom On-Chip OTP Controller support"
>   	depends on ARCH_BCM_IPROC || COMPILE_TEST
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 5e70bad..9fac69d 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
>   nvmem-apple-efuses-y 			:= apple-efuses.o
>   obj-$(CONFIG_NVMEM_APPLE_SPMI)		+= apple_nvmem_spmi.o
>   apple_nvmem_spmi-y			:= apple-spmi-nvmem.o
> +obj-$(CONFIG_NVMEM_ASPEED_AST2600_OTP)	+= ast2600-otp.o

Maybe call the file "nvmem-aspeed-otp" or so? Would be nice if we can 
extend the driver for AST2700 support later on.

>   obj-$(CONFIG_NVMEM_BCM_OCOTP)		+= nvmem-bcm-ocotp.o
>   nvmem-bcm-ocotp-y			:= bcm-ocotp.o
>   obj-$(CONFIG_NVMEM_BRCM_NVRAM)		+= nvmem_brcm_nvram.o
> diff --git a/drivers/nvmem/ast2600-otp.c b/drivers/nvmem/ast2600-otp.c
> new file mode 100644
> index 0000000..94b1225
> --- /dev/null
> +++ b/drivers/nvmem/ast2600-otp.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) ASPEED Technology Inc.
> + *
> + * ASPEED AST2600 OTP Controller driver
> + * Read sequencing adapted from ASPEED's downstream ast2600-otp driver.

This comment feels unnecessary. It's already been said in the commit 
description.

> + */
> +
> +#include <linux/align.h>

align could be removed if you use round_down() or word & ~1 maybe?

> +#include <linux/bitfield.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/nvmem-provider.h>
> +#include <linux/of.h>

You don't call any of_ functions. Replace with mod_devicetable.h.

> +#include <linux/platform_device.h>
> +#include <linux/slab.h>

unused. devm_kzalloc comes through platform_device.h.

> +#include <linux/string.h>
> +
> +#define AST2600_OTP_PROTECT_KEY		0x00
> +#define AST2600_OTP_CMD			0x04
> +#define AST2600_OTP_ADDR		0x10
> +#define AST2600_OTP_STATUS		0x14

The SB Controller driver checks for the OTP_PROTECTED bit. What happens 
if OTP protection is enabled?

> +#define AST2600_OTP_COMPARE_1		0x20
> +#define AST2600_OTP_COMPARE_2		0x24
> +
> +#define AST2600_OTP_CMD_READ		0x23b1e361
> +#define AST2600_OTP_CMD_WRITE_MODE	0x23b1e362
> +#define AST2600_OTP_UNLOCK_KEY		0x349fe38a
> +#define AST2600_OTP_STATUS_DONE		0x6

Describe the bits here. Either two BIT() or GENMASK(2, 1).

> +#define AST2600_OTP_TIMEOUT_US		100000

Where does this come from?

> +
> +#define AST2600_OTP_DATA_WORDS		0x800
> +#define AST2600_OTP_SIZE			(AST2600_OTP_DATA_WORDS * sizeof(u32))
> +#define AST2600_OTP_CONF0_ADDR		0x800
> +#define AST2600_OTP_CONF0_SEC_SIZE		GENMASK(21, 16)
> +#define AST2600_OTP_SEC_SIZE_UNIT		(32 * sizeof(u32))
> +
> +struct ast2600_otp {
> +	void __iomem *base;
> +	/* Serialize the complete unlock, read and relock sequence. */
> +	struct mutex lock;
> +	bool failed;
> +};
> +
> +static int ast2600_otp_wait_complete(struct ast2600_otp *otp)
> +{
> +	u32 status;
> +	int i, ret;
> +
> +	/* Allow the command to start before sampling the idle flags. */
> +	udelay(1);

You could use read_poll_timeout too?

> +
> +	/* Match the downstream sequence: observe both idle flags twice. */
> +	for (i = 0; i < 2; i++) {

This is not a valid reason. Do you really have to poll twice? Is this an 
erratum? If so, please cite it.

> +		ret = readl_poll_timeout(otp->base + AST2600_OTP_STATUS,
> +					 status,
> +					 (status & AST2600_OTP_STATUS_DONE) ==
> +					 AST2600_OTP_STATUS_DONE,
> +					 1, AST2600_OTP_TIMEOUT_US);
> +		if (ret) {
> +			/* Do not reuse a controller with an outstanding command. */
> +			otp->failed = true;

That'd disable the device on a single timeout. Do we really have to do 
this, or would it be enough to retry on the next access? If you want to 
keep it, then a dev_err() would be good instead of failing it silently.

> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int ast2600_otp_prepare_read(struct ast2600_otp *otp)
> +{
> +	static const u32 mode_addresses[] = { 0x3000, 0x5000, 0x1000 };
> +	int i, ret;
> +
> +	ret = ast2600_otp_wait_complete(otp);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Restore the macro's default read mode, as in otp_soak(ctx, 0).
> +	 * These writes target volatile mode registers, not OTP fuse cells.
> +	 * No fuse programming command or programming timing is used.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(mode_addresses); i++) {
> +		writel(mode_addresses[i], otp->base + AST2600_OTP_ADDR);
> +		writel(0, otp->base + AST2600_OTP_COMPARE_1);
> +		writel(AST2600_OTP_CMD_WRITE_MODE, otp->base + AST2600_OTP_CMD);

Setting the OTP back to default doesn't need write mode if I understand 
the datasheet correctly.

> +		ret = ast2600_otp_wait_complete(otp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int ast2600_otp_read_pair(struct ast2600_otp *otp,
> +				 unsigned int aligned_word,
> +				 u32 *word0, u32 *word1)
> +{
> +	int ret;
> +
> +	/* The hardware reads two words starting at an even word index. */
> +	if ((aligned_word & 1) || aligned_word >= AST2600_OTP_DATA_WORDS)
> +		return -EINVAL;

You're already passing an aligned index everywhere which makes this code 
redundant. It also blocks the read for CONF0, so please drop this check 
and use read_pair() for CONF0 too.

> +
> +	writel(aligned_word, otp->base + AST2600_OTP_ADDR);
> +
> +	writel(AST2600_OTP_CMD_READ,
> +	       otp->base + AST2600_OTP_CMD);
> +
> +	ret = ast2600_otp_wait_complete(otp);
> +	if (ret)
> +		return ret;
> +
> +	*word0 = readl(otp->base + AST2600_OTP_COMPARE_1);
> +	*word1 = readl(otp->base + AST2600_OTP_COMPARE_2);
> +
> +	return 0;
> +}
> +
> +static int ast2600_otp_read(void *context, unsigned int offset,
> +			    void *val, size_t bytes)
> +{
> +	struct ast2600_otp *otp = context;
> +	u8 *buf = val;
> +	unsigned int word_index;
> +	unsigned int aligned_word;
> +	unsigned int secure_size;
> +	__le32 pair[2];
> +	u32 conf0;
> +	u32 word0, word1;
> +	size_t chunk, skip;
> +	int ret;
> +
> +	if (!bytes)
> +		return -EINVAL;

OTP could be empty too?

> +
> +	if (offset % sizeof(u32) || bytes % sizeof(u32))
> +		return -EINVAL;
> +
> +	if (offset >= AST2600_OTP_SIZE ||
> +	    bytes > AST2600_OTP_SIZE - offset)
> +		return -EINVAL;
> +
> +	mutex_lock(&otp->lock);

guard(mutex)(&priv->lock); ? Requires <linux/cleanup.h>.

> +
> +	if (otp->failed) {
> +		ret = -EIO;
> +		goto out_unlock;
> +	}
> +
> +	writel(AST2600_OTP_UNLOCK_KEY, otp->base + AST2600_OTP_PROTECT_KEY);
> +
> +	ret = ast2600_otp_prepare_read(otp);
> +	if (ret)
> +		goto out_lock;

The secure region size is fixed once programmed. Maybe read it once in 
probe instead of on every access? With nvmem_keepout, this would clean 
up the read path a bit.

> +
> +	/* Configuration word 0 describes the unreadable secure data prefix. */
> +	writel(AST2600_OTP_CONF0_ADDR, otp->base + AST2600_OTP_ADDR);
> +	writel(AST2600_OTP_CMD_READ, otp->base + AST2600_OTP_CMD);
> +	ret = ast2600_otp_wait_complete(otp);
> +	if (ret)
> +		goto out_lock;
> +
> +	conf0 = readl(otp->base + AST2600_OTP_COMPARE_1);
> +	secure_size = FIELD_GET(AST2600_OTP_CONF0_SEC_SIZE, conf0) *
> +		      AST2600_OTP_SEC_SIZE_UNIT;

You can also keep out the secure region by using nvmem_keepout.

> +	/* Conservatively deny the entire secure prefix, including its header. */
> +	if (offset < secure_size) {
> +		ret = -EACCES;
> +		goto out_lock;
> +	}
> +
> +	while (bytes) {
> +		word_index = offset / sizeof(u32);
> +		aligned_word = ALIGN_DOWN(word_index, 2);
> +
> +		ret = ast2600_otp_read_pair(otp, aligned_word,
> +					    &word0, &word1);
> +		if (ret)
> +			goto out_lock;
> +
> +		pair[0] = cpu_to_le32(word0);
> +		pair[1] = cpu_to_le32(word1);
> +		skip = (word_index - aligned_word) * sizeof(u32);
> +		chunk = min(bytes, sizeof(pair) - skip);
> +
> +		memcpy(buf, (u8 *)pair + skip, chunk);
> +		buf += chunk;
> +		offset += chunk;
> +		bytes -= chunk;

NVMEM already returns the data in the correct order if I see this right. 
You can store the readl() results directly into a u32*buf var. That'd 
make the pair/skip/chunk code and endianness conversion unnecessary.

> +	}
> +
> +	ret = 0;
> +
> +out_lock:
> +	writel(0, otp->base + AST2600_OTP_PROTECT_KEY);
> +	/* Flush the protection write before another reader takes the mutex. */
> +	readl(otp->base + AST2600_OTP_PROTECT_KEY);

for what are you reading the otp key register here?

> +out_unlock:
> +	mutex_unlock(&otp->lock);
> +	return ret;
> +}
> +
> +static int ast2600_otp_probe(struct platform_device *pdev)
> +{
> +	struct nvmem_config config = {};
> +	struct nvmem_device *nvmem;
> +	struct ast2600_otp *otp;

Can we name this priv maybe?

> +
> +	otp = devm_kzalloc(&pdev->dev, sizeof(*otp), GFP_KERNEL);

Maybe assign &pdev->dev as struct device * variable and use that one 
instead?

> +	if (!otp)
> +		return -ENOMEM;
> +
> +	otp->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(otp->base))
> +		return PTR_ERR(otp->base);
> +
> +	mutex_init(&otp->lock);

devm_mutex_init?

> +
> +	config.dev = &pdev->dev;

Same here with the var.

> +	config.name = "ast2600-otp";
> +	config.id = NVMEM_DEVID_AUTO;
> +	config.owner = THIS_MODULE;
> +	config.type = NVMEM_TYPE_OTP;
> +	config.read_only = true;
> +	config.root_only = true;
> +	config.word_size = sizeof(u32);
> +	config.stride = sizeof(u32);
> +	config.size = AST2600_OTP_SIZE;
> +	config.reg_read = ast2600_otp_read;

These can already be set in the config struct before.

> +	config.priv = otp;
> +
> +	nvmem = devm_nvmem_register(&pdev->dev, &config);

And here.

> +	return PTR_ERR_OR_ZERO(nvmem);
> +}
> +
> +static const struct of_device_id ast2600_otp_of_match[] = {
> +	{ .compatible = "aspeed,ast2600-sbc" },

The SB Controller driver has "additionalProperties: false" set and 
doesn't allow nvmem properties.

Please add "$ref: /schemas/nvmem/nvmem.yaml#" and 
"unevaluatedProperties: false" as a separate patch.

Tan

> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, ast2600_otp_of_match);
> +
> +static struct platform_driver ast2600_otp_driver = {
> +	.probe = ast2600_otp_probe,
> +	.driver = {
> +		.name = "ast2600-otp",
> +		.of_match_table = ast2600_otp_of_match,
> +	},
> +};
> +module_platform_driver(ast2600_otp_driver);
> +
> +MODULE_AUTHOR("Neal Liu <neal_liu@aspeedtech.com>");
> +MODULE_AUTHOR("Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>");
> +MODULE_DESCRIPTION("ASPEED AST2600 read-only OTP NVMEM driver");
> +MODULE_LICENSE("GPL");
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4

