Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E4E84B7A5C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726010; cv=none; b=FoRCa3qB/wkdAXRMuGslBxnDh9eGelMJNckqdqVQhqgDlASTIbjxk3AAPrmojKpuLsC9kPgTEOKwpR7yi7N838MUcXQQg4/937jJgUcFcGof9xL5/knN9AG1zhotKdHax82GAdVrYuVeZmb/m7zBjr1bMH3QYKyewlLfbWKbGQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726010; c=relaxed/simple;
	bh=xLJMw5VUo0mVjCzcec/GKVtU22XKIreQS8drxGreApc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mnajvG8hwO+H/H3aIoDi01xjqhzfW4n/J2nqCt9l/GbSwfFbMVTQyARtdhZyii8QLHY9EbjWjc5DcgyN1cRUgWTvAqN++TEjXVI5qs4reoeuWlWFGILWZZuZ/3oBmCdsjXnMfeZWSURADjX8RJ+bLTeoiAGt4JJj7VaG6VGYpgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xoy538PE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnHF09Ip; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xoy538PE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnHF09Ip"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dRtG860377
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=; b=Xoy538PEU7uNsmgg
	oCJfKkZxR8+t7Hy0R9dsgbBU+6DNHaqcjUwgplVtmq+7Bx1rInK03020q5Pf5FMR
	67LE5aYHHsf03MLUz7+xcibnyWHAIcNwdwGOWM4o/MngyZfBSmdM4mKOG90Q73Tk
	wFUPcuFkq6ibeoVeA9lmxKPp2o61+uW0kFFX6A9i2/IC394NWhomFluJRMVI5GNG
	Qj/zcLQ4dtwUrkhX5wBzm7IzzCa3wZp5SsRYMGN8cfNB6BHg3NUmvSaBTfL0qPZx
	BiQGuDcypp/kJit8RHrBhhmYL1ygY50rLEU9CIAbTt6CIKIIl4Qtqn7adcbi0mRB
	ddnH0Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gs2hv868r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 10:06:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-930a312222dso12344685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 03:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725997; x=1790330797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=;
        b=AnHF09IpFxrgxuApWknN9aGbeLu1vfLKKcm9mqqdY61SWRoXJ+2rso/qhohDmmI/ds
         Ku4R4NjYGlYYBA7F3jbIng76ry2bxbabpD15T8gU6f8LPMYdF7/VXADteRKvdbnmK2XC
         /UH9zzmCZC/3Ya9ciFBBy6EkOWOwdEMadkl6x/MEWPSkQNrgEeLrGGICRYb9OikuvvzB
         bieevnWySZBHoEpFISfSvINjS1yT48z10W1F2qbOCnh+cpvUDwfn0Lwxq00R7xQsOCne
         BtWHadZq/8bh5PAIPCtqG7ysCZIwIcL8zbCiy6p6oQ8fsWBokt1B7dNirGvP9DxdtA7Y
         N6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725997; x=1790330797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qOjayDxG2GFpCo1na1YsIhlqgQg7q43z94+3fvFPMHA=;
        b=fBOEnGKv953sqZdAJa++Sz2jm835AYQg7i9PWyvtjVp606iZjaxd77kgkJ25EIHRAC
         Aod+x0a8PGMFejNtiCfJNvICdztKNSktkd9bs0cQfv/Chr94U6XmnOwV5hjhDDgbJSe2
         aGoska1IcOpcOxsivt1FPERsXanmS2Vgrs3fxkgfkbBaj7rqcbVnuNXSL8Wb7G58RlON
         GNZC+dLy5ry/UNY6tDr2ihvlj0+yLyROS//0uIdWsU9VzPVdnMf8uouN8LhOx9eQeR59
         qpBfxa9IY/9v0OlthO0j03WySaZrjUfFc/6tITmiCXE9furR1Tc0TiQhcoPUdsKZHw55
         sugw==
X-Forwarded-Encrypted: i=1; AKwUvBw30B8ML8qTJRPkuMwt3obv4KOA3zsLiPjnaRsKLiUrSn8QyGoGfInMi/75NAoAzqgBJJqNU4HfsZTLtWY=@vger.kernel.org
X-Gm-Message-State: AFuF++mwlOBWfUH3otAl7EOvuGqrqKCDA+0MfGxIK0EeVEqT5+y9bAXx
	pkVfbgriFXZkJKakCNbtrwGFQ6sJWlkHdbWO2gz2ZzO8UrNpHKxtfOUl+pztuKfxr8VBCirXYt4
	zzJlXjmlRosOKJbv4WSed9kLbOUwQkT2QwVBJcjNPYJ35EagaZJeAeRtHSTGPAIgAjfk=
X-Gm-Gg: AYBFou22g1WytpW2Kk33+wi1DBR/yYbSb2y7oGYkbZSizHIjWXFDF76ErJbp8Xd5Xzm
	e3Ga34CBRroLjrZ9BVkiJ45q0JesOeE8kfU1ZhZDd6pDLVGERmovRyq5cPCKtsqlPvzcgln2QSf
	mQl5RF6K2PLSLwKd/6AGxo7hbEKuwBWwEe+WMrdqwRTUZSYT2de8vgIxWJ7ryGy52uKIahA37vX
	SrY/8+Le3QCzliFcFlT6+pXkdUTmSTWZ4Ef0TVz+Ul7A9rv7ZTad6/67DZB3dZjXsK+DirvaQl9
	HAmpZA2sIkW+NRw666w5PZie4DLXT7yJWscjjQa1/iw5svNO+PJYHBWJvDmXtKb1dnUCyxErNfM
	xVUDJWLfUMSE22elllWwOCQ==
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr185228085a.3.1789725997719;
        Fri, 18 Sep 2026 03:06:37 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr185224485a.3.1789725997331;
        Fri, 18 Sep 2026 03:06:37 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb08182sm40158566b.15.2026.09.18.03.06.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:06:36 -0700 (PDT)
Message-ID: <9858713b-031a-4b91-85df-4f3854079b91@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:06:34 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] arm64: dts: qcom: sm8250: Move PCIe phy and
 GPIOs to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-8-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX0oDQPgad93a9
 CgGlJsIKDEGuvAxV0A5xSFgRk5EZEMUNmkkfNOcNsHsvJUcURtVkiEI4pHrGQtxJQ8+NZCP8pBV
 y0/Oglsri0jVtZarMGwzXpIAmRF50/8=
X-Authority-Analysis: v=2.4 cv=IOWXmQvG c=1 sm=1 tr=0 ts=6aad0d2e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX4TojCiJXx/NJ
 wE9nJnX+DHDA7606DN+GWEgn5GZM6FDzVB43pKeyw+uL2FoIfwuXO0U0YS3z0DJJQ18gMdYUtNs
 7UeFGfZ4jRUZJH0eX3umLO60urg2vhDwcpXkwGUDFrGAm31kPfEU2BNv6qaa1zvu3lpVAtPzaGj
 iDY0cHup+wYTPWzfVzJy9ndDkLfS3ywo2YX8ziQNpA9UFjCm+wF+j8ZPMrLi4z1pEZZ+IM83N1A
 SSuaY4LiZjihJM2lsBEyFgvma1SqdT7TSuEGRPIM2wpDkVun32fXdT6/gcB42J7w1dtMw6luJA+
 /8GfKJeqZLlZyZy2rUf6EtIys37H+3RxVT0j5DjlBjE4HcN5o4Iho/8P5LZM7WiTr5VQCPmGybk
 T/Aojy63wxLRcTF4UsQLv9j0zgZuMhjRj99sLGud2WB+woo0Zf1OiCBxaRHiAsvI+gR+DGeOzP4
 q2Q68G37UpzpPUDbt2g==
X-Proofpoint-ORIG-GUID: ZP3mMxh2jGXfneJ1yGErJ3pFGV7IfkkZ
X-Proofpoint-GUID: ZP3mMxh2jGXfneJ1yGErJ3pFGV7IfkkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys, phy-names, perst-gpios, and wake-gpios
> from the controller to the existing pcieport0 and newly labeled
> pcie1_port0 and pcie2_port0, allowing board-level overrides. Rename
> perst-gpios to reset-gpios to match the binding used in the root
> port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
