Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 267123EA949
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900996; cv=none; b=ssVRk70Urw11ht4GDuQ7HrKboeEXs3D+C7lfKlZTKCL3ubdwcyP+eyUjDkFF1AMhZEMvqOvXwyjpD3QpsNupYAMXs+Ct3EtqEpiGRAY93Plm3MSQ65pzxiV4C72HTQZjRz0fwKV23l/1PAZDlurd9W0VPJOR/2ly2BkQLrTAeao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900996; c=relaxed/simple;
	bh=3dYCu4+BqnUvxY85NXsuEOpAoxwux+AbVeIjM4Mpdno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mZbdmr8Z61SJpqJqy3wf1ObE1Cb/CPcBpiCZPp+EekG6eJLJ1dDcs8FT0ROr6wGwI9W3QECERehT/VneHAjVxwTt5WID8TjXdtvD/20s5Pr3KjMtn3LFhoU+zar+fns3Q3Qel4HVemQqpRr4CZTPaFbVcgmigjQaW++8Cerwp1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE1vkOFw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Esq6Dk9B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE1vkOFw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Esq6Dk9B"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE4RKU1298686
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:16:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tvy8r3gfsvS8TSlPEI4qJoXIyoFiPdlbNBcU6/73Db4=; b=FE1vkOFwluZvtsv3
	qPp1jONj3zkD0r1HmPK7tvBPPi3m3ohoviP+OS7Ryu5T2FKdTDpXHyYRM2iLFxUl
	pXv/XCVKA5LPVzb6YwYB17DoxadllDCZq/0pBTn03Msn583/HuKti4ur3ZvYoTcz
	0Ga/xMfH4ZX6rkjpgteU9SXmiLXVG3zyzVBlWctb1VIcTqDgXZMPxSe5iC8KShFG
	HkM4YtBNdoMRQN9g8gQQnSzsd5Qsko3MkCQjH8wy5C5Uv2FYb4cOas+4ami9fUD1
	+7oJlWQ0wE+NyxTEn6o3QFtCPvQl6VE6aCh3crnYlG+BWVQTfp79xaZJKbgX6iwI
	CVzHAg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xquyhk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 14:16:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c97957d83bso74392e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791900993; x=1792505793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tvy8r3gfsvS8TSlPEI4qJoXIyoFiPdlbNBcU6/73Db4=;
        b=Esq6Dk9BAMLZvxHYDiR/bSQPpKqSBKBDHr7TZ8hpzE06ChxNEVYbUX84uwmdyG+jxw
         baHYuzEHCtpAGfmf2xuf05AWNIXvVwuDRc+XImpX8tVI5TCJfWULL9li41RPk74jmVP1
         7U6caZYVy1J1zjuBfYgUA9Q/oTwOoreiZEHyDXVBawMbk5UTKduys/ATmnumbMWA5yqQ
         i4WZUuc763MBBYhY6leM2ZKKNNZW78zbweE5UgOfT0UmUW4KBbLnkPZMmVta0Z/6cxtt
         HHdC60X6Hbiu2ScgaAKS07dB/5ifb3+fY+JmP56eIZRFRnGDIw1qC5/xzJnUm2Yd9Rlv
         9ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900993; x=1792505793;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tvy8r3gfsvS8TSlPEI4qJoXIyoFiPdlbNBcU6/73Db4=;
        b=S3T0elSps0Eh98YrlvwRrPXMdQzCI4iOYyQKO4fZGR1yXqXzD2KCOLcUbKDmYXbie4
         BKahYhAtLyBxWntqFySGd88k0/pdGvGcPR6Z/btcEBlQlAb7KcKfG6W6nf89iauOUnoI
         jSuOgJ2xlL9bdwia83qjdC868VhItbQz+KzziJrnp54sP6QdCysmIuRbVBV6IttChbF5
         qD2HNvMgGVpWD/0hblXLtxOvHiGBKWiNexK0Zu7WnaIyzLZf0W8gq3ZOmVRFERrcIZeb
         UEjKWoLISEwOZa4k2+L+CX+L1aL5GWYTyUITL6c8T4hAc+4cgPXXdIHizgB9DCnx5Tyl
         Ddbg==
X-Forwarded-Encrypted: i=1; AKwUvBzU9MRtuf3FawXEhpYn1iXpNNkduVDHcMuLnjjG3lqkRxX8OhslDI02TasRLX5QAhvTgVYIB9r+T3b+Sa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhQPq8WT+Liei3t0aKbzbrq4o06nMMwYjO1bvfc80B8EHKVdEr
	cNoSweaWXg4ixlO7ugbdlOYhkHvERFacnm4df86aPv1vihMzdp401Pq3MFXzGdMfS2o2/r6NlNO
	zCgALmJarRNvZga9WKp4Hv+Z7Osn1efoga5jyF0AU0S1i78qxLzhxoLpSFvcGrDBkwj0=
X-Gm-Gg: AYBFou1KTrUGtg0QwgBD+foL7W8TNsyMDegB/gc+8uT7nViED3NX4T01ici0Kw2o4MV
	rwE8sn0+iBZzowgm/KAIoVXnDS1DzJOOOogPiGiOZaCcbux1sGO9wX4vyqnPUAyQPZ3iFTVv6/H
	pm9Z9fH2eVBQOf+2JGh2xHTzTZKF708vFgUJF/J32g4rQD5LU6y9Z4qpwyOmt38EH6Iu1uWHsT0
	BGxy78V7AUdCTI7lz2t02ySBNsSazwLqNfeD2m1TP/Ckyv9okNQSpCSLd9w/zJanfQw3ZFmJmr8
	gxExDhqEDtcOAlkgnesOZCNNPVwMwa2ji1TLzcC2T3iI3SqQQxDxQDfBuaX2gOckMMAGJ+cpTp5
	3ISyxBfRwQCYNg4gLgEbvxw==
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr984226e0c.4.1791900993204;
        Tue, 13 Oct 2026 07:16:33 -0700 (PDT)
X-Received: by 2002:ac5:c001:0:20b0:5e9:4e2b:4c9f with SMTP id 71dfb90a1353d-5e94e2b4d71mr984179e0c.4.1791900992740;
        Tue, 13 Oct 2026 07:16:32 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b1b173eb99sm3263983a12.6.2026.10.13.07.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 07:16:31 -0700 (PDT)
Message-ID: <0624ccca-37bb-4bd7-8c40-73f89ca769c3@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 16:16:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650-valve-deckard: enable the
 watchdog
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261002-topic-sm8650-deckard-watchdog-v1-0-7d7f7d71d88a@linaro.org>
 <20261002-topic-sm8650-deckard-watchdog-v1-3-7d7f7d71d88a@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002-topic-sm8650-deckard-watchdog-v1-3-7d7f7d71d88a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX4g/wdDetf/cQ
 uvbcJ2WmV1Q+UYY/nzpIPKFvnBMJcrWNkBpUKqQs26d8zorHFqzZIpDp9IcipXL3tdQ053vsqeP
 vWvKuYO/zYmuSw3JmnNOuLFhJTzl9tuZHTl79xP2kpn7hafp7rVnMoORFAGWWOq25bOhXHaIHsv
 OSDMjh3rv6SKsg24bHuIF2wrH/s8Wpo1GwiZWdiuTfB+4Tpj+vMUVYOvIK7dBBh3FuY+O8m6JYP
 ranjuLd7NwhiZ9sCZVeCCNSgmud3xXBng3Y/2d/QMU4qPZqoCXHbbfMOROHEY7516sqmpLhD1vP
 JVYHEz1k0NnwuwApPreUNbUb2DfG5K0n2n9P90onrpBipsZh7Q8rV/QlTk69aT6mpST8qws2+BP
 J4kpfNPHlMqSujyEknuPzVSVgGa1+lqOGp/sA2AVjgffPq5bNOD4lyaBqvUWxKoYLgKig6OnGun
 9KHcWNmTXV8JSPDpgSQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA1NSBTYWx0ZWRfX1Xjf1F/QtYFm
 QoehNFtDXOt49PxgUmj/QqNlByOZmWeR9PT1KwexfetoRx/hbXwCMBbj1mqClVBL3wYUGmj2pKB
 lBL3kUOJlBIrM+B/GayLR4pXGhJHDrc=
X-Proofpoint-ORIG-GUID: h_rnNjMntzqIgGOzrpaWvmLXNUd7qC56
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace3d41 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3WhsykZCFRSWcWe-wlIA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: h_rnNjMntzqIgGOzrpaWvmLXNUd7qC56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130055

On 10/2/26 11:45 AM, Neil Armstrong wrote:
> Since Linux is loaded in EL2 on the Deckard platform, the
> watchdog is usable by the operating system and can be enabled.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---

Preferably this would go to sm8650-el2.dtso but that's fine for
some future change that also belongs there

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
