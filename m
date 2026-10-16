Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDE547C0FB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154897; cv=none; b=FykAuZOcx+p5crR/dXTeBZB23OyMMnx9/FLE3ptx+Qoq8dVCyRvthL/r3twkNg7037dzlQqzY+gGxfkFt1znmSq8g21CrYscAv4Lqn7DlRkmuUMPOnnU+OVcqzeafrzoszOG9yDPCq8Z0ynHeDrr0eN3e4vU95oSf9wqqLQD42o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154897; c=relaxed/simple;
	bh=ymrDji5W9iGBhnKB17kI9XG5LABaYRXT8lJaYMJlZcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wtr7d0pGuZmtvVFqmOh5qFNQBKqt6UmGhmUVUjT2VW5vqr5kkMVmTw3vk/IBgjdQxeWJK7bzIiocUKmCXyVSXJcCyOP55zzZ2ysPxsj2X3tJgoB0NQvA6rBrBkWuB8l3A3wpP/wCAe0b1nDMfWXtSHjosKyhzoWoQ+8XL5v2yZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l0xPYEbf; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l0xPYEbf"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e812e2b31bso37208855ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792154895; x=1792759695; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tXKmdBCd7CWIsG/hFcl6oubp63Bnjwu+bVpaEElF5sY=;
        b=l0xPYEbfzh4ZheJiRg65u9dWRnYAtEfidN0DgbHAFZiDMMC8twvXmOzCAC6en3sJ4U
         EEED1SCRMZU4WRFT3oUTng8uVw4LtOhvCTSfb8tDNXnE2oc0PpiY2Y6n65y8fkMXry9V
         rllxqw1iovDMOuK6zULmM0KqFLqgb6uYzTYSxIfyceARhHhy7RQRW8FodycmD51y4+9d
         pMIZYVXhGlM4wX0PvNVYezGMOu3e14ms2UYo4rfF20lMhiqdisbjZngdzioBWqFIxdkW
         EM3bWEZUbGAVVIx5gI5A2YcaXiqzoTCF86+FA4g5KoXEestuknAJqkeVsf4YbJX6vt+8
         ANeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154895; x=1792759695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tXKmdBCd7CWIsG/hFcl6oubp63Bnjwu+bVpaEElF5sY=;
        b=PGK5KvioU2Y3Wb88hZzr1i+qRufsFR4sLUY1+40zEtzgJcffbO25ihkzwRJHxPKpLz
         TO55FMZ79fxW7mB4orZODB3vTH9rYCL6hXtY5IFGL6kYNvVjO+1gAquuKRhW3v3njZ7K
         ilYaXBrjXrLy4eJlas/4Ko8CWvcpUShJ8fy0wXbrfdxjgtOVhJskxEd0fIhZjmsDJyAJ
         KkmjNorqPfw1z0PcT9TF1gVdCCjTcVTkBiYVTrFr6TOnRC+Be8LDtN+IDkF0YOfXbVtb
         26ECk/M0b+ufSmFUT5/ERv244Lrv7yfQ0svkMxQdpoMRkHfVBr5fGBBH2JdXvUIWhOnh
         RKMA==
X-Forwarded-Encrypted: i=1; AKwUvBzgFrBG2iGj2Xl+UxXkLhIzYqokA2iDm4g8PVrIgSv5bfda2iTcnoPYrwzQE1OBbRtEuiQy9PrSd+QIzXM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMln4edk0BRO3/Kwqd4h+t9Y+ZyQHJy440lW5o6nJGv3YqfF3b
	4f4OZmwnymH9k1asf2avxtkranlMEHmScFch1a6lYCtaQL5L5sfJU/n4
X-Gm-Gg: AYBFou0+sN9EDugfSWdXefBS+2SCWVn31ylLRLpQXzaDKTvQ5UVTsDnAqV4C2ItrVcR
	LsXtw9z67z7FPSylQuzcFLr/zG0hLU3XFCY9jNUqA0LtkuBQ25b7/nxjR+mkcCj1wW0upn49l/L
	jR2UPq0c6HgP7dIHsuZQ1UFZGp8mITUHd7GV+wDh4NpkST3ke2H/UCXmPEYqC991uA0Rctxzl/h
	g4jDxQrKiyoyln/Ni1V5FFGZNIouDr05ndLxbOkdg28BlNvvQ3tmto/+iwDjZHVsbByWnK1svGm
	OO/mHg+BFqFChA3lw/h3MN3b29HkzsQa0RRCU51wLgj46TDgtywHYqqG02lTsiInjp355lZYKq1
	CXhUJP3QQlavyAOXpWNApfcgsk8KLZWLMn1LAjZNdVCA8qllrQjf0UEuTCCBys7Oc7wQ49JDWXf
	qG8uKphGIrgjMKHREU8c9fy9Kq6ho52I9+XFmwYuYAyhK+12HLpeARRIz7ZsTvdvBKOkG1oYRpV
	0mj02Xcsumaiw==
X-Received: by 2002:a17:903:3d10:b0:2e9:7e90:8a3 with SMTP id d9443c01a7336-2e97e900abcmr24506075ad.39.1792154894479;
        Fri, 16 Oct 2026 05:48:14 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e834ef9sm9833775ad.42.2026.10.16.05.48.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 05:48:13 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] power: supply: qcom_battmgr: expose the charge current limit
Date: Fri, 16 Oct 2026 21:48:06 +0900
Message-ID: <20261016124806.1789-2-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261016124806.1789-1-26rote@gmail.com>
References: <20261016124806.1789-1-26rote@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The battery manager firmware takes a charge current limit in uA
(BATT_CHG_CTRL_LIM) and reports the highest value it accepts
(BATT_CHG_CTRL_LIM_MAX). Expose them on SM8550 class batteries as
charge_control_limit and charge_control_limit_max, clamping writes to
the maximum.

Also handle the BATTMGR_BAT_PROPERTY_SET response, which was logged as
an unknown message, and return its result.

On a Lenovo Legion Tab Y700 Gen 5 with a 45 W PD charger, limits of
500 mA and 100 mA give about 480 mA and 90 mA of charge current while
the PD contract stays at 9 V. A limit of 0 stops charging, and this
firmware does not resume when the limit is raised again until the end
threshold is moved below the capacity and back.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
The downstream qti_battery_charger driver also writes this property in
uA. The thermal mitigation series [1] used it as a level index, and
Konrad noted that the ABI defines charge_control_limit in uA; this
follows the ABI. Only tested on Kaanapali.

[1] https://lore.kernel.org/all/20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com/

 drivers/power/supply/qcom_battmgr.c | 52 +++++++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 0d55458b2881..69931827bc08 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -260,6 +260,8 @@ struct qcom_battmgr_info {
 	unsigned int charge_count;
 	unsigned int charge_ctrl_start;
 	unsigned int charge_ctrl_end;
+	unsigned int charge_ctrl_limit;
+	unsigned int charge_ctrl_limit_max;
 	char model_number[BATTMGR_STRING_LEN];
 	char serial_number[BATTMGR_STRING_LEN];
 	char oem_info[BATTMGR_STRING_LEN];
@@ -451,6 +453,8 @@ static const u8 sm8350_bat_prop_map[] = {
 	[POWER_SUPPLY_PROP_POWER_NOW] = BATT_POWER_NOW,
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] = BATT_CHG_CTRL_START_THR,
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] = BATT_CHG_CTRL_END_THR,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT] = BATT_CHG_CTRL_LIM,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX] = BATT_CHG_CTRL_LIM_MAX,
 };
 
 static int qcom_battmgr_bat_sm8350_update(struct qcom_battmgr *battmgr,
@@ -635,6 +639,12 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		val->intval = battmgr->info.charge_ctrl_end;
 		break;
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
+		val->intval = battmgr->info.charge_ctrl_limit;
+		break;
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX:
+		val->intval = battmgr->info.charge_ctrl_limit_max;
+		break;
 	case POWER_SUPPLY_PROP_MANUFACTURE_YEAR:
 		val->intval = battmgr->info.year;
 		break;
@@ -729,6 +739,26 @@ static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, i
 	return 0;
 }
 
+static int qcom_battmgr_set_charge_control_limit(struct qcom_battmgr *battmgr, int limit)
+{
+	int ret;
+
+	if (limit < 0)
+		return -EINVAL;
+
+	mutex_lock(&battmgr->lock);
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET,
+					    BATT_CHG_CTRL_LIM_MAX, 0);
+	if (!ret) {
+		limit = min_t(u32, limit, battmgr->info.charge_ctrl_limit_max);
+		ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_SET,
+						    BATT_CHG_CTRL_LIM, limit);
+	}
+	mutex_unlock(&battmgr->lock);
+
+	return ret;
+}
+
 static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *battmgr)
 {
 	int ret;
@@ -764,6 +794,7 @@ static int qcom_battmgr_bat_is_writeable(struct power_supply *psy,
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
 		return 1;
 	default:
 		return 0;
@@ -786,6 +817,8 @@ static int qcom_battmgr_bat_set_property(struct power_supply *psy,
 		return qcom_battmgr_set_charge_start_threshold(battmgr, pval->intval);
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		return qcom_battmgr_set_charge_end_threshold(battmgr, pval->intval);
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
+		return qcom_battmgr_set_charge_control_limit(battmgr, pval->intval);
 	default:
 		return -EINVAL;
 	}
@@ -921,6 +954,8 @@ static const enum power_supply_property sm8550_bat_props[] = {
 	POWER_SUPPLY_PROP_POWER_NOW,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
 };
 
 static const struct power_supply_desc sm8550_bat_psy_desc = {
@@ -1479,11 +1514,28 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
 		case BATT_CHG_CTRL_END_THR:
 			battmgr->info.charge_ctrl_end = le32_to_cpu(resp->intval.value);
 			break;
+		case BATT_CHG_CTRL_LIM:
+			battmgr->info.charge_ctrl_limit = le32_to_cpu(resp->intval.value);
+			break;
+		case BATT_CHG_CTRL_LIM_MAX:
+			battmgr->info.charge_ctrl_limit_max = le32_to_cpu(resp->intval.value);
+			break;
 		default:
 			dev_warn(battmgr->dev, "unknown property %#x\n", property);
 			break;
 		}
 		break;
+	case BATTMGR_BAT_PROPERTY_SET:
+		if (payload_len != sizeof(resp->intval)) {
+			dev_warn(battmgr->dev,
+				 "invalid payload length for battery property set: %zd\n",
+				 payload_len);
+			battmgr->error = -ENODATA;
+			return;
+		}
+
+		battmgr->error = le32_to_cpu(resp->intval.result) ? -EIO : 0;
+		break;
 	case BATTMGR_USB_PROPERTY_GET:
 		property = le32_to_cpu(resp->intval.property);
 		if (payload_len != sizeof(resp->intval)) {
-- 
2.43.0

