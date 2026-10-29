Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793277173;
	b=OkkyW+3Mkk2jNYt8KxdAR9VO7z/C7zHVqQZucB1Xsc1DQr/590MbOoy7QpOwSD1MlBVn
	 Pp1e0Ls0eSlIvEIm9g7MP3xzTBKpTKhpGG8qjWlEly3CR82lupzEa+Z/P+eIsGyg0jeWR
	 JaijBr7s8qkc6YLOyM3ZAj3IHhT53cmVIL2cHvn9qlX8POTTLtfdfg9FvBX04sWnL+5c1
	 5uezE6b9kU8vZodANQTVFTM3Dl95UvEXcsGFrh4E2s1vVxPBJ7swmh04gafC/ryrJgety
	 4d/zG8HMAs2QoK63uwql0+jJQssoUqRd2y+THOVWOYjCy/4smzeli+YzDo/8Vbu0qog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793277173;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Tg3R13sknH4kBiLkdZSxbk4Ng4+LLPOpweq6+Jw9GaU=;
	b=SuVB60LHdFaJiqRKnTLz+Prw5OxSEbG1q+6Xjyyt6ebro4Fj9aDgACeRTpBC5Ntztnkg
	 2dA/UKKAW1WdV4etZxi/Tl5zrHkvFYMBXmeqmvN6QtPHvdYeVBbP50ogMjLCp4bNBTRO1
	 wDk4wsD3mEE3/ZCkHVgOC2t0ST546WBqRh0okaYfZbyibWVwlVfdTHqNsx91u6tX09d6Y
	 X1tN+oeCWSHXOTg/f9PNLxRiLHClQxQswtCQpq3W+KSb0cXWMu3Kiku1ZLd3PFZWcTN/O
	 HrwcTuWgJjj7Il4pOin8fiJG+rLggb+qDEqi+zTQG6Vw9SbIl6jYhc4/LwZiZmMac1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b="pRf/rnIy";
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB5B606A31E;
	Thu, 29 Oct 2026 12:32:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4DB5B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=pRf/rnIy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=Tg3R13sknH4kBiLkdZSxbk4Ng4+LLPOpwe
	q6+Jw9GaU=; b=pRf/rnIy4LeIUW3561wiAS2tbbl4dSixwn49ME3OlwM99hxDI/
	QViAkwolNRP5gwnlyxwpsh1JDho4joeoUcA5NaCiQHx5Eb5968+/D1+WwEOWq6mA
	Y0BIIE2KpCEARGyNoL+zZlPTPEf/T+FcVkz9oZyMKPkRqrdGE9IBPCiCc=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.224.240])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCnHjPmPONqmPdgAA--.889S4;
	Thu, 29 Oct 2026 20:32:39 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Taniya Das <taniya.das@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] drm/msm/mdss: reset all block resets described in DT
Date: Thu, 29 Oct 2026 20:32:37 +0800
Message-ID: <20261029123238.29877-3-xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
References: <20261029123238.29877-1-xiaqinghuan@mail.ustc.edu.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:3pYKCgCnHjPmPONqmPdgAA--.889S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZF1ktrWDur47Gr17Kry7GFg_yoW5GF4kpF
	s8Ja4ayr4qga1fZa1jy3W8uFyFk393KryUGwsxG34UA3W3J3yrJr9rKFW5tFWDJFyxAF90
	yFsxGFWruF1qyrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUXwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7
	CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6ryUMxAIw28IcxkI7VAKI48JMxC20s026xCa
	FVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_Jr
	Wlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I
	6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r
	1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1U
	YxBIdaVFxhVjvjDU0xZFpf9x07bOyCAUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREPB2riTVZTsQBRs4

msm_mdss_reset() acquires only the first reset listed in the MDSS
device node.  Platforms can describe additional MDSS block resets: the
SM8750 display clock controller provides resets for the MDSS core INT2
interrupt controller and for the MDSS RSC, which can be left out of
reset together with the MDSS core when the bootloader hands over with
the display block still running.

Switch to the reset control array API so that every reset listed in the
device node is asserted and released as one group.  Devices without a
reset in DT are unaffected, and for devices describing a single reset
the assert/deassert sequence is unchanged.

The resets are driven from the display driver rather than from the
display clock controller: the clock controller supplies the MDSS clocks
and power domain, so it probes first and has already programmed its
PLLs when MDSS probes.  The block resets do not touch the PLL registers
and no display pipeline is running yet, so the PLL configuration
survives the reset.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 drivers/gpu/drm/msm/msm_mdss.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 9087c4b290..59343987bc 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -306,11 +306,22 @@ static void msm_mdss_destroy(struct msm_mdss *msm_mdss)
 	irq_set_chained_handler_and_data(irq, NULL, NULL);
 }
 
+/*
+ * The MDSS block resets are driven from the display driver, not from the
+ * display clock controller: the clock controller supplies the MDSS clocks
+ * and power domain, so it probes first and has already programmed its PLLs
+ * when MDSS probes.  The block resets do not touch the PLL registers and no
+ * display pipeline is running yet, so the PLL configuration survives the
+ * reset and nothing visible can glitch.  Bootloaders that hand over with
+ * the display block still running (PLLs locked, blocks out of reset) are
+ * returned to a known-zero state before any display hardware is programmed.
+ */
 static int msm_mdss_reset(struct device *dev)
 {
 	struct reset_control *reset;
 
-	reset = reset_control_get_optional_exclusive(dev, NULL);
+	reset = devm_reset_control_array_get(dev,
+					     RESET_CONTROL_OPTIONAL_EXCLUSIVE);
 	if (!reset) {
 		/* Optional reset not specified */
 		return 0;
@@ -327,8 +338,6 @@ static int msm_mdss_reset(struct device *dev)
 	msleep(20);
 	reset_control_deassert(reset);
 
-	reset_control_put(reset);
-
 	return 0;
 }
 
-- 
2.53.0

