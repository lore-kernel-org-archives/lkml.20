Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132D4E8DF7
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788449942; cv=none; b=bwkSEhNyD/QmR899HXYaldxACLeg4defC9MXrjAyHQP8zLHttYKDsGg9AkGHDv/+AGZ0uGFk8vHePC38IY6yC9dPmfNPhliCWRNxTgHv9yEy49vR1YxSkSNBOg5dZNQeABweKbX2TrWRSaHeRz6kMnE3vZF4tZRaOdaqMrmdW8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788449942; c=relaxed/simple;
	bh=15hnFVX8Uvkr7PjM1PgJoD/INOFQciMC8zyz7hvP3Mg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2++AtJm9+v19+U+BzxzC8JjHjQCLM1Gxf4TAT7fVtEHT058nviJxQawVgXO+4MLp+NNZqPvNK4nxK/kgdnecX8tB7i/J1V+1Ow/YHpE8CIVYIWIUfwKMsnkZrX0Ff5SnnxDIzV/icLK89UZ7lyZA94phQVvj5dqV+dycsXUfY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=EZLK1X4P; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="EZLK1X4P"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f96c5b722so14962f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788449938; x=1789054738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=waRfo/eMT+qYYnkf6SXoDP5wBnkJd2wqce5jm4IDuSY=;
        b=EZLK1X4PIL8Qvg0C4jJe13or6g+6jpoBkOPPkli+i8a9cURYyS3coEdN4Do5OkmU0E
         Q+rdgIu3OjOM+9W3OoohuaNS07N2IZ3I6BIoscs/HvkYGUtGb+zcQtKKcxj+uVBgxBFc
         IZhsIfQxDMRhD2LUZNiHjHwrmol2ag/LRpNro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788449938; x=1789054738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=waRfo/eMT+qYYnkf6SXoDP5wBnkJd2wqce5jm4IDuSY=;
        b=EqeZRlCMCvDXtlhc+opjJOfYc0g79nauMp/D55Qilqxzy5jyjmW00+Kw6pyQt66neu
         LO4KZQu3wKjbZFYr7TE5G0wt2CGKLOqH3K6fDnhjv4ImDEb8DbpQZuXMvFqpITiFdGgc
         F+An4MYvbgr0E9LXDSD0AixqmA/HDN1iiNa/EG3PVr46NsKF9LQPRcgu3EnkUXSpwOSh
         LMVK4GMgDXBfjfbEmi+DqiV5zp3YmDMfhBV6tA25NEZG1sqPeBxj04p2f4HakHa5+YRn
         PRT+IzZ3q1GJQubpL72odrP8wZTfFv93KSpMjugdEyXMrUuRCreA/heo9Uk6R52TIdw3
         jGJg==
X-Gm-Message-State: AFuF++mGcR3FDD4LwMVFEBe/K+l5j+Bs9IlGceQ2qi+64Yl4fxeipcme
	ju6vljJUVcKPwu/90eQFfTGtm88kaB0WJYnZlCM9OPzxBkZmGpH4eJ//bJ/L5FRElEeshsgUWn2
	QmUB7i+o=
X-Gm-Gg: AYBFou02CDfC+yK8skpyzQYuQMPhok5cMQ40YFzx7aGjhwjpSsknOZhnUSS/px+HZ4G
	e+jmyC3plI4O4OVh/jpGPzA16IsfcHRXTSOVvCvZyx4dHV2/jvkIUPvK8UeMVNdHl44D5rRMy7l
	U5wap7J6+/36APBwIwUcCZQ2Iias3YglTC+O8W9XRpcLlJFGsg8l05UNxbgd7JnLzpB5H9NNLgu
	tRJo7wWBSJ2HOUK0VAVZwE9sK/bcz4XkKxCK+YwI60JnLJCxCfZAlgEFHi5nSYQ75A47GFAaFUh
	yFNTG9HpCqCufBBb3dk0d60iM2bao/dnPumzFsOAQZknTrnuUAdrhrA5Jyt+H3Wwiwq4A0v9WE/
	pHX+af+zA9T8rPzPco0RCyHLiSa8oDbCprNHs3Mj6wG/e+dFNo/TdlWXUyS2vyGjRIe63IjClca
	Q2rR3jIfAW0zNFQNI1RWZe+i1+MBOeukxgfoPCvkGimm7LzX4pE/+dd+M8Go936TKjNPU8K3Pu2
	BmtXlWwnOidYzwcLTzeoMc/EY7vDa+f0T/rrlnXAc8XIPJvlhilYnqsU4emHjMYFZq8PnxIzN3X
	S6SWvK5q3To1AEDmM1v9J01g0YXYG0f+/WSWZAOG3qwSr6n2j0DWWQcS9xgokDmnt60=
X-Received: by 2002:a05:6000:268a:b0:481:5b58:c589 with SMTP id ffacd0b85a97d-48488f0e30emr24641045f8f.10.1788449938221;
        Thu, 03 Sep 2026 08:38:58 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448e72df2sm15366301f8f.1.2026.09.03.08.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 08:38:56 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v13 3/4] clk: validate spread spectrum configuration
Date: Thu,  3 Sep 2026 17:32:15 +0200
Message-ID: <20260903153836.373267-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
References: <20260903153836.373267-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The spread spectrum configuration is passed to the provider's
set_spread_spectrum() callback without any validation, as clk-conf.c
only skips all-zero triplets from "assigned-clock-sscs". An invalid
device tree can hand providers a zero modulation frequency or a spread
ratio above 100%, and each provider would have to add the same checks
to protect e.g. divisions in its rate computations.

The KUnit test data for assigned-clock-sscs uses spread values of 30000
and 40000 permyriad (300% and 400%), which the new check rejects, as
reported by Sashiko, so fix them to 300 and 400 (3% and 4%). Also use
a realistic 6% value for the initial settings of the skip tests, for
consistency.

Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260901155657.6A5981F00A3A@smtp.kernel.org
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v13:
 - Fix the KUnit test data to realistic spread values.
 - Add the Reported-by/Closes tag for Sashiko.

 drivers/clk/clk.c                      | 14 ++++++++++++++
 drivers/clk/clk_test.c                 | 12 ++++++------
 drivers/clk/kunit_clk_assigned_rates.h |  4 ++--
 3 files changed, 22 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index fef87167a60b..208caf60eeb5 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2851,6 +2851,20 @@ int clk_hw_set_spread_spectrum(struct clk_hw *hw, const struct clk_spread_spectr
 	if (!hw)
 		return 0;
 
+	switch (ss_conf->method) {
+	case CLK_SPREAD_NO:
+		break;
+	case CLK_SPREAD_CENTER:
+	case CLK_SPREAD_UP:
+	case CLK_SPREAD_DOWN:
+		if (!ss_conf->modfreq_hz || !ss_conf->spread_bp ||
+		    ss_conf->spread_bp > 10000)
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
 	core = hw->core;
 
 	clk_prepare_lock();
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index 1c5c8b7c1f3c..21e62d68f87f 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -3526,7 +3526,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "provider missing assigned-clocks",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 	},
 	{
 		/*
@@ -3535,7 +3535,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "consumer missing assigned-clocks",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without_consumer),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 		.consumer_test = true,
 	},
 	{
@@ -3545,7 +3545,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "provider assigned-clock-sscs of zero",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 	},
 	{
 		/*
@@ -3554,7 +3554,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "consumer assigned-clock-sscs of zero",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero_consumer),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 		.consumer_test = true,
 	},
 	{
@@ -3564,7 +3564,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "provider assigned-clocks null phandle",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 	},
 	{
 		/*
@@ -3573,7 +3573,7 @@ static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_p
 		 */
 		.desc = "consumer assigned-clocks null phandle",
 		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null_consumer),
-		.sscs = {50000, 60000, 3},
+		.sscs = {50000, 600, 3},
 		.consumer_test = true,
 	},
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates.h b/drivers/clk/kunit_clk_assigned_rates.h
index d7ae5ec2d25b..c5d9f004ee81 100644
--- a/drivers/clk/kunit_clk_assigned_rates.h
+++ b/drivers/clk/kunit_clk_assigned_rates.h
@@ -9,10 +9,10 @@
 #define ASSIGNED_RATES_1_RATE		9700000
 
 #define ASSIGNED_SSCS_0_MODFREQ		10000
-#define ASSIGNED_SSCS_0_SPREAD		30000
+#define ASSIGNED_SSCS_0_SPREAD		300
 #define ASSIGNED_SSCS_0_METHOD		CLK_SSC_CENTER_SPREAD
 #define ASSIGNED_SSCS_1_MODFREQ		20000
-#define ASSIGNED_SSCS_1_SPREAD		40000
+#define ASSIGNED_SSCS_1_SPREAD		400
 #define ASSIGNED_SSCS_1_METHOD		CLK_SSC_UP_SPREAD
 
 #endif
-- 
2.43.0

