Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8241344C658
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790330254; cv=none; b=pDf4VLluaYUJRDk2x8qmqf+Vs44cRDhUI6XcHtQDrni35l8SGETiMCTY/pv9i6JLzmDwlwXZdLrOE29eDOQnOLe/PwJ3P2lFdllR+ozpSSQyBaiPzlUAR7iDCdfmbfVV6G+/J9Qgl5O2rahu+k8EMpEvfLmHMezW9A29WCTuW/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790330254; c=relaxed/simple;
	bh=CPMAN8rLvPNAB9hxiHU+WCbw2Y33iCG6KeThPLTYFM0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g9Gl5se7KevJmLy0cOWY+/Eg9uGktCAPkOYm/wIKOgulJxpqa/37/rMNDtYp/ORIYWZGcbfoQDNPJk7LdcgKw0IEsUkUVydO/mYJMt3NDIkh1luWBatyRRQUanDYM1ihigJDNEUnyXFGuGg5enT1L5+wsuQF84DXyLLj9pSuR4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HJQD/4QR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LW05qzYa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HJQD/4QR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LW05qzYa"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YvNK3532505
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=; b=HJQD/4QRz7prCBkz
	CtOQEHS8DXsT+z613mTaH/ADpPVmnHoNEA+QlmqZSziTjJeMKjGJDfKQ/R0+ilhc
	2GObozO4ZD+WKNH5c5B9kH6XrKUX6Cjup4V2qsb0i4xZPJxuKrPxZ8dQkSyEOCG/
	AkghD/tWEH5gMAMRwzbVhsJXODbDenxSXDEGQEQjLjzW2kVhM5ALWBkzdUM23ePa
	Xi6S0mVZPK1BsLVsxprOEsg6W+g8UuyAWsVP7W2C6+WyDDOZIBgmk3lAWNt+iGei
	QwyQ7M1r4F52WFSsdnxPiFflvBl5y+8WlGH/DmtA2s74220v474McscKdo743yCV
	+5lCjQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw94kap0j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:57:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438fef603cso2442396c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790330250; x=1790935050; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=;
        b=LW05qzYaDitrF9T3M9qHKb0qFFsOXb6jF9ByT67Z+Vd/WkesR627YNHqwu3gcaNRgy
         pv9JA/qBRivTfgHp/DMg3PnB+fsYnEXOzwFFe/AzDLjN+NdLSE8MSmXG4/T9u3MUiXmR
         akTiKRLIP6GBAt421nszfpAScLti/MGJbxo5+3OeZWoISYw193J9g1435hBFS8xYOZg6
         BdnH5mwj/qLbg6lwFg29DP+FjVqu+TiX6F1hTSfIW8pdWbVH95RHMHA7f9eOjxgXi/TG
         fPPSACr5OXlGiJ/MXTz93GQ/mJTCzDx8K4NFge94i9u1kr03F8LOGyNL8jpsBPTwdbzS
         2J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790330250; x=1790935050;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Us7OV6hGUevVELE81ITsqhco5kYotxbVZybbw/9clMA=;
        b=KLokTV7jb079gXKQ6NEPI+M7HLwp4n8Afm5Dq39igUjXo1iq9dJU5xqqJnc9oCyC4i
         9ASPLy5pDQRZtPeCyQIKp6gmr5Pbex7AIrP7U4lyDeWjz3pdRtpIRmeJWmwFI6um7vMj
         0Hk0P1LM1tkp4QShe1MZfiOxHj4PTDGU+Cw5dc1GhdyokLTP9bXSFOKqzAoXtpf/fE9Y
         0/QhhHnq68Q9wnjpX6RMCTGQgu6B2Ld4WnfRu1HIEMZMcYV+uT1IApowW1t6dTPAKKY4
         fWK/mndocAhf3LDlq3xsCPZNBtgWZv4w6v49BcrqbQ74n1kUHZkaE2R2YbN0spJ/zxog
         9qxQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/qi/8KcR8WMYkD33loc8G8/GWf6w0tQJLV3Rj5y8J4fJrM9VolH0+1z1t1xXUopOfF8d6nUTqESifrQw=@vger.kernel.org
X-Gm-Message-State: AFuF++km82gCpzB/7lNp9EW75RjfqQm3dp+pQ3gCfgZHHyBqjM2NOC9v
	lfrV6PtsRDp4+xRkSW1ENQsTbUUMJsWhwOShzeLJRKlHAco+4SI47Va+fXm6gIhTQ1ZHW/tFb6I
	xdY0Bumj7ftjzm/9lAWaGbpnmf0kijujTJHLCXfTuo3o0VsUxKKf4Sy/7DzfNrFXEXto=
X-Gm-Gg: AYBFou13+gqY5MQLZwFAJnRPHS6FNumI49U46U7K1yIb5EcgSIlsDMmz5lmfj9kQ+ba
	J2/amTpLxp6R27SYAf7iTMgubvuGpQl2QGclZdtcEPxlfZ70PWEdKv2rJI1HbnEWQX/CJn4N8+d
	qxMJO2c+cdwnZMcJUVp+ywCZ+5eB+sEKb7x2VmU3GaWQ/qzo5flRYb6wS8a1LM5BvNCHdC5sDYI
	ikBPLhZgGOw1da9Qc45TETv2veY4XtKL7YIo8y2WVYugToYcRqHWsxHtglQDqiy0Z4bCyCCwzAG
	Ljw1q3WHc1pleCdrCFfuJTrS/e5nZdfSYQlMB/MtlxK59REOabww0I53QIWqCo/C+xqbgI2+Tss
	MnlSmyV0PQrgxbh4=
X-Received: by 2002:a05:7022:3a8b:b0:13b:1bd2:38a2 with SMTP id a92af1059eb24-14503fc30camr5160039c88.18.1790330250145;
        Fri, 25 Sep 2026 02:57:30 -0700 (PDT)
X-Received: by 2002:a05:7022:3a8b:b0:13b:1bd2:38a2 with SMTP id a92af1059eb24-14503fc30camr5159934c88.18.1790330247829;
        Fri, 25 Sep 2026 02:57:27 -0700 (PDT)
Received: from [10.204.65.250] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145adbcd1bcsm6475668c88.14.2026.09.25.02.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:57:27 -0700 (PDT)
Message-ID: <69d69906-eb85-4fdc-ab53-1828984dbf07@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:27:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: nord-rrd: Enable iris video codec
 node
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
 <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Content-Language: en-US
From: Gourav Kumar <gourav.kumar@oss.qualcomm.com>
In-Reply-To: <20260919-nord-iris-v1-4-94428761ec06@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aaj0Dhot c=1 sm=1 tr=0 ts=6ab6458a cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=yR8J6TAb7IqefvQR2IsA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-GUID: QHHU5CniWrCWok6rpZQI_oBL_VbToZOY
X-Proofpoint-ORIG-GUID: QHHU5CniWrCWok6rpZQI_oBL_VbToZOY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX56XNVHFFLVAX
 aSOGtd4ZmF5l5rmhj7HH5JN5hBxMmwoeam/9DGu8STJ+Yif61RVPUNOePOFh0xMX+plEr8lTpo0
 9tcp5aXdwAV3GgxSW93b1qlhVvttV5V8VgQpdt7ye9g/VnDIY/4PBfwkEhOCQ7W2SRpcanBo+0q
 nd4Gv/qtCalEs6/ICIuLZZaH8GqhjmmJ5dTTeO4pN98sr9+TyGiMSAl7GOfGKHEWarPfRU8OWNK
 6WX0nliHiuxNuYmHfKoGmAArzc+a2F5oabEmPFkG/HeZs+M/DV4UYl7J3JLMes5FEfufQIPrka4
 /A0uWj/w/XcDWXscj3S8XSsbsXBz9XKdg3fywG4/fxEP1oh29JyvRS4hnsOW5npUxNgOmhlpBd9
 Rx7NXx1VrMWG7W7rVbCrys2WIT+UeS38kMffgaCWky3H23VLcFsGATat7wQ/C9rR3j4YuTxDxax
 M8Q3frsClK73JKI5rrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfXwUH+gIBww4KX
 JmQgGRA2pBsPARc1mcnex+jXi+HopSujwTvc9kqWW8OkT4pCAAILMpGtwLVl4S+yBre0IjrJOyW
 BDLmZJT7reKNPzdqRGVgaiIx1YfkFRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039



On 9/19/2026 10:14 AM, Vishnu Reddy wrote:
> The iris hardware block is described in the nord SoC DTSI, and enabling
> it here allows the media iris driver to probe and use the video codec
> functionality.
> 
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 802987da3cfd..6e0b7a54523f 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -415,6 +415,12 @@ rtc@32 {
>  	};
>  };
>  
> +&iris {
> +	firmware-name = "qcom/vpu/vpu36_p4_s7.mbn";
> +
> +	status = "okay";
> +};
> +
>  &mdss {
>  	status = "okay";
>  };
> 

Reviewed-by: Gourav Kumar <gourav.kumar@oss.qualcomm.com>

