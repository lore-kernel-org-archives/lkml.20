Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180379;
	b=CiA0neLaTTB25i0EtsliKiPJvuEVtQom0mlcLOnTV8+mje8fBtQfOPbCdQjU5w4kH3tp
	 jIV+dqoPT5+C2a3CnwmYKSyQXdxcl6hQMkTUXlsncMymc8IdqHILxjdpITEP5sZsBstxk
	 rzEkkvQ6Ma/5tbIE/10P4NIO3ilY4P0rRSlO+pk1aqdBJkdzJuAptG9BvmPOjYPyBZP3O
	 9XZNJs34/vJCiCen2VL2EwRalLKnrrVKik9gg2ZdbZyRnBmNaPGdV5d/ZpvC8e02eiizN
	 ULscc6Ovqq9u2Odhv+c1vtrj1SYwVfptE9++AxLU+xVmX+EHnvjtWd+DOCbytj0zbYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=nhSXB9TXVz9aiCbi9n65eSnYhyuDc+iW156oc49stO4=;
	b=5f8mrlnh9u/78QGHspRl8ADlosV/NVtgxfnbR50jz7CGWe/51Kpm+cpR6tRHv8Ti6tj1
	 vU9EBrsw0X6H61WN9UmQdmWDQmXufmXpAFsD4WreKV6iThBuaINM8mrjToi++M/TmIa5m
	 B3BjQ3NLsj/TaNk60kmTvf1hSY3rEJGTNEjdHGWHuALfn9inDocOMpASvCSpCl3mpBmwQ
	 ASjJbH+qZiCz6+f6M37XzGs0O3VXmH7xfbQNREx3oFsBhSd1ZJSKLdvv75CM8jEFbhjy0
	 rk1JuL4i8rhhl+w347MGkNnohthkLFiitX4WUvNZOPjO+RtHje6Ctomb9ZV2ZfXrlkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmUEFxRZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="beT/k+Jl";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD04C606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AD04C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nmUEFxRZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=beT/k+Jl
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K73N1667693
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:39:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhSXB9TXVz9aiCbi9n65eSnYhyuDc+iW156oc49stO4=; b=nmUEFxRZfcgRWKQT
	hzPWlWy4ZfVWACjIRCj3F7h6Rmw7hihb6JB3a+ka1dPuZIhBPfHPJ7Pdkk2aqHgF
	RDu+AdyeOjNNOqZOjwkSdJoI+JWD6RWuMIUYDLJ6imCJPPNPLyJh9yNw3vHITHaB
	VuW67xoiJGEtHAbY5OfKZ7hHdAp9g2on6Biain6QUXAjIfTzD4+urFr5yiyVoY/+
	v6E9QKnNfnSoZ34y6fzTg9C5I1noppCsLUJPG9RqLKM8bhlYi3K5G5DaFHOj5mAJ
	bXLaS0VE4MN73QDlO6PXKgy9AzYPv8SKU5lCrXQQ5nCWRS7RjCCVs5gIk4FmJsp0
	fM25/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12ptx0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:39:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-944101e6367so454585a.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793180377; x=1793785177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nhSXB9TXVz9aiCbi9n65eSnYhyuDc+iW156oc49stO4=;
        b=beT/k+Jl79CUEkA/3ZelMynit0UL9dYB8aBVupHWD9ZJ3bOEyWVvTSSdqyAhunMgw4
         kCVd+W+L2iHa/hb1WH5b7xhu29hscaVXFex9xQYf0u/g0mmLN91oMZZGtUhvf0zByqmF
         DpiAu97EZ93qMtvEE8W8mAYIkhTzcBGSHOj50ajE6d+XMhrP/ZGxExprUSTESPzdfsy6
         9qDUVJ8NTy7dszflFbp2COt9W1QPzNL5rSflUt2n7cM1tSskiWAjUTqOyn2fuIVLscTH
         LPE+LsQn//LFApdGDLrrch13BQQVKVp1EjuP70Gnp0dWgQoJslHWCVdZUmAg6K6F41Fw
         KZYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180377; x=1793785177;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhSXB9TXVz9aiCbi9n65eSnYhyuDc+iW156oc49stO4=;
        b=Km3d6NQE/3mVYB1V6XaGZWffTedcHKabHy6o4XUrxFHbESt2za8ElDjYW68KNCPUzU
         SVgVRPfiy/IufmP94s2q+XtTYZ+soW2eJZAkNqZGY+opdYBIWatokwpFi7CqGaRjFyy9
         HXwhv56QXB4EIg3H5cewPyDwSPP1g09aNq99nw0AuZaIsIx93VM5hGPmfo8CKPyhdMdU
         ADAEW9sq0FlUXO23DetVxwS8BcZwt87FhPtmZzXaMp382l9BeTB0FCenvRpb5h3Hlsl2
         Yplv8G0ehtutalTWUVMdnpmtBJ10sXLVWaX2L2Xh4+Up0tfP1N3cXHV5gLQXSUpu2Knv
         GTDg==
X-Forwarded-Encrypted: i=1; AKwUvBwlSbVCFJhP2+f8Zcns36yrgndjalcxKU42c8tbci1iVXQrPsUtAUyw6SCn41Txk+w0mxHnAVXpi9x5JE4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKzWkQUZoQfCt7mW6H9zT6EEJ1JWqe1lOyi27M+puKIR71n3Dbp
	FJ6+L7qkQ1cXgQEg1D1PT42kV/Yxt5wT+zOwBFSRB5ui6yReuwRwtPYXEPb9WDZEJIfsjLOhDid
	BZCJradsBI7B5D4f0/dtirF2P/M0R0/9ffc2NoiERGAu/2olwGUGtBpAeZg+4H/UKEA0=
X-Gm-Gg: AYBFou3bBlCuW4bXAQAO7a77j5jIiyBsv72vSVOv43xhzwIs5zPHJi4rtRTvkpSms/F
	u1K7Cl97vaTN16DFI+I7ZxxlMxYmIhLcQuu3txb5yCS1lFy130KnQhGvKv6ay15se+AStJdYx2X
	+xf1LQyxpMFKbyCucG57FBtGNdsQ9OoJxWIMt8jBUW37KkTm8k93GfSSbOvQ9bDpx/wbhx3Dcgk
	WhGPkzGyjxwkcTIYcI46rSdo2xjajxskHBuZZ1FhcfrU/gUX8x5MPQPfzvLdkR/DdY3rdKbPHA5
	P3f9xf0ntfOZjzXGbhGRAI+Rz3GTYqbp3VPoWVagR5oGsHbkIlBPko19MSLWXt6MnATOWIRhjRo
	3SxYdpXtWwxvHpl1Zmx8wizIx3i2/iYusRW+kEpw/b0Nt5i5egvHfMlmtCzHa3Y+zU+i++cZaU3
	95
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr841485685a.11.1793180376630;
        Wed, 28 Oct 2026 02:39:36 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr841483385a.11.1793180376205;
        Wed, 28 Oct 2026 02:39:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97a093e7bsm32246735e9.2.2026.10.28.02.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 02:39:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Viresh Kumar <vireshk@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Francesco Valla <francesco@valla.it>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtio: convert to immutable irq_chip
Date: Wed, 28 Oct 2026 10:39:33 +0100
Message-ID: <179318037067.12114.9317144412817671928.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>
References: <20261027-virtio-gpio-irqchip-immutable-v1-1-f64ed13d4567@valla.it>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1folWGs42BkldR86uRIz2YQBh58_Akzr
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1c2d9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Swp7RsIVSdNva39kMz4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX9QYtQEisA3pr
 UDGMoLuPfclyR7wnM9C8dmPI1wP8V5q9/QUT7wVjgqypBE95Vsz0Kz3A7GSwQOmdyXZqGFbiHhw
 PGEYDo7XSS6kSYNIc1ncusmUAp2TRei+MXDv8dePybhhjyp6dEbiRfGWTeqgqYMt6wMWKQUizd3
 xousptKVLwgdIUdLPAgKvyvPPlymuJOSia5SDyb2K1bWRjtbZjUerlyMbIcpB91r/sQo/w4DNtm
 1v42oI9wrb6tKt5YmeWU5EiGT5DKIXU1XNNrRjsLcpmSUp4Xkr2IuZWJkWJsLiPYHAcdcF+76rm
 Ixx/IhUD8nlQgmZ8p1JzH2US3eCxeaKrgVdyKMK/St+lsiYm/A3sXvgwHFXyRpClAVVlf+tI0Ru
 hf8gwwUX7RJqXSYTSKQTXsZUpkpEUyP/oYD+SdnPn/kjOBSltmIDhLpkzSDIM2prPEwwEDCS2zq
 rz55jtSEq9BQ+DvsJTw==
X-Proofpoint-GUID: 1folWGs42BkldR86uRIz2YQBh58_Akzr
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzOCBTYWx0ZWRfX22aJsYPjDxO7
 CgXVC30JaEL54WadXVepOW5qGt0zK56y2cDCYxRIRYj9CrUc2+2P7x4ddFwOKds4UShVY8B9aBw
 g22Ii5uyvY3AGsHXWUmdxqvduMkhRzw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280038


On Tue, 27 Oct 2026 13:55:24 +0100, Francesco Valla wrote:
> The kernel has been warning about non-immutable irq_chips for quite some
> time, printing messages such as the following one during initialization:
> 
>   gpio gpiochip6: (virtio2): not an immutable chip, please consider fixing it!
> 
> Convert the gpio-virtio irq_chip to immutable and add the relevant
> helpers. The exposed name is kept the same as before through the
> .irq_print_chip callback.
> 
> [...]

Applied, thanks!

[1/1] gpio: virtio: convert to immutable irq_chip
      https://git.kernel.org/brgl/c/c3b94486f0c07562eb894ec6c666656f8cb6eaf0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
