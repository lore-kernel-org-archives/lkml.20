Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7660C5012A0
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790775200; cv=none; b=SExMuGMGpcksOS/EWb6uQ1P761P5VlgDhF1dc6w+x9yp53BwDrNdayUYXa+KONa8O4KY8EYdC6wldoGP2z244WoVB779s8SqHadkfY/scAn8eNu1niy2RVybwn2yfbeM3/tXipFE3Nc/NvveqNXJAky/vuFrQwgQlDNrYXsbaIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790775200; c=relaxed/simple;
	bh=UxWntyqEKLykIVeSFH35LRX0sm3hVNeSusnj4m4o7bA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSg7k9FlNb1JlCFPQ/vR3nLkkVD8LHHdgis0DCvGV8MowP2o1iCdTeioSpTmrqKya/rMnDRJrg8+mXtAr4+3bHzmzmjrEnHWOIKaQS55OTuY+Hb4eFGlFoAQFipOoFApbNo1AmtXcPEYZvcsqvp5HhvioOPR29yb6ST2llBfSpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HecGFTQr; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HecGFTQr"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48884b0219bso2859057f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790775185; x=1791379985; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/T8gMBX5SXPAGkoLIA5GhKIYAcxw/XWcrRzadX1Y9sM=;
        b=HecGFTQrNNk/FPUdQKTusA2v5XR9vXWbyd4bUkqt7kZr043aoLavltnADlLKnTgIBt
         QrLr5AK4YkusA+odSIsLwhW2Ki+pF7saC0pSoTX77KzSW7THBVJkORgVr7hgctSxV4he
         BI9Ggb5MxmLOFhOiMf8sXenuuEFJ4dDjkqWjUe4a+bbbD+TSCegmEE1asEqzhJSNlDws
         t0vh8Ov0RTvRNAa/OuJk6PaDSIisbfRGh8CeQKJbWQ8IEGW5Qk+9kpz1wPDHZ20UgvOB
         gjvW+mDRPdCzKnyV8WmbWj52LO6lB+XRHXK4c4QJMLPnTAVHyctcR1m3RZq6ohUFN5cC
         vmYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790775185; x=1791379985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/T8gMBX5SXPAGkoLIA5GhKIYAcxw/XWcrRzadX1Y9sM=;
        b=jJ9cMqxEp58S13bjmdEO61xFmDPziesG6Ix5W++Gyohg4o9SSF2ukCh4zkcH7GiERP
         +CAOjdHXori3PszjYiuZfRKFRif2/tNsZ8ClCB9mDT7I5EJOLYhNgQNKzEk+MxHoGNov
         7pk+Iqo95Lfvxi0fCB8sc1JF01xdKxNVBOZsepsam26Pi3rCMvKOoSL/Dx4K1FagBDr4
         t3P+Sxv6twaNSTc9liTHvMe05dNLRfe/+IWfJNe97KI2FNtttUuC9Wss0/cJENpJkuER
         AKJl78KdtqJk4DvBQkAh2RN4fM3qW23Pumt9z4ApVaCaa4rMJIMa11umZGZ/1OrQHesV
         ibLg==
X-Forwarded-Encrypted: i=1; AKwUvBzQcWFETQE3yxGQuBz/tZeAPIrwGGJXls8hSklXng3jdgXO53jGT7nwdQRMRVzUKBExdZ4TDjLXQegmSD8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIjzgH4mr7QUicDuyQz/s6Z4G1RBmiXLAUtlG14mPNsp65khKqD
	nEBCQRedirtZb4ZcqlsLkI4B15IRReX6R2Rx1kocpWsasHt2dau+KW77
X-Gm-Gg: AYBFou3AHQvg3NpYPncnTYXL7bVmy7Xi3MpL8QdogIj3hN1NT6yfhhjpo5UBmsEDSPj
	CWhtEAq9As9AcLe7HEwNuHkG0UIzu80ECZRHnM0vTKVh+nUgN/td4hqs7j/Vw4fkY6LCz1MuJeU
	+kYiv5BwN+HGFkcFMx7uaB3SYulKobHg1XKXNo0gFdbpBUkRtznPEhVP33Lllj8Wu4Yn5peC2BC
	zb7vAk+3NralAd+6nfJOpOv/TOaquMMkZ5P3VaAjwqpWS/QcqW17qNyY0urO7DIzx3nQcecZ1O1
	cDBn/tYCosxSLQxPx2Xme1w2CM2vohV0O9DHOSz1aW0RauUrOOxrDEqBYAxtxASksxjcLKppQGN
	is0PB5vMVjJO93TaI/83DGIORZpCbf1zr/OkLLMRqTLDrKF70UEoZw/jpO4StcY+KDYjaukAI0e
	2KP7QflpgYcX/LixfFofNyLfZYX/CQ7xRPu5q1DrsOeAlM8qRI4yZ3VRt/Bx9FjdH5AbUy0x6ii
	a9qMHTJwHsDnAfDbXrQgD8=
X-Received: by 2002:a05:6000:605:b0:486:f46d:bb02 with SMTP id ffacd0b85a97d-48b02585d75mr2843621f8f.57.1790775185199;
        Wed, 30 Sep 2026 06:33:05 -0700 (PDT)
Received: from localhost.localdomain ([2a00:23c4:a702:d301:bade:1500:bcd:b3ec])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b029f2b02sm3685582f8f.24.2026.09.30.06.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 06:33:02 -0700 (PDT)
From: Biju <biju.das.au@gmail.com>
X-Google-Original-From: Biju <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH v4 2/9] drm: renesas: rzg2l_mipi_dsi: Add activation_dly to hw_info
Date: Wed, 30 Sep 2026 14:32:44 +0100
Message-ID: <20260930133257.23210-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
References: <20260930133257.23210-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Biju Das <biju.das.jz@bp.renesas.com>

Move the post-reset activation delay into the hw_info structure as
activation_dly, allowing SoC-specific values to be defined per
compatible. This prepares the driver for supporting SoCs that require a
different delay after reset deassertion.

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * No change.
v2->v3:
 * Collected tag.
v1->v2:
 * No change.
---
 drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
index 2128fd16ebc9..1538eeece2b5 100644
--- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
@@ -59,6 +59,7 @@ struct rzg2l_mipi_dsi_hw_info {
 	u32 dphyctrl0_init_val;
 	unsigned long min_dclk;
 	unsigned long max_dclk;
+	u16 activation_dly;
 	u8 features;
 };
 
@@ -806,7 +807,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
 		if (ret < 0)
 			goto err_phy;
 
-		fsleep(1000);
+		fsleep(dsi->info->activation_dly);
 	}
 
 	return 0;
@@ -1534,6 +1535,7 @@ static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
 			      DSIDPHYCTRL0_RE_VDD_DETVCCQLV18 | DSIDPHYCTRL0_EN_BGR,
 	.min_dclk = 5803,
 	.max_dclk = 148500,
+	.activation_dly = 1000,
 };
 
 static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
-- 
2.43.0

