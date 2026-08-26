Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582713F6613
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751371; cv=none; b=r3G6cJghb9s0mFolHOiszryaDxJZBX3V4YCuYRmYc77s31weaKwsC7DfB/XOfbRljsG16luXZgL7qqnKq7prtUn47SIbn8VzShz6XfHdiaR+8vA2VLnVP0fLQYGyyciiTUiRIT6w2OUCNniyYF0gUHKCwu5DqGFaFRksP0D6jG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751371; c=relaxed/simple;
	bh=g0vIRFZ80M/7Aqn5Y+uhzQ6mtA72Oy9rCw1aq2Vo/Xs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NwxM3sL+XY6XOBK4JgaauTNOEPug4AVipU23ysfzJF8gjb4XaGAVljWpcAILn8VF83ALcYpVQB2uvH16ZVABmt9emmOjY2Ui+9woSUui2SRRFo/JlreJo6VQJRqLP+y42qle5Bcl0XZc67LrlwQ0N5L4R+nCUoR9aTwIojQMizM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hwhlANK1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YktJzSSe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hwhlANK1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YktJzSSe"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QCUFuN948999
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:36:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y/HkKwP3ySd6x20fvWXQsAYsFrD96Z15LVsBATs8VnI=; b=hwhlANK1ipTc5iDF
	6fgVs47lmhLnpgJSxk23XWWeCN3uex0eBFp/brpsEmuVZhXDFTt5cowxz8ni8Pp7
	kX9G48NA55ByG5R5JWFX2U1xR6NmK2Nso1aD2yhyLSLG/dllapnKAdruECRdoprz
	IM6JYJJKvoBiOgDmPbnv2zeloS6pqyLKpZcH9bddzHhpgPkphUwOak/Ht6aSjqRa
	N/R0LYCimXW8WWwFKl5Ysm4O/fm1UKKGBQ4MZlUlCs8uP1ZSNoqB0R+6fSh6riI/
	JIE7+xxzAJyQL5ntDhMcAdFU2p+nUwpxcukMfPdcw+/WIPbNkG2UaUS7ZVznYId4
	ISZgeg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga07587yw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:36:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52e7a49452aso4786491cf.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787751367; x=1788356167; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=y/HkKwP3ySd6x20fvWXQsAYsFrD96Z15LVsBATs8VnI=;
        b=YktJzSSeKGHrQ3hVZSoZIMGYzwVQvFWlITO0YOJGVZJ6EF/0uj++XboYnbdnf4UW+P
         ckYdfQx9PXcoQJWwP0R4rKQLOw35zP+6Rs7y7sE1Nz+a3U0TojlNrkuS4U44wJR7bGoq
         x4otRykBB0cWEgQiAIDecfrImlcjFacyN+gKJ/TXkRd1XZ55813IegsrYHAAIGDFtQEF
         tA9iP1fTEywXcxMpKOdvIXVun06f4jeOZEGe0zBvDpEyTlKe/Ol9TmDGm23MOsGgjBCE
         I8DIIIF0j2N0VxmJa1YYPcyfaZTt4WFoOTULOsFT4zjM8IynHPMhFB83yFRDoRuXMI8o
         0Kmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751367; x=1788356167;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y/HkKwP3ySd6x20fvWXQsAYsFrD96Z15LVsBATs8VnI=;
        b=FOyWhxC80O6FwmQOnFX6gwYqS2vqzIzIyFR2iDAmacz4Tbc4oZHdLGtJ7wp6P/L0vw
         Ur2ceaox0N7V+qbumnm+GW1naf30wiZ41O0eBMsSUCEbrsH7y+FZQHsiyC1VVbSWYMv8
         ErfuVOnWx8QQrlAfBwCkwg7Yoc4rj4gf5r37/1RUZ4gpy/9n5x0ySBtp2RIpWiCUlxb9
         0Vz0LnzbPfetAeEGIV5OcidZ6xtROXY9hGpG0LIfByxeFBQx8f0HZ+51UOzV5p9FXOVZ
         LGA7BnNnidSzbCgkgm3MXjnIo7bwh9GEp56zQOa02N1e6qdWnufOj66enIjlTdm5+GzR
         JGhg==
X-Forwarded-Encrypted: i=1; AHgh+Rq3umGE7zwnoJCDLDmfSlCcn0xl6xOkS5fMHEBfBITEk/5Vfb4xV0+A++vgyg3VonIMxBExqsBOD9o9Hw8=@vger.kernel.org
X-Gm-Message-State: AFuF++lmEPRkoCH1pU+sEyGsfgZr5MLr4deYen4yYBjfuBTwst81T6MF
	+ckQftkUjO7kwMJPZuDOCqqLHHB9UeGzRDGSb5stKXdvx0/uerodkCvWp0xitWI30ggZ5hw+9ns
	EwbisD26ij4H0vSNYqE4Moi5y0pWH1ToAD1TjIPndnsi0bIboPFZO33KI8gHv9cImDu8=
X-Gm-Gg: AR+sD11YFgmAMyON78HTknmawjAj2+oqxiD9jdgv6rRXfnmMwxaHuB7Ftx2MwL+nOAW
	SAiz0IyiN2ltfg7GoDWE3k5pAMfprDLWycsQ/0+QY9GyTXgaYZCgw4yJQytC9qljGWI8+xNzyGs
	jCRWuHe3U8OC74UScJfS5x+6kCWoVdZidvmTW8VxsKQLooMcmb3S65sk5QRX+54sSmU0oAHjiLP
	J1HyTwnJ5Qq1tMQgf+h8rNQrMOr+JhXibMLI2RzNU7X9kF6MPduU6jyPD/tDzTyqACY0kQrEono
	scd6dL5acAFHLnsBXB5RaUdJmE/GjqbboIf13zo4smE8hG1W7OM2BWQKJqGoTXejWlc74fX5vqg
	1crW70I2XvmbrkZN2yKHE7WdY2Gfo
X-Received: by 2002:a05:622a:6086:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52e4234d80fmr71366071cf.27.1787751366964;
        Wed, 26 Aug 2026 06:36:06 -0700 (PDT)
X-Received: by 2002:a05:622a:6086:b0:516:e0eb:d7d with SMTP id d75a77b69052e-52e4234d80fmr71365001cf.27.1787751366459;
        Wed, 26 Aug 2026 06:36:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:dfd4:a0a3:2df2:7724])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a5deac6848sm4241597a12.24.2026.08.26.06.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:36:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] gpio: pcf857x: implement get_direction()
Date: Wed, 26 Aug 2026 15:36:02 +0200
Message-ID: <178775135168.59974.6231225772608724999.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260825-b4-gpio-pcf857x-get-direction-v1-1-de15996ae354@vaisala.com>
References: <20260825-b4-gpio-pcf857x-get-direction-v1-1-de15996ae354@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: sprX4qkyfeVJ1yNbkfjKRQHw_xbMvlb4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX0f7WEpWqWi4c
 93ow13CaQzccL7y8dt3PHY3jH3aa2RT6rqXk9UPoT3+YvXhI8elB+mcpdkRYARSONtqeAnVEumJ
 pfJR/TWApDAVLcBTPpt2FzIm0j66vSbo++9eB8PBOXQo/YbjU5xr9l1Zpkv5F4lQ1dWBWdpmEpK
 KC5laAt+K546xMDAP2hyLJrdl9B+5e2ZNgbqizjQv6ayLAd1HFKnhcIX9/evEDnZFPX1rQNnvYb
 DJ90lpiRAtblTBLCdBkCQZHNYP96b4SK3ELk0ug6QwJ/JVKqKG+4e7EQklm1wajgz5swt4Ihhiy
 VuaqxPWk+uJQ/7R0WVzif8yrCEjXq6aWdO3vc8iocEtFZ8jfCgvDx9NokEaBz1wAsm2OY1gu+rS
 vHtFDxKuGEJdSNXMwhaMwXNxMR686fkKyrVwtcUM+trKeIq17H9OKanqtnWxfrlTsV0fCDpM4Eu
 62F4mBn+Q4VJKcwjjoQ==
X-Proofpoint-GUID: sprX4qkyfeVJ1yNbkfjKRQHw_xbMvlb4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDExMiBTYWx0ZWRfX6dkrMoWDxWWe
 vMzkNfzn4GkMnSdMvf8p82nfGZfoLSjeIUSag7XqwFind4Op/Tsx/t6OnF682ZbuiQkLxmEulcY
 gKjXtNJBrCBOyY3voKm7D2bINtR4ZMo=
X-Authority-Analysis: v=2.4 cv=RPiD2Yi+ c=1 sm=1 tr=0 ts=6a8eebc7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jwPMpVOCRKw_XXTssd4A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_03,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260112


On Tue, 25 Aug 2026 04:15:57 +0000, Tapio Reijonen wrote:
> The GPIO core warns (and taints the kernel) when a gpiochip lacks
> .get_direction() and a consumer queries a line's direction, for example
> via /sys/kernel/debug/gpio. pcf857x provided direction_input/output but
> no get_direction.
> 
> These quasi-bidirectional expanders cannot report direction in hardware,
> and the 'out' software latch alone is ambiguous - a released (input)
> line and an output driven high both read back as a set bit. Track the
> direction explicitly in a 'dir' latch updated by the direction_input(),
> direction_output() and set_multiple() paths, and return it from
> get_direction(). Initialise it from the same reset state as 'out':
> released lines are inputs, lines flagged in the power-on latch are
> driven-low outputs.
> 
> [...]

Applied, thanks!

[1/1] gpio: pcf857x: implement get_direction()
      https://git.kernel.org/brgl/c/ed14364ae8c310cc3f3f649ffcbc7f82befe1579

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
