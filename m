Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918D94A8438
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 13:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440792; cv=none; b=T6xpdiFhebMzSgoRhG4BlkZTacfsCET2+bjp55aC+jFTUTj2pcL+Jme/rREzRQ+1Yz4v+2vwRycucjqjdbgRfObDC4m4jaS9FWkzFkVN3kAsWN4ggYuBRGEBit5smPeD17mKJC7v20eMVuiZEDr4Qapf4+PpUY5BHhOrovPDWjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440792; c=relaxed/simple;
	bh=04XyEh+0Ry3MVpSq+udwOknhTIYoiMJgQkAcP5KbKek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tR+EvgwDSQ11DhPRMMsHw/5gyuN0x1iE8u0S3So7ETx9XuWnqrHvn9sDttIkNcs66zie2/7ALax01/Anq05kGCuC3LyOPahRCUUPARQ5CjQGMmXhTNbCtk2WK21kTGZh6+fwkqfH/ispOvprnnQ3LbpDFBGmef0O/54FtCV4fKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IaWlyzY1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=faLPkkqP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IaWlyzY1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="faLPkkqP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHHRG3782437
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 13:06:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=; b=IaWlyzY12P9l1GMw
	9U2SQhAom53GwB1EUXNjWsXUUlzKvFc1iJ+040NiqQpqJRJqETi365kQ8mnyMrDb
	a1GaOhKVfJwM8L4BvsLPGAitCbS8/h/WdLXRx0fLBFk3ZkfJJ12oDpGf7A02thKQ
	6N3mG3R8oMDXWdBQtFpOXLSaeFcuvey9b6Ycgcgl/fyEuBV78KOq3OIymIbK8/p7
	cac/W8n4wF1OaLatT/PCZ3rFPL/KR164Einbp3N4H/2eVpc6Wazsjul0jMjQKhXa
	iLt67WC0u1ooLFb+cvJG2lU4t6LZ5BEiSpUzIRlNwt1PQ2TnGXRi5XMroUQQhJUU
	+mEh4w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pds070-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:06:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8a7ae2c2so3888076d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788440774; x=1789045574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=;
        b=faLPkkqP71bAuYGFvHqd0hsxu/fNnGZAiw569ofF7t5QnXEX3GO7rC+YYogF/GF0Lj
         bbr13MJ9Tg4cCJYZEYVsVojQQBJFr2o+To3UnPHrxXJsOP6EZvFwgswzxqwIspmITUjZ
         KsirBm0bH6jiG2ityHgllD1Sej9S4wzNj+DUMHqTjRjnkW1Mck+6uenNydrCGeuCAytT
         30JWORjRZzxjmeE0z/JU4x6+jdyTJ6Qx3AumgehJBafPuPycTN4s4aXpe4vGrSRjmsVX
         FrFI1kBKZ9Q+XH2i3uiOIiaUdDkNVN93GzE660ce/rf9UTRd58OOPtK9m+D2RXxix3Ii
         bLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440774; x=1789045574;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i7X7VOXCOH0N8gUFf/UKEI8ds/3ghWLhJseA8rCyTEM=;
        b=lAACCk6QsH772IsfgrCOOVuJpib8/LF7wrls0n/jj9X3RPk3ER3PfiOYnJUAkJSXrf
         KC6SCSsKKK3TguI5zqlBdhjbPiiTJCYEwJH4dyC9ifdv0w3kwtqjpy4szead3DSwNRq7
         M1R/G8H3h1tiHe8OZF3jZPDTKxyc/5NbZv29LkVbp39pbw8ZlDxWtwkV2o1u6vPZV6n6
         BDCIMpRL/3zNsf5xl5DAQ+rsJDfXdVyqIxT2m1JRd7KZXYlkmPNl7TiOHxFc+XPnRVGg
         bdDJ0tFTHp3ODnGhnDNu5R85ZDJjgyWqKOH43vURFCQyy48GTd/HNUv/nzRAzH/px0gf
         InTA==
X-Forwarded-Encrypted: i=1; AKwUvBxRZ79yLGYf2HzO3AaXxlnV3npQN8DLYar0m7WgQcfxlqrGToNXdPkdkvWdAHDPVGalbNxYOC/Jfagf6IU=@vger.kernel.org
X-Gm-Message-State: AFuF++mvWcAlYq8dy4VgH+ttHbk98EnfTUdorbbtyn0QT4exrnCDE56j
	iXGR5LVQsyg7KnamVOy98yo9II0/Zux+iAs0iNI+4KwfNCxsNU+DSmnt781LIQ593tE+Okb2aHt
	XQ0FQHMsFI2SP5aobqimIwmWxDITYIX1s993kq61b3eN8bJMUdgiS/2XhDVnsHB/+vZvFCZOCNG
	0=
X-Gm-Gg: AYBFou1Wij9wv5jajOIVqCoiRSThPF6XU9NAdm3slfBYFkEEx5tk+3maEC026rYYckP
	zp4kmx9sH0s6VNnmqQxZJ0Dk4VIRhXK374Il4+hzqpqHWeKvW28iyvb4+DoKDhmis14noLqrzQB
	p/Xtwy9Lee5p4IvxLVe8lJ/aA3oX2tchnL+/XLP6hfOjIPDgDyb7f/3dlrEE8vo1/HiUHxzDoFI
	k395uPSC16ZaaioJyNdXlm4qDXS2bUh2CJbvk19bzoq6QFkKGM1Hb00Y4uiHO6k3dBKBcS9yKRe
	9k2/aLjTV4vVVzunOWNjdKJib9pbAiV0JaPQ0DBCRHaHTcT5itqlciGW8zSmQvnKP3Y4lEKrmbH
	pPqlaZuJg/EvYsJYRilrN4g==
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr87718301cf.2.1788440774044;
        Thu, 03 Sep 2026 06:06:14 -0700 (PDT)
X-Received: by 2002:ac8:5a09:0:b0:50f:a53b:9d5 with SMTP id d75a77b69052e-53036bb138bmr87717631cf.2.1788440773501;
        Thu, 03 Sep 2026 06:06:13 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a67f9565bfsm2309145a12.30.2026.09.03.06.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 06:06:12 -0700 (PDT)
Message-ID: <049af81c-d05d-4ce4-9627-8b2212979f4c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 15:06:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: lemans-evk: Add LVDS display
 overlay
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
References: <20260813-lvds-support-v2-0-6b11035e8ab0@oss.qualcomm.com>
 <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260813-lvds-support-v2-1-6b11035e8ab0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfX3z+LEJnQ6GM+
 UajwlvWWRcO3CbWsxTWE6VBvaVbJps/roxafZJthV8FJyDTEZIJTacfOiKOrqvohogZSZHI+WSC
 ZAtAwHzr1gVFBS2n+VmgSJougQgZ3/M=
X-Proofpoint-ORIG-GUID: vm_etU-1KxdANULJ9EVDtiLckUoqfXc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDExMyBTYWx0ZWRfXy2sct+DuN5E0
 pjCjw5qzopHx/Q7vKFyzCHAJALW0mSpDicj/5J/tyRLOvQK6g0/yLbCprVWxUpO2QWmdD+EBQlF
 eBULGlKB3bERElRuXx8uoY9iMzGLbIdu/DQzmoGy7L76GDeHNCU1QQ4t5k9Fs5oktM2JCBblyWA
 L2jl0l/j/EI+hHYNcrIjYGUlnmFLpjtxBkg6N/YqyU2iWEVa41YzLdxs4hU4M3T3CwpuCK8YWjb
 Co88acLvtUcl/FGeC6WC7MP73L5Keo+rMcmjjkwcmpl/EDwfIeCcB7nW1IBBiKRBvd7mORHol9S
 bwauFp886HcbPodchVNObWSmI7Pr4OYlgvdZpzybIanvKyV1Ih8JC2/dbF9vWN7dNIItQ6jRgna
 FzDgJAfPXDaF7SAXhCvh7iHLAz4aVzuG3MlLU7WC2ps9MdbGj+eI872vwr2/BKczm5XaEzl+O9H
 CEKn3Dn+3/GngV1QCiA==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a9970c6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=cQV133JH40Yl1OylBfoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: vm_etU-1KxdANULJ9EVDtiLckUoqfXc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030113

On 8/13/26 7:33 PM, Vishnu Saini wrote:
> The Lemans EVK IFP mezzanine supports LVDS display output using the
> Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
> DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
> VESA-24 mapping.
> 
> Add a DTBO overlay, lemans-evk-lvds-boe,dv215fhm-r01.dtso, that wires
> up the LT9211C bridge on I2C1 (address 0x2d) with reset on GPIO37,
> a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
> panel-simple-lvds-dual-ports binding, which supplies the panel's size
> and timing internally), and an LCD display bias regulator supplied
> through the GPIO expander. DSI power is provided by vreg_s4a.
> 
> The overlay is built as a composite DTB combining the base
> lemans-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.
> 
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---

[...]

> +	panel_lvds: panel-lvds {
> +		compatible = "boe,dv215fhm-r01";
> +		power-supply = <&lcd_disp_bias>;
> +
> +		status = "okay";

Nodes are enabled by default unless explicitly disabled

> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +				panel_in_lvds_odd: endpoint {

Please keep a \n between the last property and the following subnodes

[...]

> +	lt9211c_codec: lvds-bridge@2d {
> +		compatible = "lontium,lt9211c";
> +		reg = <0x2d>;
> +		reset-gpios = <&tlmm 37 GPIO_ACTIVE_HIGH>;
> +		vccio-supply = <&vreg_s4a>;
> +
> +		status = "okay";

ditto

[...]

> +&mdss0 {
> +	status = "okay";
> +};

The DT which you overlay this atop already enables it

Konrad

> +
> +&mdss0_dsi0 {
> +	vdda-supply = <&vreg_l1c>;
> +
> +	status = "okay";
> +};
> +
> +&mdss0_dsi0_out {
> +	data-lanes = <0 1 2 3>;
> +	remote-endpoint = <&lt9211c_in>;
> +};
> +
> +&mdss0_dsi0_phy {
> +	vdds-supply = <&vreg_l4a>;
> +
> +	status = "okay";
> +};
> 
