Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE5B38A71F
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787804959; cv=none; b=fVBsiV3ZidZn8ns1QZQSsd/kzywxYFtYqqMcfG9WQVbhs4USILtLShyG+eDhXb8gi97FmoSBFdkIsfuPcdnSnKGqDJql01+kXV7KIDFTSondJjZqJwN+pqgG7gjqzkZBKrojdNlwFGNlT+gfP1k/xUShYCgLbruj5LKsSboxEwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787804959; c=relaxed/simple;
	bh=WndD0WDFKtkC/iz6HWlwVmqlArMDCQAk82ZnUf/JwR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PBO6+yBZuZSY/T6Vt7BNa7C09qzRiQZ8r8ZGqGqwSlZ7M7kjcDB7Iz9aH8Ey6UgBDyrYsiaocBbY0j784pLERRVfYUBjTZYcL4wy8TP1H2R8zNqWHdANoLX+jl6TstH2m4WJ6xiJ2udzmYdBxMRjhGN6a4WlWOVPIFaJf6aawlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XgXC16Fk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dpo7GHQk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XgXC16Fk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dpo7GHQk"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3JXL92863039
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PBQfXRXdbtZK5RC0SQJwvsCn
	/rM36L4ZzGVrHyQOUFc=; b=XgXC16FktSQa/UqUPSEbVSrpYisyPDeMD2X7EEVe
	JINfReQlMl49naK9CZbIU0IoazGhg62KSI7f8Dr2m56BVInzEj6LPazArqZ4B/VC
	RV5LrHpjaNVIEejYsODazVBneNsgN51SlCS6jkXWzXQWea8ZgvrJI2RK5aij3Ab/
	2ChYg0HO2o6wes2iuK4so2VLdCA0vfdfVccpzGPWJnTdKAeQCmtICwMKSmwaY7+P
	uFfOYOcYsfpt+WXu+aCnsGHLJOOXuvYuYOj0YSq6Ty4y00oojljtNqr/3KCvdI5R
	QYRBAF9FrCvmuOiEcnH218uDDR07vYHPTn74ivrlKntF1g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga075b525-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:29:16 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6f80c76e6so26919455ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787804956; x=1788409756; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PBQfXRXdbtZK5RC0SQJwvsCn/rM36L4ZzGVrHyQOUFc=;
        b=Dpo7GHQkhohaZqT1AMIHFa5pDcytSrasgZL81uvlw5SbWiESfnJLm5om1fdPP75MGn
         8xETlQTJY874uFfqJExs48j26sSfGwAe/fzWnO0k5XFwNF6PUtl5ztdsqKEhEoZYkC9O
         H8Tt9jfAVuDItqJlqA/blcgngIgNarseWJHh5SsC1zjSKpLnYJ+IqVEsrNOyZdDLB4FX
         /aDMkL6DSFeGU/yfOHItzRT0uaCiu/A5CF/H8v+IDoJwQZUn6KqSWlOor/ReIjZQWuYw
         YoOXOcp41Hsm/2XDN3v4y52I58R4Xq92QpnElj/rs5yBFxPRdeL10kfDeytmBeuR3y++
         ORDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787804956; x=1788409756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PBQfXRXdbtZK5RC0SQJwvsCn/rM36L4ZzGVrHyQOUFc=;
        b=cUh2zj5gP1AXJ2w0uhfPr2RnEyfWp4sMzaoDK76QT7sigkkHgvcmBcpGw+2SY6E4Xs
         T0HPtPBdPl4eHLQFsv1QnuiqvnSipSMlQsVn6bVDRQ0xYjnI+CdS3dj/RtatZj17gaPK
         wH50aN/WccGtpYGHGS61Ch9hierKoaorwWtAtr6SU7QdvHKS+3L5qRgfmZsgce+dbBad
         5tMCND+1xL5VQLX4wg9E4Jgz8vec8Yk9kNlzYrlsb21Sb+2cFAUG3RtE9OrVr5kob/zS
         z9Br/nVHtvl7DjmECLa1PqpF89gZW9X42Fr7SI7Gqqc8xnJg+zyZTRhiTvXZYOgV4m6P
         LD6w==
X-Forwarded-Encrypted: i=1; AHgh+RoOTntGzOa/vPi5jVXG4qDZds1KtMYAIrUyGd5SllZMZ7EHd+Citwq/KRUgictXeDpYNpqvhiUKntLMtUA=@vger.kernel.org
X-Gm-Message-State: AFuF++kipyY8Z9v7CMwhnoRW1WGTQxtQ+aTaEXEqMa7XlfvTnkqgNRGu
	SloScntbav4DN/nMKaL2uowIDOk+SEFq2Nr3x4Q3wHNOSv+r3zpwN4aBEKQIE4bTYvV3qXKcjJF
	TiTBVU++m8+cuF+gRMfHRuw0+31ldtufdTYWxO9Fz8F19swOrHLKGm9QOk4fpOyz30Rk=
X-Gm-Gg: AR+sD10ReedMWuJOUqStyJH75aO6kowEVEsv8/3ok1Af21ofWFwQAAfw7eyi85hKLYs
	slYCPnE/0mxdCJIxT6Az4P8YH7hNdbFnoKIFbE6ciLfUQ5z9Jq8ZcefLWY7Z1YKs+M6AjyEFtY0
	pn205ZaBvvDq81/QJ1yM3ac4RFZJwfbGUC6+pxAci4L2Mba6l4bAh0oDQ5taRenTlASl+NAK0Q3
	2FRo5oX2KdSLiUcyp2BNOUBExsuX8xTC55kLcZ428Eu3EEUDTaz4Nozpq2HsOnrd74HZ1ewjGhP
	DG4K6eZSOswU4tSShunDf7wbV9ZtnM4FzOMO1JhrQD39OCC8ZjL9lqciuQ8wkRUbmn0AFVKEZ+q
	tlcowqKG3qeYx9aLNwbKzRqct7qVFdtp/DThG5xXN0GQfPqPz/Q5kynZwOn7GZqubszUQlqiI9x
	LzV00cMhivoRQdYbxmhLvd0UchfmtfLw==
X-Received: by 2002:a17:902:ef0a:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d707ba9460mr232937905ad.9.1787804955917;
        Wed, 26 Aug 2026 21:29:15 -0700 (PDT)
X-Received: by 2002:a17:902:ef0a:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d707ba9460mr232936955ad.9.1787804955469;
        Wed, 26 Aug 2026 21:29:15 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d885fb6sm13901932eec.14.2026.08.26.21.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:29:14 -0700 (PDT)
Date: Thu, 27 Aug 2026 09:59:08 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] phy: qcom: snps-femto-v2: Move PHY init registers to
 config tables
Message-ID: <ao+9FOzw6d+hjDyB@hu-varada-blr.qualcomm.com>
References: <20260824-phy-v1-0-257d68a3210b@oss.qualcomm.com>
 <20260824-phy-v1-4-257d68a3210b@oss.qualcomm.com>
 <d3d075ac-598a-4b79-8d59-556657edb23b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d3d075ac-598a-4b79-8d59-556657edb23b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: FG7wKQHPmf66UE3gsckjtSIAxKBfgSae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAzNCBTYWx0ZWRfXwS/rlltiE23X
 fQMKR2xkRtRVy5Zu2CRs0HAAZVZ17uZE7ZC8aOqYSvcn8CFT5ifOCOaDj10trLYoCwKBIU+mv/X
 u+Js1dQBShAeJZHxj/mhrQRATgE2w4z+2g/H4YvR6cJ/9pushTJ9afDAiHk4OFTNG6G4FcLva1x
 7lcKNvIUjhUY/DfXCl5YnY1KYgwwcg+zRexJMJLPsAKCvMw17zv5Niyfb/VnsJVZh2zBUIfLeVx
 mLOXa4hxkQhFpvN4R5PsjqYlMqw3ipH0v/YddZm6+7N57zl+/A7evFYYRCkuJP5ZkpDQX9jL4D4
 ULJTY78mzo+Hu9mMtZhnrv+SewSdU6CRu7N0I3Byj3Ig2bfTFqeKW36IbmHF4ibDN6ZGARciCi+
 bMVDoQmrKe/Mz/5lBPTn8zkAz8nGz4FY5yY/whc2qfQBuRIh7cmrOQJKCjS8k09ZL9MTQmE9Wyo
 ApF5rAb9ZgkzSvWqyqw==
X-Proofpoint-GUID: FG7wKQHPmf66UE3gsckjtSIAxKBfgSae
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAzNCBTYWx0ZWRfX1pYEpRV14VVY
 UkvMubFMgLjkXqpzAJKy7OwwPaAPIPeto38DNi9DP2WYjioIA0MBvwzVsA+Be3xEiMoqidDHrUy
 M23WmcdPsl0c5r5Li3UFZxQ8t6jVKw8=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8fbd1d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Bgcfhj6G1kAcdHnFx8gA:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270034

On Tue, Aug 25, 2026 at 10:54:58AM +0200, Konrad Dybcio wrote:
> On 8/24/26 8:37 AM, Varadarajan Narayanan wrote:
> > The driver currently programs the common PHY register sequence directly in
> > qcom_snps_hsphy_init(), with the fixed register writes split around the
> > override parameter handling. This makes it hard to support SoCs that need a
> > different sequence or different values.
> >
> > Move the fixed pre- and post-override register programming into per-
> > compatible configuration tables, and keep the 7 nm override parameters in
> > the same match-data structure. This allows the driver to share the common
> > sequence while adding SoC-specific sequences for future platforms such as
> > IPQ9650.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +	for (tmp = data->pre; tmp->offset != UINT_MAX; tmp++)
>
> "pre"/"post" alone are not descriptive - perhaps pre_tuning/post_tuning?

Will change.

> Or do we maybe know whether the order matters at all?

I believe so. This seems to follow the order given in the hardware
programming guide.

> > +		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);
>
> Custom termination is both error-prone and memory-inefficient, add
> another int to size the arrays

Ok.

Thanks
Varada
