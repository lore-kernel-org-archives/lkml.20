Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204685;
	b=e/HnnHKcINNZkFfxiEF+yJdAeRSKA+xJ4msf+VNTMsSAoJMqu+upx2aYzBkm8PLtnjqa
	 iJTacs0TiEbXVFw/Z/HIsA5/Z0oiVfeyhmz7S1K9sXAFq20agkZslyH9CvXNHL5KtKejF
	 aNX+JuAJF5XC9YF9i7ExVvNc2QFxMEgqAuE0v7iBGrYgJhb9TzsTCTHqtf+JWmvgV5QMD
	 OakKqtNlRVqsCnwFcPwiC48+ouuXcoMK7dKp4cuOwzD/09QiMdw5JM/dHVRwrJd7DIWG+
	 8ZtTz4I0NCYP/tyj/yO5yb+9kmWrGg+J+p5QKqDSC2khcyVNyJVKn2DxxVMVPl2AkgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xqMaXN3opWhg7YX0G/0+bqesHCg4V/j9sDFtsLvE4LM=;
	b=Fif7l7itJRp7g6hLm/jREE+cliX9Daql54bcCZ0p+23G2fRpd8tDw5iE1+O7VytC3X36
	 QaWcVg6mwcte6SMfo5DGpL4QF+0Q7WnW2Jh0JNRrz4vuNn/XZH5wNxoc85wL+hJvA5nNT
	 qb+43u7lPagJ6Y7tyrRJtQd4LYoBOQb5HP12HFIkJroitKiwBGHOTQ2pCD4Eke0/rXnwH
	 y8bX4iGWaWWsLzxserl9mmZuNNATxC37Wbc7m8EyBko+mVTtLO/n9DzF4jvt/gR5XNn8M
	 MexzSUUCU7cQtndQqLObnCdasO3Bic37sHUP7mVLf+Ch4gLfn7eUoOPPNou9l9n/tWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMBKbC1W;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F30E606D839
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F30E606D839
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EMBKbC1W
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-36dbde64409so912944eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204684; x=1794809484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqMaXN3opWhg7YX0G/0+bqesHCg4V/j9sDFtsLvE4LM=;
        b=EMBKbC1WoB42pg1HIzHkXJuoKcwt88k2DYv2HPGBX7b61Akx8ZeODON5tRkd4DDGSm
         PmixkCP5dlQlB8Ikif6ScL9L/mWJHy6yo7AO3FniRp0gdgIVPMlT2KQ3qkEoElLjXlps
         LzZ4LIQmf7VoFp+9465f27Zlt5cDvKlOboqWeBNl8rUtWAY3ogRPAd9mKpRIvmEf8Rh5
         AovOAKNAW7/XCNMdGvqaG3wz0PSQNvdiCaUV4SegEOJMGOT8bBJjR3CxxejzQDSG+who
         4/y78kscpICeBrnADnvqSQg9frf0djospDM0994HJu+FYGXI40jaSgVFdH0JZD+LDods
         FdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204684; x=1794809484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xqMaXN3opWhg7YX0G/0+bqesHCg4V/j9sDFtsLvE4LM=;
        b=bCONYSfOkaZR86tqQdCwkc9QrJLJw4M0ZbHuFYhT+ZGZnbza2GzsBcgC2SgF016xPD
         /EV13wcxMOSpAzZGJjUK/h0VRUwPibG/CfFbCs+ueXvmdh9x1woyaU9OjIOf3nAgncmq
         FWpi+huygk1JoRciYNRxoSle35DNS3HEdah3OYv1ifLLCcK/iNKa0FXIKuOYga/gRzL5
         u/Kk93w7Dx0e4MZUaF/3Best5G8zT5ZAzfOFahHLUglmGY9JsipZ0d/cxHuX8WW5xBRo
         0d04/BRT3Ng1jdyRRrLIrn7sK5cuhn9J4oezIu+dEuEQyrDCku1GmasKvw/AoNoDf4dz
         IEHA==
X-Forwarded-Encrypted: i=1; AL+hErE+89/ic1xO4OL9h3p0PdMKu6VE5zY4jvUf2moh5aNez50+ZDnees5i7hyJrgbr7S0LrZ85iQkkVV0Hfig=@vger.kernel.org
X-Gm-Message-State: APuU4Z96n1QlD658VHqH3OYgU1//RpnwgTP0bukyQSz7SmS0vjI4GRTa
	G6GDB1IHHN+gQBAZccgcXlZPaZjFquTzOWOF1fem3O1qOjCtF8Kkqvj6
X-Gm-Gg: AYBFou2SCeZtGMNUYtdL2TqC9BnE0dSCCWrEAAN6xDX41Ow3YECZvA8VrAE4zUaPTTl
	0sqld8oa4k//2u5y6xOqWi3uGQPh9Hj9AxP9noIMaBqleL1iru/vDPI3jxWt4qPM9LXc6oQnA1O
	bkZT4rjPmQHIJ8DZpwnKkCmoto0r6Z3iTgq1AqJc7PNMjLeHbOg8FGtgEFX1wT5IS8xhc2BetIL
	r7bjWgIvAEX9Ufmm+Z30CKRSRgfhvttmW2Eiq/hwi72s7iY5WfkkmpnrW0o95p7jiPSNUrYh6k0
	e16eI1nWtV9vTyU2psEHLuaBX/Osc72s+8zIej52RyXTin5sW+RpexDEUvNjvpYmgci7aB3VC3B
	0/QZek7i6Vl6uzEUcODPx88Uwx3pVqm6NQeUcKF97GQbj1XDd+88qH4InaOs2rVH1RpuvPb1snu
	ErUOAYg/FR6FYVfSSsUwKI2tItZohOMfJ9tyKytsUv/4ycIuTjR+bcqX0Rbu3uGYthGDSxi0lwR
	GNd20mUu0kl8KjG2FGBN5FeS11NVqf7h4J1/G4+f+deL1Tk9UGSng0u4pbwzVtoDO/pAqlhD+kQ
	iK7yVAM3vL4gOPi9Ru1JnIfCREUYq+Zx2yc4kkdbhsc7445B4uwgqgZDpTvFnsJUrynSMBbkdjg
	ArrtRHYTIXdGi2MUA
X-Received: by 2002:a05:693c:6203:b0:351:7e5d:2de9 with SMTP id 5a478bee46e88-372542bc425mr8548828eec.1.1794204684029;
        Sun, 08 Nov 2026 22:11:24 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:23 -0800 (PST)
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
Subject: [PATCH 10/18] HID: logitech-hidpp: manage G920 range sysfs attribute via dev_groups
Date: Sun,  8 Nov 2026 22:10:54 -0800
Message-ID: <20261109061103.2887636-11-dmitry.torokhov@gmail.com>
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

Creating and removing the G920 range attribute manually inside force
feedback initialization and destruction ties sysfs cleanup to input
device release rather than driver unbind, leaving a dangling attribute
if userspace holds an open event handle across disconnect. Manual sysfs
management also adds avoidable boilerplate.

Register the attribute group through driver dev_groups with a visibility
callback checking initialized G920 force-feedback state, allowing driver
core to create and tear down the attribute cleanly around probe and
remove.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 45 ++++++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 8 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 1ed940352fd2..ad3edd15cdd2 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2807,16 +2807,47 @@ static ssize_t hidpp_ff_range_store(struct device *dev, struct device_attribute
 
 static DEVICE_ATTR(range, S_IRUSR | S_IWUSR | S_IRGRP | S_IWGRP | S_IROTH, hidpp_ff_range_show, hidpp_ff_range_store);
 
+static struct attribute *g920_range_attrs[] = {
+	&dev_attr_range.attr,
+	NULL
+};
+
+static umode_t g920_range_attr_is_visible(struct kobject *kobj,
+					  struct attribute *attr, int idx)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	struct hid_device *hdev = to_hid_device(dev);
+	struct hidpp_device *hidpp = hid_get_drvdata(hdev);
+	struct g920_data *g920;
+
+	if (!hidpp || !(hidpp->quirks & HIDPP_QUIRK_CLASS_G920))
+		return 0;
+
+	g920 = hidpp->private_data;
+	if (!g920 || !g920->ff)
+		return 0;
+
+	return attr->mode;
+}
+
+static const struct attribute_group g920_range_group = {
+	.attrs = g920_range_attrs,
+	.is_visible = g920_range_attr_is_visible,
+};
+
+static const struct attribute_group *hidpp_dev_groups[] = {
+	&g920_range_group,
+	NULL
+};
+
 static void hidpp_ff_destroy(struct ff_device *ff)
 {
 	struct hidpp_ff_private_data *data = ff->private;
 	struct hidpp_device *hidpp = data->hidpp;
-	struct hid_device *hid = hidpp->hid_dev;
 	struct g920_data *g920 = hidpp->private_data;
 
-	hid_info(hid, "Unloading HID++ force feedback.\n");
+	hid_info(hidpp->hid_dev, "Unloading HID++ force feedback.\n");
 
-	device_remove_file(&hid->dev, &dev_attr_range);
 	destroy_workqueue(data->wq);
 	g920->ff = NULL;
 }
@@ -2895,11 +2926,6 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 
 	dev->close = hidpp_ff_close;
 
-	/* Create sysfs interface */
-	error = device_create_file(&(hidpp->hid_dev->dev), &dev_attr_range);
-	if (error)
-		hid_warn(hidpp->hid_dev, "Unable to create sysfs interface for \"range\", errno %d!\n", error);
-
 	hid_info(hid, "Force feedback support loaded (firmware release %d).\n",
 		 version);
 
@@ -5033,6 +5059,9 @@ static struct hid_driver hidpp_driver = {
 	.input_configured = hidpp_input_configured,
 	.input_mapping = hidpp_input_mapping,
 	.input_mapped = hidpp_input_mapped,
+	.driver = {
+		.dev_groups = hidpp_dev_groups,
+	},
 };
 
 module_hid_driver(hidpp_driver);
-- 
2.56.0.506.g506a7eabc5-goog

