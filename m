Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36EA0479873
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 09:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254725; cv=none; b=HGYG9WgunIKJEEVG+tO6e6Sukm4KgMxAvIgr+DQI+U2ShdApF5utEx5sBPlgmaHs6kh9iHMzSCmVm5S61j3oU7WjYAWfl42oNA1Nf94S1+AFiZKJm/OBfHLFLII79n8a2HrfOwXIbKTEfvtniqXsgENGDsYbDvVv9Lpl0PKFPtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254725; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OsZUFTsmh0LnzZ1Xyto+3noQDokIX3ACaBwFt2uaXv17Z4jZqMjmmgOR03l2c+vaw4hFW/zOMxscbCHQroBi5pmBW+KeJnTcey9KPocei4Vr3LkpGx5aHIyNXnd4vNygS/zzWFyW0pEFCnHmreE/UeSamVxTgFneEY7BMGMPd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WV41PuuF; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WV41PuuF"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso5258972a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 02:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254722; x=1788859522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=WV41PuuFeYsyXk1b9gDkCZvvept+NPgbGfwNq7vmNY5NUfB1IN1R+tqm2tEBO5v6bf
         g7UPol76z2GU/PrHhb2AOsLlkL5REtm2SRLQ4boZPKb7m0SzKVqKXo1gZrzGEXyx5KXk
         STdsSWDoGVa8AXP2sYfJDASS1XoRRtwQ19za3eorBsEs4IfErBXr5ZI4WTmydv/3n3yb
         bq42BUIy0UDroNqvQ/lqEUXwG8kjbgYi5nn2qxzeimac3mX4mYnUYuoshyxekABJCrlq
         u6YDkmeXKJibA8Hkv9466DRTAop3FtowvDn3J4uD9sqJNQspO6y57MlbKZosVQns5yR2
         /7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254722; x=1788859522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=bN2m4eND3BCnpKJQOVytpTVuOY2cYT+EEuLTve3LOntfjAQ9+YdA+E9mnkHTdOUIjx
         B3paHmX/KkX9gBpH2uMz10eoVmUilruaGRAixOhkgL+VtLLeKJK23FpcX4pxuN2krMMZ
         IydzQt2FvMpHK07daC0+BAe3OLvqAr9kEcQDYQP407JcTQuU05NEP43ENAlR5X+2Y1t6
         eXr08EQ5OFAjIhiF3hKjewt0xbFe0fYNG9usLtuR5FME+xZBx7XfYyJmZ7T5BZ8yOwv7
         r2mmO7fxRvn667uMiV7sn1HWbXc7I+KU8c8mB11M1S5FyrFFo2GKwrHZ9BWE4qI0UaYe
         4MjA==
X-Forwarded-Encrypted: i=1; AKwUvBxugu3SFpV7YFGzrBu/etefHFFZ9gK9lRq64BgXrNl15K/fRASqEzeN8CBIWikHDIraLwZpIqC/PPm3vIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nHue0fUuQwPkwlWrlIvYChsQexDeQvsW44FrqiapYSfXvSobOW
	5NHNHfZWn5vof0UMHf1TKovjmZAUnPkUlgI+VDiChAq3m/voX54VxTiI
X-Gm-Gg: AYBFou2/ikAmKIa94JFeiYZ40RsDUtII/AWFCtyXG+74kNi1RlnJ/zyIvdvymFMAKuf
	PyRDeaseSRY0dQTEMItNId2IF1suaa20WQMaG3vfbvFYKfcUzdT/62kSOxgB1qMCmnei+GDZZ47
	gxRxsqgSsgE17mIohXHn/4Ai64+TnVBldukI8jETBVuAKqSGhzZMlSEJQuCQ2XOYVGcB1xMdjOQ
	xdk1V/AUIDd/HNtBvVrgLQSUNA2cPbThdkuymO8DNest4rc/9n1hNpgXmvauQMqe+LnAMJ86xBX
	Sep/nOYTqQNwBSoo13GvTazo0hO0TUQq7xgMil0mUY9Mlu8s36XP5wx32JHctBve5GOTiNAfkhj
	m5tZ256gSWyIvxPqnNs3FCXfueGIAyuIyeRztUMGypUyiUL6wy6398vKoVboUKXwpiJt1RyW+Y7
	HMDNo+ir3hjWdIs0mpdtKVVLrZrkeQmOpFF5pd3ZRHo5ZnZ3vWvmkMnFSSW6+MQpoPOi1x2atfs
	SXePBkIbcrf1+SRlOtp2pE=
X-Received: by 2002:a17:90b:224a:b0:398:de23:9af6 with SMTP id 98e67ed59e1d1-39907e0f9c1mr9051888a91.15.1788254722293;
        Tue, 01 Sep 2026 02:25:22 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b28ab0571sm30004560eec.4.2026.09.01.02.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 02:25:21 -0700 (PDT)
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
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v9 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 09:24:36 +0000
Message-ID: <20260901092447.3028-2-sreeshankar0910@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260901092447.3028-1-sreeshankar0910@gmail.com>
References: <20260901092447.3028-1-sreeshankar0910@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the ID for the Qualcomm SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 2cf433f61..b63e4a0b8 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -209,6 +209,7 @@
 #define QCOM_ID_IPQ8172			397
 #define QCOM_ID_IPQ8173			398
 #define QCOM_ID_IPQ8174			399
+#define QCOM_ID_SM7250			400
 #define QCOM_ID_IPQ6018			402
 #define QCOM_ID_IPQ6028			403
 #define QCOM_ID_SDM429W			416
-- 
2.43.0

