Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712870;
	b=H5WBn0PlPZXLQEjnmyGeTlbHY5FDMYckOu+0PmWSY5fDpHXMhwmEYwHg+29OvxPZKbZ6
	 baQXC9erv6csvOtSuCHwXeTchKo19Yx9G6TKAf6qIjUyi7eRW/z5i0z3EArw7pmGKR8Fh
	 HXAmMmWN1CCiZ87Gtv6AYffPayYPeVYozdW3jXpgesk7erJkcXUQHjejqHHdyOjDm1ZHm
	 NQxUcF+ivuNo3zrcG8Gk2ejSzVdo7uvkc9Zpho6b+e+I9kQDQfY2W4pPBSRqhZzDP9Ess
	 tu21XsAKF8+/VCJQdzyIdnNjp5PlilAfJ0U2rr5PiFHJW8nBeCoUrxQ0w1oGYoqh6Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
	b=CnqIkO8MWucb1NyTqFo8fw65RNR0PsrhA5BJf4q1NZkLPyPK8ETGQoGWSRVBYJUWtBk2
	 ai9xuPFuLUr+Ci1/4RpfXkJQ8PiMzD24QjSd5fJOlMJiaH9V/EOUT/4MpMUjscGOzmIqp
	 PWIi2DPy4wwM8PxlpG8UWX0McrBWHzj0VdmRsQQWnMUQmsbDEs+yTtxYl3LY2eZRRetBn
	 cUIhh9m+/GP6pbTt00fmrXyPWXhfWz012icNvWArvh2CsVYf4GJdb5V+b2+3ith7WFvG0
	 Bt3umWX1eZS6iaaWulDx32+lgaAt2SAkqniaLWvG5I3kpsfFPd8PHTccrTRbb9HdguQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PaX60grQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hEpGkbJ6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 063C46082BDD
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 063C46082BDD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PaX60grQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hEpGkbJ6
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClBuc3922669
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 13:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=; b=PaX60grQy2eNFep0
	DO3/PPj54urDEBHx1h8NEYiDFY57Lq8fD8MmHEsFlTANYufLvVHkzSUTCk4EScwK
	Tku3i4Z9MMln/T2hs8xTmb/LZ6w5rpWZ1TRqdwGY0Z74mvFXntUURJaQ44jQs3dY
	52Ymhjr2KHdreS87YmrR+bxRFhXEca1Jy/yVd2FolB/o6mc0s2K07nRXLImQZGN6
	Mt6xSUdmj66I2ALx4D+zOIvSPYbn7h04f+qNfDhfjlCh3Xnv54fPrW04CYHtYKPc
	3+Kyzp6RbKix2u5uwG7hxj8L9iq4BfR8Avf1GjKafw76pJcANkM/PnxBdHqnIEz/
	7xxHNg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76dab8n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:34:20 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso767167137.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:34:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712860; x=1794317660; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
        b=hEpGkbJ6kpeJ3yie3DJEVvXQz5S4gqxS0wMemAwrdmRgl+pHyEJ3sepjgV57V//cmm
         hWhBQXybiaO4kErrcI7ZnEcoiuymThXIyiHgndvZU9xUaRV2niaf2OEJY/cG5zmBmJDP
         af5/JKN4G0DpdOwJ7M299V3SG38IMeFKfanWASfneWy47Th58rDxf+UkcZHg8mfAYY0R
         QAVGPnaKqNc+BpjsHBKDtwN1v4E6+x25+HI7SIgN74THzSN/WZrxT10vRFYGRs1cMikp
         FdaJsDFGCg/HFyA5LmgAgZvFEN8tPPobOcBz4NB4Ht0rg2T2o/uWs8NoJZgfJYUDWL4s
         tFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712860; x=1794317660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DTqLAUKcdunUoMIDUDVQW9cBAtclBrFvLZfGH8GUl2Y=;
        b=kJmjD/nf4r+f46HQfZs7nea3tTV7hY+R20BXqEHscaPqOS9MHKLRtzOs22OM0w2a9d
         pmZTMz4i1oyhiplPc+prys8VlGlXWliSi6BTx1C6xPtpPusls4Qx5ruqa5Y0D5Lzvz0L
         KP8XnEfqxkZjSodFO6QtDmmCA0Q9XK6OParsGHo4uQdfvLQRZ6fgVw90FGPxNaVvl6I/
         qTManUNxMA6LngD9718fvTM+V0Exrjow2yfCuEgHfJVR8xXppo2aKjI08Xw3+aM3n1/F
         QZQjMMBdIjixmL9HmOV8vHevLc1STnflsznHeWrMP79qWo1RS5bxoRXdjbkpcKKihYwd
         KoUA==
X-Forwarded-Encrypted: i=1; AKwUvBxGmoSsv+WiZm9Desq2tdntRD3IqA1kANYaLGrDOCnptVOk4IKllBLH2tgJoMPjrY9ExQS3QI6ahuFfGbc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AmJTXaunfs7gAOP1zkJfBXkDXDZJwDHjSuIOmmMLFMg5PKF8j
	lihP+w/3wemyXmEAI/CnIviQ25YF+W+KQI4Wa/vmBVoa2xeVWiambscQggQe5biLNs0qe0oFuu+
	JbAyiGbI0FsvRDVm3s69dV5jf1CnvMWxM3RaESBWcq8fKL+8x9EmXQg713AesCJXd4Cg=
X-Gm-Gg: AYBFou2HlVU13I92WgUfSMaApBigJ3AS5fu62wFaUesVZhvDFbnHVqtw5T3yNYoZQk2
	LLfYhk9qy2GyC+KbTDy8VLTNazQ9HUDw+RqHBFsZU517gr4kL8xVRCbienrlOBj0lLbh+2ymSfA
	A2bhzDsFLlxmuZm1S01mAwHfDMVrqd08OWOq7hb48bhQNzO690Mb0IYZ1RQpx2V14yTtvOQlftj
	lSxCkSo69FVmnmV8980afECfTyGw3t6VY/BSZ2DMQwErv8v/949sTaBChP4Gp7TRZ4kkEh68Uuy
	wA23LarihBsZSNztQU3354x8wGWxlv0VcCgiEPN9PPFQYzD1GMxrmI4Drz32dg1m964WWoIuhaD
	MqjpVm+MpYrjmJwKi3avvIw8HMog65ExVF2ryY9zGLmGWKv18ozR0BreCCHSEhUJWRdXMd2IurX
	DLXg==
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d072626935mr3533202137.18.1793712859561;
        Tue, 03 Nov 2026 05:34:19 -0800 (PST)
X-Received: by 2002:a05:6102:604b:b0:7cc:9d46:ac88 with SMTP id ada2fe7eead31-7d072626935mr3533187137.18.1793712858980;
        Tue, 03 Nov 2026 05:34:18 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba7168sm26866970f8f.55.2026.11.03.05.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:34:18 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 14:33:54 +0100
Subject: [PATCH 3/3] drm/panel-mipi-dbi: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
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
Message-Id: <20261103-panel-mipi-non-exclusive-gpios-v1-3-aa862c1d71e3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1340;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=L77EVNO37nJ8bqShHP/VkH28Qj8EpKeHm6Kw3WFdyMI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6eLSAKCGRs/5xWd0LbuvTkv0Yz4BLBG2Wt+fx
 WEuk0Rn70OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCauni0gAKCRAFnS7L/zaE
 w1m7D/oDxRKdjJGFSMRo90SmI08LhWyVliSQHqb9JufJtsRCV3NGcX4zCS+jMU4grEWv0lfuXu4
 6+4yVk6EQyvgJWHhRyWISjQbGRLHjMgBMZ9BZ/aJdVT74Y+OyN1fNWO6Tjwt3hll/O4txb57Cx6
 DOxKARd/3QmK0BGXUEdHAafVAddJBW9ERKPc3rzCjHVamct6gAoJlElxXM1KRmyTGBsYjXQ0Y4Y
 OE40frmKz80lBd7jlFF3Xp2+pS4uL76NuhhpcIQTOYcvixff+ItacRK1syYVL40xIG+SD3FBlh7
 z7t3xJ8ES0U0guj5vwRBpJa2xOFdKe7z4zHQAA7rFtwA0vmgKpPaK+KzlVi7mNLZwStySmisjC0
 wfhKFNv4uuTiaza96qK6pzeg6UC41Ejwfn8y1DbtNuHYebdPLTUQKHNvve5FNAJLr0xkcNErbr5
 ubhpZ9hiOtBdsG2AEXM0C0sryKXmynqccTydaaYRrtaY9xABHDk288XLpglrFrF6Hoe3zBbBrZr
 eLkqDB8W/ZgRR9exnAXnfgO+aURE3oqvdFz4blA8o/dMao86USkCnoxUVDxGxz8EH9Jrlj8CN3H
 zaSMeQ7LI1ZT3IvnNKhc5Pt84Wnc1aYPXV8DqAn4hNaP/e/4fBE7HyaWGDRDPE6KYvHBq29oNHX
 sE7DR92bWXgVLvg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae9e2dc cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Mb4fkPDSjR1CXLPVujoA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX6j8XIbTIk+7j
 K+kA39+vx31T+v3aewC09jFsTAT4V3b5zKWYMIcQn2HolCZz6Uy+Bv747AS2uEcYj3AQYBs+itX
 TUct/YOywSw2fT7KttVlVCcBHuf096o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXzs3tDEugBooi
 lscSrkgoVz9QIH3LUpKLlLUX7ZC3B+hLzK2SoU5U8mVeOEtdQrA1r14SScr6K3LEqPu/cP1sOuu
 v0XcRgLmegk36T+lb3MLSaMPXQznIcBQYIK9mN5/jt9yd97TtRuMolU6ahogm14a+QdOEBDliad
 N4w+paTGwtjeeV5FwUVD65azQFfHUDyoOsOfeNnZs8UW4x/mHPMASmt+vm+P1vYgEkxS7HcWbL4
 KwPEPetV4h6dM5Q8zHDkc+PZTKN0G6dJAbXN4wpnKW0HzF4dd4h4cHMyfqUKcLBs9lPrdPRTVEY
 csAkdO5juqSHh4VdgAX65Mn5SomNgXC3m0jYS9hLq5aGffBTUFraNKOzx0mtE1CEk7dO+6X82oq
 XbCoEdkUEZFsjP4fUcqdxHeO+PyMK7pASIRfoUNeONkZ6m6GCCHVmLePwpB23LRgkkkKLQlvUW2
 XM0W3LlQdaZYLxweK4w==
X-Proofpoint-GUID: ZwGuDqw82rWDjsT0ZrLPa__09xuwVMlf
X-Proofpoint-ORIG-GUID: ZwGuDqw82rWDjsT0ZrLPa__09xuwVMlf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030053

GPIOD_FLAGS_BIT_NONEXCLUSIVE is deprecated and will be removed. The
preferred way of sharing of GPIO pins is relying on the GPIO shared
proxy provided by GPIOLIB. There are only two users of this driver in
upstream DT sources and both now select HAVE_SHARED_GPIOS so we can
safely drop the non-exclusive acquisition of dc-gpios.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
index 60cd65cae41d8d4f4f6e5fbc57d5d34058ca4d38..6f09b723cd7c352b0a1ea9f11a2e58052978cf0d 100644
--- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
+++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
@@ -418,8 +418,7 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
 	if (IS_ERR(dbi->reset))
 		return dev_err_probe(dev, PTR_ERR(dbi->reset), "Failed to get GPIO 'reset'\n");
 
-	/* Multiple panels can share the "dc" GPIO, but only if they are on the same SPI bus! */
-	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW | GPIOD_FLAGS_BIT_NONEXCLUSIVE);
+	dc = devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
 	if (IS_ERR(dc))
 		return dev_err_probe(dev, PTR_ERR(dc), "Failed to get GPIO 'dc'\n");
 

-- 
2.47.3

