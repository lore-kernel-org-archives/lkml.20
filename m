Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380224;
	b=oxh53ieoiPbY/y8nOTjWQO17J1fxJv5hApmdaep6eDRlqbMBRVkD6zPX4tax0DO2QvDg
	 BbGKNETy2c7+honfXCZFMAeskhTQIqutMuCCVg3DSXwEuNG/qPXvZM5N8qhmAhRm0CQow
	 j4KvbJOUBTVQFTebevzkKB3kGsRp1dRLTPWXMpm8hZNRMJzo7wjkLwVIwAwU1gyraulsY
	 U7fal1J5sEjYw8zCYS7pyITlGpsLBdtpPuZV0ybAS9bZoH3jqxAvTASmGAm1URGy23QcJ
	 UKfNpFfex18tGJ/8Ca1plyA0+0BBJTasxGFDgTmSaCHO9SDwa+v5n8SAARZKxqoqcRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380224;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=c+hkChxIouVHZtYIZYtCjRRp/vac+u0Vif+0cs2KiTY=;
	b=lepfNpyc70TEOknKTHLgbZEQbIU2uDr14W52PgAvm82DfuO3yRTdiCxYKleBrCdGgwFp
	 SvvOt2/ZbfL2QPdKSNcFcKzFTDwaB1STBueu9DecDWhjtFJ+2kVRJi+lGvadfr9RXVini
	 eq606RXBFAoMshMa+Pc8piYeYec9W6Ed51VlrieJBfPCx6ZmgnD8dw6f03WOfzRMDF4Q3
	 koUdidEdxSvGuUHsgU1YW/PYW/U8RtfwBDifHq6ocNktJRKssEZ1IqTnfo+iaPknqDshJ
	 QwVSp5HoiDNobHtyUuWWCt6oGia5UYzcLVaG39B0/0RWcjDSi5370xGSfxnS4bDlTDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=za5w0TRh;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38DE5606D352
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38DE5606D352
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=za5w0TRh
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b3beeaf6f9so744963c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380223; x=1794985023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c+hkChxIouVHZtYIZYtCjRRp/vac+u0Vif+0cs2KiTY=;
        b=za5w0TRh/YVPyKpQfVzi/SDFA8/rrKwJ/MtqZsF4Z1ksbREEo1dvbb5VzjeoVqnn0X
         RDobaoyno6NaikuDoS9trXMUNEoga2PLPDIX+7614ms+oesNPNLr/4afJLbfNZ7If29f
         RQ5/hRgZPTdEjAHzyxQR0eXqZXA9QurZuei+OSOBpigtC3dqkusMq7wAqZjEt03zwQA3
         UKkq0iYPRXj7RqHOjx2IVP9o9YTwnRpPjSZ+gaQDfRMvKYLnSUxktFC39mVqGMXmHzVR
         SzQ9jWCurvvu5l+z0UV1syK7riuD36UzT/yX9oFA9WIPKnahFOQkg3PI9RVg8v9MBImu
         wxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380223; x=1794985023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+hkChxIouVHZtYIZYtCjRRp/vac+u0Vif+0cs2KiTY=;
        b=HQ+/F8Yq/WgAc2UjCXE0xcR5TID4Ci69UKterYiAUcfyzdK2kY+00Yqp+DN8LKjhwk
         TDatIxdTdpZS6Z2V/+DOv3woW2672mtpOeQUD27nHSMYtbe9LpBhKJtysOkzghTjlPzW
         EjGIcYmyhAXIWs/XXRH8ycKxxxScCsPOyajVMmrDeRsO4yF3swubhZRQgR/CJ18ZBMaa
         A4CPZgMhLxVDdywK297RUTyRo+ANS6v0odJISDaHFm/KfeAbnjlFb9kGE4AzGJF1yCWy
         yz2Md7X/SKkniAeINZo/5dh01tFx90O3y56n3Bi6gj3K3m7wPK1GyUzb+b9S+z2yRUNX
         W4Kg==
X-Forwarded-Encrypted: i=1; AL+hErGfcdVcqSMSDfQG+gX35SZtZLacdFw5vyb4hQ3ViDtuq1cvr8IFVxQLnU2p4ETL33Au70eCiwhMIKf/IRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OsLqqlDToJWOjXC+cJ049SRfQh7S8WhhB4eHxRZt3MIVg6MGC
	hzMJf/nYhdCJfzDX/5n5hiGQtNq7/8QxpGgo3uur5xnCR8bSAMqrDkE8
X-Gm-Gg: AYBFou3HP8J183dCmTaSVqkeoU7pNVcc7zxMRJIcA35r/6hNE8brm54Qx/4AzBtfpCm
	sAlsm2C7qoX/afEEDD+JKRKaztLUtE1ogEWe7vBq4Hsly5Fx+sKj109vaChRVUyMMj3B5J75oMC
	JSjq2HXd4OKfQ9su9+xczT6Vtwxb/BNLKVfkz/Rt+BNV+FYPHZVkhObqj72DNnfZgeu32hRV+Xh
	CY/D0Q74Cw2avH/Fs38+gNkHJDkriwqmta6zp+xBzsE1BVhLCPXdzc8INrd8o5zKSuokp4z1/XA
	b4ix7bQ5kRq9nUVa0N3WkpmdTVw5w25omYyJjAyiPUmokVARt2br8Z2CcJyr5J3qRl2rocDmn0X
	z8KnPwpsq6EXymomHSQqznNN9L8j4/wx8ldHppGF5R3bLmXA7UkyQyKzzSVBIiQZjR47eNJOp7z
	Hy6S8RqL1cnFW5ZfWyiSXHximOWr29tuwi3TkpJRO/AX5YVsaqcalgykkd6m5kieVkz+GY4ENOB
	QBfzEm8+aqXldAcM5FGIm2hOMa5MU+G08cnAHUhfTRNRvfgno/I9YGpqSjGPyy5aG+mjyBd8Hnx
	wsjD4UDmVryA51kgg5FjrPokx7qo5ufuUwwbafQVx/TMWeiipshiamUO+FWjPfZDSA60P82sG6p
	7SGTm21YZMb4JbEMwqNzqRE9y5H3fhvgEqS3tIIc=
X-Received: by 2002:a05:7022:ed02:b0:1b2:6a1d:bf58 with SMTP id a92af1059eb24-1b3c035280dmr1360043c88.38.1794380222952;
        Tue, 10 Nov 2026 22:57:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.57.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:57:02 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:23 -0800
Subject: [PATCH v2 25/33] HID: logitech-hidpp: clean up G920 force-feedback
 helpers
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
Message-Id: <20261110-hid-logitech-hidpp-v2-25-30743e91d83b@gmail.com>
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

Perform several minor cleanups across the G920 force-feedback support:

- In hidpp_ff_init(), obtain the firmware version directly in a single
  expression from the USB device descriptor, drop the redundant
  hid_is_usb() check on the already-matched G920 device, and remove
  unused local variables.
- In hidpp_ff_upload_effect(), remove the dead force calculation in the
  periodic effect upload case where magnitude is written directly.
- Zero-initialize stack parameter buffers in effect upload, playback,
  autocenter, and gain helpers so unused parameter bytes sent over USB
  are always clean zeroes.
- Drop the write-only gain field from struct g920_data, remove the
  unused HIDPP_FF_GET_GLOBAL_GAINS query at probe time, and remove the
  gain cache update from the work handler.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 43 +++++-----------------------------------
 1 file changed, 5 insertions(+), 38 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 20f7e8367ee1..1d80e7b7a99e 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2310,7 +2310,6 @@ static void hidpp_touchpad_raw_xy_event(struct hidpp_device *hidpp_dev,
 #define HIDPP_FF_DESTROY_EFFECT		0x41
 #define HIDPP_FF_GET_APERTURE		0x51
 #define HIDPP_FF_SET_APERTURE		0x61
-#define HIDPP_FF_GET_GLOBAL_GAINS	0x71
 #define HIDPP_FF_SET_GLOBAL_GAINS	0x81
 
 #define HIDPP_FF_EFFECT_STATE_GET	0x00
@@ -2349,7 +2348,6 @@ struct g920_data {
 	u8 feature_index;
 	u8 slot_autocenter;
 	u8 num_effects;
-	u16 gain;
 	u16 range;
 };
 
@@ -2412,8 +2410,6 @@ static void hidpp_ff_work_handler(struct work_struct *w)
 					  &response);
 	if (ret)
 		hid_err(data->hidpp->hid_dev, "Failed to send command to device!\n");
-	else if (wd->command == HIDPP_FF_SET_GLOBAL_GAINS)
-		g920->gain = (wd->params[0] << 8) + wd->params[1];
 
 	atomic_dec(&data->workqueue_size);
 	kfree(wd);
@@ -2453,7 +2449,7 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 	struct hid_device *hid = hidpp->hid_dev;
 	struct g920_data *g920 = hidpp->private_data;
 	struct hidpp_report response;
-	u8 params[20];
+	u8 params[20] = {};
 	u8 size;
 	int force, error;
 
@@ -2510,7 +2506,6 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 				effect->u.periodic.waveform);
 			return -EINVAL;
 		}
-		force = (effect->u.periodic.magnitude * fixp_sin16((effect->direction * 360) >> 16)) >> 15;
 		params[6] = effect->u.periodic.magnitude >> 8;
 		params[7] = effect->u.periodic.magnitude & 255;
 		params[8] = effect->u.periodic.offset >> 8;
@@ -2617,7 +2612,7 @@ static int hidpp_ff_upload_effect(struct input_dev *dev, struct ff_effect *effec
 static int hidpp_ff_playback(struct input_dev *dev, int effect_id, int value)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
-	u8 params[2];
+	u8 params[2] = {};
 
 	params[0] = data->slots[effect_id];
 	if (!dev->ready || !params[0])
@@ -2662,22 +2657,18 @@ static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
 	struct g920_data *g920 = data->hidpp->private_data;
-	u8 params[HIDPP_AUTOCENTER_PARAMS_LENGTH];
+	u8 params[HIDPP_AUTOCENTER_PARAMS_LENGTH] = {};
 
 	dbg_hid("Setting autocenter to %d.\n", magnitude);
 
 	/* start a standard spring effect */
 	params[0] = g920->slot_autocenter;
 	params[1] = HIDPP_FF_EFFECT_SPRING | HIDPP_FF_EFFECT_AUTOSTART;
-	/* zero delay and duration */
-	params[2] = params[3] = params[4] = params[5] = 0;
 	/* set coeff to 25% of saturation */
 	params[8] = params[14] = magnitude >> 11;
 	params[9] = params[15] = (magnitude >> 3) & 255;
 	params[6] = params[16] = magnitude >> 9;
 	params[7] = params[17] = (magnitude >> 1) & 255;
-	/* zero deadband and center */
-	params[10] = params[11] = params[12] = params[13] = 0;
 
 	hidpp_ff_queue_work(data, HIDPP_FF_DOWNLOAD_EFFECT, params, ARRAY_SIZE(params));
 }
@@ -2685,14 +2676,12 @@ static void hidpp_ff_set_autocenter(struct input_dev *dev, u16 magnitude)
 static void hidpp_ff_set_gain(struct input_dev *dev, u16 gain)
 {
 	struct hidpp_ff_private_data *data = dev->ff->private;
-	u8 params[4];
+	u8 params[4] = {};
 
 	dbg_hid("Setting gain to %d.\n", gain);
 
 	params[0] = gain >> 8;
 	params[1] = gain & 255;
-	params[2] = 0; /* no boost */
-	params[3] = 0;
 
 	hidpp_ff_queue_work(data, HIDPP_FF_SET_GLOBAL_GAINS, params, ARRAY_SIZE(params));
 }
@@ -2826,17 +2815,10 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 {
 	struct hid_device *hid = hidpp->hid_dev;
 	struct g920_data *g920 = hidpp->private_data;
-	struct usb_device_descriptor *udesc;
-	u16 bcdDevice;
 	struct ff_device *ff;
 	int error, j, num_slots = g920->num_effects;
 	u8 version;
 
-	if (!hid_is_usb(hid)) {
-		hid_err(hid, "device is not USB\n");
-		return -ENODEV;
-	}
-
 	struct hidpp_ff_private_data *data __free(kfree) =
 		kzalloc_flex(*data, slots, num_slots);
 	if (!data)
@@ -2853,9 +2835,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 		return -ENOMEM;
 
 	/* Get firmware release */
-	udesc = &(hid_to_usb_dev(hid)->descriptor);
-	bcdDevice = le16_to_cpu(udesc->bcdDevice);
-	version = bcdDevice & 255;
+	version = le16_to_cpu(hid_to_usb_dev(hid)->descriptor.bcdDevice) & 0xff;
 
 	/* Set supported force feedback capabilities */
 	for (j = 0; hidpp_ff_effects[j] >= 0; j++)
@@ -3462,19 +3442,6 @@ static int g920_get_config(struct hidpp_device *hidpp)
 	data.range = ret ?
 		900 : get_unaligned_be16(&response.fap.params[0]);
 
-	/* Read the current gain values */
-	ret = hidpp_send_fap_command_sync(hidpp, data.feature_index,
-					  HIDPP_FF_GET_GLOBAL_GAINS,
-					  NULL, 0,
-					  &response);
-	if (ret)
-		hid_warn(hidpp->hid_dev,
-			 "Failed to read gain values from device!\n");
-	data.gain = ret ?
-		0xffff : get_unaligned_be16(&response.fap.params[0]);
-
-	/* ignore boost value at response.fap.params[2] */
-
 	ret = g920_ff_set_autocenter(hidpp, &data);
 	if (ret)
 		return ret;

-- 
2.56.0.542.g3ef89b7020-goog

