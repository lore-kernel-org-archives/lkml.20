Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C89A4AAC46
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171272; cv=none; b=Yg0BlT9LDMPyot8B0uDdBWvxsQ8gSFFWgx2A/HpEbj39HxDfpYUSqfJ5qqDHyss56YgWeP1gh/5m21ujrsfJavg25FoDd2k+PFDXppJZnOx8IVlZvz7s3eeeH1APSIziigsyrvYIEKzNeT+GB7Gy3hlKD5iNuci7FLtOj8xJHM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171272; c=relaxed/simple;
	bh=6TDPy8HiYvIK8BLqW2Do+y5gjPAR8+4NGldT85qKbrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7iqNHMA+DGT1htq20MaLyvLDBNbaefP66Vcw8PN4a7Te4rh9zaiXJmZazRoFfMKTpi/3lB5lCmMTCnX7tz9lBmpLBKJ2WkI9giW29j/VISe8lZJraUkZwZctnEsC9OUXq4pAjgR6z8dp7AjOjX/nIUqtsCFklK5fGQryYQPs04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ouz0sEQ5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g+ryjQtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ouz0sEQ5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g+ryjQtN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDKg81322188
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f6RI1UfnbG6hFkuz5mrr0mPm
	fiG6vQKcsGj0ghcQRnw=; b=Ouz0sEQ5Z1EzgpA+sBFnsAqN+AmCuuWpBraGa0ZX
	Zq3FTOOluaUz2Vgun9HijmHwHaFW4q9TIAwiRhOCAoxv7ymtmOTC1D2O+J4uqT36
	WzkpTDUWY0JY4npF/lv2+lz/B8W6NJRCVf04y4OLypidoYWTijt5+iDJ3rAujRLh
	MfixR9i0FMFNf2qHCo4XEhORisXX/oWv34j+OmDLk9Nfdaxvn2s6mwltomwpRo0q
	cp3uFv2ue8vwYWPyVdcQKUElkDT+N4EyvtXv7RQLB7d8p5RetSLnhLpFqMrMvwp3
	1bTGZZTKJXfpF1NMfH5NQ8Ymc4kEsChlUGGwDR+kkASZsQ==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjsg3ca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:47:50 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45e6091d8a1so916870fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171270; x=1790776070; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f6RI1UfnbG6hFkuz5mrr0mPmfiG6vQKcsGj0ghcQRnw=;
        b=g+ryjQtNlJ5nE9s3BO/VFAQsAu3/mQs7/Xvbq/6SshI8fJdPw+s7FXw5mnbf6cN50C
         46mn+xiOgSZu/7qIvg5hT9neAa0KbqqIxIGi9+nTdQGMuKs+vMxPw1mJmwBjNGi7Hexk
         jZWqY72ohofytAh8yl3GEx13ceS9KR3T0VY0IR++6mcZymU6rKkm9ettUOFVOYlysDYO
         hA8xZx5YbF3GSqRALrXb+Pwp9Nz/qF9vxdfroHCY9R+Ttl5FQgpdTHUkUx3KZ7xLq/zK
         bGlggAaDOGqyhK53mWFJS+yJBZGu9y0r6Bz9vbsT76ve74SKXtwhWwAJt+9edG6IkaW+
         hKsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171270; x=1790776070;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f6RI1UfnbG6hFkuz5mrr0mPmfiG6vQKcsGj0ghcQRnw=;
        b=zm7fL4n5pK0vR4BSqHn5+TJGWjLXaAPsLTxElFqiPmbdHAGvpBzDp5XI9vVEoRuN57
         B1AsPY9/5gSl0sT1WwxBqDOzExiy9wS+DjmOOJN34ikeVVebv/ZBjFbozd3H8Zng4I5t
         jUCwjbxgS0KI1hSU7IxT+ezJM6zLGqB6siNLZn22CBiSZWf+WBeQiGA6a/0b+ZJIv0IR
         qNZBvRNTO6qwVLM+7KItukCLJpTbVHiTGM/qCDmeG/ZdKm4qnNycyRJTgg5OFlIHsEcc
         2GBjfY4S73MrxM54SkkMSdih0RRGAh0uGoBlwIjEpeacNObKLyeLsKtN427HFpA6DK1W
         6CRA==
X-Forwarded-Encrypted: i=1; AKwUvBzoIPpRuOJKkPzJ0fGOMh0MKdWvpVaXLabG9r0DW2wlNFnmG3fwvZUCZFlkoIS/2NexJ9ccYNLUk5wBkjU=@vger.kernel.org
X-Gm-Message-State: AFuF++l0e1kNuArnuj6maoOVXqgQL0aBhXEZm6WhbDAPmUpvG54w6FfW
	OYJ/9EBM7e+NFXAJ/GVTOodUh2TKfZxF1za+gJ640iTCRbvE1etU6qn3fAb8LQaUQZX77LVVWic
	+4vkMnQtPUB4HwI2DyERkR1R+KFQVBBMBdhrs3C2hHr2ET2+H0PNFoiM8Cr05Ag1+xmQ=
X-Gm-Gg: AYBFou2r/BdBEV1C8VIZS9BQj+5yLRrlo+T9hCgCcbvmurjoESLp4tsZLq+ndvYZsrs
	8yKYOMq1P/hq9vAbW3LqsZhi7BVy/Rt9dTqXReKLifM6lQjfLE5zRUfP7c08E8TCv0/Y7ZxbTGG
	RKYnQQEH9NeXtiL71HjzVO8HthHwMwnODtQnJ2dRl+/gL4eAJq7VyswbWQ3sce3XQpbBsj/j4aU
	Hq7EBwvgWgZVnNlcszIWTKw0J+yBbdwf5a3VyedpqHsf65kidn9VdRWYUzJ+8Dk70srFHN2wPXZ
	8jkHZAEXzboF9SSte7Uhnl7fxJb9Bw5B67XpwLSUTcOrHOL90DXGVUVgdpXRN1q2HNoKQKJAgGl
	OeuwdqQ4xOJp85RH2ozm71ectzldYKvx6awc32N0poQ==
X-Received: by 2002:a05:6870:3806:b0:483:67d7:e03a with SMTP id 586e51a60fabf-49089d5da63mr2560978fac.11.1790171269654;
        Wed, 23 Sep 2026 06:47:49 -0700 (PDT)
X-Received: by 2002:a05:6870:3806:b0:483:67d7:e03a with SMTP id 586e51a60fabf-49089d5da63mr2560957fac.11.1790171269214;
        Wed, 23 Sep 2026 06:47:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4908eba2f0csm1710925fac.14.2026.09.23.06.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 06:47:48 -0700 (PDT)
Date: Wed, 23 Sep 2026 21:47:41 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] media: iris: Add support for nord platform
Message-ID: <arPYfVPIWblIayxl@QCOM-aGQu4IUr3Y>
References: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919-nord-iris-v1-0-94428761ec06@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX9rPlljLM2+k7
 Bvk+rzLEfKNJCCllGBeRgL+UTYtinbIKXMc+GeIJ4HPTUF5Axhj7gNjGLbtTOhRusubc31A3G2A
 Qk6+WAUH3LXELylrYx8fwYn3CeMV1JEz41J0+bGDXBE6ZGdvUqdCb9HyM7yDMm5wra37+bJKmTw
 Ajhj8MniWbVanqrlaHln8KLvcoil1Y56li0UGjskAkW6eDrnw+htkQOkaJAMh3wbUVLM5DVCxqO
 aADo6shDpGgY4BCePpNLGrdbZp0E6NBxI1BqetwPG2KT/9aOG6/OMeqXAMWWAah5Qe4+fQxBvVJ
 PeERYVj248bBQhZasQLWk69GXQnc08KsW7wsNlWpoQR6L1TwJYhGDse7LOaO0Uh67T17TPuRI7T
 h4sonOAS5rt7xosmpDuDvCSH5v/GEFEkkT1jspOufWDqAGP5nzPR3JCXz0yxZgWGV0dtqrSWzVI
 r0PuaWoQOunoCJbqGLg==
X-Proofpoint-GUID: hWmPy4SRyIAqF51EPO_O89jZxsDNpDTp
X-Proofpoint-ORIG-GUID: hWmPy4SRyIAqF51EPO_O89jZxsDNpDTp
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab3d886 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=2wm1sE6lh8PoynkbDlcA:9 a=CjuIK1q_8ugA:10 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfXz1gRGD/dS9bw
 kBmLFmsbEdOB3RWYbW7UnisLjfRIKXdW4cyZEIOEzjpq1YS7PMZQtGBOmaMACtt2PeUE+QpT6Ps
 pETgxoXoLHHlenyCpT+KdN08RonUKXg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054

On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
> The nord platform integrates the Qualcomm iris video codec hardware,
> which is compatible with the glymur based iris implementation.
> 
> This series reuses the glymur DT schema to accommodate nord iris
> support and adds the required iris device tree node to the relevant
> nord device tree.

[...]

> Vishnu Reddy (4):
>       dt-bindings: media: qcom,nord-iris: Add nord video codec

The binding should go through media subsystem. That said, this series
should be named with "arm64: dts: qcom: ..." and only contain the 3 DTS
patches.

Shawn

>       arm64: dts: qcom: nord: Add iris video node
>       arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
>       arm64: dts: qcom: nord-rrd: Enable iris video codec node
> 
>  .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
>  4 files changed, 131 insertions(+), 1 deletion(-)
