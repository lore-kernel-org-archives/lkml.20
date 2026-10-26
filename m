Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793041000;
	b=vPO37zNXx+EUMNqcVT+VP2HzZAbXsIrkHOTCUARpIYBEFGKsCe64EWvoS0dKJR3wfPcV
	 dkjazzd157SRVGmAN9fy38hQxZ1zT89krW+dD+X1U8fevLjWQl+xrHDZQKt/qQ+CHSfYq
	 L7hFlaXOUcYNlsdnu9qcmy6RiXC60LoIr/NFp6T/UTlTUn9Zs35Hje6rnRH1nSzK7qCFt
	 lHRQNOByJ9a65kj+k09A6mTCfciOeOP4+64GRe0XQXUhOtTT+chJCORrlauzcZno+d30k
	 XBN7qefw8IcQql66yk0kajoyOsxX/3gq70whmluU1hGgZM7lOABfiB0dohT9aPe2IQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793041000;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=uXlm7kNfIg+kJUXL+F3rvwzlyffWLbMbG+cOGQHp8/c=;
	b=Q3xrgINDkdsGdG9VMvNAm/z5JLUml2ByM9LjpmiROwTyHqpES7TcCb7NLo1MHrbUcnPb
	 MMOAR6/E4LKz7aPRDbCMu4IiFuY3ZD1nlhxVyINkPnsx5VtxMFf09IIGplSFq4By/esVH
	 CTwnTuGf9JC6MuSK4Mt6bwkH5YRRE57d/zz26I53A99WoRjwmONU19Wbv9yj4Dplp81gk
	 ZP+fqAFRUrXuZ9cGzSxRQWOtUdxcGKDTWikJ+Q4sYLL3uYuhn3O4cZ3bdYEpXcwb+IDx0
	 AOp+xkxZbXoJLbGxVHP8nDKoFoiEXBNpEf8jpeKApK9wfiT+1wzRrJ05K79eP0+Z/tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxhyXZbR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437C5606A31D;
	Mon, 26 Oct 2026 18:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fxhyXZbR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB8E1F01825;
	Mon, 26 Oct 2026 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793040999;
	bh=uXlm7kNfIg+kJUXL+F3rvwzlyffWLbMbG+cOGQHp8/c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=fxhyXZbRtOwligHWzdz+JIoNf9oHR6XIjbTY1dQ8o4OrYCmPTszjNehCI4ezH5SoJ
	 HQy0GGHmJSNdqYwGKcYg61tGfc7j1W5a+/UAxz3RMUhH6FgW8vTdZCbNYwrV+iAuaM
	 9rIbUJjaYBK23u2/7d/ru348Hf4yd326r+6TQ7qhmA3ugQpqDXYeo2L/rM0hBH/dRA
	 vdVjTi+P66KchCAPjCw8bGYL9qUSD3ADp0sOS2mk2/bqhiVOqyomLKOGxOEP0Flp0p
	 pLl3QD186JLALuKyekAao+HRKIhUyI2zP98aPY3apBssDMXQGtOMf5FOSB+4iUlhMR
	 GCU4H0H0Bs8GQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 208471E90D2C;
	Mon, 26 Oct 2026 18:56:26 +0000 (GMT)
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
Subject: Re: [RFC PATCH] ASoC: es8375: make register initialization
 fallible
From: Mark Brown <broonie@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Michael Zhang <zhangyi@everest-semi.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260830141243.31984-1-pengpeng@iscas.ac.cn>
References: <20260830141243.31984-1-pengpeng@iscas.ac.cn>
Date: Mon, 26 Oct 2026 18:56:21 +0000
Message-Id: <179304098165.199157.6116389885063650222.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1099; i=broonie@kernel.org;
 h=from:subject:message-id; bh=1i4xVJw10kp0WfYBg8yTFp4i9/wCAG8K1Fe0BlUFFNw=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLuL4pcW+0g0TZRrOSvbMxkBiOdmBPNUye8854ZXeZUf
 Pj8/cSGjlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAExk0ntGhvWxC/l/PLl0i+X+
 as3GMy/WTv1+7chTRqmP7woD3iqyb85j+M2SXOj+K5BpS9hU5+1d/gdbCmaumnpXyvSgbJrGZ27
 ZTlYA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> ES8375 initialization and bias transitions discard register access
> errors. Component probe can therefore succeed after partial
> initialization, and resume cannot distinguish an invalid reset-state
> read from a valid state.

> --- a/sound/soc/codecs/es8375.c
> +++ b/sound/soc/codecs/es8375.c
> @@ -455,12 +455,19 @@ static int es8375_set_bias_level(struct snd_soc_component *component,
>  			dev_err(component->dev, "unable to prepare mclk\n");
>  			return  ret;
>  		}
> -		regmap_write(es8375->regmap, ES8375_CSM1, 0xA6);
> +		ret = regmap_write(es8375->regmap, ES8375_CSM1, 0xA6);
> +		if (ret) {
> +			clk_disable_unprepare(es8375->mclk);
> +			return ret;
> +		}

This needs a bit more thought.  When we transition back to STANDBY
we'll disable the clock if the register write works, but we already
disabled it here.  Of course if one write failed the other one is likely
to also fail so we might not reach the clock disable so it might all be
moot, but we're adding code and building on top of an existing confusion
here.

-- 
Mark Brown <broonie@kernel.org>
