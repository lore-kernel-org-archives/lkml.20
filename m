Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8C31D4606
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789910860; cv=none; b=XCyW6Wk6RNvcTWbX4qYUmHBaJKkiVFBzKuQMviJ2Fh69Q+uNxzTYkK2W8fquADvApaR+WH6clFDtR1co2x7mWAgkdQ9PiSEVd4JE0OnIfkITtMJ0vxIENTYIex61DOnRJE6qRSLFfCKDALEZeycPR4X60ZBq0Fm3lVTZEGo7sWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789910860; c=relaxed/simple;
	bh=cLcqka1XFKYu/ZN/lUgzb7TgjR0qbj3bVeyTl90xifw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rumBIBIbv9zxLeP6AH97uMWoa+v6FCo7OgXbGIazNQXqPW3sM3lleeItuqS9V+cb3XnlRUgNq/wGCHr7ptb3e5w5K8oO2W2eD7kGsMsXysf2DQObLWafloPCZ14RFLlU9E4Qv5cUOPS8UA9sT+1xS7GzPMHE9kSlyN1+An2SB1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLMRoTLe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fh6Y9+Nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLMRoTLe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fh6Y9+Nx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBoste2289291
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:27:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=39p7fLze89UAPwD0dIqKv6ts
	kcRIY58ZR3DpUU+rex0=; b=CLMRoTLem/LtzBMZ5O8ctZO/J+53TMrPdUIS7Ryb
	EnFwK/jXwDfwZxBduZMlHDbzBZOvd3LYWkaIuwGO8raQQ2bS+FQ1MwUGSIzZEKyy
	uyRr7BVvBIyMTTGDnf9mp33LDFwoovtlYPvbrHhFfjYpDl/37A5gIOi0+Dsb2mZP
	LR2N0FufoNi6WV1mIE26aZ5DMU5JYLihhhDqpoqTxO0xfv/aPVpll7WqbXW3uhje
	lLb+GEFWbzntE+UXHw/dBJCTw2s02Ra/w0DKCgdcJ1oW/Q106OZXcigcy0wF+Bul
	9Frqo1aPag2Rujm2v/S3OZiK43FNZuXXkTFTm55kG6gH+g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsfrnud89-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 13:27:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-39deda201bcso2523533a91.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 06:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789910854; x=1790515654; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=39p7fLze89UAPwD0dIqKv6tskcRIY58ZR3DpUU+rex0=;
        b=fh6Y9+NxutOoBRgJK2/lc9y+sW+KTdNNH7gP8A7nDxoJ8yv/pmET5TzL6Ah4pNJtm7
         dCRAykRLNYn6ufXBHtlRw0YYrjXqp2blRUYYfSahBamZiUn2QqMB6R7FiWEVTgmv1opj
         jIN1Cgl0u/PHJjcDZIH1IstnM61RO1ZqDRk/7shR0HcYhLj85b9628kqL9gTwRftN1PF
         5FNGtomVz5co1dN5t1vFZbGwhfGC5AbHmBfBhIVAKkMuUKCq+S/kydK4FXOy3h3nFxL+
         O0ovjGHnWVbf2nCucsWCzpdCgTbLJTO3RRO6xGuL8JhG6BlmyISa+w4Lq9SSOjK94t7K
         3lsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789910854; x=1790515654;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=39p7fLze89UAPwD0dIqKv6tskcRIY58ZR3DpUU+rex0=;
        b=KvHxjwB45Omdga5UothP+4D3x5Rqn1Obfc3H255qo6S5YHNJM9+sMX9ii1P+3GELYO
         UE2zkvkl5rpj4gBPVGcWGxwmGpXN0IStybvOxxbq9OtyEWTayaRIEbbTH8ewmsOZzeaE
         jzdb4EkJNjuJs8lPtxgLkNwd4fXiGKY0mfZcjS+QbSdosRJhjWTqu9NAMJ7DziHwsTUA
         NDQX8kxNFqHaLfJ+qy5TX5QZ/sN5H7mH61X5EadmFQNn1IZVIVqgfireM5VyfGlPfbME
         +50BWDW1UzKKdFDSQ5G/C+/pkrsP+pmcQRBeS+0L1/5LxqXDU0v33DuyUD+wd8LW3GME
         /V/Q==
X-Forwarded-Encrypted: i=1; AKwUvBygb+BMxhJds8nz78wsLxFztTll0Uwxhx7LSMuBdTGm8YHgNqGDIB+JwQOik70CowkY6nK/8RUwE2NAhRY=@vger.kernel.org
X-Gm-Message-State: AFuF++kAK7sH2PBqGhdT98zFWDpSXPYg0AZZkgG8PzkEEhUNGIvWPdxW
	Iec/G7eL2KUt/0Ogrk8ykNC2DTAF6n6t7T5LO9rE5kes2ckoVzeNJJB9ReQHH+l9rXVU4xjQZT2
	69q1DL0FP/fmsPCycR/EhH0pjJByToJQHlAkCmOU0EUd6sHq9qkWAAEX0/C/o2PoD1k4=
X-Gm-Gg: AYBFou2XNwzohlxe0jkwwar2Mv4XGzADNVjPvPRmY95LYvsem4KcSmiPcZAasBlTQ7r
	O0crL6UR1TIAzidcFmNcgQI1xLPlGZJ+jh0Xw7DppH1WKMyh1zZwMcenUq14I7bHUQjojvQHWD2
	elok3GIM0XhuvGvr5Y6nGBTY0yeTg0qCdP88G/xN0mLtNsIgvJLJ5wIfLN5Ejg85jNiUfyAQ8kh
	A4vI/xs2b48X03eb3RPyI4zhbcjuXPe9ZmMkK7VCR/k4v3BX6w1iJ6dKQb6j8wCRe1XRfrxECau
	eNsv8jTxin5n8LNSZ9W02ACkiiEMD6mUOWyj0f84fV/n/OakReIbNWl7EIMsFdJ5/E/ZR64A6Rj
	2M2pVElGz8qptp9HKqm8lwr5vEhSv2VdkH0qHHbSSpA==
X-Received: by 2002:a17:90b:3ccb:b0:39e:4c7e:f03e with SMTP id 98e67ed59e1d1-39e54f2158bmr12938154a91.27.1789910854437;
        Sun, 20 Sep 2026 06:27:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3ccb:b0:39e:4c7e:f03e with SMTP id 98e67ed59e1d1-39e54f2158bmr12938137a91.27.1789910853963;
        Sun, 20 Sep 2026 06:27:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144d54af4d5sm12663888c88.2.2026.09.20.06.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 06:27:33 -0700 (PDT)
Date: Sun, 20 Sep 2026 21:27:27 +0800
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
Message-ID: <aq_fP9Mk9Cuk9pSw@QCOM-aGQu4IUr3Y>
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
X-Authority-Analysis: v=2.4 cv=W9mtxhWk c=1 sm=1 tr=0 ts=6aafdf47 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4fasHqLFOrtwIhvOBxkA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDE5NSBTYWx0ZWRfX+b1mdooR1q0s
 8nBhCxvY2kDS34dGP2n22IwwP0/NydSCiNajcUYPVwUkmeqfho6TvjWZB1Y5VxCil8dx32NSBfB
 uX1pW9fCawJq7edzA1o8527bBQj3oEc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDE5NSBTYWx0ZWRfX9RQ8byy+hBWk
 uVAQwa5XjQEeduFfL74MvyBln+2rC4UTGdb9BCfKxgeRKn2jigc1NtjGCp0+M9HB+UQTjfIPuA2
 1DPCcSRsaXT0DJMMfivU1LDWgFGoYbLtzWBx5AiqeE1/UE0pLyG77F7J9iREuJ/kM/MQhx9QbsN
 l2Fuj+y72frVXP1mswCyihFphqOxjK9M5bmlTEOGGJOQyU3C9VQJPtrzHFet747WOxTmFdF1Jen
 Qgnz9NIPepPfqpdwCUwCNHwvvX0jHfLCfGLaX8VoseLwFbPb02n7U17Q8tSJT2zPiOi/TZFisgA
 pJKOgV39N2FGb7lEHrOkadTPDnn5ZqkQOJkue56EHc5UD5qnuxSlI3DILyKurvwRk6kD/T1UADW
 o/meM/KQwv5WyFlB6fvlZG3W+OTBMP5X8KotvITAUmg4x9iT29SIhNFFpEgVLKE4aoapxEldmA3
 RGOrkkSLzAvZmeI7GOA==
X-Proofpoint-ORIG-GUID: lL9Ixz3-_NBpJx9qQDi5fJb1_9VxYEtf
X-Proofpoint-GUID: lL9Ixz3-_NBpJx9qQDi5fJb1_9VxYEtf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200195

On Sat, Sep 19, 2026 at 10:14:54AM +0530, Vishnu Reddy wrote:
> The nord platform integrates the Qualcomm iris video codec hardware,
> which is compatible with the glymur based iris implementation.
> 
> This series reuses the glymur DT schema to accommodate nord iris
> support and adds the required iris device tree node to the relevant
> nord device tree.

[...]

> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
> Vishnu Reddy (4):
>       dt-bindings: media: qcom,nord-iris: Add nord video codec
>       arm64: dts: qcom: nord: Add iris video node
>       arm64: dts: qcom: nord-ride-embedded: Enable iris video codec node
>       arm64: dts: qcom: nord-rrd: Enable iris video codec node
> 
>  .../bindings/media/qcom,glymur-iris.yaml           |   6 +-
>  arch/arm64/boot/dts/qcom/nord-embedded.dtsi        | 114 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/nord-ride-embedded.dts    |   6 ++
>  arch/arm64/boot/dts/qcom/nord-rrd.dts              |   6 ++
>  4 files changed, 131 insertions(+), 1 deletion(-)
> ---
> base-commit: 3f2425f5b5bbbdd991ca9cdfd5502e68d8895998
> change-id: 20260918-nord-iris-70b17cd16a77
> prerequisite-message-id: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>

It's been agreed with Bjorn that the dependencies of a DTS series needs
to be explicitly called out in cover letter, something like what Nord
display DTS series does.

https://lore.kernel.org/all/20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com/

> prerequisite-patch-id: 15b7e40d16abb923052d14832a468b832822e02c
> prerequisite-patch-id: a127e821eb3382d30c05fbcf8f3fb520263cbbc5
> prerequisite-patch-id: 2d52b8db1dca030ceb064f13dc912eb5478b7d63
> prerequisite-patch-id: d21f937c2939a84117e7f4e1473875412914f9a6
> prerequisite-patch-id: 97b755b1bb9cf6e3bd0b402bcec890161cad6868
> prerequisite-patch-id: 97f41c3ba82d7a7b866b35e7aced283e8d0f699e
> prerequisite-message-id: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>

We do not have to depend on display driver series, do we?

> prerequisite-patch-id: f8fbc6150e3c9173a58c51b21aa361b4bf427ff6
> prerequisite-patch-id: 914292456c91f83f83d078d3ed589e87ec1961ff
> prerequisite-patch-id: 8b04289460ffc81d540c383255e644eef8e7cf6b
> prerequisite-patch-id: bd8d5373421d6979f63ca6782dce3cfc8f7b8878
> prerequisite-patch-id: 5dcb5f0b6e62d524634f4876b33c0ef3482150ad
> prerequisite-patch-id: 4ec69028284b5b4f1d727d600ac81f9c91eed63e
> prerequisite-patch-id: 91d92d9d408bc5722e5eaa7f615269e64e459bd9
> prerequisite-patch-id: c7b1e7672798e47c66d645c14bec824b2eebed9a
> prerequisite-patch-id: 008c9c85a07687ae136b5cc62ad8aa2ea22fc2af
> prerequisite-patch-id: c90b7b7096decd328219c71689e95ffa4127e841
> prerequisite-patch-id: 112cc818078b668c3a08b8011a22cdaa3c965cf7
> prerequisite-patch-id: ae16d3341438d6d49a5d575f0e8d67465cee5d41
> prerequisite-patch-id: 521ccda14a5f47e8c231912e82ed32a4653e8805
> prerequisite-patch-id: a22fdd503289f80720b26f8244185226e0417115
> prerequisite-patch-id: a3dba98903fd87c5893422fbae7c376a77d44c30
> prerequisite-patch-id: 86e23f75f4b0f169e537ab6430cc33a2a4ad43a8
> prerequisite-patch-id: f93d80383550a3b1475356ddb725f3d6c2d25634
> prerequisite-message-id: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
> prerequisite-patch-id: d3621342d373b4e41ca0d0b9eb4648bf0187cf7b
> prerequisite-patch-id: e8b7e40ce305132672ca5d10063c1b20bfcc8361
> prerequisite-patch-id: 2d02f5f60554a49da2d030e507bb9a27ad99f092
> prerequisite-patch-id: 7c326dff78934f41e92cf662989b1d11fa670387
> prerequisite-patch-id: 7ad3809e9f6fe6fd47b95a7fd1dfc27fc290f457
> prerequisite-patch-id: cbaf2c4a49ef854d3f908de5d8871e9d49ce4a99
> prerequisite-message-id: <20260918013740.1355096-1-shengchao.guo@oss.qualcomm.com>

I have separated clock controller DTS change from display DTS series.
So the dependencies would be like:

- Clock DTS: https://lore.kernel.org/all/20260920081049.2183845-1-shengchao.guo@oss.qualcomm.com/
- Ride Embedded DTS: https://lore.kernel.org/all/20260920084920.2201418-1-shengchao.guo@oss.qualcomm.com/

Shawn

> prerequisite-patch-id: 654ba807f2ca53a3b580f4990c28fa35fa7fc4fa
> prerequisite-patch-id: c9f7632f7f31b1fe6e40c2df354d6047553ed967
> prerequisite-patch-id: 95df9bbc25e2f96c3bc8090543bceed0a31527a2
> prerequisite-patch-id: cb3907b10983b3a473cb01fbfde657114e468523
> prerequisite-message-id: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
> prerequisite-patch-id: e1330b5a848460d14cd6574877fcf607d269d9a1
> prerequisite-patch-id: 20d099e89443a097b9ec5b297f0129d9874ca54b
> prerequisite-patch-id: 2a36ab03d78d8e9c19c900e203b05739a9fd1123
> prerequisite-patch-id: 9e326a273e052af2b63300dd20f2fd6cc78dd5ac
> prerequisite-patch-id: bb9ca73889bfca249029efb854fb1634a4360b5c
> prerequisite-patch-id: 9e71460e2d5f1e4e2993819f4d9fa27c076946f1
> prerequisite-patch-id: a2b127d41c7133ea30721a72eca01333334844f7
> prerequisite-patch-id: e34741f76b6919db19236ead27c966b789736e66
> prerequisite-patch-id: 359d24229ad496633892e70b1cf88c2d88dfad24
> prerequisite-patch-id: 6e2e9069cb620143aa305b7b29b8b1982dd0648b
> prerequisite-patch-id: 3e5fe6ef2271be5263a4bf7ffbd77b0996037b27
> prerequisite-patch-id: e051524017c9f39f8593fb9d2e982e6a4c39fb35
> prerequisite-patch-id: 1b4863f7a7f3a8390c825d76805e8e99de97a2a7
> prerequisite-message-id: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
> prerequisite-patch-id: c790c17f7113da72001a1b83fa0dc0fb82e22760
> prerequisite-patch-id: 5a2f89fdc7312d46f01aeb1507c3d179203c1357
> prerequisite-patch-id: 1e1b6daab984b81b7ad83108fb532ea25345638d
> prerequisite-patch-id: dc22e163717edf23b847a79af253c6b85bec58dc
> prerequisite-patch-id: 2cc01cddaccf18ead1c1e2506f0182193afc1dcf
> prerequisite-patch-id: a1e82173cdbb9c315bb6cce35108a7a4057cb235
> prerequisite-patch-id: 4ed1c23d97cb438c917ab31f4193c58e3deeecda
> prerequisite-patch-id: facfccd32a2f70f2bae3357106a3fe493b4c8c32
> prerequisite-patch-id: 59bcb5096aef6258f4732dc8f8789c3e846e16c0
> 
> Best regards,
> --  
> Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> 
> 
