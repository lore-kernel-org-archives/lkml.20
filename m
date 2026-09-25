Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739E9486656
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790329820; cv=none; b=tQCrsvv4N20BdYfFujz5fFhCZzBGGOndfHBCfcvXRi0S4nr0lXMlNFye1YK0/yRAUCO2WkRJUSSJRB1UUkqF17tTcRvXXdC3hnNtQBzWVUo8o+viUjtWENXnemxQDqF2W1kagOKdhLCLOzxM+xMrTpFhoh0fI2UhXw9rpP0ykBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790329820; c=relaxed/simple;
	bh=fVJK/ODa4zbxOESRyzBgT/5Apdh+pjZlARY0HosiZe4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=aNfAae+ofxSnN8z7yeStXdlE4EOXC6NpPjsjFvVd2IfyRSwr1F6AU43X/6mwcufGQnHH28lkk3MNsWNNKVsAh7ob0CHrQ8akTE1xC3zFyRFXBjZB2qf/brK0HAPyToVJLVh/p6l0EVX7QI2ssheUyobLAtUmxwOAUi8h+5MRiT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E81RnA5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dIUwzoy5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E81RnA5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dIUwzoy5"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YiM04102879
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:50:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0REfjD0UJGpjCK0Vq2fllUzL5RxgtLYWUerZOCwfaP8=; b=E81RnA5yZSkXnTk9
	CJohkSx2n1JQfJPCAsqAm3jn2vW/zYa7IOzXx800q8CqgGR3mvJuxUvSkndBTkwa
	kgZQs9vRSFPUGTpn4JZyJhxeIRLaHLFx8LvlO/vKaG4BIgjUaMOu3voKtZERfOrc
	pRsOXJMC61l+cY+Jxs2DSnTerDqe5N9SwC7OYp4ovGe0cGgTbHMYx4r+v4MrV+m/
	Vw/ZRVG8d9SIFGfSyvBFB9qyhS6k98Me8FF814NFJjDPP6rQJ0VnSyuIRLgPbUxN
	kDcLtyaTL82INl3qL5rzLq7sP0YZsuJqYoGx1uvFG18U885arlsYu8Cwg5ZHcWOy
	nFM8Zw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8usgg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:50:17 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91433a91ee9so7890406d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 02:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790329816; x=1790934616; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0REfjD0UJGpjCK0Vq2fllUzL5RxgtLYWUerZOCwfaP8=;
        b=dIUwzoy5o3UaKFPpwaQ9kgrSwijLW1+ink6NQWAJ9L21CCUhRwy9X9ht0TrREdS3Za
         Cz3rm79UebgKvi8wgmB5QV6/6YxkY8n6ABXn88ixfcI1nICbUGC84zTlvPf1XRFs+NUw
         7yD/4MMIWi7PzGjOeafF+fwHRhiidSFSHnH0xwIFL7noLhov1BwVosMb22etWU9+pm1J
         HU3zRDwZSR/eTTNB3UuEOfu/PFeSjv4LvYwDo0aA7klkOhRvGqeY60u/67WNAjhwjnn2
         KTFOnRXUTwS0iEG91z7ur+oNEvJrVpyGql/QD2ujwGo0BqeUwwpSHYCeXpXydNyCieMJ
         X1eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790329816; x=1790934616;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0REfjD0UJGpjCK0Vq2fllUzL5RxgtLYWUerZOCwfaP8=;
        b=EFero79Ptl6/aI/WfZKBOw/nbS6OnHNKroBmS2v/ODsbJhT/MxAYymYr+SGQagmEks
         BFBzSrkcoeIuOR0kqcLr0w6zgumy4PxaenCuOEIooIxmiuWp8T/Hs1Qm76fKbk4eJJFY
         7Vzdsy7JaJD0jcOFm+xyy86t1ZqdugfquVhE4hY7ZrFKZ5IKKOFBa3nTE5VNumvfmJqA
         AcQq1TjiS5dnjRCLd7vd64CPzdxOfKMKWbbD+lRCjLFQSJLMuCOcVywD8HSwmUPzA28D
         +dOgS42ZT+RcsPYlhZSizFrWPkpO50i1dt9e1B5/A9Kg/aWyNqay9ZcL1rlRxymDYR2m
         rHmA==
X-Forwarded-Encrypted: i=1; AKwUvBzLi1TgvUhMypd6Nq8DccgrlvwYuDFYt8Xoy6yqz7PBjSUeHo6CgUfs6JfQG/8d6WG3pa/kpZt0JRBotjk=@vger.kernel.org
X-Gm-Message-State: AFuF++lXtIb1p50Q9ghOptLlyNhPJERir5LosHvamaVB8kN/JDoGPX0O
	Jptvu4TEsjG9oUxB2sRi/5/ck7kcjalhd5LxTjoHk5zu4x2WqBRrgWeqPU7iDzCMQ7EnoXugL7S
	gMRnOLSvcZD+gH+PChUFcL6n45s2njNJp8Tnmfx41F0pvNvuKToJK8WGXl/5X0Z3LG/TANUdKtx
	Q=
X-Gm-Gg: AYBFou11KFAC5uT4cgBidcl3RHT7L2arYgtwCN6//hiUpff3IYfMJaw76VqGonIqw4f
	YeQWKaKFprXjDiIJAJfifgU+NnLbwo0hbRE27gv7VaezozL+58c1t5UFU0pG/PN/v9j8xKTDzjo
	cnk0NE7y7AGs/aRPAZh1kTuOInmZjXG4QVkdCKIx9eaQ3mwrB3AgPMT5eQZ3B0P6XpgM7b+xqIx
	Y6EP48Wjk6nrwLgiRIO+7oMWUEhsupN1/KcBikT6AowvYEKaTRuxPmR5pMjp5IIM+wZ/YO8uhET
	s7vxuI9wQQFePqaI0TyZagtkRj0FC4977tFKKfxzSZ8+fkjRXR3ZskOof/bHejxPaP128ww2I59
	IPhHRkiHk+tFHZk8FLmgLpAoUZHl67iAx27Owd6i2Mfa0KplxLLSE3J9z+IJwO36kxbfGWxNj7G
	KsvCXYyHyYApL7Q5Gbwl4gmkJXzAxQ54yw5DsdPl3lGWH/mPrxzhYVc6UYTABZ2U6C4A4=
X-Received: by 2002:a05:620a:618d:b0:936:cae5:8b38 with SMTP id af79cd13be357-93c43b80a0fmr321750585a.10.1790329816414;
        Fri, 25 Sep 2026 02:50:16 -0700 (PDT)
X-Received: by 2002:a05:620a:618d:b0:936:cae5:8b38 with SMTP id af79cd13be357-93c43b80a0fmr321747185a.10.1790329815917;
        Fri, 25 Sep 2026 02:50:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm89637766b.33.2026.09.25.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 02:50:15 -0700 (PDT)
Message-ID: <7be922e5-4d48-4285-8552-9a0281591f8a@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH] HID: logitech-hidpp: do not overwrite the device's hi-res
 wheel mode
To: Roman Stingler <roman.stingler@gmail.com>, Jiri Kosina
 <jikos@kernel.org>,
        Benjamin Tissoires <bentiss@kernel.org>
Cc: Lovekesh Solanki <lovekeshsolanki00@gmail.com>,
        Erik Hakansson <erikhakan@gmail.com>, Filipe Lains <lains@riseup.net>,
        Bastien Nocera <hadess@hadess.net>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <20260923181203.422097-1-roman.stingler@gmail.com>
Content-Language: en-US, nl
In-Reply-To: <20260923181203.422097-1-roman.stingler@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX/mDFE5s6EYDr
 OUR42U6DPr1bW5AVLnBkW2mxQc63rKIrUBKpPVEEKXxcA+rjhP3HIUPgpRvwxQpU/UEa89Qt8vB
 PmVobb1IVvtJDYQ3KVH2l42FJErjvy8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzOSBTYWx0ZWRfX3pEWNCVjq139
 DCou8pWZWnOwfwTSxp+ZHxBUoAuX8YX7U9el6KfdXTUq7pc/1QqfOkZ4KhhtSwognnW12ZJ+anh
 s9VvXjsFsX2fBVwTpeWvAIL1mgjxRLvpz4Z9VuiopNAYRbuhkHJX7k0EEy4PDM5gpn4DHOuejNp
 m35NxDuwg1U4XZflFpYrPYtED/oQ1m3qZVmC8sASUCc98U5viyc4r50syLjzIND55lINpGRkDsx
 7mN5qexhXs6bvmFAJobOj6QrigTVR7zCPeXaXggO0EtdkvIw42Yuu/YI+UrjiayqsDreGCCQaHH
 irH6KFm3KQ4hMoSy7aamajM0fIKKY3gN46s87Mokb0cOm0bTd/0NssFCYgYhlRyzTZcbs8JqCFx
 GjBOvEg53XeRDpQxHQBCwtty30iCddpZJ65IJeZyqJwtvjS2Ze86pY40cJjLjTWCG68LxK0Cwu5
 qWIPFuYyYjkFPW/HLzA==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab643d9 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=m2H-BLnp-5XiiflOyWcA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: T9wROskwy3n0MdXrT-ljOs9Qf3bb9Tf2
X-Proofpoint-ORIG-GUID: T9wROskwy3n0MdXrT-ljOs9Qf3bb9Tf2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250039

Hi,

On 23-Sep-26 20:11, Roman Stingler wrote:
> hi_res_scroll_enable() unconditionally puts HID++ 2.0 devices supporting
> the HiRes Wheel feature (0x2121) into high-resolution mode on every
> connect event.
> 
> On at least the MX Master 4 that mode is persistent state in the device.
> With hid-logitech-hidpp unloaded, a mode set from userspace survives
> switching the mouse off and on again. Writing it at connect therefore
> destroys a setting the user configured, and does so on every probe --
> cold boot, receiver replug or module reload -- so userspace cannot
> reliably keep it either: it gets no indication that the mode it set has
> been changed underneath it.
> 
> This became visible when Bolt receivers gained support in 7.3. Before
> that these devices were driven by hid-generic, hid-logitech-hidpp never
> bound to them, and nothing in the kernel wrote the setting.
> 
> 0x2121 exposes getWheelMode alongside setWheelMode. Read the current
> mode and scale vertical_wheel_counter.wheel_multiplier to match rather
> than forcing high resolution: a device left in high-resolution mode
> still gets its multiplier, and one the user configured for low
> resolution is left alone.
> 
> Note this changes behaviour for devices sitting at a low-resolution
> factory default -- the kernel will no longer switch those to
> high-resolution scrolling.
> 
> Link: https://lore.kernel.org/all/20260920094508.39682-1-roman.stingler@gmail.com/
> Signed-off-by: Roman Stingler <roman.stingler@gmail.com>

I assume the low-res mode factory default is because not all OS-es
can handle hires mode (I guess mostly much older Os-es cannot).

This regresses (new factory default mice) to no longer support
hi-res wheel mode at all under Linux, even the non Bolt ones even
though this is only a Bolt issue.

So in so far as this is a solution at all, it really should be
limited to Bolt devices only. Although I wonder what switching
Bolt devices to the hidpp driver wins us after this patch?
Do they still gain any meaningful functionality from the switch
to the hidpp driver?

Also I wonder if there is not a non-persistent equivalent of
setWheelMode? That would be ideal.

Do we know what Windows (with Logitech drivers) does here?

I cannot believe that Windows will not use hi-res wheel mode
when the Logitech drivers are installed.

Regards,

Hans



