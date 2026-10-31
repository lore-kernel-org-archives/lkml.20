Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793442020;
	b=04+x2+LoFxVm+r+3czv4Vg3jep2GnQV+u8dZRG01BgJ2YhfHt4Z+Llr+4fwzTlBisf1h
	 pC3t3Z0Zc+R5xNInuZ/alrAC7pJdRT1w83pCj9Ews41pHAmWU3odu+sr88++DbhvL8Td7
	 a0/AT7AHe741/p/CtsJNWGtX/2KSaEaS1qf4d5VJ5tvIqF9Nzq6l21pu8DAKxltRSWlmN
	 ZBvSWfZE7Rn+w2S/hRMnbrW6jwV7KKI0OQFOfEkFe3y473Z+B+0lY2Uth8QOop3yovFKY
	 8iPizq3wx2rnvOi6MP2xXHfmmf2HFYV2kam5GL7Fz6zwGzY8FMnFZz7XhCQPfd2E17g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793442020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
	b=mfCKCKgLpE1Lr4Jz/e1pB2MGDRnAUSIRI8KEJFMYO1PU8gXM1R6BJWu1NAhnSKCKJGQ2
	 4qjr9xbej0/wfYdMosJG1npjhyteQ3gEBKcIxTYKhw9vU42m3r3NxxaM6nBcQzaQ1pir+
	 edTUEDCXo53Xd5ohmHkzN6YZ2R+X5nmp0JE/Q7UyML3sDq5JBHjmZqhSaHTfqjtOMrBDe
	 IifOdp8SzwSgRAJsbJ2KuIbgpmAt7HTIxoZt5M/FCGKhiokVwsidQhJe4bkRB8aGQPIsP
	 JkWm+brY6GupyOFZeFh8j9pkLb9EvNSPyVas8i2hjSu8bF6NabooITToJ88uSY+3Zsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nND2hnLI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AG610c05;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE92606A31C
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CE92606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nND2hnLI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AG610c05
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4a4Gk1128173
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:20:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=; b=nND2hnLI1zEmWaL2
	vU3AomLNPXjNN1HorhEpnxVZSJIFfQTsdEw8Ld6+Hri78d95Q7MWpxSsTkAGhJIN
	3jdn/xFqzWggkAJvnHlKZUuFOXQiwS/uCiB2W/uoZCHy0kaKvUv6jS/Ti+z9HRpF
	Ri1S7DxwoOocwKPtD8C7X2A+lCvhIt5LhlpDPhS4g0i/paIdHxugc+tzoG1TBM3a
	hbRYViQwhA1x6J2L4Dt2E/mHgLsVnwUqRhYQ/EzWmeBtfRhWniC7xWtZGCWP1dqm
	zEJDR9EZtonG1p50YgAZpqNMPa1MYRsM067TKa4U/YkwKLlc4V3RYtz2V93rrMIz
	TVWhrA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8j2rvu0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 10:20:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a26fe9521so2445809eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793442018; x=1794046818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
        b=AG610c05GoT18y5MVWA+416UeTPBEFN3OgMRRLYAB6MFujaGqfdT3NwXouRmkzXVP9
         bix96VeOztuEOA1VJyM9xvD08nZcpcxG5BL1L9MI4QQiTdN8O73ILzyqF+Wkf9GamE21
         xvbD06+yO7w2owpUJ9E85CTgSlxrTgfDfAFmhquaLAP8X3PrZ0AoR13J8wc8oQUxPNIq
         D3zKAy8mvJCu7f2qB3ubh7xro1A5LEaf5a9M5jfJaoG0jQUQTRXPZgHJk0AYw4C0xoDp
         7DG4iO74ctJVj98Ntps3vSKpBynYdINm8Djk5kBw4JMsUZZIv81cklgHnlvYIFBpo5W4
         mWzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442018; x=1794046818;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Yms5QVe+i+O00RDca7nXtw0qBRN64RH9+LuNvzv8KY=;
        b=cuG7JXX5yBqRaSWzYqQgJVLPK1c8DXIYx3qB4ju/3W/DLQdNGwB9dIqzoGsnsSpbU9
         jt/4k4Js0JUh3bwCfg0OHg8cevEXOdWOH2UEnFCBxurH4vFKa1loSxDEVdJBMzSSOJA3
         /iTUWXlknTTTw5PD3dow96ScaHDdqYL0rx4i/LiVDsIX7dFIFOa0qTFSXAiMuhv/IFZc
         33jlnCX1rvLrd8OUX2ZeJ87r2+KY+j8+RYX8kvi1Ld2FQ75RTD2sYrZ4M9wrpnoVmGbd
         GK+iBqOKpxQCOweomEumSFPzo2yaVSlELAMu7Cl2CR4SaY8M0zVvjtiJiD2/Qy4hr1fT
         knwA==
X-Forwarded-Encrypted: i=1; AKwUvByt3deZW1TkyBgfzuSEcwkUPQuchPgtQqJnXZXKGRwxcm1gKi9pO5hwXwqAcyJHeDuhoMdE6/35MFsOoA8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYhrX8EEZGvEFgMcTk7JkeHYFyGdabvIwoqeQI+vZEMDzI6/GC
	JF36N8cWaJ3+e6EQb/LeRqzoAPI2bENS7AgDRORvXKolwnnuTyF9zhsNwXOXEX90FigIMEy9HZ3
	zvsx1ZZqW5NbwVtfdSqaHy28GIBLeeQO4hBDxZtD0ELMUsrUXr6m8Z+s+ML4BJciLqbg=
X-Gm-Gg: AYBFou3bIWaG2jlwju4Mp0O9CrVKPGKD7AO+yc1etmw2k/kfxshmB11CAA3MJSW5v4b
	o6xkY2m1QWGmJN1lktHmfRNJVwbmDrbvnoJAoapTDfCeIvPoSm08Wobww/3jHu1Zy+/sBarO5O7
	zuGwRHjpOHLGq1L0YQJpoe9iAEDIPgwvADEFlxnkEbHN/r/zIbEuKsSBF8yH/Wa1kJcL11rs9Lz
	nA59Z1qwhXF/GQ1JwOQtNz1Qm3GO5WRzGXMelWaxotc7OKs7BC1OZx+AMIwloNqIe4V9P9umX+R
	JLeeDXJGO7K4K8Ngz0dKFp9djYYHYbDxrDHu9X39zrjDYVA+Ubzsrw0KxvCgIbC9mGteYTPNcmb
	RpNlb5CU2VhY6wUyEUTUy0MouZygUTmtC3kcv1/bg2MwydVlJe3DsPH1C6E3MNzXXMSGtec0EDq
	vgSpXgyjM=
X-Received: by 2002:a05:701b:4549:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a94abded94mr10345546c88.22.1793442017541;
        Sat, 31 Oct 2026 03:20:17 -0700 (PDT)
X-Received: by 2002:a05:701b:4549:20b0:143:1bb1:3305 with SMTP id a92af1059eb24-1a94abded94mr10345519c88.22.1793442016955;
        Sat, 31 Oct 2026 03:20:16 -0700 (PDT)
Received: from [192.168.29.63] ([49.43.230.158])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm16523200c88.16.2026.10.31.03.20.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 03:20:16 -0700 (PDT)
Message-ID: <cb4e821d-a2e7-4ca7-be1d-f92e20e52260@oss.qualcomm.com>
Date: Sat, 31 Oct 2026 15:50:09 +0530
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH RFC v3 3/5] arm64: dts: qcom: nord-ride-embedded: Enable
 PCIe controllers and PHY
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20261021022921.2053957-1-shengchao.guo@oss.qualcomm.com>
 <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261021022921.2053957-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jVgRosxvvF_3XvusQ_lxoaSKnAsnKemt
X-Proofpoint-ORIG-GUID: jVgRosxvvF_3XvusQ_lxoaSKnAsnKemt
X-Authority-Analysis: v=2.4 cv=S5RMU4sP c=1 sm=1 tr=0 ts=6ae5c0e2 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=16YkeKhe4TlTIPRGKl4Ycg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GcTTplM3uHFL1Q-H_JYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0MSBTYWx0ZWRfX2ftq17fNwuzx
 oyIv6hiGo74xFH8JkFFh9TGjCDpqnTK+85gyPfcXgsMKSn+yQzzm0URSdaMXH/NdKb/0IYyTWOM
 XXu8lTaxvZf/+V8qbdVUTiZhAQG5aac=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0MSBTYWx0ZWRfX7tthO8dO0BxX
 vf3WmojJEWL7A8oV05LXF88kdgfkw7zIR7n9nEbTsmYF3fEgOz2p76fV7t2ksI96teJfBs7bQTl
 vzs8SNyeAySsW+yYCfxpD5Mhl8rtHRIIslpFts4DWPfHGgcUFOMauHVcY0HQeav3ibV0Y+6Dh8O
 M72pWSKPnQyyBoBVmGvNRO7ZXStzetm1Y51rzujSn5X7Q5BL6vrEV7RqVM0dCAMnalZitj+x0o9
 /Z8/qaVN9XAFIXU0XA3dYpG1Nnomrx54vdJ+Ss9rEzz7S2pMM0n/0HD7LJt3QAERA5RNMJ9bP8l
 ieH2KqLEttc5TB6xEVFAb3CKaH0r01SLYlTtfjnoVh2GLX3sKhtKmdKV5PMv1ZZLaAywFSlyekV
 BLzBgGTHhhDSGHRKsLpexINjQdb6IA7mDSrRAYWJa5Y+OQk8lu/OY0DtN+VbU21vQUcfq1BPM3u
 IQknLBU1EqSGuQINLKA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310041



On 10/21/2026 7:59 AM, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>
> The Nord Ride Embedded board routes all four PCIe links, so enable
> pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> describe the PERST# and WAKE# lines of each root port.
>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  .../boot/dts/qcom/nord-ride-embedded.dts      | 49 +++++++++++++++++++
>  1 file changed, 49 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> index 49635695f832..fcc07226db8b 100644
> --- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
> @@ -366,6 +366,55 @@ vreg_l3l_1p8: ldo3 {
>  	};
>  };
>  
> +&pcie_phy {
> +	vdda-phy-a-supply = <&vreg_l6a_1p2>;
> +	vdda-phy-b-supply = <&vreg_l4a_1p2>;
> +	vdda-phy-c-supply = <&vreg_l4a_1p2>;
> +	vdda-phy-d-supply = <&vreg_l4a_1p2>;
> +	vdda-pll-a-supply = <&vreg_l1e_0p9>;
Hi Shawn,

I did a mistake while sharing these changes, pll supply for b, c, d should be
l2e instead of l1e.
-    vdda-pll-b-supply = <&vreg_l1e_0p9>;
-    vdda-pll-c-supply = <&vreg_l1e_0p9>;
-    vdda-pll-d-supply = <&vreg_l1e_0p9>;
+    vdda-pll-b-supply = <&vreg_l2e_0p9>;
+    vdda-pll-c-supply = <&vreg_l2e_0p9>;
+    vdda-pll-d-supply = <&vreg_l2e_0p9>;

Can you update them as this patch is not applied yet.

- Krishna Chaitanya.
> +	vdda-pll-b-supply = <&vreg_l1e_0p9>;
> +	vdda-pll-c-supply = <&vreg_l1e_0p9>;
> +	vdda-pll-d-supply = <&vreg_l1e_0p9>;
> +
> +	status = "okay";
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie0_port0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> +
> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie2 {
> +	status = "okay";
> +};
> +
> +&pcie2_port0 {
> +	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
> +};
> +
> +&pcie3 {
> +	status = "okay";
> +};
> +
> +&pcie3_port0 {
> +	reset-gpios = <&tlmm 11 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +};
> +
>  &qupv3_0 {
>  	firmware-name = "qcom/nord/qupv3fw.elf";
>  

