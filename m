Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F0123E334
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789720451; cv=none; b=IjQO+4KXqtuFEeMETdude9euEo/lK+ZnfeoiAMIJlyiut/p3Msaf2E+bX3Ae5d1LsiYoAEg0qH7YWTYwTFaMyL/4rb27xL4C0IFL+3cfhYqEFI2eFSKrudX39+htQpJFM4yQeegUp+HJKzQTSQ/xvRstN66Y9gzZviH8z4ytgOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789720451; c=relaxed/simple;
	bh=U+uVeVwtuqrEC88epArnigjAnccPpNEJvTj4tDvUd2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C0/iTdO6EeDakecZAuBeSFeGgVpFSxijlqHFdbi33JoBm16eG0fQgwcz4ONAsDMYRHHRcerZkvVfKPZYFk/AarjeXE5vlAM6mWdhGRt3ekQdJRIymIWoOJFtJ0ooQCbFxPLvNGJWeVEt36YAmDmv2UuBZFjyBdUpeohjwIx4++M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kYcONB/P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bmfF9aCN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kYcONB/P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bmfF9aCN"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xxfu2660297
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s0fajLe4Ju0Bfr8d+6KdLUJ3QgZNw3aDSUB0Drj0TcQ=; b=kYcONB/PCeNg1NjY
	ffDulEnShJ4xuw6R91mO8HESILEirHP7+I2iibbPWuKOg5LcoNRskjeLe3DwzYKB
	Bt3dLjoblZ9XyVVoWydnSi1m1blVBTrXzki22+utkRbr/nc+AVUmgRtpFYPyD7pJ
	IBwlf4yaubkV6rrsKCTaGFyT+eBwujEGmLjNEZ20tU+vAyuPgYgr6xPCVXts9eyr
	cAuS3zvUtDf6QVHHx1WXmAO6T+ItzLqWKWtoPPds+s1oiycXazKdgMgmTgZpZMpV
	Taqydg1twj16a+HfcOP4uioB2enTrU644DL6H4n+72OOtywjXH8IKn1N8Os8Vzki
	hHL5NQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grjttuxxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:34:09 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93821883e26so17833485a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 01:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789720448; x=1790325248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s0fajLe4Ju0Bfr8d+6KdLUJ3QgZNw3aDSUB0Drj0TcQ=;
        b=bmfF9aCNmagQBti6FKAB2qNmLJiRTUU+b4XKaWiAkCYnu5QzFgQ+Q3/0uckKsskA2O
         azEzLQDLPV36rRyq4JwklS7XuheyNob4cvb17KGdFmgq8WtaypBhVW7jfFljZ6NR1sAM
         pjECbZwJ2PlI7MysVjzBFVwjV/0OdJkDd6IHqg+N3OQMbJcArLT3m7eKgbqyE1Sx4+OI
         9qdaGW+uhpF/wj9xhZ0/ieumqWvwktsgyMZZsbriZE263hjg7QgLoJlambmY941bzeFn
         Sgx5hScON8ankpDrsyLCrMVPcT7ujFY6TvQ26n4sFMwt6EXvbjR6WvftlTnm2NyILOJP
         F2Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789720448; x=1790325248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0fajLe4Ju0Bfr8d+6KdLUJ3QgZNw3aDSUB0Drj0TcQ=;
        b=vRTWSq2f31X/ql70+ZKiGdS8Rrk5vKLIzMKnpkZVznI2MRFwJX7KmTU8oKzmOvOWF3
         eXfgJMHIM10xFHgETh7/GS8eEsJb4agtxegTLz5cNwdFsg/YuxmgxXIhfn9aO8kS6/hk
         BvhYeU4nFiQFe1kG2NuM6e08Xs4pB0Li+URJVVpZebi2Z/ME+uelJVXrLzaMU1yWsxfw
         9b6kN6AgrEOv0aGZls3A2CcJPJ2xxpViuWDkmT9hqycMwxaOYPQnlwcQBU0OE3FuQfDH
         8PfJvObZ7RSc70d0rC+aGNadfn+zbTlu7q6sdA1OZbe523Pkywwpa/l+Wu1uZWdoPr/8
         Clkw==
X-Forwarded-Encrypted: i=1; AKwUvBw70zus7dBNwuOoSxLFG9sB/VApBww7TBMJXjEmn/A/f8BH3yYSiJLlLsnhYcbQxBA40QfHxQGmVaEXjZI=@vger.kernel.org
X-Gm-Message-State: AFuF++l40b0x051oNnQLnPAy1HeOx5tudBXzlLjUumnpUl6PcqxNZcct
	cdeA8LpmHE1QhYzcSylglryk0RTob5NhYX4B8gnTrfKJ9lW/8Gxnzk1nxJoqCVXb773Wy1uqpMb
	QUcWmivpm1Adg6u37aBsJRK4zOW/7DuxGvVyaU2rdjfe+K+KJr/4cmaptLHukTtBT9Jk=
X-Gm-Gg: AYBFou2T13dxI0izsp2Ld5E/7Nb22GwtxomtlWMENpkyrfVsk6q3hy+Aj8COUFqWJWu
	3dWyYv6b6Ic2ClQ0vseym9i2aEEsZSkSV/4/zeie8Wcw3awB8bGqQBvWK7W2UxY+rBVcMWho2Ab
	OUoEzSfOywfz8Ak298kPnQSoeyczu0gXkLyLbz0jjYUS+6fcr2OYoMT+cgOHJV/UZTjgZqFjEVz
	VEoV17yNoN+EXl+Vw9ichBqCnArvZ5oZ32u1vE7l19xDWF9Qhz1r8CcvGSqhUyf1WNSAfiYgnx5
	/StwpU0FL2tv6T+wu5LWtn6l/TfNIiTmPpOsSkqhMU/6f3hxfVYQMjcQv3U2gXwaltE9+9vNOIU
	vzAF6DEjwHVFIw4qSogoh6A==
X-Received: by 2002:a05:620a:6c0d:b0:939:d6cd:56e1 with SMTP id af79cd13be357-93bdc482445mr294199685a.0.1789720448044;
        Fri, 18 Sep 2026 01:34:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6c0d:b0:939:d6cd:56e1 with SMTP id af79cd13be357-93bdc482445mr294195285a.0.1789720447437;
        Fri, 18 Sep 2026 01:34:07 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa59605618sm514383a12.11.2026.09.18.01.34.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 01:34:06 -0700 (PDT)
Message-ID: <e66bb3f1-5dbd-4857-863c-99c22367bfe3@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 10:34:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
To: Navya Malempati <navya.malempati@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com>
 <4f518cb0-ed7b-4c2c-9a79-8d1549b26428@oss.qualcomm.com>
 <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <208b9e11-d36e-4376-9836-ce9ed3c81486@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDExNyBTYWx0ZWRfXwQsIJ3Oc2Lwp
 iV0WERxy6vzmf3Wqbva960ghyMv4DhYQKgb14xPTcF4n1e13Jd5R/dliWRl8MiG1CPjN7fZMPGX
 Ra4KwpCv6wJz9BfBbMcd7i1IJeqPUaIQCQQ5trZoSZErBdPJO9sL9jJNsNtGPAO/5+9CPj2TaVw
 YM0fY4zWBp0Idup4XsCp+palTe9Xv7hqKG6mKm9KhIDzA4sy8RNo7WniWW+QEtcx6dWvA5c2KfN
 KN+/nAPe2ESRNOFSYGVPxcYhbftr8vc1rW/QzQ6POu/m2dWMQiKSbCswLCtWPEGNRnEZmMDCYs9
 7IrNO8PEg11fL4pUyNFwLJ7453sQbfIO0N6oxRkFGD2A3h+YorTMAdWWiazuOr6JCFem5pqAjMk
 n8oBxqCuFunapvB6GLJJEY1Cp6i2O7E16s8RWI3G9Qz3HCmLcVzhBHSyJXoGc+EOOLFGBXKKkEA
 HMf6bWzqaaJn7vWfRMA==
X-Proofpoint-ORIG-GUID: YjUIdLoG7Xudjrclz_DGr48YYDfEvEgz
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDExNyBTYWx0ZWRfX51/oIeq+r0Bf
 2s5RUITE+Fam0Xaw9qs+zyIOmoY7PMMW//uiajDES4bE5C5F020v5IoaAslAju7tFbr3SUcHA07
 fhNl/LB+Pea9Ei1/5ZxGF052KsoZpHI=
X-Authority-Analysis: v=2.4 cv=IP2XmQvG c=1 sm=1 tr=0 ts=6aacf781 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=STkuWaXuNg38iv387h0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: YjUIdLoG7Xudjrclz_DGr48YYDfEvEgz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180117

On 9/15/26 6:09 AM, Navya Malempati wrote:
> 
> 
> On 9/8/2026 3:33 PM, Pankaj Patil wrote:
>> On 9/8/2026 1:43 PM, Navya Malempati wrote:
>>> Add SMEM items for four NSP subsystems stats which are present in Nord
>>> SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
>>> id. Add new entries for NSP1/2/3.
>>
>> For other targets as well is the same applicable? NSP and CDSP are interchangeable?
>>
> From the stats point of view, they are the same, we used the name NSP in downstream, it looks like Nord SoC remoteproc is using the name CDSP [1]
> 
> [1] https://lore.kernel.org/linux-arm-msm/20260904081619.593602-2-shengchao.guo@oss.qualcomm.com/
> 
>>>
>>> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
>>> ---
>>>   drivers/soc/qcom/qcom_stats.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
>>> index 06923408bfce..91f2d1293124 100644
>>> --- a/drivers/soc/qcom/qcom_stats.c
>>> +++ b/drivers/soc/qcom/qcom_stats.c
>>> @@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
>>>       { "modem", 605, 1 },
>>>       { "wpss", 605, 13 },
>>>       { "adsp", 606, 2 },
>>> -    { "cdsp", 607, 5 },
>>> +    { "cdsp_nsp", 607, 5 },
>>>       { "cdsp1", 607, 12 },
>>
>> Is cdsp1 not the same as nsp1?
> 
> No, cdsp1 is not the same as nsp1.

It would make sense to explain the difference here!

Konrad
