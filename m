Received: from mail-ot1-f98.google.com (mail-ot1-f98.google.com [209.85.210.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 276D83AF647
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787769248; cv=none; b=VNbnMwwXvUJ8CO2QMpiazUIBJrpgmlyl0ssCnx+Bt/IXuwo//mnbmca8TC0u+JvRAWn6bM9sBdc3OBo/gXvFLRiN4tvlLz8sSCzQKuNzxtm+xGxi1iZH7biEoIuVO6Dv0m6feNAT0p6ba+rnTrldLbF1aojk/WYvtHy+QxQ+egc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787769248; c=relaxed/simple;
	bh=rFb4YF4y/8+Ns7seiIauq1qemz5qrJSqAKh/5d3IsEw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FgR9bSoiRgGg2vR2gJsSwnINT+6ZzdcDrEKP0vIaOVN6nRCPnM0IBopKco58fwltNZ7wDX6aoXFN3RzbJNqpM1Pw3lW+wtVkmPtqvXtJFOm1bvxQzN5yn+2SnDq9Ge/zgBwfKlFwNNt6Jt6Lu/fv8K5zsGdpWm9lmjyNTBr7M5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=XK0SHRR1; arc=none smtp.client-ip=209.85.210.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="XK0SHRR1"
Received: by mail-ot1-f98.google.com with SMTP id 46e09a7af769-7eb29ed2bbdso1077978a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787769234; x=1788374034;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cmDnM9N/sExPW4FxItBgnf7fP+GVZqQ5yB6g4L/QzrE=;
        b=kTPHMxx5NqkgyZQtvrNF2xiBc8YWYqYKdOizGiSFjxQ4Rvy++VV5lFnlk2km5iuMYp
         7HxZs6ChZvIW4ktdWEhE1X4TnMg8ijxMAhCXOXx4c2c7s4/tHoLS8DddGc0IvCmxwtIm
         RjkDGvO36rHHjtMLfDeK1eVCqK7Mnwk00q8EhoizORhXBKcGpTTANZ24S9n+khW2tm2Q
         DFXRQxK3fpPmPupgmW/I1eJc04LhPlmr0Dr0Xs9fJH8o1rrJQ18FUwHB6zKCEggMM8Br
         bWYa0RdYa7Un52NWyYEVRvKh7p1dqGz6/K7N8oqImz6pKSnhLuaqOxYNeAopVcNzNysN
         +kkQ==
X-Forwarded-Encrypted: i=1; AHgh+RouwAPW09m01jsTCl2rJcWIw3pCdL/ynufqSmMFurN8hiiiQWjBhPMSO7HLJTwfHyP8m/TM9yC1vQ+srIY=@vger.kernel.org
X-Gm-Message-State: AFuF++na+NICPlvPNvca39yP690F2/ktpBCLSkNJxLgQ6A/qjTf6XOc2
	TCjWSux/AaIUrcmaWmKVZnlIbSMP3oObOvbMZJBoepzwTqKqD1Ed72iWtL4DhMNhvh7Ey4MQUDr
	6g/Z9x8jr3aWcF7UVC6xPuvlNhKgtAZPV5TDLcOcCvirI66VQc/1QEuJxhUfy70zkKcGEh2eC4H
	h8G2YNFayou8BEbbHMKLwTSt4qNoXmsR7R8Wg4CaBS5hhgNVIoALbEOhEGTtORXBLTsENaeUQUu
	p5LpkRFUDx+q7Yu0eF5VuPo
X-Gm-Gg: AR+sD11xLu49z/SLEKEkXNDiBjH++tvP2R3sJIPBWr3pnw8uz3ajMxkZz3UC4KYfOJC
	XEjSJ8rh9henb1mJYKvKZIQSng+5HubV+gjTYGILl0Igwk+/e1S18QpUVvMRmmFqB9ZGl/OraOO
	S51kqXsNX4zQulZ2005fVdgocCkmj3vi+7bc1wg9HzShDw4bdkk3t7DisZmLYci7Gi+YGzD62Ya
	JeXAlx5CLtTOMUMJCsQ6SH21/cinNZXs4o5apn0uNb+El4ju6DFLwShFRe7jblaLQWEMbj2eAzh
	InMU+84CZyaaBTxEQCwEkxY0Qw0Qy/PMy2QG4QXq0QC+SSaoaOwdHh9ivHgfMUFDFFHWTRXd/dK
	xhqXEhs1/MZqSnCX7BxF5pOrClXKX+ImegQWfjMFSI20BWCGlMDXalMiiECnjwFX5YehbrdPCAH
	p9nNFb2tYG/WL+3Y4czk1lEzLGT6mq8h/GL0dFnMXx
X-Received: by 2002:a05:6830:6b04:b0:7e1:cbe3:bb1b with SMTP id 46e09a7af769-7f4c4aebad7mr9597377a34.0.1787769234458;
        Wed, 26 Aug 2026 11:33:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f4c83c4e58sm337030a34.4.2026.08.26.11.33.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Aug 2026 11:33:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso1677235a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787769233; x=1788374033; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cmDnM9N/sExPW4FxItBgnf7fP+GVZqQ5yB6g4L/QzrE=;
        b=XK0SHRR1MItglTI/ym8PAvofftRYIMtPY3BuKawOV3DyYOdSVCfXq3+BqT1Zua5FzC
         zGxbAdcJFvwHRMxbKXcV+qbNA6pxykehOxe3z9c52MT+DL39Fm0lox1+/43LffhHwBh/
         ZoWdb4WEp6zgqz4LtimNW2//DvPSvU8zemOVQ=
X-Forwarded-Encrypted: i=1; AHgh+Rqxte30C9vsZqJT3qwDFbayXFl9llXfJfwJHmx3yoWzHkzTW/UQu2z9ChvzxO/Ladk/P9je8H//ICNV6Wo=@vger.kernel.org
X-Received: by 2002:a17:90b:3cc3:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-3966d85de70mr19581742a91.10.1787769232838;
        Wed, 26 Aug 2026 11:33:52 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc3:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-3966d85de70mr19581640a91.10.1787769232285;
        Wed, 26 Aug 2026 11:33:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283fa89e8fsm15006063eec.8.2026.08.26.11.33.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 11:33:51 -0700 (PDT)
Message-ID: <635282ef-5c24-4820-abfa-7eaaea6e7f0e@broadcom.com>
Date: Wed, 26 Aug 2026 11:33:49 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/5] iommu: Add Broadcom BCM2712 IOMMU driver
To: Daniel Drake <dan@reactivated.net>, "Joerg Roedel (AMD)"
 <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, nick.hollinghurst@raspberrypi.com,
 james.quinlan@broadcom.com, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260825-bcm2712-iommu-submit-v3-0-7f143e7289b6@reactivated.net>
 <20260825-bcm2712-iommu-submit-v3-4-7f143e7289b6@reactivated.net>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260825-bcm2712-iommu-submit-v3-4-7f143e7289b6@reactivated.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/25/26 13:56, Daniel Drake wrote:
> This IOMMU translates memory access requests for the VC6 display
> pipeline and various multimedia devices in the Broadcom BCM2712 SoC used
> on Raspberry Pi 5.
> 
> The driver uses the generic_pt framework to manage the 2-level page
> tables. It also provides support for the centralized L2 TLB (IOMMUC),
> which is shared across the SoC's IOMMU instances and must be flushed
> when modifying or unmapping page table entries.
> 
> Adapted from Raspberry Pi's downstream bcm2712-iommu driver
> (original author Nick Hollinghurst).
> 
> Signed-off-by: Daniel Drake <dan@reactivated.net>
> ---
>   drivers/iommu/Kconfig               |  15 +
>   drivers/iommu/Makefile              |   1 +
>   drivers/iommu/bcm2712-iommu-cache.c |  83 ++++++
>   drivers/iommu/bcm2712-iommu-cache.h |   9 +
>   drivers/iommu/bcm2712-iommu.c       | 556 ++++++++++++++++++++++++++++++++++++
>   5 files changed, 664 insertions(+)
> 
> diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
> index 6e07bd69467a..f2c8788158b0 100644
> --- a/drivers/iommu/Kconfig
> +++ b/drivers/iommu/Kconfig
> @@ -386,6 +386,21 @@ config VSI_IOMMU
>   	  Say Y here if you want to use this IOMMU in front of these
>   	  hardware blocks.
>   
> +config BCM2712_IOMMU
> +	bool "BCM2712 IOMMU driver"
> +	depends on (ARCH_BCM && ARM64) || COMPILE_TEST
> +	select IOMMU_API
> +	select GENERIC_PT
> +	select IOMMU_PT
> +	select IOMMU_PT_BCM2712
> +	help
> +	  Support for IOMMU on BCM2712 SoC. This IOMMU can be used by the
> +	  display controller and various multimedia devices to perform
> +	  efficient memory management.
> +
> +	  Say Y here if you want to use this IOMMU in front of these
> +	  hardware blocks.
> +
>   config IOMMU_DEBUG_PAGEALLOC
>   	bool "Debug IOMMU mappings against page allocations"
>   	depends on DEBUG_PAGEALLOC && IOMMU_API && PAGE_EXTENSION
> diff --git a/drivers/iommu/Makefile b/drivers/iommu/Makefile
> index 2f05725eaab1..29a26d2a3af1 100644
> --- a/drivers/iommu/Makefile
> +++ b/drivers/iommu/Makefile
> @@ -37,4 +37,5 @@ obj-$(CONFIG_IOMMU_IOPF) += io-pgfault.o
>   obj-$(CONFIG_SPRD_IOMMU) += sprd-iommu.o
>   obj-$(CONFIG_APPLE_DART) += apple-dart.o
>   obj-$(CONFIG_VSI_IOMMU) += vsi-iommu.o
> +obj-$(CONFIG_BCM2712_IOMMU) += bcm2712-iommu.o bcm2712-iommu-cache.o
>   obj-$(CONFIG_IOMMU_DEBUG_PAGEALLOC) += iommu-debug-pagealloc.o
> diff --git a/drivers/iommu/bcm2712-iommu-cache.c b/drivers/iommu/bcm2712-iommu-cache.c
> new file mode 100644
> index 000000000000..040cfc4ccf9f
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu-cache.c
> @@ -0,0 +1,83 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * IOMMU driver for BCM2712 TLB cache
> + *
> + * Copyright (c) 2023 Raspberry Pi Ltd.
> + * Copyright (c) 2026 Daniel Drake
> + *
> + * The BCM2712 IOMMUC is a centralized TLB which accelerates address translation
> + * across the SoC's IOMMU devices. If an address mapping is not found in the
> + * IOMMU's local TLB cache, then this IOMMUC is consulted. The IOMMUC must be
> + * explicitly invalidated when modifying or unmapping IOMMU page tables.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/err.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/iopoll.h>
> +
> +#include "bcm2712-iommu-cache.h"
> +
> +struct bcm2712_iommu_cache {
> +	struct device *dev;
> +	spinlock_t hw_lock;
> +	void __iomem *reg_base;
> +};
> +
> +#define MMUC_CONTROL_ENABLE   1
> +#define MMUC_CONTROL_FLUSH    2
> +#define MMUC_CONTROL_FLUSHING 4

Those should be BIT(0), BIT(1) and BIT(2) respectively.

> +
> +void bcm2712_iommu_cache_flush(struct bcm2712_iommu_cache *cache)
> +{
> +	u32 val;
> +	int ret;
> +
> +	scoped_guard(spinlock_irqsave, &cache->hw_lock) {
> +		writel(MMUC_CONTROL_ENABLE | MMUC_CONTROL_FLUSH,
> +		       cache->reg_base);
> +
> +		ret = readl_poll_timeout_atomic(cache->reg_base, val,
> +						!(val & MMUC_CONTROL_FLUSHING),
> +						0, 50);
> +	}
> +
> +	if (ret)
> +		dev_err_ratelimited(cache->dev, "cache flush timed out\n");
> +}
> +
> +static int bcm2712_iommu_cache_probe(struct platform_device *pdev)
> +{
> +	struct bcm2712_iommu_cache *cache;
> +
> +	cache = devm_kzalloc(&pdev->dev, sizeof(*cache), GFP_KERNEL);
> +	if (!cache)
> +		return -ENOMEM;
> +
> +	cache->dev = &pdev->dev;
> +	spin_lock_init(&cache->hw_lock);
> +
> +	cache->reg_base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(cache->reg_base))
> +		return PTR_ERR(cache->reg_base);
> +
> +	platform_set_drvdata(pdev, cache);
> +	return 0;
> +}
> +
> +static const struct of_device_id bcm2712_iommu_cache_of_match[] = {
> +	{ .compatible = "brcm,bcm2712-iommuc" },
> +	{ /* sentinel */ },
> +};
> +
> +static struct platform_driver bcm2712_iommu_cache_driver = {
> +	.probe = bcm2712_iommu_cache_probe,
> +	.driver = {
> +		.name = "bcm2712-iommu-cache",
> +		.of_match_table = bcm2712_iommu_cache_of_match,
> +		.suppress_bind_attrs = true,
> +	},
> +};
> +builtin_platform_driver(bcm2712_iommu_cache_driver);
> diff --git a/drivers/iommu/bcm2712-iommu-cache.h b/drivers/iommu/bcm2712-iommu-cache.h
> new file mode 100644
> index 000000000000..d2f7851831cc
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu-cache.h
> @@ -0,0 +1,9 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef _BCM2712_IOMMU_CACHE_H
> +#define _BCM2712_IOMMU_CACHE_H
> +
> +struct bcm2712_iommu_cache;
> +
> +void bcm2712_iommu_cache_flush(struct bcm2712_iommu_cache *cache);
> +
> +#endif
> diff --git a/drivers/iommu/bcm2712-iommu.c b/drivers/iommu/bcm2712-iommu.c
> new file mode 100644
> index 000000000000..1bb456a83df5
> --- /dev/null
> +++ b/drivers/iommu/bcm2712-iommu.c
> @@ -0,0 +1,556 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * IOMMU driver for Broadcom BCM2712
> + *
> + * Copyright (c) 2023-2025 Raspberry Pi Ltd.
> + * Copyright (c) 2026 Daniel Drake
> + *
> + * Each BCM2712 IOMMU has multiple devices hardwired into it, whose
> + * DMA transactions all route through the IOMMU. There is no stream ID tagging
> + * or any other kind of segmentation to differentiate between requests from
> + * different devices. It is also not possible to toggle a specific device
> + * between iommu-mapped and bypass modes.
> + *
> + * The hardware supports the simultaneous configuration of a bypass window
> + * (where memory accesses operate in identity mode) and a translation aperture
> + * (supporting page mapping). While combining these two would allow for
> + * GART-like operation, this driver's paging domain implementation configures
> + * only the translation aperture (starting at IOVA 0) offering a degree of
> + * memory protection.
> + *
> + * The page table format is a two-level format handled by generic_pt/bcm2712.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/err.h>
> +#include <linux/iommu.h>
> +#include <linux/iopoll.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/spinlock.h>
> +#include <linux/sizes.h>
> +#include <linux/generic_pt/iommu.h>
> +
> +#include "bcm2712-iommu-cache.h"
> +#include "dma-iommu.h"
> +#include "iommu-pages.h"
> +
> +/* BCM2712 IOMMU is organized around 4Kbyte pages */
> +#define IOMMU_PAGE_SHIFT       12
> +#define IOMMU_PAGE_SIZE        (1ul << IOMMU_PAGE_SHIFT)
> +/* A PTE is 4 bytes */
> +#define PTE_SIZE_SHIFT         2
> +/* L1/L2 table sizing (IOMMU hardware pages): 1024 entries per page */
> +#define PTES_PER_IOPG_SHIFT    (IOMMU_PAGE_SHIFT - PTE_SIZE_SHIFT)
> +
> +#define MMMU_CTRL_OFFSET                       0x00
> +#define MMMU_CTRL_CAP_EXCEEDED                 BIT(27)
> +#define MMMU_CTRL_CAP_EXCEEDED_ABORT_EN        BIT(26)
> +#define MMMU_CTRL_CAP_EXCEEDED_INT_EN          BIT(25)
> +#define MMMU_CTRL_CAP_EXCEEDED_EXCEPTION_EN    BIT(24)
> +#define MMMU_CTRL_PT_INVALID                   BIT(20)
> +#define MMMU_CTRL_PT_INVALID_ABORT_EN          BIT(19)
> +#define MMMU_CTRL_PT_INVALID_INT_EN            BIT(18)
> +#define MMMU_CTRL_PT_INVALID_EXCEPTION_EN      BIT(17)
> +#define MMMU_CTRL_PT_INVALID_EN                BIT(16)
> +#define MMMU_CTRL_WRITE_VIOLATION              BIT(12)
> +#define MMMU_CTRL_WRITE_VIOLATION_ABORT_EN     BIT(11)
> +#define MMMU_CTRL_WRITE_VIOLATION_INT_EN       BIT(10)
> +#define MMMU_CTRL_WRITE_VIOLATION_EXCEPTION_EN BIT(9)
> +#define MMMU_CTRL_BYPASS                       BIT(8)
> +#define MMMU_CTRL_TLB_CLEARING                 BIT(7)
> +#define MMMU_CTRL_STATS_CLEAR                  BIT(3)
> +#define MMMU_CTRL_TLB_CLEAR                    BIT(2)
> +#define MMMU_CTRL_STATS_ENABLE                 BIT(1)
> +#define MMMU_CTRL_ENABLE                       BIT(0)
> +
> +#define MMMU_CTRL_OPERATING_FLAGS (\
> +	MMMU_CTRL_CAP_EXCEEDED_ABORT_EN    | \
> +	MMMU_CTRL_PT_INVALID_ABORT_EN      | \
> +	MMMU_CTRL_PT_INVALID_EN            | \
> +	MMMU_CTRL_WRITE_VIOLATION_ABORT_EN | \
> +	MMMU_CTRL_STATS_ENABLE             | \
> +	MMMU_CTRL_ENABLE)
> +
> +#define MMMU_PT_PA_BASE_OFFSET                 0x04
> +
> +#define MMMU_ADDR_CAP_OFFSET                   0x14
> +#define MMMU_ADDR_CAP_ENABLE                   BIT(31)
> +#define ADDR_CAP_SHIFT                         ilog2(SZ_256M)
> +
> +#define MMMU_SHOOT_DOWN_OFFSET                 0x18
> +#define MMMU_SHOOT_DOWN_SHOOTING               BIT(31)
> +#define MMMU_SHOOT_DOWN_SHOOT                  BIT(30)
> +
> +#define MMMU_BYPASS_START_OFFSET               0x1c
> +#define MMMU_BYPASS_START_ENABLE               BIT(31)
> +
> +#define MMMU_BYPASS_END_OFFSET                 0x20
> +#define MMMU_BYPASS_END_ENABLE                 BIT(31)
> +
> +#define MMMU_MISC_OFFSET                       0x24
> +#define MMMU_MISC_SINGLE_TABLE                 BIT(31)
> +
> +#define MMMU_ILLEGAL_ADR_OFFSET                0x30
> +#define MMMU_ILLEGAL_ADR_ENABLE                BIT(31)
> +
> +#define MMMU_DEBUG_INFO_OFFSET                 0x38
> +#define MMMU_DEBUG_INFO_VERSION_MASK           0x0000000Fu
> +#define MMMU_DEBUG_INFO_VA_WIDTH_MASK          0x000000F0u
> +#define MMMU_DEBUG_INFO_PA_WIDTH_MASK          0x00000F00u
> +#define MMMU_DEBUG_INFO_BIGPAGE_WIDTH_MASK     0x000FF000u
> +#define MMMU_DEBUG_INFO_SUPERPAGE_WIDTH_MASK   0x0FF00000u
> +#define MMMU_DEBUG_INFO_BYPASS_4M              BIT(28)
> +#define MMMU_DEBUG_INFO_BYPASS                 BIT(29)
> +
> +struct bcm2712_iommu {
> +	struct device *dev;
> +	struct iommu_device iommu;
> +	struct bcm2712_iommu_domain *domain;
> +	struct bcm2712_iommu_cache *cache;
> +	void __iomem *reg_base;
> +	spinlock_t hw_lock;
> +	size_t bigpage_size;
> +	size_t superpage_size;
> +};
> +
> +struct bcm2712_iommu_domain {
> +	union {
> +		struct iommu_domain base;
> +		struct pt_iommu_bcm2712 pt;
> +	};
> +	struct bcm2712_iommu *mmu;
> +	void *default_page;
> +};
> +
> +#define MMU_WR(off, val)  writel(val, mmu->reg_base + (off))
> +#define MMU_RD(off)       readl(mmu->reg_base + (off))

I would prefer using static inline wrappers here because it gets super 
easy to just instrument those with debug prints by adding a couple of 
lines, it also gives you type validation at the same time.

[snip]

> +static struct iommu_domain bcm2712_blocking_domain = {
> +	.type = IOMMU_DOMAIN_BLOCKED,
> +	.ops = &(const struct iommu_domain_ops) {
> +		.attach_dev = bcm2712_iommu_blocking_attach,
> +	},
> +};
> +
> +static int bcm2712_iommu_enable_and_clear_tlb(struct bcm2712_iommu *mmu)

Maybe add __must_hold() here to indicate when this is called?

The rest looks good to me, but I defer to Jim for the functional review.
-- 
Florian
