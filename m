Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450576;
	b=XyHBQsxS2K48nqma8gpljAXIF67IJlPm4kC7+7fcHtT0gwCq3s1YwVy0wPlBICixuKR7
	 PCLqt7E2ApDDxxy1CnEQWGTcyo1zRxIy1iZj+gkDuQhf8ULmVtA2ima+pvsVwIb0ztvhk
	 Gbt/+S6g2ZEJkPymsrOQvjvU95EjC0iDjBAup8/Z6P64e7f1g3VL8yMlQ1qOKGiGxkWiQ
	 qeEWl6A/p9Vsn13uZUvB7yz8RFfkMt+644DQuS/hBl8YbxFqAxkdsM0tG9bcO0zmLTR3L
	 LmfP2cplRAqn1KP9ewYlBYb+rmBGgh2LWgQ1F5Hjcy4Edx2pHbQ+XXNQ+zSTjBO8D5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450576;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
	b=rqeWfAkgirUUAcg/evXFQcXOywjQuS4EVsGtCncXgD4UcMZjb1kAqDqEPNzax0q7JMlD
	 aOLYabHsTrrEb8eHCE3eT17c8Nhkv7cHk3gBsTGheDRVwcQ3x00fOK80RSYki58h0meHN
	 aP1DoNA0ADFO+Xedy8wkHEmL6e4f2Ir5Um/iZnSZ7UTG7nDUkIVCn10pvwDA+6JZj41qG
	 44kEXCs/xCA4SdNEDbUR6MrU372SA/DF8DiyAKLzY6BIzFgvoXAqScNG30QVxVpBMxzEW
	 K2ZMZNimcUV/j7UH2FM98Wh6JHSH+UUOwKNLYszy2CkCDUvrffxDkhvh688Rz63tQeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPD4U1pL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RM/6oeEu";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13337606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13337606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPD4U1pL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RM/6oeEu
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JLZTR83762491
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=; b=ZPD4U1pL9YDcuEgT
	jupiJVi6G4tVmwh7ySlS2n5pvnbzewTfF6+YGf1q0twWg0NQAIIyUPEkMAUc2Gew
	jVVZZIZGkeeuHaDGtsPymIgLUMwLUcBhz3HZgEd4QubCoUEKxyWszm8uJ4ubLm/I
	u5dguqWtpJWlFykb+e+QXZ4ukLl0VND0s3L+ZAKFjd4w9hJDt2PG+sgs24z/WzHc
	pp0JOB9yK0lWVIsdbvFkrIs0p0EOlOlD6wu5oINLtYDxBtIQo+avzImffnsnSjZI
	CTsNogRzC/5cBNHeU3QRz20S/BMSrtXhKArXbAr9sk/qqGV9KpC4DeK6j1nfjb99
	Km8wOw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdqtf92jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 22:56:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5433406eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 15:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792450574; x=1793055374; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
        b=RM/6oeEueDtBfSl1qWx65vX3YEajsp+K5oPstSZfbJrJ62StbRaFmjnAa0njkwGqsQ
         VAWAfxhuxuBBlXiypreh5iG7PjLDh1wOyZxM52Zdf2hVekH+Zzl8TNbGOntQfscKa0du
         kHwOeD36BLzDKXHdQLvQ9grcIJjCUUPp8Y7ntUM1afqgLtK4TGtgGbl9187JEZ/JBnQZ
         Efa2UlZ84Fh6S3K+UR74uU/pRP90ZK75uzBhrEqwJJniMGcqq0HWfSqk9cDwEb/m0rBi
         EOAkVXhgF5warnC9+IURC3oyzjimxRKNSPECN6tClhubsa400clg/qZh2ckuSY39Tqih
         hCqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450574; x=1793055374;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7+vzN5LPoKjbpkSA7Pa/WYBwwwpqsmpM5rGqvoZF4Zk=;
        b=GyxfQ56OdtXiNMJCFWsRAyM6GHRRSGFhrRp/ev3pK3bEfmg2eN38bPH62dqnM6yRcG
         MimbiK4b/dvwWthSxy8gq8i/Qh8Ge01O/oM3OrKaOtPUoSkGGRmUPTsDrduOQixKtMhB
         NRTEcB4ef1gNxELY3dx5oYKz4EPtc4KquQPOITcLxu5Em0SESuFvP0JPV56lPO1g9YYD
         Na4a4JQIt/w4C/UQsygeyauWq3ypMCR4Byrrt6cTKmlPOe+SPwvvGHw+/CUtlOOVdZGK
         fpuIV1QiZGdAZcMyyQO64ww3FBdAgfeg1cGNs7jMzlXTc70lk8LcaEQf5bJqnVRUhoqC
         HQjQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXQBKLeXRqi1AKt/kR1xc6F6yS2o0XTU93O5Nvy4DO43zfax16LnoEtyiXT5HiJqgDja8s6NSCcAIz/CI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLfyhomkt1tgpWEhV88jVbT9x2EwEnYpYtacSR3LRSxOSf+DFFK
	2UW7v3PcAoyeYwdYW4vwzYtw+wYJlo/iEbpqZOoYVD9MDLOdAeCbOMg+58Bmv87clUqPwBT1qou
	bRs0ZNeiDevkPFcMAHH5ybMNIMkETlBBssZRBf/cJpLL+eNb5eoStR1B+rxBsRWEvgB0=
X-Gm-Gg: AYBFou0dUVMxgE/fcEAnG/l0myG3a6k9kMo01aeYZrYhWb4OPv+yCKnaIClL/w733gt
	FEQMXgZFip4ozUetL5tEdTdcnEsxf3BXNVPcoEL2p2IMJ+pYqpYCaIsbvIOZYKuqsfhcTBbFHwy
	uJ5MDATN9ZLNbousoxZ6izqQIQ4C+d/AY+jXnnqMHplI6tmbwv6dPG3COZuGZhqYQO0cv7Z7L/o
	XAfFrxBWolq+dFD/jyG5Ab7e8t8iiZbpJVB7kXRdOtckfZ+lcGHneW4qtrh7L7sFxk3qYaZvwop
	l1WHmQXFSAGJ8VA8KGn2a0GzjwBNqAUOHEcJNYGmt6XfvkJp6eZlrce0mGqxN1kV/oeULFK0a9U
	TX63j39tFaOM3h9mxhJu7D7lE9L7n9inD/MmbHElOhFJjMkw9FNmm3wYT
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr12257697c88.17.1792450573751;
        Mon, 19 Oct 2026 15:56:13 -0700 (PDT)
X-Received: by 2002:a05:701b:4546:20b0:16a:8ffd:4977 with SMTP id a92af1059eb24-185136cd2e2mr12257661c88.17.1792450573198;
        Mon, 19 Oct 2026 15:56:13 -0700 (PDT)
Received: from [10.71.181.181] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa411sm35737062c88.4.2026.10.19.15.56.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 15:56:12 -0700 (PDT)
Message-ID: <bc790885-bb5b-4dca-b5f7-5c338b809f21@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 15:56:11 -0700
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
Subject: Re: [PATCH 0/2] media: qcom: camss: track PHY type and scale link
 frequency for C-PHY
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>, david@ixit.cz,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, bod@kernel.org,
        vladimir.zapolskiy@linaro.org, loic.poulain@oss.qualcomm.com,
        mchehab@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, gjorgji.rosikopulos@oss.qualcomm.com,
        jigarkumar.zala@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        bryan.odonoghue@linaro.org, linux-media@vger.kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com, daniel@quora.org,
        konrad.dybcio@oss.qualcomm.com, christopher.obbard@linaro.org,
        alex.vinarskis@gmail.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261017035221.3816464-1-anusha.nandi@oss.qualcomm.com>
 <31bec5eb-97e0-4667-ab6e-0de662f97633@oss.qualcomm.com>
 <26e2a1cb-d792-4ca2-8530-865ebb887eb7@kernel.org>
Content-Language: en-US
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
In-Reply-To: <26e2a1cb-d792-4ca2-8530-865ebb887eb7@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpEFe/O0 c=1 sm=1 tr=0 ts=6ad6a00e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HsCFRf_u7LXHOK7ic58A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA5MSBTYWx0ZWRfX5OV6xsN543N4
 OhCpC90tEZBQGmqY1yKJj0o2epNORRn5TfeE6rFk/QAmjGTDip+6bWnh+IWUPysKQtKxNoNNQVj
 7gUzlFImAvtDqJGDkQlUeiC+yClXupafj7JKKifDJI250wMkslP/8s6eu/UAMflMD0pSvXN61Lo
 qALnZk7nCaMJnTYC+GLk3fZtO2P1mXaH72kTkk7f2W7AQSOX38K5g//AiyYUcFm8TFexnqy3ptF
 YT+KjABPxXqELek8sRrpdno7tENLbQQ2pFXDLG+1NHhhWbEUBUfG9t/G3JzviqadwFvnNX9gIWZ
 wThfBeU/TlBAlhw7SyQygMxutOLHZinkK8wfzhUBYsa55e4W6xdelWtp7FG7FfQZw6jrLRcWpj7
 Ljjxu3rmyWjHsM2NKg6ph7JjWwxLMNQpZFijzcX/xWAQEOr0Ctbq78TXJMIeNtvS9wQHZSVeOJw
 vbkqcI9Ui+nrON6cghg==
X-Proofpoint-GUID: hYaFbpFDSVG9nIzRomVxbuV9HefDpuSa
X-Proofpoint-ORIG-GUID: hYaFbpFDSVG9nIzRomVxbuV9HefDpuSa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA5MSBTYWx0ZWRfX7wHeh7sgwVAu
 bShuLuYdfyH19FAeJRCpO5j+DKYRLDt/9Rg0zfWN4SEzCNZlvUVBkwfN+g9ERqxDfOCdtHOiJ23
 xPW30zyExSamc6SHs92y9la+Ps0TRik=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_06,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190091

Hi Nihal, Krzyszto,

You're right. The driver itself does not depend on the DTS. Apologies
for the confusion.

The Depends-on was included purely for testing purposes. During
validation on sa8775p, qcs8300, and sc7280, we needed the corresponding
DTSI changes to instantiate the C-PHY consumer nodes so the driver could
probe and be exercised on real hardware. Without those device-tree
nodes, the driver simply wouldn't bind on those platforms in our test
environments.

Since this is a C-PHY consumer driver, the DTS patches are what enable
the PHY nodes that the driver attaches to. They are a prerequisite for
functional testing, not for compilation or correctness of the driver
code itself. The driver is self-contained and will build and function
correctly independent of those DTS changes.

I will drop the Depends-on from the next revision.

Apologies for the noise.

Thanks, Anusha

On 10/17/2026 10:35 AM, Krzysztof Kozlowski wrote:
> On 17/10/2026 19:30, Nihal Kumar Gupta wrote:
>>
>>
>> On 17-10-2026 09:22, Anusha Arun Nandi wrote:
>>> Depends-on: https://lore.kernel.org/all/20261017001116.2318647-1-anusha.nandi@oss.qualcomm.com/
>>
>> This Depends-on is in the wrong series. 
>> The driver should not depend on the DTS.
> 
> Good point. If dependency is true, then this patchset is just broken.
> 
> Best regards,
> Krzysztof

