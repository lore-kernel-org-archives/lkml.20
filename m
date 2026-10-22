Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660697;
	b=cMF8N61vkXZbyh7nXccaY9JUb+yYp0ISGS/Ssm+2gdmV7ji/Xoy0goVq3A3FVMIOTzpF
	 Jkp27wP95RBCr67LkqC8ExOnSRlxatWa1BFJMMghGoFLqlrEVbwSvRowJ7lhceubHnG1E
	 XTj3TtAACXcvPD8pOkUWrz/ktqmGmlYeBgEQFFG3pzS9EV8KPsQXUvzQjGqLiGFFLmkZ3
	 5Pn8QAuKjHOOC/8Dh67FKDFYqrhQYz95qgxd8+mlHBzfR6EwXnmmtDl3BKxB+KTImvTjt
	 01Wjr5JrNkcz+kOI/ybW0nwK7UWwemG6nQShnDzmEUrpXvq8HV/7uRsni5rbcYbodsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660697;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
	b=pB1SlL/sDkE0fk81TOZIDP9lo0CKlqEEO+ipNwT5Pftk9k4V/4iyuw48iSI4DBRrf+eR
	 QMgOvhog3pB6FjrlUd0YoAaai7bpMkliO4OuXqmL5HaoYaTG48Yiv0g1bNyhjHaBMJRrK
	 CRoZ4h61KgR66WpXkWODRw6N6Czw36kV5tfc1xty+y0mGiywOZDtRGKT39FOlBtKGETvk
	 O56BLeZ7oiBKCVvcMGlSs5QXuhFh6rjyEwmh3EQDCw9TVoxkySqxNjQbY16x9PALfHiSU
	 n/NhHVLF9RxQwqBflzdGF192NUnQTOyUrv6HdHmHrJN6w8oAghEQTx1ackTqrAfx+pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLcLFIMy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adFFD+aG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C328606A31E
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C328606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OLcLFIMy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=adFFD+aG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M6xrKv2171938
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=; b=OLcLFIMykHoQV4I6
	CfMEVtii2eDc14lG9rp6YB+ThfuEw2Gy1krKAUtqGdRVLfBXVgM1evisFtdLtvX3
	7/ykdGjH5dSdKgNQg9aiar9wSgNzSwtmTmWJvQoW6HbANaY4wHvABxNm7lfd/TOQ
	Tjz9Mmqsr3zerHv/Jb3JNmIycVfuvgi1W+Qr2uOPpEbMe/fD9qZTzmLWIzS4ydzX
	Qse6Zn8bL1aTJ0hRk9b/Udt2+asfFJNH5vrNJ/VIZYbJLS+1D7jxW1Sq6A+zzN1P
	poHLBdl+DhH/BqRYDAV6FRdZxZxJOG/1i9Bt917UgRh4FE47DEM5JFG22wgex+K8
	oktkJw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahndk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:18:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93edac58b24so43794085a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792660695; x=1793265495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
        b=adFFD+aGejmu2iZcLQZ7oWPqFT3J7J1xTCpMZlouJsEu8m8JyhH2/g1rKcyolVR2Jw
         lFH85OBxxEqAeGUx4426L0TlR4oz/6eNWkQWjBAvl2Jl3ZvctNHFmZyl3ofCbVAlOcbS
         ++LxnKvyMO3Uhmgxrz340hkikSobH7aexj4axzFE5y3tNevBFqzRVDxYH3rLja9V/oYw
         vFB/6++BlGR8hvsW5qsp3/UuW71wENzgLhMDIkoyR2cQUA1tUXBeE6Wh2YU9HBkQte2i
         wJUgs5g2M7uGbIkYVYpqnRY2FYUqZ/oC3rTOA7GN2ZnRPKu1AFD8vRxAtP16uTDEJtMd
         4pyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660695; x=1793265495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=749+aDeQ/ZlTlRoYy1DcYQ+Op5jDghh6/V2zXfQ3V8c=;
        b=wddS11Q4LrZViv6sKf7ZAIDiBHdSPWevbTOakSlotX/TFLkynejo97M2P7Uxjx7TG5
         bRziMiicu71RNSB0PJqhqJAyt5704xZ7T2t+ubkmUtCO7ww/TOSCgCrtqHCIOqqXSGwf
         xgtYkG3WjZYYNyYcGgKZADg6RLzqix5kVaXXqB3vajuD+EsTNMk1qABMX21IDH4Xv0st
         0EXv8u+gFqXdY4OS2R3Hfan2dtDgD89Pi+pD3SrLssbCuJGY0Oxr9djGfbbK5J9diWzQ
         3+ZjRlWyFU9qxTDYRNIwRalj6m/4soA7sPDHNBU/FBQA5ZQrsoqg+dWILJpqwNYzL0/Q
         WORg==
X-Forwarded-Encrypted: i=1; AKwUvBzNrzquB2Ovt5HNdmsSS2OIZ8Dsx4SIkxZut3Q0l2qOI5QEtU1rcA0LjlC3OQqHASYArVKdhLaSQsyrGZY=@vger.kernel.org
X-Gm-Message-State: AFq9FYLHtRooUqLIR8fwCLGzowYfFzrMp1KkTRrD1+zwJ0ZnX/+BCMxQ
	nalaflP+XzxvXm83T9jUCAe9mVQONqPbsSQyRsmdFaSr7LPkzHcxCuaYU5nStbfN7Rkbl347r7u
	AMg/xEpup48rXgS0OX20AlA0eI31HpyRIf5RIq3Kujffc6KWczyBJ9NRR9dIN8pgK504=
X-Gm-Gg: AYBFou0vORe3woJspzCjKxakvJq3s8VJrcaXM4hRDICcd7hRY67neM9j5B/K7o55Jv7
	zS1e9+hFd7P9KFdexEXqLtnzpQGNQ/IHEQqPWcRZRusXdZBKuya8qyWcoS/7SOAGFDLdaVkMNVa
	/mrmj6EWxS8gp8YR/OsnZA2NFxzd2+HOtVHhkSCfguVl+JnjCyDTHl1ugIM6LKeF/YDhFl0gONI
	OkxzhCrr/DfPs0dIvQ8y/XA/HKGytFgavaqPIgjDhMCIHvZGAy3VKMBS3HVDlJkKNg2Olu2aowc
	QKo1WhJ8KIKwvazdyOagt16PH/g0fDFGvxMOboHqT3gTA8ftcAqgWOZrrYVWwdgK+MLW7F0OPBH
	foSXrPITAPG0Nww9q4TSMeQ==
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1016264285a.6.1792660695032;
        Thu, 22 Oct 2026 02:18:15 -0700 (PDT)
X-Received: by 2002:a05:620a:480a:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93f57f87853mr1016262385a.6.1792660694557;
        Thu, 22 Oct 2026 02:18:14 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1eecbcsm86476966b.7.2026.10.22.02.18.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 02:18:13 -0700 (PDT)
Message-ID: <57720aa4-4e46-4406-be78-06084b55b086@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 11:18:11 +0200
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
Subject: Re: [PATCH v2 2/2] remoteproc: qcom_q6v5_pas: Add remoteproc support
 for SOCCP on Nord
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        shengchao.guo@oss.qualcomm.com
References: <20261014-soccp_driver_dtbinding-v2-0-09d9c1378e9e@oss.qualcomm.com>
 <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-soccp_driver_dtbinding-v2-2-09d9c1378e9e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: V6xcNyVJnzjA_D45Re9h7J29D3fICMyu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXydYI0zTrxA1I
 9XfkhvY50JoRgcNugIMBHpAdHRptnCMsuxcrWuibsoG2qOTH3AYTzSbnxD98QgCPnwimhHypITa
 QcdD6+XpsB0UtxB7hqcZYRh7lAV6DoU=
X-Proofpoint-ORIG-GUID: V6xcNyVJnzjA_D45Re9h7J29D3fICMyu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzNiBTYWx0ZWRfXzxKMMxch6vB2
 sn8FJii5i4wRV7yBy1r9WSRl9vqjDVAxPWI9qhCSRrsROB1cFGj5sI0Yy5ir4vi+tha59k1Aizl
 /5geGE5paGGI/opO6vCPQN0xCaAJZ6OB7H29Rz3bwIhZv/8n38/MYVgmP0PNGobpzqtveJk+tiO
 hoQNbbwqSA43zWQNe1s2iWRQLD8XE4d9fMEz7iQMNbGbqx6mgxAlU4YBot4bMU1cf9gkDc/sNno
 fplBZtyw++GmCMWTl3kCGggt9QV7LL3Fg6ic48BR3fN/oBR5mtn5wezuRR+xNkq3MofugfmsTXf
 hBEwuSdmexR3DUjVpnl89ZqKCbYqNFZ5PQiF0PFMFeNXn5mm90rV5O9K0H8B7V/F5kKYnJEYUC0
 BHQU3dA9Da4QuTHJnT387p2dWjqCuNyJKNbx58G2mWMeFGr198miuCwgeMNk0VKAFTRLs+tpPJu
 UrBHVwIQS8al8EwcoGg==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ad9d4d8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=5PJkfhtApdRqCJaq0lEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220036

On 10/14/26 1:46 PM, Anurag Pateriya wrote:
> The SoC Control Processor (SoCCP) is a dedicated control processor
> that handles hardware fencing for display and other use cases on
> Nord based devices. For Nord, SoCCP firmware ships without a
> separate SoCCP devicetree image. Therefore, it takes a single
> firmware-name and memory-region.
> Add support for SoCCP PAS loader on Nord platform.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---

Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
