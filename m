Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792684421;
	b=A+kPbB/AF5loI3RwI729xNvFpjKhUaVR/cMp/LXphShSusP1mUbtWI+/XdD+3TKGEe5a
	 dBAwwprKeAWkuxNfVdjkvde5iDq7E1Ai8s013opciNmlSLgQ51ydea/C/GfHHDPMBPu2g
	 6gOjy2TnJ/nK7OYID6flLBmGmwOybn6r2pM4eLSdwFNvm7lIjTx9kjywFw51GFuOV4cZU
	 qKiHr8X98qtnBSLUpLqYpK2sYfKEi9ZMYfx6rxIdXXg291wtwGySnifc0vAqrzc8U6eKT
	 tTPkTtvyf8f00Pt7TcaaqFDZnetoi9ddOE7TXRyH47eQutJtdoV203ddQJTHWo/aCTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792684421;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YnrR2nv+E++a1n7gcEZCRuy8BYssAp+zlEpZEr5SoWQ=;
	b=VqNVox00uq829HE+I9XRYHIusEDQyPHG3tJ7wFqyilpjWCOPw+E0tTJKerc5RHdnrmwU
	 Z2ioMsR3CL2d5QZ7NC6n5gc3CNKyydVpR7a6iLLsZezgT+uOsy4ysSFK7Bkd2ANrku1H1
	 VA8A0LoHZmbucxp735H9kcKKlloHe6LkBBZARBWi+ceq49y02OiVhYCL/4Xy49qerUo5e
	 7P8PRVyQgTt9yGoFSic3AdvVCn1paDirrBZGIzpcjfSnFHzp6pN7/qvz02lQBSlQsWGBP
	 ITvWwxNGk71w4U8wd7PPq+0TvgVkzFZ0ZT7vTentb6dd1cez3G/m4ry1iZROHRnxgbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRAM0fzz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPzThDW6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87732606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:53:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87732606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dRAM0fzz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IPzThDW6
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFxMG3555251
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:53:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YnrR2nv+E++a1n7gcEZCRuy8BYssAp+zlEpZEr5SoWQ=; b=dRAM0fzziD+TMvKh
	PJUzQUWyv0qh0oUF62rO6FLa5NtPq8Mo+5cUp6Fecga9ufUdz3f2DuzSTxd+WJQd
	+dcn1H4zNUJZPuCbkU3aKF7JRLVOPghoFrAYMYe5PB/4COfnDIbiWSV+4+XGJXsA
	2+M9Th7ezgJa/Qe5e6/8fjeLK6BiULQt1E+7zjWoDWeTS+EwgvsMEEgtVKPR2HFc
	7dTUfKIUZQDgk2VAvEqZCzV0u71N47xCzFgbBoIZkiYAFtMBkXkSpfKr+r1FUK7z
	oPL0zzb7mhSqpAH6K/oscXLGeF29mzcAv63pPxeVfYjBFLrUfGpEXyltrdWTjBTf
	eAnMDg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aca6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 15:53:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91bf35c4c78so68566d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 08:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792684413; x=1793289213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnrR2nv+E++a1n7gcEZCRuy8BYssAp+zlEpZEr5SoWQ=;
        b=IPzThDW693B6gXrcuAF0fDIJOKz+p85HydW8DMXNCOf4l0CzDH1CMsJtuMLhOpX2oR
         ICvVfz7V0gxymI30WuPP3uoUSiqp0ojx1QcYG7VWqY2w02tLgELAt+n5zCd53bnNJUX1
         hcIGO064XdNLAhGSeRv+AHiTjYH7/amR3ITNV/EBnkqW1ICZmXz+6LnzzBFyMDd8yxv+
         wOs5EyjfParmGl1ZnUPpU7naMrhmLWUYT+2/17P/FXk0+fs5cNcuXGgvEssmZYJ9lRQs
         TA5IsuOwuXtAk3WwP47oYS5b2MT8HgAPSNlcdJtdHHv3i8WQIGuK8XOZk5cGip8EjeBF
         YflA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792684413; x=1793289213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YnrR2nv+E++a1n7gcEZCRuy8BYssAp+zlEpZEr5SoWQ=;
        b=sdzh86l+ncPiJK+yFnfADl2kXB/atuDfzmAS2uHz/mhH6WxJS6/IJSugYqLhkdjeJK
         JCO8qagRdxFZ9vejmjFZeskm8FPRYvSzWL7orUBPZI54T6eD+ZC5MjEd8UIViNT6mLGT
         fc+HVSuX/0u39jTSpMuyXNcro25Mw1OmYzfUi1NR1LHrdvTHO4XlDV5K5F5qFEJzAlAs
         +sZlcTazEyAYHWW1Y+ompcdrC9QD6mSkBvomXrN0YoRiZWo/J6VKyZhsEaN6xenCvBy8
         iilw0h+czMz5WQQrKLoHj4FICtLinbPaOHx7QCJ6HSljO1iI7vbTJ12gKLsrmo/1SDEQ
         ciIA==
X-Forwarded-Encrypted: i=1; AKwUvBz2ksxrwv2Tbv55bwvW01f9dh5ZWsZj99jZOiyjHdiQa5k6G+CcZP3j1RvXOj2dcXxddtUJSTicPaHUNl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJxhQDBxOczw3HYzjS9uKnnvczM1w/7Itgu3BdB0hskHAWYoJPd
	3k8zJ8xaRKSyd5xBpiy8dQom+waiwmEeqlHDbY9cTQ8+j+Q2ag3pU3B0yXTR7yT7/pZapGzgavS
	SRujc6DIGwCQ5XRFoA3EcBBB85bEf1mE0lMAATu87B+J9Km+kbDFbMRT/NaNV1BzgYI8=
X-Gm-Gg: AYBFou1fceAhgAp81kdswdw41Jde5FPDRZUWzy1WEFvY3gfM8y0jGjLH/CbBVyI6x3R
	WPggxRpDgsPJbMpJxLzl+8PymimubX6+oQOI80bvqohcPh8zJvRJiBJsBhmTEDjK5RqEgoiZ3OT
	8zvTRKED+Bg8Xy9zVxxmS9H+rsjWPj6iJeYTKxVcUj+ydSNcCUpdoz/lAbOtu82XApkTUXBQxVJ
	9z2lC7f6hYkFncbIQV6fXBoIQFRncd97aVbJ3Vgzndl+NjiiXXwjTXR/PG1tBccw9ITVXBxB3ps
	omG3qHMXjgzV26SN3nwX9Ohm3AbjKked36zkkGWqReW8FsKj3vdl8WIKXdV7a6dLXCIziOGJ+ih
	MWUiI29Cw6FQ0O3vP65QMJw==
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr1170113485a.2.1792684412561;
        Thu, 22 Oct 2026 08:53:32 -0700 (PDT)
X-Received: by 2002:a05:620a:172b:b0:939:8bc:8826 with SMTP id af79cd13be357-93f57e897a9mr1170109185a.2.1792684412062;
        Thu, 22 Oct 2026 08:53:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5ce8ca6sm1162566b.67.2026.10.22.08.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 08:53:31 -0700 (PDT)
Message-ID: <c78304c6-f553-4537-909c-de37c09e72c4@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 17:53:28 +0200
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
Subject: Re: [PATCH v5 07/11] phy: qualcomm: qmp-combo: Extract common DP PHY
 init sequence
To: Nabige Aala <nabige.aala@oss.qualcomm.com>, Vinod Koul
 <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa
 <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
 <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ada317d cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=G15zOZzxmr7XqyTgzFkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: aJqVY5RS8rkSBPldmhxaCkA5vQqfN_nP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2MyBTYWx0ZWRfX/ytbWiM7NvZs
 EQa5fAtCquwvqXwaPk3H1qfjV5TKEaEFwq1ms8YTbkfG6bgHbzlq3ea/F0v8+cm+JOv8gDm1CT2
 rz4fkGCzeZ35HP+kscG+cFHP4asUhBA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2MyBTYWx0ZWRfXw/ZGYi4nKI/L
 svyDtUD7jSExjnUt6OCSXnmW34lXogTkWOG46oDWdLZlsGrbFA9vN2wb/zmU8BmFdrp8XPvOSAn
 snHuBT2JhDsMsrTNTiRk5KMZuauU1nyhRZql8z8zUyzJJzy4jmetdlyMRF/IEF17Wo9NKtKuajg
 S7NJTjjdNZmMEwXyAtk83a3KdmXVhyrnHa4NMOn+Y6vTsQqk5F7vuX3m59sjHkCWajuCUvYA4KV
 s5Z5BJvpt3gW5uekAhwb30AqbVnSqYpnouRbJjcYLZp077xStIb3yP3/GGJzjLY5jd4dklkNlvn
 TLiNVw/T2JzPMbUrTUXsrsJ4ytdwTadkKkV7EbKHxUBDdolUZ2OHRTqEU9crnT+8mqEQPcalRX/
 /W8TWxNXxVdp/YSvPfqitYHfYFUskJxtL+bKWXTmntCdUNmBIttQ5rqVHR4zk1l1vOuDL1FUYOC
 ktGAx2wC/NeSj/qYMww==
X-Proofpoint-GUID: aJqVY5RS8rkSBPldmhxaCkA5vQqfN_nP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220063

On 10/1/26 11:34 AM, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Extract the common DP PHY initialization sequence shared between
> qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy() into a new
> qmp_combo_configure_dp_phy_common() function.
> 
> The common sequence covers:
> - Validation that dp_aux_cfg2 is configured for the platform
> - Writing dp_phy_cfg1 and dp_aux_cfg2 hardware-specific register values
> - Calling configure_dp_mode() for TypeC lane orientation
> - Programming AUX_CFG1, TX lane control registers
> - Invoking configure_dp_clocks() callback
> - PHY_CFG reset/enable sequence
> - Polling COM_C_READY_STATUS and COM_CMN_STATUS for PLL lock
> 
> Refactor qmp_v456_configure_dp_phy() to call the common function,
> removing the duplicated initialization code. Update
> qmp_v8_configure_dp_phy() to call qmp_combo_configure_dp_phy_common()
> directly instead of going through qmp_v456_configure_dp_phy().
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 99 ++++++++++++++++++-------------
>  1 file changed, 59 insertions(+), 40 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> index 5446b8333a1e..fc35da80e57f 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> @@ -3489,6 +3489,7 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
>  	.configure_dp_tx	= qmp_v4_configure_dp_tx,
>  	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
>  	.configure_dp_phy	= qmp_v8_configure_dp_phy,
> +

Please either put this newline in the prior patches or drop, otherwise
it's noise

Konrad
