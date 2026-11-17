Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794917284;
	b=h6fVjMl5onLgeptbU3421dKYVvF5+2kyFncy1YY6xKzci5uoqv0mHHB17mE+ebXmL6aB
	 9jU7GjaP73hOqMicoX1n3WvIKfYLz1FNnNqO2xIU0lShQ1ygkay9jkO89FOqFx7P6xTug
	 gERF/FNSqEZvZlC1pvBEoPxQML4H5D3apdwwj+z48QzpImYWjDS119vQe6P5R8G1ChtEZ
	 vq15fHI5pzROXPnNlXGZBjeecVWX8Udlfzq1ycNyHDaBIvPKvALb6tCiTbNbSMizUzIBN
	 dMVxVfU/R/P0o6IIMSZSa9DVBWJvAjwMabXPI+H5/jKsMj5v1Fa1471fa9ozR1FGs3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794917284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
	b=N2meE0wvlhYRKBc6/4f1SO33fNMUGOXSbmxVxE764FroTjCglmxl8ntUGcIhzL7iK7SO
	 fHL25JYcDQCXArooGoIbgeFjRVPRow1JcSTfxe2GkWvolF4VCPIV7TTMA+mWoWtiX/Yzv
	 xAKXhYmkRUy2mn9apCmQuMbk4I40MHvSqNzy7pA3qQ/V/ydKIfXuzVHo3an1wsA1Q7qor
	 MRTbjyTsr0tiWF7hcmnwNJWwAVZVr6nk8GzbhOSI74Nd4muZ39DcFqFXqlf/XLi23nAmR
	 Kpfqa/0QDPL7nhTzg2veF3nDPR6GIA6+x8kkr0mSHn6woHOA54vKs5klSzcKQdlD+WA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=dt0iCOV8;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C85606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 12:08:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2C85606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=dt0iCOV8
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4cdc606b47so792862366b.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:08:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1794917282; x=1795522082; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
        b=dt0iCOV8v9GvAZFTt50yVBbkG2wg4ZbVorZMsiO2KekaDCip1lwFjGMCgnT+pTmn1s
         PyD96HT/urX1171AawiamygQPsZM0QOxGRVjmbzF2ZVvR26mtxc4OFKszLYGJMhPUlBF
         fLbReExtNhC7bOHj3TDuqeIN/ptRUbNXFQG6hqNZiaaiYL0CVQ8/YYUxaWnje3peW4do
         8BD3nCUiO748ANhh9WzZFJi9cmyAbWbmeVxJzA5swoFc5cxLnTSZ8oaMsJsoMcMivURr
         klv6TPVEXsjCMpxns4NpXPrBxieCaZrTg9xJjRaybRUunhjrdWpTjo3OcPmHfRtt/i4O
         PvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917282; x=1795522082;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kPzdzQ6tHDCIxM8wFKMRfpcZWRkcCcNtEPZkCPlC0Rs=;
        b=xKEmJ9bZBFERvUNyOeOPDQbvjU6aUS+MXwwl4exqO83mElXOrzshKLztMHeqZFJHzO
         yL/669xZu+SQU26m8LWHzXkSLBej9yymRMJw4m+L9TEIRQrIPNk76e0sRQj0V7soWXvY
         Ose++r0K85zw7UjgKprOnfeLq99IcNx7wqzRRHahuI6nFwG9+qjFZ0GH2OZEhmdRHtaj
         vpLGfqeS7M1Q8gXmuaaxmVfW60MJxw9wBw1HdyOQKXWpFOhp+w0JlibRkqSSw5SBPTtT
         UY7CpTo4YU6Y51EsRJiyGA1j/E4p2YnS4Kt4wLfcGf2dTKG8hYuZIhrwMpaEC393Cnpg
         5//Q==
X-Gm-Message-State: APuU4Z/baQlP3tqyDFVYFc7t6leNlQxEod2rx19Z/+Ob5IRPVSb0tZsQ
	RTugVISAHYiiJ0G2mG0aEmwmwqkDdSa1L6wqDU7GTj9dj6urb13nO1bmpklQPt4qYRk=
X-Gm-Gg: AYBFou0Cz35+7JVUnJeDtwYekGVwSydR1BhcF3Ixo9NC+dh+/5oae8FR77GXJ8oIUmc
	7JRdb1E3CMjAHFe0j2GQpp7WNqaNneaEiqVGdupzbqizNfIrt4GbDAS9CLp4cpq7LdM+RdpoPFn
	uk31mqavmtJ1170m1HHPcGbeuWaslTGyy2zPS+UH0/ZEPXEz7GUN1ZCNmzWsxGwUKY9FQUWvSxt
	5fyluc42qaXeAYmPCafOSMPu5Sz+uRMKOminiWQMng+UI1QMhkbEJohjQGMe+Usepd4rBlcFZ38
	RVj3bwey2SFQFc8TieSxAlp8EfQBQ/FiPney5Dw2zGE89Rdvb9pA8kfb5HD660iyDMXqX3jPEOw
	6KMux+JcVZ9NQvlquhoRW/jElNJD3JR+l5MDLE50B+hOtszo3NUucqSK85w0FnY2pMO4GtPyAEm
	XZVuXQhELdhp9Rcwvwl/knMGzu63JxHDGphuduB0YUnom2G5nLjhmRSW0oo3KU+kPvg2AoGgSYX
	WMNs5PCzAeLaENx8oBXUPUTrJhHDYdqTI6n2SE27r41BYBJiqame3AFtc99uJIWwk6YpJ983q9Q
	YDiDuQouwST/k70SJeuKEySk0JcajlEefhqZTW34X1kc/76xm7v+wXtYSR2V8oMDrk5sDnhvRw=
	=
X-Received: by 2002:a17:906:1f4a:b0:c50:aa10:d898 with SMTP id a640c23a62f3a-c50aa10db4bmr727613766b.26.1794917282269;
        Tue, 17 Nov 2026 04:08:02 -0800 (PST)
Received: from localhost (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b8650fsm525227166b.77.2026.11.17.04.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:08:02 -0800 (PST)
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
Date: Tue, 17 Nov 2026 13:08:01 +0100
Message-Id: <DMXH2NN4W05P.20N2ROUFAX0WZ@fairphone.com>
Cc: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <phone-devel@vger.kernel.org>
Subject: Re: [PATCH v5 10/12] arm64: dts: qcom: sm6350-lena: Add PMK8350
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
 <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>
In-Reply-To: <20261116-pdx213-upstream-3-v5-10-7318a19806eb@erebion.eu>

On Mon Nov 16, 2026 at 11:50 PM CET, erebion wrote:
> Configure the thermals for the xo-thermal thermistor connected to
> PMK8350.
>
> The trip points can really only be considered as placeholders, more
> configuration with cooling etc. can be added later.

Same as pm7250b thermal patch, could be squashed into "Enable PMK8350"

Reviewed-by: Luca Weiss <luca.weiss@fairphone.com>

> Signed-off-by: erebion <erebion@erebion.eu>
> ---
>  arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts | 12 +++++++=
+++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts =
b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> index 0bb714eed13f4..b86fe11fd5296 100644
> --- a/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> +++ b/arch/arm64/boot/dts/qcom/sm6350-sony-xperia-lena-pdx213.dts
> @@ -105,6 +105,18 @@ active-config0 {
>  				};
>  			};
>  		};
> +
> +		xo-thermal {
> +			thermal-sensors =3D <&pmk8350_adc_tm 0>;
> +
> +			trips {
> +				active-config0 {
> +					temperature =3D <125000>;
> +					hysteresis =3D <1000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};
>  	};
>  };
> =20


