Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793045680;
	b=F8/0xwS2lNffcNeXkKxjIPF7UleuP1oQHq9mPS+EPxiy9do7qhEpMSSItidxQAbXCIVE
	 uhE80jOOSQN1dpJgNgfVJLwLKU2UrR7AIdTjqpAGg9XdV91GX3TU3Cd9GO8+lHitAUgpi
	 j5XsHbZHc2h3Viiv2NZTC3t4fJvLdyJpoi6Vbid/77lIGwxOY/Sgf5Wzgo7VnPuwLt0Ee
	 vR9VBYFZdFVYMZ4R0BMMGRi3FlXTHCto3vBEyEPSCtBCCLiRaIJD/OQ3KM94n4JS8F/j3
	 0XqKon5L2y+gDqlDVzzRQsfnPVPZY1u/9Fap5mZ8kO+G0oS/2lIkwQxu0lbWZrKSwYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793045680;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=dkxbMgYYVDQFyWLFQjyHUXa5MivAUWV1PA9CUJkyGVo=;
	b=m4lvjVRLs0ig+KAN7SEJ0RIbO6tN0vk8ZaKSPTsi8IqSaia0H7DsRc5cIYwtzkm3QRLI
	 Pg6T4ICjAlkklykUHu8arz96F97Y+jZkwJ8UR7obiyLBCbZeXwzs3ttcA9q+EM2pk9Sev
	 Q/2GAo47/Esja+nG+ydLQtmvI6I6NI/EYZ8ryW5yHQrGsmRF2u0IjmfWIQEMHAPcnRiFq
	 BG9LkGvj6dvzq8N3q080j6aQHZheE9eO1u2Kn2t7uFhRwudRydYb8D21zsrz7GTmHeHS9
	 lWSlqn/oy4cG0O89fGfnuGYsWHpiJm/51974tCyqAckbiTTbtuL/++r6ihJQBUwziXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDUMKy9C;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91239606A31A;
	Mon, 26 Oct 2026 20:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oDUMKy9C
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360641F01825;
	Mon, 26 Oct 2026 20:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793045680;
	bh=dkxbMgYYVDQFyWLFQjyHUXa5MivAUWV1PA9CUJkyGVo=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=oDUMKy9CpO1fkv33cw2JEU4w2OLVPUBg7I4Ol3MC+U6gczqW6L+Nlzm109sWRYjwO
	 Tl5UmacOOumYrbhYosKK1peURjnO7qF8a8rHxafVNBXzSsEIZIORNm6qX6DYIyIn9w
	 j2uQXbrAfbuEJvMRBYN3n1HrW4hRGpmLYYIZ89TudDhJBYYHmYLm06oNZ/bD32nacH
	 JkNjgi3uRez8Y6zabLP44oQD1HMe7rwGjtaNOmeBQfjvRsrnUrEP9fH/cSe7YUIVcm
	 pr8FXrabXjeGeonx4k4ncxWU7XWprSrrl3PX53nf5cG4tzQuq8+d3dOv5+V7wc9A9k
	 pLjOX4QsoGIuA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 121531EDD13E;
	Mon, 26 Oct 2026 20:14:27 +0000 (GMT)
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
Subject: Re: [PATCH 1/2] ASoC: es8328: describe the power-on register
 values in the regmap
From: Mark Brown <broonie@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261024-es8328-vol-init-v1-1-efbd24de9639@163.com>
References: <20261024-es8328-vol-init-v1-0-efbd24de9639@163.com>
 <20261024-es8328-vol-init-v1-1-efbd24de9639@163.com>
Date: Mon, 26 Oct 2026 20:14:26 +0000
Message-Id: <179304566603.199157.8751476898522931250.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1457; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vfV8LCa4gCqdrOiKxQ0qHH7rP8yctM7kKNlNG7AC3X0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLub1l0r3DKlemalfOfmBd/bcleoSintmFKxa2knPILN
 bZ6hx7zd5SyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAi+54zMnyt2RAxvSwsqXT6
 uWNfpv8XO39zgu+T7PW1E9W6f4uLcs5m+F/xb9Wf01vN+P+4rnuhfOfUnbqmgwoSM4OMIyujV7w
 P0uQFAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The driver uses REGCACHE_MAPLE but does not provide reg_defaults, so the
> cache starts out empty: a register that has not been written yet is read
> back from the hardware and cached at that point. The two then drift
> apart whenever something else, such as the bootloader or a previous
> kernel, has left the codec in a non-default state, and the control
> values reported to userspace no longer describe the chip.

> Fill in the reset values from the ES8328 datasheet (Revision 1.0, the
> per-register sections 6.1.1 to 6.3.30) so the cache matches what the
> codec comes up with on power-up.

The driver should also add a reset of the hardware during I2C probe so
that the device is in a known state always, it looks like we have
ES8328_CONTROL1_SCP_RESET available for that, if not explicitly writing
out the defaults is probably the least bad option.

> +	{ ES8328_CONTROL1,	0x06 },
> +	{ ES8328_CONTROL2,	0x1c },

https://m5stack-doc.oss-cn-shenzhen.aliyuncs.com/1141/ES8388.pdf says
says this is 0x5c.

> +	{ ES8328_DACCONTROL3,	0x32 },

0x22.

> +	{ ES8328_DACCONTROL21,	0x38 },

0x0.  I'd check the other registers too.

>  const struct regmap_config es8328_regmap_config = {
>  	.reg_bits	= 8,
>  	.val_bits	= 8,
>  	.max_register	= ES8328_REG_MAX,
>  	.cache_type	= REGCACHE_MAPLE,
> +	.reg_defaults		= es8328_reg_defaults,

Please keep the indentation consistent.

-- 
Mark Brown <broonie@kernel.org>
