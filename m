Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191893;
	b=cCrq6Yk93aAnlRPnnNC/bII/vp6SBgmHK0icZoPNiThKd9a/Oo5NdVIpFjmHchIuGvlR
	 E5Sh2llA27fZCsTKsWwvl9lE7teR1OOifOCa3XtQ6h2VIn37KxsZ4VigIC+ctGTc2dmqk
	 ouznjMRUXfBZtKilNPihdpOWXcd+Jkr73d3QtaFA+ksEpjqsUaGbp2Vpc+TxAppG2wdb2
	 dqJJmmkTtvWrxr4lhUMPOJXxnimRaHc0Zs0se+X0MNVHZkIcs3+18jU0xDqOIhvpgriAf
	 CAZaFF1yd8DP98C8rmQAV5BX+YYWfvn9KqCOxN0QhodNHrANe29JnQ3aYiHSAesWaZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
	b=HFFNgk6l6z5TeYqgUMeXbIFlErEzspW/PnWMNT00xmLTBs5N19WcBbIBacs+TuraLooB
	 Zd+YBo9e9Eu3hGD8CotVe+gJ0W7oiIzKZlOcHa4pyeStxNrmdhBkt1aPtGITSiEDdvHtr
	 /HktakrhgZCH4GZySXGJ65bc0zbAB3rci+uNBDE6T9x+cd2jMG0OJYeiT8CeBzXID9ADt
	 HQEaH15WPr4kcMtz9xmUc13NcV77oo6bh0UpZ1eYbyFG38wa9a0Xizdqi5OAPC1YSTZzl
	 EtmK1kk8mK5mYN28vIn9zg92dIBP54m/l1NHbfj+V57yQwsiBW2ElRZUmNHtxdy0I1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlqpEYJY;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD5D60A260E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 12:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADD5D60A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HlqpEYJY
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2084d62cdso7870075e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 05:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793191891; x=1793796691; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
        b=HlqpEYJY6SeU06ZVjmrQxi16ZthOhhVqapCxvG8plybQOMFXdacYpjPCirWx6S/WhV
         06xLJjJphsq1welDkMCCYQ8x1n14sv5suP/3e3s6kxRLzPc635UhxyOtguaV7pMlnt9b
         qEaZnaY1dcdnSxHk81jERJpB8JNJYq++AUKOqJOKI0/94sIhEc6xy0boIKnE7MZ74wlb
         QBnyRwjIrjKI/qgZoRcCddF4V8W/z4+3w4zIcS9+cjd6YW3wBYJrRza/rubCCfCmA6Nq
         iPEX6NLW3C3pShttrghSoks5t/B9WDlR05ooYOElE02svDeSLae+F96GeKGebGJKReaF
         ynkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191891; x=1793796691;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xoqWy7MO/c6N1qFdA742uHez375d4m56xLpj2LgHpLA=;
        b=vghFff4Gjh86SD78+D5iQWTQ83YXECUvYrxOQW4S473OggbJiUmmpFCdfHCfWdTGs+
         QH+DVtWRu0zRzS3D8DqGQWm8fEgIBH4HqRXqBvK0GV8LIcIPB5j5HpN1/Fsk5gqg8vPw
         DwObxo1IOsYs41j/7ZBG91xD/t2aovIBGFXQTpzBoNB6Z5HO5oAPGhG/9uryGpuExWwx
         mEej6+sh3MTDvh/gAykMuuQgQqLUbViWSdmX5ITufVE/MUsblxuvO6PSsk5RL6fUwD0V
         j6rFGz5aLPorVz/1ugv9iLC/uBNmNWrtcWIJucIBG/ER5YkgVO1o7XjKcwbb0ctz3VIO
         kSRg==
X-Forwarded-Encrypted: i=1; AKwUvBzkmb1gW1fTRIaLBapS5ynwKnx0ya429d0TFWqBBrA1qWVGNYm3g+WM3R8s23Lh8FbKfHLBLeIyf/guv9Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYJbDGP4nW+PUF7b+oQ1n9hP+1FD44S8cG3hy5C4m6EfsHlaSAwa
	DACnRulfOJ3NfH3Xu105rKK9wvtvB8VQtsBav2T9xQJUpzSIOdmvja6v
X-Gm-Gg: AYBFou000RaWp3V9nWjFYaaIGpBfdPPYMRU6L/FSbVG5VzelJLyE29tnqo9IKfBfhOM
	VgocAu2dLt2H1kuIGJyV4LNsTBeX8SFgLmmMqV3J/nxoPk9iDfY3rNWLg8EMipO9P0wE2wUokDE
	4GKG3e8fhnO5ttySc6L7bj2nLJichz4nK+u+LFrM3If9hgIhkuF0VZmgvk/AjXKQJzMNO3q418f
	jW3HlxdOTnc+tz73y1OzbBrO+TdNddfoN42dwCbAa1nRcYG0a1F9EAyRPQhTVrXaCYHm66mfh9w
	VSn27Dtocy0UH0fhZEEXF+4u3EA93PkBDMFCeLJwCTIKIr9ejIbqawHjFy+Qg7Qd/Dl1GazuGU+
	9ffBLuZMeUJn6bHAGTo01qJcYFrbo0W6fBswZL2RhuGVIY6yJARM0rgDDBZ0i4td62Lr9jJlhkf
	8DTM01NS/XwBkLV6mz4nFG03bLzX4E5KeCcpQwTBTEZQG+aeIbxuOL+bq0YMZkDKRSScuuSo4dy
	Tcec0dxYF/I8pYS0APTZmsWzRTQoPt3Xd/mU/q6JwQdi7TFd4cXfqdlUicrIJmI+kIeXvH5Hjvj
	eaX3NylpSGsDpHCVJ4pnG5GmGYOy3vSvopwR3p4kLnCKrYxkTnF5Ex/gVK1xRIHp6SI=
X-Received: by 2002:a05:600c:3b1e:b0:4a2:10f9:37ce with SMTP id 5b1f17b1804b1-4a9665870e9mr51619735e9.15.1793191890986;
        Wed, 28 Oct 2026 05:51:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c4:a702:d301:6bf5:6c0a:cf99:c9f2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39b3sm29275016f8f.10.2026.10.28.05.51.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:51:30 -0700 (PDT)
From: Biju Das <biju.das.au@gmail.com>
Date: Wed, 28 Oct 2026 12:51:26 +0000
Subject: [PATCH v25 09/11] mmc: renesas_sdhi: Add optional axis/axim reset
 controls
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
Message-Id: <20261028-rzg3l_sdhi-v25-9-57f16691c2ed@bp.renesas.com>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
In-Reply-To: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Biju Das <biju.das.jz@bp.renesas.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793191879; l=4251;
 i=biju.das.jz@bp.renesas.com; s=20261020; h=from:subject:message-id;
 bh=ofWNQQh7eeVtC/0QxqS6eNcmDhEtAhULNqUDYpDf2i8=;
 b=2dB6KGv2VbGSis5Wl9Z9RT5ZJKhkOY9qnEpDRZN3gUjWTX2kjJPuVV1agZhObhLJLBnRJol8P
 qQOj3U6MYJnCurHjqiuoqu4n3rdjZVM0yfMC7WdPgi1puLAPAtFDVIo
X-Developer-Key: i=biju.das.jz@bp.renesas.com; a=ed25519;
 pk=yzD2T1OLS3lEYflbk64xhLlxhk75lZ+NoOtkTOqrlVw=

From: Biju Das <biju.das.jz@bp.renesas.com>

The RZ/G3L SoC has axis/axim resets compared to other SoCs.

Add two optional reset controls, rstc_axis and rstc_axim, to the
renesas_sdhi struct. Both are acquired at probe time using
devm_reset_control_get_optional_exclusive_deasserted() with the
"axis" and "axim" reset names respectively.

Include them alongside the existing rstc in bulk reset/assert/deassert
operations: triggered together in renesas_sdhi_reset(), and managed
via reset_control_bulk_assert/deassert() in the suspend and resume
paths, replacing the previous single-control calls.

Being optional, these resets are a no-op on platforms that do not
provide them, so existing behaviour is preserved.

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v24->v25:
 * No change.
v23->v24:
 * No change.
v22->v23:
 * No change.
v21->v22:
 * No change.
v20->v21:
 * No change.
v19->v20:
 * Fixed the ordering of resets in suspend/resume paths.
V18->v19:
 * No change.
v17->v18:
 * Fixed ordering of reset in renesas_sdhi_reset().
v1->v17:
 * No change.
---
 drivers/mmc/host/renesas_sdhi.h      |  2 ++
 drivers/mmc/host/renesas_sdhi_core.c | 26 +++++++++++++++++++++++---
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 3c991f6b988b..4f8ed1d8efee 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -102,6 +102,8 @@ struct renesas_sdhi {
 	unsigned int tap_set;
 
 	struct reset_control *rstc;
+	struct reset_control *rstc_axis;
+	struct reset_control *rstc_axim;
 	struct tmio_mmc_host *host;
 	struct regulator_dev *rdev;
 };
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index 3a1a558bc98c..e897328d5b70 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -632,6 +632,8 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
 
 			reset_control_reset(priv->rstc);
+			reset_control_reset(priv->rstc_axim);
+			reset_control_reset(priv->rstc_axis);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
@@ -1151,6 +1153,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (IS_ERR(priv->rstc))
 		return PTR_ERR(priv->rstc);
 
+	priv->rstc_axim = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axim");
+	if (IS_ERR(priv->rstc_axim))
+		return PTR_ERR(priv->rstc_axim);
+
+	priv->rstc_axis = devm_reset_control_get_optional_exclusive_deasserted(&pdev->dev, "axis");
+	if (IS_ERR(priv->rstc_axis))
+		return PTR_ERR(priv->rstc_axis);
+
 	priv->pinctrl = devm_pinctrl_get(&pdev->dev);
 	if (!IS_ERR(priv->pinctrl)) {
 		priv->pins_default = pinctrl_lookup_state(priv->pinctrl,
@@ -1404,13 +1414,18 @@ int renesas_sdhi_suspend(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
 	ret = pm_runtime_force_suspend(dev);
 	if (ret)
 		return ret;
 
-	ret = reset_control_assert(priv->rstc);
+	ret = reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		pm_runtime_force_resume(dev);
 
@@ -1422,15 +1437,20 @@ int renesas_sdhi_resume(struct device *dev)
 {
 	struct tmio_mmc_host *host = dev_get_drvdata(dev);
 	struct renesas_sdhi *priv = host_to_priv(host);
+	struct reset_control_bulk_data resets[] = {
+		{ .rstc = priv->rstc_axis },
+		{ .rstc = priv->rstc_axim },
+		{ .rstc = priv->rstc },
+	};
 	int ret;
 
-	ret = reset_control_deassert(priv->rstc);
+	ret = reset_control_bulk_deassert(ARRAY_SIZE(resets), resets);
 	if (ret)
 		return ret;
 
 	ret = pm_runtime_force_resume(dev);
 	if (ret)
-		reset_control_assert(priv->rstc);
+		reset_control_bulk_assert(ARRAY_SIZE(resets), resets);
 
 	return ret;
 }

-- 
2.43.0

