Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228AF411F95
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246478; cv=none; b=K2mM1XSVtXfgXFC+Y5Kw3xWG0OjL7LfjB/esv3TV89HqrqHAIaGk9TFlu3oUqbmRSHcCGh9l/P1YfVHxLjjYlLikEHyDdhla6HGGnmPMb9kZfaEPOakh3MvNMGxXfYV+BZ/NrNdVmLTHseOTt8fjEnJNGu65j54MqRIHt7knD3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246478; c=relaxed/simple;
	bh=HpzD8eE93G0QF+A2LkG7W4+8iO6y5XPc4Rl8E5Fjv8c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kVaSOFD3ZZaE2lATcDrUQnMhQY6sgghCQOPDLB3LKd+7gyKpiIzcvwC/LAvg5q8g+A16Yd8hlZ5CcCOvdhIWQBbY30I9QN0wt+8tBQ4bRwCv33DkDnIaaQhQ5rlDUecj3XPd1S6bvGHrkYpTnUliSqOLas1Xv3H/iDq+pAumN1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HyTZOZjh; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HyTZOZjh"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc11a905ba5so510299a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246476; x=1788851276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=HyTZOZjhEQ017UXUlM0BG4rys3HI66u8MugfR80vk7d4LDMFOjzLGtF/6MwQPetVN4
         AfS6QKHjICcWPUudj687GqOtLEVcnKYzgbSBw2240b9wwmmRGs4YwIC4KX83OdUFDUSS
         MWpkemwY7H5/rfwimF5hB/8wG/s8RHVEXc5lWkK31okjELKxyK2sNTzAGeyEQaTH7Vyi
         WPRkGElwbUAYmEWMF8rTxIlhOLKIK5f2aYTacS3XtOa6xt1MIJt5Fk3E+h/0JW86skhj
         r4fG9/CqlBLcFx0+B8TbE+OLNSg9kB3C4PCrcxEoD8BrvptKF1RnAO1AnNi8epcbHs2V
         l8BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246476; x=1788851276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dCothkY1Rqth/F0B2N1+XSPKgmCrj36SkVxYCdKHFgQ=;
        b=cYs94EdPUKzDMq11NL5GsHCZT+YrWoG8GbSzkep+wah7gKARpWyO1WuiPsoCTPIDVm
         7l9F/D67ct/uWCV8XpZeIFyDVYnPldpwBMxWI7r/cDpfcX8S6ni0XU6dUXGOzJq6XRT9
         vmJ75LEElNohm4raDqxDprqcjsF3Dmt7kMiwy1Q+coFd55ur/WLYxPo6SFxipE1SjIDh
         QtyUcqTPn12QV5Ru491GbC7r11hwCS6+Io+Ach1An8tmk6jVBG2xxUvzMafNmtdA3N/o
         JTck9t2KBBAB69Jip3lZsF8nMvWvGiY4rVIND+zyPPSBh8tHdsfQp5RuXHqn5xVBc/HR
         mn6w==
X-Forwarded-Encrypted: i=1; AKwUvBzaMLaZ0qssfb26JsuoofoqA7azC8xg9/3XNp0sE/LAlPIvrRwvDb4lKQ21wn7KvGdSk1Uj7ZeWi2OTYMg=@vger.kernel.org
X-Gm-Message-State: AFuF++lQVEI9+L9oU7aDEmW0zTHZOTAYqFVWgSb0WsgS8uC2mHc68j/q
	NWHSjDg1JNBa+H0TT4yuNq0X/0y/mihyC1ur2s44dHKY0+/dv6hxSlct
X-Gm-Gg: AYBFou3b5CryZK+jSH18XIGaJbRSaEoHMieRRBnfaO9gEMj0JyKyFOKrCgGDtF2oTCn
	wNmlOSw0Sy975O+WKPy47MKWXK2l8OezSX6jb2bQF2EEqXSdLHwsqui5mGSfIwwxhsMfcGcfmr4
	Gzk3qxs50g6EeG82t0SGXBTYDTboXs8NQg9+e05AfSYK4u2xbXb7h2MZZHPnc7/CkSgV6vsTtUi
	dC+Ib258g6I2luZL8JrUjhvBf3qMAx9MwDIF4jM26XO/KPfLB8lIwvs2DiHD2qz/L4iW7IHuzKJ
	0vkGRjVi3pNUPqaZO/vF8Ep3qupRf4qp314SjgbwdKKdwF1rirynDjwfM0Din3/57hyu7ymdBEj
	0MCfPyJRE0XXc6760oDVomZ6hqX7hzY54W+yBHi3UWc7b8D9SZmdJ18uBEdGu9/C1BzL+RLUG3F
	IVW7ovW+rDyRx9862huheCF9NMvuFVbMHQqnC0EODDdrlzexR84VDP2n/z64z89U+vMIvCd3vih
	z726k6J3LZ9kbu8lQ9i0Ms=
X-Received: by 2002:a17:90b:1811:b0:398:e86b:ce14 with SMTP id 98e67ed59e1d1-398e86bcf08mr15397552a91.20.1788246473340;
        Tue, 01 Sep 2026 00:07:53 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:52 -0700 (PDT)
From: Sreeshankar K <sreeshankar0910@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	rafael@kernel.org,
	viresh.kumar@linaro.org,
	konradybcio@kernel.org,
	tglx@kernel.org,
	ulfh@kernel.org
Cc: radu@rendec.net,
	abel.vesa@oss.qualcomm.com,
	taniya.das@oss.qualcomm.com,
	danila@mainlining.org,
	davidwronek@gmail.com,
	mani@kernel.org,
	robimarko@gmail.com,
	linux@gurudas.dev,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Sreeshankar K <sreeshankar0910@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 02/12] soc: qcom: socinfo: Add SM7250 SoC ID
Date: Tue,  1 Sep 2026 07:07:07 +0000
Message-ID: <20260901070717.20513-3-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901070717.20513-1-sreeshankar0910@gmail.com>
References: <20260901070717.20513-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add SoC ID for Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 1836e226a..63ee5cd56 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -450,6 +450,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ8172) },
 	{ qcom_board_id(IPQ8173) },
 	{ qcom_board_id(IPQ8174) },
+	{ qcom_board_id(SM7250) },
 	{ qcom_board_id(IPQ6018) },
 	{ qcom_board_id(IPQ6028) },
 	{ qcom_board_id(SDM429W) },
-- 
2.43.0

