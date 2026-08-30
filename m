Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C3428FFF6
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 14:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788101832; cv=none; b=BaRiZSO9yXDu11zwe8faBOHuRtfY5Xo1DcT7+uQH6YZY9+x3nbkgZ/NfoMNfxenqyJXIpTQOlyGWEomrKVVw/Qf9Z5wVMpiLDiceI+WLqBUTo6rzlxULIwvZp66UD/lX9qe0H6G4DPCqo5D7kcRNXLQoeNEVuzsrhFHvGBtorik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788101832; c=relaxed/simple;
	bh=reLdAq8P0t49kvDWPzWt8gweqMKLVAKU+JnfiiZyo8k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fuuV+ociEGsQATcARV4pPaSW6azwmsNCEHy4XCGh1jYXImJVA/u3Y2wFka5sshZYoZqOOx9IISrLtpwQ3P52Wug8DJ/o1zBl0SF32o+zSxU3nmKE1Wy0ik6MwI/4vhJxT7z5VO1c4TvLc97l5pZP3DpBpEqLM9QDXdavkUDt35Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AUdgJUf7; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AUdgJUf7"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ceab75934dso29623965ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788101830; x=1788706630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LxJQOF7esWYVaSzzh3UuNgbHtz6kTLWO9YCyNun8jQU=;
        b=AUdgJUf71EJBvQqm3xSlinMexVSueLib2udrkpjY3tCP6H8WdVWV3r5frZ+TZhYe6P
         EdBo1GOx3Wj0pYxHIYIOWv/HDeo31csGvRfUcU1t3/5LT5fuu0z9xXoMC+uAa9PmE/hk
         TEEyaF+TNGtrCuQjgDQVIhffVfCPfv/6YLHPDWlPsCtU88oTswhDSHmXG5vl91N+f259
         l9vLd5oZb5Kr9orHd/OtBf2S9KCAKvxhxOIc7NOcQa84jt71CDqQ6ZGbYidS6yH7bFLM
         ECGm57VxkQSD/8Wij3DXEjRVp/uz7fHlhHUyDaUpDykzRkfukwk7afJHRNGAwEJh+Qvg
         XtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788101830; x=1788706630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LxJQOF7esWYVaSzzh3UuNgbHtz6kTLWO9YCyNun8jQU=;
        b=JvnPylgxigK69bulhUOcqlTJwdelXGjRtVeTqwwHXBZjEqmGX6Et34xrcGRmZAj7tC
         B1myQLCRIgMw5ivLZXmM4Uznr9CXF3peeaCPXDV/cgP6kCSTtv+VuyqU1ZASMoVoawCa
         EGo7qIqnJ1GDau/h5XCtcaIinI7vqGrQuLZ0Il9SzlMI/CqIYgl9J000yG+vXgwZUAQI
         WB+kx+eI/zhNNo7zrk8TmSydHXwO2pKEqyv4F2NVwaMSGJOvsU7wmbMpFMFV/GhlzUhM
         TdZ75MWvu8YhaQX+YXiuQ3LUX4fVqGmN86Cl5iaxuzIKeP4hPuOfdNcNfkfQua9lYAMP
         RqJA==
X-Forwarded-Encrypted: i=1; AHgh+RoO6MT6O5K1H8x5JZ+vTwM90LKhJGhsZqs2tHg3xPEoJXksJGnDpsEXL8utPr/irIqLWvjx2Dhvl1jaYPY=@vger.kernel.org
X-Gm-Message-State: AFuF++ldJXJkNsu6xefsh+yvaN4DE7nz497J3Mz7wclAdO9AGKmrkyvc
	Kt3+03FNA+ReJm0COWamONMOK9my4otDgmKGTnWbrGmKyZS2zKb15B+U
X-Gm-Gg: AR+sD114JDBpD9kMkJYkpJFiZXvR28o1JQF15+eKC1PcWysVzVos17jmadR4xIY1yDe
	OYfVCXiE7PsE14Q0l+wrPNMQLGOuHZBvuKnUQp1IB0O2qlju4xuzz07lxvG7LW+WK01cU6LpI//
	V3IoCYb2sZ8hJq6ZYy4TuSnT7igJ3qXMtVtkJhr0v0PWIzBUl0tpsZgPMRR4/gD8puxAX6V0Ori
	kKXHbkmXreZVxwJ7aJ3GEAZmJUu2EGHkP9viSij0vbeeEIG/nz6UTVbAov8dgsI7p0WKeV1lOlt
	+gbs0OIyP4f30PWJC3UTaXgPzjAT69z9sH8BzpiCMX26sxVVzsugNhZJFDA2kvg+Um2mlwZVgA1
	8P4XbnxQv1EEe2rL5l1t2u3pLikHQYgX7LjgxvMyIwIcqj0/UGaezYvnmcxImHM8faBQe4b+crg
	1JbsiCLw/IhsxF4rnBXfZS2C3zpJ2PaZa9IgefVB9bSH3olkodMGGl2BTndkcCCMIspg4gqZZqk
	23x/L6mvV1D0h6A6WQ=
X-Received: by 2002:a17:902:c946:b0:2d8:d4d0:792f with SMTP id d9443c01a7336-2d8d4d079bdmr140071165ad.19.1788101829989;
        Sun, 30 Aug 2026 07:57:09 -0700 (PDT)
Received: from localhost.localdomain ([103.16.69.193])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f959575sm23198024eec.15.2026.08.30.07.57.05
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 30 Aug 2026 07:57:09 -0700 (PDT)
From: Aditya Dash <mradityadash@gmail.com>
To: Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/6] HID: hid-lenovo-go: use the correct calibration commands
Date: Sun, 30 Aug 2026 20:26:53 +0530
Message-ID: <e6874a99a824050b89c61878b960c292ed790d3a.1788096667.git.mradityadash@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788096666.git.mradityadash@gmail.com>
References: <cover.1788096666.git.mradityadash@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calibration attributes pass the calibration operation as the command
and the configuration command as the sub-command. This sends each request
with the two fields reversed.

Swap the command and sub-command values for all six calibration attributes.
For example, the malformed left joystick Start request is:

  05 00 04 0c 03 01 ...

The corrected request is:

  05 00 0c 04 03 01 ...

The bytes identify the output report, configuration group, command,
sub-command, left controller, and Start action, in that order.

Fixes: 995887a10da1 ("HID: hid-lenovo-go: Add Calibration Settings")
Assisted-by: Pi:gpt-5.6-sol
Signed-off-by: Aditya Dash <mradityadash@gmail.com>
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Tested-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go.c b/drivers/hid/hid-lenovo-go.c
index 318b1152ff8b..b8248bf8965c 100644
--- a/drivers/hid/hid-lenovo-go.c
+++ b/drivers/hid/hid-lenovo-go.c
@@ -1911,18 +1911,18 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_left, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_left_index,
 			    "rumble_notification_index");
 
-static struct go_cfg_attr cal_trigg_left = { TRIGGER_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_trigg_left, "calibrate_trigger", SET_TRIGGER_CFG,
+static struct go_cfg_attr cal_trigg_left = { SET_TRIGGER_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_trigg_left, "calibrate_trigger", TRIGGER_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_trigg_left_index, "calibrate_trigger_index");
 
-static struct go_cfg_attr cal_joy_left = { JOYSTICK_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_joy_left, "calibrate_joystick", SET_JOYSTICK_CFG,
+static struct go_cfg_attr cal_joy_left = { SET_JOYSTICK_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_joy_left, "calibrate_joystick", JOYSTICK_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_joy_left_index, "calibrate_joystick_index");
 
-static struct go_cfg_attr cal_gyro_left = { GYRO_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_gyro_left, "calibrate_gyro", SET_GYRO_CFG,
+static struct go_cfg_attr cal_gyro_left = { SET_GYRO_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_gyro_left, "calibrate_gyro", GYRO_CALIBRATE,
 		     LEFT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_gyro_left_index, "calibrate_gyro_index");
 
@@ -2018,18 +2018,18 @@ LEGO_DEVICE_ATTR_RW(rumble_notification_right, "rumble_notification",
 static DEVICE_ATTR_RO_NAMED(rumble_notification_right_index,
 			    "rumble_notification_index");
 
-static struct go_cfg_attr cal_trigg_right = { TRIGGER_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_trigg_right, "calibrate_trigger", SET_TRIGGER_CFG,
+static struct go_cfg_attr cal_trigg_right = { SET_TRIGGER_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_trigg_right, "calibrate_trigger", TRIGGER_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_trigg_right_index, "calibrate_trigger_index");
 
-static struct go_cfg_attr cal_joy_right = { JOYSTICK_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_joy_right, "calibrate_joystick", SET_JOYSTICK_CFG,
+static struct go_cfg_attr cal_joy_right = { SET_JOYSTICK_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_joy_right, "calibrate_joystick", JOYSTICK_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_joy_right_index, "calibrate_joystick_index");
 
-static struct go_cfg_attr cal_gyro_right = { GYRO_CALIBRATE };
-LEGO_CAL_DEVICE_ATTR(cal_gyro_right, "calibrate_gyro", SET_GYRO_CFG,
+static struct go_cfg_attr cal_gyro_right = { SET_GYRO_CFG };
+LEGO_CAL_DEVICE_ATTR(cal_gyro_right, "calibrate_gyro", GYRO_CALIBRATE,
 		     RIGHT_CONTROLLER, index);
 static DEVICE_ATTR_RO_NAMED(cal_gyro_right_index, "calibrate_gyro_index");
 
-- 
2.55.0

