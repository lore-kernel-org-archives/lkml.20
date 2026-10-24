Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792812652;
	b=G+dEG9n/oBncoX3wuh2oEKUopVnowxxRFLjn88/NI3Z3QT21NUqRTGkHFj5ZU36R5EjW
	 GqFSi2NSFwyVnC8IC9E5N3vLvpgT++iC2+n9nc7zt8/81et/OxEYXQSw6KpR/D7PIKq4R
	 WNlBX0frGl92zzUMSprsv2io9wPwIMzW9Xp+/90zakKW1kbAZ7+o9gkBz1g0Km6fsCUUG
	 0oNyKypJVrirHqNkzpCht6X86+TNuUKMa+WDLs60bhbd0WG4VsO/SCCixfNQOAyBPFq2E
	 L8c35v4s1SL59+XgCfYuGJtoY6AxMnkjNqfem35BM9z4/sQ4v963nDXsZkXY70iwFJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792812652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bjhk5YASASQrh0r4Ye8ElFHJqRenoHts6PBh6/dt8ks=;
	b=rN2N1GDMvdwLJG03buNB6iad3F6/r1J4Ve3+lYpydPFlM39nwyjcLhWbenESLnyTdMeS
	 GLHR9VLILTEVOnjxG9x7NiF9gYE1NV7ir2EUKp5MiYCbLgB3hHAqTKfM1jETDhJGzXVj8
	 xRdEhx/5l7In4Tbsvf7RB36AcwrEiWgGVT7gZUU3dEC11+JNH75rPjpHb5xt0jbXm/Vh3
	 tPkg9Gh+joGYCckPaytGLCVwT8yNsHmztSwWoKVT7DlghxbPKfo09H3GS3lPrh82poYvo
	 YSioBfJqEll0WdKA1GtIR3cSANKegFzOYfmiYOLyKCc7Op6cRSxq4T45lSuaoD+I6fA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OaYUfg69;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753F0606A31D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 03:30:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 753F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=OaYUfg69
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-35943f55c06so1843037eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 20:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792812651; x=1793417451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjhk5YASASQrh0r4Ye8ElFHJqRenoHts6PBh6/dt8ks=;
        b=OaYUfg69N1J1Iso7WW7ZdQub0LS/FbjQzBk2ABKdo4pTNiWo6tI09IS8IRhvOd4abF
         pLbBjQ8fXiDA3TzwOCuK51w9RcfcJLHQsmUW34gM6cpKsDRue3QGjLSqvQDCcNwMvxDT
         aSiqvir0m0dN7kuglHbZcGA9kM5IRM9NvmsZROdiPbLcAhDyXBK82RSaTUwvOJUrHnjW
         pyblJW2jLR5EZrxRKBnUB07KvRbGZkIBIXMj01B8iYuTl1VPLgHDHFsgIrq0e5CbSG5C
         7bxCSSOF+vw2l+q3RNr0sctKW+XCTPCWDjJK+X1nwLohO8arg3SvbV5fjixlIoR+3Whg
         /WXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792812651; x=1793417451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjhk5YASASQrh0r4Ye8ElFHJqRenoHts6PBh6/dt8ks=;
        b=GqZaspJhpLeHnJj6DwPxjS/gwtBlz8uID3pV8QG15BPsibfM0NGEfNgFWoxb9g7dFI
         tsrdMcky9b4hGSYbhYEcun6NL3Zij5xtp2SzrUb3FZRs3eUl9nxOE3eI81Z+rKt23/Be
         wfClRKPpc8fnXITLJBdFTEHrKmqQzJl3Uy+XqW6+0mAyU49T7xQAIYlFnoJxjVJWPOPN
         ++RFbXtgnbnyNRVHDwz0zEqj6DsoNBsP1MDgS5aFzN2I4RVtv/v9U2zbwQdKJnxaV3m9
         bUt+PtyMDeX5cZDRK6lB9+Ow5pguCAQK/FusFNTaD5VGzhAZsHGu7NjpxyocGs9U6p5z
         nYcA==
X-Forwarded-Encrypted: i=1; AKwUvBwZ+y837jvAXiMJ2/ticmGttiE6TtQyjytJsa2vIMZjgKc6nsArfuRGbynD0w1x40JGnHbsvehh4CQTjO0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGCs4TapcNhSjdixhBEf/LSbfzS8z7Axb0x5nXKYXQAwixi7sg
	MLLrkapXrf3Hz1/T3/+lohxIxd01FuOTMgWf7kny7GRWHU93PQz6aL+nU68vxf4Z
X-Gm-Gg: AYBFou3Z5nGGPzbK2Gnrhfca4zOhN175WWOBgQY0jQLU5OKZwlI2jlGyWPJdOvU+3sF
	HjV+sOoPR1WQ2+W08O2/h3tYR2+2td+6fYzsdHS8EMzixmhbfkEJay7d3/c4Dn5OHEjJh/l1y+h
	ABs4A8nYENRqcFN//yn4oEJ1A5od7GZeHB+wXVhc8amhRseTZShoitlmX5VV+DgAdc5ZGMHyJ2s
	SuopRa25Johq9L21mDgqeeo9sIKs81v8uo4wvvS0HUq5bT+wSV0hKCsB/xBv8wfLhUygHcRcdLg
	rs7tOcK2yGcHUefJDmlegIo/79wq71cuWp9mDF/Qm8e/1JayBFSad9J2b40cWJIBUh9evJJr50W
	xFHshW5jhN64U05FbmArltGWizLMDW1QiSmpAlYkuxvETZON23xCScUzMA9QyrZi3iqB2xNkI8A
	9oT3cCxFVpgA4naNGOoBQTJEi+Z5pd/xYBtIrjIzKFrzAlCPHFbZocjBGkqRBTh6Yx8kXe1PwzV
	KLgy/dbwn1FcYunjqfZLwZb7o3szSa1z3feZnFajov3Cn0eSHla2TJ0m/ORJArkFB/IPS8eDVRM
	OAlR0mNKOdScYemFFI6YyZJPzHyH
X-Received: by 2002:a05:7300:f582:b0:360:aeee:9b8a with SMTP id 5a478bee46e88-369e8483665mr1419425eec.8.1792812651295;
        Fri, 23 Oct 2026 20:30:51 -0700 (PDT)
Received: from jmoon.tail8e743c.ts.net ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ecf087sm2827283eec.27.2026.10.23.20.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 20:30:50 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>
Subject: [PATCH v4 2/6] HID: wacom: check the input devices in the legacy irq handlers
Date: Sat, 24 Oct 2026 12:30:36 +0900
Message-ID: <20261024033040.316652-3-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024033040.316652-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261024033040.316652-1-jinmo44.yang@gmail.com>
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

wacom_penpartner_irq(), wacom_pl_irq(), wacom_ptu_irq(),
wacom_dtu_irq(), wacom_dtus_irq() and wacom_graphire_irq() dereference
pen_input and, for the latter two, pad_input without checking them.

As described in "HID: wacom: check the input device in the shared
report helpers", a partial interface leaves one or two of the three
input devices NULL on a fully successful probe, and wacom_wac_irq()
still dispatches to these handlers. Seven locations fault, each
reproduced on linux-next 20260925 (x86_64, KASAN) from one /dev/uhid
device plus a single UHID_INPUT2 write.

For wacom_dtus_irq() and wacom_graphire_irq(), all hardware served by
these handlers is expected to have both pen and pad on a single
interface, with two exceptions: GRAPHIRE (pen-only) and DTUSX (pen-only,
no pad buttons). Guard the expected input devices at function entry,
skipping the pad_input requirement for those two types. For DTUSX, also
guard the DTUSPAD branch in case a spoofed device sends a pad report
anyway.

wacom_dtu_irq() gets a check too. Its only dereference is in a
dev_dbg(), so it does not fault with CONFIG_DYNAMIC_DEBUG=n, but it is
unconditional in the source.

Fixes: 2a6cdbdd4cc0 ("HID: wacom: Introduce new 'touch_input' device")
Fixes: 862cf5535c0c ("HID: wacom: Introduce a new WACOM_DEVICETYPE_PAD device_type")
Cc: stable@vger.kernel.org
Signed-off-by: Jinmo Yang <jinmo44.yang@gmail.com>
Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
 drivers/hid/wacom_wac.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/hid/wacom_wac.c b/drivers/hid/wacom_wac.c
index 567b01882eb1..bec8dbec5bc3 100644
--- a/drivers/hid/wacom_wac.c
+++ b/drivers/hid/wacom_wac.c
@@ -128,6 +128,12 @@ static int wacom_penpartner_irq(struct wacom_wac *wacom)
 	unsigned char *data = wacom->data;
 	struct input_dev *input = wacom->pen_input;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pen_input is NULL\n", __func__);
+		return 0;
+	}
+
 	switch (data[0]) {
 	case 1:
 		if (data[5] & 0x80) {
@@ -174,6 +180,12 @@ static int wacom_pl_irq(struct wacom_wac *wacom)
 	struct input_dev *input = wacom->pen_input;
 	int prox, pressure;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pen_input is NULL\n", __func__);
+		return 0;
+	}
+
 	if (data[0] != WACOM_REPORT_PENABLED) {
 		dev_dbg(input->dev.parent,
 			"%s: received unknown report #%d\n", __func__, data[0]);
@@ -233,6 +245,12 @@ static int wacom_ptu_irq(struct wacom_wac *wacom)
 	unsigned char *data = wacom->data;
 	struct input_dev *input = wacom->pen_input;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pen_input is NULL\n", __func__);
+		return 0;
+	}
+
 	if (data[0] != WACOM_REPORT_PENABLED) {
 		dev_dbg(input->dev.parent,
 			"%s: received unknown report #%d\n", __func__, data[0]);
@@ -263,6 +281,12 @@ static int wacom_dtu_irq(struct wacom_wac *wacom)
 	struct input_dev *input = wacom->pen_input;
 	int prox = data[1] & 0x20;
 
+	if (!input) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: pen_input is NULL\n", __func__);
+		return 0;
+	}
+
 	dev_dbg(input->dev.parent,
 		"%s: received report #%d", __func__, data[0]);
 
@@ -289,16 +313,26 @@ static int wacom_dtu_irq(struct wacom_wac *wacom)
 
 static int wacom_dtus_irq(struct wacom_wac *wacom)
 {
+	struct wacom_features *features = &wacom->features;
 	unsigned char *data = wacom->data;
 	struct input_dev *input = wacom->pen_input;
 	unsigned short prox, pressure = 0;
 
+	if (!input || (!wacom->pad_input && features->type != DTUSX)) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: missing input device(s)\n",
+			      __func__);
+		return 0;
+	}
+
 	if (data[0] != WACOM_REPORT_DTUS && data[0] != WACOM_REPORT_DTUSPAD) {
 		dev_dbg(input->dev.parent,
 			"%s: received unknown report #%d", __func__, data[0]);
 		return 0;
 	} else if (data[0] == WACOM_REPORT_DTUSPAD) {
 		input = wacom->pad_input;
+		if (!input)
+			return 0;
 		input_report_key(input, BTN_0, (data[1] & 0x01));
 		input_report_key(input, BTN_1, (data[1] & 0x02));
 		input_report_key(input, BTN_2, (data[1] & 0x04));
@@ -349,6 +383,12 @@ static int wacom_graphire_irq(struct wacom_wac *wacom)
 	int rw = 0;
 	int retval = 0;
 
+	if (!input || (!pad_input && features->type != GRAPHIRE)) {
+		dev_warn_once(&container_of(wacom, struct wacom, wacom_wac)->hdev->dev,
+			      "%s: missing input device(s)\n", __func__);
+		return 0;
+	}
+
 	if (features->type == GRAPHIRE_BT) {
 		if (data[0] != WACOM_REPORT_PENABLED_BT) {
 			dev_dbg(input->dev.parent,
-- 
2.53.0

