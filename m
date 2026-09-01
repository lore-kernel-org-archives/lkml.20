Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68CC2BEC4E
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 12:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788266037; cv=none; b=rYiD+2agPURCgDI+bue2NCoYETvQEr0ynWomeuE/i4cyp/lTNu8rRg9m0nTAQir1zECJEicYFCW2q2HI1BkfbptFp/8Z7QP5ZShSKkJZtVhMrX6m+JdIIW9F1LCXQwDNCHdW91UUfnkXa7eLKVwgPh7Nb/DkxbsWKBwRjMQKKZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788266037; c=relaxed/simple;
	bh=+GrlwZTegUS41iAh6l8A/qPck4pkUf64zUownPs0fqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qys8Te6KUEh+HBlnwU83tRJhnhCqR0rtcg9nDBuG8cuJOBaGe3h0TuQvlAmHIlNjB0deAraWBAAQ17EQoWnnYmc9MX9dMP3IQiosYbyv5tugHhNBgEFavf0b91OEVL9CuJt6AWR4zgTNajvsxuD7W0CXj9wS7s+lKqJrBB7b9J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgyopRWB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fMfceL+o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgyopRWB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMfceL+o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJ9Hi1641390
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 12:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/LKqjBcRNiuGtvZQhplHOiUwQdWdAXbYDnr76Hzm+RU=; b=UgyopRWBjVj+DPTX
	cAvb0wCnTHAOgC5V1wsNuga5eh6RC/LPvxokzQAOj0HeJoU4+2TvcnzLKuxg5xIf
	UwCRMRSWXsJ85N0yG1JVkuEq+dGnfjMnTAUCL8kA/+y53bbHV2Vy41ogesTnV94m
	d6/V5obm0f3H5tRMzTqZKJbaDSBA40Dx7XhqqykMBN5w77Un0dLraTWE2MxDmj9H
	9RXlbg5Rh2H6HNwKEUeHwHVkdOrYFKMwz3FvIv5gpcKdU/tdrKlEqme72OcP+9mZ
	b+lozg01MpOlWxlCJ4rK+YX31ekiSaVFWH3yfx6qVHJhhRcfNcJV7SZGN20WljVb
	nJjyng==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdnk8tkb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 12:33:55 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so3554449a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 05:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788266034; x=1788870834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/LKqjBcRNiuGtvZQhplHOiUwQdWdAXbYDnr76Hzm+RU=;
        b=fMfceL+oLKqeJj3mDYH6orSHUKOCB/0jm0YBZQN1bE/4uf2SSIf6ev7gurcgRJ/EkW
         mr9dzEOymhasduNhApgWvHWpkunN9C55u9Z0nA5QifY1JBmzHBLTqHIbEKusAWLACrUg
         +TS9AMbsDBKjhOMYvRuieuBkGu0zLo1jMvVX4XGSAgcNlBU+CDSu3SGIatlFMCsDIXL+
         4v1U3ly1SR3bXG1iqR+ulKpXc4MsxSALrwLBYJMkZ61c2DjWtkbUahgQ3JFJupNwhnTi
         tUCXKDQOBce8ptRhb5DeQIYKwM6xN9rKLRwE7qAM2bRyPXDF2IDDRIdyAzxUgR7Ewvcc
         X9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788266034; x=1788870834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/LKqjBcRNiuGtvZQhplHOiUwQdWdAXbYDnr76Hzm+RU=;
        b=OacxfD39UJZarOJ3SpilGxJ/J3MiOoo102YaZWwnGnf4+wzfE8urKdY3dDiWnY87zt
         0lWOBznNjtpo0mJBdIjMPP+T7jDmZ2EY3jk4pBOjEFWI8gWFJ+tXmnM0GJTA5nY94aqM
         U4sv8Mbrap/VVgy+gysTPSD96g5BcDbhGkkjsEIBgDUUqB2JSzHnwzcZB5bhj6+1LUmA
         44AgXOeMzJ7ZinjDR7icx2ybNtLHgqaUQHdzZavxIz3YZeeeru7EvL7sZQWsxVcOqmI4
         qQgmnUmXhWXcJtM0IEU73qwgxfBSm5d8vbm2duHntxRusOYyyQoKBaBAw7vRerDD8obY
         /XXw==
X-Forwarded-Encrypted: i=1; AKwUvBwSgUOH6UKLqlKl30BQo/L8JHK+LA0cAsuMfWbO08OK1mqh4Lm8TGp7DSKNXAhVByZX8L2U2o1R4RBlO50=@vger.kernel.org
X-Gm-Message-State: AFuF++lbYV976A+1u/Fao5K+Wn8O2GFNWfRoDxJ1DfGHRRDv3C+BIwOF
	x2ovK16BI2my0KNCV0g1S1Ml62wDKGH+ZKB0caj76Sod37P0A3W0MF0rHViHoOsHdkCTvAuABCn
	QKi9QsouD/PqxQgwYdHYge+kTZw8PtAOV3mfcLgi7UkjYKVbstFfTy6nZVgfve02vPE8=
X-Gm-Gg: AYBFou06VqjJ0JZTQZ9jgiypC0p60p6B80+qpHNObHlD/XX4ozzzXi258/8g0J5644h
	8A1oWS7s/eCcauXbAsrzmC5Zw+t+Cu6c46aS3LN9IbTAaNF9IaT+LJ506lcY8rsdNgTr97kx9Of
	teVyuVDQ+ogrHywfzsxcj1LLufPokO0kS65ZTtD+GR6795DoU8QpvpRiMm5xj4juR/VZ+m9d2lg
	Ccwxki0XAzXSW7p4VrPioAyj3UFSsDCGWC7UxH1WHY+snPuapjKe30DtZVSQTRS4shOItMQOJ02
	VmD8NobJlfcaz8qMvRYEebSoSSuQDGCxKb946sbeh7EyzURf4A3m3F2m5nO3rXPu6R+aBC8iN1V
	l3ywaI8lcwvj+nzh+VFr8Q0mDgZM/R1ihtxgd7ZtRQI/I2bEEvnAXzoTUD654gSex1CSV
X-Received: by 2002:a17:90b:3c8f:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-398dc16407dmr23761060a91.7.1788266034325;
        Tue, 01 Sep 2026 05:33:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3c8f:b0:398:dc16:3c29 with SMTP id 98e67ed59e1d1-398dc16407dmr23760956a91.7.1788266033862;
        Tue, 01 Sep 2026 05:33:53 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.240.248])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990d499811sm6791102a91.10.2026.09.01.05.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 05:33:53 -0700 (PDT)
Message-ID: <36ebf737-e462-4c53-b6a9-51d26d4acc35@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:03:46 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] phy: qcom: qmp-combo: Add USB3+DP PHY support for
 Nord
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260901095055.42229-1-shengchao.guo@oss.qualcomm.com>
 <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <20260901095055.42229-5-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=f6p4wuyM c=1 sm=1 tr=0 ts=6a96c633 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=2sMs7eQfJahgYk7ien9XMw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=drxAI8maUB5UtpXgck8A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX1WwJj8g1XrBq
 Z1B9M4EhmYvNaIliWlDBTbouOjVgJ1zCPqMzjNYISwsAKD7Y6FdFDtaKL3zlXqqBcrlUNHVh3ss
 wbJhmEkA3cMGA0rkD85DtOMhWuQeGI67PmJu4t9K2isOvZ3Qcx8X5Bu3pRewyR2vXHwP0ya+Zyn
 dGszML9T5PxzqblPL1VmTro8hytbcEOO6En6qIRp4DqGbKucUMrSCHQAY2SGWuiBO3LEMccQc2j
 d4GIylnvQAO5S8iCHZfMGIE9k8+PizjEkkbaoBKyIh5MmVDceg/SkSdomnve7Pt4ENuFMQGsK+M
 qgtE4RLh3I80duWBLbgDBLz17mG0/4NLtyGzm6UB9+DlzvuxAgSLmwSoBxiVdrze8VkRQEA0Qle
 0w6wxmNgbAAgBfEuBPmDXk2b+sXnjKZ0xXS+1s9aXWxlx++DrthUtetCpDlwZBSCwPy6fKSinmh
 fnO3TNzgEZlVvM594dg==
X-Proofpoint-ORIG-GUID: 3nlUFvEdYnK9CitoF52tH2UqMSBkU4Ql
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDExMSBTYWx0ZWRfX5t+1lhRYsfE1
 d/vja/vAUzFZerSJkoncOzhZS0qta8BN+hkQHpwLfbxQp9mBp3Bt4PRWN948YX7pnSiAZBizOfb
 xfLs5mdGRJ9n5JoQBA7oaNlIwxMde+s=
X-Proofpoint-GUID: 3nlUFvEdYnK9CitoF52tH2UqMSBkU4Ql
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 impostorscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010111



On 9/1/2026 3:20 PM, Shawn Guo wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> 
> Nord SoC provides two USB3+DP combo PHYs. Their initialisation sequences
> are identical to sm8550, but the sub-blocks are not laid out the same way:
> Nord adds a dedicated USB3_PCS_AON region at offset 0x1e00 and leaves
> everything else where sm8550 has it. None of the existing offsets tables
> describe that, so add a v6 table which is the v3 layout plus usb3_pcs_aon.
> 
> Populating usb3_pcs_aon changes where the driver drives the I/O clamp when
> entering and leaving autonomous mode: it now uses the real AON region
> rather than falling back to PCS_MISC, which is what platforms with no AON
> region do.
> 
> The offsets were confirmed against the Nord register map for both PHY
> instances, USB3_DP_PHY_0 at 0x088e1000 and USB3_DP_PHY_1 at 0x088e4000.
> USB3_PCS_AON_CLAMP_ENABLE sits at offset 0x00 of the AON region with a
> single CLAMP_EN_B bit, matching QPHY_V6_PCS_AON_CLAMP_ENABLE and CLAMP_EN.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 66 +++++++++++++++++++++++
>   1 file changed, 66 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index c39ced168d03..de82c7107c92 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -2690,6 +2690,23 @@ static const struct qmp_combo_offsets qmp_combo_offsets_v5 = {
>   	.dp_dp_phy	= 0x2200,
>   };
>   
> +static const struct qmp_combo_offsets qmp_combo_offsets_v6 = {
> +	.com		= 0x0000,
> +	.txa		= 0x1200,
> +	.rxa		= 0x1400,
> +	.txb		= 0x1600,
> +	.rxb		= 0x1800,
> +	.usb3_serdes	= 0x1000,
> +	.usb3_pcs_misc	= 0x1a00,
> +	.usb3_pcs	= 0x1c00,
> +	.usb3_pcs_aon	= 0x1e00,
> +	.usb3_pcs_usb	= 0x1f00,
> +	.dp_serdes	= 0x2000,
> +	.dp_txa		= 0x2200,
> +	.dp_txb		= 0x2600,
> +	.dp_dp_phy	= 0x2a00,
> +};
> +
>   static const struct qmp_combo_offsets qmp_combo_offsets_v8 = {
>   	.com		= 0x0000,
>   	.txa		= 0x1400,
> @@ -3394,6 +3411,51 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>   	.num_vregs		= ARRAY_SIZE(qmp_phy_vreg_refgen),
>   };
>   
> +static const struct qmp_phy_cfg nord_usb3dpphy_cfg = {
> +	.offsets		= &qmp_combo_offsets_v6,
> +
> +	.serdes_tbl		= sm8550_usb3_serdes_tbl,
> +	.serdes_tbl_num		= ARRAY_SIZE(sm8550_usb3_serdes_tbl),
> +	.tx_tbl			= sm8550_usb3_tx_tbl,
> +	.tx_tbl_num		= ARRAY_SIZE(sm8550_usb3_tx_tbl),

The values are different for the following registers:

       USB3_QSERDES_TXA_RCV_DETECT_LVL_2: SM8550=0x12, Nord=0x14
       USB3_QSERDES_TXB_RCV_DETECT_LVL_2: SM8550=0x12, Nord=0x14

We need to add new tx_tbl for Nord.

Regards,
Krishna,
