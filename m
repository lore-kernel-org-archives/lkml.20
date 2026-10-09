Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5AF45DF41
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 07:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791530525; cv=none; b=paO/Lqm+Em685f1Aug40R0OKoCFSJdCP1dP69M7mB9zxHZ3Zhv7C7l+x1zwSEGvvuvlPlB+GS117q/NSLeOLh4m+K1Y6GPNprmflv8iAMsLWxYT4iWYLZIOyxE+I0UWWOyMuOPdpVILqNddOJkKS+hdqOK3dtWi8EbtbwGTJkrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791530525; c=relaxed/simple;
	bh=ay7Lrhmehs7j0JdHgXH5IIpsVNVS4CqUBpPRiqIzs/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pwMFoE4s/wfWjV72k2NaZsAJwzpVa2TH8i62H8Hv5NuNsIigahAzaNw+ImvM3EMKZvJMrIdoizzqua+VcZ6E6QZpXSRkASkt9Vst1jQEsu/22F/pD62qwLnSkMF+rlGLnhcLmJ8bpGKJbMl1UaQrPZLxTAdIi9koMQA4VcvAAZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ7WAWXy; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ7WAWXy"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1cb472b76so1767755a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530524; x=1792135324; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=gJ7WAWXy+WcB/LFetY1pL/TwuUe8XtFQ5aPHkvI/AMwy8gYtq3dQkeyrI1SygF3D0+
         Y9lW9MHZhEUtNX9GDBXP8ICdDyh/Zmq4QAPonYcXw2j+skSp3g3doVRUOulcdoXX4hSG
         ilNrB1mEtlY2s7duH5OxYslO7uPMjznHvejIByYL3i9Mln0BE67RqknMWVqbMPF2NcZt
         l4Fvbght//qL70PH4myZ246aEW6SiA5hvZZvb7oe6iPlsTn9wrm390WuVghTxsGWts2G
         M7FmI9eKLCkee9tcKlVUoAXq6t9wV3piw6zIP/Vo7dwPjAhUZR1FCAJUEJL7LDcrhj0o
         j+Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530524; x=1792135324;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=w22hn1j5LSqQ0Gd732eZtHGnp2UamIPD95veEuZBw74sKf/HRSbxoaCT9F8njQThgC
         CEUhpEgBcOdsls6LX6ATCj57WMI99P97263p/ZEvaXiTQDR9LBOew39T1sf83BEpFYjh
         YnIHzMV7ZpAj06NbtgGRv09cF5X9lUSW5tdlVh840cxTOHNmdXPER71S6+lGHAv7UICT
         219LKd1ZyiYWVZO1K4dm1liynboI4BT8j4RU6bwcBS9lqrGznc92rjk4IRxgBMT8DXqL
         p9oae+d27hz3wM03I4mk/qqAs2cAhq3AezllsI/OXEOD2ilbvpuJRPKR+k5tajianTDh
         zk3Q==
X-Forwarded-Encrypted: i=1; AKwUvBy4Y1zfyjyHQ5gTmIGcjJGYI9muWDYAtxeQp1c271+oS1xycqyqI8qaIAeq9ZbGYtK6nqyYNa3/F+1sgBw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLbS6E+QsEcAdO6p6qAIbRk9poDHmLGJFDQPxX2cbVjVFS5B279
	IZSopblKHGNDu9kSk/j6VjvUCVpaD6Q/tZoa1g0dSjD51t585ZZd/zuw
X-Gm-Gg: AYBFou28u6h7pqVl/mVaM0Lvvnr0GNzW9c6CKF93oS5koLlRRBbWxT+akdu5k689OUa
	gQGiUmuVLM8plWtC3E5Uf1AMa32nHFusyGQylpjoSDpJAKIu9IXTxUa9YrpxbWfHaiusNfR2cXc
	vGcturIN6xHCwfbq5bz3q1sVUQOjHzUXPUc2geXTfB8te8JOphD+iyF/rb8tVdZ/rFVCaTYOt8F
	Xqy96EMgQAoMN27v4xjqyrKj3v/kgpKXIVli5CyJHESRFlFPeASf5s5KF9KjMlhAYT1+zOBJstp
	sSoJOqjOiEJ++z6bZctp0xUHv+mdqjNn1ML0fI+enrrdHL9zPsjeRlKUnkX+BoCv1h3AtzlcFst
	6/PsQ3DRwchIy2gZ2SbZV6HaUYm1SLrLzmyaa6R8F/UVuwbvgWR2sGCPTt6GCESmkKHEBnfSaB3
	I6D7XhGwzfa+ZJ4kB+ALLj7KHFkLFvFres9y/x8DZPDhcHUjBHkkp5m1NWk1EolAcFljXs6jbmY
	Lq8fIvxGxkXLGDUWK90clTgE8YXAWSeq6G7u/DtlV9rPUdaLfoGtBa0NlDsMtmlqyNZq75QPMpX
	6HNKBZ6kQZmocPuNQjhFrjDR5RpabWc2pmw6xXNNCb3xnHmbiDU=
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr1074419a91.41.1791530523677;
        Fri, 09 Oct 2026 00:22:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab397920b4sm1115948a91.4.2026.10.09.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:22:02 -0700 (PDT)
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
 Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Fri, 09 Oct 2026 17:21:52 +1000
Message-ID: <rT1KWd0SSiuQLd7MLQWREA@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References:
 <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +examples:
> > +  - |
> > +    sound {
> > +      compatible =3D "apple,j416-macaudio", "apple,j316-macaudio";
> > +      model =3D "MacBook Pro J416";
> > +
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      dai-link@0 {
> > +        reg =3D <0>;
> > +        link-name =3D "Speakers";
> > +
> > +        dai-tdm-idle-mode-0 =3D "zero";
> > +        dai-tdm-idle-mode-3 =3D "zero";
> > +        dai-tdm-slot-tx-idle-mask-0 =3D <0xf0f0f0>;
> > +        dai-tdm-slot-tx-idle-mask-3 =3D <0x0f0f0f>;
> > +
> > +        codec {
> > +          sound-dai =3D <&speaker_left_woof1>,
> > +                      <&speaker_left_tweet>,
> > +                      <&speaker_left_woof2>,
> > +                      <&speaker_right_woof1>,
> > +                      <&speaker_right_tweet>,
> > +                      <&speaker_right_woof2>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 0>, <&mca 1>;
> > +        };
> > +      };
> > +
> > +      dai-link@1 {
> > +        reg =3D <1>;
> > +        link-name =3D "Headphone Jack";
> > +
> > +        codec {
> > +          sound-dai =3D <&jack_codec>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 2>;
>=20
> Example looks incomplete, you miss TDM slot properties.

The machine driver generates the TDM slot assignments for the DAIs
and sets them at runtime.




