Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629216;
	b=4WQsBmafp5C8YMrEl1SBD2jtwoLxKKiMIJ3rKRES05HT0vwtDdR6EZrhW38HIPDRzb6m
	 L4Goe2FvTALBqGvy5fUdBkkJzrdpMNPIsDd2OSIKQLTSvvrQ95wHvHFKavk2++Y8B29/s
	 w3hw5Vrl+ybFOgRJy+3hp9VR2lxRvIn9MhJbeQuo9H99QyeuWGelYwAiCxU11VrsafWpB
	 1hFWac/XrlOTHU2kNprUoFslTk9opSBsAf3YY0KQegFsPAHUtB074tiHNoupqJyJWelHl
	 4AWy7VZR5ih2pdNbic8tB4ezXcyWEmsgxH+Rj+kr3tpH9gtSUlLYj7kVL1dkiGI4MNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
	b=pVZ2nTE15c0UuHoEZmy+FDnl2hc1Nr0G1uxJyxgME8bXyM20wputkEMI7Sc8HtTTfdDE
	 zjwdAPHcdCDPApa0miaQaac5YHGwE3p8is1316H/vU865BLmvTucK+H8KX7+We057fp11
	 J3aTDoDATGZjVfMDD3W2VPvlYJZZfjuH2JWcs83lDHXkx2exQCu6kOlXK7J3pfW7pdQ5+
	 rpb7ipqah580Sis0ldGZuVSGYs1c/596fipyuhlSjjN+/pt9P4KkLdex73VGgHrg4IYw5
	 UpHwXUMSmqZV4AI6Xo+50rJQR8a66JsWvvg8ERdwYahXdzGG3CfyZ4/Hpg+iCx1oyIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biKAKHmg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="I0g2t+/n";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29C6606A332
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:20:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B29C6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biKAKHmg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I0g2t+/n
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpMph4062008
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=; b=biKAKHmgJPbtOesS
	VIHTIvQNfOcIFSdHRQFV6umd4p1Iu7/i+cPSG4/LpJAPTkoDQs+8H70NKarRvtKP
	WycNWus8JJ/n7Fl4J0EBmMHEgDzpBRFx4Sm6bcYOMCGHo46K/N32qzmPj6oB/79i
	zUl1K7rVlJre37xjRWTGqIpepdXXix3Sr0FIyADrKErJ8mqUEJlfvHjhkFvsndJp
	wfUViHEcAI+PQr5gs00ga9MtM1/xGn+Sv7emn8Lii4o9GfyF17eebPctMGoMoZ8M
	lTxjWb+bcIP8VPFdjAYIJLm3FmbTsdp/HQ4Buv0TE0oN9UpE7Br0ymQ1lHaM5WAb
	iwGDgg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmesp2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:20:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c97957d83bso168146e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629214; x=1794234014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
        b=I0g2t+/nvARLAoPVgHLeaOjfeteDN6UB/mIY8v7QEeR0318hGi5AiQ8t6gCRLO0gD1
         x4jGV2KcNmUOjgg8FOo/PTIEx5JxfGPVzYqKepIPnFSjWZsNtAaTiXlQAc11VSpafRTP
         dx8bBtb9rlHldLpl6g3tkmEML3nCIzndMIwRBubCzDSyHMHraj8qxbhPDYeITC9lwf6H
         6lrBCMSSCx8gR8eQg27wMuLdzyPU57z9mHeFB6Mtx0R7oemo9iMjUmLua4P+W9RJCGPa
         CEjZ4eDbPPxLN8xzHFHvor95+OAY60+pvcuRF9tiZz4NDPM4Hd+MzjKGww7NLUA9aLxK
         B2oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629214; x=1794234014;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
        b=bYDbb6bDbeRH1NvARxx4tO526l/m6suVxfcCghhvXBnDWVBtDYGsaLvVLbvLzoY5Jf
         TlIAENcaCW+ynqJc1bbPSOgeCQ2tgePvzzaQnJG8bGy41u3c3Bf7C4S/tYeeJreRKnfe
         FvdUwXOettNyYgIXSDOFTSPPU6ausKWfyaQQXHSzlmXLAmgKUknOAvFCNFgqan8FvPDA
         b6ooPXTBCIB/z/OaTj1gqOkP+A4MdlSFQwRq+t5RjudyIw9s821uXKpH2mWG1kqaF/Lr
         oU/TYZBo9PQUy5UYeWM9uUukSEfVGYL4RFQMYQ/JbNro2YPJacTGyLFHycXTbviJXknW
         rkaA==
X-Forwarded-Encrypted: i=1; AKwUvBwvEXerFh1/dYLhiAQlkQteBREkgncHTrOGMem+Gvdkmu/0yR8AATN0ce7Y8ZgPbU0FxjLzm+5rs3EAFbs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8JH2jIWDL2MacHGPKUEyCayzMMEY7gaVT2bq6H6p2MJdlwTtQI
	gSIltXnLk5eWNIUS/dwiPx9NtVTNG74TXeP2/qY34xuLN1kiS4aCTWzaZaLyKYFwf8Syu26tz3t
	s6px8cwDaMJRgBLXsROaxsPAAoCx8sxoHUE3C3/yfirfkykD6IBUb+hcazrIJA1g6E2c=
X-Gm-Gg: AYBFou22U656HQq4iVeTLU0nKEmoIm6gwBbZpsFNMKteANPoHQ6GOZxPqbbwK4fXgnq
	/BN5CO8oG1QOnqlYdcLDRvJzhUgwGW9LPy8QTfTGQ3m4+fHfA3mUbxc/jzQQQxZX/K7CjoUbDj6
	DD01iXOoChhDe6QqTjzPYtoVXs2M9K8q+mdycwcxO167sm/Xn1Lm5lJ7aAYi3FGxyuDJ76PbsTV
	X1SfGNiBYKofJfMALXN5zhaOadelHAdLQNqPxFbGvV88+7kk/RsX1ntYoOjEiGwH6Vr+kMA8WZd
	lqHMATqOgHAFmicl69cNLP0snvHx8Vedqi89hQy+rXR6Two3e4C+q8SYCDRsTOxIxWi6f+LiO/x
	yDlRRJcSr5Us9ohn9laN3gR3wZoIYuM57QvudjJg9/jptSr1SBXPTeNFQfXauqjPWo1qNRVMR9Y
	lCCKJ1xtQm2YE4vIB35Vxl1IobS/jpgw==
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr4385894e0c.4.1793629210395;
        Mon, 02 Nov 2026 06:20:10 -0800 (PST)
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr4385606e0c.4.1793629205094;
        Mon, 02 Nov 2026 06:20:05 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm398767166b.17.2026.11.02.06.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:20:04 -0800 (PST)
Message-ID: <bde94c6c-1119-4bb7-be7c-a4772c6d0a6d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:20:02 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: Add dmic45 support to rb3gen2 vision
 mezzanine overlay
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mohanull@quicinc.com, quic_hbandi@quicinc.com
References: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae89c1e cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0PPGIIIRtHnt8ZtJf3AA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXyHNNytA8C+w8
 mTK7vlkbqzEoRXQ9k3QxoOBsuqYI+joqOUlf/anM33x9PWJcQ4K6zfljhBkNSSPPLoyMPIw9p+7
 Tfk2MIuGSHNh+ViO0zitZbXNiF8RMPXuQsr3aD4Skm2T9xjSuLyJTtt1GPIcYyg+t1Sj7CGH16F
 Zi/B9ruP6LzMfsUb+CYjPNTcQPaDRZ5Mg7SFmTRnb8HgYzG7bLVL7/cvOfMat3qJSjLksr6f9vt
 RUjueAgwIS3godfBvwao0DHXiE7eDq0FWttGS4D5ufy3e31d++3XcjneIr3khd5fLZy/fOpw4Z9
 ER6cLTzvR7dRDOjAiYdoT/b4vTtvxDfQZy8hbTusZZXDHUqRp0Ux8biSH6WrX8M7DLvgedgEnqM
 CF3a6gGN4lKguVxv9at/+9sKHofh2o66QWka9WvfD/bmPhqXluN+j8FNxJLPBICuK4CVuglU4Sl
 e341GcCG5Y1cDH0T9iw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX1l36ZVx9SW4m
 Et0/vNT9oNHEl388kw8gNjZonmqCF2oPXuLKKeGUcxFCbOi3YF5sOgXYbHMDgMFB4ulIkI5XZKJ
 0kILs1yaINaLnW28phw0gTXJTVan26s=
X-Proofpoint-ORIG-GUID: K4G-PtEIkxVPXeToo4_lLPdlviXe6a5B
X-Proofpoint-GUID: K4G-PtEIkxVPXeToo4_lLPdlviXe6a5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020057

On 10/27/26 12:51 PM, Kumar Anurag wrote:
> Add pinctrl states and VA macro routing for two additional digital
> microphones (DMIC4/DMIC5) that are present on the vision mezzanine
> add-on board, mirroring the dmic01/dmic23 pattern already used for
> the on-board microphones.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> index aceafea45343..0a4e6080a2b2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -80,3 +80,42 @@ cam_mclk3_suspend: cam-mclk3-suspend-state {
>  		bias-pull-down;
>  	};
>  };
> +
> +&lpass_tlmm {
> +	lpass_dmic45_clk: dmic45-clk-state {
> +		pins = "gpio12";
> +		function = "dmic3_clk";
> +	};
> +
> +	lpass_dmic45_data: dmic45-data-state {
> +		pins = "gpio13";
> +		function = "dmic3_data";
> +	};
> +};

This should go to kodiak.dtsi

Konrad

