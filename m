Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636019;
	b=5QmWIXdTz2tWY5mce1YL7JoOjlNtxz0GomSv0v0rVoXIrRZnihy6M1qDu5CTJMtUW7Tb
	 /9KfeOMWIFcm+EFNKZK6gd0JLNrOTHeFsxwrNwDM0i4e4APnDyhwV59yKxQMGDdAtBIIv
	 QCZEvpcmMCwokAdJaukICVy/+xy61u3TJ1V4MhQIwiU+1g5YdHz3VutIbbT0RjK7cFAPl
	 oogzFexo7yYwJkUT9LURBVCbrkR04oUCzjX+NEotstY3iHB6pKHtSg6Kl/OtCP1LaK5EZ
	 BKMfLjICYVwAbQMblo36TYd5ZhuKHelGPKVYkDfHdDFNcP+o6B5oPZ9SZBt+BCz40nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636019;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=dlG+khQPd25/hUUsJ/zyks0f3vmJYhvo8pnfsQXvBJY=;
	b=dnVV+Jka0my8aWZB6MbjiP+nd79kTd66MAEqbSIvEgGBrEVlGyjokC8mIoBoAbcBFFLY
	 HYGMMiRSv1QfYGCBgx+nn6eKQRw5L6amgtylzgUbq3GdJxQ9kV1f9keYJIyjLoM/dgbK3
	 AHI9ebX4HtHmBUDREp6IOGfcXzXRV5HNmORKqCtT6r9pqDjfWSTuX+5QXzEgq/eKz64DD
	 4Z0TKLemnpwLzLLUWYecOaowY0KGben8NPIWgC0Pazw5eZhkasu7sudcrxBti3YWd9Zxd
	 Clryjg6MR1/0txsuTYfNZEN4MCgTexfTJhCwhoJcdFFWTPS0csaoTnUGQVFu0L5eciA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3cWz6Zc;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5689B60A383E
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5689B60A383E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h3cWz6Zc
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae58d17cd9so1167273c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636017; x=1795240817; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dlG+khQPd25/hUUsJ/zyks0f3vmJYhvo8pnfsQXvBJY=;
        b=h3cWz6Zc2vzDK4xom1UDH8Q2LcF+ZIqJvem3okgO88EpF/LrswJNAGpcj48vlHNOK5
         Fe4JDzWY99iQNUd+I1ZZqUQgElSQcmu0JTWPoUHkPrt7+5WnD6VIptDyZdZGS1stKyBk
         ZJcb2JT9Ta8Men30ib+y+O6/KDgwoDl9w3yZRay5Y1fJe0cSz3c/+bCIIrQUqqGqkKbH
         6w7PbvSRYZkzsKUHaGnM7NIlUPDIVE/sexWIFHkPnZuVl2XvtbXqhLdt7SQfwMGYNzan
         NZSvMBSZQPwRLzWPFcOO7J4lrdYGMqOY9u75tb3rJ38uUfIAdp+WTZ72rlr40h+af6HV
         0CsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636017; x=1795240817;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dlG+khQPd25/hUUsJ/zyks0f3vmJYhvo8pnfsQXvBJY=;
        b=MECr0jpV8tH/CZ3NVVtYrCayXgQFiqH/Y6B8by1NZ1iGoUAgPL+LGlkiNgC8LtUCmQ
         m6wSrtQJUwueyYJ5bffWNEDS3hAZ77fWa8UDFf5SNYrj+EjM/sxUz2GN5WUXX91LisI5
         9N0Cs1GOBT5lwKr2av39Z/qXFYWIx7YXS1rpZ4frfuwL4ydFGUmmUj17OsyAr7ueEQ9r
         p5JjdD6lhxirKzy+E08Oge0utRZcrLAeK4hGfo67jbiMXUV8B8n2C1IMyzRzCHP/NRyT
         abElthmFebdVZLGG8KHa1u9WmhKGDVuv7WmFB1aDzcYHQxsjEwvSLwe3ycFYlNvU+uJl
         fCSg==
X-Forwarded-Encrypted: i=1; AL+hErGS73KdEeNpYqMHt4gqTYXfLovC2RkPbMsSNUyPtLUvyxOYIeYkgLQy0fzRX/PhAJdSrvkH3ZrsQVyfCV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z96ZQpi3P9WhaJYf29UxeVc9jaYzOp29JhPy79QF21WQBMMzG+9
	PKS22nwzX6ZMsNEmsYDmPhUr+505dl9ZnCvVLWjcI2zR+9Wf/RtE11TO
X-Gm-Gg: AYBFou0QM7PFGJisiqawxT3Hozxz4/6qf1w8vb/WtIN2Zrp7R1B924Xntw8SodoXi4g
	mPXnvRAgMsKsr7AIEf6tp7pT2aif2zqtitnR1ZFku3yaZmFZNq9TeCWuYmDb9WgknNmogqBDM1J
	spZdOKD18l9FDQ0uyoxfFbfr+FQXj4TtdZKoip/9BdQNypzbPnaBbCoWh2HdfFHNhB1BS4JExkI
	jQY0/6wz4E1W9Y85SACqzZAslB6OJBava9313Efj8vAKMOULWJxmLGaxbyM7YhVPJy4PUehbB89
	E/p1dCHiu0nvdQeygidT94Mi+dFlmmfLbMVe63zgsDjVkcHHrDH7ZQwmhdv9DfTCsAgkbsqjTvU
	Wl1dDeEg5WjdsLFDLYm1G29EN86qQwVfBwzFKK3ZVfaTVT3wrRl3lj6dPWNYOMY+O6ViyRovLIm
	qGkvYeLP0DV9PYMIvrQBEWtZ18j1Gye/efd+8Hg+dUSUlrgglLu4OyNPowgBPpqVE5AuENoOvzs
	mlN1RitoQwbFNNYVJwLzz/pPb2RjVz/+SMJe2WmJGn5imG5Lz/pIvtRCIgKVI716haOZaXpltDK
	dqX0qTRgHxhwwbcWJXO6E+dnU95NmPLKsChMAi5zf3rvDrg1J0dsll43Nv8Tv0EbZaGgXfZDZ5J
	PASV/H5AUZtgZuWGkoAB2EzhAdvML7rVOGO/wlA==
X-Received: by 2002:a05:7022:3a87:b0:1b2:5884:a020 with SMTP id a92af1059eb24-1b50302ac09mr4765175c88.6.1794636017116;
        Fri, 13 Nov 2026 22:00:17 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:16 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 22:00:01 -0800
Subject: [PATCH 11/12] HID: rmi: remove dead code and reorder report write
 helper
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
Message-Id: <20261113-hid-rmi-v1-11-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

Leftover unused definitions, unreachable control flow, and an
unnecessary forward declaration clutter the driver.

Drop the dead code, remove the redundant pointer cast, and move the
report write helper ahead of its callers to eliminate its forward
declaration.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 67 +++++++++++++++++++++------------------------------
 1 file changed, 28 insertions(+), 39 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index ec0d18cb06f6..d5961d408e72 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -39,13 +39,6 @@
 #define RMI_DEVICE_HAS_PHYS_BUTTONS	BIT(1)
 #define RMI_DEVICE_OUTPUT_SET_REPORT	BIT(2)
 
-/*
- * retrieve the ctrl registers
- * the ctrl register has a size of 20 but a fw bug split it into 16 + 4,
- * and there is no way to know if the first 20 bytes are here or not.
- * We use only the first 12 bytes, so get only them.
- */
-#define RMI_F11_CTRL_REG_COUNT		12
 
 enum rmi_mode_type {
 	RMI_MODE_OFF			= 0,
@@ -104,7 +97,34 @@ struct rmi_data {
 
 #define RMI_PAGE(addr) (((addr) >> 8) & 0xff)
 
-static int rmi_write_report(struct hid_device *hdev, u8 *report, int len);
+static int rmi_write_report(struct hid_device *hdev, u8 *report, int len)
+{
+	struct rmi_data *data = hid_get_drvdata(hdev);
+	int ret;
+
+	if (data->device_flags & RMI_DEVICE_OUTPUT_SET_REPORT) {
+		/*
+		 * Talk to device by using SET_REPORT requests instead.
+		 */
+		ret = hid_hw_raw_request(hdev, report[0], report,
+				len, HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
+	} else {
+		ret = hid_hw_output_report(hdev, report, len);
+	}
+
+	if (ret < 0) {
+		dev_err(&hdev->dev, "failed to write hid report (%d)\n", ret);
+		return ret;
+	}
+
+	if (ret != len) {
+		dev_err(&hdev->dev, "short write to hid device (%d < %d)\n",
+			ret, len);
+		return -EIO;
+	}
+
+	return 0;
+}
 
 /**
  * rmi_set_page - Set RMI page
@@ -162,35 +182,6 @@ static int rmi_set_mode(struct hid_device *hdev, u8 mode)
 	return 0;
 }
 
-static int rmi_write_report(struct hid_device *hdev, u8 *report, int len)
-{
-	struct rmi_data *data = hid_get_drvdata(hdev);
-	int ret;
-
-	if (data->device_flags & RMI_DEVICE_OUTPUT_SET_REPORT) {
-		/*
-		 * Talk to device by using SET_REPORT requests instead.
-		 */
-		ret = hid_hw_raw_request(hdev, report[0], report,
-				len, HID_OUTPUT_REPORT, HID_REQ_SET_REPORT);
-	} else {
-		ret = hid_hw_output_report(hdev, (void *)report, len);
-	}
-
-	if (ret < 0) {
-		dev_err(&hdev->dev, "failed to write hid report (%d)\n", ret);
-		return ret;
-	}
-
-	if (ret != len) {
-		dev_err(&hdev->dev, "short write to hid device (%d < %d)\n",
-			ret, len);
-		return -EIO;
-	}
-
-	return 0;
-}
-
 static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 		void *buf, size_t len)
 {
@@ -412,8 +403,6 @@ static int rmi_raw_event(struct hid_device *hdev,
 	default:
 		return 1;
 	}
-
-	return 0;
 }
 
 static int rmi_event(struct hid_device *hdev, struct hid_field *field,

-- 
2.56.0.679.gc527c65306-goog

