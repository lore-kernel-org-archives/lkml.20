Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7433646A610
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151242; cv=none; b=P+afTiLPPGc7naofgknD6hT5kcRC2AWeJg9ubk5TeJYfR0QtQtL1Wg0+4UNFdHKDFIPYR00e2NniwuSJ8OmUY3Ghc/Ci91Ytt6AMxJ65KtAfhw8aADEPTgzlfZ54qmC1n9/Kf24I21bxEYf1H26LlTd/F/05PynmK76oGD5FNbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151242; c=relaxed/simple;
	bh=UC0vpk3r8udDGy5C5mG2ypH3ZjwnNmEG55Zvc9D1qJk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JKPI6N9NFb5dIaLgmKBsSIO/0GCY3MUNGfnT1OJzVReOtBYT3z8E1N6N+3LrNk4h5Levpkct94m06UAnlwRVGvp9AGIFqTMsQc26GgS4s2joUrnifz6GdSDAj9bMTOwXay1R+9FEnfxj5Eov7bA2x5JA4+HRmA1uGh0YxqZKgq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pc5nEqxj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRoRdDZ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pc5nEqxj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRoRdDZ5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79QPr2697481
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=; b=Pc5nEqxjyffDYNoL
	tCcYpKJMosbu75RawY+Dy8ZYulqkAZflg/y6Oy7BWAHRGabEX3UExzWlyyrDKS2v
	+U0kLdTnitIgjKeznvUsuP45A7vKa+gXh21xgveKaswqj0dkQFHDKYQxcxCJ+AOO
	jRmgaF7CV9A/K5FmndAcZGU0gsocGLj5XdsnogVlLSN3XQXa7c24JaL1osIvNdiW
	MEwyDIhbhRJe2uZcNmOYVgcwA+X/26gesM5C9X6yPwywAm1cbXYvaLsQRbSgTIxx
	AesRnxzogbCvjmiVjbD7AdKR1ICPfjTBJGSkBbE5LoZ0ilWlP7IFM7PL92/0Gx5r
	db0C1w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw2v0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:13:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90c8da50f4fso11412346d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151238; x=1790756038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=;
        b=gRoRdDZ5FxgKEJ+IMvw9cRM7v7g48cXG4xTnR23ILRDlwzhd0pOQhS7z8sj3/9USvR
         oaGB/hMsEHTQWPtMVy5o6neSGdoOwIBpN5jKnCXDRePYXHurCHvh0dI7FAab3G3ouSkY
         21N3c4ay4qRcoVlos6dBaU/LLxfypb55B1CAZk68pDvUemgNdtpGnz7ljFJFdVHS9xWD
         oP1hNf9EHrbAaMfCqlowPwc6lUOGnnc14J+LZVSBXFPKjZIoge9n96h9fMP/IMkQtA+n
         FZ4lbk0d/piiz6kSE242AI6Y6eM30IrCq6LfNt0+luhuXVgpDrBLjERAgbV0mFJVrQr5
         YVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151238; x=1790756038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nIV5BrLbaelpGrDb/+/9Cd2ytJ3jtLQA2lmfnleQxbk=;
        b=rp3JFMUkxIfcp+FmOYVu+qU9JSZ1OJOqy5yDAhygdlO4XHjVQ/Tdt7mLz3h72YDZnj
         X4zdkuagRdUmJxkeSHZDz8XBgo6FF4YSQcb6Zg3vZcGcCrC1d75SXEZktUMwaCAjIC1w
         3M7b67qNckvc1IT6NQd8IZhDBaiZYUepnEWuEE9IVL0bZfvPlGveVtTr3hKZSnrF9BB+
         AyQOf9s/+3e78bz9xJGXU1BQBQooFgRdu3cFDTyAX5C/aw27ZH1TkQyas3E404gZqcid
         0goE9pfwTHUNrgBrtgsVN/PIKI/4GaqOTvnMvdSN11ZMYSaetjh6JbgekdJ0ueYFdxNP
         hyUw==
X-Forwarded-Encrypted: i=1; AKwUvBz7he1sjcKHIagvHTOs1IGbHSbvTJarYpGFiUXjiVAK63kwUzvsTlnLMw8Ut0l0ifiCfWMID7BjcHF3sSw=@vger.kernel.org
X-Gm-Message-State: AFuF++n/CkwseeJ/HBYQBa64gzbPoYzmEqLdDknQQjQB1OJjbzTcHaW0
	PMdq4TnsrzWKTEvhSIIIMXeVWFuRAtkyd251A6kxMuVStQiGmaiN0nElKgamXjD2S+fW9ggV5Zd
	eGWxikZKIPfkXwAml7hVzsz54a/RNbQFn6fyXUxO0UMbmSDQyAK9+a+C7FhzCcN16ods=
X-Gm-Gg: AYBFou1G0B8WqVNfCTmhpPI9LLR6MQ2rf9gKqilHJ7p5U9uwBvHfefUJkc9SfobJNLa
	/8HiXlR4NiyqFmWdBH3/kdVBSLBK4A8wLjpm6W52/TUco9QWdtT2dO3OsiICpIGSLMaT80FOwCI
	+k5Rka6O+r4mpjvnCt3NA0gGdNjeqDlyQLSvpNiH/s9brkX/WiBCu8OJdASzG2XaZhGVIv/O+G2
	PSoA5ZeIH8ahjxk8mdYAM7pfJrnLPf75IYl7+Mgg3XOh6XYhZdB8nScTy5T9QwYlJB8qU7q6eTY
	L4gHoDsUYPDNnR1ciHCvMH6kwnsdbN2pxaXEJv22Oj8miv9EXVSCNnoa8RUPac/SKrLz0F/I7Go
	ylo98zmWXjceBqMcHAOTIyYwYHfQ=
X-Received: by 2002:a05:620a:701b:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c251fc9cbmr279979785a.38.1790151238602;
        Wed, 23 Sep 2026 01:13:58 -0700 (PDT)
X-Received: by 2002:a05:620a:701b:b0:93a:83d:1d0e with SMTP id af79cd13be357-93c251fc9cbmr279977485a.38.1790151238276;
        Wed, 23 Sep 2026 01:13:58 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fdf9691e2sm50454405e9.1.2026.09.23.01.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:13:57 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Ridham Khurana <khurana.ridham222@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Srinivas Neeli <srinivas.neeli@amd.com>,
        Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Brigham Campbell <me@brighamcampbell.com>,
        linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] gpio: zynq: fix runtime PM leak on request error path
Date: Wed, 23 Sep 2026 10:13:54 +0200
Message-ID: <179015123239.7939.12868400217735279583.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
References: <20260922092102.1053513-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfXxF0NJ24AmCcW
 E54H8xOKDOdYetnzRO3RgQKpHCrl+IRA06MRUOWqvycrhb6mauS1iuQiO1jMwwqPJXzIYrCRNGo
 jF9JZBfkjgH6QbfNbL5NrXwvKtai584yC+bHzIinZz+Q+1iZAHRI783gpml3x5MY+8uciejS5C7
 DeHtzeSpjQ2PdAdt/ScJf5u0IOFGH1KtiAMDTFfVMY0jvGeZuJl5NuO10g3uSuoIKCOu62QYTLM
 DZSXEdbIfT2Gpka5HlQHaJLPSaQ1sZhBa1QP0z5rztOwkoX0tp/2q5HsSTazZOY17kdRiJ7YcY/
 EgpvmxLiiIgrSpXhoZH3287kignROE6Cnsk2dz9ld41YSc0kSzFs8zFrfgV1iAum2OEE0v+Jus+
 shfQZ6J4bqOqKwbbMV6KRQSELNG5pSIwkpIG3BVol+COxgRDVlL00+V+atHaVhk4b8WBV7NJH+l
 h9pkJsjuLNPqRm//uwg==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab38a47 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ZA4Iygp0GN2kJPZu5X8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: Jshn_HXwRM94928BAgPhdmdrlLG4-LH2
X-Proofpoint-ORIG-GUID: Jshn_HXwRM94928BAgPhdmdrlLG4-LH2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX0kY8CdCmjYYj
 8aX1pHxiWQTwJilvcTh5tGGy3M2gEUYTc/l0U8LtLUiIu8aKwsf5HQNTBjp6iuuZh1wFQpJ05Ab
 CB/8itaLcS34TySBrTT7sBmqHUXsd1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032


On Tue, 22 Sep 2026 09:20:58 +0000, Ridham Khurana wrote:
> pm_runtime_get_sync() leaves the usage counter incremented even when it
> fails, and zynq_gpio_request() returns the error without dropping it.
> 
> gpiolib does not call ->free() when ->request() fails, so zynq_gpio_free(),
> which holds the only matching pm_runtime_put(), never runs. The reference
> is leaked and the controller can no longer runtime-suspend, so its clock
> stays enabled.
> 
> [...]

Applied, thanks!

[1/1] gpio: zynq: fix runtime PM leak on request error path
      https://git.kernel.org/brgl/c/e9438ab5328a177c9c0e5df87eb92a7162841e98

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
