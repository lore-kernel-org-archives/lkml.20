Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FE74DC550
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778226; cv=none; b=hlVlAva5bHiIIrJan0pPYFbThScIPvCxtuXXZA8saBWY9r++apQ7jP6tm1Yjp2tQDg60eOfbyR4GXIF5fW35DAyC80tkIoQRDJGFieo86nfdi2W7j6WkjdBBsahpXdDMYxYRikY9OKEBB+vsG55psnJ8lAKIW17hCAdW37One8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778226; c=relaxed/simple;
	bh=ljNGBp4IFC5/vH2B1soisqS2RsIGB88Aj7oUyA6gHH0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tsvkioFQNYHaEnFX+ZhqJvq3vGY49SJYFCPOZ4bBiRt2cK4HUtrPmhnJF8scYCICi8JPzm1rqdBIUMvGgQ9mZROZvySAGoSzlEF+CKlP9DugnJmA6Gwp47GL/boy0Hao10ZOeqiZY43dl/ZBl6/f090k63jfO+q0PFH0TGgncvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c7tTdA3m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ksQhpyC1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c7tTdA3m";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ksQhpyC1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE08pu4178859
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:23:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=It/I7bqJvS/GZFBfLizAbt75
	7ur5ymNP07ts+oGXT5M=; b=c7tTdA3mD/CnWZ9IGSeWLodmuO3veRo1jHRv4RSk
	sOllNiw3AkPJMayA+GVn6H2QbYnv4wxklLiu3HSxFe/EK4KbsmEh0ODO+w43h7Hy
	kj8jRXgu4of2rqHzs8gy7d/JT61Oj0vkwO/9G2PDdY5vrIbSzZqpYqYatX27r7LS
	qy7tlrOhYfnosxRtqK37axr21WoK0O/+y6rK8ykIvS5i4A6FSU3V90EausW9R96N
	wB+XPmYcGHahP7ss1E7z9z4OB0Nx2S129ttNQ43j67atedhWVShVQBG9hZmpwHLW
	WX8h/TkSk6DTF8wwLTirNgK+tSJug6JRmg2ce6r4p54dSw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0nm3kura-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 14:23:35 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3e69f658so47424137.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790778212; x=1791383012; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=It/I7bqJvS/GZFBfLizAbt757ur5ymNP07ts+oGXT5M=;
        b=ksQhpyC1ZD2uW6u4FL8ws/28WG1n0DGOqrlrlD7yfI0XCQbwPI3FC17ybH1mgaOwXT
         /EKjQbh5nbFuUEQ9FZR2RG9aHoHmAUSQomf7zdlaIUR5AsqzkafOpkHLehww1PHK5bEB
         0eSW3MGzN/6gnBGrh1v8SIkETR0yQ/TyJ3kYQOkj5eNZkAVnwydZg5KDCQVl7VRGCx+O
         1upRlpWvcr3l81hRJQK/uF0lOISWB2fdeueihahD8ZhTmIIMwrp+9zn+sErLR//p6TO8
         itPKYqsKOVMP2Ar20BYpehwxNwy8fHwcfFUxMKSDltoytGQsK4URWCqIR9cXkkER0gWt
         bSyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790778212; x=1791383012;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=It/I7bqJvS/GZFBfLizAbt757ur5ymNP07ts+oGXT5M=;
        b=mij+Vyva7jvF6WepR8x3p+ira/14WutKotOUtaL1cuHQrG35tFQtrbiiaUuCNB7LL7
         L+ppLMsV446x0PNnMfm4mogpt+uylyjA1/orjl5rObzODPlXLM7Q+zLPcF+zWGEgB76z
         wXGa4qZZcSRZXU++0y/lNolTrx6IcEXC/b/+KQfQBo9HEbUtAbJX+ubcWiiDQRSFa1jt
         HkWp10jtJw3DzoiS2cw0/v3voxdHihmiF8eu62qHWSj5FF81SgFr2GxHeF8aPO/JRMbD
         PQKjks/7Z4/I9/ngN+Dga0uzB5eX1m95l8eu4XphPjjCOJkJOcaJeSPw3a5FCDDY5ON3
         iZag==
X-Forwarded-Encrypted: i=1; AKwUvByhN8MrMQCwltIWWWmRvSPCMHTxiDz1/eck1XyCg7qjFHkbieptk5cdZYfNglG0B9bHeW6u3T5elRK8PD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz1Di0E/u6+AowDkiGTSC+91YeojLnJDSbnEj5XLpRCmQo2ujA
	gRF91HGkHdogXQ9noBI59LTRo8X3+T0bwzlad6zJm3+fU+9nk8CAjgCXwG7mFmCDjgx/VK/u9yU
	pc5daYFZIK5LhZ6MiZIHk7hPQ5wtpea0FwSmiXec7lo96v4sHQOE0PgJCEelgAQjA3o8=
X-Gm-Gg: AYBFou0jiRKFqRRSUAAfApKHULnIjTr3xPuKsMiyWutORkh7hTOhOYNIdB7vsshTYzQ
	lztWALJNwrljQZBGBqyFMzwjft+KjvUUnVQ5/mK8QCFJvdAktoUfFeZUEhX/5GE5mZK68bITLgH
	7Na+1L1oIVtGpu4X/8rp3Yrps65Q/soedAUMCkgRBvQ3XrYj4BLyG5yIsKgk04/tdZftIzw9LVp
	TYn5svikEt5loh0aGxai55mNHDUaT1e3c/HLc2IyPPG1TdsxJpUcsPZxlZqNs49OlzwkgJ50tJ1
	qBdqC4KbDcEDO3/VR/u6KEAx0tm5hgmo4qwvLcgZILyKMwNpnM4SFypPubHJ0FteosYXq06ABna
	fRfDwr7lZkPFGcqE=
X-Received: by 2002:a05:6102:942:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7be72cb250cmr274247137.20.1790778212391;
        Wed, 30 Sep 2026 07:23:32 -0700 (PDT)
X-Received: by 2002:a05:6102:942:b0:7a8:1817:278e with SMTP id ada2fe7eead31-7be72cb250cmr274233137.20.1790778211869;
        Wed, 30 Sep 2026 07:23:31 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a01e657287sm3171965e9.7.2026.09.30.07.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:23:31 -0700 (PDT)
Date: Wed, 30 Sep 2026 17:23:29 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] platform/arm64: qcom-hamoa-ec: Disable the SCI IRQ
 during suspend
Message-ID: <p4dagzkkmltv2e3uckgndnxmbp6tq4twt6vb6akd4dumyuhusp@kukxl673zmjp>
References: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-qcom-hamoa-ec-suspend-irq-v1-1-ad82713c8d11@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kspJjAHNaCgCZ-7jhEvbj80GNmpZow_O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfX0ROYccH242vU
 PMx8j3h+qfP3e1+WeUJxBxBzBsTvpl03DHsKCWrgF1iw8doTlkK8qRKxxB56AOkzL5BZtfhU39a
 84DDLiJQ7GSA2dWjEQE5o9R2iMXrwJlCp7yKqK4NASvTZXf8n4nP49zPv/JNwK3IIZouT2bQEr+
 DrQDsSqzESTikKaRcG2xw+Rm1qiPptsJ2obQCsVkaXkDeQ7lnl1pKHkK8CUuqg/E2rOl6JxIhV4
 8vpFmBTwCdxGW5hx3PzF6SfB3B9O3mVattDPPqs/o168zkxjImvhbNLrH8mvg5dqILHxJ/HQula
 iIvXWPhyHN9m2cZ052uy+9mFMUbBNUx4EJlg7lxIaa6tolRPLtHJkYaXDM5/aaaJRKaMlm1iKf7
 AT+gBryUTJh0E5L9ykg1iZsSpRUa5kEvxRQKsTJO1FKBkORCeR6u0wBes85x6IEWzbdekiDCuoK
 VCzxq2i0Lr4kT5ENxwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1NyBTYWx0ZWRfXx2MmH1WhxILg
 pUNo9alefVpOmNwC2Bo7FKfjnhra508JAPG0sI+QDrmKd84fudz5nDqhu+qXFqnO+McjHmMJKbk
 Tmx95NDL/QqJLWrOYmEfyeVTB5epGgM=
X-Proofpoint-GUID: kspJjAHNaCgCZ-7jhEvbj80GNmpZow_O
X-Authority-Analysis: v=2.4 cv=fqxJ914f c=1 sm=1 tr=0 ts=6abd1b67 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ga34Rj3xoGKA-2XpnBgA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300057

On 26-09-30 17:18:36, Abel Vesa wrote:
> EC SCI events require I2C transfers to retrieve the event information.
> During system resume, an SCI interrupt can be delivered before the I2C
> controller is ready to handle transfers, resulting in failed event reads:
> 
>   geni_i2c a84000.i2c: error turning SE resources:-13
>   qcom-hamoa-ec 3-0076: Failed to read EC SCI Event: -13
> 
> Keep SCI interrupt handling disabled across system sleep so that EC
> events are processed only while the I2C controller is available. This
> prevents event reads from racing with the controller's suspend and
> resume transitions.
> 
> Fixes: 5c44f48e91de ("platform: arm64: Add driver for EC found on Qualcomm reference devices")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

Urgh, messed up the Subject line.

Will fix it in v2.
