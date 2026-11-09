Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204682;
	b=tzjtuPwkUbsSnLUTnxomdpN1iZrOZUAMF5CP9ZIOuDS1e2iAna5MRAEQPl5jlGnMAXKv
	 Wk0Z2gjs6++ug821ra5aSc4ECisab/UrAnUkVCcRnTSPH6eCUhGdD7EvnN85FfkipP2uA
	 yqzAMRVb6AgZDkvCil6trUis8CR6Woa3LbZVpdg16SAIJ7v+9JBiUfO+SHwrrETyhtGn9
	 H2Rq3H/RP+5AoCGScdDN2asGjQo0aUHeLuE8zlNKwDIJRLMebkRq1P0NFy2RRssjvCNtU
	 PaU5RI1IpUgcwRdjIQKSSgfLXZpCqb+BUTFez347BidgIv+JM44q155Pdnvz8qywc6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=q/uruDjMMlleNHGI1AlI0pG23AqA8CsogyvyNj3VWWA=;
	b=Fvm8CO3KgL0ZBVB0S0wwoX3LKQxtlbCC9N3lwqv4hbJX6RFC8Ou0h2Cjpbl67dsHGest
	 hSmKwFkLg6jm/387Myrxw7qBbFZuPLznABG9NEG+T82diybGk37fMns4pGZ4/rhwoDsl+
	 XHxtInoqs33dDGPf5utBpMlGnVpQFK6cqSEFWxjb7IbAXQV6XwZsZHFh54+m3tPKT0Uv+
	 L4t+9RjgiRgAvgFYdbjWgklcpY8RVGdBF1G3lyqJC/6g/bjtbJm2vdd1lym3ZWf7ooAUT
	 kFYtOPqpszIYz+QoEyzrK7NwiKa1fU4JMwIvMQ/OjELOWeqrJcgjmJuHUfMQfrKqbNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jDP+/ud6";
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A53606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64A53606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jDP+/ud6
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36ff9c9da34so901305eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204680; x=1794809480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q/uruDjMMlleNHGI1AlI0pG23AqA8CsogyvyNj3VWWA=;
        b=jDP+/ud6N3P7T2waQxg/thX4yR+NLcjMdMiYpC4LHAew4z5sv2tI6ZjOkH63/o0pHP
         KfNp9kx+8pN1Jf2jcJmEOckwsF0L4AJVD7MhyiPDP1vPagiKdTFwckgxER+la0RDZgiT
         9AFT8eMk+QNAo/AvE06+AM8xCWrCKFdbOSGwmswFkPkr195Ccyoi+KlED33YLPnA3Wdw
         qqEerXKghneOTihe8reaDh7J6ewSqsTT0huDp/+ZkiGaiVA/Sq91PIT1HwgDxK23qwi/
         QRfoXEhoqhXqTGUI75exOffDiNNoNSNJSsAqRq71+9tRmPGzz2G3d4HQ+iq0Q/5Qu/LU
         wOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204680; x=1794809480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=q/uruDjMMlleNHGI1AlI0pG23AqA8CsogyvyNj3VWWA=;
        b=iJda1/7KtAoUdAgl147OniIqxaJvEbqrAbD91eM14+PWXV2Gk3i33cYbDrRTgAExQR
         8T0YWjlz8t5i2aM3P00d/lyY6FPX6KZMUF6mfi0PMWwKYMvk/+NTgbqf2PDtxZLMY6cm
         /cKDME+HMrvY59TxK8LofHV/u/oe/8384LZGr3ZdVKFYsL+la2SSNSm21H5Yy+ccJYaF
         stQAYTDNRwzcO/O9wqzJDsXWbVh/jXJl/zrReNDsL/FxUUKfMNIn/gWQsKPAL1CNgXUZ
         puuFayMRWGu3vtoMyblXLbmvSYxM7gx08v14o0FkPBxbl/J21SylCyNCwfyTcvgrRYRJ
         R0Iw==
X-Forwarded-Encrypted: i=1; AL+hErEMmRF3dgRS/kGKjpD6Kjmap9ahwZCsRTZu9RpRgAjGqEPmrSKiz0A+CaW3N0B4BGfHqZkxhKckHdtnRvQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nFMyNa7iKwqhcanAF5Kawvt2uruHXgexe1SIevHVBdo47uUDR
	gvp+6VWqcVcn5KeB8MlO23AuxItUx1DTBoomJZyqVAsCknQqH4G1JqJz
X-Gm-Gg: AYBFou2/KnB9GZ80As5Cir3hFUeCvpXHW980DcSnoPBbKtSWretrFY92s2lK2Ajj1Nj
	LvE0GQSn7/xSbgEfVJx/UF6udKr9TOPzgVJNKv9yLxLQ5YPrA5p7P1fUUIrNAMMpUbmzodBpWkj
	WiwdVWRpJ/C5C9Uklf/G12cAcWFMaDc4MmhKg9Tmx4e7xD2MvXlxG5rSPyfDiwe3fLyY5dcqgzK
	8ydoKV9aHMkgHc6B7jrq7YApy7Rrqcvta5N7gFZihd5ruNx/kRTQRT+ygUji2amZBGLmeJM0EDj
	imzmahfXlTZTE7pqf/SDVWtm32gDIPv+D2N5sMpv9vdnugIOavJgtJu1AclBwBBipxRo4nF/kS1
	cYJNpfhBKbS3zCih1hvWAAFwBBuv8Z1UtAWikJXiE+7pWvV6D5hKwp1OecLoBAPLt7bGD9FFLLM
	Gl8RbDwSwR03gFWcy1CEufZtN9o2skUOYc2LOZfFPtrdToWrydAr02SgiJ3UJf0xrPTg9A2AO0Q
	sG/nRosKwTw2gYnwgrrAIiCQxwb86yaFwMiEoxk4/OEr6GRj7ek3Zt3zhaiq7iZYtrUXJk0Il5f
	wQyZqFAV8L1ieF11GWPDFTgzj1tJX1ojGYnBHMdx9JNoRCJo6oLvOK6A0Ns1P9Zf3MrJLucgvyh
	S5tSTvnAUMHTbkS+2
X-Received: by 2002:a05:7301:8616:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-3725670e25dmr6544267eec.21.1794204680431;
        Sun, 08 Nov 2026 22:11:20 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:19 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/18] HID: logitech-hidpp: rework G920 force-feedback initialization
Date: Sun,  8 Nov 2026 22:10:52 -0800
Message-ID: <20261109061103.2887636-9-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
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

Querying G920 force-feedback capabilities inside .input_configured()
requires toggling device I/O mid-registration and conflates device
configuration with input setup. At the same time, the single allocated
state structure mixes per-device wheel settings with the lifetime of the
input force-feedback queue, complicating error handling and cleanup.

Exclude generic USB PID force feedback for validated HID++ devices and
query the G920 force-feedback configuration during probe while device
I/O is already active. Keep both probe query failures and force-feedback
initialization errors non-fatal so basic wheel and pedal inputs remain
usable without force feedback, while ensuring failed initialization
leaves input capabilities clean.

Split the overloaded force-feedback state by lifetime so device-level
G920 wheel settings are devm-managed for the bound device lifetime,
while the input force-feedback queue and slot tracking are allocated
with a flexible array and owned strictly by the force-feedback device.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 223 +++++++++++++++----------------
 1 file changed, 111 insertions(+), 112 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index c4c878c9061b..0a82914ea314 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2401,15 +2401,19 @@ static void hidpp_touchpad_raw_xy_event(struct hidpp_device *hidpp_dev,
 
 struct hidpp_ff_private_data {
 	struct hidpp_device *hidpp;
+	struct workqueue_struct *wq;
+	atomic_t workqueue_size;
+	u8 num_effects;
+	int effect_ids[] __counted_by(num_effects);
+};
+
+struct g920_data {
+	struct hidpp_ff_private_data *ff;
 	u8 feature_index;
-	u8 version;
-	u16 gain;
-	s16 range;
 	u8 slot_autocenter;
 	u8 num_effects;
-	int *effect_ids;
-	struct workqueue_struct *wq;
-	atomic_t workqueue_size;
+	u16 gain;
+	u16 range;
 };
 
 struct hidpp_ff_work_data {
@@ -2473,6 +2477,7 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 {
 	struct hidpp_ff_work_data *wd = container_of(w, struct hidpp_ff_work_data, work);
 	struct hidpp_ff_private_data *data = wd->data;
+	struct g920_data *g920 = data->hidpp->private_data;
 	struct hidpp_report response;
 	u8 slot;
 	int ret;
@@ -2480,7 +2485,7 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 	/* add slot number if needed */
 	switch (wd->effect_id) {
 	case HIDPP_FF_EFFECTID_AUTOCENTER:
-		wd->params[0] = data->slot_autocenter;
+		wd->params[0] = g920->slot_autocenter;
 		break;
 	case HIDPP_FF_EFFECTID_NONE:
 		/* leave slot as zero */
@@ -2492,8 +2497,9 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 	}
 
 	/* send command and wait for reply */
-	ret = hidpp_send_fap_command_sync(data->hidpp, data->feature_index,
-		wd->command, wd->params, wd->size, &response);
+	ret = hidpp_send_fap_command_sync(data->hidpp, g920->feature_index,
+					  wd->command, wd->params, wd->size,
+					  &response);
 
 	if (ret) {
 		hid_err(data->hidpp->hid_dev, "Failed to send command to device!\n");
@@ -2510,7 +2516,7 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 				data->effect_ids[slot-1] = wd->effect_id;
 			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
 				/* autocenter spring uploaded */
-				data->slot_autocenter = slot;
+				g920->slot_autocenter = slot;
 		}
 		break;
 	case HIDPP_FF_DESTROY_EFFECT:
@@ -2521,14 +2527,14 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 				data->effect_ids[slot-1] = -1;
 			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
 				/* autocenter spring destroyed */
-				data->slot_autocenter = 0;
+				g920->slot_autocenter = 0;
 		}
 		break;
 	case HIDPP_FF_SET_GLOBAL_GAINS:
-		data->gain = (wd->params[0] << 8) + wd->params[1];
+		g920->gain = (wd->params[0] << 8) + wd->params[1];
 		break;
 	case HIDPP_FF_SET_APERTURE:
-		data->range = (wd->params[0] << 8) + wd->params[1];
+		g920->range = (wd->params[0] << 8) + wd->params[1];
 		break;
 	default:
 		/* no action needed */
@@ -2775,19 +2781,17 @@ static void hidpp_ff_set_gain(struct input_dev *dev, u16 gain)
 static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct hid_device *hid = to_hid_device(dev);
-	struct hid_input *hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	struct input_dev *idev = hidinput->input;
-	struct hidpp_ff_private_data *data = idev->ff->private;
+	struct hidpp_device *hidpp = hid_get_drvdata(hid);
+	struct g920_data *g920 = hidpp->private_data;
 
-	return scnprintf(buf, PAGE_SIZE, "%u\n", data->range);
+	return scnprintf(buf, PAGE_SIZE, "%u\n", g920->range);
 }
 
 static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
 {
 	struct hid_device *hid = to_hid_device(dev);
-	struct hid_input *hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	struct input_dev *idev = hidinput->input;
-	struct hidpp_ff_private_data *data = idev->ff->private;
+	struct hidpp_device *hidpp = hid_get_drvdata(hid);
+	struct g920_data *g920 = hidpp->private_data;
 	u8 params[2];
 	int range = simple_strtoul(buf, NULL, 10);
 
@@ -2796,7 +2800,7 @@ static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute
 	params[0] = range >> 8;
 	params[1] = range & 0x00FF;
 
-	hidpp_ff_queue_work(data, -1, HIDPP_FF_SET_APERTURE, params, ARRAY_SIZE(params));
+	hidpp_ff_queue_work(g920->ff, -1, HIDPP_FF_SET_APERTURE, params, ARRAY_SIZE(params));
 
 	return count;
 }
@@ -2806,13 +2810,15 @@ static DEVICE_ATTR(range, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH, hidpp
 static void hidpp_ff_destroy(struct ff_device *ff)
 {
 	struct hidpp_ff_private_data *data = ff->private;
-	struct hid_device *hid = data->hidpp->hid_dev;
+	struct hidpp_device *hidpp = data->hidpp;
+	struct hid_device *hid = hidpp->hid_dev;
+	struct g920_data *g920 = hidpp->private_data;
 
 	hid_info(hid, "Unloading HID++ force feedback.\n");
 
 	device_remove_file(&hid->dev, &dev_attr_range);
 	destroy_workqueue(data->wq);
-	kfree(data->effect_ids);
+	g920->ff = NULL;
 }
 
 static void hidpp_ff_close(struct input_dev *dev)
@@ -2824,16 +2830,14 @@ static void hidpp_ff_close(struct input_dev *dev)
 	hid_hw_close(hid);
 }
 
-static int hidpp_ff_init(struct hidpp_device *hidpp,
-			 struct hidpp_ff_private_data *data)
+static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 {
 	struct hid_device *hid = hidpp->hid_dev;
-	struct hid_input *hidinput;
-	struct input_dev *dev;
+	struct g920_data *g920 = hidpp->private_data;
 	struct usb_device_descriptor *udesc;
 	u16 bcdDevice;
 	struct ff_device *ff;
-	int error, j, num_slots = data->num_effects;
+	int error, j, num_slots = g920->num_effects;
 	u8 version;
 
 	if (!hid_is_usb(hid)) {
@@ -2841,17 +2845,22 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 		return -ENODEV;
 	}
 
-	if (list_empty(&hid->inputs)) {
-		hid_err(hid, "no inputs found\n");
-		return -ENODEV;
-	}
-	hidinput = list_entry(hid->inputs.next, struct hid_input, list);
-	dev = hidinput->input;
+	struct hidpp_ff_private_data *data __free(kfree) =
+		kzalloc_flex(*data, effect_ids, num_slots);
+	if (!data)
+		return -ENOMEM;
 
-	if (!dev) {
-		hid_err(hid, "Struct input_dev not set!\n");
-		return -EINVAL;
-	}
+	data->hidpp = hidpp;
+	data->num_effects = num_slots;
+	for (j = 0; j < num_slots; j++)
+		data->effect_ids[j] = -1;
+
+	/* init the hardware command queue */
+	atomic_set(&data->workqueue_size, 0);
+
+	data->wq = create_singlethread_workqueue("hidpp-ff-sendqueue");
+	if (!data->wq)
+		return -ENOMEM;
 
 	/* Get firmware release */
 	udesc = &(hid_to_usb_dev(hid)->descriptor);
@@ -2866,38 +2875,16 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 			set_bit(hidpp_ff_effects_v2[j], dev->ffbit);
 
 	error = input_ff_create(dev, num_slots - HIDPP_FF_RESERVED_SLOTS);
-
 	if (error) {
-		hid_err(dev, "Failed to create FF device!\n");
+		hid_err(hid, "Failed to create FF device!\n");
+		bitmap_zero(dev->ffbit, FF_CNT);
+		destroy_workqueue(data->wq);
 		return error;
 	}
-	/*
-	 * Create a copy of passed data, so we can transfer memory
-	 * ownership to FF core
-	 */
-	data = kmemdup(data, sizeof(*data), GFP_KERNEL);
-	if (!data) {
-		error = -ENOMEM;
-		goto err_destroy_ff;
-	}
-	data->effect_ids = kzalloc_objs(int, num_slots);
-	if (!data->effect_ids) {
-		error = -ENOMEM;
-		goto err_free_data;
-	}
-	data->wq = create_singlethread_workqueue("hidpp-ff-sendqueue");
-	if (!data->wq) {
-		error = -ENOMEM;
-		goto err_free_effect_ids;
-	}
-
-	data->hidpp = hidpp;
-	data->version = version;
-	for (j = 0; j < num_slots; j++)
-		data->effect_ids[j] = -1;
 
 	ff = dev->ff;
-	ff->private = data;
+	g920->ff = data;
+	ff->private = no_free_ptr(data);
 
 	ff->upload = hidpp_ff_upload_effect;
 	ff->erase = hidpp_ff_erase_effect;
@@ -2913,21 +2900,10 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 	if (error)
 		hid_warn(hidpp->hid_dev, "Unable to create sysfs interface for \"range\", errno %d!\n", error);
 
-	/* init the hardware command queue */
-	atomic_set(&data->workqueue_size, 0);
-
 	hid_info(hid, "Force feedback support loaded (firmware release %d).\n",
 		 version);
 
 	return 0;
-
-err_free_effect_ids:
-	kfree(data->effect_ids);
-err_free_data:
-	kfree(data);
-err_destroy_ff:
-	input_ff_destroy(dev);
-	return error;
 }
 
 /* ************************************************************************** */
@@ -3430,7 +3406,7 @@ static int k400_connect(struct hid_device *hdev)
 #define HIDPP_PAGE_G920_FORCE_FEEDBACK			0x8123
 
 static int g920_ff_set_autocenter(struct hidpp_device *hidpp,
-				  struct hidpp_ff_private_data *data)
+				  struct g920_data *data)
 {
 	struct hidpp_report response;
 	u8 params[HIDPP_AUTOCENTER_PARAMS_LENGTH] = {
@@ -3445,30 +3421,35 @@ static int g920_ff_set_autocenter(struct hidpp_device *hidpp,
 					  HIDPP_FF_DOWNLOAD_EFFECT,
 					  params, ARRAY_SIZE(params),
 					  &response);
-	if (ret)
+	if (ret) {
 		hid_warn(hidpp->hid_dev, "Failed to autocenter device!\n");
-	else
-		data->slot_autocenter = response.fap.params[0];
+		return ret < 0 ? ret : -EPROTO;
+	}
 
-	return ret;
+	data->slot_autocenter = response.fap.params[0];
+	return 0;
 }
 
-static int g920_get_config(struct hidpp_device *hidpp,
-			   struct hidpp_ff_private_data *data)
+static int g920_get_config(struct hidpp_device *hidpp)
 {
+	struct g920_data data = {};
 	struct hidpp_report response;
 	int ret;
 
-	memset(data, 0, sizeof(*data));
-
 	/* Find feature and store for later use */
 	ret = hidpp_root_get_feature(hidpp, HIDPP_PAGE_G920_FORCE_FEEDBACK,
-				     &data->feature_index);
-	if (ret)
-		return ret;
+				     &data.feature_index);
+	if (ret) {
+		if (ret < 0)
+			return ret;
+		hid_err(hidpp->hid_dev,
+			"%s: received protocol error 0x%02x\n",
+			__func__, ret);
+		return -EPROTO;
+	}
 
 	/* Read number of slots available in device */
-	ret = hidpp_send_fap_command_sync(hidpp, data->feature_index,
+	ret = hidpp_send_fap_command_sync(hidpp, data.feature_index,
 					  HIDPP_FF_GET_INFO,
 					  NULL, 0,
 					  &response);
@@ -3476,45 +3457,59 @@ static int g920_get_config(struct hidpp_device *hidpp,
 		if (ret < 0)
 			return ret;
 		hid_err(hidpp->hid_dev,
-			"%s: received protocol error 0x%02x\n", __func__, ret);
+			"%s: received protocol error 0x%02x\n",
+			__func__, ret);
 		return -EPROTO;
 	}
 
-	data->num_effects = response.fap.params[0];
+	if (response.fap.params[0] <= HIDPP_FF_RESERVED_SLOTS ||
+	    response.fap.params[0] > FF_MAX_EFFECTS + HIDPP_FF_RESERVED_SLOTS) {
+		hid_err(hidpp->hid_dev,
+			"Invalid force feedback slot count %u\n",
+			response.fap.params[0]);
+		return -EINVAL;
+	}
+
+	data.num_effects = response.fap.params[0];
 
 	/* reset all forces */
-	ret = hidpp_send_fap_command_sync(hidpp, data->feature_index,
+	ret = hidpp_send_fap_command_sync(hidpp, data.feature_index,
 					  HIDPP_FF_RESET_ALL,
 					  NULL, 0,
 					  &response);
 	if (ret)
 		hid_warn(hidpp->hid_dev, "Failed to reset all forces!\n");
 
-	ret = hidpp_send_fap_command_sync(hidpp, data->feature_index,
+	ret = hidpp_send_fap_command_sync(hidpp, data.feature_index,
 					  HIDPP_FF_GET_APERTURE,
 					  NULL, 0,
 					  &response);
-	if (ret) {
+	if (ret)
 		hid_warn(hidpp->hid_dev,
 			 "Failed to read range from device!\n");
-	}
-	data->range = ret ?
+	data.range = ret ?
 		900 : get_unaligned_be16(&response.fap.params[0]);
 
 	/* Read the current gain values */
-	ret = hidpp_send_fap_command_sync(hidpp, data->feature_index,
+	ret = hidpp_send_fap_command_sync(hidpp, data.feature_index,
 					  HIDPP_FF_GET_GLOBAL_GAINS,
 					  NULL, 0,
 					  &response);
 	if (ret)
 		hid_warn(hidpp->hid_dev,
 			 "Failed to read gain values from device!\n");
-	data->gain = ret ?
+	data.gain = ret ?
 		0xffff : get_unaligned_be16(&response.fap.params[0]);
 
 	/* ignore boost value at response.fap.params[2] */
 
-	return g920_ff_set_autocenter(hidpp, data);
+	ret = g920_ff_set_autocenter(hidpp, &data);
+	if (ret)
+		return ret;
+
+	hidpp->private_data = devm_kmemdup(&hidpp->hid_dev->dev, &data,
+					   sizeof(data), GFP_KERNEL);
+	return hidpp->private_data ? 0 : -ENOMEM;
 }
 
 /* -------------------------------------------------------------------------- */
@@ -4103,21 +4098,15 @@ static int hidpp_input_configured(struct hid_device *hdev, struct hid_input *hid
 		return 0;
 
 	if (hidpp->quirks & HIDPP_QUIRK_CLASS_G920) {
-		struct hidpp_ff_private_data data;
-
 		if (!list_is_first(&hidinput->list, &hdev->inputs))
 			return 0;
 
-		hid_device_io_start(hdev);
-		ret = g920_get_config(hidpp, &data);
-		hid_device_io_stop(hdev);
-		if (!ret)
-			ret = hidpp_ff_init(hidpp, &data);
-
-		if (ret) {
-			hid_warn(hidpp->hid_dev,
-				 "Unable to initialize force feedback support, errno %d\n",
-				 ret);
+		if (hidpp->private_data) {
+			ret = hidpp_ff_init(hidpp, input);
+			if (ret)
+				hid_warn(hdev,
+					 "Unable to initialize force feedback support, errno %d\n",
+					 ret);
 		}
 	}
 
@@ -4686,7 +4675,7 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 {
 	struct hidpp_device *hidpp;
 	int ret;
-	unsigned int connect_mask = HID_CONNECT_DEFAULT;
+	unsigned int connect_mask;
 
 	/* report_fixup needs drvdata to be set before we call hid_parse */
 	hidpp = devm_kzalloc(&hdev->dev, sizeof(*hidpp), GFP_KERNEL);
@@ -4775,6 +4764,16 @@ static int hidpp_probe(struct hid_device *hdev, const struct hid_device_id *id)
 	else
 		hidpp_non_unifying_init(hidpp);
 
+	if ((hidpp->quirks & HIDPP_QUIRK_CLASS_G920) && hid_is_usb(hdev)) {
+		ret = g920_get_config(hidpp);
+		if (ret)
+			hid_warn(hdev,
+				 "Unable to query force feedback config, errno %d\n",
+				 ret);
+	}
+
+	/* None of the HID++ devices use generic USB PID force-feedback. */
+	connect_mask = HID_CONNECT_DEFAULT & ~HID_CONNECT_FF;
 	if (hidpp->quirks & HIDPP_QUIRK_DELAYED_INIT)
 		connect_mask &= ~HID_CONNECT_HIDINPUT;
 
-- 
2.56.0.506.g506a7eabc5-goog

