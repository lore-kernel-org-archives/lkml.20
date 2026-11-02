Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616253;
	b=atxt62DvF2LoIaAmBeAbTcAQ1YYqyXfL7QRdWY89ERzNMOU3G5RrEQX/iG5oHZd6xfq4
	 aoUDpvrGA1D1vOfb9FCPET5e4vdE17TnXh99lLvilm0zW/Bouc+YQwdLhzxECNoYY2fk9
	 m5GRYqsK/+b+vXQhtz0VytbOGdArZq55SoiE9NVKHhbAyzkCXSQ99EcSGjgByZWhWRk+x
	 Byj3YzHCrqDeBynkxDkOWxERHMNUzgnpPRWf/j1754Hg2QRUmDfKJQJplKzqYxq0BYM2Y
	 kmvFsrQVO+SOJuvqYzuwvUIBygJvmT40EMSLUmMoerYRLqvuAjjcL9v89/hUY6WwA6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616253;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
	b=YnDfKmaVnH8B4MZ7lMNsTn5tRAc9NvEn1Vg7hkFiQbcnqJLZroYKX8TTO0NV6bWzrRWk
	 Nbi0B70BSaDM4I93ombRrrWhIJFoveHttf9rs7u7BGDYZfif6XxrXAkfUEOJplpduRFLh
	 ZvxipHtRnkUnpQZd4pj9uZ2hjEOEkf1wUXs6AnBQWma1F45zE5Pij0m/3PK/l3C+xLxw1
	 vTf6iy83aTLEiwS3TLkqI5v+6P9Fh0BG2dgvRbF8k5PJd5OTKai9uRdvR84iyIjNZYFs7
	 a4NidNroVGbggK1H1uUAeh0KYruZvQq9eGRW9o+L9xHweqjzy2w+nCCTobQGNNXUX3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfb6bG7J;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIwKAWv4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A71606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:44:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A71606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yfb6bG7J;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIwKAWv4
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A1LX2466067
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 10:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=; b=Yfb6bG7JJSoN0KYz
	s9+fJb1m/gh3bdTcKqBByr79KI0B/wJLFd0eHQgzsx0m2fSdDFPX0Xzc5jFJ1LcR
	zIUesJnAPFtg1wMy6Liyk5bMPj6NmOIPJxa5t02sNmZwSpttA7sGw5nHe/sdRzAa
	OroPaITQK/PJgevdTFvmWwdoFlFvI+7nXoRnOoTOTkTYsq2H2+etJ8UxiXktj5hD
	iUdatxcWjGcrQnEM3LNPoD6bq7IXZpQNl+dd0upgiIguzk+KnSA267UV3X5IWcT8
	zB4Zl8nJZtkyiROlFm46x5GOhj7zAe4Lh5yemVN43Xa785fP1duErA4xPyg1qCU4
	avs8cg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rhctt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:44:12 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c83481504so5653096d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616252; x=1794221052; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
        b=LIwKAWv4r8dBceVa4Ij/2xQCJJ5zrSMbd1kkQsQc0ohXuaZGup21jQzLYSY3mTP3mY
         CxMPlkcJHb/d0rEwNJrdvsONm41K6gQDVCP4C5j2dmTe5vCMIcadkmwPM7fDu0pjB1uk
         cdbZ5xNSpi9y3p+lSuvsD+Ggk/EMzCHNl4PvFwpOwQRArq9L4etdUp6AqzuT39DvFKKx
         fkt5hfQmjPlBXOSsN4bLRn1APr06mhG0oNADDRk/xMAXdBePIGuxAFZX851XonU3KXt1
         SyiDSzUEx3yDFl5+uEeR+T2W4BU8tIkOQbQgcV04AQO9oXJga+ewIwEAjQcgkcmqo9Yu
         yYjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616252; x=1794221052;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DagWDRZWu91tlPDx3Rb2tSyf5VLxAyyZkV9oS3j452U=;
        b=foYfnCMl5OclhuHK2b1iSDJmIe7dDIdjYr6zwgqO4Kd+dtDfDE0+Uffogx+VB4ENfj
         IStO2YbKGuhFkm0z4o/MI7ZFE2VulZAmRuem1nJ2vM8m4149KahCTPgP48lofogM5n7j
         8YJiADbmFNlNoZLXgCXYN0HBwkGV0EIRDr8Aq449KWvPD/kGPtK0ZkM5mTC6H3rjO5vD
         69j/LfNnH+DGX4k8gZrIdiTivh2UnWMD/ulmPZ9FJQdpvx1mjO7gQzc75Pwri4jCE2k3
         opnu1KjKAylBEk2z0+4A2XyvF29Jaxl3dodmtXngUVgo++sV2kw8DQ9lkYmxofFFEKM9
         4Dug==
X-Forwarded-Encrypted: i=1; AKwUvBwwla3hgDOkNhFxu5m19ENVFX78IK1wcSqzGmXFinWfbyD07WSVc8LFRswWe5ZJeOobVZk+xbYtAqO2HVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIG8UPJqTz3R7ey5VxBTY5u3U1zE9IUJDerbNXAIP3w8IzIyA2
	7qh+EzHz1v/RGBVtgUgDqfqiWO4oYMPd0dOXRFNI8L4vO0K5dZligW69sNi7hQws7NZeWB9CT0W
	FrfZJcY9mLeprISh8BSpRgocGRscaBm8z6hAi5/I2iVm6sVOxKkvJ7TnFs/eJU5AOguI=
X-Gm-Gg: AYBFou0kg+VOi+kTf2ZHE7lS7168sploekhXT3BC4DN0C8U23D8pUUE19pOXURYMY9V
	H+LetBHCl3ktKusVra9Nw+wXCai1J+WMy9I7eXA0YFyr5OYxBDj9Qbv4U3lOzG2LgMOtAylvy2f
	zYbECNXspCFQL49aYRpcU+ETU//KaXv3lXBuL3UTaLkGA9IV1m/1qb5HUD1c6b2zx9C6FWqUib3
	vlPc9H8MkeZFjrS4jZm56LRHzBJMw7n/hhrGMWk86FGKw/Qf7Lgrh/w0Kc4gmcHDhdrX/lL+v3n
	PJlBqZ89al/+cUUTM4YCzS/rS1qrjv8b7MfOkl2ssgnWUrWCqry64t6W+qjMQfxkK6V16DOQ87R
	ufyOa1iSCxfyrBPiGr//sSpvPG12FKzgQ4aiMqeZbD3Psk+rS9zcSDAoto2r/GQ07zIN4noA=
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1772174585a.3.1793616251664;
        Mon, 02 Nov 2026 02:44:11 -0800 (PST)
X-Received: by 2002:a05:620a:6357:b0:93e:6d87:4f69 with SMTP id af79cd13be357-94421666fadmr1772171985a.3.1793616250987;
        Mon, 02 Nov 2026 02:44:10 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc174d0sm374997266b.4.2026.11.02.02.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:44:10 -0800 (PST)
Message-ID: <f4c2b984-e255-457a-9b39-f797b840cac4@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 11:44:07 +0100
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
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add Xiaomi Poco M3
To: =?UTF-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>,
        Amir Hanip <killdeath104@gmail.com>
Cc: abelvesa@kernel.org, andersson@kernel.org, conor+dt@kernel.org,
        devicetree@vger.kernel.org, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        robh@kernel.org, a39skl@gmail.com
References: <239d46726c0aad84feccc3def4eafab2@mainlining.org>
 <20261101164930.17976-1-killdeath104@gmail.com>
 <9304e75396496855881251cac2edb0a5@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <9304e75396496855881251cac2edb0a5@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: fdsOf7dfSAbDTuMqBYRxcNNmeae5d2TC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX1mhs78F1jY8P
 AxbVRGiYY0g3sOFJVZD9opo9tzrHM1epbI8TOLnYv1VAx70mt45WOYT/MsPc3lN/K5GK5hFDg6w
 Ce4m/ewZKOidx9UVl8mL6zQOMzkQdGjeuxvG7Wg1F+nkX9zaCcPobDg7tfYhaChpXNO40T5o3Vr
 cw+OGUIpltN6/ip7aq+5y8BYm1a46VNzxFkyFMEENYHdGbjVmyt7TyR6SlUMXz1zuSZkJ90D2aN
 E1+HnggqRcfvVlNOC76LuWgt3oRjCM1830aQSZPADXXAAW/pqaYNQr0Zw5eK8tiCfmBRRBiv5hY
 Z0PPyUnXQX4uS1WvYD0LVcCWA7/HRrDr4MccqwvhkhOHoC0fHSTjZvvKJNbF4WfHUmMzGh1n85M
 1/HAMtL4I+L1RwgTFNQfkU/QsLLj/bKvN7ToYwVcmK8AYt/29Rgw6E1WQF76bP3qJxjRJ3QL1wE
 idTXW0rXAW9+fsjw4tg==
X-Proofpoint-GUID: fdsOf7dfSAbDTuMqBYRxcNNmeae5d2TC
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX/hMrNL18e3PJ
 dRn2XjoHfgoT/4szS8FFkHY7hXsifRZtDYS8uvPaWWLa4TriQdp3Hh8zl+0SDWAgdn/ZHiCSkWO
 qWiBQKPduH+d+ZenxTEAQRTQPY3P/rY=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8697c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NZJFGjKaqi_mDWV0rrMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

On 11/1/26 8:44 PM, Barnabás Czémán wrote:
> On 2026-11-01 17:49, Amir Hanip wrote:
>> On Fri, 30 Oct 2026 13:30:28 +0100, Barnabas Czeman wrote:
>>> Poco M3 (citrus) is same HW like Redmi 9T (lime) and Remi 9T NFC
>>> (lemon) basically is a lime with NFC.
>>> So i think it would be better make a common base from lemon's
>>> devicetree instead of making the same devicetree again for the
>>> different variants where only the compatible and the model property
>>> will be the difference.
>>> Check sm6115-xiaomi-gingkgo-common for example, it was the same case
>>> for Redmi Note 8 (ginkgo) and 8T (willow).
>>
>> Hi Barnabas, Adam,
>>
>> Thanks for the review, that makes sense. I am preparing a v3 that
>> moves the shared parts of lemon into sm6115-xiaomi-lime-common.dtsi
>> and has both lemon and citrus include it. I used the name lime-common
>> following your naming. Happy to rename it.
>>
>> Plan for v3:
>> 1. dt-bindings (unchanged)
>> 2. lemon: move the shared nodes into the common dtsi, no functional
>>    change intended
>> 3. citrus on top of the common dtsi
>>
>> I can only test citrus. I do not own a Redmi 9T, so lemon is untested
>> on hardware. Instead, I compared the lemon DTS before and after the
>> split, normalized with dtc (dtc -I dts -O dts -s). The only
>> difference is the numbering of two auto-generated phandles. I will
>> describe the check in the cover letter. Adam,
>> would you be able to test lemon once v3 is posted, or look at the
>> split beforehand?
>>
>> The IPA carve-outs (pil_ipa_fw_mem and pil_ipa_gsi_mem) are identical
>> on both, so they now live in the common dtsi.
>>
>> I kept the following per variant because I cannot tell whether they
>> are real hardware differences or just differences between the stock
>> firmware images:
>>
>> - ADSP carve-out: 0x53800000/0x2200000 on citrus, 0x53400000/0x2600000
>>   on lemon. Both regions end at 0x55a00000, so only the start and
>>   size differ. I can only confirm that the citrus value works on my
>>   device.
> If there are no overlaps the bigger range could work for both of them.

Waste of precious RAM!

Konrad
