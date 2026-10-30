Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357171;
	b=Stgp3plZdrniZkiTdZf6X4wrvp30sJsPv87kxllLYOsWNBgfoTK65TaEPHKYgHOR3uOw
	 rQmhBqiQ7kmRloG0Um4wgRH85rrceJ/Ec6d9YtoisoXtHbLtslEkTzJW9XdgJIqpaFDB3
	 6DR7GV13QwO3FC3e7nASel47D72jQ9iXoVDiRsV75x5wFkepIsoRJ8y4VJLZ9rk8Q4z3y
	 r4nadzJF2JhlgePFh8lxaBePXtMN5t8hsobDTrniQozwVXzyfEvHLxzIvnLidQ/rl0zxz
	 tDxSQa02W3Ds6xfNSu6tkBJ40bvp6D7e5aDA1PWIbsUwP1VNRID13kt1G5bsFLIX9lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357171;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O4lE02FroWO2mBdwMUF19XxQ2K6jymkalrb2pZA2vZE=;
	b=ulz/7LgktzpHLkkSw+JDEwET/7pLBjE9JNIqY6iN5ZOZezQxEPJNW3e1DYgXBArJ3AX7
	 39qlDYIlwbOsr9Iwm+wLrJKFxgx53SxeR3W7IfRhKCo/CvueKphfV6D5PnhaYv6c4sZMt
	 Q0VHGR7k/IzMJ4RBBrR7FYrz0NToDHFlHaD96cdc1WlUL4M8V82K1qn/2hEx8oupfRHKX
	 0pfHrA6hRhHRqMqyL46cM/jWuH2pKmQuJPDdFuv1D5EZyA4VQb7qNxABVZps00UnxJ2Ry
	 X9XExpnppxb47Hxm3Ev35KhoPhjJxX/52Bh/xhnCC3q7NKhdZkrFnEC1EUKc4iFKCag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ibicFfX4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OldLJ+Rc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3A01606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:46:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3A01606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ibicFfX4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OldLJ+Rc
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F9AT2374148
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O4lE02FroWO2mBdwMUF19XxQ2K6jymkalrb2pZA2vZE=; b=ibicFfX4oEG8TjYG
	FSARa6Uu6yiEbMu0aFmHkz5iyz9gZid3fKr5kB8oWlT8qJ9IF/Gew85Dw+xZFv6U
	prdI/tj+TaIheB/c2bNZh/0LCvpEShGYAAsmH5JugamM5qxmtCm+MF64bmCcZ2aq
	46RZ6NY7SP3l4XtcldwfHjjO8WEB/v1o3lgf5vzbN+LWCB4p37eG4+TTeBqzelIK
	HRpQOGgMq9mcGYZRVnEO9gZovuLWz1Hg5zTa3DaZdx4NovuiF104VWaXVILGaVGL
	hlOQDFDn/brLOZiGQcslvIhufCib9yY3EDf+dydAUfCihSng0SAwyEh7GNCArbGD
	iCeZlw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qjhry-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 10:46:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cc50fb0d2so15391985a.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793357169; x=1793961969; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O4lE02FroWO2mBdwMUF19XxQ2K6jymkalrb2pZA2vZE=;
        b=OldLJ+RcRcBoSkUFy/rIkbPJ16oFQv3byhloXIdVZLvaaMlcQMWaeFm8dJ2Vzg71e8
         oFlrsqwfdC+XPr1FA5Dr/jNZztfFOE8eLrIwkgdFPTpNGOpFldvYdIU68CHKcLSFH9Qa
         iO9Xj0USTnnPIhzs9YhT+Y4J3wm2M9MDVSTjCRd4HtRpEjo/2rET1uHVKl9PhL+5pTrc
         4/9C6i8cY7sKGsKYu6cmJSrCliLkzmAZHiv/PCw9ng6l4Q7arsvWyvd+WGoN8TkzC6ji
         32RMtcOgIG7xespngBuzPQXKvw9fsW8SzUuOR0n2x2bM7opbkd86Uci+575cMNoHsNyp
         ZACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357169; x=1793961969;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O4lE02FroWO2mBdwMUF19XxQ2K6jymkalrb2pZA2vZE=;
        b=1WkBvHmdtVOvFBVef0JpAcl3nyw+WyifxFURVGXIkSqOuG4E4dM/6CXIoR9Nj2Y1kd
         hHRwq5+rAN5AGRYX8vrNyATncBC0bVBauIxJK9BTa3Zfk4Ento7rho66X65aSiMVXC0X
         BA6VhmyzD9NopsubET1ago+cRoC1vPGL2lPoP3TlVeDbGPCxjg+bXOOJy83VR7U99w4O
         VtSJMuc6j/cJP9MTArx2dMHAboKWhXpd33SsRzYD/GaGSWKyulBf2qaWRByT6CMsI4Y/
         +hbg685SNA4RGfuhufm7vw75imNtWBWlilc3bagFcAiEZnJBfXDvmVXf3bkfe7Y7EEa8
         oSUg==
X-Forwarded-Encrypted: i=1; AKwUvBw1b1DKAnTEHKTi2LX3f3v3StF0DxtSQ5No9Tk+wiG1yCjjlahQTfWZj3dyZav1bCjVatGxTHpjJIL0cVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpDQSHAGPhpoDJkP2XLjNRavXTOfzCIe4DWKbNBCI6Et7iTTVR
	GQ6FBPMtmgc0KPwCfeWsWJyVP7EzNQQ5B5dLziyUWsNcuE2h3he2xOC1PzAg9AyWgCWNNZnSIMx
	hOXTE+xzjpsBt9DDCkHAUjJv6OXU1lawAHXHbCGfGpYCvyjgBlpZzilWJmMGUo1q6rfddsOSUD3
	U=
X-Gm-Gg: AYBFou3RBEFyUM3vQdJr8a8xv2w6C2az4vZFjYwHzLyQ38CDgmtAIokefscS8OvNNon
	GZFxvxiQSa64P23ltqy1JQ/FPnTTXsB1PP+TmznUAnvFInPDdm2/xbggWFbR4ZHb+rUyUshZobI
	x681zY31EnkazW8ESZ4ZSVAp9Dx6skvz6NO229jNNfPGwGbtYOyXZqPvUgVH8ozfnhea4iutVAE
	qvCZLpmneja1IQJVkL21U7eNum0EP33O3A2WHFMKrRjSYVctvVN79PHS+m/COJGE2t1H5fTykSs
	F/IA1ONLpKAyAxbJcYTP2ATS2+AcsGJU2cSxwEcJuNKIlr5ubSvziKT+BOCw9TRWCkTJQEklDQX
	9Sg+pgpeEK3snX7xfWut14OMJlMMeIv+KwOj7GXwpjDCiLRL4/bw4++7XNEu23yHT2GzdUYs=
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr297286085a.4.1793357168938;
        Fri, 30 Oct 2026 03:46:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6e46:10b0:939:c7d1:7471 with SMTP id af79cd13be357-944216cc78bmr297284285a.4.1793357168525;
        Fri, 30 Oct 2026 03:46:08 -0700 (PDT)
Received: from [10.169.205.110] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cab9dc577sm52613366b.0.2026.10.30.03.46.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 03:46:07 -0700 (PDT)
Message-ID: <3e798ac9-e0f8-46d2-bc8d-e0fff9c07fd0@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 11:46:06 +0100
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
Subject: Re: [PATCH v1 0/3] Commonize Glymur regulator settings for fixed
 rails
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>, konradybcio@kernel.org
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com,
        gopikrishna.garmidi@oss.qualcomm.com, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org
References: <20261028-topic-sip_cob-v1-0-80ab6704aca3@oss.qualcomm.com>
 <20261029093908.100286-1-sivansh.gupta@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029093908.100286-1-sivansh.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae47571 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=P9L5n2JjKQnZrfjJffYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: llS1qBYeOM-VUwqN3wDUrSLamXMczGRy
X-Proofpoint-GUID: llS1qBYeOM-VUwqN3wDUrSLamXMczGRy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX8/WyZPEO6SWD
 j4QYrBf3fKFh/88qTQdh9dY+7aX8x4G2NR80oUKpR6pOzsHy9mTjHvsL+sKjrO50jdpF42Y8Pnp
 kCjJnBdicpog/ajkO2+BM3KCDkTis/j6DtBArDh3kkUsOxAlamv0q7bCOigu/qIV9KOYCpPwNI2
 Gm98Xz1qFJUgSbqrAVEFpsXtbpU+5i4lQdCQ8JPLGKVlP1Rfp86WDRyySgs+wNJ1QOZNEpJpaiu
 y00AW6vyCQTXdACHse9FRfHcNzVRCIGdSsK91T7qdNCi42MXkaMjMLSed0XQe3ZqQhaKxWfs121
 HEF/pZULQr7EhYyqRqQ+g7bx1IFpZOgZ7FEjojupR+hXFVljvYVUHyr/shUg529+9IPx+mGcCak
 7meu1mKxJpobUULfUke7zAEMoXMxWSc8ziX2a/IW82ySLaxrawug5y+NON3DqjlnrMW3SWkb/Uu
 n1GJfRvMo54dndyoSOg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA0MiBTYWx0ZWRfX2TStAr+k9hwW
 dp8ACcUqW9f7SmVUfh4ncP6Z/C2GnIzlMdu0YPj7vgwGvAGSQTE4hO4SD6xeDoa5RK3vjEJCeRR
 hX8HIik9G6HlFcDOdq8hpgrj2Hni4KQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300042

On 10/29/26 10:39 AM, Sivansh Gupta wrote:
> Hey Konrad,
>> Certain rails are predefined and will ALWAYS have to be the same for a
>> given PMIC configuration (due to electrical and other requirements).
>> Factor these out to remove a layer of pain when creating DTs and let
>> one have a better way to reason about the settings across the platform.
>>
>> Glymur-SiP will be the next target after/if this is accepted
> 
> This series conflicts with mine.
> I attempted to rebase your series on top of mine, but it didnt apply
> cleanly, hence wasnt able to boot test it.
> 
> Link: https://lore.kernel.org/all/20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com/

I'll rebase the v2 on top.

Konrad
