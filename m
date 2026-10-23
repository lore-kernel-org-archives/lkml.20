Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759448;
	b=yFmT8/M1/5UrfTCZ3fg2IY2nPoqP5AhhtZUPQ/XwoIPoUUO+YA97P9SGeLaM9F03CJY5
	 C7RdOCxEu7bOlTbJhw0+8Q01UJA0Nfz9Jy9P5IIW2nXijGIEfiVPE3soaWUkj/yD6pkVp
	 us+98cR01QN24VQta0rNKW8vZ461Lbf4ldZ2ZxJJ49MHgW3bVAejJFnDLoagd5QDpzLe/
	 uSsvDEeUC2F+S2RcxRHGErjxyR0lSMfJSF2ulqOnnPtj85N1ds/GG2TpBuSeo4LLTXIT4
	 Tx70sU6ejzZ/Vxnyi/FyyZVvoBs7oE4FFF4VfCUJ0z5i09ziqWK7a2hG0Rbzpqtbq+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759448;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
	b=Bsl3IbHdjm+jy1UHZSBNKApsESeHMWfF7tp/7h5OwvfGl/8WEiFjOiWDO1+zi30JjF9T
	 73SyWMkstS0M/hbSh1BX7KZSsIjQz6bLvgAu8wgqDHBcha6gRyDzg9I2YczZnZ7nJmt6W
	 eJs7Qkq/KwR05N+5XGgUBp/bV0/TbYfa0Ua1NeaYdIRtMCwqgGfN7G7XGh1C4xa2bQci/
	 JpoUuPgwcbck62pCMfD9ghR1/H2f9IzLDYM9C8mSgBKxm5EQuxStqEGqLnWjurUnPKeGb
	 f9lUnHV3J3QDdd7D338kteazTz/qxjTE0YsMtdNyZ9BNI1UG5sOq/fFNWZzkJa6i4Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOLzUgb+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUtdR1EZ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6497606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:44:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6497606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOLzUgb+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YUtdR1EZ
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZV62509114
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=; b=EOLzUgb+E0uxQT0f
	8/QFI615gs0NK7KYqfejZXLYKOyB7OB0560XRPDD5G+PUkYnVJwx5zK1VpNCLELR
	x5b3blzv2BlAL15emEihOb9KX5SnTu7lqNYKhS6lW4DXqdVX68Wt4UGLA9nWvTtg
	RiIs4O/fp6bnL4JNSy3BXcxmEvZ7FTMJSOUYNWCYJqSWKnyE73dYX9dpx9dz6q7n
	LdNWCPVCQtSkQwpNuzXzZhQJDMdM6Y9pThf1tS/pFV6DRwfkYwoXXttuFWvTkxa4
	aB+5iS39UsgXJqGvZJZK4fM53PstW2etw4VLf7x6wWuOY8QToWB55ryeb/Eztc+W
	cIB8hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykb46c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 12:44:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cac495d99so16249385a.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 05:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792759446; x=1793364246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=YUtdR1EZJ2qtHJMeZIlXHw0dwBpU63L5eyKT+3uPVjUVX01CjzGU44IKqnr8C+cx9C
         5ZWKJap+2WvO+0jjAqiKa9D4xOGpbpwVjOAZCq9LFbEz2lk5mNmRIHz1/tjGEsKmPZBz
         O2yDCYJg3OXMForD7rwTPUazHDogO5EH8KBLMhRaRkIgQm66srYzGqccjPnZmZKHuIT1
         lAbInAq3kfLUVNGx+Ruo3XG5TyqG2mBGRso3/NiIaV6vBd61N3SZMqueE9msOaklYdbB
         Zj1/g2uchzWxE4U+/WiiognjDC26343iVM0Fnypl580E3w0d2dY4y2lx2gt+qCDdfuM0
         KPVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759446; x=1793364246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=TFNWH+7HVkUJGJPTqvnyGYlNV7PzNvKfaZ5NEy1j0Galh7h5zpmzMMHjuAyynwG9KW
         gmw8XvA6g08nNvlq95XWbQD6so7i6ZWScG9aKIwdZkaRDt6ILOCnjIRP5uumRkr9QRF0
         zmYoDRFjEAxYv57DrM/17/8XixiiAJ1+cl1un5eHgy5hx7DoiRBvWoxpm9waX8EAv2zZ
         blFEbgnBkyLam1EFytY5GHdonPTlfs0hseH5FHbpoBKm0EotUPr0KWhSO7zK8zn+NuI9
         MrD6TKZsdH+z4Cotv9gTsK9MTTskDrn1Z2f0RGtqLGQdyfkBaHL/JLkICnzlTMQxrbhu
         lx9Q==
X-Forwarded-Encrypted: i=1; AKwUvBybACHnS6Wzds1XPabjfxoH2tx84Avcw1ZP/ZOZwgqwDhtXmLXjkUKMwNKzOokTHWJEdGJWcRDCQ9tOlKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzw3/h+d3uSXzkydoasnZp3EMmbLy8AGnJaXH7/b+DOBO87STw
	IVwzKjHpOUMhXPX20JRP7WPziqIgvzTIPqCq+BxB81LVpear1twmX/CU0+OPfQRlwWazgs34W7p
	6Tnz8dm4LmqIsO5Nzv+4QmqPQHfDKM/87s5pbTKYrHzgn3VTjRBRiZgthl4HuOed2sNk=
X-Gm-Gg: AYBFou0hnfCjxsFM0ptpKJtX7pvX0kWFvmcAMMnTB9bFZ8WNDcELxgUckCZqQc0Wsuv
	0r+jh66PeI1V4/gyJy4EzUBTFkBGVTZO/ud+exeK/88xYyUFUyyfVIOf/i2aF37O7clXJ5WCbTe
	bnbKMNJhnTXufzJLYIbTowXl9LGab09LYmLAHAd/GpIExF5YOUMlAZVM8Js1YG6deRAnWIVCfEr
	ll/U+3KjjCXlp5vNNY8eDH6xtTOOqnkbIuWqNkCZ5aPaVUE79N0rLPdMIvHVKTeIBngXVTP9w0Q
	GcioglzAFSsI+WpS5Iqd9OogH1gt5mhODJHx5k4VqtS2SYMZLdmye6QREY0Wc9xCvV9pNlxnGFJ
	AyET1du5EAIm+Ivlr7aSSsQ==
X-Received: by 2002:a05:620a:564a:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f6f936070mr411659885a.4.1792759446069;
        Fri, 23 Oct 2026 05:44:06 -0700 (PDT)
X-Received: by 2002:a05:620a:564a:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f6f936070mr411654985a.4.1792759445506;
        Fri, 23 Oct 2026 05:44:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c7d0b7sm100365266b.43.2026.10.23.05.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:44:04 -0700 (PDT)
Message-ID: <4455607d-53b1-46fc-934f-7e7ae8f4f3d8@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:44:03 +0200
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle
 states
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com>
 <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
 <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX1sWtKsjkATFl
 p1OI69xGKJkrv2og6x70oEYKnqPS5mRGuaj2Y6IEDk/UiaT5gmK4v5V5pDVZmA0bJX3JraRkMp4
 1FaiAZI3GdZ929glCQA2rV0TRj+29cy9gDsDvblDcJ5U1UoMNhNCphCV9vLnHKr7VZBHv+ScMIX
 Q3y3AxeF+elHfe4rOEwrtH/S5BPj+0btJ/eoaSTMqK1ej8oy7extQtJeTAMUHnpJccQSR1uSzFP
 XnNw6QfbaYKcY4b7j06Ov/F/hoY3tg5q8xnWA2S6vrBBGx5oDZURsDWPcoEai9X2yxKZVSQ7MOb
 Sb2q09Xnp0tqyZMq2oMHvchu3SbgYd6j4ED0yhzcfu2LSJKu9FdHOPlUj1zt0mHUx8DcC4znVGP
 pN1gERst9rpnqU1l/dqQLY0BX/W5p5T5o1dqg/h1FYHpW1DXL/9tv65m3pMZDW/0f8u7XFrbw4G
 WL5xDtnEZGveV3fnDcQ==
X-Proofpoint-ORIG-GUID: JTSOjVbVONOA3Rod-rr33eUBLkd7DWaM
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfXwA3bHaNLqVav
 TkxswxR9ItQkrQkXpPoFYGL+i6/nDXEUfqdQdPUr9KmmnLRIz9yFn9XqNWA0n1akwI+dgpX0vl9
 v/whGV3hzKXUKoMb00gtibLYyXta8bM=
X-Proofpoint-GUID: JTSOjVbVONOA3Rod-rr33eUBLkd7DWaM
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb5697 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2CUSOdstmcgysknA9-EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230049

On 10/20/26 6:15 PM, Fabricio Akio wrote:
> On 10/15/26 3:51 PM, Konrad Dybcio wrote:
>> I threw an LLM at the downstream tree and it decoded the states to:
>>
>> C2D, no cluster state    2        0x00000002
>> C3, no cluster state    3        0x40000003
>> pwr/perf L2 D2D + C2D    L2 2        0x01000022
>> pwr/perf L2 D2D + C3    L2 2        0x41000023
>> pwr/perf L2 D2E + C3    L2 3        0x41000033
>> pwr/perf L2 D4 + C3    L2 4        0x41000043
>> System PC + L2 D4 + C3    sys3, L2 4    0x42000343
>>
>> sorry for getting it wrong years ago!
> 
> Thanks! I had decoded the same values, but I didn't just put them in
> place of the old ones. This firmware supports OS-initiated mode and
> refuses platform-coordinated mode ("psci: [Firmware Bug]: failed to
> set PC mode: -3", PSCI DENIED). In OS-initiated mode a cluster state
> may only be requested by the last running CPU of the cluster, which a
> flat cpu-idle-states list cannot express. I tried it: with 0x41000043
> in the flat list the firmware returns DENIED to nearly every request,
> accepting only the few that come from a cluster's last running CPU,
> and the idle CPUs spin on it again, at about twice the battery current.
> Linux runs OSI only with the CPUs described as PSCI power domains,
> with 0x41000043 as each cluster's domain-idle-state and 0x42000343 for
> system power collapse above them. I'm working on that, but I'm not
> sure yet when it will be ready, so this is not a placeholder for a
> replacement coming right behind it.

See:

https://lore.kernel.org/linux-arm-msm/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com/

> Dropping the states is not the complete fix, but it helps now, because
> as they are they do harm: cpuidle records no successful entry into any
> of them, and since the deepest of them is what an idle CPU picks, each
> failed request is retried instead of sleeping. On the Moto X4
> that is about 133,000 failed entries per second with the screen off,
> and the battery current goes from 277 mA to about 115 mA without them.
> 
> Is dropping them first OK with you?

Temporarily, yes

Konrad

