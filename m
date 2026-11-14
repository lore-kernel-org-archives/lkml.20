Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636006;
	b=iN5w1xGBI6D17QTz0NvpC50rWCb0TMFNaiUNEPLvKZNHtplp8q/wEeb4mlwj5tpPpKi2
	 gYZ3BC8jD27sUxEggs9D8FHc6Ksrg5vFxcI6jd6EwYgP/4TQSSFjgNpzGkuLfGzLyz9j8
	 5ftMBDegNdaNmNlAleBCt/uYZTroxQgNJsWsY25uziHEGcsWKVrGoC836zS0Je72jsYur
	 p5gCEVFWZWKNZsOBDjYHbP+BGUOFXvgPHzEeWcWcPmz1kj4wpx/d4L+V8msTRh060NRSW
	 7e+IYIuKx9PLB9pvj9OfQ71Dn4GU5MHzXdCUWI1a5uhn/q65/a/r3Vs7FebDwglfiDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=9t8zd5u+23Czp1q8gEHFNS23HaZ00gcM6f8XnrndKQI=;
	b=WJ+D8MFv7M6GASPNuCY6G6UUtMPTxR/8xP3DTeWVmigJRhkSfM/QMb7Du2utaliEOHR8
	 TI011dbbOGI2cuCPg9KCxECmx5PKVHrtpE96vIzAbFA6VKuUajUl5IUMDAu5ML7iNM0L7
	 hShugPeq2aX6v9/VVU4mnj1ZXGIMLcNdQ3wZEontVMsjVLb6rcbrlBTLUMtTk/5ZSWtI2
	 Ri516hOycu1CyIv0bbW8Ritqsm9NSATJW/7T5Ra7ogE1yofQTxo+bMWI1mZCV2A1TYRnZ
	 UNTnAm8DHvGR9LeWVSY1XS1WgK5UgG3b3FqhhmX3GBezqZ0X7X8b0tRCLlXd25keDUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OpznC0yu;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A704606A89B
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A704606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OpznC0yu
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so5024245eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636005; x=1795240805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9t8zd5u+23Czp1q8gEHFNS23HaZ00gcM6f8XnrndKQI=;
        b=OpznC0yuMLkIIxM7Et1GcC/V9j+9B76vebUmfOjYRSX/DkeoHoGfvW2yTJ0LkxY3Zo
         ODBOJBnSo4KLmTwf5rBfqMCUx9TnUqqvHsCl6tY6YIb57ZR3EzQm3JkLytUsyo4Qdbw6
         HWoTvTksSWubQZcnUUlQNp7MlLpAhMajS4okSGsnBY3fO+VA+7U0M9Nvl7096J85ZhbM
         WpKmhmwbBYJoT2HUfxgaXUar4corIWgOyOF7tojotj7C1tLXu8X1mMiylwnn43UdB0oB
         QirKqy4FvSd6kx8SL4iTKLS1RtN8Qo0jiGc71TOKl94rIyG8j4H8QAGReFoW/5OSEnUH
         iLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636006; x=1795240806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9t8zd5u+23Czp1q8gEHFNS23HaZ00gcM6f8XnrndKQI=;
        b=RBbaajVTX0poOHa2+iVV9p8tYkJMGmLCaeRseBA7djbeNq5Pf8RJibMrZ3N6tS0Oq7
         E55j46mEcReiDW7/Awvu8Hba1pOoxXErP3mxtWXhFDi0qCx5SaBZsFftpRUKWjRwxm2c
         saa2xjWiQpCm8RJzGOQoQyA4pFKOHKTbkym8a8QDu/CVEBUmFIuEc+JjULu68kywag9W
         ordMK28lteDjKgtZizdMWkm/AsKyhrGee20lHczWbJsqhUL9v5OJADMzGqAlCamTfgX2
         DV+4Vfl5LSGJdQaIAT/oSgqu+Y03y3hDhSk5lF+5TDj54so6JP0JyTZZPao3TGDuqM+P
         mDKg==
X-Forwarded-Encrypted: i=1; AL+hErG5Bxs68Y90xjWBScfQfN3p5uh04KD5hRG8+9OBqrQ0JjX1Tvsesm0mwQiuIxeM8UMTjrGo3SWyDHpLBi4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RK5SP9Ok7Meoh6NyguR+g+PO4ycBAM7FxQhzNumMFpkOO3a8U
	K06J2tLv+dvkXIwX5OatEGzq1v7Fz9/mlJC1+bPKQ+XoURAwPEdBjjNA
X-Gm-Gg: AYBFou3KmF83y5aYGq0PEVkCeCQ3BMo+0co3njijti9rwKKx0SqM/5Cn7Xzbv19/7lZ
	UuN7HgS18v6mJPULnP1iemwD1FQZmk4/WMkeGrG4+qFFrXfUKk+oGzbcbg5RfdMY+Zu0v6PhVrm
	rZ9qCWJkkK+wjKo+8U6EvI1rwTfChcxI6ru+dpNuVNzfY/DYrDJzMdHhIkE734QKKhREVo5AxhU
	qLx8YlfvwUTeQLVHuswTVfNgz7JMeWYe2Dk4+hUmPPpgM//H59hnCeC/NLScHbSzuITWOs1X68W
	0Jiati5DDbsay0DyKMkvXnyBovqVEA1M7Q+/QurfnyLJ9hf8UBfpWP4BvnPpZlE6EdHiuUBQJbC
	WF3s3/W7+cyH8OM6+KERQY2vwUG16HiJpiMG4iQ+tV4UcC51a5gBln30i3a+LZ/Nwc/rZIa4qpo
	tM5ZQAWVEw8S2QuGUQk5B1lxGXWYYRhyTF5cnTv9xEbt4IH1e70gYvFhKETDOcli9DLmgw8Nx45
	iOAQTkeVHJRpT6T7m8UyfrdTbg4pEBPDTIcgaUOBlDwW0+OTuu8wagM2f1RqpXM/1+0HaO9suv6
	rLLPrBToFX3f0VFPALis1RtEqZrscncJxJfa8rkmSXCS6TxMA1CCKOE0glV5ZxXan1WkWd8Y6Xh
	0M7pe1Z5ifszGMTct
X-Received: by 2002:a05:701b:4194:20b0:1b3:aee5:20c5 with SMTP id a92af1059eb24-1b5030fbe7emr5225013c88.22.1794636005390;
        Fri, 13 Nov 2026 22:00:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:04 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:53 -0800
Subject: [PATCH 03/12] HID: rmi: validate read data report and protocol
 transfer bounds
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
Message-Id: <20261113-hid-rmi-v1-3-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

During probe the input report buffer is sized from the attention report
rather than the read data report that uses it, block read and write
requests do not check that lengths fit within the 16-bit and 8-bit
protocol length fields, write length validation occurs only after
switching pages, and incoming read data events do not verify that the
received report is large enough to hold the advertised payload count.

Size the input report buffer from the read data report during probe,
validate protocol and buffer length bounds upfront in block read and
write transfers, and reject malformed or truncated read data reports
with -EPROTO instead of clamping their length.

Fixes: 9fb6bf02e3ad ("HID: rmi: introduce RMI driver for Synaptics touchpads")
Fixes: dd8df28459dc ("HID: rmi: Add functions for writing to registers")
Fixes: 4956993bb3be ("HID: rmi: fix OOB access with undersized RMI reports")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 65 +++++++++++++++++++++++++--------------------------
 1 file changed, 32 insertions(+), 33 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 41676685ce28..d9181fd66c5c 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -197,10 +197,13 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 	struct rmi_data *data = container_of(xport, struct rmi_data, xport);
 	struct hid_device *hdev = data->hdev;
 	int ret;
-	int bytes_read;
-	int bytes_needed;
 	int retries;
-	int read_input_count;
+	size_t bytes_read;
+	size_t bytes_needed;
+	size_t read_input_count;
+
+	if (len > U16_MAX)
+		return -EINVAL;
 
 	mutex_lock(&data->page_mutex);
 
@@ -241,23 +244,14 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 				break;
 			}
 
-			read_input_count = min_t(int, data->readReport[1],
-						 data->input_report_size - 2);
-			if (!read_input_count) {
-				/*
-				 * A zero length reply advances neither
-				 * bytes_read nor bytes_needed, and because a
-				 * reply did arrive the wait above does not
-				 * time out either, so a device answering 0
-				 * forever would spin here indefinitely with
-				 * page_mutex held.
-				 */
-				hid_warn(hdev, "%s: zero-length read reply\n",
-					 __func__);
+			read_input_count = data->readReport[1];
+			if (read_input_count == 0 ||
+			    read_input_count > data->input_report_size - 2) {
 				clear_bit(RMI_READ_DATA_PENDING, &data->flags);
-				ret = -EIO;
+				ret = -EPROTO;
 				break;
 			}
+
 			memcpy(buf + bytes_read, &data->readReport[2],
 				min(read_input_count, bytes_needed));
 
@@ -285,6 +279,9 @@ static int rmi_hid_write_block(struct rmi_transport_dev *xport, u16 addr,
 	struct hid_device *hdev = data->hdev;
 	int ret;
 
+	if (len > data->output_report_size - 4 || len > U8_MAX)
+		return -EINVAL;
+
 	mutex_lock(&data->page_mutex);
 
 	if (RMI_PAGE(addr) != data->page) {
@@ -293,11 +290,6 @@ static int rmi_hid_write_block(struct rmi_transport_dev *xport, u16 addr,
 			goto exit;
 	}
 
-	if (len + 4 > data->output_report_size) {
-		ret = -EINVAL;
-		goto exit;
-	}
-
 	data->writeReport[0] = RMI_WRITE_REPORT_ID;
 	data->writeReport[1] = len;
 	data->writeReport[2] = addr & 0xFF;
@@ -305,7 +297,7 @@ static int rmi_hid_write_block(struct rmi_transport_dev *xport, u16 addr,
 	memcpy(&data->writeReport[4], buf, len);
 
 	ret = rmi_write_report(hdev, data->writeReport,
-					data->output_report_size);
+			       data->output_report_size);
 	if (ret) {
 		dev_err(&hdev->dev,
 			"failed to write request output report (%d)\n",
@@ -388,13 +380,19 @@ static int rmi_input_event(struct hid_device *hdev, u8 *data, int size)
 static int rmi_read_data_event(struct hid_device *hdev, u8 *data, int size)
 {
 	struct rmi_data *hdata = hid_get_drvdata(hdev);
+	size_t copy_size;
 
 	if (!test_bit(RMI_READ_REQUEST_PENDING, &hdata->flags)) {
 		hid_dbg(hdev, "no read request pending\n");
 		return 0;
 	}
 
-	memcpy(hdata->readReport, data, min((u32)size, hdata->input_report_size));
+	copy_size = min_t(size_t, size, hdata->input_report_size);
+	if (copy_size < 3 || data[1] == 0 || data[1] > copy_size - 2)
+		hdata->readReport[1] = 0;
+	else
+		memcpy(hdata->readReport, data, copy_size);
+
 	set_bit(RMI_READ_DATA_PENDING, &hdata->flags);
 	wake_up(&hdata->wait);
 
@@ -722,6 +720,12 @@ static int rmi_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		goto start;
 	}
 
+	if (!rmi_check_valid_report_id(hdev, HID_INPUT_REPORT,
+				       RMI_READ_DATA_REPORT_ID, &input_report)) {
+		hid_dbg(hdev, "device does not have read data input report\n");
+		goto start;
+	}
+
 	data->input_report_size = hid_report_len(input_report);
 
 	if (!rmi_check_valid_report_id(hdev, HID_OUTPUT_REPORT,
@@ -733,15 +737,10 @@ static int rmi_probe(struct hid_device *hdev, const struct hid_device_id *id)
 
 	data->output_report_size = hid_report_len(output_report);
 
-	/*
-	 * The write reports built by this driver occupy 6 bytes and the read
-	 * handshake looks at the first 3 bytes of an input report, so refuse
-	 * to drive a device whose reports cannot hold them.
-	 */
-	if (data->output_report_size < 6 || data->input_report_size < 3) {
-		hid_err(hdev, "rmi reports too small (out=%u in=%u)\n",
-			data->output_report_size, data->input_report_size);
-		goto start;
+	if (data->input_report_size < 3 || data->output_report_size < 6) {
+		hid_err(hdev, "invalid report sizes (in %u, out %u)\n",
+			data->input_report_size, data->output_report_size);
+		return -EINVAL;
 	}
 
 	data->device_flags |= RMI_DEVICE;

-- 
2.56.0.679.gc527c65306-goog

