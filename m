Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75BE47A87E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789041580; cv=none; b=HVoKRnRPHkiwcF1CdjzfonlLUrjenXH4PBU4pb/oeBvo8WrJCGFKcOKfrE+Lz0CjzlTGNPQ8RZQASAwN8/Jt3rBTi0fHvaggby20FtS23HGla3co29qQytKCyG9fkBGOg6hiVXuuAyxgBK55Vu8Mh8AiU2+K6hGll2jbXnvBG74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789041580; c=relaxed/simple;
	bh=GJ6BpM1uCHBMBrapIEX/iqtBhqYUuga43iBpGG2eGdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKr81KexoXKLJILqTRtmDbc/yECRQKT3Q+unOm6Of37kR2qrrSPrGfJq3mCO8Sy4DC2yE4c77SrMiZ9h52dl/P7HnTITp6bjwHapWt1ZIs6KoXfObzi6qUZR/12IPhn5fuNYISlD0fINfrjsxHv5CF+az3he2Pc1z87Lrf1hTLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n9/HO16S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObiPoXtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n9/HO16S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObiPoXtN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pj2R3967745
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:59:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CLH7qz0NWdvoLgl92qGsLU+S
	1iK5EIOdQRdtGSN4UZU=; b=n9/HO16SKv1rNrD0EOturQxMY2N3dpECxgmFWkhB
	LXSDtsXHN0K51TYYvi958EY1NGRpr5r+w6/WP5HcUQYdgZCOM+2UiCRKCPC21Km1
	4eenrRN3TRfflC8Owd6IHCv1OTDP7M+GAPFxFFXxPmlxjdl3lLQV7Z2IxxawXflk
	vANxWEnOCN3SHNX9p435dAAD4X7+JR2MxJy36UThfActzGXgevDicol6sLW/SH0Z
	ExfjVugFYukJBVjPLRtw/kUQacJUf2hNUqfEB3XNnhM99wfD0IbK0EbK4RJF5SgJ
	+8rqKd8rsgBjmVPMMPUzEnnvkLSJWmivxdWDEFZwZ54ghA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkrdn8xwq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:59:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so85890635ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 04:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789041577; x=1789646377; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CLH7qz0NWdvoLgl92qGsLU+S1iK5EIOdQRdtGSN4UZU=;
        b=ObiPoXtNFXAC2zaOKcAmpwVGJh2ztaHRsc1G0j/foecILYN3zLum+wFTJORW0NtNtT
         ONp2IYibCv0/eqFEqcOnT8iJEGcbk7IG09oGUeokDZzof0Qh5IDcjxemi5CLB55y9OL9
         JkNA2Qt6CTvmfZvjugOsi0sX7cIwzROGEAHQ+hVY4Se1pd9E9O5VMBNWLk9ybB41HXMx
         1zZbPRHp7dAQTRDRPg+NcJ0eWVU1GseQynpGDhB09sSnpPCQe0naKCNHvOHgY0cW4G8f
         gWIS8KCf/NnRT/0ICdLXiyy0PGGBpkYTm/XqJmZENrhxEeiUOrw9wyXuiqnofv54QFln
         jwZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041577; x=1789646377;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CLH7qz0NWdvoLgl92qGsLU+S1iK5EIOdQRdtGSN4UZU=;
        b=rYikBs1wgBbns1zNttPz7Gub8TKOHvORPNwsdnMn0nmg7Ztq7hfBv8F/ukD884//9G
         eThIICkQh2pqgmVUwmRxktbtQcYi25OzzHEhNPXgaYQXWuxqJf9yl5ixGo3JVaKjPcKu
         d11yHSB4TzIejjmVcKenlT/O0R5YUPBQyUf/WFRtwe8DDfQ6tq/10Ze+0Zp0X9gE3omc
         yio/Swj3gp5AJK3BS3ykXEmVNxwQ4batwxZB1aEiEKIX0zouIyqgCDa9B7PAu6RrnLH7
         US8xDRfzvCAzVbkwEVgDNtwUZBtv90PXdDS3jT/NkGRcxQWE8cMerdmInFQHxaGMvBiC
         /EXA==
X-Forwarded-Encrypted: i=1; AKwUvBw9jJpvJ2FP1dXBAzQ6mPD0KPkSnCHdA7lqzLEme6PyWBaiC/YJreuJnrbqmpGNzMqNaTz5+xZSB95/b5M=@vger.kernel.org
X-Gm-Message-State: AFuF++kFAq4l8nrDzOL+cbdo0Lb49wnfGFDxf7tOJMVk8G+gN52XhvtZ
	vT+PnDsalu4Cs+7NtEC/rs2lH/Y4IaNpTrql/ApINDNGLDAMJw5FMP6qXNy22AdmS5t/AQWc/hf
	1vfYw7UJp9pEkvLiuNLet17vUwTBYriwlZqKlumi2DHf01nkSYqVbyynZouglK/z1WdI=
X-Gm-Gg: AYBFou2KjKBUbjT/lH2xbRmRaEhOqJWmOLuRDiKY0a45pTJIPS1TqR1+cICIMaIV/ir
	93vRmzV9cnYzox7P1OXkEELSyKZX21/OLyBz5saGa0vTFraJOMplldxNyuG4RdjtZuU+DBudszE
	pJKWY1iM19awkCqEOa3Wsez4tpmblDAKTr76DO3N84MbmDQOffq8CApMVpE3H6DqONyLkHnaTRg
	69E7wMVESjxmOCz6OAwa8651RNF98CX0ktaFO/YqReAgJFv/mJmJ3er6+jGL0O+FmKny/limCOb
	zXUHeRfCzv37DFZNESSPTODPbSrs7FLeIphKw7CvEIpjdUlsOY0MiOmy2Hd9C7fyGPAtb7Dyax/
	BEc1iZHoVx+KPsF62VxvtdIXC/N4=
X-Received: by 2002:a17:903:289:b0:2da:e67a:87d4 with SMTP id d9443c01a7336-2db1268128dmr603110115ad.19.1789041577474;
        Thu, 10 Sep 2026 04:59:37 -0700 (PDT)
X-Received: by 2002:a17:903:289:b0:2da:e67a:87d4 with SMTP id d9443c01a7336-2db1268128dmr603109085ad.19.1789041576804;
        Thu, 10 Sep 2026 04:59:36 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-336c2571039sm30667653eec.25.2026.09.10.04.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 04:59:35 -0700 (PDT)
Date: Thu, 10 Sep 2026 17:29:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] soc: qcom: rpmh-rsc: Update CMD_MSGID_LEN to 4 bytes
 for read request
Message-ID: <20260910115929.jh7qxhqegwcbeaeg@hu-mojha-hyd.qualcomm.com>
References: <20260910-rsc_read-v1-0-c9b7fa3cdde2@oss.qualcomm.com>
 <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910-rsc_read-v1-1-c9b7fa3cdde2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE0MSBTYWx0ZWRfXwFpAcDhykDxl
 FRWaTvNxWuvZWVzLVd8BwRnF+xN5S30ELoUs0oisuVJ6XcXWBxbwahz+YSdW4OSHGtyEH3yJMPe
 xo3xOF+urnTEZ17xJQbLAcfrYdtaji2BglQyblejUMLsYWXo3h3hWgIcAA21LlnoVbPOGCP4idl
 u7bjxkotV2YFIs+4WxpS4d97QqbhNpQULJCgOnZ3elz9eHZAm12lU5eA8AtH6xBZldeJIBuEzya
 3F8Di+AbLabOfQQjdo9GBbbweNIuPiYWJ2l0M46dBwp9QDQgXsGK8d6hZo/P68VkbE0BgrNYKuo
 gnI5N/QO/cqCUlTdADAvKchHhdoNqpARbc9G8UJdDW6DQ1PsP4HxBw5PwCSVBICFNsgkZ6BAt5V
 JuIh3/ZNLKWnrEoEFZepvIqyb9EQnZr4GYKK/3OadJxOfSxMIr3ZgN342I0U84DjOl5G7f+Pzym
 v9bVx0JntWkDpm5b8mQ==
X-Proofpoint-GUID: T8EvJrAbiaUf4ezaWSfQyMakuInjnHEe
X-Proofpoint-ORIG-GUID: T8EvJrAbiaUf4ezaWSfQyMakuInjnHEe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE0MSBTYWx0ZWRfX4Nl0ufKpuhK6
 x+Mub0vZGPjHQVWI3VS3dZbr78A6rBbezcDNcurNUnul3avgy55FwOd4bqnClc00IyaR//zn7NE
 ua7EsXUJ7sFvqQocc+y3j3IxU3Owkag=
X-Authority-Analysis: v=2.4 cv=eOmGH3p1 c=1 sm=1 tr=0 ts=6aa29baa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=rQV1GGw-0HjdQLsJXHkA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100141

On Thu, Sep 10, 2026 at 02:23:01PM +0530, Maulik Shah wrote:
> Newer SoC like hawi with RSC version v4.5 support 4 byte message read
> request instead of default 8 byte on older SoCs. The write request
> continues to be 8 bytes.
> 
> Update the read request message accordingly on RSC v4.5 and higher.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/rpmh-rsc.c | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
> index c4542318eac4..f84a399fa5dc 100644
> --- a/drivers/soc/qcom/rpmh-rsc.c
> +++ b/drivers/soc/qcom/rpmh-rsc.c
> @@ -86,6 +86,7 @@ enum {
>  #define TCS_AMC_MODE_TRIGGER		BIT(24)
>  
>  /* TCS CMD register bit mask */
> +#define CMD_MSGID_LEN_READ_v4_5		4
>  #define CMD_MSGID_LEN			8
>  #define CMD_MSGID_RESP_REQ		BIT(8)
>  #define CMD_MSGID_WRITE			BIT(16)
> @@ -499,15 +500,21 @@ static void __tcs_buffer_write(struct rsc_drv *drv, int tcs_id, int cmd_id,
>  			       const struct tcs_request *msg)
>  {
>  	u32 msgid;
> -	u32 cmd_msgid = CMD_MSGID_LEN;
> +	u32 cmd_msgid = 0;
>  	u32 cmd_enable = 0;
>  	struct tcs_cmd *cmd;
>  	int i, j;
>  
>  	/* Convert all commands to RR when the request has wait_for_compl set */
>  	cmd_msgid |= msg->wait_for_compl ? CMD_MSGID_RESP_REQ : 0;
> -	if (!msg->is_read)
> -		cmd_msgid |= CMD_MSGID_WRITE;
> +	if (!msg->is_read) {
> +		cmd_msgid = CMD_MSGID_LEN | CMD_MSGID_WRITE;
> +	} else {
> +		if (drv->ver.major >= 4 && drv->ver.minor >= 5)
> +			cmd_msgid = CMD_MSGID_LEN_READ_v4_5;
> +		else
> +			cmd_msgid = CMD_MSGID_LEN;
> +	}
>  
>  	for (i = 0, j = cmd_id; i < msg->num_cmds; i++, j++) {
>  		cmd = &msg->cmds[i];

Tested this patch on Hawi, it works; without the  patch boot up was stuck.

Tested-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com> #Hawi

-- 
-Mukesh Ojha
