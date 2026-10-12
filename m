Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47BF32E6BC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797339; cv=none; b=WziRlmFTw4ugdniCAIQSGt5EchZ12KDE6edwdXaZ+yaY/hBsJLeOn9+lqRy78T8U3/J2pAqn+72iLpB+JvKsShAe+dEVwBL5gpUv9QZ/9OHTHf7nsssakN1M1oC+KzEnJ1mIkdYNdrFJrp7bPHvKnAZjX0HPwWWbe3ecFw5w2/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797339; c=relaxed/simple;
	bh=HyAYHeh1Vo0SrqzbBagm0y+GX6OcPB+IoMqBVEfh+Zs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uUXLOi4yOdkv9230px4RVIznnPetKjYMHXrNz9mjwBMoAuvogevGbukfxUjSaKIHlOk4AGNKFY5Z1Yq0yhWzLeMU11xzaje4mlc3oGOp77RLMxfNbxMLij+m1zf0+agIc8PyqGSnuYDmGwaCG5oJ2C97OTi7joSI8h4lPeoXnYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bbc6jrA4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qz3QUg2P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bbc6jrA4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qz3QUg2P"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8L8LF2296398
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6zN8RehjJsYWPFVmwb24sNULXmAN9Lv2jI4egGwK8oA=; b=Bbc6jrA42muGp6HO
	oHKS+YUI6IhV4RWCKAeyLGKtG31nv2MYtBZDcMC2gL7niCl0QTJaT6u/eglnQpeD
	AnpshpMQET3PGlJtVkNQwxXSA1ndc6lcVRaZQv06eXoFxYVu62I5IXmiqaPUCKzs
	/mXRvLQ3kSDuDAhcavgI1Ot6KXibFERbSfuPrJvCvqFBQMBQr+Mt5cdPOAEMAlyt
	bgV82iEcXh5TXGwarphcbD8/sChwrGpy+slqpsAsVEObbF34B/iBT34Di5A7LoR1
	Lz7E9hihErRoJ7SG0aSjaMuz6Zz/t3Mlxn24sv3t+1sVad2dfudMyInC2zzxt1OM
	zDx/pw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7cxxp0bk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:28:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cfa4e4684bso30551435ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791797330; x=1792402130; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6zN8RehjJsYWPFVmwb24sNULXmAN9Lv2jI4egGwK8oA=;
        b=Qz3QUg2P4sT9JBSMR+fXKJl4jUnbwbvhcyK5oRQEeSV/ax0e00Sn9Ziha4ftU1M44S
         aoEu7fyN6j7E9lb9h15/I9AFK3w7qUIKv+WQFLWFchn0M08A20S3NO25TrFtrbRrshfh
         8L+L3QisaDifLlDrME4vz+mqvE25QU/vCQzWFTE43gsGMgFf05dv7eD69az4Kn6Oe77a
         cHpX2b26V4wMNQdYT5twzWypKhFcjZg3X4SROhgygEgy2NiOwC7+fS+gl0SSMk7PiCJK
         W8S1yV0JTrEys8w3fCHxPhBhTLuofUvFdlXxXr8nUStRTdIcMUaoaBhIxL63kseN3OU4
         FA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791797330; x=1792402130;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6zN8RehjJsYWPFVmwb24sNULXmAN9Lv2jI4egGwK8oA=;
        b=ofAWhtVJoDb8Dabak2aPqHNPNH02qBdvgVGQcUEQa/qFBNWAhRF0CgGeN/GwjXnyWX
         AJ/BSJlVZZoCqhOHWV3Zfw5Y4ZjqvsukfMem3dwUtI4BATZPwlSWkOy2LvxtfRSoBDRj
         6NhwDYrE0D75NhOCi+KPbOaoPF8xmQnSUQXrZclaNk4HLTJofsehzv2gNjGxrp13LEvE
         APROdjD8V8w6WeG3x1+MW0CCmvyMw8tlKQUDeAz8hYUWWFhq7EBKudGV72BqNY/tEBpi
         5jfywVn5y7AYr98Dq8MAkmXxjxN4l0RuYC3ZlS7bif7aiOmz5I3RKWJc1KiLsr+pHy0+
         fjkw==
X-Forwarded-Encrypted: i=1; AKwUvBzhR3ora4KBO4ChIvOmoKCQYW761ddKJgpUeEHg7JA6mW3LH0TAeAR/SBZ4nEEUJ4hiruR9iWLCsbNUJYs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLli8qnAh5BSQVR0vHgq5QykZH14kTl7SPQkMf21TAbakv5JF+4
	5tX6VDIv2xC0G2diYDJIV84FJMkqrIc7/JVZZjIHzdVtyaM2xKPmQ1MPVAlyg9OOMI6Wh4L6fP4
	0q8JoyCublf4LTiqUyYu1xd6Aef0OMDZRcPGtu088oWm67w1S7uf2p2sioLRUHPDOSk8=
X-Gm-Gg: AYBFou1V5X0p5yfA8ucO0VL/gonXGkCoAtWIo4Eb5r2u0vqtQvaaWHx+h+fA+cgdn00
	W8YNF4R9ckvKXAqmcKbEaxDNPR60232ww76xbddYEd39l84/Uf1V5pAkGBl6PJ7yvQkjuo7m/sy
	A2CBRlBxopLPKCG1DxjgDulp651roDD2V7mNoR3pZW1TlPCKRiz+zPAvxByAtoqlRBjjlmcbVNF
	SJG6p0NBqvzt14QW9FauGq2JCUjAaqOt9hOlO84GJcZc+nlD8EFGIINGATedbvn7mEXU0LXS+xA
	YNheGaWndvV58vTiWg1ng23OqmWavxiylO+TO8q/IKA0+7BpQmDcEBkGLzvDPB8SQjXQlKAWI2m
	hlpXzhYWTSSHXffHEtsb7J2pAwRo99g==
X-Received: by 2002:a17:903:4b4f:b0:2e3:1d30:8654 with SMTP id d9443c01a7336-2e842cd4527mr77385305ad.10.1791797330365;
        Mon, 12 Oct 2026 02:28:50 -0700 (PDT)
X-Received: by 2002:a17:903:4b4f:b0:2e3:1d30:8654 with SMTP id d9443c01a7336-2e842cd4527mr77385075ad.10.1791797329860;
        Mon, 12 Oct 2026 02:28:49 -0700 (PDT)
Received: from [10.218.5.182] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b1807sm40875295ad.43.2026.10.12.02.28.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 02:28:49 -0700 (PDT)
Message-ID: <273f7f8c-e24d-4322-a418-4fd5ed84b0bd@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 14:58:43 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-eliza: Use retention for PCIe power
 domains
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20261011-eliza-pcie-gdsc-retention-v1-1-9349dba7e0b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SXzg_8YKWRLCthb_YnpwElD1A5YDULF3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX6Yw1uu/gLl+t
 7/4sX1VTcZh705V6/o9lGAqODgx2KqzRP5QGuSnmIMJokjlv3RWAhEp42QrTRKL6w00WxhZzmrP
 RlcCIGPtfqP9KhZMHuTmmBQivj++Bbk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNyBTYWx0ZWRfX096NPhzgIMCY
 C9l+6R1LGaUOf4cdRVn16RQo7Kse/Ah+KqTxH0uX9I4JaO+Jr6McOV8ciwyfnKTnIMOvLeRfU9w
 pwlLtJ8Mn03b/8JqTgRmSUYIJ6h4yJHAsPOqHYGljbBI0wAuUpn/raqb/anze/cwQmJ+50d09pG
 jKXUZGaBjF8jw6wncE2y49QhYLB56PrH14FZ/1AEGUy2rhATpyhEqOyTDr2xVfa/JjLV2kBbh0M
 JgIuyt8LdPdRCN1LRO3PFTJwJ/XXrrqlUGcWkNOv1FrjfQAeJ+IbEehAifKTPl0ZgRolkS7DaPS
 GaMMHDodd9KsvL7zO+ee4ny0oR8zBZmoFDwCOJedyn7l4OQAskpS/nE8XXnWcoYeLlrI8AGlxfX
 WEOjXl83pAj1u6vfIXQb4mFtxqEzRoS/E6/mVPRU7N2ddeXlChIz0U9bBByNPK6j7B7EGpkcb1U
 pRDXE0A+pXFJgAn32zQ==
X-Authority-Analysis: v=2.4 cv=AsJ7T+9P c=1 sm=1 tr=0 ts=6acca857 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Z9TVNPNHG0Lt5lYLwu8A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: SXzg_8YKWRLCthb_YnpwElD1A5YDULF3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120037



On 10/12/2026 1:29 AM, Abel Vesa wrote:
> When resuming from system suspend on Eliza CQS EVK, gcc_pcie_0_gdsc
> gets stuck off when powering back on, preventing the system from resuming.
> 
> Use retention for all four PCIe GDSCs, as on SM8550, to preserve their
> state across suspend and allow the system to resume.
> 
> Fixes: 3d356ab4a1ec ("clk: qcom: Add support for Global clock controller on Eliza")
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-eliza.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 


Hi Abel,

Using PWRSTS_RET_ON keeps the GDSC forever ON after first enable and the GDSC never
collapses.

For similar issue on Lemans (pcie_0_gdsc gets stuck off when powering back on), picking
the below changes from PCIE side helped to power ON the GDSC properly without any issue.

https://lore.kernel.org/all/20260728-hotplug_pci-v1-1-d1f38cfb9122@oss.qualcomm.com/
https://lore.kernel.org/all/20260729071514.859778-1-manivannan.sadhasivam@oss.qualcomm.com/

Can you please try if above changes are helping on Eliza also?

Thanks,
Jagadeesh


> diff --git a/drivers/clk/qcom/gcc-eliza.c b/drivers/clk/qcom/gcc-eliza.c
> index 064771726e9b..21fd93a1f6b2 100644
> --- a/drivers/clk/qcom/gcc-eliza.c
> +++ b/drivers/clk/qcom/gcc-eliza.c
> @@ -2715,7 +2715,7 @@ static struct gdsc gcc_pcie_0_gdsc = {
>  	.pd = {
>  		.name = "gcc_pcie_0_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>  };
>  
> @@ -2729,7 +2729,7 @@ static struct gdsc gcc_pcie_0_phy_gdsc = {
>  	.pd = {
>  		.name = "gcc_pcie_0_phy_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>  };
>  
> @@ -2743,7 +2743,7 @@ static struct gdsc gcc_pcie_1_gdsc = {
>  	.pd = {
>  		.name = "gcc_pcie_1_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>  };
>  
> @@ -2757,7 +2757,7 @@ static struct gdsc gcc_pcie_1_phy_gdsc = {
>  	.pd = {
>  		.name = "gcc_pcie_1_phy_gdsc",
>  	},
> -	.pwrsts = PWRSTS_OFF_ON,
> +	.pwrsts = PWRSTS_RET_ON,
>  	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE | VOTABLE,
>  };
>  
> 
> ---
> base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
> change-id: 20261011-eliza-pcie-gdsc-retention-daa497d5578f
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
> 

