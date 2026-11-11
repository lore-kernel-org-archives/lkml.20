Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380186;
	b=Y5nHPx+QKzKBjqwcHhxhtpeY8QRWcK8NGDwGovjIVuvQfXFAlsuwelD2yzpG1nq59bJt
	 HVpARkw6fICzzBdrvKw7IRvltTJdXhMJIbD5TFhW0ocSLpmuTe9FfEJxN73khMiggXq1C
	 R7KXXBaZKdfPyKjjoYc4zrpza7d9y8g6CWFo0KNng4aGsiGvqkBG3sfGIBjJfMtHdMMnk
	 R9Kgp6eg9iu6zIKEHs1yBiLqfxS1xrjx9kWEZqamCmOhSypaBzStWQM9Gd7PL8ltvCDwH
	 UwFLbRggX7GTorkXoFmEyC/HS7Ic9rK5lpBuAiDK7XUUiKqV/PMIuOftjRbffJ1YmHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=nx9IOLprpQSMfjypqpoQZ6anLGigCDf2bUI7iUAOQmY=;
	b=FCieGwnGNQsnXGvbf42ww7m12UNrtnswO5KTrroKj9Sz+w4sVtmX+/q+mE7zGTgobStV
	 ++HTMzFfaOC4o5JifZANc6OslaM4gJBf2QRootTcHySXJ1b8ZP6bAuC6hCCDKQ6YHsW+I
	 z4PrL1LBB1Z+xJrUbSKVvjfGQzILCxnRtMPfSE5C4dxqKzjGvJqqYCvcNNlDstfRn1KOX
	 Gnt8DpPIlIhqO/AC5tC0DwS4JbOkQPhk52qlCvLS/1Br+XnXDmurbUwccfrZQQp0WEtuN
	 1t1PID0Pn156GqB/6LOZJ0tzpR7Dpg1SITrLLtYc0bLZLtt87zN0vnMH8MjRM6VkwYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LLA/ZYD9";
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8333860A2622
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8333860A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LLA/ZYD9
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b3acec6677so4468541c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380186; x=1794984986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nx9IOLprpQSMfjypqpoQZ6anLGigCDf2bUI7iUAOQmY=;
        b=LLA/ZYD9fn/oCUqdGap+MTcTC+l5+kwkINjy3EWCM69xGKD5cSNPwlYSzTfP8iNY2b
         bnSaFWy+nxAxyqNwkxqRaFs9A2DRCrDV5WC4b9NB/MkD412k0Lm0Q0T8U/R4zKXilqW2
         6vAgtzciaIKIUzngXJsysCYUcX7fGYeWhtVnFMgq8Q3BRHkhDCuzQHX3hZZbfgjQ+gf+
         YEanGuejwqEl1HR7vFCCq7Iff0YpOKZMcOMhEC8k5bi/AeOMHSfiF0PEvM8Dkkj4kDp1
         H2kRMvrwnOkxvW1C/xMCSx+C8YfglHmvWIfznHJyJkImIIsDxUMCbYHXCA0fsTMYVM4Y
         yb5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380186; x=1794984986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nx9IOLprpQSMfjypqpoQZ6anLGigCDf2bUI7iUAOQmY=;
        b=GIwQVhYSVUwoEA138S9MxsKTG+NBCJb8dic4Z+kord9DK9EU+OwbKqnzZCAb5n4OOL
         dzzQ517VDTCqcflGxw+WzxxM20PqKf4uIpnU+FMQ6bysxym1JHIo26ItDKJDFO14oVP3
         FBHnw01CYII+PsmDXGeLjKshsHkw8ElxDkSeAjqbehuylHhY7kaIQvwRRt53fea7cX5h
         a+FGcfK/ZwzwPmUi4LQz+TeU6HWDKa9bQXHg208wU3iuJni5IOY87eLa/W0WgImji8hH
         xtwNFUBRde1N6BM/aWCKUFyCjCm/DJJw0o0hb48LQJcsdXkO1MlGjzoLCT4LSk3XHb3D
         ejWA==
X-Forwarded-Encrypted: i=1; AL+hErG+T4arM3Kgbru7Bwn8jYfvYszh+BOMJiQf1wTlhzmklN69c0n1djTW1eepo667/3psxw+RpXaGthZXv6s=@vger.kernel.org
X-Gm-Message-State: APuU4Z8+pp80+HTX72soSbXKVr9/apIfvlk8e5NZ7P5wUgrKEAl4UBGc
	AgtIVdhmOxlGUr2wecheMj/7z8kAqN3MC+4f0W5SPNyNERdl+w8tWt91
X-Gm-Gg: AYBFou38+lzUvDJubQUxX+yyw/zFxA4NNdf3ur13HyyBZ7s728Q3DP02sVx4GsyneZd
	2ZJcisJtZ6o9cmnlPDNPBxCuEhbIOpMB+6DOnhs5UN+i+LKf5itkRKY+qBMo/pwALSDVLDP35A3
	YRoNkFX0fd/7bF/e9fjWJtNQwhATcJUxPLvFODDuru820g6vrNzv+1dCWO0Eriewg+kz4YU1x0l
	J4kyOE3DjagXYec1zuQGL75y+gYjLsOvoxX8XSTFmKkGFw+wuEu5lZW2mJ9yReOYTrx+67vqWbu
	6gqvA3QgjJzXvC0p2K5rbsy1rw7PVwJsmwhvvHsFJk4NRA5xT+WU6pfeNjbbwSLH3wXxUM3mA77
	w8XAHU25w0JaWSOjzYWj0cAYNPIDeiSVwQthu5gAy/0R1McF1xvrsjm4MBrk+scdM8nTQ4FeR5M
	E4z7iwHl1Olsuo1DwX99VepKjXTHUCvXAT8Im8yRBvr4vbkTk6PLkHnW8pBsEGpmHlR7x9/IVi1
	2PlIwqEQP7fWANmeFKYFKokZkGPN5irAgLz9ig4Ag+XumBCUMJbhXQLtiAW8XxG683sAyV0f3UO
	ayDFLDazYFoedBt5R6Zelry+zJvxRWLmfsIOtlDfEonlN58KTl4DihrCDmcLqvL6YIRRa2ZtjxM
	90S4HCm4zUXfKNLDPgQ==
X-Received: by 2002:a05:701b:20ce:20b0:1a4:3169:cb with SMTP id a92af1059eb24-1b3c0311b8dmr1605411c88.17.1794380185575;
        Tue, 10 Nov 2026 22:56:25 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:23 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:01 -0800
Subject: [PATCH v2 03/33] HID: logitech-hidpp: drain G920 FF workqueue
 before closing transport
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
Message-Id: <20261110-hid-logitech-hidpp-v2-3-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Probe no longer keeps the HID transport open indefinitely, so the
underlying USB interrupt IN endpoint only stays active while the HID
transport is held open. When the last input user closes the device
after input core flushes active effects, or when the device is
inhibited with commands still queued, releasing the HID transport
shuts down transport I/O unless another client holds it open. Queued
force-feedback commands then fail to receive their HID++ replies,
causing command timeouts and leaving stale slot mappings behind.

Override the input open and close callbacks once G920 force feedback is
initialized so the force-feedback send queue drains completely before
closing the HID transport.

Fixes: 91cf9a98ae41 ("HID: logitech-hidpp: make .probe usbhid capable")
Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index d9342a3e8122..d5f53b35ac6f 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2815,6 +2815,22 @@ static void hidpp_ff_destroy(struct ff_device *ff)
 	kfree(data->effect_ids);
 }
 
+static int g920_input_open(struct input_dev *dev)
+{
+	struct hid_device *hid = input_get_drvdata(dev);
+
+	return hid_hw_open(hid);
+}
+
+static void g920_input_close(struct input_dev *dev)
+{
+	struct hid_device *hid = input_get_drvdata(dev);
+	struct hidpp_ff_private_data *data = dev->ff->private;
+
+	flush_workqueue(data->wq);
+	hid_hw_close(hid);
+}
+
 static int hidpp_ff_init(struct hidpp_device *hidpp,
 			 struct hidpp_ff_private_data *data)
 {
@@ -2897,6 +2913,9 @@ static int hidpp_ff_init(struct hidpp_device *hidpp,
 	ff->set_autocenter = hidpp_ff_set_autocenter;
 	ff->destroy = hidpp_ff_destroy;
 
+	dev->open = g920_input_open;
+	dev->close = g920_input_close;
+
 	/* Create sysfs interface */
 	error = device_create_file(&(hidpp->hid_dev->dev), &dev_attr_range);
 	if (error)

-- 
2.56.0.542.g3ef89b7020-goog

