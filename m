Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CBD40DB43
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466422; cv=none; b=DEnrEFupGXjvGPIrYkuHo/FNWKAIJRDM8jpnSP2gUhMQKw8445oqqMGNI5M70MF31Ez1OABZwJzMSmJcPxd5HYoMXdvAHuWwwAnKhnj6mJX83riEW3XLC8t0JIG4F5R8FDu9N99gmV8mA9rIqRgLlD7mmumfvYQDewJ2qEGFOUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466422; c=relaxed/simple;
	bh=3EKHdUtlfbgnXzhwbfKX96Yd/Jc336claAx5nngK7Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H4P0eBOMhidPFLGFArjprPugabyIfS+7/Bfa/jHOS3Vd7KsuZpPcOF/X4zI+Q8TTzqPDoAQv4ZqCTxwB4OimET12kjQKhVWYdKeLlGeABoxgSElurwkbdMbjrocevwTaLK19ctalnVuaq3VYrhaqSD81TJ2SECxX8ih0YElRqhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIYPnWsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JmNiQrF+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIYPnWsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JmNiQrF+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hEfq2833232
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CIHJOWMLGhLlhqJ7ANPesOl8
	7R9CmRzbsHGWLK7lnrs=; b=AIYPnWsm7HzwL5Hy4SfEJhUOkXwRr+yhXl/9yS4/
	YKPNzN/Pw/Hw3P7WJPwUh858+HMofjpxZvQRrIYmWm1cHLJAD/Q/KyKDCQUcsoVB
	nbC927Gqd1S8m+l+aQpTlPgkzRq10UkpuqEqX7PK7EjhuWIUegsyFG2ebaLuwbiG
	UUprmdxj1eHwe5FKgM6THRn/+vIn1E7aEYlzFOW8dq7hFM7d7Uqek/YmQxzXffWi
	PB4uePU4FX7jZqybTTP+7QLw0TY64aYHxNzjrCQOf/QLFlyo6zPt52ufj+TeW8qn
	zhBdrqXuPUqK7znQD6JYSgo8JF5DZbEVKYFSQaHnnMRMYA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd9814-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:00:19 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936e393061dso688929885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466419; x=1790071219; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CIHJOWMLGhLlhqJ7ANPesOl87R9CmRzbsHGWLK7lnrs=;
        b=JmNiQrF+QdxYtnElWWG+GdgKHDmFfSR6mqaEqdOyvPIQCUcO2etLkdtqqMCmYiIX2R
         Aj1Vc35DIfOUC1F6T14S015pRUbWm6ox+yKGA90LUU0hCDlbamHP6Qiq4NxT5HTnFcXN
         yluPVCY6iz9qui/z7e60byHyTHtU66aF/UgTmNCGeR+1Pmf1XxuYsW7GBvNNuwr3ZNEw
         DIhuo/O7aI9TP6ho1sOflkLyMMcRbUT6xAYCyHRD+jNyqux1HMKSstcOyL/7bQhaDP4A
         rolHEbB+gHiT5iLsooj95O3tvKoIDf1EPqbhOcBYxHMr587o2favGmlR19GVGPcnFj/i
         SsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466419; x=1790071219;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIHJOWMLGhLlhqJ7ANPesOl87R9CmRzbsHGWLK7lnrs=;
        b=XgITTlFUWTH4pLv9rgC+f2FdRdi336Si49h2JdhCOdEkwrzUhLLHSvZLTVote3k9bz
         g0OBlpl+YomgoEVs3k0MkjzdrLzNppNOjohuMjw6Il+8c4Xut6mQjtCp3A1wHySpD9Fz
         VRWniWiMNocG/35a4mM39Y+b02wFNWyQipCTZipeFn0kxW5W+48s7xIe9r43N9a4Tvb/
         rYAABsieJHOn27a0tAJcbShGYFGPOwxq2cXP+PJpwQU6mQqrw0CtKA4usRBkm892ovD1
         oU6zE2Hbue4kXc1xoqi9ZkK5KK67aOCGPE4K00pyMcHzIURJ5EiH3Y6LLovkJwoseaRC
         Ul3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxhL5f978qEYaiuuCBxnBgBYlMDUv2/qXwyMdIbYNqg+GpRYqmynhk8oIfS208RylQKtQAO06N1lTvvqF4=@vger.kernel.org
X-Gm-Message-State: AFuF++mlw+D705IjnFqvDvbcOMegN1zyNrqzPIKzHsnZwdyyd7VwNn4S
	c0Szc8orqy3zgEiQreCfjssnhcbbe140WdrXS55SB9ukekO3a2bRdmdrQqa6pJqqKGsxEheqymt
	Wi6+gfrtwhCmsHSbrB74ynxA8jseneVMq6C6IeWmTgSMpXC1ZpFzs08ksOZuBvWgq1Zw=
X-Gm-Gg: AYBFou21suoQDf7rBJUq1k1PiYfJyjt9EVNp7Zn0l6Kgs0+Sw4BmPZOEJTiou7LULLP
	l05i2x5pYOiiFwx65S0Qr/5CkHYygYwYHLSA0VOsO/kVYXmYUL/y0YYAj2Jd66i/J3969VpCh5e
	8kqimjmUBvxKhWo9jYrirB2seLdW51EoTvG0SK1LGKuRJx5wvjxJKaFHqoKvkLR74DKUfzEZRbq
	2IvM+OzNF3vpQofxtzYE1iTKeiiALGxwRL/tNAEjZ+RMx6l8snTpezdXx0EP44Azt9iEcP0V86J
	Y9FbY3VwF4MgyuPJJESpBAi5sJ5tURIv7BVLibcNgF55iQsOLFIHo7NCYl6pyCwzq3dEUrZF8F7
	ftTTsy6239UVvDQ==
X-Received: by 2002:a05:620a:2549:b0:939:4a44:5f99 with SMTP id af79cd13be357-93a297cb330mr908638785a.10.1789466418521;
        Tue, 15 Sep 2026 03:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:939:4a44:5f99 with SMTP id af79cd13be357-93a297cb330mr908622285a.10.1789466417390;
        Tue, 15 Sep 2026 03:00:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm30971178f8f.10.2026.09.15.03.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:00:16 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:00:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Liu <xin.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nikita Travkin <nikita@trvn.ru>, Birk Skyum <birk.skyum@pm.me>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1: split PAS remoteproc iommus out of
 x1-el2
Message-ID: <v4brj3i6npovcksaqi7qffkl2fo4ihkg32tzrh2sttfjmwxnj7@s52v4b5nkw73>
References: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NCBTYWx0ZWRfXyIMjk9eLmFyY
 9pak5KTT5zcX6EUUv7XAnkgwxhgbuEVljWjFk+penBEvqe1wUyziajkf3Cj1XmLemTnLE3qJdQS
 zOXebF9tk3c07nj2B+w80pNekGTvSko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NCBTYWx0ZWRfX0vCHy/Ntfaol
 g+RG6sa/mK8mUnWBodejMY2UeQAKQFxlWPIhsIVHHQQ22ceCE5pxE1xCCiI0nUdysdDMUoh+nZH
 bd3jGMzFKgBwp0ts8U8y9nvjaXTvj9/vqRn9kgzmVIUQ1+OClGTr7ZsQMU9Hq4mxEIm7MG7Iyqi
 UqD6+3x+AfixQ9qphem/ODJ4ctQR44xTRQHGKI5KNVJpz30q/iouGP47YT8qAlXFOiBfVSp93wH
 j9vwjZVd2r7I71vJv5oIBqyAb6vxR3l2Wg78Ip2lzWTiawYyC0RyqUxT17bbL6zpIiEV6iFPinx
 BXhBqKJS+/HAtaZ9TmDzV5Cg7f1OSYKQwjhJvUwX29Sx2T7yqIiZ2LGzkSE2T+6lfOm0val4o0R
 QQRunTMhdQvhXRHKjEpktLzZ7Y1RxJK74mBNNJAogDQW5x1JB/IGGGp1WJNq920a/QJCG7pJUjM
 UPfi7Tufz4YgnRqpgHA==
X-Proofpoint-ORIG-GUID: QbA5gsReX7l_AqifAQb25yidML_7TRuL
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa91733 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=InlpzHCLAAAA:8 a=gxl3bz0cAAAA:8
 a=z1J0HiCIPE4x8j7KUW0A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=j9sqBCYxEfXq8HZXc0HF:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: QbA5gsReX7l_AqifAQb25yidML_7TRuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150144

On 26-09-14 21:42:21, Jens Glathe wrote:
> The shared x1-el2 overlay currently attaches apps_smmu streams to
> remoteproc_adsp/cdsp so Linux can program those SIDs when PAS is
> used to authenticate and reset the DSPs.
> 
> That is wrong for the common WoA EL2 path (slbounce + shipping
> UEFI). There the DSPs are already running from the bootloader and
> the SMMU probe path leaves their SIDs in bypass. Describing iommus
> on the remoteproc nodes replaces that bypass with a translated
> context that is never set up, and boot dies in an SMMU fault storm
> on SID 0x1000 before userspace.
> 
> Move the remoteproc iommus into a new x1-el2-pas overlay and apply
> it only on hamoa-iot-evk, which is the platform that actually needs
> PAS-managed remoteproc under EL2. Other x1e/x1p -el2 DTBs stay on
> the generic overlay.
> 
> Tested on:
>   Lenovo Yoga Slim 7x (83ED, BIOS NHCN62WW) by Birk
>   Lenovo Thinkpad T14s G6 (21N1, Hamoa)
>   Lenovo IdeaCentre Mini 01q8x10 (91B6, Purwa)
>   Lenovo Ideapad 5 2in1 14Q8X9 (83GH, Purwa)
> 
> Fixes: 47c88db49f6c ("arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2 device trees")
> Link: https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qualcomm.com/
> Suggested-by: Nikita Travkin <nikita@trvn.ru>
> Assisted-by: Grok(xAI):4.6
> Tested-by: Birk Skyum <birk.skyum@pm.me>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
