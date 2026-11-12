Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491381;
	b=yuivCkiB03wR8Lmh6y8aINaWX+rbP/6WL4bA0wqON3RUv+brluw7WF1w4BerY0H19FjB
	 pRflyW5ER21h82uKt+nSo69SK9NphKfHfiDa5ge0CDQjkIPW2IpVEyDu+a1f2AqQWNvzQ
	 Q1K1IWn4WKbd0J74Mf4miUnbvPQ6tz7WUjI9MM+FUz0gsUKVdmARg7lnraHGz1AOqHFVO
	 FmQ9N3GQioDvq1zjfCdTznSQ3Yns5HoUxg244G4R6fsnVbJyjb1UAs7gm65/kXjM0VgA+
	 jk+QfPOKbcWgQ/ESGIHjNrTpUgXqzcQzq3tttb3q1T1Y/HtgmJwHjzq7rL6E2a078rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491381;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8J3SUwGBwfavLf/E2Ow5B5AwEe3aXOGkxMOfu/9pU4Q=;
	b=4AmztyRcKhz+z4FTCVZ9XIICnYWHiYwMFmLm3Cz88fvE0Omgnk60SOxzVO38EY+Gfi+v
	 7wVHrwpD04YSlR7hWn7HR4ulq5UXS5SdWJ6sojZkRCTpMjcHLhtY4hzLW++Z+cqd9jpc7
	 nOHvPSGRgijowLaalOhEDKSvqkTKydML4F72xI0oXsa3nd45DzFixgOZNTK8fwyCzjm2U
	 /de68sr5X9be8K3/jFTzq5bF+eX0aZ7CdTwbbV+7wzZSUbqW69IzgbRkrs6kiSCJdilFd
	 6BJcs24uQMp9mPObdpct1+lT2mwrmae77+ZE+xre8VGD+ZxpqBSRcOqdKhxwAITslBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzUD2sS6;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68563606A8BD
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:49:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68563606A8BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JzUD2sS6
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a594d313a3so2609980b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794491379; x=1795096179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J3SUwGBwfavLf/E2Ow5B5AwEe3aXOGkxMOfu/9pU4Q=;
        b=JzUD2sS63ujpPtYga16vOf0Cu00MlBCD1ByXjWfdL08/dNnd94+SA2iZs0aQpVTm4h
         +6RFMiKpt4eq+Vozhcj54rW9dvwLM50HRyubo68BRB/Z5fTVPhtP65kvgr+77bGPVFIx
         Hwl+ERKpsRh+hsQ2484Go8J8PLvyqZzs4fSJfaizy7HUbFscH1dDciZA46RoXQQ3GQpm
         IAZRZtl7TySsmfXGkKusqMB92CAL8q2tU1wXvyCCsN+2WxoaHTIYO30ULgIva65WKfgV
         dtmwxR6UQJUmiPw2MeYzQf8MzhyV6uouxOlrQRLIjC7Zg4638Hf4fkqmaPQwBItQq3Nb
         1c1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491379; x=1795096179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8J3SUwGBwfavLf/E2Ow5B5AwEe3aXOGkxMOfu/9pU4Q=;
        b=mx/KKPwwg6ZkQYy/4Kj1NfdchCgaiF9HBaurwoXifZjn0GSrWubEP5iOyDoi+g/art
         M7GOiSTITXQyz/wGeaDsA4B8FR2fOUAsdyEjZuYHbpp0nN+TMPtF7KehdnHJWYzBZJri
         hipevPlCkPzmxDPMHPplXsSktXGciks+CogkPTdxLDfqKhtZvpbIzERc1Fbetl4R6ZT1
         l9L/1Q5I8O3MxXdhcgt9vEUk0h0T7/DgzxLYKRD/K7cAjJeTniAD+cnkgW9Yu4Zq+oGV
         NmGEi0W0DGWZfQX8fdATUymPkyv2wcDlZ3vxm9OGTLm+UctyIbPPnnRMULm7aEN2ujVm
         Av5A==
X-Forwarded-Encrypted: i=1; AL+hErHCDBObSr97ejuLrRgFUccumxS0RAzsmpS6hZ1APu1ep1IERCvzvce3u66N/s4uyITtUCh6M5ZSxyDPUuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jRPb/Z769WTsqpR/88i9wMiVHyrYYuf3Tj4hYLtJtkbmRjoTe
	p+4jCb5C6MPqbMObLu2TO/jiidDomsI61Z9CWFamWo6Ywt2ggYVhuFNd
X-Gm-Gg: AYBFou3rBN4PtzuQq1GYfD9GNolXSnqXCsi6s6FWXGxnoRU3CxuKCoc/3MWxXFtYUwR
	pxf3TNAGCw3TMknUmxDQEvqyWV0LVBSlkDMb9g0V4H9sbMTfunSSn1IONz2okiBrsSyOgSw6VHm
	S709qWuH/erMyZ15qVzjy66+Zb7JWrE3c4+vSSk9R7lT2elKy+OzELjrK0As1tcsxS+3CXBTRBz
	cJIX3A+Y8gBcV8bk0X3oCfzvzbt/BwzEC4aQKPddMQSJyKbUNxcHheMpxdZnaW+3OnQNODChdL2
	c52ZESxwxt5ZSs2f3w9ycwMDKghaqdhsyb/AjHy5ty6Mbwb3HTBLLPDkvgq5nmYAjMzpkrFjqZY
	nejEygJuyD+UOvyZb59Hg7hohafDdr/3d78fBDmz8t/LJp+LeI5mO86nYxLUc07iUVpPY67dpPM
	6fAa4YiOza6nLsoVYqjEv4fC/lvI/0gN0hHAiCHUc6we8ZOmDZ6Lp6RE41pZu96mbXJ8ruuX4MS
	TDZ7xAjGZH2TQHdyRpO1nvbSb2jcsM3FK6hJJWU6xjpg5Vcw9fgkKAP9QyatdelGNrpK0HjzIxU
	8fKWATxm3DS6dqlU4xQbmG3irUjhgI+HKctgMri+/4A=
X-Received: by 2002:a05:6a00:178f:b0:89e:3ccd:b3c7 with SMTP id d2e1a72fcca58-8bc1c1ad822mr5507356b3a.33.1794491379406;
        Thu, 12 Nov 2026 05:49:39 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaa2a6c51sm3550580b3a.14.2026.11.12.05.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:49:39 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: sre@kernel.org
Cc: konrad.dybcio@oss.qualcomm.com,
	jingyi.wang@oss.qualcomm.com,
	kamal.wadhwa@oss.qualcomm.com,
	anjelique.melendez@oss.qualcomm.com,
	dhruvin.rajpura@oss.qualcomm.com,
	andersson@kernel.org,
	dmitry.baryshkov@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] power: supply: qcom_battmgr: expose the charge current limit
Date: Thu, 12 Nov 2026 22:49:27 +0900
Message-ID: <20261112134927.95-3-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20261112134927.95-1-26rote@gmail.com>
References: <20261112134927.95-1-26rote@gmail.com>
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

The battery manager firmware takes a charge current limit in uA
(BATT_CHG_CTRL_LIM) and reports the highest value it accepts
(BATT_CHG_CTRL_LIM_MAX). Expose them on SM8550 class batteries as
charge_control_limit and charge_control_limit_max, clamping writes to
the maximum.

Also handle the BATTMGR_BAT_PROPERTY_SET response, which was logged as
an unknown message, and return its result.

On a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with a 45 W PD charger,
limits of 500 mA and 100 mA give about 480 mA and 90 mA of charge
current while the PD contract stays at 9 V. A limit of 0 stops
charging, and this firmware does not resume when the limit is raised
again until the end threshold is moved below the capacity and back.

Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
v2:
- Use guard(mutex) [Konrad]
- Return -ENODATA when the firmware reports a zero maximum [Konrad]

The downstream qti_battery_charger driver also writes this property in
uA. The thermal mitigation series [1] took a cooling level in
charge_control_limit; Konrad pointed out that the ABI defines it in
uA [2], which this patch follows. Only tested on Kaanapali.

[1] https://lore.kernel.org/all/20260609-cooling_device_reg-v1-2-e15bddcb0086@qti.qualcomm.com/
[2] https://lore.kernel.org/all/d99447c8-f140-4ac1-85e1-a235c37eecde@oss.qualcomm.com/

 drivers/power/supply/qcom_battmgr.c | 55 +++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/drivers/power/supply/qcom_battmgr.c b/drivers/power/supply/qcom_battmgr.c
index 58e103e08..1c3cd034c 100644
--- a/drivers/power/supply/qcom_battmgr.c
+++ b/drivers/power/supply/qcom_battmgr.c
@@ -262,6 +262,8 @@ struct qcom_battmgr_info {
 	unsigned int charge_count;
 	unsigned int charge_ctrl_start;
 	unsigned int charge_ctrl_end;
+	unsigned int charge_ctrl_limit;
+	unsigned int charge_ctrl_limit_max;
 	char model_number[BATTMGR_STRING_LEN];
 	char serial_number[BATTMGR_STRING_LEN];
 	char oem_info[BATTMGR_STRING_LEN];
@@ -454,6 +456,8 @@ static const u8 sm8350_bat_prop_map[] = {
 	[POWER_SUPPLY_PROP_POWER_NOW] = BATT_POWER_NOW,
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD] = BATT_CHG_CTRL_START_THR,
 	[POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD] = BATT_CHG_CTRL_END_THR,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT] = BATT_CHG_CTRL_LIM,
+	[POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX] = BATT_CHG_CTRL_LIM_MAX,
 };
 
 /*
@@ -709,6 +713,12 @@ static int qcom_battmgr_bat_get_property(struct power_supply *psy,
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
@@ -803,6 +813,29 @@ static int qcom_battmgr_set_charge_end_threshold(struct qcom_battmgr *battmgr, i
 	return 0;
 }
 
+static int qcom_battmgr_set_charge_control_limit(struct qcom_battmgr *battmgr, int limit)
+{
+	int ret;
+
+	if (limit < 0)
+		return -EINVAL;
+
+	guard(mutex)(&battmgr->lock);
+
+	ret = qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_GET,
+					    BATT_CHG_CTRL_LIM_MAX, 0);
+	if (ret)
+		return ret;
+
+	if (!battmgr->info.charge_ctrl_limit_max)
+		return -ENODATA;
+
+	limit = min_t(u32, limit, battmgr->info.charge_ctrl_limit_max);
+
+	return qcom_battmgr_request_property(battmgr, BATTMGR_BAT_PROPERTY_SET,
+					     BATT_CHG_CTRL_LIM, limit);
+}
+
 static int qcom_battmgr_charge_control_thresholds_init(struct qcom_battmgr *battmgr)
 {
 	int ret;
@@ -838,6 +871,7 @@ static int qcom_battmgr_bat_is_writeable(struct power_supply *psy,
 	switch (psp) {
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD:
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
 		return 1;
 	default:
 		return 0;
@@ -860,6 +894,8 @@ static int qcom_battmgr_bat_set_property(struct power_supply *psy,
 		return qcom_battmgr_set_charge_start_threshold(battmgr, pval->intval);
 	case POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD:
 		return qcom_battmgr_set_charge_end_threshold(battmgr, pval->intval);
+	case POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT:
+		return qcom_battmgr_set_charge_control_limit(battmgr, pval->intval);
 	default:
 		return -EINVAL;
 	}
@@ -995,6 +1031,8 @@ static const enum power_supply_property sm8550_bat_props[] = {
 	POWER_SUPPLY_PROP_POWER_NOW,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_START_THRESHOLD,
 	POWER_SUPPLY_PROP_CHARGE_CONTROL_END_THRESHOLD,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT,
+	POWER_SUPPLY_PROP_CHARGE_CONTROL_LIMIT_MAX,
 };
 
 static const struct power_supply_desc sm8550_bat_psy_desc = {
@@ -1618,11 +1656,28 @@ static void qcom_battmgr_sm8350_callback(struct qcom_battmgr *battmgr,
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
2.53.0

