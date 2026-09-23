Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125AE46F4A6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151468; cv=none; b=lcCmqkl8JnocAWqGWFVboS2KlGH5edya8tPEDZLD4cpyWh7G7T8JB+t9bQOyM5WpKq3ytlZ/6AdfyrXUBA8/djbjiHnvlxkBtDjZlwD+0pbjoEGmxgNGdlE4K74NCEI9p2Gqxmq6Zj8dm4ErXPV8LJph8wqHAfWIqCF77ZwTGl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151468; c=relaxed/simple;
	bh=EaRJzW/zC4RwiigvXaUy9oiHCq0yzTz5xk6a5HyZOvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ONvKVXaCuvya5aiX0iZQMpoeXtDSjN7JUG5y4t6+FWsqcf7BWeOiZyH3Yd0TJbsZ4i1xQ71Jlf2Bb0+kqRvXMoC3Mj6UjO1Ggv6KIUY/LnmGSHFHfG3TMPhPOa0kOHSarp3RuqQEiloxFGW+eFMyDgJSBybdXS4qlNspL3dl+vM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XnbOkqzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Usnr3gyZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnbOkqzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Usnr3gyZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N79TLj2562666
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:17:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MRdqRPm7RgZlq1w93kbWWVQrCgitYbsBW6bqjoJT33o=; b=XnbOkqzT8wn68ajr
	7QCp4Yg2I9rd+bmVZ0fu9bs0UW7v9pD65wH3ZLuDxKb3cJcwCN95a/GXzQyA4dd1
	nwisTj95xnfSqOX5ot8DpV7GrGQzSgnB1nPqYtTPv2ps57ATxNdTABbt5lNNJyqT
	8alnZPr9HR1RibZw/zewnCpkhudmGKWOk+LaCFjtQUUss+fzhKcRZcHewGVNHxOG
	qLhqZ9S0kzZ7tOBpzVC9F2mNC3l9kE/9U+LBUAdPXz+9NTJfqXfrSJkrJCeQDxI3
	bKhKRK8DGp/k124M9P05tLG9CN7XB3oRgLB9B1PqYKETXCnlGShK0pP2cndrMiau
	vH4c6Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv32qssu4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:17:45 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90c8da50f8dso14916146d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790151465; x=1790756265; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MRdqRPm7RgZlq1w93kbWWVQrCgitYbsBW6bqjoJT33o=;
        b=Usnr3gyZ/BjlCDjo6YBYhxlchj9QH3s7nag+1P0MtGWkWyIkh+wUvQ2k7lxIlvCS/5
         0V7MjusrLy03MSTe50z9bJBHeybPBHKzMQHe5OeYxXMkYLYFTke3aiaFo/k+qsRTzq2T
         GAj/1zMKIpR1poud5AfQ2bKHzlFEEA0r7Cx2/LtHcCJHBhEg/jvWYRrAf3eglxGxBMEU
         O5SxlURVoKTxZ5VuYtxE7NBPug4PvDhPDcsyTWC+UEG9qETf2xNVR3qjeLgOCLCi+qI+
         zkj5h8/xY+PDV0AA55JlJ5jkEUVR9vewqs8HUTV5gY2AW50qtmMd+WvJPVqclUV3GoUA
         Ebsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790151465; x=1790756265;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MRdqRPm7RgZlq1w93kbWWVQrCgitYbsBW6bqjoJT33o=;
        b=kko1eeDhpax0u62iB742PQ0+vkssQwycA2CSdy9l5ZPafiNDWCmvroLlQctbU2gMfs
         80m6Qfk8tYk2GqfKU7TXKgWIjcshMmcmtN8VlC42IauFwYOZifOvPz0hdhFFtnAteB+p
         C0Kn/GLtB0dTCv57dj/B+yylMjvql7J8mq5UkjgJNWn3g0RkOU0+mAt7zUVY6kZkwVry
         80zH4gvuclPJQ31hVrSu+njQ9MF5BmNumDVRu4wthHqazwnSXsQ/eyPwy6i8yTIvlMVb
         FdviD1V1i82kGZkiWU+BChRv9mJDc50uWxW24kfeZK1ppVGoSVs+ozF3wiKE9Y9GDFdH
         nKbw==
X-Forwarded-Encrypted: i=1; AKwUvBwr2RSXMxoQfngR4PkSaf0mWamYHz5mJKKVuV6C8wFpPWhbEuweKvhTTl4cZb05rzqkRLn1nj65wwBd+30=@vger.kernel.org
X-Gm-Message-State: AFuF++kj7ucMEdBQ371edIV5jdgHSKDbejE4/bd7aFbU83LsnRwUP3NF
	Z4J5yheY74YluX0f9nZ+4WNXlatguTCtrLXqwwwOjtgKe+sFhPrcOFjScrhIxhfTfRUvbKzgBIC
	pXf3PHVwDcBSbjch4A3JoIZH4rriG5OfMDELe64HaASgVbAqREjLydyxWWbYIXbkeYfw=
X-Gm-Gg: AYBFou15l4pHOdd+FmQJVEDAIfY0Ab/xV5Ughk2R/n043MtG98pK6riZwwSxWRQ+YhX
	Us800EdrlACTL+5KaenzsqOqVNthjsQo/vrdENDCTEv2DhGmcM2U8RP5FECfnFeZExuChQUjVUZ
	2JATl/lVQWbDYOz5Ln63VxUaw7Mb13xSK+9bl1BtMjzpJPmE7F5AjHuEl7BFEu15GamCA+5ynC5
	F5qknrszEPq3xZ9Khd9gZWoDRwPVl4rTf2FROSHcuB9tDbBYJee9kg/GeAs/iLg7TTuElMRcclX
	SVzA1kIebGplzv46zkIDJ6TfhCPBVGkLspH+CpIRdCjssKI1F9b6i6TY6tdw8J2FOkiJwaOtlon
	cczsgl4gve0IwcrJp+Eyg1y1uivk=
X-Received: by 2002:a05:620a:2718:b0:939:6a:a71e with SMTP id af79cd13be357-93c2510acafmr303523485a.21.1790151465141;
        Wed, 23 Sep 2026 01:17:45 -0700 (PDT)
X-Received: by 2002:a05:620a:2718:b0:939:6a:a71e with SMTP id af79cd13be357-93c2510acafmr303518885a.21.1790151464464;
        Wed, 23 Sep 2026 01:17:44 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:34c6:dbd6:5b58:a3fe])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde1d5f10sm55001815e9.8.2026.09.23.01.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:17:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Thorsten Scherer <t.scherer@eckelmann.de>,
        Ridham Khurana <khurana.ridham222@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
        Brigham Campbell <me@brighamcampbell.com>,
        linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] gpio: siox: normalize return value of gpio_get
Date: Wed, 23 Sep 2026 10:17:40 +0200
Message-ID: <179015145803.8361.5075134045656614321.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922211702.1480614-1-khurana.ridham222@gmail.com>
References: <20260922211702.1480614-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SJnXx+vH c=1 sm=1 tr=0 ts=6ab38b29 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=luIpCB2FjmHitF4NTPUA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: P6p8QNeH03UYG2ihKfMTpGNboz5wzXDH
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX5MRE4lg9NMo0
 xJcw2e6Zcv3viGSDhTpi58Dol4nScssl5rGWyGzkgVZCDj5r2fMmtHneL44coxhFQksFVc4WCwJ
 q9K7PGAx6XGBRQ6ewMokz0M5PO2v5K0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzMiBTYWx0ZWRfX55RXfbkluJAi
 b39cZQFZQkD7sFheXMK++ki73P756VYm5xpuS8hqo8S7VefeUgMfYlFz5I9d9ViljWI9fmjaCIJ
 1sA3xadfNDwa1Gn9XIWtF4dIesqTLIfLST9i+rPboRn16+usedmQEMQqACkzgzAKwaT8eAk33Xx
 0teiHe6sxLm3IY0HkzRB9A853oL/mH/7CVAeW22TQK2WK9ciKy2D+onhLVKZsKmnQVWzTZEvB55
 8KxS4RPrncCSenkcyGtyRN2ctwQQRj+fKb9BKLT09V9toxxGoJNzSah9dhj8ts70lqB3gTcMG4h
 b3p/qoBGN6uD8kCTOG/qYWCLQhCN1jeMVBmiMK6MbkbRx/RoPVhAntmNhwLoONV8P1R1S/qEhUw
 92mvEtK/xUnBSpGk5JcCrsRaUlR/0MLEWdFkc5w78cVy3Ge0cxxpViogK02zeD7+l25o5yUaek+
 MqJ+M6uaAx87pn/VmUg==
X-Proofpoint-ORIG-GUID: P6p8QNeH03UYG2ihKfMTpGNboz5wzXDH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230032


On Tue, 22 Sep 2026 21:16:58 +0000, Ridham Khurana wrote:
> gpio_siox_get() returns the masked bit from the cached input or output
> byte, so for most lines a high level reads back as a value between 2
> and 128 instead of 1. The GPIO get callback is expected to return 0 or
> 1 (or a negative error code).
> 
> Since commit 86ef402d805d ("gpiolib: sanitize the return value of
> gpio_chip::get()"), gpiolib rejected such values with -EBADE and reads
> of a high line failed. Commit ec2cceadfae7 ("gpiolib: normalize the
> return value of gc->get() on behalf of buggy drivers") made gpiolib
> clamp the value instead, but it now warns on every such read.
> 
> [...]

Applied, thanks!

[1/1] gpio: siox: normalize return value of gpio_get
      https://git.kernel.org/brgl/c/f24872823da61a6b9834cb806013fba53fa5e0ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
