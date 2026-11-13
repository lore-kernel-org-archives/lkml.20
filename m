Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794610672;
	b=ufBT2nMOT0jpZZTxwgD5BVnUxTqCuHvOVxj/aMWpeuwKZxfC5b+wX80xJ1f6jkpTZMmq
	 i/dWoQ/+EcY++kIaTjDkHL7A7oIu7HEemVzCaxNYi2Pk2YNzRMv9/r14W2SpR3UOtp9zW
	 RBzUJ/YusOy+SaoLArWb/hguqO3lTbiQIRJWeY0XHauuXSid++7xr4cUJa+Iz7EWcS5t2
	 Yf24vzNBu2aUoOyAh9bmw3IbmCK6lWZU9yJYD1sojvcIr8npom+BIfHMZIOzq5mXP1J/c
	 jcJjDFCSqKn2izjyZDaECURRA2QZMZEM/yD6eGsznosCOLlZ/9WcCLsx4X3K/e/1jhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794610672;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=bVjai6LLNarFx4zAm4mT7O1O9wWtA74SjHQ0do3jQHw=;
	b=mLUD/fBUeJYhMwpg0yOQYQM8NFZzc+n3mcuS47qcyu3KxPY9dEL4gAwMqIEQZUdAgyMR
	 2IJam4KHRqgqOaxClSxCDdvbG8w/HQXogaPYN3inhOoZNAE8O8y9Onxa/tc5t+sICvoOf
	 DQKn/X+lkadAfyVpnfhW5Eoz3uk4rOniopn8L64Q3ftI1wZjK6ggIs3uz/heEENDLEkcq
	 IU/QrkYjLV0WZCQBqy/uZ2fMGjthZW4p9D4s99FDXZN6avyKCU6rKnau4fFxnLs6Zw41N
	 6iOZqZXPKmzSpyr0ZXhy0r4Rr/qHTu5nJaKORGqjl+udBWW5eSZ7xHxMaqkzMl1aoMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RA+fK3Rn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B815606A330;
	Fri, 13 Nov 2026 22:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RA+fK3Rn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FB071F000C4;
	Fri, 13 Nov 2026 22:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794610671;
	bh=bVjai6LLNarFx4zAm4mT7O1O9wWtA74SjHQ0do3jQHw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=RA+fK3RnOz5pKae2Gt+V1eUv8iLmqCGYaGFCSvcy0Wecqjq08FmJ+8uqrVBImUtZ0
	 GsArh4WPUccH9BmXvcTTdj6RdZgmx/85lPawLod5S/qP46c8aQRIrnFE6fRBcn0mYb
	 ydtkUk6KczDgDX5sZGB8PNr81PNCcBYJVsZGjbeqBlBPswokDyWZb0pYsA4bojU1/2
	 1pQNLSX6rGCMqqltwHmrpWbaUI4kBvKOM7Q9QaGvzaBmgPKEyPPgNbzNLNVllAjhBc
	 QObXjQjLpV5zF54Vbr4vCFSkRdZRpdUHb32q43AlhiaFxh+ILpkfjziu0rX95SrgvI
	 kIHS/kvU1zhog==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C9CB7327EB4C;
	Fri, 13 Nov 2026 22:57:44 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1] ASoC: tas2783-sdw: Add basic BPT support
From: Mark Brown <broonie@kernel.org>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, andriy.shevchenko@linux.intel.com, 
 13916275206@139.com, alsa-devel@alsa-project.org, shenghao-ding@ti.com, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, k-yi@ti.com, 
 henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com, pin-hao.huang@hp.com, 
 Syed.SabaKareem@amd.com
In-Reply-To: <20261103133853.1612-1-baojun.xu@ti.com>
References: <20261103133853.1612-1-baojun.xu@ti.com>
Date: Fri, 13 Nov 2026 22:57:43 +0000
Message-Id: <179461066380.590303.4284235915024640231.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2367; i=broonie@kernel.org;
 h=from:subject:message-id; bh=CZGWgKoiOb0WZzX9tkDAcCd5qrNdKR7L4JdHq86Y1VE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+T30xj8d66vFmwXmMNVkHPn+1nb32zNKtJ8+uO7Oov
 X/Nd1WdEx2lLAxiXAyyYooscVncL+tLXq/hO7iwDWYOKxPIEAYuTgGYyEYpRoZLM+ytd72rCghm
 4vt16uNejUOHzE4sUvyu/VtvUhsn55Fwhv/JypWB0mwMGzeoq7pectVSlHq/9IX0+YznVy4LHdi
 6oooBAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add for BPT supported.

It might help to expand the acronym here, it's not at all obvious to me
what this is intended to do.

> +enum {
> +	SDW_MSG_FLAG_READ = 0,
> +	SDW_MSG_FLAG_WRITE,
> +};
> +
> +struct sdw_bpt_section {
> +	u32 addr;
> +	u32 len;
> +	u8 *buf;
> +};
> +
> +struct sdw_bpt_msg {
> +	struct sdw_bpt_section *sec;
> +	int sections;
> +	u8 dev_num;
> +	u8 flags;
> +};

These look like generic SoundWire definitons, they should come from
SoundWire headers.

> +static int tas2783_fw_download_bpt(struct tas2783_prv *tas_dev,
> +				   const struct firmware *fmw)
> +{

> +	ret = sdw_bpt_send_sync(bus, slave, &msg);

Can we call this while tas_fw_load() is waiting for the load to
complete?  That gets called from Soundwire callbacks.  There's some
Sashiko reports about the issue (and quite a bit of other stuff).

> +static bool tas2783_bpt_supported(struct tas2783_prv *tas_dev)
> +{
> +	struct sdw_slave *slave = tas_dev->sdw_peripheral;
> +	struct sdw_bus *bus = slave->bus;
> +
> +	return bus && bus->ops && bus->ops->bpt_send_async;

Does that guarantee that the bus actually has BPT, how strict is
Soundwire about not registering the same ops struct for everything and
returning an error if the hardware doesn't have the feature?

> @@ -761,7 +877,7 @@ static void tas2783_fw_ready(const struct firmware *fmw, void *context)
>  	if (!fmw || !fmw->data) {
>  		if (!tas_dev->fw_use_fallback) {
>  			tas_dev->fw_use_fallback = true;
> -			dev_info(tas_dev->dev,
> +			dev_dbg(tas_dev->dev,
>  				"Failed to read preferred fw binary: %s, attempting fallback binary load\n",
>  				tas_dev->rca_binaryname);

Separate patch please.

> @@ -1216,25 +1358,32 @@ static s32 tas_fw_load(struct tas2783_prv *tas_dev, struct sdw_slave *slave)
>  static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
>  {
>  	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
> +	uint val;
>  	s32 ret;
>  
>  	if (tas_dev->hw_init)
>  		return 0;
>  
> -	tas_dev->fw_dl_success = false;
> -
> -	ret = regmap_write(tas_dev->regmap, TAS2783_SW_RESET, 0x1);
> +	regmap_read(tas_dev->regmap, TASDEV_REG_SDW(0, 0, 7), &val);
> +	dev_dbg(dev, "Got B0P0R7 = %02X with %d.", val, ret);

We removed the assignment to ret but we're logging it?

-- 
Mark Brown <broonie@kernel.org>
