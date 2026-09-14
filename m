Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5F33DA5DB
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383717; cv=none; b=lB2+eXPYZ4VgtBc9MzI3+j/GM/YWidemLEYqpQiGzA90OZV54BGZK7k9/0PPzWox25OqUYCHtFeVcYi5AwhdDwNA/lOS7j4FwocAdFyabC7VRAMbS04x9/P6QjaKg16z3uBuHZlvyYonj+G9Fwa6kBh3L5dnTeLGPOiQcREVaSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383717; c=relaxed/simple;
	bh=WAny7QdWQoRZqoQZqKkBz2B7L+/1oBvpxAVPoMK7GUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uS5tIcjG4sYfGxnr+ypjIcAzRYUIpuyZJKQ6AL7ocm2PY7MxxNG/Y8hJgU0AE/JAhwqqMCWwlV3GT2qcGL0M5yjea108XL2AqDp768klSFOm/MFY4sMzjLiDR3/0lUq+q9mNZSQAIrCMVqriRbaVnjilO2Nb4iNN+5E99b3byIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P9xWOOnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RT/oZsqu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P9xWOOnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RT/oZsqu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm0gw727550
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=; b=P9xWOOnUmk7QRc9f
	CicOBz1sN8+BOXvw81Eij+o5kkT0/xNYhz4Dk58Q1353yKS1Y+NsPesUFQSen9oG
	v5f8IZvIe+rtBQGfiHqCS7Gj6BpQnTH3p0+dU2xGI6E+PTiCag7wZKOPyGEiXY+y
	2m2gB81sWzRoZOoHyyoF4Xmr+g2LUXeY0umjwJEhNBgFVGkmByEa2NZ/Ip1CArk7
	omQHCHXHy1iv0NWQTVQVkO4Po/XhejVGJ3hOh5ie9s6fF6MnC5Cuf3x8k7pYELfJ
	V4vQfXY7RbMAyHbGwjNHwIms6rRFAin5CqAvU3zcqHfEODsIPIx+iPUY25sd8oEQ
	4BqSPg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rjvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:01:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9106bb33cdfso7346286d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383712; x=1789988512; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=;
        b=RT/oZsquyYg+z4rEeKq7mxZVFSh294hM0taXL8G5ocn+O/2q+2om7uatuLVoOhUekg
         OXUsDAdlSJp48oKZZCwNt5wiv3zf0+P5Fes3d+mN8xV5nlHwekCG5quEf1iDPPfs12OF
         jTZNiDZuukoAcjlZ9u95jRgPdU8dFYFU16v1QI5iMnj+UE0xocfkKenArunoXzH5K2jn
         dBX3Q+C4polRjr+ijRtepZJZObtYbL91sjOM9KtqSOcGKE8hi99RYGkxfOb09/kcFgDo
         5w1QzXjrTbth22V4aOSU/b/Yv88cAl1ugAGM9l6CZWTzBQ4ANQrphP86gxFqFA2RG3CZ
         I9Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383712; x=1789988512;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kUvvicmf1Pz6OHRfECxRkbI7E2RNpSBZJHEI7jBXGZA=;
        b=TFuFbQ94rdyIaAPhmP/LG23wsVgJ0/hOJ7BrDTUz5FuI8o7vosynjznwPqirTobTCv
         p+Cu4iWOlrK1M1A2UuDPMBOqpiuxQlN5NrmDa7YqBrkNPXyjpxnp0Dx1Uj9AZRYutJC2
         a/cveHG3/KAdVAryoUEtZVVeMotoTNYyVrlH9D+L6+YtFmKk/J7hqujhQlC9JK5rDnOM
         ehOfrNmXwLF94MJjWevVyXweWpSVSaEsVLiWhEkYFOwdx0znioCmiywzPrwUKMmzz3Qy
         0nW2/cF30/uKfWHriyakU6lxP3Zl3kOWXBztMG/yLurGR3IJUChppGxMZ+pZ5q3IHimB
         KhOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMr+E9CLfDKk+B3WnXOt2YNWwGN5mqyfUy+USaG7EyP6bFR096zkNDtNCEz0CRC+FmNIMYfiTfiJRNbU0=@vger.kernel.org
X-Gm-Message-State: AFuF++ngNp9zf83qH68KPPvpwr61aQPhuXBATcxNUKMLBzsTI3j7vXYW
	n9PKPYOmDxDZhWBr2j33fUsxeXoDTyvH31TdJGwk9+yStyzMCTTpD/gqyMXljZSecgfJurb1Zw7
	6iR1UQE3VKmEYoTNei3QHAzlx0Vxv0XHqzsWTcLkG9iixANNiswFlSJaV0L2Ffal+rZw=
X-Gm-Gg: AYBFou1jCRTYmpwanjDoXKxQ14/ooUqzGlAN8nRuu0zBGpc9p21h1dypzRqpuc5SUx5
	Ni3DZXsLOeow5ipCmYRr9wYVJLrc1albWMWm9PRkGRaPxgGjQ/KpmXwWZG8jXERrE/s8iDKSfuY
	o2kyXmzQc/mS9AgROCUtsf6ztib+Fv/dWa7uW39SaeMFZcJYroTZCSXXrmqZOBuSaYmVhhQFSEm
	u7laIA64Rnyb4NCMyUtpC6Qz8TDoOZc9yaxEN2wk9Uy36NWiGG2xELadOCPnPjZn6SGz5PeAMj+
	wAtNe7O+LEUp9cjuyf8TxbtJ2eUAg4XeHPMIanZTNiK8NvrmuQXQ6fAEPyaJkOa67WIkU12/tYe
	A9oCcDxiNpeML6zwiqsf5Sg==
X-Received: by 2002:a05:6214:19ce:b0:908:2053:b57b with SMTP id 6a1803df08f44-9122e6f2b03mr25478216d6.5.1789383707521;
        Mon, 14 Sep 2026 04:01:47 -0700 (PDT)
X-Received: by 2002:a05:6214:19ce:b0:908:2053:b57b with SMTP id 6a1803df08f44-9122e6f2b03mr25477836d6.5.1789383707101;
        Mon, 14 Sep 2026 04:01:47 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2966122101sm409951066b.54.2026.09.14.04.01.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:01:46 -0700 (PDT)
Message-ID: <ba6c9962-afbc-448f-86ce-3e21e609bb5b@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/34] arm64: dts: qcom: sar2130p: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-23-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXxRxzNn6FBmvq
 SRDjC0lFzVJWM3uowt5a3l1spL0rKfDP0f9T5gCTGVn6bdyEcmZhgmOkFufna//t2OzAm9tx/Qt
 bGoA0VbkR8+02N1i5xjsAGIdu1Y5Bkc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfX91vxkE+ocDd9
 J3chJ07CcUL0Px+aoMA9DZEERrhrouJiij8eqjWijTsNuNJUmMP4M22fY8PDbUZSLF+aXvCwvDK
 KA1v8ltscGgPoQ63tRx7x6m2XN2BmPfAmLDx6TNxatWap7yFBOLl1NkSIOgOX40gFdlTwCm5nlo
 F7foD/LyROo6p8DWyncosprW0TyJyL1mxIa+b9/6F2FhtpT15wduMWtAt4Y2dSieDPXPH3v7fRH
 OOt5zIZ42sxWpqCXqucWNQS2RUJrrmBCN2Zu+jAO+3ZKQ6QjgqTnDpXj5oAYKr2NlynAUZ192X9
 N+6n7NUwB6KzALwJsbWtxFYoh35fXLWTgN/NRUsB3Kn+I+pBgRpjqg9JgeZvNxhLqNnwceOYWzT
 mMiz5D2ngLN0QsqauCa8g3KLRBUr7iwIxGWvVXC2bPjlXGHMTVYTrCCu0lyGOV9nQVmcfYzeguK
 qVNVm29CJQoyBCsH2jg==
X-Proofpoint-GUID: fJWyBjwK3lA7HnSs7OvEjGiax7gBbxM8
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7d421 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: fJWyBjwK3lA7HnSs7OvEjGiax7gBbxM8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> the existing pcieport0 and newly labeled pcie1_port0, allowing
> board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
> controller override to &pcieport0 in the board file, renaming
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
