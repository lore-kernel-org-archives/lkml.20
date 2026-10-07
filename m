Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B8635838E
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 04:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791348782; cv=none; b=LUM/+JOV7rB6szJDBAV3wzG5kmIPNoudGu5qqWv1lyjHY5ha6CzLUfHA4ebb+i0+Lzv6HNGxzBemf9VCIE7OnyIjZMn77CMBpsL8WTT5Xv/kDMIsMVIqn7wEimIp5wT9qL7Th8gTuGWdL2EJrrSXan5go22geOnmvIHNr+cqO3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791348782; c=relaxed/simple;
	bh=5/mExKlG1hnzAPCquhIi5VcnPc6zytHJVAxa63yE5e4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=dosYzMPdAgl+Ff+rnH7H68pOjmg8DeCN48N5XdeoDcfC3wJpVGu1HlOvpffz4JmdKmc2bHDXxxBiqDlWApwaTxn3tsl3Q6X6UCtF5cD6qkthm3Z4jxzwsilsZfjHwP+ZC4UueMAZKIerShXjl0cJnmtv8jHQUn0sPOdmgT3Y48s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=jFh4B2+t; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="jFh4B2+t"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B83441A1164;
	Wed,  7 Oct 2026 04:52:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 449FB6074B;
	Wed,  7 Oct 2026 04:52:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C4A6410330332;
	Wed,  7 Oct 2026 06:52:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791348774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j7IEOp9lHLCsZ7esGUkRf4X2OUXpqeqqHgfGcznUyME=;
	b=jFh4B2+teVqEuDYvLCOd6LoEpnGRXu02Gvdq4n9H1QMo3OI4ZFWwwU/56L1VKaqNBFQzbQ
	lx1AgVzVsS16Yc2n5Z3lalM3LZRyUXaDC1A7TF0BBLmqFjPyZJnmqKlhv3TIaK3f2Nrrai
	WIxaQkczuwYsnedgW9RXsUWNgURA217cjmV/kIX18+rYrJPsQsuB84xq7Yvj5eSJ+IJeeO
	uuLib4CkGWh3dPsr8kzVGqJrU+UXgzLfrHaZK3tFyICnJ+Tq8hILEZQuDn35VeNAf0J8f5
	jTHHc8IW130QCal3JH3U4ccYOpxxzM/ns1QKPvciLqiaLuYXDt9VWLjCbxuCbQ==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Oct 2026 06:52:49 +0200
Message-Id: <DLYC540CZECH.27M5I74J8RPRE@bootlin.com>
Cc: "Tony Luck" <tony.luck@intel.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Magnus Damm" <magnus.damm@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-edac@vger.kernel.org>,
 <devicetree@vger.kernel.org>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 2/3] EDAC/cadence: Add Cadence DDR EDAC driver
From: "Paul Louvel" <paul.louvel@bootlin.com>
To: "Borislav Petkov" <bp@alien8.de>, "Paul Louvel"
 <paul.louvel@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261005-paul-v7-3-rc1-edac-v5-0-140a0f124bc0@bootlin.com>
 <20261005-paul-v7-3-rc1-edac-v5-2-140a0f124bc0@bootlin.com>
 <20261007021142.GAasWqXsuPpjYUIYIv@fat_crate.local>
In-Reply-To: <20261007021142.GAasWqXsuPpjYUIYIv@fat_crate.local>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Oct 7, 2026 at 4:11 AM CEST, Borislav Petkov wrote:
> On Mon, Oct 05, 2026 at 02:49:23PM +0200, Paul Louvel wrote:
>> diff --git a/drivers/edac/Makefile b/drivers/edac/Makefile
>> index a37534300ab9..0d66a072b15c 100644
>> --- a/drivers/edac/Makefile
>> +++ b/drivers/edac/Makefile
>> @@ -82,6 +82,7 @@ obj-$(CONFIG_EDAC_SYNOPSYS)		+=3D synopsys_edac.o
>>  obj-$(CONFIG_EDAC_XGENE)		+=3D xgene_edac.o
>>  obj-$(CONFIG_EDAC_TI)			+=3D ti_edac.o
>>  obj-$(CONFIG_EDAC_QCOM)			+=3D qcom_edac.o
>> +obj-$(CONFIG_EDAC_CADENCE)		+=3D cadence_edac.o
>
> This goes at the end of that file.
>
>>  obj-$(CONFIG_EDAC_ASPEED)		+=3D aspeed_edac.o
>>  obj-$(CONFIG_EDAC_BLUEFIELD)		+=3D bluefield_edac.o
>>  obj-$(CONFIG_EDAC_DMC520)		+=3D dmc520_edac.o
>> diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
>> new file mode 100644
>> index 000000000000..26b9a7facd57
>> --- /dev/null
>> +++ b/drivers/edac/cadence_edac.c
>> @@ -0,0 +1,399 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Copyright 2015 Renesas Electronics Europe Ltd.
>> + * Copyright 2026 Bootlin
>> + *
>> + * Based on highbank EDAC driver:
>> + *
>> + * Copyright 2011-2012 Calxeda, Inc.
>> + */
>> +
>> +#include <linux/bits.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/clk.h>
>> +#include <linux/edac.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/mm.h>
             ^^^^^^^^^^^^
I think this one is not needed.

>> +#include <linux/of_address.h>
>> +#include <linux/string.h>
             ^^^^^^^^^^^^^^^^
This one too since I will remove the port channel protection feature, and t=
he
snprintf will go away.

>> +#include <linux/spinlock.h>
>> +#include <linux/platform_device.h>
>
> How many of those includes are *actually* needed?
>
>> +#include "edac_mc.h"
>> +#include "edac_module.h"
>> +
>> +#define DRV_NAME "cdns_edac"
>
> "cadence_edac" is a perfectly fine name.
>
>> +#define REG_BYTE_SZ 4
>> +#define DDR_CTL(n) ((n) * REG_BYTE_SZ)
>> +
>> +#define CDNS_DDR_DDR_STAT DDR_CTL(0)
>
> Align all defines vertically like this:
>
> #define REG_BYTE_SZ		4
> #define DDR_CTL(n)		((n) * REG_BYTE_SZ)
>
> #define CDNS_DDR_DDR_STAT	DDR_CTL(0)
> ...
>
>> +#define CDNS_DDR_DDR_STAT_DRAM_CLASS GENMASK_U32(11, 8)
>> +#define CDNS_DDR_DDR_STAT_DRAM_DDR2 BIT(2)
>> +#define CDNS_DDR_DDR_STAT_GET_DRAM_CLASS(reg) FIELD_GET(CDNS_DDR_DDR_ST=
AT_DRAM_CLASS, reg)
>
> Also, I would shorten those long mouthfuls so that the code remains relat=
ively
> readable. The "DDR_DDR" thing above is the first I'd whack. And so on.

I will drop the first "DDR" prefix.

>
>> +#define CDNS_DDR_ECC_STAT DDR_CTL(36)
>> +#define CDNS_DDR_ECC_STAT_ENABLED BIT(16)
>> +#define CDNS_DDR_ECC_STAT_IS_ENABLED(reg) FIELD_GET(CDNS_DDR_ECC_STAT_E=
NABLED, reg)
>> +#define CDNS_DDR_ECC_STAT_FWC BIT(24)
>> +
>> +#define CDNS_DDR_ECC_XOR DDR_CTL(37)
>> +#define CDNS_DDR_ECC_XOR_CHECK_BITS GENMASK_U32(13, 0)
>> +
>> +#define CDNS_DDR_BUS_CTRL DDR_CTL(54)
>> +#define CDNS_DDR_BUS_CTRL_REDUC BIT(1)
>> +
>> +/* DDR Controller Error Registers */
>> +
>> +#define CDNS_DDR_ECC_U_ERR_ADDR DDR_CTL(38)
>> +#define CDNS_DDR_ECC_U_ERR_STAT DDR_CTL(39)
>> +
>> +#define CDNS_DDR_ECC_C_ERR_ADDR DDR_CTL(41)
>> +#define CDNS_DDR_ECC_C_ERR_STAT DDR_CTL(42)
>> +
>> +#define CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg) FIELD_GET(GENMASK(6, 0)=
, reg)
>> +
>> +#define CDNS_DDR_PORT_CMD_ERR_ADDR DDR_CTL(61)
>> +#define CDNS_DDR_PORT_CMD_ERR_TYPE DDR_CTL(62)
>> +#define CDNS_DDR_PORT_CMD_ERR_TYPE_GET(reg) FIELD_GET(GENMASK_U32(10, 8=
), reg)
>> +
>> +/* DDR Controller Interrupt Registers */
>> +
>> +#define CDNS_DDR_ECC_INT_STAT DDR_CTL(56)
>> +#define CDNS_DDR_ECC_INT_STAT_CE BIT(3)
>> +#define CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE BIT(4)
>> +#define CDNS_DDR_ECC_INT_STAT_UE BIT(5)
>> +#define CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE BIT(6)
>> +#define CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN BIT(7)
>> +
>> +#define CDNS_DDR_ECC_INT_ACK DDR_CTL(57)
>> +#define CDNS_DDR_ECC_INT_ACK_MASK GENMASK_U32(21, 0)
>> +
>> +#define CDNS_DDR_ECC_INT_CTRL DDR_CTL(58)
>> +#define CDNS_DDR_ECC_INT_CTRL_MASK GENMASK_U32(21, 0)
>> +#define CDNS_DDR_ECC_INT_CTRL_MASK_ALL BIT(22)
>> +#define CDNS_DDR_ECC_INT_CTRL_UNMASK(i) ((~(i)) & CDNS_DDR_ECC_INT_CTRL=
_MASK)
>> +
>> +struct cdns_mc_priv {
>
> For all privately used struct names and static functions, drop the "cdns_=
"
> namespace prefix - it is not necessary.
>
>> +	int irq;
>> +	void __iomem *io_base;
>> +	struct dentry *debugfs;
>> +	spinlock_t lock;
>> +	u16 xor_check_bits;
>> +};
>> +
>> +static irqreturn_t cdns_mc_err_handler(int irq, void *dev_id)
>> +{
>> +	struct mem_ctl_info *mci =3D dev_id;
>> +	struct cdns_mc_priv *priv =3D mci->pvt_info;
>> +	u32 addr, status, err_addr, syndrome, reg;
>> +	char other_details_str[32];
>> +	u8 type;
>> +
>> +	/* Read the interrupt status register */
>
> The fact that you have to put an obvious comment above the read of a regi=
ster
> basically says that your register naming is not optimal enough. If you na=
me it
> properly, you don't need a comment.
>

I do think the register naming is fine and follows common conventions
(INT=3Dinterrupt, STAT=3Dstatus). Also, the datasheet does not give any mea=
ningful
name to these registers (generic like DDR_CTL_##) and usually a single regi=
ster
is used for multiple purposes..
I will remove the comment.

>> +	status =3D readl(priv->io_base + CDNS_DDR_ECC_INT_STAT);
>> +	if (!status)
>> +		return IRQ_NONE;
>> +
>> +	/*
>> +	 * We can't know how many CE / UE occurred since last ACK in case of
>
> Please use passive voice: no "we" or "I", etc, and describe things in an
> imperative mood.
>
>> +	 * multiple errors. Just report it.
>> +	 */
>> +
>> +	if ((status & CDNS_DDR_ECC_INT_STAT_UE) || (status & CDNS_DDR_ECC_INT_=
STAT_MULTIPLE_UE)) {
>
> This is what I mean with too long lines. That one and others like it need=
s
> shortening.
>
> Also this test can be merged into a single one by ORing the flags.
>
>> +		reg =3D readl(priv->io_base + CDNS_DDR_ECC_U_ERR_STAT);
>> +		syndrome =3D CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg);
>> +
>> +		err_addr =3D readl(priv->io_base + CDNS_DDR_ECC_U_ERR_ADDR);
>> +
>> +		edac_mc_handle_error(HW_EVENT_ERR_UNCORRECTED, mci, 1, err_addr >> PA=
GE_SHIFT,
>> +				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
>> +	}
>
> ditto for that one below:
>
>> +	if ((status & CDNS_DDR_ECC_INT_STAT_CE) || (status & CDNS_DDR_ECC_INT_=
STAT_MULTIPLE_CE)) {
>> +		reg =3D readl(priv->io_base + CDNS_DDR_ECC_C_ERR_STAT);
>> +		syndrome =3D CDNS_DDR_ECC_ERR_STAT_GET_SYNDROME(reg);
>> +
>> +		err_addr =3D readl(priv->io_base + CDNS_DDR_ECC_C_ERR_ADDR);
>> +
>> +		edac_mc_handle_error(HW_EVENT_ERR_CORRECTED, mci, 1, err_addr >> PAGE=
_SHIFT,
>> +				     err_addr & ~PAGE_MASK, syndrome, 0, 0, -1, mci->ctl_name, "");
>> +	}
>> +
>> +	if (status & CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN) {
>
> What kind of an error is that one so that you have to call
> edac_mc_handle_error() for it separately?

This is a leftover from the downstream driver I picked up.
TBH, I do not think this error belongs in an EDAC driver so I will remove i=
t.
This is a protection feature of the memory controller that is not related t=
o
ECC.

>
>> +		addr =3D readl(priv->io_base + CDNS_DDR_PORT_CMD_ERR_ADDR);
>> +		reg =3D readl(priv->io_base + CDNS_DDR_PORT_CMD_ERR_TYPE);
>> +		type =3D CDNS_DDR_PORT_CMD_ERR_TYPE_GET(reg);
>> +
>> +		snprintf(other_details_str, sizeof(other_details_str), "type 0x%02x",=
 type);
>> +
>> +		edac_mc_handle_error(HW_EVENT_ERR_INFO, mci, 1, addr >> PAGE_SHIFT,
>> +				     addr & ~PAGE_MASK, 0, 0, 0, -1, mci->ctl_name,
>> +				     other_details_str);
>> +	}
>> +
>> +	/* clear the error, clears the interrupt */
>
> No need for obvious comments. Audit your whole driver pls.
>
>> +	writel(status & CDNS_DDR_ECC_INT_ACK_MASK, priv->io_base + CDNS_DDR_EC=
C_INT_ACK);
>> +
>> +	return IRQ_HANDLED;
>> +}
>> +
>> +static int cdns_get_mem_sz(resource_size_t *mem_sz)
>
> Do not use an I/O function param but return the correct size or an error =
and
> have call site handle that.
>
> Looking how that function is called only once, simply merge it into the c=
all
> site.

Liked it that way so I can avoid any potential overflow situation.
But yeah, will merge it.

>
>> +{
>> +	struct device_node *np;
>> +	struct resource res;
>> +	int ret;
>> +
>> +	np =3D of_find_node_by_name(NULL, "memory");
>> +	if (!np)
>> +		return -ENODEV;
>> +
>> +	ret =3D of_address_to_resource(np, 0, &res);
>> +
>> +	of_node_put(np);
>> +
>> +	if (ret)
>> +		return ret;
>> +
>> +	*mem_sz =3D resource_size(&res);
>> +
>> +	return 0;
>> +}
>
>> +
>> +#ifdef CONFIG_EDAC_DEBUG
>> +
>> +static void cdns_rmw(struct cdns_mc_priv *priv, u32 reg, u32 mask, u32 =
val)
>> +{
>> +	u32 regval;
>> +
>> +	regval =3D readl(priv->io_base + reg);
>> +	regval &=3D ~mask;
>> +	regval |=3D (val << __bf_shf(mask)) & mask;
>> +	writel(regval, priv->io_base + reg);
>> +}
>> +
>> +static ssize_t cdns_force_ecc_error(struct file *file, const char __use=
r *data, size_t count,
>> +				    loff_t *ppos)
>> +{
>> +	struct device *dev =3D file->private_data;
>> +	struct mem_ctl_info *mci =3D to_mci(dev);
>> +	struct cdns_mc_priv *priv =3D mci->pvt_info;
>> +
>> +	spin_lock(&priv->lock);
>> +
>> +	cdns_rmw(priv, CDNS_DDR_ECC_XOR, CDNS_DDR_ECC_XOR_CHECK_BITS, priv->xo=
r_check_bits);
>> +	cdns_rmw(priv, CDNS_DDR_ECC_STAT, CDNS_DDR_ECC_STAT_FWC, 1);
>> +
>> +	spin_unlock(&priv->lock);
>> +
>> +	return count;
>> +}
>> +
>> +static const struct file_operations cdns_ecc_error_fops =3D {
>> +	.open =3D simple_open,
>> +	.write =3D cdns_force_ecc_error,
>> +	.llseek =3D generic_file_llseek,
>> +};
>
> #else
> static ssize_t cdns_force_ecc_error(struct file *file, const char __user =
*data, size_t count, loff_t *ppos)
> {
> 	return 0
> }
> #endif
>
> and get rid of the ifdeffery below.
>
>> +static void cdns_setup_debugfs(struct mem_ctl_info *mci)
>> +{
>> +	struct cdns_mc_priv *priv =3D mci->pvt_info;
>> +
>> +	priv->debugfs =3D edac_debugfs_create_dir(DRV_NAME);
>> +	if (!priv->debugfs) {
>> +		dev_dbg(mci->pdev, "failed to create debugfs dir\n");
>> +		return;
>> +	}
>> +
>> +	edac_debugfs_create_x16("bits", 0644, priv->debugfs, &priv->xor_check_=
bits);
>> +	edac_debugfs_create_file("inject", 0200, priv->debugfs, &mci->dev, &cd=
ns_ecc_error_fops);
>> +}
>> +
>> +#endif
>
> ...
>
>> +
>> +	/*
>> +	 * Unmask ECC recoverable and unrecoverable interrupts, and port
>> +	 * command errors.
>> +	 */
>> +	writel(CDNS_DDR_ECC_INT_CTRL_UNMASK(
>> +		       CDNS_DDR_ECC_INT_STAT_CE | CDNS_DDR_ECC_INT_STAT_MULTIPLE_CE |
>> +		       CDNS_DDR_ECC_INT_STAT_UE | CDNS_DDR_ECC_INT_STAT_MULTIPLE_UE |
>> +		       CDNS_DDR_ECC_INT_STAT_PORT_CMD_CHAN),
>
> Yah, unreadable mess that. Shorten pls.

I do not see any better way to express it.
I could define a macro for the OR'ing mess sure.

>
>> +	       io_base + CDNS_DDR_ECC_INT_CTRL);
>> +
>> +	return 0;
>> +}
>
> Thx.

Thanks.
Best regards,
--=20
Paul Louvel, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

