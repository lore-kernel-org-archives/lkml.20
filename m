Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794475981;
	b=1DhpNREJA2GBeRLfxMrpP6glDqbjwCMNqDwufYfjKe6z0n7DC2/a+ne9YFLg+Qz3x9YQ
	 EZnafx8gkJG7CwFsM/M5I0XDVmA7I2eDjbRaQcNVNAwl+k5HxS5+aAJISONDITXzCa3xE
	 f2GWDaqkImoxuzKJzcrf1VY1jJ9gEdkiLaLXb5jmmxVcthnBaxGiC8wMTyaWn2kfI4z1P
	 nJF7v/Fl1VBKr2RJ6K4/nOQkCi5AAooL0AP3KmRHmfLahVZL59mhLU/p7cqm45eG3URQM
	 RnN8jLeVm72g5Efv02JZsLAjCEq5TaeE2mvaOPejClVykPnHO/c2PTM6ofaqK381k/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794475981;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
	b=PW7yu5JE0rQ1J7BDQZ2YbdLxXkJZpLZBz7ul7J6ghpGUnvgb6x9d7tXBRoZedmgoJ0u9
	 aHNYVDZ58fS1wFMoroQWIVqI1qR/P3qlQPnngBG5GS8MKGW6ztZdPkX5+5yTE9gmntZXA
	 Ri3x88Yz00xuXIqDH9CMl0LaZwviApj9Mwdj2VNsReCioq32AHxA6AEiK3pdMy/R0e8Da
	 g/KD7UA3rwuUQ7aPEdXiGX9N3R5yl0GL2l/AdeVUlFxFsrydn3eHqJeMCJALyv0hwMzCk
	 bL42jvqZCuUHqt3/wDtFNoIyTJ/SUIEVhdBDu5EzNWpi7V1kmZH2GCnwbiblxPwgLlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QNEs1OqV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PmFRQoHl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C622D606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C622D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QNEs1OqV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PmFRQoHl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC94LnH1475355
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=; b=QNEs1OqVZhxSqcNz
	7CaxEGvyYxcn8sWAwKPUwf3KHCkip2UMa2qvizkBgf9TCcd02mfsD+Th3nFelV5U
	fpr1KlN7ZkMZLeiHNyMKXfISrr4tOzr4oIZfitDPsleBaB+MjTrX7nWMjKl88cgH
	hDNMhMeWDqstOTNs9TykMxIOUmaqApcZYuElS2knDaSr81Cx3eZaV7nif8X+mHnJ
	PJRNDg4on4bnV+KAPwwCW50QG/7grnxxVavXmGET/uForAz8HKBpmqq+ce+2+i4j
	1albDF1n9ctEO0og8+r2joQds1yFStNm4+A7xkdqR0nUe+7CGVvrH9XieFhYI7GZ
	AcMPnw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymuqfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:32:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so3623884a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 01:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794475978; x=1795080778; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
        b=PmFRQoHlLhkFHXMYq2RaZkln6rN12rUizd4wQHx5rtfSHBaFKGpMkb8JVodKN0ADOr
         xVAWbyKG6CVBE6Wv1EmZcJBuHXq3NeeQnwPXP44TfscSJqIjjzhpnoyVhjmUm8yINuJX
         2sSgzpGU/L6bpzYkcggpfT3/OR+LlJRfCUKY2YgWzXo5UiqrnWrjDg3eJJB4f4IPPO1i
         qpfwfnE174Ts8yjMgdI+vtqnBcEm5RiU8UthHniT37w19adBtxsOzUwCusMEREVM+Vwy
         qtUa7MBwmndduJRI6rAPfgEQmiFUo6/HvUeEEV0FPelYDeo/iz970+HJ/AI9VurrnZ1o
         oO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794475979; x=1795080779;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zm4uqjyTBZMLurFKBtWKGU9EMrdGi8yi2J1M7zOknh4=;
        b=espCFILqu7K3dt37W+C+p6vH1E3tf7Z1UDfvvsuCNyeqCQ8TsTrBeTHHlfAl5rIAj1
         gs65Y5tRBhA+LVgBiBDLIHMImmaD8qmYzjmwEAJQT5MzFoi6ub4xIlgtYaKC7kXzx2Ae
         iuZgvKMZ+xx2aTjVCo72vLneUQaDeBu6Dtfz1s8ACmihnafCV8lWfp0Uok4VnQa+YXIx
         Zf6teRqzOrAgxs89Bq4QDkJ0FtQOCAQr2cLtflvdZNvqJCLovW/iK58n7SEmeiPmtq3V
         ZP9zq3FoPbMhRxDo4opklpC5++cTVt0+pc5czZzpxOvc+7fkBe4LI458sqRa+OLVO3NP
         yJtA==
X-Forwarded-Encrypted: i=1; AL+hErFhJpyxLwQv6puAfs3s2fjgUqeBzlvzw1yVaGyL+3MjntmofBcNZIIZsRptEm/rkS9LP2u9DSH6vrpdYLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Vbu12/CJiBL6+TjSXr7rvv3CvbkjONSJ8vKwJ6J/Z9yUilWTw
	ElaCwRaOZxly4c85XZXzyXzmCmnMP1XYj6D6CReLTpd3JUBIhLhWHvbVwrutHgnUuWhB+egBxDL
	ybPJdXdihmKdGyuHYb7mpVovhuUnOiaHKcfkj+0JJV1BXr7Glhts5i8wqQEbll0bBoec=
X-Gm-Gg: AYBFou1o/yVBpW15Yqjlb+Ae/xveLSEpFXwZSUWrRbm2C12ptdyH6Ca5wau0Q6Xs1WC
	01QNAyqVFNIm9dP6RMKH01iyd1qMsgzQfhptLFjfRZlQvgZh0DKNQdSf1ZDDB/YONI8Fi7EHOCi
	3KdGPhwbPKdPlUtlJSRweq1AR8cpY8YVHfyInrKYfAsCB0zK2xuyel/Sfsy0gKKbmGk9txUI5Io
	/3tz5a8nRwdI93qeV7LITQV42Rz6P4HZ23z9kK9RZ5haXNGiMRfbuMW4Y4iaaLE51c+TAtP6KDt
	JnHiYHbR6semvGog3mDpY3pGjfZ1j3yVSxmHMFuqUbaxddtVMlSgRUdobxaqikbT2cZYL3BuxWd
	phJMSMe0Y1tq+w+vQNdFMV7jZA9je57A88jiteJnv2dlmPjcE/itIT81IGfsYjlK7MTXG56qvG8
	40
X-Received: by 2002:a17:90b:2250:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b182f57e28mr5448964a91.34.1794475978583;
        Thu, 12 Nov 2026 01:32:58 -0800 (PST)
X-Received: by 2002:a17:90b:2250:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b182f57e28mr5448935a91.34.1794475978124;
        Thu, 12 Nov 2026 01:32:58 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2edb6d916c0sm31396185ad.41.2026.11.12.01.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 01:32:57 -0800 (PST)
Message-ID: <1b1c69fd-580c-4104-969b-ba09693ec6d7@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:02:51 +0530
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
Subject: Re: [PATCH v2 03/10] dt-bindings: ptp: Document TSCSS hardware on
 Qualcomm Nord and Shikra SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20261108-tscss-v2-0-d5f575010427@oss.qualcomm.com>
 <20261108-tscss-v2-3-d5f575010427@oss.qualcomm.com>
 <20261109-statuesque-polecat-from-lemuria-1b8ade@quoll>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261109-statuesque-polecat-from-lemuria-1b8ade@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uPptjlTaHcVZe68YskdIE692u2SEBSGn
X-Proofpoint-ORIG-GUID: uPptjlTaHcVZe68YskdIE692u2SEBSGn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX8j74x4z7ScsK
 eo96m29rNrFK70bOQyjxuJ/z02uJ1rgF83aVPGwp3TAe/fSONuXtmNjLklFV59/CeKtoZIBcgm0
 sw1MabMHwcWte7rhI38KLxpgsPTCSnPkVv453ENLIqZILk6TG7FWVmi1vjucAWc9MA1CAO43YJj
 D7REzNZiEiRZO0t6Z9itLO6DBxgaHJHf6n2XZIhzNFiSiVBbupFCwym0k/h/Vlhy11d6uhyTt/l
 whzik9tTcOHPFHR/NS+R/0x4J+/hDsu0InJaQv/P/zUCjLYMIKWjbEsASeaj7bPEYR3s34oGizc
 IL2mPfXl0zgrg3G06K6FAFpqVjAGlWSok8iH0S9veMjaBs0vvA2r+Ir5BUO5Py68YdVj5fmgjRY
 p/YByn7Gpd1ktrSVhcgwiSHbbxMyenZvogG1zONaQqX8q+b9ojD3EfQQckOO6Hngqa7GQtOS0Y0
 CvkPuJ6oNgkedVxbpKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzNyBTYWx0ZWRfX4VCt2d+KfEQD
 DInfhip22LmLb/+kB9cxkM5r8vpWFLXRNeblGzezX8SzKi1X4qP9eeRjuNDkMKm6eUK3P3EKsA1
 kCiJ7uhzyF1LfV21U436r+9spAHpqDQ=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af587cb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=8x6Hp9lnLVyU3yzMCIwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120037



On 09-11-2026 06:21 pm, Krzysztof Kozlowski wrote:
> On Sun, Nov 08, 2026 at 06:48:24PM +0530, Imran Shaik wrote:
>> +  interrupt-names:
>> +    items:
>> +      - const: etu_summary
>> +
>> +  pinctrl-names:
>> +    minItems: 1
>> +    maxItems: 32
> 
> So here there is difference, that justifies different binding file.
> 
>> +    items:
>> +      pattern: "^slice[0-9]+$"
>> +
>> +  qcom,etu-slice:
>> +    description:
>> +      ETU slice number for each entry in pinctrl-<n>, pinctrl-names and
>> +      qcom,etu-event-sel.
>> +    minItems: 1
>> +    maxItems: 32
>> +    $ref: /schemas/types.yaml#/definitions/uint32-array
>> +
>> +  qcom,etu-event-sel:
> 
> Anyway, you need common schema defining qcom,etu-slice and
> qcom,etu-event-sel properties. Maybe also pinctrl-names and other common
> properties. The individual device schemas should only override/narrow
> constraints
> 

Sure, I will introduce a common schema qcom,tscss.yaml with the shared 
properties. Per-SoC files will take care of overriding their own 
constraints.

Thanks,
Imran

> 
>> +    description:
>> +      External event selection value for each ETU slice listed in
>> +      qcom,etu-slice.
> 
> Best regards,
> Krzysztof
> 

