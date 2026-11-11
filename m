Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418968;
	b=x5Q7Us+XA4bPYU/T9RWkDHOtg0TWFO9qTx/jYMpEB8gQwaMURXk8TfcbiZsbO5NQia1x
	 gK34vXrO58dWySBfP0pVIB0P5BKnO5epm07r1NzH5YlwOVfO1Y9UGx6Hva9z7wYtP4R4M
	 z/yXgknhH2vIpUVgDV+epUUM1PrEK1SPqmOb/HCBBXqhAsIgjABD4pxXIVr7oILJPd68/
	 A6zo8LYCE77GAKT2ozACg673DS7u97gI28y09/5errz1zmxCDOP+VDu/nnxGIMwhUg19K
	 6ugU8K1laKywJn1iIlgz+3UFnhqIE5MZeeRrgTYmAZFeUJsX0D8JziaYit1Xlz7Qg/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418968;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=FAwXsGMxHewPWPm6WxGQCA3dKCUew19FpLp3l0TW3t0=;
	b=iprvQ/PaqkIIY4umw0g9BMd/+Yn7H6Xx1V4ajlp3eS2Qjr16P5gS7jEaIZ0ra3YMDkOD
	 R5inAqtgxCT0ZyNBv+FMPHa3IE6HSAurwFjsJU4AwTKsMB0b9rUt8hFA82dmqk7VYwxBg
	 O//CWAe8SmyVg/LZeg4Lz4v86QWPZIrxi8HdtTLzD0Yo8fjStv1mZZ4Lr9zTIu+PbQwKp
	 Wc3+rNdqJ4bZs4N4mbEV9SlXJjOsD/3Z2CHyTtNhznOXLWz8h7RcmbMwXhpnERSkEDwoV
	 +cDvAExNZV1LmeweOYAcu4+RDJx73syAOstLj0WcVrPKBLbX1eU1VILo6rZ1i70aAgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="O97vrQG/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F65606A327;
	Wed, 11 Nov 2026 17:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O97vrQG/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E6491F00A08;
	Wed, 11 Nov 2026 17:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794418968;
	bh=FAwXsGMxHewPWPm6WxGQCA3dKCUew19FpLp3l0TW3t0=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=O97vrQG/2rvL6wugfknCIb/X50x2KeSwNnnmRtxyvW4y5zZwE2/p0wcWGzkAdkTgj
	 nddDPPX6II5KbVL0oaYNVCFQC0F6KNc8V+mgdJIT0Y6QoBYTiqn9Rfa3xZb6U5yD6P
	 PPcKy9rxAnrGCy8/mc5oXs24aXfj0x4iwJ4hw1bEPLWyfm5LL8oWq4z0Jz5mpBFgY+
	 6bghjaKQ8thHSBS1oBY4duu7U2Ug6V4JDLBYP1qRLEDMVuiWRrV5Q2Nd6fYEkIEfaF
	 fJx1pMPs078aXhm/XgMz/QN1jzoKQ3OfN8hzd8pNEeOuFnpL0BQJWqSqVDwHS5yIY4
	 3WtALMA/vKyzw==
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
Subject: Re: [PATCH v10 2/2] regulator: willsemi,wl2868c: add the WL2868C
 camera PMIC driver
From: Mark Brown <broonie@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20261111111132.1296892-3-xiaqinghuan@mail.ustc.edu.cn>
References: <20261111111132.1296892-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261111111132.1296892-3-xiaqinghuan@mail.ustc.edu.cn>
Date: Wed, 11 Nov 2026 17:42:43 +0000
Message-Id: <179441896388.393238.285161772971892952.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1227; i=broonie@kernel.org;
 h=from:subject:message-id; bh=7YllnNRI6qnMQEWy4tOJG2q5XI4ahkNJN+Tm3AlIwf8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+rBTRm7//Y+TNsENzIr7+97UqtO17xK2w5+Cii9neL
 o+ml1trd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiFc8Y/umUirqwm317Vbyq
 aNn0fzzCxx1qrm6wmW78reHknb5JlxMY/ulVacebG79sTHnZ7JH/LOo589IKB5lnPy+4q+b8Uvd
 0YgEA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The WL2868C is an I2C camera power management IC with seven LDOs.
> LDO1 and LDO2 are fed from VIN12 and cover 0.496 V to 1.512 V with a
> 7-bit voltage selector; LDO3 and LDO4 share VIN34, and LDO5 to LDO7
> have one input each, covering 1.504 V to 3.544 V with an 8-bit
> selector. All outputs step by 8 mV.

> +	/*
> +	 * Seed the tracked set with the outputs the firmware left enabled, so
> +	 * that the first enable() or disable() of any output preserves them.
> +	 * SYS_EN gates the whole chip: while it is clear no output is up, the
> +	 * per-LDO bits are only presets and is_enabled() reports every output
> +	 * as off. Seeding them in that state would make the first enable() of
> +	 * any single output switch all the presets on.
> +	 */
> +	ret = regmap_read(config.regmap, WL2868C_LDO_ENABLE, &value);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to read the enable register\n");
> +
> +	if (value & WL2868C_SYS_ENABLE)
> +		chip->enabled = value & WL2868C_LDO_ENABLE_MASK;

Should the driver not also override the LDOx_SEQ registers to make sure
we have software control of them, or hide the enable/disable ops if
they're non-zero?

-- 
Mark Brown <broonie@kernel.org>
