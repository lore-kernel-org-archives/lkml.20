Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BEE3839B4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191052; cv=none; b=I4DpC1/F8IYrPkXJlseCzIMQQuG7+1KIslBulq9KFG8xdPldIm992qpElFxBsLu64f7YeQjqmxPpJ91xfA/xzIhcDYkjAJJlmJl6Tp4IonSrU9uaj8UdZv8HdtGKWG/q7cwVg/1dWV71X6/DDSgCgvekrSeXAskQw+Q+f0ZFzEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191052; c=relaxed/simple;
	bh=sVxADz0C25ROnrCrpEmG+TyV4MYDoUxBaj3hbFnOil4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=th5oYEvEjv8I2OQXqJu3pbXC75ufTen/qmwmp4d0AUrXEUYeV1ZITv5Dzghox/oj4Jgs70mM6YhCMy7lNCRZXK1HoVxNv8bmKxflrcCA0bj7+nLtVKBDCAdW5TTpj98G5OCZfeAWDxk2T8meyAFPRVuK7OPzKn46bz6pxwwlo50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f7DY+/41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2t4voUg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f7DY+/41";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2t4voUg"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTfFd3081857
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=huy1ZlkvjQUDRocv5BEJkQD+
	Ncn+4k51x/M19LB9SHU=; b=f7DY+/41EHQaYOhjcEMxAiuMDn6Pit45LdQZ8j18
	31CgKQRovpk0yhs6FeVNOsdroWcRfi9p3BE/GMQ3nSFztSO5g5zXwdIj52+mzdN9
	eSCsK0MHBdtbLZ7Obzd6MLoujCDQrwv4/JOJBmI6ydLG+k+jsb4waP5D/FV/lB2h
	/RcPJyKZSzSW2dEzaN0OB2Qcgk3dFCm3KwhDQT9N2PPKxj1rW8Lk+lE/0k4m3W5P
	KDv06xl4P0uq59U5aUGI5f3pEWMulkGkaOV+uMDll23OMoTBLoRM/RRVC+cQKg+R
	qtXh2ddg2Z1m1kDmOY3SmaOSO+cWJEsgX2es5L9Wbkij4Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvbx7jk23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:17:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-32850005b6bso1543659eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191049; x=1790795849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=huy1ZlkvjQUDRocv5BEJkQD+Ncn+4k51x/M19LB9SHU=;
        b=N2t4voUgSeo0w3ueZbvmJ3A9h+s0TEoqX44KJphJ2/nawvC/tKrKLwVbSap/4xcvdZ
         KdoFEmce1t+OxYJt9FPPM+qskvBk1rQxKYEjV0yl7NVUBNj/kk6pSZAGi8jddwwlYl79
         1l0u85uhgnATEysa05/3MfPH5cUZjbdsYvoFJ9IQOYC+Do6SeMGo8DpiaE+CtTdaadWA
         OkKEzEUCum66fSpMefr2w57TzSqfEIG/6aOulYi0XYqfy8AE+pA01uNmgfUtvuST78Zx
         nofRAvY6NHdMnWC8QzkUNgfVsm8aOQu6FNYvWCuLn5c8LJOoTFvYIrE6wflVOtmHraMr
         1ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191049; x=1790795849;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=huy1ZlkvjQUDRocv5BEJkQD+Ncn+4k51x/M19LB9SHU=;
        b=ifJ+CDJFrYpOJhfh5aHQENp/KwqSYO4/Zfv8uVTVvoOCfBmwflFzjK4dQK7Xte2a0J
         LjIjY/WBoRAeT/mAQi2Ou2LqYewTQl9rn5NT9syY85K+k4cBpRWUDlopRP7S/aGg4H0s
         gRI7Y4WypgIqytuRhOhMjyeXDq/jqX2Eg92j/1p8MfGiudT9CRJ+6LtpmAPooU0NXJV2
         Y/FdsY/uAkL+Wt9q6659Jet7vJUYhdafBE1NcmBKELOQzSO14T+luuw7CSOFy+qeSRPj
         1Tx5NliTrZD0rLjUawudLO6deRGO7nNQ5zSS53Dv8ARI7h/52144LBQUxzVcbBB8pBXM
         zJEA==
X-Forwarded-Encrypted: i=1; AKwUvBzaem0O0H87jBDjaH7As5Gs9PgbtPrUnMrJeM+Pkw4Nbf8NomQcUCQHh+fgbE7ipODwnYsIFOuH+xrzkto=@vger.kernel.org
X-Gm-Message-State: AFuF++mskHHiLc4BPXA5PodUamEXYf37x84mbd6xsPHOzKLDN+to/wWX
	ZTi6zBIp5+r4sN2ZQP4N4dVfehFNY/0quVrffdetoZZxfj/uavMzPXPxQrzV8N2sklt+YOo9UYR
	ZkPRfCFa5wsfX66g6BHW6nmamgg/RGptISUV1x4NbyceI0qykBCfkCecPb7ftJnlGPFs=
X-Gm-Gg: AYBFou3R9p9EE9AG7Gg/EmwBTN9B4r1D2wHhNkiXJihNyN65XvZ88WmNybOGR8UV7Q3
	HIj50nr/xMpdEZgfTt87m6y9JMAwUuKq68RRBUW3RNgLTYdD6+W03dnZY2i4WBJdrno/3vLQ3hA
	TrGDWP9Kk89jWalBfC5LhawxB+C7WA8lOz35BHYZ56iFD7SOT4yJr0fu9tIu/NKZpq5KSiaeJhP
	6TBoc1jA23yE6kq7f6+6Qz69hpcalBF+jSngJ4kAuYvOI0YBgWTEiFNVbEPinHRTwia8sSoZkV1
	6FBrteGf9fV0jV0QyoN7zv+gRwskIOTTzKoNoFSpTuzvphI1ndtM9mN0ovMzDeZEXtakM9Tjygr
	VNtT0u5GD5J96v2gw9Hn/gHDOEMpDwxhTTzeD
X-Received: by 2002:a05:693c:638c:10b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-34004991ae1mr85203eec.10.1790191048278;
        Wed, 23 Sep 2026 12:17:28 -0700 (PDT)
X-Received: by 2002:a05:693c:638c:10b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-34004991ae1mr85175eec.10.1790191047522;
        Wed, 23 Sep 2026 12:17:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96258204sm6486941eec.11.2026.09.23.12.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:17:27 -0700 (PDT)
Date: Thu, 24 Sep 2026 00:47:20 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5] dt-bindings: usb: qcom,snps-dwc3: Add Hawi compatible
Message-ID: <20260923191720.7phpf34zgr6jfzgj@hu-mojha-hyd.qualcomm.com>
References: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811160835.2968717-1-mojha@qti.qualcomm.com>
X-Proofpoint-ORIG-GUID: NGnt1QxqnRpW79qCbyKa-xEB8kR9kXLI
X-Authority-Analysis: v=2.4 cv=J4s/fwnS c=1 sm=1 tr=0 ts=6ab425c9 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=IV0E7ZXFCpU55wPcHFgA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfX8l2q2Q2dxEFo
 M1LzRxd5DiipT1wrOt+qWaOzRjzzerwppnfUfnq/9GViCfbWx2qa3+o0/Z3DwmdIlW6h2KgGSrc
 IDoSE2tzPORV1vgrhWAdKzajQ4p1ER2WCiwvpPAkRrtxIZlKRp1njZpVskgsR3NuMQyhOEgSR/U
 LRmO1U+wrPPgboOZ/+ILHutLx3JCvvV/xskhNgMI1mu3AYB3c7YXSpGol9mBejXmuohXFmfUWFJ
 GNW8mROaxiRdMpUPqOw5Y9z//+Lc4dQtkISxY46IjBPmMVQtsPD4otIrpdaus6FdzJ0dJCgZfP1
 Of/biR4DUtOn4eYyLd9BcuNVj809Wprhbqu+BJ2yyM/q65bbhP7TzxJ1CN9N4mpCCzrj526nZ9Y
 hv5lJVoQ/kfHZPgt824UEK/EU3I7XqO7xizeDdTdFJHxI62kK3eou0akiDs6KTZnHpOfffrqq40
 WFM+a+DQhyBxfrAWd6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NiBTYWx0ZWRfX52UdCaCE2tQb
 39yiogSOmJjn34Yx9Df+i7tX8E1pk14mZNO3ah12lgx2DR+92xUq6Eo0T+5ekFi9T/88GbwpzEh
 PB8T3MNEB8kfCWq7qzExWDwkkCar7ew=
X-Proofpoint-GUID: NGnt1QxqnRpW79qCbyKa-xEB8kR9kXLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230076

On Tue, Aug 11, 2026 at 09:38:35PM +0530, Mukesh Ojha wrote:
> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> 
> Document the Synopsys DWC3 USB controller found on the Hawi platform.
> 
> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>

Greg,

Is it possible to pick this up when you have a chance? I have a dependency
on this.

https://lore.kernel.org/lkml/20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com/

-- 
-Mukesh Ojha
