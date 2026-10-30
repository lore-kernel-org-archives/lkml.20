Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793342586;
	b=UqVq4Iz6xO2oNksRc4a6poialFkh4c5nKI4vUXi8RY6ujsYj/3GzbboPipAxxoQp8vcL
	 /fXlvKuXwDyKEZhR3bNqCymMty75vSgzqvkkmraAHxq4xxOeUNc41YTPofksvZN7meeZy
	 fhM3Hk9sA6V61yyCsFoYIjj+2ptrmYkSAbz8+KiQd1io3X2iAwYJ+iBko9TNU9mpAGOp0
	 MFTHi8M7UrhMno2TJVXRhdvuZCE6OsGS5IhRrv72u1BUs3IMf99ZdnNM8ajiH43bF7/8D
	 RY8UOo0sg7Z2juT84Q9lgUgVnWezIPfPhNNAerGzbFkQ5IeagqDzdZRnMfG/iHMWumQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793342586;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HTVPcvCt9naqkl1rOj58SO+wRvdNuLhnB2RU4A6z4kQ=;
	b=PztQvxwWw+F9dB58rZX5lPgY68JaFudpljmFELTCy9wQod875SJwZetV3SaujDnqgJJr
	 TGSJrx16TR2PQvcLL7q6Z3K2w6xIevp9brFPol2/ckmGh11xl+O2uwWAlLv5bwgM0/LQF
	 QmRhe4/7MNhziQLgIAiuEKUzjhe+FQqJaX7t6Jv1j2Rvr05wF9+iBEOQs6n6KxAQirI2O
	 TatTHalYVvJwaqsSr7aZ9EZucbfcFdxk3i2Y74XmLuOqPjieD5oeqJRaNlGJp+y/zoksz
	 LzD6+3+1cY6vgEuXOVs4w8bPdkvjK2FXkhPRaCuCdmb9tZ12oW5XIQJj909yBYxA64A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f4ojMEOg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVdubdxS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29274606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29274606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f4ojMEOg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PVdubdxS
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F23d1980062
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HTVPcvCt9naqkl1rOj58SO+wRvdNuLhnB2RU4A6z4kQ=; b=f4ojMEOg5WleFuPo
	ZIXA6k8eDK+bMrAIgrb2vegZIY95AlgZS6oXORZ0gsUGjzCwqO7ukfSHLXy/++Y2
	URNEexO/ZHxX85vlTQLFuzXd5wG90b8Ro/VASVqVEymPhwK5coPs4apbOjITR2v8
	z+9SOlalOQMzGLu5aglpPYYoqtoT56tUBT7YIFqpAGfDMx5mh3bCZKvafrPqiHeb
	bh4RLAAnb1WZrkOxyxXn67p5Ad2Sim1RuNk5s4LC2JjZPH/+JGQ6pI4W7lz+TCXH
	e2mpeApRC7/NLVCaNs/AMJ3gLYTsfY5sMlO3KkZZ/0eZtAB8qu8/Rz+iMcHnv0xf
	Oi8aXw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhkrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:43:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f322ef7d3so58062485a.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793342584; x=1793947384; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HTVPcvCt9naqkl1rOj58SO+wRvdNuLhnB2RU4A6z4kQ=;
        b=PVdubdxS2bOOW/vP2uIwXOqZ+YlLOyITyG1ywBvwkKgwXLzhS0CPfvt+/cdvbd8Avy
         oyEZrVSakk8d3jvyS5ablvWArg3pe2cIRdTxxRxxKwb378vaDJWO3H1zOMWwqJA17tq4
         6AJ06lpEn/Iru2EN2kn65UwUS1LCEaIwnFQHDe3leIz/OUlnwrJXyhNpwDwxfm/rPJQw
         g0Rl6RHbobyFdfWczJJN4cKZ5hDz6CQS2RMYaq2COiXm5R9vjT/OevTvmh9QwoYWLBY1
         CIsSWq5DY9hk0n0Ai1Rylkmo7TXCxZjgmyJMKfz47Nk1+9s8B8A3AFPbAeCgA/aDYNAC
         OoJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793342584; x=1793947384;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HTVPcvCt9naqkl1rOj58SO+wRvdNuLhnB2RU4A6z4kQ=;
        b=2mqjFF9wWLDCn48PJkZ/b3szkr+rplL0JLEcnldSUd4r6S5XeYW7ujJQjBBl23VEpj
         Zp3fwKMk/jpcaa1jX3R5rM1lHXX6UnwrV1kJW/onh8y7jx9UpCw0BPahF5Jq70u0mrit
         hGKpuDWfjLukSS9RmDjv/8tJtrwkNDUtSDCLHle1UmbjP7u8eEL6uQ2wbe7gqPUW4qg1
         bIMJKAURADktn/lVwRezSY+xB2/XON+1RjyYUH1z+s3DZqP24uipZ/liAaQydq1BE3aQ
         PitqDALnurXa7BLkx8qa3nc6QqM8AxbGqnvAqzuglFTOqQbp79jhU6GwL7iOeXyV9uzC
         OG4g==
X-Forwarded-Encrypted: i=1; AKwUvByVIp32Z2UrOfBdy707/Hkg/vogQayzvtFCyLaDEYe2Q1QPry9/7barNw1X0VNvBbET5lWReuYF6l6Puy0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5H9Dr/FzYMr5Bd667fKeuy74+71ai6lL8xKTMjhdjeNsV9/HT
	E9nnETYHZPnZDUWe2ug+dbbmxZXrtzsGNShSVQboXkvdQZB1el0xjvjgN5QS4BzTJvX8nGbEhDp
	KG0XgKD/cOagBDyJZmv2v1QBBiFDQmOMgHBWOcAJn37OtiOaaxJoa7l6yPA11M9jX3X7PtitK7f
	8=
X-Gm-Gg: AYBFou1yvJ8knqH9TGrL6sSqU8cf0U93ceZA+mCrroNRKHeGzw/ghCy/H4KT+iGgHQm
	A/pIyR7T3Omv/CPrZzU+8ww+E3ZYmrdY9Ex58z8QuSiKWd9pxUd0Jwu8pGXzGG5u51v7hKsbBO1
	zYVaMdMMcWivbb7cM3dZzcIJnc0u7+Qy2ubYapbwI3XMwVFpODNi+x6ZDoQu623wBxc5dOwZ81j
	vdc9uPceJ7LZjOH9OZtkWDlGV0JOlFnQUgxyhgZE+YWxJYooNGDx1tnsaRioSwL/oc1z42MbyGo
	s10m8uCa9NxBmzZVt3LyGGAV9lLYxz290tcBQYSnKYUqpO0DiKMsu1fn/pwWQoCG3xVN1Bd80fI
	UyDLar7BNqwajOVsEZ/d8APYpeqJU/JmaZdhOryE7fmWldP+sBkmytthf3Y78aRSFS3ri/zBs+j
	Q=
X-Received: by 2002:a05:620a:2b89:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-94421585ce2mr235250285a.12.1793342584221;
        Thu, 29 Oct 2026 23:43:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2b89:b0:93f:4d4e:ff6b with SMTP id af79cd13be357-94421585ce2mr235248185a.12.1793342583704;
        Thu, 29 Oct 2026 23:43:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71a4d4f9sm1495288f8f.2.2026.10.29.23.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 23:43:02 -0700 (PDT)
Message-ID: <43ce3985-b1ff-4661-a670-dc10fe32c99d@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 07:43:00 +0100
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
Subject: Re: [PATCH] wifi: ath10k: Drop unused qmi_elem_info arrays
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20261029111127.85147-2-krzysztof.kozlowski@oss.qualcomm.com>
 <65a1e88d-6b9e-4aa8-9ee9-7b0b7892b59e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <65a1e88d-6b9e-4aa8-9ee9-7b0b7892b59e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae43c78 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=KKAkSRfTAAAA:8 a=-v5LvTCY6n3Eoa7ktXsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: A6fKLIf4_5QVuxrcJjehpCzdy0m58dFY
X-Proofpoint-GUID: A6fKLIf4_5QVuxrcJjehpCzdy0m58dFY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNiBTYWx0ZWRfX+gICaZiwiGzI
 fWYvSnelglV1LJR0+mA6mwZAds8/SQ4ZKpkSsIipjvWZoLxfggtaugNmQ/Ba1rpzckH8Al1/W/L
 DoL3I200gLi3+XirCkZiZQDMIX6nbJnSKXmVcF8vJzojTYAg7YEsG7wdK79BnnPIxImLHzFOfCG
 ircEzvMpWcXWlGGsxR9VGHqL6n5YhJwHLWbrEk6aRq2ICOl55RXkaHb0/4e1nggSe461yCBhZrh
 e6TdEc8c4HeOR2JZNlRTzDQ5B2IDgG79VvWK3wRNpwVApeGpMiL7vTjSz833fjJwd5Yk63uBhu/
 EkXyre6rMVmoNmYGlBW0CDa4F5XhQpqGBR7U81yeGdN5bNtju9z4pHvIbeyHAlIvTStvk86fSP7
 v8/qBT9T9eAgsGoUk2M61brBDTv0BFhtbjhudGXXYXJg0Q5Gjd3uw/o6W4lpbaU1AHB96SNiE8Y
 Ol4IhhAi7C/ZOaEBwmw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNiBTYWx0ZWRfX71rayjLWmvhc
 SEO36NNLN8F/q6YN705oNYNnwecRu+4uLsCuPy/D8iXbD/MNjkvwth+Q3w0JmvRMfNyC17SUl7k
 emSynDNR5XNM+yNb9V4O0kIWTi97vOo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300026

On 29/10/2026 20:54, Jeff Johnson wrote:
> On 10/29/2026 4:11 AM, Krzysztof Kozlowski wrote:
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> 'wlfw_pin_connect_result_ind_msg_v01_ei' and
>> 'wlfw_initiate_cal_download_ind_msg_v01_ei' are not used anywhere.
>> Dropping them allows to remove bunch of other code referenced purely by
>> these ararys.
> 
> s/ararys/arrays/
> 
> this removes a lot of stuff, by review agent says there is more that can be
> removed...
> 
>   qmi_wlfw_v01.c
>   - static const … wlfw_mem_seg_s_v01_ei[] — line 188
>   - static const … wlfw_mem_seg_resp_s_v01_ei[] — line 229
> 
>   qmi_wlfw_v01.h (removable once the two .c arrays above are gone)
>   - struct wlfw_mem_seg_s_v01 — line 161
>   - struct wlfw_mem_seg_resp_s_v01 — line 168

I got LKP reports for these too.

> 
>   qmi_wlfw_v01.h — now-orphaned size constants (0 refs)
>   - #define QMI_WLFW_MAX_NUM_MEM_SEG_V01 — line 64
>   - #define QMI_WLFW_FUNCTION_NAME_LEN_V01 — line 67
>   - #define QMI_WLFW_MAX_ATHDIAG_DATA_SIZE_V01 — line 70
>   - #define QMI_WLFW_MAC_ADDR_SIZE_V01 — line 76


Ack

Best regards,
Krzysztof
