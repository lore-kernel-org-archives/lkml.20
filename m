Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778433;
	b=lll7ASHr/AY3vTX1+TegpTZueSdeIXkMCj6RsWYfjZko8P/5gtOWUcYemcjF90zMYNqP
	 H2tJqvKDc+O0XwNywn5dBmwt+bgp3+K8XmpgjlWzq0/4q/S6BEkmS6cfrcIlcNrwFLdSi
	 4Pjm5S2ROPPB5f1ZtLZ1aAPSSWtRhQBueN03C3bXFX5vKB2QkZ8OEIhvQYL1cHIWDjRQu
	 PnvjcUZR2UmgNDLQVEfDTLfX90zoiChOiRkY6X5byAY9Ix9ScRZI+4UKaHJGC1LNHK84Q
	 39T2aRGWYpuK4+ZLSX3yV3UtxFKgyyZtKlo3a9OijMRVUySA/RxWb4Skcs3OWsFRipA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jjgf4WFy8rP1HtZjj1ordHEDu4/2wlD5ZvDyvty3vOY=;
	b=pqYtjANsGN3j09BA+eFInWDf+m3dJL8X8TU/RrogokzxCAtnWsMHsqpPYUe8O1+rj2Vh
	 KLV8b4DV9c9O6paoJvV1+KnKBebk7A1KeyqoOYk9wjoauhJHERq0vjWwGp2wMTmce4wus
	 t0PdS23XTwcBVNmDQ//Ay1Q1VOl6NdY3cL4B8PSJvEU2xpWGnp9aLhbUYjqFUsl3/gnwg
	 rvv7W3BMSby9M4T03SJiQV6jPiiGEH6YAdhqFGkFSPaYD983EEDuTcivyjd9piS0H9u6D
	 JmjjYUNM/J2ltBjMbrme9umXA4Ar+vvQeGBqkn5rUmgVFSbxAP2wmZHJ7qAoWcDSMig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Uy/6dFI9";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCFA7ELR;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0C606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 07:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E0C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Uy/6dFI9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hCFA7ELR
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A43P3cA267875
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 07:47:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjgf4WFy8rP1HtZjj1ordHEDu4/2wlD5ZvDyvty3vOY=; b=Uy/6dFI9WcQ8Z+sF
	IejwJHo80qwig8uyqB08dM3hJ2CGKpzyZVGSA5W9E/sVhM3roMhN0r4ehq9i83ms
	TKbuBnKpdGzxIyM3gRr3Qhcj12RnuLr0yB+yro9T5iUqqUiwQ8sklAf1CkOP8IEc
	0uQSyiDPCdUGfGOGmqU74/ACVcBX6mpgAmZ3mNyRP9fbDSRG8o/Ai7SyIHARmxJ5
	Mb5RoiQDIwP2pm+u6OBtlvuEcuU7y0OTW6s4iQDWTL8bK6z5bslNF6UP6vLnuQOS
	PTp4mPGgLMymttHlASzgSxGiMtGuOy1Ltn9Vl6B87UGGFcwTAwfaI2DbwfFiUJk8
	Q6szjA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqvsg8wyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:47:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530cd3dff25so358091cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 23:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793778431; x=1794383231; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjgf4WFy8rP1HtZjj1ordHEDu4/2wlD5ZvDyvty3vOY=;
        b=hCFA7ELRaSROmFukNQ5iyoTTpEdB9KJnK7dRRvvilkuM2dauddWXzVuiJfAhZrcLFo
         s4Bqik3MxZMfaCDjXMhG+VG30E1ruVAosBT+7xqlwtvZ31RSjpnYnQD5P0nQjoAu/Eta
         lXXQZf2wMp36etIrKZ51AlyW/4FpPW3pasgKbFmY8cOBFvTV7v5QTezwpln+X6Jgn5oI
         LbgneaN9zh7TovslTR8lbN/483F3YNo3L4dCVLsYAvplNqHjHiFDSw0OR6cCq1GpwJmW
         cbmLF6GJQNEknvNLxEb+Z0k+0mdLu9vIRtN58X82kWciGu2YMkTSlq1de6MQe5OjfUsf
         XZ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778431; x=1794383231;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjgf4WFy8rP1HtZjj1ordHEDu4/2wlD5ZvDyvty3vOY=;
        b=mEVIk/PWhRF32gsK3E9QGWGKPH49A1Bdr5NwOxqjN5oeNyG5WjopjWgQKB/2fT+/n7
         hJadOdNgkSFVBo17sagGMyM2vw3N7zKLYv3/x5x9Xk4aIQEzXEclBLqY7Qjxwwwyz30n
         1RwldB4TJEH6xzpgZSpFO3mIieCEX+r/xlbFwx9Q/2gajhKS164y+VlM+PFMICki64H4
         796irHDzWVOxBnQ8I4IkzeTzHbAb2F0zSbJnx5AIhIlmjSBZe1eoX8sBQztRMq9/ht0m
         wegYcqlqOzppUxcS8I3nnSRVfecaf2rsNi2egNH941CZLK38tA7eWqN+D1uwK0KRPBEi
         0l2A==
X-Forwarded-Encrypted: i=1; AKwUvBx79nhltiboiiKCBR1wEH08RLStYF9r3f1ieXZPcedAXO3ZyM4ndlzelE3FaMjDO1P5LOf3WC0lohRlmH0=@vger.kernel.org
X-Gm-Message-State: APuU4Z92b6FlsHWKZr8/Bnr9d8AMqachGrovxzqUX9QVs5xZtyzradhK
	qKQo4sW9a43DbFsSTnTpGXsyJGyLF1SlcWFvSdUWbx0DPypNzNtY7KEfFxndfwTKcRIZ0ICpbtk
	qjBE22aI2rYFQ6J7BeLRKUQq1zfVJ6YXlbloK7FUlNSXxwG2NgRN0SPlHcEcdadIagA8=
X-Gm-Gg: AYBFou0B0B8xa3uQEQN4stYHFqdaIZUO0kzA0ZezkHlLpmxNgupfWa9J0FHocCcG8yW
	5YJZGVW1/z+iMVWdurXeKYRuZ7gvDkaU02n9aUpdtWRU5IR6FzTvUQmnwBtm/YZpzCtxGFzah7k
	Siyt2HgmGC/0R+RJzFTFaYmpk+2aBD93tzDPCvrHTZ/JTHRATms5oHNoFNcGvM45oCVD4euGrP8
	qybHQTtkZFS9oa6jMvjhABr823VfLSeMHPmPPzos7Q7z+PG4Dlzi8y7oR62ASsaFbKMqbSueLLE
	SDZeoNP/fwdFI26ydHgDjFqUZrMdMlCj2JBL2Um2plv2HSlUu7W6BnN6DT3rHNeuVWwP6gpEQHp
	F2SYVb3kM3RhQBJUz7lvG4CAnvw3auolDwyU2g8pvQ7BwfjrCj7FSpFLUwyODvnVPo+0H
X-Received: by 2002:a05:6214:8506:20b0:91c:c923:8a15 with SMTP id 6a1803df08f44-91cc9238ca5mr117022956d6.3.1793778430790;
        Tue, 03 Nov 2026 23:47:10 -0800 (PST)
X-Received: by 2002:a05:6214:8506:20b0:91c:c923:8a15 with SMTP id 6a1803df08f44-91cc9238ca5mr117022696d6.3.1793778430295;
        Tue, 03 Nov 2026 23:47:10 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e41e0fasm43893066b.19.2026.11.03.23.47.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 23:47:09 -0800 (PST)
Message-ID: <f8fc49f6-762a-449f-85b7-7d6ade076f20@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 08:47:06 +0100
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
Subject: Re: [PATCH v2 0/6] Add CCI and CAMSS support for Glymur
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Christian Cortner <ccortner@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <179346368177.44447.12360580299773199469.x2e-share-camss-dt@gmail.com>
 <a30d7d12-9cbf-4920-b4dd-d9791149b6c9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a30d7d12-9cbf-4920-b4dd-d9791149b6c9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GtnXaU1C c=1 sm=1 tr=0 ts=6aeae2ff cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=pGLkceISAAAA:8 a=LIoDc3MRPIFTSzfBSroA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: OzFA7Y3hiZKZl0jBtv1gE00_7T5qP0IK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMCBTYWx0ZWRfX7/ginQ+sTQwv
 F3W/LZOuuh2tA9d/w8H3J2priO/6xnhKwks9kR3JceWEZWu55ogDlMul2qXtPhSAcgH4p37NOy3
 HNvry4Z0mmZLGLrey2ZeqXYDCe5mOZ1P0gCd28IkUlp4NTd6nuoXzrnWo/PQWq732RH40lccqJI
 8kcSHI8p0mf9Nky4qE/b/LOWFlpdEyppGGmJqOCgE8wxgPhMD6bnWDYxGrX8llAkQlDU0UFBzGC
 3OCOHh3EC7L+T3Vbzh+Aki14ITaj1PbXhXHvihf+geZcorf/O/+iZJrSbS4qVE86mLOsZ4XywsQ
 2wJeumNyqDNm/Flob413XeWYBjlJljY0o38aZjeSg3Cl82XvgbqMTfhA1/qp1uRPWSFYvA4I+nm
 A4Zuulv9w8Aze7jFdIhwE9rQdM/Lp1bXjW/dyrM6e/OMzfKvpioWROveTZOBWNyOCBI5DH20MBJ
 gAafXo0MY00qFJ/2AWw==
X-Proofpoint-GUID: OzFA7Y3hiZKZl0jBtv1gE00_7T5qP0IK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMCBTYWx0ZWRfX/Ab4RBrVAEmG
 shNafvR4OiPcmGQoHcsvllyEJKydiVuN3cI5N8qpVHIIuhwwaR8NMZnrsJRJ47b18yp28X2Y0sK
 6J12J2Jjz/Zw3QvMhvzZ27JNakf9MBA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040030

On 11/3/26 7:25 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 31-10-2026 21:54, Christian Cortner wrote:
>> For 1-3:
>>
>> Tested-by: Christian Cortner <ccortner@gmail.com> # Asus Zenbook A16 (UX3607OA)
>>
>> With the PM8010 I2C series v3 and an ov02c10 on CCI1 bus 1 and
>> CSIPHY4 (2 lanes), the front camera streams 1280x720 at 30 fps
>> through libcamera. The A16 node is the CRD wiring with ov02c10;
>> happy to share it.
> 
> Hi Christian,
> 
> Thanks a lot for testing this.
> 
> It would be great if you could share the A16 camera node patch. I can
> either include it in my series, or you can post it separately as a
> follow-up patch depending on this series, whichever you prefer.

I've had one in the queue for both A14 and A16 for a long time
awaiting dependencies. Let's get your patches merged as-is and
not expand scope between revisions.

Konrad
