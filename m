Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353243;
	b=X9dju4henixhWtvXlK2wtAsD4DPdACHpAKAvDoCprxbZXPvR773mELGKgyBlbez3X0jE
	 ok1HI7ak9a6aWRONtKFGX3sDeYE1D2n2rx5ftWco2jX2rDmPnltlRLHFb4urzypDGjQyo
	 ROXrDk+BnWUS60UldBBmWyhcn4FjV3DGmPrgBVIdP8grJGMMuBY1L97zYTX9I6diMfUC4
	 Hlo0fHWfH0cIW+RkT0kFwa3+4g3YsOfi7hR08130oUrhf7AqAHAkqIQkvGw3OrhmUbQt0
	 ge2uqhS5hC2ljdJGKnHLJKMFlsvdUavk2kU4dV92Zuco8DWu7GHUQ6i6SpLIxfuvJuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353243;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
	b=W5rf+pPQ7Su20oQDQz1gQqurSHUJo1w3J8ysbgdyGjM6qaU6/HBZJcfrGMM6ojaUOhjo
	 jVMgJWQ5OL88OkZiojdp5gNhVcUmsx33i3hfXKgq4LtpGcfmAEnV1eQ5jTIT4lpMOW5L9
	 tT70DxdN6TW/5FGtC47eMIw49Oee/XdRJw9iHXn2r11Qgv2f1pIcpSfzjMD0VBReOSi0o
	 GPnQZOYKA4TNmltVzMB7ks8AZHFkF4D8XINHh9EaGSgpJy3QKoTLE8LwhWKZ8klQ3T4qX
	 kaF0s/4jxHACLaA+GyPzdsJXVhjI41SfKUF0BP9L3fJ/pjnvEmrsDhMMIGRBEBee4cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="m/07jegu";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D/Y+51DO";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C084D606A32E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C084D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m/07jegu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D/Y+51DO
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FD6E3709496
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=; b=m/07jeguMeUQJOhu
	wjJcd5PtT0pzOD0sTs4QZ7RAzgNPdFaUxQZHR3Lec8VLWVYcuZJYF//oD+YEisBF
	miGuoCCcUv2kVP+K5SF5iUu0CSGMGLqCShK1HwYXEKxP9WqBSbX33g7HP7LMKv2R
	UprtO1YpuFrIYX8D15EBuPjA3dYeC2Wcd+cN1O8ryBJ4X+WnZ5P6W5uZiyk565Bg
	VVtI+pySXNyDP9g8fSlVyaP2qKGgdH5SipYmLlRXK76ytssVoZISV2bjjXam3I4z
	LVXiDatkFLsOrhSyaZK1C5znsSKJdI1bfiIrAfW58pBGJw5a2B4akFfrLmdsm7z/
	rCkuww==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rjb99-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:40:42 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-359b81ad4e8so835481eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353241; x=1793958041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
        b=D/Y+51DOfJbq/Lao0kArTWj45Ys94GTHeoMZCnGMY2WXDgXNhvWaR1zR/hfWBxf6rd
         76w30vYO4+rg4W6oT/j1lMwPPdtZsuwNTnddWgE4xPBlvI2fN1Te1PLs/nWx/8ecyIIz
         fcqN/ekdGuPNVKLm7/VUddV2Np7Fq4F4x9vMPFRhLsYuAid5nu4RJPnXkQ9eaXAmAn8Q
         Ek/fo0ClJYij7+Xq5MVsAc6tOi/LERMVpcsPc0rlzAdCmw052aetQMoay8bxFZfFRImr
         rQR5i4LJ4ZCZNeK4t0oq9hfXYod111N2LrI8Lq2Tg2oDErasWYMBHfCVjOB7fTpoh7C1
         /RRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353241; x=1793958041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=604WWfBFOPhhAYv1Yn4g0E2jTeoJJdDuMRYpyyPIRkA=;
        b=yFwhii+qWT2fIN7zdBQ4o4+SpWfGhf5ACcJYK613X1Jy4bB0Ix+PcVhbDBjemwWFEh
         t8TFvxv0lpoCKenLgTUrNjM+3OaEVFMX+kDiI9dOoYWuj947qpS3sOIflAga1WtJYj/9
         aUndwDeeEEoLrnyNvbInS3ma6E6UMOR6wLjf5FLYLv9j6yB48UYtgncqw9sO64oGWAuh
         KQ+eVw5gF9quCanOjQVbWFYUe77c7h9uC67Z0H7NH93+7QtJ7Wvn4Cj05OPx0yGhlrmN
         Ylpw26KnZxYzwVslWCT9PlGFZdbJI4hbsafdqJckwDKPMzejnoSBZ6rNWPG4Yp0t65ci
         z+NQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6RJc2lrO14oquSwtATa0oGuj1T6hsqGTzHlocZHpqJjcr4A272wkf50FIZni1m5kj9zlyLMAjrv1V+m4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVJ1d1aGLUEMYG9BzxvPuoJvz/mU50A/QUMSxDqO3v2/GP1hTK
	IgYkEJS9IdcKguWG2G7FqE1a2RNsJULxgZqyXVfHMjozLEJBFfkQWZVZcTsMxMo7iWJPVNyH+jk
	w5mezZKUydMrdYcTnwHKivYcpnhl8WFkSLEKONZ4mfWhIVv5oSpnezty+RusC05uQScc=
X-Gm-Gg: AYBFou1tjyBpf1BzzSgJ1DJhdvbk+XXSQxYmbBYWvir8ZagmdIZ0KrWJQwD0UKZn6NB
	3L0srs2zwrHb6Hq1TxJFzeSjEXO2AQIygE8jRvqJG9O9A7M/h8lF0ORDvM22DyYbg1sxLrkXUmh
	PJCvBH1wSmu1ycX1wbJzv8kUCeUCDsCXcmf+8YUjZDjuLeuhGleEc+GSe5l7saWIEXzk26u5Qxl
	M50fhSXMleBUCddYdkPemQ8DHU+usSPLkjz8VYnoP8CVamQiV6MknGz/gNRwttpukw7ZqqcWALT
	k7KjDItJoPU8AKZiyeKOwb6JYhlZIwwYYxdri/4s/gMe4W1tQbUIN62xKyiizTvhof3p6IU3fBZ
	05O1o+b7oKqNhanF1H3qaeHddNiaRm/zLFmUl1WBYTN8yjAtTBjO2ZiN5H7oqw+1U/ZuBkNhWvY
	9axfmO
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr2459715c88.27.1793353241194;
        Fri, 30 Oct 2026 02:40:41 -0700 (PDT)
X-Received: by 2002:a05:701b:4211:10b0:1a7:99b9:2eb9 with SMTP id a92af1059eb24-1ac5de4e8a1mr2459671c88.27.1793353240473;
        Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:40 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 15:10:09 +0530
Subject: [PATCH v2 5/6] arm64: defconfig: Enable PWM_CLK for backlight PWM
 support
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261030-lyra-display-upstream-post-v2-5-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=683;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ibeQtMqFX8c7zgjBUXuxtpUpCw4tiu7UXa9CVvzuzQ8=;
 b=xZy1v3yJxpgEEnp/0GEy3IHTrAvHzXOiPECRrvHRncpdH0z6F+MunUlikP1iD2jLtS9DagvwY
 RSOxQJSEq43C/5Lz/ujnztCihDlXO3zxZKaItM1K/qYup5YQQr+y0sX
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: JL6MrgeJ4wXFlkZdbqqjWx_pfhehnmny
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX7dKxRpLhstJ/
 SKaQXC7Jlp2eybNCFRT2k+1Ry5UqQjElm/8YaAEl5Md5Uht33vvMlHuuy7PwjvuDNDwP/q+qR/j
 0ilxsaV4WloAwvEHzq6c6MCOslwmuD0=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae4661a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=FxRAHWTHE1z7yW8SwP0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX8VR0+4LT5Y15
 ei4Qo4fw/+npnAGKkJF+ZXlnaoITOH8+YZ0Ei/W984Cv7K7ANXXzl41h3aKLPnNTTgdEhTzXVzG
 Al7oHHnDFr2ZTaClao5Op7D0+6iE/npWmbNLKOtJ2fa2aP5lyDUzlTkHfXkjKRXjlhao4oKnEYV
 B/p2V5StK5xFKF/vmSpYtn9QLtP8x144fRAPVXK9Plu4d0jciPMfA7ea/nIXrfD9nrwmJuoWuFu
 GbXhCO1VU4vmJeBZtza6JaDJWgYyXD87u+oRHRSArXpfjr2DHszS0dFKL7xqaWQZAtHoXVf+qZp
 SOCnz1jWe3/Uvnls3z1/KQVEw13nm6NlQRNye9OiSETsOjwyF2lxus26MSIWtTi+NOwpq9ODTEN
 eCkGhv7FCdVD0GcQIVv5MYB7CIn9i/8zc5p5mxGwTHren313YfBuIXTxhQ7nwCcV0/bmffH3UrI
 5BwNVVp3t+aAkEikGlg==
X-Proofpoint-GUID: JL6MrgeJ4wXFlkZdbqqjWx_pfhehnmny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

Enable CONFIG_PWM_CLK so the generic clock-based PWM driver is
available, used by the Qualcomm Talos Lyra EVK LVDS panel overlay
backlight.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 50d6357727af..365a69470d13 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1620,6 +1620,7 @@ CONFIG_PWM_ADP5585=m
 CONFIG_PWM_APPLE=m
 CONFIG_PWM_BCM2835=m
 CONFIG_PWM_BRCMSTB=m
+CONFIG_PWM_CLK=m
 CONFIG_PWM_CROS_EC=m
 CONFIG_PWM_IMX27=m
 CONFIG_PWM_MEDIATEK=m

-- 
2.55.0

