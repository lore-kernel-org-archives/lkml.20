Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002530;
	b=CTMrBgztC5JoDP8YeqRcSXulGWcgYYP4MSA2ZR7lkc0WQe6vCv+K140DLENvJ5vWAsUu
	 YzdAgdOTjbj94Y1rir0ELNd3QEmwcB02nWlwggzqY+7mRhYx7eMNUsdJd8elbIrFa6ILQ
	 AXCbHVBU95sJyYjeDgt0fAKomMiD6xXp0rzM98FfRI8HzThI74lwEQAxHeG3SPLBf7sUR
	 ByHZFUXqqw6UTOoA0ap3e2FUzr1OSdE4cjluixuY6ka2J7KvcRiHIWlXnwPoVb1rOcWcQ
	 IWAQqIxDKkx3VT1S2gLqWIqjUM9rzpsjf9i8HBWMdDasM6gSnOZ0jdOoRU8/CY4PZIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002530;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=os4cEGwPPt1N08Ne8yald4bSa5w/m28OgTrW3y2BZsI=;
	b=Nsu3OHi0mDEFJaE4nIJT75Vvs+gVD/lDrOLmdu8/FnKtIv8sLJX2ThdunIOnjIs59gcL
	 JRsfPlM2fs8NjkaqZa8kG/cS8pLPQAbP4MkyKEXxy3a6kjvbM9BsX7zA4/aDWK6lQmZ4Z
	 2680+M8I9GjLwxvPdKYZXQBBMSOShqxECvyMst58jbL+kRglz2I6MCBmAxSkNeWHGm3AK
	 IJ9d4Mv2eKtBhomPgGmcAH7d5L7v6etJa7DMG1om6G0r1wj9ECuPqux92vaFgRvt178+d
	 cSpUTzgdT80IMTqhR9ogh7Fxa2WZO5G7f7XM2t80V5V1wrkRoUbvI4JMrxYFZNEa53A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QQSPvdWh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuCfREKd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAE4606A338
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 22:02:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BAE4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QQSPvdWh;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XuCfREKd
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Ii5jA3676719
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 22:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	os4cEGwPPt1N08Ne8yald4bSa5w/m28OgTrW3y2BZsI=; b=QQSPvdWhrmDnutuU
	BGyf3hNq2jgxllGfhw42Gb95fN3Z5ylNbD5kFhI9imW6gWdeRw1+Rgujw5mjc2uG
	SJAGDFByXOHFHaUsFBoEzASKwSKwmF5zml21eWl0RC8/X7WFv7DELHJbXHTQ1N7f
	YwaLr+a+P79dlFnEmtpPBm5Znu+N9iIXbp79mT71AxBgNn2hDyUn7SC46ACEnWhq
	wM+lundcQ0aNuOow6xvDHvDk40Kf4ee99+AKQcraHsoLrfqu9S+IccdJHy4MEApa
	YapDUQ7+vw66uABCZAh2+brAUuHz/EdA50q0YW/vb4afOfpdGQhjtoU+CYlxH996
	PwfpOg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmeb0nux-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 22:02:08 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac1e41c2aso318002e0c.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 14:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002528; x=1794607328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=os4cEGwPPt1N08Ne8yald4bSa5w/m28OgTrW3y2BZsI=;
        b=XuCfREKdv+9PRJZRMBCHov5XdYddZDEUAKscrBIfAG5EEAlBmrC3kQOPf4SYCOOHqE
         fpk76b1GW2xs9Davr7V0K5nwLXBzmNAwvVKSZvwom7fLZuIiMhIOKYrJQO1gKVdChV3c
         I/r7ormNedacp8xJqcLaVlcrLQYS6tWdx1YuvPHWd4/GqpgHgdGRdsmD43L3ASGxgiR+
         U73eW6tyPPxNt1vkqhIeByam12S+qd/5z+g8Jr21YIl0DfBBX3wBO4rfZ8txd83b6U7S
         eA9sLHZ1FzM1nZedDu7LnS/jdyUBx5p1LDvvGdXF4+x3TufpmSKwkltdcjzmSDnI9l4T
         bMfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002528; x=1794607328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=os4cEGwPPt1N08Ne8yald4bSa5w/m28OgTrW3y2BZsI=;
        b=bDiLC+DNCfqNOzDfqGDCUSyLXlYf9djDbvnaUrYt+ILUaQqydSITSCSHCaZZqpJEso
         UHdaJovycDPveIHDDMAKrxWOn5pdw+0+Xm/bCS6tScEI1x1rLY6M9M4GzvmtPoLVW8JI
         nd6OTDGmmwOSua4OZnUYB6dhEZhHD0Ohuat8DNQLCq2rbECKQ+dOteDC7dzAW7iecCly
         TVIGj8GqWH7NxLVzYDSdmbnsqyb2+Ot+NjF38L1uW+PEjB6txxrzGCgDRC462lbJXz4e
         NsJBJNtrxkXPIMQx/b9tX1wnWWZAYlfxxQVUoE2xT1g9vRG6di1RsLDnh0CHWjshNkmj
         PRMg==
X-Forwarded-Encrypted: i=1; AL+hErHtolCJZ9YmbPpoPbMIPvKnEjUEOh0lzKKRw0+I+rwLgUrXQ8KK+Bdms85YSAqXCi6czHereDsdHWD6PwQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5AurpB4asYr+E0Nqlkcjky+mNeyVSxEXD3IRfUzWqseIjK3j9
	+5zKdUqKV6paMclrDywua1c0MWHuIZevh8Rxy3wZyuFUg2pG38RFrAdqF1NlSfgr9yeMbTse0Um
	t9l3uLPT8Lz48Beqdi4/nllTXNAhKUfnM8lJuo9Awo7Yuhd+cGHhCQr8xgcuuNJNh17w=
X-Gm-Gg: AYBFou0NivmQ/5KZc36VtsfI5ttnHf1z1AhRmF211Fe6XSDb/lvk03V9AwnXzPDod4z
	3f0mOP7tetkbNfnbdk5mgkeT6M+rgR8yhcl8eYy0opWoMzfarsq0RGqybQInvBrKz6ifp3WCXUs
	kmW7XKsbkD6wfrIhwtY6y3QV9LOWpTQAfonYFNKxUC7wU/dH1sWt6iA1g9yM6Qn13J1hlGh9HsY
	RuC1n/76isvC7wUkwikgi+r8sFvnM7pD6TmdxL1a0uCiCdpZZu6zFuFbgRMxCxhu9m2WvYERGkV
	nXy9q55K/PiXieYVoAF4mEJIPkZNezy9pUhxVXr2GqPOqdHEgKkKC4MH6WzFwVB3HyXLmRo2Cgh
	zxiajznkg+wuvDRc8A0JzZPqEap4evI6WuqSdGesE8asiqK3Y1Cu+0aLEJw==
X-Received: by 2002:a05:6122:3b85:b0:5ea:7126:38a7 with SMTP id 71dfb90a1353d-5ecc43fc0a3mr1848602e0c.13.1794002527394;
        Fri, 06 Nov 2026 14:02:07 -0800 (PST)
X-Received: by 2002:a05:6122:3b85:b0:5ea:7126:38a7 with SMTP id 71dfb90a1353d-5ecc43fc0a3mr1848574e0c.13.1794002526668;
        Fri, 06 Nov 2026 14:02:06 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:06 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 00:01:53 +0200
Subject: [PATCH 2/3] platform: arm64: lenovo-thinkpad-t14s: Add Gen 7 EC
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
Message-Id: <20261107-t14s-gen7-ec-v1-2-f4a8edaac447@oss.qualcomm.com>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10522;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5dKibAZ6ZU3lOFr8AXr6g4jUHc5T82QMjNnpp1/dj9E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5W9iy/CyUEQqguIS7cUzSqqipMdRFJo54VM
 jOUvUgsCBWJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVgAKCRAbX0TJAJUV
 VpU4D/wKUXGRs8sNtSf8r7xrnms9dRnWoV7fWoIYR0LN1Gx7N8Vz3uMVgeYeWLRXM/fSgVdEwBh
 TjTFopTpzXE6XTGiHZLVPhpJhPRFlNCxgOwQ6nqOBC4ciL7qemjLS+HeUdXEpenf1in06G58ePi
 G7n5+57HegABB9wsGQFizyCqPXU8GABN9NVzblO8HaMx/JCtPj6AGWe/OBovEWYO+JrvHy+++LP
 b95ZydkB6ALcbXAqqqm5DA59dEV9TahUXpgZlYKPs1rYTv2KQe1I0blEWgLGiLcdS2D4ERoLdrK
 vTAmqBXprkq0597zJ2qq316K4kVYuxxXmb+bej7W302rUu5rC/8cbMtHbWBnIV5xI8+uwEq2e3t
 GxiNkAjjqz+TyP/+VEld4iqDBCvCwnurY1Xw7R54Pk9G79EZBnV+QkmAFE1MPA6YyOWObaWQ2/6
 KJc4EqgxKMcj+1Np2dkQy2cfbvA16ATq6bSUvULVIvK6RU5SSA9m0svGa29jrfjTh6VkWx/HEvR
 HJfIIFhvLB89SFetKxSa90V0lADm1uRZJPES0SkJENfuqkRquLuJ7GyoyxRbjj5q9j0sdmqHqXv
 FgrdwGNvgkmK/pVqxV1Vew4d+6JkF7linrAEYdmipz+JBDafTaDdHdMWubMZAB8msFWPTy8S3QB
 aMCo1PmrODiRpyw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: VgVYi7Awfcalv609U4SGMe_dclLJOCCH
X-Authority-Analysis: v=2.4 cv=DOAacCNb c=1 sm=1 tr=0 ts=6aee4e60 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=sthCoXyZjc845R8Nhh4A:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX5V7YIkdm6rdo
 4lc6geenOX2hN0q7u5mn08R6jYByNDuhHQW70JxNlXT1Akp6MsJK1YsnTYAkoXnAPIlYiAl3TYR
 6Ygzgs0Cg6d7dcC4miScvgyNXrirlGM=
X-Proofpoint-ORIG-GUID: VgVYi7Awfcalv609U4SGMe_dclLJOCCH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfXzFXhe3Ah0Qfd
 yhqmxztLXknEqLGAmkyPcVU8bSyvI62+DUZGyUaoBC4pQMqZlGiF1DvVeiEFDvYyaizWepECr8g
 fbi7Ji7KhyN9OiEEyAVKTsHn0buLSMmz272GTcujD399NjdJNsjHX1jTge3L5hKRtS4Q+7dzX27
 9WNpyrz7R5ijO7e6pVX0xAJKmcxCMS0jqhL2Dfb3kwxaZv9DZm160/neCmuxNkYifpqGdS0Hj7R
 wcJk0OmjJkI342tEVC2jLYv+L2g5ojRA78eqGlC39ZmzQh/nXbWqliKR6BrDW6p5RhK3PWuEnJD
 BU0X6DoRl1Y0snfJsqaHqsMcwNp63hVy2iuvO9QBRs86zuPMR9aiecXCmFzgDhiP92PnhJYklSa
 kxLq62Y7mm13a26BJww2F/xNyAG3lzCVr9uywmg2wbCPw4EFzo5dbrZS1vtbAzetb2Wi6BtzQu8
 aYVt8YYAOwK/McDWTrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060087

The embedded controller of the ThinkPad T14s Gen 7 uses the same
register layout and event codes as the Gen 6 one, but a different set
of I2C commands. Going by the ACPI EC accessors in the Gen 7 firmware:

  - register read:  write {0x80, reg}, then write {0x80} + read 1 byte
  - register write: write {0x81, reg, val}
  - event read:     write {0x84, 0x00}, then write {0x84} + read 1 byte

With the Gen 6 commands the EC never reports any event and the LED
and keyboard backlight accesses have no effect.

Describe the bus accessors and event read per variant and add one for
the Gen 7. The Gen 7 firmware does not use the second keyboard backlight
register or the modern standby register, it drives the mic mute LED as a
generic LED (id 0x0e) instead of a bit in the audio register and, when
the keyboard backlight is cycled with Fn+Space, it also reports 3 for
the high level, so handle those differences too. Also handle the Gen 7
only events as known ones.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/platform/arm64/lenovo-thinkpad-t14s.c | 176 ++++++++++++++++++++++++--
 1 file changed, 166 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/arm64/lenovo-thinkpad-t14s.c b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
index 7a875877c8f3..b488b85bf7c0 100644
--- a/drivers/platform/arm64/lenovo-thinkpad-t14s.c
+++ b/drivers/platform/arm64/lenovo-thinkpad-t14s.c
@@ -17,7 +17,9 @@
 #include <linux/interrupt.h>
 #include <linux/leds.h>
 #include <linux/lockdep.h>
+#include <linux/minmax.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
@@ -26,6 +28,15 @@
 #define T14S_EC_CMD_ECWR	0x03
 #define T14S_EC_CMD_EVT		0xf0
 
+/*
+ * The Gen 7 (Snapdragon X2) EC uses a different command set over I2C, as
+ * described by the ACPI EC accessors in its firmware (RDEC, WREC, QEVT).
+ */
+#define T14S_GEN7_EC_CMD_RD	0x80
+#define T14S_GEN7_EC_CMD_WR	0x81
+#define T14S_GEN7_EC_CMD_EVT	0x84
+#define T14S_GEN7_EC_LED_MIC_MUTE	0x0e
+
 #define T14S_EC_REG_LED				0x0c
 #define T14S_EC_REG_KBD_BL1			0x0d
 #define T14S_EC_REG_MODERN_STANDBY		0xe0
@@ -67,6 +78,15 @@
 #define T14S_EC_EVT_KEY_FN_F11			0x7a
 #define T14S_EC_EVT_KEY_FN_G			0x7e
 
+/* Gen 7 only */
+#define T14S_GEN7_EC_EVT_HKEY_1017		0x1c
+#define T14S_GEN7_EC_EVT_STATUS_35		0x35
+#define T14S_GEN7_EC_EVT_DYTC			0x3c
+#define T14S_GEN7_EC_EVT_STATUS_40		0x40
+#define T14S_GEN7_EC_EVT_STATUS_4B		0x4b
+#define T14S_GEN7_EC_EVT_STATUS_4E		0x4e
+#define T14S_GEN7_EC_EVT_HKEY_1016		0x76
+
 /* Hardware LED blink rate is 1 Hz (500ms off, 500ms on) */
 #define T14S_EC_BLINK_RATE_ON_OFF_MS		500
 
@@ -93,9 +113,24 @@ struct t14s_ec_led_classdev {
 	struct t14s_ec *ec;
 };
 
+struct t14s_ec;
+
+struct t14s_ec_variant {
+	const struct regmap_bus *regmap_bus;
+	int (*read_evt)(struct t14s_ec *ec, u8 *val);
+	/* EC has the second keyboard backlight and the modern standby registers */
+	bool has_kbd_bl2_and_standby;
+	/* mic mute LED is a generic LED (in T14S_EC_REG_LED) and not a bit in T14S_EC_REG_AUD */
+	bool mic_mute_led_generic;
+};
+
 struct t14s_ec {
 	struct regmap *regmap;
 	struct device *dev;
+	const struct t14s_ec_variant *variant;
+	/* serializes the multi-message Gen 7 EC transactions */
+	struct mutex xfer_lock;
+	enum led_brightness mic_mute_cache;
 	struct t14s_ec_led_classdev led_pwr_btn;
 	struct t14s_ec_led_classdev led_chrg_orange;
 	struct t14s_ec_led_classdev led_chrg_white;
@@ -206,6 +241,85 @@ static int t14s_ec_read_evt(struct t14s_ec *ec, u8 *val)
 	return ret;
 }
 
+static int t14s_gen7_ec_cmd_read(struct t14s_ec *ec, u8 cmd, u8 arg, u8 *val)
+{
+	struct i2c_client *client = to_i2c_client(ec->dev);
+	u8 req[2] = { cmd, arg };
+	struct i2c_msg msgs[2] = {
+		{ .addr = client->addr, .flags = 0, .len = 1, .buf = &req[0] },
+		{ .addr = client->addr, .flags = I2C_M_RD, .len = 1, .buf = val },
+	};
+	int ret;
+
+	guard(mutex)(&ec->xfer_lock);
+
+	ret = i2c_master_send(client, req, sizeof(req));
+	if (ret < 0)
+		return ret;
+
+	fsleep(5000);
+
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret < 0)
+		return ret;
+
+	return ret == ARRAY_SIZE(msgs) ? 0 : -EIO;
+}
+
+static int t14s_gen7_ec_write(void *context, unsigned int reg,
+			      unsigned int val)
+{
+	struct t14s_ec *ec = context;
+	struct i2c_client *client = to_i2c_client(ec->dev);
+	u8 buf[3] = { T14S_GEN7_EC_CMD_WR, reg, val };
+	int ret;
+
+	guard(mutex)(&ec->xfer_lock);
+
+	ret = i2c_master_send(client, buf, sizeof(buf));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int t14s_gen7_ec_read(void *context, unsigned int reg,
+			     unsigned int *val)
+{
+	struct t14s_ec *ec = context;
+	u8 result;
+	int ret;
+
+	ret = t14s_gen7_ec_cmd_read(ec, T14S_GEN7_EC_CMD_RD, reg, &result);
+	if (ret)
+		return ret;
+
+	*val = result;
+	return 0;
+}
+
+static const struct regmap_bus t14s_gen7_ec_regmap_bus = {
+	.reg_write = t14s_gen7_ec_write,
+	.reg_read = t14s_gen7_ec_read,
+};
+
+static int t14s_gen7_ec_read_evt(struct t14s_ec *ec, u8 *val)
+{
+	return t14s_gen7_ec_cmd_read(ec, T14S_GEN7_EC_CMD_EVT, 0x00, val);
+}
+
+static const struct t14s_ec_variant t14s_ec_variant = {
+	.regmap_bus = &t14s_ec_regmap_bus,
+	.read_evt = t14s_ec_read_evt,
+	.has_kbd_bl2_and_standby = true,
+};
+
+static const struct t14s_ec_variant t14s_gen7_ec_variant = {
+	.regmap_bus = &t14s_gen7_ec_regmap_bus,
+	.read_evt = t14s_gen7_ec_read_evt,
+	.mic_mute_led_generic = true,
+};
+
 static void t14s_ec_write_sequence(struct t14s_ec *ec, u8 reg, u8 val, u8 cnt)
 {
 	int i;
@@ -318,6 +432,9 @@ static int t14s_kbd_bl_set(struct led_classdev *led_cdev,
 	if (ret < 0)
 		return ret;
 
+	if (!ec->variant->has_kbd_bl2_and_standby)
+		return 0;
+
 	val = FIELD_PREP(T14S_EC_KBD_BL2_MASK, brightness);
 	ret = regmap_update_bits(ec->regmap, T14S_EC_REG_KBD_BL2,
 				 T14S_EC_KBD_BL2_MASK, val);
@@ -338,7 +455,11 @@ static enum led_brightness t14s_kbd_bl_get(struct led_classdev *led_cdev)
 	if (ret < 0)
 		return ret;
 
-	return FIELD_GET(T14S_EC_KBD_BL1_MASK, val);
+	/*
+	 * When cycled with Fn+Space, the Gen 7 EC also uses 3 for the high
+	 * level, which looks the same as 2.
+	 */
+	return min(FIELD_GET(T14S_EC_KBD_BL1_MASK, val), 2);
 }
 
 static void t14s_kbd_bl_update(struct t14s_ec *ec)
@@ -383,6 +504,9 @@ static enum led_brightness t14s_mic_mute_led_get(struct led_classdev *led_cdev)
 	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
 					  led_mic_mute);
 
+	if (ec->variant->mic_mute_led_generic)
+		return ec->mic_mute_cache;
+
 	return t14s_audio_led_get(ec, T14S_EC_MIC_MUTE_LED);
 }
 
@@ -391,8 +515,19 @@ static int t14s_mic_mute_led_set(struct led_classdev *led_cdev,
 {
 	struct t14s_ec *ec = container_of(led_cdev, struct t14s_ec,
 					  led_mic_mute);
+	int ret;
 
-	return t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
+	if (!ec->variant->mic_mute_led_generic)
+		return t14s_audio_led_set(ec, T14S_EC_MIC_MUTE_LED, brightness);
+
+	ret = regmap_write(ec->regmap, T14S_EC_REG_LED,
+			   T14S_GEN7_EC_LED_MIC_MUTE |
+			   (brightness ? T14S_EC_LED_ON : T14S_EC_LED_OFF));
+	if (ret < 0)
+		return ret;
+
+	ec->mic_mute_cache = brightness ? LED_ON : LED_OFF;
+	return 0;
 }
 
 static enum led_brightness t14s_spk_mute_led_get(struct led_classdev *led_cdev)
@@ -478,7 +613,7 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	int ret;
 	u8 val;
 
-	ret = t14s_ec_read_evt(ec, &val);
+	ret = ec->variant->read_evt(ec, &val);
 	if (ret < 0) {
 		dev_err(ec->dev, "Failed to read event\n");
 		return IRQ_HANDLED;
@@ -553,6 +688,16 @@ static irqreturn_t t14s_ec_irq_handler(int irq, void *data)
 	case T14S_EC_EVT_KEY_FN_D:
 		dev_dbg(ec->dev, "FN + D - toggle privacy guard mode\n");
 		break;
+	case T14S_GEN7_EC_EVT_HKEY_1017:
+	case T14S_GEN7_EC_EVT_HKEY_1016:
+	case T14S_GEN7_EC_EVT_DYTC:
+	/* Status events the Gen 7 firmware does not act upon either */
+	case T14S_GEN7_EC_EVT_STATUS_35:
+	case T14S_GEN7_EC_EVT_STATUS_40:
+	case T14S_GEN7_EC_EVT_STATUS_4B:
+	case T14S_GEN7_EC_EVT_STATUS_4E:
+		dev_dbg(ec->dev, "EC event 0x%02x\n", val);
+		break;
 	default:
 		dev_info(ec->dev, "Unknown EC event: 0x%02x\n", val);
 		break;
@@ -572,9 +717,17 @@ static int t14s_ec_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	ec->dev = dev;
+	ec->variant = i2c_get_match_data(client);
+	if (!ec->variant)
+		ec->variant = &t14s_ec_variant;
+
+	ret = devm_mutex_init(dev, &ec->xfer_lock);
+	if (ret)
+		return ret;
+
 	i2c_set_clientdata(client, ec);
 
-	ec->regmap = devm_regmap_init(dev, &t14s_ec_regmap_bus,
+	ec->regmap = devm_regmap_init(dev, ec->variant->regmap_bus,
 				      ec, &t14s_ec_regmap_config);
 	if (IS_ERR(ec->regmap))
 		return dev_err_probe(dev, PTR_ERR(ec->regmap),
@@ -618,8 +771,9 @@ static int t14s_ec_suspend(struct device *dev)
 
 	led_classdev_suspend(&ec->kbd_backlight);
 
-	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
-			       T14S_EC_MODERN_STANDBY_ENTRY, 3);
+	if (ec->variant->has_kbd_bl2_and_standby)
+		t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
+				       T14S_EC_MODERN_STANDBY_ENTRY, 3);
 
 	return 0;
 }
@@ -628,8 +782,9 @@ static int t14s_ec_resume(struct device *dev)
 {
 	struct t14s_ec *ec = dev_get_drvdata(dev);
 
-	t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
-			       T14S_EC_MODERN_STANDBY_EXIT, 3);
+	if (ec->variant->has_kbd_bl2_and_standby)
+		t14s_ec_write_sequence(ec, T14S_EC_REG_MODERN_STANDBY,
+				       T14S_EC_MODERN_STANDBY_EXIT, 3);
 
 	led_classdev_resume(&ec->kbd_backlight);
 
@@ -637,13 +792,14 @@ static int t14s_ec_resume(struct device *dev)
 }
 
 static const struct of_device_id t14s_ec_of_match[] = {
-	{ .compatible = "lenovo,thinkpad-t14s-ec" },
+	{ .compatible = "lenovo,thinkpad-t14s-ec", .data = &t14s_ec_variant },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7-ec", .data = &t14s_gen7_ec_variant },
 	{}
 };
 MODULE_DEVICE_TABLE(of, t14s_ec_of_match);
 
 static const struct i2c_device_id t14s_ec_i2c_id_table[] = {
-	{ .name = "thinkpad-t14s-ec" },
+	{ .name = "thinkpad-t14s-ec", .driver_data = (kernel_ulong_t)&t14s_ec_variant },
 	{ }
 };
 MODULE_DEVICE_TABLE(i2c, t14s_ec_i2c_id_table);

-- 
2.54.0

