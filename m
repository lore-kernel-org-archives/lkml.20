Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792589467;
	b=lD91YHIaHUT/YSYBgu1S9VGDdvLc5q1t9WIHYIWZ9DMLmIS7VWkqJpMF6v3yxbiqR2+2
	 BKAydUQpbWcVT+5IUAVbWu2QA58p+PMr1NBbA3QE8XefxGvc5mfGkJyMIMbd+yKEOpvb5
	 JGYwayu/r0ci5aRycLlImrt0pv5p+uHXOt5CZyPJ7tigGc8QRgLFt8ZO8hTLfjh4xpwCj
	 WdjmJfDNjErjlzgDFlmZhXV0xMFHuwMKcBNmrHYeTodECcWTFkcGRPQE3rxcMYjM1u5KI
	 JupAHcTRPfvDdC3upQpcjUXCtf5CF5dnMdLMpJSPDwZdBTXCXryQIqufwmXZPuyAwAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792589467;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
	b=f/q2ssAHYW6NMnHuajU3O/USlenYiQ3gOqmTf3hYAJb3irjVNPlNvhWSkC/15Cr772Ly
	 8N4KYiTeEBKCGqoS7jPVl5EyS9diup9AfTLzh2rkgl5iuY03w/+P6hBRpnv8dd8Lm2ba5
	 OQDrzUpke3U6gFY+vSk+giqE/+kSZoiclY3WeiZWINEO9fH6iQbiT63eE2gcDWJ1nN55M
	 3N904LZRfRm36KqUH7HBjDT2RYwEpP8v7k1Eq0H6z3prILm+/OZmtuypnKpQUAPJytbIe
	 AwLISf79RXKyIWJGSeSxEx6DyNNFzgx3sFY+mnCeIsblLmJV6+lhhCBqEL4hr/KDxow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pQqs44tg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjtGRqGU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B546C606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:31:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B546C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pQqs44tg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CjtGRqGU
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LDIPD73869209
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:30:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=; b=pQqs44tgcz5pZmRR
	J+PL09h8iGzeIVc2QZKPEASJcxYzDdqWsxf9GvGSnjnYSgH2q75tEVbg6WfA/EkK
	IypXPa01tbkYz/yJYAlPQcz49lACIoIe4oRQqEc1xnyVuRVwqUeA5h3shGHaA43D
	TCb5SR1SRPnd2EAMZG2Hwwacp8fxU/UwM1BOhd2pVh79/ZhNTTadvJEjzXiA3Kjh
	fm7UwyHgeVe0k8G4Crn/yCeH/zseGrSKV1o6CHbvZU1ZsXfbiO0jO8nZPe2OrFwy
	Hse6HLN6cdjp+qRS8hc2yc4e8GKaX7s0B1vg+o4DUbMoCWug/w2wsia9Oo8Qi2S0
	moJUJQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8216-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:30:48 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so2169361cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792589448; x=1793194248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
        b=CjtGRqGU9Qrx5hv/bxLXcKS6mzo3O/w9SHjMBHpu1W8FOCWIbLaW1tmTAh3lAXR7/C
         /r83fi2i3T20Tw9IUwakleR6eE+UNkaohJmhHY56gQDwqV2vRLnARsDs082+0h18zLhW
         FplkvlNhP5k2gkDnfkutERgsWizEBx5eQbLKHPG2s6MtqSE4ZEOVv9h54Y7l60If/IQ6
         sw9Cb+CGfsUG1slkYpFr0Xi7FjSmUwq3A8bWYPi4jCpWBqeFuR87gnEtGrkTD6TcdjwU
         Jqm8QNv4JrxPSR+VpX9sgwzAHmzJTot21LJMVpZVGmox0/r4uXeq4jbaleo32OeBSFWA
         9fdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792589448; x=1793194248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WFNkCvYlYn69B82VwYOewtaA0+iFj5jL4y63+ZvK4CU=;
        b=hzBlPH1+keXRLuYjdtyJWMvjnNjoorwlZwE1tdLC9U/Ypneuu+plnDZ+pwg/M1+0UU
         lVmblWw8rQ6NgYfdxsui2l58sc7fldywUAa+QX4ZrUX9BIOzOfaNJlQjR9Uc8oRGd0uV
         zTSFYczdAc3z662n5muJDZw22UNdnM9l85YRIGsUSSgwWfeNsbqFR99Lry1s3x3B5uIT
         kp47fu23W9srlR/Bm8UE0SH1jUU3SYERxnGV6vfiBeErXxo3z1i/RP24MbfKCyB4ZkPd
         z5w1XbLMrlcjPDomsPRJ6gsUb53z9xSYKJ66ZBbJzU75bq1DBWN1XRoY9Coa0OeqzT0n
         9E7w==
X-Forwarded-Encrypted: i=1; AKwUvBzI2bpALTQGkU7pWkxHxn03qwM8Ru9TqyUrDxvfAdHAyJqS2/LpHY2d30N+UV+PvLKauZgEawIvIciezPM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIvc0ibU4YcmocpeRgEv009LXjLO0aTbNoM/eNoqv5o5KG8Q8Gg
	rJXD5o4OOCHzdSgr7sWgOXEKDH9YhFxz0eBr2waxVERQrLSA6a7AcNr5NokmPdLMmEumP/EsJNj
	qEZVyEs+VWya9VAMq5tlISSL8MJrI6q1EBUJDwvwiOju2qwRK64/hqY71nN1WLeQ3oWA=
X-Gm-Gg: AYBFou0r/GxzmpnkbDkERLVKrtNhYn9hlRwmkBPVCQh2yapwoRFfFevpylEC7qJntxn
	Ia8yEQtcuxImyaRiRW4OhjoDr67MvX+mVvScGJyf5SMPK3lMod3UZJ3aGe9hgbMlBBZzkukrAw2
	astMDrSBeiirMVMhv9Xmh+u+O2Xa/UhHq+RdQ+ZWQER4rBTYOh4KNkyO2d77uW7j9PFMGKbRNL2
	eg3D6NPyLjRfeg7UhYbTBNosym5GqqYZPq5MOgiB0KdKjKYtRi1SLMQFssDVyt6AT2HtpjHq1wJ
	UDz3Ye/kt9uxRosGPx+8U0CnMH5Yhu0mE1FioI0evVdMlkCwOjT2cNTV1I/iBAOhxn7fV3vTa2G
	dFS3OUCeHx3wDCBqI0htvhg==
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr478786785a.0.1792589447770;
        Wed, 21 Oct 2026 06:30:47 -0700 (PDT)
X-Received: by 2002:a05:620a:800c:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93f57dbbb66mr478776485a.0.1792589447109;
        Wed, 21 Oct 2026 06:30:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa1224fafsm523382e87.63.2026.10.21.06.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 06:30:46 -0700 (PDT)
Message-ID: <64a9cda7-6a0a-467d-981a-46ad1f4345f2@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 15:30:42 +0200
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
Subject: Re: [PATCH v3 5/5] arm64: dts: qcom: maili: Add base MTP board
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
 <20261012-maili-dts-v3-5-8b499e7b9a52@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-maili-dts-v3-5-8b499e7b9a52@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfX7wxhIENP+4+l
 nLO5wMYLhQ/eYHbS7iY7hfJgHAYEOChD4XyNrhdAmhr4e4ttEvhQ276LSpT3NyMRxq+Kzdu5dOs
 iTRrjWMjqx8SNPExBRtocqFl/Rn4t6w=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8be88 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=E_2GH4zMFfp-Yox88fsA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: yP2bfgRAFbPM7rXp9iG0dEhLnYkK2aRW
X-Proofpoint-ORIG-GUID: yP2bfgRAFbPM7rXp9iG0dEhLnYkK2aRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MiBTYWx0ZWRfXw8XWZUNesQOq
 xui4MLQD5hRuVzLeuE/o7BoYj3dkBrWGkMx1jXFnBGAXzy/pVxR0zmiDpGYbId9kaSvAKjLflhd
 TCVlom883XpKCeSgZfzxVom3xDT3atMMK2Oqttehtl13ztKPK+jLUyjf8WrmAK9gitncaqXRb0V
 vgIiDCm72qRE3eO4jm/KHxlwBi/d+LzUTojZJQxjEoZjb+vqCs+aXdxYiaSqCLtZ5VqOuAEyXr7
 xzIzvo4KDzSHwSnBJFuK/xscjaHSm4lQow9+0Q52VL5U4qa1fiumEe9/XgN9dBMITg2q6Trm1vU
 WhOoFqAoQrOgB5bpe2lDyITa/BOMf2zyAEmnvLmPJTjr5OPA9QYdSiihw5A+HUl0j8YQ9rC3boN
 SFr8VArO7chpMjet9I3urzT6LKzCRIKugQzoaFQxuwozfW1cxjea3X881EQAy3nhaU/BcGHeQcF
 A6Fog4fSCJn8OUl+VGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210052

On 10/12/26 10:32 AM, Jingyi Wang wrote:
> Add initial support for Qualcomm Maili MTP board which enables booting
> to shell with UART console and features including UFS, remoteprocs, USB,
> PCIe, SD Card, PMICs and devices for keys and LEDs.
> 
> Written with help from Fenglin Wu (added RPMhPD nodes and PMICs),
> Nitin Rawat (Added UFS and SD Card), Krishna Kurapati PSSNV(added USB)
> and Vivek Pernamitta(added PCIe).
> 
> Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
