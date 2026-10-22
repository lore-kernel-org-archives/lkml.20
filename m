Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659428;
	b=a7xu7yRnfIPqEPGesaO5CuIkMyajOMybuOJLRUyv0M7cNR3LisiPFK13+RHbRWih6u0P
	 NupmPXY1yWjKHTkSa6FWmuhDJQ4yG3PyoTZNOy65zD68IsrDzHZN052gAceFIu2AX06yl
	 Oh0dno+3ra/X4rRTHGc99s/eVZ9cEDAZIAjWDl3g2gAs/2XWL06HsGsI/JZE/mUZxD2NS
	 4RKpdvpYM/EQb3v8NXTZFRwzavV9xSjYR705YvSSOLxvMnVC7D7Ux2yi/Z37pwSLkhrh9
	 Gk9HhEyq7Vh27NnatYAY48Pdod0QI068jT6mu5N+u+Ufky25QvUEET2twSm11GsLCpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659428;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7CLGQmEYHhrWVW+PkcV3LcDE2v4YT1bC2qCXvdzwBCE=;
	b=QBboTgLX0fzC5dR7TAzpgke28EtJdKqVsDwY0FGh6MJ0aMLLPj8uEOtwDu2O/siTsdmH
	 6Hm+b9c0h42Ns1r/sDGICdmlQBYbjO41fnNA7gOfhDyTrqCidXfIRBwdd8I7X/c4sSPnX
	 hS927/v1jZ+jRRM6ZRmqOJ7NuGFERF5mtWsuPgtMJPUQ8yQaCbbY7Ko0IO0RJDQoaqcUB
	 LYyw5SXHd0SPh/NiFsSJ0jzkJCDFsdsUjYewYQzjWc+CRxwbEoV5x7Ilyfz2oYerDW8CC
	 YM/WsKHsVt4qw6m4o5brPJGKp7s+1eMFg/wlvZKja+kuTflQ7Wzi8w90xs6uBBKnY6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRpieIV1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OVV5ulCf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1BC606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:57:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C1BC606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bRpieIV1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OVV5ulCf
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M706BR4110650
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:57:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CLGQmEYHhrWVW+PkcV3LcDE2v4YT1bC2qCXvdzwBCE=; b=bRpieIV17snTgK+Y
	KDIYl0oz9t7EL/mW9RsvV7+NTfDG4iMBKhg98VzkgIZ35xGjE+xD+5O884Axxv1/
	92VgF/N+5FOFHStDJ4oKbJ72I+fvFfWAFORUcO6eRQUkyhasomPolLrBFl/Jyylc
	qTQ0NFvHCPlIGw8HdZqy21JdfW4qNpT1zI2vdopKiUnaDBNoU8pYk7yiLEsxRt87
	WBfwj+ICpDvfL3JxaU5ysIGiJUg2YVCdENYQZNh5MV+aE5Anv5AnpveuX+EZ8Wnx
	6R16ulRBuUrihZgoiJwQGqFYX60XmBq094ymaZ0bY8Rv5uf34xgSCKof9PIR+5Pi
	qTGVug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahk4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:57:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so43625085a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659426; x=1793264226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CLGQmEYHhrWVW+PkcV3LcDE2v4YT1bC2qCXvdzwBCE=;
        b=OVV5ulCfsZIB+RZaf/lzDKlN+BHcgO5uGySm7x/CVLwlTN7bMEbOXq+1irzCoWI9p8
         nZ38r8Xi+D7OfIU2a3jVBqaEtiOIzZ0d6MKuaFlvS7Nu6Y0rXP4uQ750L2kJAjGNbJeB
         +Gj0kotuuHH54yDyiu+L/ULKx6nUbnA3RnvqT/2o6Gsi88K6WkUj7ilcReg1GvQIbdfH
         x/70uADHn9BDFURR2A/Vfno/CS6mYKkemM3gXSypTY7NxN10PhPNwIucPR1PQQohqRZF
         0acKR09Hja0itcZ3Rk/+kHA16cdlwJ3r73d3eoCo5kqWqr7xrFeIyCll5+ZkznsAjN0j
         edYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659426; x=1793264226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CLGQmEYHhrWVW+PkcV3LcDE2v4YT1bC2qCXvdzwBCE=;
        b=wAJQGqNGLy+KmrowV0NfY7z5cVpoDYrYWotSx9BdOs0poNQXObI13eIewg2EdxFki+
         IFuZvQnRa/ZnpHALRg+wLkQ4KE7Pc/vKBZDp7uwCeJwJZUZXg61oa86UhQnaFtXAka/j
         +QN0b5YR/XVxvyOpLFvFtYQPgxeOI+wf6CO34gPj3d+4DRgOap7ZTR+MteSJ4TRqHWqL
         GUbmTpimN8ILE7iCCZruuwbGWaX6r27jDCVCpGH7Zg7weJ/M1nOMzX8n/Phi4J8sWPz/
         tQ0EEWmuWPgU3NEmPQSYj4DI1PHkV/fsn+h8Y6SwvQJusX5dBpuUk5yLdbcGhoJc8mf3
         2Ihg==
X-Forwarded-Encrypted: i=1; AKwUvByASMRza4uWqbcHABWTX+UknxAd0z14SwGqznU9Vc9/5DTt+jl1jBw/4GsoXM6Pe1xXmJiipk8VO57fvHU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFcxHPZflMUOcAotBOD5ktQLOb56JmlgSB/vLBknmw2YtUnJJ/
	kYm1esnVdNHa9/RoBwXqI7IdxiZostx+RKycAGA5VbUvPfjQWbkyuUwzN/U7BdHHGiVB2HVd+5F
	gXqKAuXYRJqQOaxkVVAysBCZHCgouoPJ2IJqDZmvvAkNqYWmBWJT0hq0RlL/hhNBRD94=
X-Gm-Gg: AYBFou200ICXxClbNkWWRyv4MkGLIoBXaGJlVEcjfBtpgpm2kJB2xfdemHHXmu1NMhM
	rsP3AXhH3s7kAFxPpuda+1/mgYU7RbPgPNhRQcNFUFGBKGqiTx8Djm75oVyopMZgC0hlpygl0QA
	qM8ZsgOSKHRQQnsHxwiTcnEkO0tToP1qwiW+1dBtBIScTEN4MWWOZL8d0ot29gDU/b6QcTRFJfR
	U4Ce7c87EgUIaKTTvLrpZSLiLuoQCMcPEYHy3BIlhQyOIoXDcbTorn6t0vTkEX7W7grXyxJUWIj
	VLBm17SHQPf5M+Rf0cT00zNM3jIIIthXARR0BzSvSfVYdsasUnZcHfMBeJynToeEeHnXTI0fmyf
	N37Sa2UYfiXLaLnP7jzg+cA==
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr993621585a.1.1792659425754;
        Thu, 22 Oct 2026 01:57:05 -0700 (PDT)
X-Received: by 2002:a05:620a:2913:b0:93f:a34:d9fa with SMTP id af79cd13be357-93f57e5e2cdmr993618785a.1.1792659425257;
        Thu, 22 Oct 2026 01:57:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a5e1ff3sm84664666b.71.2026.10.22.01.57.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:57:04 -0700 (PDT)
Message-ID: <083629da-9f30-433b-99bf-c39664ae7ed2@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:56:57 +0200
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
Subject: Re: [PATCH v1 5/8] arm64: dts: qcom: hawi-mtp: enable audio playback
 and capture
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260923084627.748920-1-prasad.kumpatla@oss.qualcomm.com>
 <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923084627.748920-6-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX8W/NHcxq802n
 OdwGRqj3Rffhwfj/jqHNz4wOGJF+TcXOgYww+Ec2FWLKH+of+O2Jip7z7Z+Xh6RYycm3S/ZRcOt
 0NXON4URo8s7pZtt32EL+04qE3N0qmj6A/D5niwhwduZMKnXQEpd7sU+hCdc+6rQGWfOMqPrIiX
 ioQDLnFnMo+CT9OW7RtzSfuHiVN4e4tbjwevISy4A864LxDr4neRxWcfLppo1f+rkk8mJ/LfiyY
 qJswVQ6mtIWjqoBxduQ0mddc7d/9fLlEcn4ISGcc+HivtwnLTNQtr363CsljIpAz9KhKJa0Su/m
 JzfQO5YBeH2PGYEE4HBdBaQhO+SkWkbvBZLZXIjMHxTx+UT9y46PJXrBLy5eIDjK8HkScikeVhj
 CCCpxnyvySUVs/J3KwmphQe5d5l3hvlxtxRWxaVwThRyWQiwwCMgqPIef1IM73NHA4f1jD/G9o4
 QThOOb8uzmCYA+XbsCQ==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9cfe2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=MgFaegZgclKnZZk0PtQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: CPTMyUbY-SaUypNIHrR0LCtdjbzBMoUN
X-Proofpoint-GUID: CPTMyUbY-SaUypNIHrR0LCtdjbzBMoUN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX1WTChSLxBzLs
 l+hx/ZCnYXO8jpuEX+WgcFh8JsLGmEhb1PqaNsfnCsx0sCwR+VrP7TxIkBlQLzOZE4FE/5HQ/EN
 wLDGCkMzXpXFo+ydEjjVQMk1umirEvk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220035

On 9/23/26 10:46 AM, Prasad Kumpatla wrote:
> Wire up the audio use cases on the Hawi MTP board on top of the LPASS
> nodes added to the SoC dtsi.
> 
> Add the sound card (qcom,hawi-sndcard) with the TDM playback, WCD
> playback/capture and VA DMIC capture DAI links and the associated audio
> routing. Describe the WCD9395 codec, enable the RX and TX SoundWire
> controllers with their WCD RX/TX satellite ports, and add the WSA8855
> speaker amplifier on i2c3. Configure the VA macro DMIC supply and the
> required TLMM pin states (WCD reset, WSA IRQ, WSA shutdown).
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---

[...]

> +	wcd939x: audio-codec {

Nodes should be sorted by their node name in absence of a better
key (like the unit address), please move this one up


> +&i2c3 {
> +	status = "okay";
> +
> +	wsa885x: speaker@c {
> +		compatible = "qcom,wsa8855";
> +		reg = <0x0c>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <77 IRQ_TYPE_EDGE_FALLING>;
> +
> +		pinctrl-0 = <&wsa885x_spkr_sd_n &wsa885x_irq_gpio>;
> +		pinctrl-names = "default";
> +
> +		powerdown-gpios = <&pmh0110_f_e0_gpios 11 GPIO_ACTIVE_LOW>;
> +
> +		vdd-1p8-supply = <&vreg_l2g_1p8>;
> +		vdd-io-supply = <&vreg_l1g_1p2>;
> +
> +		qcom,battery-config = "1s";
> +
> +		#sound-dai-cells = <0>;
> +
> +		status = "okay";

No one disabled it, so it's enabled by default

> +	};
> +};
> +
> +&swr1 {
> +	status = "okay";
> +	wcd_rx: codec@0,4 {

Please add a \n above

[...]

> @@ -937,6 +1129,20 @@ &tlmm {
>  			       <119 2>, /* SoCCP */
>  			       <144 2>; /* CXM UART */
>  
> +	wcd_default: wcd-reset-n-active-state {
> +		pins = "gpio161";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +	};
> +
> +	wsa885x_irq_gpio: wsa885x-irq-state {
> +		pins = "gpio77";

Please keep the entries sorted by their gpio index

Konrad
