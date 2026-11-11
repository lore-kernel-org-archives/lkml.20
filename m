Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380231;
	b=g59jh47AIPArsvqFHIBc7mRSASw2u6aQ/Mj1UK7S5e8d+F4jRAhEB4LGLNKqafGGZDU2
	 2EWjGT6LFbhK4WqItTh0InLVXOlWmQRKk8hVRX1I0Epzc8Vwjtmzy+I+Md0s5MNMNtUpR
	 bhJkq/nBH4uz4fxiiTkdcP1fOMD6jY02XwsN2aIKLSgmHGFQXfm4O5CM0NdluzTmtVi0/
	 1U98O86LI62kvwjjZpQa7B09tTfXvVq9D+88qLWcXvVVYzs+QSVkIJDIJ8Iunb0OPRclj
	 u3/WwK8ik3M16TGBippTsDdwSjNNwdg0WqNGoxtBAl+kQCd8Etp4sfTBZUbbZzvwSTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380231;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=U+xFWI13QCTYVRutWos8n/0IkGunrFB+B3j4xm3F/nA=;
	b=kuR89Hf38jDVVmO/Wlhss+hFDO+ka7gFQFsaxZ0NWwNMdhAuRzVJBcFo+JYQcm01O/A4
	 bxuRc/L0iLDZKuuX3SrdW37GvlrGgXBMWXYCuGHzFM9GpXZ4foTp31pzbEPFi3r+wAIaU
	 HY0ysgTXIV3humQn3HljAvicUMZwk/5gES7SLwdWUco9+2lVmaPWnZHIVN9sp2agGGsqs
	 F0lhcKIyDOVZ5ApcpU1uj49Y5KS+v5s8DTuz2jFK/9HQmzjRFIvKl5TpGJOG5wQOI7uLB
	 I2WKXg4ZX8z6adf4aqngiLQBuMaPpAWjvgUxGpA9YiIBQNlo440nWOb/Uqej029ta7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORNT9VbW;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24717606E21E
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:57:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24717606E21E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ORNT9VbW
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1931ff67a29so4165894c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380230; x=1794985030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U+xFWI13QCTYVRutWos8n/0IkGunrFB+B3j4xm3F/nA=;
        b=ORNT9VbWMo+YcbUms3XlnOGZzX+ku/7/CaYjqPXtKSic+baUnAVmNbOpfoov6Qiewi
         AnuBBaSay0W4fzlmzI5QAVTveZReP9LoEw+FLZejpw9CHnnEPcxPAqCt6E7/Xofs99jf
         LZJqp73K3XTh+Tvj4GaLhS9I6cAcyzLKd+bsZgxjtcokbq3RufzHcdfCnRgKC2nuuItE
         OYvZCg+Q7KM+O49A3lKIVgC5K1dsMt4XnEm3dedpkWep29YzEGTqn4vCaPkA0oLKB3MS
         EDIcNSfPtS181dcIBZKqz2lQ60l2IQ59TAevsa5GjZ2OCi2y53v9doCJxhv309mtA+Yo
         BWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380230; x=1794985030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+xFWI13QCTYVRutWos8n/0IkGunrFB+B3j4xm3F/nA=;
        b=Hq3gNlrdPGCmqGGGfnxEGU8LUW45M+fpBORcPzl11l28mVl8QbQgB2f0CA4xzMth+2
         KPralmNxQ6782xKOfqMI79FyAr/0F0BTHhQFMM0msLZiAfPdP7nN4UTdoGXTi5VK/lL5
         SXE8v41ILW2zGh9NdVAfQPMAKjrKGd907RFazSvLtUAoTVa9lbUJZW69DsOPLto5agOq
         esDLPOoLloaOl68IJkvJVPmb7/lZkZm+gY+DgNS+6ScVMgas+TU/NfOxngRjRJGngdjl
         vYettVHL+YWScBXWHfJ4BN35kveWK8yfyj9EyYGrR223vlspCTnL1pkldKvOCNYMCU9x
         8Ryw==
X-Forwarded-Encrypted: i=1; AL+hErHEWBGwa3veqhe4Ga0dxEye39C/Tkw5m7L4ZZSuyLnqb0DxB+Zgb9HGw4SCw6MqZuBrRM984jypUGVjJZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8zC44dzDl2L5Qa0GTexjxekH7I6KfIGWAOE/IHRA3nYU8E9wBN
	bxOquBn4fWFPAEW2x8eN0AhGdo6pxxt2VLA/Lj9QY/Mi3uoeBEUP5wCW
X-Gm-Gg: AYBFou2QW8Lsf9+o6/2aArks73yZfs8WfCl81SIi5yyZ0Uqog5jfRewqePQUumydb9D
	fCFgLi0NxaRaJ4U7NUqCj89UJDC0k13NEG5NNpmndioa+iohR1ggOc7npmANQqyCeGECaFICK4/
	KAH3S7/A4E1z4DFFo+bzPJoD+pbkofmIz+gR/+2h9AOKaz7OvM9z+HPxwhV8ifxvf4vIlZIsp01
	O1LdhGcIDWJS1pILr+BUmdcVt26aJnDqJqBoEQB8rfc1khMEfxhBBwBSDIXNGqh4weLdoc8iHIg
	YoP+gX0FWEfQHWy2EkYMD3ziug4uyULVOpgX9qhiqFEuPeSseypqiTq4BffruCj4k+uMBYxJsHd
	GG4uWUMDD8JR7weV3aCqEVb8UQRtItR+AgTlYUl4e262t3/pBp/5lZxKbDnTEL+xjDqBvDLCN4w
	QjIPoQdxfds+pU9Pk5OGHHlX+CJfxq+aQVC2iEbqwTe1v9P0ypOTPlKIoov5dEWL1fwXEfyyxcJ
	0tekYMqiTU7ZOoWxO7y+YWg/cLO2FEBzr1yheVk05dEffDLppJbdLlQJHWO6pVbxU/zXBNHx5QR
	rd3P7+29Ttub68twuJ8afMWV90Tergi8gu+ukhwY+06itV09iUue2bVPXTNxXGqd05BGI78Gytu
	lsNDv+expQqBeFPK0Pg==
X-Received: by 2002:a05:7022:ef07:b0:13b:2f26:6881 with SMTP id a92af1059eb24-1b3c024ac7amr2019619c88.4.1794380230036;
        Tue, 10 Nov 2026 22:57:10 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:57:09 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:27 -0800
Subject: [PATCH v2 29/33] HID: logitech-hidpp: use __free(kfree) for
 temporary allocations
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
Message-Id: <20261110-hid-logitech-hidpp-v2-29-30743e91d83b@gmail.com>
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

Managing short-lived heap allocations manually with explicit kfree()
calls adds boilerplate cleanup paths and forces callers to hold
temporary return variables across calls.

Convert temporary message and device-name allocations in command helpers
and device initialization paths to use __free(kfree) with no_free_ptr()
ownership transfer where the buffer is returned to callers.

Tested-by: Gideon Heinz <gideonheinz02@gmail.com>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 44 +++++++++++++---------------------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 8f2a9d3e0f74..67b4f1112168 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -401,18 +401,15 @@ static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
 	u8 feat_index, u8 funcindex_clientid, u8 *params, int param_count,
 	struct hidpp_report *response)
 {
-	struct hidpp_report *message;
-	int ret;
-
-	if (param_count > sizeof(message->fap.params)) {
+	if (param_count > sizeof_field(struct hidpp_report, fap.params)) {
 		hid_dbg(hidpp->hid_dev,
 			"Invalid number of parameters passed to command (%d != %llu)\n",
 			param_count,
-			(unsigned long long) sizeof(message->fap.params));
+			(unsigned long long)sizeof_field(struct hidpp_report, fap.params));
 		return -EINVAL;
 	}
 
-	message = kzalloc_obj(struct hidpp_report);
+	struct hidpp_report *message __free(kfree) = kzalloc_obj(*message);
 	if (!message)
 		return -ENOMEM;
 
@@ -424,9 +421,7 @@ static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
 	message->fap.funcindex_clientid = funcindex_clientid | LINUX_KERNEL_SW_ID;
 	memcpy(&message->fap.params, params, param_count);
 
-	ret = hidpp_send_message_sync(hidpp, message, response);
-	kfree(message);
-	return ret;
+	return hidpp_send_message_sync(hidpp, message, response);
 }
 
 /*
@@ -437,8 +432,7 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	u8 report_id, u8 sub_id, u8 reg_address, u8 *params, int param_count,
 	struct hidpp_report *response)
 {
-	struct hidpp_report *message;
-	int ret, max_count;
+	int max_count;
 
 	/* Send as long report if short reports are not supported. */
 	if (report_id == REPORT_ID_HIDPP_SHORT &&
@@ -462,7 +456,7 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	if (param_count > max_count)
 		return -EINVAL;
 
-	message = kzalloc_obj(struct hidpp_report);
+	struct hidpp_report *message __free(kfree) = kzalloc_obj(*message);
 	if (!message)
 		return -ENOMEM;
 	message->report_id = report_id;
@@ -470,9 +464,7 @@ static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	message->rap.reg_address = reg_address;
 	memcpy(&message->rap.params, params, param_count);
 
-	ret = hidpp_send_message_sync(hidpp_dev, message, response);
-	kfree(message);
-	return ret;
+	return hidpp_send_message_sync(hidpp_dev, message, response);
 }
 
 static inline bool hidpp_match_answer(struct hidpp_report *question,
@@ -919,7 +911,6 @@ static int hidpp_unifying_get_serial(struct hidpp_device *hidpp,
 static int hidpp_unifying_init(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
-	const char *name;
 	u8 serial[HIDPP_SERIAL_LENGTH];
 	int ret;
 
@@ -930,14 +921,13 @@ static int hidpp_unifying_init(struct hidpp_device *hidpp)
 	snprintf(hdev->uniq, sizeof(hdev->uniq), "%4phD", serial);
 	dbg_hid("HID++ Unifying: Got serial: %s\n", hdev->uniq);
 
-	name = hidpp_unifying_get_name(hidpp);
+	char *name __free(kfree) = hidpp_unifying_get_name(hidpp);
 	if (!name)
 		return -EIO;
 
 	snprintf(hdev->name, sizeof(hdev->name), "%s", name);
 	dbg_hid("HID++ Unifying: Got name: %s\n", name);
 
-	kfree(name);
 	return 0;
 }
 
@@ -1131,7 +1121,6 @@ static char *hidpp_get_device_name(struct hidpp_device *hidpp)
 {
 	u8 feature_index;
 	u8 __name_length;
-	char *name;
 	unsigned index = 0;
 	int ret;
 
@@ -1145,7 +1134,7 @@ static char *hidpp_get_device_name(struct hidpp_device *hidpp)
 	if (ret)
 		return NULL;
 
-	name = kzalloc(__name_length + 1, GFP_KERNEL);
+	char *name __free(kfree) = kzalloc(__name_length + 1, GFP_KERNEL);
 	if (!name)
 		return NULL;
 
@@ -1153,17 +1142,15 @@ static char *hidpp_get_device_name(struct hidpp_device *hidpp)
 		ret = hidpp_devicenametype_get_device_name(hidpp,
 			feature_index, index, name + index,
 			__name_length - index);
-		if (ret <= 0) {
-			kfree(name);
+		if (ret <= 0)
 			return NULL;
-		}
 		index += ret;
 	}
 
 	/* include the terminating '\0' */
 	hidpp_prefix_name(&name, __name_length + 1);
 
-	return name;
+	return no_free_ptr(name);
 }
 
 /* -------------------------------------------------------------------------- */
@@ -4328,17 +4315,15 @@ static int hidpp_initialize_battery(struct hidpp_device *hidpp)
 static void hidpp_non_unifying_init(struct hidpp_device *hidpp)
 {
 	struct hid_device *hdev = hidpp->hid_dev;
-	char *name;
 
 	/* Bluetooth devices already have their serialnr set */
 	if (hid_is_usb(hdev))
 		hidpp_serial_init(hidpp);
 
-	name = hidpp_get_device_name(hidpp);
+	char *name __free(kfree) = hidpp_get_device_name(hidpp);
 	if (name) {
 		dbg_hid("HID++: Got name: %s\n", name);
 		snprintf(hdev->name, sizeof(hdev->name), "%s", name);
-		kfree(name);
 	}
 }
 
@@ -4385,7 +4370,7 @@ static void hidpp_connect_event(struct work_struct *work)
 	struct hidpp_device *hidpp = container_of(work, struct hidpp_device, work);
 	struct hid_device *hdev = hidpp->hid_dev;
 	struct input_dev *input;
-	char *name, *devm_name;
+	char *devm_name;
 	int ret;
 
 	/* Get device version to check if it is connected */
@@ -4443,11 +4428,10 @@ static void hidpp_connect_event(struct work_struct *work)
 	}
 
 	if (hidpp->name == hdev->name && hidpp->protocol_major >= 2) {
-		name = hidpp_get_device_name(hidpp);
+		char *name __free(kfree) = hidpp_get_device_name(hidpp);
 		if (name) {
 			devm_name = devm_kasprintf(&hdev->dev, GFP_KERNEL,
 						   "%s", name);
-			kfree(name);
 			if (!devm_name)
 				return;
 

-- 
2.56.0.542.g3ef89b7020-goog

