Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752317;
	b=aNY0/JgeSQAttRNID2Jbp/YpevoT1s9V6N9jS5B055H52+IGL6G0dul8pT/lGvEQwoJd
	 CIwSfVcnttXcSnR+3cFv0DJ2vRreAB8FOgPI1pGm3nSyiPBmSMRLjmiYigDVl2MZpwxiW
	 9iJeRC3fyjnyEbRn/h3CDGZTQRGjJLEs3hjZV00gp3OG3l+7NPCfANhbH1v9RPP6MSjNu
	 4EULV+x39mt1jovOIqWQYhVxwTMhQIWvR1LIfjdi/pC/syLHmXyfTmgtslOqbExnTMO5F
	 ruU+S+B+aT98XeKICUHvsx4tPNYxRCpb2jBgZhd4tHhUQryCK5sgYDMH/T86r04Ik9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752317;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=WQoftNx1+ky9AuggiK3VoWKz8ajkaLtdnex4l8Hd7yE=;
	b=rG2AX7dtFINwL8uvkdkzF1HpXToaOXSjPphUPRWKJadDZM7FHZPz4iGBeeW8OxGJDrPt
	 d/B8BybsnXyxNTw+MRovkOOkXC5BUkQQoMNea17aLLhunQWLEWItDI8BPQe0l3t74cbTL
	 L1us/SpvIbJ5bkMdSr7h3FdjntKPcRvbVsfRTnx93Oo2HLNQ+ZLIRblfcu7SK4Lshti5q
	 LAsJzjIpw9nPa7djJlv9sM/wjIKttkUh8RnS08rNtX1iEpkjWCl139vs2N9hBpMbTlFXx
	 CEPrvzLcdZfhhzwL3V/YPguVF56F4AtSjG4bAETwIs5Xe+2uOuT/9UflYY34kH6uOeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jpcm5JZ0;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16CA6606A330
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16CA6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=jpcm5JZ0
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so1188115e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752315; x=1795357115; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WQoftNx1+ky9AuggiK3VoWKz8ajkaLtdnex4l8Hd7yE=;
        b=jpcm5JZ0Yp9TZw3bmop2xrImBXAEdl5HF3fIdnf/p/jaHBcWWEtqMOWu42+dbUGDF+
         Klk+ayFUq4iR5j0O/GXvBGp0w0hx3wh7jIP51b2WNhLPvVSS9nnnXyy0X96uycjWWfV9
         2U2auiXd4grLhzE2gRmz9Vt8GH7xJOtNyoIY4BU6rFzi7L5vmCe6VazYuEqjdCi0MbaZ
         C1jw5911LgiOQaKMoTY6z/LeWwnTyJPq0cNxSgV0DRI1BcfaXYrfZfyZtx3qqvYJLOTp
         agNbLtZdn5Th5smVTdlqUI2EytYkal+H3UeDDU/s6QcScLRT5bLyQxm0EH5nB1b86q4X
         dKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752315; x=1795357115;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQoftNx1+ky9AuggiK3VoWKz8ajkaLtdnex4l8Hd7yE=;
        b=ZIiGcpIYo1wauaDUpjOjhdD0v/tWmaKI462IuwKcFu8aqNd5DcVfMwq9lMm21zbA5n
         gYWj0keRh9VgrzUj7ANkDX8qHcHdaahDqpTSyqbFG/wOj0FnxE1LqyTlNKQ2oA2czIfR
         T0HEkvdd1QTSgYhhXPicxZjR8s9gY9uwHdKL7bKjjfVVvDDMSkOhpV7pdL8NWVJjKNxs
         n1DxRLw+I3IWUZRY6j13046CF4Whk4sTMirEBiENnPANmvo9OqCtjwzGYCowO2h0+Wnl
         +HEzJVUVSwl4jj9tCDwnRPlYfKJraOM0NDuq40K6xVzC9xIhwhtjCY8lOSGFFcb0Gjcu
         9mOQ==
X-Forwarded-Encrypted: i=1; AL+hErFdwK2Uk4jlgcA6C6ctWZqFuYGlhJ/SaXxpf/9jv+FnPWDpoBY+SQkLpSd4ESCdIJ87E+n9KBxIL1lCxog=@vger.kernel.org
X-Gm-Message-State: APuU4Z/pc4MDBIQht0+PDkVTUJUOUdA41O/+F5lWERUKd9LZsOX7luTY
	CD0SU/OTc0StUcFWaK6Z98ssG+ybbinTq2MBzcut4yJXD5e9xVp+T+PqnJFhMWWQOOpxhM524e2
	+WAuP
X-Gm-Gg: AYBFou1JJ3H9770Mo2slVpVcoFqA5sJNTFHbXNT0wYNqdJRLx88ZVrB15zSp4YaWNTc
	AhSh8RFanXccCUqqM8CZzXq4Pp1J6kYqU2rlJjtM9T5kHlTh0hbyyhVFlqCaCv+egRXQYs8rDBv
	8uZBnG4zy0KpBkpHSZFi4jGvrqNu0+q1A+pjrTyJ3btxX3VSvuhDBVpcuw/Wru+TPIW/hCcGQJN
	Damw5AAaF6Dc1CfQQ8upgeptaoN+gxyZZhCnbLLfu+Ye1ZBQX8acSU57SHLMvFSvwLvZrw2KZmi
	qWK2jzXdWukc95+Kyuji7kilNx9eYuI6m4lzPKib9aWMj3/PmNlhxzFAbaRd30Qjj0VY/0M7jM+
	HaRIZ2Mru0Fu3JoRykDHcVlKohB/1OA7hA/lQk3s/1tZwJCTihJ+dcbi45Y+kNRuZsxnxKqeVjQ
	SJfi5E2MLW92NX53ydaCtoRt51hwCZbLwzcYIDsIuhkxGMJwxVleCf4rlb8u3BnWwKzn2GmjWcg
	ZdhL2zd7x4U9SqEs5jEQyYxbNjfOYo3sJNYwTIq/zOHCY8O9eHQGnr8Ld+/KNZT2m1ruY0VuWmK
	GBnKk8zU4T3VTWbYv9LoZh2zh6VAGCfYFBETCJ/eqh5INzfl
X-Received: by 2002:a05:600c:4e43:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4bb559f24ffmr166728745e9.1.1794752315503;
        Sun, 15 Nov 2026 06:18:35 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb56f97257sm137451805e9.4.2026.11.15.06.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:34 -0800 (PST)
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
Subject: Re: [PATCH v1 3/6] clk: starfive: jh71x0: Add generic CRG probe
 helper
From: Jerome Brunet <jbrunet@baylibre.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261013102707.9207-4-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-4-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.10035326269756392801.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6706; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=VtBrKLm2TGieOwhTBnDIxjnhWjQzoOwdJZi+yiLRkd8=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95vPYUsyZ/7yQy20T9Joyetv7rvPOPozxi4JOp3Q4
 7L08PygjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEyk+DDD//CnhTkpiXPL93+f
 ueJR2HcFJf5vL036zX4qGTRPDXS/5MDIcMDvy+VbPzd6fk0rdHtUvzTgu8N1zS28M/+xvN9ps8t
 1BQsA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The StarFive JHB100 SoC has several clock and reset generators (CRGs)
> which share the same probe flow: map the registers, register all the
> clocks described by a table, add the clock provider and register the
> auxiliary reset device.
> 
> Add jh71x0_crg_probe() together with struct jh71x0_crg_domain_info so
> that each CRG driver only needs to provide its clock table, external
> clock names and reset auxiliary device name. The reset auxiliary device
> is registered with jh71x0_reset_controller_register().
> 
> Parents that refer to an external clock are tagged with
> JH71X0_EXT_CLK_FLAG in the parent index, so the external clock indexes
> of a driver do not depend on how many clocks the CRG provides and do
> not shift when a clock is added to the binding.
> 
> The clock index space of these CRGs is sparse, so also make
> jh71x0_clk_get() reject indexes that were never registered when the
> domain info is available.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/clk/starfive/clk-starfive-jh71x0.c | 96 +++++++++++++++++++++-
>  drivers/clk/starfive/clk-starfive-jh71x0.h | 21 +++++
>  2 files changed, 114 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.c b/drivers/clk/starfive/clk-starfive-jh71x0.c
> index 37bab563c5e0..52c5ae737dbd 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.c
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.c
> @@ -10,6 +10,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/device.h>
>  #include <linux/io.h>
> +#include <linux/property.h>
>  #include <soc/starfive/reset-starfive-jh71x0.h>
>  
>  #include "clk-starfive-jh71x0.h"
> @@ -333,10 +334,14 @@ struct clk_hw *jh71x0_clk_get(struct of_phandle_args *clkspec, void *data)
>  	struct jh71x0_clk_priv *priv = data;
>  	unsigned int idx = clkspec->args[0];
>  
> -	if (idx < priv->num_reg)
> -		return &priv->reg[idx].hw;
> +	if (idx >= priv->num_reg)
> +		return ERR_PTR(-EINVAL);
>  
> -	return ERR_PTR(-EINVAL);
> +	/* Index space is sparse: reject holes that were never registered. */
> +	if (priv->info && !priv->info->clk_data[idx].name)
> +		return ERR_PTR(-ENOENT);
> +
> +	return &priv->reg[idx].hw;
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_clk_get);
>  
> @@ -361,3 +366,88 @@ int jh71x0_reset_controller_register(struct jh71x0_clk_priv *priv,
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(jh71x0_reset_controller_register);
> +
> +int jh71x0_crg_probe(struct platform_device *pdev)
> +{
> +	const struct jh71x0_crg_domain_info *info;
> +	struct jh71x0_clk_priv *priv;
> +	unsigned int idx;
> +	int ret;
> +
> +	info = device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;
> +
> +	priv = devm_kzalloc(&pdev->dev, struct_size(priv, reg, info->num_clk),
> +			    GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&priv->rmw_lock);
> +	priv->info = info;
> +	priv->num_reg = info->num_clk;
> +	priv->dev = &pdev->dev;
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(priv->base))
> +		return PTR_ERR(priv->base);
> +
> +	for (idx = 0; idx < info->num_clk; idx++) {
> +		u32 max = info->clk_data[idx].max;
> +		struct clk_parent_data parents[4] = {};
> +		struct clk_init_data init = {
> +			.name = info->clk_data[idx].name,
> +			.ops = starfive_jh71x0_clk_ops(max),
> +			.parent_data = parents,
> +			.num_parents =
> +				((max & JH71X0_CLK_MUX_MASK) >> JH71X0_CLK_MUX_SHIFT) + 1,
> +			.flags = info->clk_data[idx].flags,
> +		};
> +		struct jh71x0_clk *clk = &priv->reg[idx];
> +		unsigned int i;
> +
> +		if (!init.name)
> +			continue;
> +
> +		if (init.num_parents > ARRAY_SIZE(parents))
> +			return dev_err_probe(priv->dev, -EINVAL,
> +					     "clock %s: too many parents (%u > %zu)\n",
> +					     init.name, init.num_parents, ARRAY_SIZE(parents));
> +
> +		for (i = 0; i < init.num_parents; i++) {
> +			unsigned int pidx = info->clk_data[idx].parents[i];
> +
> +			if (pidx & JH71X0_EXT_CLK_FLAG) {
> +				pidx &= ~JH71X0_EXT_CLK_FLAG;
> +				if (pidx >= info->num_ext_clk)
> +					return dev_err_probe(priv->dev, -EINVAL,
> +							     "clock %s: invalid external parent %u\n",
> +							     init.name, pidx);
> +
> +				parents[i].fw_name = info->ext_clk[pidx];
> +			} else {
> +				if (pidx >= info->num_clk)
> +					return dev_err_probe(priv->dev, -EINVAL,
> +							     "clock %s: invalid parent index %u\n",
> +							     init.name, pidx);
> +
> +				parents[i].hw = &priv->reg[pidx].hw;
> +			}
> +		}
> +
> +		clk->hw.init = &init;
> +		clk->idx = idx;
> +		clk->max_div = max & JH71X0_CLK_DIV_MASK;
> +
> +		ret = devm_clk_hw_register(&pdev->dev, &clk->hw);
> +		if (ret)
> +			return dev_err_probe(priv->dev, ret, "Failed to register clock %s\n",
> +					     init.name);
> +	}
> +
> +	ret = devm_of_clk_add_hw_provider(&pdev->dev, jh71x0_clk_get, priv);
> +	if (ret)
> +		return ret;
> +
> +	return jh71x0_reset_controller_register(priv, info->rst_name);
> +}
> +EXPORT_SYMBOL_GPL(jh71x0_crg_probe);
> diff --git a/drivers/clk/starfive/clk-starfive-jh71x0.h b/drivers/clk/starfive/clk-starfive-jh71x0.h
> index 322a05157faf..666d44e6a752 100644
> --- a/drivers/clk/starfive/clk-starfive-jh71x0.h
> +++ b/drivers/clk/starfive/clk-starfive-jh71x0.h
> @@ -5,6 +5,7 @@
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
>  #include <linux/device.h>
> +#include <linux/platform_device.h>
>  #include <linux/spinlock.h>
>  
>  /* register fields */
> @@ -29,6 +30,16 @@ struct jh71x0_clk_data {
>  	u8 parents[4];
>  };
>  
> +/*
> + * Parent indexes with this bit set refer to an external clock, i.e. an entry
> + * of jh71x0_crg_domain_info::ext_clk, instead of a clock provided by the CRG
> + * itself. This keeps the external clock indexes independent of the number of
> + * clocks the CRG provides, which in turn must stay below the flag; drivers
> + * check this with a static_assert() on their clock table.
> + */
> +#define JH71X0_EXT_CLK_FLAG	BIT(7)

I'm really not a fan of this hack.
In addition to being hackish it will limit your controllers to 127 internal clocks
which I'm pretty sure is a limit you'll hit eventually.

I'd prefer if a parent was defined by a struct of yours, something like

struct jh71x0_parent_data {
	const char *fw_name; // <= external if not NULL
	unsigned int internal_id; // <= id in your table if the above is NULL
}

With this, the bit, the macro that goes with and the table of external clock
can all go away.

I suppose it means some change in your existing drivers too

-- 
Jerome

