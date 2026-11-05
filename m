Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793856750;
	b=SIrIdQyalTFH4fquVkfoegXTdeg2mAyFXd/G+J1xUhc5pA+JDO+j53nznLS93isRVUzn
	 L+eT5OvfjUGppiDwTXOeFyZ3c+1Qa4pAdCXAfx203ihDeTkt41oeI6DMihS/f9QeUioGa
	 IHdj9iGhBAT7Q2NY2ZCr8tda3DnIOo/Fhqa1bpHSI0VSehCND5P7QLZWY7cavg8haJlCK
	 +CkbFwbrm6q+hq3M9icaEtQJaLqR6RwOVdgVYDTYf2MBU399efmCf6yShcNMjShn+qksI
	 fyJ191cx5wPXSOrwW1EeujMVvhM4Dgz6XqhSK+EAKOShnWPMheQGEoJU0S7mO+DNing==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793856750;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
	b=eZ7UziWwv7l1AziDXuy57FqSQHfzIJfvO6RnnACOv3H6NTsGKBI8mZ8CkZ3jW2glopge
	 5+cOG5G6cfjwLlbjR8HVF99CjUNZXA3FEXW++/gHg93KQg7DS7DDLJfPwnjZOZWPMaZs8
	 h11eaVxl+JgG3fCUrIjkE/KRacZJI4WOjiNysFijbgjWINT+DPT20HtzwDtIG/y7DcuNh
	 Fvmws0bOA4VNgjjQ2IXtz5iN4qhjiUTnqdHE8kj09kXDnwfjqkLLSWAjuZs/V+fnlx1um
	 tZ5Vl8gVC7ncTPciSj6lbGT/RBPYnykzTl9AAyIOp+vKakv3g5dQB0IiKCucbNfQs2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATiem9ng;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNliE1pm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7884606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 05:32:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7884606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ATiem9ng;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kNliE1pm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A50odmu3433658
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 05:32:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=; b=ATiem9ngPBFH6YEx
	TGjK/0BlMdYHEm/YHjSx8kFRH1vADGx+4lat/4D4RrG/lJCx7Vv6TsB5uIl1ztZY
	vvbYEaovUAyzEncLlZCUgzwYiLrRN8y1CZ3bi+nyha1dyBmLkZAUxg+rVGVBtRpB
	GDK093OwvevmdK1sbO0vgEGi+WMZtSKuLZe28ekdSamKDvTeBghnEquf/LiK07lu
	Jt9rVj4/6XjALxkU+fLGSEvfT2v3A8r9dNOVcKV6v6zG8/8GOFCJAdViI97QhjOG
	3pGfniZiocs2nudTu5Zhs1MdyuelEPZ1jy2Mn8pjp/ZTjIo2WstNWBJfgQkKkKNu
	1TEPxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr3pym44q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:32:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a06750c74fso1416040b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 21:32:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793856748; x=1794461548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
        b=kNliE1pmKLwz2WykxnqDvlJMJlzO0eUpA8/xPUmNS59RENLsPDBOu0+ZDg9ltqNVrD
         VVWnIa90/HnXMqNXoxkDDeLLaklAV1iitzu2ZcQOVNMMbSBOxGdnN0JZcr0bHLabKcZ/
         6wV5hGbNVdw1uWfBe4l+TCbJm16ymAnlhaZbHIuUu30jzqePCMPLYbfn649qpb6gJo8f
         q7/cJ+xHaTnp4RYdT1kOFl+sTwSi+VkWi8Vao90Sr/30MHpf6bWBM9bwyWGYEq+QdFbZ
         +bHhTGexU2zFXjb7oPRVwkc48gyAJD02TIn/CXfKvrpDdzUUz95yyzilabl4XBV6C1a2
         M1jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793856748; x=1794461548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bW86C95W2VUa3TTtLDIwP6qoN9L9lbkIZbVnklP859U=;
        b=1NQUvJtmwdojubQZxN4aGqtE7a6GV27JiJEqHyo4n7QoPx72XYOeCVN6jkjEkSswGX
         yKnzsWsJLy6SE4Fsim4G3G6THPlBODQbWmIh0e1PQ+hQY0SnoGXVxkRCOFXQ4o+aYvZ4
         dMvAf/awHFh3dXZ+PIVb1td7hVcgrN0MJQ5vmpQWy9ML2SsJKYI+3KGDNrU1fNI+G8ky
         ejoc8FkqVZ9quspYM6qSrdmKN5PpFUHHxclglIXtleN2aviadPAnKsKa5v4qIeP+7a9Z
         mnsXCaDFAk0y5EP4NYcWS/ymsvyc8PayYwMNd0g0lsiWGa/tXI/tAyaJ4QZlGYrsaouh
         15+g==
X-Forwarded-Encrypted: i=1; AKwUvBzCQcqyogy7Tp5nVG69qJTI7DHwQwHSVs4TAcZIk8OTCrphrGYyPr39XTPq81vhvrpL67yddXZfkJ+E/M8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/z2uv6aGnqSjb/HKb0hLY1No+8P1PBHlBiGj+KIlUP4XuvLhQ8
	ran74uluXOfgrsTYSlLgPZQAe5dOv0C9TGtn/TSeNPN8DwP4pWQQr1ktnFk+BijR2GnexkxGYPM
	AUdeEfZZ3PwGvkoo0y2MvEui1b4otHcARUu1bbeaZeLOTxoqhRbj59TwwrcJuODpbSC8=
X-Gm-Gg: AYBFou0jkTV2y+SaYSePyhiWVl1hvbhDjOKkCX+X6J55J37duWvZMlaleKXSQsJ94aF
	zziWxa4/3lG3IuZhCV9EySmE4JuUyfUTXEj5803Bgz4pJ5pe07hxEvE9xbTzmZFPAKWLUJ/WP+0
	dA4AG6QsxKQ+S1zyhEosxDmhylvcsYvTEhygsUuaWam/MxKgz6M+J6YsgVlhRDSj4DiYBM7ObAC
	j+T6jkP9Ao2S9mQA3s7ZS9bWuiaXUvIt/7CYgOdmWL2ZdiTW2MnJdA1HJaj7cAifLPD5/ndTXmC
	ldJRZuyZsGo/C2tR3IETNYAvEfMMhJ354e7/KpFY5i7ocNufBtgK72BFjN+v/fVCIq/AldR5vqK
	3+IQI/iXt+PRzUCtn5FETRzPRryjmYmVE8Ryt9BVX3CW/PVBRWdYXQFMzFxiJO44+qKe/9x12/G
	k=
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3e928a845f3mr13341114637.69.1793856747819;
        Wed, 04 Nov 2026 21:32:27 -0800 (PST)
X-Received: by 2002:a05:6a20:9e4e:b0:3e2:95fb:8d03 with SMTP id adf61e73a8af0-3e928a845f3mr13341084637.69.1793856747307;
        Wed, 04 Nov 2026 21:32:27 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09b569495sm1577758b3a.37.2026.11.04.21.32.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 21:32:26 -0800 (PST)
Message-ID: <c5af7192-c923-4fbc-bbfc-7f03e310fddb@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 11:02:20 +0530
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
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <a2d3190f-bfd1-4548-aba9-a186cfea878b@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZbmIpcVA c=1 sm=1 tr=0 ts=6aec14ec cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=iBD9WU1rH6yjH3nr7zsA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX2prWJFbuuoLO
 50IcYZkdcJQHTULvA5Vwy4mwKJbOK0tb0JjTf/7vqKjBRyh9KnpFEFDTtNFUdzJGhtr90/dCC31
 d/i+CG62lzG8B9JX+Y9ROBVzM0H3lUeI53JGHLyp/92JpDD60a+Xt3h5YgV4shikujRR7TUKV+H
 w8RgFHE51l9LBTukC6Ir/yBExsr9a4aaF+Fbrn5w2z1wnT4XTrA/RimVTAhQL9kXz+05pxRzAwD
 1uStRdFD5gluAdkLMmIO1SmvkCPWqFo3x/vsAIBVa7jHl19QdYqK9XHdUAPFTpsnlBUZVFMXu4b
 uQQuAYsD6AoxHS39AcJRT2QPyE1YYTuEd+JiWA/Zitxdcf4aY7b8xSqFNrnLONuuA3mL1khARv7
 x9nv7bEqOYf27J2cX1x54R5/KTIwLuwi+hR9QRX8pqYBmASwZFEQOLwG+llvRkbhdRujQppS+w2
 OCrARNc1u1+2wZEBbXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAyMSBTYWx0ZWRfX/laWJBYk6sdc
 eOKMNEXxTZIVfCLIahZ4DrD7+Z5iZJGBWiawUsLzyJvpaQbEPSRqydlQTQY29PD6udWkCvAiA1M
 PRLi0tlUg4/c6VFPN6nms0qg1Vjk6io=
X-Proofpoint-ORIG-GUID: SiiYDVzj4EaZVyGQF7TSQ8nYJg4dgyGl
X-Proofpoint-GUID: SiiYDVzj4EaZVyGQF7TSQ8nYJg4dgyGl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050021



On 04-11-2026 21:42, Krzysztof Kozlowski wrote:
>>>> Glymur describes CSI2 PHYs as standalone nodes, but the CAMSS binding
>>>> still models CSIPHY4 as port@3 from the X1E80100 csiphy_res[] layout,
>>>> where entry 3 carried CSIPHY id 4.
>>> You also remove port 2 without explanation.
>>>
>>>
>>>> Describe the hardware connection directly by allowing ports 0, 1 and 4,
>>>> and using port@4 for CSIPHY4.
>>> All this is confusing, why do you introduce gaps? What is the reason?
>>> Your datasheet naming does not matter.
>> Glymur CAMSS has populated inputs for CSIPHY0, CSIPHY1 and CSIPHY4, so I
>> used a sparse pattern for those ports only.
> port@0 is CSIPHY0
> port@1 is CSIPHY1
> port@2 is CSIPHY4
> 
> What is the problem exactly you are solving?
> 

The problem is that CSIPHY4 is connected to CAMSS interface 4, so the
graph should describe it as port@4, not port@2.

The previous port@3 description only worked through the X1E80100 resource
table indirection:

  port@3 -> csiphy_res[3] -> .csiphy.id = 4 -> CSID selects CSIPHY4

New standalone PHY path:
  port@4 -> no csiphy_res[] lookup -> port number is id 4 -> CSID selects CSIPHY4

>> That is confusing for the schema. I will allow the continuous range
>> port@0 through port@4 and keep the example limited to the populated
>> Glymur ports.

-- 
Regards,
Nihal Kumar Gupta

