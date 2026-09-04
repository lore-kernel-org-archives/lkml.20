Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9AE3A5E7D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788488499; cv=none; b=KVulshvE+0ge6UJilB2tcJ5KMg4tip5wySQtdptVo/1wUiOWPCKfcuFT4LIj8vNKFVhKXZZjMY/PbzAkGjVzbZzhPdLhyx4kzIdhW1HQmMSTmjf4UlVJ8YY2UoV+CCcyGBooQdRbmrRTRV6pV4WZKexaDdO7QeHPUShyeBLVNQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788488499; c=relaxed/simple;
	bh=h54IVhOz972r9SlibD/NmMun8S4bH+/JzcBwGAYcQwQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMt1OVhV2pzkpQdaIscmnsuGoTZbSSvE4/Oc2gOET0NkVTkq54FV21qY3V/0WqE2/CHAmaIcpBjaCaTi3OPuW5faT0jkNY6/gUnsmfpEfItsV1wrJnoBkSUZun5l9OgiNKbhHjAmJLDx84e3PZ2yCG/VBwMydoEhqDftSf6KutM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=K8LtjMrI; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="K8LtjMrI"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-9103be3b3d9so8276926d6.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1788488497; x=1789093297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l6XzdnjPULcLNPcEZR2pYapYG2gyMXOX+lXNgNvow9k=;
        b=K8LtjMrIujjE8BqrAJs2WwTlx0To3F0BAoEt3yzqQtbVvaKZ/hydpdpzyyXt+6v7xv
         0bE2tH3+Uvx7pbUYyRkos82q80bdy0Y6CePI+w09AXbSgacN3TzkBMnV6Q1oLce9jmAk
         ODEuofXDLmtE5TxD1LLqBJ8YqYOrmfX0t7hQC0c7I8mXuZrqxf/5oOk16FJqH5Ty+Rm6
         48nSPdNUvPxCeZgo7tOy1OxQIpL88PTRJlSKC6dM79MHw2WhaD9huuj6pvofNJ4NEG1R
         sfhVdbi9kv2yuCFxv4+0/ZRREPS7RxgoTkb6OsUOTX0Vb2eaNa08HNBqUB/ccc0hNyEb
         ZnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788488497; x=1789093297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l6XzdnjPULcLNPcEZR2pYapYG2gyMXOX+lXNgNvow9k=;
        b=gj63MlCEmZU8YMNHfoSDbqYlAxusGGeeGQCfMoi2BrCDYxAP4Fs774mJXCN5UF7Hba
         g0BholrHTf0geo2Zhl4MsEggmZ00X2m85PhJv3RcFWpt1Qk1xXDQn7zMBHOiICG526y8
         97gf0xdYcKzWrYExzUguvCpdZdnJjx0JW43ooVJelyh6b9zetuyqQEnPumkFBXBxC9mn
         l96GwkfTBUNdUYqOr0E9spkhOBr4pY4w8JuaGM5bWUR+XTsHXRQNjVKhGFVPPL/RmEug
         ktR+shiBqRXjq5Tfvclu0X7j8TqqV9VVV5DG2QkJtdn+glJNFaho+Yd9F5Hn2FvEW5LL
         jGKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqu8O1Gdxsk4q+5UEGq6lsfBM9jAWdrUCQMc+vevLJtKxFdKBdIeoQiNFkZc+gZqhOE/9WxeLZjLrYKpA=@vger.kernel.org
X-Gm-Message-State: AFuF++lOeDk/5TM3nd96vg5uOI/QxYyadf8ToWpN5i4j6zgKn/6j4b4f
	2LPEAGKzl1LOPopsG4gq1JUyoSkcBKmZWczPK2boq7rpuzAN8K2U4AC6b6GZP0TTyMs=
X-Gm-Gg: AYBFou1zVNDeqnfDgnV+fgHlQptOJaPbbx96uhVDApSUZ1lGrkp6vGyWznpt68JWuBr
	G6ltOOJK28c6BrwTVa46U6TOL8JPErh5VU3J7wZ7aNJtXGIw31UF21l0tAnnepERbMQmiLoVLYb
	iH0GSYmMhM45fjxnZQ73ydYdIEoZWxjsmRShdk4YnfdebK0durFRQN0ZcTsJGaOXXZ5RU9Zw3Yk
	v6R47FAV1bCWNRVTpEWd+28uJEEJbhn4pF65/fvwedl75llJzb7HVidAprt4mirhMiFLHEyQrs9
	4R2mmVMVSx8fycVdaV3jFLqI7NGawIpAw1PKkBEzqgNiT85YtnTJbadE74QgijVlcCctpXhrI3D
	iXMe9W9eO/p+VcLm60LPyWhRRHEYL3N2Cn17dLnja4J38OJa3AQ1B8eQ58xXzREuFWPGRmJz5kL
	yh/68V4NtZuI443euA8MlTMVLni/qum8cNQau5BW42lCju6KiJeHns56R1iaaU/bMqli7eTdqZI
	0WBaq7n5Ffvw2e8h5cwM8U1dgUYt8ImXA==
X-Received: by 2002:a05:6214:8083:b0:90c:e10b:d9cb with SMTP id 6a1803df08f44-9103ef766a8mr46629006d6.6.1788488497259;
        Thu, 03 Sep 2026 19:21:37 -0700 (PDT)
Received: from camelot.arimil.com (24.229.171.193.res-cmts.sm3.ptd.net. [24.229.171.193])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91040595f81sm9508846d6.2.2026.09.03.19.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 19:21:36 -0700 (PDT)
From: Arie Miller <renari@arimil.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Aleksa Savic <savicaleksa83@gmail.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arie Miller <renari@arimil.com>,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] hwmon: (asus_rog_ryujin) Validate HID report lengths
Date: Thu,  3 Sep 2026 22:21:28 -0400
Message-ID: <20260904022129.97896-2-renari@arimil.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904022129.97896-1-renari@arimil.com>
References: <20260904022129.97896-1-renari@arimil.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rog_ryujin_raw_event() parses response headers and payload fields without
first checking that they are present in the received report. A short report
can therefore make the driver consume uninitialized bytes from the HID
transport buffer and expose them as sensor values through sysfs.

Validate the response header and the fields used by each response type
before parsing them.

Fixes: ed3e03790c5c ("hwmon: Add driver for ASUS ROG RYUJIN II 360 AIO cooler")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-hwmon/20260812104617.858D01F000E9@smtp.kernel.org/
Cc: stable@vger.kernel.org
Assisted-by: Codex:gpt-5.6-sol sparse
Signed-off-by: Arie Miller <renari@arimil.com>
---
 drivers/hwmon/asus_rog_ryujin.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/hwmon/asus_rog_ryujin.c b/drivers/hwmon/asus_rog_ryujin.c
index 702edb831394..f4d99c510369 100644
--- a/drivers/hwmon/asus_rog_ryujin.c
+++ b/drivers/hwmon/asus_rog_ryujin.c
@@ -422,10 +422,15 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 {
 	struct rog_ryujin_data *priv = hid_get_drvdata(hdev);
 
-	if (data[0] != RYUJIN_CMD_PREFIX)
+	if (size < 2 || data[0] != RYUJIN_CMD_PREFIX)
 		return 0;
 
 	if (data[1] == RYUJIN_GET_COOLER_STATUS_CMD_RESPONSE) {
+		if (size <= priv->info->temp_offset + 1 ||
+		    size <= priv->info->pump_speed_offset + 1 ||
+		    size <= priv->info->fan_speed_offset + 1)
+			return 0;
+
 		/* Received coolant temp and speeds of pump and internal fan */
 		priv->temp_input[0] = data[priv->info->temp_offset] * 1000 +
 			data[priv->info->temp_offset + 1] * 100;
@@ -437,6 +442,9 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 		if (!completion_done(&priv->cooler_status_received))
 			complete_all(&priv->cooler_status_received);
 	} else if (data[1] == RYUJIN_GET_CONTROLLER_SPEED_CMD_RESPONSE) {
+		if (size <= RYUJIN_CONTROLLER_SPEED_3 + 1)
+			return 0;
+
 		/* Received speeds of four fans attached to the controller */
 		priv->speed_input[2] = get_unaligned_le16(data + RYUJIN_CONTROLLER_SPEED_1);
 		priv->speed_input[3] = get_unaligned_le16(data + RYUJIN_CONTROLLER_SPEED_2);
@@ -446,6 +454,9 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 		if (!completion_done(&priv->controller_status_received))
 			complete_all(&priv->controller_status_received);
 	} else if (data[1] == RYUJIN_GET_COOLER_DUTY_CMD_RESPONSE) {
+		if (size <= RYUJIN_INTERNAL_FAN_DUTY)
+			return 0;
+
 		/* Received report for pump and internal fan duties (in %) */
 		if (data[RYUJIN_PUMP_DUTY] == 0 && data[RYUJIN_INTERNAL_FAN_DUTY] == 0) {
 			/*
@@ -472,6 +483,9 @@ static int rog_ryujin_raw_event(struct hid_device *hdev, struct hid_report *repo
 		if (!completion_done(&priv->cooler_duty_received))
 			complete_all(&priv->cooler_duty_received);
 	} else if (data[1] == RYUJIN_GET_CONTROLLER_DUTY_CMD_RESPONSE) {
+		if (size <= RYUJIN_CONTROLLER_DUTY)
+			return 0;
+
 		/* Received report for controller duty for fans (in PWM) */
 		if (data[RYUJIN_CONTROLLER_DUTY] == 0) {
 			/*
-- 
2.55.0

