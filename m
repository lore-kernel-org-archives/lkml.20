Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D6C34E75D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789374817; cv=none; b=ORAKCjTO7qP0RjKArYRyf5713T270a3xUK0v9IuL2kASKI+hJGbLTV6VGVM9Eai6bfnMc4/qtWqBXrpxHQZIJgZS10e6xVg8z5MOhOqx8aNc5Aul6w8Ypt5Hm/Eeru+FtkF5sSp3K2ulQWICc3tnLkyGlCPLxHlr8ZCZum2PdhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789374817; c=relaxed/simple;
	bh=5Ju8t7YiWuL8GYGvKcO+x/6n58FE3k2oXJWU7rrZh7U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TJH+ZBX4i6bZnqOStFeNQhjqprZqMFkZTdDuq7Aw9w36JPI/m/EiBOMczBh06i71RhPDvhvw/1+AmODI4CB5ApdOoEKIV9kuC/qv6jbqL/x1uQ3zKI829DkDLYOFSDODETNAf7i6Frzmoov2pRHFM3ot/yuYvdvVyvjtPXlUeew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cX3FBM1q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CRScBGzZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cX3FBM1q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CRScBGzZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E801RQ3490259
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssljdvmegDOnP2VwpHf/bltAbOdsxsCytoIxo2U2tGw=; b=cX3FBM1qWi0k0/uL
	97rVSeqIMgkqVynDCCnbhQhTH/e7TmGTQPjy0eDY/kEvVbdgNPVBzwcIjJ/mWdZR
	9W6eLE0rn33rWc2HDCMYW6C7TBJzi+vySsyOP0dzDhy0gAZfdOr3cB/AkRMROSuD
	b46rfttJ6mtRoKyK7K4DjeoWffdN3F0upDwrsFjUb3lXJYSlTE/GaWlHmxxWv1Vu
	WACJnVQg75aYt7oM6apjqvx/ar3oHeeIsupkufS4l3Q1FTj6TuxnYkx6N35oqpyY
	RRrwvLq5OkVPZsMdLkTL1DVhXlhP3JSIDpDhimWQ2aFFogyUhJf9OT+3bxUT0DWD
	afNw9w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f03hg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 08:33:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939665a1ae6so794923285a.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789374815; x=1789979615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ssljdvmegDOnP2VwpHf/bltAbOdsxsCytoIxo2U2tGw=;
        b=CRScBGzZdntq4msnV6skepryqNR/urnNYzdk17kxMyXK+NqNudO6HbEIi6114IhTHo
         xBuvQ6NaEcbajaH8O3NUstlGnOtqp4gKBxnZc4Iu8069af/v2F9WiX1oWxbICd/CbSiI
         JnF/tD/uhVldkxQ5Vsk5cu7uVwhbgMq4RxeqiqP776Gv64X8F2sPu5W5Zc8B/bZHKtsJ
         SveompfNQz6ZbSVxPQG/vfgnpk98d1N+Qh99WFJgpHI7zs12pj6FYoF32cmXtS0c5fE/
         svHyRj4Msii0oiYZXgPamWCQOpBH2eOXXQjuwjX6y1CDYRMH+jTU+0CB1/sRTMlP82EQ
         Eu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789374815; x=1789979615;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ssljdvmegDOnP2VwpHf/bltAbOdsxsCytoIxo2U2tGw=;
        b=Uok2h4RuAn/xKSp98yev2Ir63K7FJ47wK1q0A8TPDWbg094A1rNaF1vhXf7GInop8m
         FJeDAYBW69YJKkyaT4WHrTeHd38O3GJyQGPtuKNygicLt5KdPIn92jSWrXYdpCGIpDiR
         FDU8rWCAm6VDD17r55VtL3Aoqgxfy3+zu1Kfo5EvVEUYBr035A5hsnoCWTna16wOnnVw
         8IUUAZRQ7hVv4wPvyZwttqv2mV0VaBZ7/qMmaglRqYXUV7HOhwzGXm2Wl8V4nBV9PWg5
         7dxJeqwVdmFAGHpW4W73S58wjAVMwjkEeElHEKNphodTzkJ4pxav8Gk3kN6CuTBZtsK4
         bIrA==
X-Forwarded-Encrypted: i=1; AKwUvByY60O+jJfTnH1MALSho7Yq2YrE3CzA8lwuahoncNxTVYOeWCNWm95MW1d8LZSV2gn9F97oo4BKGlber/s=@vger.kernel.org
X-Gm-Message-State: AFuF++kUc6EyCVp+psV9X/4v/2iaw+6geYDOLy9yKg0J90PMsQzp8zAM
	y4xNwLF5/tPn18C86v8su4gL6YxSe7B9EM/AiimyFzM7iJTtcpKEohrIbhfcWx0IZVA9v3cjJAD
	xVxTzD6XxU7r3RXd7ryw0cfwYLhOytpIdf01lDSki8MTKIWbm5rr76WpIcM2Cm3pQMwU=
X-Gm-Gg: AYBFou2PM95QVx5l2/6e+tptXYpNUgikIMnmLYbcxuZYTssPw8w8V2hKSGOzxZMya1d
	n8MjBKOVGJBdlNK7HN5v9bTfqBsSPw+5acW7dUrxrg/kB5JhYfa13fkT8IAAIrPigxPX7lQRpYH
	DDbdouUmh/qQK1CnrmKR3fKY48cdd55qSyQdsCwzQ5UiaxnXmrUAb+kmsteeOOiTeqkUBDBLGak
	xJsFiQS9qYZq+s8Uhvwrk7V1owgWk7QLLQ85blp0Z4U1jKHN4Z94dXSi1sCqGD4qKs4jckNteRT
	25TeD/smxEQYQQQYo3VNrOITa34YaztdTwuM5hIiQp6k9nuexKetE6YQxtBepbSD3LF4RrQyTJ/
	TO1PVXTYrEtF6p1nloceLxPqCD3I=
X-Received: by 2002:a05:620a:438b:b0:938:61d7:badc with SMTP id af79cd13be357-93a29a685d7mr186406685a.36.1789374814704;
        Mon, 14 Sep 2026 01:33:34 -0700 (PDT)
X-Received: by 2002:a05:620a:438b:b0:938:61d7:badc with SMTP id af79cd13be357-93a29a685d7mr186374085a.36.1789374809434;
        Mon, 14 Sep 2026 01:33:29 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:e83a:fc27:4d39:43d7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm225616115e9.11.2026.09.14.01.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 01:33:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Runyu Xiao <runyu.xiao@seu.edu.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jianhao Xu <jianhao.xu@seu.edu.cn>
Subject: Re: [PATCH] gpio: virtuser: skip free_irq when no IRQ is installed
Date: Mon, 14 Sep 2026 10:33:27 +0200
Message-ID: <178937480474.31976.14976644818444633836.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914051537.15320-1-runyu.xiao@seu.edu.cn>
References: <20260914051537.15320-1-runyu.xiao@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: hSEvCuMvUFRpJ_KXNPSTqx05Ef2jV8dR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEyMCBTYWx0ZWRfX1YvOzsWFjJjl
 H4n6FiQh6LEsiLy7AHMVReLK7vrJAA1dOjUpYOhDELed18HuAKc8PbDoquRH/+wO3A/QxE2izII
 qW710YS+I3VLgbsBO2oEZ3kGLpGZfd4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEyMCBTYWx0ZWRfX5SzwnhGwHStO
 3ny29s9amzqywYfhYO0I2EgLN/n9C7NGs2l8nFRMgVIkNEN9TE27KJlHEmqmbsLzKjadPhFRYv+
 ShGwvRMOTMR3BXQhc+mTM11H3FVNQngnDsSTK+KeQEKEmrCPWAszIXiKLWrHvpN6xKgGw2EsGfB
 rWG8iVJhkK6RI/loIIYLtqg6eAsmRXkPpmTs2J4FUm1IH3M0vHF+2B+DlZKnO8FRdL5Wcz1TWCo
 yUKSgwj1yy5mjvoC7pQ11VDN3lH0BQP03yBL5OxHT/c+bxkvLBojNjlyAdWoGqgTQtCtgM9/Z/3
 YshzugtY3JTXYQB4mLo5zmkqPmdubFN8Hq19M3u96v0BZikkjl8li1TtLPE6RGlvZmktya+LLm1
 rJqhlj/70ZQa0yhWy4l9m9DYmVPukgCQyp3OD+mZ/UWqlQltAGJ4M/xK8rUEcRMOYEihFIlJocL
 m6RclD69M1y8mKunNxQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7b15f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=P4bCDFn32kF8sA-yhioA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: hSEvCuMvUFRpJ_KXNPSTqx05Ef2jV8dR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140120


On Mon, 14 Sep 2026 13:15:37 +0800, Runyu Xiao wrote:
> Disabling interrupt monitoring uses atomic_xchg() to clear the stored IRQ.
> When monitoring is already disabled, atomic_xchg() returns 0. It must not
> be passed to free_irq().
> 
> The bug is reproducible on an x86_64 QEMU guest with
> CONFIG_GPIO_VIRTUSER=y and CONFIG_GPIO_SIM=y. Configure a live
> gpio-virtuser device through configfs. Its input lookup must refer to a
> live gpio-sim bank, such as key gpio-sim-test with offset 0. The
> consumer's dev_name attribute is shown as <dev> below; then run:
> 
> [...]

Applied, thanks!

[1/1] gpio: virtuser: skip free_irq when no IRQ is installed
      https://git.kernel.org/brgl/c/ebdb6b0cc453103972278258d88d555d43129aef

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
