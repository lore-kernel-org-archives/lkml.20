Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776542;
	b=x73veVWrxGn/+lRXW7MW0zNPpzZsdw/fzv5O2iF8LwBJ2oun9deygQNZCXE+jaBzEeSI
	 /CThR1fMeRdhn3mlog1kqotgJVWf3RfVatyvzwkxNXAXaJF+EkuK4CRK/SGpgq8fR1xgt
	 n7LBYMoYtLMH+uQ0PG6DIudCnv1t3r2881cjGb/TXBUMt4gKzmwv5sA/b8g8FMyRfon3Y
	 a0HQo/FxEwQ0LhMCavZBEKNsMR1ko389n8F6hIMAPLox9KMOXJNNzht6nkEhAi2PsuBUw
	 r4a3V6tNZDS3ZIxIkKPFcLu9soHjQB9aoDJffXlkAFC25eKD5td4efVgYRnSw1z09NQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=/sBFE4JMy7Qqdv4pjAUdbUZZk0aaF6z/Jc6BDucIaRg=;
	b=OzFscNDDxeWYYFrb8H3B4Ydqfz7lYUUIPbS3CFVWzP9D/iAqSsYTrpHg8q/eGV+tLRVP
	 F9SCY5CKyQbq4pd2s/5wZWFvFTOU+mRJN+h6NSkFAK2VEWnd/XZo6KE3yofLYdh5fqEUz
	 I71da2JGEGBHFtni2xgk2BLV8NFyYo0JQluhIJmKYBm/6uk/E4z8OuXqGruSgUnLc09Ke
	 K7/vy6C2GBvy6HykEfl4SzNycxJv4rgndjSCpFZxPe0sFi5sHPPWTYEPZM1PcMdRuCqmq
	 bSRWLFpxrsLe7nBfHIcegBmijPWfd4IbgTMbWs1UQV+BneGDkRQ01IUx/8NXS0DfuJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P5Ab3/6E";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6gEsGV1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4835C606A330
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4835C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P5Ab3/6E;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D6gEsGV1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A470bsG809413
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 07:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/sBFE4JMy7Qqdv4pjAUdbUZZk0aaF6z/Jc6BDucIaRg=; b=P5Ab3/6E+YOrq3NE
	6rphAYp16tIu7thpCAjY/9Bop/31Gi8U6aZuGyjOQSMtyXhi+6ljsOei263SKfms
	d8MusggKN3GLJl+FvqIeclY6+qQ8iswJJe2GefVk6w1mirYnb/7iCwVFAGhCQq1t
	qh+o5LL6ZsRELRuIHS6wS9dKu7JXjfq/Z32tbjKneCgzQOg5L5NP35dlx5PKvpvD
	ZSqo3OhGmaE1sWT+KXLKOrEiSewaZIdr4VWd53i6gBi42ILfv3VhxX0MPMz08qTe
	RuDeM20CvYKzGnGFq4PTzKEc5CaQrY7aoCoTlp6KoW/g1OSQjn2YjrPUIsLghuAZ
	zDGK/w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqkgpb58g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:15:41 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a08903566dso1039330b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793776539; x=1794381339; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sBFE4JMy7Qqdv4pjAUdbUZZk0aaF6z/Jc6BDucIaRg=;
        b=D6gEsGV1YPneXaWd8UTsucQ59sYgDL+BMY6FOQrDMwCo+o2nRjAHX56kklyJB7bRsr
         uV400d2Q+ZNA+l+UKUkJgiWF0V82NXyVacdN9wZARPK5HAYazA50/I77NSBpe2kbdqHX
         ZM8ebyUg+xHaFNEQgTYIdxgTRMP2obQYxdMU1PKUNiZPonX+vELiw+GiBXgFu8hElhlr
         N+Q2RT3tdtB63qoQQuhI2A8oeezlU0IqH3yuZoZYyXXk3wYWAzzKm+mI5mP9MxK3i36C
         zy032oHey0OJ63smD3oBCdOTy9JhQwcr8K7fg1dUrOJ8NY5IwkmaA73xiouyV2vYSepO
         y50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793776539; x=1794381339;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sBFE4JMy7Qqdv4pjAUdbUZZk0aaF6z/Jc6BDucIaRg=;
        b=tOWdr4U31n1kj3IZu0jqjh9qTR15bdzNSn5hR/tUZfBXGdpa9jy5O0ruiLacpWJgRp
         y0vOpo7YvEhckuLS778F88mxpdMVyJaFzkjTgK7q+r0I5n/Tu8Va1kN8ZKOnr9md3Zde
         ecCw9L6TVYxOrpGJoyp9lOKjODpqrK4RVlJXNUqz59H9hEB7KhiBu0OgyzARrrE2X0EM
         P47S0RDV4L/n9DVZPp2J5v/Sj52pKARs2fXpFaD6WMztd2IAopVEAULGBPNB6RXIkexT
         tVHROATNI2b3ItvBwmFupwwJLqZfBL1afF6+7Gbutn8ivHg99y3aRbzwg8jq+c96RjD4
         6IzA==
X-Forwarded-Encrypted: i=1; AKwUvBw1cQU1APv6sorDAcnoQNXHxpDeWRE7o8OFjsQQcwuztlIvB2ccCgvhTkyLuOrkJDVix36U2Gqll9V+JV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Dt3cHOV5VEB214iKgSRkTJ3aB9Ee5OGlDUGpFbNC5J6tRakd2
	5iNFeBfG+H3hke+nANLMskfVulMMjFvwNZzvi/07WYWDTF7n0Fej5v1fXzBUKKN7t9oUhEpC8CN
	od0RGYUBin0YUNOjovcwNFzt7X8SKD3Y+b1ilGdGI0uU1cnMjB0EcrNG/rz1Nf5vwDj7NYqk30W
	M=
X-Gm-Gg: AYBFou0HDCwPSILElPaYbMLq8A/t09YKLBzlEnC+7nIECNqVu4zBbGp2L0GB42sCZEa
	T29VjE3paOEq5H9C3OChkIqr7jcD12sKArww3wCeyDngpnX5GZgedp4gb2mmdon+vEC48qsPsYP
	zuA7meqaoTt5RORZSzbgXcWVFeKQheR8q8bNYDLIcbHhnEJ0bIk4vw+VgGT+kURmqc8RL3WWNyO
	P2PXC2DtjfrUm19t0Egf2/Tup7taFNdDZMjNn3ZnmvLkF/iGxFe2RqMxQqlHcwQ5DuCCtqaJbir
	4laBSJow8MMXlnHiX3pV0CiVLpmZAHIJGiKU+YBIt+36fXtXPjmyEA209V8Tc175p2McQlcX9yi
	Kxa8P55jFaTr7AfAwZnlWwnWqJ7hAj9hug/vJrgP61ca07qALIzOseVHrcEGL4r1ojkk4oDbMla
	VUX10r8TWrYnqoKU235UmLA2qkuofH9ZcV7SYyVk7PwBI=
X-Received: by 2002:a05:6a00:348e:b0:8a0:7ba9:93ba with SMTP id d2e1a72fcca58-8a8317dd9bbmr11302708b3a.12.1793776538991;
        Tue, 03 Nov 2026 23:15:38 -0800 (PST)
X-Received: by 2002:a05:6a00:348e:b0:8a0:7ba9:93ba with SMTP id d2e1a72fcca58-8a8317dd9bbmr11302697b3a.12.1793776538456;
        Tue, 03 Nov 2026 23:15:38 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fe12f6sm507309b3a.4.2026.11.03.23.15.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:15:37 -0800 (PST)
Message-ID: <5e7f6e09-2430-4da0-9d0c-4daa5e91651a@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 15:15:34 +0800
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
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261104-m3_and_aux_ucode-v2-0-b6c335c14dfe@oss.qualcomm.com>
 <029eac4d-9516-44eb-922f-73ebce894925@oss.qualcomm.com>
 <e05f0373-aa6a-40a4-b778-22f40a4de0a4@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <e05f0373-aa6a-40a4-b778-22f40a4de0a4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfX7vJ5/VI1TwvK
 sgCcR/ErnxSPzL65sWIWfimibAZ/5RzDadVac44pCx8sj4+j5E5fbhTKz5Is3rQ09QsFOa1TUnf
 jB3+KatxWiGfDzceaBKu7+7Td2DSRxPES2s0y5xyD2HY0CJ2BpbgEu5IG9PJBpCSOnlnllo7Fu2
 RujdGhxXLrA/O5z4nn1chyjtEiSF3RorGY6fwYWb8diCYqa+J4UpYJt59T2XmzgJupzahiUxjEN
 29+g3vIQJo8UuFlVVdv1WQZkBKQV9ez8Ai2C0+8xFw1n7qx6+cnnEPKKhrIdcr6o5Ml6c5guywy
 /Tim518XE3s/KpiTH/tDJpILvRSZA57W/ZLxEStnlPkzlpSxFQP42OlDRuwhxAzxpIkYSOSnPQ+
 JGZz7kU+0QsKRX0diIKVYqjFKfK+1jOGz8yxPUbCBuLN/zWovay+B809bNCpGgdb79rCS4EyhoB
 txAqOLpjrw1+aEZLuaA==
X-Proofpoint-GUID: LIxa5YDDvhaH1I7bNlwoAZpDzz5aheQf
X-Authority-Analysis: v=2.4 cv=Yoya1IYX c=1 sm=1 tr=0 ts=6aeadb9d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=pEYuK4URmlPkE1wXD4AA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyOCBTYWx0ZWRfXzvjOOaiTZ27O
 CCaHYT3f9EXG9tzc3i9BAon7S1EN0h+Uubp7D3ZEl6PpEFD840hAjFJ1hRd1wFaR+mf6NXptsBA
 1FenSjvpyTi84eSK+8uoH+6ug5rQrQM=
X-Proofpoint-ORIG-GUID: LIxa5YDDvhaH1I7bNlwoAZpDzz5aheQf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040028



On 11/4/2026 3:10 PM, Madhavan Ganesan wrote:
> 
> 
> On 11/4/2026 12:23 PM, Baochen Qiang wrote:
>>
>>
>> On 11/4/2026 2:30 PM, Madhavan Ganesan wrote:
>>> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
>>> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
>>> logic for freeing a DMA-coherent firmware memory region and loading
>>> firmware into it. Factor the shared logic into common helpers.
>>>
>>> Patch 1 is a preparatory, no-functional-change rename of
>>> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
>>> is also used for the aux_uc region and the old name no longer
>>> reflects its purpose.
>>>
>>> Patch 2 refactors the shared free/load logic into
>>> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
>>> rewires the m3 and aux_uc wrappers to use them.
>>>
>>> ---
>>> Changes in v2:
>>> - Addressed the review comments.
>>
>> this is not enough: you need to clearly state what are changed in each patch.
>>
> 
> Acked.
> From next revision, I will clearly mention what I changed in updated patch set.
> 
>> And I already gave my Reviewed-by: in v1 review, any reason why you didn't carry it in
>> this post? I don't see any major difference between this and the previous revision.
> 
> Based on Jeff's review comments, I have cleared the paddr and reorder the function
> definition. So, I thought I cannot retain your Reviewed-by tag. Please let me know if I
> need to re-spin with Reviewed-by tag.

Hmm,  I think the changes are minor ...

Never mind, I can post it again.
