Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6834BD7BB
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790271839; cv=none; b=hG511HsWslONpUJJevBOBCCwA8o2kRznz5K3v+E4PpohosDeR+/8/cX9TqmqUs3XQpupFHBUYL5RrhJOhrmH9B0H2A3z+tBSSKa/Q/X9zoIs7oi5b29WecU/1QglhTZ7WrbkO3WATv9y4LkSlzg8iTFuUs3Bg3GJgcXVIGIu4Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790271839; c=relaxed/simple;
	bh=IeCLqcL942H9osUXUI5rqj3WJDkZ3mZRjzv7hf6aMAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H5ZcaEzoY0QZ4YPBO8izVhiz/QBG1dWOcel7jiqUeDI95Hfrfb54DupoT6yu64cQ02aLa6hZl0gIXIinXADd0FrZXOzdBy3xn2RWQzm3/OJiQBUVs9KJk3+9OmvC0wMU9HaDALwWe/g4NXo719ZY7096cSkc963NXN8/IILOUug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OcC1W5SQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TeXjmbm6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OcC1W5SQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TeXjmbm6"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeted3065224
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:43:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8M/0y/yNt6Au7No9QSBsCFPvZ5a324F3UBcrEIuQcW0=; b=OcC1W5SQy+gpK6qq
	hjVQa8Rlvd1UrGSM/s1vNLblgktVLq/YH9S9aQU8+2loHXHzTjCMLzykaeTJxjoj
	uECM7PFPCGAnPgjSmdiMWFBrWrVRY7Z6i8ePKP28SZzd4I1Lm7LjjFFgIbR9I5+w
	BFuWRKc0i+jQW2mDK+WDDF4pky1qcWTKuIFvtrEX1ZI4gO8Z/0GBfPPwXVv2pb5t
	1hqB12eLUsfi+4+MK+jLX0B0icc8SpHxtwyadRE/aN67E0CRXpNnhtyALlEZM9Lk
	uWBrmNKQ/oYIVdsll6aQVoUZlNp1APwHGGEcOQItFZupPDu6VSzffDpXW2Mrf2/T
	NMOpdQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjhvc9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 17:43:56 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8699b293a80so112248b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790271836; x=1790876636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8M/0y/yNt6Au7No9QSBsCFPvZ5a324F3UBcrEIuQcW0=;
        b=TeXjmbm6loQ15X8jLZ9y75R1jKb0/fL/I4Fl8rWWULxCwcbwz908vBB5CIZ6aVy9WW
         IXzqeRvEdo32Y6BRnaHzPTB5saHdJx3Z07OgSCkXiHjB/pgHwcZFpNhOHvbrNgoCZjOo
         RvmPvHm//sePb+AQTGKKMdbDcrD9mZaRPp506BC3sF883TykHkLyGsIqRHeKqS2CRnGX
         j6CZWixeD7DTcLwsdislrPS0XvcDbMtMz8SYJfCKwNXL0W4ppzuMHRzKFz+VdGVjtwwy
         LVMz+UUi0+nWPZWjzzVMyRBvhXc70BCR/lSAMJJ6j2gHb0saOXc4E8WsUUGSTLHzix0V
         YM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790271836; x=1790876636;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8M/0y/yNt6Au7No9QSBsCFPvZ5a324F3UBcrEIuQcW0=;
        b=poRmXdumiPK4qpkc0CjxJ8zFIUt01vby2sTayXd2lcz9xp9vfmGYddc66+oNyTe/om
         UejqqUleiIAnovO03kfQULZBL7Aks1kF5pm4UDqqwxWgK/lsWodOl0xBX91vigbs/OCn
         hn/gKnROUFLoYy1YBMUT0jnErtUuVyc3Tgv7r4gTNorE+AzMDW1rNXZ1Oipg0oP3A/G0
         C7BEYk+omXIFXWdIUkU0NxtXF1N6EVmaO7eGoF3kNdy57/rDxqqFRdOol8dwm/nlauvk
         0lmN9/ANiHIaKSJ+TAhfM0n//lwBV4koJy57XuwEgufnQkrWnBQQVOQhwMRCe70KErXk
         itgQ==
X-Forwarded-Encrypted: i=1; AKwUvByv+K9FD0UjvMXL0MasOnh9CK6uzPR8TNpKUwSuuuq8ssdbPisp1E3d+NDCogr54hFVojE++OnPJKk2f9s=@vger.kernel.org
X-Gm-Message-State: AFuF++lxIwYLfKXzbkgfgRXxt8JspHObBTqBBz3oZhGu4hWUXTIMM7hw
	YOZ+ggRAYlKRlggjyhTDf7b3UmOJEhVyUjzNMLyH15VFvCgRgh0kiQfNknWguIWKLkfCDtgAx6Q
	hb7luI6ghxCL3hmPSl10p9GBQxOJsjicHju4zkncDfbXRtLBJMwYoXVVqRc8kQF1T0ro=
X-Gm-Gg: AYBFou240gKyZHjdrDuFdxwqLCnLCP+tEdvBCnpaVen+lOFPvTTmdIAwypJ2Z5+/QoO
	/Vrf9iPEy9wdPC7cE8qKlBOthQo9uHjdSKLAdtg/Lf1Xy0xHfWGRzRAD9r44XCZa1amEr2A3sFM
	SzKCljKHksh8PA4y23ge5of+lFueqsT2aQFWwsXaCgwAe9+1l/9KAwrbHNMSCDfqkiqpRxTtoow
	RG9TuI7J9yqVrM9gemQe0QG3LAZ8ME9o+pPbq4VgIBxQAzGamLtnMFszPWxEMX+6pHZcpOg38a7
	3wqOKFFebavUjd523uLETReP+9og92Pw/KNzV+wbPfOwn/+n1sZ2KA6yJlVst29hMO2fQT3snp5
	r/7/UObrBNW8fbqxbMHHERE7ihrvnF+LbssR6TUJL9lSS2Ru18YP3mPSPvw==
X-Received: by 2002:a05:6a00:e06:b0:870:c2db:da53 with SMTP id d2e1a72fcca58-87e995718a5mr2950626b3a.23.1790271835479;
        Thu, 24 Sep 2026 10:43:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:e06:b0:870:c2db:da53 with SMTP id d2e1a72fcca58-87e995718a5mr2950596b3a.23.1790271834795;
        Thu, 24 Sep 2026 10:43:54 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fea8894d7sm48218b3a.26.2026.09.24.10.43.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 10:43:54 -0700 (PDT)
Message-ID: <ac840cef-511a-413d-8e24-308b9e301dde@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 10:43:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] MAINTAINERS: add entry for the RTL8723B rtw88
 driver
To: Ping-Ke Shih <pkshih@realtek.com>, Luka Gejak <luka.gejak@linux.dev>,
        Johannes Berg <johannes@sipsolutions.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Michael Straube <straube.linux@gmail.com>,
        Peter Robinson <pbrobinson@gmail.com>,
        Bitterblue Smith <rtl8821cerfe2@gmail.com>
References: <20260921154347.82317-1-luka.gejak@linux.dev>
 <20260921154347.82317-7-luka.gejak@linux.dev>
 <45eb7d5908f8fff9a18cba603fd3a4abfe8695f9.camel@sipsolutions.net>
 <31285267ebc43aab631a4199059a247a8d937814@linux.dev>
 <c208152fc5cb45e19ae7d4660394dbf2bc5e0271.camel@sipsolutions.net>
 <bcd5a280-8184-4457-ae52-47a9e0fe763c@oss.qualcomm.com>
 <ffe834a8a469d5febb7e73de371d662f9a0d115f@linux.dev>
 <fe3c6884a96b476799f415a06314f1ba@realtek.com>
 <c419df59280e52baa5e25f665eff599592f3cdff@linux.dev>
 <2694defa2e284ee894005c59197325a0@realtek.com>
 <a4339de07daae1d3ad274067006ed6dfc021434d@linux.dev>
 <5458e6c0dca04e9dbbdc5b714d150252@realtek.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <5458e6c0dca04e9dbbdc5b714d150252@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _ZhFUKa51ab1-h42HEy4JAS0aUUJN_WK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA3MiBTYWx0ZWRfX4q0hcPWqXi/a
 t31gUr2DR5kbApHH8xo6V0wpF9Ie9OqRVb4HrFyHd3WxxBsL8oiBCqHhXjEo1NAe9MKGYatoaBr
 py6pY5kuVTIWnNFw919FwLok0YwvACn2sFaLHn3BTwzoJEPP5rzbaakzGXNlyz/J/nEl7GHDQ0g
 Al0GdBKiXfkZOGVh4kwowSrvP13qopl4ye5Hv4BefPfOvN2aM7hhuDnpLeC2q9I5DG2bar7M8/S
 hFzzHVmW/PZ0KXLhT4vnyZM8HvOAQzb4MSkQChMqxRdzhxJfkOBa95KJZk8lly/bCohaMKuH7/G
 hAs7Pva3Wm9ZJhYZ7amnsd04/zmGAZ8Dq1VDRmHSo1LOi/S9cUbEnODXdwdjk2t9aasA+Ys5StW
 XiC2MFO/Yj0MjRVK5ypegxTyoa1wEKOYnrOsRz5aax4NHvLt9W6cuUJHf67ZV9GAoeOnywTHDDY
 Sj9pDsqzz6JWTuo/CVQ==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab5615c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=ofqPYY_WaIQwRNNNXq0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: _ZhFUKa51ab1-h42HEy4JAS0aUUJN_WK
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA3MiBTYWx0ZWRfX0X20pCMgCQn5
 mbQjDqkqLghJ+FCaSm76ip518ylIj5b9geImuVx1AXv5qevxz0lrYacVDHtkPP15Q9HClHFQPe+
 oSOGI3iSvcpI8wXD27gx6dsq4CueVG4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240072

On 9/23/2026 6:42 PM, Ping-Ke Shih wrote:
> Luka Gejak <luka.gejak@linux.dev> wrote:
>>>
>>> In fact, even you aren't in list of MAINTAINERS, you can still review
>>> patches. Just subscribe linux-wireless mailing list (I think you did),
>>> and reply patches you have reviewed.
>>
>> I would prefer to be listed as a reviewer because as such I am
>> CC'd on each patch for rtw88. I'm not subscribed to wireless
>> mailing list as linux.dev service provided by linux foundation
>> states that we shouldn't subscribe to high volume lists.
> 
> Though you only want to review the patches for rtw88, still suggest to
> subscribe wireless mailing list. Otherwise, you will miss to read something
> discussed in other patches. 
You should consider using korgalore to populate your mailbox. This delivers
messages by retrieving them from lore.kernel.org and pushing them directly
into your mailbox.

https://korgalore.docs.kernel.org/en/latest/

/jeff
