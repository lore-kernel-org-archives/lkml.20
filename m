Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D6D448B96
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388703; cv=none; b=fmRw53t3xBzsNOS15GAvA1VoAUKo/kwKMJb+VZdmQPcTnKZZCJjdxs2z7Zv6MKWX1yB+FxRSXKNnrASkrMZpxcEKaBDYSyFAH4QAlku+9JjOEqt06UTC9lntrZRqiruEJ/ZgyaInt5Vo8c+U3SuzAEYXBwBLLvE557QAVkq3VyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388703; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EGPX5E6GPP1a0cHKC6loXRyetqQnD+G6fyTyGfoZYcsc9EMnfH/TR0AHXSlb1pr4DYpJ8Psv9+BkkLlVwFtyCXiz92AMP1HOgwu6xHAoU3n/ba3xo4jP6WChkQcpvlZ/IOpFph1xKFj5rJ0jDZtoMa0t2mhOspVntOM0lbVsbEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orAJ8nvz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EIZbbsbC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orAJ8nvz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EIZbbsbC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1sI727573
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=orAJ8nvziqXVDna+
	14nYPxHLwwYD9PWfjcWwoK4WlFeYkXQg3MKt8K97GxytnfROYZvVnj4ANTPPbdOW
	KPSWGN0L4Ne3nUmEd4UZzqXBB+RssqpsQo1bejPV3zd2BrpJC9QQF3OLLU+8Rw/R
	4mZGz22nomRxIFLoRcKCZ5VE15GIFnBSdqPDlMWdcHe0xJHFQBA5xgGXO82kFYcl
	Z8a1gX7GTAhDPbHyzjG0LUgUaxMgr3D3PhtnqvOqYFPV29hu+uCzd/UKgfw15xDs
	wAGXTnuobbl5o+5S2jfwGoLhp09GOACclAL/5PwuXAAqEcO8h2ibbeXpvxOsuqWq
	0kzrvg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rv1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:25:00 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bf9ff71075so152789e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388700; x=1789993500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=EIZbbsbCproDS2p4Q1IPgFzfFCD/tAeHPuZI3US22rTYEztc7e43Nlk33w4AbXPTyh
         U5hpllJ22L/xEELR7cY5HSS0Eb3vcmPoIUzYZx5OKIXkCudgvXejiEIoyM31cheBevcT
         ARuEC8RuiixJnrQm7GPkK31ScB9Zgsa11bEcQk71yvd8Ria2Nvk46jF2PCChI3ohM38Z
         tt8qMXUP95g+w9EOKzkyoeUHKNeeav5CBfJVucTFHNuUyLABB61+AWMejlxh6P0nVtUj
         wRPHe78MjgoMBUYyDjcti/3NP7jRcczK5l206X4rQrbL9jVPbFldc5oKdt2ZAHBdOClx
         h50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388700; x=1789993500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=GT9NkkBK8FoxvxDofgeJnGOqYaUFm+drSbbnyuzcgP3k7zOvmPBMbIKe0pNPvJl84P
         Oyj2TYoz5mXBWDJyz/OWw0qnEgjoPMXsMPmUON7JRenfQinJLFs5t1e2tc0VF3QlUwmM
         QL+DcLxth6UWbH/aLwC66K4Q3EbrfjEzTBltG71QhUYiZxbvlvmjmBVsfuO5iXqx8H/P
         AHdSJGJPbocvsqfWwhe0ZzlepthQO6edWXgym6mg8q0e1DM7lDxvjp/EwMaMAP9h5+J4
         MbA6/ZsliqoKpeifLIZJaZpPpz1EdllS2yVTtYtOc8fzQUOZ+iybIv8Xr7bJlPVr5SiG
         W8xg==
X-Forwarded-Encrypted: i=1; AKwUvBzVZ7X3dPkOo/+w9bognPHyzaZUanTgUP2dq6DLop2yeCFBL5q83pohWZXLZfx7wIrBxCxBdTL3r5+iWcI=@vger.kernel.org
X-Gm-Message-State: AFuF++mHRTRxvj6fSPEotsPMvww676oOwyBt308EsdqV9K0z2L7mk4sd
	V1sUgCU5ty+TfD7Tfq4WvzLKmPfMfFK9AOLABW0jlIUygL5w7XiNnaMZWKhkmDFeCrGirtMQjr/
	bFZwN2rQvxdZui5jLyzmqLFw+3y3vt/R5JqVgK09VMlPc0QBTUbbY6LdDaHKEbtluzUQ=
X-Gm-Gg: AYBFou036cgXHzUO7xfyGN+iNxIFozhAqPjPRriBf73tQS5wN2q11Zzq6HAQowK+UqE
	CbqoHgZi/czCsDs2DuZCO9r60UE+BhUbe/vwuoyseCuFtlpUARcF9CzTtEo8yqklaOs7UJlKlMB
	RfmainaRJXk9uPQoCy2quZNRArD7RwdxGiI19Qcsfs45WDjfw9EC1FKGRCK042oeeu5BNmqYDO7
	/0z+Hofza0awY92L5N5OsAHPOMjEgEas/HdqWlUV2Rps6SCNNRpT0/68BDob3BcnnyMru1WUhyM
	6KHjYZNFbBatlNd7YhsdAQogxzZOysETepqT4j3GSCeBm8UV85ayEcO0LGcMga0PeZcWfpzo9rR
	BcSjgC2mC6yW7Q2PnsrAR1A==
X-Received: by 2002:a05:6102:5e94:b0:79c:86e4:6ac2 with SMTP id ada2fe7eead31-79c86e46d81mr124196137.0.1789388695256;
        Mon, 14 Sep 2026 05:24:55 -0700 (PDT)
X-Received: by 2002:a05:6102:5e94:b0:79c:86e4:6ac2 with SMTP id ada2fe7eead31-79c86e46d81mr124188137.0.1789388694856;
        Mon, 14 Sep 2026 05:24:54 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm2356557e87.82.2026.09.14.05.24.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:24:53 -0700 (PDT)
Message-ID: <9514465b-8b23-4913-845e-8a0ebd7aac83@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:24:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/31] arm64: dts: qcom: sm8150: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-12-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX0DyS3Bsfzy+e
 0d1tb4wSid0ekd2wsHpY05QcS9qkr7LA32zRnlkOtwFiRLHYiA0blk6odNYQ5TINC1vIeozl2Y8
 W23wcQhBSY7mMIXxnAjMMOaLd0jYdJk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX39wj6oN/YxFR
 TBpEvDoGA4VFZDd3afE7Vd+tZdjQnAg3IUITYI7bpB1nHfQFLfzBhBArLDBApu0hx3tw0zwrNso
 V/Neg2TID4j9gKI7un4e182u5rNLZ5kteYsFl+IDPNQgcl4StjHCSdEdUI7O1UaTrXz0+TCJl/O
 ZPjO8crvLa6XTxAxid2rHrKECn/0MVQH1LJPEKmsBxHKh9UvAgsw8VmyMNkhaM84GzR7ygHUC3e
 lqv98VW+p6oFxIoiqCtgdE+YrRoxyeFSTYK+H7cMOTkQeiVW+zKEUipdE54mPIIAzZU4rUrBWCf
 jyaWLZ1cXlM6e52tULBQjU2/F0lJaNZ5VGbKfA8aKNwXlSNz1W2Nu9lZ5upg2v9rFklJU6Z1MyM
 kscT1cVuVXhC/ddhwJbtM4LlsAAx6Xf+YEgzCEVhNeKZ7aJdw7rlFWUjNr2epWSnE5ct2oVJYbl
 QYcv33ioRgCL2Bd7zgg==
X-Proofpoint-GUID: bAzwZzZy0qdxSlSAf0y6L4e7dIynyUkZ
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e79c cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: bAzwZzZy0qdxSlSAf0y6L4e7dIynyUkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
