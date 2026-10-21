Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551740;
	b=xVPRLDVTVowTE+7I7OFmhTfKhnuzevFv4sMkIfh9HroAWsAhYIJ8JouMH1OrHJe77tuP
	 M+EItJg9zVJNzKEhnLknnPCUYZT+64mkO218bmtxMHLo+MiInuuQuNbEdHBQVE/E7pbK0
	 i0Jc9ld4+5fVZfWt9BS+AtdEF+6eDFoKu9vJfexswuqYnROSnPTfHeyrDOKSGcaIWKX69
	 FY3mIihO4OzJmrjSOg152NZdOo5+6pYLhaXMXCx30aILZA3AR/CYCnxi4STLikkd8IxxT
	 qHj2Br6l/VmS61aAoU3HhCcnpreo7szKUfZftbEod3OWL+Pdn6DEgXK9+EfeEkTMA3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=zaZMD7Bj24oqZpuHCcnEYVEZw8ON/C3WIyBNH9gsyHg=;
	b=YPYdnH4bzYPYQpqOGqEve2J/wadG4ssxl3YGp+Vqc9Z3nBaCVWgmb8AQK+T4JYZ7B6Ja
	 RaH6Vcz0yXX1PBfBtZ3rKXr7ivEa2yynVvlPGDwxIUQMaMBn8raRK+a1ypZdo8jRmHI52
	 9pjmtqAw3NOQLupG99oHmY19k2mutFuIf1lnfN8mn49oN8BuFtJ7B81CtLEyBkEapWwOv
	 ADFO5VuQJpkJH23ksgtwRujTJEDLXxazGOaWWzXbg6K0ExwERQpJCtCObS9+KjPlxwee6
	 yXwwmrqd9cXhRE4IjlVFs9Yz7DcbhwuuZC9eiANo8wLLo04NMdpsW4FUp4zl0o6EaQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=OyQvIiSG;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76673606A322
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 03:02:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76673606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=OyQvIiSG
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso460722eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792551735; x=1793156535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaZMD7Bj24oqZpuHCcnEYVEZw8ON/C3WIyBNH9gsyHg=;
        b=OyQvIiSGiy5CPbDa152VUW/08JEvjQIso+QWiuxrfyAkfUrN231Snq/Sg1yY+UJ0X/
         tSOggrWEgjc+vR92DtVijtJC7AsBhT4J0oNyycuqF8inE9uvctxBcY2ocy89dby7ziPh
         o79yvLHtxMZlUAdOSdsAAwXKNDCrDxxObbAX64SaoNmjJegDF/C//DFpf67AeNby1nWI
         tCXGk+ekARpHBy6Y0ED9+GCdpSTVIBPUxxsWIsOQcgiNhVhprFbw9DpepRCA9R6Nvhuh
         dZCj7ecAKqqlrd0qmZLO2UfHXjD76BxuFsdMeT0D1DVCxdPRknUPa0LT3ZnE36YDBCXf
         IEpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792551735; x=1793156535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zaZMD7Bj24oqZpuHCcnEYVEZw8ON/C3WIyBNH9gsyHg=;
        b=FKT5npSzxkX+/vmh/qcWH83O9V6mas+hLN0takPivg5Co2WEXE4B5iiBGQTPvbaMXf
         tPAclJeTRap9Ku5h/1KC5xVYCHQB3e16POQkvxbUHhgVJS0DW3EF0WpyC7917Kin2kGw
         RXR9lmIhpKVbJaxu5kW4KwUMJNu71/3K7qsQ2Yar3xJwFIeWCZEKooi/1BvaAWJvQQ7C
         uTIn69knN96ALyxvTV4uCKtpd8CCps9AlecBcVPnoGQ7JixZzW5WInlrNOHFiGzBWN8a
         YnrihAT6L8PHXKglnYrr6nPcPChsTrejec0OAuQJNq4tzK7Jmr7UbTME1C0soKdYC9sA
         CJ4Q==
X-Forwarded-Encrypted: i=1; AKwUvBzU/yCkK7v16cb6v8RCjUQQbTxCAfE2V12NqexZg+/N4bJRqAzhJygByWXMVXlgF6KUmBNNb9/nDCsqlSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQuO5SBZz8z2kZO3LykOJE2UG1dN6w/5OW2TdK6T3aRYwVTl6s
	dvYcLzSEVtLJCA/w4RCWNofdczZ6E/BwYyVkaLQhT1G9o9qu+1sO2Yu6bq+hfd/Fi+U=
X-Gm-Gg: AYBFou1qwxM7ectIkkXextOamFFhPH5FcXV3Vvw0tSVwzPstY8X6omGbhcgaYzngFAh
	q6y9+PSvyvsvmuVbb5mdDjRGW8aeRF9pjr7Q+OguK3FMPXee9nfvT+dWwkeLfAdub+KOFsoq0v1
	e6Rr2iR/L+Ifqw054hXMTmmIHTUsfv6/jdfplZ8HngxkcWyxX1qSiod4e9SMthLENxIQoMRAswj
	DmyGehqMUQ8V05WxpSX0r7PiNchzKS3z7HgHauLKG9jYWaqCJf5VPkn1t+qkkwqDjlbA7m20cya
	6by7P0CefOLrnoSv+Oc4lI4r6Gzuw4y7T3sXqAGul5nVbUZjBhhdLkTZvqIPBzP59XFk0ev03F2
	8sDiCfh5uNuuhr2VYVZ+k7RppFRHxaa5C2kJMmyFfrdf/ffWH/1yQIJah+s0gIuckwMRNwsdL9r
	/Zv8GijNp+HACURyym/plW2oonUk0gPDdHCt/Yh9bXjgPlzeaQIUi0poMaQQX1tUJsrEqdU9FYT
	AyUYdv7TadvGArFTZn69j8U0Ig6bLb+Qu7+vMgQuSs0SrV0VmPgapdbu94=
X-Received: by 2002:a05:693c:69c1:b0:367:2ff1:cf0b with SMTP id 5a478bee46e88-3674de4dce0mr994937eec.24.1792551734397;
        Tue, 20 Oct 2026 20:02:14 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3673e15353csm4436294eec.2.2026.10.20.20.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 20:02:13 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 20:02:07 -0700
Subject: [PATCH v4 3/4] hwmon: (pmbus_core) Support relative encoding of
 vout related commands
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-hwmon-pmbus-fs1412-v4-3-27ece4e43d04@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792551729; l=9094;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=fdf9XZi0275/mhpR8U2oRVOJp8JpzyzFBQ1j38qyjPg=;
 b=nT8om6hss9TnYv4KkZ4AWWCQ8avXOz2AGIEfFpxnZ5w8N4A/ynozsp9BFKH04DZRUv0qxHF2h
 25ZiNAv+Af5CRsqXwsueYfrtHNrdxCEXcehQ3Yb+A/+eC1h6e2tR74G
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

From: Lars Petter Mostad <lars.petter.mostad@appear.net>

PMBus 1.3 allows for relative encoding of voltages in certain output
voltage related commands. These commands are encoded relative to
VOUT_COMMAND. Support this when encoding/decoding commands.

Signed-off-by: Lars Petter Mostad <lars.petter.mostad@appear.net>
[abdurrahman: rebased; check VOUT_MODE for 0xff before testing the
 relative bit; use signed division and clamp the user value before
 scaling; reject a VOUT_COMMAND that decodes to 0 or less, or above
 INT_MAX mV, at probe and from the regulator, and scale the relative
 limits by it without overflowing s64; update the cached VOUT_COMMAND
 only after a successful write; decode the regulator margins with the
 register they were read from, and in relative mode bound the output
 voltage only by MFR_VOUT_MIN/MAX, since VOUT_MARGIN_LOW/HIGH move with
 VOUT_COMMAND]
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/hwmon/pmbus/pmbus.c      |   2 +-
 drivers/hwmon/pmbus/pmbus_core.c | 141 ++++++++++++++++++++++++++++++++++++---
 2 files changed, 133 insertions(+), 10 deletions(-)

diff --git a/drivers/hwmon/pmbus/pmbus.c b/drivers/hwmon/pmbus/pmbus.c
index 7a7eac90d62e..dff1ef9c27f9 100644
--- a/drivers/hwmon/pmbus/pmbus.c
+++ b/drivers/hwmon/pmbus/pmbus.c
@@ -121,7 +121,7 @@ static int pmbus_identify(struct i2c_client *client,
 
 		vout_mode = pmbus_read_byte_data(client, 0, PMBUS_VOUT_MODE);
 		if (vout_mode >= 0 && vout_mode != 0xff) {
-			switch (vout_mode >> 5) {
+			switch ((vout_mode & 0x60) >> 5) {
 			case 0:
 				break;
 			case 1:
diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
index 5f69c1420b4e..4d51387ecb97 100644
--- a/drivers/hwmon/pmbus/pmbus_core.c
+++ b/drivers/hwmon/pmbus/pmbus_core.c
@@ -101,6 +101,9 @@ struct pmbus_data {
 
 	int exponent[PMBUS_PAGES];
 				/* linear mode: exponent for output voltages */
+	bool vout_mode_relative[PMBUS_PAGES];
+				/* VOUT limits relative to VOUT_COMMAND */
+	int vout_command[PMBUS_PAGES];	/* VOUT_COMMAND in mV, relative mode */
 
 	const struct pmbus_driver_info *info;
 
@@ -803,6 +806,43 @@ static void pmbus_update_sensor_data(struct i2c_client *client, struct pmbus_sen
 						     sensor->phase, sensor->reg);
 }
 
+static bool pmbus_sensor_is_vout_relative(struct pmbus_data *data,
+					  struct pmbus_sensor *sensor)
+{
+	if (sensor->class != PSC_VOLTAGE_OUT ||
+	    !data->vout_mode_relative[sensor->page])
+		return false;
+
+	switch (sensor->reg) {
+	case PMBUS_VOUT_MARGIN_HIGH:
+	case PMBUS_VOUT_MARGIN_LOW:
+	case PMBUS_VOUT_OV_FAULT_LIMIT:
+	case PMBUS_VOUT_OV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_WARN_LIMIT:
+	case PMBUS_VOUT_UV_FAULT_LIMIT:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/*
+ * Convert between a relative VOUT value, a permillage of VOUT_COMMAND, and
+ * mV. VOUT_COMMAND is at most INT_MAX mV, so clamping val to an int keeps
+ * the product within s64.
+ */
+static s64 pmbus_relative_to_abs(struct pmbus_data *data, int page, s64 val)
+{
+	val = clamp_val(val, -INT_MAX, INT_MAX);
+	return DIV_S64_ROUND_CLOSEST(val * data->vout_command[page], 1000);
+}
+
+static s64 pmbus_abs_to_relative(struct pmbus_data *data, int page, s64 val)
+{
+	val = clamp_val(val, -INT_MAX, INT_MAX);
+	return DIV_S64_ROUND_CLOSEST(val * 1000, data->vout_command[page]);
+}
+
 /*
  * Convert ieee754 sensor values to milli- or micro-units
  * depending on sensor type.
@@ -1005,6 +1045,11 @@ static s64 pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
 		val = pmbus_reg2data_linear(data, sensor);
 		break;
 	}
+
+	/* In relative mode, val is a permillage of VOUT_COMMAND */
+	if (pmbus_sensor_is_vout_relative(data, sensor))
+		val = pmbus_relative_to_abs(data, sensor->page, val);
+
 	return val;
 }
 
@@ -1209,6 +1254,9 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
 	if (!sensor->convert)
 		return val;
 
+	if (pmbus_sensor_is_vout_relative(data, sensor))
+		val = pmbus_abs_to_relative(data, sensor->page, val);
+
 	switch (data->info->format[sensor->class]) {
 	case direct:
 		regval = pmbus_data2reg_direct(data, sensor, val);
@@ -2736,6 +2784,28 @@ static int pmbus_init_coefficients(struct i2c_client *client,
 	return 0;
 }
 
+/*
+ * Decode a raw VOUT_COMMAND value to mV. It scales the relative limits, so
+ * it must be positive and fit in an int.
+ */
+static int pmbus_vout_command_mv(struct pmbus_data *data, int page,
+				 int vout_command_raw)
+{
+	struct pmbus_sensor s = {
+		.page = page,
+		.reg = PMBUS_VOUT_COMMAND,
+		.class = PSC_VOLTAGE_OUT,
+		.convert = true,
+		.data = vout_command_raw,
+	};
+	s64 vout_mv = pmbus_reg2data(data, &s);
+
+	if (vout_mv <= 0 || vout_mv > INT_MAX)
+		return -EINVAL;
+
+	return vout_mv;
+}
+
 /*
  * Identify chip parameters.
  * This function is called for all chips.
@@ -2753,6 +2823,10 @@ static int pmbus_identify_common(struct i2c_client *client,
 		 * Not all chips support the VOUT_MODE command,
 		 * so a failure to read it is not an error.
 		 */
+		if (vout_mode & 0x80) {
+			data->vout_mode_relative[page] = true;
+			vout_mode &= 0x7f;
+		}
 		switch (vout_mode >> 5) {
 		case 0:	/* linear mode      */
 			if (data->info->format[PSC_VOLTAGE_OUT] != linear)
@@ -2880,7 +2954,7 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			     struct pmbus_driver_info *info)
 {
 	struct device *dev = &client->dev;
-	int page, ret;
+	int page, ret, vout_mv;
 
 	/*
 	 * Figure out if PEC is enabled before accessing any other register.
@@ -2979,6 +3053,22 @@ static int pmbus_init_common(struct i2c_client *client, struct pmbus_data *data,
 			return ret;
 	}
 
+	for (page = 0; page < info->pages; page++) {
+		if (data->vout_mode_relative[page]) {
+			ret = _pmbus_read_word_data(client, page, 0xff,
+						    PMBUS_VOUT_COMMAND);
+			if (ret < 0)
+				return ret;
+			vout_mv = pmbus_vout_command_mv(data, page, ret);
+			if (vout_mv < 0) {
+				dev_err(dev, "Invalid VOUT_COMMAND 0x%04x for relative VOUT mode\n",
+					ret);
+				return -ENODEV;
+			}
+			data->vout_command[page] = vout_mv;
+		}
+	}
+
 	if (client->flags & I2C_CLIENT_PEC) {
 		/*
 		 * If I2C_CLIENT_PEC is set here, both the I2C adapter and the
@@ -3275,12 +3365,22 @@ static int pmbus_regulator_get_low_margin(struct i2c_client *client, int page)
 	};
 
 	if (data->vout_low[page] < 0) {
-		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MIN))
+		s.reg = PMBUS_MFR_VOUT_MIN;
+		if (pmbus_check_word_register(client, page, s.reg))
 			s.data = _pmbus_read_word_data(client, page, 0xff,
-						       PMBUS_MFR_VOUT_MIN);
+						       s.reg);
 		if (s.data < 0) {
+			/*
+			 * In relative mode the margin moves with VOUT_COMMAND,
+			 * so it does not bound the output voltage.
+			 */
+			if (data->vout_mode_relative[page]) {
+				data->vout_low[page] = 0;
+				return data->vout_low[page];
+			}
+			s.reg = PMBUS_VOUT_MARGIN_LOW;
 			s.data = _pmbus_read_word_data(client, page, 0xff,
-						       PMBUS_VOUT_MARGIN_LOW);
+						       s.reg);
 			if (s.data < 0)
 				return s.data;
 		}
@@ -3301,12 +3401,22 @@ static int pmbus_regulator_get_high_margin(struct i2c_client *client, int page)
 	};
 
 	if (data->vout_high[page] < 0) {
-		if (pmbus_check_word_register(client, page, PMBUS_MFR_VOUT_MAX))
+		s.reg = PMBUS_MFR_VOUT_MAX;
+		if (pmbus_check_word_register(client, page, s.reg))
 			s.data = _pmbus_read_word_data(client, page, 0xff,
-						       PMBUS_MFR_VOUT_MAX);
+						       s.reg);
 		if (s.data < 0) {
+			/*
+			 * In relative mode the margin moves with VOUT_COMMAND,
+			 * so it does not bound the output voltage.
+			 */
+			if (data->vout_mode_relative[page]) {
+				data->vout_high[page] = INT_MAX;
+				return data->vout_high[page];
+			}
+			s.reg = PMBUS_VOUT_MARGIN_HIGH;
 			s.data = _pmbus_read_word_data(client, page, 0xff,
-						       PMBUS_VOUT_MARGIN_HIGH);
+						       s.reg);
 			if (s.data < 0)
 				return s.data;
 		}
@@ -3351,7 +3461,7 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 		.data = -1,
 	};
 	int val = DIV_ROUND_CLOSEST(min_uv, 1000); /* convert to mV */
-	int low, high;
+	int low, high, ret, vout_mv = 0;
 
 	*selector = 0;
 
@@ -3373,7 +3483,20 @@ static int pmbus_regulator_set_voltage(struct regulator_dev *rdev, int min_uv,
 
 	val = pmbus_data2reg(data, &s, val);
 
-	return _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	if (data->vout_mode_relative[s.page]) {
+		vout_mv = pmbus_vout_command_mv(data, s.page, val);
+		if (vout_mv < 0)
+			return vout_mv;
+	}
+
+	ret = _pmbus_write_word_data(client, s.page, PMBUS_VOUT_COMMAND, (u16)val);
+	if (ret < 0)
+		return ret;
+
+	if (data->vout_mode_relative[s.page])
+		data->vout_command[s.page] = vout_mv;
+
+	return 0;
 }
 
 static int pmbus_regulator_list_voltage(struct regulator_dev *rdev,

-- 
2.54.0

