Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB83298CA5
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 10:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540692; cv=none; b=RTsIAqPL6qtPKXacCvBvEvioDjyPhjBDBYQpIJLfcPi/2WG7c3ffiJDogUNEcukfOlZ7a83DE+4DDqAq02q18XeSJsp9+J528DvCMEskbf1CMvDh/f49rB+14fXmJEiWo2cNBA2cClzhC6CpBP428rfZKq5oHeDR2zr1Q6IS2f0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540692; c=relaxed/simple;
	bh=PJiCTK+xZkgf4C9ajys4XEZDwBELG3C+cWgGLnRSAMc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQ30SWMCnhwVIeJRAF0cUfJAlE1ZwZpy9IevQ+Lp7HIE9Js4zBZ0G66+qik3qHF9SVxbOeiZZGOfB4FcvbYq7TtQOGPZ+28yHIBE3o71bNRFCVKKbOLZhu2Gcm4slsu2afK//1E6xVVGlLp+rmvaSbFPxEIW/PrSLyAOGr46J0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B0Es9AhR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fXVZ7D0H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B0Es9AhR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fXVZ7D0H"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KFZ0642362
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 10:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=; b=B0Es9AhRU0OYIAlk
	2jrbzCTxp6K0FjJNYQif3bdLi3/+BMe/Plku3+XP1/VCNoEFxdZMLIUDK5BqBu1h
	N8OJd9XcXIiD5s3jifoP5H7gtBCHDfrE3waSj9uJ75COUzY+wJOy6w0d+Ji4e5bK
	efGGqeu01JuV4zwRNbFGRNXnXkKhcPtp4dZ3UQ9pQuXx8ur/BMRSLJJvQEOqYJ/v
	8zRTvbvdsu7lCX6N1+8rVq8glc7zeCWqMUnZQ39LqYBOsXMJ7LHvrSTmYQZ4PGUJ
	qf/zeCWMgD7LkRrSOO1pkPdghqxpNi4FkHOGwflHQEw8n3ed71QowJs0xypoqVT8
	qMcx2w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxru2pq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:11:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a7fa5e0442so7766857a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791540690; x=1792145490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=;
        b=fXVZ7D0HQ9WE61nGBcOPLo4AW1aCA7AdQi91XCa19zD8NbHJwD/yUJ8uZgYGhBUG9n
         i6Y31mGUF9D+Yt7eA4u4ic4dMgdj0eHjQ1Uu5dGzAvQ1+50H23ChYrJDjCqt2j0X/Ceb
         g5S82OyssgPjGBwOjfnM6TrqUaVuArImoI6tHrFHlk7f57ipNnVgcZJJntkiCUbEPAss
         UhiXcMrSHsLQVFi3EyIQ6TPMV0DaUlyW0f1q5ZpfeZ/xJo+wBxZTn5qlrSYWJeLVe6ZG
         B3+gY1PAz5jozftnul6LfWMjgldD3/V1OfkpblvMte2NlsHKg1JX2kmr5KiZC5xR3p2i
         Ycnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540690; x=1792145490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9hWw6ijG79i9KKO/GsUNkSlod/iFx3QaGdrECeuKXoE=;
        b=zW8RxLjq6wcQ/dQBgF4kij/k4WuZdAKVPeK6oxft7f50hTGE9/SUFMrjkB5Z7wk0xy
         N7YVP/S/14vYPFsgCCeMsUoJPtZ8AaUY287+69IYRcFqxzKkV+7i3ORQ4/Kqbzcxba7M
         pY/if5HvDrrbvNU6G0MdnsmO8SwTg9wJDqnlMCt4Y1DqypXH4At8dwZmOIPrG7ldqA5Y
         8U6yA3e/5q3wagT5V+z4lIq4Unf63+AaymvkRZ8Iu6uB+9VtrVsw7s6c6JhqLRdCwSRZ
         SknznNhA8DAyRtucAh0Vs0ICiajGsNNZS+OWa4D1qsH+AeeZ52WrgLZrZews/99mFqTP
         N4iw==
X-Forwarded-Encrypted: i=1; AKwUvBy+QKfx84lhiR0EHtOFPcnlhJIg4GxnkBvdhC5cgCOvLgTXw1s1Hiw0j8nDVzK2WpXi7hlFIO3eNxJshyQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKwY6aegb8BUNhOMlfXNknZYvNi57ko7FZI1S8PMbg/Mu9JvxBF
	Bdlm1tamCTM97M5C2SWUOAOiEFlaX8YUJVnIae0r0mNTaBUahOof8Y8VSJJTQ9sTVpBWVPb/7iR
	Xf2PYD+WOeZNhKxEDXNn6NOlLulOqrh8I9t3VDrojAqxVuamxHCElNjYXYR57djWWOgk=
X-Gm-Gg: AYBFou3ArA+FOY57ALc8sI7Y5DO9shVnKeHPJ+RX6eCsD1wdarqGeba3dQnMd5ICMTc
	l1zVXNRsR55PRCJwqLZx7sSWAl9FEFupCjvVNrZg1yFLWtwD5hcJcoBqLL2T3UZdcBbXQbpobLq
	thn0Ewv28wVIt5mxpI7DY3taII+vCtrKs7jjIA7J32Jhpi/nZvnFENALwWEipZFT6EhMXLB3Mk/
	lfLl1znhCH23YWRmkeqiYX7yZhA+NrK/Yxjy5Hf3k0gb9NlTyDGKGsyp5Xi6cHDVkYkpleQFSHJ
	1UL6xFoNywVwvWEQu9l5/TWjuVPvDi0NQ7x16lvWXvUdDc4koCXm+aPZtYo/BUl066m1nH1xFPa
	08acaHzvHFIMo1JuBuOUNgmE0iSGmz1X1
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr1583034a91.38.1791540690319;
        Fri, 09 Oct 2026 03:11:30 -0700 (PDT)
X-Received: by 2002:a17:90b:5887:b0:3a4:a383:f9cf with SMTP id 98e67ed59e1d1-3ab3a9a78f8mr1583010a91.38.1791540689904;
        Fri, 09 Oct 2026 03:11:29 -0700 (PDT)
Received: from [10.218.39.50] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38fc9e52sm2744168a91.13.2026.10.09.03.11.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 03:11:29 -0700 (PDT)
Message-ID: <40fc4ba7-c016-4b91-afdd-5443869a4b4b@oss.qualcomm.com>
Date: Fri, 9 Oct 2026 15:41:23 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] iommu/io-pgtable-arm: Add support for contiguous hint
 bit
To: Jason Gunthorpe <jgg@ziepe.ca>, Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
References: <20260921-iommu_contig_hint-v5-1-e7fbd1c3774d@oss.qualcomm.com>
 <CAE2F3rAMAnV9+WNLZtGQX6cHPsZ6wbfRJ1Z3d5mF1+8WHL-uMA@mail.gmail.com>
 <20260924225534.GD16465@ziepe.ca>
Content-Language: en-US
From: Vijayanand Jitta <vijayanand.jitta@oss.qualcomm.com>
In-Reply-To: <20260924225534.GD16465@ziepe.ca>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8bdd3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=_TL2m7dhMTXhWvRYaIYA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 4As3dTalpeVljBcO2Q4v1E0Aw1LxBRo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX4+cJv/EOMdvB
 H7WYKGgh2DsRAerAg5IaTM1NWiofRTERYr7HeUMFTEcXNz0jKuRpxFd7hu6Qy8qoOEA1S/pmFyD
 XIrsYsxmMim+cTScIQMCmhnx7Get3Rrfb2p8hK+OIZRfIrzY8gCX5B1HmRD1sRBbOwfJKXpC0dK
 de9pvxKruJdQXFUTaPZtBg+7V6wbYt6qnOqI1nXhDHjgGRc/9e7bQy1d54+jeh66pyc/mJW2hqT
 h7mjWKkcnBY2HjTn0Ov2amxRWS/QpB/55fW3OXEIuWrNr3DQ/nK8sgyusDdTHIkQI2j3RdOAZJv
 Eqt7O3DoYTcC8hU8z8fa2yTR2wQOYma4lK+VB7kLJpw2TTuNkrk2U7OqyPBj425oYjBw9CGrJrg
 84bqTft8nroouDsw1BdfgT9k1KbALPP6qaYRq4TV5y9KQnOkikXr1njI+QQCKpRwRMzV0Oz87B9
 IPAixFz5YiEQzclD8xg==
X-Proofpoint-ORIG-GUID: 4As3dTalpeVljBcO2Q4v1E0Aw1LxBRo1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MCBTYWx0ZWRfX+G6/jiK5jhgA
 4NfvNViKYk1NX7cZLEm4ESoav1jP49Szlrq56RUq2RosqB5WkKcCR/vFOFFaIUHg22Xvs2JOwgy
 ncjyZNQ+DsqTHZ2+XIueDgU2oqAz6ug=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090040



On 9/25/2026 4:25 AM, Jason Gunthorpe wrote:
> On Thu, Sep 24, 2026 at 01:36:12PM -0700, Daniel Mentz wrote:
> 
>> Interaction with Hardware Dirty Tracking (IO_PGTABLE_QUIRK_ARM_HD)
>>
>> When Hardware Dirty Tracking (ARM_LPAE_PTE_DBM) is enabled on Stage-1 tables:
>>  * In visit_dirty() / arm_lpae_read_and_clear_dirty(), dirty bits are
>> queried and cleared on a page-by-page granularity
>> (iopte_set_writeable_clean(ptep)).
>>  * If a single 4KB page within a 64KB CONT group is marked clean while
>> neighboring pages remain marked dirty/writeable, the descriptors in
>> that group will differ in access permissions (AP[2]).
>>  * According to Arm ARM D8.3.1, all descriptors in a contiguous block
>> must share identical permissions and attributes. If dirty tracking is
>> active on a domain, consider whether IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT
>> should be set or whether CONT sizes should be suppressed when
>> IO_PGTABLE_QUIRK_ARM_HD is active.
> 
> This is right, handling dirty and CONT together is a PITA. You should
> probably make them exclusive for this simplified implementation.
> 
> SMMUv3 is the only user of dirty and it will switch to iommupt which
> does all this right.
> 
> Jason

Sure, I'll set IO_PGTABLE_QUIRK_ARM_NO_CONT_HINT when IO_PGTABLE_QUIRK_ARM_HD is supported.
