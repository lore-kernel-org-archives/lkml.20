Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577925;
	b=LZ8uaQgzaPzLMqXn8Za7iVltC5/OyvXDFqjIikFyOpNNR9boVvD+Ui9SDUZlotClRa8C
	 KwCRwt8h7HBkc/pTLgbUUuqfJSu1wYK3VSCyR73gy3KQCGoDcgS2AnuiS/UrDvhUsWarB
	 Rh64hfGhQ4Y+kLUlm6wGpQqUz7wvAiw7a3BzhGPgO8Nxn32JtK1/tJUvrSjmmcGEEqBss
	 s+SWRq1zEzbEr6P00IIlpTI/j6Dh58Ev95NqE/gcDFBQyJHQz7cnnspsgf3VOH8V8ybO4
	 rM5EOvzHI1Gh1HNR/QJ1Y4pxW46vXJryddiqTLNwJ36IdrtIrjKsNXGDyhB4bQ0dfQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577925;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
	b=Fng4MfsO+8pAn3v+Qt7ORLMMXmLwOwWlmhl9D+l2qghAjQne+JjU7RtxLqr/WB/ViGX5
	 73hyLcvEzHxtQjYftEyfh3UOPPkl3M0YU1+NOmdlJKOTG4nIayMBQT58ruzPSKSZR9eaD
	 H/UUV0dUYl2j7luKcHZ9nVt1leK0rKhWtcrs21ZGfd/jpdEQa9TMymDz0neHMoGUJzW28
	 8zMmqbpDCOP2kUeje0rFgcjpBYujYMPVK6D0qihUjipwOADAx5vxPaYvYHNuEYvtVE1gs
	 u8V8irct0JBpjtKPkHgVYzpenhLnsk1tfBg75OrnnDY/d+rL9+vpXY2UGuH5cpwedag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kaY/uWAZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAVWarRE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36949606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:18:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36949606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kaY/uWAZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cAVWarRE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA63n41358647
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=; b=kaY/uWAZc5nGf1ak
	LBzW+e/hUZ09NDFcAvRHt/pNDv6/gpc3SxqwxfzINmDV66rvCQcA3ZtboWumjaf+
	frnLlxOqg1v3dma3fJSYZq+pBNpJiY1Iohw+V08qnTohcW6BkMEPYnGJYVo9xEV5
	SgCW8sF4cUOSq4xb1JF3Bb0P8DyGUpgkQY8tyQHfeiBTKO3eew9NmAlj4A2s33bI
	jRZHq6egkjZi5QXRyZY4+hIEtXf2A7/lQGDdUQJQyC+X8CNo6MOPTfPjD4Nng6Q/
	p+gBze9DVgCox3Q8mTG851LiVOxeYWJr/g+bAewn3c6y/z/9ydIyU2v7dzZRz3ol
	5vxiFw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda4udkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:18:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b89618384so1631976d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577923; x=1793182723; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
        b=cAVWarRENzPZPMbusMX5PbqL+Wn/W4z3gTWXF9ZCSlEl13t6rCQET+59jli2IRlH3s
         pxHbi8fkz60/k57mAp6UFlSZqpjKsX5B2jmZC2aHSdRKnfMn1+1qI1v+jUN7Mf4Y8erS
         nqQgD8DNSaX+7cmNuUiwsV3DU0nqXIPcubbDURdbpKdkpk6Fdx7xQevKdO+UbJp608yp
         t3JTuo4b7dyPidJs9Tu/ZA6Ob7kCxStyy0Osb/7pmnnwIuLVbfVQ4DMID7FTP/jXNRm6
         MNjrrF77yLgMInwBfOXHelNexrAA0VtEz9XUckq49MmXXuW1EmXFnM9KsdUW1/Sxx0s0
         efhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577923; x=1793182723;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=POpt5+fkRt3sz4vKBxaeJoUl8fO2SQmXf40L91Cvme8=;
        b=T/+jMg9UR5PFkCdmQwOWPGhE8oGPYQqsr73ZduBmFRTsjb6JwSJEV+yIPQeEn9PHbs
         TJdxl80JIQ2AK9+hZqUW5hUaeE69D48C0poy3v2S/LOVxnkaMXNbbjZS1SdzU+W9nzkC
         +XIG2h5FtmXKb3M6e+CNrVPGwj6ZefSPdZZWtJ/gssuWima0XCHSMYuRvxnlBtTVOLG7
         2uVYquj0U/rVQokEKR5gn4WqJAYPHY9v5CTStWM+9NjbI6C3ZcfWrYC1wFZUPTYp1Xux
         VG0ovVLyx1TwmZ2m6h7dYsAYbtBjGIDWKcrr8LaNVAz5o/vwhokzfkBG0bujdQdm4YwN
         FuaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwdHrBc2a+Whv4PVb7/SJOR8MsENs6jIhGNnwFOmK7lSGsukiFOz42g0ApTV4g1BZ3iVS6EhHVNIe7rlZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvtAfgJVkyw65GA/gCt73OLdgyfs5zxA88NLLVjnhgmvPODxNb
	TpyU4+mJsT9aoKPCuAvfLMw13xp8ZOppsrZYGDL41Zcu93Odb7eOTFsTZuPSd3hyHq0GIia3LJc
	FGYSsfKebMlCX2r2bCumC0hngIEn/rGuZuJbzuNYhAGVhgIECV3P8V45//W/y1n7ViC81jEKgea
	7E9MVX
X-Gm-Gg: AYBFou25IeAtwWjvn/uRvDGe+Lz4qk2VFUVz1BSgtzqRB5gOEiPrqkH1Zew3bpFVfxs
	wHG68iJSBC1MYWYlSqrtpS0R3xTmcK2nbJqNUtHcifT20QHYmmpwfN5JX2kXj2xhNWzuvGvBwdT
	bHwF0TkKW1mEUo7MZYyvFLfI7s5bXPAMpCiEfbm1+NSBmHMcMNUDBQYkpJFsGotU0mE/GVFi7vu
	NsCW+DkJabVCDGvboTDIF4hX7+InBJLrhMMgCIUmEmhkOQubltir38FSWep11wWENyvvVeJSGgV
	Th13FU1bD0lM2aP7sKCAWKS+RoqZNr1Jz4xzzLpOV/RfRINeKHZxvidA1Zor5eK8j60NOuJjSFp
	kGETF8vIiCt4pZceUx/oIgw==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr370749485a.5.1792577923279;
        Wed, 21 Oct 2026 03:18:43 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr370746485a.5.1792577922870;
        Wed, 21 Oct 2026 03:18:42 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790063e6sm61396766b.73.2026.10.21.03.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:18:41 -0700 (PDT)
Message-ID: <ebd754fd-96bc-4f37-b390-35a952dc6328@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:18:39 +0200
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add base HAMOA-IOT-COME board
To: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
References: <20260727070758.528-1-yuanjie.yang@oss.qualcomm.com>
 <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260727070758.528-3-yuanjie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mt5q-gKvPptTcjg21k1LFdm0Ojy50PYS
X-Proofpoint-GUID: mt5q-gKvPptTcjg21k1LFdm0Ojy50PYS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX2CDJJcu80bsJ
 L403MBch1UlNvTiIw7PNEOyl/kkyA2AKMM76YHqF1sRm9yg3oIBmSqeqzDAr59bxqiwwlBSo4j5
 DA06rzmVzLnQUHiHXqROn7/SDQZHcu0=
X-Authority-Analysis: v=2.4 cv=R7aWitRX c=1 sm=1 tr=0 ts=6ad89184 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=cdovKDQ3hRzJwYAqeg8A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX/wwZYeIiUN7w
 K07bJDuomOvYEJqHZsnmM5EzPBirwOsStO9SdKVjBKZgRRc1EuQkk7of+zOEt0Rqgqa6aPhBg/q
 DWUSLRWM+nJSs6x2urfBN0WeIZZNGBwZtQi6Oy5ZK/FKxbl6obRkv03GpU+IgxjtpwBBHqjqdQp
 ZabgEE4PiCDLcba/v9FsHW1VJ/IhVYMTOV6M96lRQk+LT1gdPhHDSuLq0mgbMu7uuz+7/cc/Efy
 m98321p27gXX6wbQO4guLI/M4sUwRLAetfXw+LnJvyqpuyauRBqbT10sb87Pi4KPum8vtpJZ9Gl
 o42YKyN+AKKoLAJXoFfh5ZAyxWWePa9n+mZXflTPjBvpFy8bkZKWkt3p8nFSDflCi6GPOHByJR+
 6Lz2lt9UC2OCyP3glc/WzPvuqhdPu4wcrVafIRYqSjjrWNDNrUAI/tbChxo8r5lhTpMnX/O+p65
 Cw6V7oMbkOumCNwo6DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040

On 7/27/26 9:07 AM, Yuanjie Yang wrote:
> Add the initial device tree for the HAMOA-IOT-COME platform based on
> the Qualcomm X1E80100 SoC.
> 
> The platform consists of a system-on-module (SoM) mounted on a carrier
> board. The SoM integrates the core system functionality through a SiP
> containing the X1E80100 SoC and its supporting components.
> 
> Hierarchy:
> 
>     Carrier Board
>         -> SoM
>             -> SiP
>                 -> SoC
> 
> The COME SiP hardware is effectively the same as the SoM used on the

"is effectively" or "is"?

[...]

> +&ufs_mem_phy {
> +	vdda-phy-supply = <&vreg_l3i_0p8>;
> +	vdda-pll-supply = <&vreg_l3e_1p2>;
> +
> +	status = "okay";
> +};
> +
> +&ufs_mem_hc {
> +	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
> +
> +	vcc-supply = <&vreg_l17b_2p5>;
> +	vcc-max-microamp = <1300000>;
> +	vccq-supply = <&vreg_l2i_1p2>;
> +	vccq-max-microamp = <1200000>;
> +
> +	status = "okay";
> +};

Does UFS come stuffed on all such SoMs?

> +
> +&usb_1_ss0 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "peripheral";
> +};
> +
> +&usb_1_ss1 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "host";
> +};
> +
> +&usb_1_ss2 {
> +	/delete-property/ usb-role-switch;
> +	dr_mode = "host";
> +};

And this sounds like a limitation of the carrier board more than
anything else

Konrad
