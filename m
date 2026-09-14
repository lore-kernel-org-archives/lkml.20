Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E4E3FA5D0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383771; cv=none; b=ip6DkJ5esn++m14NKhU1KJp//2Tea4Zzf9+jg6Uffk+cYWLrtkSaeC+Y/4rD7u9X/ZkVhVK1QgFyrPjmDiD1zUVR0tIKwIfwZNbcDEQvB5v3aqQlQ/z6s1nN67iFLlM1Di1eto9eE7Is6Vs1GQ+Z7X3wwAW7/GnrmKilfES9nMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383771; c=relaxed/simple;
	bh=Jtif2RA99xqemNh+pGm5sjKIjSLoxIXcRkKWYQqcSgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uFZ/L5AWKz0kcBj64CC/xv6aHkB9UYLt8fgMqf7XxM8xpA4lB25i3aaAw0trjGhW7xNUnBzRgAA5Wpo1+GOMpmVW63JirnRBRgoejN3nvIY6hmOPzkI7fgB7mWI1d8k9ek4CiaXXNilQDSjMkXmlF85eX/70/MP3WNr1Yc0pWu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z9Ca1+0J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMi/vWvg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z9Ca1+0J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FMi/vWvg"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm8DQ530979
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:02:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=; b=Z9Ca1+0JZvL3kCqp
	5QuflEKmVseuabNwl5GDt8hEKQlOvSrjUllr9DmKZqM64LwjWA6zNH5zJiXpGk5F
	0nku6ocCWH8BuafjNIYYWX+/BqWX/taGckCaToKaO0z0GKx+ySuN1DrGp6E+vyZy
	THk8cDAaDwu2GEfaOOxgSKdF8BqIHqcFL+gFDpsJo+RIQ8d971Zwda58CuRlFmN3
	bE4IMf9IUH2t6LZn4KQ0LxLCDmSv3uVW3o/MAGIXcGNtauxKWi5/KTsV97YgRKKQ
	51/wZ2emPE5UBxs+BiOjk9s7rJljDEqNPFB6c3BR30O6A8qltOttpGbAkc6/Jc99
	A+7Y9Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hst478-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:02:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90e8e3e6ca0so5122326d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789383767; x=1789988567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=;
        b=FMi/vWvg/4WkjYvbjj8BDWbwMruQ0BCLo/wZpnFYiSdNRBVFxHheo2QoW2kElzIcXW
         DMlQ8j0ZKQBZlXEAes6mt+8LhfwwpYdk5x2IVMfPCrja+fZEIR5pK3QIv/kycUBKaMjk
         3xSHzMWcsRFM0sWnBzAieHyJ69Au1ogJoFC4G2JhtMX59Hrgm9toUM0FXUJ21x+AbJE1
         YQ7Rg7nh7T33yymM2idnMJXPWxQgGY05gSTxCHtjzTevlLOHu0HXAbzFZVElrB9jJFpn
         Kul4lsJ/D3zuZg1CnxyhGXyFqqOorMU3HFzB+u+UjUB6RLObAnJGotAp7kGsY7Ls7ARV
         Fdiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383767; x=1789988567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6wnE+gO60PuqLHvAuGY+mC4+Z9CstvC+Ue4Va2dTcPY=;
        b=dYNy3H9woeu9MDRoMjx61hNsuJ/Aq45WnNekaZ0WrMxe+rYrqSCQNxlkZcwHOYpv1t
         qdgpzbqFFDkkbFxnIxP3piKiCUpzcMRCZwxeqq11kiasGOPQCi/XC2boBlSMVEIS+WrE
         LwrbtQi7/gvCkwsu3EbNONilYSZJ9GpvgnGW5rb2gcu6s9e9a4RQRXlSRarXHApKC8pV
         kDAVHO5H+Y6d1FXz8DtaY1TRcBALq7yF7OTtogllyvCxWciVTQwzy30Jf78f0BGnLDVv
         BUHMofOPy2PcSkou7LT2L2byyiPn5Q5/QkD8cpULCMVLRUGrkppseJ40oog84EM2UvBi
         DX3g==
X-Forwarded-Encrypted: i=1; AKwUvBxJtT9VFmd23qeP5ZFL0C4E8USSSeC+wOcRBDLaIB2ffR1C4HXw/NxLli4AtJTjJCMkRR4Govia0az+Ir4=@vger.kernel.org
X-Gm-Message-State: AFuF++m25ScND92T5RpYaH+6mMwKXdZPUnq0jLxpJMl+Yo/oeJ/QE6Do
	xLwM7oeumg34nd6jFCApBFNURGFTlhPe64QeRpeiFGqFgVvmQCiDND4CeKsuZ+PBr3jj1Yy58Ze
	3RkcrWBhExicnns7qwotRZRsIBa8H9U+ZNO+t0RPp1fu/YhJm8tFBogP+Qc91It6fuRE=
X-Gm-Gg: AYBFou2v0GgKvTUqdWbmwgVcW5FSeF0xmtPDfXIRJnePbiAuL4timC/m0GwkC3sPSqZ
	fVLFDDij6mOGGPHt6zCDCDdkky9fMbnAxu7v2airmQwPM8J/7Y8j1aMoINCg26dE9AILi5zzSDN
	ryHoE1fyejgd3jFq3U2VOmLYyOIRckdgobBXJDphRC46UohrTcO/iPEqQ1jkuhYcnmBgQF864F5
	XYYxqIevy4i2XnuaPUp34MPfNih15cMVRUIIwG09/sSy/lmyGY//1ObcCSDrCDzcfp6NVQQ4fj4
	P9fowHbuVVO6skL96xZlDqxclW1K5UCVEaIRpiv/TNsPwGpn6pgRbwveMCqP1Ro6qS1Hyw0NsvD
	0PF8kGmXkRyPVKfXrcmrilA==
X-Received: by 2002:a05:6214:4283:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9122e6bc978mr28865916d6.5.1789383767043;
        Mon, 14 Sep 2026 04:02:47 -0700 (PDT)
X-Received: by 2002:a05:6214:4283:b0:90e:9aba:f095 with SMTP id 6a1803df08f44-9122e6bc978mr28860336d6.5.1789383761856;
        Mon, 14 Sep 2026 04:02:41 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a9b5968cf3sm4024671a12.31.2026.09.14.04.02.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:02:40 -0700 (PDT)
Message-ID: <ee193823-257c-4ffb-beea-b3e78996cae4@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:02:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/34] arm64: dts: qcom: sc8180x: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
 <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-24-90a252ddbbfa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXyh5Ff2DaKpoa
 ICmsdn/bRH009Q6wwvSSK823XC+fHsHhT01+yyDKQnwb9OjCUEu5Wlo2zVhZ24bckvi7IpOKKNU
 AMVzqTPRlF7I3bItJT/l5lqK1QxUB2CIgrrxP5YHPAWDnSacVBc1yEZ52TuYBniY8MAHPKBSgYE
 sywnH5tHck6EebmR2nHS4CsqdP8XykwqOYPsE/o8+rAXWtsg7h4ueA6T9MUjx80G0PSa3fDzxVl
 9AghaT0OeP2zRp0Ep4/BXmJqp7Dg/DDapYb7SC9pMe5QK/LbGxVGlXzHH0MNdNT6fUva5S4GWHR
 lfoUUI9UruHdqwV7R0VdvGHknJw0YJvRag+k0DX7zBC0kmKYh5qUFB86XUX2Up0tYZfQ5t3MYvT
 Jomyxf9qkoBoCq2Y30wTElcolqReVBIHg7KD1D9I9Hnf6Q5zNQZOYwJaDfjLKNA5pEfSSbRz1TY
 501z+baQ2DkMiMSXwNg==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7d457 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=6pHcnep46kEejBPVP2gA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: quVZWvml0mwf5WUo6eLuw81Rk6_QRbsi
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NiBTYWx0ZWRfXysmyl2U/HKvB
 lc86OZCH5dkAwZlc/GHsZbbqIO/Hf7FAQL6uTBIngz/2Ilpc6V/GZl5KCSsyKAiktTB+cP5WQtc
 zsoJO9yBylt9qIB3eDbwwXci7KrEjJ0=
X-Proofpoint-ORIG-GUID: quVZWvml0mwf5WUo6eLuw81Rk6_QRbsi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140156

On 9/10/26 3:29 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys and phy-names from the controller to
> pcie0_port0, pcie1_port0, pcie2_port0, and pcie3_port0, adding
> labels to these nodes to allow board-level overrides. Move
> perst-gpios/wake-gpios from the controller overrides to the
> respective port nodes in the board files, renaming perst-gpios to
> reset-gpios to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
