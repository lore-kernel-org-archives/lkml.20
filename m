Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE22347FB00
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 23:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022222; cv=none; b=IoXGQ9D7ebbTIptCqvRfjwWY+P9QRJJugkEegdaY4iFYET0Qw7IAMq25pTgqFIZ5L/5OoTznwsf4r3TeQGYdY4EKX/7AcDvq1d3LY9M0e06BHG/bBg5+J6vPwj/aiU7lBfR/ggyAmUCb5nMnPprzy6aUHY3i+Skhvy0cRhuhpmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022222; c=relaxed/simple;
	bh=hLZglLUb6/M8avFMUY4DETPKC/OcQ8W4VsuJaizRjlY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u5fBmyPPEhTlXT2corOMA52yYUJ5OSwCZpzwkFFWe1B5JVWpXLMkEt9zGkYLxjlcyxbfKqTLYde9A11M1WDPZuG34ldyZyVyZ5Q/PJsbAZ3CZDrfcKGE2iVtdgIXKHifUkhG97MgxPxkVaZd1JGyNF8CROVQ8a0rQddw319CakE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=Tq+sT22J; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="Tq+sT22J"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35c76e9614aso2867361eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 16:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792022220; x=1792627020; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MXtvsMWEZDszE2uQQOHilHK7ejv7jH66bQFcbnUr/Yc=;
        b=Tq+sT22JBLnJC4G6EW98fGZapEkjEQ8WZTLi76QmBoD7b2YKTEUFPHa8WYB7j4qJof
         5YkS/ehZJEbjnElBuXS3o4wgeCjHSZ4P+SIvZFZCWWWQfwnO7oixM4veLS97Mb4dQ2Sx
         R5RboHHSuxPZ4ES+Ugt/N1MJBa5Alx/dzbCgSM74BJ5BRsxLuyMT4zjZF7MmM64ElORo
         UlHh14XeryHTQBRqAYqobM05oKiZq+uAsnxra47oU0sLn/OoS6equ2gsUsyXR9RNwgVa
         EQCpCjcMTH7iFvQtPX1hN1CiHi5rZygolMX77mP1d2TtlHuQgEG+txOq4INyPnyq3wfc
         YN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792022220; x=1792627020;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=MXtvsMWEZDszE2uQQOHilHK7ejv7jH66bQFcbnUr/Yc=;
        b=vpkaPe0X5k/zzHcVqosB4+/th+kALybTi/ar53/xBaTy//3KxT78YM46CdAECItgjz
         aF7UsSLWhY5aAL2pIJjvKVd+Pw4s2+AglWkUHmIjDYZljuuysqiO4a1KWxudR2E6Hurd
         ErB1zmzXH0ZNjOZGOp88YaOMzebLYrqFQ+Ay+ZuB8ZPQ6M7AApFYlgjqJiLaBG2mH25O
         G9tt1towpkIlta60s3cLq2yBbGc2qH+C7+B+PuWIwjKt73iaetf9Oyp//G5GRpluTk6A
         kRhrlkO1/PcG2/pRoSUm5NVJhS4Ts2+7xyQdxe6m4z2FNqY2ooosF3k2VnL38ldNs6wm
         tsuA==
X-Forwarded-Encrypted: i=1; AKwUvByMqfdDzCPXlZEhmvGLwl+lq6j7bYAu0qPJoLrG/n+wvNLEcgvBve+DRb7Ma1g5jRtWTOKjgJKq3YA42Xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzt8yBw5i44Wxx4JsHp6vtPlFJme8ghNuFqrtfPunKJlt4c/z4
	uXVE/SYpmjKdZYpDurpe69cI4Ab3JZCppfexG6MTnntpCIxSDwxFRIvFGjX9eWEAJ4cJqO11Dze
	VhygwSG4=
X-Gm-Gg: AYBFou1w3VUIqGXR5bFtg8xKc1LgJ+Jq89ZQRM2fhKuWHx6souMNCuywI2w9AsfGIVY
	jCFyu7G0fPpfov2vZtPOcYiXavA8lDLHTBZ3zZBicX0ESK/oXUmhB9dFM3CHA6J45NlLRFOB+zA
	iq5THdkeufXv7kIFTHzH+5aCoybE/TrndPOa3BdQTRDWc/ZPua717WgLEvIxHq0NGVVgN8dKObH
	IkKjIQc5N+v4Wt8g+layACEJscQsTg6vkF9BMLm5MwgUfBx5iB3EuZatsFUt48HUGuS05q2YIvC
	gTrTGshQoWf6OAGJFiXns6YM/0YucFSjdu/LK+NjmjAGw9W7pQCkj4B1PBtmNwRLH47RnvVZY6O
	i4/WChqaNzaq6/Jn2kJ1RYjnuxLjGzA0lvQSi9pGDixjN89YHinZQCopQTM44I5nooOGxWmjy36
	gBObOGbHNHtt9hMEaiwTyq1rhcwMm2AXEAzZ+JuYsy5hqGFtfnR1nLyLkFZeNSN7FAZhNX7IMNo
	g==
X-Received: by 2002:a05:7301:fc18:b0:341:2466:2d68 with SMTP id 5a478bee46e88-3537e0cf2a1mr23131820eec.38.1792022219535;
        Wed, 14 Oct 2026 16:56:59 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35f0c3bcf80sm1759673eec.7.2026.10.14.16.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:56:59 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Wed, 14 Oct 2026 16:56:55 -0700
Subject: [PATCH v8] i2c: xiic: restore non-managed runtime PM to fix clk
 WARN flood
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-i2c-xiic-restore-runtime-pm-teardown-v8-1-40668c270069@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53Sy07DMBAF0F+pvMZo/I674j8QCz8m1EhNIicNQ
 VX+HbtsgrIJLK80Otea8Z2MmBOO5Hy6k4xzGlPfldA8nUi4uO4daYolEw5cQ8METTzQJaVAM45
 Tn5HmWzelK9LhSid0OfafHY0RnGfR8wCcFGrI2KblUfP69pPHm//AMFW7TlxS1b4e75hZnftj5
 cwoo4Amtp6DNhZeOlymSz88u0Rq58y3qjyo8qIahypCENC2fKeKrdocVEVRVRsFUx5Mg2ynyq1
 qD6qyqNpai14KGVnYqWqjcjioqqIGp6K3GpSCZqfq/6i6biB6FYQBgW5/LbNV2UHVFNUqieUDa
 MWk/KWu6/oNFtlSLe8CAAA=
X-Change-ID: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792022218; l=9498;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=hLZglLUb6/M8avFMUY4DETPKC/OcQ8W4VsuJaizRjlY=;
 b=tpyXJ1ADpdKBPrfXJEAu9joPXTZvN4++AGGay4Ep8CFo5zPvNg4bE/SI9tQGCFiSZIT5pfpl/
 H+q5KqnEojGCJWNCUh94ZZnw/h5skhh+0v/mAUPdKBZC10KRgoXBmu6
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

The devres conversion replaced manual pm_runtime_enable()/disable() with
devm_pm_runtime_set_active_enabled() and dropped the remove-time runtime
PM teardown. The managed release tears runtime PM down in the wrong
order: it calls pm_runtime_dont_use_autosuspend() before
pm_runtime_disable(), i.e. while runtime PM is still enabled, and devres
is LIFO so the devm_clk_get_enabled() release runs afterwards.

At remove(), pm_runtime_put_sync() leaves the device active with the
autosuspend timer armed. Clearing use_autosuspend then makes rpm_idle()
suspend immediately, and xiic_i2c_runtime_suspend() clk_disable()s the
clock. The later devm_clk_get_enabled() release clk_disable_unprepare()s
the already-disabled clock, so clk_core_disable() WARNs ("clkN already
disabled") on every teardown.

Drop the managed helper and restore the non-managed runtime PM setup and
teardown, so runtime PM is enabled once in probe and disabled once in
remove and the clock enable count stays balanced.

Order the remove teardown so runtime PM is disabled before the usage
count is dropped: pm_runtime_disable() followed by pm_runtime_put_noidle()
instead of pm_runtime_put_sync(). Dropping the count first with autosuspend
still enabled arms the autosuspend timer, and a preemption before
pm_runtime_disable() lets it expire, suspend the device and clk_disable()
the clock, which the devm release then disables again - the same WARN.

Restore the non-managed IRQ request as well. The probe error paths now
unwind runtime PM by hand via goto, and a devm-registered handler is only
freed later during devres unwind, so it would stay live across the manual
teardown (and across any future failing step added after it). Request the
IRQ with request_threaded_irq() and free it explicitly in the probe error
path and in remove. The probe error path also clears use_autosuspend, to
match the teardown in remove().

Fixes: 50c63491ff26 ("i2c: xiic: switch to devres managed APIs")
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
Andy, you said v7 looked okay to you [1]. If you are still happy with
it, a Reviewed-by would help it along.

[1] https://lore.kernel.org/all/aqJQ8Qm_nhBaWR-s@ashevche-desk.local/

Changes in v8:
- Resend. The code is identical to v7; only the base moved, to v7.3-rc7.
- v7 has been on the list since 21 August with no maintainer reply.
  Andy Shevchenko was happy with it on 10 September [1]. Pinged on
  21 and 24 September.
- Still a regression from 50c63491ff26 ("i2c: xiic: switch to devres
  managed APIs"), which shipped in 7.1 and is still in 7.2 and 7.3:
  every unbind/rmmod WARNs "clkN already disabled".
- Link to v7: https://patch.msgid.link/20260821-i2c-xiic-restore-runtime-pm-teardown-v7-1-954e06765144@nexthop.ai

Changes in v7:
- Add the missing kernel-doc entry for the new @irq member of struct
  xiic_i2c (the non-managed IRQ request added in v4 introduced the field
  but not its doc), fixing a "struct member 'irq' not described" W=1
  kernel-doc warning. No functional change.
- Link to v6: https://patch.msgid.link/20260820-i2c-xiic-restore-runtime-pm-teardown-v6-1-5db5c3703ea0@nexthop.ai

Changes in v6:
- probe: check the pm_runtime_set_active() return value and unwind on
  failure (undo pm_runtime_use_autosuspend()) instead of ignoring it.
  On failure runtime PM would stay suspended while the clock is left
  enabled, and remove()'s pm_runtime_get_sync() would then resume, enable
  the clock a second time and leak the enable across the manual teardown
  (Sashiko).
- Link to v5: https://patch.msgid.link/20260820-i2c-xiic-restore-runtime-pm-teardown-v5-1-ca5db9605508@nexthop.ai

Changes in v5:
- remove(): disable runtime PM before dropping the usage count
  (pm_runtime_disable() + pm_runtime_put_noidle() instead of
  pm_runtime_put_sync()), so the armed autosuspend timer can no longer
  race pm_runtime_disable() and re-trigger the clk double-disable.
- probe error path: also call pm_runtime_dont_use_autosuspend() so it
  mirrors the teardown in remove().
- Link to v4: https://patch.msgid.link/20260819-i2c-xiic-restore-runtime-pm-teardown-v4-1-6999eb434d1c@nexthop.ai

Changes in v4:
- Request the IRQ non-managed (request_threaded_irq/free_irq) and free it
  in the probe error path and in remove(), instead of a devm handler that
  would only be released during devres unwind and so stay live across the
  manual runtime PM teardown in the goto error paths (Andy).
- Link to v3: https://patch.msgid.link/20260818-i2c-xiic-restore-runtime-pm-teardown-v3-1-5fd315b078e1@nexthop.ai

Changes in v3:
- Drop the managed devm_pm_runtime_set_active_enabled() helper entirely
  and restore the non-managed runtime PM setup (pm_runtime_set_active +
  pm_runtime_enable, with probe error unwinding) and teardown
  (pm_runtime_disable + set_suspended + dont_use_autosuspend), so the
  disable depth stays balanced rather than being disabled twice (Andi).
- Link to v2: https://patch.msgid.link/20260814-i2c-xiic-restore-runtime-pm-teardown-v2-1-7ae5d0c30ff2@nexthop.ai

Changes in v2:
- Move the Signed-off-by into the commit message proper (Andy).
- Link to v1: https://patch.msgid.link/20260813-i2c-xiic-restore-runtime-pm-teardown-v1-1-0e7dfb206790@nexthop.ai

To: Michal Simek <michal.simek@amd.com>
To: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-i2c@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/i2c/busses/i2c-xiic.c | 49 +++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 5e397a7e63f6..ba560462d451 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -67,6 +67,7 @@ enum i2c_scl_freq {
  * @rx_pos: Position within current RX message
  * @endianness: big/little-endian byte order
  * @clk: Pointer to AXI4-lite input clock
+ * @irq: Interrupt number
  * @state: See STATE_
  * @singlemaster: Indicates bus is single master
  * @dynamic: Mode of controller
@@ -95,6 +96,7 @@ struct xiic_i2c {
 	int rx_pos;
 	enum xiic_endian endianness;
 	struct clk *clk;
+	int irq;
 	enum xilinx_i2c_state state;
 	bool singlemaster;
 	bool dynamic;
@@ -1506,9 +1508,17 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	pm_runtime_set_autosuspend_delay(dev, XIIC_PM_TIMEOUT);
 	pm_runtime_use_autosuspend(dev);
-	ret = devm_pm_runtime_set_active_enabled(dev);
-	if (ret)
+	/*
+	 * Enable runtime PM by hand: devm_pm_runtime_set_active_enabled()
+	 * tears down in an order that races the devm-enabled clock release and
+	 * makes clk_core_disable() WARN (see xiic_i2c_remove()).
+	 */
+	ret = pm_runtime_set_active(dev);
+	if (ret) {
+		pm_runtime_dont_use_autosuspend(dev);
 		return ret;
+	}
+	pm_runtime_enable(dev);
 
 	/* SCL frequency configuration */
 	i2c->input_clk = clk_get_rate(i2c->clk);
@@ -1517,10 +1527,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 	if (ret || i2c->i2c_clk > I2C_MAX_FAST_MODE_PLUS_FREQ)
 		i2c->i2c_clk = 0;
 
-	ret = devm_request_threaded_irq(dev, irq, NULL, xiic_process,
-					IRQF_ONESHOT, pdev->name, i2c);
+	/*
+	 * Request the IRQ non-managed: later probe steps unwind manually via
+	 * goto, so a devm handler could still be live after that teardown runs.
+	 */
+	i2c->irq = irq;
+	ret = request_threaded_irq(irq, NULL, xiic_process, IRQF_ONESHOT,
+				   pdev->name, i2c);
 	if (ret)
-		return ret;
+		goto err_pm_disable;
 
 	i2c->singlemaster = device_property_read_bool(dev, "single-master");
 
@@ -1537,14 +1552,16 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		i2c->endianness = BIG;
 
 	ret = xiic_reinit(i2c);
-	if (ret)
-		return dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
+	if (ret) {
+		dev_err_probe(dev, ret, "Cannot xiic_reinit\n");
+		goto err_free_irq;
+	}
 
 	/* add i2c adapter to i2c tree */
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret) {
 		xiic_deinit(i2c);
-		return ret;
+		goto err_free_irq;
 	}
 
 	if (pdata) {
@@ -1557,6 +1574,15 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 		res, irq, i2c->i2c_clk);
 
 	return 0;
+
+err_free_irq:
+	free_irq(irq, i2c);
+err_pm_disable:
+	pm_runtime_disable(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
+
+	return ret;
 }
 
 static void xiic_i2c_remove(struct platform_device *pdev)
@@ -1568,6 +1594,8 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	/* remove adapter & data */
 	i2c_del_adapter(&i2c->adap);
 
+	free_irq(i2c->irq, i2c);
+
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0)
 		dev_warn(dev, "Failed to activate device for removal (%pe)\n",
@@ -1575,7 +1603,10 @@ static void xiic_i2c_remove(struct platform_device *pdev)
 	else
 		xiic_deinit(i2c);
 
-	pm_runtime_put_sync(dev);
+	pm_runtime_disable(dev);
+	pm_runtime_put_noidle(dev);
+	pm_runtime_set_suspended(dev);
+	pm_runtime_dont_use_autosuspend(dev);
 }
 
 static const struct dev_pm_ops xiic_dev_pm_ops = {

---
base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
change-id: 20260813-i2c-xiic-restore-runtime-pm-teardown-dd0ab1db2c02

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

