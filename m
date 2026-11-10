Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320648;
	b=NtZ/T5LKO6SnoCAW/eOiUw6I9ZC+17q5Wj/pXn6Spl+unb+xSWMNLg5l0yGMS/6hZxTI
	 i6KmOUI8KkCkQ+NPtKcn9lBRyS7e9rKQjb8C3JiqEzYStmMapNRlwB60uT4Bps4OeQoBy
	 bLYrdMkwPOlRuzbnqWtlP0gwikMLoq0MZ7TdW9ft+XYhbq1cr+yFD/UEMD/BUsLbGJcOu
	 TrPmdBnsUqLcNlgeZcR759huY4mFOoAJt/Em3wPy1XmnDY7TiNSJ1qU5mtqKaExYPXRQI
	 Rojt3z5lQrvrZmFoWNMmjDWo+MUGtbNeOiImr0A/jlKlKwN9H7prjlX625P5Lw7p4qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320648;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fq7yBG2EXssub3S97JK0z+L/pcM8GEbETAN8w1h7jq8=;
	b=lt7InlKmYTXwbbAlS9sYrkj8zFVjIPAroKQ2eOgBgfq8AFDfdXM7FjgXQVh/iyigiBJa
	 now9Y7eYXUAv4rfRvWVFO+8IjHV4Gj6uKiJ6u+1cTzwPP0Yt6DTy6CSmLJ9rT6KYy5iDf
	 ioDKo2XDlQJMqd9olgoC1wHIuDGP6Y5WzjYj/TKAC/yq68h0FRQGIiydE970JBaOd1jMO
	 bAdgonLJ2rBqtLBbQThwBmOGV4My/tgxFRJucwjBXZZU8wLkqxomSZjc7b/+fBwZ0QiHe
	 750kKOX1wPkThbiNzYhEKmUbJuZLOSYrE5xqE/cIdvQame9CqBKKttErBNe9en4wwhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RULuRR84;
	arc=none smtp.remote-ip=192.198.163.15
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057E6606A333;
	Tue, 10 Nov 2026 14:24:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 057E6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RULuRR84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794320648; x=1825856648;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dz6xB3nsXb84v6j5VtTKjJDy0mJj1gdNzuH6mAq71Ss=;
  b=RULuRR84jhTXa+NK1by853h6EG245PHpoxfKEoGRqcRt9IV3WQgmfomc
   gOC06UDv0rRTLd+evWLMZBoJI/v0Pf/LBZELmuKwC3F/tcymoky7drT12
   wA3whn/I1ZOr8jsec8r1u11POhC1d9+szZ9/PB6Tq/QLNpIgDX1x56Vew
   5Ru1x9+SHMwBc7UUlFxmXCbAQcLvD+ghCChSG3adH9I3rVJ5N86B7xn0q
   kFhVyX5O6TB9jotk44WgsDUzjV52Y2DgntA25NWRpdpoBb2BXmq+iVmXD
   KRaXv4Ps9tNd2+c/YlbCDo4h0biDSaB3vvaUO/6E8KIYomd1FLD1ZljmX
   A==;
X-CSE-ConnectionGUID: 8Lg9qf36SgWcbzTQ+nfUNQ==
X-CSE-MsgGUID: wfrJnsd3RJ+nfXmqo8PWeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3065733"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="3065733"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 06:24:08 -0800
X-CSE-ConnectionGUID: 1yUDu6o1R2Co+TQB5tXA8g==
X-CSE-MsgGUID: HgVuWmi6QhWzn+a9bSH62A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8467520"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 10 Nov 2026 06:24:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 7D26C99; Tue, 10 Nov 2026 15:24:03 +0100 (CET)
Date: Tue, 10 Nov 2026 15:24:03 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Sven Peter <sven@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 2/7] thunderbolt: Move ICM mailbox functions to icm.c
 and internalize interrupt work
Message-ID: <20261110142403.GB259790@black.igk.intel.com>
References: <20261110114925.722014-1-chunfeng.yun@mediatek.com>
 <20261110114925.722014-3-chunfeng.yun@mediatek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110114925.722014-3-chunfeng.yun@mediatek.com>

On Tue, Nov 10, 2026 at 07:48:50PM +0800, Chunfeng Yun wrote:
> In preparation for modularizing PCIe NHI and ICM support as a separate
> driver, clean up internal helper functions so that they do not need to
> be exported:
> 
> nhi_mailbox_cmd() and nhi_mailbox_mode() are only used by the Intel
> firmware Connection Manager (icm.c) to exchange mailbox commands with
> firmware running on Intel PCIe NHIs. The Thunderbolt core framework,
> software connection manager, and non-PCIe platform controllers do
> not use this mailbox interface. Move both functions into icm.c and
> mark them static.
> 
> nhi_interrupt_work was previously initialized in pci.c within
> nhi_pci_init_msi(), requiring it to be visible across files. Move
> INIT_WORK(&nhi->interrupt_work, ...) into tb_nhi_probe() so that
> the workqueue item is initialized by the NHI core and
> nhi_interrupt_work() can be marked static in nhi.c.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> ---
> new patch
> ---
>  drivers/thunderbolt/icm.c | 59 ++++++++++++++++++++++++++++++++++++
>  drivers/thunderbolt/nhi.c | 64 ++-------------------------------------
>  drivers/thunderbolt/nhi.h |  3 --
>  drivers/thunderbolt/pci.c |  2 --
>  4 files changed, 62 insertions(+), 66 deletions(-)
> 
> diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> index a295a5e6cc9c..736f551cd567 100644
> --- a/drivers/thunderbolt/icm.c
> +++ b/drivers/thunderbolt/icm.c
> @@ -45,6 +45,7 @@
>  #define ICM_RETRIES			3
>  #define ICM_APPROVE_TIMEOUT		10000	/* ms */
>  #define ICM_MAX_LINK			4
> +#define ICM_MAILBOX_TIMEOUT		500 /* ms */
>  
>  static bool start_icm;
>  module_param(start_icm, bool, 0444);
> @@ -269,6 +270,64 @@ static int pcie2cio_write(struct icm *icm, enum tb_cfg_space cs,
>  	return pci2cio_wait_completion(icm, 5000);
>  }
>  
> +/**
> + * nhi_mailbox_cmd() - Send a command through NHI mailbox
> + * @nhi: Pointer to the NHI structure
> + * @cmd: Command to send
> + * @data: Data to be send with the command
> + *
> + * Sends mailbox command to the firmware running on NHI.
> + *
> + * Return: %0 on success, negative errno otherwise.
> + */
> +static int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
> +{
> +	ktime_t timeout;
> +	u32 val;
> +
> +	iowrite32(data, nhi->iobase + REG_INMAIL_DATA);
> +
> +	val = ioread32(nhi->iobase + REG_INMAIL_CMD);
> +	val &= ~(REG_INMAIL_CMD_MASK | REG_INMAIL_ERROR);
> +	val |= REG_INMAIL_OP_REQUEST | cmd;
> +	iowrite32(val, nhi->iobase + REG_INMAIL_CMD);
> +
> +	timeout = ktime_add_ms(ktime_get(), ICM_MAILBOX_TIMEOUT);
> +	do {
> +		val = ioread32(nhi->iobase + REG_INMAIL_CMD);
> +		if (!(val & REG_INMAIL_OP_REQUEST))
> +			break;
> +		usleep_range(10, 20);
> +	} while (ktime_before(ktime_get(), timeout));
> +
> +	if (val & REG_INMAIL_OP_REQUEST)
> +		return -ETIMEDOUT;
> +	if (val & REG_INMAIL_ERROR)
> +		return -EIO;
> +
> +	return 0;
> +}
> +
> +/**
> + * nhi_mailbox_mode() - Return current firmware operation mode
> + * @nhi: Pointer to the NHI structure
> + *
> + * The function reads current firmware operation mode using NHI mailbox
> + * registers and returns it to the caller.
> + *
> + * Return: &enum nhi_fw_mode.
> + */
> +static enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
> +{
> +	u32 val;
> +
> +	val = ioread32(nhi->iobase + REG_OUTMAIL_CMD);
> +	val &= REG_OUTMAIL_CMD_OPMODE_MASK;
> +	val >>= REG_OUTMAIL_CMD_OPMODE_SHIFT;
> +
> +	return (enum nhi_fw_mode)val;
> +}
> +
>  static bool icm_match(const struct tb_cfg_request *req,
>  		      const struct ctl_pkg *pkg)
>  {
> diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
> index c574c336f25b..1e3a58636d3d 100644
> --- a/drivers/thunderbolt/nhi.c
> +++ b/drivers/thunderbolt/nhi.c
> @@ -35,8 +35,6 @@
>   */
>  #define RING_E2E_RESERVED_HOPID	RING_FIRST_USABLE_HOPID
>  
> -#define NHI_MAILBOX_TIMEOUT	500 /* ms */
> -
>  static bool host_reset = true;
>  module_param(host_reset, bool, 0444);
>  MODULE_PARM_DESC(host_reset, "reset USB4 host router (default: true)");
> @@ -964,65 +962,7 @@ int tb_ring_throttling(struct tb_ring *ring, unsigned int interval_nsec)
>  }
>  EXPORT_SYMBOL_GPL(tb_ring_throttling);
>  
> -/**
> - * nhi_mailbox_cmd() - Send a command through NHI mailbox
> - * @nhi: Pointer to the NHI structure
> - * @cmd: Command to send
> - * @data: Data to be send with the command
> - *
> - * Sends mailbox command to the firmware running on NHI.
> - *
> - * Return: %0 on success, negative errno otherwise.
> - */
> -int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data)
> -{
> -	ktime_t timeout;
> -	u32 val;
> -
> -	iowrite32(data, nhi->iobase + REG_INMAIL_DATA);
> -
> -	val = ioread32(nhi->iobase + REG_INMAIL_CMD);
> -	val &= ~(REG_INMAIL_CMD_MASK | REG_INMAIL_ERROR);
> -	val |= REG_INMAIL_OP_REQUEST | cmd;
> -	iowrite32(val, nhi->iobase + REG_INMAIL_CMD);
> -
> -	timeout = ktime_add_ms(ktime_get(), NHI_MAILBOX_TIMEOUT);
> -	do {
> -		val = ioread32(nhi->iobase + REG_INMAIL_CMD);
> -		if (!(val & REG_INMAIL_OP_REQUEST))
> -			break;
> -		usleep_range(10, 20);
> -	} while (ktime_before(ktime_get(), timeout));
> -
> -	if (val & REG_INMAIL_OP_REQUEST)
> -		return -ETIMEDOUT;
> -	if (val & REG_INMAIL_ERROR)
> -		return -EIO;
> -
> -	return 0;
> -}
> -
> -/**
> - * nhi_mailbox_mode() - Return current firmware operation mode
> - * @nhi: Pointer to the NHI structure
> - *
> - * The function reads current firmware operation mode using NHI mailbox
> - * registers and returns it to the caller.
> - *
> - * Return: &enum nhi_fw_mode.
> - */
> -enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi)
> -{
> -	u32 val;
> -
> -	val = ioread32(nhi->iobase + REG_OUTMAIL_CMD);
> -	val &= REG_OUTMAIL_CMD_OPMODE_MASK;
> -	val >>= REG_OUTMAIL_CMD_OPMODE_SHIFT;
> -
> -	return (enum nhi_fw_mode)val;
> -}
> -
> -void nhi_interrupt_work(struct work_struct *work)
> +static void nhi_interrupt_work(struct work_struct *work)
>  {
>  	struct tb_nhi *nhi = container_of(work, typeof(*nhi), interrupt_work);
>  	int value = 0; /* Suppress uninitialized usage warning. */
> @@ -1331,6 +1271,8 @@ int tb_nhi_probe(struct tb_nhi *nhi)
>  	if (!nhi->tx_rings || !nhi->rx_rings || !nhi->interrupt_mask)
>  		return -ENOMEM;
>  
> +    INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> +

This has weird indent.

>  	nhi_reset(nhi);
>  
>  	/* In case someone left them on. */
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index a36c62c49a5c..3dd6ace6150d 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -27,11 +27,8 @@ enum nhi_mailbox_cmd {
>  	NHI_MAILBOX_ALLOW_ALL_DEVS = 0x23,
>  };
>  
> -int nhi_mailbox_cmd(struct tb_nhi *nhi, enum nhi_mailbox_cmd cmd, u32 data);
> -enum nhi_fw_mode nhi_mailbox_mode(struct tb_nhi *nhi);
>  void nhi_enable_int_throttling(struct tb_nhi *nhi);
>  void nhi_disable_interrupts(struct tb_nhi *nhi);
> -void nhi_interrupt_work(struct work_struct *work);
>  irqreturn_t tb_nhi_isr(int irq, void *data);
>  irqreturn_t tb_ring_msix(int irq, void *data);
>  int tb_nhi_probe(struct tb_nhi *nhi);
> diff --git a/drivers/thunderbolt/pci.c b/drivers/thunderbolt/pci.c
> index 2f0abf4d27a3..275389903090 100644
> --- a/drivers/thunderbolt/pci.c
> +++ b/drivers/thunderbolt/pci.c
> @@ -206,8 +206,6 @@ static int nhi_pci_init_msi(struct tb_nhi *nhi)
>  		if (nvec < 0)
>  			return nvec;
>  
> -		INIT_WORK(&nhi->interrupt_work, nhi_interrupt_work);
> -
>  		irq = pci_irq_vector(pdev, 0);
>  		if (irq < 0)
>  			return irq;
> -- 
> 2.45.2
