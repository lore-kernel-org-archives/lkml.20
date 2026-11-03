Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712862;
	b=puUkjlyiw8SDih9gweFPJjyyQsygYr7ZMJT/eNcl9tu5dQx14UEj8OfqOMg6zwKckelv
	 dYnYB6oyjR6jyzk9fGI1nSHYUpbcxMmLFy4vJQuJAvJmxzsQ1MTmAKsa/H95N//xXbaSO
	 gxgyniZioNKu4iun4e0uetll74pCeX5IP69nTok9vJAq7Q09tl6wrckton89xkO4681M8
	 p5SpEsRUlOGL/Om3b35NeXtzjhyURCoJ7CfY/W9gy5LleG7B8AxRuKsWNsK20l7h236SE
	 8tTGVEvzIKZQ3N0bwSO9i2UYgDLw5mXueaZy9uxu8sQpAlbYKE1Ubsl2gU1M+R6ZI6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712862;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
	b=Ojeh8sL6KMOFsx0TQZgzw2Q3B2iRTJnryoDaAfiWmvTGVaZeqk91uuXElalmjTdEYgzF
	 eADZqx4a3nvzTptd9XmCw6nuRJYa/IQ8fjGPg/b76qLbIzcleoKgEE/83oerc9XiErgLT
	 CyXcOpy2YPXqxLmN1XW/0AdA+9yiczu/6OFOWEt3J6LsbBv1y0Pw/b1eDfrgzwWV12eXB
	 3g5+BJEa/a33KoSMG+dBqtMRAkNPYA+4fOJ+6W6ySsXKiegUcAcbbf6og6k/lkc3hZzr4
	 tHLl3isil1qbgpGu/JyTNXPRGo2b18G0SBw/UgeXNo5Y+pU+MY1Amb2LPZ5lHN3++oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MsiV/zLn";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZPa1lG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1BEA606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:34:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1BEA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MsiV/zLn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=USZPa1lG
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3Cl6eU2865763
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:34:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=; b=MsiV/zLnv5StFd6p
	hWvIzjdpPt9IQDAnWLv0tTrBGhCXT6u4wo6edsawVRotPX9NAWrAfgVi5ddHdiaL
	/GkXynkW/wyyEYd90f/TZ5cMEQcY7/FilTG67WsbGrdsuFkJTIx6ZtxrjeOgAQRK
	SlyRxNJRt+IOgiRCUykisIH3nJmlVDP+XfdwOCYYAT8dKmhUmLvi3Jf64xb6+OwC
	gzOz/6jUAoRJn5sH0nIA9iCDR/IPID3189s7CrV1cOIyuKvr0H6OW5FfUlHp4cnh
	NOeXAFq9T+O4R0O02xxzXBBrEX5vW2xkGRZ5lErI6Yn1X6ZP0Hk+IjpfHlMOqQsB
	cnyeaQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jvdt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:34:16 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99077a0be0bso594797241.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:34:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712855; x=1794317655; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
        b=USZPa1lGaBYXX8CerxlOtCoPk9IdTrHaFlphp4If5Qbzua476nxX61yl11ji6x6xU1
         LUbTk1ycAIBfjlvh/uwk+iYvHdfGFyjzMyb4laqu/3hcsj5JDWR+HKAFLXs/Yr517tSt
         0Zls6kNHvztUVuwavEDNk/acxGybOCY2NT5RXRzSRmxJ42SZwKIAle0BIacr9QN9wtJ8
         Tk86iSZdlLeaslMwQxC+lkT225wZ/j41t7JTMneHIdSL+YzZy8FzZ4fv59Z9d77KEdCC
         sTDb8lMiI/6QIG0ZXqWhc1PQUVkRRZGnQIgOMgfv7xS0eUAE77Cje+f+5rSkw57Km8c5
         vfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712855; x=1794317655;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yIknrBZjHPY8Jt51beaEL0ty78CCW4k2vbkiC0Sj0zI=;
        b=HfqzBUjdjFSraHjjfrNGtWhPYnJkCPiDRMyU40/6a+KrOg432S40qbkhEZ0DGgvHqs
         Bug+ZygzXbPMYDJX//AzBKbsvV5Xj0ecVgmPy34UuHrmBEm+Mu/1F/E9rz1VEe74Oysh
         2XAQdkKvw5zdWr/YWXaAGF7oXnnO5O+wXuC1BYhEnJxphajdcqQtDGlJHeCTEvZrB3GA
         uKtJwh+gSEX6dMhWeZvkuq+BgYMXNkL7B3wW+LpOdb46Y29Lt3tfO5vTBd4Et4xw8sak
         4FfEAKG8yHVHmhQ05NNv/bv2ePVAkdcq12q34OseC8qbR3oL2yj7IkJdTtlffKZ3hHX+
         ctCA==
X-Forwarded-Encrypted: i=1; AKwUvBxXbzAbaJXBOMtBPyswBKGf4qYoq2FmdX3SnrsILTpeQhQQyIW+HxIWpSEU0syvD42/iQYouE6L5O81fWU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ScQormm3siuQ7/boARfqq1NBuw+Ei7aFKKUnu3TmyhE5VvFpn
	sO9b8+Hqf19vWDTaHnBgvWruDA4jJ06rk+tgWvl7IWVGB77FtGlJv3NZ/6j8yws5n+er3QQfGxl
	Wi65jhNiT1mUnbtIyaQMJU359cy45kv9HuXo4boVcUnHiKIW4no5jhhAxNJnfnYJISvU=
X-Gm-Gg: AYBFou2WSPxJpI7IBQ0uOmRfQLXa1hdpUJy4SJ13Cx92A/9CrQNwFblq9xQBRq4KW0T
	TxxVURrMZ8WPulNEt5dzwJ46qlBrR7M/YgjP91NKYC1hAXgNtoHa+p+sfr371fFzb94DYhuJ/xS
	rNjL6rH9y7jisCUIxYKh4lW6mw8qXkKei+eobvt4FWLadquo4gcBwpQre474SuXykytlIhEmNiH
	BY88OQCwheboxpnARXkKGgPAuxpgh69CW+rNzhbl2g28cbYDs9hlffQ+qB3DWEVc7YTIAfEUUWm
	28FvtR1XsCQt/T+L6cMxOP+nAx56TbGrieLPtedADvmHdjKOb2xJpJiu0kFLNh8Z5cTs1oFeW2y
	JGWL/BVgla1IPRKl02OXLHrBsZFwrzPYfORkUj1ZJs+hNJrisvS5qJJNVyYaxxF7SFheQyCsM+o
	1Fgg==
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr4343532137.24.1793712855109;
        Tue, 03 Nov 2026 05:34:15 -0800 (PST)
X-Received: by 2002:a05:6102:6883:b0:7a7:5355:7fb6 with SMTP id ada2fe7eead31-7d07267f930mr4343520137.24.1793712854700;
        Tue, 03 Nov 2026 05:34:14 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:13 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:52 +0100
Subject: [PATCH 1/3] ARM: stm32: select HAVE_SHARED_GPIOS
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
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-1-aa862c1d71e3@oss.qualcomm.com>
References: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
In-Reply-To: <20261103-panel-mipi-non-exclusive-gpios-v1-0-aa862c1d71e3@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
        linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=747;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=+xwhEIq1Kfy5I5NBWcOLNXVJMoR1QHxqiMRtC7afj20=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSGfA1l9T+A4p0kHk24QWFBtFJJJT4XTpef
 LL7mrxNOM2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 w3MtD/9uudBQVkBxiiyISXvd0Y8Wm8gryDzgKaUNm4uEeMoX6xWUdYiho8KqcFnTr2vQp4EHnl3
 V0ky3XWFAJp0xs5mWtYBVxfPRZRr8cnxjlXKA8ij1iB/xGYMX9c36/H6dvhJMcv0J5TVL479Ho1
 Us0zp0l9KFSw9Wb7NAJYRFMMmmycip9ccbIS5alE2M4qiJmOoP+brHSvRaXMTZcIfAPXSlDn72R
 e+KKlEt3o6mq5kvmkf1IqPQPvfB/e/Ge4s4s76EVwK/1qjlPqRuRLjDkBuwi4db9tshI2O9hd4/
 enqe4FeuCfB7VRHCRYiBS9m+Ic/QKQaDynxnHy8un+GYvrJ7tUuoXIL2n7bU3ArxHq4feXatqZU
 7QD+4rD4k4y0Wpu4IX6wbtG2W46DJ+782W3LOnAbWo+QL53D4Re/Um+LJ5mYVG04dNybyezoMDM
 b16yKM6XXF+aWYlc9lVXiHYH/S4Qv0AKH3gbG6oH7Bs0aRloOJoTG7tF+k6SGgKz6DdorIl7gq+
 B2jzN5nJ7CW8Ir2RG9+9/iWLT/uwfmCqrpUIYb4rNPgFRBhkawf0a0XJ7SC6ofdLHCFkD2Zf06O
 UXxh6oLDnuX6xMBcFK3qaQYYVC1zi0uFcU5ITlheV7DslAZ06/VqIMwIjTDugUu9CzVnemUyQbq
 j0MTBEPlGcNcfIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: bLIp4KMSaTrPLwYOD6rCoFeVhrJ2lWvE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX+ovOKrRVOqcK
 TOZYB1J2RQMUGvuu6wSqNxmjh9ANsMdKVyOHbcQVGsVvNwevcvhjnUmZVB+BK5T58NU7MwwWaSW
 PfP7xxtjQ7SRUaykGhb6NDqtcah8YqNkIw0bO4ZH+ecgyVCjKoUQTDUHdCi57L+9w/Y+pck4gx3
 U6t5StYwUFMoyehrHTDxHAYunoKi20/5q2ZGN4rlu/euH3JpIApj5IVlKtEfDcfOXUmVRKbzuAN
 q6mMZlA8gYshRxsXH6F6oVGauT431we8X7UvI22i3xGdnpXGxkNDHxH0Vn5bdDfKZDOW+df3gAi
 n7RoXG+qyKxZlUubm9KFi+cyGruLAT3IhU1YIgkjA6f+7+M6AE6dGfibU4IdcXp0w08eF+LCOrq
 DOXusJc5ykqxFIB/hQqY3tAMknqLn9fvdzYIdxFimFNtRDyy32lZN187dJs9Vcc2zwFSeD/mmDJ
 +07kBr0WrXOn7JVdHdg==
X-Proofpoint-GUID: bLIp4KMSaTrPLwYOD6rCoFeVhrJ2lWvE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXwlQRHKgiuGYU
 7rRhjnEKqoSFsGn+IrO5ZO9DuzaMURUpSUMJ8dhPogYyCNmfTAudmHGi5nRy6YPfE3kFWUoH2Vp
 vvyongU5hfg8RLIt7Oj6zrEK+2oBWWQ=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9e2d8 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=b5q88MxlnkSnrj9B7awA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

Enable automated management of shared GPIOs provided by the GPIO shared
proxy module for stm32 platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-stm32/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-stm32/Kconfig b/arch/arm/mach-stm32/Kconfig
index 4ac3384e397aabd86e4843d6a6326cd22a2dd66e..ecb6b35610f4988b4fca3fa10defc260a149f7c1 100644
--- a/arch/arm/mach-stm32/Kconfig
+++ b/arch/arm/mach-stm32/Kconfig
@@ -9,6 +9,7 @@ menuconfig ARCH_STM32
 	select ARM_AMBA
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_STM32
+	select HAVE_SHARED_GPIOS
 	select PINCTRL
 	select RESET_CONTROLLER
 	select STM32_EXTI if ARM_SINGLE_ARMV7M

-- 
2.47.3

