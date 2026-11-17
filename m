Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794934316;
	b=MXUWQY3u1lsvmPg1OSFRyShD+7z9Pl1HnYqP9BrfR6a8hu0croVtIBEDm7GKforYBXjR
	 U3x7R2ypwyEoOdpg3i1PEXOIRQhS1+uEZRCr1E+L/9oAd4fKY/ffrZhs2XgnZC/3PFlTY
	 ysdmM/B5W/Kom5PuBzB8aKP20sag+Rl73VVB16UCVbJ7R45FgbidNXG1rbILZA2xOUhz6
	 mXOLi+dxBVIjAgfU25gKkTLYeGwctBqdAnUdnbqJbogql4TG1btaXv3LLEE8SmaVpA/92
	 k7h9RCfGYXdtAO0myKClaQAJ6vs6WEaWkFFxy2lhu0Hx4gMB92VkVF6LuhXf3ygnE+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794934316;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UQhNopprSz0AVSKjleR7Xe3nJdZYPpFFlx8w8ov+7HM=;
	b=1YTnza1JmT9XLFQpWqq1zMAopKBmLGQilEJtxj+EgILhUEfFhENl3I9qSdNCZb1hndK+
	 2LjIKe/4/iTy0Nmw6W9OoQRH/I1W+AOfqOwNcPmb37P39BkXwmLY2QR6rUPRV6zIX2fpF
	 7nUEi290IfpjQJ5yvP3rgNacP/uD1lT+s8S8nBDOfJkzKELR1rZvw4Q8QNueltxl1no/4
	 XKPGQrRQqtfA3cGUW4jLnXxVrk+FSxBoxF49G7IGLg9tov1FEC+z9z+xsaP5EsfqfxUuC
	 oDoMZc5k7tt8VtrxCfm1OBtvP46ZOHcY8BRzRArNLAmkiv47PT/WEFbvTARsgB0iZow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3lm6A1h;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D1A606A338
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:51:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06D1A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=m3lm6A1h
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso5144931f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794934314; x=1795539114; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UQhNopprSz0AVSKjleR7Xe3nJdZYPpFFlx8w8ov+7HM=;
        b=m3lm6A1h/g3+iQL8eExyC3I2hvkQjMSCtoivGEv+A9rz1CMkEeXo11qkgi9C56129d
         ZStkj+u9+4oTRYLOAA8H7gU2VpyjrTPUY8HcH1+n+EBixlFu7+OKzuA8dfuUBNiJIp7b
         3wnhZtAT54lSxLGIn7U1R6tfV/yy9tgRv67KljQsVJZ+QCPBw8rhAx8xIFenF68UTLKz
         sGRlQfnKcOiP0p9ndB+7ZGpmwOK/EUyfrI5hs5ahw0EGcMWju81ysSZqNtxncPnQ0giY
         WjfamWL6wndgQq8BMtYB385J0v5z+5NVWwNaEa4R6E/QvoatGc8X0NUKxrdVvA0HW/wB
         fwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794934314; x=1795539114;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UQhNopprSz0AVSKjleR7Xe3nJdZYPpFFlx8w8ov+7HM=;
        b=z3BS5iprA/8DmUrYiRRWwHlZFrwNdHzx6DMdWXeEeN4vw4ps+ek2Ur8sw5R4HSm4eZ
         ZA/U9g3dJLwPs2zK8k+YMKRaWmBzCLG7NNpq5EngSCUFD1yD5iqs2w8v9mqiPQzzJvYK
         YNZMVtOdxmHFYBfTzGj5hQLPWN2U04vGzlJQv6hTccx71eOwoilMMbik5rmfu4znhWtz
         T3nXYBC3m/TS59whjA0qB1lLYDHZTPtn9RV8f/bfIrgNA2jNSuPlI/+PU6l0ikX3edTW
         UPldWt7GbQ+9VbXrwvPUBkilha19THiciv2lo4eL3m9UaiM106Z7krJ2QhthnCYBLcpz
         hYDg==
X-Forwarded-Encrypted: i=1; AL+hErE5AVGu/iSx9lvFZ731vOt/aZo8ju0s9vpcEh2ipXG60iE9EPkUCj+nSPG5OVGJcPmYaNCqb2RcSINRSSk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kc/kaMeHCWwAG0+AW6cSOzLzF8cQcld3O7foBKBnSdecSv7Nk
	TnCLSpd2NXxLobWHRRfLClf56jbo+dMDNocGjgOBR2Ec4pJ17ixal2+r
X-Gm-Gg: AZFdTZeANbofgyQBMyHZiT6JJKNTKHVbnLLMDz4UedukojcFaTJ6iZGm/3Pjq4Xmgno
	AfANsYopxe6QPTbsuUGVWbwZzjD0eK7Zp+p8Djn3D02AGfZEJqYo2LKgDEeiHK5HGEdBBgOevKs
	LapbC4FtXE9+RdQ7CrtLxdRKaUoLkmnH9swaMJZjtw/VXQXln5/DRlVstfvB1rX2JLM3yJL17V6
	ASijA2VxE1KmUEX8B8cN6pe1drB4mrSa5u8IkUFSn2FKPVnjv3zvls4keRTuMSh5trflh+H252k
	zxwz/zh7HWSxAKUstVdINjAb1gOaKuYJI3vbMeKDsI6SAJedWduqfAvz2nq2FKPQRetPDUbAiAK
	lj0C/oyTwszdUYdc8f5243PeGOiFbVqStyOM4Z/P5txS8xQlAcpoWMQTgRIfvLkGB1wETM6Hcsj
	uNRcN8cBJmzc4SWs3KdQUbE3Ix932yg+niY4wrzufDLqxzXpU0jNUo+jn5ZsTjOlkG6z8gkgiXt
	X1bbXq6dVlIoWNEKH0Mc+hUAcdVgwKa0jFo/NNhOPOxxDCXn5BR8yO+fhjuuh2TccNX7CKMAyII
	jFlW5/1mc/6woQv1mWDwLLTEuDXI3HKTClXyIMn3P80Bb7H0ho3eqH8nKUreg98zT+sFexh5v8z
	TvuWPc3q1csOzzBOT
X-Received: by 2002:a5d:5888:0:b0:48f:f26d:c5c with SMTP id ffacd0b85a97d-4a638058303mr43112f8f.9.1794934314251;
        Tue, 17 Nov 2026 08:51:54 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm30846431f8f.40.2026.11.17.08.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:51:53 -0800 (PST)
Message-ID: <6afc8629.c6df0648.3437b8.c961@mx.google.com>
X-Google-Original-Message-ID: <avyGJqEgNXfFXb8s@Ansuel-XPS.>
Date: Tue, 17 Nov 2026 17:51:50 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Brian Masney <masneyb@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] clk: en7523: convert to full clk_hw
 implementation for en7581
References: <20261110001128.1041-1-ansuelsmth@gmail.com>
 <20261110001128.1041-2-ansuelsmth@gmail.com>
 <179444135864.1126566.17591616173966524369.b4-review@b4>
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
In-Reply-To: <179444135864.1126566.17591616173966524369.b4-review@b4>

On Wed, Nov 11, 2026 at 06:55:58PM -0500, Brian Masney wrote:
> Hi Christian,
> 
> > In preparation for support of .set_rate, convert the clock register
> > logic from fixed clock implementation to full clk_hw implementation with
> > dedicated OPs for Airoha EN7581 SoC.
> > 
> > This is just a rework and no behaviour change is expected.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  drivers/clk/clk-en7523.c | 75 +++++++++++++++++++++++++++++-----------
> >  1 file changed, 55 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 24fdec2e6198..6640e814d36a 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -126,6 +126,12 @@ struct en_clk_gate {
> >  	struct clk_hw hw;
> >  };
> >  
> > +struct en_clk {
> > +	struct regmap *map;
> > +	const struct en_clk_desc *desc;
> > +	struct clk_hw hw;
> > +};
> > +
> >  struct en_rst_data {
> >  	const u16 *bank_ofs;
> >  	const u16 *idx_map;
> > @@ -742,42 +748,71 @@ static int en7523_clk_hw_init(struct platform_device *pdev,
> >  				     en7581_rst_ofs);
> >  }
> >  
> > +static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> > +					unsigned long parent_rate)
> > +{
> > +	struct en_clk *c = container_of(hw, struct en_clk, hw);
> > +	const struct en_clk_desc *desc = c->desc;
> > +	struct device *dev = clk_hw_get_dev(hw);
> > +	struct regmap *map = c->map;
> > +	u32 val, reg;
> > +	u32 rate;
> > +	int err;
> > +
> > +	err = regmap_read(map, desc->base_reg, &val);
> > +	if (err) {
> > +		dev_err(dev, "Failed reading fixed clk rate %s: %d\n",
> > +			desc->name, err);
> > +		return 0;
> > +	}
> > +	rate = en7523_get_base_rate(desc, val);
> > +
> > +	reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > +	err = regmap_read(map, reg, &val);
> > +	if (err) {
> > +		dev_err(dev, "Failed reading fixed clk div %s: %d\n",
> > +			desc->name, err);
> > +		return 0;
> > +	}
> > +
> > +	return rate / en7523_get_div(desc, val);
> > +}
> > +
> > +static const struct clk_ops en7581_clk_ops = {
> > +	.recalc_rate = en7581_recalc_rate,
> > +};
> > +
> >  static void en7581_register_clocks(struct device *dev, struct clk_hw_onecell_data *clk_data,
> >  				   struct regmap *map, void __iomem *base)
> >  {
> >  	struct clk_hw *hw;
> > -	u32 rate;
> >  	int i;
> >  
> >  	for (i = 0; i < ARRAY_SIZE(en7581_base_clks); i++) {
> >  		const struct en_clk_desc *desc = &en7581_base_clks[i];
> > -		u32 val, reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > +		struct clk_init_data init = {
> > +			.ops = &en7581_clk_ops,
> > +		};
> > +		struct en_clk *en_clk;
> >  		int err;
> >  
> > -		err = regmap_read(map, desc->base_reg, &val);
> > +		en_clk = devm_kzalloc_obj(dev, *en_clk);
> > +		if (!en_clk)
> > +			continue;
>
> return -ENOMEM;

Hi Brain,

as you pointed out in the previous revision, returning would change the
behaviour so I currently skip the clock in such case...
 
-- 
	Ansuel
