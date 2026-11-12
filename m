Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794467377;
	b=cEwj8fluxRBdpGDTq6ZrZbiHeLnppbzDsMmKyS5USu+40v7HUwTv07+T1jll3cUkAVL1
	 +DgrZMoU6yoFqrRaqKFL6YJcDbWDe7UX+TTTaslqoFgoS5V4tC/wH//Ly5n7ffU5y7UxL
	 7AzV+bJOQmru9ItYOHAkTBjtM52jUfeg/J2LGerYc5iEzp2ryrazRlBBYIxh/ISaPRJDj
	 fouHX3dodl4HzrFyPrDglgXQg1526CvHdd2/HiAcl4A1fF5dUllRBk44FUVkcNwiC7qdU
	 DYPD+b1bh9I2Ol6NR7IVdEDHm0P9ny7bFrJZW9A6ORyY7t+vJvMcoGLjERndktZyt7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794467377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=S0APc5k9AFbKPXqPXYbOJ6kKE+5hRzD6v5T8n0OwCVE=;
	b=ZwEqS+/m1FZTGGUR8OwxhUEdYYYUzegX4axHDXve1o6boFW0LTVxBknggPsjsuIlHZaw
	 ot5xKKZFCMKZ1OphWzbVu89KaSlEgD1/gjv81TAiPnzITmePDw6H2qS7gDwrOvjtu3J4G
	 H0tn7p5tzWawVFiJK9DGEbmmfcJ+joSuz+btIlO+oBHUiNQtNSKa8F8KCR9MxT7URVJzR
	 b1VZ6lwvYUv8XHYCl1zxZUl1fGT6D9onVnUIanSm3R+ao9HvtoEaZNSTM78IItJCJ0KgA
	 BKkE5xec+n9sRMJMu9oUTDxKdFepH8zWUiZ0se6/quukJMlSLuemZ0qeSXFlmDb8j8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIAdieeE;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25E6606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25E6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cIAdieeE
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-14394530ec6so5358862c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 23:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794467376; x=1795072176; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S0APc5k9AFbKPXqPXYbOJ6kKE+5hRzD6v5T8n0OwCVE=;
        b=cIAdieeEEKPRKW/ojdNO8r4G+l+U17dvIr9LETWv+grprHT/f50FQpshYzpt0y9U0t
         NRsIBOZVJ0rKpllxqJ0GLNIrs6dmKkQY/PzIaryAK5BJIqBmlipP3EjMJFVFvlA1m147
         jK4TZLC8pb+txyQeHduj6UT3J1PdBw6j8GTG2/gBYkGaDjIcXFL8rqfKbNNHvQMe8G6N
         hJ0v1wJH37l7+nLXLPaNzLVohTw6kwC7KnKHEnOpfpygMb6BSKOixi6L0PfKmtXtZ/GH
         ER/XKu8vrRZwQpONZCjomdefoZTis4089QYbAdfKT8/LxCVbpZPJOtFaJZvL8sLQEhV+
         lN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794467376; x=1795072176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S0APc5k9AFbKPXqPXYbOJ6kKE+5hRzD6v5T8n0OwCVE=;
        b=mrIJYNuwvtU45J+fJYx8jBv6dC3gGKwVZCmhPiYJnSsRNHfXpCooW/yLIFHmda1BKy
         ahVj5myFngP/A1gLnN6YvaAGnJS1zwrsk494klSBvA7pAMM/emGS+VA+ruMZ3HEaLx4i
         ED18pkiDIziXeabn8lfOoRdAaVvLbyNW2ofasq6q+yjAvyBefFDqg6fJ2HasFTAa1sqg
         965E6H82UdmUoSnlF90I0e68I5ZT4iqCj7FChyTs2NAmq+0SxzbIYyNSxgTZq/MoPMx8
         OlcphjlrfUqOnf91VKmUIrI+6N1z3dftRwUm360Jo1+kW7t42hK65aaB+TAL1Q7pvdXC
         3K5Q==
X-Forwarded-Encrypted: i=1; AL+hErHtEmwmdl/3Zsxcpc0nk8McyWHjhQJZ14mTkeqbQHINaDkcz2VwprJZdTnu7FHOiluTI7Fwzh7qdVz8a4U=@vger.kernel.org
X-Gm-Message-State: APuU4Z/7TSCZpYgzlH7HsPWf+Xyc7irPt29vjQ1/gxRqVJv4CEqJCN2A
	NCqBZEF0TQOKogmUSU2I3cn1PSSOq3Rb/1J0dihUlZYfAJ1nUVLAdk88
X-Gm-Gg: AYBFou39Hk+T3hbjkJt9JDfXJuFmYt4I6wslnq4IGd9SOrM2OB6SnWGROZIPxSpkqtA
	NJAO6qwNDujnWBhqMyVJLCDEw7XRHWjV0PDuGHPZnYUYwN7ipoVOnxyjjS4t7zrrCZt2coZjXhC
	NLrKvGed9udP5x18W1T3Knl0uRjwXA/XPaAMqBY/3xNejgGvZAQeF6X1IVZVqrvf2bFJGvutRN7
	p7W32i+BlA71mpquOWfwUEt7LqJLQBh6ux30BE7wIeX0kjFNFZ9Bf3VJNsYfFqeBqanYFyYpLfX
	ll3KF3eMg0mJLbHFqVtF7ijS5XjonSl/caKSYiuZpiNEj7YeH/2OocbIEPg2NmJQYalx/AHR/Ra
	jwpiHIeVkkoRi62lWQF2/eUB52ekuIN5uvWH7GFME2iZi1u154HsGZKjLbIsFVP46DZvXHoreS/
	s++EKA2/Vaf1iv4CCuGp+HXVdrdGDzlz/QBuKNjRgkgFFpAGIbouAOQxfrH5FvDyJ9IlPyY0B2B
	oUi6l1RBLYcI02CafspomUXv4XnruKJoUf4F2EeqRl45fj6wsztOm0h0MlTqfzk7RLoy+E0hzjt
	nhD81Da4RHSl5tvTo5+qAiSHrtYEvglsFAO+QB5Vj5hk6kJzkaNuNQAWchqUfbrK5lA6VifqtJC
	dn4tza6hnHdE8baLnk14o6lMfMcKP6iu3Pl7ifXxUd6c=
X-Received: by 2002:a05:7023:a4d:10b0:1a8:4997:65f6 with SMTP id a92af1059eb24-1b3c0352128mr4389320c88.20.1794467375283;
        Wed, 11 Nov 2026 23:09:35 -0800 (PST)
Received: from lwq-System-Product-Name.. ([2602:feda:30:cafe:ec49:29ac:0:1866])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b4b90csm20646606c88.14.2026.11.11.23.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:09:34 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: sre@kernel.org
Cc: johannes.goede@oss.qualcomm.com,
	krzysztof.kozlowski@oss.qualcomm.com,
	xuhx@hust.edu.cn,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] power: supply: bq24190: fix supply lifetime on removal
Date: Thu, 12 Nov 2026 15:09:27 +0800
Message-Id: <20261112070927.2527413-1-shunsheng1218@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bq24190_probe() registers the charger and battery power supplies with
power_supply_register(), while the IRQ is device-managed and the
input-current-limit work was moved to a devm action by the commit
referenced in the Fixes tag below.  Both are only released after
bq24190_remove() returns, but remove() unregisters the supplies first,
so an IRQ handler or a delayed work that is still running can access a
freed power_supply.  Cancelling the work is not sufficient either: it
is queued from external_power_changed(), and a concurrent callback can
requeue it after the cancel.

The IRQ/supply lifetime mismatch predates that commit: the IRQ has
been devm-managed while the supplies were registered manually for a
long time.  The commit moved the work cancellation into devres as well,
which extended the same window to the delayed work.  Fix the whole
teardown order from the probe side instead of adding more manual
cleanup to remove():

  - register both power supplies with devm_power_supply_register() and
    drop the manual unregister calls;
  - register a devm action for runtime PM teardown so PM is disabled
    only after the IRQ and the supplies are released;
  - initialize the work with INIT_DELAYED_WORK() and let the single
    cancel action installed after the supplies own the final drain;
  - stop the work producer with a lock-protected flag, and drain the
    work with that action after the IRQ has been freed;
  - install the drain action on the battery registration failure path
    as well, since the charger is already registered and can queue the
    work at that point;
  - keep only the register reset and the balanced runtime PM get/put in
    remove().

Among the affected resources, teardown stops work requeueing, releases
the IRQ, drains the work, unregisters the power supplies, and then
disables runtime PM.  The regulator, wakeup and wake-IRQ actions
registered later run before the stop action.

Tested on 7.4-rc1 with a fake I2C adapter and supplier.  The unpatched
driver produces a KASAN slab-use-after-free in power_supply_get_drvdata()
from input_current_limit_work, with the object freed by bq24190_remove().
With this change, work-in-flight removal, normal removal, probe failure
after the supplies (hardware init, IRQ request, battery registration),
a supplier change during removal, and an IRQ handler stopped in
check_status() while remove() runs complete without KASAN reports and
leave no work running.

Link: https://lore.kernel.org/r/544415a1.22b25.1a1c5a0c926.Coremail.xuhx@hust.edu.cn
Fixes: 4f73a52df7d28 ("power: supply: bq24190: Avoid rescheduling after cancelling work")
Signed-off-by: Yaohan Li <shunsheng1218@gmail.com>
---
Changes in v2:
- Register the supplies and runtime PM teardown with devres, and drop
  the manual unregister/unroll from bq24190_remove().
- Add a lock-protected stopping flag so external_power_changed() cannot
  requeue the work after it has been drained.
- Initialize the work with INIT_DELAYED_WORK() and let the single cancel
  action installed after the supplies own the final drain; drop the
  duplicate devm_delayed_work_autocancel() action.
- Add IRQ-handler concurrency, probe-failure and requeue tests.

AI tools assisted with source review, patch iteration and test harness
development. The author reviewed the resulting code and test results.

v1: https://lore.kernel.org/r/179378567491.72692.9015711605062239156@gmail.com/

 drivers/power/supply/bq24190_charger.c | 130 +++++++++++++++++++------
 1 file changed, 99 insertions(+), 31 deletions(-)

diff --git a/drivers/power/supply/bq24190_charger.c b/drivers/power/supply/bq24190_charger.c
index 7a5867dd74c23..5cecd62c5a227 100644
--- a/drivers/power/supply/bq24190_charger.c
+++ b/drivers/power/supply/bq24190_charger.c
@@ -8,7 +8,6 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/delay.h>
-#include <linux/devm-helpers.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm_wakeirq.h>
 #include <linux/power_supply.h>
@@ -228,6 +227,8 @@ struct bq24190_dev_info {
 	struct power_supply		*charger;
 	struct power_supply		*battery;
 	struct delayed_work		input_current_limit_work;
+	spinlock_t			input_current_limit_lock; /* protects stopping */
+	bool				input_current_limit_stopping;
 	char				model_name[I2C_NAME_SIZE];
 	bool				initialized;
 	bool				irq_event;
@@ -1510,6 +1511,7 @@ static void bq24190_input_current_limit_work(struct work_struct *work)
 static void bq24190_charger_external_power_changed(struct power_supply *psy)
 {
 	struct bq24190_dev_info *bdi = power_supply_get_drvdata(psy);
+	unsigned long flags;
 
 	/*
 	 * The Power-Good detection may take up to 220ms, sometimes
@@ -1519,8 +1521,12 @@ static void bq24190_charger_external_power_changed(struct power_supply *psy)
 	 * too low default 500mA iinlim. Delay setting the input-current-limit
 	 * for 300ms to avoid this.
 	 */
-	queue_delayed_work(system_percpu_wq, &bdi->input_current_limit_work,
-			   msecs_to_jiffies(300));
+	spin_lock_irqsave(&bdi->input_current_limit_lock, flags);
+	if (!bdi->input_current_limit_stopping)
+		queue_delayed_work(system_percpu_wq,
+				   &bdi->input_current_limit_work,
+				   msecs_to_jiffies(300));
+	spin_unlock_irqrestore(&bdi->input_current_limit_lock, flags);
 }
 
 static enum power_supply_property bq24190_charger_properties[] = {
@@ -2114,6 +2120,46 @@ static const struct bq24190_chip_info bq24190_chip_info_tbl[] = {
 	},
 };
 
+static void bq24190_stop_input_current_limit_work(void *data)
+{
+	struct bq24190_dev_info *bdi = data;
+	unsigned long flags;
+
+	/*
+	 * Publish the stop before the IRQ is freed. external_power_changed()
+	 * checks the flag under the same lock before queueing, so a callback
+	 * racing with this action either queues before it or observes the
+	 * flag and does not queue at all. The queued work is drained later,
+	 * after the IRQ can no longer requeue it.
+	 */
+	spin_lock_irqsave(&bdi->input_current_limit_lock, flags);
+	bdi->input_current_limit_stopping = true;
+	spin_unlock_irqrestore(&bdi->input_current_limit_lock, flags);
+}
+
+static void bq24190_cancel_input_current_limit_work(void *data)
+{
+	struct bq24190_dev_info *bdi = data;
+
+	/*
+	 * The success path installs this after both supplies, so it runs
+	 * before they are unregistered. The battery failure path installs
+	 * it after the charger, which is the only supply that can queue the
+	 * work. Setting the flag here also covers probe failures that
+	 * unwind before the IRQ (and the stop action) was installed.
+	 */
+	bq24190_stop_input_current_limit_work(bdi);
+	cancel_delayed_work_sync(&bdi->input_current_limit_work);
+}
+
+static void bq24190_disable_runtime_pm(void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+}
+
 static int bq24190_probe(struct i2c_client *client)
 {
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
@@ -2139,14 +2185,13 @@ static int bq24190_probe(struct i2c_client *client)
 	strscpy(bdi->model_name, id->name, sizeof(bdi->model_name));
 	bdi->info = i2c_get_match_data(client);
 	mutex_init(&bdi->f_reg_lock);
+	spin_lock_init(&bdi->input_current_limit_lock);
 	bdi->charge_type = POWER_SUPPLY_CHARGE_TYPE_FAST;
 	bdi->f_reg = 0;
 	bdi->ss_reg = BQ24190_REG_SS_VBUS_STAT_MASK; /* impossible state */
 
-	ret = devm_delayed_work_autocancel(dev, &bdi->input_current_limit_work,
-					   bq24190_input_current_limit_work);
-	if (ret)
-		return ret;
+	INIT_DELAYED_WORK(&bdi->input_current_limit_work,
+			  bq24190_input_current_limit_work);
 
 	i2c_set_clientdata(client, bdi);
 
@@ -2166,6 +2211,11 @@ static int bq24190_probe(struct i2c_client *client)
 	pm_runtime_enable(dev);
 	pm_runtime_use_autosuspend(dev);
 	pm_runtime_set_autosuspend_delay(dev, 600);
+
+	ret = devm_add_action_or_reset(dev, bq24190_disable_runtime_pm, dev);
+	if (ret)
+		return ret;
+
 	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
 		dev_err(dev, "pm_runtime_get failed: %i\n", ret);
@@ -2181,8 +2231,8 @@ static int bq24190_probe(struct i2c_client *client)
 	charger_cfg.fwnode = dev_fwnode(dev);
 	charger_cfg.supplied_to = bq24190_charger_supplied_to;
 	charger_cfg.num_supplicants = ARRAY_SIZE(bq24190_charger_supplied_to);
-	bdi->charger = power_supply_register(dev, &bq24190_charger_desc,
-						&charger_cfg);
+	bdi->charger = devm_power_supply_register(dev, &bq24190_charger_desc,
+						  &charger_cfg);
 	if (IS_ERR(bdi->charger)) {
 		dev_err(dev, "Can't register charger\n");
 		ret = PTR_ERR(bdi->charger);
@@ -2193,30 +2243,49 @@ static int bq24190_probe(struct i2c_client *client)
 	/* in the interim, this property hides it.              */
 	if (!device_property_read_bool(dev, "omit-battery-class")) {
 		battery_cfg.drv_data = bdi;
-		bdi->battery = power_supply_register(dev, &bq24190_battery_desc,
-						     &battery_cfg);
+		bdi->battery = devm_power_supply_register(dev,
+							  &bq24190_battery_desc,
+							  &battery_cfg);
 		if (IS_ERR(bdi->battery)) {
 			dev_err(dev, "Can't register battery\n");
 			ret = PTR_ERR(bdi->battery);
-			goto out_charger;
+			/*
+			 * The charger is already visible to its supplier and
+			 * may have queued the input-current-limit work. Install
+			 * the cancel action before unwinding so it runs before
+			 * the charger supply is unregistered.
+			 *
+			 * Ignore the return value: if adding the action fails,
+			 * _or_reset has already run it (and cancelled the work);
+			 * the battery registration error is the one to report.
+			 */
+			devm_add_action_or_reset(dev,
+						 bq24190_cancel_input_current_limit_work,
+						 bdi);
+			goto out_pmrt;
 		}
 	}
 
+	ret = devm_add_action_or_reset(dev,
+				       bq24190_cancel_input_current_limit_work, bdi);
+	if (ret)
+		goto out_pmrt;
+
 	ret = bq24190_get_config(bdi);
 	if (ret < 0) {
 		dev_err(dev, "Can't get devicetree config\n");
-		goto out_charger;
+		goto out_pmrt;
 	}
 
 	ret = bq24190_hw_init(bdi);
 	if (ret < 0) {
 		dev_err(dev, "Hardware init failed\n");
-		goto out_charger;
+		goto out_pmrt;
 	}
 
 	ret = bq24190_configure_usb_otg(bdi, bdi->ss_reg);
 	if (ret < 0)
-		goto out_charger;
+		goto out_pmrt;
 
 	bdi->initialized = true;
 
@@ -2225,33 +2294,36 @@ static int bq24190_probe(struct i2c_client *client)
 			IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
 			"bq24190-charger", bdi);
 	if (ret < 0)
-		goto out_charger;
+		goto out_pmrt;
+
+	/*
+	 * Register after the IRQ so this action runs before the IRQ is
+	 * freed. The cancel action below then drains the work after no
+	 * IRQ handler can queue it again.
+	 */
+	ret = devm_add_action_or_reset(dev,
+				       bq24190_stop_input_current_limit_work, bdi);
+	if (ret)
+		goto out_pmrt;
 
 	ret = bq24190_register_vbus_regulator(bdi);
 	if (ret < 0)
-		goto out_charger;
+		goto out_pmrt;
 
 	ret = devm_device_init_wakeup(dev);
 	if (ret < 0)
-		goto out_charger;
+		goto out_pmrt;
 
 	ret = devm_pm_set_wake_irq(dev, client->irq);
 	if (ret < 0)
-		goto out_charger;
+		goto out_pmrt;
 
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
 
-out_charger:
-	if (!IS_ERR_OR_NULL(bdi->battery))
-		power_supply_unregister(bdi->battery);
-	power_supply_unregister(bdi->charger);
-
 out_pmrt:
 	pm_runtime_put_sync(dev);
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
 	return ret;
 }
 
@@ -2265,13 +2337,9 @@ static void bq24190_remove(struct i2c_client *client)
 		dev_warn(bdi->dev, "pm_runtime_get failed: %i\n", error);
 
 	bq24190_register_reset(bdi);
-	if (bdi->battery)
-		power_supply_unregister(bdi->battery);
-	power_supply_unregister(bdi->charger);
+
 	if (error >= 0)
 		pm_runtime_put_sync(bdi->dev);
-	pm_runtime_dont_use_autosuspend(bdi->dev);
-	pm_runtime_disable(bdi->dev);
 }
 
 static void bq24190_shutdown(struct i2c_client *client)
-- 
2.34.1

