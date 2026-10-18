Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF63B38F659
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792327694; cv=none; b=QBBF9r/GsdEsHDebSZbitC44rI2wnlnJAGS9po1Nk8VFjTaH1bsemhitiNPJiGIduBBXp1A8s4RrW5qE1C+sxe3vg26rsc7vgEWvgpG5zCJ6w0lin4Wg11hHT7AuzznsCGKYDbALHICOsoSjQOq5RkaATdjErWYiZ9KSvZi3uhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792327694; c=relaxed/simple;
	bh=HHtEDiwhC/456QFtVdTHrYlbldjpTf9l9yv6EsNsOKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IPWOy4XkohsSAzVnnXfj1ytu8h4dR0mc5jFlwx1ahzZJpqY3QehsEuNejW4Ep13rQS6LTuZH9+f3wZBnoUfeazm58n1dzkGrpemU7WMQ8fSgCxsDUHcr1CajNdW9U+cAz/xQyiadWjrsnhN4LZ1WOdA+ZOawI6ZziOkZaBAwEA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abzor3Rm; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abzor3Rm"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso577387a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327688; x=1792932488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bjhk5YASASQrh0r4Ye8ElFHJqRenoHts6PBh6/dt8ks=;
        b=abzor3RmCbyI2VfSzIFSAZ6Q5D7AQAJLauAJ/FlsTTQ62a/o//gALnryFSjlbIVS05
         kwtDSIrNz2MiriyZ8SFX8bE0XLBLoJ9qFy792CEE8Lf7Zyhv1mbZpb8BpJ+XbfGwfkth
         DbD5CGdD1j4GZjOBmUEW8rqxFz1IXRSEg9qG/D1QAjpAk+gF6B4FQEKJAimGgiQJUFJM
         iylcQjc9pki57Fm/Zu7+7xahsBHvbOgAtVtWxXp71iyBtKahdLnb9d9r+su2pB+qTGKW
         pZG6ZjSJ9QwPxN4Uu6fmSgYqdXTzG6awkxmxSLNujuzSHof1OxtJAoWLwCy5YVdzM6Dp
         Up4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327688; x=1792932488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bjhk5YASASQrh0r4Ye8ElFHJqRenoHts6PBh6/dt8ks=;
        b=QQ4Fj1orrGvyCb9mgWJErG1H0duEz9ngfkqK5X4GaExz/evapWB/R7iEpYMAoDjvXl
         hzBJVXeZxSRPwbOFZoo64refuV/N9yPPIhIFDL3yqZ9m5SjsIubmdpCyh3FEhUlNJRIb
         G82NyN6cH255+y2ioN1YD2Z2w3ej3B5f4IK64JM+mmXnOcb1nLffO5YCaBq1hCVe/7HY
         wk6KbZg2Vm4rsNl8SDvSTmAVazPq8saiit8utcWWfPZ/Ze1GaAI4Ny9mOlIPpoPVMG8G
         S603nCL+DgCGZ1rrvbzkR/3ybyIZhUKRSdE0cF22VoNbzzqdnSHJ2dc4mCbOgmdeuUIT
         zBTg==
X-Forwarded-Encrypted: i=1; AKwUvBzUX4MvoYnWEiL4xr98u8kfnwwtzjhfGyKLIaFNfDMnF2BpbaDb8D5mAS9If5O8o20oCCzSGMqqREgZzkc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIqQ1sF5pO0izhr2owPeEe6nItmdzkTwisYG4brEkdhYKavJ8q0
	o9QrMOsnhlVP7fxaZMcyzBaXomh3yFR0ZgMHkfAcmYXP312eoWiK3C1G
X-Gm-Gg: AYBFou1Mz5ShqI8p0oY+S1FEQsGAhjQqFv83+kNjw8VfToH6+S1y/fbq7blboB+3VZ1
	TzgVCAYnZYL1E3qLjnWO6W2iWGku573uvVrRjD0yv9MOjI8s9PeTOsEkhMX5gfB267kQdKhmomt
	ld5TqseOjAin4W26N5y4WE7k2RWNZqMRG9QUh+iFgxEye7cvkRI0Q+ZzwOt8E+vPgOv21xi7dr9
	QT6K/wyJcAanCNwnPta9bpu5AerFfXqA78h8K0X5gfPvMLmPp4LsMCHsKMqCOIVMxnfCSlX5lXG
	JGXDDp3BBq/f00iAcFerDKXfdIFBYzUR7ZZJ7RYUxK9Vez20dlkZMrWYt+zxUknFcz14FrXPjzn
	aL81jRkV4d+kwLKJQbOgHiGkxYe19bDwLrS2B8MUnTW1D2Yavu1tImXDiUGkyA9qMAsz+zrORb4
	LYOpTBv0aET1RcsOrctjcVWLyeeEE2bmxnx4+pku/1n0NnsSvkw+MfPA+egHlLm74YygRj44avi
	Gg83WRv79lXklZ5FwamF9vD
X-Received: by 2002:a17:90b:44:b0:39e:3713:c2e4 with SMTP id 98e67ed59e1d1-3aceefc61f5mr4344430a91.14.1792327687925;
        Sun, 18 Oct 2026 05:48:07 -0700 (PDT)
Received: from jmoon ([118.220.156.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549ee946sm2804669a12.20.2026.10.18.05.48.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:48:07 -0700 (PDT)
From: Jinmo Yang <jinmo44.yang@gmail.com>
To: ping.cheng@wacom.com,
	jason.gerecke@wacom.com,
	jikos@kernel.org,
	bentiss@kernel.org
Cc: dmitry.torokhov@gmail.com,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Jinmo Yang <jinmo44.yang@gmail.com>,
	"Claude Opus 4.6" <noreply@anthropic.com>
Subject: [PATCH v3 2/6] HID: wacom: check the input devices in the legacy irq handlers
Date: Sun, 18 Oct 2026 21:47:51 +0900
Message-ID: <20261018124755.850888-3-jinmo44.yang@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261018124755.850888-1-jinmo44.yang@gmail.com>
References: <20260927041138.4112920-1-jinmo44.yang@gmail.com>
 <20261018124755.850888-1-jinmo44.yang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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

