Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794385740;
	b=gBXNVI80Yh1vdY5UyxXp7UhM9T2jrdCAyWShyJ+1N9rpzZH6Jnrp8Q987D5pi1buQLvn
	 p7ojjDQGfOWZl5vCQOl6QZItbZ0w8YiLo2VSkfm0pNJDFJ+6t/+eIv2exi10g2CB343wo
	 Lef/UWaBsp5dDAuDRl1jjjmby558XPesxViqcxbnVgq/h2yBoGquocoYVgc4o1kxVdvR2
	 f5XcPhLASJFjjUQMQt9BL2LED3XzMRNGuDDPb8ZrOllaySUptjkXAbKeXKomnEajeBQfi
	 tgrGFLNd5beeoD+xLQZHHyK8lVDSnfFloDztNOKSWdUJ7R5OQtjdLfR+4rnpJWTSxHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794385740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oqt6WiGEqMCVRR7QR/nQyneBo34H3pnYJBAqkvsamRY=;
	b=CpsbcAPpMafEmhPfz0+H8kZY+Ked0s2Nz1HPeyfN3V2RmVDpdKBULN0GprQhMCVrKYsC
	 U/qJdM1O8mF33ru+18TNQrFk/HH1wXLc/9HrHkEN1/+M/zRGxeTdA3cqDBVNhbJFmvdfF
	 pe4wjLkMtfqcgFxle4owRUELpX0jNZ2nCVs0wZQevkxJEAF0FjLIvk0SEf+KNs5Q4omfd
	 jfQ2Tfi9Ealps8AwwxDHJlu7Z9tlKcPegQ6xjda3J0BMZe0krqPER10kWhHvrK2SSiA5A
	 evO7yqGZoRT1TG4LuSHOVK1YLmhe+gKm43jBggWVFqAEYzt54BWFc4x+EbE1i/+SKmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WveNnJAN;
	arc=none smtp.remote-ip=209.85.218.41
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431E9606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 08:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 431E9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WveNnJAN
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c4682977f9aso368490166b.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:28:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794385738; x=1794990538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oqt6WiGEqMCVRR7QR/nQyneBo34H3pnYJBAqkvsamRY=;
        b=WveNnJANYQ5jI5VR1ozDjvLq8bePJgW5TiMOpnWaIp99YEJyKY0uE9TO26oOL5vR5z
         R6HoB+tiiqkmxlCB3jVOh6JQOg6RvNfgYo1l7oa8tcFkpUICQFXD0ohPqIh+M6mHPk/J
         hHrUrpf205+PAalTk6qjK3y03rjpLp3pZN1VHlzhzPtvXrTB2u6eP+lXryWXWPX9puxb
         wcE1Dq+2Ecc41OMUD+5v3JgwdRLETfD8aRctUaQgQGAnNkN48f7QdhV82tPrnNZTDCVa
         wOOMRtHqEmqBYhzxqdHJyc9OWe4c+HcEfFaeW14R8tRcuInsY7+gL0vEqwaBo2BPDKd9
         Zhhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794385738; x=1794990538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oqt6WiGEqMCVRR7QR/nQyneBo34H3pnYJBAqkvsamRY=;
        b=Yc73neE/ji69doWZicVbILM9Y9C7P/88aV1gEP7l1RmtAEb2Q0AmcC4QDpttkkZhwA
         tMFoVsxB8bD/nw2fdH7UFbg5YRmYFPloGghBzABRjB0P/kGmGMPJSJBthKaGu6i4KCkB
         TzO6gmH0AuJCdmxcZZUGPp78Ap+mFViBkQB6z1vZT/M3Hv/gzR6z+GrZ6tDPt/XrpcNL
         BGyXKe8RWMUhz9wf+2A5c9/V1XY7M1NTChPs812k+yhHe42T3k9Xm/Tr240s3mA480Jz
         fCcfIXef0DDe/nJBnaZqk2xdGr4D3PXXBU/RW7I6mrUBF/6mwbqgO1aElmUeDgvDeUdw
         fH+Q==
X-Forwarded-Encrypted: i=1; AL+hErGkwf0eAjBqHsfV0IL9YiJtmGtkQuFTNB5Uf23DVzn//Ri9RfyYJozqs87eJS2dnFklNZELB06/J7s3YtU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ow8BUPaNEpdDlVB3egEUOPNrrw//pAinjgLZLXsgbozjHSrhN
	8R/Pc7MZhRhiz75Nvnz46jsqv0rEmix48/jUO75aor1hvaztEERou+79
X-Gm-Gg: AYBFou1hupxwUF2kGizLlny1B9/rP8xx9pZidRtIs+zDlItOuL8cTmRbVFIthhC6ZjL
	65L6K6Jm+XvevUE6tQwJ4K4e+kDjKIxMPBdvqIXQYM2Q4zFXplEgRFkWsn+jkp0CusB0IemCFMW
	tJqfdxNptRoqaRGa3WUCCWxSJKbJ4NMz06ZNazFH6nN89EFQR7Wx2ex0PmaZTo11LcRtYlYX/dG
	rJ03f+drT9NYKBqEO+rS2ODE/m/4OQrBt6iDBrRhvCtlwKbtlJTrU88IUWzg7H3bxMchqBrCaM6
	/rKsRzIjuUzKW9mpXL6g2e3w18OHzDyAnQyz46pb5sEPWxB+TUtV0SZK/6hWQdOdKNY6O9iNKm9
	ELO+HGTHo7+iDEyJTXwjtEeSfMuu668noo8gTrvAnl+4H1vOvt0WN+i0eBc06ao3XmLjrPNO731
	BKTpGzdvjA/fCar6XCJZXrKuYw5xjlLM6FHTujJull+nPT3dVucOPlAhM2ItXNWoRwtcSVAZWnj
	iPnAXRvsCnTJ6Fg3a9O3+S6+I/THhW0U4mTQEsoWgENThjsiKLxQPiJ3GjEcYaEfHdI1weKAONa
	qdvudPabWR06M0vne7PlKkDz2wqAitvZ3SY/E/rU559RiMrYtjRY2Ld3KozPdNhJkdkfVPUtUP8
	aY0Jz1DKRb8utuN6WvlFNUF0WXipE8YtPMr2w3wOdXQBkHrZMMS4s7bSpzlcgoqDjOUufJPZfOA
	Qr+qOEesFHzvK2+5WKV1uB655YNWdLKRLgN36i6ulpNIqJ
X-Received: by 2002:a17:907:dab:b0:c46:2a05:b257 with SMTP id a640c23a62f3a-c5066af79eemr119409166b.23.1794385737557;
        Wed, 11 Nov 2026 00:28:57 -0800 (PST)
Received: from fractal.tuxedo-gray.ts.net (c-78-82-25-228.bbcust.telenor.se. [78.82.25.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56ffc7sm210135866b.17.2026.11.11.00.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:28:56 -0800 (PST)
From: Johan Dahlin <jdahlin@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Alwyn Kik <alwyn@kik.pw>,
	Fabio Baltieri <fabio.baltieri@gmail.com>,
	Hamza Mahfooz <someguy@effective-light.com>,
	Johan Dahlin <jdahlin@gmail.com>
Subject: [PATCH v2 7/7] hwmon: (nct6683) Scale the +5V and +12V inputs of the ASRock B850 Steel Legend WiFi
Date: Wed, 11 Nov 2026 09:28:38 +0100
Message-ID: <20261111082838.1418051-8-jdahlin@gmail.com>
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

The +5V and +12V rails reach the chip through resistor dividers, so they
read as 1.70 V and 2.03 V while the UEFI setup shows 5.04 V and 12.19 V.

Let the sensor table carry a divider ratio and apply it when reading the
input, with ratios of 3 and 6 on this board. sysfs-interface.rst asks for
such conversions in user space because dividers differ between boards.
Here the board is identified by its customer ID, so the ratios are fixed.

Signed-off-by: Johan Dahlin <jdahlin@gmail.com>
---
 Documentation/hwmon/nct6683.rst |  3 ++-
 drivers/hwmon/nct6683.c         | 20 +++++++++++++++-----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct6683.rst
index c8b8ade3b95b..17fba35bf9bb 100644
--- a/Documentation/hwmon/nct6683.rst
+++ b/Documentation/hwmon/nct6683.rst
@@ -63,7 +63,8 @@ by fan1 to fan6, and on the ASRock BC-250 (NCT6686D, customer ID 0x162b).
 
 On the ASRock B850 Steel Legend WiFi the temperature and voltage inputs
 are named after the H/W Monitor page of the BIOS setup, and fanN_label
-names the fan header each channel is wired to.
+names the fan header each channel is wired to. The +5V and +12V inputs
+report the rail voltage rather than the divided voltage seen by the chip.
 
 pwmN_enable selects the fan control mode:
 
diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
index dcad72d1ef97..9a306728ee84 100644
--- a/drivers/hwmon/nct6683.c
+++ b/drivers/hwmon/nct6683.c
@@ -328,10 +328,14 @@ static const char *const nct6683_mon_label[] = {
 #define NUM_MON_LABELS		ARRAY_SIZE(nct6683_mon_label)
 #define MON_VOLTAGE_START	0x60
 
-/* Board specific names for the monitoring sources */
+/*
+ * Board specific names for the monitoring sources, and the ratio of the
+ * resistor divider in front of a voltage input.
+ */
 struct nct6683_mon_desc {
 	u8 src;			/* index into nct6683_mon_label */
 	const char *label;
+	u8 scale;		/* voltage divider ratio, 0 if none */
 };
 
 /*
@@ -346,11 +350,11 @@ static const struct nct6683_mon_desc asrock_b850sl_mon_desc[] = {
 	{ 0x46, "CPU" },		/* AMD TSI Addr 98h */
 	{ 0x60, "+3.3V" },		/* VCC */
 	{ 0x66, "CPU Vcore" },		/* VIN0 */
-	{ 0x69, "+5V" },		/* VIN3 */
+	{ 0x69, "+5V", 3 },		/* VIN3 */
 	{ 0x6b, "VDDCR_SOC" },		/* VIN5 */
 	{ 0x6c, "VDD_MISC" },		/* VIN6 */
 	{ 0x6d, "DRAM" },		/* VIN7 */
-	{ 0x76, "+12V" },		/* VIN16 */
+	{ 0x76, "+12V", 6 },		/* VIN16 */
 	{ }
 };
 
@@ -761,11 +765,17 @@ show_in_reg(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
 	struct nct6683_data *data = nct6683_update_device(dev);
+	const struct nct6683_mon_desc *desc;
 	int index = sattr->index;
 	int nr = sattr->nr;
+	long val = in_from_reg(data->in[index][nr]);
+
+	/* Report the rail voltage for inputs behind a resistor divider */
+	desc = nct6683_find_mon_desc(data, data->in_src[nr]);
+	if (desc && desc->scale)
+		val *= desc->scale;
 
-	return sprintf(buf, "%ld\n",
-		       in_from_reg(data->in[index][nr]));
+	return sprintf(buf, "%ld\n", val);
 }
 
 static umode_t nct6683_in_is_visible(struct kobject *kobj,
-- 
2.53.0

