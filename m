Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9009A45D903
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789113560; cv=none; b=LHaGPXHiFbiTbf3uEv+tajcJ2gPUK4Es+2rlhKMoBHLmC2Xzg/a5eBxmThnAuRec/4XuGeaom4JZwGjKHGu3Ul+gtYAQPGK/ctG0xG/0/+AX2Eb3tKnR8xt9hAtRj5wy4uJ+q/J2Ci4EDYDzWP7dQHq//2BuUzfR2haeFQg3+dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789113560; c=relaxed/simple;
	bh=wS+UZgMsfZshYLMMeKsNqXdGiAbQ2UhFZFFve51dv4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Avwf+nTXZ2uAG0cmTccrZ4YHjgfGbEtM4vhw4ADYLA14kUCLIdODyHgB8RPZU0r/y8TzNwrSm/2+U4Oca4xtk5AIQpYVDMivZC4gszc054SRuy/e24AJwMdxqHFLEUDRVBTi1qKntFl6q117DZbfIdGly6Q84CQ6phDfLnkrudQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KggMcM+Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P9ju7RUM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KggMcM+Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P9ju7RUM"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kh2j3844988
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ev/gSonR3enDh7oNOrxayRO0
	dQ7G3IRgYUf6IT1P+vc=; b=KggMcM+QYPgQmdVELOJAHyfwY8HdlXCXNd8IeRaz
	yogAQfN+1FoRF80rf7ZN7XR+qxQqndoENveRX0jtkPiBoxBag0/4T54FP3ERWJpU
	wdbZXVPltW8WQHd4JkkrxsHXw8WE7pYrXpNkFsFJ7fcpEexczoMXVl9QHqcpa4wl
	Gxo6IsZfQV7hlVGXN8vwwFzaFLXyzeZe7uVhBx7+b26hvJCF46yeoEv89nv+5Mgq
	eV0Up1iaOFvvo3/bO8Azz0QmfemSDHQPFR5tFrC+LpjprPLOLWfKKAzL3IaR9YjK
	dJ8JxTRr9GodTWGIf22AQYka2Lr7GySSl5Maf/tDQ7TE4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm5q41t5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:59:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934963b2bc0so118267385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 00:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789113556; x=1789718356; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ev/gSonR3enDh7oNOrxayRO0dQ7G3IRgYUf6IT1P+vc=;
        b=P9ju7RUM9WlrLAcI2+igDLYDS2hq4uGHip4kb3nnzuQlhyTq2URkHLzqqu+H9LfTvo
         0uNY/ELLfWIViXbo0kfH8f4FysyHgh89YJD1L289OLzN+HVN7s2pI/Cp3gLQd48SobTv
         KW2p8cud/vciqbXnR/IWT0dB14kr11ZGnfjeIHX+FUmB1jI/yfPzHAKU9A64YU8sCjVU
         vd1V9FX8Mlg8N2tbVM2AETaXqeku2J+6tv5yL6AI3HajBU9yLqukbdWxnNx7Eiu+AKKi
         wUyFvYd5nUbxEvI6F1+rDELFQSIvYgkwcN9GK620Q03o9yKVh8eg3VwEc7ujoluDA49G
         aiTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789113556; x=1789718356;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ev/gSonR3enDh7oNOrxayRO0dQ7G3IRgYUf6IT1P+vc=;
        b=HZwQRKtdeeQABfNka0EBBtUfeWqq+QfJ1e3lncEy2C6k/Y8ZYePKZsYPb6E1mj7IBT
         6b+d9MV1pxXBPg5EXzzANq7Y2YJKKihIdpt6GLvaKt6zxYJTlMhbIbk1/5lAYZ+Ne42c
         ppymhnXh0yX+MGJxwv0l7lNVRI0oGoa/Dn893j0otPUyT3mLtObZFIgPtoC3DMUmB37i
         n3H91FmcfeiyfCobx6KYROeB+Ni2eoB9Q8F8X0SaC4oUxmaJj46Zs/bLI/Fhr72X+lM1
         7S9m8eLTATDKtl0QU3ANwlz1LHuyBx9LEsCcOTlBATlSpFIU7Rf8UPy20aA551tcyNuw
         VSiA==
X-Forwarded-Encrypted: i=1; AKwUvBzZMhMkp2BIYQTcJcWa+/6qzL/65XfrY6fxuk2l0dl1JUEfXgXrGGRvrI+8Re6y9AsJh0ckiBoT6uMEJrc=@vger.kernel.org
X-Gm-Message-State: AFuF++lO3IjxxXykNg85iW5GG60l9cr8QzOL9qeJiAgx1+vOMS38rm5V
	ffAsS71kdcvL5PzKY8TwmDU7SBEGwQisIygIgSZ2/xQEYKSiGChsfcLot5dTPuZ9O3HkCW2F8/F
	DmEurVQLuQmn2uR2GUFCPblatCLG6hbd6ZsosgpXzmoJhId78naPs6NrQiHYnlDAcDwI=
X-Gm-Gg: AYBFou1SWnfZh7czJxKiWJanfqpfDWHmNfd60Zgmr2mrRUoAN1C0raQzfVEMjq0zLpa
	6D/KCN8S2mxxDpPJtYkJy2b1hCNY078NBuyltT8aTbs2NpKDDBEkDfxOCY8iIRXUh+A5xNdAUMp
	Ed/LCayF1RFjV7V+9dUpmv9tsrgE7Nmk0UjOF/TurDVVRXr8tJ0y0Sf28lP0/izQKD4ajsKIe0Z
	muG5btWNVkMv9syvEiieQhhfqN5FzJUNyfV0IaXRKKHQc4Y2xsLCzPXRcfvZ2v5/dQxhqgcmqQu
	Vgg+gnY13p07iJyS60R9Q5x1LTIDaRQ+meOyeAtErbIQ/bjd4VFau7oFeELkJNEHwETfItkb9FR
	tO7qw1sD2g7yncIk=
X-Received: by 2002:a05:620a:4546:b0:939:57ca:7e08 with SMTP id af79cd13be357-939ea037874mr369307585a.2.1789113555570;
        Fri, 11 Sep 2026 00:59:15 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:939:57ca:7e08 with SMTP id af79cd13be357-939ea037874mr369304685a.2.1789113555010;
        Fri, 11 Sep 2026 00:59:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm3681657f8f.35.2026.09.11.00.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 00:59:13 -0700 (PDT)
Date: Fri, 11 Sep 2026 10:59:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Subject: Re: [PATCH v8 3/3] arm64: dts: qcom: shikra: Enable USB controllers
 and primary Type-C support
Message-ID: <x2kka6ouwalb54bv4hxszoq2qdbctp3gx7qholeerxvbicrxwb@ww5rf7tnjaog>
References: <20260911-usb-shikra-v7-v8-0-851ee4bc0eec@oss.qualcomm.com>
 <20260911-usb-shikra-v7-v8-3-851ee4bc0eec@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-usb-shikra-v7-v8-3-851ee4bc0eec@oss.qualcomm.com>
X-Proofpoint-GUID: j0Q7vtclceOvdTb4qHahGLSIh2hofn-b
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfX6RSkIk49RCCG
 kcg7wRi4UbC9t/gsSM+XkqBP5skSz83ZNGeIgiT04OSoPQ9kABE/LPKqK5cbgiSgkxljEJpsJNG
 mo1Y57+EQLR9wCUMesKX/961srPA4qA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDExMCBTYWx0ZWRfX8gCsXdVToKyL
 69baXz0vIBOU5cOh/wVRmgCij8Ya6/vKYISiVdsG2JvfSXTmuirBiy7mQaRZmFloCyMN/lAnJff
 kFg9AqjG02ZJU0QzLsB56QXLR3jw/zuMrxmOoPuMaWe1SXwy6PauR1sQhMUguJSlkUTZG1/qXU5
 S+tw2g25j9EsklFBQuFf4goiZT+LDpC24wEJ64M2QwRRjbU20lYPCXTdjUFhtCY7W1Zd2AhxIFl
 TxlfwYVzcEUJ4e9m013TykhmrDOdlgzBpcgIpumbY8niPqO7DJ5BPgBPPZEBuV0QJJWVqzVhRIF
 f+O16OpAnyA+CpM451FdbYxnbUS7LN9CnjDWr5MPcEeDGg5Y9kAnT9gEmi3bydN3u2OsdAEU8x2
 hZFbVnEAJ/TJTE+TQmwRy4M0UX5krX+aSXPFHsGBo8O7pYqoYPIIviiUH2CPjIwRFDwvud6a6pQ
 SBTCRa4/afUc4jEc5kA==
X-Proofpoint-ORIG-GUID: j0Q7vtclceOvdTb4qHahGLSIh2hofn-b
X-Authority-Analysis: v=2.4 cv=Wsa+otfv c=1 sm=1 tr=0 ts=6aa3b4d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=pLJJDYdFoZai2w-5wMIA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110110

On 26-09-11 11:37:20, Komal Bajaj wrote:
> From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> 
> Enable USB controller nodes across Shikra platform device trees and add
> primary Type-C controller wiring for CQM/CQS variants.
> 
> - Enable USB controller blocks for shikra-cqm-evk, shikra-cqs-evk
>   and shikra-iqs-evk
> - Add Type-C support on the primary controller for CQM/CQS boards,
>   including role-switch and connector integration
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  | 43 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 41 ++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  | 43 ++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/shikra-evk.dtsi     | 12 ++++++++
>  arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 23 +++++++++++++++
>  5 files changed, 162 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index b112b21b1d79..286ea46d0c36 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -23,6 +23,14 @@ chosen {
>  	};
>  };
>  
> +&pm4125_hs_in {
> +	remote-endpoint = <&usb_1_dwc3_hs>;
> +};
> +
> +&pm4125_ss_in {
> +	remote-endpoint = <&usb_qmpphy_out>;
> +};
> +
>  &remoteproc_cdsp {
>  	firmware-name = "qcom/shikra/cdsp.mbn";
>  
> @@ -57,3 +65,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "otg";
> +};
> +
> +&usb_1_dwc3_hs {
> +	remote-endpoint = <&pm4125_hs_in>;
> +};
> +
> +&usb_1_hsphy {
> +	vdd-supply = <&pm4125_l12>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy {
> +	vdda-phy-supply = <&pm4125_l8>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +};
> +
> +&usb_qmpphy_out {
> +	remote-endpoint = <&pm4125_ss_in>;
> +};
> +
> +&usb_2_hsphy {
> +	vdd-supply = <&pm4125_l12>;
> +	vdda-pll-supply = <&pm4125_l13>;
> +	vdda-phy-dpdm-supply = <&pm4125_l21>;
> +
> +	status = "okay";
> +};

To keep alphabetical order, please move usb_2_hsphy above usb_qmpphy.

Same comment applies to other files.
