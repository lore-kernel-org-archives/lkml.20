Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B5D47253A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388904; cv=none; b=ESlKrzb9G/jSkI0vqtS5QDvYJGmjbCRwfL9hXoSTET3ngltyMh97dwp7srA989aKWyAvXNFa4HbYTxqzf6aTbrxQTqUwfT05eBdcuEZPaCutIOy8rP+1xyqhXt0/g1zg8UXdugOPCQEAp+8GIYMHHAI1099XodYkt9o0X/OCLdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388904; c=relaxed/simple;
	bh=V7li5Dw9nmkHeY7iCABC8exOwEM/gxkTUPUJ2FR2iOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fN31VSG+3WdWPf+zoekPldGd1lkeDl2gmPOsPR2cOgawnF+zLa/EVaJfA1m/OGTPaLwtxXvNIr9nE7q0VOcdeVfqAnN2LbJ+wnktl8CvjmacZUE9fw8IrcexzlBVhvQr2fTEKacBeDHnXnlmughVEbvM9GjWlqtgxEdo6AblOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DKeuKdSX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1K0VnjN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DKeuKdSX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1K0VnjN"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxm41460635
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=; b=DKeuKdSXMgIYoI0g
	Y73xzRGE6ORJTINXPoAbyMapHuohAdM4Iql7m1pf3aH7E61s7gqHJlxIV0pR2m/2
	BMdJ1oCVEJcyxr9qp1vuY4KSYceCvDdnPWIA1sMudUZMm8amERbp5ITdBPYz9SOH
	26zDlhfQw88ZqB2Er1vD/KcpbWpDBUNXG9mfjyHe9iS3KegoVa1FeCWMdIpY+0AG
	tRtsZcP9ZQejEiMQkU3C72d4im3x6+PifGlW/Vi8M6SfoQcnCU5B07uWrcKmGcxD
	KfghE8jcjLTavNFNfbQOCU6pShuVT/7fYYeJpiEMW2kmPXY/LYaWts5wXjP+KWGf
	PWFquQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8n5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:28:22 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82b8e1ec4so55412e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388901; x=1789993701; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=c1K0VnjNeVZpoSwW3g9k/PlTHiA5quJxzAiEUjSqj7nClEKiYHJVQ8wmg71wPDNNml
         lIEI+PMUEs7HalqTB16z87PNnyYeLZbttiA4LNq+hHgzbwh2Ml/RrPXsZsI2sk4Vy9SV
         CdixNvVh6aqKmwZfHjaalRxc5ctgEcuN/q3u0h2errbQQpkyTeRACAy04qDUlo6R4RTU
         OtQoMiYMOAd5RuA0lfzVrtv/j7UFaMb05rsyixTNuOIsZ7mLbqT82QprP9TRN/aY3LH+
         5cVtp0jTd/NQPYMFhP8smYRCH75NwAAXGgw4chYxq71hOhHpvHH4FS3HqDJJ7VDfKuxs
         CCug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388901; x=1789993701;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jiFJ73bnfwYbpydUm5rz06+aMTJCWc5/QgNe5wl8U14=;
        b=A5PhCOfB9qgPtpaSBAC0VoAVxtKW3th8JSDkBaU7E6PoqVpoa0rO+Kpgkl8+QhYTT9
         xBBBcg8XhCnG1OidLe1HARr4/twXP1HAT97CuT2Twvg4OcFKKIR69sJoiO7Dil4GwLZ7
         7Cdz4pwVnfFc/U3IwGFWI31AVls173eK1BJ02qfHu03t4Gp7OOmCxkEH3iBZPnWYa4Jg
         k818PId23JCeq6TbU23Bxj3vL9xhUAzspfkwicdWj9H7vfC/j+RiEedDLqDvSF2cT5fo
         fyF3UMddftxtfiWt9lt+IUUUSzLiBPCqSx5DunUaKTOgv4LEfMS2BIcbkIZNaX7jqxYE
         VXVA==
X-Forwarded-Encrypted: i=1; AKwUvBy4oNZqCVNuvQA5yYKotFweEkTX5Cs+k4e/cK32dvUkrtY1y8Am7q8B+9+I97Y3+erOREEwHO+eVcfm2+M=@vger.kernel.org
X-Gm-Message-State: AFuF++lb4W7cFXweIXAGdrQ1D41WmyuJa0iHb5O/Zq4o4ygpDZX4uof4
	nYQkOuSKkoFs7VqqzwqiCzDIt2E+9i8Na/3HCJyS8mJZ83yud+sCHTg1xnZx4UK2pKQG1un8Bmr
	18sJW9hph07/JD5iaxAbowOb0KinB+7xJ+yv/AjfsKUQ9lBwuap4yIiR377ipo+PQi1Y=
X-Gm-Gg: AYBFou2NllM+QPx06DSDIcoxX0c33y7C0m2zSclJbJ6ossbrIthVsJH99RuNw4Syuw6
	XOJuPJ0V3DWd5j53TV/eHjbN0l9AObWfEbZdEbSUGyfQpSKq8rm9k7MYhSXZtoFf+zPPVBGpWC3
	VD/n1Bne/5pyP+DAJRq/0+k6F2538CXBQmjoUW+XrPBwb9nHH7ytse0FGWU2UmGaE0lU1AHdmQm
	9x9gMw8un3fvkNUX51eFvDaFdoaNFa59w8Nd2xOnbw2yh9WVUVIskEkqT007gZyO2hkFjcVJYRs
	BFqX+3bDsPkY5L2RNUGp40vDycKewS76BBtnVnOh24jfn6v4+BJYg9rNhWDSYOZqZcykBttoiP5
	uo/IHFUknUC1bdg5YFM5KKw==
X-Received: by 2002:a05:6102:50ab:b0:791:33c:9d1 with SMTP id ada2fe7eead31-79b5b2922c5mr363814137.1.1789388901249;
        Mon, 14 Sep 2026 05:28:21 -0700 (PDT)
X-Received: by 2002:a05:6102:50ab:b0:791:33c:9d1 with SMTP id ada2fe7eead31-79b5b2922c5mr363797137.1.1789388900751;
        Mon, 14 Sep 2026 05:28:20 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047fd4fsm2360273e87.82.2026.09.14.05.28.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:28:19 -0700 (PDT)
Message-ID: <86c93a2e-61a8-45af-81b8-47c9ede40b5e@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:28:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 27/31] arm64: dts: qcom: sc8280xp: Add domain idle state
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
 <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX3wB+4OZoTP8K
 cCXCqR2kMVU0D6d1WltybAwBj4zzMU2SA2LtP4ZmYEfSnQhFkzDqzLFIdHLFGPlRh4bp5ZmPeOP
 fKbRK0a92enIyK3UMShs/ah4lC5bXwUIDuJP/AxeS75+wwKZkiF9pIgta696lwIaOI7cKqSNwlI
 bidI7YPpAUArl2m2OUN72ANvdK+R+VlNNUy/2xFXK9OJ7kHzJmmItDIDWoiDk4ZqL3feEGt+rm4
 ZEq8xGll8yX4E00jUHhVEqU3yPbG490GY+29z3sTHR9MVfwRjlXXq60ZOJ/i0045f3oC2L8rueD
 CJY8q/RcEM5bWE1grO0BkEtGhBTBYV9YIi24NpKB4O1Ao99gjRrqxIR1xg5MlMrvDzCaYK33Vdc
 5ULPZdvscJXXNrDslh+MdfYUf72RrdQOyQ2QXQnGhASVaQBzlxKaYSM5gnjsriTknJyT7Ur+WLs
 i2qiSYyaCpfF1XVZuiQ==
X-Proofpoint-GUID: TVlqfCham6JOkq8jU-r-fMDRuqkSTYRT
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX6+RR/l8dpMW7
 bq+WtFkkpUbKe5trZ8cqcQVhIHyrxbNNDpl2z8BsrjMZWYVbOCAYnG4mLbJ3vMv0WXsE/ywbjf1
 /nHpNiQNYwjvdYCEjH/h7ztxqIpTF1M=
X-Proofpoint-ORIG-GUID: TVlqfCham6JOkq8jU-r-fMDRuqkSTYRT
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7e866 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140177

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
