Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739013D79FE
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789093091; cv=none; b=Anyz/Rat2yrdTqemYqnpWPWRR+gZcxYtibw2ngHJ8eVCeEGTVLhQxRQjk/2pbdlrgOJrCEFzNVyH2+OIA2TTuYefImX6V0KeF+B9WlgF+XriNBZHoV+QJ45lUga8BuACk6l4UE08Yf+BV42TYNa8Ez+AqlJJU4Ps5qo/03IKL40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789093091; c=relaxed/simple;
	bh=Q4+PSDx6/s3fYpqtGntPkd23n1MmCP1JH2CydIJrigU=;
	h=From:To:Cc:In-Reply-To:Subject:Date:Message-ID:MIME-Version:
	 Content-Type:References; b=PSKR5A8+Ttx9etSVeFyvWDACbQd4v4NYOfjY0jhMYpVVszu5EABII0RVMHdtR8WJKNL7r4l+HR6IP8iq9zjHWetINEprWQPskd+rHp0GvXjrxjKsbaH1KsYERNUkCVZxQ2/wPpu7yndO9SKepCM2VwYKYFaoTSqOt/JcQTf5syQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YBr9Jjd/; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YBr9Jjd/"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20260911021803epoutp01dffb6fd14a10ca3cfd41028af128f319~UIq4T59vg1820518205epoutp01v
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20260911021803epoutp01dffb6fd14a10ca3cfd41028af128f319~UIq4T59vg1820518205epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093083;
	bh=zg3eP0xfFnnvxihTFudnitZKRaskOF78/ArFi6db/og=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=YBr9Jjd/tLDS1Ouh4n/oMQGiWDKNpbGQlREmjEcE+LQxLWn//O1g1A0TucHqfsMSu
	 F8da5vcG1VJxlVfidpL0fdWJJfHkBwiJPyyCOSHtSGfsrbUCMAJg45wxrw2gt9aTX+
	 HiR01uY/4uPMwJQYG1hLb0Fkre8b7JtboM8PPbVk=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20260911021802epcas5p1934405434cae972b5397d63c8a600c57~UIq38BlJh1486114861epcas5p1e;
	Fri, 11 Sep 2026 02:18:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hgyrB4MHRz6B9mJ; Fri, 11 Sep
	2026 02:18:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260910145211epcas5p29abffd4523c683de3ac96c5e4a256097~T-UDI2d8c1658516585epcas5p2e;
	Thu, 10 Sep 2026 14:52:11 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910145210epsmtip27121fb27835bf4e781e8446a54a80db1~T-UBsyo711915319153epsmtip2E;
	Thu, 10 Sep 2026 14:52:10 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-2-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 2/5] arm64: dts: fsd: evb: Correct node order
Date: Thu, 10 Sep 2026 20:22:08 +0530
Message-ID: <1860250540.01789093082598.JavaMail.epsvc@epcpadp2new>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngJYshc/Afimduy14mOI0A==
Content-Language: en-us
X-CMS-MailID: 20260910145211epcas5p29abffd4523c683de3ac96c5e4a256097
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141817epcas5p3ca45b73a93df14f08e47eb9beee485d6
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141817epcas5p3ca45b73a93df14f08e47eb9beee485d6@epcas5p3.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-2-1b755a446b22@oss.qualcomm.com>



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Wednesday, September 9, 2026 7:48 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-fsd@tesla.com;
> Krzysztof Kozlowski <krzk@kernel.org>; Peter Griffin
> <peter.griffin@linaro.org>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH 2/5] arm64: dts: fsd: evb: Correct node order
> 
> Order nodes by name to fix dt-check-style warning:
> 
>   fsd-evb.dts:61: [child-name-order] child node 'codec' out of name order
> 
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

>  arch/arm64/boot/dts/tesla/fsd-evb.dts | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> index 503abe52a81c..a1f3d3fbbf8b 100644
> --- a/arch/arm64/boot/dts/tesla/fsd-evb.dts
> +++ b/arch/arm64/boot/dts/tesla/fsd-evb.dts
> @@ -50,6 +50,11 @@ simple-audio-card,dai-link@0 {
>  			bitclock-master = <&tlv320aic3x>;
>  			frame-master = <&tlv320aic3x>;
> 
> +			codec {
> +				sound-dai = <&tlv320aic3x>;
> +				system-clock-frequency = <33000000>;
> +			};
> +
>  			cpu-0 {
>  				sound-dai = <&i2s_0 0>;
>  			};
> @@ -57,11 +62,6 @@ cpu-0 {
>  			cpu-1 {
>  				sound-dai = <&i2s_0 1>;
>  			};
> -
> -			codec {
> -				sound-dai = <&tlv320aic3x>;
> -				system-clock-frequency = <33000000>;
> -			};
>  		};
>  	};
>  };
> 
> --
> 2.53.0



