Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794636004;
	b=4dp++18YAix4JHlKqAjrktIBwYvkZ7SxaJPlMwQHUFOnnpdge7eDBPm0gNpYgUydE27L
	 Pf+tMgfPrR+7mR809ghB52uhSNP0nKNs6Yu+hRbqtvEbhCgSx3ebywEHWAVF7/oFRBINt
	 v7T87ZvY4+z7GlATV4ybstsEDSq35/pMsAEwtGIw8GOvKi+hy7A6HJZ9HlI35LbBy4pJm
	 /BFHdRQo8aFJFqhaA4yWLGj73Jn2ABun50lKTgtfqs/XRsRFGfw3ibNMxMHI/CEsfnroX
	 r4dkJZCZPxYOMyIdl22XdpkPwL0uZcszUwa7tkpwzX3PWPIJy6OD5smlo2IdXq7xj8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794636004;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=mgLVCzwEEWzs9CinX/+7QiADn4eqTPW4ogsrN1nMB7g=;
	b=W5tT6HrUiLad+u3FJm3UJY6REhv6KK7xtQ3+LrcQ0J9exDp/cbbOI8p/daoJBjIHxJ9t
	 Urv3Om3zGXjf10LyRC9v2WhfM4CJSHQTNd2b4hF71JYjkEeFAAl+ZEmzPTw2atsE3MDNE
	 Yq08gJWsrMY/JKuIKMdDbDvEuGkMPG/mkAL2XeYrh8c4xgDsQmIZRn6wr7gjpaYRKzAsL
	 ckGZoSKgFU14IZZ5JLBstjbqTdSLdruwRBwKs5XcsdGYdbCYhgEWjeIb/ko3o73Fv5VFv
	 FTinR1c30aFbEhK7Bgh5bUKgYU/KM9lQqBEQyHSdPl29GQZLhgNZADRKHR9wp2wTJow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSrzRYDo;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A721606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:00:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A721606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pSrzRYDo
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso908624c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:00:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794636002; x=1795240802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mgLVCzwEEWzs9CinX/+7QiADn4eqTPW4ogsrN1nMB7g=;
        b=pSrzRYDowsSSYc1//w68QUfa2cBuROaP0oEKgpP7Y57cArUc6zvkzvkyZqwMuEv9fA
         AZ/sg0KYTwtvwIIx0zNG+HddOk3r1XaXVVuEvI5g16eLUZbvtXrC7e9noqjvtpYWi9+8
         43QXMP+y7OOZNLBTUp5ZD8Of5l5KPUqFe6HSn5Y+/nvJP9FHhZEafEnWbKbbtZkiENOt
         jEsHVOPwodtfYqpNAFgmBb+HJdDFD3NqImpWhDhWnlSUkaNgeP8SlInhCGEbsX6OOOf7
         ZFa29cdHdgkSJ7VOAQot6bb10atZtCzrmNW1Kz+l/yYfV7+N8ycHzWoQ44b12aptUjGM
         stnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794636002; x=1795240802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mgLVCzwEEWzs9CinX/+7QiADn4eqTPW4ogsrN1nMB7g=;
        b=1xfz6o2/ByosQULcwBPgFr+yJMMOefTyjvbydvccEL2/VANq677VVCyvephRMnuwtw
         LglVDGN7RBsLEwvLzgkQBIZJiILaQZIrTpJDjk7izQk9nxfIEOQiR1cQ/5URTjVFGAQe
         mypHIzXfjJubbW4/caGxF456ppe9MYJZrU1+8W4NIFUz++rWm6kG5wBSYwF1A32XK280
         3mKfynZPpq4bi8toolR2d9En4nR7KATM9f7Rgj2Ru2fsePF/Coaa7Nq/RZ4pWm7UfBZq
         YKCIxAMJ0LXrO4pifMG7iuJvVkKVt8i5DMyKfkj/v/atnFeCUuLcwXjej4pMNXnOvY8z
         S9Mg==
X-Forwarded-Encrypted: i=1; AL+hErEQV2aAC1rZPU4djADnPXrNDRkXBy1aS4PsXpaJuWySTl5P4b8D8XG7HVVBcmqqaC8gSSgQft7mjhvPiWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z99UB5kzCKtzPu4wGLgLr+MshmZaTk9J1KM2W7WReHet1GCO9e6
	RHxt3eCyCTulygxbCoFi8tl//44F008jyFUSOegKPjV0Om1KZ6HWnbE3
X-Gm-Gg: AYBFou13A8h4aB8SAl20L/FeyRTBNfe9QyFwPJxJlQSTqL10mPysfIRFDfkuzETWmqv
	Jktl3PaEtljwgXMcksd9E2F8hqf386GaWDtKojuKawGgFQTN2F0/l/e4LR+7P6q1+A5t3T0n0jc
	xrPVn9E7+qIc+ZYeKWgakgFj8e4ijcpDUSfgFgEX+PydMUwM1nXsXZFSjlmuhJkzcGm4onNAuTr
	fW82uWXidiRY1OZ2zK2lQJCGi3KzDdI394AXiuX813FyWn/zCFxbeu0iXi4hpuoJF3vWJeYnpAv
	TUH+joh6avY5N9B/v5nRFaGN+wEMimUDlZshXPUd6VXyAYHE6txlpALZpYZMH51czEAzYm3wVpf
	4orIwNZg4Yvp3lNEcxe2liP7I59tekrzNxOvLama3/QQI0EAA3JAWBq/0k/Xuipgbf/E8Z/ngCB
	vkMr6yCRJanFKF0m7Raq2pJhqrOa3qe4OvXwsikxA/Jb0eMvQLL+zwC+fbCuoq6TpMA5jkAc+gm
	dIGCS/UUdKlaEiBis1CJ8qBLk5v36yubWPDWeQ7ifzJoIA5DhoUXH8ee/6LMo6YYP9OKI/Y0y1H
	pQiQ859BkQahplFhU5fjUwNoGMT58PdGcDiMOcLCB7HddYPI6GYFO/Un2/9JI83piAOb2+bgzoC
	7FCYwBD+tN3bvBY7S
X-Received: by 2002:a05:701b:4551:20b0:14e:d0ba:75af with SMTP id a92af1059eb24-1b50308a20bmr4240827c88.6.1794636002333;
        Fri, 13 Nov 2026 22:00:02 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:560:7267:5908:e9a5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm11323590c88.13.2026.11.13.22.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:00:01 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Fri, 13 Nov 2026 21:59:51 -0800
Subject: [PATCH 01/12] HID: rmi: return error on short output report writes
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
Message-Id: <20261113-hid-rmi-v1-1-afc43d97d766@gmail.com>
References: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
In-Reply-To: <20261113-hid-rmi-v1-0-afc43d97d766@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Andrew Duggan <aduggan@synaptics.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

HID output report transfers return the byte count transferred on
success, allowing short writes to either be ignored or propagate
positive byte counts as errors to callers expecting 0 or a negative
errno.

Treat short transfers as -EIO errors and return 0 when the full output
report is written.

Fixes: 9fb6bf02e3ad ("HID: rmi: introduce RMI driver for Synaptics touchpads")
Fixes: dd8df28459dc ("HID: rmi: Add functions for writing to registers")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-rmi.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/hid-rmi.c b/drivers/hid/hid-rmi.c
index 20dda1992f98..cacf81ed56a7 100644
--- a/drivers/hid/hid-rmi.c
+++ b/drivers/hid/hid-rmi.c
@@ -130,7 +130,7 @@ static int rmi_set_page(struct hid_device *hdev, u8 page)
 
 	retval = rmi_write_report(hdev, data->writeReport,
 			data->output_report_size);
-	if (retval != data->output_report_size) {
+	if (retval) {
 		dev_err(&hdev->dev,
 			"%s: set page failed: %d.", __func__, retval);
 		return retval;
@@ -182,7 +182,13 @@ static int rmi_write_report(struct hid_device *hdev, u8 *report, int len)
 		return ret;
 	}
 
-	return ret;
+	if (ret != len) {
+		dev_err(&hdev->dev, "short write to hid device (%d < %d)\n",
+			ret, len);
+		return -EIO;
+	}
+
+	return 0;
 }
 
 static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
@@ -216,7 +222,7 @@ static int rmi_hid_read_block(struct rmi_transport_dev *xport, u16 addr,
 
 		ret = rmi_write_report(hdev, data->writeReport,
 						data->output_report_size);
-		if (ret != data->output_report_size) {
+		if (ret) {
 			dev_err(&hdev->dev,
 				"failed to write request output report (%d)\n",
 				ret);
@@ -300,13 +306,12 @@ static int rmi_hid_write_block(struct rmi_transport_dev *xport, u16 addr,
 
 	ret = rmi_write_report(hdev, data->writeReport,
 					data->output_report_size);
-	if (ret < 0) {
+	if (ret) {
 		dev_err(&hdev->dev,
 			"failed to write request output report (%d)\n",
 			ret);
 		goto exit;
 	}
-	ret = 0;
 
 exit:
 	mutex_unlock(&data->page_mutex);

-- 
2.56.0.679.gc527c65306-goog

