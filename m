Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5618F51AED4
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061754; cv=none; b=UiMi2WjenyhDZOvD4mhJNMd6+jkxg1cZhdpxHLfEK2Fkz52zVPw/XnloL6ExwOpqjJz+m2P/qovGEBFEbYILpxecAP0Vf3Uixyv7ObKRCmUv6VUwXH/r+0+uAvinGA0qo5tkR2heMmKhgE46eX4BBnMFFa98yw0emkaSLc8Bl1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061754; c=relaxed/simple;
	bh=C+eZiEQdNU3zDh9swlMW/4tanW7pYuBILnc0ncf5+gE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B5j2qm+qEatMTzJi2mM3vl4KX6wfArROa2a79STTrRoGupnIbaPWghyS0TftGDEGfp+9L7V05JQVJSOJLGpMFNktNPKVCxCzffg9Uiu0MMxaSl5qr8Bk0k4qlB5lMzwn78D/EvOz1hsv6vm/u37awHAGSsRqaoIQckGAwGt9F3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i9hfkUJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PvjkqajD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i9hfkUJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PvjkqajD"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jY5c2966404
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=; b=i9hfkUJHlEtK81m6
	p9H6hfY/FNFrTUz8p+j0Ft9TyYSh3evai63/rhLdyRqZy/040bHtIbPyNxTAweAT
	OOqW004aHVAyab/ihvOWkox7fbUGAI7CGkWBLiB0mVoVIA1/LOt45fBs5Xd591Qc
	MJCkpL4A8+XPagTB837WUUNMXbBo/70uhLeKvSyWIaaB8nhetGEckwMTPxtOsC1I
	MlhnXG8cFdFNV4aJFk3AHlnWGr+eh8TZLvZyYr5jtvJ5SPUtHAZwNa/ySKxel4AB
	EHBRJfhJ9NIC0E+nfIeitrLrXAyPAejiMbK2bwAvUfhpO1v8aIJwe4/SuszFLSTY
	eN9mcg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wunwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:55:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5338a4075d3so16386911cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061751; x=1792666551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=;
        b=PvjkqajDiRyAG86vX5go1v6gePybeD7niNFfCVGt64gkXsAB7cRjY6t5u5I9Des+I/
         Dy6vTXQC5JGC4Guj425rzQl6aPzvBxVjl4e1oDfes4owOH6AuH6j0JMsphdYX++FJeBA
         spAeqLvEXlmwROJAbr9aqGmw0LP8eVUWeDwPNxrGVpINWjlh2lGHq+k9F2bBiVUIkGiX
         ScPGjtBwIVLDaQ9gffFqum3Fro0NTm5uJCsrevc88Wwpvd72Czjn/fvizA8eWipN9vnZ
         OZUV4vXys+UEkqQuOaDi5GaQGwsx4HRIXb7Td6Y+JzUSKa4g+bm/nDtIGMpi3Lejm9/e
         CFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061751; x=1792666551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ABwLG7KYl9IdbJ2x5X9Ra6++rVxuwQh+p9U88YU8QKs=;
        b=rL/kNe/u8+CN8qoqauAOXDhbEI0i1BG4VG1WpjBfsZV9QkxXB86FNRyg52pKlocbwh
         6zsoJM/XQN48YR3FQ8sIrP4ZN+Hec9TWZ1lNQoasmaEU0VZpAzp6D48wnuc42I5R5lNQ
         I84g27vadNVRHV6/abLxyYQA3DCmxjakOfqDJ0h3TQtuAvB2ZEXuHT7Nd+IU+5LnZDu+
         eeoQMGLa3WdLnN74vbXeL+59md9Glc7UT3ZC+vxUX93WD1QF+r68zo81GyauUEoBTOWF
         dXdMSIj9MSJI0RQLCpKTgznrqBELDoGdRolczE+jvl0kHkhxy6YoeOSd+k1NxDm2s7ee
         gYeA==
X-Gm-Message-State: AFq9FYIQFPpQ24uCiBvQ6Xk4po68Lf2nIEfyvxYQubcLACx4A5f8/dZb
	SgHCWpM3DRZwnIOYzOiDY5mmMwT3pDoEukacEkX3l4FqlzPt01FqeQaljGyYZNUw9NYpLb7WZ0G
	l+Kt7ehl7Utqr61FTDM1Yg4aLuzbO+JeUqy8ids1U31M8cRNK6AP7UawF5IqvxqdnJu0=
X-Gm-Gg: AYBFou25LXY5lcesuvcpB2KEDlEF46ePLtKRREOjSDhalCo9tmVcKjg39vNJYavDh+t
	6dc8aB93ea1igVWeWPpDdgv841+hegPaDo5ynWMwgtmc5nxScJl73C4nzJf6wQtTFgw4fNeHy0z
	HefaSzS/xsU5Hw304g+G6Gsvn838pLyaVQ7dEFUeNvUeqgHailfkvBtfaKG5O5uV3YCH0nhhZL5
	X0nFGX4aMlGjkRamBw1xYaUxnK9vlcGuLR/bQxedzdntyAWNqCsJbDrAak3k0po9If7cNbuXhaP
	g/0H9Bxoy4Tw3fr9F6TOGdA7Lfs6+B3P7GS9pluK9AYEpZYsBDV/LrJDo2f9v4fSQLQX6ngPVon
	NdbMNTTRT9G4oeGj/dWMbaQ==
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr3451186685a.4.1792061750538;
        Thu, 15 Oct 2026 03:55:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93ebd23a4f6mr3451182885a.4.1792061750055;
        Thu, 15 Oct 2026 03:55:50 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b2038abf24sm2285454a12.37.2026.10.15.03.55.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:55:48 -0700 (PDT)
Message-ID: <90d33b88-d171-4aef-8046-332a518dafca@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:55:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] arm64: dts: qcom: sm6350-lena: Enable PM7250B
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20260926-pdx213-upstream-3-v2-0-b4612e3eb536@erebion.eu>
 <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260926-pdx213-upstream-3-v2-7-b4612e3eb536@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX87VKlgC5ggid
 S7Js263OTTuRtFc9V63CBwuhLX5yljW8sZu2s9ySPzl33qhKEYjfJQlfNcaeL1M60Io3WOni4sL
 GE6xzBUVNssub4R4HZfdRUpMzaLHs1o=
X-Proofpoint-ORIG-GUID: Q_mHFQ5MbDxrpvl2Ca6uT-6fvDKc_wgO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfXyN//K9wCkRSG
 TWf7QV9u6QRxAhcChIwiP4DC6imgYQF0/wf1PSSM4EC9vhdwy8sGzl8KAqVmRaemNlYY423Koq5
 Jkz6rPZqgjKGPeuhPJAkgALw0at1VsMpIIjOLbcS/GKtRHpABqUp8PfENiBhyKW3ssno87t9lrT
 K/kJ9IoHrVgrKA+MOXMWEZgwSNmwaXnJWEbdmMw42q36cWGMmDJpEwoIQPhV/ppy1GMBhu4+kQQ
 es2rn2djXYZdkcQlX0DuG+on4ASaug5elPvFB4kbvv0SIpQnavljWtm8vgu6eB5cT3gAo5W1hti
 r9nYQRDduOrGwBpzyvcN3zM7DVN6UiDQuhDcJ5u7A5vZec1+sazvHbRIcXvfCygdg5vTYRnAkJ0
 PVPK3zrrUfIiDWufOkL81C0RhBui1puPqbSKzmph/IKZWThXwGco8sRKptzdZm9DFpKSaj+JvCy
 tgy+j77FLFTmkkIl/pA==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0b137 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=JgZe5hknAAAA:8 a=dNZ_EX_IlpB_z2sQReYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-GUID: Q_mHFQ5MbDxrpvl2Ca6uT-6fvDKc_wgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

On 9/26/26 4:00 PM, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

[...]

> +&pm7250b_vbus {
> +	regulator-min-microamp = <500000>;
> +	regulator-max-microamp = <1500000>;

GPT believes the downstream DT setting:

arch/arm64/boot/dts/somc/charger-lena-common.dtsi
18:     qcom,otg-cl-ua = <1000000>;

should translate into the max being 1 A here

Konrad
