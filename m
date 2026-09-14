Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C26A456DE8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789387299; cv=none; b=Ze4rraLtceWhi7NRRW6mw/Tg+HbuXu3jSootxGn5DyPuLXFD1/8EVUYqXwm2qUGp/IdClr9bCuEtfw7ODwEnqWfzJt56WxOnS1sybOjlWTUrwrzQAeGYjUCywEAhP/rhY1YvA55tUVeNIyM0Tjd46wVn++QxfnYwyOULpyN0z9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789387299; c=relaxed/simple;
	bh=86eYR0i6ZVOAL+yOW9gV5s1lTtVfbPgehRLwOGUh8MU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PxSJbJiSB+pJRKUAptWVYU9KlmIi5WQrXd657lzDN7lNKfCyrkrDaBNQWk28OLmh5NJz+c1rNXtltIP+mMwenGnJaxEueO0mp47vNtRIHb41fhbt1EOt/wnBriq388lYk1iK60K4fOeCH88257+pagY7W4xRsVeeaQiqj1V8NCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnamtNDQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/cUyenc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nnamtNDQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/cUyenc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlxcX1460628
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=; b=nnamtNDQQ9gHj/1u
	8u+wb1s8mTP6JWRKxKfdX3d8ABVXd5kMHmfW4wQ9nsSyRrjYa8WkAnjy0dXdtaEo
	h2enOSMboZOQCYy8H/CFLdd9f7u0SAjuYTs6HsjKsSMJyk6o6xUB+uwhBjPWBiyu
	sicjPLoGajNYaGVa0l8fMYcMn32TORMoX1I0eqFvp30N4DUbJntsg9O1Mb2f8SY4
	vyxc953Q5FSjtqXmzyZ3M9e1jVgMce4t+MrG76KRNx7HpcRB8WhzKnbYVSsGWoj7
	x1ZSWv1V0N9dsqSCWcPL2ykRO9F2MIYBz8r5t+u5rEJnunkGwCFUwiCOgKAy+DCQ
	w4ofBw==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8j72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:01:20 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cc5388db1so36517241.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789387279; x=1789992079; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=;
        b=Z/cUyencPcBCvGHjHB5IKY53arIs3r21sdUZTIMBq8b/WcRZC1K5QRiGrLTEKYAm+/
         o+m19HyH6Zc27DLsaiS9CvlYpH+4jImYysOJYaGzuqMXtHWHS9JRPHpxLT+wmi1Mb1Li
         ExeqJfg0/YVZjC05Igdjqht6wJqZYPRn1IEuWz1HdnYXGEMvOO9vB+uu/MhMhj8GBjRn
         RQjsarsg0lJlCgwe9iICBwuPGXyPxspLtKt+IFmXc8+txPgvBAp99GHxj84VnTZr7XM8
         m6ciE9MJfLyAqwRXxgIW2SloFBeX0StP1EW/TJB5XJXBc/8SlvGKF+rwbtoCC8YBlMu8
         tkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789387279; x=1789992079;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qo6JOC6UhdyNUkaB81UiRgfAcuvaacMeC1vvdHJZFec=;
        b=q8iDlFm8cB4M4ThfGUEQ+osnDbODpWuaQOTLHUnZdhL1USED30jYg32JVqkgXh9m7T
         xMj20a4zLouDFuVvXfeSdUNDH366Sf7/XRD44dMPyqDhmjWWn4urS/cuH/F63NoHdSey
         uW5rfXlgAaV3jewHkz0u4PjF+P7//3Q/YD7HQYYKRK0+PPxAAUlW9La077pwM6JkillF
         dIMXgtxmls0zFNJQ6+/lPGMWRjX0u/ogOt6pElWDIFPISqeLscTU2qeB1WzmrHoL3Zd6
         UpepQsGPsnT7vWP8i2X7fntat2AaMRiRIiHh7vFS6KmIbBoGm/p1RIxf7VSfTmvfVWTB
         uMTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzI9DFt/18D0j2mAr5d2Mz4MQ1xBSpiMVeFRePUaoFTIBWu2/xfBzWWb3JqjELyt0I11f7gjxsVZifu68I=@vger.kernel.org
X-Gm-Message-State: AFuF++lRuPuFY+ntI2iKslYa9pJxmUB+Rzgce/kWw8yX5N9nFLcRnKGe
	OsVCoQMvYj003eEyarqWMLahzEXwaHlqsIYffV/NmvUmOuv73Cz7w8L/A5y3T0CzAAN0VzHKd1g
	MvMxtGm3EL9jYHevq5gVUTMiocKz3eDs8vfDJMUZltTeSoa/vJ5YlrvDye42zOG3x2yc=
X-Gm-Gg: AYBFou3MsYTrTVUQrFF4CVNQcMqCnOmECqk1VwClm72zNuYRHadI5RMx+8xbGMKsWGd
	I8ru3FPKhT2n9XvH9NzPpsZft9n3VwpqN8Z5MarxNOj4fM68miYN0ksxWk5nxp8tBH7TzZJlwRr
	vbebqvFwbG4n0lm64DcA7s3VdfhXdZ7h2a/jvA7b6lOREC8XWt4umSYJknk5S5A389x7ujdg4N8
	qs/yDibELmUY5p0nPRou+32bAd4dUsZyDV/6vRInxUmpcr6ACsB1NwAr4Oh4FVuXpAqBS9oe2W4
	ZUb/+6bwuJC1LEmzKHsPPisekJAIeU+n2ZlShAbVyS0So71YsivO9cX/IMMKnHQOYusui1MWNX5
	4ybm5NXY5l8byJDuyl28ZWQ==
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr321829137.2.1789387278954;
        Mon, 14 Sep 2026 05:01:18 -0700 (PDT)
X-Received: by 2002:a05:6102:149a:b0:797:576b:a9f with SMTP id ada2fe7eead31-79b5be3a274mr321754137.2.1789387278364;
        Mon, 14 Sep 2026 05:01:18 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2965c4dfc7sm417817966b.4.2026.09.14.05.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:01:17 -0700 (PDT)
Message-ID: <7f3aed88-fd53-4cd4-a316-630208e7c08a@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 20/20] arm64: dts: qcom: generalmobile-shamrock: new
 device
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Lee Jones <lee@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        David Heidelberg <david@ixit.cz>, Dang Huynh <danct12@riseup.net>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        iommu@lists.linux.dev, mfd@lists.linux.dev,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-pm@vger.kernel.org,
        linux-input@vger.kernel.org
References: <20260912-msm8952-initial-support-v1-0-0e742578b524@mainlining.org>
 <20260912-msm8952-initial-support-v1-20-0e742578b524@mainlining.org>
 <d0d7e3d0-15bf-4850-99ec-44d429c6bae1@oss.qualcomm.com>
 <42ef03e8-112a-4689-aedd-eeb7ec9b4f58@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <42ef03e8-112a-4689-aedd-eeb7ec9b4f58@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX9cLjRP3C9Zuq
 +/u/OdVyRIb/9AaTi/+L8zjvZDxo8Yr3bO/oSJYZ1qcIedy3XFsdjsJKcUdc34YmdLXHcw/TlRg
 DPXnUGq6BF+CGJG/aYjFK45fvZPEy90Af/E7ZUD231q/4uVgrDbxSOmOROOdugDADGw9IOI25oK
 7YsoaWFFlDby/9Gc5fKJeqpTaLRuAe9kWA2tKEqAqR/BqcYnyKmd7ExXwKsZWTy3GJPkVH1pTPV
 dYgw1sW6xllLCCudOTeTzOqRDNTIAL8rICGVBpf9ywLeFbTuSAnslYqMgeQUlP9MmZGNrtsrAzH
 cnWZGkpLuI0v1p0SyvJowjwfEYdSbQRTDhM4SN5l4FO9h//5HtpNjIczbrIlzvOGoxGiscKI+ET
 hLQEw44GaZTjlIBGAghPYFyLTgCzAUCkaX74hDn4KeOsGNnM22MiZl/DYhrTYty9VeDLy/dGop9
 HKreXr4YSihF10q8Vww==
X-Proofpoint-GUID: C8J1FFfl3ytIYr2t1mofE06fRqR5L0BY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3MSBTYWx0ZWRfX5Ef8EqpWEipH
 /M5sX4rSVjvyWwzrktAhFXZ9IpHZ3XlYAYILSLHv+yjo9JCtIUa/Qx2aG8dU/XwymjFO3dw93xm
 asmrbKNRz6XrLi2hedEqpPTR+746OKA=
X-Proofpoint-ORIG-GUID: C8J1FFfl3ytIYr2t1mofE06fRqR5L0BY
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7e210 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=OuZLqq7tAAAA:8 a=NPzieGulNsBdfkreKLwA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140171

On 9/14/26 1:58 PM, Muzaffer Kadir wrote:
> Hi Konrad,
> 
> On Mon, 14 Sep 2026 13:22:52 +0200, Konrad Dybcio wrote:
>> On 9/12/26 10:39 AM, Muzaffer Kadir via B4 Relay wrote:
>>> From: Muzaffer Kadir <muzafferkadir@mainlining.org>
>>>
>>> Add General Mobile Shamrock (GM 5 Plus).
>>> Shamrock is designed similar to L9300.
>>> Downstream reference is [1].
>>
>> Please feel free to
>> wrap your messages at 72
>> characters, otherwise they are
>> a bit hard to read! :D
> 
> I am sorry to hear that. vim shows
> it less than 72 and I can't see which
> line is bigger than 72.
> Only one I can see is url itself.
> Should I move url to Link trailer?

What I'm saying is that you wrap your messages at something
closer to 40-50 characters, resulting in excessive newlines. My
previous reply was an exaggeration, pointing to that

Konrad
