Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D774AEBC6
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789749909; cv=none; b=DlmdghgVQ1uhgUpV5cG6a70Sl9Ksn24sEEJvuJhuyadN5X3bfpG9qeSCGliS3dzEBxyxZ8Hjr4AF4gicEUus7d02nDQy3EIVq9QMQPX5C6KNDz09WZ0OSwQrw3zoC9s4+qq93uargeeJs6AxBE9rNhvWLE5C2/wF7XwsTcxQM1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789749909; c=relaxed/simple;
	bh=F9Ooew1OnhYj+7+lRP3hdU3cYh095LxNYQoUPVEdLv0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ddyll/9XUzMeDp5NOSzFuI48wbJ3wkzR9nz9lQNTNzTQKuBxz5RvyPUG+U1vmwqyQE51uAEr/EZx60bc3inoxWeGQ+HXLxivMESj/B528trEfE5A5gFNdvNOLk2MeTBJkrWknt45GabpVUfPItrmO887aAO8VfvY3S0o/3L2tIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c2mus+4O; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c2mus+4O"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso920674a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789749908; x=1790354708; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BgrE+qMf44HKw8ZKydwe+LbuJjw2yiC2KnJN/ZD6phg=;
        b=c2mus+4OzheKe5TzI3x+uV6xvP7X2hy9U49NByBqW5arnwokLrqqwNs4kQ1q0OOnA4
         MFpL49eY/uR/O09NkFAkjiTZ0XuyajLQIAhOcyoqi2JWKLxfzVNBYVHA33H4NsdzpgDX
         +0yB86PkLPD7w1op4iPtCzgktWe0ab8mLoP86Diglv8YrMSfLkBDun4mWnp5ONQ21YWh
         fz0Z7CnMjFJXJ0wkm9lF7g0KOn9RjhufvSJt0VORWgFPgU2xGHTN3+lg9R9nzQzIxJ9G
         nUeA9z4QxZjs92HYSZWVI4kUvQWaa4/MHxbvh/EWgN/E8EAELjqyftYwecnaId7gayb/
         Fxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789749908; x=1790354708;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BgrE+qMf44HKw8ZKydwe+LbuJjw2yiC2KnJN/ZD6phg=;
        b=tkj68aqEyHjY/VN1zpGdSTn8P3u/pOTvKNJr89Y5Upg//K7ZqUyJyeJRcF4qKAe8hy
         lzf6TQBNe0czR+szArGvdG159NjZh4gemg8/lWWdvIrfnO5NOlTjwxqN+n/H1z8TRDV8
         THayXyjhDtl2fXXCd3j4duXb6cDx2mzxRGWBdHia36v91Jk4WQXcR0OG8c0pwdljlOpH
         UtVlzGn1T6KYj8byrjDciTNQOIlg5T4f5BeQRrvVVkXyHy7Xm7PxVRZGmViu07iFzBEX
         UhVhyRq0KGeyzCWnjXac49v5NwOqdoncU006TSjOGZadULtu8LBCyjP9YC38t79UJGoG
         j4YA==
X-Forwarded-Encrypted: i=1; AKwUvBx0Me94l19+Mpcbet7Y4jOXnYgiC4a9w575N+/UW9KfyZIryk6paiAHp02aOyxYj4N8/f21dr+Ji2MsvA0=@vger.kernel.org
X-Gm-Message-State: AFuF++kOtk1U3chTL9plsJuZEhrb4cH44bXYqFQW9oyuBOpe7E6M3vU1
	qJ5dhpU6sG93ONDAwZheH6Ir1yncgiBlEpDw8spLzvfghXGEgy0rYLbi
X-Gm-Gg: AYBFou0eLQAFd/Yz1SXStOCEADnNe1LnS3CEsQrJv1WPuhd7P1Rv/1H3L1xpH77knG+
	HadsqgWC5e5kB/Vin2AwtoY4GlBANQw2Hbuieu8RPXU1aZR7ZCKXINQoOMLioi1XEoaulhgDZh5
	jnYHo7PATZfiMR0pZVDIyMkhLrpuYNPmK5qCRtrDUFTdLsHImgIdjKiykeJXnINuvKfbN8n4PTL
	dAZHnvwYb30QTMdA4jKsCxAI9flZLZdN3PjnjowhH2u9XYkKx7hcTY04jpigk38LXPSF8H6hydp
	Na8SUHaLpgVhct5WAPbSFfHwFC3ZRph+vVAvBnBgN//Bpdni88a1TkFkhLfFs7SNT4Q2Aj6vIc6
	85f9CXYxXtS4ytxo0Y9bo958FpF89a1j/5gXiLneXk7jfP52GVt5NVfcP06gqAM4r6nSSRqDJc3
	27s7/cQSW9G1IwX/VVGto0hBInl4tYWQRVvv1iYTi2OWSkR6DJKT1rdvub9HBzPxgi+OgqpYtJc
	TSLn0I7YWSKirGYM+V7AvQB8h0=
X-Received: by 2002:a17:90b:2f47:b0:39d:eca2:5c81 with SMTP id 98e67ed59e1d1-39e54b19f9fmr7403518a91.8.1789749907789;
        Fri, 18 Sep 2026 09:45:07 -0700 (PDT)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6ca86d83sm206717a91.6.2026.09.18.09.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:45:07 -0700 (PDT)
From: Cong Nguyen <congnt264@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: cadence: fix clk disable/unprepare underflow warning on remove
Date: Fri, 18 Sep 2026 23:45:00 +0700
Message-Id: <20260918164500.2726242-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cdns_i2c_probe() enables id->clk via devm_clk_get_enabled(), which
auto-disables/unprepares it on unbind. Runtime PM autosuspend
separately enables/disables the same clock as the device idles and
wakes. remove() never forces the device back active first -- if it's
runtime-suspended at removal (routine after any idle period, not a
rare race), the devm cleanup then disables an already-disabled clock,
hitting the "already disabled"/"already unprepared" WARN().

i2c-imx.c has the identical shape and already gets this right:
pm_runtime_get_sync() first, balanced with pm_runtime_put_noidle()
before the final disable. Apply the same fix here.

Fixes: 3d36dd1161ca ("i2c: cadence: Simplify using devm_clk_get_enabled()")
Assisted-by: LLM
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/i2c/busses/i2c-cadence.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index da8770182a18..d0919593456b 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1625,14 +1625,21 @@ static int cdns_i2c_probe(struct platform_device *pdev)
 static void cdns_i2c_remove(struct platform_device *pdev)
 {
 	struct cdns_i2c *id = platform_get_drvdata(pdev);
+	int ret;
+
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0)
+		dev_err(&pdev->dev, "Failed to resume device (%pe)\n", ERR_PTR(ret));
 
-	pm_runtime_disable(&pdev->dev);
-	pm_runtime_set_suspended(&pdev->dev);
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 
 	i2c_del_adapter(&id->adap);
 	clk_notifier_unregister(id->clk, &id->clk_rate_change_nb);
 	reset_control_assert(id->reset);
+
+	pm_runtime_put_noidle(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
 }
 
 /**
-- 
2.25.1

