Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC701B4138
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 03:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791171784; cv=none; b=iQQTxkOoZ5ukhm+BgPKkzfpsg4KAVnROyJ/ilUaWQio382Io/FNzNonLn/SNMYPQ0po+IAXIybv7p8FlAZBmIK7xl4nJbS7BD8soxRhNFJ+hx0qmFaRhEfIBANAuVoZvRuM93JjukC7r5jeHrOAPpNtMsG55HkR9+WzAkxdxcYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791171784; c=relaxed/simple;
	bh=UIiMS9AGBk6RdbvKnKfoPOhncbXZvPvzDhfOO/rc4aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S/u9GJ1IPYwh4qJmwy5s1nk6zSQ3IWsW+cD1c8ii013c36JsUz6slJ87+iazrne9jZb/4Dszbcq4MmAzZNKF7o6ZDfcmibTOh9zKQNEdjF6dQMvORJFiVkfcIzm5j3brUQj1cAcWgHSe0Gnap+IBeWIwEKexltXBvmIPNNW26uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OlVcNXEE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KHDKm3os; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OlVcNXEE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KHDKm3os"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695102c94060520
	for <linux-kernel@vger.kernel.org>; Mon, 5 Oct 2026 03:43:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EbPg2aQdB3WJiIm4v4Ostya5
	4S6FCqAcPPGhfO25FV4=; b=OlVcNXEEDPZC2iM3iL/LN1OWZVcT2ngczKHLkmPp
	CoxkL7w8EmQZMS92I0lg5SE8VBbnX9j9g5/OB0VkHGZC2qaGtdcNqYPOOP2YmguW
	LwN+ReFfCutdNl2LzNHtsPudZDOyDFNxKmqL+Lt9QN7dSd62sk/W9cCS0Ihj3wRS
	Lpa7W5hcuyzOWSI4I5bO5DEBMamjNPt4UNV3bvtmfsjK2ZmDqL8P0LGhHftk3TKl
	r+Vc8a7sSdN3+F4dF2l8nancbYyCvzVZov8Bil6HyJOocqNKY8b9iMdh1J51DvoK
	ymqNTsGppFQruLihreDpQRMPOejwRRdkdl3EIeJrZAht+Q==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h41gn89y9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 03:43:01 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988cb71802fso1044921241.3
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 20:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791171780; x=1791776580; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EbPg2aQdB3WJiIm4v4Ostya54S6FCqAcPPGhfO25FV4=;
        b=KHDKm3osxZd/Vj1CHlneFHA5O7A6zFn2qlKuJN/EIEZNb6XQ6XnjdDAq0IMvUZZSBd
         eDrmO8S5EMN0sEg+6vRBxeN9PN49ePJIZQfPm7nyc6fIzDQ0oSEoCALKl4m7S1VMUlpR
         n4AxHqAleiXKM6E7V0zwKbbuXheamGBhawv3zMY1LUTuBPMfQk5PQumyXPm5dU87LN4B
         79Qp1haQBX0XC2XygctKrXAeDkClDtjkcNAcbIf/rTGymtZQldopdugocPeFIpb/EQdO
         FSf9WpYaJ+Sz0l0vVrM8l7C+J9jun0us7Sw0l7e50TD2Vf/71okMDOR71GlVm+oyRzSQ
         +ANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791171780; x=1791776580;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EbPg2aQdB3WJiIm4v4Ostya54S6FCqAcPPGhfO25FV4=;
        b=XNu5WixGzB0zudemr5rvm2NDcQbZk/lj7BcGZWftHjksPfZDMj60DUsmpLKiLdkyV2
         mAecoY3LgbGR9/OGhd6v1E15nkpjh+gv75SlLa+RC5s/jovJXHrBehNB4/7rG81uOVRx
         vjLNi6/r+a0IoIe2zkNzwSWjV23Xivfbnw4OXWC/R7drDndpscmvRjC8dla6GLXS+8Qa
         d+i7lGQOfjnNEvFCNNL0QcM6P430mfF65hoshU1SUf2qsYmxTM/Z8uYIodWaB+C/cDhy
         cB6lUNK0RbBxq1CjNguv1LKZfkKVhfM3sYjuy3GeOk6jKx68nsakRMcPWY1lLiUdrzB7
         gipg==
X-Forwarded-Encrypted: i=1; AKwUvBwmVkVJ70V53tq1DxcV8laxgX3EF8mcmfB1un+9L1M09FNNo4umbJsaflnfdTLVPjKNDLySo+gzjCBf4QE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTZgGhQbScesd2yxtvL96fqW1pd8lBkj2XSYeCpNy9pjGqk+vT
	GAtDeW2Xlth0r4OQzGCtcJhW3hZfsFkLuObNiYgN/mwUQGtBLzg5gXikMWFzzFi4RkfBxhm/WXs
	Qx7dVEswMHGCaoTQ5c/rQ7IQoIxUdDB59xBvfyCDM+cXKTFUwaJff9e5A434UTlH3utc=
X-Gm-Gg: AYBFou2fWEVpe78gTbGvQnKBhVwUwzKgrJ9Yg9h866QwJKlVEGNw89HaOUc/HIzdLAW
	+CqvQWMpRzWb4jldnjUA0ilFRalbMKyzVTOUsOalBbNki7RJaM6yDxzCMNQg/4LJmA6+u6ZBy6i
	il+hV2sO8Ca9RcHF5mMfw4vO845XkbRY7iX99H7BmqBrNQmTo4J2uc1nnHMv72OOUyarkzIMZbJ
	nPUUTfwoao/Yt3WTpCRJC9Qm38h0tQLqnFMo3JpOgHQYiS3uNpx5Ox98GJBpIndHx8WK+zIGpXY
	5e8qGe5/OKWaouVK/PBdV66pVqjE7W7dUSI0w3LPvYvA8QLQyw2x2WZVwCYh62FhJRQKL41SieI
	QKAdP6rSyhiSB7Z1R4VHVCVp6M9BHb5DKPNphp1RztSi/tu7qUe3KMGm7d5nl2Unzubn26hHvrW
	IHGAuyg1IfG10j
X-Received: by 2002:a05:6102:32cd:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7c2457ce32amr1571281137.23.1791171780362;
        Sun, 04 Oct 2026 20:43:00 -0700 (PDT)
X-Received: by 2002:a05:6102:32cd:b0:7a3:4e75:d1f0 with SMTP id ada2fe7eead31-7c2457ce32amr1571268137.23.1791171779894;
        Sun, 04 Oct 2026 20:42:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a87e3235d5sm36801331fa.34.2026.10.04.20.42.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 20:42:58 -0700 (PDT)
Date: Mon, 5 Oct 2026 06:42:57 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Piyush Raj Chouhan <pc1598@mainlining.org>
Cc: srini@kernel.org, gregkh@linuxfoundation.org, robin@snyders.xyz,
        ekansh.gupta@oss.qualcomm.com, andersson@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 1/1] misc: fastrpc: Allocate message buffer from
 remote heap for sensors PD
Message-ID: <rz6rhmd46qcuaxrajxxaqudkoqj6ere5gdlb7frnvd6hjwapuq@kj3ldploadu6>
References: <20261003150559.6926-1-pc1598@mainlining.org>
 <20261003150559.6926-2-pc1598@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003150559.6926-2-pc1598@mainlining.org>
X-Proofpoint-ORIG-GUID: NG2Q-imzK7LiRDRxphz20VmJcwzN1xV6
X-Proofpoint-GUID: NG2Q-imzK7LiRDRxphz20VmJcwzN1xV6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAxNCBTYWx0ZWRfX+kFGF6xfDf/g
 GN8nqG2VmCecFs7VVhEc9xMs9Z28VktxFo6OgN6/a9yGW2/wo1CWhWT6lek23pivVCRjALuj8Xc
 BaQLlUx4CHoT1U5ZeE3vWC9lL5DAFuzar2+4p9pIAconlfBWhFi1UWBdu328DcaICfHAEDjHR2L
 sJuDHB6SqtuERdRs7YghFHezhlJ5pR+umfdDCbICaB2V0Xd5yIpIfFx7x18DLmCqwpRkN090RR8
 Ec3GD3mNcy5l1fgTOrwRc6eFObrx3aRBDuSgBT2ly7vrqvLfIDSno8X9Sd4D2TdoqxxsDcPTkix
 agqYo2IEK5FYmXeIlOcuePxszNo/pZ77FE1fl8oqNw2bJYWjM0Aloa+5R37TnFU4Z40nY8KfHIv
 6SGiUUz8D8jv+GIKq8iSgHTB7q4zhSy0sKFpBd//mkDRbDfYwX1mVu02N+ObaSyCy8tkjtPPOBh
 DV/KYE44ClBroYN9+FA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAxNCBTYWx0ZWRfX75jRSqEYXHly
 t8FqLFGguryGe0IrlIFIomLDo1FR8rllUQCC35K3vCBScy65qApMPeKvt/J+TKWGsGGghrxyAk7
 aZSJFIwldyQ1qTNDgiEqlahZlCPHBmw=
X-Authority-Analysis: v=2.4 cv=P9WvFSAu c=1 sm=1 tr=0 ts=6ac31cc5 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=OsHF4jKAAAAA:8
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=4qQ1mRuE16t6AV9Sk90A:9 a=CjuIK1q_8ugA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=aAwnOj5LE8VeXseigifb:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050014

On Sat, Oct 03, 2026 at 08:35:59PM +0530, Piyush Raj Chouhan wrote:
> From: Robin Snyders <robin@snyders.xyz>
> 
> The sensors protection domain reaches the message buffer directly rather
> than through its context bank, so it requires an allocation from the
> reserved remote heap memory pool. Using a context-bank buffer allocation
> leaves the DSP addressing memory that is not mapped in its address space,
> triggering an SMMU context fault (e.g. 0x1fffff000) or bus stall.
> 
> Ensure the remote heap is used for SENSORS_PD invocations even when
> a stream ID (sid) is present.
> 
> Signed-off-by: Robin Snyders <robin@snyders.xyz>
> Signed-off-by: Piyush Raj Chouhan <pc1598@mainlining.org>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
