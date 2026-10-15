Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AAE05111AB
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792059661; cv=none; b=lfdXk8N25bd3iOuQXQzKR0q2ghCsgAxx14YGppUd7fa5VuFzj2O79E4Lj04MFbQgCZMsR1qf3Fo/bhQLzjEAQYfeJXaJT+AQD6Jyup4v0mWeVe9u84RkD6F8IGn1J/ioFn78Aw2YTiIYbdtTRDxJaajPpvCfi5h5PBmIE3Who8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792059661; c=relaxed/simple;
	bh=AfazupRWWtICoUAGH1bBSGvypUPJoxkkS6rNv9KiWsg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uW6XFadf2qeNe7J/KBkpr58pG56ZMEer/FU2VQCjNOklfQMNCDaJU2QNaxoeoM4KQCGAawFIgU076aPGmebTxy+CmgaMHmEooSXF9SVfn/be2J2udbrtOfsx7nEwwAt+0HS2gi5mhjFRLM3rj6BPEnTrbXSOm0E25xbVOUFtOHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oBIfJRno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PRO1Rpsu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oBIfJRno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PRO1Rpsu"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jaaR2966458
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:20:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=; b=oBIfJRno+sYg/ngg
	B8usJs5xu7nde6QQPE+thF8mZWDZEY2amZdl06EpXXXfedfLPFu1SimGzLbU19q/
	Epel+YfyPso27KT1Pu1BXlFWuvpLI3fbiLNOX8rLYd388DOG3aejxkJdtb68xtEr
	ZHxz/vbZl0No0lv1h5wX72IFjp1Fhr16mDE+sYSb9OvLdIPkUY+2pQhxdfKWGFKa
	/OpBuGu5FwkDGb8pcARX0IU19m4mAm/z7TE8j5RdbCZgPaPE/C8CpisaHu51wcI8
	9nLYA3bHVjlIcSm1iY6/PYUz3+T23DV+a5I3XUgurR62v/oLwR5oix7sFavB/Yuy
	SlLWmQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wuhqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:20:58 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f12bb489aso5048985a.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792059658; x=1792664458; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=;
        b=PRO1Rpsu/7GJxiSdQZ+ZuU3C7xC39jYdGmY113iG60Hs7s/VJ0cUr06VXZ8HDOZGN2
         gyfR0PL2EaMgSnKZvEOZTgFEgCEnKyrg4KbrUnBtS4qC/rts3dBBWBz0CDTDF3qvwv0C
         DMrbRqC9hQx/mKQKUfCrdmkaFEf4Xn2zb85i16kf38D84Y2CFYLZrClicFQegeHkUmt4
         M+EYIGOP1+vLA37UPGPduSMKeAlgFO2gQYWD4NzNUcANsPXPCOCLFhjRmW8ybvQM9seL
         Tjgz1owknrHku7IJmL1dFtKwq2TTmSu84X7LFbpeMUoY8SR5OwDdkMIAputWvzMUJXCv
         u0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792059658; x=1792664458;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vGqPYmz+xUpL9VkJ6AfNSwDSzuKUGDs49ODBW/+uu5A=;
        b=P67Nr6OhO10Ji/CMsQVQRrk2zYPfYjKsMMWW0HYhfpfHBa2ug3eU8L40HQvQV0LP/6
         K1KdE+yyu+7kgKwzqwhv5uiT15c8oVx73MXvLK09qWRfM/p/otq3Z22q06uH9ZPfn6Lg
         Q3OvOrSFiAUZ3L4d+n97JgB+3W6Rc4WMvLY6vjirt3L5isDqT3D/x2lKP/wjYaPxRcGR
         /ySBCfZsa8+QSpxnqdN6lwWfOpK3ZVqwDDA1p7HSkDaXctr2R0Uvn7fKpeO6ZKScMXpN
         a1vOGV+3LGbVHBtUylJYHVma8Gu3wqk1QHseZ7eddIinAjzRLQ4hoEMXoxZAFJrrQhG5
         OMrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx2pkcs8VcuvZcPDbA9+o+LMQ9ttqVMGoqqntS5sYq/G66UHychgQGMTXeu9Hbg4DoqrLzNhTZuxyMQqLI=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX1CoaphbTWiZ63KTDcVTPxQgt6y1BwWlp/c2ZM5bQqvluq5NL
	De8OA7r5QTYlDvJXz3Er3pQDVNzqjciUM0sSxXelpfWOKtqJwnSw2EO2WBF5bduOjwbvO8A9DOy
	Xk2FoMMBquT47L1YOj0SJ4NIRg3Fso2F3cgFvLKr4q18T8/FH+t9aIFhEwSbmYtkFWnw=
X-Gm-Gg: AYBFou1G0SzZeV4/+chVfnn4o+WKGi9I+C5cXg6bdPl+9W+iWSfqxHaFmw5J1ZGgMNe
	jn5zMPqVwlCYxStCQT//mySeGDwtyQRqfuslRhn0bz+Hj2w5Y98uwkcNNZuSMzUWnkqdspO8wls
	ccbB+BDCBOnC/6AussDrnZVvkVYvZ7Xop9dJv2D120Dg24a9CyFO9H5iUtpOsoc6BhGwHXnnb0e
	3vMIi+7Szi+kz+V0flOz4uz+VHHJFhgBzEZThXEbwmSotq0mbWhrlQSR2Ve83o8A2pWcmAZwWvO
	tgljhJlpzpS3GMB80lGhWwAmWS76qK/hzlyuJst/XD4/onuUbUkWMGvu0uluvngi/kLjtKbqpuo
	SLYJFxt7gXDV2uTqV9+X5xA==
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3599359485a.6.1792059657817;
        Thu, 15 Oct 2026 03:20:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ebd6e4c09mr3599356685a.6.1792059657298;
        Thu, 15 Oct 2026 03:20:57 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm105704266b.70.2026.10.15.03.20.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:20:54 -0700 (PDT)
Message-ID: <d8c2a208-1ce0-48b9-b850-2561bd37d3f1@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 12:20:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: glymur: Add videocc sleep clock
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261008081036.3492003-1-shengchao.guo@oss.qualcomm.com>
 <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261008081036.3492003-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX3Y2nIXqtyqlW
 bBH9BnURrIoIFGU8wIU1CgSjUBHuubihe4WgYq6TyS/9njf9t1XWtDL7rTzfTJkdgpilBpuR7Il
 Du23FpcY6c3p/zJ89gqX+eK99z9E4po=
X-Proofpoint-ORIG-GUID: NB_pnVvd_1GVrAFbv15pUgYSIWDyLO6U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX2M1rKUYk6hLo
 z4fxqJQ2qZeaNzLE1wGhU4kNCJ4fcIwM2B2SuLER+f1++nW00NzAqbw65agiPDYFgSrPqbvkLPr
 bKVBBnqdOYwxCSU8HPSQrI4mVelKOr0Xp2jVkVfWJ+SfeK0B0KzZ4h8OIDpWEllkHTEjKKCorB5
 cpygjwnVQmzwLCOOeN+FeGkHPrAPc19fQ1q+MvZOS5pWoHLsUrsnQ35aaOZJu2shyHqexUaPyZM
 mXvxLatp8hExa35HwvRgR1JMgZMCVYasQxeBFQaF9SQw2WfuqnFfMwnO7SZXDyGMol6nqtTS5Gs
 L403Q6I0yWCbbqbXvuZO/jEKttn0OsqcrLHpQTXe4PvF/cz8jPjdTGFcIER/6q2j/qtJu0BcIA3
 hC6g4Y6o3wL8jM84Dz6llgvHVFV2NXcHNb4OWcvUCj9nZfaU7ddyl2HoiXU0js/NwiLwRJkXRHk
 Iq3mkiefVBlIgo6VFKg==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0a90a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Z62H7OANAOBda0uacUIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NB_pnVvd_1GVrAFbv15pUgYSIWDyLO6U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041

On 10/8/26 10:10 AM, Shawn Guo wrote:
> The video clock controller binding describes three clock inputs for
> Glymur: the board XO, the always-on board XO and the 32 kHz sleep clock.
> The videocc node passes only the first two.
> 
> Pass the board sleep clock as the third input. No functional change,
> the video sleep clock keeps the rate left by the bootloader and has no
> rate consumer.
> 
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
