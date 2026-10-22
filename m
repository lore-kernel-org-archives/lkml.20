Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656305;
	b=PPE2FudmCjt6AK/fzcBMXTmFz/hV/nEzB0d34qSzW7oWOjoARMiCv21+9PrCos3VUlnj
	 TkydMGeHSgv0yJEYAkDFaVJWCyQQYMMmpPgKtFCeciSiNa8rQOzyVgNq0DrgsLGRVVg7S
	 cfRvvQqWQ2ozaEbvVO6YhWJGw9A3oqeYoRhtX+eo0qE+dkO1mqgzPZlp6zjuhb7ODFcq/
	 H8dconCmBjVd2FfLu76NyCXLW/ePBwZH1Msa1qfVMBRMRlOzIJDocNGl/kq2B7Mry+Ccs
	 WuC0vm0V57dcsrsplKuyB6CgzBRqvuDY8xJTunfgVVFN8GdYmxUoo5+dwuzfqmuPWgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656305;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
	b=MhXRTxG+d+yvrTFrLBlsQnCJqqEG1KLT+D+Bb7O/KVi15kn6S8tIJLElBHrkXblLjeGi
	 QMrqc/d2IPVsnXDTcm95n5Dw6gq3C573VdgJXUj6g9W6ZGtei+V2erUJHlTrv62PLu3sr
	 YaSQt5kGOBADbhF0Cm3C0R1mwlykuskWXDG6iD3UrtLlohTae5F64elnBBj7jjiHuap80
	 4xDR+qseOrL4lgqZivzi4XcLhF1Stutzj/Rzp+g7zUfbbOrQCf3S1wa80UsZ8f7rwYunn
	 S/Co/zvB3fNhKISCcdGPY/eM9XiSm17R2TulraiNU3hQ/vSIITqszbzChvGqBUcxhLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQOhDfF3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUtwjJoK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8A9606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB8A9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cQOhDfF3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TUtwjJoK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M70T4G2972086
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=; b=cQOhDfF3r36vj4kQ
	xjVtHletR+j6W9y+iv7K1etgu5d5VhhTBr7ehV2hi7fnaB15JDWRewYPUnXPrgjd
	i4s2CyAnp94GdXmwIKjaeyR004RAWANKoe0azq35ZSo8ygzHUCJpxF1pDMG6koXp
	W/weUD6pa0mywBn0pFPUsUctpIXz/Nm4/a5FRJDusNpAJgF+z4DrPBCnFrfCHEPE
	LDofoMC9sbjelgpn2m58YJnTEpn6ZYwf8UGgpsrPMvwOi3ci9fsbmlYaA22dlYkx
	LfUlckblKMZlS4FFcb+BM5ZSmASur1h8AQXGs/jzlxyrnZ7Tfs0ELnB57r1fTpKn
	6cQ77w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2ntx9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:05:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso27997885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 01:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656303; x=1793261103; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
        b=TUtwjJoKXpRqR+koG0tBr3W2QDfYkYxTtxCqtdVlzcJrRRoRo/wqtT0yLVsV47qgCv
         zV/LwUEDeBcCPKv6zO2z2ws7ccgaMQsPxv31chzg45q+/3ohEoUvyXXzT83psqo/sZG6
         rIX+5hCrKpwcMN9vvwSSx3hZ9rpJa5/CYAQr+5Kmha6NJpAlJlfylG0zZ2KN+1AyFpQ4
         zgWs5Sf30jZaCSlrpmhs0moBPP/ElMUKRkbVr65FS6SdhssNsJ5QPVwP7KDnoADgCs5B
         SfLiQ7ItGkTMsSN6bVyBc755XIbaibS9oGpy37PbfTBa8VoSTmGSq722DCX2Bl6jJEs4
         W/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656303; x=1793261103;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PZB4BubJt0rXp4l0BXgNtCvwouqVWJOCf63irxkG5Nk=;
        b=fiwMfWywHXcqBZQpOlPaFNoeXy0Kbc2OFFtCkcKojV2uRdqXaUKgdDP6t3sn/adXTB
         NdeBKzGIz1Xr7CI5Nop1tNLQnLTKquViWrd6J7++DcaKwGosoejOILu/Nk/446i2TZi/
         V8S62j5zDRYTYzINbPkUW19GSqsJ6enCFQ6jIzVFN/ywbUmagyr6kiwZZNSjGCEKyBGT
         8eT1+0lbdXyw7sN74wESTAB/atgOOA9f6gRAePBmybFH9UJANQ66OxlIAij3BB7rIjM/
         1jQgTPSWw730iaM3xiIYh0jOH4N7MetKt0AD//vhLYMmJSjxnbiQD1sM6jUjvVLaDCaJ
         BXSw==
X-Forwarded-Encrypted: i=1; AKwUvBxt99AJIHJX2b9o2XXrVDqj2s3LZocVIbB1loLg+9LPegyXW903Tg3TJXqnz3VGxqKPfuEn3jrhyEi7X0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/PGJ/k9v1kLw6WenKZK5olTvXKaWfq+LnXCSWaK1ZWmKleU2c
	GitaCxUH2gVg6UXsYEMCEWge/p1YSnM8Yw32ymNoqDiWbluWib9gQ5h2usrN76ZE5vL4RYc4PzB
	e6uhn36WtWdvlnuvydPOu/GGRSDzB7Jg6aApowKzaMaDX5tjWXhdK6nBaCd9ydriL9kY=
X-Gm-Gg: AYBFou2LEZPVAeArbsyT7GMrgLCfwfEh3q+P6JAm8uVB2Zvwpn4NuFRMBFzckDmy3Y1
	Gp9XfEp/iTsZ10RHjsOnxMPCiD5ZjJ6tNW2da3+WWrqOpUh9V/vai0HjGzQw1LvHkks81NZZrpA
	Mx3c0btCklY2JygPr67XwWLDnn/7eqqsxe2lijx/7SyzdYIxNZmLYRCfKg7f01xMd5HhPk3e0hR
	XN8FOPo3SITebADXYfzq/5VZYrKJrtEIzQlt0kWVa9T37ieMatLB2VqqvpR9VJs0uHHpuuHE2F+
	i7mGfLE19ZSoEZ/rk831zSuZAR0Lksk6ycJVMFg/PJHmy4N0Pw+LSonLoAOE1P1oHMAmwDtWvUV
	pGt2eiQ77cJTn6Ujm4FBlZg==
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr932520085a.4.1792656303037;
        Thu, 22 Oct 2026 01:05:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a15:b0:939:c7d1:7471 with SMTP id af79cd13be357-93f57f7036dmr932515785a.4.1792656302652;
        Thu, 22 Oct 2026 01:05:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a610a92sm76425466b.80.2026.10.22.01.04.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:05:01 -0700 (PDT)
Message-ID: <b4737aa6-02e0-4554-91d3-4d63710037ae@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:04:58 +0200
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
Subject: Re: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX+t4dikP6AjSL
 wPmOuouh0QZ6s5DJm3Cho44v3k7TdKPDqt8Gogxwg8KFRFWCQUrn6gQtCXkx3LfzeXcsPsw9dWX
 8FIutQhUiB18C1pFjs6/HFHmSvF4Kww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX5Q5/H0DbWcE0
 /xThbr+hnfG3n8AI1cDvrSY7yenDWWXXeR0X5H9WO/9yCNPJTS0e+EMGgke1wY80ifH5zA3wVBc
 ytV3tXieqQztsFOK/qQxfl1gacVneXHE70SLVhD+ljyRMkTG5RLkE2+qOEehfSrykuNYLTs8oZU
 ecbbaGvxdTvjwtnsUhJ/BJ4Kp/kSMpjxNz2H0Vzc6J5YgCUbq2m+EWXI9FMOFCDlKwDvi7eAegI
 3GhbLnWhmS1zeLQm2O3rHWOBjJR03pYPO2rtfCGL4MiATCyDuCQL+JJjqaqCZKojnt2V5+XQWbe
 akYQX0BZQr1HJG3jey0N5qiTTcydy9ZsYG5tKiS/RI2SvoFCdgHhIXzu9dr/LBNe2oMBAzGIA2B
 pZsD9cOmdd/9stFS+4d4/O5R+1CFzLccaVEnxNbLPspeGsqM9V6dxFewPyrj7VvS3w5mrRJfyMf
 U9BiXIJ/zjRvXJu9n+g==
X-Proofpoint-ORIG-GUID: qG6WKk3Q2WnjYuWfrnVY8RAruYYhbbHJ
X-Proofpoint-GUID: qG6WKk3Q2WnjYuWfrnVY8RAruYYhbbHJ
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad9c3af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=kz7q-GqAsz_10McoYYEA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
> default on the Talos Lyra EVK base board DT, to provide HDMI output
> on the DSI0_B2B connector on the carrier card.

[...]

> +	vreg_disp_3p3: regulator-disp-3p3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_disp_3p3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&lcd_bias_en>;
> +		pinctrl-names = "default";
> +	};
> +
> +};

Stray \n above

Otherwise looks good

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
