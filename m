Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377644;
	b=Q2oVRDNPU0x5X4oc2i1sbIT3XrvTdvOufh4dQY+ETQoL2D30v7SMSKCSAucQXzG74zg+
	 buCkn0K3eIFCgemrK3g2/Y1h3ymskoMdhlu4bwKGhKlUNrMMstrdDKAxzwFanQAcLjbdf
	 m2mO0lRK7E6yZMuK/EzO9NJs9e4nAWpWXwNH/WBShsy/GKTQ4AkAlzqW6ZL8yygVSkYcc
	 4avU3t78iZss9L1vzS5vGWUtX0Ug73wAM3cSVJ4igeQW3/+qX47Qt7mVH1XfHGWm/BcwZ
	 IDGskb0CHL6PouncW2ITHqDI6auIDeIzA52p/+isIHIHgmma1CMyRkAIrgVcXLMBkTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377644;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/9L1C2O9A9EYZuMXOD/Ph20M8HC2FG+ckzCZ3wyzhV8=;
	b=Q1J0BVUT0CSXlvlCgcIgfCb+U2bQWc3ieh4Lk5Jc+W6jZDx3bhilYDZi5Q7bnuS+JIca
	 TEjxPa/z+Z2NzfUZhVnKFkSmbq0LGN+S9Bh6S6NRdl9iuKvvqRkQeTYflCX+rvTPH6MY0
	 9hEljWGDZnjy+8Xr4lSfn4B+QHyiBe7FDYLaia5faWFWsw2NOHZV2RUZkRo/vgzycpMoL
	 uYEXdUJ4MtBFqEEGtHZKQtIPplHdKxdS9t4+F2Ik8zm6K9sMaAvNzapYn412xjX5L555C
	 KDkNid/dVBwEMF9ZH19sUOIg1QGmXcbgA7vggVmGw1/MDyXoyQwPsV0ivT6mZu5EeGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G6SUVgMU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HtnF9z2r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85892606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85892606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G6SUVgMU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HtnF9z2r
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UER7m32596688
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:27:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/9L1C2O9A9EYZuMXOD/Ph20M
	8HC2FG+ckzCZ3wyzhV8=; b=G6SUVgMUtBHwtcW2z/0fLigGCHl29r1kHgUwD8ar
	jct7BZ2WCc1Pn1g7lLJFFMmrkLKgZQbH+do04azKTrnjc0nOZzCYJSBcvrrF6wDj
	rQcGyG4Co0e4dlogvEz68gSLHg5kg/5PLNHcSHfpvjIM3Mjc+3xokYfuLUgRSa+h
	jTdRlYyZGr6EFspIUQ2P+hCT5UcD3TCoCm1Q+bN3MRsCexf8Lnb8fsZsKLPV+47F
	mJOW5QojAlCy26HPUv9NuYyQ7mUafT3PggbWKVHjltdqlKzTJn4Q8bp78Gr4UhGi
	k7mKokvzticMp/Gvi1aAI5B3j0+qCkgT56YJ8AMx0AjJww==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pc09x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 16:27:23 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc175cb172so692141137.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377643; x=1793982443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/9L1C2O9A9EYZuMXOD/Ph20M8HC2FG+ckzCZ3wyzhV8=;
        b=HtnF9z2rMJXgjvYISpbVJi6NUZkIgAkzPPazeluarJzk8LtTkVaBjjlsJMTGwdqUvi
         WiOSCXTED35I12clk3awDqo9o+FlWXiS/wfdhe33yUk7Rn8xHIx79kSXglWCpI5RP4Dz
         LtNUn8gphA6+TajgoULpCxFIrTCiOP6/H7/A08ENEdWEKvmYhUELnF/RI4pUhnQRpOC4
         GIvaQ3CukIWuBWfQdmNGQ0uPhTOWFle+/rqxy50/D/Br1NHsVMA4Dvwk+YudvVrPDKqf
         rL5/Q0MncJlca/ihfhVGszSNx1OnLAWWGhaBQHFt4WHsqRj+GM5O1sZAnONNJgboIIZ1
         NkhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377643; x=1793982443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9L1C2O9A9EYZuMXOD/Ph20M8HC2FG+ckzCZ3wyzhV8=;
        b=jdHOntyrj2VglzQdrfq45eyjKqVekx0WgTw0LcBD7HBQKMRMkDef9HHZ5tvKaEChWl
         ly9wYcH8588D+jTSWTfLZpKKpTypZEvS8NsxrCMf9bIPgW2v4eUA/oF7L+yX/I/Q8mHd
         5Oyt2s9wzVF4xaJBb/I3pifPKT2lx30PCkqanbiyr+1eIwtObxv+9wwyLaoEoBMzcl7j
         1i3peqTwFPcsSD7PUOGR6N/oBHVZLVdPZfGlQNVqCS5eSay8qcO2iYwfduUF/3MesMal
         U3MlStHBLK4mEAL23EIIsiQOipLljUCRYLQYT6Wc1kskSJWqcFCv4huvkABY5XBMLFye
         KdKw==
X-Forwarded-Encrypted: i=1; AKwUvBwlr+auqwoBVWDRgfMdfqwpcFeXwuqj9RyJU6AogCWWHv2dbgr4OB0MRbF1yDT8vjWvQ+7dpG+NUjBzV28=@vger.kernel.org
X-Gm-Message-State: AFq9FYIL0IEyHRjUKiSCoxxOI3avSTr0zZ1+bZ1a7Zka9FF6gQ8PgTmW
	LiKLw/TGmI8e/dS4i8JXglUURORQv/nNFtJsItjQztqhyLC3XjTOb4et+ah8Jjvb648fbQ7dJzi
	e8RWyVYAk7njcHdIoYmqc2eg9J1WXS1XpYK1tyWBX6r2I94yVdhXV9LcC5fLnxKNplXk=
X-Gm-Gg: AYBFou2dqcMID5NPx3M92aQssU/4ow0FGbq6uwSLOvGFNzJFPWqNbSE15/1D2wpduFY
	gq5mePICgeD9kuGLDbusPd0fL1ozaeLK/lEsLDkNBnRldYUofHgIxJcOJ3tfEtUrpdvWi5hnTFC
	+Cpu5jMq5gWwHOViPxPkYjEJVagpH5F5n69VOzf45ksZbE0XKrik20QhnUuUhCWOmWIlGswbzD6
	HBh2O4mz3dc17Mnl7qPydpFjoNoMZWL1fxvVCEGZZ7MJOKd4yugvFM7hmD7m4gNgsJT1ObWAdTV
	GNst/0fWLwJlMXOXs5ncxF95AMDZFTr7uOteRGTb/C9Wdx4Bo/ePm+jTBUG3KFuUkjigRcHuD9z
	AWIVdtp3MK9cJtKtjlQjP9Q3gNWWfznAclOslpxhixGuUYZ6AwzHXajKLt2epnLSs
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr1618478137.35.1793377642191;
        Fri, 30 Oct 2026 09:27:22 -0700 (PDT)
X-Received: by 2002:a05:6102:e09:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7d07279aec4mr1618463137.35.1793377641544;
        Fri, 30 Oct 2026 09:27:21 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d3f9sm4374029f8f.4.2026.10.30.09.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:27:20 -0700 (PDT)
Date: Fri, 30 Oct 2026 18:27:19 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] soc: qcom: pd-mapper: Add support for the Qualcomm
 Shikra SoC
Message-ID: <ktz4cbygffqztyz3zgv7j4zsyqkrj5susnifzg7q3kl52xtshv@3tjygrwbmu5z>
References: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261030-shikra_pd-v2-1-09bd0394629b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfXw74pei+S7PQB
 XxIc0faS7EvNxBvFyp0u1pqFEkuqL2IrRYF3bweHWmfhVHtIdorqr+0aZ+/QceYwyiP0gMnh2tn
 YGmbMoIDhECl+LDgtVtGdUkeLM5BQeC0nJMDtZxDxkXRYqGGaqf3nLIusf4fJ/ns6cnizd5h79O
 9un278618yVEA6YvNPi6KzcXeJDK7igNpAo7G9wan3tVFOv+KELwnQuRMwivtEA1wTURWCVKHY0
 1dyQLC+LFx/RI3GbIq4/swAxo+0lRXCF25N5DyQZT/Qc5hFlMQMeivY9WFlxyy4gNXTKRI+b+OI
 JtW3mbNVNSvLN4uFulAdfmoxt5m4wdbOYxlWe9/Ct8Z9QOSkH/CaHHsgArhmdXgsf//Q3XEX65n
 1jJOjApXDP4pQdMntgbkBqI/ZjHyOwAxib2l0mZE/dUdmkmO6V/JQqC41kbdQ2u1/Zn0YsxMKoB
 YPgIRiic1u65Gr2qpcQ==
X-Proofpoint-GUID: mPP4cCGPr_9NT5Sh98_u2nkbmSDXeYbD
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae4c56b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=9u1Yh8aEbUnWSn3VSZYA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: mPP4cCGPr_9NT5Sh98_u2nkbmSDXeYbD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX352wV1qrw9ga
 bBn3bjJTtE1UotwJs5MOVxVv6+YG89w9QeJFD5Un66NWySZPejQZtl7r8vuY0JAHfEbeqi7V/FL
 eCC/2vXFagBIlM7dQJlnbhzyAc/2tSU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300065

On 26-10-30 18:03:56, Anurag Pateriya wrote:
> Add support for the Qualcomm Shikra SoC to the protection domain mapper.
> 
> All Shikra SoC variants (CQM, CQS, IQS) share the same protection
> domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
> Add support for the Qualcomm Shikra SoC to the protection domain mapper.
> 
> All Shikra SoC variants (CQM, CQS, IQS) share the same protection
> domain requirements: cdsp_root_pd, mpss_root_pd, mpss_wlan_pd.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 
> Changes in v2:
> - Adding mpss_root_pd and cdsp_root_pd for all shikra domains. (Konrad)
> - Updated cover letter and commit body for all three protection domains.
> ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/soc/qcom/qcom_pd_mapper.c b/drivers/soc/qcom/qcom_pd_mapper.c
> index 64ca99d7fad9..9e456ead9eb3 100644
> --- a/drivers/soc/qcom/qcom_pd_mapper.c
> +++ b/drivers/soc/qcom/qcom_pd_mapper.c
> @@ -498,6 +498,13 @@ static const struct qcom_pdm_domain_data *sc8280xp_domains[] = {
>  	NULL,
>  };
>  
> +static const struct qcom_pdm_domain_data *shikra_domains[] = {
> +	&cdsp_root_pd,
> +	&mpss_root_pd,
> +	&mpss_wlan_pd,
> +	NULL,
> +};
> +
>  /* Unlike SDM660, SDM630/636 lack CDSP */
>  static const struct qcom_pdm_domain_data *sdm630_domains[] = {
>  	&adsp_audio_pd,
> @@ -644,6 +651,7 @@ static const struct of_device_id qcom_pdm_domains[] __maybe_unused = {
>  	{ .compatible = "qcom,sc7280", .data = sc7280_domains, },
>  	{ .compatible = "qcom,sc8180x", .data = sc8180x_domains, },
>  	{ .compatible = "qcom,sc8280xp", .data = sc8280xp_domains, },
> +	{ .compatible = "qcom,shikra", .data = shikra_domains, },

Shouldn't this be alphabetically sorted?

>  	{ .compatible = "qcom,sdm630", .data = sdm630_domains, },
>  	{ .compatible = "qcom,sdm636", .data = sdm630_domains, },
>  	{ .compatible = "qcom,sda660", .data = sdm660_domains, },
> 
> ---
> base-commit: a39c950806213f6861d00f90729acaaa21f2d95a
> change-id: 20261028-shikra_pd-568b9b35056e
> 
> Best regards,
> -- 
> Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> 

Looks good to me otherwise, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
