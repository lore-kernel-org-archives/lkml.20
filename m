Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E1643BA236
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 16:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790871092; cv=none; b=uP/HZ/QliXv63hEyTxs4orN8o5Y53bdSi74LntndZUdz9v47nev2Oojci46PvQcRScOz2SEUs7g6Ts8ivAEmvDYn1NDvipyLbd7219dXIMm7pfc6lo5696oo9NzB245ucmXSkKD5W6IXPRkEfRDGL8v72zolN9becQapTKJXviY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790871092; c=relaxed/simple;
	bh=XStV42dN90oncuZkgZa2fQZPOmDsXrGunS+USmh79ms=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J/tvZquS2y1d5MQRRAwi1xf/Zwe4MiDJVbtNk347M0/VMYtmYWQKPnvC0xzWEOxmA92b/TYYAmN2y5KasmF5K5VZp29x++01nEG2rAyOZKiIm1MYUfgYQWZhfOrsxuJPPche2wnEQhaEb+oHbbzCKLSJXDmtFkyCky6xiKnvA98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0VUaqCD; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0VUaqCD"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7d2bb404so13330645e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 09:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790871087; x=1791475887; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=;
        b=N0VUaqCDXm8tyyZf1ullqYzvZ1BPK/ZCaYzKHV4SfYVdeccv5aBH6eeJhNIhkiJItc
         b80GCxagXt6mJMpHuhoGv1fU7a3pWBjuU4/6dMh8XiexwO0OIdiUigjPBUEnnMCRz2Td
         30QUWnxTrJllK9MginQQsM6ItMpSUON8HPRHUNDbLiB40xKGmKf/tyTeJVZrqrfhP3C9
         jWY/XE4Iw4UMW8BmhZXmg92R1D79FpBLVaDwIqcBKHRTuM47tzpzGY3ueoGMvuBsPLuN
         /j9uZdsjhGXIDXmiFr1cennX58D+nzbkrfsHTg0kly79rl2mmIX0rvWiS8wYZ2H/U5hv
         aQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790871087; x=1791475887;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIZGQQshvUma/6DcqkuS/JxSHm+uvQgTCEKSqUG/nes=;
        b=TiC9V/mskXyBZ/jWw0d934GjjWwvKx53f98lhxseZKb41m8elU9nhz/YJFGbzr5ldL
         zXrt54a+Fzt8aG60rYNsbyFPehmcce0J5b+R1eaLkN9HY2s2ZJDsjy+er2azDcuyJpS0
         pHPPYTruALqmSO2u39d6cNthLPxvR+fqpZRdAdcB/kHGFgs7W42cVdyxpGcqEDLSMhzm
         A9qXtm4dP66W1xfpUVNFhIyp6tnof6DVTsmYZaagvMd8S923NoIWZge3b+w9ZSp7QrXT
         7CACyjSxD57iPQTNthJQ9J4jz3W2RD7XqIeLiTydo0tbLYMuA9xj+NpRHPWFuA1Ik5HK
         jnXg==
X-Forwarded-Encrypted: i=1; AKwUvBxXPgXlC4gTpD+RbxSIjNzuJg2+2c1HJzzLB9JTVOBz2PsHD2UhW9WumT+4xG5TReXoMJa7LBq0qLBEd0U=@vger.kernel.org
X-Gm-Message-State: AFuF++k4hLEkN9aaA0c7HcqgAYE4Hw6vTDYvBGdJ6avm16rTVRNI8Ghq
	2ccTkRtfKMyVj9ANHk74A3cEgVsXToXHdXVn/hGhXqaWCFIDGcEbpDk5
X-Gm-Gg: AYBFou0PMS7q7y6OEYrjWN2SEQ9hw82R+EjcjezBwM1lTdPMK7sT36gJEhazmcubltD
	x+0kIvpQ46PEnsMxyynYizmBRb7zFipYJOjLENeeRcFRWnrFywAVlUh+3KZL/SpSZmquZKIjIRf
	+Q+MQflzOfu/xK92z9pgj5G20SHjyiWhOEJF4QspD87RvP48ZEbN+6rHnZ7h43jnQqIeHqeqD7f
	yv3KcFeJxl9vJPAs8QlSH+4LEgZs97auXDSjfkKrxcsRiXYJfj8Zrm85R6Ix0sRcr8KfT04sIq3
	0GXPPrdu23lzW0K5UNWjx6hDQkinoTxe933fcW7LcOSAd4FP0QGU9CwH7n1OWoHH1G8A7PGXWmv
	1vMPYKs6eUhauwwsZJXi86+htaOhwWGkkMhOmvhJP+Fk2LTfTC4EswmljT4TzrOHYLEueHjzAr4
	v04oKIT59IlMpDrKfVLGRgLy/ke9uKfyMObzskZ3tFxPJMgz0f/OmCw5BTh0zs4+0q6z62BBW6B
	oRGX/JU7RT0eS5lb1m/q5A/+wZk8eMjic7MGHXq2TwcSx40fn6T2QKDmHCoCJokFYNXu/Tmi5wo
	53C+oPU6bYdYTjDfaYpfCMvHbjuN47Bov7RVDWprJwVRwCrhfl+TE/XkSIpQtgInipyd2dYWry2
	Jmf4wwObkVZYjVHNjA2D5qy6eCtiJv/RAKcSrtkY9P565iBcyXy12vIsSag4pBBeICSOBxtMpjA
	gMBMJwI5P0a95fP2XS1p+H565B
X-Received: by 2002:a05:600c:354a:b0:4a0:ec5:46d9 with SMTP id 5b1f17b1804b1-4a027447475mr3271805e9.0.1790871087229;
        Thu, 01 Oct 2026 09:11:27 -0700 (PDT)
Received: from jernej-laptop.localnet (95-143-149-57.dynamic.telemach.net. [95.143.149.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0db6de18sm3629464f8f.44.2026.10.01.09.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 09:11:26 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 samuel@sholland.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>
Subject:
 Re: [PATCH v2] arm64: dts: allwiner: h5: OrangePi PC2: add ethernet LEDs
Date: Thu, 01 Oct 2026 18:11:25 +0200
Message-ID: <mSzGX1AcQ6yrkdDVueDg2Q@gmail.com>
In-Reply-To: <20260927200820.795348-1-olek2@wp.pl>
References: <20260927200820.795348-1-olek2@wp.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi,

you mispelled "allwinner:" in subject.

Dne nedelja, 27. september 2026 ob 21:38:18 Srednjeevropski poletni =C4=8Da=
s je Aleksander Jan Bajkowski napisal(a):
> This patch adds support for Ethernet LEDs. Keep the default LED settings.

Reword message. "This patch" should be removed. Check other commits for exa=
mples.

Other than that, it looks ok.

Best regards,
Jernej

>=20
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
> Changes iv v2:
> - add defaullt-state property. Previously, the LEDs were dark by default.
> ---
>  .../dts/allwinner/sun50i-h5-orangepi-pc2.dts  | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts b/a=
rch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> index 6e57ee19e799..c23315994799 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h5-orangepi-pc2.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/sun4i-a10.h>
> =20
>  / {
> @@ -132,6 +133,27 @@ &external_mdio {
>  	ext_rgmii_phy: ethernet-phy@1 {
>  		compatible =3D "ethernet-phy-ieee802.3-c22";
>  		reg =3D <1>;
> +
> +		leds {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			led@0 {
> +				reg =3D <0>;
> +				color =3D <LED_COLOR_ID_GREEN>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +				default-state =3D "keep";
> +			};
> +
> +			led@1 {
> +				reg =3D <1>;
> +				color =3D <LED_COLOR_ID_AMBER>;
> +				function =3D LED_FUNCTION_LAN;
> +				linux,default-trigger =3D "netdev";
> +				default-state =3D "keep";
> +			};
> +		};
>  	};
>  };
> =20
>=20




