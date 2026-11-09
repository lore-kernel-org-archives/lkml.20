Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258038;
	b=FP3Bxha0BzzX71aQmvTWP2V7vCFLSgOe8O1/yey0uAw23Q1uCqCl2zlHouY+FRMmAltI
	 fTok1UIzoB+XcyHlh8R1TAPYPUndfXaZVwk7r2tzgLmayqg5HohUAld6lh7x5CW3d/Im9
	 lBRvfmRbBAbEktKrUM3tRMUwGzA3c4ZU0DigWKPlogp3GvWo5s/Ij+YLIiCEuawUAC8Po
	 rAE1CF6Qcr35yzQIN8iiVgCRM6HJyxK2YRAVuga+vXW+rZ0zvilrGGpkcD1dZMekkQvQy
	 oyDJva63mFVyDI6PTnWZ1GaXmOHGt8+DAIXhQnQkFt2a9OW9Jwh98I/HGerJvbaoVLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258038;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PUYXlgXOcVHlfHOjoXYqr0W2HQuorszYX6zWp63OOsY=;
	b=m3WuXKKrhn57dhmaqSaRoG47TWPk7xEHNFjPpX9O0erV+dA0NW0k9Q+yxoDuziFLDsjV
	 +RCEJYGGoMaxpA7Cdc5JhmxkpVf9HGqDUKK6FTu8MUBAL5+0NxSAahJ+8CXdnogvbCnWw
	 sAyLt2SwNBAM4ITaGH2Y3fMkzDbq8O+SBN6WajyxHJZa8y+Yn6WeSqNn+EIDUdukuBwmt
	 IWJN0xgH2wYY02HqwhPcK2l2xnjCwEMk6AeLFTaNni/XmTaCN4MraR5PzBwy9acxdV4G2
	 1ywHJRuEjETVIrX4PSjnI9w8c59BTr+vRwufEj5te7pN8nOlEeUqNPsRo0HIX71mscw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="DNEPzL0/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189FB606A325;
	Mon,  9 Nov 2026 21:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DNEPzL0/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E280D1F0089F;
	Mon,  9 Nov 2026 21:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258037;
	bh=PUYXlgXOcVHlfHOjoXYqr0W2HQuorszYX6zWp63OOsY=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=DNEPzL0/endA1uY3nTdlc/VOe25Cchx/Eo+x2Fdakt62o4aYzwszu1V8DSP5ipyi7
	 Bp68gEBsLEPOcDSJ8W5TCuUgfwCnAmPhzNPR9e8kLGmbVJ4uCZMc+YXJycmhcjiu4d
	 rV39MP4QnnqFf0aKKvKaqwgcAw2UgWVKMXAvkFOdEcfvlujvgzFGtglmjmdg4aWUYc
	 yNKrPgwguvLzgKCmCpakc21C4NDwY9aEG8xX+ld08AQavrDRyassiH1NLpL4NXFhuG
	 bR7TFMoPE3I2Tq2Epp8vAvE3dtvE2yQa43DfhJE/gnNCqd5+4AHtzS8mMCYK43y5ME
	 w1NoqhwzWjanw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id E37FC30217EB;
	Mon, 09 Nov 2026 20:59:39 +0000 (GMT)
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
Subject: Re: [PATCH v4 06/22] ASoC: ops: Introduce 'soc_set_enum_kctl'
From: Mark Brown <broonie@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev, 
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
In-Reply-To: <20261103-macaudio-v4-6-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-6-637484efe46d@gmail.com>
Date: Mon, 09 Nov 2026 20:59:38 +0000
Message-Id: <179425797819.3711751.131370181090870189.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=764; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LC7c8xgtOqcQVsOq7+PY63O6vUwrZU5EM9lhyhjytO0=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+mVgzbI5k6vi5/8Qiw3+fvfdceH8s0DKlsU26kqP1R
 9TfurVcHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE9gQLk4BmMiShwz/E5X4PYODLnEccSu1
 erflBkfh63mxTh/lHXVzuj4tV014xcjw3vh6++Wl962fvXMN6u7ZtG5FTr6CzISeu+2uixd+nbe
 JDQA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The new function is to be used to set enumerated controls to desired
> values. It is something a machine driver may call in fixup_controls.

The subject has soc_set_enum_kctl() but the code has
snd_soc_set_enum_kctl().

> +/**
> + * snd_soc_set_enum_kctl - Set enumerated control matching a name
> + *
> + * @card: where to look for the controls
> + * @name: name
> + * @value: string value to set the controls to
> + *
> + * Return 0 on success, else error.
> + */


> +	for (i = 0; i < info->count; i++)
> +		evalue->value.enumerated.item[i] = sel;
> +
> +	return kctl->put(kctl, evalue);
> +}

put() returns 1 on change which is not what the kerneldoc says, the code
is the better choice here.

-- 
Mark Brown <broonie@kernel.org>
