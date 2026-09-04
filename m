Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196647127F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788522176; cv=none; b=gNkUmWEzntdo7ikxcYr+0DtfaJkGO9pk5QYZXbROcUxzi/Nku87RG7iNKlMH8sETZPnwBSeVKmdTZj9iGwTFFzIRmR3CuQ5OngQ9KA/kC5RGK7xGkNlENEFGAGZgVbPFoS0OldcC5wbVHRm24BWrodfEjWMR1BZv+whSZBfklmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788522176; c=relaxed/simple;
	bh=ZIzz9Yg6OeeDagql+eEt4AWve39emjDHft6ydX4u1P0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D7eNu/WmYXcuBTPqF87anlOM6yp6UWdFXn89D1hiDYrXx++1ILSqLMjeeUqB6rJOqfxwQCbdgxVKZkYT8p9j5wBN7qZ3P7kpDuzXTgo7/QVRFLDmjdc6TNR06xN3MS1DZ9H5e7Go4ar+nSRBA4terd0lYl0X3NIzyJ9G8nSRT8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y+CyPTRg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y+CyPTRg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d9db539a54so7924215ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788522175; x=1789126975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JC4Q1hK93kxfywtj6+9kQnM/OHSHBcI12EVtsgx6Pog=;
        b=Y+CyPTRg3SZ3IfVEzx4fd3odTdFfdXBrmdPMPE94+9Cgsj9icmioi5jOtf5ji6n2ZC
         g0rEkDtYLlFow92uIfehiRgP8a6mh46syqfsxqlPEWenIDk0//Lgs5YZzBwsjwuDLoTU
         xv+lSHpzHDuGXTMPOjguplp8b5dnk+Z7YjR5jDyv3ONYamG/J41erSbYXv0XKRjgw0Ow
         sbC6yDx/YIVpTt6EbPYrPFKvJLBufnmjZN+wyMVAfcXlgU8z33vwilz/OrUgdAjXruqo
         gHdcpdpJwxIqQaYnhi9eEt2/tMWGpTuvCsnWZD+jtEXWoWghbMCt4y7ePZE2h9UrS8Oa
         CWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788522175; x=1789126975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JC4Q1hK93kxfywtj6+9kQnM/OHSHBcI12EVtsgx6Pog=;
        b=cUlrmJvyuBxbEguUzjxFOBBLJ3gzmRz5X0DtGQAPS/oTwhsh+JTbeF/2QL0nAJrxPH
         XEmgw5BBUpLcV/LetZLTaL8carTyrq5VisigUDv/ma2ka6EQCjSsFF99iADF2rFcFLVA
         BhL2IrI465LW8bywqz7ar6bwv+icMVnXW3SJ/Iuyexmx1FeuqcGq+9mS0zbMkShK3F3t
         hpmpG7RoAnmg+3TZfgUOfipbbD1uazo6Lk5L6oEs8jOdUn6+T4D7u8JcASu65CgezxQ8
         6qJVZY9VQfTWUZ67Wifi6rB2CK+kU+0FTYz37EckqUgwvpPOLVgP9Bd0b/ppe1JN87iI
         c8lQ==
X-Gm-Message-State: AFuF++kKVLU3pKrtmCg5uPWAp69aRg39TeaSlvvQFgT2BjUFPEwgpx9l
	nWnsRPgFVhuLF0iJdJ0moD/9i3WT1+lIBO6zh9f9hoY5wXisaY2CeMKf
X-Gm-Gg: AYBFou11T1WNr971uVGcBnv3PPnNeHexVvornRR6es3hCc7iACN/f9nulh38FHSE7Jt
	N+VGZ938vXrFUjAE5JpDnm6gnhCtNI8kWQWuCzoeIcCaxW6HoY9tSOge+rf75N5Dz5Kq/Oj36+A
	gBxQfMHrNPxk63CiWoUlwbk1VoaTZtmXkoXdVmKWQoCz2DpEpUF2RP9Y/TMIWAhHgJhWLeID1s1
	fCCmgEeMmQVOFEEOZ1xzfRROel6DlmZqoRhnXJC5RAamQrS81MhBGpkyETeNSi0dUuMDEpuee7Z
	rdYtXozzJjpergq8dQyQQrQJbleJuOJuhv+1gFgufXAe4ghyKWpi8kkCY0wXzlsKlPq27l811yp
	FUY0BZYzOV+31Gq2ctMv2mpbPY4FNqngRozAEds5FxVa4a7tTA1gLkMZyGLOToXtEgy89q4AB3Q
	9H/7Eq5GQ2IfUcQMuphggcf8OBVz/sW7VLHR7H5vODkR0SU/pD63XyZKJHlR2v8x8vuexEKZ1HF
	9F9UmlHzXgXItY=
X-Received: by 2002:a17:903:2ec5:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2db125c412dmr92594765ad.13.1788522174392;
        Fri, 04 Sep 2026 04:42:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm6406640eec.19.2026.09.04.04.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:42:54 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Steve Glendinning <steve.glendinning@shawell.net>
Cc: linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org
Subject: [PATCH] hwmon: fix typos in comments
Date: Fri,  4 Sep 2026 17:12:46 +0530
Message-ID: <20260904114249.26515-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/hwmon/abituguru.c    | 4 ++--
 drivers/hwmon/adm1177.c      | 2 +-
 drivers/hwmon/adt7x10.c      | 2 +-
 drivers/hwmon/emc2103.c      | 2 +-
 drivers/hwmon/lm85.c         | 2 +-
 drivers/hwmon/pmbus/mp2888.c | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
index ba8c68ae4595..3bb959d16dbf 100644
--- a/drivers/hwmon/abituguru.c
+++ b/drivers/hwmon/abituguru.c
@@ -475,7 +475,7 @@ abituguru_detect_bank1_sensor_type(struct abituguru_data *data,
 	u8 val, test_flag, buf[3];
 	int i, ret = -ENODEV; /* error is the most common used retval :| */
 
-	/* If overriden by the user return the user selected type */
+	/* If overridden by the user return the user selected type */
 	if (bank1_types[sensor_addr] >= ABIT_UGURU_IN_SENSOR &&
 			bank1_types[sensor_addr] <= ABIT_UGURU_NC) {
 		ABIT_UGURU_DEBUG(2, "assuming sensor type %d for bank1 sensor "
@@ -1262,7 +1262,7 @@ static int abituguru_probe(struct platform_device *pdev)
 
 	/*
 	 * El weirdo probe order, to keep the sysfs order identical to the
-	 * BIOS and window-appliction listing order.
+	 * BIOS and window-application listing order.
 	 */
 	static const u8 probe_order[ABIT_UGURU_MAX_BANK1_SENSORS] = {
 		0x00, 0x01, 0x03, 0x04, 0x0A, 0x08, 0x0E, 0x02,
diff --git a/drivers/hwmon/adm1177.c b/drivers/hwmon/adm1177.c
index dc4d8a214d1b..85ad4a3009bd 100644
--- a/drivers/hwmon/adm1177.c
+++ b/drivers/hwmon/adm1177.c
@@ -105,7 +105,7 @@ static int adm1177_read(struct device *dev, enum hwmon_sensor_types type,
 			return ret;
 		dummy = (data[0] << 4) | (data[2] >> 4);
 		/*
-		 * convert to millivolts based on resistor devision
+		 * convert to millivolts based on resistor division
 		 * (V_fullscale / 4096) * raw
 		 */
 		if (st->vrange_high)
diff --git a/drivers/hwmon/adt7x10.c b/drivers/hwmon/adt7x10.c
index d003ee3ebf06..f99d38e82d0b 100644
--- a/drivers/hwmon/adt7x10.c
+++ b/drivers/hwmon/adt7x10.c
@@ -338,7 +338,7 @@ int adt7x10_probe(struct device *dev, const char *name, int irq,
 	data->oldconfig = config;
 
 	/*
-	 * Set to 16 bit resolution, continous conversion and comparator mode.
+	 * Set to 16 bit resolution, continuous conversion and comparator mode.
 	 */
 	data->config = data->oldconfig;
 	data->config &= ~(ADT7X10_MODE_MASK | ADT7X10_CT_POLARITY |
diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
index 27dc149a3ed9..4adc23ffaf72 100644
--- a/drivers/hwmon/emc2103.c
+++ b/drivers/hwmon/emc2103.c
@@ -32,7 +32,7 @@ static const u8 REG_TEMP_MAX[4] = { 0x34, 0x30, 0x31, 0x32 };
 #define REG_PRODUCT_ID		0xfd
 #define REG_MFG_ID		0xfe
 
-/* equation 4 from datasheet: rpm = (3932160 * multipler) / count */
+/* equation 4 from datasheet: rpm = (3932160 * multiplier) / count */
 #define FAN_RPM_FACTOR		3932160
 
 /*
diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
index c56e164d61c1..27ef127ccc2c 100644
--- a/drivers/hwmon/lm85.c
+++ b/drivers/hwmon/lm85.c
@@ -1445,7 +1445,7 @@ static void lm85_init_client(struct i2c_client *client)
 static int lm85_is_fake(struct i2c_client *client)
 {
 	/*
-	 * Differenciate between real LM96000 and Winbond WPCD377I. The latter
+	 * Differentiate between real LM96000 and Winbond WPCD377I. The latter
 	 * emulate the former except that it has no hardware monitoring function
 	 * so the readings are always 0.
 	 */
diff --git a/drivers/hwmon/pmbus/mp2888.c b/drivers/hwmon/pmbus/mp2888.c
index c5f35daa3fe1..7a2ecffba960 100644
--- a/drivers/hwmon/pmbus/mp2888.c
+++ b/drivers/hwmon/pmbus/mp2888.c
@@ -272,14 +272,14 @@ static int mp2888_write_word_data(struct i2c_client *client, int page, int reg,
 		word = clamp_val(word, 0, GENMASK(7, 0));
 		break;
 	case PMBUS_IOUT_OC_WARN_LIMIT:
-		/* Fix limit according to total curent resolution. */
+		/* Fix limit according to total current resolution. */
 		word = data->total_curr_resolution ? DIV_ROUND_CLOSEST(word, 8) :
 		       DIV_ROUND_CLOSEST(word, 4);
 		/* Drop unused bits 15:10. */
 		word = clamp_val(word, 0, GENMASK(9, 0));
 		break;
 	case PMBUS_POUT_OP_WARN_LIMIT:
-		/* Fix limit according to total curent resolution. */
+		/* Fix limit according to total current resolution. */
 		word = data->total_curr_resolution ? DIV_ROUND_CLOSEST(word, 4) :
 		       DIV_ROUND_CLOSEST(word, 2);
 		/* Drop unused bits 15:10. */
-- 
2.48.1

