Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A25495AEA
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:55:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589322; cv=none; b=L2x0qW6oVkCGvMoj1R7ByUkte8gxrIbINX3x3iyPh8wLB03MIo9HMg//h0YagH3IghFdTwedRNPkcO79t6+9+chR6n6+kaRy2kY/gFldga2n7EdKz1u9vuINMaVUjB3mOJnHSUfFYK7yXqFJLnINf3UCiAtjhugs2awSkBkKyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589322; c=relaxed/simple;
	bh=wMTPtytnOc8jIsxHXNi1ap0yoWR96B9OCFiIwwooZsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoilGfnwcLWV+GO+or412qTnBy1QsrpdTozEXIMlNIc7AT4ncYr+LotZB3OZ/q2D0Tt8gxfC8Ldw9ZFVLLjC3N6TW4Utl3IH+nx+ngzPsgxE1dYVVHO/sIqzHsouYfKqyt4T9DtWjqGvQW2Arkm5EQv10ln5zDVg+3kF/dQjgn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HKYrUY40; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LNve5NR0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HKYrUY40";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LNve5NR0"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9MPk9246425
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:55:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYI8sgMtrhfO8iph6BOZNIZiWsPlwalT1cphHI1u+ZI=; b=HKYrUY40AFmTtqqX
	FqKVfb8C9dmvT9wsDKolwyZBhZc+aGxlI7QCFERkqk3sQSYXHJHHKeTSt3qQTDNE
	OEO3KkzR1BdOdHW2xq8QZxb/gG3Ud7oDT7RQSReB4zFDLaHRPDm+TE6rDJRedukz
	Yc/Djuiym1TVcvlFEV32fJnbnzRmuEciP1qLbKLxv/rcn7aCYHCB8UVyV5Rk9WZB
	o5qH+JZ6tU41jMkZHm7vz+45PGRSmXa4uy2lhAafLOfGjYxkQGSHtaliqUhamPjX
	Jwyrp4oAmuCsmhEija0sxeFGYlRdNqv/QV1s4zWKDojNYuic3a96DawtvvT1+s8H
	OewdEg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyjt10tsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 09:55:20 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f7ac3e51so5565175ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790589319; x=1791194119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aYI8sgMtrhfO8iph6BOZNIZiWsPlwalT1cphHI1u+ZI=;
        b=LNve5NR0BrevMQb3tHH9i7MVt31PXJXdgTwZG2WsgaX+akZAJQmqzpsLnFIZDUmY0b
         GUD+roYCEXVdlZ4BsYxDRMtHqUdPx6yw2g82HlzUDVnc5/RhZp/I6TIiW+IKix69lB49
         5OeBzLPlk9CfALP+N/RsnwHYDYZ+muybOHDy0rGzn63QVBoiY7fR+VkJdIWuOP5X14xl
         TZCNbCuvPOVrAwqM71k1kNFyHqZkleiC1S4HqHk5ihj2VZafcchc19BjwM2T+O4faR1q
         y+s2OW7UllcPehv0oHVKFB3K1dZTVuz6qMPh1j/Ftiuxu9Q71tM+TbITtzjgf8v+uwUl
         Kjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589319; x=1791194119;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aYI8sgMtrhfO8iph6BOZNIZiWsPlwalT1cphHI1u+ZI=;
        b=lymIuJ5NCkpT47TPFFdIgfnxV8EoPW9BCtdvNlB/LxtVmH8nWsmiK8TWYalbyOjR/3
         hGpm6/d56ZmR4WhnPBv/ZgjNwemprlvgDBYFOpezVeZeIPbADU7MAl13Ho00r9mF0s3c
         wLdjTsqiab0x4sCdfOTiAdFybuyFx3NXXKOyRAmly+nt/zf6XCcUpLLbDuXZ4Ctbllw6
         PVGCUn4/uj987an1x+H7ubNB0dEf5K+OrmykKmUjjWep+QHf9+iJvH71x5DRO+z6gnSV
         yRivtOizEXdZFBsdk3Tuc8NmtwcVlAzT42z9waQyLPRidAnXmZBox7b6OYmMdBkvRyMl
         4lug==
X-Forwarded-Encrypted: i=1; AKwUvBzDdnbXIIoEmZyvjpu75LfyKiUMp96DthSJYetK048aCd40UWdTOxSpDYK85ovxOlWIDL9pfQN90zw+piA=@vger.kernel.org
X-Gm-Message-State: AFq9FYJlVz/lBYHg9+G6eQC1m5DmQNviw4bkbkp2bWx9fmeWfmTxxFeH
	fQqeiAjEvdgjKyrs0xtaM8vBblaFrAQ/t/ZbBU4R1bvHM8KAgoSOT0IsES6IRY0vcguVydAKFqS
	SsP2q+6aEMopcH61MoDfLdViewpABBmfMBBORbbnTzeVr9i//ceBoOwcmJvTwVe2qB/A=
X-Gm-Gg: AYBFou2atOhMH5wlVFxfYz9JwcraxpGhACRhrTmrUkez9PT7hlJOVK8oHUr/l/1bBR1
	GOzG0M2+/ZCYeFCQu8eAXJ7LgMyaCFFSHHSt1KOPAsnZv42uDvPJt2ZBXVPvtn9870juhUM5DaR
	PQT+mP22yUVbYlm/4izja4vH1PhWpVau47iAKTjZkL/5Dn8qfqJ6ZvOKKB31ubOQs0xIeoaTGUf
	KDgAZiSudrLRLdSGXBHrCNjd8Y+9zWPWV6ymCxuN9BJozaFCuNjjxUwjykX6RGHyh+Nebb2JfhX
	VN8Q+AbdiD+3szwDuxkCQcyHa9LbAV1SBs3FmELGfzHUgoy5Bwym8veSSy1rMuSYezLUkNfGsj7
	CBCMCKMtfqQirUyr+sFUcy69q
X-Received: by 2002:a17:902:e74e:b0:2dd:b52d:e838 with SMTP id d9443c01a7336-2df8e3a959bmr120106135ad.0.1790589319260;
        Mon, 28 Sep 2026 02:55:19 -0700 (PDT)
X-Received: by 2002:a17:902:e74e:b0:2dd:b52d:e838 with SMTP id d9443c01a7336-2df8e3a959bmr120105815ad.0.1790589318682;
        Mon, 28 Sep 2026 02:55:18 -0700 (PDT)
Received: from [10.239.132.150] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90c03890sm39086075ad.0.2026.09.28.02.55.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 02:55:18 -0700 (PDT)
Message-ID: <28e20553-8c1b-4b2f-9839-1fbae1fda59e@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 17:55:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: spmi: glymur-spmi-pmic-arb: Add
 compatible for Qualcomm Maili SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
References: <20260831-maili-spmi-binding-v2-1-37a25ef3921c@oss.qualcomm.com>
 <31a59040-bb20-4cb9-9dad-a62b90a16c6f@oss.qualcomm.com>
 <27997939-f39a-43aa-a287-44c9f70b8a51@oss.qualcomm.com>
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <27997939-f39a-43aa-a287-44c9f70b8a51@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX3cRgHwfA4utv
 dxH5sz4rpZqvszPjeDl3/Lyez0vjvMlllqVZnZbUwkLJKZs7m8PRr1HKTDwS5gdUvIxt0hol64N
 q9OaoRBuWP6ApgzY1lcngGD6q/u+D4RqawZHrAbf2C25Zrvy+Qob9AJ6vjjhNfiJiQ6hhExsPu3
 wAEMKQiq/UjPSQzAJIc32ATZlbWfwxqHi6yl18+vGomLbP0rX2HEtPJ5LyX4zHAkU/ANBIPlZug
 b8lAfnVGwqXanXc27kGNyIFnR4UZi16NQ5H3yFsI/BpSxNZ1Yjo56KIQALyw7fH4grMF3lM/6JM
 HFvYzSXzWVtwIrvq2FYbI+3pXX2N2edYTB4+VRp49n3RvH8wecVXEek52MZ5kgGeq5EIn3zZlo1
 OzFplPTyCRrTgujIckvrmgQ3d1IxFt3iINRR3yF460tb2NVdNA/G2+gPeYWZSxSmOe6whD8BeLJ
 aQH0zhLNWIIbbQ95bSw==
X-Authority-Analysis: v=2.4 cv=V8foQuni c=1 sm=1 tr=0 ts=6aba3988 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TxdeD5nNe1Y8hkKaguEA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=zZCYzV9kfG8A:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: gmsAjgQapFsYz5Q8tmLEKIfrRtXLCI7t
X-Proofpoint-GUID: gmsAjgQapFsYz5Q8tmLEKIfrRtXLCI7t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX7qTwA/VTkaVh
 y5tgt6sWH6LKC+PUyzJJG/Usvdxpr4fj/FLtBg16JrMlvkcFAPzB9IotDODDfPvMU3vThN4X6AI
 67hZBDj0q24CnhWqCe6o1/1UtC2V4qM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280039

On 9/28/2026 4:23 PM, Krzysztof Kozlowski wrote:
> On 28/09/2026 09:19, Jingyi Wang wrote:
>> Tested-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> 
> NAK
> 
> You cannot test it. Otherwise explain me how did you execute this code.

Jingyi is posting the Maili device tree from [1] and get dtb checking
using this binding. And with a newer linux-next tag like 0916.

pls have more details of what kind of verification that you needed for
the Tested-by and remove the NAK.
[1]
https://lore.kernel.org/all/20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com/

> 
> Best regards,
> Krzysztof
> 
> 


-- 
Thx and BRs,
Aiqun(Maria) Yu
