Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751086;
	b=ahfjiDcjSoCTM8uJW/ykVZvsI4ZUnvYunJLLAtigAtCIJ4jTyQOt6JYsEwrxPc1rukjW
	 NGbhK/VcBBrIdqjCYUiiQ7hLjbBgc1+gcfFUDyvsFC1lzXgFp+Y0cJ4SOM2Cz5DXpz+Rn
	 Meu2HjyIao5adUjD96t4uNUltOa2GmRpiCMHiv0sURyTpMDVbiFm3lIOcyo1c2NgX5yn1
	 Gcw2SM4BfjsS8b6eaHFS6FIyAE5TGhshhVLUeWXQNqFSdfLZUtMgIor4i8lQAu7ZRgLrH
	 xL8MzVrgLZMH5BStgIiXWuxJmM8d6uUJW5cj63ZwQNkuHhgIqSJLRt/oQ2JOzGwcaMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751086;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
	b=Um0raQu3jOVnxirD60ck+yUY7lzvPRz3B0KdgmpnvotR5voIr82dpYnEmpyca4vG+GnB
	 hvIWujYf3ZTcyb1Q8kbvEZcxlUlgQgQA3vrrdxXt01OTHuSJAQlvl9dIf5Z8VPTOGeGCJ
	 yugDOUb6vJs9uVhpdW/5hcXSj8R1DX/e444ZTH8+T+DFFx3um87UPt9lasU6yYx7zxFZp
	 wG4axiET5nlADLfxHjaJABBInEflLPZpff2Kylwa+ZAuQFXhM6vV2E1xBR8O8Yq/LGNrC
	 CGjKBy6dV/RQc2LVX5HdfR+TUjXCjew+G9p6HcuyW3nZsRTaL/u9G4I8uaWugOrU71w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyzXtAuw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzHppfrh;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F3AD606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F3AD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lyzXtAuw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzHppfrh
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAUmk1948369
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=; b=lyzXtAuw69wpYjha
	pMHrUT0p2kEBkfcfdpMFEmya0cZYYFkuD8waEtPZn8eSr/tFf/UHh7wMg9W0Np4o
	3d9iggS27yhaJeSrOQ6pGSZlwTq9eOiVgulI/UDTpDWy8EM29oaaZGV1uOlASvA8
	kwb2HFQImTUSH6x1r6SMVcF3H4w454jZ+R1l1+v4Vk9PxELDM6SRh3VwYn26SuE/
	SvhBafkK+wOhQTeFBat/qk4Ssn1uqLpzhtei70N1fvnIa+CN1j7iD7Z4Y69tjTl/
	BX7+LiWbWT6S6pg9H0EZp8Hj3FEK8nSdUGBFhUECe+RQn8XylW8Ksy7ugFrVwRKR
	FjBZEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtu7fg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:24:45 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93df7a9466bso9570285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751084; x=1793355884; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
        b=BzHppfrhzws9t7xJX/+eZ5S5bA5NdHAfaqG1sk48XWjrQARwfLNXzCi9odpKPHUJn9
         YGgnTGKO4NoWjh2fO97w9y/y90hQXIBIA4kabsOHRC93lR/zjbf7T1/pGOFaxHPC77bA
         rZBLZq9IRuM6hk5jGdHuMLFCWbsAkiN7rLQWcbuqf0UJIdpeYW0Au7rxhBTTcdbu1aFE
         t/vgj19vuD+AF4ewR7d/xdS7beLti8bjAbOoaJVF7Y+ExtsJI2MsLjlbdr4Y+wLM5HmY
         5/Vo5feWwkeHSym7dCEwnYMmqZrEAJgJFs2xk0en+Wq+y34x+fm3ve/8ZGAEr9cX0kCY
         bmdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751084; x=1793355884;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xaaScOGIozAWpXbcitdyI9ltdmgfQyDQm9ySsdDqK+0=;
        b=lis3JbVgO6rg5l0udidUzlfYD6hW/X9I0j6llSN+h9b4DN4q+EoSMpneP5WVcQrMu2
         nFA4bZ7HlbWAX4By9FhmUAlRK2nAI0uXKJh4XJ9i6ewyI91pBNuv8jaKFtGSIVPv9GWh
         DUbQ1cpUqdg+uf7goqfN1upzqj8ckHGybd7VD5kPERyHurmwnSyla1S3yvaGjdloftbU
         b5zqtAKykkBCIEcUEcwoVnL06P35Tl3tgg1694v+cyQBdrN0KseyRKdCJC7XplbSapkB
         GBC7DcZBqUQxNlPe7XBrmWs9NzC89ryiYw0fFwthmN7IOOGP6xbbBLq9cEDYY1r0RFSN
         qSWA==
X-Forwarded-Encrypted: i=1; AKwUvBzT5lRmb177cRV3S8bsRAlRBI5T0fVlwQcOTJLWnb0qsKkYna0kSO1PpEWamv35F2I12YtCi1TpaNUmJlc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIktusTDKTLFq/XyGW5yJ8HJ6mYEAHir0wX5CLoCj53E8u7vRAQ
	1m5sgdrzGI+/WYwIP295dOh1ty1vLJEFp0cbO/rN0Q2TV8/GuqdNVThGxc0h10PwfCEUXbA3pV/
	Jm5fU4p4QuI4SG0TPVwr/QnC936n8dYgcBAmV8yUCnvtXXZIaazB2s2p0jS0bLpBK/94=
X-Gm-Gg: AYBFou2Q2jqq+nA+6MmBPTyl+pZwvqMz25ot83qHsNiGHu1WCMp+z3S/fW6jDICUHS1
	S50Dw2z7YPH29lDrxwO9hMttlVGpA1EK8D1wNp38hur4c7Q8Pr6HR5O/yfcVqIdmGwl3XdWYqJ9
	gWepuX6Bl+ORxqDW91C6c1WT6BQ2Z4Z/WTAwxwSnTmTKcPzbrOrPeGL7v39CYwcJpUdh8lEK3Aq
	3XHOfLJB3un/uwwXwowgLUUVAtTwtngb0VNgKECVd81r9vZODts/LYg39uteIymQF33ja1CEBDq
	m5bguzlJ5XFW8nkt7ysju6+35230KCz7juEdopxhKdglBcMFilF5Ewvi41A9zzrucFYPVpCevgH
	RoMERLIQmpkf2dh5+sOFkAQ==
X-Received: by 2002:a05:620a:72c9:10b0:939:c7d1:7471 with SMTP id af79cd13be357-93f6f926212mr320691785a.4.1792751084510;
        Fri, 23 Oct 2026 03:24:44 -0700 (PDT)
X-Received: by 2002:a05:620a:72c9:10b0:939:c7d1:7471 with SMTP id af79cd13be357-93f6f926212mr320688485a.4.1792751083725;
        Fri, 23 Oct 2026 03:24:43 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfc82csm85128166b.81.2026.10.23.03.24.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:24:42 -0700 (PDT)
Message-ID: <050e53da-4e95-4c45-9b8e-ce3c816fbe90@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:24:36 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: kaanapali-mtp: Enable
 DisplayPort over USB
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-5-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb35ed cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=9izfxpSnjEJMC5M6MUYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: BH7ZXBTXGGp_3rUAYyt4vRV2RQgQ8rK5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX14mUHLblYd4Q
 pDApEyk+aAhdTkvpYcNnPypQTOwqmOsdH2845pyPZCPSotNj2E7HRCTD24HRbfOXcZmY/u9WTFI
 58hxVATN2aZsSnHFFTapnacezmDZLlG3UpKeq1pdPTYxS8/7KFPhY1nlFfL6UuyZv6kbWGtIdCY
 rzcKGBnfir9XRw0aV9wqq7S3qy4P9HluSd/o1GfcO87IMyHRo02r8ag93/JX6s2DlhlZ7fthVy3
 WVMX76tEPH7W2UCPSZZsoRm9D23HSjw0Q3GElfPIfnJ2+o5l7h64CuJvoE210dNKIDyQ5+23iGO
 eLQEhpW5quCn4AAZyBx3yxilGEVMbHq0zetUjx+3fnQTDjDjvbSjGBMnz7TOOUNY837f3cDPUi8
 SlvV4OeobKl6b55PfyXVQYy+tLxpc+14GkmrSKYkFO7fUkaTaJk/PYHjN4BOaj3eh+Avl5lkVaf
 UiHJJhdE8/R9PTWtTcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfX2+7qeFXvKm4X
 NR2eFCIaULk/x5bv8RiGS8arBqJzDMZHVpeqHKFffFSULfxCWz+5BRlCF6KCJi6mRz9pAxHB48z
 Up83CLq7DTgRGEjs9hdjyggrOXazdyQ=
X-Proofpoint-ORIG-GUID: BH7ZXBTXGGp_3rUAYyt4vRV2RQgQ8rK5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> Hook up DisplayPort parts over Type-C USB on MTP.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
