Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377270;
	b=Ah8hpabsRdgm0VvIihCx78TtpHWnmYOe499ggbuhjQdiT+mNc81y7JaLFhDhDPCLs8wL
	 t5BEcXEm816caSJw7ovhcmwBXhhET4wK/5TmqW5UDMaiLpEO9r19uElhHsgkl57uZ8QfI
	 5/+Fvuk9Ayb17YrVC4YIaDucBEcJf/U72inwfmhR4QPaQpHgRGzYORJmrUqeWZvwkv9hI
	 BolHoWGxWosPnntCCc62sn0An4md+giGLF0bMn4LQETgm7PlKDBsiZH3NZ1OPdSWSikFY
	 o/7KBVOw7lR8RrKeHbttAx6w8hxM/oGN8CIrVfPWSG+KNPkx6+d+KX+Y9p/i9rom7vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377270;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=udOIgOnRpmfUdv0bh3ybI3j3Y+iWGTB4HI/6ns4924E=;
	b=NP9lJ7rGnTf4uACjoB4Wct97V70K7L035h9pzG3/C2iYZX68TMvE0PJTMsWnp2MD9xtS
	 B0wXMBirlO3IrUB73zWbskCLNByh6QO4cxByv9Zkr6j851lMBhJ9vJ/20Icke8rh/RZdf
	 JyrPPMmlTALlJlhs022GViIflQEgEGxV3rvcLhRDq/lF3Y4lwMVBgSB9wp3EKRBxPma0l
	 FoHHcTZ7Xo3b2uCS2f3dYeoOfKoamAK/KQ2yPyoCajdgNHOXjQXO8/j566o20nZX5PlsG
	 4pJwKlCtrKZJwXq4hk+JenxTIhXBpFbkwBsOIFpJ+r1mWBWm9dY3WHmWs7skHQx2mkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k4HnNyfU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B2606A31A;
	Fri, 30 Oct 2026 16:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k4HnNyfU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1719B1F00A16;
	Fri, 30 Oct 2026 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793377270;
	bh=udOIgOnRpmfUdv0bh3ybI3j3Y+iWGTB4HI/6ns4924E=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=k4HnNyfUIOtYMFlRCWtpHSC3Gq7SbzybJuuAGB1SoseXGQB13Thg49wH0lyyKx2kp
	 rwPTy4CTsoa/X+YZCZKlV7kjOG4+/s8KtYLx2tSz7AlduZyLb3Pf7GfXTrgEWyZPr1
	 H05ejjngptgDmNw3GcKTi0TzpPMl4IhfuvD1B/bxwIihWFy8yEXyhQDtFyKNlfOfG8
	 8e84nz/zpcsNfv8tVnhQtBkPm5zlfSRU8CweagNzz8GHNSxG1ObhMwSdHMeptzEGTr
	 yZwam54QaERVkNAclE0p8NjctdXt7OOKUC3yv4Eo+SxpVx1bg3JTm05OCF1v1Z302+
	 OWzuTdwIigkSQ==
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
Subject: Re: [PATCH v3 3/3] regulator: Add TI LM51772 support
From: Mark Brown <broonie@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
In-Reply-To: <20261030-paul-lm51772-v3-3-0de62c22f342@bootlin.com>
References: <20261030-paul-lm51772-v3-0-0de62c22f342@bootlin.com>
 <20261030-paul-lm51772-v3-3-0de62c22f342@bootlin.com>
Date: Fri, 30 Oct 2026 16:21:02 +0000
Message-Id: <179337726255.87968.9906404525377602371.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1897; i=broonie@kernel.org;
 h=from:subject:message-id; bh=jMwa/kcGaL6Xfql2/0CDg5Mt5kMCBxc1ReQQYJlcb68=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKeHH5/tP5JpNsOgWtv7Dy+evQ+PjUl7uaMm+Kar9blH
 Qn5/lxyfUcpC4MYF4OsmCJLXBb3y/qS12v4Di5sg5nDygQyhIGLUwAmEpDKyLDls4TTS1X9hpuR
 nZ5z3kgtXLvs5pLqhfyvTRxb3vn4pcUx/FP+s0Ol4Yqro1HgLLlNM1UFpjqlbNm+8uque6mf1rj
 EveQDAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> Add driver for the TI LM51772 buck-boost voltage regulator.

> @@ -0,0 +1,903 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * TI LM51772 I2C regulator driver
> + *
> + * Datasheet: SNVSC22D (September 2025)
> + *
> + * Copyright (c) 2026 Bootlin
> + */

Please make the entire comment block a C++ one so things look more
intentional.

> +static int lm51772_irq_map_event(int irq, struct regulator_irq_data *rid, unsigned long *dev_mask)
> +{

> +	ret = regmap_read(regmap, LM51772_REG_CLEAR_FAULTS, &reg);
> +	if (ret)
> +		return REGULATOR_FAILED_RETRY;

This register appears to be clear on read so it should be marked as
precious, otherwise debugfs will eat notifications.

> +/*
> + * For < 24V, voltages are set in 10mV monotonous steps.
> + * For >= 24V, voltages are set in 20mV monotonous steps.
> + */
> +static const struct linear_range lm51772_voltage_ranges[] = {
> +	REGULATOR_LINEAR_RANGE(LM51772_DIV10_MIN_UV, 0, 99, 0),
> +	REGULATOR_LINEAR_RANGE(LM51772_DIV10_MIN_UV, 100, 2399, LM51772_DIV10_STEP_UV),

Looks like this ought to cover 2400 too since there's overlap between
the two ranges?  If we don't have it then the driver will get upset if
it finds the hardware with that configuration when it starts.

> +	  .active_discharge_mask = LM51772_FORCE_DISCH,
> +	  .active_discharge_on = FIELD_PREP_CONST(LM51772_FORCE_DISCH, 1),
> +	  .active_discharge_off = FIELD_PREP_CONST(LM51772_FORCE_DISCH, 0),

It looks like this is an always on load on the output rather than
something only enabled when the regulator has been disabled so we'll end
up with an extra power drain for no reason.  Possibly we should have
core support for hardware that needs such manual management, though the
datasheet suggests DICHARG_CONFIG0/1 might be more appropriate for what
the API is looking for here?

-- 
Mark Brown <broonie@kernel.org>
