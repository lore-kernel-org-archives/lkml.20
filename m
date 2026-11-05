Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839746;
	b=zZTeKlPK6IkR3N5Md45QdvETRa+GAdBes5VGBkxtligUCTA5ucBJhVcQUf1wDV0n1r+o
	 /jEqDKwkgfChEsY92+ixRGOy6AK0efsIMFJhYijevsAHFXJV+vrVTRoGzMPXuSb7IPl+/
	 2uLyB6gsbCBtUNW5FQPAzzYevtmp0P2j7B4ZoB20KJuP3XLBw+qeEUYDJojnHcROYumz4
	 b1/LRQPwcNC2c8wVv6dEkVdYa/wb7EJ8YQAGgMqIobmrIgB4FuQLao9flaga+6+veyy8A
	 JasAAFqYs51hBBmsrBkUbIFVO4JeEHF9EvXPk60Ejz5bSqTeGNS0rbSlpXH1W+KwHfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XqAWGD7OCucT8InwBEeCfRvI36YPHr11mO+feKHi2q0=;
	b=1zpBhFXIA1kQo+/VdI5733w0OIQoYqzdTwiN9EVweF6U0h8LTcAdG1XY6tyD/k+Uaxn0
	 GeraTgXRC4nCL+Vb4ou7deekU0tfJ48hGgIbL+ZCbJc77EcC9j/hAjRFFUHwS2DY3OwPf
	 pcgbVFQx4ZAyp6KSbiKAJzEKfEbNfQ5OkcrmdrIDZWm6W4HoJZuDYS6K3edpeQo+RKqzo
	 MLOeyNgd1uiAgnkdBd47GSJC++ZLNKcWgdrMlf1YmaRVlTQcpuJLClYNSYXrZx0aKn5AV
	 T4pm4Eau47bJe4TjvjZy0fLGeRzIFSeadolorB7vIPcJsbvzs+qYpM0iMrJ7/a3kFOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mi73K9DP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5wBzvAc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1A606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 00:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56F1A606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mi73K9DP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5wBzvAc
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4MCpDk1292298
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 00:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqAWGD7OCucT8InwBEeCfRvI36YPHr11mO+feKHi2q0=; b=Mi73K9DPa6E7vBkJ
	bQdUeEsC2XXy5CzNcLHD3Is9EV+IokS2ni3s4O9NDJfPlQC2GyzqrcKzQ9y+nf+0
	j5KXnB86hJEjKK3EHX8U6UDsMb7kIfOjfgk6VRxVgl+2ZZzNG1NBd2nkwOAI9ZAy
	YjsZR8I8Os4w3d0kzitHAUtfKXzVL4cMFwnEPtHw9472SQOA6kJN1qjO7+9OT69u
	9svl8dDf2ba4LBV0i/En4Wpz4gBxNd6+DJPtDVtVEJnhMYiI6mFMEbaBBym0dfJ9
	l2TXtDKFkwIyXBbc6kmu1eR1Pkbj3l7mGogT1thHhQbgEsFdZ8seZvR8x/HyMA1H
	OU/pTw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr163kstw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:49:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e94f72fb9fso12832575ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 16:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793839740; x=1794444540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqAWGD7OCucT8InwBEeCfRvI36YPHr11mO+feKHi2q0=;
        b=C5wBzvAc3rZOpG2n9Kas/K1SHBOFInIzHAGLiYaOLMeB8WokpUsDywo08dUuYPP88+
         1txFpS4lZuQJO20FGr+tMGCuR9b27BSE1mmHOTwY0BDzCdsKrj7gqhT3E3kgsWcgQjDq
         cUsY6S5VAkRGLqJmas9uVAW/0g5+vCxZ3+UjPhrrgqUf/A+TNsVDKKy/nWrKgA7QALEQ
         aCnkb+gw88DMxykwr09f/T1g9wHuEpyhBmm1BT3CSikU9VxKq/RPSYxKjvgykMTKXOVo
         5tbVKoWe9JCMCzfx8/pHvJBoQbmVGiwrcDS3nfbVvogvRxWsWVRgFQ4B9UqUjnneNe9E
         wYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839740; x=1794444540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqAWGD7OCucT8InwBEeCfRvI36YPHr11mO+feKHi2q0=;
        b=2yLq4rajgoUWVbWm0LIyc7mW/InaQJWo2PqxzK2+LzBq0SpCLgHEbH2MkKNluHyVt1
         c8mi7sIUm3zgCvS3w53OHCtDxdTpMv3ipcG0fTF7D8P9RG2A0Q20RNehgUo/eOZBQSbg
         taSnEB7jv+03p6f7qaQivwjU8OEnUUk0QI7lIVUGMAj5qHPjcRhjbfcFbFHUrWOJ9rhk
         +yR98/Oe7T64ag/QYIFcKbl0ygTl+Sha8sNe89zJMyYy9ErOCDDLCR886g9y3hhmUL5C
         9/2kkUHlRi6n1As0YXzqopF+1blWtHteELr1HKkbBwbPFZHIhWReln8wfVcV25ny8Orz
         ma5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzZVwtDGnzN8sj98Xi6q6CgOKbnFp69MFDj7iftFfbLABucA9XIji21z2tawFHfPF3IeTZETsYmQcxY29Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iw92PEoEboGoBnSmQpewSGjDseRiME2n3wQbM+ATU3bv+xa/g
	pivWCmPuQh/7nfLF/AAaIIKgAwJd5oMPMErcacsDQ/nlTufxhDIOAXBwvZsgwKCfZ4qre/c23Sv
	XGIYnDYCR15BxguRIWZ3xFTLpIIj1vJm00rKeRfJA/1/S7D+8o72nEibD4g1J1LBiAnc=
X-Gm-Gg: AYBFou39c66zOKsdS1aB0XcdlTyTisLfmNpVn6xUGWa5A0f94H+UFgTaGg1gzoRG6nE
	Bt+9kyFAcYrRJ8hLf7XbTTIc9+w6hJMN6nsnl3ukDgZJnwaNcEZcsNlF2bsJLAepDS08oWDw4sZ
	VNmP2/4qqI8h+GMwzx4k/B89k3p5GxI7cWuW/qX3mfzQdV2ii577R5Whv/OGEBLexvi1tXWrViK
	kezmd6uzpkD5wYQKuBwEl2T9GHuKzKGcxcHp9JveBSCoSAenEG00h8Y+K7zp3xVZ2AuGPPJMYkH
	cRrLjDfa3Ka9vyuY7MHJ+kGzv2PXhisWLTw5pcx9J1IQeBRyUxfxbrcBx+qEdP6Ww+5havsDzIx
	4mRnMuIt7KdjXPOdnJmA0ET2PLJ4D1BI3xmW0m0PBvvcHGioXegqKCi5eQyQORPhF24mSb1j83A
	==
X-Received: by 2002:a17:902:e5d2:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2eb364024ecmr175302825ad.1.1793839739703;
        Wed, 04 Nov 2026 16:48:59 -0800 (PST)
X-Received: by 2002:a17:902:e5d2:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2eb364024ecmr175302605ad.1.1793839739240;
        Wed, 04 Nov 2026 16:48:59 -0800 (PST)
Received: from [10.239.155.32] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091f35cesm11791855ad.71.2026.11.04.16.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:48:58 -0800 (PST)
Message-ID: <4edbe80d-f1f0-4e85-9973-86da7649e9bf@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 08:48:53 +0800
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
Subject: Re: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
 <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
 <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
 <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IetxSWTOsI8rn8pZ-Evfu56mkYEL_QLQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwMiBTYWx0ZWRfX/XMl8JLHeSIn
 UpGvXdqCa7/A/uY8kwKiNMDfTk1CaUgHc2ktLjMijlFy7tHnB8wp4jSxef1lQyVpafeTmLnxe1k
 VPFIFttnkUIsMrCPtpWjUAdz4nWrvuE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwMiBTYWx0ZWRfX4jEa3/B3ECMW
 0KrayMXYic/bKscS1/Y+xKJLnFcUinxkhgjCVdcfLPJKS+oO8j2EsKgNBPjiDkZyZV2nWWZClG2
 +sH+eU5vNEqb4NqMmS2DXM40a3VcXZ5KUu/Q7GuZFDXXrbrDd9Dhe57RHk0SAZwPP+LHfutrp8I
 NgbMX+lcZ2yTo8PwbOL5OsDIIRPO+1wO9+5d2Oi9bztJbVT/fyZNSMQcTcLa7Ad5WiJ9kTdhA9W
 dlh4bROXjerEfvkge1vDgMNRpkM4YvI8XNwzRinDn2HDVPN2T2qdSgI1jgKnYqO+nKKu1QC2T15
 5Zlb+2S/WpEHD6xX6vTpnOPNYbOvzVpzg0IZLU69j8tkA7A25WzFv36Cn1mEU+UNjIApE/Kz4hC
 5j+QiIRBErrH2nIpZyhjuc2D5ct9O4g3vpJSNiODuzYIhP54BpEqVtNpu4WPnD0nLbB7ZyK1F6K
 JL9vY4LsimwfltLvmOA==
X-Proofpoint-GUID: IetxSWTOsI8rn8pZ-Evfu56mkYEL_QLQ
X-Authority-Analysis: v=2.4 cv=O5OsLx9W c=1 sm=1 tr=0 ts=6aebd27c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=DT_BFmYFbp2_FYglL2YA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050002



On 11/4/2026 4:44 PM, Krzysztof Kozlowski wrote:
> On 04/11/2026 09:29, Krzysztof Kozlowski wrote:
>> On Tue, Nov 03, 2026 at 08:51:17PM -0800, Fenglin Wu wrote:
>>> Add binding document for the haptics module inside Qualcomm PMIC
>>> PMIH0108.
>>>
>>
>> Why are you ending this? On what sort of ancient, downstream fork are
> 
> s/ending/sending/
> 
>> you working?
>>
>>
>> NAK
> Best regards,
> Krzysztof

What's the concern on sending them? I don't understand.

Thanks
Fenglin

