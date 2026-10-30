Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377268;
	b=v5VWczGuTB9J73ayeBqXsHjvoCdDTFWNli1RYeQKufDeWWBJBQA1LVjuqGrbdmf+fl3G
	 Bs9jNjQxEXdZ0o1WKTilRVVSnQ0WRPSLKEhpcV0qz8ChRWJ4v66jA3qfRB2kRGB628ZYA
	 4/8K5CTWRTCBwllhCUFKdRAr7dp7+bfawWzO4dO4zTbzk5CP7JCnogZjpOFQuBVaNgWFM
	 Tj9WWEIAlRS95ffMqcXmhjcwMbqbB36O6NLoNwjKscYD3ZhUOcM7W3WRLDuJOXLvko1m6
	 5ye3p/XRmpxM8nzaeEOQ9ZYkVF3XqLL59mb/B+l+B6RdgHTVY98aCPl230HT2zxdHGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377268;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5D5IUwAV6ubSLQuzMHw5PO6IT8G4ZDGeE8MNEDcQwOQ=;
	b=ikNuXPmtneryw4i8P+Xobyjc9vDuEUesdRaqXM8No0lyT1QJxG0ftI+lduktzDj5gzVL
	 hvzCU8vUREOUBuwRLyMgprJNcJ61ZwwXcLB+xEJ3BqyqRdBV/Ys8TaR1GioqzDTpnzF/k
	 fBFWqFcwOHsiW3zoCPdtfEOURAfogzScovIeTzWrTcThwhYmNqDUm9xhTOWZWR8E/mKAp
	 L2eaW3iES3IyJ8zJq8dmVIdJl3h5HLTD3Ketqsry9Upb25REY00yeHZqaCOHPEk9FuTzO
	 m1hihVjjnJ6qtPCUtcyWWzcBTBy+UOELHoiyCxw5MlXMgidq/kbW46VXYHhvm7EtqsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="IO/QI05g";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32471606A330;
	Fri, 30 Oct 2026 16:21:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IO/QI05g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B00F61F00A02;
	Fri, 30 Oct 2026 16:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793377267;
	bh=5D5IUwAV6ubSLQuzMHw5PO6IT8G4ZDGeE8MNEDcQwOQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=IO/QI05gI9iFWuwVDBRu0OVtmf7CFVseccpSfHbAPmFzQKq4zbRSiOKVfUvZoAfFg
	 LbODU/upmcyhs5dYtdMbfJbXSDz7XMEGhIvcUEgN+g8PyOLvHbirw1N1PeAliwVVdy
	 1PlP5TgZv6LAHxvd6vCI+LiP/wcP1hTQUGhih/mW52L9FWB3/bpR6jIPxj6ZA3fhE3
	 7GSg4WUNuSz2UtCtIT3vF61yCG6jOkVr0M+WrXMdj1xfYzpDqx3NN+ZZcnYYRvTF5S
	 /Jwf4sEVtMqi+YMqhqZlZ7aK05XFNXK8eYFDFyyajq3IXgo+Q36ApHGsNe6KH17xmm
	 kWOXEwRnYjr/w==
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
Subject: Re: [PATCH v3 2/3] regulator: Support regulators where the voltage
 selector spans two registers
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20261030-paul-lm51772-v3-2-0de62c22f342@bootlin.com>
References: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
 <20261030-paul-lm51772-v3-2-0de62c22f342@bootlin.com>
Date: Fri, 30 Oct 2026 16:21:02 +0000
Message-Id: <179337726254.87968.6479604498687216257.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=666; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LUAm5yfoXESF58hzishHQE9DKGWsa+8vYs6Ts99+ykU=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKeHH7/Mmuh+Y1A1W0vW1aHLzW6bcj6/5d+i1OH9+pC+
 9mWPGsvd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiEncYGa4fTb9xYaNdimH7
 Re3AroYPTv+yJVPfCXxbt0P/2Uufx7cY/jscvrJs0ucVX9XnawSmHdpXd2XB0lXzfuQcvcDxVvF
 q8UFeAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Some devices uses 8-bit registers to store the voltage selector across
> two registers: one for the least significant bits and one for the most
> significant bits.

> +static int get_voltage_sel_reg(struct regulator_dev *rdev, unsigned int *sel)
> +{
> +	unsigned int val;
> +	__le16 buf;
> +	int ret;
> +
> +	if (rdev->desc->vsel_reg_oversize) {
> +		if (regmap_get_val_bytes(rdev->regmap) != 1)
> +			return -EINVAL;

Can't we validate this while registering the regulator rather than on
every read?

>  EXPORT_SYMBOL_GPL(regulator_get_voltage_sel_regmap);
>  
> +
>  /**

Random whitespace change.

-- 
Mark Brown <broonie@kernel.org>
