Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A8738644F
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201221; cv=none; b=oIx/rB3CF7MXniZJBwWorMlQIBicz/8evJkL1ZxlhP0PisOojjp9IIlScqU9g4heDTcVfLdXmO9QzTacUu6HJiHGqXtUVd7ZrzbHpPgGDJEGde7MmJ1xW5VOFh4SCCVhD3dEQwduX7f1gXu41R8rwjpaiDvyq7SG7aCtKvblqME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201221; c=relaxed/simple;
	bh=dKpCuDcIaAlFeaJIq+wf4HiiDBn18O4xZ8TfrUaGjXA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JjmC1LBFutY23oehutTiiYSFuWbdE1EweUH4XWV1p9xaaJzhr02czpkrXoo+XKOKkgBYFZCROgf3SlQQtNqGZvoSL3jtBwMuHp9k8VuOAw8FrJMn9z5NxuehdmroQWjANj2XRtaZvk5Rt0+gjRS5ku3GNytBkXnejtbyFutMsQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJjV7b3R; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJjV7b3R"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-35f036b17easo25567eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201214; x=1792806014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kVLlyzwOJqlF1TKXGrKuWzHy+TQSA/0kGnM9v3Xwg88=;
        b=LJjV7b3RCNPi/Zfxw7ErmTJkXALgirgr/ZhtepSpWjLiBtbyZGxxH4vZcuxSWe0mZw
         EbEy9l+ocieKxk8iv0DwWBG55OmamfnFGjc505duUl8PQxX47o+LwWkMVfijDP/3wIRC
         nHK4f8PFxSECFSPWJXJVdbx88mW+KK1X37KCvzD5xyzysZYIYGu7lkxsMmHdLPiegBR3
         STcIbtYhvFfrRjaFvWEdL4P2FFa7RBQTb36lw2Ax11ipOzMJ33TT0opvJnKi9SrhWf0j
         TbF8JCbYcqvzikp5DDuxcnTRMKauRvDCcnCgRtdsErG8xQpdZkYiGZnNVg0Mn3ojcMmT
         KNvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201214; x=1792806014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kVLlyzwOJqlF1TKXGrKuWzHy+TQSA/0kGnM9v3Xwg88=;
        b=EX/E8QWjBpo6+QX3pzMlsPL5N7VXEPP9QKA1yHi7aKB6+3wTHHobhXlQ/50C2Qo7r2
         ztBsH0kk9mvPz1MBtZgCVyi4fWsealxx/Nn9G3ObvFO8fH79AhMN0PwO6JEeHInWSpz+
         N7R+4Ez5c1hrWQIAKKoozb2fjVkE8Eoe5kQaNecWVY5zjhptJwYisI0jLLXlcP2hWght
         dcga+ITesJuH2Og6ja1tn/iI8nk5cgrZGANEr/SmLm546FMiTllYMB8iMPGf/bjLBMzt
         UAkU28IhF0l2mytct9w33GxgdX0Zo/DqW8gOVMHrGddAFgm3Z8APyLQDWeIGr7VGvI/I
         PJUA==
X-Forwarded-Encrypted: i=1; AKwUvBwxwgACbTHBXpO0YbJlGOd+N66COeNB6vR+oRS+CnSgSnrzZg83jFwwLYC4p3k5h0E9xKyl7TdsOrVc63U=@vger.kernel.org
X-Gm-Message-State: AFq9FYICAvhmTk/tkKuE25J1LxOjM8YdnoqhB3G2IjhwEEzTFKaKDBL+
	6ZderhbPvDg0Dmz8tVYLErpPp/XTrT/xudfhTUTjktk/yIgvmbP+Z3edrUDCrQ==
X-Gm-Gg: AYBFou0TkfXkC+M8CjBlFj2nLbvqfIGSSlw2uWoEACcgJONjgb4jTvRnXwJTtKXBp5L
	3nEIv/zlSi8YtSMVLAa5uPnmJ+tDVqyVY/3IIN0oxUznb6dMFX6Vh6Vp8twIIRAk8ZxZcFiKfKU
	d8tU0/QNY8D3og7dpwkwCJ2A2I5Rbgt2zo5ib5QudN+CCnKb+bIGQu8U/DgWHYCUDhSA/lg3Op5
	3mPL3fcTjUOHoL3R6OIA2lAw16c15fKhRGBVkeL9oCQEUXCeuejPyik2mYrZEDMbSkLefMEfmmR
	sVHTDOPJWFe1uXpv64+XpSV9Jm/aTnA4+yV5J/Z8gpDnCs+d3Dw4Lm4y8PpGtm1UifbvSz20SVC
	r6iNTK3Xj+E6eHwsWh1dCZ2j0ciPpzuFRlLJPzVbra2hDBlSV2EUweQgLPki+PQscx8y8fcKlmX
	KpKhF1lfBTXUX91pqtcIH1b4lLI+slJ/MKF0ANnl7aMzHhvVlb2S57cHqDgu/Noz0hQSy4VobhF
	yU8+AbILYyyTqy11lEIZrb9hA+PUSiEY6hbjYtoOfZzg4Qg80/QbhLFDZOnV3Fe25nApWzHQVI=
X-Received: by 2002:a05:7022:170a:b0:180:2b3d:57b4 with SMTP id a92af1059eb24-18513b97e53mr1922190c88.33.1792201213482;
        Fri, 16 Oct 2026 18:40:13 -0700 (PDT)
Received: from lappy.taila8a9bd.ts.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831acba710sm12128429c88.13.2026.10.16.18.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:40:13 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH v2 07/11] HID: hid-lenovo-go-s: Move attribute init to after device query
Date: Fri, 16 Oct 2026 18:39:52 -0700
Message-ID: <20261017013956.2440130-8-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
References: <20261017013956.2440130-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently this driver registers attributes before the MCU is ready to
accept commands. This can lead to attribute access that blocks the MCU
in some rare cases.

Move attribute construction to gos_cfg_setup, after the device has been
queried. Gate creation to drvdata.gp_registered and
drvdata.rgb_registered so a resume before setup has run doesn't prevent
attribute creation or attempt to re-register the same attributes.

Query failures reschedule the setup work, up to 5 attempts 50 ms apart,
since the MCU may not be ready to accept commands immediately after
probe.

The registered flags are set before the matching registration steps and
cleared on failure, so a failed run leaves no state that blocks a later
run from retrying. The LED classdev is registered without devres because
the failure and remove paths unregister it manually.

Fixes: a23f3497bf208c59ad ("HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 134 ++++++++++++++++++++++++----------
 1 file changed, 95 insertions(+), 39 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 14aeddd65704..cefb243800b6 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -42,6 +42,7 @@ static struct hid_gos_cfg {
 	bool gp_registered;
 	bool rgb_registered;
 	int cmd_status;
+	int setup_attempts;
 	u8 gp_auto_sleep_time;
 	u8 gp_dpad_mode;
 	u8 gp_mode;
@@ -1453,57 +1454,127 @@ static struct led_classdev_mc gos_cdev_rgb = {
 	.subled_info = gos_rgb_subled_info,
 };
 
-static void cfg_setup(struct work_struct *work)
+static int cfg_query_device(void)
 {
 	int ret;
 
 	/* MCU */
 	ret = mcu_property_out(drvdata.hdev, GET_MCU_ID, FEATURE_NONE, NULL, 0);
 	if (ret) {
-		dev_err(&drvdata.hdev->dev, "Failed to retrieve MCU ID: %i\n",
-			ret);
-		return;
+		dev_err(&drvdata.hdev->dev, "Failed to retrieve MCU ID: %i\n", ret);
+		return ret;
 	}
 
 	ret = mcu_property_out(drvdata.hdev, GET_VERSION, FEATURE_NONE, NULL, 0);
 	if (ret) {
 		dev_err(&drvdata.hdev->dev, "Failed to retrieve MCU Version: %i\n", ret);
-		return;
+		return ret;
 	}
 
 	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_TP_MFR, NULL, 0);
 	if (ret) {
 		dev_err(&drvdata.hdev->dev,
 			"Failed to retrieve Touchpad Manufacturer: %i\n", ret);
-		return;
+		return ret;
 	}
 
 	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_TP_VER, NULL, 0);
 	if (ret) {
 		dev_err(&drvdata.hdev->dev,
 			"Failed to retrieve Touchpad Firmware Version: %i\n", ret);
-		return;
+		return ret;
 	}
 
 	ret = mcu_property_out(drvdata.hdev, GET_PL_TEST, TEST_IMU_MFR, NULL, 0);
 	if (ret) {
 		dev_err(&drvdata.hdev->dev,
 			"Failed to retrieve IMU Manufacturer: %i\n", ret);
-		return;
+		return ret;
 	}
 
-	ret = mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, FEATURE_OS_MODE,
-			       NULL, 0);
+	return mcu_property_out(drvdata.hdev, GET_GAMEPAD_CFG, FEATURE_OS_MODE,
+				 NULL, 0);
+}
+
+static void cfg_setup(struct work_struct *work)
+{
+	bool gp_registered = false;
+	bool rgb_registered = false;
+	int ret;
+
+	ret = cfg_query_device();
 	if (ret) {
-		dev_err(&drvdata.hdev->dev,
-			"Failed to retrieve OS Mode: %i\n", ret);
+		/* The MCU may not be ready yet. Retry a bounded number of
+		 * times before giving up.
+		 */
+		drvdata.setup_attempts++;
+		if (drvdata.setup_attempts >= 5) {
+			dev_err(&drvdata.hdev->dev,
+				"Giving up on device setup after %d attempts\n",
+				drvdata.setup_attempts);
+			return;
+		}
+
+		schedule_delayed_work(&drvdata.gos_cfg_setup, msecs_to_jiffies(50));
 		return;
 	}
 
-	/* Pairs with smp_load_acquire in attribute show/store functions */
-	smp_store_release(&drvdata.gp_registered, true);
-	/* Pairs with smp_load_acquire in attribute show/store functions */
-	smp_store_release(&drvdata.rgb_registered, true);
+	drvdata.setup_attempts = 0;
+
+	if (!drvdata.gp_registered) {
+		/* Pairs with smp_load_acquire in attribute show/store functions */
+		smp_store_release(&drvdata.gp_registered, true);
+		gp_registered = true;
+
+		ret = sysfs_create_groups(&drvdata.hdev->dev.kobj, top_level_attr_groups);
+		if (ret) {
+			dev_err(&drvdata.hdev->dev,
+				"Failed to create gamepad configuration attributes: %i\n",
+				ret);
+
+			/* Pairs with smp_load_acquire in attribute show/store functions */
+			smp_store_release(&drvdata.gp_registered, false);
+			gp_registered = false;
+		}
+	}
+
+	if (!drvdata.rgb_registered) {
+		drvdata.led_cdev = &gos_cdev_rgb.led_cdev;
+
+		/* Pairs with smp_load_acquire in attribute show/store functions */
+		smp_store_release(&drvdata.rgb_registered, true);
+		rgb_registered = true;
+
+		ret = led_classdev_multicolor_register(&drvdata.hdev->dev,
+						       &gos_cdev_rgb);
+		if (ret) {
+			dev_err(&drvdata.hdev->dev, "Failed to create RGB device: %i\n",
+				ret);
+
+			/* Pairs with smp_load_acquire in attribute show/store functions */
+			smp_store_release(&drvdata.rgb_registered, false);
+			rgb_registered = false;
+		} else {
+			ret = devm_device_add_group(gos_cdev_rgb.led_cdev.dev,
+						    &rgb_attr_group);
+			if (ret) {
+				dev_err(&drvdata.hdev->dev,
+					"Failed to create RGB configuration attributes: %i\n",
+					ret);
+
+				led_classdev_multicolor_unregister(&gos_cdev_rgb);
+
+				/* Pairs with smp_load_acquire in attribute show/store functions */
+				smp_store_release(&drvdata.rgb_registered, false);
+				rgb_registered = false;
+			}
+		}
+	}
+
+	if (gp_registered)
+		kobject_uevent(&drvdata.hdev->dev.kobj, KOBJ_CHANGE);
+	if (rgb_registered)
+		kobject_uevent(&drvdata.led_cdev->dev->kobj, KOBJ_CHANGE);
 }
 
 static int hid_gos_cfg_probe(struct hid_device *hdev,
@@ -1513,30 +1584,8 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 
 	hid_set_drvdata(hdev, &drvdata);
 	drvdata.hdev = hdev;
-	mutex_init(&drvdata.cfg_mutex);
-
-	ret = sysfs_create_groups(&hdev->dev.kobj, top_level_attr_groups);
-	if (ret) {
-		dev_err_probe(&hdev->dev, ret,
-			      "Failed to create gamepad configuration attributes\n");
-		return ret;
-	}
-
-	ret = devm_led_classdev_multicolor_register(&hdev->dev, &gos_cdev_rgb);
-	if (ret) {
-		dev_err_probe(&hdev->dev, ret, "Failed to create RGB device\n");
-		return ret;
-	}
-
-	ret = devm_device_add_group(gos_cdev_rgb.led_cdev.dev, &rgb_attr_group);
-	if (ret) {
-		dev_err_probe(&hdev->dev, ret,
-			      "Failed to create RGB configuration attributes\n");
-		return ret;
-	}
-
-	drvdata.led_cdev = &gos_cdev_rgb.led_cdev;
 
+	mutex_init(&drvdata.cfg_mutex);
 	init_completion(&drvdata.send_cmd_complete);
 
 	/* Executing calls prior to returning from probe will lock the MCU. Schedule
@@ -1554,9 +1603,16 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 
 static void hid_gos_cfg_remove(struct hid_device *hdev)
 {
+	bool rgb_registered;
+
 	disable_delayed_work_sync(&drvdata.gos_cfg_setup);
 	sysfs_remove_groups(&hdev->dev.kobj, top_level_attr_groups);
 
+	/* Pairs with smp_store_release in cfg_setup */
+	rgb_registered = smp_load_acquire(&drvdata.rgb_registered);
+	if (rgb_registered)
+		led_classdev_multicolor_unregister(&gos_cdev_rgb);
+
 	hid_hw_close(hdev);
 	hid_hw_stop(hdev);
 	hid_set_drvdata(hdev, NULL);
-- 
2.55.0

