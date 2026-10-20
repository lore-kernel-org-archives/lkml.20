Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.65.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500419;
	b=FP0ClFts06QhUfMqH3l/tpiFmMcHm0RHDq9Rmys/GZEzfcVPHSWe4oNRq4igIAV7+nwC
	 O4rgSB3phpKXPv1XykZm3BUAAzGCEx44Q42JySNdgK1d97MqZ2y2RhyBlPCWCD2+NobFY
	 LlU2vwB7/9dYjHm/TLKgl0uBHeiX3S50bqF0o3H/+nBTJWP4fPXfr1yDyeOdF2y0edJT2
	 /U8r1nElD2CwIdqq5UiCiyMIvPxgN4bovT++6dx9fQTnLwTAg0AIYRBGPaceKJ+1BYUCx
	 +FdMJyG58bLBwvmY8N8kcWrRglz1kJNtgHHo5bhiYx5PbNyGzn1RneFpuwNy4UFqybg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500419;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=TXclAsWrvqcJ5QoXpBQJmVVOtPxVDa+tpdatkdREZmM=;
	b=lcBSir5MxBkdMQVi+7yx4krO1TU8CkI0FvPU+0HdQY621tuOeWvQDYlQxsr2n3Dtw1HZ
	 kdqkvYgL/TPhqQuk/X/kENYQt+7DjvoKV80llSKq+yvlwSnct3D9MirNLnqdtad+lik14
	 BXYU9DuaGOR5fozEszEIIt6FHKSznVfHnSHexDeVtQCayDQPYbvzOCBXo6orQzRkkZcP5
	 9uEl0NkXyglcNteEhS7xTuMQldGwekvb1G0NapSgoa3TzV6lxwKPFkI/Sxzky0ipRCwnC
	 6zs+O/YnyRWtmitoRSHT9CFl4CCBdGL0OzDb7ulGgURV2dJOz5dAI2lQP7aAw3NglTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=PVJRSSoq;
	arc=none smtp.remote-ip=185.136.65.225
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E40606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45E40606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=PVJRSSoq
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261020124655d4d592d2fa000207a0
        for <linux-kernel@vger.kernel.org>;
        Tue, 20 Oct 2026 14:46:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=TXclAsWrvqcJ5QoXpBQJmVVOtPxVDa+tpdatkdREZmM=;
 b=PVJRSSoqqqEYflyFkknBCCI/lWHqLRJY+Yxj1CfkpUZMr/3v5C9bReSGPRWXekgN+eCSTU
 AgdKoi6awZsUdFrdOnyW7de9KPw9tU8nw+gIwmlywp/0LVRFVhXMZQcx5iNoSHjnjoZmHCCV
 pRMX4FxBOBFVEW6fx1NxdUvhaJVKHGWsh/BkNPNg2AWIQkj/thmR4NQYrw69OagKBhXSFC3R
 eltqtwcVwosvN/Z8/AzIihnOHZxMtlI+RXuljwH93qy94RTnHDUTyN26lv4bfbS05Zajm9Yq
 EK8Z/hRx3Vvt3Q/ZtjaWIoGGSt2m3TJeO7ZwNPfBtOc6q3l6i8gBjXoA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-leds@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	"Mike Marciniszyn (Meta)" <mike.marciniszyn@gmail.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v5 4/4] leds: trigger: netdev: Serialize mode/interval stores with trigger lock
Date: Tue, 20 Oct 2026 14:46:48 +0200
Message-ID: <20261020124651.1987272-5-alexander.sverdlin@siemens.com>
In-Reply-To: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
References: <20261020124651.1987272-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

netdev_led_attr_store() and interval_store() update ->mode and run
set_baseline_state() without trigger_data->lock. kernfs only serializes
writes to the same file, so two attribute writes race on the non-atomic
read-modify-write of ->mode:

  CPU0 (echo 1 > link_10)       CPU1 (echo 1 > link_100)
  -----------------------       ------------------------
  mode = trigger_data->mode;
                                mode = trigger_data->mode;
  set_bit(LINK_10, &mode);
                                set_bit(LINK_100, &mode);
  trigger_data->mode = mode;
                                trigger_data->mode = mode;  // LINK_10 lost

They also race the notifier's link-state and ->hw_control updates.

Take trigger_data->lock in both stores. netdev_trig_work() also holds it,
so use the async cancel_delayed_work().

The async cancel cannot stop a worker already blocked on the lock: it may
resume after a store enabled hw_control and keep software-blinking and
rescheduling itself. Gate the worker and its arming in set_baseline_state()
on a shared netdev_trig_sw_blink() helper, so it stops once offload is
active or RX/TX monitoring is off.

Cc: stable@vger.kernel.org
Fixes: d5e01266e7f5 ("leds: trigger: netdev: add additional specific link speed mode")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v4:
- introduced netdev_trig_sw_blink() and used it in netdev_trig_work()
v3:
- explicit mutex_lock()/mutex_unlock() instead of guard()
v2:
- reduced verbosity both in the comments and in commit message
- dropped sync from cancel_delayed_work() (worker now takes the lock)

 drivers/leds/trigger/ledtrig-netdev.c | 46 +++++++++++++++++++--------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index bf9a5ec245a43..6859783422f5d 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -81,6 +81,16 @@ struct led_netdev_data {
 
 static const struct attribute_group netdev_trig_link_speed_attrs_group;
 
+/* True while the software activity worker should keep polling and blinking. */
+static bool netdev_trig_sw_blink(struct led_netdev_data *trigger_data)
+{
+	return trigger_data->net_dev && !trigger_data->hw_control &&
+	       (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
+		test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
+		test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
+		test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode));
+}
+
 static void set_baseline_state(struct led_netdev_data *trigger_data)
 {
 	int current_brightness;
@@ -164,10 +174,7 @@ static void set_baseline_state(struct led_netdev_data *trigger_data)
 		/* If we are looking for RX/TX start periodically
 		 * checking stats
 		 */
-		if (test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) ||
-		    test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode))
+		if (netdev_trig_sw_blink(trigger_data))
 			schedule_delayed_work(&trigger_data->work, 0);
 	}
 }
@@ -385,7 +392,7 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 {
 	struct led_netdev_data *trigger_data = led_trigger_get_drvdata(dev);
 	struct led_classdev *led_cdev = trigger_data->led_cdev;
-	unsigned long state, mode = trigger_data->mode;
+	unsigned long state, mode;
 	int ret;
 	int bit;
 
@@ -417,6 +424,10 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 		return -EINVAL;
 	}
 
+	/* async cancel: the worker takes this lock */
+	mutex_lock(&trigger_data->lock);
+
+	mode = trigger_data->mode;
 	assign_bit(bit, &mode, state);
 
 	if (test_bit(TRIGGER_NETDEV_LINK, &mode) &&
@@ -429,20 +440,26 @@ static ssize_t netdev_led_attr_store(struct device *dev, const char *buf,
 	     test_bit(TRIGGER_NETDEV_LINK_25000, &mode) ||
 	     test_bit(TRIGGER_NETDEV_LINK_40000, &mode) ||
 	     test_bit(TRIGGER_NETDEV_LINK_50000, &mode) ||
-	     test_bit(TRIGGER_NETDEV_LINK_100000, &mode)))
+	     test_bit(TRIGGER_NETDEV_LINK_100000, &mode))) {
+		mutex_unlock(&trigger_data->lock);
 		return -EINVAL;
+	}
 
-	cancel_delayed_work_sync(&trigger_data->work);
+	cancel_delayed_work(&trigger_data->work);
 
 	trigger_data->mode = mode;
 	trigger_data->hw_control = can_hw_control(trigger_data);
 
 	if (!led_cdev->brightness_set && !led_cdev->brightness_set_blocking &&
-	    !trigger_data->hw_control)
+	    !trigger_data->hw_control) {
+		mutex_unlock(&trigger_data->lock);
 		return -EOPNOTSUPP;
+	}
 
 	set_baseline_state(trigger_data);
 
+	mutex_unlock(&trigger_data->lock);
+
 	return size;
 }
 
@@ -503,10 +520,14 @@ static ssize_t interval_store(struct device *dev,
 
 	/* impose some basic bounds on the timer interval */
 	if (value >= 5 && value <= 10000) {
-		cancel_delayed_work_sync(&trigger_data->work);
+		mutex_lock(&trigger_data->lock);
+
+		cancel_delayed_work(&trigger_data->work);
 
 		atomic_set(&trigger_data->interval, msecs_to_jiffies(value));
 		set_baseline_state(trigger_data);	/* resets timer */
+
+		mutex_unlock(&trigger_data->lock);
 	}
 
 	return size;
@@ -690,11 +711,8 @@ static void netdev_trig_work(struct work_struct *work)
 		return;
 	}
 
-	/* If we are not looking for RX/TX then return  */
-	if (!test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) &&
-	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) &&
-	    !test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) &&
-	    !test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode)) {
+	/* Nothing to do under hw offload or without RX/TX monitoring */
+	if (!netdev_trig_sw_blink(trigger_data)) {
 		mutex_unlock(&trigger_data->lock);
 		return;
 	}
-- 
2.56.0

