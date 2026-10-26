Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043108;
	b=CFTbkxB9dxcc7TFjT80sLIeFUq7qYgz3rSaBMY0wMF/GRnl0q8yRiGpD9aHjzCbq0kiZ
	 NOvoteuIQ3O2htZLkMw933HaOElOle41itAbN74o+kHehksZgSB6QuG5c+rKq91LSrOTg
	 gmV+xn4yoTXRBwHxyZcCKL8kzI8UZWlupF7VFB9Tzog3VJQvGfXdyUNmxBtHw7uapJHSa
	 RtDiO/UKOaQUDj81GImGbAD8zmkup3TEDDnGs2DWbDTvxKONiqNBKpEX3Esn72w9+SqEg
	 DNhPbDLXslu7lpiMUfQLLoaybexYnWH70Vj5d9Wtby6Ws0or9jXcYcKb9TPvp+HFP6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043108;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ZXcrzIG8TL9kkQD/k78VAj1cTLs4ftEYzatFxjGaClI=;
	b=j8tggYEhtwpgOq6NfKFSfZxuixPd8S8jt7S/kPiU/ESfi129D2T3WQQUET8jF0Sfv/jt
	 nkJiIJxNH+7ZUE7Zz45Wa+mNf6cxP6+IypSYlao6mx2sXW0XC4SVfIaA+CwptvL3jzJ0Y
	 2r5a0lSETzD158Zn1pjxww3CqMQG0DXZ87EXDBrMvYZwZHTmD/KYV2+dBlzEHYymIiJ4K
	 VDvd5cnc829P1FfyX7c+DmtJR5+mZL+pnmcf+6V8EKZeqd+WJxd4uXlqhzrTH38WCDJU0
	 h4+rCFVGXAOU+0WdkTbaqOEMfVI3S02Ilx4dFQMtWF6yAR154s8zljSDfnvmVIOiPTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIze5wzO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15DB5606A31A;
	Mon, 26 Oct 2026 19:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TIze5wzO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 760031F01825;
	Mon, 26 Oct 2026 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793043107;
	bh=ZXcrzIG8TL9kkQD/k78VAj1cTLs4ftEYzatFxjGaClI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=TIze5wzORoFKRDU0p19unZtZHO0jVT1+5zxI8yPARtGpN8o2owf8la5wQAu2PcNrT
	 8g5GVue7BX+T94uYDAt6qyxCtzhDmcsHLPlAimujkRoblN8xjoBaoHuggD0DKPscjF
	 dTTXBcMwoVxSDPSzylft/JEqSlNCTBVXZ+PAiF1FSuoxj+FXBV9eL2Y2bEaL17WYfN
	 tJ3wg6Kl256ct4RWfZYQ6oXj9PZknygOoeOVrp3d7jWWi4c9tga94o8paQeG3x99c6
	 7OatO1NZOdR2I5qipAXPWntFQD4XN/xYe+PpLdYWWcuugPfNBCxV8mnC2+VSAmFF1O
	 2c0METo2hKEPQ==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id D1E301EC32CB;
	Mon, 26 Oct 2026 19:31:34 +0000 (GMT)
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
Subject: Re: [PATCH 3/3] ASoC: tas2783-sdw: refuse playback when the init
 writes failed
From: Mark Brown <broonie@kernel.org>
To: Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: broonie@kernel.org, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Sen Wang <sen@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Niranjan H Y <niranjan.hy@ti.com>, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261018200009.1493438-4-matthew.schwartz@linux.dev>
References: <20261018200009.1493438-1-matthew.schwartz@linux.dev>
 <20261018200009.1493438-4-matthew.schwartz@linux.dev>
Date: Mon, 26 Oct 2026 19:31:33 +0000
Message-Id: <179304309394.199157.13400064467514985612.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=465; i=broonie@kernel.org;
 h=from:subject:message-id; bh=5wu/TdfnLVUW+u/ZqTa/GSqYb3XPnZ+4Xg5NzZ7fEWI=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLur5pW41jR62swc+Ztvc0PA100fWwzuK7W7NhsX7FBd
 Ke8mMz7jlIWBjEuBlkxRZa4LO6X9SWv1/AdXNgGM4eVCWQIAxenAEwkJoThn66+ypz7LebXd9x8
 8f9iTavwUvY7L/v/Gf/xr/Ay1pE/LMLwPyomtvPA1LzlU9/dSNXSEOr5fjmsLpJhY/rX27Fp5q8
 MuQE=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> @@ -1427,6 +1432,12 @@ static int tas_port_prep(struct sdw_slave *slave, struct sdw_prepare_ch *prep_ch
>  	addr = SDW_DPN_PREPARECTRL(prep_ch->num);
>  	switch (pre_ops) {
>  	case SDW_OPS_PORT_PRE_PREP:
> +		if (!tas_dev->hw_init) {
> +			dev_err(dev, "error port %d prepare without init writes\n",
> +				prep_ch->num);
> +			return -EINVAL;
> +		}

Dos the SoundWire core pay attention to this return value?

-- 
Mark Brown <broonie@kernel.org>
