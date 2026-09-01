Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413CC3DDAF9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788246468; cv=none; b=oSyoA0nRqsfDPG6+9cYAe7kHwDwQFVFL0tIEkOsYzKUzCrmLVltjxAC1eZeNqYMpjdKANpTFJBcceFUgZR4FbtRPrOfEdnf7q043YMoYWk+W4hltPMpHXCPNDuc5oTHezrbVQruvIkm3HQg6Q67euz+6vGYFzOJXhTlHxKMi5Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788246468; c=relaxed/simple;
	bh=LO0HNWJQ2iffOvEO/jDwBG49x7KRRSW4adIk00h3Zhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iaEVOZ3zPGzR4JPE1s0OGH5o94Lo8+TTc8c+gmuIxfhqvrkCuNOIIIWYdqqumFFijtXBJFkS78ipuHRuYi9gAOLKfbu3qHU2OU8uhOBFIeI+B4d8ZOy/IaFESjVxYuvfMJTWigfzkn97fIqufhiudH42xlbeSxxkTHrSu1x9b/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hztq0cMJ; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hztq0cMJ"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so513573a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788246464; x=1788851264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=Hztq0cMJ6yGgbKt6eietPECT11dMpXlCmHyY9TXyk8uNpuizWkr1eR8EXw2DbgPs6L
         jrt6d/Ox5uxdMhgoemvdzLIgNYG4mBVFPHhBkdBTlsZMW9xQbAt8UtCsRtPFUrhwadNy
         LP+Z2TwPGaCpdlyNzC4J7LPAJIsfy6tEYKI5rL8yaVcMdGBWizVlXfTvdUtcoWhSmc+X
         h8cwVH9KzFTQDqhCPDwc7cvUhRUvQllm9ovFZTQItZU1x3W9YZQSfMOKYKu1lshlcdml
         rrJODfWL+GcqxThIFdFR3ijkbXo3rMdh48CBebUM1opkVc3mEWNOkFJkrRlfrQUUl6/S
         fxow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788246464; x=1788851264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MKE/6hDHMyslvqv7t5uf7DvgZ5SWH6bvEtV9dkip8cU=;
        b=foIIf/7U2KBGvvpJe+m0Lp/RMUMcIvTaJ0m0y2O1CIOCdpejN9R1ts8b/iEoPFw6nj
         TjOYvRp5q8pxI+nBcP1C7hlN5cJSHoe0BeIuO9xAQXqU85EVfIE6oGZQURMfbt4dGXKz
         bUlXjCjX/dR5ywj+ndghGk+BggJEd5fdML2P1UUslqzwCsd97e+Fb4h8AhOa6tTLdEB9
         13dqAZ/gJPIQsm6Elekm/N93c8GYA53DKcLZ5vxXNjwn0h9jgEwBSKAOcb/85T1JVW3q
         HtrIbno9RiTBmb7f7xHtdBm78YpMU3Dp9jeUc6H/Zuwa4JypuX4F6T0XPSyfjYrzAzHD
         HV0g==
X-Forwarded-Encrypted: i=1; AKwUvBzley/eXhtalHcDDCqLKJI7DUulUyhDWbdqIZf3UGaAhHjtGBOzqYgGmFK0IEsAjyVYtJcGnT2/c2a6y+A=@vger.kernel.org
X-Gm-Message-State: AFuF++ld3+GQ/5EDOxyfQ9mLtve8xpizV12xSfzZBk6vwviNWTglbWuY
	pC1edNbRN8zMTOaJFmOG2zNxQfTnwff32sCuFwGvawkz0kEhFRWawl34
X-Gm-Gg: AYBFou2fMHea7Q6PhiThgoqDGilQuWLVUJmKJbZ1cKFWvFvHPRRbopNAizk2rvPcSlC
	11YkKeOQ9FdHB0R0it/vMqD2+feyOquXHxMzde3f0zmZXU9yamqZVgZR/AMX5Gibk5jsuP2eeZH
	BqxhRIuU9CSM8QZFGcRelJ9Gmv8s8qJEJLKef17WbHm/Ccic2B9O3XcMIEGM8KvxgvgK7Kp8qm0
	78ZnvUQy6oz6/O9FNStKnIPhwge1+8flBNZlUPMOm4LRqnVc+CINqMhw/B4cjnmJxbbCkDfBBdB
	dtpOemiV/R2XQX2tCR28KGBvC6e2cwXuD9n04tSDyEenPq2U3KBm16CCQRzTxShYsQaHdeHpHph
	SOuW5lrFohfp+bdqEalZwsntuJ6ZCfbpPmW99fvaRwZbCTNYZnuzFWxN8797/43K1Ilo+yRkWsP
	gaV+LPeqB4IQA56DxRlSGNMyBHwK3Ms+BmgQgH00YIy0SjHCxTlcz8r876a05zW30zOPsp9/p7y
	8zFbnt8d3/0
X-Received: by 2002:a17:90b:582e:b0:398:9be9:ab8e with SMTP id 98e67ed59e1d1-3989be9acb8mr32700156a91.19.1788246463258;
        Tue, 01 Sep 2026 00:07:43 -0700 (PDT)
Received: from localhost.localdomain ([157.51.207.128])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32bdfd03e71sm18274680eec.1.2026.09.01.00.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:07:42 -0700 (PDT)
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
Subject: [PATCH v8 01/12] dt-bindings: arm: qcom,ids: Add SoC ID for SM7250
Date: Tue,  1 Sep 2026 07:07:06 +0000
Message-ID: <20260901070717.20513-2-sreeshankar0910@gmail.com>
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

