Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05BDF3EEAEA
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789426400; cv=none; b=d9gp7v9siCDyPL9tQNKzV6Yz3Cek12OWEwMIquYpm/MWF66bhN0U+FA55qxF2Xo4V4WclHYhWG7YaEjOhlk8dOm/yLnjMgR2l5u3axYvq4inwTeOj7q7uK0KHxYon6w+sizE9AbvlXQeNub1tq9/I6uO2iqaTHFYbsCWLSysb1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789426400; c=relaxed/simple;
	bh=xIajdwp3UXaS5EFZENA7x4jgBGOmg59ClMsUOv8AQMs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZD5bkSwXUvQAH/NXv34UBIIlJo8AydTR9dE0LcJLoYVFrSQJeG5loU78J0vXDj0O+/mhuIOQgDfnIC3giLzBehm6OgKYiJ+qO6Lo/HRqn//hfF4d4+Pz+e/rUw1Td8/mg0zQcrsMUMj00hp/6ab2AamF9ULxF4PWSI0eBy9wDUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FLCpnCnA; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FLCpnCnA"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-86959a6f7f6so3110387b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 15:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789426395; x=1790031195; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4fkv1qRouOwCooBcv9E2ZIq98f5GRAhZGGtxGx4jV5A=;
        b=FLCpnCnANbRXTJfa/C9vR8x5W6mFDjIU94tHAD1GyfgYxOjHd6QBIW4ZG2y/2AAtYP
         5zqlYNRlv1B/Hj/sk6LPJ40FH46FwKnSO3slCpPIrmJtwptZvpEsDV0u7HQ5ly/nCqOD
         wmRUt380RbdILETUGenksR9kyz+p/hC05AY1Ctfz6deh9F/gC66VLFnfrIKNIeumFsJ3
         3bshzR9yYdtICAuD71AXtYAkfrl39ACGhBvmLCrCp13bmA6gMB7SIkMedejZ3O1i5gzj
         CDb24ZSlQ4i+N3TqFeQD8df2XgxpiV7WYeJMG9LodCSje47ahgK16yNK7ZuPc5FDorqN
         r+gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789426395; x=1790031195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4fkv1qRouOwCooBcv9E2ZIq98f5GRAhZGGtxGx4jV5A=;
        b=PrN4Clz568gjF/DFFDnMKi3BIPIsvJINqwgeOLI2tfiGGCu/+7S/XVl2jJfpdO0M71
         Brmp3SeFgd0hDU3B18tYrfY4TKdar2DixF6J0FY+W0GVouE3FEnwWt0LfkQQ6KhLzRv9
         7MuVR+c4oicMJJtf3yHWZ1EyvuBEXObXmtdfS31COHJ2TG50Huo62xDM6PGY1mldgFlC
         N7Xo9iWYju+WwKrCjajL0BeeQ+obw63dg6UYH1vIzhaKeAcLGM9fFG8bYYNN+G/2T5Jx
         +QI4UQeMwAKFNx1tK8q9nsM92EzIs4CLqIWMfkfDcIiet+ecNbyqxWX3bkQGAfsXZ8jp
         gpAg==
X-Forwarded-Encrypted: i=1; AKwUvBziLTDGoIcBqRt5VWAFvEn3nRFCH6kzUt+lkk2NU8zACGnXnLBg/Zqht8lohES7mIq9wHp/46kqXwrGlIg=@vger.kernel.org
X-Gm-Message-State: AFuF++ku/OvfMZ7w1Xd3DqKVhtB6PPnqZ0KhT3OXi/T+dRBCf8RXMB2H
	kzIMb/tghXORhIvTsgwaSK4yp4um/bhqlENaPzBLcyfdphRpLiRqWDZdR8sT7w==
X-Gm-Gg: AYBFou2AaQMkm9LyEPxZC3PKFiKmsFUu5zHkraCDs+NWla/KRa4mYNuEWL2fbB8TkI9
	KuxSAXaLhLw4HGdiIvJ11K548UCG/OA6o/EHFD7tZM3lmr3JuUsrftlhKe0+hw5O0D6s8OLlaii
	OaBCPx/f/UiCjXHfDYKC+zlwi7rCr9dMIqkWt3OTPco1zz/+KhV0JCa7x3VtCv0dNnrU7Hdq25U
	YHGkdyYidExCe7mXqlciHf8XE8DpDKvcoP6jPrbzeA+GGuLawz6qhcIuGen7lkBA9239BIdWv8Q
	S4fIX/p+wG01hvDMMKpMVD0V6XYUKdHNsPMnXLNcTxPv8hUM9mdWX8eKrKCKk2ZWfrqzB1yX2WB
	ZLLSQDeho+tWAfGnXGGPM4SJuuZngjq7R9gzyZw1hFa4D00SdpturC7ZdMXD7AI3kL54t64JdWd
	nZ3GWblP+zpauVCTiTJ7M31Qnq81zP6W0W1XdqxV0/W5q5JY56zPW2mzmNpXHW240umIiVzeY2w
	teAYvsuUpgWXVlJPMuhVt6N25DXb3FTETaaSC+Q1TNCD2/0ZU1+
X-Received: by 2002:a05:6a20:3951:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3db40694c9fmr9691158637.26.1789426395459;
        Mon, 14 Sep 2026 15:53:15 -0700 (PDT)
Received: from lappy (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bbeb053a5sm14924296eec.27.2026.09.14.15.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 15:53:15 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel@lists.opengamingcollective.org,
	stable@vger.kernel.org
Subject: [PATCH 07/10] HID: hid-lenovo-go-s: Move attribute init to after device query
Date: Mon, 14 Sep 2026 15:53:00 -0700
Message-ID: <20260914225303.868569-8-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260914225303.868569-1-derekjohn.clark@gmail.com>
References: <20260914225303.868569-1-derekjohn.clark@gmail.com>
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

Fixes: a23f3497bf208c59ad ("HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 68 +++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index 6d98fff6d987..f1a0bcfcdb71 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -1452,6 +1452,7 @@ static struct led_classdev_mc gos_cdev_rgb = {
 
 static void cfg_setup(struct work_struct *work)
 {
+	bool gp_registered, rgb_registered;
 	int ret;
 
 	/* MCU */
@@ -1497,10 +1498,53 @@ static void cfg_setup(struct work_struct *work)
 		return;
 	}
 
+	/* Pairs with smp_store_release from below */
+	gp_registered = smp_load_acquire(&drvdata.gp_registered);
+	if (gp_registered)
+		goto try_rgb;
+
+	ret = sysfs_create_groups(&drvdata.hdev->dev.kobj, top_level_attr_groups);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to create gamepad configuration attributes: %i\n", ret);
+		goto try_rgb;
+	}
+
 	/* Pairs with smp_load_acquire in attribute show/store functions */
 	smp_store_release(&drvdata.gp_registered, true);
+	gp_registered = true;
+
+try_rgb:
+	/* Pairs with smp_store_release from below */
+	rgb_registered = smp_load_acquire(&drvdata.rgb_registered);
+	if (rgb_registered)
+		goto update_kobjects;
+
+	ret = devm_led_classdev_multicolor_register(&drvdata.hdev->dev, &gos_cdev_rgb);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to create RGB device: %i\n", ret);
+		goto update_kobjects;
+	}
+
+	ret = devm_device_add_group(gos_cdev_rgb.led_cdev.dev, &rgb_attr_group);
+	if (ret) {
+		dev_err(&drvdata.hdev->dev,
+			"Failed to create RGB configuration attributes: %i\n", ret);
+		goto update_kobjects;
+	}
+
+	drvdata.led_cdev = &gos_cdev_rgb.led_cdev;
+
 	/* Pairs with smp_load_acquire in attribute show/store functions */
 	smp_store_release(&drvdata.rgb_registered, true);
+	rgb_registered = true;
+
+update_kobjects:
+	if (gp_registered)
+		kobject_uevent(&drvdata.hdev->dev.kobj, KOBJ_CHANGE);
+	if (rgb_registered)
+		kobject_uevent(&drvdata.led_cdev->dev->kobj, KOBJ_CHANGE);
 }
 
 static int hid_gos_cfg_probe(struct hid_device *hdev,
@@ -1510,30 +1554,8 @@ static int hid_gos_cfg_probe(struct hid_device *hdev,
 
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
-- 
2.55.0

