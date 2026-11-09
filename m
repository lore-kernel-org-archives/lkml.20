Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220482;
	b=amyhhTWoKPfSQDRG9PAOH6vaI34AuPtg3NxwYWJ7PcxX8v6n5JrKOH7lrG6KjPjRs75z
	 8o5iVfX9f8weq0FuvGdFFC1d+wYNpDD0WZEEfko22z5lJ427uBQZJvVWjbyfTgVjyF/wV
	 upLCH6UWIILkoY/U76VkTJXHRBk1V4i4P6uHxMEXsRJl1NxyoocDwg1UP1VHpLs/XOqvT
	 fT4t2Sondq0eJOzhQvQfrWg3qEsMSxNyIPI/ik4ntG63/cFHtRDGGrWfm4EG583S2GWKH
	 LlBfzCbl2pzp/4PVpcF+6tIi/e9io9Oz6lAPP703LPYmlOh+uNAw+jLrDnltLCq56VQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220482;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t2ZX0e8EFrvoLvciQspYC+mP0B5TkSBChAwKdLI9R9I=;
	b=BTGpGSEbsVeALjV2DON8Al2K8uQ2Qu3BlNcXwmsa0E1fZ6snyNItkhiqHeZz9qpC1WdY
	 T11WvPHDgSy4e6Rr1c8cbbh99LUlfOfL7iSqSh21lXsHNa+KZzCTCSViIxL9lQYFC2uw1
	 RSfNQn23F78zMcA091ooawY2ayDP66keUm+Eu0xlj0CgrY3+TQ2lF8gUcxfysNgnefB0S
	 pk6TSYnRM03o5yxm185BS+RTdTTpBjXVIQu9jTmjLhQBNcGIorgwYrhwzdlHI/BMXvF0t
	 Fm8dYMiB3ZLuBrNB4wB815W9bsmawh3e3mz8Kmmb4HxM0LZjqi4FxhNeqq88+PFn48A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwDlnO9B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5tcU2NB;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEEB5606D812
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEEB5606D812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pwDlnO9B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E5tcU2NB
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99uk553600448
	for <linux-kernel@vger.kernel.org>; Mon, 9 Nov 2026 10:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=t2ZX0e8EFrvoLvciQspYC+
	mP0B5TkSBChAwKdLI9R9I=; b=pwDlnO9BdREezjAwNdBqm1i+3lbw+sOQtCtY2K
	MnJa/9ti+BcNGt14baW8Qi0Rs0vdQc/SmgTknbfDp85oOmr8pvXeLUDFpBcZo88P
	Y72b6+GwaIhb4wFYUh9otZZ0ViHG1ulwTzqxpc2pj4D59BjGwPJjgV2NJRfwhNb6
	EnXYzV0fRsaa8FjgX7WWDY7HDntDWtn6hwBpCsMvGn24U7ekaJq79lpdUjsHtX2+
	IuUpU2JHQo90/jUZ1ejj5udln23JDDheqv1V0EqgiIhd6WT7ZtaH+N7EF7qBSC+F
	SxhoD6DqxY34lLGmOBRSikPQ25c0EoJ31Mi87fnBaTvhcnbQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hua588kdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 10:34:41 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec8c86fb91so144282e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:34:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794220480; x=1794825280; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t2ZX0e8EFrvoLvciQspYC+mP0B5TkSBChAwKdLI9R9I=;
        b=E5tcU2NBqIMtkjLEmN5VINUqFrfffQIi6yGC3osl4UwcC2cx1e4cC8zDoxtn6dC7/c
         DnKa626HfrpEFnML3J84LYG+jW7B29/NVISl4cUXMspwZ2P9aihhyJTEC+eNU3ytMytA
         o9ZBHvzda+qNumrQFWnacVtL5ayUTo5TZNdDZYrmMrZEkA6mz1Wb6Rs3sFMmYqAVejwr
         IpSJf3RcbJ7PJ5UOhdivuNer9N61bUGfYRM9SUXEo6HhO/HWIS2IlilV3SI8mPgd75ey
         NDUaYENjetZi88haRCenbYY/LlLRax4kjL8lFO5mhqyYvaxy1welWm4x1Zhl15GkgP6e
         SJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220480; x=1794825280;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=t2ZX0e8EFrvoLvciQspYC+mP0B5TkSBChAwKdLI9R9I=;
        b=ZN5XJqKdoOGw3R1LBm20yunq8bMHimgLfPSa4qqggUrqaJtNkRaHirZAU89E84NvTC
         UFLnnfAfHD3aRWl545Fohmzi1Q5dbAFy7gsUMAMCoW8GLm0P70zLlMXkgJzLdzwdgjD0
         6kDvJh73/+fxNf3YLonMIOChoCfU2Nvc1oES8GjRA6M9cWHRmp6nzATvxVyeEjTceonq
         slwYls+lQxyzo4rlf4kU+sWlCeR5yS8gxcK9Adhq0/IS555ETKFESGIXYHp0Ol285pJK
         5n5GYppGkWtDM3y6I+tYpgRC0uzHkry/bbmVclBZPj+wKwKVHhuApTJul0yllCLaWh6J
         u5sg==
X-Forwarded-Encrypted: i=1; AL+hErGHbgQCWuL42Uas8SV/9BoWgU/xYwh2ynpVV5SD7tbh0tAcA3SfyE5oRawY1WZNOOpZP3Nd7dqWStbAK0E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+sXHLf/0qnKSy5toNl8SUpT5o4ER+4H1l2HBrJEeZ7vHy8YtLB
	Ws52NzT2oMIctmeFJRa5SbxeYwQtR4mEoLUmkA1bjR4wOwBLSRz83xYTv7RLMR8gWcL3bpe5rHE
	GMWb+2K5ilNkur+hovSHeTkEh0ue5t7K6of63a37RaBkuPPeLHUIIlLdiQc4dIA7BHYY=
X-Gm-Gg: AYBFou35Q0s1PUT7Y/4NIXlALh1CP+7Z5I+Amr5P6CQRMu3r9Ky+QTd0NhlnjvGy33H
	40ndXeEbk91Tm3oRytWB7tCbUegEnAzhbQTqt4Qghd4gCKAEQo85CMmD18gnQgHYyvJ0302H/CY
	JgSxQP3svCeGZTp8JdM3ZsbS2HEqPJ83I5Idgzs3GMZKtb50QRtZRnG4thhoF80W/WUHu0wja+e
	oE7zLBQbNdZTR8fH1GKfvU9kJK8t99Yih/Ls8oyTz6gsHDd+FnF/jdgEqBWD5KnxgvkFgHROBAL
	TYzBY7x+dCjWnSNvagGqhdl5gR4M1Gql4ssrJLGBysYuKklvyJ0zMX2JYOAP0hoRDL/NJXM2txM
	hL0RNOCbg2Gn+W8GyHSIeHVBFhCURZYiogzL9BM8d9Vy5VRQmbwlRfNcU0rvL+XclkCp4lV5V6o
	VsnkS4CqKz3mwS47kMM3cClWo0v7FrNc1x+yMEqBPvtV3rg0dWQzwqujquO1aiwq8=
X-Received: by 2002:a05:6102:604a:b0:7d0:5688:f511 with SMTP id ada2fe7eead31-7d2db157523mr740251137.16.1794220480064;
        Mon, 09 Nov 2026 02:34:40 -0800 (PST)
X-Received: by 2002:a05:6102:604a:b0:7d0:5688:f511 with SMTP id ada2fe7eead31-7d2db157523mr740246137.16.1794220479561;
        Mon, 09 Nov 2026 02:34:39 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49597371cc4sm8835752f8f.36.2026.11.09.02.34.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:34:38 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 09 Nov 2026 11:34:36 +0100
Subject: [PATCH v2] gpio: mvebu: fix sleeping-while-atomic in
 mvebu_gpio_level_irq_mask()
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
Message-Id: <20261109-gpio-mvebu-sleeping-while-atomic-v2-1-41f070421e70@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALuh8WoC/5WNSw6CMBRFt0I69hHaRgiO3Idh0M8DXkIptlA1h
 L1b2YGTm5w7OGdnEQNhZLdiZwETRfJzBnEpmBnVPCCQzcxEJWrOqysMC3lwCfUGcUJcaB7gNdK
 EoFbvyIDUskdbibZvNMuaJWBP7zPx6DKPFFcfPmcx8d/7hzxx4CCVbbTmpkVZ332M5XNTk/HOl
 XlYdxzHF8puPC3XAAAA
X-Change-ID: 20261105-gpio-mvebu-sleeping-while-atomic-3b3fed029f7b
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Baruch Siach <baruch@tkos.co.il>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Gregory CLEMENT <gregory.clement@bootlin.com>,
        Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1866;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Hxh9rk/pCtJYsrmjhty9vdemDvcmIp/ljH/sA20N6C4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq8aG94Up3Lzad0RsvbdM4bLqJQ67FLi1v37A4t
 HGjsWMf1mWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavGhvQAKCRAFnS7L/zaE
 w5dfD/9wmmg6dH0EWa0/q5db/aolzmv+mxMBV+gKuTsTszPNTNPSrO0yByGZYJNHmrl/2XheOIb
 rYc02cscE3BTa1Uv/f96NY2kKFDwjcs++kDOMmgutOBlWO7AkZE3AQizIbJS/Kg7rZrurfsFCFM
 WDKOC4utceqbkCP3nhbJLljvNBJ4Na7tMWA74iYtuWmK1t2Nz0NfBJJyzmX7qSQCTLEztyUr6oX
 5WCQyTmgkfM8ugqL7vkmSOWpFXp4S7P4gS/PL9VXAZITSLxaNa6nGBTGdDVgAxYs5w2bwLpiwdy
 kpbsLMKsK1WLuKiXm32r3wC/bMWBqiSvRauRx3cwUSReFmzQSLfL6l51X4FawWYquIVPclvqox5
 tDsdJEe/c4Q9bmFnb0qx05nysgz5TEhMo9ZyzuNw81NSuMrZt4afnEsRX9aNQP5whobx4D9LFu6
 wWBEvkizh7bA6vbcI0mdsW7ePlyJOj2sKqRopEMLS0+5moq4HhQhLlAZ3gezDg6YyG4yHE49ZPE
 kPVs/82P+wdnAOslA9OvhhQg20SMFUrQkqsI29USztbcya0YmouW9BtgG3sGZQgGtL45ujD94dN
 Q02MCjkxXRtpRPuwzAFkjimjAChP+KInK+Gbc1akAN9+88UD7NrY1sZQdMA+xfo/02eZYgQVII7
 O0sqgQ7uRiFyReA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA0MiBTYWx0ZWRfX2lxCISAu162q
 Snltld92a2SrTUD5TnzBgD1o0V2B9U+SVzXJ1l5eiUnlLpyqoydEb18izVLlblnp8LQRtbkobrr
 ZOhFPXYEGEPKlfyT3PHI1ChnYDcpejf3PVBmklu3kc8nrJ7pthKDPZcG4hDaiwqxBzIVDEeVKh2
 wA211rGM/oFFncUdzy4D1Oa9sgKNhet0BxHjpnIYraBErx+Xx/3v9vZsQaTU7cakGTzLKvTJV5h
 C95iAK3YPoGkip4+Dop0qfnlc70gdynuoz0ebxePZEV+8u55P+qm+a8N+0zS0HIgeN13x7THCn4
 2O6kx6Wth8nuPs9xm2tbr0j37FYTK0IwAfsKawzp9eoUWKh+pUFDPLYBNFfPhkZyO0b1KUREbqT
 3A6UB0Jpwrw8I9MfJWwdlbJaFO639dVPnrkCRdl7JZo2aaVzzgROmJI3OHPPVZtksv3qoLXXSaP
 05j293QkQbNFXMOB47g==
X-Proofpoint-ORIG-GUID: DFenF4QvJHCy7Gp3P3t-WrSemtfCrK6P
X-Proofpoint-GUID: DFenF4QvJHCy7Gp3P3t-WrSemtfCrK6P
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA0MiBTYWx0ZWRfX9hbQkJmw+4yx
 YOFk8IR6EfVfpI9Hs1o0un8FQAZ74wLPA+7qPGXsnwxsbs+q1UxiGoxK3JpgIclFizpoMlOQzSb
 k/UDbr9AEdGLPGh2hDyuxQL7MUXEOzE=
X-Authority-Analysis: v=2.4 cv=C9V8WgP+ c=1 sm=1 tr=0 ts=6af1a1c1 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=c92rfblmAAAA:8
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=H-Sc7SN9zJm5jhqahJIA:9
 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22 a=GvGzcOZaWPEFPQC_NcjD:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090042

mvebu_gpio_write_level_mask() is called with a raw spinlock taken but
the underlying regmap uses a standard spinlock which can sleep on
RT_PREEMPT kernels. Add the .use_raw_spinlock attribute to the
appropriate regmap config.

Cc: stable@vger.kernel.org
Fixes: 2233bf7a92e7 ("gpio: mvebu: switch to regmap for register access")
Fixes: 4d305c227312 ("gpio: mvebu: name regmaps to fix debugfs collisions")
Closes: https://sashiko.dev/#/bug/linux-6bee0c4f-384c-494c-868e-07c420195d13
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- Also set .use_raw_spinlock in mvebu_gpio_percpu_regmap_config
  (sashiko)
- Reference earlier commits (the actual culprits) in Fixes: tags
- Link to v1: https://patch.msgid.link/20261105-gpio-mvebu-sleeping-while-atomic-v1-1-3ad7bb1c9e36@oss.qualcomm.com
---
 drivers/gpio/gpio-mvebu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 267e6d5bacd0d1c9de0ebb7e21233bc9e2cd3bad..92ce02441cc9923c51b3d2ec9c74578a0a5e859c 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -603,6 +603,7 @@ static const struct regmap_config mvebu_gpio_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
@@ -610,6 +611,7 @@ static const struct regmap_config mvebu_gpio_percpu_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
+	.use_raw_spinlock = true,
 };
 
 static const struct regmap_config mvebu_pwm_regmap_config = {

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261105-gpio-mvebu-sleeping-while-atomic-3b3fed029f7b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

