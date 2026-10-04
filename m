Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03B02F7445
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 11:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791111847; cv=none; b=bx0KcQpcAv/J81yMVV71Z7rJyVgKr5rQNmiO0Vtt2/j0eCvWPs2mPgxGn1o9B5iCHEJDGH8MZwHmAS6cTOCJwpT9a/6IOAUpQSPk44O7AdEuFguUfnfbAS0Hvr2D7Lqy3sNBl3MozPVUW8DmH3TWMfui3Mb9Lvxd9Nz0Q02F1Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791111847; c=relaxed/simple;
	bh=j+Vpw6E6tAEgRUW1m5cAGXI5KzWwrgL+mCu2hj6Mnz8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NbiPyx9Y8tSFqI/sdRsI5A3PCeweVctdLiW8x1VUva/3SU8fQDYfKrMo1BXLn9jYZbnHKc4C8uDjEVJbCvnJpMW/KmeAowR5lGZVXG0WXhhjIEMZm+Y0BAjwvd/o7pw+FZg9A75z4ShDmKGjiluhUdDGvt9Gxrs85jgkqiV0PKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0uLQpgt; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0uLQpgt"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-351297d9de8so217491eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 04:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791111845; x=1791716645; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XSFrkQBUK6qKBawjNwaZ4kqaH3MbOx2NwvrnRbSvr3U=;
        b=f0uLQpgtuFXvZmvRYz1H+VRIiuwPt/Eygx+S4E3l2P08Uk5cYFFrBC3oCgQcSp9yhz
         1T26JSGRRvu4nXJh2exUQiyfdUkASHfltYmMehia7r/uu+lXXF41mhH4pYAlxj18mD+H
         M1fZibLyfh3TMPxzxEiTwwbNqzW1fwVsV46e3egyAmGzdhGA1pZP9i0to1ZQMv9UJCDU
         4gb8Wu8FDsfjPIIMfqCRZMSrox4k2N5CLl+OYgd65BCj4vCA98tsq+kA9PhTOKhXPvqY
         BEGO2eLM9wciKAc5esstZ6j0VKnrKqa97o1TqFyP+JBlsiujSoYO6LJVjb6lUjRNLulH
         ug4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791111845; x=1791716645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XSFrkQBUK6qKBawjNwaZ4kqaH3MbOx2NwvrnRbSvr3U=;
        b=CQaqKjIAF1TYL674L9fQLMHDdeOLLC7IG16d8qjEKsCWW08gmX2N/iaQFZzIG2enFp
         ntVTAp110A33GSd87JOAVzxDAVzkhJxwEYHzyQLq5IDiTo3cD1ZIcX0obbnpEZPuCJLS
         nOku0u+36mkzllMWf/WGS5WdVtV1C/t++hr9BDyTUsNhH3mJ++wU/M4zD8nDpvyWfWJ0
         CllKoLyQ6RMCnU2xgqq503Argp6zQjiaquUAmcdsUVmOU8sqG3kmqiDrteKOBdzPefjc
         SEQEBhGHAIlXjRk+a8q+RmsD+OuIDJq3HMOQMXA1VukFRV4QNcZ1nmh++epsNxQDF3F/
         hlWw==
X-Forwarded-Encrypted: i=1; AKwUvByjeEbc30eSl23kWmEZNGrpNJ6FATrVRxxo68q4+NNcxQbnCfxTQuTM6KEojerxEUFmk3XyiFc4F2qPUD4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0GAPvxcckil14R6JhhHZUiDJvrIzLlP24aNlgRhPiop3BbSjG
	s0d7bx7sh4gW6M4fgWDUwKwGrysc98i3zvEdOgNC9R1NiZrOMw9BTm7NcB96Mw==
X-Gm-Gg: AYBFou2/8TCYMZnMtIivcIznallovNjTjQjB5RFjiFmjzbYc5HziqicqaicKBrK8zw5
	Vwau6XPde7/LL/S/Q9hB3CKwN+jySF73JPHnzMqJgUXBPfjCY67RV42LUgr/maqjscASe2IMgm2
	zR34nfYhsFDvye3DnxEOYIunN/NXnpnrlMahDkQDDT8KMFO8JnqI0N99STiTg1Tql6nKcRYmAAk
	4IbAztptMlHk2yz69r3K99zd8BZ+A3EZG7cBYXVqXxhJEPZX0sXTrcqjBuMTrvfczvs7Ng78NFa
	qquh9MK3R1akYIoOB0Wg3E7A0VJUA+j8uI2QV6VgtE0Ozr+dkK6v5BpszScdRi9GK4r9z6hO4ca
	HdFRVV3vJ3mQB6Dv6gWcvwlHKziFhYG3tY5kx5eKy5fIuhsC0XTovlRv67oRo7jvTMLqJKQOoYo
	VdwTuK4bUpNDvN8fi9EXPA1RDDKxuDwPIH4Z0Phm7EzcWnE2zJAbTc+GkDFkrmoCf/vX71D6ECv
	BYYRzssJBQKl3VNqvM7aFwBpyJmgQczbveJbA==
X-Received: by 2002:a05:693c:8087:b0:351:dbc:b663 with SMTP id 5a478bee46e88-3510dbcccfbmr6861823eec.31.1791111844387;
        Sun, 04 Oct 2026 04:04:04 -0700 (PDT)
Received: from chitransh.. ([2401:4900:c94b:d76d:7790:8565:8a42:7f99])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35127021d1esm4582590eec.4.2026.10.04.04.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 04:04:03 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
Subject: [PATCH] platform/x86: dell-uart-backlight: recover from stray EC response byte
Date: Sun,  4 Oct 2026 16:33:33 +0530
Message-ID: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

On some Dell AIO machines the EC occasionally inserts a spurious byte
after the cmd-echo in UART backlight response frames. A get-brightness
reply "04 0c 0a e5" arrives as "04 0c 0d 0a e5". The length field still
reflects the original frame size, so the parser consumes the stray byte
as payload and mistakes the real payload for the checksum, returning
-EIO.

Handle this in dell_uart_bl_receive(): on the first checksum failure for
a frame longer than the minimum size, drop the byte at the first payload
offset, shift the rest down by one, read one more byte as the new
checksum, and re-validate.  Limit this single-byte resync to once per
command via a resync_used flag cleared at the start of each transaction.
A second mismatch is still a hard error.

Well-formed replies pass on the first check and never enter the recovery
path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 92 +++++++++++++------
 1 file changed, 62 insertions(+), 30 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..068b91c21bf4 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -51,7 +51,7 @@
 #define MAX_RESP_LEN			80
 
 struct dell_uart_backlight {
-	struct mutex mutex;
+	struct mutex mutex; /* Protects command + response state below */
 	wait_queue_head_t wait_queue;
 	struct device *dev;
 	struct backlight_device *bl;
@@ -60,6 +60,7 @@ struct dell_uart_backlight {
 	u8 resp_len;
 	u8 resp_max_len;
 	u8 pending_cmd;
+	bool resync_used;
 	int status;
 	int power;
 };
@@ -91,6 +92,7 @@ static int dell_uart_bl_command(struct dell_uart_backlight *dell_bl,
 	dell_bl->resp_len = -1; /* Invalid / unset */
 	dell_bl->resp_max_len = resp_max_len;
 	dell_bl->pending_cmd = cmd[1];
+	dell_bl->resync_used = false;
 
 	/* The TTY buffer should be big enough to take the entire cmd in one go */
 	ret = serdev_device_write_buf(to_serdev_device(dell_bl->dev), cmd, cmd_len);
@@ -208,8 +210,10 @@ static const struct backlight_ops dell_uart_backlight_ops = {
 static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
 {
 	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
+	const int max_passes = 2;
 	size_t i;
 	u8 csum;
+	int pass;
 
 	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
 
@@ -220,42 +224,70 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 	}
 
 	i = 0;
-	while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
-		dell_bl->resp[dell_bl->resp_idx] = data[i++];
-
-		switch (dell_bl->resp_idx) {
-		case RESP_LEN: /* Length byte */
-			dell_bl->resp_len = dell_bl->resp[RESP_LEN];
-			if (dell_bl->resp_len < MIN_RESP_LEN ||
-			    dell_bl->resp_len > dell_bl->resp_max_len) {
-				dev_err(dell_bl->dev, "Response length %d out if range %d - %d\n",
-					dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len);
-				dell_bl->status = -EIO;
-				goto wakeup;
+	for (pass = 0; pass < max_passes; pass++) {
+		while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
+			dell_bl->resp[dell_bl->resp_idx] = data[i++];
+
+			switch (dell_bl->resp_idx) {
+			case RESP_LEN: /* Length byte */
+				dell_bl->resp_len = dell_bl->resp[RESP_LEN];
+				if (dell_bl->resp_len < MIN_RESP_LEN ||
+				    dell_bl->resp_len > dell_bl->resp_max_len) {
+					dev_err(dell_bl->dev,
+						"Response length %d out if range %d - %d\n",
+						dell_bl->resp_len, MIN_RESP_LEN,
+						dell_bl->resp_max_len);
+					dell_bl->status = -EIO;
+					goto wakeup;
+				}
+				break;
+			case RESP_CMD: /* CMD byte */
+				if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
+					dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
+						dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
+					dell_bl->status = -EIO;
+					goto wakeup;
+				}
+				break;
 			}
-			break;
-		case RESP_CMD: /* CMD byte */
-			if (dell_bl->resp[RESP_CMD] != dell_bl->pending_cmd) {
-				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
-					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
-				dell_bl->status = -EIO;
-				goto wakeup;
-			}
-			break;
+			dell_bl->resp_idx++;
 		}
-		dell_bl->resp_idx++;
-	}
 
-	if (dell_bl->resp_idx != dell_bl->resp_len)
-		return len; /* Response not complete yet */
+		if (dell_bl->resp_idx != dell_bl->resp_len)
+			return i; /* Response not complete yet, wait for more data */
+
+		csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
+		if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
+			dell_bl->status = 0; /* Success */
+			dev_dbg(dell_bl->dev,
+				"Response OK for cmd 0x%02x, len %d: %*ph\n",
+				dell_bl->pending_cmd, dell_bl->resp_len,
+				dell_bl->resp_len, dell_bl->resp);
+			goto wakeup;
+		}
+
+		/*
+		 * Some EC firmware inserts a stray byte right after the cmd-echo
+		 * byte. Try once to drop it and re-fetch the checksum byte from the wire.
+		 */
+		if (!dell_bl->resync_used && dell_bl->resp_len > MIN_RESP_LEN) {
+			dell_bl->resync_used = true;
+
+			dev_warn(dell_bl->dev,
+				 "Checksum mismatch got 0x%02x expected 0x%02x, dropping stray byte 0x%02x at offset %d\n",
+				 dell_bl->resp[dell_bl->resp_len - 1], csum,
+				 dell_bl->resp[RESP_DATA], RESP_DATA);
+
+			memmove(&dell_bl->resp[RESP_DATA], &dell_bl->resp[RESP_DATA + 1],
+				dell_bl->resp_len - RESP_DATA - 1);
+			dell_bl->resp_idx = dell_bl->resp_len - 1;
+			continue; /* re-fetch the last (checksum) byte and re-validate */
+		}
 
-	csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
-	if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
-		dell_bl->status = 0; /* Success */
-	} else {
 		dev_err(dell_bl->dev, "Checksum mismatch got 0x%02x expected 0x%02x\n",
 			dell_bl->resp[dell_bl->resp_len - 1], csum);
 		dell_bl->status = -EIO;
+		goto wakeup;
 	}
 wakeup:
 	wake_up(&dell_bl->wait_queue);
-- 
2.43.0

