Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75422347C6
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 00:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791331796; cv=none; b=SZ+1no51EGb82/wDo7NkwnyAgUJAX/sWYsOLEkDb9LYNjzzHB6XojrQrP+U06W6HWFTC+pFs9J/9LF7Tp/sNn2jkl1PXwCA/jS5ZdfnD/TjVo9uZ/YUzukAM+0k0TQjw5pGRoT36LL3Z2vlK9UUIrHuXkTTJ3vVTlINcCY9X8TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791331796; c=relaxed/simple;
	bh=ruCjfSGct3MizqSDE0TmtgUXUHy5mBaRnQhxTHqCOrE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIz9HbnS+kBg7Qby2/ZGc3/TXg8EgMyyMv36z4UEsej21dYUXUsDJY1Z86b6Mj1n4Ygpl+QidmYOl9E0QoPkRB9vB/Cur57t0Z/2CLBfHTIuoIfHpgUBpBq3TTTDbUuSIq4y0aVYeaHeU2QFjkiIXiPdKuvHscW4jX8CSCx7VaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DODPSc5e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fNsm5Btu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DODPSc5e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fNsm5Btu"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeMNB1899627
	for <linux-kernel@vger.kernel.org>; Wed, 7 Oct 2026 00:09:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=; b=DODPSc5en+vzuHMX
	iBSMHbRqul1ViSDbLqtkcEm95A1obvei5t67JLIFPs6+sjiclHmd5FxRgvnLJS/i
	wxP2/q3a1cOkYwWRHaSgkhGkbog/jrszRKceroPxgurwIdIosJVGT9oZvpyewfC/
	A9u6zIXH45mg3s4hRMf5jImfGjSH6ugMcEQ7byo+h2ZVr3P/32Wouidvt2Mp0sX9
	kCJzoJQ/u5u4bM2h+kLD3Sx4hoZHN5Jf2Ns+qnq/SaytMgaINVXedWlVeSLS0wld
	M4NIxKvoR6C8FLOYX63x5gyugRTczckyXb68rasnQ5XihftwqMvBP+3660dUpz97
	8fSwyw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h541uhvuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 00:09:54 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f75c1219so46177355ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 17:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791331793; x=1791936593; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=;
        b=fNsm5BtuC+2Ej85zdh17/EAWbW9OJUBuGGhNnDPlggDfcYoAbCy4LHdwfQQpGrqu9q
         ELaJ3e+Quym84vR1AgLyT4J4zjfVnTWj5pR2SEbQHhaXr/ArVIVuLTXWpJJBqWp2gVAn
         GqneuXqFeJnUkxKsdojV17lhqLDMqvBvlKCKbpRaG//N1w2rPqh9R1xU8IwUiz1DzEQd
         iJVYZA9tfHC7m5iQ1RkNM++Qayoz5mSpPBsW8+b92kD9mfmfzHthdHIrYW0A4cD7J1l/
         todBQv9Lz83Foj6ppsJ9tQOuPKDyA5QWaxdsn5yLx+g9OSo6LrQlcQJAK5Si6jlaMLXS
         jKvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791331793; x=1791936593;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEBVU7YoQnA6oJNQRreS9t217ifY2fL30vwizF+wfYU=;
        b=NtHQL7RpbWx2FbWw+iqCAkd9CS4VkDgbfXl960QDrjVsQSlZEDaenjY9wm62fAJ1+M
         /HN1fUDUoWBABp8ENPyhhc3sEbLz10bzoybdNFtauL1MXk1avtKi8wkPGHfjfQd/NpAd
         QldypP0rMx3KjI9UKeAt4Jo4/AzQj9Gqqt6PJXZlEA5DC8UXKet+uXnVDJ12DqDnyAZA
         3gCdF19AE/E8bBWn68V5YBCE8oWsbFt3+OMf+V0bDE3Y2hmXFl3eRlfrcfLUHxyVrGsh
         EiGZ2+2jv0SMpuqo22Ym+O5orQmFPpR8nC5eN2huuL8Bn0HkCOKTZ74gGPSNuHMxNos4
         i8PQ==
X-Forwarded-Encrypted: i=1; AKwUvBzg50kaeeoG35XVGe6th3wOZriNPIxt9UEki6803yrF2lD4iTfS4vfaREXEzaB+ONqP61ljpbqDpDLTL44=@vger.kernel.org
X-Gm-Message-State: AFq9FYJBzwXlc6FIpa5UoR8Ud183/KV8539mjnJp8yEjyBPO2bqCnDIr
	N5OJTWO5TDDcZBv6q3QjzZ9v1lEMNHbTATKID8apJ1JKvn1E5Kbi5Klx38T89sB2iQXYK54QiXO
	ey5o8aV6Vpw2sJIWC/7LdbeuW1IRSJ6IJe4Mxm0nun//mX2tnagaYoVHHoUXE3PpmRJXcqY5Mc5
	k=
X-Gm-Gg: AYBFou0NnZUFXR1ToHyy7BqhBqUQBUbW1O0RkOpkf6sGGww5+glQi2Dm9LMkiKXvGYK
	NGs/aXXixwl6dIKr6MfbWXRs8eb1AO/io7qKTolDdL0GiFR6hDG0me9sZUwJA5z0yYmATU+zDYY
	+yZvvpwUl70RS37o1xxP3/xI5qAywqPkCnaKJJATThuswp8d2HGb0F2LH9P0E29w7TfIwG8ZmTz
	329WiBIs0pAWk4AOeNtl8AEfVmwG7wYRt7KCZ4CfSXYbR4Axq+46qX4WRKGIGbs2xnTZv1tIv53
	Sfx7f2YmA1RU7jTRM18gFDRydA1YCQudY2BiP8SG5bC+C4nzRwtYSEq/+UTTIclAA5jXgkFsFeX
	NZzGJB0/Gv5tW8077zhQpHgpalhPKxIpS/OwOl1WUIrdrzBJjdrYTPDVX5x5O+hQ=
X-Received: by 2002:a17:902:e550:b0:2dd:c100:3134 with SMTP id d9443c01a7336-2e6003b6d74mr7144335ad.48.1791331793326;
        Tue, 06 Oct 2026 17:09:53 -0700 (PDT)
X-Received: by 2002:a05:7022:43a5:b0:148:306c:971 with SMTP id a92af1059eb24-16206f0616bmr619459c88.22.1791331425354;
        Tue, 06 Oct 2026 17:03:45 -0700 (PDT)
Received: from [10.71.184.34] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1615f1ac8c5sm3343825c88.2.2026.10.06.17.03.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 17:03:44 -0700 (PDT)
Message-ID: <6d16d5fe-3165-4026-a3e1-27be256f5378@oss.qualcomm.com>
Date: Tue, 6 Oct 2026 17:03:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] zram: Add QPaCE zcomp backend
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <georgi.djakov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org, axboe@kernel.dk,
        rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
 <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
 <20261001-dramatic-hasty-pug-68ebfd@quoll>
Content-Language: en-US
From: Oreoluwa Babatunde <oreoluwa.babatunde@oss.qualcomm.com>
In-Reply-To: <20261001-dramatic-hasty-pug-68ebfd@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KaqceD2gLKIbaoEKhaoj_JpH1T7k0Bhx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAwMCBTYWx0ZWRfX5St5s7w2MTRL
 R4pRLf25e4oHiBgZB+E/DzoCQjLXoaY1BPUcclZPYkXRHKXBWJRBABY6vwd8DJiftVvLh41BL3I
 a+Nq+bts1V4IZOnGPX29u62niZgk6tY=
X-Authority-Analysis: v=2.4 cv=XZYcX455 c=1 sm=1 tr=0 ts=6ac58dd2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DSiY3orsq6dgR2GKpvQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAwMCBTYWx0ZWRfX5/KPiVVTWdpP
 aYsc7PI0fb+nQHjyHeLJnBa42skosmqbQkkO/95kOHfXeHhRLqbnVsbohWnZWl8SXmnyu2Vj8vW
 gxscpvms/lQP92/QXUMdEiSHXaEAnK3dkStzU6IjXCgSfBD8PRBmFchnvZnqaqIbFPt3dowdBJK
 YZ0jKWy8R7udDuC3H7LYCH3KNolWPA1KPe8OKXOapGrStGVFkoQD/99vWdz/8oHm1zb/a1Ml0zg
 DqILNGXlTskJ8B/fCBO2FFbvs3jCptc8Z0V7O4rPyzD1TgKOwwjl1VsYernFvsKemKNmFy7O/Ad
 IsCeYAIdri0i2XvdCElt13ELVktRvqSApRPeKhl34cjUg52dtGyG0p3W+jdFmQ2N35xNVjrpVxu
 Wd+kJnm0WVd1k0Xf/cFeNj3qCWMrCrqlEz9WGignDuX2EZflS2GU/Yg1pVkxAMJlVbovf2mXjxc
 H1nKsGs/DRS7p30jERA==
X-Proofpoint-ORIG-GUID: KaqceD2gLKIbaoEKhaoj_JpH1T7k0Bhx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070000

On 10/1/2026 1:51 AM, Krzysztof Kozlowski wrote:
> On Wed, Sep 30, 2026 at 07:52:13AM -0700, Georgi Djakov wrote:
>> Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
>> zram can expose qpace-lz4 as a selectable compression algorithm when the
>> QPaCE driver is available.
>>
>> Compress and decompress operations are handled via the QPaCE urgent
>> synchronous path: each request DMA-maps the source and destination
>> buffers, issues a blocking hardware command, and returns the result size.
>>
>> Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
>> ---
>>   drivers/block/zram/Kconfig         |  11 +++
>>   drivers/block/zram/Makefile        |   1 +
>>   drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
> 
> So entire qpace should go here, no? Why did you create this entire layer
> of indirection, singleton management under drivers/soc?
> 

Since the qpace driver is not specific to zram and may be utilized by 
other kernel components, it should remain independent of drivers/zram.
Consolidating everything under drivers/zram would couple the 
implementation to a single use case and reduce its reusability.

The backend_qpace implementation was intended to setup zram as a user of 
qpace and follow the structure of the zcomp frameowork. As per your 
comment in the other patches, we will check if this can be done through 
the crypto framework.

>>   drivers/block/zram/backend_qpace.h |  13 +++
>>   drivers/block/zram/zcomp.c         |  11 ++-
>>   5 files changed, 168 insertions(+), 2 deletions(-)
>>   create mode 100644 drivers/block/zram/backend_qpace.c
>>   create mode 100644 drivers/block/zram/backend_qpace.h

Thanks,
Oreoluwa
