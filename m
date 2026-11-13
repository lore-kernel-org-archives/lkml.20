Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794574802;
	b=U76c+456dr+bkor33Ky3zBSz3U3m3WxL2KxgxihliAKFpLIoxDpYLLri2X8Q64PT6jG5
	 z1RChRuVG6T/oa+7ihbucVoNRUF/lTfqcqG3PePcXlAh0QnwVgDxn9LRnhWOMxCl25Psa
	 Is1aosETWs6J+IUnp181xv+Mc/zHXguh8ZEHmSwMbnlEUrw8FXu+wWninKCX6AjGeEs/e
	 MA1nstPn6CYSPIEwy36bBagFE5YRMU2oSneU9Md10mIwdrgcCkAbg8LL8CP/yXaCs6jFj
	 j477w/JxHTBXQW8eyyXgiZYupMBzukzevzvhAzaHJlXBGDecLV4KrKw3StLQKa3MGrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794574802;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
	b=XvAePs4oDhUykU8G+Ejzd5qZAVbTXwA/a/dxtCN8OnC++G3kqZl6krGUCTs3cQSh68hA
	 mhYoi9g1vRq18aHhZ86lmhdrLy6zNKBtSeroMWftwyw6MWG07XEmBY7lOe/lXPs1DS4AB
	 QF6tdNm4x6BZro5iNCsHRydBuscexJPmlJ9+qKQ0MVjp7rT4izQ4AyOrb8JNxOg+3gAwY
	 SvzphD/a2pDvsvZd739B47ygkdPYa2q/IEHhoTxQQJoZhrAMW1Pj03VPyMUDrFks3YI86
	 lE+/rv+UVCgNNivkYitnxWADNaeXgxhFX9oeEbysNYES+z0IT85WumVzxxEuFwYwrgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UvD9jOHk;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CB7606A882
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 13:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3CB7606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UvD9jOHk
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d28f75d62so232880066b.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794574800; x=1795179600; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
        b=UvD9jOHk4SiGf8rkczNn6Eu5dUIyL68LeD8TP0a/E8TFSluP09i1lj2STN+pBd1GXn
         r0uw9Gl8kUyeEgYwk17G4cuf38u7C24RUDfNbWEB3MzjNyM/6nbDz9Hgmi2xs/rV9rrG
         nob/zKmUNGCENceo5OPAplZ/3ct4N147esrwLqNg6j9sc4tDO2bDrXTeu0NHcpwmGHr4
         RyPPSLA5iduIrS4kXN6Szy/UMAP8J6zqbvLrKjW3T6gG40ajhCHcQtfkhLBriUwm2UPA
         pTzPn4HtoaIgXkKNwiZf2qCLzhOe42cXmBhbgp56MJgl7crXxsm4WaNRgdtQ65JxISFV
         A+Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794574800; x=1795179600;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rxc+lsOwlIhCUr760hV28tsvVKVp5io23lxJTQrvQAk=;
        b=ucxlhzeaQwvWfdayp8jM9HdT+7MAwFDWV7otjAQSxFhmCUcJih1+Wkneu9IfGUXHoM
         2o7oM1j9/i4zHC5nC8aBdUCt2Ov5jGIKYqKCFzFdDUWlAsjaRmu1Z86EO1VtxhCyJ/Qe
         D19dys2vvdgqARFC/MTdBKRCPHu92O9Lujt4kCviF5hv1qTjfDeiRHeNXx7FQqd8DoC7
         hvY629GFeNCDuAfEBGtPHBix0qvBXbYBhXxtj5rVBs5PbQnPPiSubuk/DTwgcNSprgmZ
         kh3FXbPhCJq0QwTauaUaGGeV1NosHTTvsADhQE3aoZ5+ZMU9BKdXCRLGiI+XDjtbuI2L
         zNIA==
X-Forwarded-Encrypted: i=1; AL+hErHduxUeBErHa5cBl3joamxgHByabpKTbmIosZi3ziyAnFrJukBeXQsPW8vQbpsDqwF4rcgZ36U15bEWpWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hftEKGzovhY+4Lk+11nBJ/+Fa+STPvprglN92NJEI+6CwAXQD
	raknCGEKEGN+oI+wmkL2yv6TmQ2kFfSz+EqqYPxtwE/FUWzlo5M/oA5UUWXRlGEQUP0=
X-Gm-Gg: AYBFou2zMw81wJZVRGJFWvwJe6+eqho7PBWNkHubpn9qsFafE3P5rPITz5N/BbU9jyk
	Tsv9TpopuYvR2psdZVPjK+SznoeywJNT3/1mbwCBJVcOdmEB1Io7du+g2rrBwmMOdiuhNqhvXy1
	S8UiNdsxo3u68A6BhxCvzcdizWUrgy6sR1QuXwZ77WgahvuH/vXxVyUA8W/VnSGUnU5+m4u58pB
	s4CXhuj/sGCyKtDTbuXYpLsDazk5TpfGWSNwCzslo3lUv6AokfBAlzpE85dDbFX7AXKiI8PBEp3
	eb++etJDIZZ/er3LGpH+W9/OAkQCBcR01PWGSV7lMmhUkVE50x4QebZLXoR9vMVJp0JRw5brZRI
	6ks5XMj2rYnO5dhMhuVEYldmpIKqGIS8kgzYZyFYlGVIg7O5JZwwzxtDuttERPrBU4K5oZUKIDT
	Z05+APVRU4Z0k3TnT6z6rWWZgf0JDwWsq2PlwWqhvyx0caJF1RR5d3uiuxTvOzD6/IT5onIlrya
	Ji/P1C1cC1/SNl3eA1BOaspKSf7RmfYdnk1TepnKP/aYgispYlBL2ezEFjBB9gzT1XdERxi0Q5T
	3+5T5O3FUSdBlrCiN3zTR0qF03oel4QftIntfoBktRfhl3TWGRuNjvFJ3SMzljSvRkXjNuv1Ig=
	=
X-Received: by 2002:a17:907:9624:b0:c41:1e13:4ba9 with SMTP id a640c23a62f3a-c509614d513mr218483366b.6.1794574800110;
        Fri, 13 Nov 2026 05:00:00 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b6f6eesm88283366b.63.2026.11.13.04.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:59:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Nov 2026 13:59:58 +0100
Message-Id: <DMU3O9G3L6PD.2CE9WCHR9LV0J@fairphone.com>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm7225-fairphone-fp4: Wire up
 PM6150L LCDB
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, "Bjorn Andersson"
 <andersson@kernel.org>, "Konrad Dybcio" <konradybcio@kernel.org>, "Abel
 Vesa" <abelvesa@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>, "Val Packett"
 <val@packett.cool>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261113-lcdb-enablement-v1-0-1dc40b49ed82@fairphone.com>
 <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>
In-Reply-To: <20261113-lcdb-enablement-v1-4-1dc40b49ed82@fairphone.com>

On Fri Nov 13, 2026 at 9:16 AM CET, Luca Weiss wrote:
> Since Linux has gained LCDB support now, wire up the LCDB regulators so
> we can turn them off and on as desired.

Actually after some more testing with extra patches, it seems that on
FP4 the touchscreen stays dead after toggling the lcdb regulator, while
on FP3 it works perfectly fine.

So please ignore this specific patch for now, I will figure out what the
problem is and re-submit. All the other patches in the series are still
good to go in!

Regards
Luca

> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++---=
------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm=
64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> index 37aa272019cc..d592bede6a61 100644
> --- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
> @@ -72,14 +72,6 @@ key-volume-up {
>  		};
>  	};
> =20
> -	/* Dummy regulator until PM6150L has LCDB VSP/VSN support */
> -	lcdb_dummy: regulator-lcdb-dummy {
> -		compatible =3D "regulator-fixed";
> -		regulator-name =3D "lcdb_dummy";
> -		regulator-min-microvolt =3D <5500000>;
> -		regulator-max-microvolt =3D <5500000>;
> -	};
> -
>  	reserved-memory {
>  		/*
>  		 * The rmtfs memory region in downstream is 'dynamically allocated'
> @@ -784,8 +776,8 @@ panel@0 {
>  		reset-gpios =3D <&pm6150l_gpios 9 GPIO_ACTIVE_LOW>;
> =20
>  		vdd1-supply =3D <&vreg_l1e>;
> -		vsn-supply =3D <&lcdb_dummy>;
> -		vsp-supply =3D <&lcdb_dummy>;
> +		vsn-supply =3D <&pm6150l_lcdb_ncp>;
> +		vsp-supply =3D <&pm6150l_lcdb_ldo>;
> =20
>  		port {
>  			panel_in: endpoint {
> @@ -925,6 +917,20 @@ pm6150l_adc_default: adc-default-state {
>  	};
>  };
> =20
> +&pm6150l_lcdb {
> +	status =3D "okay";
> +};
> +
> +&pm6150l_lcdb_ldo {
> +	regulator-min-microvolt =3D <5500000>;
> +	regulator-max-microvolt =3D <5500000>;
> +};
> +
> +&pm6150l_lcdb_ncp {
> +	regulator-min-microvolt =3D <5500000>;
> +	regulator-max-microvolt =3D <5500000>;
> +};
> +
>  &pm6150l_wled {
>  	qcom,switching-freq =3D <800>;
>  	qcom,current-limit-microamp =3D <20000>;


