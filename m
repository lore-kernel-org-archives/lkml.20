Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C310939CCF3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788979110; cv=none; b=FPKRiAQCmb1/h9W/ATVH4CqI9Dz2QW7QHrDxj8FU8vbcriWvKUhdKcD80IgUl+kOpKSqVULah6Iy4Xy0wgL/pEcKt+DmLUN2L+xpEtlbcvgIQNdai5Gvi1KNSNhYfMVE8X+lBNVs9B/kjyewU5Ed1fp1sjbn9ubigtbGJx9RzBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788979110; c=relaxed/simple;
	bh=xJlaGtrwdP5cLYNIsR5a8Ru52c6mVVmPB1G+LrKzZrg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2JIhp2h78fLa5QmkGAU/4Wgp2IPJbgNmFb+9WcxsdfZpBPfFsQ1LVQ8r8pqMr8WVWfLHNdZ+dgUrTgskhu5/kLSLXcLwnlpkL4CD3NkUv7i0I1tTFahzSKjOs+AJBf5UPJh1B4YsPlGR1fkKK7OUF9IJLaax7pskorJSHSzg5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Orwzo4qz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NNxQu0/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Orwzo4qz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NNxQu0/j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689IVB5s2749444
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 18:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=olXdUPsz6yciolTLlAiU9YdD
	DI2IXpo0jVQq3Y67Grc=; b=Orwzo4qzsvHpMuc3+Y8OXgxXJsPAJ7HIzaMfRtGr
	YeV5+6cS94dUawhI5nXTlOW8FxWJiyQiTQgjD1hWyivkpAo0CFX/lV5mC+LbSiAq
	P5ErLboCuE2xxnkUTPj4z2gzp+HT1NrZGo+euff31NKuQAgu4qeEbdC9gNtJm/jR
	ZpbIkNoiEZnkD+iuS7ncafBGc4bbvXdnbZ8gujNR2sQiyLyChP4T7ksC4khij/r6
	aKayAJVkHX4PvLQmvt29z5Vh8IaG4PF6TFnMOddFiVbbMuC57M3JNWbLLDSIZumw
	atktBwKt4hsaYVVFR7IbLHVtbmIHLEXTxpBDH/23BMogFg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkctbg17x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 18:38:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78fb9f59781so988501137.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788979107; x=1789583907; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=olXdUPsz6yciolTLlAiU9YdDDI2IXpo0jVQq3Y67Grc=;
        b=NNxQu0/jxyUGdllfKLPz/m649UaU+zBRgoJkKVc7bEIwI43nFk0n0bmrAlqLfI6COw
         PU+4d5RPG4Sn83ir9R9Xo6Ip09Cbb1TvBth+smL3bKHVRE+Cg6eVJpYaAcyTLwJLWkhr
         nK3cREs7gS2tmBuGTuEG3LL3kt40rtW0+Mxeh1dxnbMkNWvI+e0RxFUDsPMHKNz2HWJB
         XV3BXe48ZpFZKJmXVl7HQQIlGIo5BgMcap0+x8X4bXrsieNcxYJ8mf1hE7Zmqtq7EuwJ
         oyMKyZP+KiLgRa9qt7+alFLDmI2XfJyGHFRa0aFDdghNjcZial7LfpFfHnZ9rsB/DOh6
         WnNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788979107; x=1789583907;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olXdUPsz6yciolTLlAiU9YdDDI2IXpo0jVQq3Y67Grc=;
        b=Uf/zRG5cuQd4mr1FTas+EHPRfoojpq8uOKSc5QgrOAOU+4kmUronWWBNANa8pftim5
         O5CWq7j359dndW/7Ke0/KdJmJ12N7yM++VCu+vWmFSBJjRKtL9kWFSAphKs5+/4dwm4R
         HAzjzWWUTlbBSzPESOpq5t07Q+QJz8TSkkGRmFi8fAJ/f3UJR73Axd7l3YoTGaSwTSnu
         k/aNJlyMAD2JIAygK70X5hyhUjQWq8zQT0IyDki3BkpGdTnKdCqjKyRf74QvWMugYGWQ
         4MOJGgMQJYMKeisAKmyT02ntamU1ZLrE7FrvhpMQYB0P8pgw8Bv3OIpxgqyNXCBr9xjK
         fXPA==
X-Forwarded-Encrypted: i=1; AKwUvBzwVLXibnn4xuckJXf8g7NoK8VoQhKXMKl+A4Jw4X4DG5o6X70JD+HoqEP1/uMKuuT8zkzeD1gGm2wFIGo=@vger.kernel.org
X-Gm-Message-State: AFuF++mnAVsjZ1E3IO8/rCnlzmQlhxFjKsmpBgBivC9K9C+5qgdIeC6Y
	96Zfw2+9IqQ4QGvTHJBBIFVadlyLSsrBjwlvraGQ3m0hLAU0otK+QZLkKXKA71XMX8dWuicEH6g
	Aoq/C3/JgH8fDdX4WLuru7wZhzHWjW676csCJ6eL/13buQgMvg5odiTm8YodZC1kdATM=
X-Gm-Gg: AYBFou0FuR3iBJFxRvdebHLwikKJMYIic0U/Pv1pjtYHA20HKUI1Gl95kSPSV4PX6IN
	3KYTx1YP6ru6glhNUWBBtQIiq6tOtbQCWrHpQ1ZHGm9nyZZBUhJW607x2iIEdOOA9BiSwF1YARu
	MKA4fP+AnoegiiBxR8MoaysC9KD61mKaxwlrzQ6lzvsN6YB0kt+QNgg3cjxXIP3Wn2AF4AuCfKn
	hmQF0T+/LjgQVHq4/aua/XyCsUXn99BW4zB608SGAST3GS0gDFzyzy7ve26DS2jcy2srshb/OuY
	mmGKRPYzp6Q3elXUHRm+SCeuEEXtqC7QGpx8ziZNChFyhLruHVmhTJ7J7i3ACZkXDZK8/8+yUwA
	8sDSxW+4JOsm7XmLQqPzHs50cDatQvmU86a+jOaZZknY+bCDZpnq9Y4g3mPOqmB+O+NsNQZAyuP
	IkzKr0V06CvSdk
X-Received: by 2002:a05:6102:5698:b0:785:a48a:e3b9 with SMTP id ada2fe7eead31-79076abb7a2mr1655338137.4.1788979106948;
        Wed, 09 Sep 2026 11:38:26 -0700 (PDT)
X-Received: by 2002:a05:6102:5698:b0:785:a48a:e3b9 with SMTP id ada2fe7eead31-79076abb7a2mr1655313137.4.1788979106530;
        Wed, 09 Sep 2026 11:38:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a370588231sm43978251fa.22.2026.09.09.11.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 11:38:21 -0700 (PDT)
Date: Wed, 9 Sep 2026 21:38:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Georgi Djakov <djakov@kernel.org>, Evan Green <evgreen@chromium.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Adam Skladowski <a39.skl@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 2/6] interconnect: qcom: icc-rpm: Don't skip small votes
Message-ID: <eguvscm5rutrezg3n6oncxfbma3qolho6acj3uibiknp732nah@n7fhrx5jyfdd>
References: <20260909-topic-icc_rpm_smd_qol-v1-0-6dc5b5e97626@oss.qualcomm.com>
 <20260909-topic-icc_rpm_smd_qol-v1-2-6dc5b5e97626@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909-topic-icc_rpm_smd_qol-v1-2-6dc5b5e97626@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: DVbDHP_JDLE4Y3vFPc6i4E7ixo38F_pZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfXyS6uHuT7unmH
 sIcMYn3oyzoxroKHL24Iwk8Bl6+b5zUmQlTYlDtXcSD/kQRqYedEEh4CIDHZyGCQOWe9AoJmJ+7
 npp8EMiyrgK8H2Yi6tENM48xooatBokrCn0QFkTnfrRnXUr6yEYyuLCgayTufQQWNjJljJ0ugEt
 0bMTIwiJ1Y2ek7f+YHmaj5JNKVgmHfFMBovgsf8Ngu/Ct/r/Qt+8jZyXNKCtZCyY1a6j4Au0XCw
 hMm2Ioxt1l7IFOR307fEndfKAeIxFFxB6psUZnlZu16+QDRmjyxNziLE+e0srcSUFpw3S3PfU3L
 LRBdB+RGbXXZMq0b308Wmx3GPTy7hIVEZ2yi+eiNI9u+tztwogirsvvPfnseDsyovigodg21V0K
 8otV+7g5/zxwVuIcn6vHubA1+ug7dEiGgWkAIeRd9ClXBX2lU3BOLqlvKrsxrEMoWDJodwbRSjR
 CwM8m7mMrc5ikit+Z7Q==
X-Authority-Analysis: v=2.4 cv=OsV/DS/t c=1 sm=1 tr=0 ts=6aa1a7a3 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6T9HyGjP-Dkx_CtKVfoA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDIwOCBTYWx0ZWRfX8RMxRije/w9k
 mQ0Zv6FNNKmHA/D42NInPu+Uzt60VOFwCfZt/Y9tvFREVb/bOMA2qC7xmpUdQImwVzBfTQlNWQb
 XYG4cCbHIgVADaF29eijVlpRGQp0pbY=
X-Proofpoint-GUID: DVbDHP_JDLE4Y3vFPc6i4E7ixo38F_pZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090208

On Wed, Sep 09, 2026 at 06:41:55PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Small votes (such as 1 or 100) can end up being rounded down to 0
> midway through the calculations. Use qcom_bw_div() when dividing to
> prevent that.
> 
> Assisted-by: LLM
> Fixes: 30c8fa3ec61a ("interconnect: qcom: Add MSM8916 interconnect provider driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/icc-rpm.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

What is the reason for the drivers to cast such small votes? Isn't it a
mistake on the driver side?

-- 
With best wishes
Dmitry
