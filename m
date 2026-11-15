Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752320;
	b=w8oAthwU2MeWTgIyF4zXe+bj0B5VxqlYRuvYRMKm5gKcD8VLG9t9SGCGYFvfpYYkW1ZU
	 dg+XcV/2b/L/OVekAmlto2sHHaAy8YZ3VcbEALnbxeEf1NKr2qurnSeGN9tG607ExHliq
	 ss675g+sDpUvbk4eDRu2Cdu4QXRlq4wGnmZK8+EH139HFqJtIUDgtSQyIKBRjjGwTsQOc
	 1hLLz9WrXdUeXyYm0WrhqhGthTSUWErtu4X81TJD0ib+B9+1DaXelnnOxI11muazhp65f
	 HdrZap0H7X2M8AmUsX2eWHmgohRPCrrFmkZgvnIvJDMxNPBoQvT/fAKUsVtw5BkbHfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752320;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=pFpKrbiTZjZmz91L9EOjNJDX0CfJgVxIe1sWhAPFRts=;
	b=bfkBDrOdcMCnivnrS8YQcKNm6fwDSATR0tH+730GDf+1H/F7nwmCuSOijzcklMEiDG0Q
	 hJsfLbX0KVC/9nRTApD6ozwHx98+JKatQ89OfCaeUprl9A2EmwVfqu3PBS20p4GHkR7bu
	 8nh3SXiqeedPu+8NE6HgumLzPw0H+BSlKS9LkcoGoJ6Oe3i55KftFT2H4DfUvEucbdyus
	 KOh9TkFPfqgZStOS83xw+fhshgb8D/jcR2+SUHgz8IgRo0MKj4uT4oGI7xM3zgZ2nZnvx
	 Ne6P/CKhgDVvAaLmByaku/q8pFmFSWVfjiaVuWdIKBPDvQiaIPm0VvzKN+Wau+0cZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gW+UEver;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8A1606A339
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D8A1606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gW+UEver
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so33813125e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794752319; x=1795357119; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pFpKrbiTZjZmz91L9EOjNJDX0CfJgVxIe1sWhAPFRts=;
        b=gW+UEverPAXmC6oIURdYJlfAKErMs7CF1AW/xdC4nI7JaYGof0yCbINrs6iEBMvebi
         hW52obgFr1UdgBvjvXqiIHKrApoyZ+bRPybMEGIStyyvZtBAQDbdkINujEf2wvDbIr5N
         D9xmLFHRS+5S5976Y2G/P678ercEczQatNQ59HFHWRGLkV3Gwpltt9SzDZZ3hh9sL8f3
         KXW4SZ8PJaCLCqtx8Vl8VyjPJXQ7W5jyhioN6/pqdp2td/TYH5LNGbb1C/YBnRPPtpmy
         XYr2hs2VP626XBdgj+C/ZqLvMx/Gq6X0WCaQwlSL1X0tyf6NYJskzOUda2yoJ8G1/wWm
         g/Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752319; x=1795357119;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pFpKrbiTZjZmz91L9EOjNJDX0CfJgVxIe1sWhAPFRts=;
        b=07YtWNUpL4joRIYKhW7YphrtaiMxCwRf1QfeSoQU6SBfNg0oIMux85MQ7vl/u+in2U
         CbBd4B7hBIoJgIYLy4gZFPm71gKdlvU1oSCAuDEvDmofNZ8jNKH8x9WwpAy2oNmR1sZD
         tFLyqUdOyBFCmP5ILg37qHiC+Pc9ZBbVHnOgqbJ2JLpmWk8HVr+9zJne2MRZODoVJNtq
         ZoKeMycJeJ/LtbgrTRPCyJdUW6Vz/UcvT1CIneBpZSbPLUfE6OKl3DTEp8rzTk7qsIxg
         tRfBydXk2XgLHWppZsE+iuto3vvbqCmJc/aK9FBY7FkybhNl9q6SF3G//Azc4ocbRJqS
         lcwA==
X-Forwarded-Encrypted: i=1; AL+hErHr2gnkyMdir0TsV2MKsfycdvd3uzplvvs31HF3VaB0B9wJebldXbHw8ROUWhCn5mH33gEoAUjX94bF3Qs=@vger.kernel.org
X-Gm-Message-State: APuU4Z83EVDiY48I7EEuMlIcLN3A9fJ9okGcdOrKebhW5CHbmXFTq5jj
	4mk8cKWr1+rJ5i2KRyihqqTyUy5WJa3+Y6uWXYOiOrbQHOadv+EGx0dfzkHIntuv5zA=
X-Gm-Gg: AYBFou1XjtBbyaDeiFpy2IAITtyHfCkPQwif8yRFXUiJYJO6ZjR3ddQBMur1+LYN3RF
	+tPy85P9fBIWF409Xf4H7tIxf4Eej1pTFJjM7lLgnka/YaQLtHYzSY0YioAFz3ICJKZr3+oluCL
	8iIhln7chge4UhAj2BdUF00AmL+AJygEKgmvZsW5WsW1jOyLqTa+fP8/eiCFSuED5jshdOXVjB0
	gZiwKjGJRclB+lBAKScFEHBcIkO4dKbbGEDgGonHDZBav2PXRuSZ9bvAL15jsJ7OLaEWQoDiez3
	UBi0TqtYB1MtO6NQHi1yBMIY3ZjYHEF/31R84uXKujpDn8iVLKNRug0FGCeb7IzTIqTV/1sfCCe
	d7UB57vx2pVVn9CtOzfep4BDeN59+CBw1eiDZHPVn0t4ssKkSoVxKtIIOqv7p2bdksZJCn2zxLC
	k+cs26VF8p2yhZSrUsi1x0+N3x7kpsRdD1ZGC5kc0ggvcS51Vvzk2o3Ln2O+uk7WTzt8T7VMivU
	LW64t2mEOEZE5FOb8rTBqYnfuMaeFpabVMBSdhuA2wPbxHUp/ACkiWQweP3TfBfKKbY3EENLcGb
	Q6ikvU7rOUfyDvCCF65R3zhMsGg08LbqDyNayvEuA2qok1rLAo+C/uOyQKbER16gn3x6gA==
X-Received: by 2002:a05:600c:6308:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb55a68492mr181804715e9.28.1794752318812;
        Sun, 15 Nov 2026 06:18:38 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb6dc30b3asm30018475e9.13.2026.11.15.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:18:38 -0800 (PST)
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
Subject: Re: [PATCH v1 5/6] reset: starfive: jh71x0: Support discontiguous
 reset IDs
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
In-Reply-To: <20261013102707.9207-6-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-6-changhuang.liang@starfivetech.com>
Date: Sun, 15 Nov 2026 15:18:28 +0100
Message-Id: <179475230833.3873592.11095887430765466229.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6485; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=4YSHPxWGTuc3EuidS03239lOVJ2/QKGIZgU/mBp8vys=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFk/95szbVDuXvm6sc7DoW66jeWS1j17l/HIL1h27lLXm
 U9Hlycf6ShlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEnk9k+GfuPzvb4vsF2aOr
 3hle709gauBg5IqbHv9x9kcrHoXnW84y/M8y7fu6sUw8ITh8/sKcFzcV26emdsqFrVv41fDoL2/
 GCG4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The reset IDs exposed to consumers of the StarFive JHB100 reset
> controllers do not map one-to-one to the hardware reset bits.
> 
> Add struct jh71x0_reset_info, which describes the number of resets, the
> assert/status register offsets and, for discontiguous controllers, a
> table mapping reset IDs to hardware bits. Add
> reset_starfive_jh71x0_register_with_info() to register such a
> controller, and translate the reset ID in the update and status
> callbacks when a map is provided.
> 
> Existing users of reset_starfive_jh71x0_register() are unaffected.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../reset/starfive/reset-starfive-jh71x0.c    | 99 ++++++++++++++++---
>  .../reset/starfive/reset-starfive-jh71x0.h    | 19 ++++
>  2 files changed, 107 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> index 29ce3486752f..fd1c755a0017 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
> @@ -14,6 +14,8 @@
>  
>  #include "reset-starfive-jh71x0.h"
>  
> +#define JH71X0_RESET_ID_INVALID	ULONG_MAX
> +
>  struct jh71x0_reset {
>  	struct reset_controller_dev rcdev;
>  	/* protect registers against concurrent read-modify-write */
> @@ -21,6 +23,11 @@ struct jh71x0_reset {
>  	void __iomem *assert;
>  	void __iomem *status;
>  	const u32 *asserted;
> +
> +	/* Only exists in reset controllers that use the
> +	 * reset_starfive_jh71x0_register_with_info helper.
> +	 */
> +	const struct jh71x0_reset_info *info;
>  };
>  
>  static inline struct jh71x0_reset *
> @@ -29,19 +36,40 @@ jh71x0_reset_from(struct reset_controller_dev *rcdev)
>  	return container_of(rcdev, struct jh71x0_reset, rcdev);
>  }
>  
> +static unsigned long
> +jh71x0_reset_id_to_hw_id(const struct jh71x0_reset_map *map, unsigned int nr_resets,
> +			 unsigned long reset_id)
> +{
> +	for (u32 i = 0; i < nr_resets; i++) {
> +		if (map[i].reset_id == reset_id)
> +			return map[i].hw_id;
> +	}
> +
> +	return JH71X0_RESET_ID_INVALID;
> +}
> +
>  static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
>  	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> -	unsigned long offset = id / 32;
> -	u32 mask = BIT(id % 32);
> -	void __iomem *reg_assert = data->assert + offset * sizeof(u32);
> -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> -	u32 done = data->asserted ? data->asserted[offset] & mask : 0;
> -	u32 value;
> -	unsigned long flags;
> +	unsigned long offset, flags;
> +	void __iomem *reg_assert;
> +	void __iomem *reg_status;
> +	u32 mask, done, value;
>  	int ret;
>  
> +	if (data->info && data->info->discontiguous) {
> +		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
> +		if (id == JH71X0_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}
> +
> +	offset = id / 32;
> +	mask = BIT(id % 32);
> +	reg_assert = data->assert + offset * sizeof(u32);
> +	reg_status = data->status + offset * sizeof(u32);
> +	done = data->asserted ? data->asserted[offset] & mask : 0;
> +
>  	if (!assert)
>  		done ^= mask;
>  
> @@ -89,10 +117,20 @@ static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
>  			       unsigned long id)
>  {
>  	struct jh71x0_reset *data = jh71x0_reset_from(rcdev);
> -	unsigned long offset = id / 32;
> -	u32 mask = BIT(id % 32);
> -	void __iomem *reg_status = data->status + offset * sizeof(u32);
> -	u32 value = readl(reg_status);
> +	void __iomem *reg_status;
> +	unsigned long offset;
> +	u32 mask, value;
> +
> +	if (data->info && data->info->discontiguous) {
> +		id = jh71x0_reset_id_to_hw_id(data->info->map, data->info->nr_resets, id);
> +		if (id == JH71X0_RESET_ID_INVALID)
> +			return -EINVAL;
> +	}
> +
> +	offset = id / 32;
> +	mask = BIT(id % 32);
> +	reg_status = data->status + offset * sizeof(u32);
> +	value = readl(reg_status);
>  
>  	if (!data->asserted)
>  		return !(value & mask);
> @@ -132,3 +170,42 @@ int reset_starfive_jh71x0_register(struct device *dev, struct device_node *of_no
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
>  EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> +
> +int reset_starfive_jh71x0_register_with_info(struct device *dev, struct device_node *of_node,
> +					     void __iomem *assert, void __iomem *status,
> +					     const u32 *asserted,
> +					     const struct jh71x0_reset_info *info,
> +					     struct module *owner)
> +{
> +	struct jh71x0_reset *data;
> +	int ret;
> +
> +	if (info->discontiguous && (!info->map || !info->nr_resets))
> +		return dev_err_probe(dev, -EINVAL,
> +				     "discontiguous controller without a valid ID map\n");
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->rcdev.ops = &jh71x0_reset_ops;
> +	data->rcdev.owner = owner;
> +	data->rcdev.nr_resets = info->nr_resets;
> +	data->rcdev.dev = dev;
> +	data->rcdev.of_node = of_node;
> +
> +	spin_lock_init(&data->lock);
> +	data->assert = assert;
> +	data->status = status;
> +	data->asserted = asserted;
> +	data->info = info;
> +
> +	ret = devm_reset_controller_register(dev, &data->rcdev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to register reset controller\n");
> +
> +	dev_info(dev, "Registered %u resets\n", data->rcdev.nr_resets);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register_with_info);
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/reset/starfive/reset-starfive-jh71x0.h
> index db7d39a87f87..36f198139602 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -6,9 +6,28 @@
>  #ifndef __RESET_STARFIVE_JH71X0_H
>  #define __RESET_STARFIVE_JH71X0_H
>  
> +struct jh71x0_reset_map {
> +	unsigned long reset_id;

you don't really need the reset_id, it could just be the entry index in your table ...

> +	unsigned long hw_id;
> +};
> +
> +struct jh71x0_reset_info {
> +	unsigned int nr_resets;
> +	unsigned int assert_offset;
> +	unsigned int status_offset;
> +	bool discontiguous;


... and this would not be necessary, as Philipp already noted on the previous version.

-- 
Jerome

