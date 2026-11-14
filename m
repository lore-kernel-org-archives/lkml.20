Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636017;
	b=a5N9uLXq3NHhFm6z54jGZ2CEYaJtsEHFK6Ss6E5y1UEBMcIRlPK2e5b3FX03ghMreAGH
	 MkMmQxqMQqkasZNYLhNudP/2tZGxLdlseBy8xSYZycEAemmaCkl6A7mnfjEn77GOB4KkS
	 kwOCnZ0fmb/2Knx8D/TtEJssElIlyFIuttS1u+Cj2G2miOzmslSqxOWERn7DGwtzuoOHZ
	 ezWGWF0p0R1yMI8JocKA/NVtHz5m2U018SPLv41htl5g3NH3ti4X6z7h2gpyf38woVj/V
	 YbmWEs5sNbravdsidO+L/G5fHhqbevml5+Ct+Xe+R/vbYj2BF/TNm7DX4sMsYZCWxDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636017;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=OpOmixRiwcWOV6oet1pcrkpXrQVB14M4zfrm/VGzsgs=;
	b=2SfjEAEDJ4Qbe0LM8UqhM5xP0oFcSe1VCn6xNy6n9mEy59bEp4vRdE0wgEZlCGLMyi76
	 YAZnh++xSUV8zdD/PL6tS5tnk1f3G2ROg4ExpdAypNg9RrBFIOg4+t4bjau+llPJ1mqC1
	 UEdiZYg7p+BVFDuNgDCMFdFss3k87jQxIkIsuSvNVHLCK71Dl/bkH+E9rmKg+ZZn+Oxnz
	 3aJ4zAzzsYcjvPRkTXWYwu0hGUNeQ/68my5PigXBGNHdtu+QKqBDxCxxehFeBNkgGKRq/
	 TtdohEhA5HB2x2Txwj77tN444GpMxQkcxiMQUYNpj2TkQb/sDs1V8xCSJBGla9zVang==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXYm7JB9;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CB460A3822
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8CB460A3822
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QXYm7JB9
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36f6295304dso1472294eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636016; x=1795240816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OpOmixRiwcWOV6oet1pcrkpXrQVB14M4zfrm/VGzsgs=;
        b=QXYm7JB9+nyEKGUIWheLLk3QH9+4fBUUxvVazo3wAWbkaH92vceQlohwJjbCrBvr3M
         inssWaZ633HaD7z+CEAk+lyJQUxT8tEwKUebMAhC+EL7Qt2o77DyQ+KdF8i7s6F2NjnN
         mcJtyyN10WMVdPSfXHfGXrJUED5yJl0oNHuXbHSNcNFDamB8/sW/kAqn9t4lKoBF0uTC
         zLq+PoC0itnvxoyIDpnCEqnN3BwHxaz65rwmHtdEiznYhak73pgkXWjBGEUaCyIfTcAF
         xwaeU6zeUTOsXsT3juPOo7bVfFTAoSjzkdMCYOW3uQ5L4LOBgsjlEtOjHJ5HTR9lUcWm
         7StA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636016; x=1795240816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OpOmixRiwcWOV6oet1pcrkpXrQVB14M4zfrm/VGzsgs=;
        b=sfnX74dp/A54BclSThUkygwC8q2ZRrPMhg8zJnNybuoBBA4v5aCgfM1xLmMDe940OT
         5ydrh1EgIi3liufj0y6Ub2uSWJJ6sOrvOIT7ZbbwqOLzJsqu8W/EeOdR90HLp+lGqYo1
         nzMtRrhlm3NZ68qcktVh8GO2qUedH2iEErr/5HhVtVENZM7GGQ+0jdrZM1ZsCjq6De4i
         MlVlIoEdMbqwQj+/2ntlhRTPOCK3mrU8Ifj0GFAoiid+iIPouONVrHFj1Dntncxpgk9H
         J8zNjI2AdbijPKjSwL4d7GeyvwKOUcb6KNky+k4fVbdswFwycTMDCguuCtUQiBpUgsol
         m2Rw==
X-Forwarded-Encrypted: i=1; AL+hErGGQDNL/i9eBAvWcxtjfHFOyZnQvHADEVtnqDoCaHWv0KqCfjk8ldpyOie3g1AWL79VhTIPS+1SL/8WYN8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eAPd+D9imKj16N6TpkmFANdhCDaePhqk33crADqB/AlD8YlQa
	NRVn/3eQ+JN4teKCZtmpy9XRygRcQExTyxnnXurWnoFGVrblx8MwtVKY
X-Gm-Gg: AYBFou18EGtcpIiUlGfm/rKaY2IQhdvjZH0cA/7N3B9bJ/Yj8zZ+KLgiaOFqUWKM8V8
	dLgGJIAFZtnku8Qv2U77d66qsyQd3UmpMSit1rRHV8N7z6EtS+y7Tn3Ssfqgw1X0jqpL0miaBeF
	6XSQPDAVgxQgzj3ojrefiwlk3uegK23SsXyTrzGkKdOad2IoXcG3sLxW3lgRLLjmp0JsRYWVSqH
	gkO6VoJhnufnewt4lGYYSI8K+FlGFIYrHChpuxDbQmTC8M6KYVzBKpzdGJShD+ayqyfTqBoBEPx
	vGLcxBLYHkoim2pobbBPmkddToSRAMI43CkdUCcQ1RWxteRey3tti9gP8MtQsj5jU3y0TyI6SbM
	FFtOlSGVl56qDFQrFrnokdTg0NnXPtBJlbkPxbuUMQ5ip77jInqwRArWrh3v87iw1H7zkUCknVF
	dpukTkMziz/fWlSsPoRfWWNg9EV4XHijAfiM+y3YO0ZP7pOPSz5aSgJGk1fSmgvhdVAGPbpwxxD
	5h+jxLlYdccBAMtNhasN33i6xxG5wBo6hz0rkPR5HhAXoCuBefXPx1fB2t5mP+MXk3qW7xWGgJA
	fZt2uPqALZZO5pdAyJW4p6NprboJWlXz9Vz68b2gCBMj7vFBQm5mFNQcFxGJ+HqeNDfdCrXbrtc
	DjTobUS1lghYuQAhW
X-Received: by 2002:a05:701b:4301:b0:14f:4b01:40a1 with SMTP id a92af1059eb24-1b502fe374dmr4308208c88.0.1794636015748;
        Fri, 13 Nov 2026 22:00:15 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:15 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 22:00:00 -0800
Subject: [PATCH 10/12] HID: rmi: switch to scoped mutex guards
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
Message-Id: <20261113-hid-rmi-v1-10-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Manual mutex acquisition and release complicates error handling and
early exits.

Convert page mutex locking to automatic scope-based mutex guards.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index f1d52d55fe0d..ec0d18cb06f6 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -205,12 +205,12 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 	if (len > U16_MAX)
 		return -EINVAL;
 
-	mutex_lock(&data->page_mutex);
+	guard(mutex)(&data->page_mutex);
 
 	if (RMI_PAGE(addr) != data->page) {
 		ret = rmi_set_page(hdev, RMI_PAGE(addr));
-		if (ret < 0)
-			goto exit;
+		if (ret)
+			return ret;
 	}
 
 	for (retries = 5; retries > 0; retries--) {
@@ -227,7 +227,7 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 			dev_err(&hdev->dev,
 				"failed to write request output report (%d)\n",
 				ret);
-			goto exit;
+			break;
 		}
 
 		bytes_read = 0;
@@ -264,9 +264,7 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 		}
 	}
 
-exit:
 	clear_bit(RMI_READ_REQUEST_PENDING, &data->flags);
-	mutex_unlock(&data->page_mutex);
 	return ret;
 }
 
@@ -280,12 +278,12 @@ static int rmi_hid_write_block(struct rmi_transport_dev *xport, u16 addr,
 	if (len > data->output_report_size - 4 || len > U8_MAX)
 		return -EINVAL;
 
-	mutex_lock(&data->page_mutex);
+	guard(mutex)(&data->page_mutex);
 
 	if (RMI_PAGE(addr) != data->page) {
 		ret = rmi_set_page(hdev, RMI_PAGE(addr));
 		if (ret < 0)
-			goto exit;
+			return ret;
 	}
 
 	data->writeReport[0] = RMI_WRITE_REPORT_ID;
@@ -299,12 +297,10 @@ static int rmi_hid_write_block(struct rmi_transport_dev *xport, u16 addr,
 		dev_err(&hdev->dev,
 			"failed to write request output report (%d)\n",
 			ret);
-		goto exit;
+		return ret;
 	}
 
-exit:
-	mutex_unlock(&data->page_mutex);
-	return ret;
+	return 0;
 }
 
 static int rmi_reset_attn_mode(struct hid_device *hdev)
@@ -317,11 +313,11 @@ static int rmi_reset_attn_mode(struct hid_device *hdev)
 	if (ret)
 		return ret;
 
-	mutex_lock(&data->page_mutex);
-	ret = rmi_set_page(hdev, 0);
-	mutex_unlock(&data->page_mutex);
-	if (ret)
-		return ret;
+	scoped_guard(mutex, &data->page_mutex) {
+		ret = rmi_set_page(hdev, 0);
+		if (ret)
+			return ret;
+	}
 
 	if (test_bit(RMI_STARTED, &data->flags))
 		ret = rmi_dev->driver->reset_handler(rmi_dev);

-- 
2.56.0.679.gc527c65306-goog

