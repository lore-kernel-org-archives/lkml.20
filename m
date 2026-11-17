Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=135.181.196.210
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923898;
	b=MnxkZNC0ZGWHOcoy0GjkPEow+wTbS6W57TSnlHjWKUQ+QkVJC3wgQ+1o1orX5Qdm+vmV
	 Nn+pdGDmjIpfSo+DjsciMjrqyoZ1K2ambOYgppeiEEQFQ7P9I9+2Jue91v/bzX31Z2tBg
	 +dDvS74i5nMeg58OJfPNEvp+Inei1jPWkVcnHNziEuyVuVlYTlgoZxh/2/sjACuNQkwov
	 1Pov5N6PMo5U3k1XMEL+n58QJ5S/9DGKmWn7zhoiIemwDW6SUgtWRXajEUbKohyGSl+xU
	 jlP/w58YJXUrNY+laD6iSi1jjcuC79gZNC4mKpcfpZDK157ehtCopUCxPgqclBf1+/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923898;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=XSXOraS8SoZpCNyD7GSpHo4bWhfXPw6Lwr7+GX5rOE8=;
	b=Cg9kIzpzQghGof9ZNuvgUdsQTofgxqh5QhidQ3KNoqgO9Ds5fZf6xpTe7Ex46dswAM96
	 UklnQMFkFE39RTO2EgzM9ewK40VX5TMjCApbqBpQf4AiThto6cxAS2Z2UQj+c0nxItkTg
	 0cwT1VoKrzf9i91jziU+hyShK/TT6JSeR9EnDDWc4DKzrs4TAmnxep7AsUNOH7CJurCm7
	 8smsSRkRImySfRC8Hi+yEIkgR2qZTu7bQ6AMLI79mcBoWhFg5BNHEp+NJ5Cz8rEyFrDuY
	 eTSBdRTr0y0SHp7dNA0m6vhgNlV3B5vAVKje04E5nJIuO+SBB+4pUo1NnK224roaXLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=puri.sm;
	spf=pass smtp.mailfrom=puri.sm;
	dkim=pass header.d=puri.sm header.i=@puri.sm header.a=rsa-sha256 header.s=smtp2 header.b=YJfPrqPg;
	arc=none smtp.remote-ip=135.181.196.210
Received: from ms.puri.sm (ms.puri.sm [135.181.196.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EA3606A329;
	Tue, 17 Nov 2026 13:58:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36EA3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=puri.sm
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=puri.sm
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=puri.sm header.i=@puri.sm header.a=rsa-sha256 header.s=smtp2 header.b=YJfPrqPg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=puri.sm; s=smtp2;
	t=1794923889; bh=DgEaRglGM4qMbbAONaV5XFSdtChkpG9X7CcGoRtcuzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YJfPrqPg+HLp4bZWEP8NDBVhhQfxV5AC4byvZ30u9Qn3Us+TVG6yRuMkATsOADwQU
	 oZZ6zTA9IhvbfDe4FjPc33HXezpqrvx4V7uWyir4WgDePaRgK+L7vqCtO2H5AYf7X/
	 0p5bdWAg7GbTwM0iPgfvxmbuNMjVMreqN8hpRXqhN2J9FtRVXyY9KD0pdM0OS2cFWp
	 RXej3tDD+gv2W002/89NFzAYSeshr0m/JRIQ2NvJ6mpXMlZu4BdGgIgJgmll6cYjNn
	 wog28fPxm/B5Hhgg+Q76QeXdMsWuqTgLZX28Jobv5f2I/243FQz0sVSVNnupgPTx0t
	 ec8byidQi0UsA==
Received: from pliszka.localnet (79.184.57.27.ipv4.supernova.orange.pl [79.184.57.27])
	by ms.puri.sm (Postfix) with ESMTPSA id A4D021F736;
	Tue, 17 Nov 2026 05:58:08 -0800 (PST)
From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
To: broonie@kernel.org, lgirdwood@gmail.com, Chen Yuxi <chenyuxi19@huawei.com>
Cc: ckeepax@opensource.cirrus.com, patches@opensource.cirrus.com,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 chenyuxi19@huawei.com, yeweihua4@huawei.com, pulehui@huawei.com
Subject:
 Re: [PATCH] ASoC: wm8962: Fix broken headset button caused by wrong guard
 constant
Date: Tue, 17 Nov 2026 14:57:56 +0100
Message-ID: <S1U1JRuiRsmge3e0RKavPA@puri.sm>
In-Reply-To: <20261117070516.3861828-1-chenyuxi19@huawei.com>
References: <20261117070516.3861828-1-chenyuxi19@huawei.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On wtorek, 17 listopada 2026 08:05:16 czas =C5=9Brodkowoeuropejski standard=
owy Chen=20
Yuxi wrote:
> Commit e59075211902 ("ASoC: wm8962: Don't report a microphone if
> it's shorted to ground on plug") guards the mic short report by
> testing wm8962->mic_status against WM8962_MICDET_STS.  But mic_status
> stores the reported jack status, composed of SND_JACK_MICROPHONE and
> SND_JACK_BTN_0, which never has WM8962_MICDET_STS set.  The guard is
> therefore always true, so every mic short event reports nothing.
>=20
> Pressing the button on a TRRS headset shorts the mic pin to ground,
> which used to be reported as SND_JACK_BTN_0.  After that commit the
> button press is silently dropped, breaking the headset button on all
> wm8962 boards using the mic detect path.
>=20
> Test mic_status against SND_JACK_MICROPHONE instead, restoring the
> intended behaviour: suppress the report only when no microphone was
> previously detected, i.e. a TRS plug in a TRRS socket.
>=20
> Fixes: e59075211902 ("ASoC: wm8962: Don't report a microphone if it's
> shorted to ground on plug") Cc: stable@vger.kernel.org
> Signed-off-by: Chen Yuxi <chenyuxi19@huawei.com>
> ---
>  sound/soc/codecs/wm8962.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
> index 148480e4124f..a4868685218b 100644
> --- a/sound/soc/codecs/wm8962.c
> +++ b/sound/soc/codecs/wm8962.c
> @@ -3127,7 +3127,7 @@ static void wm8962_mic_work(struct work_struct *wor=
k)
>  		/* Don't report a microphone if it's shorted right=20
after
>  		 * plugging in, as this may be a TRS plug in a TRRS=20
socket.
>  		 */
> -		if (!(wm8962->mic_status & WM8962_MICDET_STS))
> +		if (!(wm8962->mic_status & SND_JACK_MICROPHONE))
>  			status =3D 0;
>  	}

Reviewed-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>



