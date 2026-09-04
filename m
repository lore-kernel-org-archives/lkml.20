Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431F144237A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 10:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788516817; cv=none; b=NBFQxqGoRaond/sV+RLA3Aux5u4DJ2wlKUXKrZCfzEy2OjxfMlDhzK/aVqUTh6XfwBnz8gl6tQ1tSWTNgIjaCebTc/Kd+cxK7dkusxkRXfXSLB5Wx8Laui0SCb83UnANF+ZkntuXRg9j/N0nrR2P7cx1xF5FnTZLxWA7b0i5NoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788516817; c=relaxed/simple;
	bh=xZ2sBnhrYKqxY/S8zO9jUQA4qCcp7CsTSlId62VD62U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rn19NuAlgyR29S8RwUQrq11Gp0XCh4TGy5eJGDnUm4nbRqH4P17x8uUhtyQpVxMvrmKBfTBzLCKTgGFS+73GhOqUwmVmodWoMeWm4ZZ/CYH33Sv6NA0VftFUhP/Zwp/ri/xVCvB8f+aatKCqhP/dA9AEm8cRAhsQmT/8PDkGdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=aA3G6LdS; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="aA3G6LdS"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482e067e908so740592f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 03:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788516814; x=1789121614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U/iBVA9/Ii7qFgco17f5RCUwPjhgNhGPbu+zTwjLGmA=;
        b=aA3G6LdSfBEFdJO5IcUlngaRT9cJtLRlJ2Fy7sBP8eggwremX/vAWSiEsZG5gLXe4F
         YSdHygtrG63memrbX4o5iYFEPef5abqOBkcUZPt8d2rfZCHFGwowrHzq9Y259JUKO3yT
         dR1Rs/noSnImP6n6Sfk2N+qcQDZkVuJJs8blA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788516814; x=1789121614;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U/iBVA9/Ii7qFgco17f5RCUwPjhgNhGPbu+zTwjLGmA=;
        b=dLyDTIHTtJsmzB4xJMLIfx9o8KSdLjuxnIlv5GwbM3kn59IuoPz93mHYkLXgS1Hi/W
         AVUsWXWpQ0KK6MointBSr4mTABngOyxXxCvWemACMABPRl8YUcT7bsltNSdwibD9k1NG
         dCfSbZdrmLAyJdRxJS7qMmoIwxGrP0biRypmU+uK7oxNTjDvr5rzls6DI+wur9mX8DPi
         QziCCpR8AQ4t4CSlml9ViFo04I6n0fM9ixz4k339uEjNXCpghFlA5bNSE00UGSx7eh24
         JdPW4nIL8EctHGKw913Xmmz95qCko1efJ6df2idaqwMmeXyS2aQTIPfbE3WzTtTpHZYx
         IJQw==
X-Gm-Message-State: AFuF++kYcZ6AOGDjhoIqDRGxgFjG5sCvGagCEPAX6mBULVfY1BDmQzZ4
	fA9vD4SNffjHtSWciQWQKyAmJkg1aAu/46QLEeGuwnoVcIcO9lo2Xy28Dc41C/cgIXVd5hwvPAR
	LnTPV5tU=
X-Gm-Gg: AYBFou34uF2Y3T3hPfPfkakw0l+bJSjp7SSrQSE2AyCaZncMD21xCoAhLHdKO2ALsF3
	TxvXRKatP3Ggi5f5OM0aWy6ROBw2dgUt37x14RkAjyiCLlGkOdDKxeMWIHKyGhk6kUINWwT2wpL
	smzOAoDTVDVUl3wpO1/OvFpMZdLTs8gMWx1eUz2uBevIRc7unZktgC03jF9u7FsYuhwk60sLiq+
	6z6ZGGqa56xxn3oQHlkJ3hgFYt1Bxd17h8f86ZTTdcqahaAyJyGvg0IwGXj/W7bjgnTfbhcB30/
	7DxyNL004A+zhYHnsR31R6mMy282A3lMAGWl1wqIzf2LKcnDbLmvJI9s6Nv+XLq/evYHQ4uk0HL
	AgVW3usAPzqz5o636zGw+l89ZtzyA1LzyxpYZzchvFsldJv5zarY0C3p9TS6+qSzRM9xtSK1ex4
	cPOPD8ni8Bb/74Pe32iMvtw/ROsKe8b5G+8M+TyD/jCcTzYwqfZt2E7+x85EU8nt3x9xCW1N8Jc
	VubeHtbM2gSOiBZOYVC7KkVHLuKnr8dGScbUahID/KpXCiXrxtMs3pHbYy0AomgE1mEC6E6I3Nb
	vLIzFi1/94dwMMaWUvV0qNtLLa8LbM/U7lRGTfFUJpSk4uva4C4Wb84=
X-Received: by 2002:a05:6000:40c7:b0:484:3310:f394 with SMTP id ffacd0b85a97d-485872d2de3mr5945970f8f.23.1788516773023;
        Fri, 04 Sep 2026 03:12:53 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.amarulasolutions.com (host-95-245-93-90.retail.telecomitalia.it. [95.245.93.90])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588390e30sm5317990f8f.7.2026.09.04.03.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:12:52 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v14 2/4] clk: validate spread spectrum configuration
Date: Fri,  4 Sep 2026 12:06:31 +0200
Message-ID: <20260904101243.412006-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
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
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v14:
 - Add Reviewed-by of Peng Fan

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

