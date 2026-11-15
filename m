Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768852;
	b=Ed38CsGuTE060QpP9n/z9MVX7CDa5fw+oWtF4Bwt3rEVb+/wyj+bj/xlvXZfhg9XglpY
	 UXO/nbAiYRwjH9xLETarg1Iop7+bY/xSmeJzQjozugqCVUm/ndlwnLTmYN/gr8s8qURXT
	 hXBTF6DMs9itVTceMaovQu21iGW9XjmI+5kchyh9dZP3l2gXyPzxvFpwE7X0uQSzEvY/u
	 Cf7oEF4qWq698qNjhEZYXT230cyJY0ztIHBd2hmT1b47LoWO9B5FDSgxo9losVYs5KeBT
	 yVqNDpMykVvrmDIyDkKvqhJHx1Zx+QdVZc2OrnWfNANNtCrd4ofX1SbTCIcCZmSdW3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768852;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=jt+5Fdp6Nd5TfgPTmrxAirK3h6kimHDVngEaUqwJ+z0=;
	b=dslWBkSwQwQ7ffeXXrSGMeSHs+zO1mcGaWINjOSREPMSCUBBiajee5m0rs6RzIzSGmln
	 Qa1kQxu+EeGMJAb489dQITV3JfSjGTpmyjx9eQhAaL8PHXK6SRGovVDvFvZYmZk12oZ3N
	 9PNbo+OhI1eyf9EKoeJQ2R5ynjryE65KFZeMIDkPu8/fc4wpO48oRAJ74HxKrW1wqLkcc
	 eX8pu8jUg/wYvOcZuZNVVHKDhzWfR7FkKQpX106SzgM51LJJcfs07VcaJAcpR+wc68Ct4
	 PLLPIVsAjNKfZqFghmL8YJPQ1kSVDoLgbQMT1OoGJIZoF5sPauVbhoLQdWBiDU/3cfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=2FYJnfsm;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06163606A327;
	Sun, 15 Nov 2026 18:54:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06163606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=2FYJnfsm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jt+5Fdp6Nd5TfgPTmrxAirK3h6kimHDVngEaUqwJ+z0=; b=2FYJnfsma+81uptEgE3L9Dekl+
	DqfhuN2o6vGEhVxZKrhy3da2OzYdcBo9gyzC2ydzH55HXUwfr3Q2kgei4zn6RkL52/FCMpr/Xz8uv
	InmiGgZQS5NS+YiwHzd381o+uKp/WTwg00B0v0WcCXHK/q4NxfZ8WVfwiDM0mgp+bOxc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSfMZ-00GeZ5-2H; Sun, 15 Nov 2026 19:54:03 +0100
Date: Sun, 15 Nov 2026 19:54:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: dsa: mv88e6xxx: Enable LED control on
 88E6171
Message-ID: <501adfa2-70dd-4fc0-b972-eb29785116e2@lunn.ch>
References: <20261115181305.2860498-1-olek2@wp.pl>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261115181305.2860498-1-olek2@wp.pl>

On Sun, Nov 15, 2026 at 07:12:36PM +0100, Aleksander Jan Bajkowski wrote:
> Enable LED control on the Marvell 88E6171. This switch uses a register
> layout similar to the 6352 family, but has 4 LEDs instead of 2. Hardware
> triggers are not supported at this moment.

Please break this patch up.

.num_leds makes a lot of sense, but please introduce it as a patch.

.led_hw_triggers i'm not sure about. But please add it as a patch of
its own.

> @@ -4609,6 +4609,7 @@ static const struct mv88e6xxx_ops mv88e6171_ops = {
>  	.port_pause_limit = mv88e6097_port_pause_limit,
>  	.port_disable_learn_limit = mv88e6xxx_port_disable_learn_limit,
>  	.port_disable_pri_override = mv88e6xxx_port_disable_pri_override,
> +	.port_setup_leds = mv88e6xxx_port_setup_leds,
>  	.port_get_cmode = mv88e6352_port_get_cmode,
>  	.port_setup_message_port = mv88e6xxx_setup_message_port,
>  	.stats_snapshot = mv88e6xxx_g1_stats_snapshot,

static const struct mv88e6xxx_ops mv88e6171_ops = {
	/* MV88E6XXX_FAMILY_6351

I assume these changes work for all members of the family?

> @@ -301,6 +305,8 @@ struct mv88e6xxx_port {
>  	bool fiber;
>  	struct led_classdev led0;
>  	struct led_classdev led1;
> +	struct led_classdev led2;
> +	struct led_classdev led3;

Maybe turn it into an array?

> -	if (led == 1)
> +	if (led == 3)
> +		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED3_SEL_MASK;
> +	else if (led == 2)
> +		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED2_SEL_MASK;
> +	else if (led == 1)
>  		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED1_SEL_MASK;
>  	else
>  		reg &= ~MV88E6XXX_PORT_LED_CONTROL_LED0_SEL_MASK;

Seems like this should be turned into a switch statement? Or can this
be simplified with some simple arithmetic or FIELD_PREP?

> +static int mv88e6xxx_led2_brightness_set_blocking(struct led_classdev *ldev,
> +						  enum led_brightness brightness)
> +{
> +	struct mv88e6xxx_port *p = container_of(ldev, struct mv88e6xxx_port, led2);
> +	int err;
> +
> +	mv88e6xxx_reg_lock(p->chip);
> +	err = mv88e6xxx_led_brightness_set(p, 2, brightness);
> +	mv88e6xxx_reg_unlock(p->chip);
> +
> +	return err;
> +}
> +
> +static int mv88e6xxx_led3_brightness_set_blocking(struct led_classdev *ldev,
> +						  enum led_brightness brightness)
> +{
> +	struct mv88e6xxx_port *p = container_of(ldev, struct mv88e6xxx_port, led3);
> +	int err;
> +
> +	mv88e6xxx_reg_lock(p->chip);
> +	err = mv88e6xxx_led_brightness_set(p, 3, brightness);
> +	mv88e6xxx_reg_unlock(p->chip);
> +
> +	return err;
> +}

Maybe mv88e6xxx_ledx_brightness_set_blocking(), and 4 one line
wrappers around it?

The current code is not scaling well, so please look at refactoring it
make it scale.

Lots of small patches, which are obviously correct, and good commit
messages.

     Andrew
