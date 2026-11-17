Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917221;
	b=46u5UlXO9NhUuYTvC56yiu7fVUnXOrV4HskYKNpYb+cbMIXcJZE1g5GqJpZXu6x79tjV
	 ScFqKHHB1vsIt1Ir6h2kMprJDkfMrgFEvQRHwMBpQgMVCw3kfiwnypb4qfhw4U0MvyCWi
	 6mAkKwanSvbEXYzMom1WClPkrHVJP+UiyZdCpyMW+uH6kOnC4jo43z6MpTReC47AxDN+o
	 nyvFnPfFtYtR5srOcBBWsCEl8IbUNujoXrVuP2a7xOs/EXyDyJCYNsoxdNv/v3k00xOVe
	 T1T4j9hIm84pn4VLC1hwoBn+gftQDVyD16kjEP2SVHBTSBbusG2aDMiRz8QweabF9ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
	b=0wuFr296oJV8xTj3R58eksxTQJlUXveopIAX5E4sBZA5cmtCbcSSazWNc7+7LUcZSTfv
	 fcew1C4NQVb5tBA84qBr17Onv6zWoTID3Pka4/pKiqgTNzNCqkDqujBi5EphoF4XKyjTv
	 f3eiF0KswfduB9tplTp5nIUJ+99X9b8YpnDCyZsy2Si35imwuvcGdyQPq9j4/DWgdwZBu
	 XmuWAV8BPrS3Tt250eZb8NAkJTZRRTz/rlsPXKlhwU/zsWFkmXi5PoujyChN6jmK+0edK
	 /qOQeoDdS1VbpvgSy+Bt9Bs/YISYVxc3+axQV5otlpfIJPey+mJ8K+8MavfDmhdOfrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b="0SXH/KI1";
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778B2606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 778B2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=0SXH/KI1
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c468bd799ecso682112666b.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917220; x=1795522020; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
        b=0SXH/KI1Y3sFR/g1FdVD4aywE7M953r8hni0T/LCpli6q19nDR7TUQ75KMweJVehSF
         yYRb5xKjPO/vtngq8ekpj5yShHNAARPN/0knvtzfPG9NWvsGU/Ahi9kyXDncp1CxND1Y
         StsB9I/AvGZOe2+fcbvcC1F+NgWpJh1hJmTOc06lJWbwVwU4YZ9Egeygy6XF3qqtrpGV
         oSO66+YyHJkUTXaLwZCmT+VOfuFUHtnr4Lwq9U2KMY+L7s6djeKeBl5w1DLV0H1j1sw6
         5YuP0JUF/7bntcWL6f9C5SQPyxsXJ7bG0wPEdSROPVT2945ojgBEVS27n8Lsx62x9mpR
         VizQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917220; x=1795522020;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aDpnAdxCSfd2EKAnSTqMP2/M8c/xtUmhy65PUV7fU9E=;
        b=bWqIxMeBlkRkO60S0SlWidGASTfggS35beslRHklMAYyqRJmQ9osjkgyVNr9D9NfSK
         /eJM4zvOQnJ2ArH3Cs6LuC8xl+tcFm33+pHYV84XhzY00BWvhGd0O9T7OF+Cldc2tp3G
         sDGN8TxHz3c1C22tMpKqS0fGbInYSRCnkqftkUaFlBV1tVcfuknRoijJQy1wCdLxnPE7
         c6W1Etw3M9px+FKbbX2Rwh6LoV4hBAn4VVsZNrGlHmZKgsmOFZTHwcIsVTgxdmhJh93i
         +jQpLHIMZbudlySUgLT8C2Usdz2LSJZK58xhKewbVcQ8vpajtHEbzoyFmcTL2iCzz2BD
         mm1w==
X-Gm-Message-State: APuU4Z9JBkti8G3ARi97Tqbkexk23YBVO9fndSCAQWvSYnOxXTkhF7cj
	mTbjVXtibmCkarCQBNk9x9KagKtc1cItLs5gHjD1OZLaO7CGCsKoC78Qz7gqF0xn/Vg=
X-Gm-Gg: AYBFou2u0C21GNzPUrsDpmj8M4eI9xeXdERo3PLTeTSxNmdx/8qjg4TVgb7dJMH/UdM
	YaNE637SZQvQK9L72+6Sf3FflbhchT4GviYrWuqePaGbRkMpVrjsi84ZWU85aC2jh4up6SMjkwS
	nSU+AJPQzQ54zPFVfgrHakdd830VePaN3i7wUb+xumv5oCk66J2RnDghZH8JUhpCME6yapKPxQ4
	sWQtpfGzDwedwjnod6PSGE4wGJ7g0v+9+TqqhII1zu+E81BCW8kOpK5e4rdL2BpwXFGaJT4V8pG
	dSyStOMbkmk00AadvaqeSNU1hgPaBNmCpPzHXoGXpaFVBUwwdQZkZ8pREbKFahLrXPBss2dVbNb
	5hbvQ28vm3JgRCyEehmpVgLbCOhX+cksaNBUgLAYZ9z6uxLQy3SK8Y/otbu4HkikS/LlcUL4ybf
	bghbb1LAxc9ioeiNcz4I4UwsH43mJFG1CECaX1qvKBbwamO1ZejcQ89VS4A8jCFdJx//E+9OFQM
	IQslV1Pgc3WoDyteKj7FEbpzhWHBMkcHVcalsTijsRQ59WsvsL2uo6ePd0E72MJQaq7nYAAIHPA
	7NVbAq37/WDzYT5fOCJ3Sj4IVtos7QVio6Aek2iU8j5Uw1aE63ak5AkskZsJ+Zwg0oVYTF7jAg=
	=
X-Received: by 2002:a17:907:6d02:b0:c4d:4d5b:4bd6 with SMTP id a640c23a62f3a-c509654df6emr1125503166b.41.1794917220010;
        Tue, 17 Nov 2026 04:07:00 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b51bcbsm522082066b.44.2026.11.17.04.06.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:06:59 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:06:58 +0100
Message-Id: <DMXH1UYFI74N.FT441QG9ND7@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 09/12] arm64: dts: qcom: sm6350-lena: Add PM7250B
 thermals
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "erebion" <erebion@erebion.eu>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn
 Andersson" <andersson@kernel.org>, "Konrad Dybcio"
 <konradybcio@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3-dirty
References: <20261116-pdx213-upstream-3-v5-0-7318a19806eb@erebion.eu>
 <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-9-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the chg-skin-thermal and conn-therm thermistor=
s connected to

This line is a bit long. If you re-send, please wrap it.

> PM7250B.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Could also be squashed into "Enable PM7250B" but also fine as a separate
patch imo.

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  .../dts/qcom/sm6350-sony-xperia-lena-pdx213.dts    | 26 ++++++++++++++++=
++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 50a235d6fb6df..0bb714eed13f4 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -80,6 +80,32 @@ memory@fe901000 {
>  			qcom,vmid =3D <QCOM_SCM_VMID_MSS_MSA>;
>  		};
>  	};
> +
> +	thermal-zones {
> +		chg-skin-thermal {
> +			thermal-sensors =3D <&pm7250b_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +
> +		conn-thermal {
> +			thermal-sensors =3D <&pm7250b_adc_tm 1>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
> +	};
>  };
> =20
>  &adsp {


