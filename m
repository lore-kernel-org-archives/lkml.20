Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385736;
	b=vmJpGcwBF5hqQqEnwMabd3fz+mn5dRmwDIk4k8xzq4TxDVMoAJgufwTWB2a4vljwjHFh
	 aBEpqqzk19qCezUvNMEDYeKzEwpib5SkkB9eW+pJ+0gRRF64s3odaHnABTo5sMF+0ribu
	 TgHMsj6u3w3NRDrLpF5wWHLO3ChPJV60+jp5tt4cCu0R9XRKVhP4mGOTsG+w/JkHVzdvy
	 pJF/BID34vZA6NxVXERhUW1lzkh//vHMCENtfVTyayuBUuDljsR5xF5YInNPFOfgDH+JZ
	 JBdPu4cIbIdLGIK+5zkfU+oA3FvFaCtnZtsXs5VUns0wBYFmND2CkyxsdhTz5PGZg3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385736;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k38d6anjSDhUfif+YA8JiZnUO/fighramhUwYa6uFhs=;
	b=1Qm8GhiXgbYMZbz8NAOtHOLRSLsiDgqOsyVlitr+eeMcFUxSJWhl5m6B9t4fekNV3rSe
	 44QMYLMaeQF7BHtg5WXJOS3pgdmnVZINgM8YS4+Ip6469BU1GtPcoQC1o56ivQIiVAze/
	 QVvsM1FLoP9I+1c5JjdcEaR6S9TO7auaJe83Lg0axO2v16/CR7OcuBuOFJ9/1BX+ZW5dZ
	 Qc/n70cM/ErY2lyhcdiBd9NKzeoDOegl8vCPdflQpJwVvmAFVawSWlChL4V65PpDZSAU/
	 X4k3v/fZ/HLC5e6guSNtEQc5TfV/BfVgG2sh9z4sY2Q4EvyspKC0KqYFuETdwUvpk7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jY5GeuBO;
	arc=none smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FA060A3813
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84FA060A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jY5GeuBO
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c4d427836e9so376650766b.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385735; x=1794990535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k38d6anjSDhUfif+YA8JiZnUO/fighramhUwYa6uFhs=;
        b=jY5GeuBOl8bHMfi0r7mnCkCG3Aso/9E7hAETup2M9paBvEolf2g1FrN8/p8zb/oLUf
         Y71B5ThijYLK3uQuRWoAYNj3Itm0hmXDgMw9cgj2PZVJ8Bl7eyzPV5VnCbmdCyYCQsKL
         GHAyvHijf7wtoGCrYQU3rB63hpYoN8K0Lbr/ozpjQSG1VmHYO/INdm/Dy8kmba9dwCbH
         6ixusH/YZ9Q7aXmL5oI2EylKHtYm3MilEJThsvm03P0rhSIdaum6IaNhQjPLAo3ZC4zD
         oGI1qqb0CXulyB/WcIEbG9OGRryB46/03V3H+ScVE23v1mAmYe2ajBXDz5eW2YTd9TcN
         s3cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385735; x=1794990535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k38d6anjSDhUfif+YA8JiZnUO/fighramhUwYa6uFhs=;
        b=kdTreBTRR12CaWwwMwdgAG1dIxH9U/AWGWuWelolkc+1DCaQtSrvLxCDvGfnUrK3FK
         yNLMXAMjoez9GL7pnDUV4Oaj0qdY6vlW+paE2k4vN6F96kn9b4bNEpz65envOYpT+SZi
         2Nfo86CMGjWsrTkSCZg4mKedimZUb4ozF32fngdGfbn5yKnEhdDLBjkjNFKVE74p9gcL
         0VAmAuMMZ1tcljmemc05d1WvRvpGBjeA9tftuHNWs3ZfDnuJOUpIE6rRo6fzzrahciY7
         K+dk7SmkuZpMS3UNbwKcw68rscF6XNbMfWfCZGGZq+/QnGn2JeadYAniciZo3lu3l9Ll
         Bnig==
X-Forwarded-Encrypted: i=1; AL+hErEPLP6TSKJU0Meu7CjnoWeodyBAgBXUngjTryE0A5kBD+kzRGB9wDAjIuu4wtMraDPWEiPX2T+DrurVAoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+8PNbW2KrcMPC4cu7gjUL5nZiW84j+6xnWFYtb0SjOD+tK43AD
	yrm6y6C0DxKRVMdIbQJOk46qegah0n7J9s3jkAqWeAzVAV1CA2aSxPD+
X-Gm-Gg: AYBFou02g4QLqi9tKKKJ6L67GA2N7qQcC1cimmRh4N/lDmnUX+4WHSVHA/FsSSxC6rK
	HDtOF2zL62ukrWMZjjA235ihZM4gp0AQL1njNtpc93XrFkdjqjCMyDB6A7pNReGf+/mBnsof4+L
	M6wrdDXA8QBTc58ix43csy8JNeyNl9S7uvO8mCAzzIvYKJF7noSytuHyYgZyPbev/lhtas8JM5l
	yznIcneRBmbVIMXUqKOr0RItr3b0nAseAA/6HjYKApMY4Tp4D1jqBHxB8dh7zdSACr0D0I662fm
	LUCdCGZZkc2yyT88+bXtj8J6y0emKHSYI3nzrH/2ngFDY6R7jcsKn/QMVziUPQD6AOkevxViSb1
	xSXtQWgVkXHRQlGi2V05hoWzyLN2Tasa8UjSRinmbl6Cj+n00E/DBn38MJFhs1ihKD/7DfPxT+r
	TLYNfE0Stdib146EtgHWbGGsdm39LnE2E/resM8BH1cd3CGzDusAqrajdeiELPw9vn0ZjDevyGx
	iRSEdg2ZMXrVtnf9t4D/JPaKg72eYAfZKharvJ2m+8k0OPZRGyiNXVPKe3fWjhMCRW6fgmyfnSG
	ewkp360PKB8NGZvWuiHkmUuNAWLBOc6K9732MEXVshi4v/Sn8jW6WJTUZWvRtDqm1C5a5f2k4OS
	SfLEjWDGx1enlpdTJoqBkqUH4LVe45VlycQCTrwSFDOdGllzJGlBDoZIkifjGk1BVwQtVt89PK4
	wzEQYG/UmNIvv9GuaAKiK3hzrxXbTkiob0bPq7Gsu58LyB
X-Received: by 2002:a17:907:1c98:b0:c41:b94c:4539 with SMTP id a640c23a62f3a-c506698cf92mr109978466b.6.1794385734830;
        Wed, 11 Nov 2026 00:28:54 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:53 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 6/7] hwmon: (nct6683) Name the fan headers of the ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:37 +0100
Message-ID: <20261111082838.1418051-7-jdahlin@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261111082838.1418051-1-jdahlin@gmail.com>
References: <20261111082838.1418051-1-jdahlin@gmail.com>
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

With fan control available, users need to know which pwm channel drives
which header. The driver has no fan labels.

Add a fanN_label attribute, visible on boards with a name table, and name
the channels of the ASRock B850 Steel Legend WiFi after the headers
printed on the board: CPU_FAN1, CPU_FAN2, AIO_PUMP and CHA_FAN1 to
CHA_FAN3. The order was inferred from the readings and the BIOS defaults.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst |  3 ++-
 drivers/hwmon/nct6683.c         | 32 ++++++++++++++++++++++++++++++--
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index a9c53d6eab9c..c8b8ade3b95b 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -62,7 +62,8 @@ customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
 by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
 
 On the ASRock B850 Steel Legend WiFi the temperature and voltage inputs
-are named after the H/W Monitor page of the BIOS setup.
+are named after the H/W Monitor page of the BIOS setup, and fanN_label
+names the fan header each channel is wired to.
 
 pwmN_enable selects the fan control mode:
 
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index 4fcd0c74af44..dcad72d1ef97 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -354,6 +354,15 @@ static const struct nct6683_mon_desc asrock_b850sl_mon_desc[] = {
 	{ }
 };
 
+/*
+ * Fan headers as printed on the board, see the ASRock B850 Steel Legend WiFi
+ * User Manual, section 1.3 "Motherboard Layout", page 7, and section 2.12
+ * "Onboard Headers and Connectors", pages 44 to 46.
+ */
+static const char * const asrock_b850sl_fan_label[] = {
+	"CPU_FAN1", "CPU_FAN2", "AIO_PUMP", "CHA_FAN1", "CHA_FAN2", "CHA_FAN3",
+};
+
 /* ------------------------------------------------------- */
 
 struct nct6683_data {
@@ -375,6 +384,8 @@ struct nct6683_data {
 
 	/* Board specific sensor names, NULL if none */
 	const struct nct6683_mon_desc *mon_desc;
+	const char * const *fan_label;
+	int num_fan_label;
 
 	struct mutex update_lock;	/* used to protect sensor updates */
 	bool valid;			/* true if following fields are valid */
@@ -822,17 +833,30 @@ show_fan_pulses(struct device *dev, struct device_attribute *attr, char *buf)
 		       ((data->fanin_cfg[sattr->index] >> 5) & 0x03) + 1);
 }
 
+static ssize_t
+show_fan_label(struct device *dev, struct device_attribute *attr, char *buf)
+{
+	struct sensor_device_attribute *sattr = to_sensor_dev_attr(attr);
+	struct nct6683_data *data = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%s\n", data->fan_label[sattr->index]);
+}
+
 static umode_t nct6683_fan_is_visible(struct kobject *kobj,
 				      struct attribute *attr, int index)
 {
 	struct device *dev = kobj_to_dev(kobj);
 	struct nct6683_data *data = dev_get_drvdata(dev);
-	int fan = index / 3;	/* fan index */
-	int nr = index % 3;	/* attribute index */
+	int fan = index / 4;	/* fan index */
+	int nr = index % 4;	/* attribute index */
 
 	if (!(data->have_fan & (1 << fan)))
 		return 0;
 
+	/* Fan names are only known for some boards */
+	if (nr == 3 && fan >= data->num_fan_label)
+		return 0;
+
 	/*
 	 * Intel may have minimum fan speed limits,
 	 * but register location and encoding are unknown.
@@ -846,6 +870,7 @@ static umode_t nct6683_fan_is_visible(struct kobject *kobj,
 SENSOR_TEMPLATE(fan_input, "fan%d_input", S_IRUGO, show_fan, NULL, 0);
 SENSOR_TEMPLATE(fan_pulses, "fan%d_pulses", S_IRUGO, show_fan_pulses, NULL, 0);
 SENSOR_TEMPLATE(fan_min, "fan%d_min", S_IRUGO, show_fan_min, NULL, 0);
+SENSOR_TEMPLATE(fan_label, "fan%d_label", 0444, show_fan_label, NULL, 0);
 
 /*
  * nct6683_fan_is_visible uses the index into the following array
@@ -856,6 +881,7 @@ static struct sensor_device_template *nct6683_attributes_fan_template[] = {
 	&sensor_dev_template_fan_input,
 	&sensor_dev_template_fan_pulses,
 	&sensor_dev_template_fan_min,
+	&sensor_dev_template_fan_label,
 	NULL
 };
 
@@ -1722,6 +1748,8 @@ static int nct6683_probe(struct platform_device *pdev)
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK8:
 		data->mon_desc = asrock_b850sl_mon_desc;
+		data->fan_label = asrock_b850sl_fan_label;
+		data->num_fan_label = ARRAY_SIZE(asrock_b850sl_fan_label);
 		break;
 	default:
 		if (!force)
-- 
2.53.0

