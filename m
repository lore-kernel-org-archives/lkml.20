Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECAFA36EAAE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 10:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788344151; cv=none; b=Ah3hRLDeQb3kngSsKQE7IESMicvcuqwx+2dLJ1FOuM3kMBurugIGJunT2CAr4B0at46Reob2T0kdhaJ04ko8ptTCTaq/HQhEnsYohim2GKy7EPFe2IfsDPZrWBNU3h3JosYe7TFH+K/KuK9Jd5A3s5y72ZfZL+X28yo8gzqzCug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788344151; c=relaxed/simple;
	bh=5CTW8T/SpDQx4JzZBtps7+Yl+CTAibFCz311cgv/i+4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CYHs53x5nur509hMP5cErU546dooOS4IIKFXnF9FQYIY5NNaoHWaQpHNoWZ65omPO7WSkHh54opUPxjr2aVWp0eE8vziMjdtMJHApBrrtIFbmQeRmdasrEFkmdLmmJoZ6WrzmqcaMCFEeBEd0ehrKDvFHsUoH+tsX0Z656BoJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rF9Y5M6J; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rF9Y5M6J"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso12245585e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 03:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1788344148; x=1788948948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfZRa8H2WDMJkcsjpztb8rt8s89URmJ5lnAVHSoTHTw=;
        b=rF9Y5M6JnKrnyW8p0Hy3G6T3mCDyv8xrhvBWVQ8kZ7kGRrfu5DrChaDVnWIlpfHZT+
         Rxebz334JhNfmPkz2dUzJz1xUwPiBO5a8XOTwGgdeY9cLd2k9dObPHgbVPgZQ+M6hcJ2
         oCWwJvJ4Qfm+lH6PpJvnLKyIhM5cKnQCy3A74=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788344148; x=1788948948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SfZRa8H2WDMJkcsjpztb8rt8s89URmJ5lnAVHSoTHTw=;
        b=dpqXGgVeJN/9yHaOBJCuGLRDBKj/N+5tIJ49SQFLpY1PLHYQGDz8xPr7kh7uahH2Md
         stL1HtAkTNaFkM/+OzMI9xlURPsEtgQy71qAhzRAPWJPVlw9//EornJ3j4uVidYijZkB
         QeaBrvD65R+UvSz3WbnjChtWP7iV2juVeHow9Se2djgTyrPW2cxgpc6RuqleYOrpkeSq
         /mDBe8MbEzhjJNUjyvXlcoZ2b7MlXSwCfnKwgdNr6QzkosN8Axc0kAdvO5rqKIP9ooaN
         dkEOiSKGbIksJ27grHxekJ+jtmW/yULKEo2jOhV369TMAxtyI2OvT7G9G+fkOFsG5xBF
         E3Vg==
X-Gm-Message-State: AFuF++kJlIKPVtIFH8hNHRsZGGSSviJXoJNn1f9pAuMIbmngEoa0alAx
	TI+bBJ2D0ucYawaErkV8iUW+rAPoPTT1Hex1F87cGYLtBxOLJ9oDmvcbp8NSUdzQF0vRAKaxi42
	hQgwxyT8=
X-Gm-Gg: AR+sD12QOlLNj80bqrEcmrRgHSzh5r78S9lv+gjPg0TMGQTqZH/OGr48GHHFxVZSkuX
	mHXF8tp5dOnsIJDoQfRcktFi+ELcomcvv/mPsbxYFUHMRtzh5NWI8Iwrkh6uYRX+9vaOCITn8IC
	36p9qtyWsxVLwmBwzb90tQlnbzZcqWKjs3YjVfvG8/AyYMLytwlKF6pC4x+/zJ9h2e4Oh7tarNA
	HmA6+keeg+YH8NBwVEcv3fvYKy16AbzhS4zFi/xkarUKy9p02p7C/ZoFbUXjxf++E10wo18kj2C
	b5dJPNDYVA5vnthvIJ5mxnDn8hOzb1bb7NUGsvzSCNlTRqgQf0bnUE+zFEPR0p7OGcdIG2QG/Sz
	KPjCkeYe2lbqnPbigT95un84zH3zzSlVPYE2SgJgaYJODeW41X28eEWOOqR8odr0469hA0uKIvK
	O1pZVL9YHZk103GPRL6EfPV4qlXCEDxCx+5odC6FWzf/JyNomfAkkpQ6GdIeLhi61GOq1AnNH/2
	yI4DfByXrYXzZCHKfRIYwBJt45UetgYL3Fw51G4UrySwZFmyfcfufBrSd8bCvoWqL4eW2dviWov
	5hh7JONatpaNX3wS1vfyKubYPb4KL3YODRNDJYb3GRunPvnvp2tgiLKfoY30
X-Received: by 2002:a05:600c:8b88:b0:49c:e1cd:536 with SMTP id 5b1f17b1804b1-49ce584b899mr65032275e9.12.1788344134629;
        Wed, 02 Sep 2026 03:15:34 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-87-9-102-148.retail.telecomitalia.it. [87.9.102.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdd73f7a4sm139618475e9.12.2026.09.02.03.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:15:33 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 2/3] clk: validate spread spectrum configuration
Date: Wed,  2 Sep 2026 12:07:34 +0200
Message-ID: <20260902101515.167819-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
References: <20260902101515.167819-1-dario.binacchi@amarulasolutions.com>
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

Fixes: c86814e70390 ("clk: Introduce clk_hw_set_spread_spectrum")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

(no changes since v1)

 drivers/clk/clk.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

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
-- 
2.43.0

