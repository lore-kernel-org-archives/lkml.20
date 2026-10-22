Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792659674;
	b=QI6aGpKjeLHrJnRMe+UL9y2ssPNZSop5nJMNanLAOLhxAY333EvI5fyL5yAkBP9I4lDW
	 akoYhDIMb5QGmScLc4IAA9skRwJ5Uq48liYhvOa0Mhaa54RSfibJJpwkXxz4Ot6Or57/U
	 aPN4HmOazrP+X2o8xf7WOsNYY1fQ08/pznfLx7QF4Pa6UjSkjSCbE6E7WjUG7I2yDaSZl
	 ZdGQs/jSprclev+zHOnkcykojfRJLZRgHi9g8WH8gPbdItkhONeMrxSD909v6F6rKs1oi
	 6oqlJnenxB8pWnvDJAr5jTdWguAwggLMgnI0GUIlN+Z2065bSPLCX1wjqwBTCaxyfYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792659674;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
	b=DqeOREJ4uuzm37fHd0nYfsyBY8eFgK0IMsKsfZ/bwkzJHID5dQ429P4tp41hBvPdYrCj
	 LKr4vctagilzyd1iAVaM+51F9yem6pyXZU8c6N/IOaa93hh7mJb0kAfv7ViyVOTq8rBmd
	 egKgh0M8Kre7hSFj7BbKrQCoVLxPFJ9KEc29mCs/zI3qdnIwcOT1QK0RProDEldDBzIEH
	 /sbMq9mAaemGAXbKe9Vtv5XodFUQbCebxWXxuOVFzUJb9C7taq56da3VzJMjRmv2tXCFZ
	 1xcA9uVyPDeZekg8jhIg9m59bwiUgjOmh2JQHPAfL/Gtj2645ZPH2yKO+BzeLrjnHeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4GcoDsQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I01lsz4S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB84606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:01:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDB84606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A4GcoDsQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=I01lsz4S
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M8UwdA3227816
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=; b=A4GcoDsQ3s1tLMOD
	93C9vquARc5OZFaKq6iSUo39AkrKSiLRQJl0ASUrpurgKJT2EXSCdBcxmc7bfgo5
	hgWrzVI9CK0P8ShQdwpezUPELk7RoqBpxpLdMEAEZZJHDmsUeV/693eIrvLOWZdD
	pyNbAdgrHeNRVqV3FTTn3DK9NtiRBi8pW2QryzxJjGKJF7KIeMjQQndxon4edAJE
	fk+dRl9VMn6XgAEfkYaFiUvgcs79+wdpBkM+HzCSqbyhkLfjIrA0Pl121T+ZN7pp
	HRwzH7FWIK0VJHojiy73L0ie33Un9mKRH6c7YPV81rmbbVeD539OvuJQAfa1Odp3
	nQCs9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ashe1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:01:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so43712185a.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792659672; x=1793264472; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
        b=I01lsz4S6k1C/fgiDZ6qSLL39pagh7fCsa5rxqlwyEeQq3EAA+JznN1DDduVNp+OzB
         0J0Sr2OfJL8wNo7P1YdjB/I4bax8FeSQRxY8oU98/Gct0LTSaxN5PQXcZNm+DsRZzmyD
         tm/tEIEdOqFrCObLjhJoFGzgXDHka88OUBXbbZYG1xIgJErKi6gVjnZIcCLVtsTb9eXl
         WRsZ4DcWBMJUqpQXCbxsBI5cpevkZuhCbTFLEhHbV7MVzz6qBfSTegYJyXfessEJhGdJ
         YDfJiHetQhIEX6TKgmlZURdH2e/MP14HAIGBUfFfY6d4zGbfy/rsdrheOB9Onr2AsURv
         Jpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792659672; x=1793264472;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UTRFPblkLPdvoWYM9/wAHuv2GDi6sap0sAr/jdJeU4c=;
        b=dVdQnzdFqdp6qpx5xwgdBsGtwb1I5Mg3vorIDIh1Nq7FvY5A+ZbzpY/vnX3elXnRAi
         zaYrm89mRZJKWcKV+GZAFy4LupyM5vTTfuUp9zUR6YDxzmUcsFqe7jn5qQGLz1ZY0pc1
         t5y1W6shMzJ+pPkOt0UuR0aY4z8g1E0mQH8CKBd/p9sFHNVEhFioApyti+8fjOCnjFSR
         +Hk6rbd9dqfrja4bo/CjN7lQ33xaTnJQ56vQbaTDYveQnF3fbgpoMoAPfHYNGoQZpcEU
         ixDjv7BkLgfeAExM5R6zwZSzgzrHK1Ppjkm46on4kgs2ntCXO7u/SOvwEJ4Xe78chjXB
         wFPA==
X-Forwarded-Encrypted: i=1; AKwUvBxV/b97zCGWUXCXTeiYmDNqBbYd0OgNmBKdfUYek6gIGX9FyreTqbnCG1V6l944/0hu8vYIrcnH7qiRDVg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdnyqT7Fbbzsqtz7d+CxlnwAagoGqmdNoF2wDJrKAN0aDebVxC
	Mw+KkI50TCzvIRwIuEnCwzH2asS4czZOwZ7o9xsQjzVXgFGhM/x8H3xSFfcD4oekex5Y01kBwBl
	j9X6VL107093FAHNMl/84Mc+0w2MzsTObSKxkZGeBKgBtbCloGdQjxwGSeW8Cvmroszk=
X-Gm-Gg: AYBFou2zRAxu2WVHoSlEwTAmqmn/vybluB9UYFVJvj3wsoQCwTruXF/tJyLBRh0gNEy
	7bW1s2waC24mxZTRfAZMvObgnUoLCmgE4Q1Pu6iGwpboBh8TJ9riSficIdfhZPqZT99eCTrbLWD
	ZDEfRgSahmZf+Pc4mBi6njUfFyOswuUTsoDVn1oPeutuoVwojPJhoXrfJvL7d4ai7G66yUydUpA
	/VRTKU6oIj2ZeLL70aPid2YgKUm5NRXUca2r8IAsuHmK/70gS6q1hGldyYeXT/f7hqRyN+vu5sR
	majFi9tWpPsnAWxHfOVRQ6PV5L1+22srveTSCq4reBoTnlEU3FeVJwwxRQNLiWT5zX4wbP6turi
	GO4YEvO/YgsKXEFmwE5rh8A==
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr984418085a.2.1792659672291;
        Thu, 22 Oct 2026 02:01:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:e111:2771 with SMTP id af79cd13be357-93f57e9331fmr984409085a.2.1792659671687;
        Thu, 22 Oct 2026 02:01:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a4ffcebsm83458666b.30.2026.10.22.02.01.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:01:10 -0700 (PDT)
Message-ID: <6da23245-ce68-4b61-8eba-323102a5b9fa@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:01:07 +0200
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
Subject: Re: [PATCH v3 3/5] arm64: dts: qcom: Introduce Maili SoC
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261012-maili-dts-v3-0-8b499e7b9a52@oss.qualcomm.com>
 <20261012-maili-dts-v3-3-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-3-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX0qvm/u9s7eus
 uJOaOHnN1v6got3ju1IVI+N89cBYOuF6Znni87O8oMQIxC7Tz8D5ltPJ1eN3Se4/Tl8BL9otZme
 90YG9vM/MF7Qo/Rhhf51lnXZrdnquGHSykonY+2xLR2F3faLi4BWx3y0FGGqE9PPdNkJQUfY2r0
 fWn6vG2N5OYvp1Nf8EHBNPbdR7j8RJisasC7KoUgZhuXNiv8zTofsY5/zH/rmgCAyDU9ikAgoUq
 Ga1+MTNID9nkrUVjmly+zvuA1UrHE3taN31AqEeg3EypF/pHukktOlrxWj2vgHN5ArKQvTi5A6Z
 77paakimKC6XSZ5Z0seVfmbOtOCTqMribX+iWsnMVcsojgq/Qw9gkJfsdGuLyFRFypN5IA5kNNo
 fzliVhYTVAkZFs2orSPYZhlYRaWgoOw3EfT6CMWpDMm1xMO/w9U20hgJgG86XZdw+QgrK2PcccM
 1tdaoyySF924ek28v9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNSBTYWx0ZWRfX7YXHTF4zRXcF
 //IppkFKWK6pGs6yAT/wjXq85g4OqeUFDJc4Y7kKFBWT71G8fSIxJGU4lCMzladVxgISx4FphK/
 sv8aLMuW1mmh/pGxSxg/dUn+/yEVMWM=
X-Authority-Analysis: v=2.4 cv=QPn91QLL c=1 sm=1 tr=0 ts=6ad9d0d9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1qrlJkut239GXpouHx0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: hbfu6_mpLUr7xLs5iey_b0u1Fy-SCb6b
X-Proofpoint-ORIG-GUID: hbfu6_mpLUr7xLs5iey_b0u1Fy-SCb6b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220035

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> Maili is Snapdragon SoC from Qualcomm.


Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
