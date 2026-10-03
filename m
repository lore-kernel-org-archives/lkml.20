Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 240D237755A;
	Sat,  3 Oct 2026 08:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791015487; cv=none; b=C/NeCwvIy36V+XAX8g6W4Le1FDDPlRS9cGkjdFg2xWrQZn+Z3Cdc4sw4gpW2jjKkO/vk7gEUgjQGm7GLQCikRnssYEgqvO0Gg7PpAZ4UMSzDFO/04fIHwYYzE/V4WvDeogIs97X+Kykt0X1UTFOuULliuQViHLUo2cXOp7XCgT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791015487; c=relaxed/simple;
	bh=iYEijlYJUq45EPagJHUGz5EOXlOCJfE005wikZ4dd6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d8ZXIpD2MFnzcYlwghmNySLXSfFO5MqWbCGjxehboZDZ8uU8OR0oi0gzwkw3lXvGG35/nMcmJfQWQZSDruFJVblxSpNKuCaWGSgr6GJHeHQ4QAuugpV6xVbRarWo4Mg0k4cO2bPqCm8IQoqtEYw5exCpK+ZQSY9y23bPBQBkTwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nO2HMdYe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nO2HMdYe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE1F51F0089B;
	Sat,  3 Oct 2026 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791015485;
	bh=uLnpVDJwR4zTl6t5ZRAY9LTHy6Hp4z9k/l8/nZsaDSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nO2HMdYekz4PwzKqmZw0wGG6ygcQgXKG6SKpAJ7f9jE/q1549ahPXyPVKRqMqkifi
	 xoMxymU2S6ZBgs6tX0s29+AO6y6ChGZz60TeIsgYCuC15E1Il4QXgUR+ydSt1wjFEm
	 TmOByPlem8PstxKdy53OiWKSBB+5Nvf9XhU2icZiyJvtdCwM0VGhFixHtiqJPUpo3i
	 uizaqSCKJAzMy03l4qzWulZWU6AqGx9wT4rbcZAwzCRv9lWFQoQOKn00q3XDlFLHUg
	 bqNuLVF4gXJ1tK5t7dVsx3q8UCda5OF8FsbhGnepN633jGXNwUcST03vfAtM+iMX2r
	 jElpVniEmQ41w==
Date: Sat, 3 Oct 2026 10:18:02 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: yung-chuan.liao@linux.intel.com, pierre-louis.bossart@linux.dev,
	peter.ujfalusi@linux.intel.com, linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] soundwire: bus: Don't unassign dev_num before
 unregistering device
Message-ID: <asC6OuTRgQg86jMk@parshuram>
References: <20260925154216.3520136-1-ckeepax@opensource.cirrus.com>
 <20260925154216.3520136-2-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925154216.3520136-2-ckeepax@opensource.cirrus.com>

On 25-09-26, 16:42, Charles Keepax wrote:
> Don't mark dev_num as unassigned until after the driver remove has
> been called. The driver may want to communicate with the device
> as part of the driver remove operation, so the dev_num should
> remain assigned until that has completed. This requires moving from
> device_unregister() to manually calling device_del() and device_put()
> to ensure that the slave struct isn't freed too early.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> ---
> 
> Changes since v1:
>  - Split device_unregister into device_del and put_device
> 
>  drivers/soundwire/bus.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soundwire/bus.c b/drivers/soundwire/bus.c
> index aeaae5a57c89d..1488b6540844c 100644
> --- a/drivers/soundwire/bus.c
> +++ b/drivers/soundwire/bus.c
> @@ -175,8 +175,9 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  
>  	sdw_slave_debugfs_exit(slave);
>  
> -	mutex_lock(&bus->bus_lock);
> +	device_del(dev);
>  
> +	mutex_lock(&bus->bus_lock);
>  	if (slave->dev_num) { /* clear dev_num if assigned */
>  		clear_bit(slave->dev_num, bus->assigned);
>  		if (bus->ops && bus->ops->put_device_num)
> @@ -185,7 +186,8 @@ static int sdw_delete_slave(struct device *dev, void *data)
>  	list_del_init(&slave->node);
>  	mutex_unlock(&bus->bus_lock);
>  
> -	device_unregister(dev);
> +	put_device(dev);

if we are doing this I would add code comments on why we split. We
invoke device_register so the expectation is that we always call
device_unregister. I understand this is being done but this needs to be
well documented here

-- 
~Vinod
