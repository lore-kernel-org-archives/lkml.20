Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380222;
	b=ynIhfHVnmXtILkyU34nbiM7KS78cP5F5ZnvcH4LZfahh3nkkBgTSUjHO+H2QGET7wAeH
	 Z1/qh62XT5KxhuhOa2vzzQ7hn3CpN9qGuItKniNh75pddyXIZJWdDAO7N6EAHupXYAtqO
	 oo9Axwwrh85e0L/JW6DfAgAI33nH9L7KCFuGbP9/DUSJvKqvUltgyT9xY00KBF0/4XOn6
	 +/a79QFfu7MIuIRtNmzoftHUz5XpXsi9oOVAkSBmFdirYlFyOLbEQwplJSxZTpye/NaKw
	 CCRwE2pk9NRhkxF9mV4GhBIQvSSalAwMudb9el/+PvXr/U2v9uB4SRYgtCodtNpXc+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380222;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mRckBFBSeY5yOFsPslfj+VGs3KH18h7fP5jbLc4t7Yo=;
	b=k6aMzM55aJ6/2xrWjwd4gl9RaT4zTo14qjGWN4q/aWabjlwPrLnsfisGsYH2ByKUn8WH
	 3tyzgHZmtOQOcmvs+P8tCPxmJWJVE18bTJ84EHPLcS5uEm8Y+k7yxRQUqgU1W3NPJkcik
	 8T9atVKLzad0n+w8J+uNufwz1Ntll3iuquAxGb08yr5LOGzVaJMf7WviHEwooQfM1yyfx
	 sOEcpu3dp5Gw82kFhHshM2dddCD3O8PzprsFr1nRlLJiSR9VsYiLQM9gaxE5axPimHm1z
	 gm9iaYrD/yDJPCmq2Arq3h8gVc8chGBGhqb6NMOy2yo38QyNcS/R8EphQAU44BdKXow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3cccPMQ;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6657B60A3816
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6657B60A3816
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=U3cccPMQ
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-15dd124bbe7so4048209c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380221; x=1794985021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mRckBFBSeY5yOFsPslfj+VGs3KH18h7fP5jbLc4t7Yo=;
        b=U3cccPMQK+HiVCWxuAJ2DYpkxwaMdMWrhiP1Evir3I0dnQtyrXUNjr0+ACmEtlOigu
         JGMMFcvejbAzrcGTQ/u3T0EI0UZ0gjjDGE4Xq7VvYV1kIjZMKYUeYTXn9zKcCe/0akvO
         h9PTaklf9IaPHBhWfWLjY5hhqqXXIRKKXgfFeTVRbJCzAE9rfD8AYMBneyXKcqnVi6cl
         ZDb9vN72O2rSvUa6MOWD5DlDpOnnDYi2Fbbt51CojR/ENBlTXD0ZuS4o8KWf5CIkcN5U
         O0PQQzqvz0dmICEn6R9N1zcaSFyVPwoLaqVs9yTPmhc7Ltc1dyOCGK+DCLc+3NkpLOWu
         IkLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380221; x=1794985021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRckBFBSeY5yOFsPslfj+VGs3KH18h7fP5jbLc4t7Yo=;
        b=BL9QV1lITXmVIhQIBxoQYOJYElqsSz8wWq2i1kSqfOQhYtF9i6o9IsZ0DTpEWlAQW9
         B/mYAdOizYnANdjsZgfUVGDoqdWlvkbqBiIbZfHTNJ4GIReGTeqnYsc5rzsKs83qns1S
         Ba1StrsiJlLd3brB/pohoj38EKMa/yoqv5qc1mFxFQY2k5MMmiL5RMqM5GYGypEVHa0D
         WEdcd3LyB3CKYphauHcEDBCuEET3bmKc1Otp1brfA5f6yK11Bxo3AhQZUkPua1K/y4ho
         eLz3Mdhuhi6gksjAMtLZGG8FWh5bjStCYAqImyho4sBYSuw7GLTxIt4WP7j7iv1apmr7
         KMPQ==
X-Forwarded-Encrypted: i=1; AL+hErHySmRFi+KVU0mLnPAIs9x3aexTGt8qf1a77/N/62jR/T/KhNyGW4eEZ7fxCm0TM+5YSrgSEQRKsY2+CHg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h6GXy75KryG6MHaUa/0CtN2pK+lo2jbTW3jzfkO+Gvpe1wMte
	Bh/PagcZhO9NjkUf0sqXxUQBhk1/YOFTVCC6Zi1GDzXLjrn07uxCgSfA
X-Gm-Gg: AYBFou3kqmSBor1WjP26htgZ/uWq03Icb954RqtZ7JBiCESbCQOZQp5B7Qvu/IrloS0
	kk8pYdjadsuxH8M3pdwNEfPFLpFV6z6ckjsjoc3BwYcx7HkFkQ/7M1br2zAxuMY+5TgQmvbuXdO
	c+lTDONPWHs8lMNKszdej/ZDR83R21vNJp2zS/UHERW0WQOZ+OEU9fs8p/9rcjBvwlJNEpTU0Mf
	wVCQnFgrIuJBZI/3rnImDtXPOPoX+uOWGlWPgPLzaCcRl8D6CnB4iy8gmC/KVFbjqpk4oOb+u2m
	PYvi7Ck1SYQPtS6QDEurVmeWQXRlgBxN4MR+Uf0CEuMRZmbE7GuK0Fl5SyqA7Ifa0DolzXfWsOa
	AFg9TGK7+eece2N2QxoKkP69Ni7gZguvNgISCUCuJrjkEwYn56C27rR87D+913Q5eHmfjtLiy3T
	lbIcaYy1uMGihl0DmUNvqD6Ocu/E4X6rstidO/DyOCkNh0X102bDmbrpNqcZf7U6reG+EdPT5OO
	lzD2nrE71WnOezkrX25VqnuXUFAoJIT+NZKk+cpFB55utLHg5RBkC1Pd5C2ioPRGUIy6tuwnr3I
	1n7/ycJAjP02DWS/vqwUqWzvYEZcRBAC1wWi+ZlHxPd/ecrISaSKhXZ84HcQWSBOjlSVs3D5sDA
	QgPgIMlSGHpt8f1CQaVN0/tjqlYr8HwZsMunz7JA=
X-Received: by 2002:a05:701b:290b:b0:174:cf1b:235c with SMTP id a92af1059eb24-1b3c034d969mr1393968c88.43.1794380221199;
        Tue, 10 Nov 2026 22:57:01 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:57:00 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:22 -0800
Subject: [PATCH v2 24/33] HID: logitech-hidpp: execute G920 effect upload
 and erase synchronously
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
Message-Id: <20261110-hid-logitech-hidpp-v2-24-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

The input force-feedback subsystem expects upload and erase operations
to execute synchronously in process context, returning errors if the
device rejects the effect or communication fails so that callers can
react accordingly. The G920 driver previously queued these requests onto
an asynchronous workqueue and immediately returned success to the input
core, hiding transfer errors and allowing user space to race ahead
before the hardware effect was actually uploaded or removed.

Convert hidpp_ff_upload_effect() and hidpp_ff_erase_effect() to execute
synchronously using hidpp_send_fap_command_sync(). Before issuing the
hardware command, flush any in-flight playback commands on the workqueue
to ensure ordering. Open and close the underlying transport around the
transfer, update the slot table directly upon completion, and report
errors back to the caller on upload.

Because upload and erase no longer go through the workqueue, drop
effect ID tracking from the asynchronous work item and queue playback,
autocenter, and gain commands with their slot parameters already
populated by the caller.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 126 +++++++++++++++++++--------------------
 1 file changed, 60 insertions(+), 66 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 9526286ba406..20f7e8367ee1 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2332,8 +2332,6 @@ static void hidpp_touchpad_raw_xy_event(struct hidpp_device *hidpp_dev,
 
 #define HIDPP_FF_EFFECT_AUTOSTART	0x80
 
-#define HIDPP_FF_EFFECTID_NONE		-1
-#define HIDPP_FF_EFFECTID_AUTOCENTER	-2
 #define HIDPP_AUTOCENTER_PARAMS_LENGTH	18
 
 #define HIDPP_FF_MAX_PARAMS	20
@@ -2358,7 +2356,6 @@ struct g920_data {
 struct hidpp_ff_work_data {
 	struct work_struct work;
 	struct hidpp_ff_private_data *data;
-	int effect_id;
 	u8 command;
 	u8 params[HIDPP_FF_MAX_PARAMS];
 	u8 size;
@@ -2407,71 +2404,23 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 	struct hidpp_ff_private_data *data = wd->data;
 	struct g920_data *g920 = data->hidpp->private_data;
 	struct hidpp_report response;
-	u8 slot;
 	int ret;
 
-	/* add slot number if needed */
-	switch (wd->effect_id) {
-	case HIDPP_FF_EFFECTID_AUTOCENTER:
-		wd->params[0] = g920->slot_autocenter;
-		break;
-	case HIDPP_FF_EFFECTID_NONE:
-		/* leave slot as zero */
-		break;
-	default:
-		/* find current slot for effect */
-		wd->params[0] = data->slots[wd->effect_id];
-		break;
-	}
-
 	/* send command and wait for reply */
 	ret = hidpp_send_fap_command_sync(data->hidpp, g920->feature_index,
 					  wd->command, wd->params, wd->size,
 					  &response);
-
-	if (ret) {
+	if (ret)
 		hid_err(data->hidpp->hid_dev, "Failed to send command to device!\n");
-		goto out;
-	}
-
-	/* parse return data */
-	switch (wd->command) {
-	case HIDPP_FF_DOWNLOAD_EFFECT:
-		slot = response.fap.params[0];
-		if (slot > 0) {
-			if (wd->effect_id >= 0)
-				/* regular effect uploaded */
-				data->slots[wd->effect_id] = slot;
-			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
-				/* autocenter spring uploaded */
-				g920->slot_autocenter = slot;
-		}
-		break;
-	case HIDPP_FF_DESTROY_EFFECT:
-		slot = wd->params[0];
-		if (slot > 0) {
-			if (wd->effect_id >= 0)
-				/* regular effect destroyed */
-				data->slots[wd->effect_id] = 0;
-			else if (wd->effect_id >= HIDPP_FF_EFFECTID_AUTOCENTER)
-				/* autocenter spring destroyed */
-				g920->slot_autocenter = 0;
-		}
-		break;
-	case HIDPP_FF_SET_GLOBAL_GAINS:
+	else if (wd->command == HIDPP_FF_SET_GLOBAL_GAINS)
 		g920->gain = (wd->params[0] << 8) + wd->params[1];
-		break;
-	default:
-		/* no action needed */
-		break;
-	}
 
-out:
 	atomic_dec(&data->workqueue_size);
 	kfree(wd);
 }
 
-static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id, u8 command, u8 *params, u8 size)
+static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, u8 command,
+			       const u8 *params, u8 size)
 {
 	struct hidpp_ff_work_data *wd;
 	int s;
@@ -2483,7 +2432,6 @@ static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id
 	INIT_WORK(&wd->work, hidpp_ff_work_handler);
 
 	wd->data = data;
-	wd->effect_id = effect_id;
 	wd->command = command;
 	wd->size = size;
 	memcpy(wd->params, params, size);
@@ -2501,11 +2449,16 @@ static int hidpp_ff_queue_work(struct hidpp_ff_private_data *data, int effect_id
 static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effect, struct ff_effect *old)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
+	struct hidpp_device *hidpp = data->hidpp;
+	struct hid_device *hid = hidpp->hid_dev;
+	struct g920_data *g920 = hidpp->private_data;
+	struct hidpp_report response;
 	u8 params[20];
 	u8 size;
-	int force;
+	int force, error;
 
 	/* set common parameters */
+	params[0] = old ? data->slots[effect->id] : 0;
 	params[2] = effect->replay.length >> 8;
 	params[3] = effect->replay.length & 255;
 	params[4] = effect->replay.delay >> 8;
@@ -2552,7 +2505,9 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 			params[1] = HIDPP_FF_EFFECT_PERIODIC_TRIANGLE;
 			break;
 		default:
-			hid_err(data->hidpp->hid_dev, "Unexpected periodic waveform type %i!\n", effect->u.periodic.waveform);
+			hid_err(hidpp->hid_dev,
+				"Unexpected periodic waveform type %i!\n",
+				effect->u.periodic.waveform);
 			return -EINVAL;
 		}
 		force = (effect->u.periodic.magnitude * fixp_sin16((effect->direction * 360) >> 16)) >> 15;
@@ -2637,11 +2592,26 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 				effect->u.condition[0].center);
 		break;
 	default:
-		hid_err(data->hidpp->hid_dev, "Unexpected force type %i!\n", effect->type);
+		hid_err(hidpp->hid_dev, "Unexpected force type %i!\n", effect->type);
 		return -EINVAL;
 	}
 
-	return hidpp_ff_queue_work(data, effect->id, HIDPP_FF_DOWNLOAD_EFFECT, params, size);
+	flush_workqueue(data->wq);
+
+	error = hid_hw_open(hid);
+	if (error)
+		return error;
+
+	error = hidpp_send_fap_command_sync(hidpp, g920->feature_index,
+					    HIDPP_FF_DOWNLOAD_EFFECT,
+					    params, size, &response);
+	hid_hw_close(hid);
+
+	if (error)
+		return error;
+
+	data->slots[effect->id] = response.fap.params[0];
+	return 0;
 }
 
 static int hidpp_ff_playback(struct input_dev *dev, int effect_id, int value)
@@ -2649,31 +2619,55 @@ static int hidpp_ff_playback(struct input_dev *dev, int effect_id, int value)
 	struct hidpp_ff_private_data *data = dev->ff->private;
 	u8 params[2];
 
+	params[0] = data->slots[effect_id];
+	if (!dev->ready || !params[0])
+		return 0;
+
 	params[1] = value ? HIDPP_FF_EFFECT_STATE_PLAY : HIDPP_FF_EFFECT_STATE_STOP;
 
-	dbg_hid("St%sing playback of effect %d.\n", value?"art":"opp", effect_id);
+	dbg_hid("St%sing playback of effect %d.\n", value ? "art" : "opp", effect_id);
 
-	return hidpp_ff_queue_work(data, effect_id, HIDPP_FF_SET_EFFECT_STATE, params, ARRAY_SIZE(params));
+	return hidpp_ff_queue_work(data, HIDPP_FF_SET_EFFECT_STATE, params, ARRAY_SIZE(params));
 }
 
 static int hidpp_ff_erase_effect(struct input_dev *dev, int effect_id)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
-	u8 slot = 0;
+	struct hidpp_device *hidpp = data->hidpp;
+	struct hid_device *hid = hidpp->hid_dev;
+	struct g920_data *g920 = hidpp->private_data;
+	struct hidpp_report response;
+	u8 slot;
 
 	dbg_hid("Erasing effect %d.\n", effect_id);
 
-	return hidpp_ff_queue_work(data, effect_id, HIDPP_FF_DESTROY_EFFECT, &slot, 1);
+	flush_workqueue(data->wq);
+
+	slot = data->slots[effect_id];
+	data->slots[effect_id] = 0;
+
+	if (slot) {
+		if (hid_hw_open(hid) == 0) {
+			hidpp_send_fap_command_sync(hidpp, g920->feature_index,
+						    HIDPP_FF_DESTROY_EFFECT,
+						    &slot, 1, &response);
+			hid_hw_close(hid);
+		}
+	}
+
+	return 0;
 }
 
 static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
+	struct g920_data *g920 = data->hidpp->private_data;
 	u8 params[HIDPP_AUTOCENTER_PARAMS_LENGTH];
 
 	dbg_hid("Setting autocenter to %d.\n", magnitude);
 
 	/* start a standard spring effect */
+	params[0] = g920->slot_autocenter;
 	params[1] = HIDPP_FF_EFFECT_SPRING | HIDPP_FF_EFFECT_AUTOSTART;
 	/* zero delay and duration */
 	params[2] = params[3] = params[4] = params[5] = 0;
@@ -2685,7 +2679,7 @@ static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 	/* zero deadband and center */
 	params[10] = params[11] = params[12] = params[13] = 0;
 
-	hidpp_ff_queue_work(data, HIDPP_FF_EFFECTID_AUTOCENTER, HIDPP_FF_DOWNLOAD_EFFECT, params, ARRAY_SIZE(params));
+	hidpp_ff_queue_work(data, HIDPP_FF_DOWNLOAD_EFFECT, params, ARRAY_SIZE(params));
 }
 
 static void hidpp_ff_set_gain(struct input_dev *dev, u16 gain)
@@ -2700,7 +2694,7 @@ static void hidpp_ff_set_gain(struct input_dev *dev, u16 gain)
 	params[2] = 0; /* no boost */
 	params[3] = 0;
 
-	hidpp_ff_queue_work(data, HIDPP_FF_EFFECTID_NONE, HIDPP_FF_SET_GLOBAL_GAINS, params, ARRAY_SIZE(params));
+	hidpp_ff_queue_work(data, HIDPP_FF_SET_GLOBAL_GAINS, params, ARRAY_SIZE(params));
 }
 
 static ssize_t hidpp_ff_range_show(struct device *dev, struct device_attribute *attr, char *buf)

-- 
2.56.0.542.g3ef89b7020-goog

