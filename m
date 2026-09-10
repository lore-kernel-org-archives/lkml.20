Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C5397321
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789058743; cv=none; b=otZwH2cdqOak06PQUUpCdKPMuFqwm+4VDNb17n33dFlZhPxTCjpkaqyn1Ev3ff/0aXaIQgCUErRIfzrJVei5fI2LyXQE3jPaTQT9m0R406IoodJ8+TFK6aReYF+hR1KC66v7V6UJFDIqmsu1+rKGHX5Q7G2NdCqNbbuhGYUR4L0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789058743; c=relaxed/simple;
	bh=p6n/4oQ/+Mf+bndL/38+0XMFVZA7/fqezSsjvbILeL0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SQZkMPWxZjPuiIjwU7FB9T3MXc3e5Hv+vLG5piTN+sUyO8W9y4L9w31Rhd3nD25b5bCEjizgpm9OL2ldXT+eJPRO+mC3TPi6g8DF+iBm8H6n3lRr8uzM0gxDCpkQDqMxPIoNJOLSTak0RafNLaPEc5Oqyn6KO73dH/ihGUpXj5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSQyD8XW; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSQyD8XW"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccc02279so1509188a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789058737; x=1789663537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
        b=RSQyD8XWalxcRTEVxsSTXLOt2Cp/qzXf0dEEfnI3C/wszDtt+Xirx6qfM/vPoiTm5G
         DuegSsS7oRVBJzx0R5YTb6yC8AndMy50F8nwT5VnRxS4Io3fFD0UtcB7MbGBoj5t9zp8
         ZWsic2cDNFJ4ZtKTNrNZY775m6cxu5c5L4qNwMxpvndG2tCiRt+xBObePmgsu6j8ipDW
         GzSuM42IEOSkNTZMT9tDoR4joWIjizs8QCSihKLpO0l58IdZCYv2O0sUhVecuMTeTUAF
         BFJKyq7D2wzy4M0ry9obYhSYyWZ1qssrucxUYuQsjsWU2iAkoDH2lv+ZL2F2BCcN/zqb
         ZZnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789058737; x=1789663537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/p++9I1R/iIuwd/rK6+qw6C6VpxJR29WD3dxkeWLEtQ=;
        b=ni5NwdVQ738xoi8dSHaTr/32M4k15N6hydNXCteFh+QyxQ8aVZr8CHDHpiIbS4eKbh
         2pU4fGKh63nrFDpWh9rnhBj/MaAC0JH6uinr06q+MHCaOyZbxYLH6ZCEqt9pCEK3ScHO
         uFy4VBFdizqeMvfly2FRFZpuUbLrGCCpQX4imUclIBSCCb2Pw8AF5trN2xrfDTJ5z1XB
         Az/3EkJN0wvAhUEkmbeo8K1aUim/TX8ot4z+K6xXiv3YcyiaYgLxUfI0u2FFEvXwOjbY
         qBe80bwxQBN0VqlsyKwOn/V2HUVI2jRb1hIKMN3E3o7onYxobeqHgHPjgFG9l/AcFiJW
         Ok1A==
X-Forwarded-Encrypted: i=1; AKwUvBxQpiX+Y475GpYRroPBlpCQsjtPWCxYjap1le9Ii5aOfwD14B2WanqE/MlAOUWYnHbLVve29q4rIq9VoDg=@vger.kernel.org
X-Gm-Message-State: AFuF++nL3tXnkMGthqz2uOe00IilXtj2JRSOVIRB0WtLmn6Bkhbzlh/O
	+pndjwvTAu9G+CyrvCVH4FuEmpmAV7UEc04yBd4Brmn2mLd3xFeaoCVa
X-Gm-Gg: AYBFou2u9A/3v2HgiGIg99YlWS5tr3yi3VnJ4j4kJPm6Mk23Xh4ieOq34+Y9l5U6snH
	FDwTpdSWvhFWhNOnAS89sSinONtMmc3oo5yRZi/GOfspBKil8NvlFyUroDQB6FgNHHELGPrB2a9
	eHqVWfpy38A9KCt3M0rjinc4VtlaVA5LBeUKEYJELk9EYYDlTLJ6Iccy47WT4+s5OXGmbGlU+c2
	In9taqQ6zxqsVwc2KXSuqqpObe8t2J2ZBPsRfvPLkggS2dRbe957vqQNiHj0yooK0hlPIm2FtFp
	3tBEqmpgv0aJ65e7urf3U/I1x8DpeiA7COrSmo/BCucSA8IaYXaOrjc1nrD69CIgiBbDRAGLOgw
	2ad8F9s7jy/topJ1JOIGkIdC0apxMfo3oPkg74mlnr+jbrvG1P/FI54sXZ2AwAaH/+/N4cXOmwW
	9OKXAafR8Z0yNhHUOtLJ5xjzeAsnrMyHXueLjNPhep0HXXqYonD8R/hDeIuyz6kAFoecS0z8WyO
	gLbZ96jTXnFGIfQ47J056eM13MB02vZ8ZAN1hpM1SCZaSD7htc0sC8=
X-Received: by 2002:a17:90b:2b43:b0:398:ab03:95b2 with SMTP id 98e67ed59e1d1-39d709e5464mr12712034a91.10.1789058736550;
        Thu, 10 Sep 2026 09:45:36 -0700 (PDT)
Received: from [172.19.1.47] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm496465a91.1.2026.09.10.09.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 09:45:35 -0700 (PDT)
Message-ID: <3b6ec7ca-f3f0-4605-af1e-4f6197c7c1a6@gmail.com>
Date: Fri, 11 Sep 2026 00:45:30 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: dts: nuvoton: Add QSPI0 node
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>,
 Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>,
 Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org,
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260904-perso-ma35d1-upstream-dts-v2-0-30ce255a401f@bootlin.com>
 <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
Content-Language: en-US
From: Jacky Huang <ychuang570808@gmail.com>
In-Reply-To: <20260904-perso-ma35d1-upstream-dts-v2-2-30ce255a401f@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Describe the quad-SPI controller available on Nuvoton MA35D1. Bindings
> for it have already been contributed.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>   arch/arm64/boot/dts/nuvoton/ma35d1.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> index 7228ad4735b5..9eec44128d28 100644
> --- a/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> +++ b/arch/arm64/boot/dts/nuvoton/ma35d1.dtsi
> @@ -431,5 +431,16 @@ mdio1: mdio {
>                                  #size-cells = <0>;
>                          };
>                  };
> +
> +               qspi0: spi@40680000 {
> +                       compatible = "nuvoton,ma35d1-qspi";
> +                       reg = <0x0 0x40680000 0x0 0x100>;
> +                       interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> +                       clocks = <&clk QSPI0_GATE>;
> +                       resets = <&sys MA35D1_RESET_QSPI0>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
>          };
>   };
>
> --
> 2.54.0
>

Reviewed-by: Jacky Huang <ychuang3@nuvoton.com>

Best regards,
Jacky Huang

