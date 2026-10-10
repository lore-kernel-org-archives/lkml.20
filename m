Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB8113B58C
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791652053; cv=none; b=AiOcpWorvnYvUx1WVPN57mU/GX2Uw5UWojr6l02D8eexiln9UzuqYEvpzBNH8eJvQ/yyldQDkS64ylx/h7kpba1Ei0LgyAD7IZNsfiPo2qCBL2Hb1R2YKjU7bEavQjq0InyOYJKyGMoVmG6QCBqQEPDhgGmdGVDBSsTUK3YItbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791652053; c=relaxed/simple;
	bh=xD8bfS3io+knOqQfia0Tyat1IcRQHDGpTNIwfhL4cpg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bc6F42TZEaFp15N3vbP7HNOMG+IztChzPASZtFw7VQ0fRlKwdAvijjeeCgFKd8+RWrlOniyF708XXJm2/e41Vfg5ZyUh7F66LLmoqGc0mZL3bIfTj7itkFnIpPu/UasCzlNExuqSNa9W/z6JjU3y4l3cUtYoG+0Bv5GG0QBnMKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhAdQ/yc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kCKhPWJE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhAdQ/yc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kCKhPWJE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFPRD7795570
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=; b=dhAdQ/ycMl+oPia2
	fd8bj0rA4C6/kmqcKWlHITpsqMTg6fOHMqnTdnDYtPu6rsAu94ToumDsdmDOT+7b
	oLitpw8uy+KCF0IJ5vBm6qHAAYHhjgCy2ChbEqSGOTVh33xwGYNb7tV6NvbDhmSW
	fTEzmFRNXCcS5koS2rmh/T8z+Dy6GgeN2o28sNQnOhmlo104/S5EgdQoA3ja7kXt
	A9QeaRBUEaWee/adwXLFSYPEOviys0tUCJfBSFlUJjKT2aty0qZmenPbUjEKkEKl
	Lt16S+u/qCmBcPmFygY+GkjkyM5ar47MTtvZsN/OeicltXFoYzfwjOeu4/u5ofcK
	EJIO+g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmsuh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 17:07:30 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35158d674e1so3187338eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 10:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791652049; x=1792256849; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=;
        b=kCKhPWJE4u2Pm3/DA9LVwJGEUf9xQE6oPeBV1ticfHYW5MXulpSk2RpuPFWnZ0v6+N
         CsqsOScKnRIMxrrHHyi/gdf1dtEhkgkJDJc4saehFMx2998vT3Sd6YkUU7AroXKZk1dk
         ue6Ossl2RLXRP9ZhxBwRO+2AHlqCSPARXHf2fG7QaMmpYvnLSocVkdh8kXI9llmdPABP
         07Yoc89bNI7a10xB3bAOuwcaavihf2comFd+4ITF4mR7NpNiJ8idV2jEWCf1EzfC6en1
         cUbupVOw+f/9k1LubIrnFkah1hUm0ZAGxOFYt2kvw4NGqgBCUoErSwcyOwn9IuWdzNwO
         vAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791652049; x=1792256849;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t/1QcsDW5BJKU9YLkS92YpjE8gYPmGHsWSBALL/pLBg=;
        b=GDpccGm6vcjPSL2S8rEH2TFWp03UQihA4uYJNjhwi4E1/vJ9XBRL92Mj16Kuyd05tT
         02DbwwT+0/OET1MW3OaPSegm3ywsFQmJxrpRdYPSynQgeRfDOjCYk+Fl1zM4krrjWT89
         b2qYXntkY2iCnzx3kwB53P9n6Tq+X6DutVL4GtXO6MAJhSOqb7UgPpZjLNmdgZqYThMG
         MOnZjr4ZBwpgCjtlzJQBcTC5Y9r18BybgVCPJgnHhrarhUEt2J+BalY5ntHp6mWr1xSP
         YVlsSlFaPbdKcM6ocej+/VeAIzCkXYaYY2W1r9j9vIuxAEWTmB8DMTxaJ812wcHvNA9s
         wgnw==
X-Forwarded-Encrypted: i=1; AKwUvBwtGodTsOdk3sNlgPf4D3Q73LaxJZDRv3z0CctYCFA30UjoMTAFp5CK+QF3Ps3kuKVd5jHl4WWraGmaPXA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlUBQlIwLcjC/tR6M8+n2kufo6FpzAHi+LM6SrVAzh/fC2+Nw6
	TK9dd/6JDBXMXyMFDnfxROaHsK1LDUN+WogyZrxNy3eOlTmivmiDT1d4G2W7Tg0RBi5O0hZeLX1
	xmK7dbTA+hFVCHQ1k4rjaw/Htb/mJmQVgeT/vDmYaLi76BaRs/6olF7DTZuPFXP77V/kA7Xo+Da
	I=
X-Gm-Gg: AYBFou3JIWglfsPugpiokX3nzvvIeut80XeHSNth3QR2sJEM8Tl0DFv1FzTbi1B9Avv
	O/LpcTiyrn4+/C4dT84AIFz1xVcCXTqekFioH96+Cahv2lwovX1Q9tzYjq06vJpyLWkJTOPj7/J
	QCjc1Sw+EtUl8c9PUcfW9E7ERIuxtNBsrU5aYqIbnPjacHEM4PYxhNQbmb/8KF4+H3sk+73yaQD
	G82s1g6hKXNoDkJ8BX/m7SqwLXkkHtL6KAKIxEEUlQFukxSi/2TCoXN9JGT6Yn1WuJp6t/kIkJ2
	mWjM1CXxLqFlqjhQnujDdJMJNMOJVqOKmZGeUV/MqJy2/0agD5AyxTwNY8F1x4sk58WDz0n+hqH
	g/1C7i5WO08/rHvvYd0W4k30V8E+7tij1+bxNphrVdynKwWDzp/WVIn4fAw==
X-Received: by 2002:a05:7300:8420:b0:351:7f5c:dbe1 with SMTP id 5a478bee46e88-3537e02318amr7699843eec.28.1791652049071;
        Sat, 10 Oct 2026 10:07:29 -0700 (PDT)
X-Received: by 2002:a05:7300:8420:b0:351:7f5c:dbe1 with SMTP id 5a478bee46e88-3537e02318amr7699807eec.28.1791652048453;
        Sat, 10 Oct 2026 10:07:28 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3581f594a41sm9274614eec.23.2026.10.10.10.07.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 10:07:27 -0700 (PDT)
Message-ID: <d7f5ae97-05f0-487d-a31a-38c14e9c9e12@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 10:07:26 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] wifi: ath: avoid IDR mutation while iterating
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20261003092104.520135-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261003092104.520135-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2OCBTYWx0ZWRfX/KaJTGSksnyb
 CItMo/9qSWWuSM9734OQP6+cxyx4OfM97TQ3sqBoQ1sNCqgL+U0d+nZ+oS5ZUiOh9Dp0X26Sc4e
 dPyFGh/Zz1RyYIXjAYY8wq/g5mdFv+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2OCBTYWx0ZWRfXx2KYB9hBOg6D
 IUGFd6lXqqYkq03pm223DF1GFRQ9oUzouh5LkPEuEp/AAH18KXle/tlr/pDgHZ3oOHBPSzAfCH/
 nKSMD3lkJAPK3mYDeGAfhe40UlwJjZNtKyi2Bq0FJtYZvgvWRqrDp538FvMR4RPe0Xpplugj6EK
 CkjnX4T6ZDzg+aPteZBhZ5Q5D30skLNdsmf39J6ZpQVV8P2AIxvrUS8So3PvhVYe7SdW3/+p/h4
 M0Wo/jzpCg2k+uI9YRJXyc2oVP5Nzh500JSmZm2E7iK59EIDF1kvhbikSxPqNQQ9xFJ/eiBRSdm
 rNs59mHfI1HevZ3Qv4GNZuiwLg3ScOAWOjqymUgBg0Z6mIwsvUqOYK7usyNUUGxJ2pZ1wquSgiQ
 5Rwqa8b1PXLzQ7Qyswu5T0q946joo4Kj3IZTMJ8A/PszSEON4nZD6N/O1qM/GdOE14u5SzhBrao
 xP+PefNSALe+Pp6J8LA==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6aca70d2 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=2dOy96dDxX5ttOVY4VAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: uoekulbl0ie4qWQwQKRHc30C_7Gjkev-
X-Proofpoint-GUID: uoekulbl0ie4qWQwQKRHc30C_7Gjkev-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100068

On 10/3/2026 2:20 AM, Jiale Yao wrote:
> The ath10k, ath11k, and ath12k cleanup paths walk an IDR while removing
> the current entry. idr_for_each() retains radix-tree iterator state across
> the callback, so that removal can invalidate the walk.
> 
> Use idr_for_each_entry() in each cleanup path. It performs a fresh
> idr_get_next() lookup for every iteration, allowing the current entry to
> be removed safely before its skb is released. Keeping the existing locked
> removal helpers also ensures that a concurrent TX completion cannot find
> an IDR entry which points to an already freed skb.
> 
> Changes in v2:
> - Rework the ath11k and ath12k pending management TX cleanup patches to
>   remove each IDR entry before freeing its skb, as pointed out by
>   Rameshkumar and Jeff.
> - Use idr_for_each_entry() for the pending cleanup callers instead of
>   leaving freed skb pointers in the IDR until idr_destroy().
> 
> Jiale Yao (5):
>   wifi: ath10k: avoid IDR mutation during TX cleanup
>   wifi: ath11k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath11k: avoid IDR mutation during vif mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during pending mgmt TX cleanup
>   wifi: ath12k: avoid IDR mutation during vif mgmt TX cleanup
> 
>  drivers/net/wireless/ath/ath10k/htt_tx.c |  7 ++++-
>  drivers/net/wireless/ath/ath11k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath11k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath11k/mac.h    |  2 +-
>  drivers/net/wireless/ath/ath12k/core.c   |  3 +--
>  drivers/net/wireless/ath/ath12k/mac.c    | 33 ++++++++++++------------
>  drivers/net/wireless/ath/ath12k/mac.h    |  2 +-
>  7 files changed, 44 insertions(+), 39 deletions(-)
> 

(dropped obsolete codeaurora and quicinc addresses)
Version with the ath10k change updated is in my 'pending' branch:
https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=3d806fd957b02ca1fa7991ffaf6c02ddd3dcbfe4
