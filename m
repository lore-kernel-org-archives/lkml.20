Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570586;
	b=WYvjDKoOm6ABrt1wAbpUydfpsTARCgdPZolor3QLqblwaqbTj5sGSSRfq7PsJSyIanGl
	 wwSkufk7GvS7e72h24TcPrAq+vnQ4pzza58EqgR2zOFVqIA4xfQpuYmLHDoIChTA8i+ek
	 v1RM6NtIad6SlXi9cyxN+BO3VKz7h5xgFRK7NqJhoTD07ytTgIDyDmXD6G6c+6JqVSdeT
	 F6di03/KxDGuulPaWSt5ZaC1a2aDqBKEOPdguIiRD2isea+iIoxZMwvTpHd4YHngXToRN
	 jzU7Yb+eTzpd5nglfijjlthsP4ei4yDG+IVsQ2mfRuV5XZArcJ4EMR0XEa5D++6WfzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dyq0bclsckjYVnS0JlHhV8g17P1KXdlbb5EV1M6XIV0=;
	b=bXfZf8qqmboighTmA5ktcPcju3P89kbh3Ks0uc4eev9XkCUbYO+kjPLpumiHOHlRSHrt
	 73ASOlWFkIVc60mZMp1OJqhSaD5ia0vWynp+wpqtlOvadx6EOotwIuVtOvbBfQC/ZLDOr
	 WoV1b7PvWNfESSs4S4x20tg5eXORh9ZqjdxAvCS9wCPd1VFSp6YEOf/WIXEqWpMc+hLdm
	 kSXEgyqQCwueMC8jphhcwxvMKWVPUEHv2+hdHvURE/EDl/8NLwrCy0JArosaErYR1uYKg
	 ddWnKPqwQwmOIEvcLTQ4hOvhhLfM9HfnEL+8ns6IbWocFpHQ+QNEovBmPOvH32pJzdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Scmfd3Kg;
	arc=none smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09803606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:16:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09803606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Scmfd3Kg
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e98798cbddso2186965ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792570585; x=1793175385; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyq0bclsckjYVnS0JlHhV8g17P1KXdlbb5EV1M6XIV0=;
        b=Scmfd3KgHp3BcI/NS6KhzN0AwLp8EUSvkkX2OHcGIT0OwnncSyw+cblKbnCk9hEOYG
         HbNOotnUP9LDc/pJFgCECHK4JmkzWLrE95qwMHDq5MPGAncasy4NNhxLpp5CyltUdIsW
         wG/HUbxaB2HyGTrsCha9fF0TmX5PIcrOsbyb572fr4+Q2kjjY8MH28GvTxPnqs1P/aH/
         /LsupJqR71ONvZI8kCIOmFprFBeHRbXbEPuNZFqTLLLyAWnnadJr4P3S+vhLczyClZz3
         GUznoq4ltg+ClhAQXZwV98NgoMsbS3j0aCOco2HGw0VLLCH3ooL+ihDX6b/QvAhaXPiO
         vFXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792570585; x=1793175385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyq0bclsckjYVnS0JlHhV8g17P1KXdlbb5EV1M6XIV0=;
        b=wNZLM09dYmta7OlF0IL2DZEk3J/OUYy5cId/DeoDJEp2zqcS3+8A3gVUUzG38bA5CG
         iHKpB5S5skPYEyRjNXMWL+86FvgWxfxWossjXX5XMV6kLOtpOv2HbSo6NCCvHKgaGIuB
         j7kVWiSwUGPqysLMqBwXNMTUHvs1Qa6y5lcRwBnO/OeusQl0W/Kz1RtgBL60Aj1XeTtx
         5whevGKcC6Kh3/XbID2KC+X1JDlLgRxtIKmqaFGgLqcI8EkJD720ahVtHtZ+BD/Kari5
         WgqnsmfBmZzhkknyozDt+GR/pjER8GS4NNPNauzz8xQ9Yrd+RUIddzpqXQEiQu+uKopL
         mLyA==
X-Forwarded-Encrypted: i=1; AKwUvBwjKuzim8UolUQFgvnAfbYBe7SQ9Fuz/s2fXImJ3AZpt3f8CGYaAvurJHbOEySGqie3Z2M7ZPh0kE5Sc2g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDm/tDfdC8nZeEmplyDi8M5TVz6OguS28ySfhpL6nC0p0bPOIi
	vETOnvtDprQupOZWHW3RNeHAr3BUOx0VkU6G3xdS1Q3UjqIf21qV30GilJNr5w==
X-Gm-Gg: AYBFou3UXUZChLPHmMxgB6DtVAbrymM6gVLoYQtA1sM6Si7o8yMl0kN82XYAn/GgsyD
	PO69A8zzLTEGreGwDaQgwy+88ta/YjqZpD6fDEt/vMpfXoKKtdnFuKOmC/iypDAmc8KC0ibyyqQ
	S7xMtjY4TuVPEnwfYa/7z3Jbfkwaf6XWL0aEbosj04tci4adlopN/o/1ps1Qr2re/tac3U5w9/G
	3xQONOnMDrvAfbx2+KiUCLiwMUgsv2Ntqs1D4Sftve3Z6oxZoFfksFKVRuGDSJ3g5/b0xgIsqgX
	aZfehcpc+iXdt+2nexjIYz5mj/bdqTNVNPVESIq2zEwk8Z5Nzi7doZLI1PyUS7jEGakQMCa+TNT
	ewAs2dZzM/0cSlGGDCWfcV8rtGJnSy166fZdPsJ+OQbkyKqu/eIlhRHfxX9mAZlNelhrQvj+9ka
	ko+Y84+I/IfZU5T9jMRmQpPy+P1NXAo6vE4Ct1dnnDqLntJ7djLTbM31njj089YwuhnJofe3H3P
	0dco2AuV+f7JZgZsyN8npA/75nLv9HIXD4ysEty6lQTwQ6HyWHogl/sOD0Fq2XNu9zvXaHoQekV
X-Received: by 2002:a17:903:2305:b0:2e2:f379:82b9 with SMTP id d9443c01a7336-2ea4402ba77mr9477575ad.61.1792570585345;
        Wed, 21 Oct 2026 01:16:25 -0700 (PDT)
Received: from LAPTOP-GHDOQM75.localdomain ([112.217.167.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4536ddsm8000765ad.43.2026.10.21.01.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:16:24 -0700 (PDT)
From: Lee Yongjun <jun85566@gmail.com>
To: stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: digidietze@draisberghof.de,
	xiehongyu1@kylinos.cn,
	linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com,
	Lee Yongjun <jun85566@gmail.com>
Subject: [PATCH v2] usb-storage: option_ms: bound probe-time bulk transfers
Date: Wed, 21 Oct 2026 17:16:16 +0900
Message-ID: <20261021081616.89976-1-jun85566@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The Option device initialization path issues bulk transfers
without a timeout. If a device does not complete a transfer,
the USB hub worker can remain blocked while holding the device
mutex, causing usb_device_read() to hang.

Use the timeout-aware bulk transfer helper for the transfers
in option_inquiry() and option_rezero(). This bounds the wait
for each probe-time transfer to 5 seconds.

Tested with the syzkaller C reproducer under QEMU/KVM. The
patched kernel repeatedly progressed through the USB device
initialization path after approximately 5 seconds without
triggering the previously observed hung-task warning.

Fixes: 32ebbe7b6ad4 ("USB: usb-storage: add filter to "option_ms" to leave unrecognized devices alone")
Reported-by: syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=7317196294d50d6e55c3
Signed-off-by: Lee Yongjun <jun85566@gmail.com>
---
Changes in v2:
- Reduce the timeout from 30 to 5 seconds.
- Move the dependency note below the --- separator.
- Remove the extra blank line before Signed-off-by.

This patch depends on Hongyu Xie's pending v3 series:
https://lore.kernel.org/r/20261001123135.38831-1-xy521521@gmail.com/

v1: https://lore.kernel.org/all/20261013132033.4352-1-jun85566@gmail.com/

 drivers/usb/storage/option_ms.c | 38 +++++++++++++++++----------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/usb/storage/option_ms.c b/drivers/usb/storage/option_ms.c
index 7c0b05a36554..d844fcaaf3fc 100644
--- a/drivers/usb/storage/option_ms.c
+++ b/drivers/usb/storage/option_ms.c
@@ -10,6 +10,7 @@
 #include <linux/usb.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/jiffies.h>
 
 #include "usb.h"
 #include "transport.h"
@@ -18,6 +19,7 @@
 
 #define ZCD_FORCE_MODEM			0x01
 #define ZCD_ALLOW_MS 			0x02
+#define OPTION_MS_PROBE_TIMEOUT		(5 * HZ)
 
 static unsigned int option_zero_cd = ZCD_FORCE_MODEM;
 module_param(option_zero_cd, uint, S_IRUGO | S_IWUSR);
@@ -44,9 +46,9 @@ static int option_rezero(struct us_data *us)
 		return USB_STOR_TRANSPORT_ERROR;
 
 	memcpy(buffer, rezero_msg, sizeof(rezero_msg));
-	result = usb_stor_bulk_transfer_buf(us,
-			us->send_bulk_pipe,
-			buffer, sizeof(rezero_msg), NULL);
+	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
+						    buffer, sizeof(rezero_msg), NULL,
+						    OPTION_MS_PROBE_TIMEOUT);
 	if (result != USB_STOR_XFER_GOOD) {
 		result = USB_STOR_XFER_ERROR;
 		goto out;
@@ -56,14 +58,14 @@ static int option_rezero(struct us_data *us)
 	 * Some of the devices need to be asked for a response, but we don't
 	 * care what that response is.
 	 */
-	usb_stor_bulk_transfer_buf(us,
-			us->recv_bulk_pipe,
-			buffer, RESPONSE_LEN, NULL);
+	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+					   buffer, RESPONSE_LEN, NULL,
+					   OPTION_MS_PROBE_TIMEOUT);
 
 	/* Read the CSW */
-	usb_stor_bulk_transfer_buf(us,
-			us->recv_bulk_pipe,
-			buffer, 13, NULL);
+	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+					   buffer, 13, NULL,
+					   OPTION_MS_PROBE_TIMEOUT);
 
 	result = USB_STOR_XFER_GOOD;
 
@@ -90,17 +92,17 @@ static int option_inquiry(struct us_data *us)
 		return USB_STOR_TRANSPORT_ERROR;
 
 	memcpy(buffer, inquiry_msg, sizeof(inquiry_msg));
-	result = usb_stor_bulk_transfer_buf(us,
-			us->send_bulk_pipe,
-			buffer, sizeof(inquiry_msg), NULL);
+	result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
+						    buffer, sizeof(inquiry_msg), NULL,
+						    OPTION_MS_PROBE_TIMEOUT);
 	if (result != USB_STOR_XFER_GOOD) {
 		result = USB_STOR_XFER_ERROR;
 		goto out;
 	}
 
-	result = usb_stor_bulk_transfer_buf(us,
-			us->recv_bulk_pipe,
-			buffer, 0x24, NULL);
+	result = usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+						    buffer, 0x24, NULL,
+						    OPTION_MS_PROBE_TIMEOUT);
 	if (result != USB_STOR_XFER_GOOD) {
 		result = USB_STOR_XFER_ERROR;
 		goto out;
@@ -112,9 +114,9 @@ static int option_inquiry(struct us_data *us)
 		result = memcmp(buffer+8, "ZCOPTION", 8);
 
 	/* Read the CSW */
-	usb_stor_bulk_transfer_buf(us,
-			us->recv_bulk_pipe,
-			buffer, 13, NULL);
+	usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
+					   buffer, 13, NULL,
+					   OPTION_MS_PROBE_TIMEOUT);
 
 out:
 	kfree(buffer);
-- 
2.43.0

