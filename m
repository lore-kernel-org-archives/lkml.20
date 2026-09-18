Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A44A0F1E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726156; cv=none; b=M8nguL0YurpqSrS3zmKVdtL1tIoxKS3lAXPURab7p5j6DeqkR+1JiaKHB9SoQhZ1rGloSr0PTC4tvjy1HExNXlZx/XaGlpKhA5DtIAjm6/dbVt3it5bPTp4H3aFaD7z/iX3i0aM4Tc1iGDjKoWSg957/Qs0woOnjhc4A5PD6glk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726156; c=relaxed/simple;
	bh=PdHZlWD9stRXw95qKhpl6GcX5DTPEE/+zggsNCbuTIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=egPSXQ1hCjpEF8HPKzXDX3S75wTDLnomaiHFZwpIvFHv82DpJFgeoD7vjALvIveHjQUw2MKMjLEdDCYtZy2RWSpAZSAAAmhfrVyGkCIWBOy3CzSrKzhnBUQNW6CbIdOSZMzyXk9Pott/YKfO6ushPHvKMy3tuFp66CyiGKuO5oI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LqOtuCAA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RfVLDy8I; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LqOtuCAA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RfVLDy8I"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68IA3k3r3208695
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=; b=LqOtuCAAc+0V0MqO
	kjsdn/DItTqi1uN084zlypVQY/pCnPnuMgHsHdyMPRpGCfhcDV3PFA7jbiKzfehA
	OmC7uFYddN4YjWeG7Iu3YJwPweKm9SCjQ4z9pQ9CWJUVyth0QbbzHpZXUSHKUiKX
	7+DLKuc1xmRPUsoxU9v/HmEvEhSx03GQ1ycKWlQUH8H8BIcMMxRYpMroZPhupyz9
	tSnwUfyj2A5VzO4IcKOZfCaQyz3FlDt78mWpDl2s1XIxxnm6qa5qpRrvuYwZQF+d
	1vxDL2HKyBA4dEChamsSVhWKzZ94OEiDime8q8YNJShhIKaFEn+WnH6U4fUBQTnI
	NWbpDw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs37dg0md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:09:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93821883e26so19389585a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726153; x=1790330953; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=;
        b=RfVLDy8INFpOzz0CzYOwaJI0hn7p3p6W4v2A+yq10TRMXQnH7Xgraj8aKzocM6rZT3
         QIGrmNE8Oz/tqnuWFwxpMVbZ3FuCYCKw6v3n5rZnQPbTqA7yEnPDpxPvKZMfDEudDxiU
         TJHUdoZC4AG5rrHHVAkZ4vCPvzpkEuBB3s9WRUpNxUWlqi1EN/d2dmtMnIh2w/JvCFP7
         0+6652o5UIRnLJE4E3gtiudIZ1ouPMGmYRQdKHqsN5W3GTWnMXsrBUrvyL8JfxxBBQR8
         ExfEP3fgok27et5L/TYtBbgZQhVX3QDVGD9up136GE2NT1DAU/nGokztkvSfwmlK7/c6
         OY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726153; x=1790330953;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l7aH3G+YIfHjUylzEkTWI9QbsyYLvYVeAmPcb5XjIHo=;
        b=wbEUhEgBhv/x6foIPLM5hB+weV1v/PGLKHcoL18nHHOixwivsymaeMSIAG6cm7zXq6
         ZyjsVNIIppJ2kvXtGYIDNCsDL4PvMGkICIzxWzGxHPTo0BLmnTSRehEBRh32ZkHYFJEZ
         7oxZQTniZR45BcIh5O9NHZDS9meFqIbVMzATNQYSA8rWQo0VbKW2WWxu09aNqMQIvyvj
         6bj0DDnl4M/9ylL+vm5TRSAPwGQbqcHyVeAQtobd2R6pgxxDw3pkSYQVh8zGt/96SMWi
         z9nil7whM2C+0SCL5esnosMOLaXU9np3U4b3tsOYBnrSAIsUWNBQRCZve0haJnOkEokR
         APRQ==
X-Forwarded-Encrypted: i=1; AKwUvBya18dF50w3hCVF7QRe7mtsG8yt5ijRiVYYZBzO0WbrLcKuysusvasEcYluBf9FWF7vEugUs8MOriIam+Q=@vger.kernel.org
X-Gm-Message-State: AFuF++l3vskRHjw5TjQZVsnOHfPXfP/ng+sXuNMl0nO6v4+pYD8sGWhu
	uIjIit/MuSM/fHGUEI9FfK+JV4Dt9YVm2idzYGhG85IwVTJ/IObYBnUcqjWCs2Ad/7zx6jrfYmT
	QDzYV2cKXBYUG6ac4W+NPN3d/Gq3MwrDVOGc6IpRlMpDChs42EA19i9cIIFvH+YtsZd8=
X-Gm-Gg: AYBFou2pB7eMyqexX59jcwQKaHRk/fSLJP/BdvNjlI1Hm2xtCv8Jpzy3URFMTWtR+Ym
	I9rLK7kj66ggRR5AmcyTcl3plj9Nz38+hmgB9F8jLYTKSETm6pwhJPn+vDP/447PM126PA8AT9N
	HbSLVdYdHQjIGeltAoO++3tO8JH4NaUo3fgDIfxiuNd//ILk389xLtW6rssbGykAfWuihdQ5zd1
	HHzU7VVy/J953KXhMu2a2y01RSV2duhXfFDr1t+GOv+Xm6HXX9mZs1BQghw+imYb+smbuSbJt2j
	O6G/oBmgAZoeHDtPS1bUdDcieZHZPh7WrS6BsEzXf5uFwVyQmKY5BVTgEe4YwTWqewmIJO9WORQ
	QIFZ9Xx5ofiqBh2uh+FwI9A==
X-Received: by 2002:a05:620a:2704:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93bdc6df676mr293460685a.2.1789726152633;
        Fri, 18 Sep 2026 03:09:12 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:93a:3e11:e2f9 with SMTP id af79cd13be357-93bdc6df676mr293454085a.2.1789726152075;
        Fri, 18 Sep 2026 03:09:12 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb88913sm40882766b.37.2026.09.18.03.09.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:09:11 -0700 (PDT)
Message-ID: <f1a7e576-b84c-40ff-b4dd-1da6bc0f3990@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:09:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] arm64: dts: qcom: lemans: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-14-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX7dWzsDquOcJX
 LbCBpkcq9G8muSXm62lnEoSMbhCTuAyF017gSGcsPY9ZzLx8Lc+/Eecc40qDGTO3WIP74ZYiPyH
 onQ/SjMJYILNc5RNFzgQzSjNjdIGDu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MSBTYWx0ZWRfX5mGKv6hoKmqY
 ubkvW8EwWaYzT4cjswebF3bOcGaA7ZV1kqUjwUHuxRKnqR1w+ED80LgSPSZsnddL+w7lc8Z4h7+
 4DwDoZe7deM1L014d7TdIwGb+YB9WkEoVHX3c6bamFW//OD6lazCdV3h+Yq5oSmkMtbeXF9D/gn
 7hBipJtQ61Pij7RmdwSpDz3I0CvSV7cssSSGloNl3JsgjI/qUB5PSvxUgqbk2JLTjCeemBgdpx0
 U8f96fUItAg3ualldBsblv7R5zfdyw9eALnLgxIj20wb5Pb00FRbOiceC/MpsNiLsbBmNadiFZG
 Mpl1VWP6a8WkpcYW8TLshkLDSur41JlqkDR10vjc0qWC/q+tmSDCSHsk+IWwgkR2nQMBrlvIe7O
 SwcI16LF83feoVCTnQqHkVy338aqEni9pEHiH4AbkxU3HRT47e7qfokyKtqw14SlEqK3jVyiInp
 K08FRB2+NhjEpMeVa4Q==
X-Proofpoint-GUID: uHzbYEGQUXIAjvSO7bnhAsTRCXHxLkcc
X-Proofpoint-ORIG-GUID: uHzbYEGQUXIAjvSO7bnhAsTRCXHxLkcc
X-Authority-Analysis: v=2.4 cv=R+mWitRX c=1 sm=1 tr=0 ts=6aad0dc9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=CLDG33loBYVu3UNdBq4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180141

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcieport0 and
> pcieport1. Add the missing pcieport1 label to the pcie1 root port
> node to allow board-level overrides. Move perst-gpios/wake-gpios from
> the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
> &pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +&pcie1_port0 {
> +	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
> +};
> +
>  &pcieport0 {
> +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
>  	port {

ditto

Konrad
