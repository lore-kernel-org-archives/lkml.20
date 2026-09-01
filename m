Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1DEE320A34
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788278132; cv=none; b=OXve89t1Z4C6X6MAdFge2O4XyxjQBRE0I4CFbV3uc1iujaKzzAp2kX7aAR68O+WnFZdOeYFZ6eJXmoTq081firEscfbIrkouQpeLVepwtp0cemb5bDv+wEPkRDW7wZYPPXGRZxfvzWIrg3OZFOukJijw6jBaFG0+Ce/Se/+ABnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788278132; c=relaxed/simple;
	bh=QzHnjGL0qSVpocwYkw9h8cLH9hzxzxgvdOHkQMzj6Os=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dvhFXf8oN2hw0OHhFwFYY+2CDwxiBxb9EzNt/aPvltTm3wtW1lHMk3FOZbXt2EU35xFCI5T4SsTAwtwQ2G8nMukRRbuShyUb3Iz08la5kx68qA8wch7F0HPjvLUJeoe45dszzcmn5Vrr1EPa1dtMheHnaGOfLXE+dLcVBvPHuYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VHtypnx9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0mOVcBr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VHtypnx9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0mOVcBr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9WDM1638978
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 15:55:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q0FZEgly4MtU1OkOL4vwau1FlsbXd5KZ+Wd5OqaQ04s=; b=VHtypnx9WE1E8/Il
	pJbVj8v73OGCbK7UmSJr16lodtzlmEf3OCrrcaKAXnZaraepep1E+oVuw+4Y4NF6
	yHTpjjBXy1dLDKxrkHcqqYe7Pxjk6USMGHk7vtpcCZjf9ry04vdgWByxE+Zv3aDm
	pmWixgKdBzoiZ1BgujEDermvppnUMUiMC96pXzqdtcDN0tSRHn1u5k5JXobrP4pL
	/0hKvKICv6ESIpgaeoMxqvGpMRCnUAAuF0XAiznopO2eOPcNInbIU0YbPgJLYwUV
	a/13/H091vpjLlcHrmPhtl+4ksiHOXE5ASBWp2IbMP0wBm9JDLhPy+AFs8zshJfJ
	o9gucg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjspv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 15:55:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9390ca1a9abso7841885a.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788278129; x=1788882929; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q0FZEgly4MtU1OkOL4vwau1FlsbXd5KZ+Wd5OqaQ04s=;
        b=R0mOVcBrUl6pGp+dGiQSM/NREeYChwsbZ2W7dxyKc7sYPD5b1DA2gynlFDYrBz10Tl
         7fnqWnGm0HIjAjU5n207tjr3uERMISJNeTQG0tJNgoND4lYrFY7vINAnhgsc1oQPM/RR
         6kmGTE12pm9bPC+1P1Ws/96CoZRxuqLrCKp6llINNG34c2RnNkoScs7zMbcnywlUcMGq
         SKHNyOfMKM0+ULsf4Y2IJbyPOftyOxRFpZ+n/X/wVYj24eDHaawbNXggt0r/NNi5Tep1
         VBaXPtcNzUew2WmVrUh6ZZYbsfi8QpNPiu0qAo8BS8YaHC0boJ2NFpmtBPXGxbFugDCe
         uvrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788278129; x=1788882929;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q0FZEgly4MtU1OkOL4vwau1FlsbXd5KZ+Wd5OqaQ04s=;
        b=dJ1I8awZxAQeDHaQ5bPn06OsMMekV3A1jtVLDI2k/hb7QxTvMcbzwbfwy74FxNUZUL
         1oacJc44zhnfnrfR1kAwHo9LulxdwAm+Ktu0Rav2j2tzmAq1T0EKzwQ4O4EouIPFaAat
         CboetF4RG1EVre48Vo1MLR9z7L4bY3WrrSRoMD/1JcG1bvH8py1XXRIvPd8WxCkcxZfq
         76oNvM8Tv6mKO+hcM6qTOe6fR6wKkT+8FfXMJDutGoDk2ibM16aZfbE6zrwBLgN2SKWB
         slqaKdhnW/YUrgPOwfcASAXkarmd5ZowHOVKUaC2VnwPOTZyzWzxhEuSZfLYwr/envyf
         7CAQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLPiGmnfudD3N4xibpRiRyoza3qtVt7h5p+muC5wHSHcwSabqzz+cJOvPOG2OWU6TRvzjZQhwtp3pxj1I=@vger.kernel.org
X-Gm-Message-State: AFuF++mjub91e5RgNBIxtEddD04iF9Kew9KWxD+5x6NnKHS9HHVWAoFK
	URRchJ3LpmPNCBw4kojr/TPvWEgdLYebmkeqEqb12wBrLHC4zK0wUcPFnZDDadQbu/KHnYR7OM0
	OK1Y2JeGScVqq/IRb/DhesppNXjvV9reAEdah6ukxC6osG5aPjne0uxdo2gCxPm1EE2I=
X-Gm-Gg: AR+sD12qnCAYF1BGp4j2FA+RWZP7O7kfvAcPdUKuD4LhpZU49E9ry/N79v1D0jtXmOa
	wcQwq0MpYI90vLJeCElBNR7rJZWZE7exNSBn7VqzLMxSwwLBnNRujx6sYcOp/p1BRAHzRER+3Hp
	m7j8X1kdyuzVet5mQo+uwxUm8seKF8cJrDXRBoPHdvHNDliHqTEv7m7MdtavOIBRtO9d/IqIMXA
	mG7HZxB6KEAAT+qd5AmDGAf1t6Y4ioZsw/jbLWuFPm3h7d3DPniH1mc182j1WGo6NoYbVWnXJRz
	SbK+x/ZS4SNQdZ5i2UN8BIyeadbAfK5W/zZ4MGMxM3SiXHysujYPKMRFLPmrgAPx+v4M4RNbs/I
	BdXXMX5wLDujucQhCBKXC7SkKHA==
X-Received: by 2002:a05:620a:6910:b0:939:4b04:cb01 with SMTP id af79cd13be357-9394b05015emr926210185a.31.1788278128747;
        Tue, 01 Sep 2026 08:55:28 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:939:4b04:cb01 with SMTP id af79cd13be357-9394b05015emr926200085a.31.1788278128194;
        Tue, 01 Sep 2026 08:55:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fd4:cb20:f8d2:dc94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3c94bsm5165318f8f.12.2026.09.01.08.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:55:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rustam Adilov <adilov@disroot.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: make the driver work with SWAP_IO_SPACE
Date: Tue,  1 Sep 2026 17:55:21 +0200
Message-ID: <178827811899.38653.13750210224034521546.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260815094451.31792-1-adilov@disroot.org>
References: <20260815094451.31792-1-adilov@disroot.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX8Bgg/RSZe9EW
 ad/0BZP3jA09GpgQF8RsFWBpbcEfGcoMwomHAxiwqLnGR/LJKfC1t3inAar8XewcwZ/DPXxkXTn
 vzn3/lBnyI7lJBNq5G8QxMWjmAsehBI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX7W9TOuEbl8oX
 OoD49poU6P4Ie4xFQuYZeNt2MWZe+VN0FC2KNFC2kOoDeBdhq68glblfPLcVqBnJZVmBqtm6ufw
 kbyypneaqsLJqu5MDXWdEV8gz7uhmc4Sq3A6dyMGbIbCZKHBhZy3U+JdBkCxWNtEG45kHmnX84m
 6g6a9Rc0ClSJTak6GcTcbdEIE5ZcENKDSO1V4CxlOXcpNC3Q+ZgtCURnSa4D44zFMJ8ql16vm45
 7w15efbcxDmhVubHYdehX38/UXCQ2w3u+8umnBpB/QT/NeuOdKFVwSs6j7yjxEXuyQRnyZEwwUF
 67FSM1FBesswUGyLiP1eLbQ5KmJG10xtJj4TaQE0hvM6ZWGljhFMWaI4B7LnCr8cNrGBM0x0YgD
 OTvd8ODjkNX0XAhZ668RzR/30wfeCj5thLnpks541IEvdhBBREC55XTFcuDitNWyWmS5Qefc1Xd
 QovcAui5iDuf8q5VO+g==
X-Proofpoint-GUID: OO8NuMJAKt8sWAlBcVAnHJCce0DAeYs1
X-Proofpoint-ORIG-GUID: OO8NuMJAKt8sWAlBcVAnHJCce0DAeYs1
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96f572 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Q57xzXiXmuqvwKR0DX0A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140


On Sat, 15 Aug 2026 14:44:49 +0500, Rustam Adilov wrote:
> This patch series changes gpio-realtek-otto to be functional around
> SWAP_IO_SPACE config.
> 
> Firstly the ioread32 and iowrite32 in realtek_gpio_update_line_imr()
> have to be changed to their __raw variants as it is the only point in
> the driver where both devices with ports reversed and without meet.
> 
> [...]

Applied, thanks!

[1/2] gpio: realtek-otto: use __raw_readl/writel in realtek_gpio_update_line_imr()
      https://git.kernel.org/brgl/c/61ef599b782e776437886f2be0623b3c9055e5d3
[2/2] gpio: realtek-otto: make bank_read/write overridable by endian property
      https://git.kernel.org/brgl/c/785ec26c37e56ee5f142b6684f7c15c7ca7430a3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
