Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD1051992A
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 23:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328845; cv=none; b=DtxSmGTl7bWaYgnmRHWwzpc8B4tMyNsLVV5HZA5cxhcgrjo1TgGrwK1K9Z4VXg+fP5W6Nn0JK0CEsLrOV3IfuQQsmJWkc0DrUG1954cOTCtp2mflFFfw54nM1mspNPBYodoyYr5oX56aRkEy71Lr5ZF3JlGzGZf4R4ZKmWEZNdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328845; c=relaxed/simple;
	bh=hKNrEY9jF9wBWZQYAfpaatIF+v/NREqC1KfjAm370Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZiofOUXsFI3Y14lMbpfHxf5n89sfm8QTc1a5LmjKvZHSyoUvIjYjVRStJ7LxWjRt4KwJzA6sOdq1VzBUq0sjTT1wxBPx5spZXvAYILXkBS3Zcr+T6ixx83oEzaAitIwXGaD8VzHslA0Ujlr8KY0s0SsYYnUrMQNodTLqOxa+YA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=C5lMylUo; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="C5lMylUo"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-30b6dad2382so2753319eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 16:20:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791328820; x=1791933620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Mz0QVq949oJHs2GUaSqDf7Aeu8nycc4Rm2PAfn+Bdw=;
        b=C5lMylUosjfgNwRe0DPGUI6rcnOGUwRtvPDmAI4/V3hs1g5lKF4E6arSEf6diMwS7u
         rZYl+FqarAJ93zRElTqN37OeQu49teMsQX8J4pqwR3WkT2qGCJtgZ/HvYP2snZ00fuCs
         +xnL2BgWn6gJgcfs073lI4MT9JU64U7ccCYVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791328820; x=1791933620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Mz0QVq949oJHs2GUaSqDf7Aeu8nycc4Rm2PAfn+Bdw=;
        b=a8IKv66u/8bGc71/RC/cqoeuljZkTw6uP2OxMx/9wHHtR+l9XfRVQJSMyuqMBjpG1x
         ULs57ezpNZepj2VkNqAhTB6d8UY3AeRAPay+iPzezcjTATAF0bgF9g8UbRQQufOQivpD
         2BNGiU+6EJp8zm5Tv8Gdj3pK6u4TnoelzPXx5fjKJzEwjNfYHjgbgS+dgGHMXq11zfaz
         R47shDYH/lvmdMFoRyyCd84pk//EcWv1jkCnBGKmTUg8qBz2M2UYneuoB01I37k8oDPT
         9QY9k8Wm4PNr9RyYjFOho6qWZvPLIl4Sjpi/zqKaFrulNedCskpdxTyb6/X4hKp6xh8U
         TcBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWu+mwN2H4rK83KSSNoy2umAaLTXfJI3cM06HeW8JLJOfl4bw+5g3162mXKvoubn0+rDt5Gc4n9t0SFKI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJG3RW7QP8NWDj5kgf/QMZOubuBY0BDpuvO9YbokFki0KVzeiPb
	y5T30HfSoU+Zjo5BJcrHIfen52hM4UMnq8aCe4KMSjUAqaw3wRYX8LYIcvsSUNZkJA==
X-Gm-Gg: AYBFou06nshnbt3Oy74Bx5CFvna65TarRNv1iInHVW+pXLYeKkK5JDnDK15WqE05WyW
	z7HSW6pJjepwxOYee2fSx4ChHXDgWL4wIbU8mczWjJH9+fRekz3VM52dHgrJsqZD214qYajNjzU
	nN59tSyqHFJuZL7mgEITFQEwjV/qtxdp72jz96rb5UIo52w91kpXaxeEJ8Pgcv9pif6ik9HF6Mq
	Y3ngddJaW7ZZnKronHtUA06yMLNXQRZv+GZHeDkFJh2MdIxiYvXZ50aF75h6qtMymN9cpLAIH+T
	qQvkpMSwNJ+Jdxk06KQxba8SFdfdK6pN4q8aWMTH3dxsWH+BFtbopfMf5RmnTJ0ZDjhcirMUFGT
	ed/WIThRAkjqO52Oays9wYW3B9CzuStizRSXI5qp3cy6P8b3NPBAN0LIE5MZEbJmr3vRgr/9Lz6
	Vos2YNSq3biYWQOTf2HDBsdOT6glMT0QIpz033pLTPMt/nfn/5QB4TeOTwTDjK+C4Dh4QJLY0dV
	RT9TAt7L9sebFYRhTWchiMMJMEgfKeA0o7Z9Q==
X-Received: by 2002:a05:693c:608f:b0:34b:34cc:bcf9 with SMTP id 5a478bee46e88-3515da5dc72mr384025eec.3.1791328820400;
        Tue, 06 Oct 2026 16:20:20 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:63eb:e7f9:1d47:7d47])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3515aeb5b46sm1698029eec.7.2026.10.06.16.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 16:20:19 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 09/13] ASoC: codecs: lpass: Discard pm_runtime_put_autosuspend() return values
Date: Tue,  6 Oct 2026 16:13:37 -0700
Message-ID: <20261006161337.9.I5cd238b1d4516d4d6980565e0a4e1b83d9abce63@changeid>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
In-Reply-To: <20261006231900.3230373-1-briannorris@chromium.org>
References: <20261006231900.3230373-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Printing warning messages on pm_runtime_put_autosuspend() returning
negative values is not particularly useful.

Returning an error code from pm_runtime_put_autosuspend() merely means
that it has not queued up a timer or work item to check whether or not
the device can be suspended and there are many perfectly valid
situations in which that can happen, like after writing "on" to the
device's runtime PM "control" attribute in sysfs for one example.

Accordingly, update the LPASS macro codec drivers to simply discard the
return value of pm_runtime_put_autosuspend().

This will facilitate a planned change of the
pm_runtime_put_autosuspend() return type to void in the future, similar
to commit 3afd8df02433 ("PM: runtime: Change pm_runtime_put() return
type to void").

Signed-off-by: Brian Norris <briannorris@chromium.org>
---
This patch is independent of the rest of the series, except for the end
(changing the return type). I expect it can be applied by individual
maintainers, and we pick up the end once the dust is settled.

 sound/soc/codecs/lpass-rx-macro.c  |  4 +---
 sound/soc/codecs/lpass-tx-macro.c  |  4 +---
 sound/soc/codecs/lpass-va-macro.c  | 17 ++++-------------
 sound/soc/codecs/lpass-wsa-macro.c |  8 ++------
 4 files changed, 8 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index 282a6aaa9986..e6c27893584c 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3917,9 +3917,7 @@ static int rx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_rpm_put;
 
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0)
-		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index a8e83eb60ba2..149373384a15 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2370,9 +2370,7 @@ static int tx_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_rpm_put;
 
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0)
-		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index dbc5795b9273..48139119b335 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1352,7 +1352,7 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
-	int ret, rpm_ret;
+	int ret;
 
 	ret = pm_runtime_resume_and_get(va->dev);
 	if (ret < 0)
@@ -1360,11 +1360,7 @@ static int fsgen_gate_enable(struct clk_hw *hw)
 
 	ret = va_macro_mclk_enable(va, true);
 	if (ret) {
-		rpm_ret = pm_runtime_put_autosuspend(va->dev);
-		if (rpm_ret < 0)
-			dev_warn(va->dev,
-				 "runtime PM put failed in fsgen enable unwind: %d\n",
-				 rpm_ret);
+		pm_runtime_put_autosuspend(va->dev);
 		return ret;
 	}
 	if (va->has_swr_master)
@@ -1378,7 +1374,6 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 {
 	struct va_macro *va = to_va_macro(hw);
 	struct regmap *regmap = va->regmap;
-	int ret;
 
 	if (va->has_swr_master)
 		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_SWR_CONTROL,
@@ -1386,9 +1381,7 @@ static void fsgen_gate_disable(struct clk_hw *hw)
 
 	va_macro_mclk_enable(va, false);
 
-	ret = pm_runtime_put_autosuspend(va->dev);
-	if (ret < 0)
-		dev_warn(va->dev, "runtime PM put failed in fsgen disable: %d\n", ret);
+	pm_runtime_put_autosuspend(va->dev);
 }
 
 static int fsgen_gate_is_enabled(struct clk_hw *hw)
@@ -1693,9 +1686,7 @@ static int va_macro_probe(struct platform_device *pdev)
 		goto err_rpm_put;
 	}
 
-	rpm_ret = pm_runtime_put_autosuspend(dev);
-	if (rpm_ret < 0)
-		dev_warn(dev, "runtime PM put failed after probe: %d\n", rpm_ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index cfd2ac0a6cda..60d285a2040f 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2548,9 +2548,7 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
 
-		ret = pm_runtime_put_autosuspend(wsa->dev);
-		if (ret < 0)
-			dev_warn(wsa->dev, "runtime PM put failed: %d\n", ret);
+		pm_runtime_put_autosuspend(wsa->dev);
 	}
 
 	return 0;
@@ -2820,9 +2818,7 @@ static int wsa_macro_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_rpm_put;
 
-	ret = pm_runtime_put_autosuspend(dev);
-	if (ret < 0)
-		dev_warn(dev, "runtime PM put failed after probe: %d\n", ret);
+	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 err_rpm_put:
-- 
2.56.0.360.g66cac248cb-goog

