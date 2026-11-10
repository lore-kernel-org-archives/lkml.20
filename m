Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794318430;
	b=DtHV7+hnrKp3hWFIpcvoj/RVJikRms/ApW12QeWLGLMt9/ld25gD/911L9RVlOlpuewP
	 LQh71wPSpMA4l7wE3h5DIcSLR3E5Ty0i6BOVTPixipag+3SU2JwkjDp58NzBAFl4e+zTE
	 c9ofozuUMzP+BeR7hKMSpvXl5kdCe+ozZ28OcYDLQLBbJh1lNdWB1Y8Q9KyGSn6uLqlxx
	 jDsHvRpjyMRnpIweeP6vg+VpWJR/C7eP+yZ5apcnqg3y9d6K2iH6vAZ2ebhvQuYzwIv9k
	 A+iirwZCUH1K4dQuxTTMcTHKyX5+f2u3+RC17mciKuokFgygOxJ89cCXsGafId55Cxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794318430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LDxrpSTjR1x207YXRGbENckCJGicT1QoyDbfvYZYoM4=;
	b=z2F2yrpcFlGih1hSKjx0GNa/1qlo1M9tRAS+FznoRGIGOafJ0DxICrdPzB2WoBwleUmx
	 0PEqO+rNSz4WhcrDhWqSgiBM/VT/rQIPS5aA6yUa2yDeMP4HW9EtIQ//8O3IKj2MNNUvH
	 Ux/eO6JHwOtdvkbni5uKQRU5ZHd8lYP7VQFp/yk7tePrTM9/FeMVFvxHER8Z7pQh0HNud
	 ZpZLVM91siVE+EzYe+C5Dt8nwW4DQvQpvceEMd4sD7itJC0gxgRJj1vsHPWwy0kh1J7AY
	 MRDj40y2JkHIku6FaNl6SZEPoslfH/pZ75VLySPc55Mv0E8wgCwd9JPzAYf9IZWsQMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw5g+aab;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fosvUbeC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F9DB606A335
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F9DB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kw5g+aab;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fosvUbeC
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AABAANX4186986
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDxrpSTjR1x207YXRGbENckCJGicT1QoyDbfvYZYoM4=; b=kw5g+aabvJBAkXhH
	TWtO6NzzojVwT4KzPfrRCdfOuh+vSOtOoj5fBcsYMyoqDmwcwYv9uy9yH6Oqq2Cg
	dpUXTxUrIZOuccCh5Y560MtFpjbv03XRxlI0k7cYKNsemEYN9qfN3JMqHB9ukCaf
	USDTuX70PmhS47ohtWw7RtuiYg8EnRo+6888rEkRkEFTn5YUyToIh9UDjecf5h9d
	J7cZt7fSy0GbE/jb7VxIuP7C6h2TREv9DiBsR6t0p71m/zF1yYHdoxwTyFVFGMbf
	jyMp2K0LHTTYPEyhMoowDgd/3Nk4GKVoBw9k7e4LrLogTYK6szR+naqcJ/ULDOuf
	NpyhlA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyvwh106-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:47:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9997828d6c2so336561241.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794318429; x=1794923229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LDxrpSTjR1x207YXRGbENckCJGicT1QoyDbfvYZYoM4=;
        b=fosvUbeCFR0ScxBEKjM0KXSRVFrAcNodvJBtCSyB48I09FtDEZbNic3ebyqJyxOvbi
         YMkBZ1x3pdAThKKnllj6J4Nq48IDlsoydaECPYYEaA6Yi/8I8CZP7wu7G+qEZ2Mt5hI0
         TgTkEAAcZ7PjxR+cTwcHZT8dVEsTW83K3rn5zEBQpdscmFvCVzWVrNRvMX4YSH2T5eGh
         ZD10K17NuzIYKYEnMB1t1T5GPKKArWdCrVgzwrfL8kpzxJ7hh39tSc8tV2UP2MrESfUw
         CRVL57aJM2X7PMzjglUoIA+UVcCKsrw0VL5BAV7z60Q+W+wMd9+VL5d1QWUtSdijOPbP
         hrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794318429; x=1794923229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LDxrpSTjR1x207YXRGbENckCJGicT1QoyDbfvYZYoM4=;
        b=tip2EV95RtSOnh4RmZoiTGJW4P2G+qW0h9tfNHEcUjyO4T+rbsihJAtuRoxfzU/AVa
         8XD//hioHafD1SXNZ3cb2o5LF/MR6uGjpuuaS73f3W6oN1SlestjnN5rfF4aFH9Zwbu5
         648MZJemf+IJd2Lri8At/dRa0c04Lo4rRz/vmzvfinEM+TvRpoXZljNGCvPvQg64Wqte
         /Wv9x9tohBcnhqGVkFIaWpv8WTCzTrXlx6fPCHKDcsF71yXfqYYVIJXg7pKKb55HvGkX
         oMOcZJ3KbTwTYEXKL1uYpvtBcNqedUkidVJiahxskX6STLJ/FMswkIhjSsWOSRWknIhQ
         K8ww==
X-Forwarded-Encrypted: i=1; AL+hErGs+l/ffU0FyGoejw8uD4mPKtD/G9pIsnGl7o01SsOXEsCqqqeUkBiYSSQ7p70WuDamTEUSUuZYEsgaSYg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/cUbW9L3pF+4/fkONqmeLJbP4FhXvlf2ZL33WO7FisFcb4aGGB
	ghYJ5+or4hEaASc2yJ8dzAQACicZhHEXlBDZ7zhmcF/IZUqScIa5gLdoaSLrTyQEJeRyjCedU3m
	u9P9S0hza3bfV0kO7ZLgRkRs1Ohlw7eGUNcKAtr0n0BLGl0oZ6WOyIoZtOOvJGMO6otA=
X-Gm-Gg: AYBFou1qBvSZfDY9rN5KUgQ/4fPQIc+m+5kikdHVynyFGt7M+/OpSvmNHnx1YKqAsZD
	SmDnrsrd9usKJCMpOojuM5OtlO0jU8M40cB6P6sTyR54liYbFdTScSIHkYT7/+gHCy3uTzBYClI
	+yMSGAc3D0XyTgqX+GnT3++heKlfT6D56edDdxF7YSUT4k9qeRWSTnV5yzs9+Uc7mVp9qkm7fuO
	JFJb4ktLLmpgBmUbnrYeRWiaxUzpAC0aSw45gXC+q4Vw1Lhhl6xeYUe6lbBMiQzc7X752mMKf0m
	vvib9O53G1yMlMuAMbOqWLpgjOKzsxk53Fx9P5F23gOZ+Egnp8GFrQl91fDA1kenWVa4NkR6poK
	lUbE8KOk9qNNfAAUpd26gaSH0S7RJByxanO3R9BdLuxBPwRL9c3tD0YKCTe4+9k9+1/JDFDAxu8
	Hvx25neyCU3PEfJ3GaXgZmbCG/ViBBR6hxvlTDlOuKdrRueJsvaRTl265H/Iix0bM=
X-Received: by 2002:a05:6102:370a:b0:7c1:6de4:9f67 with SMTP id ada2fe7eead31-7d301ab04aamr717324137.2.1794318428834;
        Tue, 10 Nov 2026 05:47:08 -0800 (PST)
X-Received: by 2002:a05:6102:370a:b0:7c1:6de4:9f67 with SMTP id ada2fe7eead31-7d301ab04aamr717311137.2.1794318428229;
        Tue, 10 Nov 2026 05:47:08 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba02387ad9sm75913445e9.5.2026.11.10.05.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:47:07 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 14:47:01 +0100
Subject: [PATCH v3 1/5] gpiolib: don't overwrite the entire flags field in
 gpiod_get_direction()
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
Message-Id: <20261110-gpio-desc-flags-atomic-v3-1-2f463bce8086@oss.qualcomm.com>
References: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
In-Reply-To: <20261110-gpio-desc-flags-atomic-v3-0-2f463bce8086@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1219;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=WCMvGrs2u26s3lWSOpOqkDNBquBfAiITChjb3XLJa2U=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8yBYfY0Stc5FLMf6u4h3pBHfM38Dhye37GIzB
 jjR0jeUgy2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavMgWAAKCRAFnS7L/zaE
 w8EnEACyn6QziGCeIMzcjdSwNQbWeiTpCsy8Vvuk7aKQdPsZCQWKQ2V2HvFuadkQWQTAVZFoo/M
 hggqxBX856AdJ3vHJhOIWZpu5gCpLwJTLSvEHI5m6Mz6flFVmrX8w3picd/sqdlGmuacifk6XTR
 dupMrLAnQERTfPjtgR/Gz0ln4EOVwlP4bVkSjqraofu6IDiHO84I5Qa1ma89NwnjDMExdtrJzuC
 jeS5J/UB1mDl577SPRB2iI7TVYa+AijVuRMMAeO52yRIEvW3Z9TxT9jKRoiPokQogR6my7U/k4K
 dOMbQJi6i9UBTWt4FkMBnUo2pmCuJAKh4Ex+mEdn+7V12AGawiq2xvS+f1WApYT63J85DuzvK0n
 iiRTXu/YlzWbPs7h2rQt3pulYZpN3X587/3Hc4+IY0rVBIlEPeKE2f101PaduDtnat8kUGY+SU9
 DCNm/1abqyMndRzo1b2EE5kUmy02uccGfsJBkAOA/+A/3bUWltCsnZv9ENrNZhDKLLx+8Zybk8/
 d7YHVY7Aely2cs6TpDzD5Sd/6ir5omx4+L35Oq6Pt9vdwpCb+eYM1ejWqG48vGf9AWdG8BjoKNw
 Cp2huQ5l7ZskN7JIs7P1sFIpDo9agCjNqBY26lMn5uGYqCRsfZ5IdVo7HJPnbjFHO93DBB7EYdw
 gVOG8Rq380Of92Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: F1A93seBmpYh4XwZCULs_62jqvcBqbHn
X-Proofpoint-ORIG-GUID: F1A93seBmpYh4XwZCULs_62jqvcBqbHn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfX992gHQM33PLg
 OxIy6/r6iID08v2bxLAAr5Zp+Na7q2j3Ny9RFqBZ41NUwnMiZJVSNsucgmtdtTKemQutE9fK8te
 l0poCn5yogSbfJ6WPPZlaLhrQZbvG1E=
X-Authority-Analysis: v=2.4 cv=NNpAaE6g c=1 sm=1 tr=0 ts=6af3205d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=i4ZC8ekb83Sdn_VXTnoA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDA1NCBTYWx0ZWRfXwa4FvsDkp6At
 SfOaKFDhma348tzc/0fJFl0jLOBNJUuv/eqkR3nVAW1bg0sRxAL8w5oWzI96rETLxsa/Ggeb6yD
 U/xqL3wDrNyWFzB9e2Ut/OfezvRBHDwDWsBmaQIBgvJ3prdya+3KRt1hzrBLPLMdM1iGrP2bvJG
 jngI92SsmvEaQL/oj6Agy/pF5T6iy4Fqm1Av6UKyZ+DVzbmtEne2KJf10ubgrwmLQLl703QbXvc
 r2bV9zi5whweayFX3o498y4mix+Au4I+FJKbZ+eQ0BgtpyYvrHMQlE46uvga/fiupQ6RsZOcH2q
 +cv04U16bh7dtS75zW5rQIkcbUZuVaKh/ngrEy3+AsWEg6SjtAgAOs+dinEZYbRDH/4o1iwLy2Q
 DR2TjvQg02ekz+fKOHaA1mN5h6Ya3/3OCZZazhnntOotow+eckINkqXKEWMdraVIhtHTlmR0CBp
 ZlVG22SIjk5ztPu9HqA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100054

gpiod_get_direction() snapshots desc->flags with READ_ONCE(), updates
FLAG_IS_OUT in the local copy and writes the whole word back with
WRITE_ONCE(). Any bit that a concurrent user sets or clears atomically in
between - for instance: FLAG_USED_AS_IRQ from gpiochip_lock_as_irq() - is
silently lost.

Update FLAG_IS_OUT with a single atomic assign_bit() directly on
desc->flags. The earlier READ_ONCE() snapshot is only used for the
open-drain check and stays.

Cc: stable@vger.kernel.org
Fixes: 2559f2e09211 ("gpio: reinforce desc->flags handling")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 9282d9874e1109b7f030a3e83598ad016c2bf629..1285a993a1ceeff719142ad019451d2e9af6a520 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -486,8 +486,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	if (ret > 0)
 		ret = 1;
 
-	assign_bit(GPIOD_FLAG_IS_OUT, &flags, !ret);
-	WRITE_ONCE(desc->flags, flags);
+	assign_bit(GPIOD_FLAG_IS_OUT, &desc->flags, !ret);
 
 	return ret;
 }

-- 
2.47.3

