Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7213E49EC5F
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343312; cv=none; b=NvNCmM7mOScCwV7PXGzKIb0MA1zpXFcJjI9vFt/iQHsEPFmbRSVzJ4UzQm8ciwYjQ2jkxPd3yGtIEYXeHph90Sl9iKXZMXG2Rn/RXV8svL3e4M+OnC/T/FURzZMN69XLdjqOV33S1NSglgc0pvk1h7NgZ27r/2CHc7tjRDeqLKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343312; c=relaxed/simple;
	bh=IOkG2JYiGgUbv35FbpodpbDiMFbkHvb1Kn+5txFGbuI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g/lpSH6LQHu2ceXchxjW798RjLbcpDYGy/PSeiIdskKIeT65kFSBpbpe9eKPUA+E3dGDW+EXs2cwygPfHkau9vwXYNChyBZHfDK8qVHzpKXxVbUQzZr03qxAAcz/nYuv4n3A8qBK/okEOv89jeMcpMigx/rlEwaW/czansnkChI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cjsDA7bF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGX1NuSL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cjsDA7bF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGX1NuSL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P5IvM9600642
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0+9Tf85hFayM5DW0EiV7Zj89
	MPJK1Rp1eAzmngjUXtQ=; b=cjsDA7bFqK3OHd+oGx6GAVOUEGYvD45zm2KvFsgG
	0YJgRhVUrvSXbjwEwPpPXtpuzwLniqci+ZmetujF4r4xs7MiwmYeLf1NUel4IesJ
	+FL7k+IUFqrO3t5IiHjVJPcD5pDGMWrEY1b9sY9q0GFbHTZh86GLxRc4KPZeAAxw
	AAgIc1K4kxHxmRHRJBuOjNSf4+knAVZ41g+5deen6K/0nGWo6IAfIpkBQsQyLRxo
	fUusKd20SxVunv1Yc772EBMAzBI9yYe7eybcvh3Tos4mm+f6cYYKrz3IEQUAdzRK
	32UpZdvvKCIpprt7MvF44BXuj4JqrZYzLXjHEVy214Zxug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwjpvsg9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 13:35:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0312937eso123338085a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790343308; x=1790948108; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+9Tf85hFayM5DW0EiV7Zj89MPJK1Rp1eAzmngjUXtQ=;
        b=IGX1NuSLevjDVtwXSW53gqEk88KQtfonMSRAs4zGKtWS4yhLI4M1Tzx3CEi63Wio/J
         Emuylsv531WN2fv9LNTunh6DZTFI+IaV1g3Wj/zw+x3I2mE1eXHOamuHN7kABZuJEtq+
         eBulrrSnM92z8klHwmqVxNSS37XlfykK8CqoHgLuHLfaGwXWVCh2LtKStoJKpVEKTwOH
         xKGb12XY1uzO4Eu1R5FicWtD4Bo5PrxIYOLgifkOnvWgDREPdCR1g9HtaFlmgtpqu2Ob
         ku6gnYJpAxzJoU5rs23cJTel85qdV1cCGe7o3/rgZkQPewCGEg+15krpSoPkUCIvWZkr
         +U3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790343308; x=1790948108;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+9Tf85hFayM5DW0EiV7Zj89MPJK1Rp1eAzmngjUXtQ=;
        b=gk7UQHsyBCPtdv4KlWMOAdpQXle6aODy3liho4IF1UlY0sYkdc2T/Cy3UvYfsGHSpw
         GQn5b0R8M2wrSqZdckSvhCsObwfMa/DqoYm0lfpH8RpGqEBG03YSKGs9DQMF66b0q7Vf
         WXIrg6/fDR+3pcqMup9pbMdgh7MBDUGI9zggvYnHWLH6dEGW4kVb0LgRW1V7VLue78hC
         y1H74LNPDIKSB5DFH/i7UndjLf7BFWnhC9rJLCrrnyvvRnHYi9UIoDc/a30DG7iWOKBU
         9zpAPK2iE2lrDkAsjIcMb0um/6K6Yf5HmMKL0aTm7SnKMGMFKH9h0VsEWjRFUuCV0Ls7
         3EpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzuup30ouRA2A6ncIZ4VcLwXsw4M8Yqf75pHt4DZLFGRJikz8dGIZ0L97TEpnubs0LvBMnVijrksZc45z8=@vger.kernel.org
X-Gm-Message-State: AFuF++m9AqzpwXCSQD0NVOt5kWL5sn7wI5RRwVLITrveXZ6vpy75gbVz
	Ql9jkax5w57D21XM29Az3RoL0qjPLmoXEHTMV34d2RbgTsRblVojBFjoImnbbfOTmrLqhGVIUmf
	q5QDH2upA1Hl9aEvVZ2mwCc+HkWPAMS5FU2LKJEIK17gNjNlgPBrK1ymgwH+Gz2uzGS8=
X-Gm-Gg: AYBFou3J1XYols1MLERnrXv8LUxvu2xr4UohyHpaa4eSxubic/9lS8M8tbZqAhY3ayk
	9W0Aq/k4cTV9cMN+W5tu8u9rQvxHGBZUUZvUQLfNEm0XrN7eA4Xm8bpqx5FTUBdIlVfzoRO4lUb
	UKgrl7vYolnWXsIfPAA2yzgofLJ/1+9um5FM7D9kwMNN0oWjoKCed6+6y5flhbK4R9USa0t+/+a
	xbxuxSpOyZbvKvDsXANBBQC28+EiT0K/TeQr/g+x0hRSPlBV8a2l1xPuI1reW03JewXwihhIpHH
	qkwcN9hMU0hEa2Eh20DZfkhRH/IzYMuwK5y2OfU/CfojE+Lizpr736VN+zQky4Eo/kKzpDtU4Sg
	ttg4Fqi+Xb4NNAg==
X-Received: by 2002:a05:620a:371b:b0:937:7e90:ecc with SMTP id af79cd13be357-93c43bf241cmr483148485a.25.1790343308368;
        Fri, 25 Sep 2026 06:35:08 -0700 (PDT)
X-Received: by 2002:a05:620a:371b:b0:937:7e90:ecc with SMTP id af79cd13be357-93c43bf241cmr483141485a.25.1790343307700;
        Fri, 25 Sep 2026 06:35:07 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a6450a3sm6569501f8f.25.2026.09.25.06.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 06:35:06 -0700 (PDT)
Date: Fri, 25 Sep 2026 15:35:06 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] dt-bindings: phy: qcom,sa8775p-dwmac-sgmii-phy: add
 Nord compatible
Message-ID: <arZ4ikxuE3p9CfRz@lore-desk>
References: <20260923-nord_ethernet_serdes-v1-0-f8ac1c487882@oss.qualcomm.com>
 <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Wbcqu4ESfEJos+9j"
Content-Disposition: inline
In-Reply-To: <20260923-nord_ethernet_serdes-v1-1-f8ac1c487882@oss.qualcomm.com>
X-Proofpoint-GUID: EKM6ITW_xWcbVW6MeplkSSSnNAFm1p9O
X-Proofpoint-ORIG-GUID: EKM6ITW_xWcbVW6MeplkSSSnNAFm1p9O
X-Authority-Analysis: v=2.4 cv=aLBlOr9m c=1 sm=1 tr=0 ts=6ab6788d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=XuoYqDaM_I_laROpC8QA:9 a=CjuIK1q_8ugA:10 a=BlIz-W2qHe9yj-0B_l8A:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfX+eQIJoLIs44X
 p0ZaLLpy0H5QOTe9OnitLopwaG7hnzCY5o8fE/kJYHWlrhz5xQYeK0eEFZXcHHgQJsWh99JJqfC
 jtRtdj4PWwIjWCOx84xVngoHBKm/1Dg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA1NCBTYWx0ZWRfXxX2V6HpGNsS7
 1dKNgDyvOYiIyoaPp6zkQ+w98Wlh4RIt3/852tnBvdpITNM32cJjAnl3MiedfJTSFboMg9/5PO2
 PgObzJoARnwXdgAB9zihVsc2SnjU1fLmaN1BD1B05UJPihuxQr5UbLAcARf/Z+ghKDae2xTILoo
 /SgerWZRywcJnU1vHTLCZneCvKURAfMCFbofy9zegrdXsIngExB35APmkNTEnQFOVmxpYZBDZjv
 bnFiNY2mHQl5WIDZzSuT1x2aukAH8FjaHD/B8/k0E8tgj+dFOqLQnW5SvAIEJQ3TIUCL2MLzPeh
 IU/C2N6pvp54qAwrtGIukMYbe8kmqMTJPhXgn6KgBzDfAO9JAaWuWUOOhJNIQcuctCW8xQU+824
 7z1ZLS/QdcVBj8yIj33+BIKhH3m4KgbmqA8YAqA3BcTt2JwP9gYleZQxkUtQed4QwLnWnyucZFw
 7b4t6nuknj7TeNay8+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250054

--Wbcqu4ESfEJos+9j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add the qcom,nord-dwmac-sgmii-phy compatible to the Qualcomm DWMAC
> SGMII PHY binding.
>=20
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

Acked-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.yaml =
| 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgm=
ii-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmi=
i-phy.yaml
> index e573abcb937df914ced25ec87add7955bbba7b87..f2df9983d9536654e838bae4e=
1e23b832cdaea3c 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.=
yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,sa8775p-dwmac-sgmii-phy.=
yaml
> @@ -21,6 +21,7 @@ properties:
>                - qcom,qcs8300-dwmac-sgmii-phy
>            - const: qcom,sa8775p-dwmac-sgmii-phy
>        - const: qcom,sa8775p-dwmac-sgmii-phy
> +      - const: qcom,nord-dwmac-sgmii-phy
> =20
>    reg:
>      items:
>=20
> --=20
> 2.34.1
>=20

--Wbcqu4ESfEJos+9j
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCarZ4igAKCRA6cBh0uS2t
rEj8AQCvog+D/EGZ1bBhQzHnuSy106/aNlu3Mkje9Z9B6bRv4gD8CYovhF1C/+kv
cQcO0DZ9od/rY0vDBhjipvCfqcC+TAs=
=pLpz
-----END PGP SIGNATURE-----

--Wbcqu4ESfEJos+9j--
