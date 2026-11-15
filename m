Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794753471;
	b=JtjUP5eevp/vXubNmBd/9TNz1cqCYSrFa+TY0vpgPGkY4iUhYrTssvgwd4eTBN52eNt1
	 3eRosz7cdNJ1PY2/VQCsspVeOlW0DHCqZ+rKVTPv1vaCGZNb3t1pqJEz27yp+vK4nCfuf
	 OXAf5b6TVgZ3SCn9aRPL4jZbo5tk5g2ZZHnEU7SZjy6Lv1eBP+XyUPrlFj8MS6N4UZg5d
	 zrz22zjORfCINkRN18EWCIWv7sms5O3Qf7H7nMdBfuYLk9vWmVCLZnfif3cesHnOyHcSw
	 vNnEGrDyd01Ql0/r5pcQxFVRd0t0MiBuxRaAs0VAcYKZcoVMqnFQO4kczm8IrRNlkYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794753471;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zDUExgrMaoh/VU17XaoUnPzz6JzmJmPUUbcmokU34d0=;
	b=gfk2WBi8jsOAgmV6m1O5j6yFbmuCcEf2p8EFfu09984LplwFiEY7qDqCwRVJfmirz0ci
	 wD9MqBl4N5+miiK26k4RqtNVUqo6khmFz5ITSck8z/snYX84hr+JCzWQUU2mt7AfswU5O
	 0994JzT+30bJqpxL0WQrRzNbEuenaJnVvwOTHpo9jVe5dtHqBpc7zfPHKkdvh/BQFGz2n
	 Zw/FRiKaWiH9gZpFt7EzyXcc4C+LcYAI4JSo/HXzdN8F74y9vCcyGRlvxojfwEFSZCzNj
	 8jv6cXg6BKQH6eHpr+Qm22IeSKUFdNzRiR+J2Eht8tG8b/2Tf7k4b1GtX+a3kz9u/PQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6Z8Fjkv;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7358C606A335
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 14:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7358C606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x6Z8Fjkv
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4bb666304fdso5376505e9.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 06:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794753470; x=1795358270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zDUExgrMaoh/VU17XaoUnPzz6JzmJmPUUbcmokU34d0=;
        b=x6Z8FjkvPsyI6t8OWPV7fRL05lfNGs4g3260Btsy1QNaVVax1BMoaAgiTNar5b1gim
         TRO1dP4cJe0x1CGpgH3X943I/hs/M/ri+Ma8YoA5ycJblZcfAFkf63JVluLerfrZjNgh
         EmWTtpM8ltUQnHjw2pauH0cpbQauU0imoCMMONs+VyHN0z945NTGHr1e0K4l9/Qb6l3S
         tx80cgEweFHH0V0sRXUUnbPS3obLKxPAo1kgTMgdCvgvdSxv+/W/++fVOVbCWAWdlQ8G
         /WssIRjdsoB0UQTyQ005GD424K5WehYgOWZ3esGDvBX4tAnSrbhZvU1q5m+/gI3/9ZQC
         lUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794753470; x=1795358270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zDUExgrMaoh/VU17XaoUnPzz6JzmJmPUUbcmokU34d0=;
        b=HX1yg236az8cygj2KsecO65FC2qLAuF7lK21DAIxNTkMewyVGyBFwv0gYL4E6Vip7p
         WwGw6oYTGO1OWq5WO3uIyUmpCBBJMaM3g3bwPoVAjADc5gIVSBARHsZisOvLuiEoMW+I
         A6Mi8mYf1gVos04nNahXbaieu3Yyb3LkOJWXgS1NmjrGfwW6VZWgBA/Df6x3Pnuai0ij
         JdihauKqLfUVQ/5PXjI1Sb6tHtkQCv9Agf2buv06Kh67BYmFz/8ikQZTpDbxIgnlz4vJ
         YFam6h9366dxLa6tGlRLqCv/cwayLV9FSQdsYtECAWYW3tWr3Qd+/8vp++HxFq/Iq7hq
         1D2A==
X-Forwarded-Encrypted: i=1; AL+hErF/+Iy5fT7FVvncb4J1ZbIjwFpB6piTEHwQHFO9vmop3pyVmFa2cvalLGBBNP9G7bHh4j/mt8meh4V9P74=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wOX+G0dTwC3wvtn/QDb+r50AjTp+NR5+hcrW4o90lwTJUlkRn
	+97ih9jZSVd/h4JSn7CYDPCKnjG7FrDez5Wlfz1Mi/TthniGEM4IGTFl
X-Gm-Gg: AYBFou2Eo2DAfW/bjwwb4rd1TRGzbKdWZAlfVnitUiMwvMU95pBNgPIqCEyvxzpM1Gp
	/6N/9TB71fXB623T6XWIlaaQzg++uA1HqLxGVmyVewTJIkOy9SbrQAt5ybguGKjRumd9qOHF+K9
	fsr2vDsddKn2R6TPJrWxJ5zjXV2PuC8acoA+CsdLL0imYU/DZPUpcvB1/j1B2uoXufy1yhUNXO1
	cOLVHV21GQ5by02pzwzMVCLdP6aXIQyZ2Z9PtsxfXBbFyb/OnRl8e/ecxZ+LAfgA9FVgTsaTHOR
	DO+7ooC7yQJ6CWijCL9S6p7sR9ISFqIi55TknCif06m0B4p8DjvxjQuXZsFWPUS9/LFUlXShm8O
	F2wr8BdXBVC0xiuzw/4OYWAuc8pIDsRx9hSzOkADRi9cN+5ZvgMMnGvfN8sFE5JDCUm+L2JSQBw
	sima+1UC6KBVuBxe2io/zgJAaPsV5un+94a2bJv5ZobZEvPR2mRT8oHhKuBF8EBe+ODpeHt1U3i
	dZGYNDRfFOSZPrWZwoTR8rd9Qvn9IJQs+c2dDmqDWF3q0G8vAIcSmWNufcq5ycem6mWeNAqYZFx
	fQxD7Tnu9IQG5uUadpX7U53df7JTgdLV/8PJa8X39jYukHcO/W9LFqiK/4mrolmihkvo+GZV/sq
	5UryOMPRNsczyPyaX
X-Received: by 2002:a05:600c:1906:b0:4a1:c6f5:2450 with SMTP id 5b1f17b1804b1-4bb55ac2a34mr181475635e9.17.1794753469741;
        Sun, 15 Nov 2026 06:37:49 -0800 (PST)
Received: from puma.museclub.art ([2a00:6020:b326:d300:d19:a765:d8d7:bedc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ac1159sm196174025e9.4.2026.11.15.06.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:37:48 -0800 (PST)
From: Eugene Shalygin <eugene.shalygin@gmail.com>
To: eugene.shalygin@gmail.com
Cc: Kostiantyn Korn <korn@korn.im>,
	Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] hwmon: (asus-ec-sensors) Add support for PRIME Z590-A
Date: Sun, 15 Nov 2026 15:25:38 +0100
Message-ID: <20261115143708.492883-2-eugene.shalygin@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115143708.492883-1-eugene.shalygin@gmail.com>
References: <20261115143708.492883-1-eugene.shalygin@gmail.com>
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

From: Kostiantyn Korn <korn@korn.im>

Add support for the PRIME Z590-A board.

Signed-off-by: Kostiantyn Korn <korn@korn.im>
Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>
---
 Documentation/hwmon/asus_ec_sensors.rst |  1 +
 drivers/hwmon/asus-ec-sensors.c         | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/Documentation/hwmon/asus_ec_sensors.rst b/Documentation/hwmon/asus_ec_sensors.rst
index 6d1fa99acefc..b22bd5c8f491 100644
--- a/Documentation/hwmon/asus_ec_sensors.rst
+++ b/Documentation/hwmon/asus_ec_sensors.rst
@@ -10,6 +10,7 @@ Supported boards:
  * PRIME X570-PRO
  * PRIME X670E-PRO WIFI
  * PRIME Z270-A
+ * PRIME Z590-A
  * Pro WS TRX50-SAGE WIFI
  * Pro WS TRX50-SAGE WIFI A
  * Pro WS X570-ACE
diff --git a/drivers/hwmon/asus-ec-sensors.c b/drivers/hwmon/asus-ec-sensors.c
index e3d7c293b8a3..6c4565b0ce2f 100644
--- a/drivers/hwmon/asus-ec-sensors.c
+++ b/drivers/hwmon/asus-ec-sensors.c
@@ -234,6 +234,7 @@ enum board_family {
 	family_intel_200_series,
 	family_intel_300_series,
 	family_intel_400_series,
+	family_intel_500_series,
 	family_intel_600_series,
 	family_intel_700_series
 };
@@ -433,6 +434,15 @@ static const struct ec_sensor_info sensors_family_intel_400[] = {
 	[ec_sensor_fan_vrm_hs] = EC_SENSOR("VRM HS", hwmon_fan, 2, 0x00, 0xb2),
 };
 
+static const struct ec_sensor_info sensors_family_intel_500[] = {
+	[ec_sensor_temp_mb] =
+		EC_SENSOR("Motherboard", hwmon_temp, 1, 0x00, 0x3c),
+	[ec_sensor_temp_t_sensor] =
+		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
+	[ec_sensor_temp_vrm] = EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x3e),
+	[ec_sensor_curr_cpu] = EC_SENSOR("CPU_Current", hwmon_curr, 1, 0x00, 0xf4),
+};
+
 static const struct ec_sensor_info sensors_family_intel_600[] = {
 	[ec_sensor_temp_t_sensor] =
 		EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x3d),
@@ -636,6 +646,13 @@ static const struct ec_board_info board_info_prime_z270_a = {
 	.family = family_intel_200_series,
 };
 
+static const struct ec_board_info board_info_prime_z590_a = {
+	.sensors = SENSOR_TEMP_MB | SENSOR_TEMP_T_SENSOR | SENSOR_TEMP_VRM |
+		SENSOR_CURR_CPU,
+	.mutex_path = ASUS_HW_ACCESS_MUTEX_RMTW_ASMX,
+	.family = family_intel_500_series,
+};
+
 static const struct ec_board_info board_info_pro_art_b550_creator = {
 	.sensors = SENSOR_SET_TEMP_CHIPSET_CPU_MB |
 		SENSOR_TEMP_T_SENSOR |
@@ -938,6 +955,8 @@ static const struct dmi_system_id dmi_table[] = {
 					&board_info_prime_x670e_pro_wifi),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME Z270-A",
 					&board_info_prime_z270_a),
+	DMI_EXACT_MATCH_ASUS_BOARD_NAME("PRIME Z590-A",
+					&board_info_prime_z590_a),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt B550-CREATOR",
 					&board_info_pro_art_b550_creator),
 	DMI_EXACT_MATCH_ASUS_BOARD_NAME("ProArt X570-CREATOR WIFI",
@@ -1586,6 +1605,9 @@ static int asus_ec_probe(struct platform_device *pdev)
 	case family_intel_400_series:
 		ec_data->sensors_info = sensors_family_intel_400;
 		break;
+	case family_intel_500_series:
+		ec_data->sensors_info = sensors_family_intel_500;
+		break;
 	case family_intel_600_series:
 		ec_data->sensors_info = sensors_family_intel_600;
 		break;
-- 
2.56.1

