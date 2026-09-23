Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAD240DB53
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 17:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790185684; cv=none; b=RnqMSObWNJ7UWOZgI+ME7KOoMkWUo4UaYwmu95wxkkGZGuchfo3bms/iY7R4PCeqbx7Kbl4Cbuu2AESs85geQyh6C0Ss1Lh0Jy9mqqUERiDYXg4Veeu5U+4MwXAy8CC8g/YtG17QNhz1W6iZs0YIHsME8+FjUEWzhjHR/GU+13A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790185684; c=relaxed/simple;
	bh=kGdswbKWUnh/5oiqXUgwaChvMJJR5rTLM1IBnURhykg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxuwKlmE0utbKDKobQvcaEuvtUWJzOZfhmcLLnLuMCZw5JR7nDbHXsiuwSlt2xQ4rKyL9CetqDjVFdeq2ybuhgBnWs0SZrgWetfkRl3Mu1DZcUOqe/lT0XRJ+uh4+kNcVkfx6tDk8vvfW01tlzwbcax9nqKkJ2i+Efd5ycxhnTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PDkaNtHs; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PDkaNtHs"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39b2ad83dc6so899701a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790185681; x=1790790481; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TuS/hiw82xHN2Jmis0MyKFIEJvuWhPa9iLIYrihg8LE=;
        b=PDkaNtHsSOG3mCBnsXa5/kMXYCJxUhVRQ7/ca3BcE3zeZcBdPf+S/6f5zXIl9ywnaA
         0Q2jG7z5f0ECVg3NeVxzqSrDQkuXftVSAWVE9F6Yfde6DbsmvY38IXl2XzB3ApDu6wfq
         dU3i5rAFfh7BSAsnnMoZO4IyXZ/F/slhwdRSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790185681; x=1790790481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TuS/hiw82xHN2Jmis0MyKFIEJvuWhPa9iLIYrihg8LE=;
        b=UqSVJ0kFH4IT6CWY7SUlwYhCW/ut58Q9B2+e63z6SCrBAVst7VJcH7SjEycNwCO8ju
         +17BWxGW4lAJHunu+CCdbHFZSj7Y284y/p6bSKmllF196ibyz7h3nBuAvzRRfLTT0bH2
         rtsAym9hE49k9f/I6HC/OMuMN00+Aynx9cd6gL7R6bD+0JCFmGK0ycQPXiaFOhyGm1K+
         ZixmW+4Hwzn+nk1IT5iM9X1LsyB2EUYANZnY/D2Um3c86yt+Utb1eM+dCHeQPKpdbMR9
         DIV3txtFkx6SL2GSxqJYXwWvazOBMvN5tIZLvCFqVegSFQc8SA4eFVqvzTmGEH45l9B8
         AFLw==
X-Forwarded-Encrypted: i=1; AKwUvBxQwxydWUGTot7WU0P9kj+Yt09ZOOlXPgyNGR+8sE4ntzMutRHQxXja29L+wN2Cr7zX1VcFKsqiA4WnKrc=@vger.kernel.org
X-Gm-Message-State: AFuF++kpynksFjAJcsk9nJD8dX/H5FYVjVtS22kkZFwcHrWFI6Lof9BN
	V2zcsS5mcAOxWAc4/6PgxTEOe9521OkYGjzHb2QRqHRnMxzIXzQT5/l5T4csmjjkuQ==
X-Gm-Gg: AYBFou12vfWlYgkL5ssRDtu9+c3K2MhpHPCis8moQV2LK38NRqZe/dh94NKylANxSfy
	d/06iss4cqcClLcw7qFN1YUv9uF2RgDMsKmZMUMJkrzaOyu0cw95iPVZWZyJWCx+peUM6088hKB
	QfKdcKNDl8bTFloUFwXg+0PF3r6sjSqgYdNaSIoehgQlCHUrjhFudT7k3YOC+4W3NlK3r5o92/q
	mVguD75kRewiobEg1EOhRo6AUx5jkcUs0tJVDVslm0kiAAeKx/ktXxxpQ9Rhqvog1ce9O7LqbQg
	x6srlUOCXfs3FQDHy+tPXKjEY6wtT6NJI+yDurao+xKhKy+d7AiHltPGcZS/yiHEqy+KDwwWl3F
	nGlJXwtoMJ6NX7GrQVwhc5fvJmJM2z+c6fG94+lp95A3LKrsFvAvJxky//ig0ZDKRTtfabZcC/M
	AjDt6yCCPx8tFiNuqD1O4Ty3IYp4mV7FO/nD1fuzf/q7a6dFVuAjibDfTbc+uwE87eBtf8evQ2W
	JcwfKPiWPJ1YkussiH6lpKGz+PvOMrjC/5Abyax8I5m34yE
X-Received: by 2002:a17:90b:520f:b0:39e:4c7e:f040 with SMTP id 98e67ed59e1d1-3a07e583271mr3102837a91.29.1790185681194;
        Wed, 23 Sep 2026 10:48:01 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:642b:a4c2:7ea5:5668])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3a0976c8f8dsm151602a91.12.2026.09.23.10.47.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 10:47:57 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ulf Hansson <ulfh@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Doug Anderson <dianders@chromium.org>,
	linux-kernel@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 8/8] PM: runtime: Add Example Driver Patterns section
Date: Wed, 23 Sep 2026 10:40:32 -0700
Message-ID: <20260923104031.v2.8.I75ceea7b1afd016e08922e47b82e6eb36de144fe@changeid>
X-Mailer: git-send-email 2.56.0.rc1.310.g51773c2048-goog
In-Reply-To: <20260923174711.1283986-1-briannorris@chromium.org>
References: <20260923174711.1283986-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The runtime PM API surface is pretty large, but there are a few common
patterns that many drivers should follow. Add some illustrative
examples, to help guide the most common audience for runtime PM docs --
driver writers.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
 * Add appropriate teardown to "Probe with Hardware Powered Off"
   Example, as the remove() + power-off behavior is subtle here, and
   easy to get wrong

 Documentation/power/runtime_pm.rst | 367 ++++++++++++++++++++++++++++-
 1 file changed, 366 insertions(+), 1 deletion(-)

diff --git a/Documentation/power/runtime_pm.rst b/Documentation/power/runtime_pm.rst
index 7bb64d793cdd..3a615d2de103 100644
--- a/Documentation/power/runtime_pm.rst
+++ b/Documentation/power/runtime_pm.rst
@@ -641,7 +641,9 @@ The implementation is well suited for asynchronous use in interrupt contexts.
 However such use inevitably involves races, because the PM core can't
 synchronize ->runtime_suspend() callbacks with the arrival of I/O requests.
 This synchronization must be handled by the driver, using its private lock.
-Here is a schematic pseudo-code example::
+Here is a schematic pseudo-code example:
+
+.. code-block:: c
 
 	foo_read_or_write(struct foo_priv *foo, void *data)
 	{
@@ -707,3 +709,366 @@ pm_runtime_autosuspend_expiration() from within the ->runtime_suspend()
 callback while holding its private lock.  If the function returns a nonzero
 value then the delay has not yet expired and the callback should return
 -EAGAIN.
+
+.. _Section 10:
+
+10. Example Driver Patterns
+===========================
+
+The runtime PM API is large and complex, but most device drivers follow a small
+set of canonical patterns when interacting with runtime PM. This section
+illustrates standard patterns for device probing, performing I/O, and handling
+interrupts.
+
+Probe and Initialization
+------------------------
+
+Basic Probe
+~~~~~~~~~~~
+
+A driver that powers on its hardware during probe and does not use autosuspend
+can initialize runtime PM using device-managed helpers:
+
+.. code-block:: c
+
+	static int foo_probe(struct platform_device *pdev)
+	{
+		struct device *dev = &pdev->dev;
+		struct foo_priv *priv;
+		int ret;
+
+		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+		if (!priv)
+			return -ENOMEM;
+
+		/* Power on and initialize hardware registers... */
+
+		/*
+		 * The code above left hardware powered on and operational, so
+		 * tell the PM core that the device is active before enabling
+		 * runtime PM.
+		 */
+		pm_runtime_set_active(dev);
+
+		ret = devm_pm_runtime_enable(dev);
+		if (ret)
+			return ret;
+
+		/*
+		 * Alternatively, the above two calls can be combined into:
+		 * ret = devm_pm_runtime_set_active_enabled(dev);
+		 * if (ret)
+		 *     return ret;
+		 */
+
+		/*
+		 * Upon successful return from ->probe(), the driver core
+		 * automatically executes pm_request_idle(dev), allowing the
+		 * device to suspend asynchronously if its usage counter is zero.
+		 */
+		return 0;
+	}
+
+Probe with Hardware Powered Off
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Many drivers prefer to keep hardware powered off or in low power until
+actually needed, avoiding duplicate power sequencing logic between ->probe()
+and ->runtime_resume(). Because the initial runtime PM state of a device is
+suspended by default, the driver can enable runtime PM directly and rely on
+pm_runtime_resume_and_get() to trigger the ->runtime_resume() callback when
+probe needs to access hardware:
+
+.. code-block:: c
+
+	static int foo_runtime_suspend(struct device *dev)
+	{
+		struct foo_priv *priv = dev_get_drvdata(dev);
+
+		clk_disable_unprepare(priv->clk);
+		regulator_disable(priv->supply);
+
+		return 0;
+	}
+
+	static int foo_runtime_resume(struct device *dev)
+	{
+		struct foo_priv *priv = dev_get_drvdata(dev);
+		int ret;
+
+		ret = regulator_enable(priv->supply);
+		if (ret)
+			return ret;
+
+		ret = clk_prepare_enable(priv->clk);
+		if (ret) {
+			regulator_disable(priv->supply);
+			return ret;
+		}
+
+		return 0;
+	}
+
+	static int foo_probe(struct platform_device *pdev)
+	{
+		struct device *dev = &pdev->dev;
+		struct foo_priv *priv;
+		int ret;
+
+		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+		if (!priv)
+			return -ENOMEM;
+
+		platform_set_drvdata(pdev, priv);
+
+		/* Acquire regulators, clocks, GPIOs, and register map... */
+
+		/*
+		 * Hardware starts powered off. The default state is
+		 * RPM_SUSPENDED, so no need for:
+		 * pm_runtime_set_suspended(dev);
+		 */
+
+		pm_runtime_enable(dev);
+
+		/*
+		 * Power on the device via ->runtime_resume() to verify device
+		 * ID or perform initial hardware configuration.
+		 */
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret < 0)
+			goto err_pm_disable;
+
+		ret = foo_verify_hardware_id(priv);
+		if (ret) {
+			pm_runtime_put_sync(dev);
+			goto err_pm_disable;
+		}
+
+		/*
+		 * Drop the usage counter, allowing ->runtime_suspend() to
+		 * power off the device until an I/O request arrives.
+		 */
+		pm_runtime_put(dev);
+
+		return 0;
+
+	err_pm_disable:
+		pm_runtime_disable(dev);
+		return ret;
+	}
+
+	static void foo_remove(struct platform_device *pdev)
+	{
+		struct device *dev = &pdev->dev;
+
+		pm_runtime_disable(dev);
+		if (!pm_runtime_status_suspended(dev))
+			foo_runtime_suspend(dev);
+	}
+
+Note that this pattern requires ``CONFIG_PM``. When ``CONFIG_PM`` is
+disabled, pm_runtime_resume_and_get() returns 0 without calling
+->runtime_resume(), leaving hardware unpowered. Drivers using this pattern
+should typically depend on ``CONFIG_PM``.
+
+Drivers using this pattern should also ensure that hardware is powered off
+cleanly upon driver unbind. If the device was still active when detached (for
+example, if user space configured ``/sys/devices/.../power/control`` to
+``on``, or if an operation was ongoing), the ->remove() callback disables
+runtime PM, checks whether the device is not yet suspended using
+pm_runtime_status_suspended(), and manually invokes foo_runtime_suspend().
+
+Autosuspend Probe
+~~~~~~~~~~~~~~~~~
+
+If the driver uses autosuspend, it configures the autosuspend delay and enables
+autosuspend before enabling runtime PM:
+
+.. code-block:: c
+
+	static int foo_probe(struct platform_device *pdev)
+	{
+		struct device *dev = &pdev->dev;
+		struct foo_priv *priv;
+		int ret;
+
+		priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+		if (!priv)
+			return -ENOMEM;
+
+		/* Power on and initialize hardware registers... */
+
+		/* Set autosuspend delay (e.g. 2000 ms) and enable autosuspend */
+		pm_runtime_set_autosuspend_delay(dev, 2000);
+		pm_runtime_use_autosuspend(dev);
+
+		pm_runtime_set_active(dev);
+
+		/*
+		 * Update last busy timestamp so the driver core's post-probe
+		 * pm_request_idle() respects the autosuspend delay.
+		 */
+		pm_runtime_mark_last_busy(dev);
+
+		/*
+		 * devm_pm_runtime_enable() ensures that pm_runtime_disable()
+		 * and pm_runtime_dont_use_autosuspend() are called upon driver
+		 * unbind.
+		 */
+		ret = devm_pm_runtime_enable(dev);
+		if (ret)
+			return ret;
+
+		return 0;
+	}
+
+Performing I/O Operations
+-------------------------
+
+Before accessing hardware registers or initiating I/O transfers, drivers must
+ensure the device is active by calling pm_runtime_resume_and_get() or similar.
+
+Basic I/O
+~~~~~~~~~
+
+For devices without autosuspend, work completion is signaled with
+pm_runtime_put(), which drops the usage counter and queues an asynchronous idle
+check once the counter reaches zero:
+
+.. code-block:: c
+
+	int foo_do_transfer(struct foo_priv *priv, void *buf, size_t count)
+	{
+		int ret;
+
+		ret = pm_runtime_resume_and_get(priv->dev);
+		if (ret < 0)
+			return ret;
+
+		/* Access hardware registers or perform data transfer... */
+		ret = foo_hardware_transfer(priv, buf, count);
+
+		/*
+		 * Drop usage counter and request asynchronous idle check (and
+		 * suspend, if possible).
+		 */
+		pm_runtime_put(priv->dev);
+
+		return ret;
+	}
+
+Autosuspend I/O
+~~~~~~~~~~~~~~~
+
+For devices using autosuspend, work completion is signaled with
+pm_runtime_put_autosuspend(), which drops the usage counter and defers
+suspension until the autosuspend delay expires:
+
+.. code-block:: c
+
+	int foo_do_transfer(struct foo_priv *priv, void *buf, size_t count)
+	{
+		int ret;
+
+		ret = pm_runtime_resume_and_get(priv->dev);
+		if (ret < 0)
+			return ret;
+
+		/* Access hardware registers or perform data transfer... */
+		ret = foo_hardware_transfer(priv, buf, count);
+
+		/*
+		 * Drop the usage counter and schedule an autosuspend once
+		 * the delay expires. Note that pm_runtime_put_autosuspend()
+		 * updates the last-access timestamp automatically.
+		 */
+		pm_runtime_put_autosuspend(priv->dev);
+
+		return ret;
+	}
+
+Synchronous Completion
+~~~~~~~~~~~~~~~~~~~~~~
+
+When immediate suspension is desired -- such as before unregistering a
+device or during shutdown -- synchronous put helpers can be used instead of
+their asynchronous counterparts. Which helper to use depends on whether
+autosuspend is configured:
+
+* For non-autosuspend devices, use pm_runtime_put_sync().
+* For devices that use autosuspend, use pm_runtime_put_sync_suspend(), which
+  ignores any configured autosuspend delay and forces immediate suspension.
+
+However, note several important caveats when relying on synchronous runtime
+PM helpers for power-down:
+
+* **Parents and Suppliers**: While the target device itself is suspended
+  synchronously, the PM core handles idle notifications for parents and
+  device link suppliers asynchronously. As a result, parent devices or
+  power domain suppliers are not guaranteed to be powered off when the
+  function returns.
+* **User Policy ("Forbidden")**: Runtime PM helpers respect system policy.
+  If user space has set ``/sys/devices/.../power/control`` to ``on``
+  (pm_runtime_forbid()), the PM core holds an extra reference on the
+  device, meaning dropping the driver's usage counter will not trigger a
+  suspend.
+
+Because of these constraints, synchronous put helpers may not be suitable
+when a driver functionally requires hardware to be powered off
+synchronously (for example, to perform a hardware reset or power cycle).
+Such requirements may necessitate other methods, such as disabling runtime
+PM with pm_runtime_disable() and explicitly executing the hardware
+power-down sequence.
+
+Interrupt Handling with Conditional Get
+---------------------------------------
+
+Interrupt handlers (especially in atomic or hardirq context) cannot typically
+invoke pm_runtime_resume_and_get(), because runtime-resume may sleep. Moreover,
+if an interrupt arrives while the device is suspended or transitioning to low
+power (e.g., on a shared interrupt line or spurious wakeups), attempting to
+read hardware registers could trigger a bus fault or system hang.
+
+To handle this safely, drivers can conditionally acquire a runtime PM reference
+using pm_runtime_get_if_in_use() or pm_runtime_get_if_active():
+
+.. code-block:: c
+
+	static irqreturn_t foo_irq_handler(int irq, void *dev_id)
+	{
+		struct foo_priv *priv = dev_id;
+		irqreturn_t ret = IRQ_NONE;
+
+		/*
+		 * Check if the device is active before reading hardware
+		 * registers. If the device is suspended, this interrupt
+		 * cannot belong to us (or was already serviced).
+		 *
+		 * Note that this also will drop interrupts while runtime PM is
+		 * disabled.
+		 */
+		if (pm_runtime_get_if_active(priv->dev) <= 0)
+			return IRQ_NONE;
+
+		/* Hardware is active and usage count is incremented */
+		if (foo_has_pending_irq(priv)) {
+			foo_service_irq(priv);
+			ret = IRQ_HANDLED;
+		}
+
+		/*
+		 * Release the reference acquired by pm_runtime_get_if_active().
+		 * For autosuspend devices, use pm_runtime_put_autosuspend();
+		 * for non-autosuspend devices, use pm_runtime_put().
+		 */
+		pm_runtime_put_autosuspend(priv->dev);
+
+		return ret;
+	}
+
+Both pm_runtime_get_if_in_use() and pm_runtime_get_if_active() are safe to use
+from an interrupt routine. One example where a device might be active but not
+"in use" is if autosuspend is used. A device will stay active for a while with
+no users. If interrupts should still be serviced for a device in this state,
+pm_runtime_get_if_active() should be used.
-- 
2.56.0.rc1.310.g51773c2048-goog

