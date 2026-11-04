Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790001;
	b=wOs1YPghY+2NOoR9iUIiPJhVY1ZesJyPGvWkOprmz/t15YSG68TOYZOceYY1GDLsIg+Y
	 koPshpshIHXSADNWMb5UKADi+7kG+dNW6eDkM/ja9iqk0lN8aPy1Suq20X97puXepyBID
	 /RFefprSy0Zsx+PoVUvcoOXNIgpKRKNnKbbkTkEB9JX4dU+nUcndkIjfiPCehh5qlcr+P
	 5UL25QENg0IDrn2gGgGqPgmIlNrVS/y04dsSbVYLW5mMaqvJF1Skee36DO7W3edJRbl6I
	 7c3gO/U140vjm+lIQY+szhKHZh8qwXZQIhMT4DC236sUv/jaZkF812/UP6Z12vv6nyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
	b=BypP2XMRnB5nIMoowv+bMUZSzYTVV2TGdvYNjpGYfkELhC2axVjKmGBZf5N20xPRO2Ud
	 Al1AIi4/WTvA7ss6xz0XMTFhiANhMAA7xwxZmzXXqp17wVF/9ecQI0yQUa6YDV2zSeNkm
	 vgu3lep/r+37ahiJCzkPkFsr0BQgaMMpadxSEu7Tbc4M/QVqex4iqUFupPXxuxlloDu9q
	 kQTnelDJj8nvK5fdQZmbtTgn3xN+yYJuakuBoFBu6pH/vT3DpaziAJpxBcrh1jZ7Rzi5b
	 1MYMdR+8o16WnqSP3tJDiKDkT/jePBMzFn5mqKZrvVGLUlw8WJwZdroOcRK4FsKRnvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biMU3aw7;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E6A5606A32D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E6A5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=biMU3aw7
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e8f2c3ad6bso3128145ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790000; x=1794394800; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=biMU3aw77dPtR4+1MwwCrR1Z+AWwD7O9CXK/nOX8AdGa4P0fWDX4ZGkE6kLFX8JKL+
         FPbQNpOurkn3V67WJPHLnjR0skk4vVEUX0kzUMKovXWMLlXxMsUK6pxfXIvPA3nFOyh0
         n/GZ4kpncrWUe137AQauQMwzrqFkXiyDjUFyu778B4CiIiKs6tjeOnCR/Dh/F8xdBLep
         3bN1myXsbWXRldGmXttH1LjDOdAYFwNl4eqrK8Xt9SR5iG8tGluH3877uBSf+/cCceDr
         l4mL4SVDnzyjoJ2kd2vUEmAtD5JV6dtwZU3ruK7kz2IJSu1Q/yZfalzKGVEeyDxQTs4w
         hI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790000; x=1794394800;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=0fyl+1+S3fRLmHK+8g+DSitIKen0CjyW2GhrVBAQxR7Q1ZcEbCjkxqGr7xMr6Dxqgo
         bqhCB5vggnnePPlGXUHszpzVzO9IOB+nVv5lgYeNaZxkzeWd81BGJan2kQ6WHrTZK2nH
         xFCVobqjbbmQ88WKQ//G0bHqtEhuiRndAOGyTJnNIR2tT/yquDJU4/YldTI8NXtlO76F
         xYR2nBTbsGiD/7rKTF/0wpOe4whEJvzrDSAMfW6opD4W/0q1w9TXsTcA1+JqNzk0I7gA
         n5huYQz5weuugG3Dy2dmug7Mcq4zojqfH8Hlf8roG00ZIElc5fLqkVb+InBNq7Ki096D
         zDCg==
X-Forwarded-Encrypted: i=1; AKwUvBwJ1gHcLQn7ygVg/Gt8iYB0OtlezqprmRuNY3IwxztSCTbC3FoJ4DSU87tDTb31WkaSy6je4BJfHSA9XYc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iQmxYU7PaWSEuPyQe4M+UxSA2bbLolnG8uf/VgO+YLUdw0Ao4
	SkB4aUe7QmCoCEokzsdEtwh9y6awchq3yPCHgWiDhrB93NTPl+XnHk7m
X-Gm-Gg: AYBFou2Fhy58GEfygd4K1+HZe/vR0i8p/Hf7uUAMiBofuCWADCYGn7+z9oogTySmxna
	YQRGje+dwz9ZM+0lPv66GzNYTNuH0fTlvs7qqYGkyTpbWvyIZ4Mzvi00gOx9Nuu8R5QHIUVhBbc
	cAZbxQtHvuHCz6wEhUjE8+jFHaPgXW5XsY/U40IyfE6AeY8XTz5RdJ+y9OeZ6BbE6vdv/oVvWGi
	Sm778r1J1zUWnoK4KGy/C4CeamYMg7LgdewiKFudsGKkn4L5XTS7R/IXCIkzO2oqA3polgyMaRL
	+502OlXencoilS+6YiUi75nOrWQTgjZNA8lTGa2RzDx9MSazcYkwEsSrHTDyM+FxPDsY2KOgfSm
	n+QwPmnAaZLREwx5Niqc+THAnidZEyk5pMNRv99wXmH++J0xSl0zHXzQSspopVlcWNyNLipzhP5
	cYjacaOzu4+SetyDnfuWdibfTGYQAmBpwqwkGInO2IElrS8lQZ1lMJPJOP6c+zDPKmNUiTs/39y
	4taklScJBhXVwWlNqth4Qg+yON3CTjSMtQDMlu9YNkXpodmYfGgaWi8xLIQ/Z7dEezMxLjqr6E2
	dLj0teROWERyh3TmXqXqqvhauGmE2HrjUBZpWMuEP32MOQ9j7HUHOzVLdp1eHo0rrkt7X9/KlIM
	wQreT3h2D/7R8NnUM67TZrzUcawGXsoKfmdT/+BPPKS1qsEMy4P2G9EaoSxWGA9m5iC9H28pTUR
	Z1kDuRW29jc2nCuOIkcQqp/QoycA==
X-Received: by 2002:a17:903:1844:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2eb364de4d8mr153487635ad.37.1793790000537;
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm5843875ad.45.2026.11.04.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
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
Subject:
 Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:59:50 +1000
Message-ID: <nYufjgFVShG0c_ndRsefxw@gmail.com>
In-Reply-To: <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
References:
 <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
 <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
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

On Wednesday, 4 November 2026 8:48:25=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 05:39:49PM +1000, James Calligeros wrote:
> > Some consumers may wish to prepend the codec's name with a known value
> > to identify a specific codec among many and set #sound-dai-cells. Allow
> > this by allowing referenced properties from dai-common.yaml.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++--=
=2D-
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml index
> > 94062c1d9d45..66cae8b7db5d 100644
> > --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
> >=20
> >  maintainers:
> >    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> >=20
> >  description: |
> > =20
> >    The CS42L84 is a headphone jack codec made by Cirrus Logic and embed=
ded
> >    in personal computers sold by Apple. It was first seen in 2021 Macbo=
ok
> >=20
> > @@ -29,14 +32,11 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >=20
> > -  '#sound-dai-cells':
> > -    const: 0
>=20
> This should not be removed. Why cells of 1 would be correct? If so,
> explain in commit msg.

This was unintentional, already fixed for v5.

>=20
> Best regards,
> Krzysztof

James


