Received: from linkmauve.fr (linkmauve.fr [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA403C3F58;
	Mon, 21 Sep 2026 17:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790010067; cv=none; b=gZUNrBz/tasVCVgZpnOR9cQk4tYxXEMP1BrfVaWKgxoYekDwwLjPoqZQkUg21AUiqpHJpSlj4wu7Qmd0hE1kD6X676vYt0Am69qsfvWHhrQUBd+6JD+9gBQl+TtYjksqhDrnEns76CbTQq4aIiTbhW5nWcLb85wWVvZsjZDy5r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790010067; c=relaxed/simple;
	bh=R4OKlJp4JXlTiXm11kLsKOkSES+Pu8hmJ514GfVGpWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NeIEsG+gmWU93aK4rGhHZL8wrMqZH2oJ+Ry4bSkUfOLxnRZ1ikSGeWw5NHY1Is73be9wKKFlOIiyJmHGrWLTizilxbo7J1WwNF9hOiIpqgV/AhyLVizIkhisaixEIle1P3ADg9gNiv8p7gJMwDA/9exE21dJXe0nzlaBUQRP6gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by linkmauve.fr (Postfix, from userid 1000)
	id 6F6CD718B250; Mon, 21 Sep 2026 19:00:55 +0200 (CEST)
Date: Mon, 21 Sep 2026 19:00:55 +0200
From: Link Mauve <linkmauve@linkmauve.fr>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Link Mauve <linkmauve@linkmauve.fr>, linux-media@vger.kernel.org,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Bradford Love <brad@nextdimension.cc>, Kees Cook <kees@kernel.org>,
	Deepanshu Kartikey <kartikey406@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] media: ts2020: put regmap_config on the stack
Message-ID: <arFixwvATR2hkp68@desktop>
References: <20260804114625.2314430-1-linkmauve@linkmauve.fr>
 <20260804114625.2314430-4-linkmauve@linkmauve.fr>
 <arA3TaFiFOx7ubjj@monoceros>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <arA3TaFiFOx7ubjj@monoceros>
Jabber-ID: linkmauve@linkmauve.fr

On Sun, Sep 20, 2026 at 09:46:42PM +0200, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Aug 04, 2026 at 01:46:23PM +0200, Link Mauve wrote:
> > diff --git a/drivers/media/dvb-frontends/ts2020.c b/drivers/media/dvb-frontends/ts2020.c
> > index 8775083f4dd6..27f096ce522e 100644
> > --- a/drivers/media/dvb-frontends/ts2020.c
> > +++ b/drivers/media/dvb-frontends/ts2020.c
> > @@ -18,7 +18,6 @@
> >  struct ts2020_priv {
> >  	struct i2c_client *client;
> >  	struct mutex regmap_mutex;
> > -	struct regmap_config regmap_config;
> >  	struct regmap *regmap;
> >  	struct dvb_frontend *fe;
> >  	struct delayed_work stat_work;
> > @@ -559,6 +558,12 @@ static int ts2020_probe(struct i2c_client *client)
> >  	u8 u8tmp;
> >  	unsigned int utmp;
> >  	char *chip_str;
> > +	struct regmap_config regmap_config = {
> > +		.reg_bits = 8,
> > +		.val_bits = 8,
> > +		.lock = ts2020_regmap_lock,
> > +		.unlock = ts2020_regmap_unlock,
> > +	};
> >  
> >  	if (!pdata) {
> >  		dev_err(&client->dev, "platform data is mandatory\n");
> > @@ -574,12 +579,8 @@ static int ts2020_probe(struct i2c_client *client)
> >  
> >  	/* create regmap */
> >  	mutex_init(&dev->regmap_mutex);
> > -	dev->regmap_config.reg_bits = 8;
> > -	dev->regmap_config.val_bits = 8;
> > -	dev->regmap_config.lock = ts2020_regmap_lock;
> > -	dev->regmap_config.unlock = ts2020_regmap_unlock;
> > -	dev->regmap_config.lock_arg = dev;
> > -	dev->regmap = regmap_init_i2c(client, &dev->regmap_config);
> > +	regmap_config.lock_arg = dev;
> 
> If desired you can keep all the assignments here using:
> 
> 	regmap_config = (typeof(regmap_config)){
> 		.reg_bits = 8,
> 		.val_bits = 8,
> 		.lock = ts2020_regmap_lock,
> 		.unlock = ts2020_regmap_unlock,
> 		.lock_arg = dev,
> 	};
> 
> > +	dev->regmap = regmap_init_i2c(client, &regmap_config);

I think I still prefer my approach, there is very little usage of the
typeof() pattern in the kernel, the only benefit would be to keep
lock_arg in the same location as the rest of the initial values.

> 
> With or without that approach:
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Thanks!

> 
> Best regards
> Uwe

-- 
Link Mauve
