Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870314;
	b=P74OK95/N5fJi3sskE1flRcWHR/KSVOUf2rS6wSrslNas0Fxr0HsFVnesU7uHSoh/cj/
	 5pQpV7nwUNRXS7BkK9Fw9Erg3TWgLuIOqYxB5AyT6wl0Bg6tHHu3TF3aVa+8qPZOMLlSq
	 YUOWSpGvPaVIkkItyKscWRPZHoxjUphp5mUuX850Us7EBDQZyqgnzUoPYCBAYFAW/21xw
	 RYsSGHBTIz2p2n4wZ4nA0MtoDeemtDeaZne3OXLk0pwVpiGBsxaP1gwxoXLZ9G/0YC4hs
	 A/5Dvpxs4FC8WmllscjkiGR7ayS2SAPDb+eO0L8AGyuS1l4ed7u+QHwuDve50MEpKrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870314;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
	b=SjOJ8zSxRlWjPjwMnZV67xxqDARqWDNy2Lw/IfPFKqhACK5l/DhNWhUKqkKW6j0Iqefc
	 z2/paW6QEX5yBuV+LXiKWbFNb64tf0vHK427lf0TpCijy9i8MT5s1FhWiMDCMozp+W82B
	 R/LbL+tUMve8Bxk8zyFem03jUNLUcaa94EAgnmgsTUWNkMf5/tUrn3JfjWy05l/PTPNCb
	 UXuWNbrAj2cQ5Fe17yw6ZXD/QTXUDenvoGhlV2hslehHMeag+SL191gMhfG2YYfy4ptkP
	 X9UF9ebLpbWRKGzn2yeA5In+42CwE+hc7oe7fas27stXWspf6K9kDcHdmUtA6JDVeag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EiZLXGt1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyQWOc3p;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58935606A33E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:18:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58935606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EiZLXGt1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyQWOc3p
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59HM0l4194077
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 09:18:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=; b=EiZLXGt1hJ/xxiV/
	sN1+jAlyHPZbyj2AacOxHz1eean0ky98SRnWvdsCNvEgq5ta4v0sP14YT+Y23/oA
	E7l72eTm+TibUI+BrqviZ8lDF4CiKLUH7dTIGqDOUHYd3C+u9tPwI/PBvUanKPTq
	oQykZpwTANZXI0r9kbNkDHzm+W3sx8IsvZCjN9+gKbOfzdVTss2VlrlsvVEEYbBq
	TA39MNHm3DnLtaBGky4aE1sCA8LWGjW95z1XlA9PVc4uFU5uHwUfUU/ToESV4OsL
	Pt6Rhl2W+/WcZLBmNKrxg/ktw8yszXDGgBiveW3kJKEPj9uEWzd/Q9floDSh+UjW
	A7tO2A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrq1p006g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 09:18:33 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-351788121cfso2103077eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:18:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793870312; x=1794475112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
        b=UyQWOc3pZn/33nOWjgNlnzJ9xMl1aZoosvW9ZXEBkwZwlUJkvhLNT90vFh1rd9DqlW
         cBT5jFjnI2pVWLNbqOTDcPhTlsBeQT9LR3L0kh5VBtdB7exSXZV5ej9QdrmsCX+7tlIz
         F1Gdxjja3iKjAWQG2iF2U8WV3w8f5W/K5dNigQDARkbvAVDp65gKh3OYDIekRqcNuFat
         mqHlA0rHm/pU49008grbjG8PEt4eL3rJ/3Zjvb4Ho2GGg1zOIMhEEV5r2F4drxf0/A7J
         gHBIjawPPxSrnbSrOE+Ixpdl1RB4g4PZynD/CTGfHN5etFG/UgxzjO1eYBJVXb6Ghw0E
         ScUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870312; x=1794475112;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nu5Ld/1F/rbxABcDcq4NdZ7MxtKaTOVEMQnSf6SHCkY=;
        b=AmrDY4NyTW/1HUTGyOCT1KcPk3xPmnvgZUcI1w2XJoukzsZnfyHw/p1EQeBRVPQZH2
         nKoW4nVz16kICdX62hJz0jsd+yb5UjXdiEavcIHPV5h2CmrxNP72TpET/FHDLFkO3D2p
         HZ5Ati2tTReZ9ZjrffMxdbf8N5s09aWjLnN198O0IO3ov7j8bDuHiSK8kI2Hyu7liwoc
         LRD0iLawIGr+ve6li0zvqBelTacMtx42/ZuVKik7upy0K7FLF/aGvY4hFW+s0HHx6qIZ
         OcE+x7rnYKtcma4OWA29M9nPP6gs9mPJPqy58O3L1Nl6s3zf4EkeKiw6HufJ1Evn1/Oq
         kbEA==
X-Forwarded-Encrypted: i=1; AKwUvBzVeRHI80bluNaVWvHOh/7NWtxr+RMheRkVxCvz7NVOSD+zmCHVP/9Y+fYOuuJmN/XFxQvqBPf3LT5wW2g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/MlPvbO+vY24MBDVQrJ7ch7L9gJ8xTmH2MeoqaqJuTgntZ+4A4
	58nzknxy8gapCHkL/1XCNqsYxhtPqiculKZWpzpUwDAWuadGixgk4N1Dqu/805VpLCI84UzfYcl
	mMk/qasHDbSJMXxOSFFdIfJpyl1YmtArTCYxag75kPmN+AH6u88my4GADuIXogBpHYYI=
X-Gm-Gg: AYBFou1he8wwsMlTIphKPp9e6GVujfZvrLNJiypcx+/7V6HkrB7t+UVvl9pPTft62Ts
	vYv/cr42xVaAQpXhG+h8ha/wXOLNH3V/l7TRKp8G0SjwMcWv0BN8VVjjwlJS/EJUMmerZP3zW0r
	IJ1W0XsuQhpJ/O5iht5R51w65uZW/KMYfVOqJgLsg+iOOE9R18Fo7E7KZK7aNs4uNfBkT+E4VS5
	Bbc4xPyTisac+6bhqTIeDQoYr9dpA7FWMy5W4Uu8IkueijikwYgno5bHIWEK4LeEpEfOoaugCDA
	rIrHFBNwbzSuxzEdsSllHdhp/7TUecHBalN8Veqca0C56/ZBtFGgV7sw+x4+J2wxJbYRp/xll0W
	aDrTp+fbqZBJYcEgXP26CXd4HK6BAD7ypYmPkTQ/G3QVr2t7hQxgJsvxxCzUsGF1r3P+Qn5JwPq
	Y=
X-Received: by 2002:a05:701b:4594:10b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b2559b698fmr593802c88.26.1793870311799;
        Thu, 05 Nov 2026 01:18:31 -0800 (PST)
X-Received: by 2002:a05:701b:4594:10b0:1b2:559b:67ed with SMTP id a92af1059eb24-1b2559b698fmr593784c88.26.1793870311273;
        Thu, 05 Nov 2026 01:18:31 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c4706bsm18261870c88.15.2026.11.05.01.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:18:30 -0800 (PST)
Message-ID: <539842db-c672-4549-b861-4a6f3be47556@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 14:48:25 +0530
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
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,glymur-camss: Use CSIPHY
 indices for ports
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com>
 <20261102-glymur_camss-v1-1-fcb619fc7319@oss.qualcomm.com>
 <20261104-real-nebulous-ostrich-017e92@quoll>
 <72064a9a-1b2e-4c24-99e2-2cc15a8dd7f1@oss.qualcomm.com>
 <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
 <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
 <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <fc9acaf2-f214-434e-bbe1-88e8e1af7683@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AaYkjHXG c=1 sm=1 tr=0 ts=6aec49e9 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=Ck8ZG94lijjEDa-JwdwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX2w3WGlyPbNoA
 unYWSfej7tGwqBpa4Ag6go5wPAIDYllakpuEcRjF7Kit15uNRrPvHBGXd0R3/cUqK18CUf0DPRv
 47VO5znaO4Uo4/XuRfprgTR0ckV5fKQHA8Hrlw99z30CYMwvFvyhe3vnyrztOzzkfEDhVzqrBVb
 GoFWSa+vxryHmxCEjLLpccavEiGua0NSCeqcy4hecWj5ZVVgqQn/FSe6WEy49yh8E4vhPdGJRqm
 Rj/qPpVwGItd52eh7CFThNB6TEE7OjNqFtpMv8V/amSCgkqSlCTcxLwo8IMYrWzH8iTbDRHMTC6
 6RQHunJbyydqCXJ0U3vFoNrUivkmnJTyCqQVmVOW3zTLv8hplvqPyY4fOikIPG7kYdTe/HeIE++
 Sx8DO0fRstAxQHX4d8T0jO/TcT5NRp7qfn1NT++r4/qzyH2IFiiuA5JvHqo0uqEIL37dzTWfIvz
 vMyKbiaiHU/DgWk5LdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX9aSc0Cec6M1n
 CMscg+wIy0GfE3LI7kHlE9ZFQLp6pv7S+8LuCNcSqQsoy8kaofcGAu7gwz2PBG0iDJ0N/qR6jHE
 k58pBNM480kqn/LJANr4lfTdbljJZ8U=
X-Proofpoint-ORIG-GUID: Sef5XrJlW-LvZ4DtzI1kNyrr-O9FmiXF
X-Proofpoint-GUID: Sef5XrJlW-LvZ4DtzI1kNyrr-O9FmiXF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050036



On 05-11-2026 13:03, Krzysztof Kozlowski wrote:
>>> What is the problem exactly you are solving?
>>>
>> The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
>> graph should describe it as port@4, not port@2.
> Nothing like this is explained in commit msg.
> 
I will update commit message to explain it better.

>> The previous port@3 description only worked through the X1E80100 resource
>> table indirection:
>>
>>   port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4
>>
>> New standalone PHY path:
>>   port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4
> Then this breaks existing users, no? Anyway, what stops you from having
> there proper mapping?
> 
No existing upstream user should break here; this is still part of the Glymur
CAMSS enablement.

This follows the earlier discussion that CSIPHY4 should use the
CAMSS-side interface index as its graph port number:

https://lore.kernel.org/all/CAFEp6-23L+4+yzVxX815ZA2x1_tN8SpzL7ciNcb9b+gBT67AdQ@mail.gmail.com/

> Did you find any existing practice of numbering ports logical numbering
> in this device, but some other logic coming from datasheet? Where?
> 

Glymur has only CSIPHY0, CSIPHY1 and CSIPHY4; CSIPHY2 and CSIPHY3 are not
present on the SoC. 

Using port@2 for CSIPHY4 would require a Glymur-specific port-to-CSIPHY mapping.
port@4 describes the CAMSS input directly and avoids introducing separate logical
numbering for Glymur.

-- 
Regards,
Nihal Kumar Gupta

