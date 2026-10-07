Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A592222AC;
	Wed,  7 Oct 2026 02:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791339136; cv=none; b=BttDTLQbRDWqKRo7VxiyZXmkc9zleKT2gkpIk0KknBEzqfU0nhiPE6tksNIz7rGqNcEDurQW6fU2HGSiN2r+bf3N1tOuLujQMqx/7TCsbVCRX3EfZB3cD0p2KqWkJY5wqbbMXf7YYcbiq0uTfhhTItQRXfiiKDy4vAP3/ygO+jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791339136; c=relaxed/simple;
	bh=HcbHlyDAa4Gm/J9dEMUmk3W5T7P3RyRYVDy2NfHxVUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0Ah9yMoRFMxpOLrfOB4RZG+ABjIFmIfn4cDm6wFXh1ie/4qPE8bjiHViGG/T86bdafgg8HnqMll1SXgqu6oEeiOoxx5KiygsAJY4w+vY8pGv5Zh+C/msD5ab+qLm9dBPSJ4wxWOfEAtuZFdOXFlKNArhFdMV3nL0W3tK4i/psg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=LPux/eGE; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="LPux/eGE"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id CB05540E03BE;
	Wed,  7 Oct 2026 02:12:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id pBR29GntPvhf; Wed,  7 Oct 2026 02:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1791339120; bh=edrBKizi8Y/o+NoHr6PB6dvEJtTx1JjOPN8f3xwfv9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LPux/eGELh8vaNuJWr8dk8iSCdGcGJiwmBuUuuFqYoeD47MpG7Hh5cV/mpRq8s4jr
	 Rwc20VcjFSg3ALXfNOVf/VzdPOw9mSuoq49eUSBmoGADabvavw9N8qo8tYKfZfxP8i
	 77tQKPXAL2+a7vwSqRCZKbsjlFErczhxLETPkAui+7qUXALxxvxOx4dHqwFYXug0eH
	 o2BGxUTTx1zrX0INN4UnR+y1MdGj56HnwlSZ4hhuwx+IeQKr7yzfjcZKsfH6td2Ze4
	 f9SU9UdskazsAISTc72zElEE80U5ohBrw5UZq8c6XWHdPSVYApkvtBzw87J4vo1+Eb
	 oQQbgH4AJv9G8nLqBGRhker9oWuovMZYV0OSbRNUFAR5DGSNspX/YP2G67FePQSPno
	 vjVdGBpHvgxsVN8sDL9vqUj3YP1rAO8M1T852LdwsMUr/ZHQTdiVJ8WGUj0E8nbNCQ
	 GqmQ49x0mcXb6gvtsdCmSSz7QctWfoMfULNx85OcDMm6JfVftQgY6OdUR9kbHjla+y
	 kmXHu1jdwoGZxJJIEQR0JrGL1zyPVlsX1jTm3gml3wpYeT40SKkIGWNufHb/pY21Vs
	 3mPl+/sWu283AioJMvcDIZtLfd/xJ1HnKyGcPTH9M0iMDBdzO7RuV7gZuPOXK4YYLq
	 3v3WMoTPnwFlTTVSvyqyvkGY=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 13CA940E00B9;
	Wed,  7 Oct 2026 02:11:45 +0000 (UTC)
Date: Tue, 6 Oct 2026 19:11:42 -0700
From: Borislav Petkov <bp@alien8.de>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Tony Luck <tony.luck@intel.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
Message-ID: <20261007021142.GAasWqXsuPpjYUIYIv@fat_crate.local>
References: <20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com>
 <20261005-paul-v7-3-rc1-edac-v5-2-140a0f124bc0@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261005-paul-v7-3-rc1-edac-v5-2-140a0f124bc0@bootlin.com>

On Mon, Oct 05, 2026 at 02:49:23PM +0200, Paul Louvel wrote:
> diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
> index a37534300ab9..0d66a072b15c 100644
> --- a/drivers/edac/Makefile
> +++ b/drivers/edac/Makefile
> @@ -82,6 +82,7 @@ obj-$(CONFIG_EDAC_SYNOPSYS)		+= synopsys_edac.o
>  obj-$(CONFIG_EDAC_XGENE)		+= xgene_edac.o
>  obj-$(CONFIG_EDAC_TI)			+= ti_edac.o
>  obj-$(CONFIG_EDAC_QCOM)			+= qcom_edac.o
> +obj-$(CONFIG_EDAC_CADENCE)		+= cadence_edac.o

This goes at the end of that file.

>  obj-$(CONFIG_EDAC_ASPEED)		+= aspeed_edac.o
>  obj-$(CONFIG_EDAC_BLUEFIELD)		+= bluefield_edac.o
>  obj-$(CONFIG_EDAC_DMC520)		+= dmc520_edac.o
> diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
> new file mode 100644
> index 000000000000..26b9a7facd57
> --- /dev/null
> +++ b/drivers/edac/cadence_edac.c
> @@ -0,0 +1,399 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2015 Renesas Electronics Europe Ltd.
> + * Copyright 2026 Bootlin
> + *
> + * Based on highbank EDAC driver:
> + *
> + * Copyright 2011-2012 Calxeda, Inc.
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/edac.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mm.h>
> +#include <linux/of_address.h>
> +#include <linux/string.h>
> +#include <linux/spinlock.h>
> +#include <linux/platform_device.h>

How many of those includes are *actually* needed?

> +#include "edac_mc.h"
> +#include "edac_module.h"
> +
> +#define DRV_NAME "cdns_edac"

"cadence_edac" is a perfectly fine name.

> +#define REG_BYTE_SZ 4
> +#define DDR_CTL(n) ((n) * REG_BYTE_SZ)
> +
> +#define CDNS_DDR_DDR_STAT DDR_CTL(0)

Align all defines vertically like this:

#define REG_BYTE_SZ		4
#define DDR_CTL(n)		((n) * REG_BYTE_SZ)

#define CDNS_DDR_DDR_STAT	DDR_CTL(0)
...

> +#define CDNS_DDR_DDR_STAT_DRAM_CLASS GENMASK_U32(11, 8)
> +#define CDNS_DDR_DDR_STAT_DRAM_DDR2 BIT(2)
> +#define CDNS_DDR_DDR_STAT_GET_DRAM_CLASS(reg) FIELD_GET(CDNS_DDR_DDR_STAT_DRAM_CLASS, reg)

Also, I would shorten those long mouthfuls so that the code remains relatively
readable. The "DDR_DDR" thing above is the first I'd whack. And so on.

> +#define CDNS_DDR_ECC_STAT DDR_CTL(36)
> +#define CDNS_DDR_ECC_STAT_ENABLED BIT(16)
> +#define CDNS_DDR_ECC_STAT_IS_ENABLED(reg) FIELD_GET(CDNS_DDR_ECC_STAT_ENABLED, reg)
> +#define CDNS_DDR_ECC_STAT_FWC BIT(24)
> +
> +#define CDNS_DDR_ECC_XOR DDR_CTL(37)
> +#define CDNS_DDR_ECC_XOR_CHECK_BITS GENMASK_U32(13, 0)
> +
> +#define CDNS_DDR_BUS_CTRL DDR_CTL(54)
> +#define CDNS_DDR_BUS_CTRL_REDUC BIT(1)
> +
> +/* DDR Controller Error Registers */
> +
> +#define CDNS_DDR_ECC_U_ERR_ADDR DDR_CTL(38)
> +#define CDNS_DDR_ECC_U_ERR_STAT DDR_CTL(39)
> +
> +#define CDNS_DDR_ECC_C_ERR_ADDR DDR_CTL(41)
> +#define CDNS_DDR_ECC_C_ERR_STAT DDR_CTL(42)
> +
> +#define CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg) FIELD_GET(GENMASK(6, 0), reg)
> +
> +#define CDNS_DDR_PORT_CMD_ERR_ADDR DDR_CTL(61)
> +#define CDNS_DDR_PORT_CMD_ERR_TYPE DDR_CTL(62)
> +#define CDNS_DDR_PORT_CMD_ERR_TYPE_GET(reg) FIELD_GET(GENMASK_U32(10, 8), reg)
> +
> +/* DDR Controller Interrupt Registers */
> +
> +#define CDNS_DDR_ECC_INT_STAT DDR_CTL(56)
> +#define CDNS_DDR_ECC_INT_STAT_CE BIT(3)
> +#define CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE BIT(4)
> +#define CDNS_DDR_ECC_INT_STAT_UE BIT(5)
> +#define CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE BIT(6)
> +#define CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN BIT(7)
> +
> +#define CDNS_DDR_ECC_INT_ACK DDR_CTL(57)
> +#define CDNS_DDR_ECC_INT_ACK_MASK GENMASK_U32(21, 0)
> +
> +#define CDNS_DDR_ECC_INT_CTRL DDR_CTL(58)
> +#define CDNS_DDR_ECC_INT_CTRL_MASK GENMASK_U32(21, 0)
> +#define CDNS_DDR_ECC_INT_CTRL_MASK_ALL BIT(22)
> +#define CDNS_DDR_ECC_INT_CTRL_UNMASK(i) ((~(i)) & CDNS_DDR_ECC_INT_CTRL_MASK)
> +
> +struct cdns_mc_priv {

For all privately used struct names and static functions, drop the "cdns_"
namespace prefix - it is not necessary.

> +	int irq;
> +	void __iomem *io_base;
> +	struct dentry *debugfs;
> +	spinlock_t lock;
> +	u16 xor_check_bits;
> +};
> +
> +static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
> +{
> +	struct mem_ctl_info *mci = dev_id;
> +	struct cdns_mc_priv *priv = mci->pvt_info;
> +	u32 addr, status, err_addr, syndrome, reg;
> +	char other_details_str[32];
> +	u8 type;
> +
> +	/* Read the interrupt status register */

The fact that you have to put an obvious comment above the read of a register
basically says that your register naming is not optimal enough. If you name it
properly, you don't need a comment.

> +	status = readl(priv->io_base + CDNS_DDR_ECC_INT_STAT);
> +	if (!status)
> +		return IRQ_NONE;
> +
> +	/*
> +	 * We can't know how many CE / UE occurred since last ACK in case of

Please use passive voice: no "we" or "I", etc, and describe things in an
imperative mood.

> +	 * multiple errors. Just report it.
> +	 */
> +
> +	if ((status & CDNS_DDR_ECC_INT_STAT_UE) || (status & CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE)) {

This is what I mean with too long lines. That one and others like it needs
shortening.

Also this test can be merged into a single one by ORing the flags.

> +		reg = readl(priv->io_base + CDNS_DDR_ECC_U_ERR_STAT);
> +		syndrome = CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg);
> +
> +		err_addr = readl(priv->io_base + CDNS_DDR_ECC_U_ERR_ADDR);
> +
> +		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1, err_addr >> PAGE_SHIFT,
> +				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
> +	}

ditto for that one below:

> +	if ((status & CDNS_DDR_ECC_INT_STAT_CE) || (status & CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE)) {
> +		reg = readl(priv->io_base + CDNS_DDR_ECC_C_ERR_STAT);
> +		syndrome = CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg);
> +
> +		err_addr = readl(priv->io_base + CDNS_DDR_ECC_C_ERR_ADDR);
> +
> +		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1, err_addr >> PAGE_SHIFT,
> +				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
> +	}
> +
> +	if (status & CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN) {

What kind of an error is that one so that you have to call
edac_mc_handle_error() for it separately?

> +		addr = readl(priv->io_base + CDNS_DDR_PORT_CMD_ERR_ADDR);
> +		reg = readl(priv->io_base + CDNS_DDR_PORT_CMD_ERR_TYPE);
> +		type = CDNS_DDR_PORT_CMD_ERR_TYPE_GET(reg);
> +
> +		snprintf(other_details_str, sizeof(other_details_str), "type 0x%02x", type);
> +
> +		edac_mc_handle_error(HW_EVENT_ERR_INFO, mci, 1, addr >> PAGE_SHIFT,
> +				     addr & ~PAGE_MASK, 0, 0, 0, -1, mci->ctl_name,
> +				     other_details_str);
> +	}
> +
> +	/* clear the error, clears the interrupt */

No need for obvious comments. Audit your whole driver pls.

> +	writel(status & CDNS_DDR_ECC_INT_ACK_MASK, priv->io_base + CDNS_DDR_ECC_INT_ACK);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int cdns_get_mem_sz(resource_size_t *mem_sz)

Do not use an I/O function param but return the correct size or an error and
have call site handle that.

Looking how that function is called only once, simply merge it into the call
site.

> +{
> +	struct device_node *np;
> +	struct resource res;
> +	int ret;
> +
> +	np = of_find_node_by_name(NULL, "memory");
> +	if (!np)
> +		return -ENODEV;
> +
> +	ret = of_address_to_resource(np, 0, &res);
> +
> +	of_node_put(np);
> +
> +	if (ret)
> +		return ret;
> +
> +	*mem_sz = resource_size(&res);
> +
> +	return 0;
> +}

> +
> +#ifdef CONFIG_EDAC_DEBUG
> +
> +static void cdns_rmw(struct cdns_mc_priv *priv, u32 reg, u32 mask, u32 val)
> +{
> +	u32 regval;
> +
> +	regval = readl(priv->io_base + reg);
> +	regval &= ~mask;
> +	regval |= (val << __bf_shf(mask)) & mask;
> +	writel(regval, priv->io_base + reg);
> +}
> +
> +static ssize_t cdns_force_ecc_error(struct file *file, const char __user *data, size_t count,
> +				    loff_t *ppos)
> +{
> +	struct device *dev = file->private_data;
> +	struct mem_ctl_info *mci = to_mci(dev);
> +	struct cdns_mc_priv *priv = mci->pvt_info;
> +
> +	spin_lock(&priv->lock);
> +
> +	cdns_rmw(priv, CDNS_DDR_ECC_XOR, CDNS_DDR_ECC_XOR_CHECK_BITS, priv->xor_check_bits);
> +	cdns_rmw(priv, CDNS_DDR_ECC_STAT, CDNS_DDR_ECC_STAT_FWC, 1);
> +
> +	spin_unlock(&priv->lock);
> +
> +	return count;
> +}
> +
> +static const struct file_operations cdns_ecc_error_fops = {
> +	.open = simple_open,
> +	.write = cdns_force_ecc_error,
> +	.llseek = generic_file_llseek,
> +};

#else
static ssize_t cdns_force_ecc_error(struct file *file, const char __user *data, size_t count, loff_t *ppos)
{
	return 0
}
#endif

and get rid of the ifdeffery below.

> +static void cdns_setup_debugfs(struct mem_ctl_info *mci)
> +{
> +	struct cdns_mc_priv *priv = mci->pvt_info;
> +
> +	priv->debugfs = edac_debugfs_create_dir(DRV_NAME);
> +	if (!priv->debugfs) {
> +		dev_dbg(mci->pdev, "failed to create debugfs dir\n");
> +		return;
> +	}
> +
> +	edac_debugfs_create_x16("bits", 0644, priv->debugfs, &priv->xor_check_bits);
> +	edac_debugfs_create_file("inject", 0200, priv->debugfs, &mci->dev, &cdns_ecc_error_fops);
> +}
> +
> +#endif

...

> +
> +	/*
> +	 * Unmask ECC recoverable and unrecoverable interrupts, and port
> +	 * command errors.
> +	 */
> +	writel(CDNS_DDR_ECC_INT_CTRL_UNMASK(
> +		       CDNS_DDR_ECC_INT_STAT_CE | CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE |
> +		       CDNS_DDR_ECC_INT_STAT_UE | CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE |
> +		       CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN),

Yah, unreadable mess that. Shorten pls.

> +	       io_base + CDNS_DDR_ECC_INT_CTRL);
> +
> +	return 0;
> +}

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
