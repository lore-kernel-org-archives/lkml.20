Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33630384CCB
	for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 01:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792201219; cv=none; b=cMYHbtgChMsH+fY4crj2QrH9N52tUtBl8odt5XQprlc96nCNOApg6kK+vAK3WnspGAeRF74DQ5xyvG3YTi4zviQDdK9MizRFynyY7CvgXlg7VN0lNzxytwEFB4mxH0MnzaPsSoFtlFIr9Lp/EhwS2t4JwFeq9cEu6hc+x94QLgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792201219; c=relaxed/simple;
	bh=1qfCQn/3nkq5j5ecKm8Uade0gaSbZq+iByMXXB5yfm0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKjiiWULULBCQ3zVtBn8OLgeTVQvQZAz1JJ7QhRRVzS1NCI2dp/Y1gCUkOkmCt4oyqgFf4W67pMmPeWqRCqdUUz0TWUSvKt8kRb76gRECX0Ax2TSZbv9Kd3SHvaWjifXNHnTMS5pG9rJKlhbD6fcVrSAI0DMg08UmYP4hVwtpYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLWS0Uwh; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLWS0Uwh"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-16079d54c17so1016528c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 18:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792201214; x=1792806014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NwVXszoQYkhN5ZhSszG9Fvql8BXH+9r0vfKBVLu7pO0=;
        b=VLWS0Uwh1MoGky+MKOAZw99b+h3o2cht5BAtjXp9x8BF0xzAO6WQq5Ld+w86zxpgWj
         sYIf3davJtgivbulsDzqQTR/9LSO4odByRXN4VAUECgPhlCqSFbbik5PBMtEJyG6byxF
         O7Y6421lUnIz1Bum8cW8MW1pNt+6E3LzXVhZ6pQ8lWzOHGk9obhzNWC844HsHcJZfhAx
         5zR7em5qwx57sL8M/w8SYwGnu69GnkTVf0yT+ZaeYeN4lTC+eK+RpB1Pg0ZYSf5siljZ
         a3klhEErar2RHtCsU+iqw30GW2DuiyEuKeUvMZYx1QBBN/BQQF4133jUd4XXTgyoT/o7
         BfSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792201214; x=1792806014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NwVXszoQYkhN5ZhSszG9Fvql8BXH+9r0vfKBVLu7pO0=;
        b=w5UTh3Razr/56IJxAxmkj+pv3OWhcAk8RkSSfta81pNGAcmdp02m77BJOj/9sd9jmo
         fSUJNXWrsY5JkH/mEibk/v3wWgEu7EazOELqf6EEiIfUdsVcnePMf8bqPGGSNpUQ07t9
         MrHtVM6An5gZDsX6eteVH3czgm4E5htHKML4eSj8tuKQW5dsGpG/E8H5QlzHymJDOgVN
         h96G4O3CWaM80QX4AudzK3f/lRcdI8ILtXWZbaGz2JOjaqXNkHl6LuitB19hWGa4OlRo
         PIQFxF6TtBztgAPMfDFL/cecj0wQQyGz2d54EIh1yuXiAsadd9JCWYOh6rr52GoPlTj8
         vhrA==
X-Forwarded-Encrypted: i=1; AKwUvBxyWK9UGb3Id/9wSeepNV9Ngaf67Zl0BhkefCctXGTLHlyM0UDYLsi2TqQp28c6bwi5MMWQ5gUXrAMtg2I=@vger.kernel.org
X-Gm-Message-State: AFq9FYLQcfxbXp0d2k27nYshdIFB8zid6uWlFzeMgh0vFsMFS9IQHxcz
	1buM6B3AZtS+IRzLpzODIaPiA2YDVaoaTuz4Al/IzsxnzK74U6Ecifxg
X-Gm-Gg: AYBFou34nFdwuGY1XIkhIUZ+XQVBc018MssKrqyYeGqIzqjMCt1Xqo6gX3bmsntoe9X
	pDtt2ZmDBtvaOrCAufL0Dm140YUOytqvuegZQLTX1KH68HPjRo+U5oFYNJpaCACgIkfEdUw+ORu
	fDXXoVr1OwDWFo6vqW5308fm6/6ay3BWgbADrqVUppsB4Pf+WAdKkT6f+KTJPVmi4dPD8YMCfUC
	GVYBXsDkPZgIp/bC6mhi5HWsHMS3wn2Md022mssKv0ip4/69M817OjfodEouaJjjzn7lmjcboDh
	9CAwYlOFBXiSdTtKE7OzNG/MqFkeheUuBK6o0UzGQAYtBYUUq2H4I1N+VD3D6rdo4pOQw8g6fFL
	FjvzilGJRL+2PyF9EYHXYpW7PqPXTCOGWc3wInBZiS4yuCR2/jiqQOc285desjRW18I0j/rtZdO
	QR9eFKpv/cs8Zcf17rZf+3wd80BY4RC63+YqLw7GcvlooLPy8SYGl/ixcxt1H0k4Rv8oQLak8U5
	s7jgOtxfGUoTNVv/gcyWcZ6vBvAX2ffdsnjCldejsm+raIHYkurLfdbvNx0Kg7q5M3Mv8nL3jM=
X-Received: by 2002:a05:701b:2086:10b0:17d:7b45:f927 with SMTP id a92af1059eb24-185139aef7dmr2079779c88.33.1792201214184;
        Fri, 16 Oct 2026 18:40:14 -0700 (PDT)
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
Subject: [PATCH v2 08/11] HID: hid-lenovo-go-s: Reorganize and rename hid_gos_cfg
Date: Fri, 16 Oct 2026 18:39:53 -0700
Message-ID: <20261017013956.2440130-9-derekjohn.clark@gmail.com>
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

Renames hid_gos_cfg struct to gos_cfg_drvdata in preparation for later
fixes.

This is a prerequisite for later fixes. No functional change intended.

Fixes: a23f3497bf208c59ad ("HID: hid-lenovo-go-s: Add Lenovo Legion Go S Series HID Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
---
 drivers/hid/hid-lenovo-go-s.c | 39 ++++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-lenovo-go-s.c b/drivers/hid/hid-lenovo-go-s.c
index cefb243800b6..136372eb6e6b 100644
--- a/drivers/hid/hid-lenovo-go-s.c
+++ b/drivers/hid/hid-lenovo-go-s.c
@@ -32,37 +32,42 @@
 #define GO_S_CFG_INTF_IN	0x84
 #define GO_S_PACKET_SIZE	64
 
-static struct hid_gos_cfg {
-	struct delayed_work gos_cfg_setup;
+static struct gos_cfg_drvdata {
+	/* MCU General Variables */
 	struct completion send_cmd_complete;
-	struct led_classdev *led_cdev;
+	struct delayed_work gos_cfg_setup;
 	struct hid_device *hdev;
 	bool orphan_ack_pending;
 	struct mutex cfg_mutex; /*ensure single synchronous output report*/
-	bool gp_registered;
-	bool rgb_registered;
 	int cmd_status;
 	int setup_attempts;
+
+	/* Gamepad Variables */
 	u8 gp_auto_sleep_time;
-	u8 gp_dpad_mode;
-	u8 gp_mode;
-	u8 gp_poll_rate;
-	u8 imu_bypass_en;
 	u8 imu_manufacturer;
+	bool gp_registered;
+	u8 tp_windows_mode;
+	u8 tp_manufacturer;
+	u8 tp_linux_mode;
+	u8 imu_bypass_en;
 	u8 imu_sensor_en;
+	u8 gp_dpad_mode;
+	u8 gp_poll_rate;
 	u8 mcu_id[12];
 	u8 mouse_step;
+	u8 tp_version;
+	u8 gp_mode;
 	u8 os_mode;
-	u8 rgb_effect;
-	u8 rgb_en;
-	u8 rgb_mode;
+	u8 tp_en;
+
+	/* RGB Variables */
+	struct led_classdev *led_cdev;
+	bool rgb_registered;
 	u8 rgb_profile;
+	u8 rgb_effect;
 	u8 rgb_speed;
-	u8 tp_en;
-	u8 tp_linux_mode;
-	u8 tp_windows_mode;
-	u8 tp_version;
-	u8 tp_manufacturer;
+	u8 rgb_mode;
+	u8 rgb_en;
 } drvdata;
 
 struct gos_cfg_attr {
-- 
2.55.0

