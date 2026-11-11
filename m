Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380211;
	b=x4nnnFc1NBFig2noh8mEytvpRyYUoxp8RRhm4KqEHUDsvsrC7nlHKZbUUuIGGUxh5vOP
	 qz1b4J7Rz8qv/sbWbCLn7ImfHhCssAaiXEMyEbRa6IKUJ6rQgqZU5qpqdcd9HOCRd0Bba
	 +6iOibSP4JbdZCbGpKD08tNXKw+0WurkunQGAPRPVxsSf57xiRHKqGsWlmHq1YwmH0CUx
	 TABPCHq9W1lSg81UXsZ+rtQ/W1hWf+xz8AcH6F9gDKegHjocPdCuqC4m7uUJjsORePtMG
	 xCgd/HiQtIfzqGyfUF6CD3IbJs8ehwQOT8mWBimsQbfsIy/6I6qy6fq4zNijlRkZmog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380211;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=cOufneFrlPFyCJjGCXXVRy2+P+qm+qLl4SuCpAhzSRM=;
	b=IpW7fCeVdi0tzvgbadeb2dOjzX2Y3gwn3ZIYIVUkc844EBhFM4I4ld+b+Ru9J+4PcRH1
	 Jz0f2zxQYD3mk1Wo9RFnB6Lf83sbccFxJFeYPDUqo+MPcH/+1TjyV8SbCxW01dIZRVo/K
	 +wysFF1H5iqQwvMKfASRa16f+HGEPrJQL3lACPVdD1XEm6/PT+DmVoy8+bez5PGWUPyW+
	 436OPBc2dJRVYG7vmsArK/k+ezSJt8IC3uafyFDFrHk6JW4eTFDXXtZaI120m1JEY0DK+
	 BurOZjrjfpmb4ekinkzYcpneVINcJNp9NdYRzGyBx3BJprcB+IQR5hwHe6aeRCDIw4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaM7ZOzs;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E62606A991
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6E62606A991
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NaM7ZOzs
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1438d9363fbso1694109c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380210; x=1794985010; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cOufneFrlPFyCJjGCXXVRy2+P+qm+qLl4SuCpAhzSRM=;
        b=NaM7ZOzs4c0gC2XTIItGjk5bIEtVi+LWPOYPc8EiFg+mJ9XFUNtdgOUqkGLjNMUtyy
         jzV2KrTISBmumLvaZdSx/1x5aanARjmW5020Mcx8qMn7Zy5Ih9gPx1txuK/MWb0BFz4s
         GXHwZZo27FveDBHPWlY9YbiKKDF5BrwLPspSXxZ7wvhyJfjuDr4oBXn1GhHZjMAp7SQA
         L1544xdqNMe7YCI9lY8LYpXN/QHpMPIkJPWl39yo26ZZsesfeGd8K/hPjWx16x9ptm4o
         4Ip+1h2DCWrQ+CCeo4DMyQD11oXKSmriAwYIo83YkCp9DpX13vPeOTzl5ssJPfoconyW
         I59Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380210; x=1794985010;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cOufneFrlPFyCJjGCXXVRy2+P+qm+qLl4SuCpAhzSRM=;
        b=XWc7QoctUruz8Nm3VQmHSZ62w6/2OlQf4PQ2WRMfl/35TGJB1dYwmJADIPcNkEvR4C
         OgwYtSyd5uoXlKMiW//mklalKJJm62JODzs5GPdrCmibtwA3jMP4cM0kaoWg1JaY+CZ3
         edl3luZZwYWNVUzxKZyBso61W2WwNbqCeOays3v70TLg4xr3sDD5DowiRANBgXGcXj0e
         p5oYu05lb6ZDtq0SJpKJi3uFbLVeHhcM1q/EMAu5W0o/V6543coMmjwA6dHuz09FQWZ8
         jE76fX9cbR5LUCCx5Fgyeo7ZJT1ItsbKngZV8ZSCU1rmt4+PjggmXFDMg27US/gq90xd
         iG2w==
X-Forwarded-Encrypted: i=1; AL+hErEfSHa4lkITC61u8bFoG9S5bnW6ayG63SAmF5pk5nmhImRX5uSrnXB1AR31/t7cbynzNJ5inneoWutfkPg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+SUNqMzbgvGMQ97K8A3AW31JQT4epzQW95NGqY+C/imPWl6FlE
	ckPtsyixhsNRuQtX7+Gu1fQzq4CNlSjVBE1OVWXvroaA1RPmrFGS1314
X-Gm-Gg: AYBFou1RpOBNNct2i8TsRnkIzR8KjGGzv89dr8k4ZgJ9Q6ooJnUUnsWs6AeNVAoT8gP
	td1bhNK9vMkjB+qzIXSQgVkII0rLGT+O/Z2rENOGBA0p27gehAQG+SMs9AOP9eMnLu+wXNHXUZk
	oIrKHJkOki8q/E/3qsBk43CHXNoJVdnXkis9fBDhmnoOECcidu0OwcQe5kdz/7XyzLLjq7ad3W/
	lwRRjDR48upoiHaN5e2rDIBv8Eo1PPdDCci0YpIWaxQhuBFoFXohJAsMpTuBdokJuTCBx7JO8Qz
	2ctOVSrSkY8Xyu9pQtIdsRdWBKSzLGPtxcl9gwWLqLnkRpV10Bvj8vUUnUO1WZxRFnl0cpLxv88
	oa3+ahIGstvq84vdEXSBejMdwud3ZUh8dq+wsqJnPml6VgeYTY6/9YA47aWhXV3VR69ErKsLEom
	vdl7UGQuASkcSPp/h49Z2QPywFCoX7U2s3xY+WxVHx6DoA1VZLoBar2iptiSPMoxtI9fIglW7bn
	LlacMi8L1fUmCvb1jlbW944TavPjUNft36Kyw5XHtKiesTcMtav5bQRN8rGUB/vKuRuHvYJkJNo
	z8NPJioZlRAhYEgzm64NiBpaxgeu0nGci+6Hc5ocbdGrOU1YH9BcxT/3eDRJHXWOm8eWo5jO20X
	6qf0gBg4S2pDh6XrdF+GZ8EzGM0UQgZiVyl6d6lE=
X-Received: by 2002:a05:7022:28e:20b0:184:40db:6bb9 with SMTP id a92af1059eb24-1b3bef0d0e2mr2414529c88.8.1794380209700;
        Tue, 10 Nov 2026 22:56:49 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:48 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:15 -0800
Subject: [PATCH v2 17/33] HID: logitech-hidpp: return negative error codes
 from hidpp_send_message_sync()
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
Message-Id: <20261110-hid-logitech-hidpp-v2-17-30743e91d83b@gmail.com>
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

Low-level synchronous send helpers previously returned 0 on success,
negative error numbers on transport/timeout errors, and positive values
on device protocol errors. Callers across the driver were burdened with
checking if (ret > 0) to convert protocol errors into -EPROTO or -EIO,
leading to scattered, inconsistent error translation.

Translate HID++ 1.0 and HID++ 2.0 error reports directly into standard
negative error codes (-EBUSY, -EIO, -EPROTO) in the core synchronous
send helper, simplify retry handling in hidpp_send_message_sync() to
check ret == -EBUSY, and remove redundant protocol error conversion
boilerplate across all callers.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 158 +++++++++------------------------------
 1 file changed, 37 insertions(+), 121 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 3745d95f5bba..cf42626ab98d 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -287,10 +287,9 @@ static int __hidpp_send_report(struct hid_device *hdev,
  *
  * Must be called with hidpp->send_mutex locked
  *
- * Same return protocol than hidpp_send_message_sync():
- * - success on 0
- * - negative error means transport error
- * - positive value means protocol error
+ * Same return protocol as hidpp_send_message_sync():
+ * - 0 on success
+ * - negative error code on failure
  */
 static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 	struct hidpp_report *message,
@@ -331,6 +330,18 @@ static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 	    response->rap.sub_id == HIDPP_ERROR) {
 		ret = response->rap.params[1];
 		dbg_hid("%s:got hidpp error %02X\n", __func__, ret);
+		switch (ret) {
+		case HIDPP_ERROR_BUSY:
+			ret = -EBUSY;
+			break;
+		case HIDPP_ERROR_RESOURCE_ERROR:
+		case HIDPP_ERROR_UNKNOWN_DEVICE:
+			ret = -EIO;
+			break;
+		default:
+			ret = -EPROTO;
+			break;
+		}
 		goto out;
 	}
 
@@ -339,6 +350,14 @@ static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 	    response->fap.feature_index == HIDPP20_ERROR) {
 		ret = response->fap.params[1];
 		dbg_hid("%s:got hidpp 2.0 error %02X\n", __func__, ret);
+		switch (ret) {
+		case HIDPP20_ERROR_BUSY:
+			ret = -EBUSY;
+			break;
+		default:
+			ret = -EPROTO;
+			break;
+		}
 		goto out;
 	}
 
@@ -350,11 +369,8 @@ static int __do_hidpp_send_message_sync(struct hidpp_device *hidpp,
 }
 
 /*
- * hidpp_send_message_sync() returns 0 in case of success, and something else
- * in case of a failure.
- *
- * See __do_hidpp_send_message_sync() for a detailed explanation of the returned
- * value.
+ * hidpp_send_message_sync() returns 0 in case of success, and a negative error
+ * code in case of a failure.
  */
 static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 	struct hidpp_report *message,
@@ -367,18 +383,10 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 
 	do {
 		ret = __do_hidpp_send_message_sync(hidpp, message, response);
-		if (ret <= 0)
+		if (ret != -EBUSY)
 			break;
 
-		if (response->report_id == REPORT_ID_HIDPP_SHORT &&
-		    ret != HIDPP_ERROR_BUSY)
-			break;
-		if ((response->report_id == REPORT_ID_HIDPP_LONG ||
-		     response->report_id == REPORT_ID_HIDPP_VERY_LONG) &&
-		    ret != HIDPP20_ERROR_BUSY)
-			break;
-
-		dbg_hid("%s:got busy hidpp error %02X, retrying\n", __func__, ret);
+		dbg_hid("%s:got busy hidpp error, retrying\n", __func__);
 	} while (--max_retries);
 
 	mutex_unlock(&hidpp->send_mutex);
@@ -387,11 +395,8 @@ static int hidpp_send_message_sync(struct hidpp_device *hidpp,
 }
 
 /*
- * hidpp_send_fap_command_sync() returns 0 in case of success, and something else
- * in case of a failure.
- *
- * See __do_hidpp_send_message_sync() for a detailed explanation of the returned
- * value.
+ * hidpp_send_fap_command_sync() returns 0 in case of success, and a negative error
+ * code in case of a failure.
  */
 static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
 	u8 feat_index, u8 funcindex_clientid, u8 *params, int param_count,
@@ -426,11 +431,8 @@ static int hidpp_send_fap_command_sync(struct hidpp_device *hidpp,
 }
 
 /*
- * hidpp_send_rap_command_sync() returns 0 in case of success, and something else
- * in case of a failure.
- *
- * See __do_hidpp_send_message_sync() for a detailed explanation of the returned
- * value.
+ * hidpp_send_rap_command_sync() returns 0 in case of success, and a negative error
+ * code in case of a failure.
  */
 static int hidpp_send_rap_command_sync(struct hidpp_device *hidpp_dev,
 	u8 report_id, u8 sub_id, u8 reg_address, u8 *params, int param_count,
@@ -988,22 +990,14 @@ static int hidpp_root_get_protocol_version(struct hidpp_device *hidpp)
 			CMD_ROOT_GET_PROTOCOL_VERSION | LINUX_KERNEL_SW_ID,
 			ping_data, sizeof(ping_data), &response);
 
-	if (ret == HIDPP_ERROR_INVALID_SUBID) {
+	if (ret == -EPROTO &&
+	    response.rap.sub_id == HIDPP_ERROR &&
+	    response.rap.params[1] == HIDPP_ERROR_INVALID_SUBID) {
 		hidpp->protocol_major = 1;
 		hidpp->protocol_minor = 0;
 		goto print_version;
 	}
 
-	/* the device might not be connected */
-	if (ret == HIDPP_ERROR_RESOURCE_ERROR ||
-	    ret == HIDPP_ERROR_UNKNOWN_DEVICE)
-		return -EIO;
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1091,12 +1085,6 @@ static int hidpp_devicenametype_get_count(struct hidpp_device *hidpp,
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 		CMD_GET_DEVICE_NAME_TYPE_GET_COUNT, NULL, 0, &response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1115,12 +1103,6 @@ static int hidpp_devicenametype_get_device_name(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 		CMD_GET_DEVICE_NAME_TYPE_GET_DEVICE_NAME, &char_index, 1,
 		&response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1273,14 +1255,6 @@ static int hidpp20_batterylevel_get_battery_capacity(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_LEVEL_STATUS,
 					  NULL, 0, &response);
-	/* Ignore these intermittent errors */
-	if (ret == HIDPP_ERROR_RESOURCE_ERROR)
-		return -EIO;
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1302,11 +1276,6 @@ static int hidpp20_batterylevel_get_battery_info(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_BATTERY_LEVEL_STATUS_GET_BATTERY_CAPABILITY,
 					  NULL, 0, &response);
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1456,12 +1425,6 @@ static int hidpp20_battery_get_battery_voltage(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_BATTERY_VOLTAGE_GET_BATTERY_VOLTAGE,
 					  NULL, 0, &response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1604,14 +1567,6 @@ static int hidpp20_unifiedbattery_get_capabilities(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_UNIFIED_BATTERY_GET_CAPABILITIES,
 					  NULL, 0, &response);
-	/* Ignore these intermittent errors */
-	if (ret == HIDPP_ERROR_RESOURCE_ERROR)
-		return -EIO;
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1694,14 +1649,6 @@ static int hidpp20_unifiedbattery_get_status(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_UNIFIED_BATTERY_GET_STATUS,
 					  NULL, 0, &response);
-	/* Ignore these intermittent errors */
-	if (ret == HIDPP_ERROR_RESOURCE_ERROR)
-		return -EIO;
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -1958,13 +1905,8 @@ static bool hidpp20_get_adc_measurement_1f20(struct hidpp_device *hidpp,
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 					  CMD_ADC_MEASUREMENT_GET_ADC_MEASUREMENT,
 					  NULL, 0, &response);
-
-	if (ret) {
-		if (ret > 0)
-			hid_dbg(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-				__func__, ret);
+	if (ret)
 		return false;
-	}
 
 	*status = hidpp20_map_adc_measurement_1f20(params, voltage);
 	return true;
@@ -2138,11 +2080,6 @@ static int hidpp_solar_request_battery_event(struct hidpp_device *hidpp)
 					  hidpp->battery.solar_feature_index,
 					  CMD_SOLAR_SET_LIGHT_MEASURE,
 					  params, 2, &response);
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -2230,12 +2167,6 @@ static int hidpp_touchpad_fw_items_set(struct hidpp_device *hidpp,
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 		CMD_TOUCHPAD_FW_ITEMS_SET, &items->state, 1, &response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -2300,12 +2231,6 @@ static int hidpp_touchpad_get_raw_info(struct hidpp_device *hidpp,
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index,
 		CMD_TOUCHPAD_GET_RAW_INFO, NULL, 0, &response);
-
-	if (ret > 0) {
-		hid_err(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
-		return -EPROTO;
-	}
 	if (ret)
 		return ret;
 
@@ -3493,13 +3418,8 @@ static int g920_get_config(struct hidpp_device *hidpp,
 					  HIDPP_FF_GET_INFO,
 					  NULL, 0,
 					  &response);
-	if (ret) {
-		if (ret < 0)
-			return ret;
-		hid_err(hidpp->hid_dev,
-			"%s: received protocol error 0x%02x\n", __func__, ret);
-		return -EPROTO;
-	}
+	if (ret)
+		return ret;
 
 	data->num_effects = response.fap.params[0];
 
@@ -3702,8 +3622,6 @@ static int hidpp20_reprog_controls_get_count(struct hidpp_device *hidpp)
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index, cmd, NULL, 0,
 					  &response);
-	if (ret > 0)
-		return -EPROTO;
 	if (ret)
 		return ret;
 
@@ -3721,8 +3639,6 @@ static int hidpp20_reprog_controls_get_cid_info(struct hidpp_device *hidpp,
 
 	ret = hidpp_send_fap_command_sync(hidpp, feature_index, cmd, &index,
 					  sizeof(index), &response);
-	if (ret > 0)
-		return -EPROTO;
 	if (ret)
 		return ret;
 

-- 
2.56.0.542.g3ef89b7020-goog

