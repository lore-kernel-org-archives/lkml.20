Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794258071;
	b=HKtj8B4IFlY7iuCj3tQ17bCXmK5MXOTL9tIwpPcOj1qNA2cLl6LBgLuB6RsebpbDOyjG
	 RoyR/PsR4n8APaVeXcGFc4SuIDkC1dXhIF/9waXY3MHzrawpOMq69iHHd1YMLdLQWqmyd
	 RahrHqG4bUdxFndCLsDjdCdDo8hk7c/Wj7O7dHjlOmQl5pJULarg7Ua+JoBKvJE4Ae0RC
	 tq1sOAf59uLt/E1S/JQolTJBjJUALdFX2//CkrjSLRQ1OKADHcf0kfyJbMWHewTNkEpa8
	 fie4LD9JOoBcbed1kurcvZkR2URFGuDFsG5iXLVPSIQNSLJaqJSplnoQiNR4ECBewtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794258071;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=W40un1XNAqPtcoImBzGbxmEQEgO2uX7YR4GLBCynYYQ=;
	b=kd+Jg6OQ2zU4ONZCgxzYc/KoTFQ/QIFFGoPipy7cQ2UJUDNl+N/sVCXX+MFHOiY27CsO
	 15Un44gTXd4fMHlH2UKDO6LCmwp6u47YyXVKnFITh+g4leuLfUeNzEsm5Zo25gCagnlkC
	 C1PuHtsSz/q0cG4fZmzb6PhmmndIz/f+1eTbkSyLJ+InYiarKUfIH3VgweUPP1Z3crwy8
	 CfVCuXNB/IBmnb41OmTWYXjPKGA/C/qP2x2VhVWyTyqBusicHn+VuWEDG4MryiRjD9KKC
	 ZV6wfTPvtJ8f75MRGcbEJ9YUCAO6e5+gVaAEB2d1WNNk0ih9hGQJ23RFg8FSroPLojw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iF6GzHcR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618B4606A31C;
	Mon,  9 Nov 2026 21:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iF6GzHcR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C6991F008A1;
	Mon,  9 Nov 2026 21:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794258071;
	bh=W40un1XNAqPtcoImBzGbxmEQEgO2uX7YR4GLBCynYYQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=iF6GzHcRZmIKjnW69pOqsfO3jKAeD20Cdt392q+PS9hRNVpMtyfXiSFvnZi5+nGeO
	 XyA/Ck7Fozg+jjB7td5JXyNuj700k9Nf5A9KGOkWl1F0BUQJe4yLx7pS/4nFpaiRUk
	 x7AWekRNXn5bQCVkUh5iCDNKJmZNu7gjlX0mpe4FRQ5REGfUUaDyp+ieAACA0+Kz0v
	 qePEDEBsL7DZSqucOiLJ9ErFUjCdXfZ6PeK0XGNFr6m96sFeombWoKBtcACxeDunFu
	 Il035pDznLn2FokxjL2V6c2ePy10UMnns3fIUxZYdmcAN08iFQIZzQBqbBMPsXZP2D
	 cMa3/QG9SZXMw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id C64CD30217EA;
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
Subject: Re: [PATCH v4 05/22] ASoC: ops: Introduce 'snd_soc_ctl_activate'
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
In-Reply-To: <20261103-macaudio-v4-5-637484efe46d@gmail.com>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-5-637484efe46d@gmail.com>
Date: Mon, 09 Nov 2026 20:59:38 +0000
Message-Id: <179425797818.3711751.12937263042321950225.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=615; i=broonie@kernel.org;
 h=from:subject:message-id; bh=xvmkDp6UJdRL/ikpcXrp5a9qw8WBoVYhDOKggMTTKA8=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLI+mVhLfZutsGLFm5NREsxh81TmK534tEw69faZh2Xvb
 DPO5p2y6ShlYRDjYpAVU2SJy+J+WV/yeg3fwYVtMHNYmUCGMHBxCsBElqcyMnTt/cX6NiT78a4j
 3hLbP96dumXapB9us2+qqLMLVG/+1F7IyPC3cd+ZEyk/joiv7+c6O399yQO2tFe8+ociNE8pHee
 SnsUMAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> This function mirrors wraps the sound/core 'snd_ctl_activate_id'
> for ASoC. Machine drivers may call it to lock down kcontrols
> during fixup_controls.

> +int snd_soc_ctl_activate(struct snd_soc_card *card,
> +			 const char *name, int active)
> +{
> +	struct snd_kcontrol *kctl;
> +	int ret = -EINVAL;

> +	kctl = snd_soc_card_get_kcontrol(card, name);
> +
> +	if (kctl) {
> +		ret = snd_ctl_activate_id(card->snd_card, &kctl->id, active);
> +		if (ret < 0)

As Cezary pointed out this return is redundant, we could just exit above
if there's no kctl.

-- 
Mark Brown <broonie@kernel.org>
