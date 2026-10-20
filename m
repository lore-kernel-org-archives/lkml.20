Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504429;
	b=yA7xbzIc5O+9ZwYxuE2mhn3p5jZdmvg5qi0uMQfHgZuCSDWuK3ts95dpCZsejqsBx+Za
	 q72Qpxd1lNn1yS/kiXzSX6/25Jpa3KL50mi+z9kaX+Od73P/zarkqFnm/xxBSTkzAdgvB
	 r2rTRkg3gxOg3iTf8IPbQ0lFo47tONz1rn6kwG7l1ogdFjQTgJm8fZvbRwClyICZpSvzk
	 fWA5T2Hc35jW2WlpCCQDYMaNp+w9eh94NEjgHHmzaOD4yeKvq2NIUjgyl5UOcIk0nA4UM
	 OvorSmBAeVpzFf/QpvZdVna67FFi3exhLfRjqRoHIpQ7VZ9D3uFhe2YIDt2H+XgdRrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504429;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=;
	b=PibiyDkuiYoCpdJrJdHV7DwUlrYVYd08OgMmBksepoRzm+WHuotIsfxxuWmQ+fjS4QRo
	 l92bnT+5KEAE9NJHqD8tQed/r1hD0s/WLJbhVPLXxHAX7+ZwP3LaoRPViun3y0AZ/ZD9O
	 E957IZnBaEwa/r5e6hQ8WlhEs73f+vmUIS7VuZgmG69MIO2n1jaY/8EWBHq7VhC1MCU1G
	 hVV6X2//nxQU9wPRLl2rh8j3JxKIaXepcG1K9rLr2eHiS0NNlEZP5WatdCZTlqPLGly7g
	 hwB9XGXHp7ttAA5f8zksinM9pBj8DysprWJFXiM4X5yM7vKvQ3qwbZe/9JDt+vUEg+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxIRm7mb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gZ2As567;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F9F606AB15
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F9F606AB15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PxIRm7mb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gZ2As567
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KDAJjF703040
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=; b=PxIRm7mbp3RunCyZ
	yBQ1a8W6CcivEoLinHJu4jxi4YCf4nX1u8FfjVDxCla5njVtR2UGPJEWFjyP0G7s
	wVdktf/kpjXXR7O/FvMozK+QXcBAnFRvv5H3urG+pn81R6zp5Kl/qEt2cSOz7Tac
	5qHZ2GlLxsUFdwZMSO1oAiU98qlx+adlRUHN1qeiadKVRKb7TzcsrkVwc2UBt2ux
	Q8jncPMnfIU+RRnBXJ+igfWHeoR84h1h5JWIaQuNUzL+uBBgri9qXhrJAVT00Ixa
	qCXTji0qUnjizfBlCCrqEqQXSs3FpWVgQRJOAjqav4mNKhdwi1uwe7gOPIiqFFAk
	aA0Uhg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5stq2m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:53:48 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3662e7a9299so3164116eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 06:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792504427; x=1793109227; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=;
        b=gZ2As567YHAE6eGi5ONm41HEj03PKuJFGzRgSvywvdyIOJsEPoVJBaUkJjNnrj4Xb4
         dF/YgqxEzl1eUuBwrW+rG/si3LtNk+i4JBR7AiyP4Yxmyka32D3TJx0+SwOZ30MwAUNS
         IbXOLdXggdj7+VgEvsDrzOrb35KmCATa2IdHyghcWd8mwlTPOIKcpz+mtbcInPcrUhXh
         SxxfIx0wWbr1c28ElVwV9WlISHVHGuK3ECsTZTUjyHd2QRfjgJ6QFcL6AZm0+xda5056
         nGmlblu6Aj9PcjlC1+ZLwqdz3WkdN1vgCjNskTZFEe+CZ8a3ul7LCAi8v1iufCHmTkG/
         KLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504427; x=1793109227;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98h+uohlvwBVcGjNEa2NGd5iaB9mYxaSn10D70Q384o=;
        b=ZEiT+TxTp2RyNTBvHJgf21vUL/t+notp8bBBLIqLXG2ddUna8F8R7tfsHSOtrVEMUQ
         R2vY5n97FskZYTU0v60x3Ak/E98QJW5zw+UxqIjhA9xyFkMaAMJZncqcfZHQyAcpqZlv
         38c6ZBPdviXFGoQZWYKNkVNC8b2Smg6OtwfWVvLUlEUsg2vvWDMTENdrKXAKt/kUtlI+
         G8z1ax8LhlEh3oaQ5cRY+VcBNoge/slEH6OGPxItQMZpxYX8QtOkw4TB3wkQXRTcHx03
         1Z/GE0SUyBL1loifF8ek1T+uYHf7H7dRU+6/kwcvgE81fiC7kaLX8vqOgWU1sdt4q7C9
         Rnog==
X-Forwarded-Encrypted: i=1; AKwUvBxq3qPy6wVcMHVKNyjE2YRuFO71VzrAq/evqY/oRGyFQj5Ou6cmKWrMgaLXTZEb/23clboQoLW38w58GYU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIT3HS0TfEWph+bKOi6ZdXwvlR99Oe+B6J9kwNEY9t+8GcpbbB5
	4aAZjyyBslIOZYlZqz4m0a4aPScGeTYkgno0FXSUy+uuKW9kLtkyz46KmcKKqLbZXsR/WZo68Dd
	wac3Y+TTObXR4cPWvgQxgvVF7phEGeOTJOKeqmjAXq9nmYs+9YJl0Lr06yrFLqcDXQj8=
X-Gm-Gg: AYBFou2OvWgrVCCW1hHz9sCAWa2YyJFOW/ZgpHiryKoZ7lCDHwQe+iOjV8xPiUnXEh5
	oxUnK+dITPXfeDmVzRCbIjiUlKXbT7Cyx3X5Gyv5EAzB4BjRjlfFjjuOSiIn5B1d65b17RA7MKE
	IoFtIrhmMggFEmGs6o7V0gzLs/n88HrA9+fCU7ASA14DAF1LxoyNpnNi4Pjf2S3tRw586bEsAXV
	eqEbDlVbIOxVs5h42z9aLxXqQEgEX+Mj+NPygF7MV7OOvk8nR6MPaTH+dW++Df6wp1A8pvyulyb
	nvOgi4N0VvhMIBqsQ97jP4sTAyMyRBlteDTeiIj894E5Wy1DEhUSJ3sb6+NyvitNkjms8cyxoaS
	GzXOlD6jdNZnBEZLBOF1jrQfuoDyMJAYRMZ20oPlcD3+qxoniu288mXcYiQ==
X-Received: by 2002:a05:701b:2319:b0:151:2e62:fe8d with SMTP id a92af1059eb24-1851238b627mr14278892c88.9.1792504427057;
        Tue, 20 Oct 2026 06:53:47 -0700 (PDT)
X-Received: by 2002:a05:701b:2319:b0:151:2e62:fe8d with SMTP id a92af1059eb24-1851238b627mr14278842c88.9.1792504426205;
        Tue, 20 Oct 2026 06:53:46 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm49618023c88.13.2026.10.20.06.53.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 06:53:45 -0700 (PDT)
Message-ID: <520e2454-a0bb-45f7-b604-62492eb15a1d@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 06:53:44 -0700
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
Subject: Re: [PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
To: jiale yao <19888972804@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        John Crispin <john@phrozen.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
Cc: Jiale Yao <jiale.yao@example.com>
References: <20261019100029.1908660-1-yaojiale02@163.com>
 <b573b6f.2196.1a1571bc45e.Coremail.19888972804@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <b573b6f.2196.1a1571bc45e.Coremail.19888972804@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfX4mshamkV0P//
 OCYDtYt2imo5UQmsq3iRHjE1MT03hFapfjbwuyJnZa2lO+0qQPf/BmTQBunx0tC+l5gQNJFJOHr
 be4yi6svZgohkhOJ85gz/eE39gGA2sNjCJUNarU5oI9g4juama28bMbc7tNbWzMjoyQHxgzGIUL
 ZU90RxM1eop4vZnh8XCuyAfljJXz3UsKGCuPNpN+b2Ectjp8aILc9ruFA+D22eNvp8YvocmT7jk
 mAOZtYEvieg6bvQ4EG6v5+Ns3bAJbVG1Ea/feq+c/LxbTlORSyNOCCWqPw/+DiGrwIVSYzxim/e
 09yX0kkTvWEWThaSkePeJPDWPC7GDOfSIkIeDukGKszUJcNco7qIrDxv7u0hlHOsYpQMyrGQEx6
 dKHefMZcGy5f2KiQ/ixMjAiYq/AQ7ammKPmirRFvUsqEzHb8PL2YX79znLZFnBF2vD6zpZiJU8S
 ztwt/BtLTDinuBC5IUg==
X-Authority-Analysis: v=2.4 cv=fIusTpae c=1 sm=1 tr=0 ts=6ad7726c cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=Byx-y9mGAAAA:8 a=A1X0JdhQAAAA:8 a=FdzspUwgXfhqtPi2OHsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: EB81cJQVNWyi5D1WjehORM3ub0_3x3vI
X-Proofpoint-ORIG-GUID: EB81cJQVNWyi5D1WjehORM3ub0_3x3vI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NSBTYWx0ZWRfXyCrSFbFSHNjK
 f6ltMtcDGMqPIUWeC/O3LuQd/fsjZnnHXlpy3Jg8YxOSEWX9bvQJuRsPr0uadY6lsD93P4kC2xa
 FHC8PFbv08HctqaFEJnnw1TuBiND9f0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200055

On 10/19/2026 7:19 PM, jiale yao wrote:
> This patch series is superseded — please ignore it due to the incorrect sender name.
> New one is https://lore.kernel.org/lkml/20261019100506.1915181-1-yaojiale02@163.com

Please do not top post and don't send HTML e-mail since it is rejected by the
mailing lists. Please make sure you understand Linux Kernel e-mail etiquette.

You are close to going on my ignore list...

/jeff
> At 2026-10-19 18:00:25, "Jiale Yao" <yaojiale02@163.com> wrote:
>> From: Jiale Yao <jiale.yao@example.com>
>>
>> ath11k and ath12k consume two firmware-provided arrays without fully
>> validating their lengths. The service-ready-ext parser accepts fewer
>> extended regulatory capability entries than the separately reported PHY
>> count, while the ready-event parser trusts the reported extra MAC address
>> count without checking the fixed-structure array length.
>>
>> Malformed firmware data can therefore make both drivers read beyond the
>> corresponding TLV arrays. Add matching validation to each driver before
>> the arrays are indexed.
>>
>> The four patches are independent and each addresses one parsing path in
>> one driver.
>>
>> Jiale Yao (4):
>>  wifi: ath11k: validate extended regulatory capability count
>>  wifi: ath12k: validate extended regulatory capability count
>>  wifi: ath11k: validate ready event MAC address array length
>>  wifi: ath12k: validate ready event MAC address array length
>>
>> drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
>> drivers/net/wireless/ath/ath12k/wmi.c | 10 ++++++++++
>> 2 files changed, 20 insertions(+)
>>
>> -- 
>> 2.34.1

