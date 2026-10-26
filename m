Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018390;
	b=tz5Ca99WrXaF7kjRRsRYQiIXQ+ycA936akiTCkr0jwyPWXjq7HJGFBsD+rS0XRcS370q
	 cNJh7l1h3/gGmRvtNIU+uYaHexajG+JYVEXl/McfuqwX9+J7UEkM8DRHqHiwZvlGSQYli
	 fMLzSt0BtFFkK7mQiICGOvKd5ykYPW9M2e8Gu0JHSaA7fl4NbznkYKDx3Aq54bQnszpio
	 6NLoPZC21N9uaoIlrWW4lV7YHyu7wuPKO0PTJQeBwyg1NuXCFTuw0vetUODctmFrOEuzI
	 z8NApVIfBP2GxLtOQf8F9kibhC7QFcEfXn90AF6Xt2/0acvz53pO3qb2CduDjXfqxSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
	b=4JjrPCPREFYH1WRrQK5Vu5l0NoDARKq5DQyA7Ph11ZnCq5eadBSBXYbyIiUGw7c8dfUK
	 sIqtQJGrVzl/wFDfndFeZnXV8m37sNtl5wNrHSnP6eC93rIR8zmb2Mh7MTt/BR2A4Wwv7
	 0xCN16nYiRPfSHZxwm8SpeJtvI3SJPURdCuZnzoO64SRjd/GIkMR9/6a68gvrERdfjIUg
	 nCXs291tvvCwcESYSToZB8qeJvUsgOq0X0omNr7VlPEz5rHrYCeap6u8m81VPdnTP/NDO
	 HxHxW+Ekt4HKZdeB95DEwfBAN4Pe5RKWL1/Fu1EL2kdVz1bOr65SIEOVAYm6icmDlHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFVWfLNs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7bFEDlX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F95606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:39:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5F95606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mFVWfLNs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V7bFEDlX
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtKrP3563659
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=; b=mFVWfLNsjWIGvAe9
	ahqatTBNXrOW7rBEt7J/1Zj5eKycgNyFO72FzCgv0Hnnc2+qd0aVpmT7GZXIGDqk
	rXHeepTWTpjU2jnwRX+TPwavjcmSaY+tk416jVKV+WWc6Raobc3BCAJSr4ZcNGHz
	lAXJABgdXo70CGnYt1w6qljKK8LL2Jwg5mLUs0meA2Bm0PKd95IToCrGQCcVm0u2
	3emUM7urahv73bHlcaRmSA3K+GHfWZVD5+0cbjXJDqzzXPEdnmcd1W+nWcMPZ3sq
	Sr3lk0xXQ4m/wizgjsEfa6IwfsVH7xTrD3YuuybZ5dnJH9pp41dgmpXxsDxXlTL+
	Qo0vTg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4s90ktw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:39:48 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cc0ae52207so48545137.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 05:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018388; x=1793623188; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
        b=V7bFEDlXa0OgAa72h9HJhGruRotZbuPkT1L9ajtfGn/o2J8d4ZLpNQqPTQ2mVrKOqz
         PQRSNQUoZsOeco4GubqgBInhDfAe3XdX3AepTQjybb4ClckutX1aumRdRBLrK+xs4Meq
         DlEMMj1SkkEn8RwSWgQuFguviEOXdd7gkvv1Hc9hJNUNbV7OJ0iXg+sm/PAS6ifjkowW
         lyxl+ykViAAeexKHKcHWi6J8lwAuRn2Xm0VZR4U8He6ssQqzjAjijpGfWOTbvPTWSBxt
         fpaocdgVENg3ZBwjUz66Oi5SWXsQh8gQLF4Ko7WO8TPF0ElZyxAj4YgZPeuFIG/S3Sx5
         Or/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018388; x=1793623188;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ja6gmdD2JmGFs0lY8XP4mgS/BSc4NsAvuUJRmdYg7kk=;
        b=YpQPiuD88MEW8MwH3c0h60JAHT13OHL33a30eAq3zWEsahMMxq1vz0r49QiHbYB170
         1RdsKPQDwYLXeONa4G0AiY0RRHljurP4IWFqcynONTsV2kQhlSz6fhfvvwCKVlC8PN9E
         JFjR4zbAM50ZJbNv3aRb7Xch0ivgVvcU54dbA2M3hj6LaAzNu9kdiQ1wNomtSV776aH8
         4rfT8+elxHj6cxxnH2MRPlwwq1+PuNJuOQXeV5rRiXLNhADvCCJNIoJYYENvmKsytwN7
         0QsLlchvZ3Gd3ldt3PrfYbZ8E9vQqgQ4SFoT50lt/bi4i4LDJ1BUgRNiesR2Oz7oUzZK
         GMhw==
X-Forwarded-Encrypted: i=1; AKwUvBzhjdEf+tDPzFGQEc0VPOd+FcvnNhAV6zWdSRQDaU+wptemcnGKmIB0Wor5J2RLgrk6Jz7rqOT9kESOYT8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJr9jstB//5rXxA42Il/R47VQ041gf5buwTiATsl/SnmGbOb/W6
	HWn4jjfmKS0/iETqd4zHW6dXCGOl4fzdwDj1NSEuiLcaqiXQmGZ9v5ln8FQkPi77Q7a8UWr0k0a
	Zi0ZJ1pyuys7quJcAjHjratFKwF/9TjIfrLnQt0H8BYGdKlXimk0g+r0tUWi6LvOgIKo=
X-Gm-Gg: AYBFou0grsqFrFAyyFVXxLVvksV3opCFrgZY5XJSB2Kf6gJX7CAHODD/fgeZYEp72AD
	RtsQtHICcfAVrB9f+GlmyXCqxelPkoKIiJUV9ihJ++kEvozA9udQmDlX7GVz220YidQpvTqP4c+
	5eKR2SWmcygIrTeIXghhuCUpkVHXZxjbFv3NCIWC5/eAwBk5rNpqTzmuwlmD0sWu4Y0tta+fy2F
	SRPUqyuI0Lz7OcEVph8dIOUjDaa4V2OkHr7gbaH4tRoTub+3z8wfBe1ueJOLn1/hlafE+jNtRNA
	4e6zN6iISegNoL0I7p0OAnm6uc4ROaeiz5GTG35Z+pblW3y/Cyf1TF+PEJNVFXTclS4Td01vibx
	JIUkSGVrmI5tFtQdTBoA1zQ==
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr1757894e0c.2.1793018388212;
        Mon, 26 Oct 2026 05:39:48 -0700 (PDT)
X-Received: by 2002:a05:6122:6b91:10b0:5e9:2e3c:2f5 with SMTP id 71dfb90a1353d-5ec230bb944mr1757881e0c.2.1793018387768;
        Mon, 26 Oct 2026 05:39:47 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70993e89sm18146581fa.9.2026.10.26.05.39.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:39:46 -0700 (PDT)
Message-ID: <7056d429-5bd8-47bb-8c9a-5827be7c6279@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:39:44 +0100
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
Subject: Re: [PATCH RFC v3 2/2] arm64: dts: qcom: Add a minimal REDMI K90
 Ultra description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com>
 <20261021-b4-warsaw-minimal-usb2-v3-2-9f4213ab83ef@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-b4-warsaw-minimal-usb2-v3-2-9f4213ab83ef@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX8yXQSpS6lJ5K
 iuQuYDTRHkPh3zZjUTTg1oZPZb0PrEV5811VzoMbfmpToKYPbO0/OPidrpHWbn5Kv8/CYqSlF5+
 B9gS+3u+EOuXheEd3/c2HNSKslznVLCQ2RJXDjxpMDO8wKv0+91vBkYxBmLQT2qJftSxcGYOMYd
 f6e+BgXI/UVSBzdk1wju+6gxYsrgJAFhdU3FbTF1haJLYcKR/rb+GAapWFk+aprZRTUKIQU9cH1
 lky8HF3dS5RZrT6Y9Owj3PoCiS2glQHn0OuWthb7LS8XG4HoHIEMIlmy+CwR5BEMW5MHaYF0uuv
 pcnyD2TA0rtOMXg3K1I/4iuN+82/e9EsSqcLZktrrN80fHb9rLKT/5iQfHrGdfmeKlYkMsCAFzC
 B/v4Gwm7AiSqyHLlbc2cBEEgdfqY52//qbbeCfedICHg4dwI0tqESsLj6PgHzaEwAo6D8/yu7Tv
 vkY07hwAn/Hryx9jEtg==
X-Proofpoint-ORIG-GUID: m5GtlAJPSAZWJUNQYNpxT0HBmP6Aez83
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfXy/UrY57jnc2k
 LvYEZFeklDSzfsA/Pd4iRCESrxljjTftn+QrBhXRTZC/Se9SsxtOapyo7G4mpGOUZqA1La70Oja
 u10StGX43vaxYqULxw2lkMoezwCZroo=
X-Proofpoint-GUID: m5GtlAJPSAZWJUNQYNpxT0HBmP6Aez83
X-Authority-Analysis: v=2.4 cv=HKhWhYtv c=1 sm=1 tr=0 ts=6adf4a14 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=BhY9DA6nPAixTnPfFlgA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/21/26 2:46 PM, Zhang Jiaxi wrote:
> From: Jiaxi Zhang <z1529105815@outlook.com>
> 
> Add the REDMI K90 Ultra (Xiaomi internal codename Warsaw) board identity,
> reference clocks, PM8550/PMK8550 devices, keys, debug UART and USB2
> peripheral connection. Build from the SoC and common PMIC includes.
> 
> Reuse pmih0108.dtsi on SM8750 SPMI bus 0 instead of duplicating PMIH0108.
> Keep the board-specific repeater supplies and tuning values. Preserve the
> OEM firmware GPIO reservations without assigning an unverified function
> to GPIOs 48-51.
> 
> The OEM configuration retains OTG and UCSI role switching. This RFC
> provisionally restricts USB to the validated high-speed gadget path; the
> connector, role-control and VBUS path still require board integration and
> review. This does not establish a peripheral-only port or rule out DP.
> Usable RAM and firmware reservations remain a bootloader contract.
> 
> Signed-off-by: Jiaxi Zhang <z1529105815@outlook.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
