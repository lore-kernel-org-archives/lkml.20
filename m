Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717598;
	b=zCG1QMwCnuzItrpRw/sJe1IpqDjByESjeVY+H58JdlBCzNVokLb494+VJnNan6LRmHkL
	 v0gvzShXUH15hq7GVB8mmJ0KKdd7twfy/vG2r14qQ2WUGtXLS2qPWpC2TeJMYUgm2dDds
	 ekf2G209IO1OZMunuw+I/o94/jljlJ100sNzU0UOGFU/YS5gR7X9rp5TAFyoYqVd+5754
	 251AueFdFIo29EeBrJHRKNAIz81nced7x3WVr7MBiHw/pI08Lh8kU0ycz8roJGTk77P4O
	 bYNMyBodNtqzSGgLjBPolfE9gH31TADVZG+T3YQ1DiXpF6qMeeveLOnI1Gg7AO0ZKzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717598;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
	b=trBn9jG1YFYuSLJBA1kNjx1zPsWy269OZE4B88Po2u79FCY1FD4W5Ad5366Q3WSRX9Sm
	 oDkHOWUYfoGyd++D0AbY8IpXqode1XFhiZO0pL2j2YCTQRl1iuaJqVKTKYG0bt6TYPG7U
	 RJoOoKOzLG9yN06jtWYZHF1LSsfWzQ76LLT/gKIc4/SnQiBzpyGlfqL+bD6r88pt6gCev
	 kzwxl56IHbycuH4nJ6ngrDPTPdxvJGGpJwxhAl0V+tSWIBkysJJ95W/ChtJfxwXSyDzJg
	 EqdcZSe/uKJkeb28eW4NcpJg08nzsiihXYo7l0g93PbX/EjNuj3dm5iNuBD6irZ+6nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bnIxPimD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E002nKI4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CAA606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:06:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CAA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bnIxPimD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E002nKI4
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MMF6f82012794
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=; b=bnIxPimDxayqnUXh
	GL1+VNL7lausi4gGZLDFEgRk7OH66jnQllF24jrKXDHFdt7eCoXO/rVsl+kJO/Ya
	plgnq1OPZR7X7XjK2fHrOGhdqM/q2Ic3PdnmcRsWRW7v9fj1rpQi/A/P9oNgt8WS
	UAdeOLy1239U69RmscIvZx/0LEQYDONepK0OTNmVGE3fA1ZbejHM3FOmOZxbmycd
	zs3l7SNqrrVf7wyWVsuT6Wb2CrT63tUupeEEZkyhzvAVjwE5hbIU7BWdzjUybgnO
	77wB9wLBFkW3xYOUs2CBgWjorzITB4cD1uynoUVMNX+u7muNYerXM/pcM4eFbXA4
	Li74sg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmp98f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:06:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so960839eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792717597; x=1793322397; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
        b=E002nKI4G7M6QqefEkRec+t2NOXaCXOBuFspxuQo3yxLyJVEti7+GfIZSvwaB088wn
         hA3+TY1K8HyPMQEUvGa/5EeoWqJkD4/iMNkGNrYdAfxtncHL8Kj5ffL10t+D2QU3q5P2
         /vVXGRU4CmZV955fjc7ogz9C0+I4m4DfkPtCMy52FtYeXjJ9coK4FPxQ4oRxVmJvNID5
         gXVUcCxzDcYmp0r6AetlA78SHnfxif3o1wCqOgqgXYP8RwSk6CuTcwrFU1nRHz/5iJ66
         QF+jj5yBY7wAnxbXVMKvF3EnnCSXKU+NyG4cVlDzxGtABj7kQ4Goa5rvFrb7mN55dOfr
         UdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792717597; x=1793322397;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dfuW0wNWB+8VJLorrjVBoDy4Ob+iKOb6dWhlcZAnFYQ=;
        b=X0/IrxbkEDUwscOccjQcsGKZ+3A1EQLQsf0JzfhZ6Fk/oBaXrvEdunDZvRCGQSTXsj
         c3tl8+MoyjgVOMVgtGcZN8IPjQ42/1ueQss9UGSUmh9MTtnNIKvGW8XcvJ2TRw2n0o1K
         8Y37yMt51evkiIcIKnBxdkyvf3CHpqJ/OCjCE2IukiMQ3Y5Bl0mXVk1+J284rdYzfkWm
         wI9b6x8xQN00DeIPG+jax1zKheSZ0/kuiCqomKqz+FOu89TpSB0HLBqQ3Fdzvsl65wII
         inGVplRmlXuddfG2RKjqcNlcfRIouU69jdFDXIpeouE1yCnDCqskiJ0SIfQ4JT5SsZIy
         Leag==
X-Forwarded-Encrypted: i=1; AKwUvBwS79LU38njkic1pfRJl7wSbK6fxfF1yZt+zksKumwyb0/ylnsx0fiNwe++VDSZAr7qLA+UkwF4hhn/w0U=@vger.kernel.org
X-Gm-Message-State: AFq9FYJz0dDRrwbXuaQ0jLLz2X47f56bj+Pv9KccDw5Kcv8Ztmk6Qvtg
	I2iyI/eeJRiS8v0R8kYSd5hxktSCghPqlucGrIjQMiCjaGHsLc6lXctw05vSGdov2cNlYZB1+Ga
	DxcJKL7FOa3c0gWhYwVSI1wFnNyH5Iq4QV75ssipvd8n9awH2IAbOLjQcktTIgg4HHUw=
X-Gm-Gg: AYBFou17mnxULrTR1rGsDjx9s7xSVO4mG37Qg4RtxWceOKbJl/mGiVrDaRZk2+CAMYI
	1XoHu9+b+OCbTSQH9Jj7hGeLSKdD/dK6w3qb+89rk8GEOqHELhP+RPBw1nK4FkKbhds46f9FrAl
	z/ON9n5DaaH059tX7/jkl0VeWgEPaYcq1KXOouT6SNqhbX4+KI+evVjn7Wk1G870na3PxhRPNOy
	ne6pF6gK8+DQpfOOWA3nKTmhVg9TqRbwAPwPv6aAbAWtxFx06FOk2c2EKcwnWgy+Pbxl1eX95uH
	kYleTSa6PAFxht+zcG2e4LluJeXM0G7esksbLlkk1nI23InvjWc3w/KuwrfewXDnaCq9m3OZUpR
	1uRjy+in3/d/+935zIJFlKV6179JmqZ63z4nG4/jGTWxAiGgWSn1vUU3a
X-Received: by 2002:a05:701b:465a:b0:195:76af:b810 with SMTP id a92af1059eb24-195c5cbc3e0mr1043944c88.25.1792717596490;
        Thu, 22 Oct 2026 18:06:36 -0700 (PDT)
X-Received: by 2002:a05:701b:465a:b0:195:76af:b810 with SMTP id a92af1059eb24-195c5cbc3e0mr1043913c88.25.1792717595831;
        Thu, 22 Oct 2026 18:06:35 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195eb9afd61sm1877551c88.14.2026.10.22.18.06.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 18:06:35 -0700 (PDT)
Message-ID: <7a593e23-3f35-443d-9ae7-2ebc031d41c7@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 18:06:34 -0700
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
Subject: Re: [PATCH 1/3] phy: core: add generic MIPI C-PHY configuration API
To: Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, vladimir.zapolskiy@linaro.org,
        loic.poulain@oss.qualcomm.com, mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        linux-media@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com,
        daniel@quora.org, konrad.dybcio@oss.qualcomm.com,
        christopher.obbard@linaro.org, alex.vinarskis@gmail.com
References: <20261017041733.3946816-1-anusha.nandi@oss.qualcomm.com>
 <20261017041733.3946816-2-anusha.nandi@oss.qualcomm.com>
 <a6d8514b-269c-441d-b280-4895b5f21fac@linaro.org>
 <xGBkVr2J5eTHzEO_i4LTjdWGRO1MXGiIijMf1PGUbQ2gEYqffgMDMtx4uiNyBldbbiW13zmcxMWZYYjJ1s--Vw==@protonmail.internalid>
 <c6d963f5-a57e-4086-972a-4f04af2c5b42@linaro.org>
 <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <324dcc61-6085-446c-8bf7-564486f319bd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwNCBTYWx0ZWRfX/DFwW0p7Shsw
 roViO0aOYORIKXnZ9mFzl1tzDJ04IcJza0PMndXGPuoFUCcO7a052LwQMmoXXuiminxaGnO/cY6
 hy0ZnKIo5/LqWAm0unWTZaenJwE7K8s=
X-Proofpoint-GUID: GfHwRW-e_R0_svJRScgLnumAVHTpWq6W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwNCBTYWx0ZWRfX35DodpxSot5z
 A4iH1JVyNhCg8CRsr6zjNFSZAAmqj8rl9hLIrTNWhGNWaVaRshjIyF7d2+F2dvJCgO+QbNvPXfL
 DbYyvClndJw5VK5TNQ6zoxF+v7UK+DAbhbw3avRXeUVPBPc9lPx4uJUpKtFk5nj3vxUZnz8VB3f
 uV5K02qvxbHT4BAKJ4X5eOJ2AQNOuE75faG0R3yRzv3SKDk9PTRTPs5DoRnogMdaSx07QBcGclS
 sLpAR2ozQJHbroFvxcqppVuZ188fab1iL/Hpj8BWT3L+QZUrLskK2fXHW0u9AHG42vWMaR0ywr8
 8Ue847IiZhrMprR6J7u7kkXN7t80LuP4IQYvVMhgCeD/lKvi3ETcuGZDF/CT9lAXu1iK+a+vCh6
 /8bQzSwJ9zfi3AHcDLvbyeYeheQgnAF4rgvZEaCSG9IFqcmNaqIonFDEMTaZEPRbXS6FnXjKHks
 OsvcpOp8KFuBkBUc5Hg==
X-Proofpoint-ORIG-GUID: GfHwRW-e_R0_svJRScgLnumAVHTpWq6W
X-Authority-Analysis: v=2.4 cv=BdBNQbt2 c=1 sm=1 tr=0 ts=6adab31d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VgxvMbUO6sPQWDWUjzgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_07,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230004

Thanks Bryan,

I align with your thought process. We don't need
- lane_positions
- lane_polarities

I will add symbol_rate and fill in the data appropriately.

Best Regards,
Anusha

On 10/19/2026 4:24 AM, Bryan O'Donoghue wrote:
> On 19/10/2026 11:24, Bryan O'Donoghue wrote:
>> On 18/10/2026 00:00, Bryan O'Donoghue wrote:
>>>> +    unsigned int        lanes;
>>>
>>> This statement and how you go about using the data aren't consistent.
>>
>> Re-reading this.
>>
>> unsigned int trios; would be fine too => data_lanes and lane_polarities
>> is a multiple of trios - always three - does it imply that the first
>> three entries in data-lanes == the first trio ?
>>
>> Presumably.
>>
>> That would work too.
>>
>> data-lanes = <4 5 6 1 2 3>;
>>
>> =>
>>
>> trios = 2
>>
>> =>
>>
>> data_lanes[4, 5, 6, 1, 2, 3];
>>
>> trio[0]:lanes == [4, 5, 6];
>> trio[1]:lanes == [1, 2, 3];
>>
>> Probably "trios" instead of "lanes" makes more sense here and the driver
>> just always validates that count(data_lanes) % 3 is always false.
>>
>> ---
>> bod
> 
> I'm going to argue with myself.
> 
> data-lanes = <1>
> 
> =>
> 
> lanes = 1; // not trios no need to introduce a new term
> 
> =>
> 
> three pads on the Soc
> 
> =>
> 
> The question is - is data_lanes required for the CPHY opts struct ? For
> the qcom CAMSS case the answer ~ always no - we will be attaching a
> sensor and will read-back the positions from that endpoint.
> 
> It is conceivable that other systems may want to pass data-lanes down to
> the driver because they won't have a media-graph but, I'd say we should
> arbitrate that then - leave it up to someone who needs the fields to add
> them.
> 
> =>
> 
> lanes // the CSID and PHY should agree
> symbol_rate // so both the CSID and phy agree on symbols per second
> 
> Remove:
> 
> - lane_positions
> - lane_polarities
> 
> Since at least for this series, they won't be needed.
> 
> The CSID still needs to know the number of lanes and how many symbols so
> that it can calculate bandwidth so .... lets just include the data we
> know we need.
> 
> struct cphy_opts {lanes; rate/symbols}; dropping lane_positions and
> lane_polarities.
> 
> I've no objection to the low-level timing variables myself but OTOH we
> don't require them at this point in time.
> 
> Perhaps drop unless/until someone can show a need for them.
> 
> Excellent bod, agree with you now.
> 
> ---
> bod


