Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.136.64.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500419;
	b=2/qSj+uS6hogwzra5EmuvT5wZQu2GqaZWLMwe9jB8NdCkcZRXGYBPFXTPQI186T8CpcR
	 9HCazD3v2incu8VlHgTL/6ZWoUMR8qwOCY7FibfSd9L/77+NBCzqLuFu6zCp47a1MrDL6
	 cg99JsLc+H891ksXvJCE60sRO0JeLwErjs7dWuI9yO6lk/bfRmJOVU4WfLbYB4IcpO01o
	 sz3xhwoL5Uf0CNG2R5xN41PH/kn60o4Ae8N8XS4bZQ69AcPhHidbfCXKhNiRoRCWIcwAY
	 yJCCoUIqe/VWA4v42VcGzyonVSoQ/uvr1o5DgBu2IJYTSE3AHthcSFbVhIE9NcbWl1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500419;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Flowmailer-Platform:Feedback-ID;
	bh=STMhpQSWWR8+cjHldTlQT+VSuoqYr6XlJYSMgywImpQ=;
	b=Nw7ohIk+Kce698lcVl7XAIRnEuVcfL2CDo65Kpkq31otfx+OwT0fPk7X9sN1RzJ42RHw
	 2IBnZMrRowSQZix4eq1wBc0idXrRQpm4MFfQnkFDS0xW5HWax+l8tUCHjqZ0A76152QlI
	 njgDePM0xZuyy3paBw+WyBlCbdDvyAT5DlLcJIjhWeM1uHjdDRMwFr7Cquj10D4wqzHNu
	 BtfdfCSXzS7yBzyV8iSV6PaWdRcEDRJWK+ICW9vlaQ0QMlKjHBxnQ7PrSDlyWC6PpPznP
	 2FwZo5MmOlgxf6f9gDplGB6hfKAlwPYlPGw3nbYLbKuJFFeLQacnAPCCxPysDmT6niw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=rts-flowmailer.siemens.com;
	dkim=pass header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=XSak9CQw;
	arc=none smtp.remote-ip=185.136.64.228
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15981606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15981606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm2 header.b=XSak9CQw
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 2026102012465497d3865450000207fb
        for <linux-kernel@vger.kernel.org>;
        Tue, 20 Oct 2026 14:46:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=STMhpQSWWR8+cjHldTlQT+VSuoqYr6XlJYSMgywImpQ=;
 b=XSak9CQwjaiMICK8pPiUPD+oWZIuB2kJaGzDkbpW0vIvZ2QxZUdG05R/zUyGL0fJwnxIIt
 NkpBeqQInjlnhOW+P6P1123KB59toFdSsON3RbBo6bSQfcO15g4mXiIXyGDNyfBRQybaL16K
 KD++zYrO2/rRbCI/feH5utirRhQaL0IJYzT8vtYsgRM8jCpZvdwob+lFqgCX0+RuLKTAchH/
 68SbNufvY/oonJgDxEf2Fp140e5QUmdmAJMb0DMV72kz44fThGEthW7iVMDioHIyaaO1y5lJ
 elCo/L1xTFJfkL4rKFVLwT3TIR7DH23FhZNQ4WKZlK05xgHs7LK0DQWQ==;
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
Subject: [PATCH v5 2/4] leds: trigger: netdev: Access net_dev under trigger_data->lock in the worker
Date: Tue, 20 Oct 2026 14:46:46 +0200
Message-ID: <20261020124651.1987272-3-alexander.sverdlin@siemens.com>
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

netdev_trig_work() dereferences trigger_data->net_dev without the lock,
while set_device_name() and netdev_trig_notify() dev_put() and replace it
under trigger_data->lock. On NETDEV_UNREGISTER the worker can run
dev_get_stats() on a netdev being freed (UAF).

Take trigger_data->lock in the worker. cancel_delayed_work_sync() must
then never run under that lock.

Cc: stable@vger.kernel.org
Closes: https://lore.kernel.org/all/20260914142116.6DAC51F000FF@smtp.kernel.org/
Fixes: 06f502f57d0d ("leds: trigger: Introduce a NETDEV trigger")
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v3:
- explicit mutex_lock()/mutex_unlock() instead of guard()

 drivers/leds/trigger/ledtrig-netdev.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-netdev.c b/drivers/leds/trigger/ledtrig-netdev.c
index cfaf130157b3d..e72e850e0070f 100644
--- a/drivers/leds/trigger/ledtrig-netdev.c
+++ b/drivers/leds/trigger/ledtrig-netdev.c
@@ -676,9 +676,12 @@ static void netdev_trig_work(struct work_struct *work)
 	unsigned long interval;
 	int invert;
 
+	mutex_lock(&trigger_data->lock);
+
 	/* If we dont have a device, insure we are off */
 	if (!trigger_data->net_dev) {
 		led_set_brightness(trigger_data->led_cdev, LED_OFF);
+		mutex_unlock(&trigger_data->lock);
 		return;
 	}
 
@@ -686,8 +689,10 @@ static void netdev_trig_work(struct work_struct *work)
 	if (!test_bit(TRIGGER_NETDEV_TX, &trigger_data->mode) &&
 	    !test_bit(TRIGGER_NETDEV_RX, &trigger_data->mode) &&
 	    !test_bit(TRIGGER_NETDEV_TX_ERR, &trigger_data->mode) &&
-	    !test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode))
+	    !test_bit(TRIGGER_NETDEV_RX_ERR, &trigger_data->mode)) {
+		mutex_unlock(&trigger_data->lock);
 		return;
+	}
 
 	dev_stats = dev_get_stats(trigger_data->net_dev, &temp);
 	new_activity =
@@ -728,6 +733,8 @@ static void netdev_trig_work(struct work_struct *work)
 
 	schedule_delayed_work(&trigger_data->work,
 			(atomic_read(&trigger_data->interval)*2));
+
+	mutex_unlock(&trigger_data->lock);
 }
 
 static int netdev_trig_activate(struct led_classdev *led_cdev)
-- 
2.56.0

