Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35C85437CC
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961835; cv=none; b=iQUyEAuAIl7D1EMOpL5hByaGI1XglIvyq+Zg9gzEkPb79Yidi4t1On742O4dthUN3cGzUXFB+b8mEuzo9juWdeF0aFa/oqzuIKL6Wgvseqy/rxOlJ8u2xp6Az5q/mC/chNwLltXRseIUWzjCTY0RXiVrIpn5IkgTHDmJR2grp8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961835; c=relaxed/simple;
	bh=3dzxFQcUx5WQCAGYMGUc+utveYpfYmB+Col7Axxg32g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EAF99pNNDqzX40r5/hnUIu7PD3y2Ir0hXMdqQb2vyKRB6PogOsiB1zjhjC0oUt36AY4F7wPqNOlpm6+gBj0k5BxroqlXpzrhOK3tdOGeEShFVI4YNzV4DM3Bqe8a3bKaY1t6vS2YNCdPptLTSCXjxHcVsWVyhW5OzqOeVRN7YfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ar+23hR5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8PnK/ej; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ar+23hR5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8PnK/ej"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CCoD71401021
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 13:50:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EUu/69R4pZrWxc32PXHedZtyNLLyryJiA5ym1cnr2SI=; b=Ar+23hR5eLWyzr7F
	BQUfP/DWw5t1xWvdNhCmt6bNQDqUFNK8NNWV4nxM7B2RbTXE2KUkNx5QoB/ab5DI
	SvR4CudEh24PfSSEyXcM739eEInftGg+4yQQfWumDSm/tR5z48oIoZ3x3jEeYugQ
	Y7bu8NzIgNs1UxmocFtUw2/1Bn2ZRb7+TnlD8Eptkx2Dwh9uaAsPEi4qXRTXSjrw
	os6KeKt78Ppt3xBHFAwiz6jPRuKCfoU3Tr4izJJT+RRVgIOVKRYrkrBQQFnFXPM4
	Hnxv3/1bnVftSmF8xEul8lRA3MGmUZQqJ9V8Kn2ir25AefH1hOM4O2xzFQV7B8H9
	mpqQ+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk78x0dur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 13:50:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d0caso66628385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788961827; x=1789566627; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EUu/69R4pZrWxc32PXHedZtyNLLyryJiA5ym1cnr2SI=;
        b=A8PnK/ejt09iI3lPbh9jhriStsap3jilBRNdXf8RglEB2/lsXl5WNhUO5fg0cNhEtb
         e6KTOLNwM9LFqKD16ukfRAzNvrgHcmZTc2YHx2g8Lp3TVxeDKdtsYd41Ury5smuSF555
         ppdiccl5rPympAImPsplIHADZgdvtLD/c7/KFuGibfyQteAMWKmQLl3wFMmzhhkUgm+s
         qI/9bTjZq5M9QQTXHFmZml8EMSPizHvuz3CGKbT4OwzY1wl1y/ZUTZWMW28vHUeoAyf5
         se8PdjrMcrqm8A1/b+hh3ML21VjFtKTQhwTsdsgQQOmgoPPTcKYiDATZBqRBtAWkVCw+
         NBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961827; x=1789566627;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EUu/69R4pZrWxc32PXHedZtyNLLyryJiA5ym1cnr2SI=;
        b=l9J/EDThX5itcVYD7C/f6d2j4Jpg83LP3nRhWmOGze3fW8QlvYEHHhG9nVUsI3LAR/
         tn/O3xVKOVR0X9Z0Ei1ySSd1uGZvf9iOXpc4Px+oNl3Y7UWq6GMZiuHTlfZTOxU3gjYD
         DL9GPJT4cyfSGMJ8/5FcFJNA/s8mHJ/XQTYYc5azXSoL4W1tECBEN3sXHAjXzvzxYpZo
         SQrT8+OaKWN0Wstybgt0Z5l4vO4ObIsc1Oc8YiW2fCqvm+/YkTKwE84HNBRlvuVULkne
         Jc8AC2jyY6v6DUd0CakRNPXUcdF++BdsH/g9VXMR/pzNSushNTIeAxKwe3aKsMDfacsZ
         Txmw==
X-Forwarded-Encrypted: i=1; AKwUvBztuBWAioeLQzMp23tTMn2b7F0BswqbYHIZgAPC9OQLavU+QrHZ0DpmBiT9UeUJktDmkAo/9WMkJGe9Ua8=@vger.kernel.org
X-Gm-Message-State: AFuF++k2pOKX0vh7EcvnbYT50b6gYL6zbpnpWCs8AUiUX1Esqt8jlpiW
	WVuvMpoE3fjlsVYlMHL0IwE7HUpp6Ak9i3QMIlmLwC1ZetPthhcMmKgGwG6BUp8+yWXua3ZITmz
	4B5vz+3Uvr7HHYpPAWfB1M+eaRfqq8NM3UKKLi2K3PhY9a0Dh2qsRzypVCf500XXSyhg=
X-Gm-Gg: AYBFou1tp5Ra6RFMe2QiMrKUNyYheRuKrG8huePNuvPN5J1a5giv+8PcspebOumw5o+
	A57s6LUVXFS0dyz2kCcUiXFix0a/gXfjqH1Vi8LvF34ZBNWOBAHfv4zATwW29FzHYW4ZqHzXNtO
	qVialGXN6n6uEbyscWk0z1b/MYsis+m3oVk18fa8whGJywZjVpT6B3e4nw5R2PHL5zXpaflEiRy
	lW4EoH3pGD5jr67lGZjHhWMccWKZjFJFcmyUohIvlf1VVtEUQCK0Ksv4ztpOpX9No8mVaPUiAct
	bQUM0daakTYBHel1jKPbcE10nl3aNoIGq69uH6dc1F4YV+KUBz+zVh4VJhYrNZ2P6OvOVITCrN9
	ryXAl44cJ2oRRZwAJM5PpJw==
X-Received: by 2002:a05:6214:2301:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9104771744amr280943126d6.2.1788961827112;
        Wed, 09 Sep 2026 06:50:27 -0700 (PDT)
X-Received: by 2002:a05:6214:2301:b0:90c:e7f4:8bfe with SMTP id 6a1803df08f44-9104771744amr280942556d6.2.1788961826639;
        Wed, 09 Sep 2026 06:50:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d6dfad6sm775719166b.60.2026.09.09.06.50.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:50:25 -0700 (PDT)
Message-ID: <e9a39278-dbc5-46b1-8d74-581dac008b3f@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:50:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] arm64: dts: qcom: nord: Add remoteproc and PMIC
 support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dhruvin Rajpura <dhruvin.rajpura@oss.qualcomm.com>,
        Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260904081619.593602-1-shengchao.guo@oss.qualcomm.com>
 <f9252adb-7b5c-41c9-8a2c-fdbda21d672b@oss.qualcomm.com>
 <ap6o4SRb_4dG97yD@QCOM-aGQu4IUr3Y>
 <bc051d4d-c94b-4f01-bc77-a4da93331d6c@oss.qualcomm.com>
 <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aqFcNhB9ZeQlkOFh@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: eCJR7irSsuOpf0D7KnwKzzZlj2gafNvw
X-Proofpoint-GUID: eCJR7irSsuOpf0D7KnwKzzZlj2gafNvw
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1NCBTYWx0ZWRfX4IZIfcgFI7Y+
 a/W0swVw4lWqFObTwJ9yynlBfVmTWlphiicHSp4o/TbHuqYiEz3sociwUMuPJ9hvQU8j73M5LWe
 G1eKm1VYb1vt6Wb/sucYyO2ilpWMn4s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1NCBTYWx0ZWRfX2CpaSiWUFitW
 P6g6f1WWcGEMeuUBnlw/AlbN4YR5ooNsGwcHe5warfm1E2GtXQ50vVb1DvqzXEfDYJ0svkF0Z5X
 Kl4CH0bnbjFDT/Ff2Scu00F3TFojoCAMG1jpBW/62YAMZ5TX8B91iAkPk+pe4M7VANg82Rt5Bx7
 uP702Yh6HgKh6lM027hAoVj458YPEJLLrOR3WL+DLwZomYbslftikvJDbLnxw/UASIezWRwPq6+
 5Cqx5BsBOKp9b3THDcnSko9gh2NHlCjQFGJEXorPie9MpBesAFQvIXINnnxtgRNm4mkhxd0p2Cn
 7vwg7qju8Z/Gg8Gl37CiOownq0ATAntKoTUC9GN1fqmpnMvB76e5Ww/uNEYz0h0Uxp2XvEGFpcg
 yfsS3oA0vkyz8P0+bQtsDW4KzYIzemJ0Ob0QkCNExiTiP2Fglk5f7WQgLR3Pd7JOfQrE73LBpU8
 HMQ8K6CQzPDyPHKOSDg==
X-Authority-Analysis: v=2.4 cv=SvWgLvO0 c=1 sm=1 tr=0 ts=6aa16429 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=i3Gk5ewI70OSVfywh64A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090154

On 9/9/26 3:16 PM, Shawn Guo wrote:
> On Wed, Sep 09, 2026 at 02:13:35PM +0200, Konrad Dybcio wrote:
>> On 9/7/26 2:06 PM, Shawn Guo wrote:
>>> On Fri, Sep 04, 2026 at 12:00:40PM +0200, Konrad Dybcio wrote:
>>>> On 9/4/26 10:16 AM, Shawn Guo wrote:
>>>>> This series adds ADSP and CDSP remoteproc support, the SPMI PMIC arbiter
>>>>> and the PMIC descriptions for the Qualcomm Nord platform, and adds the
>>>>> initial device tree for the Nord Ride Embedded board.

[...]

>>> - Supplies of Nord SoC
>>>
>>>   vreg_l7a_1p2     -->  VDD_PX14
>>
>> Does RPMH require HLOS to cast these votes? Generally such supplies
>> should be taken care of in the fw
> 
> Good point! I just did a couple of tests by:
> 
> - dropping regulator-always-on/regulator-boot-on from these regulators
> - dropping these regulators completely from DTS
> 
> Both booted fine (the nhlos software for Nord Embedded variant are still
> under heavy development though).
> 
> So what do you prefer, dropping always-on/boot-on property or
> the regulators completely?

I think it's best to reach out to the PMIC folks and ask what they think

+Kamal?

Konrad
