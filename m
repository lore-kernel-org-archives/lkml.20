Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C3933A6F2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842314; cv=pass; b=BID/jTq7Pt5LOaPYOYlbJgD7gB9iK95Q5QrY2snmWZhjyFvfkDwdIG/3t7Ixz1GtOc9WjohMeYOQLcpbQNqRyl/XxUk8MqV19K3j8MksNjpwIixfjVR1ZZ/pm2JASuSuC42W8g/Ik1Ws1N6GySXF8ZA5IRVWoWPXQrNqQbxrD00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842314; c=relaxed/simple;
	bh=JfGF6x5LOBnftc5+sP1QIIQF8KWJ2gxceLJFrGZ0Tuo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HFPgE5k846KT9YiJvssGvUPf4lYccK8qL9pyu7rNIP4+6YMwEUclWXvuPVRthptbaXIoY9HzfHK7KOsxfB7VqBts2lN48QWaUBX72S8sejG87UUeyOWcdJVgAnn5qyS+pC34Vg2XjkCSxCvY6CNcIiYyaeoW4AWDAVUOueUraOo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqmNN4tk; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqmNN4tk"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c2533d83e3bso226855366b.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:51:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787842305; cv=none;
        d=google.com; s=arc-20260327;
        b=SUDrz0ZScMrI7O5iHoodKFQ3hdt04L3P7m6t8d3h+QCZCyh2KIZ90wlosouBNUpG7B
         ZzmH0v/N4S1t17FoeX2h895GXD5VQNRum9R9puZzvdKXOS1Gw4y59PeaWkmo2LSK6nQA
         wlj625IbT6XERqPBBkcyssHePDfGpQjHLoZ9CGZ3gKWb7VQGcNzErigLGX4ZtsNf79cc
         ZPqG7mWc2Z00ClR1v7IqFKkXq8ig5endYOr+M94MRJP3d+XTc78VVDm9i6fa+QabXw7E
         XmWvtZACn3TPAFXE31H2SLi3p+yt8gxmz8kEGcVThZYuJS2eRvElivulIl1tSc/2Vp6V
         Mm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        fh=5RGiSSXvHhbajEhuI1ByOOvWefob83Ld7tRA+b3x0n0=;
        b=c2pljIpTeZRWe1hL9HG913SSj5JSsL4uMLzyv5qL5X/DFKPWet/Ei6vYPLhjnOCwfu
         c4w9oYU6o4zcSgc3YINCAGkL6YYgFaV/GnmI2jGHLQIy9gc0aSdj5ewWwje4SXj8ba0h
         TEmDrPQ1yv7rnhKNWoTFykeVSGNJXRyEQPu/xOswGdEezBKRWaBR/wq5/KJ7optKYr56
         MSD7PPrmVigj0uVKrlI0rIA2+7/17Ac8gj4rYr/2nciBjWhU6V7jy03oeCK7+P9Cfflg
         VCZ8jgS+gr5lpTddwixcAX73I8Fw4pW+WXP3L7ZCkq+FMJh8lXzBPlR+B0N77+8IOiY4
         OhhA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842305; x=1788447105; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        b=AqmNN4tkI8x8FAfbglsXPvavrjCiggdJjyBiBhI3pen5AzsU7spp36DIUXTqk13d6Y
         is3uVyWfam1AAIpiLQdSLOOrjdFCZkpE5bnsDPu4KuOmkm1LnRNElB2qtglPd37//U2x
         +47mLJwmLvpt43Gbe6aAR7ZiikbjZPoFd1V1zbbbF7R12g2B77qdpfI7pH7qpQFtwZIf
         EwPDV7UvPrvuaft9kr2Iy3Pf26RxxmhtLFT2tjNA5yOoge6sIJQurZkYk9AIOPCRYUKH
         cGRhpKaP99NBBswbvrLl8sFQWUXttHkEpFr/zkepv9T6XQdJ5g+M309NEPaiNjFNnCIQ
         Soig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842305; x=1788447105;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rNAVc3KEaJO754MBwf1BXCQjtokctPSDVwjt06/SloY=;
        b=Mp+WxIYsxtG10dtJ/n0dZ6xtgCl7DDXUmzq8zR+WMjv25dF6z5d78omwB6czVkyxQC
         o+OUW5fvuc7GO9rfeJu8bcvZa0pNAkr5PeDDJzeijBIrvqH2rGdLSPxGS/Ps5JQO+dX7
         l72BvreammqYcWYYpunio6BB7Rs21urhkh1RmEJd7AV7W79v9a+6h9djAiSKyUe1mRVw
         WDWwFW+oa3Y3YqjuF9EMQa+EVvh/HrWaBjlRFMPY+dQ3ekIfjJZgrnxHwEpLbpAqqdNo
         iZM/CkNp8sQHzN20O0u3A/bvVXR3Ew5FiKrbMhCVoW+r/VEKVQiZtOk5+ATLwdVsgfOC
         thLw==
X-Forwarded-Encrypted: i=1; AHgh+RoM2HXpfGl2XXTEovqLTX3n0hUVcBRWxnM6hTvg6hvQ0NFzQIZhUAcCP82zw03+hntl9RhefT9ICtfS9hk=@vger.kernel.org
X-Gm-Message-State: AFuF++mXZDDiz0Sb+uTBqfw4YBPXLZxaf6BNSLHWse+KN8S+lKB5ALL0
	BoKSDfID6orXdsBw0wlYJ/n937odIfQSXdlk9RqOqTfa43BqNfJbY+B4z7tMAOTDihftKN2IQNm
	IHuUmjqdtc2DKATwWCsETWp5M5F6l13k=
X-Gm-Gg: AR+sD1216lUd8tbP7sx27Qi84c4Aa1fpTTat8Sj++IMuIac+YBsWJVgwWnFpzahamCq
	STvejFdJuTdIJAwxcgUiHJTlBTw5W58AOxri0tXJhxfDGLwkBx9YE+j4sZdrGybe03kgM7WCFTD
	enj29Lxvo/FjsUV0je23pA5Tv537LTJ0K9jGK+mYLlLEEtqSTz3cmY5jmYj3Uqvd6LUbxM21Yzj
	w+gI+nyuk3PKfe0qnvnyneiROhVs2TZ623QvmrQnlMJHzY8UkdyrWvXvNVkQYmbFCISoUBegRmX
	n872oUOASG7TWHQHwCxS5vhHoFok1D747DFjAfNQfSo=
X-Received: by 2002:a17:907:b050:10b0:c25:2688:8212 with SMTP id
 a640c23a62f3a-c252688970emr595367466b.0.1787842304808; Thu, 27 Aug 2026
 07:51:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809160643.33991-1-l.scorcia@gmail.com> <20260809160643.33991-2-l.scorcia@gmail.com>
 <20260811-amethyst-seriema-of-gallantry-ca9c7f@quoll> <CAORyz2KXJf4gU46649w1ncb7TAOErdoGmfOMzwKr8b+eGdAgVA@mail.gmail.com>
 <20260812-smooth-artichoke-kittiwake-f6e85e@quoll> <409e398b-eb8f-48eb-a0d3-ed8fa811328f@kernel.org>
 <CAORyz2JbOsiDYzCw--Y-tiRXEaZ69B8S9Hjvs-j5WZmtck-ynQ@mail.gmail.com> <ca373f33-fa20-40cf-ab7b-33dd9c25bc49@kernel.org>
In-Reply-To: <ca373f33-fa20-40cf-ab7b-33dd9c25bc49@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Thu, 27 Aug 2026 16:51:31 +0200
X-Gm-Features: AcwNN1UfydGY6AWpAopJHGYjoXoxQXXnBv3_HR2BQl9Llz3VNnES3KHGvzZYgY4
Message-ID: <CAORyz2Jq-Q5CbFU5=vCffVyMmyS2KodFhomfUqyGwa1w8Q8RTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] dt-bindings: reset: Add mt6589 toprgu reset IDs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

> The IDs do not describe hardware capabilities, but ABI between hardware
> (DTS) and software (Linux). If you do not have them in the software,
> then the ABI is not used. I looked at your driver patch and did not find
> usage of these.

Thank you for the clarification.
Since I'm not adding resets to any mt6589 DTS node here I can
completely omit this patch in the next revision. If anyone in the
future wants to specify a toprgu reset for a mt6589 DTS node, they may
submit the binding header together with the actual DTS reference.

Thank you,
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
