Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794402247;
	b=Mavcpp3TJZWe5SZUEd+0qRZiTnciZAuBQQZYvdDPIbRXgzroUqmI84BSune8LypcEHdE
	 +tHD19PSePMl+/vvtIMi8l6qcwSMi8Z0jFfBlhu0u5d2GyZqR/c2dQXJSNim8lIYWrtfH
	 w2SMqP2IRu+zxItuNhvvq9XHEEr2RgrBU1CzCskfuXAd1d/5rRPpCov4emVQPk0nvYeOC
	 XKV7ggZjYagwpd2U53wpJXkCKvssC4CJecvQ7wlepjHzxZi9m+rHrdfnWBXyX/R1hhexQ
	 oM2pEGM+XgrrSzRIlyD+68vSoarruOCxrDMxERqSaEAOzu1/O4/aIDmLKUnbm4s36AA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794402247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
	b=KYKNn/y4yvD8wQLckTNXIPuFWAFxCQx2LASAvs5y0NlAhbAIT7iIV+2Jt1pTT5svVdv0
	 Ng9HIxYW0oNYfs8cyokHs0zshno6Qj7Z0u0dSs1Vx1WlkPD56zcoB7AQQ1N2acVRSbQga
	 rkHZ0JkR0qmD4YmCSkJ6pVlbbj2Rqr6F2KDz8m1wfdXApQ4Bq8x6YBM8z0is3VKRvCAVg
	 UmylzhdJ7TSGZF4KCV7WocFxPNEtp6pqy5JNaEkwfQPS9PfsAgceyt92CYCukc/h5vJAm
	 3ZHXZTNqCIu2Cut/vSiymdw8VUhkm+hKqzIb9jPyb2K/t0o7RpbyCuS7G2lEGLh99nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXQgzpip;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO7diadG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF74B606A326
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:04:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF74B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZXQgzpip;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CO7diadG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZGX52357069
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hXFO6nUxnCW4XbKSEmI+WWHT
	tNiBaotTU8OUh9DkrJ4=; b=ZXQgzpip5uTvPSftHjwaOcUkWjomKAoZGLBjeYPm
	o1VQ1fRKMILYH+E2uFvWC/UqY3Yc/4Q4Cqy7cnrDFiv4EcuAgnTv3xA+bwMUFWPo
	TOKcHIcBcPBQwTeI6WiNqonqVAiFrS98rjxib8gIQlgalfftVkLQgbSl5+8L9hzN
	2ojK22wdT3LQwRit1G1MrsSzRYQ9WRi5bskOADsWRZ+IDlHaN2bK9DM4sO2KqbBD
	n6fexJdluRTZPVh/Q0Ax3hc2fl3bhyCm3VDwbPe0oGwC43BtkpXpu+dDgqGY0ShZ
	vKLCnaMizQ98DjuFwWT3CLzuTlwV6efLjINJtlAuzKZipw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdhwwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 13:04:04 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9984a7eb3ddso2223511241.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 05:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794402244; x=1795007044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
        b=CO7diadGiAttY4E/+4kLfuiiHeeRkXpOKDBR78nRQSn4cnlrP9f1b9i+N2TfYtUXky
         kIzJy2WJ1U5w/lQigNsSxgKmsJj5aiH4B8jdQZULkDn+lDYTl5M/6uknK9yI0Y+sNDCb
         NL4aJTRvkWYeHNAZ0PfxZGLAsl9Hu9qsM2o1FY/rFEpYxmvpwxOCMfxib0kbz1iLb7uv
         C8WFBxZwecyQf4UUfaFt2qCHsh9qOWo8GaYMoYYxKbKkRp7nVSX++1qKfaJfCI6dgelW
         4KvAQCMMJBQClZr7Krz6jJR+nDdQK0fEdTLjTxDD3sOCtsb+1+B42veaMJZ6kyKt1j/p
         tG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794402244; x=1795007044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXFO6nUxnCW4XbKSEmI+WWHTtNiBaotTU8OUh9DkrJ4=;
        b=Yhx0+055lQvin3BCp8lmsiSgdrdIlFfS8lxDIrPowJxKbeZIo1HjAZgIghSqJXVNlp
         rGnIRE2Ng5pOJNNhRZBrVhRPS6nMSRrTEfeQ1eMuwjhjzSm7dfkFC5V4qC8TTAD+hDN3
         FxjTJY6z/iGv2Ofi2IUN5NdplKOVudDMkT3xijx5+gMjGS/3vCpgXkVqRzRot8VjyvAn
         Ppddg3OV++t2XXRjIBobF5fI6Z+M3f3WRdJn3NwAw2IwoHU2u+PqAPgJzxakX9vfaJUt
         My4IcCJ4dXYr2NbCNyImzaSX/pCXhhrTrVm05Hb9pwPlrluMciQAhux7S8hcp6AJ7+K0
         U7zw==
X-Forwarded-Encrypted: i=1; AL+hErGAHwin5lJ8uuf8e+hExdjqGlfgQPTh63aTiMV5e7nbsds+ZxfgYCJxgPi4FPj94COmRTVkkMNtW3pi2ks=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QCOGFIbWFl0LurrXgnp5WaCQr9/xX2QXFKCCqSJz3QQdXUyoV
	+RevT9Cvf+RjgBfbvM0/ntjKdJDUoZpQFxMHsLkg3OqcCvD0b4+uw2RE40Ow9q51rxcSp3HQuEG
	MYyqeQAcHW1Xnbbad0HyI6BqzpBxt/nSJsFApAyJmxCSLmdb2mSNOYExvJmA7BSuHAiE=
X-Gm-Gg: AYBFou21xm+UwSV+WPx2aFCj70Z5V69EC5uj028I3TbMl+8RLUiVSjQUNgvYoKWnKeO
	W95yPdB54zSKNadf09RfDy9EXhMGHTzysoK4FSPg8aj0P1bKFgoz4E8Gkwjp1nL3TSNVDEWhCm8
	o+swBoZEdGjx1uwzr3PL1GqaqSI1IZOrEdzH8JumtHmLIFo2yRXCVOl3DadBtki60TNhigmz2+s
	RQ0CaWtxEnsHbMomzzLEkFLbrpSYcGk/71yQbeyNMfDNhfeyqOoVGmLlRAFBZx7G5VdNNa0tMsy
	tq4DtOBomiMkQ3zV9hhSDbnVt+KKi4BKAOxO5GYNgwJ1oM8CiHsXQi9PxJeLIbZUvJTn5tiZ04n
	tdEKCSvlQmnQnxpMLqxM+KU+ftqRYfxeJog19++J/U43eCE4+qxTCzdhBENJP8ZzKMxEnwsp9s4
	41OqLXYvObm199/n0ENACh7inv4mHEaTeh7jkTwUQ7FoibxI1xdfuolgAm6W63jA==
X-Received: by 2002:a05:6122:1d8b:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ee1c490338mr604715e0c.21.1794402244019;
        Wed, 11 Nov 2026 05:04:04 -0800 (PST)
X-Received: by 2002:a05:6122:1d8b:b0:5e5:1be6:e12c with SMTP id 71dfb90a1353d-5ee1c490338mr604634e0c.21.1794402243470;
        Wed, 11 Nov 2026 05:04:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bb758esm944566e87.67.2026.11.11.05.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 05:04:01 -0800 (PST)
Date: Wed, 11 Nov 2026 15:03:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Vasant Hegde <vasant.hegde@amd.com>,
        Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Jean-Philippe Brucker <jpb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Tomasz Nowicki <tomasz.nowicki@caviumnetworks.com>,
        Eric Auger <eric.auger@redhat.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Joerg Roedel <jroedel@suse.de>,
        Srinath Mannam <srinath.mannam@broadcom.com>,
        Oza Pawandeep <quic_poza@quicinc.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, kvm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/5] iommu/of: Make OF_IOMMU depend on OF_ADDRESS
Message-ID: <yvkcq3zirv5tz2amfbk52a7smbsqs7jrzdisq3qxzw6xkoxklu@rplx3gvxhcoz>
References: <20261106-add_iommu_ranges-v7-0-5c0f72083e52@oss.qualcomm.com>
 <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
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
In-Reply-To: <20261106-add_iommu_ranges-v7-3-5c0f72083e52@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af467c4 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=icXyEQzqa7ihQCE8Zv4A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-ORIG-GUID: RvJbjbczS_41dSq2aiFoKGP_s8fiGVK_
X-Proofpoint-GUID: RvJbjbczS_41dSq2aiFoKGP_s8fiGVK_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX1d0DCB8iks9r
 fTj2g0KWjm7Zg6SSn27+B0sOOJw7nnExgEmQboHTJon1nO02mz3x65qqkttBnoxxafa5U8dZozg
 KXgUPaNFyhHCnnwb8tzr5XiBx68hnvncOO8zlil/0hxr7oorMRFUW2aUi1VDpvFrnQLT1jTPJbG
 1Pa72LFnb4GRRoJilW2UFmziJ4Eu7CQE4hFWIpqocvoftQ5up7X/Tj7MJZAzq65VVPu7PU96xKs
 k3Ctcu4X+2jWBv4PYrUnnDm456pqH8c/73YfohIRj/vxaxzRC4wxKE6y280KFAy/HUzpTpo+cxB
 6cgj3/Hp/vU4GrEMpzt7NbAirpLphGWSeG/eCGVWE3/1wLVuvlL2cgemLd0zDUdk5XYR40tWD1L
 RRAYodOjI9gOkd1Gs4p0vPvvcWdzOU3tIt8lyXNVjFNKD7Fc9P0az56xt5kpyHILWm6wybbUSzD
 LvjBAJ2x3LKN7LM/AuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MSBTYWx0ZWRfX5XF72qQ49xiV
 FjUkRBIqQrtGV21Y3UP44AM0UFYb908+e5pojfstaW01TyNYzEVo9ZOw5h1pe+8LEkvU6BcokS3
 T3h+7NkIc5bnrHrDF8XnUi1FhpZzLb0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110051

On Fri, Nov 06, 2026 at 10:44:26PM +0530, Vikash Garodia wrote:
> The OF_IOMMU code relies on OF address parsing helpers, but the
> dependency on OF_ADDRESS is not expressed in Kconfig. As a result,
> of_iommu.c contains CONFIG_OF_ADDRESS guards and a __maybe_unused
> annotation to handle configurations where OF_ADDRESS is disabled.
> 
> Make OF_IOMMU depend on OF_ADDRESS and remove the now unnecessary
> preprocessor guards and __maybe_unused annotation.

Why? What's the problem that you are solving? Why is the current code
bad?

> 
> The only architecture supporting OF without OF_ADDRESS is SPARC, which
> does not use OF_IOMMU, so no functional change is intended.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> ---
>  drivers/iommu/Kconfig    | 2 +-
>  drivers/iommu/of_iommu.c | 4 +---
>  2 files changed, 2 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
