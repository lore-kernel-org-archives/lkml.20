Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B93A472083
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388878; cv=none; b=kQWmMHn8DWv+UiTNc8NtyGrNh+BtMA6LtkUDfbPu3QcJrkkyQp7Pph50dt3+69WC5hwrdoQ1nceGgFkumExhgbgecssR/iUCe2/xKihp9QUiox2NEJa+YNx8RWEx68QL1ZPIheq2LVcIxOqsr7En7jdabr5lkJPbcOHxl1vUSBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388878; c=relaxed/simple;
	bh=3dvdlqTCgW0xyjqmHY7gt030XSmXBe1FOIXQX9wJJhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iht4sgr8kBNrF5ToPkg/dj0LNZMest8oNkvRtylP/SFZjBjbO1m1GpavIGkMU5iDxkU4WESeYGbpOyuOGDKQtVEuMOTrZy+uL8DhY0hwAX62UO4ouV0Q29f7aaqwXxlv1rLiRzF0BLfhAn0/k9oTIn50BDjuW76fJdh5l4Ao6BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYmFp61l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiMKkkhr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYmFp61l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiMKkkhr"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm96G377811
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=; b=JYmFp61lnN8mJ1Wy
	S0emWZM0Y4RrjaJxcAIM8sn5hI5YAB7PcCR6ldmSnWKHdPDIcLTouqHl1MXXY0Y3
	HfzChKsWk8bf9yl78oPKbMSKO90TuHFbkVhr76qSg3ZYhMMvgO25hUbxGvcnkt17
	Giir4KWUQl3aRwx5dRSY3r6kXXY03q//qPG8RKYM0HPpTuO5I6VoRHZhbOPPVNBS
	OFkkOOJD1GaTpUtu8KfuFGo7jxA9HirGXeEx3FsFPg+DChkRZBwpF/TLqCc3JPN8
	He1nHUvgtQJaLO7ijY7cUqqhVQO+egG0EqaUN/rcY8QAmoWEzhaGwuYZO2uD6xJt
	jXxuAw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpecs8my8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:27:56 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c665139c92so115586e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388876; x=1789993676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=;
        b=LiMKkkhrAxCHr/K5EKgQxnDYDvO4mZPcRMH1LMXV/wYbFwR1MXW7ueIXQ5onjtJhF3
         AHREOLBkP3PPs5xbqPOK6FtFPyncXX2TFKtClsXZWFc7uACUjpQCWc0EZRthiH15izvx
         sHuCmTpWW/GJEPNDLyBH8Cdo/InZSZg8FARyIwvn9jHWIbLpRlEGyrFXVAcqvR2X2BJ1
         i9bU0OBToPod3xf0MAM3r/safxsBQX1Vee6ezMH8o+CeIdYAD+OU3Lhjx+4QV48Yvk7Q
         2DHUQQyLFeg/XtKyWI0BCcfZEkZdPY0+ssEMJhJaKnb8YJ/R70xSxiQpfFH3kpVEtfWB
         Pdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388876; x=1789993676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=;
        b=p1+vyW1N+Vc0tUf6foriqjpWbqAMpI8PTJd4J2pP+jLTPFK2KBvHZeuX//rBjPbrkI
         /rqS9euIwpISMCkYmJE5JTBGOzhQWl8mR+lGVSNkMRnBupmymUuONONtVS3NheLMfd2F
         EVvaDv0w5Mom6YM4LPtK4vzoYXT6BudltHaYEMt5oR5Abzo+14auGIqiog7qblyLltv9
         sHjncwYx4iT+Kogo+MyTI3osQbv5QLVEOVvwwUgdBsacYe0IKwKPThVTP0hZWUbiD6d3
         zFqR1/2iW4O1E3Nar4BT1JZxKJT40ABQdz6KGvG9rQV9U7j1lAEJU22PqREeEgz+S8j+
         iegA==
X-Forwarded-Encrypted: i=1; AKwUvBzYfyBlyNxIvbo/DV/HcmT9fglcf6csreM1lbdM5UnFdfN3+ug0UhzKmEicav0iAwpT39w7YpqQeaS0K78=@vger.kernel.org
X-Gm-Message-State: AFuF++kig7Qr0zErVQZ7o/1bHfcEEEeAS53/v7LOTjYr5s/Sjp6/tV7E
	Uq7jrN2hOktxVTssmzD/Cqwm9OZDAP7lmVVJnFwK8mIphFw1J64O0t+G1+3NnEsvHnj69myjEJI
	lVcwM6zsvqy5PIT0XoRhLp3nO3cmCtsGweXm3j2P+S6siOewZOFTGK8e7HpQ+WXVr+oQ=
X-Gm-Gg: AYBFou14+vPT0DTcihAOpBzkE51lbTyFZOcf7CjgqoQyXZp49HkEvH7CfcBAUmgCkjs
	TjZXKYm/HOKgrblwByT6nHSi9MiDAgmDxiF7QgQ+bX6HI3ekGmGdIFvIc+UCcU95Uha5JVZd8+i
	gWNs/Oj3US6xSUslNjk+/c9L1G6+nW65tpdb/swOP7CITgzH7bqmXZZru6r4Drx+TaMkp/s+UDS
	w8Iv/gshsXgjfnMKfioq1VVs9tHAfHVohgZn+uhHfNaPPrAbg5KroKcnGdM8EJmnt1FS6zzPVjz
	vpeQ/4bbKjd2VAxF4NO9q2S6eehKFtw1XZAhVIKhXRcrvn0pMutDkgzBJUby2cJKTuvO+CaDkUc
	5MnaTV8UU7bwR9MB9jNlqtw==
X-Received: by 2002:a05:6122:10ea:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c981a8de22mr379847e0c.1.1789388875679;
        Mon, 14 Sep 2026 05:27:55 -0700 (PDT)
X-Received: by 2002:a05:6122:10ea:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c981a8de22mr379832e0c.1.1789388875181;
        Mon, 14 Sep 2026 05:27:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046c5fcsm2388912e87.52.2026.09.14.05.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:54 -0700 (PDT)
Message-ID: <4c28e436-513a-4c1d-9cf7-3aa89cd7b819@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/31] arm64: dts: qcom: msm8917: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX/3j14y5epRCN
 xGyeFMIqj3Eto+U24GfUwc6UqPNEQXijumnr3NHK3v2rrmdyYpfZFHFM7ecihK6RTJ/jHog3Sxr
 HxvGkcoe3tAvLPP/QuHfjYr7Vc7Mcl0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX/AKtn/X5nc20
 SpfXINgLGjM2/l0gxGvbtLAa1D+EE9w1A1ycPj18wBRYgBTT32xDd5PX86V/Rr0fI1/UBRDNITU
 RDhontig7JqbufyiFPGFHhQLml7/5YHoXjnj86GEPIEMFcV1KKnOrcx7VaxYUN1pJu9IP31nq39
 GMFl/SGu8wbH7c1hviBlf/AnZtop4/Tmr06rPD+cgm/hWe7gt//1vWk8/mzmy5waB6FItbmWWc8
 3HSokgqJGotKHmVrLsO1c+/HunAvo7sKaFds6H6NKy7PvJqcUOv9FIVPo2B5wembj/9bdRaJojh
 kGXZh4ohqG23IKmhATf376ANN0Ei0EsttW2xiaE2PElN1BJHKgtb93H+4nXqhpkLhkUre03qpSd
 yEhmxhhaEjF1XDLfbURsI5LH+MlZWsb7nKeQnybezY84QzN1HKQ7dFD3hKYsvDGQ5833wFXkis3
 vZPMz5kdIiBLxdM9OGQ==
X-Proofpoint-GUID: SAkEr2fFzPlWE81J-fj0tyuCPss2RO8k
X-Authority-Analysis: v=2.4 cv=b/cncdGx c=1 sm=1 tr=0 ts=6aa7e84c cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: SAkEr2fFzPlWE81J-fj0tyuCPss2RO8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
