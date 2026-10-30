Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793370416;
	b=NtDwL6hJR7b9zmVz4VwdBVwfM9sChfIlcqp+/7kiTzk5HVXdbsdFtHhjUK/5O1D35Y2b
	 XrdqylWGWnsdEo28vaAX/wpHd3bhlZ9QRJUe0cdxuwWYHmiHxllJBXuKDDw8kqUWIrkL7
	 OdlOE/CRrydVPLOOHbHRo2To46Lt1ZuYCbRB4ETeX7G11zmGSb4YmhYl7LNW4hcwB9GoN
	 Pd3z5d/v2M+bDnnW/2dBQZf6CaBb0u+l6RfpCbQTYztTSMA1S+iz8BBh/WaDaK90Nft7O
	 HVn/Mdy+kgrxmV5mWy3bUB1lxi0sqA2nSJIs71Z6hRG+q0v+fLGNkVA/wBgiP9nWvKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793370416;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=;
	b=W/jSLF26xKCBmzk8vsYCjgUpWid3NLZY+n9QF5smPAM6VKkuqTHGP8zygdW1KQwhiGyu
	 DiMSZK6Y48H7c/qI5PGosKRgtTy6LV5MaMBxon66vwEJg5kdEOagXoVpnl7KVI0VwgFV/
	 e9OLmYeNstIYjFHLmfkxN+197RJSjDPasK/IPFEUoMktvCjjB5uE6hrVrI3uGqC+iFoS3
	 XHOgOVz4kI1jWo9MTM5yWwCRNyiv0jAxsccfYKVBx9JIyPQeMiko9Y7urHZjExA3npPX3
	 L/k7mTUyoZLTUua5F7IeSBbqzyuTSBPEJ3Q83PAtKlU25M+2BB+JcAlQJD0vxqCj6HA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCeeaCFI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g3k47dtl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DA5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:26:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DA5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DCeeaCFI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=g3k47dtl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UDneMx4057685
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:26:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=; b=DCeeaCFIyfTgBGCE
	VrKDaL/o5zAiqilZKMzWNepzRLy0Ntx+36ld4Y6UcQxW30rZQ3tZqqTl3wIkRrzl
	bS7Mw2TT7cjBqqeswY7Tum/ERLdJ8i+J3ze2hwBqIi9f63hBbFe/yO5XdjupoLtR
	+YCNPoI+MspCwd4yDgkmfSGky9mkRlRdx43BRlGlM1Mobv5ueMVwp9l7iZbpwPCl
	6xyzA1vpY0BKLjMcZx7XKJ8HAOc0qHHUjhlr9jiAVK+v59LgRi3TX+ShE0zQWKHs
	x1kpLW9XddjkYRrzAK1bG/1cWi9Dt48JJek27KzKa5jE7S3cyqZZwVYACsjVRFTT
	lGBvGg==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6queak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:26:53 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6790b1d37e7so1196735d50.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793370413; x=1793975213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=;
        b=g3k47dtlfncoocsbmYrCW4WPWowWq8VxUiFTRSZw0NVrOkC+BwJJlNee/JecSL0lhR
         GG9gWxelLH1J/glDJjH/cU1daS8GIzkzplExVO8lkjJmHrO9v56YdtlESNOKQgNolxTt
         D7miPoDpDDV60dXdLsIDXie2HcvswKhCrSYGqlzRA0syCWFJteu18JZzH3qL0ocvuHUE
         HQojgAeVPhK2elxRl+cqvuYwRtzdtft84PA1irvMebZtsnypZu89rnpiz8LB0gwES+Z1
         6/lCue0E8y+LJkJ+FltlkVaPN9HwvmjTcNkARflJnx6aIAHWljJxjh+C6RR/iJmGei6t
         jnIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793370413; x=1793975213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0eWLrpt3G7XvH05+iqFKnT92AV6rz1MCjuRdpdKGeUQ=;
        b=G9ncNNkvztIdXCuXeLzXscIdUWE0t4aK/YmJCVKAu7i50U6T7BjqtYMRsegU6iumjP
         DURVYI0hseX69VFD9DLtVc/+JZY9E2RRl5G19IHirw4m91ZrYYQbNfn1lf/AqvRiBBH3
         XK7Y7dHkRG+IfenuBTTsmjGix0iNDd7ZWgcM5urOcQWycwAhsoAVI3J/px2A9H69wtNe
         o5puiWRpmIqaz3bpoqDH4BQmfdTdvvpjGVNPDsFj8waqYWyvw0JYQxXqpSS0ZAcPrWG0
         +QXM7/uYndDtNTJHYicHBKTj3xmgW3i8usbIXF5r3O8J/kzDUEtVG+GaFECgoCXTovwX
         2oXg==
X-Forwarded-Encrypted: i=1; AKwUvByEXcvRh85xHCdqB/OblP2CaFf1aHujZ9bEKEJdLPva7ezEFd1qjeAOAhXOFD4OfaRml5A8q7kBE77FfhM=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+xmaMep4cAP6V2pRSJhHfjeaKxavtIXhLyNCmiXhbTDXXY1ff
	4by39kdJ41mrGJibueZ4GEDBzqig8eGifVuSGDvBb9/hjrvj5tATs9bwc5/StCRLLVgQglCXzE5
	x+SycV84avkDWF+KkC2OyDWQ+xLVXxdi5rugpVJtpf+ysGtt620AqI6rc2U5mVKAZa78=
X-Gm-Gg: AYBFou2IzNnmb3tXkJofS8iaU0Wg8DJcn4IAewHCVCQxQu5IMf+KFwzblz0nenrkit+
	4HQrKOO2iRE27FgraugboLURjs0aXyslEzPBiNBwoLRQ70QSXUrTRyqJOXIruIrPoze3k6OavF+
	dV0WHEM8DhXOaAO/ZHXqgs3Yx3zRZgsF4+moJmcPVaPJ1ESvc0TQQIYUUv8RrfTWjkugCA48Mdv
	49bY1Bbk+EhOSObSSZ9kJwDgsuzct5F8iusizRvjBI9lbwQryDv4ra6jxlTpPrMVkNV/2g137jV
	rY0rPlrQI9aWXMnEVV28EWHVOnGTKbHJNInXBnpFkKohzxsIz0X6g63Vo/l2pxwqUJaJL4ltI0a
	xqH6JlFuTwPfIzKNgJqkLzvG7vKXLxVzaYmtCvWur720zVcaDSHLmihntnsR/+aFfkTPMck6I4f
	Djrqq/FZ0Fy6wii2esdl0Fh2N9buTQGImIHLo=
X-Received: by 2002:a53:b193:0:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67ba4c90dddmr1391838d50.4.1793370413188;
        Fri, 30 Oct 2026 07:26:53 -0700 (PDT)
X-Received: by 2002:a53:b193:0:b0:675:6228:2fdd with SMTP id 956f58d0204a3-67ba4c90dddmr1391821d50.4.1793370412652;
        Fri, 30 Oct 2026 07:26:52 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:7fbe:151a:486d:a2cc? ([2a05:6e02:1041:c10:7fbe:151a:486d:a2cc])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8c6e9sm3456455f8f.43.2026.10.30.07.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 07:26:39 -0700 (PDT)
Message-ID: <6b1a831d-299e-43fd-83cb-74a64f844d03@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:26:36 +0100
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
Subject: Re: [PATCH v4 1/6] powercap: Add generic zone hierarchy creation
 helpers
To: Lukasz Luba <lukasz.luba@arm.com>, rafael@kernel.org
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, Shuah Khan <shuah@kernel.org>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <cover.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <78abd10309b51ffdc3304997376d58e55b29487c.1793288783.git.daniel.lezcano@oss.qualcomm.com>
 <dc1d68fc-e4fd-4cce-9444-acc8031d5ba0@arm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <dc1d68fc-e4fd-4cce-9444-acc8031d5ba0@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1LHBpcffZ9kD8hc8p21D3U_ERtotgTXv
X-Proofpoint-ORIG-GUID: 1LHBpcffZ9kD8hc8p21D3U_ERtotgTXv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfX53twbkpSB/l0
 3PaWSFnUz8b228K5jfzwKPvtL1m8Whoc/ix8hWE+k7B9To745v75QtC9XUu/KUvq6B+z9jNWL4O
 /C6G3ddEE2AmROFg488dFaVeq5MFksHEqDQW8zbZ7t7yXA0BQnmC7w0oUnuMDF+5gOvKbWvkVNJ
 Fo5np1LUkykAv/CnJRVfSJQHLPd42Pd5R5YlqkMGcCYYEoP9fnj6o24Q3+WTqep7OubztCXtshC
 rXV73WiJ20GwThg75b8yxtJbRBCTCMaNt/hlx180yussqat288tByYLUvEKWnfBcWya3wKqTGT/
 cBcn9LE3jd8UuQxYKwZHRmK2qI+tmW7fSGk4zjuktMbP3LE8I1ze9D4Lz5fc+8iEfeYD4C5pSgu
 wQTl+PULb4HNo1lfHGE81uOakx1shjBFrf1sjSNVM/dkZSAOAP/yG71Q08p2EJ/AGwrqw0cEMam
 61xM+LrAXsZTupf7ObA==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae4a92d cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=jVzW49EHFVz-FHsPnZwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22 a=FO4_E8m0qiDe52t0p3_H:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA1NyBTYWx0ZWRfXzMhiogxYewC6
 HhiPvIAd/nShG76+hDOeGp74C1HlEzwiy2nSLgAvoc8KWL6RQbChxEO3nZSP0ExwNtd5absGMqu
 iy6uNZl03uuO3UbFyxutTzbhJUK1tCo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300057


Hi Lukasz,

thanks for the review


On 10/30/26 15:02, Lukasz Luba wrote:
> 
> 
> On 10/29/26 16:56, Daniel Lezcano wrote:
>> Powercap controllers may need to create several powercap zones organized
>> as a hierarchy. At present, each controller has to open-code the
>> hierarchy traversal, parent lookup, error rollback and reverse-order
>> destruction.
>>
>> Introduce struct powercap_hierarchy to describe a powercap
>> hierarchy. Each node contains its name, parent, backend-specific data
>> and the powercap zone created for it.
> 
> [snip]
> 
>>
>> Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> Link: https://patch.msgid.link/20260806110159.69690-2- 
>> daniel.lezcano@oss.qualcomm.com
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
>> ---
>> Changes in v4 (since v3):
>> - Rebase on v7.3; no code or commit-description changes.
>>
>> Changes in v3 (since v2):
>> - Rebase on v7.3-rc7.
>> - Add a static initializer and clarify hierarchy ownership and locking.
>> - Check for existing zones and validate names and parent ordering before
>>    creation; use zone for the runtime pointer member.
>> - Allow NULL callback results to skip branches; keep errors fatal.
>> - Use explicit locking and a signed reverse-loop index.
>> - Explain the controller callbacks, their arguments and their 
>> relationship
>>    to zone operations; update the description.
>>
>>   drivers/powercap/powercap_sys.c | 204 +++++++++++++++++++++++++++++++
>>   include/linux/powercap.h        | 205 ++++++++++++++++++++++++++++++++
>>   2 files changed, 409 insertions(+)
>>
> Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

