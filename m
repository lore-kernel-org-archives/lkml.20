Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84F2451DDF9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790170742; cv=none; b=GEiBptdzhioqn/4jjB4EOimKpSYtEYBSWbhdbiGkHREajp+luLSqnhyELzbKGO6PmIlZTPe8NUun+FEdohWcK8AZFUbP5ZBKHC5PQySFWHQSGFKLY91wAuP4auU5MvXLkjpdpQzMo/1dxVY4IV6JwmiOkwKdVHGukIvakKS6VWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790170742; c=relaxed/simple;
	bh=XfL+ZxEDCfoh3jijqnTucyfCC/JyuOUpep+epv0SiVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k12wGVc1ko9gB5aSwqHBf3g2xCp1ZA2XTuPDjjS4cfQfERyG+2YAovgcnug51fEebu1BpsctyAgt4c/o8eGiO8MMA6X6s71coNR5w6w9fKvN47EosJsw+JU60qsBJBDO91JTyTXAg3UXaohTaBq4F5xxAqqsceVH+C+rcjLOuY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UOf6n15n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U4bYOpZ0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UOf6n15n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U4bYOpZ0"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbYIi2637962
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:38:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IyILZqagdiI0+RQboKVZiglEEbqXmszP8RjuXczTY0U=; b=UOf6n15n+eWC5LeG
	Rvedo3cs6xTTRba9A8rqwkkPZuU1CrXsWiGPeU1LxU8HGmFM5zsFL2EJrGZSB2SP
	OPQl9I/cqN52rhL1TEALopWdcLcCYq6sCpiWh3w60sQ4DAlwylrN5qN5D9fIF47H
	bwqNeznWtNQdRJ+SrpwbpvVGnDE5dX1Z0kkga3O/hg9dqFyuajb5T3wl1OGaFXTc
	5wNk0KOCbJzU8ywTXfIz5DBBeV9xg0qXh6T64POSJfT/TESU/E4Ojr9S26nDUqXu
	2M4q1icjQN2o8W6M/weDxrou860ZZiMzkNvg+AmGIoZYfImPj6XqVcvlm1IeU1Le
	J9d/jA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv9bqhth7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 13:38:58 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ca06fe9d6fso27802e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790170737; x=1790775537; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyILZqagdiI0+RQboKVZiglEEbqXmszP8RjuXczTY0U=;
        b=U4bYOpZ0b2bLscJaEjtHEIqFj3DLZ0osO5/UdIF/LBvOyNM+mOlBCkVISfjyyJUDn/
         6PQe4TlllS3SylP1BxYpAoHIQsDuRADBFQk02JTjH5hHxeoAzx0I85A/bViHD+lJPzpk
         jaM5w2GpPzUsUGHGsnxhx2dSEib8ruORco23xr+3O6YUu4cD8tpPkaS5gLgjyXSP27du
         D0sHaOQbUzwtJ5tDSKxaCsRa0TZ+NPFtUV6B+YMPjEJWIHyxwL34mvFQels64t2e7svA
         y6//bZVvxACQck225pjrrtWI7Js3lXpk9Obo/W1pGA6y0ikyzKkAx4b/UMS8JrdkhOZF
         4tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790170737; x=1790775537;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IyILZqagdiI0+RQboKVZiglEEbqXmszP8RjuXczTY0U=;
        b=17rD9VtLIQp2Z5Yh/uOtBxP12zIs4eFXZ0Ee9GdOk0P64MmiDP1JlGfGzn6iRu5KnK
         JB+K8HHyBKyNVOIO0lt0BsT7+btAFUHABNEWrjjBZBHHBQzb7BVTch8KEedmKcc2vn8G
         i2NIdYxga6gPF04QC4yqI55+txpGw8wfy9oQva7bnZV+hZCHmw5BTfyfdFpEvyCxdJ3L
         agB3yi/Xm5MdnfsWagER4h0FQaTA0Nx5jkZ5l3C6VyntuDY6d9SNck7yrGbIyyqk3axn
         WelZVOiPokOzIgOi2jErH6qLt087666sdkTv2Qt10mNfu5peDolf/SVThweWFo5w91YU
         KFuw==
X-Forwarded-Encrypted: i=1; AKwUvBzCtQpkv4O1/OqsEd4q+5uLJ3RFJfX5NpHW7Y0Ov3GFOskEBOVIaSLNyB5SsD0tbvpBu5HXLLCxko9mVbY=@vger.kernel.org
X-Gm-Message-State: AFuF++m4BX2dE24noUIlkcokFfVnkwldN+AAZ21aAD5JUOJ20RKR2u9L
	xDsdEmuR3BQ5bsgg3ZhGMYDfQW+zgP1Npk+lwNlC2TN4y8PNPWerlr0cbWFeL8B5XmzB+Z1hklW
	CldXlUzrMLMx7rM9fIPGxDqzwae1Q+lZP22XA5q5AMGG9H3H3037FjJ2vDZswNQz5fAQ=
X-Gm-Gg: AYBFou0zjeJxxiJBiJodZfLiUkUjVO3chqXjALvFyHTmydUgXghy0te61DnGtY2dPp5
	Nau6mH62Um4j/7XCtYqnmSXA7CWgIz3WK/0zGUfVnhK6vcsVbRVHcdza+8QnFAnQyp5JEeRxKS0
	QVCP60jHp7qJhD4AMeU+hlA+Oy6LDJzW7BmnWQVPdEl/+YGLOnVVvEq/pY16AWg8Z1LOAOGfXqW
	XsM29Stt+zYVa4Aj61N29n/qlaZ5ryFWNUJ18xu4EZpP63dICjiV3yfBpES2IyfrG12C/Ona7kd
	jPl74sctS/4YA0lq0ZM0mLm2fCbDjAne+6GTWw9DpH1MALx9RH6CrpIcwoMZfKbwf2+HR3rr3eK
	btBgtU92bqv5gJTcmj5+L7g==
X-Received: by 2002:a05:6102:374a:b0:7a0:f7cc:5039 with SMTP id ada2fe7eead31-7ac182ec046mr2458886137.0.1790170737644;
        Wed, 23 Sep 2026 06:38:57 -0700 (PDT)
X-Received: by 2002:a05:6102:374a:b0:7a0:f7cc:5039 with SMTP id ada2fe7eead31-7ac182ec046mr2458874137.0.1790170737192;
        Wed, 23 Sep 2026 06:38:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d859568asm626319e87.77.2026.09.23.06.38.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:38:56 -0700 (PDT)
Message-ID: <fb54f1d3-c6cb-49b7-891f-6b07bd2139e2@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:38:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] soc: qcom: smem: ignore multi remote host
 partitions
To: Albert Esteve <aesteve@redhat.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tony Truong <quic_truong@oss.qualcomm.com>
References: <20260904-port-smem-v2-0-bb497dd3c48b@redhat.com>
 <20260904-port-smem-v2-2-bb497dd3c48b@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260904-port-smem-v2-2-bb497dd3c48b@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fhX9NnwbPSRmFAsXZNWk0qpkFL1fR0N7
X-Proofpoint-ORIG-GUID: fhX9NnwbPSRmFAsXZNWk0qpkFL1fR0N7
X-Authority-Analysis: v=2.4 cv=WZuZ+EhX c=1 sm=1 tr=0 ts=6ab3d672 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=20KFwNOVAAAA:8 a=lahaxcoN1zEyVDRkNe0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX079RTj7jQmv9
 lF2IZ3S85gn2oloIJT1x8kstbOkUMoxJcvwUlwGI+GQ8Q2l0b3j4W3E37uKZXi4UkvL1c0VRKue
 LAeMAodc4oWoW3R8MvB0M0gWjZzqbWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX/ExiOMc1vill
 /KgTUAcUn+w502XYA9y7HO36Wbts7KptJ1AujfhXgzVsXp8BbpFf/FY/4k8wQpgMm1Bt0srklY2
 iKnoQj4zSp0wfRQa9G09Rp+LFx1a44490TG79nLuw8xvfAVlwAfrRaGExWDwv5dnhR2R9uUV472
 r9tMllzIp3dH9lwuWcJPmC+X1MeIO8asdcT4PiMBu8sD4gF3ZdlWIffUredK1Jzru91Bw1OrhNF
 3ZyPcLGH51jfmyXk9ClE9m9Ani6Xl+yjOtfQ19xbivqyNB7WQKRG+L6vT0iydfGTe3ACVrih2nr
 DCN9+PfAJGKPQDj87p3+eEchpOW4mfuKNRhNsNtk1CBwh9+BVoYGZ6hZKPVQpogD3XwXNqNkEuS
 SaoQ6ei/zUY1bjLkTgli7Cp17nv4Y8E4702mjSjVT8VLRCR0fNZZLWBj5zxOCsCxcA7tiVuvjnd
 jEkpeJF/Y2eA0sbiaoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054

On 9/4/26 5:18 PM, Albert Esteve wrote:
> From: Tony Truong <quic_truong@oss.qualcomm.com>
> 
> SMEM now supports more than just 1-to-1 partitions. It is possible for
> a partition to have multiple remote host and the logic to handle that
> does not exist. For now, skip all partitions which has multiple remote
> hosts.
> 
> Signed-off-by: Tony Truong <quic_truong@oss.qualcomm.com>
> Signed-off-by: Albert Esteve <aesteve@redhat.com>
> ---

Hopefully not for long!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
