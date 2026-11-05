Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793884596;
	b=GSF5dVz0PQpT8TW1wd8r6WZ5ihbyzrkQwY6R7ZyXHUAH0oj0PVBGqCMe1HuPP50v4XWy
	 pqmCbAVvsI3PCv6SUXcFisCc9U4L6IKgDfJdvllCEuKPI5bgPWdpn9b9nN47IvvuPgG4s
	 FilZzv557RgZqBe5ue61RVhuIp/QrZGTfjly0g2mFfKVsCVoW9jfp8D4Tc57V/l4oeA5V
	 fpH2E8W7+V9wYMk/f23Xs9x9R3xetVwn7Z07vfWGU8z7H7T+Yysux2STVcOOKfany7J8Z
	 dU9KJrezKzLf/cGhYPxcX7+HTPW0o7OTYaK+eZtyHnUeOqIM7yBLqGOQSTqLLOayVMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793884596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
	b=odTxSwjv/AOFfJ2sDb7grfMECgtd4ih5DjRd+98pEWQ0HZkqoTakR12HddZ8FhfTEu4H
	 8VqAV9vYzNBAq/FI/usP+m30RY6AhaEQVwkKV/3Eg7Y/6gO3vZs0+BwBUBG7JraGwYejp
	 OAmEky5XbwBie3CCXbQm3LGUMcHO+ZK2v+ilH4y++IQ/3dJ3eRma3zdweXWTX3PZGQgL8
	 2VRc0x5s7L24vLbMMKR1svR0Kre3q3ZFYmQR8qgUvQQgA39O0S3fmBmymK8WcgEGUmZIx
	 8O5i2lSnM83KYyw3Td/i+cpZT4IQMY9UNOl8tsu9Zf/tykBK8L4DXuLv++ymoWG3QHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mlLm/5/u";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaYlpuK5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D11606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03D11606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mlLm/5/u;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AaYlpuK5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5B3Lx43193494
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 13:16:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=; b=mlLm/5/uHHXkUXs3
	Zflt46dpp1qf2i4nxLhhb/W+/5FsD0pbicAD3o+LolSsTQXIeKoPYP95ZJlpXe6I
	sqpczlbM4+VLCl/hjWnJT/bVtsg1GZp7BeJ3i1e7dXIBj015CLQyQbXlGrybWQ/C
	VvdBFQQRsCIWnGZkV9GYHafbVQCa46/rLKwcaWWXU5tp5KNgB1DLZaO79kncRywg
	VWOdmY63T/NQFYGp5YrfCi+lUBIAv28Hb4Po2jj+LFS6gQ7fxOz0qPxw4z3CUmz1
	5Y63uKXcOMZ4JZCfg2IEIY2VWPovPs23HwzXxFQXp8spXUbUr7/fMYPWfX4qDBex
	mUbpJQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdrj4s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 13:16:35 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c9e0f047a6so71195e0c.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793884594; x=1794489394; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
        b=AaYlpuK5+H7azlTpt6aNiNO6taFzt1Sy2iEXp7Nm2k5PzhG/JywdL15b1fvqI3W3+7
         7h5AMIKI/yoeZdZyqfQVkkbOaN1WnfzBJNXnO0OlMjiDeQqcx1OoRYXWpFqCg8XHaMVE
         84Mc/uaml6I+T35mDSE/T+wYQEMU1v+t52Y/j+9QXQ1QewDghX6QO1CaRLSsfGVuG2Uc
         ZwSINFba+qm0SLIo8cNxxexy/VyYQSCnOVQfvcIB+71CX/Dkvg5YhsS9TJ+Jo8tY34Xg
         MxTaWGYq1+oQqJB6mJMhfBT4wl7m8xmcuKsFaI8nWD3wW6LGdNs9YR+M2UDf4NiUXFFg
         zbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793884594; x=1794489394;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BQjd9rrnkPjYMwArfA9FYliMwVSym69xMCbh5BRXbV8=;
        b=mJeXifJqxxjdSPX21FsNgnlo9wGOaiFfQv4eHm7qI69FHTI/7ppFwxcdEeznmAD7cO
         iqaGfNNsz3/GHl3xIFWeQmaEMUTMua7vfuK4x9JmBmj9wH5e/TBdtvDx+eaJ/3F3msTo
         hFKalhycuegK/ujCj729zXZLc5x6pbRBwarerGFhFYvGB4P8SGooBuPRHuhkOs5j6NqN
         zZZfcR97EwhF/zIBl74oK+cJRvr0BI0NG+dMFQwx40qVzl+YvFV4tvz1a+imRTHJOcnq
         5VppEVKmK3wku/Q9bJvogn7k6aRAarcVrLEFMJhFYlFkjngVZ6C3qDBPojIM6IznX4uW
         hCag==
X-Forwarded-Encrypted: i=1; AKwUvBwkVKjOsfy5p+xBl889Xtda5h0VTNkNv6nrXPuBVLWezG7rOVDAiyrdpo0IXiMFWHFfOdh4i0nZ3OdhYGU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/hRFGHDsIaaKUPwlQFHSlSnXvFv37L4Np+MxN45H4Qc0ntMQzA
	hpeSmIrBenDpPR/9zk4CHtbrzE/LKOoKy0//O7wMq0Y/I04I+CL4fOG6GoDZad20gqdpMpG+vkD
	9mavLa592dmBgx8S1108dFvN4pHQYCe9vPOXhqjOwrBBKZCdfod/okECxwqDrFnZ7YFFD9VatDI
	w=
X-Gm-Gg: AYBFou3ljVB0MROnTBsE760glWYme273+Vum/UNrLVUg3hM+lyNd7cBxroX3bSob7Rs
	wlnUgNHhd99rpDHnAen6q3UOQ2iZBPa7QbnkrZF9SsIRQXYpRvDEWTOnAnXz/IitEse5OlfZGSL
	JnKJqjGHq/ZljehcvqdkJ7X6Xh0eTS426rQidoO/N1FyWp65R6KE3EiCra3KMSPrsMp6U/6QNYN
	vSSM3Q2S4jXMOg8RLtwTPTyXTnggRGXaQVpLW7PeZb+EJ4dJnHNoH9gvgT9CpcAHMAFzw1szyEv
	IiIp9p5GHS1jduyhp21tZ3sNAPnln4o0zjlFvo7Jr7st3D12OnjvyC/DP7sYX/6Y7+LMDCf7YmW
	L1TwFDgXez4DuBHC3euBlFHO0vkeGEnz0E79rT2hf8ADdwyN3+jH5NvvMdc5ZPn2fqDAi
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr9998804e0c.5.1793884594263;
        Thu, 05 Nov 2026 05:16:34 -0800 (PST)
X-Received: by 2002:ac5:c7c6:0:b0:5ea:d67f:fd39 with SMTP id 71dfb90a1353d-5ec68998269mr9998771e0c.5.1793884593827;
        Thu, 05 Nov 2026 05:16:33 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41da78sm172632266b.16.2026.11.05.05.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 05:16:33 -0800 (PST)
Message-ID: <8b93144b-08d0-4333-a334-804eadf04cb7@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 14:16:29 +0100
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
Subject: Re: [PATCH v2 3/4] clk: qcom: av1ecc-glymur: Add AV1E clock
 controller driver
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261104-glymur-av1ecc-v2-0-7c25a73fe811@oss.qualcomm.com>
 <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104-glymur-av1ecc-v2-3-7c25a73fe811@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aec81b3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=_WYHhi0DWFvV3-2RZcIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: crik4V8yhSduPuRfn4iQRmWZjzyitTV0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfX3g30bEhMBJif
 AVG6IvwFX+fdBbEPM8ZfQwem5NQsFs0/RLnMO1Dk9BFMzWIFBGcmy28IaqVK0p6nBatVYa8O2RZ
 XjBnf8Yry/8UOvZQD4Mxw7IM7BwjIro=
X-Proofpoint-GUID: crik4V8yhSduPuRfn4iQRmWZjzyitTV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA1MiBTYWx0ZWRfXzfIaFqpzM5qV
 w5EWXbXVqVuAct3zE24YPyix8AMJltI+6xivEeKPKMgSKxBZr/KaPZhe3jmZMDXV025K0nuO3iA
 5WCFXc8d906atalzZtGSvvZZO4cWEEBY+03avhX35ZkL1+9eY6awwU3vUvxTe0DR+M2iiGBq8zF
 q8YN0V8KPJTKQ47kv0ibMwCSN5ky9y4LwfTL8CSwhwhJ2Q9MENk1HSfMkEQ5hNa/PjH/1Pj7rUY
 D2DLu4wziizMBCRoTSe+DuNHzNFBuvmAYdKRJjR8Mxl0K21Cj6Rs2UCqxiPcYLn2l17/CXXaNy/
 H/n0a3JzS1IQXjOHsfPIA0Z2hQHeuRUrUTWBVf41scyVm1tsptHNnAooLEa7Kzevpem6VGEa6bX
 TNwvQScunxqEgrdQxG+IJGKYEdkhL88tRwPGOx+aNWfz1SNAthltL34l4s86yQ9knsxaF0h1h2g
 KZTiuJlFtSvG5X0O4Iw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050052

On 11/4/26 6:07 AM, Jagadeesh Kona wrote:
> Add support for the AV1 encoder clock controller (AV1ECC) driver
> for clients to be able to request for AV1ECC clocks on Qualcomm
> Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
