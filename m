Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712868;
	b=XosjZAP/Zq0XCZ3sAWdjxC7eCvcqPfl+0HCwAWBP65HLynQH8zQkwQyUFQ/NVrQGUDa4
	 9mWzWFbW1hb5TVvelhJaERIqLVEkiubrzoSiBMstYt3PjPnDmD+PbYg0afe22fViw48PO
	 k9U7X8aGr/SOZk4YS/5eWPwMpNvgm2PkNUs4sginq0z3sWYeTrnopwotHcihglCAUqLYG
	 R4Uf0dvbsPAUsRoAsRRHwunyr/Qre3+d0KwCFO6/3bilglwOaHi8p0ASf3RVUbB0tLe0G
	 JvkhdPUBkFbiyKKmSOwSRHcMl9RgRiYjq/CYZsKPNeleMVr4F6ML4mLrypu2MsKyCtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
	b=Psa4e217yJCypf4SkDwvsQl86HxTrI/Hg5XnllyQOUqxyUU28WE9zEPP1Tj8wkvywXHi
	 ranWbWbwTS4Ye1KbYPFj7s3iX/o8hATQ3WfJjS9JGwG1Cuhprja7k71lHVm7s39I1Z4fJ
	 gH6TjFFjIk7vOjOW/cy/FhqoHUvaB6OqJO1BWIC6C96rY8JdY1Kcun4+EwjDCX5lRbW5P
	 2BIpBw+pRjitUgwnNUOJIOoNwGab+bhUWo/DPFXf9k1qLhN/tG1HJLOD3qZmfXdzXajOU
	 1QrQsQ0+5oZCSxNgB6pbli4JHeof5eAseyF7OUoRnaYa5Bp/H1/tiaTkAuqJpfelgVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QmbkTUT9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjuoh8J2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37D1606EE9F
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A37D1606EE9F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QmbkTUT9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yjuoh8J2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClGBg1271887
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:34:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=; b=QmbkTUT9EgzLQBTd
	DwbS5LW8ukNsULr+oDxFwYnWgiBPXw3dEogpNru3TPt4l2RQMK/YbXTyxbgQvxtp
	25KeFLv4HAUw9jIoRRfOfgpUSJ+nSYeH8WZ3pVHJCKKmyG+gUkaxtcGaYwQtNu7z
	thD4iYNqoWWEbPZgu7X9/AoSyNOFB0aaMpEplshRjGOQFmgpBM5s88x0hhZAKiIP
	o8eRJeGjCCTksdklSC+cKahTNWalNlHkpw2s+C3R5MVlPOp85pgbZoLXzAaW4mXh
	U+OCFkQ+6qG6tvpY4rvZLH8gUlWChW8CuTVLkd5qqkWknKpEPpL0j/EYHbmGBM21
	K1RXeQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ekxga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:34:18 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf45382794so3547787137.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:34:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712857; x=1794317657; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
        b=Yjuoh8J2RQLzQGV+hkx+2lXyJfyPwnZFNlW2hE5Bevo1HPu7b4yREuDQsudGWDZKag
         i3KWUTdQJUIHK3ztUzeryJrW8zvTWgyKwIOgI10o1qElB59R/Bmjmroa31K5grH/q3m/
         H/FoI8yYUhhh4UPMU8JDqR/hiVnj7Q9n3dnx9DoxkXoe6mRvI2L/yC4BCfP734/sNOkN
         nTAcCOrxk2CLvLEOzmLzvSOSY+VUfkVI9C2YY5CZz6x3648Zy2nxEQ+WpyvNnDm4QdQI
         L/H4nxf9bn6XCIuiO4BTcJ0mWGure8A9RJe6qJVScc1VdBU09FN7CzeqavoQzx4K1gDf
         wQCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712857; x=1794317657;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UlFfpd98ehBTyq3Xph9Fua8gi7fHWtJLIZGicsuw5ZM=;
        b=LClrirhxpthsZvlKcjeym3THAq3/wL8z1dKOeluL+YJ7Cx+bug3qEsKtQ6zuNxt1Dz
         8kS9e5v/jO/PTyJMHHycLtJk6J5171wHaDIfeJ+7CbxARqi1P91bn1tmYoHKmA25eoJ6
         eIIpAL4SV2nlv/H06GSpg0+VR1lnCT1n1nmm3yjROCj2/dpjfXDTFMnnCbz2PAWspTDA
         i75Ymt9bPeN79b6wRE3OWE5AnRdnhW58gvAnuQo48/1ISiSEcnQSEReeYFnJwhddTV8y
         MifqE3Tm8GQ3uiyUIKfgnfzn8s5mB1Prs47kfgF7VMptPxmh8kHSo6R7EJr+D3gRwWER
         Ai/A==
X-Forwarded-Encrypted: i=1; AKwUvBx75QyIoWWIo3dEiBA8KykjzPwlyt3g+1PeZ3p/cyb3R9rjwyCFZmPcgyT1eTbED8E1kirykzOHagImnfk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/KVWhSI3prUngDqx8V3BzMXANC664kI9pzFwLiXuAX4GOv7+1T
	lrkNUElQwYR2IHluPkGrj0zLHto8pDx6g6He2MsZYA6S7DJwc3wqOZaDATJ1Sc72d8M3KprBn8K
	ImN8nuD2xmuzHUcSMAE5muZMjcsnqJZskCEsDAYmd49Er8lC0vc0AYo9DlZM+f0WwhIw=
X-Gm-Gg: AYBFou3fq6U7HK4m8Nlu5goYEwDPxE5e2yuSl3sa4aqJ0Ugdl5tM0n2Op8iD8eWhdPn
	pQECIL0q3G8i54pvh2G2Ogkv8fRhgTtAZGLXl48bAB8Uv/Y4mBX2T1EcqirQ/58TtAXGQkspUQe
	OWymEjapNAY1FL9fTdKTGC6RuGW/0lAVlGtKgR/RQjei49qlCT+rJSRJCevfflGdxT5b/yJZjPw
	wRVu3aHFRJD8hOPEubGyNt7YW5aOmsDFkudmw/mn4DRmfnkMHHoN4cbKhS/FpTlDdvIfDevWaSL
	zEioiYLu5ITlHpzGZzbXKiuYEdZfnFuyfJT3i8/0mk7MsK34pulsIlCaHSUeCyB3/F/NaYZgLmt
	5AjerTItNtUB3ecyY4R06XlWKvl7ym8ajy50+MtsRlwHkRmy4i6xFVP/EAn9isTUxMTEnP0Ygp+
	MOjQ==
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d071f40bc7mr5046271137.0.1793712857342;
        Tue, 03 Nov 2026 05:34:17 -0800 (PST)
X-Received: by 2002:a05:6102:370e:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d071f40bc7mr5046256137.0.1793712856891;
        Tue, 03 Nov 2026 05:34:16 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:16 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:53 +0100
Subject: [PATCH 2/3] ARM: sunxi: select HAVE_SHARED_GPIOS
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
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-2-aa862c1d71e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=715;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/AFcbMcZblHubDxf794SVqjhIpAl11By9m4gfG7n6zY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSrAQvg5vxhqBArsuQUFlydgNSbeoyY/b4+
 Dy4eH/ORcmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 wwCqD/904Uu5wvPIs2SDwjL5QN91sAwhgbcm1t+Qgn/BiD2d4ab61Ev+vE81zGYobw9S9j/z8Or
 Vy/17jrUknJfanVDqVnL+RRNJm/WgqmaiWcjSjSFY3quypJPXqbFyriwzSEmhskOF4u+2lY+Ro1
 Nx2IqrKHi0xwY8ljDETtM7qA1uDQ4mIpNSvol4gysTa9PdFmLjEy3dVjNOYhWWIFfvQ3NPV37tr
 LxD+wjUN4QZRs4uYJLbaGbg46Dy8/mH5a9ZAUNoY/RPsvLC3zSCV0My0pxNRYi/xwYz+yvneaNA
 ozana2AyAeMNKlUAU0HDlpo3KYaLiuB6WHlM4x8b+k7eW18qu6kshYVv1nRhq+uU0mRPzuFKJaE
 10rqsKleMVnr+Z02+Ab/eEiGud09h+JpV8mMTTbExeL+TPMOhoULvd9d32r6boIjouqA7LD8DQ9
 oZsa9h4ytzL/jDdISTbVqxB8xPiPug/S7MDj2lJp6Y080Ze55l8q72oAooI2vS2XiFq90z8OL/6
 TUrcCKy5ypAjg8UMr9ipDDdMB9J5qU85VqhQadmJ3PRDPXtGCOqqm4C+L4xgUXzjy3MwiVflOIS
 Y2gXpDTZzMsb1qBfeHIGzzMDXn5ewPKLVavffLJok/ZIsKxZ8Ao43gXvd5YjX7cyCUs67vt8NQp
 fttVjqjLLdb+t6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX3WZrmuloK6Vg
 byQn5FufW1tJGFStU/DlXxaeLuEuRHaosP1rPNHe9cp9xzySGSAYuUGz89YgSlM8mrxaFHATvjy
 bpmAjgkmE+vgSBh/mkhSVFQumLKY7JNeWr6Y3B+iXIggEu2Fd3TYjbo+3pfktFX9inpto11k3bj
 iRPRfX7hX/1Rd8+w9u7CWhA8PK6yIMebcgXxxeAxV94TaquY/qs+8ObTJ4uZx4a1Rmex25ZA1G6
 DOKHFVKX7RbNIqTf+iP4RIhslh86QXgP4FR7fe+FTwAR3JG+cO6Mzfhs9LQ7DtATKBjb0z5CFmC
 KJqDbAuzJNr2tS2AjID+iLibeHmTfiU2DqI8R0OcSiT8dHzHCpJCxgvH2ObCAnjO1D6jRUV9fmE
 BZbLAaWO+Bu5EHaXh10FIcc5bUUS+zRTnrip4T0J1mM6T0aAhJrR5Qbz4gee0IPlRdE8un07Tl6
 peD993PsJA12VSp5wjA==
X-Proofpoint-ORIG-GUID: QPcD3lYWjxP9cFyzCGR6SWTDuWXZm7PM
X-Proofpoint-GUID: QPcD3lYWjxP9cFyzCGR6SWTDuWXZm7PM
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae9e2da cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=eCt6F14imeMwFY3J13AA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX5UfnDVJyLqnW
 jPpXSUSglOTcZpso4EH+MGUghuguJM59UVKJQkC6pdW05NmboZQWxd0DYtHxvIdE10EqVTeKBQ3
 Xt2hkFtzWV6G280Z2RGSAoDNnV3cis8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030053

Enable automated management of shared GPIOs provided by the GPIO shared
proxy module for sunxi platforms.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-sunxi/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-sunxi/Kconfig b/arch/arm/mach-sunxi/Kconfig
index e015f2497111a42133ddd4e7ddd172eda06d90ba..b62e8518e270459444e7d4ee382ef753c368dd51 100644
--- a/arch/arm/mach-sunxi/Kconfig
+++ b/arch/arm/mach-sunxi/Kconfig
@@ -5,6 +5,7 @@ menuconfig ARCH_SUNXI
 	select ARCH_HAS_RESET_CONTROLLER
 	select CLKSRC_MMIO
 	select GPIOLIB
+	select HAVE_SHARED_GPIOS
 	select PINCTRL
 	select PM_OPP
 	select SUN4I_TIMER

-- 
2.47.3

