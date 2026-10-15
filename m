Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7533A542EDD;
	Thu, 15 Oct 2026 15:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792078822; cv=none; b=QoovdGOdh2WWZEx4PYaLPkwXXT48/OCefhqVazM1SX9oRA8zbqpEG7md/H0fTUR3GXdK5cZ+b2pNFaEtKur+ESUaaPlLFR+j3jPw8fVafbJUU54NZIWeNUTONegPl26AstP1PRUb+s1YX2twL7sKbJqaOWMumUlmvrOyPBSB6cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792078822; c=relaxed/simple;
	bh=yDWJqx91VVtpfQG5xF1/hZV+mLN44NlRMID8Xl13xEE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GRMJ7oELDS4S0KDTPs12dp/ngVznjIfdhDhyIOtHggBE4QqxvGPMsNq3tm2Q8m+oIGpzeKasWM6FUVJtLeIc7nYI+zM7he/L+DpDPpSrssDuXimuuQctLDLdnQRYkZly7Li+sUjEOmzqDIdDisva7qDIAchIS5MxF4YGwezlfM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ve3C4cir; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ve3C4cir"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB441F000C5;
	Thu, 15 Oct 2026 15:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792078807;
	bh=c8ycy8i0ZxFRxhJUc989u9/AXTm9YwqhZQ572ZJUJYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ve3C4cirK90jzR6aUSY2eN4vdqt9ESe9Cq80PRTC7MVRpyzdEIE74Avjm2jPYxZox
	 Owz9kgSnk+hg5FXfbCZeTFptJBIe3r5TfH6k4Q6ildoR/0P45Dh6EUH59HeZ6kXBIg
	 MW7mL+kykT7SPt28R6s6gpGbx792NcxzkKRrzIDy9LcvfP5RtMzzp7hkJOXIC42kuH
	 1h+qfsGNJ2IaAdFFpLWQ/DXrzAUFjmugLVzPD/eqCsYIljFghOJpAJyYP2krlbuHJ/
	 4ue+lJ6UiZv3OYHkdF54YXiqQrNPSzaGbONdTesJvQLZ18A/EK9F9x8FbFSSzp1AhH
	 m8SeywY3WCtnQ==
Date: Thu, 15 Oct 2026 16:40:04 +0100
From: Lee Jones <lee@kernel.org>
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mfd: rz-mtu3: Do not use struct
 rz_mtu3_channel::dev
Message-ID: <179198438389.839288.13682920506359662388@kernel.org>
References: <20261004174024.502949-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20261004174024.502949-2-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004174024.502949-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-AI-Review-Draft: <20261004174024.502949-2-cosmin-gabriel.tanislav.xa@renesas.com>

--- checkpatch.pl: clean (0 issues) ---

On Sun, 04 Oct 2026, Cosmin Tanislav wrote:

Please review, explain or fix the Sashiko review(s).

> Channels 1 and 2 are used by both the PWM and counter drivers. Both
> subdrivers assign struct rz_mtu3_channel::dev to their own device
> instance for those shared channels, so the value stored in it depends on
> which subdriver binds last.
>
> The MFD core helpers currently use ch->dev->parent to retrieve the
> parent driver data, which makes them depend on subdriver-populated
> state.
>
> This is fragile for shared channels and unnecessarily couples the core
> to child driver initialization.
>
> Add a priv pointer to struct rz_mtu3_channel, populated by the MFD
> driver at probe time, and use it directly in place of ch->dev->parent
> in every MFD core helper, so the core no longer depends on
> subdriver-assigned state. Remove struct rz_mtu3::priv_data, which
> becomes redundant now that every channel carries its own priv pointer.
>
> Keep struct rz_mtu3_channel::dev for now, as it is still used by the PWM
> and counter drivers.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> ---
>
> V2:
>  * capitalize subject after prefix
>  * switch struct rz_mtu3_priv retrieval to a back-pointer stored in
>    struct rz_mtu3_channel::priv
>  * remove struct rz_mtu3::priv_data as it is unused now
>
>  drivers/mfd/rz-mtu3.c       | 40 +++++++++++++------------------------
>  include/linux/mfd/rz-mtu3.h |  7 ++++---
>  2 files changed, 18 insertions(+), 29 deletions(-)
>
> diff --git a/drivers/mfd/rz-mtu3.c b/drivers/mfd/rz-mtu3.c
> index 0a254e61ec0a..0fca16aaa566 100644
> --- a/drivers/mfd/rz-mtu3.c
> +++ b/drivers/mfd/rz-mtu3.c
> @@ -62,8 +62,7 @@ static bool rz_mtu3_is_16bit_shared_reg(u16 offset)
>
>  u16 rz_mtu3_shared_reg_read(struct rz_mtu3_channel *ch, u16 offset)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>
>  	if (rz_mtu3_is_16bit_shared_reg(offset))
>  		return readw(priv->mmio + offset);
> @@ -74,8 +73,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_read);
>
>  u8 rz_mtu3_8bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	u16 ch_offs;
>
>  	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->channel_number][offset];
> @@ -86,8 +84,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_read);
>
>  u16 rz_mtu3_16bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	u16 ch_offs;
>
>  	/* MTU8 doesn't have 16-bit registers */
> @@ -102,8 +99,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_read);
>
>  u32 rz_mtu3_32bit_ch_read(struct rz_mtu3_channel *ch, u16 offset)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	u16 ch_offs;
>
>  	if (ch->channel_number != RZ_MTU3_CHAN_1 && ch->channel_number != RZ_MTU3_CHAN_8)
> @@ -117,8 +113,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_read);
>
>  void rz_mtu3_8bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u8 val)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	u16 ch_offs;
>
>  	ch_offs = rz_mtu3_8bit_ch_reg_offs[ch->channel_number][offset];
> @@ -128,8 +123,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_8bit_ch_write);
>
>  void rz_mtu3_16bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u16 val)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	u16 ch_offs;
>
>  	/* MTU8 doesn't have 16-bit registers */
> @@ -143,8 +137,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_16bit_ch_write);
>
>  void rz_mtu3_32bit_ch_write(struct rz_mtu3_channel *ch, u16 offset, u32 val)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	u16 ch_offs;
>
>  	if (ch->channel_number != RZ_MTU3_CHAN_1 && ch->channel_number != RZ_MTU3_CHAN_8)
> @@ -157,8 +150,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_32bit_ch_write);
>
>  void rz_mtu3_shared_reg_write(struct rz_mtu3_channel *ch, u16 offset, u16 value)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>
>  	if (rz_mtu3_is_16bit_shared_reg(offset))
>  		writew(value, priv->mmio + offset);
> @@ -170,8 +162,7 @@ EXPORT_SYMBOL_GPL(rz_mtu3_shared_reg_write);
>  void rz_mtu3_shared_reg_update_bit(struct rz_mtu3_channel *ch, u16 offset,
>  				   u16 pos, u8 val)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	unsigned long tmdr, flags;
>
>  	spin_lock_irqsave(&priv->lock, flags);
> @@ -244,8 +235,7 @@ static u8 rz_mtu3_get_tstr_bit_pos(struct rz_mtu3_channel *ch)
>
>  static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	unsigned long flags, tstr;
>  	u16 offset;
>  	u8 bitpos;
> @@ -265,8 +255,7 @@ static void rz_mtu3_start_stop_ch(struct rz_mtu3_channel *ch, bool start)
>
>  bool rz_mtu3_is_enabled(struct rz_mtu3_channel *ch)
>  {
> -	struct rz_mtu3 *mtu = dev_get_drvdata(ch->dev->parent);
> -	struct rz_mtu3_priv *priv = mtu->priv_data;
> +	struct rz_mtu3_priv *priv = ch->priv;
>  	unsigned long flags, tstr;
>  	u16 offset;
>  	u8 bitpos;
> @@ -320,12 +309,10 @@ static int rz_mtu3_probe(struct platform_device *pdev)
>  	if (!ddata)
>  		return -ENOMEM;
>
> -	ddata->priv_data = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!ddata->priv_data)
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
>  		return -ENOMEM;
>
> -	priv = ddata->priv_data;
> -
>  	priv->mmio = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->mmio))
>  		return PTR_ERR(priv->mmio);
> @@ -344,6 +331,7 @@ static int rz_mtu3_probe(struct platform_device *pdev)
>  	for (i = 0; i < RZ_MTU_NUM_CHANNELS; i++) {
>  		ddata->channels[i].channel_number = i;
>  		ddata->channels[i].is_busy = false;
> +		ddata->channels[i].priv = priv;
>  		mutex_init(&ddata->channels[i].lock);
>  	}
>
> diff --git a/include/linux/mfd/rz-mtu3.h b/include/linux/mfd/rz-mtu3.h
> index 8421d49500bf..3884ae5b008c 100644
> --- a/include/linux/mfd/rz-mtu3.h
> +++ b/include/linux/mfd/rz-mtu3.h
> @@ -122,6 +122,8 @@ enum rz_mtu3_channels {
>  	RZ_MTU_NUM_CHANNELS
>  };
>
> +struct rz_mtu3_priv;
> +
>  /**
>   * struct rz_mtu3_channel - MTU3 channel private data
>   *
> @@ -129,12 +131,14 @@ enum rz_mtu3_channels {
>   * @channel_number: channel number
>   * @lock: Lock to protect channel state
>   * @is_busy: channel state
> + * @priv: MFD private data
>   */
>  struct rz_mtu3_channel {
>  	struct device *dev;
>  	unsigned int channel_number;
>  	struct mutex lock;
>  	bool is_busy;
> +	struct rz_mtu3_priv *priv;
>  };
>
>  /**
> @@ -142,13 +146,10 @@ struct rz_mtu3_channel {
>   *
>   * @clk: MTU3 module clock
>   * @rz_mtu3_channel: HW channels
> - * @priv_data: MTU3 core driver private data
>   */
>  struct rz_mtu3 {
>  	struct clk *clk;
>  	struct rz_mtu3_channel channels[RZ_MTU_NUM_CHANNELS];
> -
> -	void *priv_data;
>  };
>
>  static inline bool rz_mtu3_request_channel(struct rz_mtu3_channel *ch)
> -- 
> 2.55.0

-- 
Lee Jones
