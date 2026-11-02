Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793626259;
	b=Ge5oujwSFEYEcMojisaX71EvfbvOYYUCfufwUJTB0tBwaE/g8ZEyg6xQ73jOYszUoHG+
	 3paGvNvxbpHuFmGei7CJRYRW7IGtrywkkpFe8uHXbvbaJzJhefVRQeDkCLHJ/AvnoUJZy
	 qw9Db5Qi18j+Fm8VbHlcsLDD+sjIuvqOvvOgfuJLZ4qrPZP74e08iWUjOHuyjfgwi7KeU
	 TZQIeosZcl2IM1HdaULXNEUHImWKrEQ7OncQHJ+cU4EvjhDVkyRqy2fyHyvNPhNgOQ1Uc
	 u62fpZYYqUtm7uFkNTJ7rCS4fM3OnKuxoVU/3Sugq/fNJOrWMb/tlsV7iNdGDLOmhtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793626259;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=k88wWLlxzRtcrpIpBYaGs2GvFCG5I+LbVM6LZUEshQM=;
	b=MZ/GICv94iKtbuesl0XE6Xqs3PqPsZFJ5je5DOiMvjM4mWSNckzJ5QBDCmyFXQWasxi9
	 bNISZz2XyT5hEjmS8UYxZ/UiQzeoUHXUBveRUJgHlFqGobwSwXG8BL9aKvzT13Vy0ne5G
	 W41tH6gjw5/abxG2VJMArPqqovfYjFk5D7uoYBVYCZiD+Ewnqwqgxpnf+7HOas+voggw+
	 tI8zRINneAYdhC1LO1DUM7+EA5D9V2ie+TU+aLfioy07xb760fqVLZGJqjwggAosZW8gX
	 EyolN7LmLsH83sbOqKZmWTEov6lPTsWLxdQTFMKHXSVe+JZiWlUNqUTlraOL0uulZkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UgOWsOpJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD54606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UgOWsOpJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0D3C1F00A17;
	Mon,  2 Nov 2026 13:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793626259;
	bh=k88wWLlxzRtcrpIpBYaGs2GvFCG5I+LbVM6LZUEshQM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=UgOWsOpJM+FLFpy8xfuxrRkh1RB7hbIvUI0zhakntxspcyOPf/pgURiALMezh9UXC
	 JeDBlUpEx7TeKkxjUP0LSZw7m0glL5fETy9CT76QsIJ9il/YZTJ0UQNeY1H6LVbu+z
	 NLXniabhIdXwq6U/LtB0JUTXsef/SBvlz2QHslOz8Wd1yXlHiJHh1+RKtjgBWHsvK+
	 Z1OgIz/UhiqnaulnJyJa9ahfKD2Z+LGaCe3zGnZ7SmwMU3ZnN0nxuDqEzUjN/yEOja
	 KoTanF9/HnoPvWh78cbC+0vYStW8bT082b84mlSdScIi1zwlP9cxAFSeY7Zuc3dUX1
	 xUMmqVvzpFIKg==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C7FA8232B38D;
	Mon, 02 Nov 2026 13:30:56 +0000 (GMT)
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
Subject: Re: [PATCH v2 3/7] regulator: sy7636a: wait for power good on
 enable
From: Mark Brown <broonie@kernel.org>
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org
In-Reply-To: <20261101223125.302001-4-pmazzini@gmail.com>
References: <20261101223125.302001-1-pmazzini@gmail.com>
 <20261101223125.302001-4-pmazzini@gmail.com>
Date: Mon, 02 Nov 2026 13:30:55 +0000
Message-Id: <179362625591.1990291.13023153378073511078.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=933; i=broonie@kernel.org;
 h=from:subject:message-id; bh=666ZysnzgTMlI+KHcshHlTs4uLKXI0qTlGnJHURLR9A=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJeTJhwa85kn+3ql1UvfnN10tsbb91UZKy+Ofs88479x
 oe3FbdN6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBEHE4z/Pd+dOFqzclLq2NX
 HHddevlg1cuD6wzMOrR5V75NdnjTek6YkaHvj4tYTw5XyE/l0NBHvP9zG+p1I9fuNC1htry19qL
 WWW4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Wait for power good on enable, as the TPS65185 and FP9931 drivers do,
> so that consumers can use the rails once the enable returns.

> +static int sy7636a_enable(struct regulator_dev *rdev)
> +{
> +	struct sy7636a_data *data = dev_get_drvdata(rdev->dev.parent);
> +	int ret;
> +
> +	reinit_completion(&data->pgood_completion);
> +	ret = regulator_enable_regmap(rdev);
> +	if (ret)
> +		return ret;
> +
> +	wait_for_completion_timeout(&data->pgood_completion,
> +				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
> +	ret = gpiod_get_value_cansleep(data->pgood_gpio);
> +	if (ret <= 0) {
> +		regulator_disable_regmap(rdev);
> +		return ret ? ret : -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}

One thing here is that if the regulator was already enabled on power up
we'll get the full delay during startup if the regulator was configured
as boot on but already enabled.

-- 
Mark Brown <broonie@kernel.org>
