Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B69747ACD8
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 10:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790935465; cv=none; b=akkuTDE7AYbuiueLPMT1T0CAl5ZpoQXmMC9hK1o4MTqBSGEmD6lEzS4Gr/K7jDPiPbESXpwTZTbT/o7w1VJl1XiMZrD1i4orKM3wDjoLehbg8zvvLKSds6ZWgKkUk4nzhCfMaB4obA83QjUTerWmDFF95HZHEe5F026KwAQE2Xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790935465; c=relaxed/simple;
	bh=A+fzL9mCV3AUTzB/uTaJjThDEQ9KGzoqBBjpfWnZ/Vs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HW7IqSetN9pzAddDC07Ub68HIcTYJGI4setJqdkkkLqgk9radSP/IWJnPdZHXy8RA001jnM7u3DOU07JmQRf4Tb1v1TeYOc1xfdBRfIoS1kFTs9sDNKisLXvuJyeMsr9uvvZffvRpD/MtkZk9kVcSnvTXhY9FSD08BPPhwYwKJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OgmRjlaH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ODwB9OnP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OgmRjlaH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ODwB9OnP"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6929nVtn2062077
	for <linux-kernel@vger.kernel.org>; Fri, 2 Oct 2026 10:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDKo4EIyiYS802VzZ8C6KH1H2gFaUb/9SVa8WOSjkiE=; b=OgmRjlaHOtqolp3O
	gCcDywbkHJuNTgCzGABKDkUvhm/yNkAB3biWC+6KUxkTFGMeZ0Ly+M29F6W99Y4l
	eOMbc8bd4gJtI2UcrK15IiADR1sPHoloIAVtX7BmaquEKuxAjBgKvhQBdUfCPzPv
	OWVfsEhr+OYCTKi3kBhqsdHHtFStgFhbhCjzPLiWj6PnQSV2EWlgQL8W7DNQx+Ly
	YQ/ZcGQdFJnUnX3J2rYoSHb01H25rQNiDMlZfNhj/q6Tp/ao5gPTthKcV6VoYypI
	FiFtZxfidoxDU4tqZHQhrXRRJCi/O7WTLca/ulCl+2pUDzxXJbyKT1R8JijHK+2J
	Cb4Ang==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h256ms1j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 10:04:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-988d5a1080eso1912251241.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 03:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790935461; x=1791540261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDKo4EIyiYS802VzZ8C6KH1H2gFaUb/9SVa8WOSjkiE=;
        b=ODwB9OnPWDnWDGBtFzuEcB6MH0l9hEUhn6T7hu6C3IHC+8kKC49rM736h9qXr0FAdP
         5bdfgkKEI/9dMsufmljJ8CtnWfW8etf2RfXZqTodjqGOGBHNgP2dH7NcDaLs8adXIf/k
         GlE5bmbvzWZ8PGPNvP1CxR8Rv54gXR/l/ncAsz1rYI/39f/JRjgLsr3HpO0Hj1n7SlyN
         aNZepxro/EiyLBHG7HDcJytGHe0s8r4gkfsFBtj7I8dKyZkyz7gneX7CC/wjUxnxKdaL
         /ELKNKDlTv05M8njMgSvdqHRjLw5etaCrHnU5yWPomxWGJIazgxo2r8/YPiKc2mUfavY
         NV/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790935461; x=1791540261;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDKo4EIyiYS802VzZ8C6KH1H2gFaUb/9SVa8WOSjkiE=;
        b=N83n3ikHT5Cr/ilFLNoQ+Geb2o/cK/y8qgUKoVOAxm1Mt2y+rZ55fQpkJ/mxW0aoGT
         SI1iZgJHPq8P9qU7TXJ2yuPJo6Or5P/450lmVyyI2rWubTGHdMPlIVdkuiP4JmHZQqDf
         Fe9SwsaLbCYCyCu2gEudiT4966j6Kr7T08ySwUqqr8vqr57GKSoLhqKhQHCHm92ke9I+
         Wj8Q7F021B1UG10akW6ivC/4eCEGgNy/BYGTDSeWVthMpjlHHDtI2x78oAIXeUvsTQij
         T3aVR2vXrwehWCUjm2/wWcMd06FTEJvyfEc+LeQ6X4O+YQbiU8Kk7m94uv7HK/9Q8Slw
         CPdA==
X-Forwarded-Encrypted: i=1; AKwUvBy22N9W/TnLHWevmHuHcU9IxLET7uC8zlJo3IpVVjKRmowHup9hroxkhG8U5bsvACqL0gGXHGd86UM+gd8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzFk9dIsaYwojQLDBn7YhJ6/EUOYISx8IfWepIsDcUcdY41Gvg
	dFoGOnRHhmXsNsmKfxrboCsEnGpa/Km0pzUAp3tcgNrFLMKxUEZh/OMUKR0UMgzif+myBo3qtJ1
	HTCICz+nW01w8iLK743GsbHdU3M71C9Owy9P6vxrQQaJJKIY0x7DyYONL16AU8VMpCXE=
X-Gm-Gg: AYBFou0D1uHIsi5RsN/ZGxpwyuP7yOrx/V1n1ECFkV8FXj89RGkDWeoLvCClBCk/IyF
	HUkYFNTqVwDM1iEjm8uoMPZvt+DGYjOpk2HXwrEUhQWFK5PJqeELdDN3JmHQLVVFXQcFggZSpbd
	ec/ii6aHMSKSkq6q+QEZ/hE21ogVg7/P1i42ZXME5Z540AaPagyXj699URl+YKt7vf3mc6x4qXE
	OWUCXFygLqlb4UHMZcvUaa1rJpWlMdFvDUF38TO7yrmBiPXk8Xc3JIxzXLFN33GVgOZ/VyRrrV5
	LZoY/NwKTSDmRKGvtDWeIpJylYLEMMIGnxDYcWhXqvio2reUbL2U4vyI6uhFnF1Rq4cqjFi7eV1
	EIcihsZ+xiuLpvJezwumu/yl9+/z9aoVMVacbLoxXu//QZ0yW2Sv/b41P61Hr7g==
X-Received: by 2002:a05:6102:b13:b0:7be:3766:9062 with SMTP id ada2fe7eead31-7c0f5caafc6mr627977137.27.1790935460994;
        Fri, 02 Oct 2026 03:04:20 -0700 (PDT)
X-Received: by 2002:a05:6102:b13:b0:7be:3766:9062 with SMTP id ada2fe7eead31-7c0f5caafc6mr627973137.27.1790935460516;
        Fri, 02 Oct 2026 03:04:20 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:f14c:b716:c104:4712? ([2a05:6e02:1041:c10:f14c:b716:c104:4712])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm4989949f8f.23.2026.10.02.03.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 03:04:19 -0700 (PDT)
Message-ID: <b614a077-5e85-4d60-8547-d4f7511513e1@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 12:04:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/timer-ti-dm: Register
 clocksource/event only for am654
To: "Markus Schneider-Pargmann (TI)" <msp@baylibre.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>
Cc: "H. Nikolaus Schaller" <hns@goldelico.com>,
        Andreas Kemnade <andreas@kemnade.info>, linux-kernel@vger.kernel.org
References: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <20260828-v7-3-next-topic-ti-timer-dm-clocksource-omap-fix-v1-1-85f0e4dc6f9f@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX+jh3kTLWvu4r
 HDAALGB52LFvWNrM8x1ZtZyKWGjp4ZnW4zx4mwUfZiouH3QJDIwKUWepisoYFYI48yiTr3RmTQ7
 JGxgQRmgoUjWv9dJ7eH5bFMwdPhGt/4=
X-Proofpoint-ORIG-GUID: XmGOiSXOG5Sg1tZqjmZyh1nAp30uapar
X-Authority-Analysis: v=2.4 cv=b80ncdGx c=1 sm=1 tr=0 ts=6abf81a6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=ztCEdXhiAAAA:8 a=IpJZQVW2AAAA:8 a=4EczrL3hIIyy9lJxkqoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22 a=nCm3ceeH17rKjHWsMeRo:22 a=IawgGOuG5U0WyFbmm1f5:22
X-Proofpoint-GUID: XmGOiSXOG5Sg1tZqjmZyh1nAp30uapar
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA0MCBTYWx0ZWRfX6V2SvijchJtp
 oDLr9GjX6d2wwN9tabv8B6DafUQadcF20DxBU9y9wNceHo/B9aS9BFjoB8B6ifhXxOColQ3Xsb4
 kaoGRLRB7RGYGMPyWXv9HSnP/AXrtInwz2KgNmu9JADBNwobly1EdwFj9vuSBweUr60WulSS3ho
 CtUlB/PNGMw7unv+SWZ5jYw9l+/XZeiyJ9Q3k1wPesFza04EDS6AXgJNvjCj845ihZsizshxA6Q
 zYGgds2D9EocG5h8bnMgmfYEqXJxjSKkOXOE8PuauxFcJuBjkBTLcInWmi+jh8DvkbGkBqixlAG
 PNzWYWQphiSmvxrmPf8Fev6540fOgKqmbIqXTpFW03IkGtNzQYYgs9QYbFQ/H2LgsDa5HSi3rlB
 QJ+Wa1Fv3ycY1RtF5LhQFUXddapUcJ9SGfhid9UKyq2vNdycaRK4v7uXP8KhqG5ZGui62f4C/2/
 2xalr142p5kXJr7pX1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_03,2026-10-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020040

On 8/28/26 20:47, Markus Schneider-Pargmann (TI) wrote:
> Registering clocksource/clockevent for the older platforms breaks
> booting them. The older platforms have their own implementation in early
> boot that is used to register clocksource/clockevent in
> timer-ti-dm-systimer.c.
> 
> With am654, the timer is much more complex with more dependencies so
> doing this in early boot with the other driver is very difficult and
> gets ugly. Instead it is implemented in the platform driver for am654.
> However the old platforms may not register clocksource/clockevent in
> this driver as that would break the boot.
> 
> Add a system_timer_capable flag that is only set for am654-timer that
> gates the clocksource/clockevent registration.
> 
> Reported-by: H. Nikolaus Schaller <hns@goldelico.com>
> Closes: https://lore.kernel.org/r/2013A99A-0502-4128-ACFA-B04886224393@goldelico.com
> Fixes: b8eeeca55456 ("clocksource/drivers/timer-ti-dm: Add clocksource support")
> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ---
Applied, thanks
