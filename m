Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912C92F7EE1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648980; cv=none; b=rusthqAHswGoCh5mcNbxjZZ+5ytw7doFwt9amofZRtFyNwX+pmu2Gnk9a0okhKujYFMMs/QJlJOVygdmnXKsfwQ/5+Ie84Sl7g49i+1w/T88BjbLXqD018PdfiCeg9Wp04VBtxO0jjseF+SnDoiY8ss18uHlWQz4+E5OSor6bN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648980; c=relaxed/simple;
	bh=+h9xvV+FmfsvD3o4x5A4hhDvjrjYOG6lR0QGp99K5mg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IQ3KSF4IpIlTs3g1DRnihRX85PnPl4V7t1g6wSImiYMvLNalMpaNwkY+JIZ5GN6JqZio8gQ5wnG6Tvhh6LAqw/zl/yQlzDmzWH6BLChBm9euQrtJru/fdLDhmuyZ+sttJvPw6sIgaqDquHTf33FUUtGmgM9tDtR7XutC11IFG0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KMNy/HC4; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KMNy/HC4"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e6598dd44so4379355e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648967; x=1790253767; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3XOkTTYIjCOyk/autE/aPM8JwQM44JJhJTWr5dHFho=;
        b=KMNy/HC4qP/UMPp/IJ31m6W+tlUdG6d3xwPw/PDrtbEhdjRFUQx9/kx+p7UQJgnnhS
         D1WuQXcXuwpArAkuv1GM3nAJxCE4hPQ8IUMuSc0P0KPwf7oOF782NK++AxtsFfJmXCPF
         nG/vN6TFESyAUOcJF5X0SUpelVZGjrfIEWB/KVw8/c/ZWT99wxC4wmInMWXe/Wc6pRWn
         dF7NahRlAUeFwJXYQ61M52lwxidDej+GbzslCsV0rimsF/79wdgYWdzuQurgeLXx7HTu
         IuZ0y5brz8PLRu5KPopmtxtPu6jvZkkYV4Mm/MPb1vQYbuqtE1VZtx3jBwxXC+soLo9X
         nD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648967; x=1790253767;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3XOkTTYIjCOyk/autE/aPM8JwQM44JJhJTWr5dHFho=;
        b=LjmTlyRXNDgoLyJIDJhoZVL7rfnYjO0+o/nhCU8hsG04oH9RYSVpfTeDmAOS7LRkME
         IdK/GQTRbLttTvi5mKZBzkoM6Xd1WGPEhvIPW+wGcCU7oToQizBJiSxF3ZWRFMnG4JBj
         i6QMIED+rR1+5LO20DDM4vLiq/BJAgnC7gWEXKdUFWC/mwCoYDfZ4vdgnmr+fM2f0OEY
         yQDTvwL1lC0MlME39wfwrDQ/WAxTmV+nzlQ5Ng+HmfPFqcqMPHQ34Dnsp9ZfCGXY3wFZ
         68CtKwtQJ6g1zhMeZoyIsujS/9gblZNjhWAb4hYI4BI1+lYvi9kffxEIYhnNdEydFe87
         mZ4g==
X-Gm-Message-State: AFuF++nW52vqPnSnLvcV4jAaLiOfIYhY0BVdEDW52TBsUdXYiupBd4N7
	0to3RA4L67QfYF6b6qBCu++cpWzHjHEGR/UwDLcCthwd1jK5ldHHKn+wi7ASJHx9
X-Gm-Gg: AYBFou3ocGwvat/EsCeHYvcmXCOxjnjv8++dcOeUoBDzzW1Vc9j2Ek5ceF/LHvhwUm6
	mjE35BSmDPTnXjZXuhkX566LaYvCXj1goqgLvnn3Bef5SdR0JtC3EpdMD1j8o23WObsJB1XJh4d
	xQidX0T8tyHmzZWKrT2GYLr1EqlXvAQF4pxRKBVOYJE0sY5VyTVqAqDu3WYHDzIAmz2xBQ3sbgi
	h7lBhVSlPAgvPntIL2AP55Jm1bU4+L+HbqRLADgcKN305QFBVPhe754oiZTTLVOIKsLy3tUcd8x
	lTmfI/Q5lT6HX0KmZWmubDRdOcHjMWwhrglSr4zsEBuslr6tR++t2OIPh/p5hC3q5XkDlmXdE/i
	836Ea8KcjIOfcV7PNAb7m28uQW9XDfC02xZuWcL0RTtnkWhGayrIRElK+QSwLIsWXBi2Q/VmPL7
	llx9Y63rSI/9ll8KOfvvZoOU/hVGItqX+hzlhV2WK9ic1sveQLLnA3wChX1u/hORR1jBF1WyLXd
	bMdP4BWc5dRlho2LX6uxnkqh39hOt0p50a5rBT9nvlwYwToEYxfH6f59dbe5IzE3BghJtK960R7
	PW7b0M2d7II8RiKUdUAdiw==
X-Received: by 2002:a05:600c:350d:b0:49c:fa20:cbfd with SMTP id 5b1f17b1804b1-49eb73253ebmr75509995e9.20.1789648966979;
        Thu, 17 Sep 2026 05:42:46 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fbd226ee5sm80976605e9.3.2026.09.17.05.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:42:46 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-integrity@vger.kernel.org
Subject: [PATCH v1 1/1] tpm: tis_i2c: Deassert optional reset line before probing
Date: Thu, 17 Sep 2026 14:42:11 +0200
Message-ID: <20260917124211.136221-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The common TPM Device Tree binding already documents resets and
reset-gpios, but the TIS I2C driver never requests a reset control.
As a result, an I2C TPM held in reset by board wiring remains
inaccessible and the first register access during probe fails.

Request the optional reset control and deassert it before
communicating with the TPM. This keeps existing boards without a reset
line unchanged while allowing platforms using resets or reset-gpios to
release the TPM before probe continues.

Tested on a Variscite DART-MX95 with an ST33KTPM2XI2C TPM using
reset-gpios.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 drivers/char/tpm/tpm_tis_i2c.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/char/tpm/tpm_tis_i2c.c b/drivers/char/tpm/tpm_tis_i2c.c
index d55f30fef00a..cde0b093ed58 100644
--- a/drivers/char/tpm/tpm_tis_i2c.c
+++ b/drivers/char/tpm/tpm_tis_i2c.c
@@ -12,6 +12,7 @@
 
 #include <linux/i2c.h>
 #include <linux/crc-ccitt.h>
+#include <linux/reset.h>
 #include "tpm_tis_core.h"
 
 /* TPM registers */
@@ -330,6 +331,7 @@ static const struct tpm_tis_phy_ops tpm_i2c_phy_ops = {
 static int tpm_tis_i2c_probe(struct i2c_client *dev)
 {
 	struct tpm_tis_i2c_phy *phy;
+	struct reset_control *reset;
 	const u8 crc_enable = 1;
 	const u8 locality = 0;
 	int ret;
@@ -346,6 +348,16 @@ static int tpm_tis_i2c_probe(struct i2c_client *dev)
 	set_bit(TPM_TIS_DEFAULT_CANCELLATION, &phy->priv.flags);
 	phy->i2c_client = dev;
 
+	reset = devm_reset_control_get_optional_exclusive(&dev->dev, NULL);
+	if (IS_ERR(reset))
+		return dev_err_probe(&dev->dev, PTR_ERR(reset),
+				     "failed to get reset control\n");
+
+	ret = reset_control_deassert(reset);
+	if (ret)
+		return dev_err_probe(&dev->dev, ret,
+				     "failed to deassert reset\n");
+
 	/* must precede all communication with the tpm */
 	ret = tpm_tis_i2c_init_guard_time(phy);
 	if (ret)
-- 
2.47.3

