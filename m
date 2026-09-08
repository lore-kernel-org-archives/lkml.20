Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA0814A090A
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:46:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857185; cv=none; b=cS/+eMvHpmSrCvUtHwKN4G46yMDLTtoI0TLxuhRig1IEm6I75WsAYlvvgnLPlbPQdse05EwqQch6aaWChTh3HKFBz1JZtb22j8TbamS5HfYN2ZTC3caTYZazDT8557bq88HEEnsDWO/Ldjug8wHP2B2hAJLDSQkZpSdslZBBIQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857185; c=relaxed/simple;
	bh=utzLf/vlmEQYRrCUTZYwl9rhKpbvMCOBl0vcW5bvdaQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J8nJEo1pFUGVgfKfzkqoTSRbo5Uk25GHfzAfRmsf+rniyl9brOjwgMhXb2z2hjOuE0XKs08Rb0iW6X+GzA58OD5PMVnNWIB4Bdi9D0LtoICTtlMSR+0D6fvpGPK8YJ+bjgipg32cU49G6Hvl3Y9BgLBSO+ek3gSbqLcmZe1ernY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SFHyii2m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Oa7UIqAH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SFHyii2m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Oa7UIqAH"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1UM2712332
	for <linux-kernel@vger.kernel.org>; Tue, 8 Sep 2026 08:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XMMJeXnoAXfYPiF6XqiCcv6X6ah8mxOOiGGLqHEPM48=; b=SFHyii2mUS1mS5CG
	AbIXKddF/qLIqvEzIQz3z8iMsRlk4jbOW+I/ossub8eSxWP0acO8c1jqvSfCDgFE
	CnPMc9FhHBZ3YBFShUGzjV36BC+vNK1PUBDYapx2yftc9/tb14uW27eM8QrCZJ/I
	Inb/QqBweCtF8+U743u43gVOYauI9XDgq1g43C89ZzqmohdhEzR7NrDLkmVY/dxx
	Yk9wEF7XNhoRT26LTTMC+tHqX7eMnEaboQx8OSXOw46pr6TsH8HR1+ESZBjjwaI3
	0Vf4Xxq0M+70XAGWbBbg8RoaMZp38TxRHV7FenCp96+lSOsOMIiETiRPy632+OU5
	7pyvKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqmbek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:46:22 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9375d92d8cdso840186985a.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788857182; x=1789461982; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XMMJeXnoAXfYPiF6XqiCcv6X6ah8mxOOiGGLqHEPM48=;
        b=Oa7UIqAHRZU02+KNpV3kqpX7iOBVsQegpDhAP/sAcgQgOGyWj9v2+Ow1BpKWUXDT0x
         G0l1qUe9PYqVoOkN2/TYCjiV+LKcTSS3LqmbLPF7b0nJ6vYfErnDHRog6ObToYOdNB2z
         s2/utIws3s5JSgkB/73sHsTCFUDBgEXJWhkkGI+K5wQlgs61pBDLsW4wy5JyfONCPDQQ
         nqI2FH9k39RIMhZqar+zYAGHnOcPoJL53M9YIyzgPdoogTR5n0ow8wjIlKUqsLw5rewC
         dp9BxQauvWSfELrbQTedvZuQQuu72vjCUlqgBvbWTlEg0GpIOfI0epcWPCisdRSJzsL7
         RPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857182; x=1789461982;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XMMJeXnoAXfYPiF6XqiCcv6X6ah8mxOOiGGLqHEPM48=;
        b=hOJla+CZu+Rkgxrupj8BjH/7c9+8Zg43o/xP3RheiMWW6XTWhdPUGUFk+8YypqXqjk
         NSfwXtSCRsC12vXaIViQ4x4UgOeIPrG4qk0kA6g7IQO0h0TR7kaZsFUAmYcWl3KfrnXH
         1Z3uTrU1v/E+JXCjY/e5k2Pg1PaHiq+IGQYNuHXfQit1CZjcnekKcWNEKoZXbfDTQlHQ
         PhVPXU1P5zrXFjf37Z1LfZfQrE+IHrM1b9Qpq5Oa6jEpGhTbk6TwTzD/Q1nLI9M1vBit
         aOKteJsCYshbPY+iCHPqaX0ZnCxaU52yfyrRbpllqWyoj2fVl/wyXJJtFdrTn8qBFY7V
         cXbA==
X-Forwarded-Encrypted: i=1; AKwUvByWeCAA5vcqp/5kPVMRuHsYxiYFOFoyI0nPQSn4ArT76jribej+nVRTYOwue2WXOdpK6ZxyDXNkXptchCY=@vger.kernel.org
X-Gm-Message-State: AFuF++kxDqF46RrZqSY55xxzFzrn9yubokgPwXGNFob0blHXgCV2X2qm
	bUpUapeDjxW8beJ1bfiDb8mYoO4BlTrwNgjrKlzF7m0YqmL4Ntc3KJaGUPb4ROvCVU+xtbj1+qn
	N1fJOLkD9EJhaBDVz8wWXzk38fbR9dCDuMqXWaPLbgjm95+7f1Zz8zPrp4wxvV7tSoUk=
X-Gm-Gg: AYBFou33ATz7tUOx8mkjs8Gr/Kkwa/RESjWS7BYAD5y6g6mavIBrA7Y67hj3BnGpLPt
	oYuD2+MjWsrYVnF27kVJ5f+qhH/ox/xHWerSETcA0JJSprDv/bQGIZvr78OYwqPyP/i2sEBM+nx
	NUFOUUK9z+kFOeB7cHNnejK5t90/dGIRykFO27WLXiVy/ZTTxHs4sRwDHejpubj64unLBK/RH6N
	woP7nBJGP1WEU0+JY6JIXAUT3KBSdmGH7Ig/+H3i5CZr6vhN9DuCmuwQtXG3nckjVwKkIgf9Vna
	0DDEV+/bG0xGcMXlpKhtuPDCEOzrJD3y2t7VYN79HywhK4Z7+NvEvG+Im59xXCyLPQhY6O7tNR2
	N+BqP+rkhs21qkj1F420/bBJ33+dIYMW3ovHxljXxPYAbI/XCdH0CrsHXaLuyIDA=
X-Received: by 2002:a05:620a:f0b:b0:939:a1cc:f234 with SMTP id af79cd13be357-939a1ccf31fmr1467896685a.5.1788857182063;
        Tue, 08 Sep 2026 01:46:22 -0700 (PDT)
X-Received: by 2002:a05:620a:f0b:b0:939:a1cc:f234 with SMTP id af79cd13be357-939a1ccf31fmr1467892285a.5.1788857181484;
        Tue, 08 Sep 2026 01:46:21 -0700 (PDT)
Received: from [10.38.244.120] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb62710sm1098621985a.28.2026.09.08.01.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:20 -0700 (PDT)
Message-ID: <4c43c80c-d8c3-4738-9a5f-0b3e1c19679d@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 16:46:14 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/13] arm64: dts: qcom: x1e80100: Add CAMSS block
 definition
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
 <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-5-067f2ecc4630@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA5MiBTYWx0ZWRfX/6EKUQYpnRV2
 9AHNKxbzhmLVC1cJ8M4UYhjr127f3j04X6kUZcDTZ/zMVkg+5PZWHP+gYZbk95jZkemQRHbje6U
 p/mZuHMy3+Dwrv90/gqZPHIBsjZaEXS1rsU99+g7Q8NSFGZxqwEvlcfdEA8pDYu8eeyHpeKQkYZ
 bPveJFMEOX6UL4RcUbLKGb6Y7Hz/PMIWRQxDiWPVQCEtJfF/LlvIdITEy6IJ3E0wLRQOKAUF7kk
 C4M9c8JxWUzmaw8+7N43yZU1zsL5VF4t8FXgrk6XRP/j1uAXpumi0hD37wgKc3n4lA1apUPq0/i
 rhKRLmykHZSjMat2cSnv5ZmMo8zGq3lu30UnM8ixfg93gG6mue78mDed28IRgZaZNr3NFj4g0qN
 ZGhKzfcxZOa8lToDnv4/O1P/Ob/7815vHQYoRmWdQWkjhLtoWsmXYdeC2zfgi82q7LL+lszOtv1
 0NENre/iKVmhuwDy/xQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA5MiBTYWx0ZWRfX7plb+ksNYA52
 Y1Fw3C9qnLyoAOYY25+qgonWv7mqXAxNSeOdXeLh7cdoQQg16nX9KONIa/d+TtV1GG2HWCc0Fzs
 tnz7EpJakR3XIgwlhqUa7myi0CKr2Js=
X-Proofpoint-ORIG-GUID: h2-09K-N5xnuMHe03gSjgk66JgE-IOia
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9fcb5e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=KKAkSRfTAAAA:8 a=-P7vb124-MV0i9wHP64A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: h2-09K-N5xnuMHe03gSjgk66JgE-IOia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080092



On 9/6/2026 10:20 PM, Bryan O'Donoghue wrote:
> Add dtsi to describe the xe180100 CAMSS block
> 
> 4 x CSIPHY
> 3 x TPG
> 2 x CSID
> 2 x CSID Lite
> 2 x IFE
> 2 x IFE Lite
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/hamoa.dtsi | 322 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 322 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index 9a854da9550c3..75366afd1b5b2 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -16,6 +16,7 @@
>   #include <dt-bindings/interconnect/qcom,x1e80100-rpmh.h>
>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>   #include <dt-bindings/mailbox/qcom-ipcc.h>
> +#include <dt-bindings/phy/phy.h>
>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>   #include <dt-bindings/power/qcom,rpmhpd.h>
>   #include <dt-bindings/power/qcom-rpmpd.h>
> @@ -719,6 +720,50 @@ smem_mem: smem@ffe00000 {
>   		};
>   	};
>   
> +	csiphy_mxc_opp_table: opp-table-mxc {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
> +	csiphy_mxa_opp_table: opp-table-mxa {
> +		compatible = "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz = /bits/ 64 <300000000>;
> +			required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz = /bits/ 64 <400000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz = /bits/ 64 <480000000>;
> +			required-opps = <&rpmhpd_opp_low_svs>,
> +					<&rpmhpd_opp_low_svs_d1>;
> +		};
> +	};
> +
>   	qup_opp_table_100mhz: opp-table-qup100mhz {
>   		compatible = "operating-points-v2";
>   
> @@ -5629,6 +5674,283 @@ cci1_i2c1: i2c-bus@1 {
>   			};
>   		};
>   
> +		camss: isp@acb7000 {
> +			compatible = "qcom,x1e80100-camss";
> +
> +			reg = <0 0x0acb7000 0 0x2000>,
> +			      <0 0x0acb9000 0 0x2000>,
> +			      <0 0x0acbb000 0 0x2000>,
> +			      <0 0x0acc6000 0 0x1000>,
> +			      <0 0x0acca000 0 0x1000>,
> +			      <0 0x0acb6000 0 0x1000>,
> +			      <0 0x0ace4000 0 0x1000>,
> +			      <0 0x0ace6000 0 0x1000>,
> +			      <0 0x0ace8000 0 0x1000>,
> +			      <0 0x0acec000 0 0x4000>,
> +			      <0 0x0acf6000 0 0x1000>,
> +			      <0 0x0acf7000 0 0x1000>,
> +			      <0 0x0acf8000 0 0x1000>,
> +			      <0 0x0ac62000 0 0xf000>,
> +			      <0 0x0ac71000 0 0xf000>,
> +			      <0 0x0acc7000 0 0x2000>,
> +			      <0 0x0accb000 0 0x2000>;
> +
> +			reg-names = "csid0",
> +				    "csid1",
> +				    "csid2",
> +				    "csid_lite0",
> +				    "csid_lite1",
> +				    "csid_wrapper",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csiphy2",
> +				    "csiphy4",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "csitpg2",
> +				    "vfe0",
> +				    "vfe1",
> +				    "vfe_lite0",
> +				    "vfe_lite1";
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_0_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_1_CLK>,
> +				 <&camcc CAM_CC_CPAS_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_CPHY_RX_CLK_SRC>,

I think we should remove the SRC clock.

Thanks,
Wenmeng

> +				 <&camcc CAM_CC_CSID_CLK>,
> +				 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
> +				 <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMERA_HF_AXI_CLK>,
> +				 <&gcc GCC_CAMERA_SF_AXI_CLK>,
> +				 <&camcc CAM_CC_IFE_0_CLK>,
> +				 <&camcc CAM_CC_IFE_0_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_1_CLK>,
> +				 <&camcc CAM_CC_IFE_1_FAST_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> +				 <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +
> +			clock-names = "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "core_ahb",
> +				      "cpas_ahb",
> +				      "cpas_fast_ahb",
> +				      "cpas_vfe0",
> +				      "cpas_vfe1",
> +				      "cpas_vfe_lite",
> +				      "cphy_rx_clk_src",
> +				      "csid",
> +				      "csid_csiphy_rx",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "csiphy2",
> +				      "csiphy2_timer",
> +				      "csiphy4",
> +				      "csiphy4_timer",
> +				      "gcc_axi_hf",
> +				      "gcc_axi_sf",
> +				      "vfe0",
> +				      "vfe0_fast_ahb",
> +				      "vfe1",
> +				      "vfe1_fast_ahb",
> +				      "vfe_lite",
> +				      "vfe_lite_ahb",
> +				      "vfe_lite_cphy_rx",
> +				      "vfe_lite_csid";
> +
> +			interrupts = <GIC_SPI 464 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 466 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 468 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 359 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 465 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 467 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 469 IRQ_TYPE_EDGE_RISING>,
> +				     <GIC_SPI 360 IRQ_TYPE_EDGE_RISING>;
> +
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csid2",
> +					  "csid_lite0",
> +					  "csid_lite1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csiphy2",
> +					  "csiphy4",
> +					  "vfe0",
> +					  "vfe1",
> +					  "vfe_lite0",
> +					  "vfe_lite1";
> +
> +			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
> +					 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
> +					<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
> +					<&mmss_noc MASTER_CAMNOC_ICP QCOM_ICC_TAG_ALWAYS
> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc",
> +					     "sf_icp_mnoc";
> +
> +			iommus = <&apps_smmu 0x800 0x60>,
> +				 <&apps_smmu 0x820 0x60>,
> +				 <&apps_smmu 0x840 0x60>,
> +				 <&apps_smmu 0x860 0x60>,
> +				 <&apps_smmu 0x18a0 0x0>;
> +
> +			power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
> +					<&camcc CAM_CC_IFE_1_GDSC>,
> +					<&camcc CAM_CC_TITAN_TOP_GDSC>;
> +			power-domain-names = "ife0",
> +					     "ife1",
> +					     "top";
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +
> +				port@2 {
> +					reg = <2>;
> +				};
> +
> +				port@3 {
> +					reg = <3>;
> +				};
> +			};
> +		};
> +
> +		csiphy0: phy@ace4000 {
> +			compatible = "qcom,x1e80100-csi2-phy";
> +			reg = <0 0x0ace4000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};
> +
> +		csiphy1: phy@ace6000 {
> +			compatible = "qcom,x1e80100-csi2-phy";
> +			reg = <0 0x0ace6000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};
> +
> +		csiphy2: phy@ace8000 {
> +			compatible = "qcom,x1e80100-csi2-phy";
> +			reg = <0 0x0ace8000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxc_opp_table>;
> +
> +			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};
> +
> +		csiphy4: phy@acec000 {
> +			compatible = "qcom,x1e80100-csi2-phy";
> +			reg = <0 0x0acec000 0 0x2000>;
> +
> +			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CORE_AHB_CLK>;
> +			clock-names = "core",
> +				      "timer",
> +				      "ahb";
> +
> +			operating-points-v2 = <&csiphy_mxa_opp_table>;
> +
> +			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> +					<&rpmhpd RPMHPD_MMCX>,
> +					<&rpmhpd RPMHPD_MXC>;
> +			power-domain-names = "top",
> +					     "mmcx",
> +					     "mx";
> +
> +			status = "disabled";
> +		};
> +
>   		camcc: clock-controller@ade0000 {
>   			compatible = "qcom,x1e80100-camcc";
>   			reg = <0 0x0ade0000 0 0x20000>;
> 

