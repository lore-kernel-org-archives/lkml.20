Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E742F3EFFA9;
	Sun, 20 Sep 2026 10:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789901920; cv=none; b=t+WY1+ZDfVXYXxFLYaaraBuA9AmhNvFOPzOQtblnqdaMDOh6wcdlI1TDTyLyYworqpmYrsmQ/0MYPxmvI2Hk0pLba1xyTnPBRb08umsvM8mN7BxG1EYXr/XhYJcygtwxOH2EGbGoS+CZgnZDgLWIK0DZRag7BBxgRh7iEut0syE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789901920; c=relaxed/simple;
	bh=TOH7G6Te9b+3QD9q8YvN2GbGDK4XSLDQc0HNvDrqrCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=slFmtK34zmNvIWPRn1y4CU1MCEYPGGTWAIVjl5CHtvUoRLmJTBovtuIDv2sbMAULiOXugEdt5cND6ViU0yZfG5R8WZ1fcJolY6waQssFRlggew62yuNGSh0HFj4W5bQlinLFX7UwjKUZjbaffj+ALZKANA5otr9llrCTnNw5fgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JaJ4/Kbn; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JaJ4/Kbn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1789901863;
	bh=RkSqgdLhQ8e5Fcv8nT2UXcPrVXEP8RQT3eV54oY4OAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=JaJ4/KbnY2isl8cUnEgjaZqN3wZwz6imkpsQmtsO0J1OwI8SfWU1cAjfUhbehZRcc
	 CsvI+H+IEAYVjs4uYw/FU1hLc+bLfeN5n3jIG0atx7EvOBurTViID2sOIefssAWiVH
	 qzBpdW/vNzfwy+X6qAwfj6qi/NiGTbrpx6JOcxlY=
X-QQ-mid: zesmtpsz2t1789901861t447a4279
X-QQ-Originating-IP: cGz5GfPNM4F41PHQGZc7YNQgQDpaX72X8PNAZ//PIzM=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 20 Sep 2026 18:57:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1403582578887020598
Message-ID: <B7328085242CCEBC+79e771a5-04e6-4265-ab84-6c2848c0aa3c@linux.spacemit.com>
Date: Sun, 20 Sep 2026 18:57:38 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/14] gtrace: Add RISC-V Trace ramsink driver
To: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ian Rogers <irogers@google.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Jiri Olsa <jolsa@kernel.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>,
 Andrew Jones <andrew.jones@oss.qualcomm.com>,
 Sunil V L <sunilvl@oss.qualcomm.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Anup Patel <anup.patel@oss.qualcomm.com>
References: <20260810152223.3946743-1-mayuresh.chitale@oss.qualcomm.com>
 <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20260810152223.3946743-10-mayuresh.chitale@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: Mutteg8H72qDmgHgr61YGLJ5wGQzHbJyBRjwQPkv/AhUvfFHbMkbn6fM
	uTuLGJTpfMlSUmyCs/Wolsbn1xwEc/g070IOGdbLE8/UW2H0OH35i0yEAiChE+QBRteaENf
	qPqwWJAQIeyS6NgggQZh0TzQZrqJ8n34aoYOV9EPT3CtsWHiM/DG/Acf6vBQ87X6SEHJbNY
	ySmbuZjKzyEXhek9FM+cOnjyUrHrKyaCaoC8IP8hLVZZv5Wj4XG+GvoPjpC51OyUHk6A+Rk
	DlkWHw/7fWsquDY6BUt3YNF/xT3JFERXXwSKOyH1aeAu7kjurw/iyNPK4w/wU0Vz8CLyviw
	WAS6QGeC2olYn8EMwPRf2eZHjIXEICrSW8z/Va5Sds3kZw8BqPkzKmphOG1EX3usJyI4JFT
	qdzwzQFBR8hs6oTSCV03nlBtOVGLTeXAmf6d23Aiwz+mBaArYxiZLRA42LQfIysioJpJmi9
	wqe1+4EyJkOHcyxWsiRqsmI9ILyzI8HBP7JyGKWZj0C9DWMam0Lcg0JArb4wC5UoQ+8Mkr9
	PIchKrFA/subb2MuyLGjHxrGvSkE66C1Ixn1ebMHnlzzpjwXCzmnTBPuQ2wiOYHuqAxwZv3
	Twiws1lMxQzY7sAeOGt8tVs+Z2TqZW4A+e5C9UOe6mpnGDbVOD5ZMM22iVRLn73ftz1oBAJ
	A95tDO1jTB+R/p6yMgL9uVWRb3vpO9gTUx+Z2lcfSNy1Fqkt75TQvQKDSp5NqnrHvfDr6BI
	bzL9WFQji6bNi6LQExsoyuLlhy3wso//QfsPeVe0Vg8AlkSbU9PrduOKt2U0D0JeYjQ8Sv6
	4nSkgSFjTpITPuoLURDVxDQx2S4Nm170SLfnq7c3rKxKRkgmNH5j3XRCPG+ISVbH4bp97A+
	pUeOoyxewnhxcZ+wsAxOl2STDujRxRZbSw7QLKDOt4a1RsNBa3HvpkONqFntzwArvVEXIV8
	gDVF2Z2Z8oAIqQ4mHIdl+QUjyIGa/Vfmo6dBZmeCbFdOy17uAg+GLZmd1I2R13MSbyp5+SP
	AxZ4Y8e6kvJ6d8o17+1ZNdjbPZDCgVXj0CU54Dfg==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0


On 8/10/2026 11:22 PM, Mayuresh Chitale wrote:
> Add initial implementation of RISC-V E-Trace ramsink driver. The ramsink
> is defined in the RISC-V Trace Control Interface specification.
>
> Co-developed-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Anup Patel <anup.patel@oss.qualcomm.com>
> Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
> ---
>  drivers/hwtracing/gtrace/Kconfig           |  15 +
>  drivers/hwtracing/gtrace/Makefile          |   1 +
>  drivers/hwtracing/gtrace/rvtrace-ramsink.c | 320 +++++++++++++++++++++
>  3 files changed, 336 insertions(+)
>  create mode 100644 drivers/hwtracing/gtrace/rvtrace-ramsink.c
>
> diff --git a/drivers/hwtracing/gtrace/Kconfig b/drivers/hwtracing/gtrace/Kconfig
> index e3a621b59913..de4a3b533591 100644
> --- a/drivers/hwtracing/gtrace/Kconfig
> +++ b/drivers/hwtracing/gtrace/Kconfig
> @@ -41,3 +41,18 @@ config RVTRACE_ENCODER
>  
>  	  To compile this driver as a module, choose M here: the module
>  	  will be called rvtrace-encoder.
> +
> +config RVTRACE_RAMSINK
> +	tristate "RISC-V Trace Ramsink driver"
> +	depends on RVTRACE
> +	select DMA_SHARED_BUFFER
> +	default y
> +	help
> +	  This driver provides support for the RISC-V trace ramsink component
> +	  which is defined by the RISC-V Trace Control Interface specification.
> +	  The ramsink is a trace sink which stores the trace data generated by
> +	  the upstream components into a system memory buffer. The buffer is
> +	  then copied to the perf AUX buffer when tracing using the perf tool.
> +
> +	  To compile this driver as a module, choose M here: the module
> +	  will be called rvtrace-ramsink.
> diff --git a/drivers/hwtracing/gtrace/Makefile b/drivers/hwtracing/gtrace/Makefile
> index 10a74f852115..3e0c68d1b632 100644
> --- a/drivers/hwtracing/gtrace/Makefile
> +++ b/drivers/hwtracing/gtrace/Makefile
> @@ -5,3 +5,4 @@ gtrace-y := gtrace-core.o
>  
>  obj-$(CONFIG_RVTRACE) += rvtrace-platform.o
>  obj-$(CONFIG_RVTRACE_ENCODER) += rvtrace-encoder.o
> +obj-$(CONFIG_RVTRACE_RAMSINK) += rvtrace-ramsink.o
> diff --git a/drivers/hwtracing/gtrace/rvtrace-ramsink.c b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
> new file mode 100644
> index 000000000000..7ed25cf364a7
> --- /dev/null
> +++ b/drivers/hwtracing/gtrace/rvtrace-ramsink.c
> @@ -0,0 +1,320 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2026 Qualcomm Technologies, Inc.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/gtrace.h>
> +#include <linux/types.h>
> +#include <linux/sizes.h>
> +#include <uapi/linux/perf_event.h>
> +#include "rvtrace.h"
> +
> +#define RVTRACE_RAMSINK_STARTLOW_OFF		0x010
> +#define RVTRACE_RAMSINK_STARTHIGH_OFF		0x014
> +#define RVTRACE_RAMSINK_LIMITLOW_OFF		0x018
> +#define RVTRACE_RAMSINK_LIMITHIGH_OFF		0x01c
> +#define RVTRACE_RAMSINK_WPLOW_OFF		0x020
> +#define RVTRACE_RAMSINK_WPHIGH_OFF		0x024
> +#define RVTRACE_RAMSINK_WPLOW_WRAP		0x1
> +#define RVTRACE_RAMSINK_CTRL_MODE_SHIFT		0x4
> +#define RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT	0x8
> +
> +enum rvtrace_ramsink_mode {
> +	MODE_SRAM,
> +	MODE_SMEM
> +};
> +
> +struct rvtrace_ramsink_priv {
> +	size_t size;
> +	void *va;
> +	dma_addr_t start;
> +	dma_addr_t end;
> +	enum rvtrace_ramsink_mode mode;
> +	bool stop_on_wrap;
> +	int mem_acc_width;
> +	u64 prev_wp;
> +};
> +
> +struct trace_buf {
> +	void *base;
> +	size_t cur;
> +	size_t len;
> +};
> +
> +static int rvtrace_ramsink_start(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = gtrace_enable_component(comp);
> +	if (ret)
> +		dev_err(&comp->dev, "failed to start ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static int rvtrace_ramsink_stop(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = gtrace_disable_component(comp);
> +	if (ret) {
> +		dev_err(&comp->dev, "failed to stop ramsink.\n");
> +		return ret;
> +	}
> +
> +	return rvtrace_comp_poll_empty(comp);
> +}
> +
> +static void tbuf_to_pbuf_copy(struct trace_buf *src, struct trace_buf *dst, size_t size)
> +{
> +	int bytes_dst, bytes_src, bytes;
> +	void *dst_addr, *src_addr;
> +
> +	/* If destination cannot hold entire source buffer then write only the latest data. */
> +	if (dst->len < size) {
> +		src->cur = (src->cur + size - dst->len) % src->len;
> +		size = dst->len;
> +	}
> +
> +	while (size) {
> +		src_addr = src->base + src->cur;
> +		dst_addr = dst->base + dst->cur;
> +
> +		/* Ensure that there are no OOB memory accesses */
> +		if (dst->len - dst->cur < size)
> +			bytes_dst = dst->len - dst->cur;
> +		else
> +			bytes_dst = size;
> +
> +		if (src->len - src->cur < size)
> +			bytes_src = src->len - src->cur;
> +		else
> +			bytes_src = size;
> +		bytes = bytes_dst < bytes_src ? bytes_dst : bytes_src;
> +		memcpy(dst_addr, src_addr, bytes);
> +		dst->cur = (dst->cur + bytes) % dst->len;
> +		src->cur = (src->cur + bytes) % src->len;
> +		size -= bytes;
> +	}
> +}
> +
> +static size_t rvtrace_ramsink_copyto_auxbuf(struct gtrace_component *comp,
> +					    struct gtrace_perf_auxbuf *buf,
> +					    u64 *format)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +	struct trace_buf src, dst;
> +	u32 wp_low, wp_high;
> +	size_t bytes = 0;
> +	bool wrap;
> +	u64 wp;
> +
> +	dst.base = buf->base;
> +	dst.len = buf->length;
> +	dst.cur = buf->pos;
> +	src.base = priv->va;
> +	src.len = priv->size;
> +	wp_low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPLOW_OFF);
> +	wp_high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_WPHIGH_OFF);
> +	wp = (u64)(wp_high) << 32 | wp_low;
> +	wrap = wp & RVTRACE_RAMSINK_WPLOW_WRAP;
> +	wp &= ~RVTRACE_RAMSINK_WPLOW_WRAP;
> +	if (wrap) {
> +		gtrace_write32(comp->pdata, lower_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPLOW_OFF);
> +		gtrace_write32(comp->pdata, upper_32_bits(priv->start),
> +				RVTRACE_RAMSINK_WPHIGH_OFF);
> +		src.cur = wp - priv->start;
> +		priv->prev_wp = priv->start;
> +		/*
> +		 * There is no way to tell if trRamWp wrapped around more than once. As a
> +		 * result priv->prev_wp can't be used and the entire buffer must be copied
> +		 * even though some data might be duplicated.
> +		 */
> +		bytes = priv->size;
> +	} else {
> +		src.cur =  priv->prev_wp - priv->start;
> +		bytes = wp - priv->prev_wp;
> +		priv->prev_wp = wp;
> +	}
> +
> +	tbuf_to_pbuf_copy(&src, &dst, bytes);
> +	dev_dbg(&comp->dev, "Copied %zu bytes\n", bytes);
> +	*format = PERF_AUX_FLAG_GTRACE_FORMAT_ETRACE;
> +	return bytes;
> +}
> +
> +static int rvtrace_ramsink_setup_buf(struct gtrace_component *comp,
> +				     struct rvtrace_ramsink_priv *priv)
> +{
> +	struct device *pdev = comp->pdata->dev;
> +	u64 start_min, limit_max, end;
> +	u32 low, high;
> +	int ret;
> +
> +	/* Probe min and max values for start and limit registers */
> +	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, 0, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	start_min = (u64)(high) << 32 | low;
> +
> +	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	gtrace_write32(comp->pdata, 0xffffffff, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	limit_max = (u64)(high) << 32 | low;
> +
> +	/* Set DMA mask based on the maximum allowed limit address */
> +	ret = dma_set_mask_and_coherent(pdev, DMA_BIT_MASK(fls64(limit_max)));
> +	if (ret)
> +		return ret;
> +
> +	priv->va = dma_alloc_coherent(pdev, priv->size, &priv->start, GFP_KERNEL);
> +	if (!priv->va)
> +		return -ENOMEM;
> +
> +	priv->end = priv->start + priv->size;
> +	priv->prev_wp = priv->start;
> +	if (priv->end <= start_min || priv->start >= limit_max) {
> +		dma_free_coherent(pdev, priv->size, priv->va, priv->start);
> +		dev_err(&comp->dev, "DMA memory not addressable by device\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Setup ram sink start addresses */
> +	if (priv->start < start_min) {
> +		dev_warn(&comp->dev, "Ramsink start address updated from %pad to %pad\n",
> +			 &priv->start, &start_min);
> +		priv->va += start_min - priv->start;
> +		priv->start = start_min;
> +	}
> +
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_STARTLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_STARTHIGH_OFF);
> +	gtrace_write32(comp->pdata, lower_32_bits(priv->start), RVTRACE_RAMSINK_WPLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(priv->start), RVTRACE_RAMSINK_WPHIGH_OFF);
> +	/* Setup ram sink limit addresses */
> +	if (priv->end > limit_max) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &limit_max);
> +		priv->end = limit_max;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	/* Limit address needs to be set to end - mem_access_width to avoid overflow */
> +	end = priv->end - priv->mem_acc_width;
> +	gtrace_write32(comp->pdata, lower_32_bits(end), RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	gtrace_write32(comp->pdata, upper_32_bits(end), RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	low = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITLOW_OFF);
> +	high = gtrace_read32(comp->pdata, RVTRACE_RAMSINK_LIMITHIGH_OFF);
> +	end = (u64)(high) << 32 | low;
> +	if (end != (priv->end - 4)) {
> +		dev_warn(&comp->dev, "Ramsink limit address updated from %pad to %pad\n",
> +			 &priv->end, &end);
> +		priv->end = end;
> +		priv->size = priv->end - priv->start;
> +	}
> +
> +	return 0;
> +}
> +
> +static int rvtrace_ramsink_setup(struct gtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv;
> +	u32 trram_ctrl;
> +	int ret;
> +
> +	priv = devm_kzalloc(&comp->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	/* Derive RAM sink memory size based on component implementation ID */
> +	switch (comp->pdata->impid) {
> +	default:
> +		priv->size = SZ_1M;
> +		priv->mode = MODE_SMEM;
> +		priv->stop_on_wrap = false;
> +		priv->mem_acc_width = 4;
> +		break;
> +	}
> +

I think `trram_ctrl` should not be written during the `probe`. We may modify `rvtrace_ramsink_priv`

through sysfs or perf events.

> +	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl |= priv->mode << RVTRACE_RAMSINK_CTRL_MODE_SHIFT;
> +	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	trram_ctrl = gtrace_read32(comp->pdata, RVTRACE_COMPONENT_CTRL_OFFSET);
> +	dev_dbg(&comp->dev, "mode: %s\n", (trram_ctrl >> RVTRACE_RAMSINK_CTRL_MODE_SHIFT) & 0x1 ?
> +		 "SMEM" : "SRAM");
> +
> +	trram_ctrl |= priv->stop_on_wrap << RVTRACE_RAMSINK_CTRL_STP_WRAP_SHIFT;
> +	gtrace_write32(comp->pdata, trram_ctrl, RVTRACE_COMPONENT_CTRL_OFFSET);
> +
> +	ret = rvtrace_ramsink_setup_buf(comp, priv);
> +	if (!ret)
> +		dev_set_drvdata(&comp->dev, priv);
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_cleanup(struct gtrace_component *comp)
> +{
> +	struct rvtrace_ramsink_priv *priv = dev_get_drvdata(&comp->dev);
> +
> +	dma_free_coherent(comp->pdata->dev, priv->size, priv->va, priv->start);
> +}
> +
> +static int rvtrace_ramsink_probe(struct gtrace_component *comp)
> +{
> +	int ret;
> +
> +	ret = rvtrace_ramsink_setup(comp);
> +	if (ret)
> +		return dev_err_probe(&comp->dev, ret, "failed to setup ramsink.\n");
> +
> +	return ret;
> +}
> +
> +static void rvtrace_ramsink_remove(struct gtrace_component *comp)
> +{
> +	rvtrace_ramsink_cleanup(comp);
> +}
> +
> +static const struct gtrace_component_id rvtrace_ramsink_ids[] = {
> +	{ .type = GTRACE_RVTRACE_RAMSINK,
> +	  .version = rvtrace_component_mkversion(1, 0), },
> +	{},
> +};
> +
> +static struct gtrace_driver rvtrace_ramsink_driver = {
> +	.id_table = rvtrace_ramsink_ids,
> +	.copyto_auxbuf = rvtrace_ramsink_copyto_auxbuf,
> +	.stop = rvtrace_ramsink_stop,
> +	.start = rvtrace_ramsink_start,
> +	.probe = rvtrace_ramsink_probe,
> +	.remove = rvtrace_ramsink_remove,
> +	.driver = {
> +		.name = "rvtrace-ramsink",
> +	},
> +};
> +
> +static int __init rvtrace_ramsink_init(void)
> +{
> +	return gtrace_register_driver(&rvtrace_ramsink_driver);
> +}
> +
> +static void __exit rvtrace_ramsink_exit(void)
> +{
> +	gtrace_unregister_driver(&rvtrace_ramsink_driver);
> +}
> +
> +module_init(rvtrace_ramsink_init);
> +module_exit(rvtrace_ramsink_exit);
> +
> +/* Module information */
> +MODULE_AUTHOR("Mayuresh Chitale");
> +MODULE_DESCRIPTION("RISC-V E-Trace Ramsink Driver");
> +MODULE_LICENSE("GPL");
