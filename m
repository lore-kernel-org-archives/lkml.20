Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A7C4D7D3B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789644673; cv=none; b=DBu42L1VR+LfdCZSDZwCMq1lFXXFO61EsVcO1OBsO+YPkOpbdh4U70XyUzPJqlE6XPmT5JTM6/FJ1VFjtvHXHxWV6EhDi4KnBRJ0nhpAU4vpSvvm9SnTQia8VBpeGitlvDi3OTWn+8BMUwaPdS/usHQEyNqUqyaQ0dBg/jABRn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789644673; c=relaxed/simple;
	bh=5asFxGk9bIrytuVDelb/mNGUDArT2gXkmHC1Br6tnfQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPg+bZnRJN1Va35bQ+xpTiQJ2s6A7wA+yP2gD6bDYgyfft209zZ18wKEID9jvWnGXB2J1Eyu2CB0MPtp1cTV/u13mJU4VJqqMKoEeviGC3LQ4Oh+1RYVSghj8WPYkJ88PLcrvT050EvXPvS0VFXkrAHn/Znw49iN2JNBBygB8S8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LG5RzhYh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DOe9HgK4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LG5RzhYh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DOe9HgK4"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZZ3n612901
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hJ5HNMt9qrsV8HyG1Lv6XxsHmRpvM8G3PirYoumGCwI=; b=LG5RzhYhPVRz7Pne
	mYl4S71fkLKWBFVRWdCtDHIrix1H7V7/OvyRE+PJqPiLlmalW+G4T1ohZyjOUjrj
	rjyEbwzAQdr9vGeHjjE6KwhhWjgiDBlsU0F9cNWQ3AwGBCmiy2u+DrQX/P74zOFa
	0Oxo7X0srud0DDdxs3MINQemVHaGxPi0COSsg2NZvpNTTmbT7rkw+b7u44BMv4uu
	qttKP0NOXDo1RcyvL70frGpqkVIphvWIvshykSQnDxm4i62MFrnR++u/oCpfOXvR
	FDxbXJltClxpFxGGz0yqkeT2vWcJgEehLEZ6ZcG3UKCQW4LLLb+JjHn4b/3sKXHt
	kdvtzg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grca0ruh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:31:10 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c65b0280a2so25014e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 04:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789644669; x=1790249469; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hJ5HNMt9qrsV8HyG1Lv6XxsHmRpvM8G3PirYoumGCwI=;
        b=DOe9HgK4NFYxqtxtv1N05pSEUzYJnU0A6aicF7GYNhya9U8BkqD4DdPc7r0Z7yKRzq
         eYPVutfzGH7mFfPzySSriqGo0/3+lLztLp/gXs5A5BBqPa2HBYeC6IsP3YoaMxg9yNfy
         8dFzSak8HAvB8VK4rNKHxxniDiws6oArhDd7p7u2HLWC2NuCmpcsE17QrVD0SZCdf+pb
         nFmFM5t+ggs5fTRm+6+tDHZMORN0DfziREwH6DVxXjoQlHXQclQ1CK1FJ5rPmxjRSfvw
         qOPqFrp8u0l8VscxszwnhcZaK6zoQSqlL2jWzZeJDOIofEG0G07ne+8UfXmFez8YlIk9
         6KDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789644669; x=1790249469;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hJ5HNMt9qrsV8HyG1Lv6XxsHmRpvM8G3PirYoumGCwI=;
        b=km0ls32oXCHQ31JhWniDmvMWDkKo/ZjMJoxLm/dH+8EcDBZUkPhPuEdL0Ap/m7rnWe
         qxj1WKF/O9K9kl2frgJTqSqQ70/Av7NKsfKpsn3Xs9STfUML4YknPm8PN67Ffh9Vhajb
         f2R7lZYJ3GsSHAnQduwoTo1MQTf1BKWqOJTOmo7SS9896I/KX/pTltf5jDyBB6f1PmPV
         kTTTx6V8Rpp2TLWjb4iktZQSHmTPJU8kN4kPq6fzY2QPLk4VEVM6k8DafoeWAYbZVaTS
         mKNCSsT92kCnXyw6eLleRhYGpCjL/QkeZGzN5RfNfOWz8tTmwj16n8/IVYYJ6Gwig0q7
         zL7w==
X-Forwarded-Encrypted: i=1; AKwUvByxjqUWSpoZ0pvzFGZpMFBDV4dAy9vOOnDxBoGctekWaDiubzdm6bXnBnaKgKdoxBy8NnjiBbsv2L7z2Ig=@vger.kernel.org
X-Gm-Message-State: AFuF++kH5PjauxWJgNfYOtHDAU3LMRdWS46vnlCA0mxITnBDOn/RA+ai
	Bdk30PyVvkfE6hMrcmMT3V69Mykfg3As1H17JLjdqgDPbXrDRR9aLSuSP82DihKbKcLkTXjJ0cJ
	VYe2BOpVWein//GntP1hYNejpkYQJO+OkHko6xQ7P13e7nj8CU4kNQ2NjgS+/RfAFgS4=
X-Gm-Gg: AYBFou0CXCbPE5v4v5wF9MSdBP1Hm4DvaXGMz4sMMo4BZ1bC8JgPy+Ww8l2fxPCJ42i
	e3dOLFatiBA2RYwD9Re6l09f7X3IkIEUJw4AFzVYusXqC098jfGvqIncxt0XreNvS4Kei0MdQcx
	l7MaoROL+oSODoUca0E5CfZ1HUv0Omm3jOrAfNitcwpOwYf+Gy5LJTGZUTUKqxVY3fSeqAthB2u
	HEEFLhPLmHSYnJ43ahx1nQf2t7dCKJ7lpFz61U/ATlsuycFnPWi3wajHw5k+fm8L5+nxC2HlKSy
	U7/lZXR/UpzGhFJFhL2lb1rfxSM6CQHXFrlfXROzpncaB8BXcX6uMEb6wigxy3WsmWfsmV8+YuA
	lwWkPR/5S96189pZnqxbdPQ==
X-Received: by 2002:a05:6123:5db:20b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9af97cca4mr99443e0c.1.1789644669519;
        Thu, 17 Sep 2026 04:31:09 -0700 (PDT)
X-Received: by 2002:a05:6123:5db:20b0:5c5:90ae:a8b8 with SMTP id 71dfb90a1353d-5c9af97cca4mr99398e0c.1.1789644669018;
        Thu, 17 Sep 2026 04:31:09 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa1d2b0899sm3438219a12.31.2026.09.17.04.31.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 04:31:08 -0700 (PDT)
Message-ID: <6b2c1fa6-5bf2-4c1c-8046-929576ddbc53@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 13:31:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: sm7325-xiaomi-taoyao: switch to
 device-specific pmic-glink compatible
To: Stanislav Zaikin <zstaseg@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sebastian Reichel <sre@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
References: <20260915084901.56622-1-zstaseg@gmail.com>
 <20260915084901.56622-4-zstaseg@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915084901.56622-4-zstaseg@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: t2BwT3z_H0Mu6EtVZ7isE5Hebz5V7TFf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE2MCBTYWx0ZWRfX3zMwKX2Os+MT
 IDCjA/s4/vUIf6KvXgOHhRU68xMo88L885vfAEXs6uc4OHI0cgI47MiDbFFz5DLpYrozrGULaD3
 nhvOgJlqf6bVPzNvoqvSijNznaGsWQ8=
X-Proofpoint-GUID: t2BwT3z_H0Mu6EtVZ7isE5Hebz5V7TFf
X-Authority-Analysis: v=2.4 cv=dOQzC+Zb c=1 sm=1 tr=0 ts=6aabcf7e cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=3RjLFqqlckgnW3q9yH0A:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE2MCBTYWx0ZWRfX7z95txYCu9E4
 UHn6JRRpsvUw1k8oaC+LcAs+fauW30f4ju4ZbVJqTU9It4vKYoTC94J7tHXJyhcdzckUFIfRaLQ
 OtkyHUFa30t0vPayBsuYtRxOaO2ZJiOI1fYiOebbCx3UW8Uw7gxNd/clomaYuddSB5B4HqiDX7c
 Tb4g2yQTS06krO62HsxFTrk2Cdl4gCK5WLvpRbcKW4SLP9sGTs0u1vx9U77Btd68cB4ZdEOGaP/
 a6zVfKyOCBhaQePGWFutcFD5J3u0836YJH8c8qsP8ESlZgdhliZGkMPN4o/bBjGVfQRQwYfGJBE
 nZ78LX1IgVN8EY9SPUNwrZ1m0GKAlTvxbBppJ1KyfI4TTV5GP1Cnv7mD0taq2fMbTU4kOlCkoBG
 o3lVC+c+a3NJe7CrJzeWU+mwBpcU32/w5CEnAyAWswG5EAtmG3g5MMuyKp9sVC6bJhQ6wDLkK3L
 oK7UXuONqOWs2vK0X4w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170160

On 9/15/26 10:49 AM, Stanislav Zaikin wrote:
> Switch taoyao to "xiaomi,taoyao-pmic-glink" compatible so
> qcom_battmgr can identify the device and apply its taoyao-specific
> battery property mapping, required because its firmware shifts
> battery property IDs relative to the generic sm7325-pmic-glink
> firmware.
> 
> Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> index 6f8bc65bb99b..bc4dfa49ef38 100644
> --- a/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> +++ b/arch/arm64/boot/dts/qcom/sm7325-xiaomi-taoyao.dts
> @@ -72,7 +72,7 @@ key-volume-up {
>  	};
>  
>  	pmic-glink {
> -		compatible = "qcom,sm7325-pmic-glink",
> +		compatible = "xiaomi,taoyao-pmic-glink",
>  			     "qcom,qcm6490-pmic-glink",
>  			     "qcom,pmic-glink";

As krzk points out, this should be a standalone single compatible,
because it's neither going to work with qcm6490-pmic-glink nor with
qcom,pmic-glink

Konrad
