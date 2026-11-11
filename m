Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385735;
	b=tqL5eOkx22c2QCFlsVXT2nV2QtTCkZ828y0gVfopNgsXfmSmzcol9XGpmkiZfhbk3CmT
	 oCiuL9Xf+mQrUI0zoto2mjRANmDS5FnEUGWl5AXi50TzY8pZ5HwjCm4jHh4LzaunEJnCx
	 FdK0p5ftiVHsxHzM3ZadUr8hyshigmXRBAy0UryHNBOTDGIU9LQz3qQcww8eDtbu6pkG/
	 A+T2/yKcJH8hjYDRPVk+7Ib1/z2z28YOok/J0X+4VjEEDHUqssf/XHq3+Tzs9NAsMoe7v
	 pzFdQIVpmuoFTu019snU8VgTaiFkZrf2q6GsoEfEQNqb/LHPG+8KtXZlA653jyQSgTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0zjrMDCsix0aAiNQniM/4VRbTdAtzW65xW7ZbvxaTg8=;
	b=fb1foAovEpe92CbvzoTuyByFG5fdxywrJG1ygu4VCOIn3HdNg8rQteM8GuAJ6dqX9fnx
	 GjqEL7q7ZCkjqz9teTiLqmLz7x/9b8g8UguFiAsp0Ug3J5oQr3dHIlepcGbpqVwQoCiKU
	 iPBGeH3ywMEK3FtKdiKKXYBmmAbiTuxhyseLChJori+xAEMz2g1BrLPXQIu9uMhLWpPwo
	 aJaHRTYhUIED4AFOnZFwvNL2ExIeero2+uQJFteH0vv8MXpWyVI3SHF/dlcLhW24raskD
	 pf8ExXe2lJsYpNGNkvlBrzgbjsjBe4f1fHdAEgN+mOVUClmJ/Gb8230//EBgMnYjK7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xeGNfyct;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29C260A263E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29C260A263E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xeGNfyct
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c506a231b88so44112366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385733; x=1794990533; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0zjrMDCsix0aAiNQniM/4VRbTdAtzW65xW7ZbvxaTg8=;
        b=xeGNfyct31giWRhpo1R+c0HZGs1yv5fNLVyO9k9SJyvzG133EG4ucYimYEE+V2SNpM
         y0R5+s2/1z1EPACkR1ElDYSyAAnvsF9Vy2bfRfPEJ/EfSQXI6aUaff9LKcrflFThuv2d
         tbLDttM4qMW6oH3ZsOjpEgVs3+B58YXQ0ASNFHSZ3JgCnMLRw0kOx8gGzDW8KLopXmpo
         5O35i03L6bnHlZftJWilAjDvXlq0RRYiVwaeWo1Jo2pCqYf0N1jOpyxlhRAXAXCH+yid
         B6Rh5Z7zxy1DUgiAwUAmn18Dg4Xg+45rvoYgWAs80Uc2f+SQ0wPfZf9nWGB6nKZjE5U/
         wEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385733; x=1794990533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0zjrMDCsix0aAiNQniM/4VRbTdAtzW65xW7ZbvxaTg8=;
        b=MBK21N42qhjGkV6PMyEbbi7PiE1v0z/3w/dTggDUppJwYPbtzrQX5aQQOSG+BKWiW+
         Yc1UqvjabaJ67K11LejN1DC0u3fycEjhAJQr63knXhQViUNRMfkYOQkHV19ezF6xI2rd
         a2VBH6K+2mJEc9h8IK28Yrxh/uaFqQG8ByUt2frWmsI9XDFMee64R5gyEqRl0EL4eZpp
         DH/MT0iOp2+/TX0DrqA4aZ5aawRfCJxrglU7N287n6IauJX8QsfOcz3J1toEq9lu5kme
         dN3yeRV2kjg3KtuG/5OFgTOR0pyWd3h/tvOZP/kHZ2NyLgomevxtwlqKrJuONt2rhikH
         NYOA==
X-Forwarded-Encrypted: i=1; AL+hErEyyGidxA2UKsBNbPK7tGtOCx+ZPxXEv577Yf+WPtlmgilCLJyyue/daQ6CqyeUL3hIcqmTPvjtZzEZFOg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NuDTkUZAthdrBFk49pnBQvtoJTnNMp8UfHCYmFwPd49gyP/CY
	7qC0ygcYpv6WC4zCk8u/Gpcrt32ECw/nOrlm4kAdO6eZPoCN1fIwZh+y
X-Gm-Gg: AYBFou3oqTRzx/W82P93DItLEQeXi52+gbX/2e5zTsD4ce+5OHNGtFBuzrOLA1s3+uE
	XiPSITYmnEO/S0hsgpedw7KVYGgULItdcf8DSVCcX3/VCzKzQ3R8U2c1FlvJMK7Pi9oODBgIX8O
	kFPJm1+mXUV1oPL4DWeUo3CJRvF2/MKu5gBz2JzUIecEzFVDO6DBfxu35O3qH+S4uX5rLG9TzKs
	FPqfl8dj63X/m8FqrW/b3wD8Nt30fmnpnTZghHIFzqY4w7uuqzJrBmqUQPBvZz/u/A5GwwQqRqv
	gRtbGkG7+7Aef+6NbvZEkbD9nHDM24oC99URHeRvxVwtoVOlMZajwJ6T2t/d2r08Ea8Ic5gsrXE
	JFA4y2ooL3W1ANDT68BrPxIFFvQ6wFxkPbdOf1MZ53NvNLL9CNR9yFLCsE5GgmCNfXwgDB1/Vc4
	Hhlr3JRrasSQ4fdMM3y2iQ1Ai0IRs5y5y11M3riC2q/tRzhrSDEawbcTVK3OuL6jUw7Z6PO8j4J
	P63GZCeFUvthFs6fZoaYcOsa7u3rZtGvrNoY0Vce7B3KarkV+OtBtrlSofUgREA5O9nqc01IJ/u
	woxA7pKIKXUT3wfb0kkswVY9pXlwiITFvp04T7H9SALzLjXdQLTardF/K7w9lJaozxgX94AgcIb
	XQ3GxqL30p6KtdK3FSRN+4INJCYUumfJvWCDBqp6CyvvTGHBNwJgBLkEZAPetaUHzhIXT0ruPBD
	t1dInPXCmstdWPYQpm9tePsBFj+q01t/P3aWeo/ttXZq6aRQ==
X-Received: by 2002:a17:907:7b8b:b0:c49:df71:14f5 with SMTP id a640c23a62f3a-c5066c8368dmr126416666b.31.1794385732947;
        Wed, 11 Nov 2026 00:28:52 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:52 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 5/7] hwmon: (nct6683) Name the sensors of the ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:36 +0100
Message-ID: <20261111082838.1418051-6-jdahlin@gmail.com>
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

The inputs are labeled after the monitoring source of the EC, such as
"Thermistor 14" or "VIN5", which says nothing about what they measure.
The UEFI setup of this board names them on its H/W Monitor page.

Add a per-board table of sensor names keyed on the monitoring source and
fill it in for the ASRock B850 Steel Legend WiFi. Sources without an
entry keep their generic name.

The CPU temperature matches k10temp and the voltages match their nominal
values. Which thermistor is the M/B one was inferred from the readings.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst |  3 ++
 drivers/hwmon/nct6683.c         | 53 +++++++++++++++++++++++++++++++--
 2 files changed, 54 insertions(+), 2 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index 8e5cd1d7dcd2..a9c53d6eab9c 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -61,6 +61,9 @@ It is also supported on the ASRock B850 Steel Legend WiFi (NCT6686D,
 customer ID 0x164a), where pwm1 to pwm6 control the fan headers reported
 by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
 
+On the ASRock B850 Steel Legend WiFi the temperature and voltage inputs
+are named after the H/W Monitor page of the BIOS setup.
+
 pwmN_enable selects the fan control mode:
 
   * 1: manual mode, the duty cycle is set with pwmN
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index f656b84ee8ac..4fcd0c74af44 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -328,6 +328,32 @@ static const char *const nct6683_mon_label[] = {
 #define NUM_MON_LABELS		ARRAY_SIZE(nct6683_mon_label)
 #define MON_VOLTAGE_START	0x60
 
+/* Board specific names for the monitoring sources */
+struct nct6683_mon_desc {
+	u8 src;			/* index into nct6683_mon_label */
+	const char *label;
+};
+
+/*
+ * ASRock B850 Steel Legend WiFi, named after the "H/W Monitor" page of the
+ * UEFI setup (BIOS 4.10). T_SENSOR1 is the thermistor cable header, see the
+ * ASRock B850 Steel Legend WiFi User Manual, section 2.12 "Onboard Headers
+ * and Connectors", page 49.
+ */
+static const struct nct6683_mon_desc asrock_b850sl_mon_desc[] = {
+	{ 0x08, "M/B" },		/* Thermistor 14 */
+	{ 0x0a, "T_SENSOR1" },		/* Thermistor 16 */
+	{ 0x46, "CPU" },		/* AMD TSI Addr 98h */
+	{ 0x60, "+3.3V" },		/* VCC */
+	{ 0x66, "CPU Vcore" },		/* VIN0 */
+	{ 0x69, "+5V" },		/* VIN3 */
+	{ 0x6b, "VDDCR_SOC" },		/* VIN5 */
+	{ 0x6c, "VDD_MISC" },		/* VIN6 */
+	{ 0x6d, "DRAM" },		/* VIN7 */
+	{ 0x76, "+12V" },		/* VIN16 */
+	{ }
+};
+
 /* ------------------------------------------------------- */
 
 struct nct6683_data {
@@ -347,6 +373,9 @@ struct nct6683_data {
 	u8 in_index[NCT6683_NUM_REG_MON];
 	u8 in_src[NCT6683_NUM_REG_MON];
 
+	/* Board specific sensor names, NULL if none */
+	const struct nct6683_mon_desc *mon_desc;
+
 	struct mutex update_lock;	/* used to protect sensor updates */
 	bool valid;			/* true if following fields are valid */
 	u64 last_updated;		/* In jiffies */
@@ -524,6 +553,25 @@ static inline long in_from_reg(u8 reg)
 	return reg * 16;
 }
 
+static const struct nct6683_mon_desc *
+nct6683_find_mon_desc(struct nct6683_data *data, u8 src)
+{
+	const struct nct6683_mon_desc *desc;
+
+	for (desc = data->mon_desc; desc && desc->label; desc++)
+		if (desc->src == src)
+			return desc;
+
+	return NULL;
+}
+
+static const char *nct6683_mon_name(struct nct6683_data *data, u8 src)
+{
+	const struct nct6683_mon_desc *desc = nct6683_find_mon_desc(data, src);
+
+	return desc ? desc->label : nct6683_mon_label[src];
+}
+
 static u16 nct6683_read(struct nct6683_data *data, u16 reg)
 {
 	int res;
@@ -694,7 +742,7 @@ show_in_label(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6683_data *data = nct6683_update_device(dev);
 	int nr = sattr->index;
 
-	return sprintf(buf, "%s\n", nct6683_mon_label[data->in_src[nr]]);
+	return sprintf(buf, "%s\n", nct6683_mon_name(data, data->in_src[nr]));
 }
 
 static ssize_t
@@ -824,7 +872,7 @@ show_temp_label(struct device *dev, struct device_attribute *attr, char *buf)
 	struct nct6683_data *data = nct6683_update_device(dev);
 	int nr = sattr->index;
 
-	return sprintf(buf, "%s\n", nct6683_mon_label[data->temp_src[nr]]);
+	return sprintf(buf, "%s\n", nct6683_mon_name(data, data->temp_src[nr]));
 }
 
 static ssize_t
@@ -1673,6 +1721,7 @@ static int nct6683_probe(struct platform_device *pdev)
 	case NCT6683_CUSTOMER_ID_ASROCK7:
 		break;
 	case NCT6683_CUSTOMER_ID_ASROCK8:
+		data->mon_desc = asrock_b850sl_mon_desc;
 		break;
 	default:
 		if (!force)
-- 
2.53.0

