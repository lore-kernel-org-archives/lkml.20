Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357336;
	b=cCuqnz85TUBHsysFElyYXvWYUswieX1bn16onhru7krRacC4vcm7BEm1lJa7RA1OZ8mN
	 aIDfA8iLyeIiN8XHpktAVEhY4k2UGSS6AWaBsDYMCEMiuNj32vwkHyhOu/TeKwx9goKPz
	 aHrNhiKX8CTQ6S/51jmqef450Oz9Gb2e2QBOVvgTmysz1Djjl/i9kKNISJcrplvdpKrOY
	 tGeywVbCRp2GHx/Zv/WEmb0RO9oGyue2voQcSUy7Lzozr/dYg6u7pQlV+iyZ8/bGjCzr2
	 tE8zLpInH6ZQaw21qx2e4+pg9ORgGK2CVNCpq/2vjovVgbkalCiVPmmgt3Yh5Xxy7/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357336;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1JbE8IqyvSCxx7mA/NYNAikqwGpNh/7qxainvvYoN/M=;
	b=Hq8RLLlyJPgJ2/gp5Aj5+1SD6dNwDkOFoU1lDT/Q6AX/j2Qer1ukiHbc11i9Ve21S2bF
	 8GmfLceVOrogh5Yb0aDfSKRXqJT1JF8qu4+1ukHu5CXSAdAk/Ml09hhoVpR8iW/1tW1cM
	 sidErqfHHjwf8qFaaWQoaQEmz8RqYHshUsOYKLJ+Awjr08zZeSxRdfR9//EhqhlBJ9l6X
	 Pj94UlA+pS6JzZrWzVKH3wq7/QCeykmB3Aa3Uh+DCT6XehcqNBB5o7AlY23aIPFdJEozJ
	 boycCaTNxmBKhT3GvSH2TZiJ84Pnqu+PTMJhYDBXlrXl18QuywRl5G3gWrOjP2IrRuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwuk0mC1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Okm0GxvP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138A60A263B
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7138A60A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mwuk0mC1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Okm0GxvP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F0Xb2721626
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:48:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1JbE8IqyvSCxx7mA/NYNAikqwGpNh/7qxainvvYoN/M=; b=mwuk0mC1E4xSYA2w
	XB9AdDf89gDZEqSrzDDCy6FZSeTeZnknYyOg8BgCrIryBgPDDyWqIlnxwIp9vBV8
	OTwPAQDZNsU3qKCivnlC9fSuOuKzjcl5gVqqOwC5v2H9GtpZZCiI8tv7tuByN94j
	YiZRzLAkVEarR6IizCccFRi/QwTKE+jzi88N91Piwk+C9HaaauaF5qIKcd/NJTSx
	RJ1V7LFFjbdcD/Tf2ijMDoqK2o5cZOo9+x7/TTPzFeuNXUqgc3K0lY1esDOPV/Hv
	sujG4wL/PBdzM4eN35x8YXqNh0qTCqgegzmBB98tn/0sl5eNNCtLAN6Jb+OmdBpk
	4DE/bw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjhf0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:48:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-35c5aef2a74so2624026eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357333; x=1793962133; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1JbE8IqyvSCxx7mA/NYNAikqwGpNh/7qxainvvYoN/M=;
        b=Okm0GxvPytPvqafGLHZlpGAxn4k+H/YVRV9d1yKfovkPRX5Uo3gK+GDY/O38GVKkdN
         wah2jLsnqWLe5Nn3OLGJzs2c04SBHlXyXZmyU1vfylY9ZOuO3Whl8o5E/JWKb/B/MjUb
         G9zGvwbdv2RH6qGRVtVPd06kL6REAihoXNqZVvaHhBSxgr9qGrWlo6F7bVWUfNa8E+FB
         QSFjY7QCLbxRW458ofAjOxAqXqT0UqBnMd/dRTy1BaYCpj4mbNKA5mZsgUarQbUiGqiv
         ya9w3rLEPCUZJoQqLMrQF28IVCDq8jnAd8XcJrsHOOj0OfsHRWdlROr8I6/32WCy3LFM
         UQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357333; x=1793962133;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1JbE8IqyvSCxx7mA/NYNAikqwGpNh/7qxainvvYoN/M=;
        b=tabFdKyMzEg8nhtTmQ511GifECR25pCAN56+4C9aFOJ8XgcV8/3whzyfyrwBdQ0Zpe
         o6NodadaPGmWyT2sOhxA41pMRvQbM4Vqtfla1hr3mMDmL4j+++P2dDllmZkHDR4diEAq
         lc6ae9DG3fy5Ke1ugQOvUhrRuTCXSmJaPS/TwHjIRzo0EaCuy/r2TPBAD0cKVliwMyTV
         NUPDn1Vfq4uydMS36ZW8wqYB7YTB74vofJbE3e1Xf4ZNNUvmDOtnd748/ZpWFMWWimfY
         OZlcPED8Fx/ANMsHd7gaYclz6oVYRT0PyjBWVG9g/MwEx33f/LY9sHcet7VDimqVbbqL
         TVxg==
X-Forwarded-Encrypted: i=1; AKwUvByujPI81XlKbjwrVLa1vrqFDWGIIm9OIU2OutBBrJ4eG3z1ojp6wxSr8U8dWXH2q6DimycPTCtT6e8bGws=@vger.kernel.org
X-Gm-Message-State: AFq9FYJVAUD9J7Yf/VtU/YNwQmcLHaUVaTPyPwIqmXExOmVdlR/5L7Er
	S+gw/b1aD3u1rOOF2WDS01Ra83nklKrgxWPKvHgleK+HtK6WW3iNR58Riji8wLWph32dQ1oVIec
	7vsime78lCH3llcY6U3ajHPwl5gBAXbLPCH7nfYqaGe16q+MYzcFnwg0t98mSy/2Upiw=
X-Gm-Gg: AYBFou2Oj2kKkyF6lDAyRnHkw2zpxPpaNwbY6wH/MPPBmzBMAzVeoPnuc3m5dSO8ey9
	fXgPf6UkVLyqj1yUshiwMBH7qh1KVzhN3vxzdrBKU+Wwf9FbunNrdnxauhY7wfF+HewHXrGiBN6
	/CG+IkJQXPwWSbEXf3r8QNaeA9fkGd5nh/ohjcM0RcjTIQKriu5vgDaNYUr+Ue8JLoUVx67DVhs
	vxwkGmIjg40nXOKpvWg18Qvv061mPlHlHT8M6w9zD8J6LCfH2iXmaGB08Eaygo6k/fOTRAEmdvP
	UgCL0aDhOU+6UVyzJdi7jRsohz/etDIj4aKgDHESVMr0jP1lhGenX9N3+qcXqwCRo9r8v195WrN
	gx9hHMwFbla2Kr0z/y+wPuvR6ZsGAZrHqCjkfEX/rB9WpWsug/GFZqDrwBsm0K/9aJTlvoJ4drQ
	==
X-Received: by 2002:a05:7300:a8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a422084d2mr3133288eec.1.1793357333094;
        Fri, 30 Oct 2026 03:48:53 -0700 (PDT)
X-Received: by 2002:a05:7300:a8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a422084d2mr3133255eec.1.1793357332452;
        Fri, 30 Oct 2026 03:48:52 -0700 (PDT)
Received: from [10.218.27.35] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm6808900eec.21.2026.10.30.03.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:48:52 -0700 (PDT)
Message-ID: <dae22788-8534-4b82-ac49-c75fe3b180ce@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 16:18:48 +0530
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
Subject: Re: [PATCH] phy: qcom: qmp-combo: update offsets table for x1e80100
From: Tapas Rana <tapas.rana@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Tapas Rana <taparana@qti.qualcomm.com>
References: <20261030104404.1945160-1-tapas.rana@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261030104404.1945160-1-tapas.rana@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JCQ0rooD3H8rXZV-JHodAJiwM6H7Atw7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX6uYDKzPsaKuv
 F8Sf0VczAIG7JiGx81SVJj9L1UbPU5GGSGshfD6tJCPqlENlpBmBg/E1VuSJNJcDIxW/q1PxuwL
 5BcGlWa0xqvo6Zqkd6xIMpLBfnFNk6A=
X-Authority-Analysis: v=2.4 cv=DfSCOftW c=1 sm=1 tr=0 ts=6ae47616 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=DHid641ov1PBkfMhs8sA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: JCQ0rooD3H8rXZV-JHodAJiwM6H7Atw7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX7dzYXewXRkJi
 zDKXogfGbXeZeTmotknSenEtdeRXEoX+ZPAZ2pCPiCRZJAv8uBbf/EqBCWwraXKyshhRfDzPbqT
 OgFF0oXZWa/+aYai4gCf5XS4lEpImp5KXO3rNrBWAlq6f17wco7e/bKEzpWbGmsq3UqQJ26GSir
 UIsxQ0Ri7II1njmOPA/EJ9st4+2PKxenDd9EZ0gocIw8jmAF3xIpyHIFQQL/A0ixOPZiEzl6kuE
 6BkWceeGRcTKOiW11TpYLndACD1edImPhtCop2UeComhuDm2eCaH0Y9vXNpIlEh92a1ehkif3rT
 1NkISRkqfQr9W0Jv8qZFjYnRBk57K0fKTNeHAkNbVICunw8VEUoZ8eWMTd9t4N8Ih05Cqj3zBpZ
 Jl1ZysnO7e7bu4Uetw0qN/Jh1gQmCic+yjlr427m+tnDzhgj4+5o3MWnQjb/Uv780zECjyZ2JK3
 +TSIzsxJDSbObJykdJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300042



On 30-10-2026 16:13, Tapas Rana wrote:
> x1e80100_usb3dpphy_cfg uses qmp_v6_n4_usb3phy_regs_layout, which
> places QPHY_PCS_CLAMP_ENABLE in the PCS_AON register space. However,
> it uses qmp_combo_offsets_v5 currently, which does not define the
> usb3_pcs_aon region. As a result, qmp->pcs_aon is not mapped and
> autonomous mode falls back to pcs_misc for clamp control.
> 
> Add a dedicated USB3+DP V6 offsets table with usb3_pcs_aon included
> and use it for x1e80100_usb3dpphy_cfg so clamp control is performed
> through the correct PCS_AON register space.
> 
> Signed-off-by: Tapas Rana <taparana@qti.qualcomm.com>

Sorry for the spam, I used wrong email on my SOB tag, will resend the patch.
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 187f0cd11f6c..aa9dc9716574 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2762,6 +2762,21 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v10 = {
>   	.dp_dp_phy	= 0x3c00,
>   };
>   
> +static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v6 = {
> +	.com		= 0x0000,
> +	.txa		= 0x0400,
> +	.rxa		= 0x0600,
> +	.txb		= 0x0a00,
> +	.rxb		= 0x0c00,
> +	.usb3_serdes	= 0x1000,
> +	.usb3_pcs_misc	= 0x1200,
> +	.usb3_pcs	= 0x1400,
> +	.usb3_pcs_aon	= 0x0100,
> +	.usb3_pcs_usb	= 0x1700,
> +	.dp_serdes	= 0x2000,
> +	.dp_dp_phy	= 0x2200,
> +};
> +
>   static const struct qmp_combo_offsets qmp_combo_usb43dp_offsets_v8 = {
>   	.com		= 0x0000,
>   	.usb3_pcs_aon	= 0x0100,
> @@ -3003,7 +3018,7 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
>   };
>   
>   static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
> -	.offsets		= &qmp_combo_offsets_v5,
> +	.offsets		= &qmp_combo_usb43dp_offsets_v6,
>   
>   	.serdes_tbl		= x1e80100_usb43dp_serdes_tbl,
>   	.serdes_tbl_num		= ARRAY_SIZE(x1e80100_usb43dp_serdes_tbl),

