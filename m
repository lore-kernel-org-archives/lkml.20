Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA30841A553
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792143227; cv=none; b=VyF8uFc03JLHL9yJxmX8TTNUqUyEhrzqmfQA3iKfwargRtewmZLEoAIDWwuzti56mP0QPhg0RGRk0qN7z3ATf5uKArmkFspt2SiJf+mmzhO03tcVzNAdQP3g/p0GV9yD1jRjHAiiUY/Uiej8qCSEO5q436xyqNw3YY/xKZsJJZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792143227; c=relaxed/simple;
	bh=zHbSSY9rAr/g+sFYEYM1kJ2USd3zEL7kPrBfN1nVhCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xnnq0v3eHVzym8K+lKweKWTHq72sGpNpUBoGow0ibRb396+WHbu6d5i0tJChNtiyPOV0Z99DWInDWp4FhZNiVGiRdB3rekLLd2XG7IWtNUfNe7OgTsyejXDos5e+vY64vsk9DpfOnGcDPZkRIweCnZ+2vDUwRr2OdFq2Y02lebc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MeXLXmUm; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MeXLXmUm"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-35c76e9614aso4651284eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 02:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792143225; x=1792748025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/bHsdjQU/i7/551ix6kwUeYp4ekmaHTm2YgU4UP9dLQ=;
        b=MeXLXmUmPLHUJd+mx5cm28996/rbk8kff6w+1Drk9a9wN9LR30+TZ1YleJTqhxemnD
         tpvwgfpgi4BmHLxJd+lj0PFDakqaiFKBIOvhawqqOt6wFBfd/fkaRbm5TTzce/qTF2r2
         FdaB93G0il00LPQ4MVNhBDmZKFw+5pSlXOr2aWMoXxw+RSgANwptQELSLusNVLybqY8I
         B7C0bQUknshMJ7OEeKgFN8Fr2MbClBkfY3zfm04kXmFLQKouMeh3mqwMLVxLL0XpKBZ5
         OUPuQh48m/gUjcy2qAGvGcIz2fJkcjOrOybTeQ7lbj+mfM16EENY0t7o2EvouJ6J0Ok1
         G0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792143225; x=1792748025;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/bHsdjQU/i7/551ix6kwUeYp4ekmaHTm2YgU4UP9dLQ=;
        b=wFRMqKY/lLLoKJ7/G4jt5ehGPxvsjkCRpq5zU1wk1s0TsWwQRmkve6HFzBpaS4s9vY
         osET8C03pRI32zM8fQoIzdgO18qa24Hyd+36M3q2+e9Q4ISWNNUOLDgnyrqjX6Gl6CY2
         NNq2XZrOiLuRaBmtM9+hoNJmQ4GxTR+CusYUhHogYbNyNZ07PFXJBUX7V68XokGS83S7
         K09SdPSNxc0kcWCOPMXUDUghWEQ6O1lMlQIjAX20izjhi6x6OmJkx392gVLNKlEqvkuK
         ZhWttRRtOcxH9nVKpF0YotdiVahmeaTEonkORc/c93ygWxM50aCljMZgc1XDgcDDUEPu
         NTwA==
X-Forwarded-Encrypted: i=1; AKwUvBxbhLCd85EupZy/iD+QSXPxMXycyb1GcyFnRFp/F5G4EYICLpjttmfZUJaxsCPwVE7GrL8BrigQtlxVjVs=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2j2Tr4v3JCpjqAewP5S17qGwr/R5OygH6zq4gIFLEVLkw/fj6
	3etuplApOrtH63NHHmxEdhOI+j3BF/in9W98AWTmpX9OjSxiliH6OnNx
X-Gm-Gg: AYBFou36/VzpLyLdTVLYC21EIN6hD6JW0Ck5ibNcSeK3eYb1Vuiqs6Hmm6YUEGWpjWk
	ZX+k6/HWN/VoiI4Icri/sKdXY4AFQz/pRl5rDKU47ZlbJNKCVV2gia3UmZB9aXNuvugXGc/IFmq
	Zy27O2v89RrI0ZQtGrEzhj9/5O5x10vMeiR9AfmpImvNEU2FdAuKMxDiuz4XSiNY6Hikc2GdYAO
	ULYd9XbF9I0o2Kd+d0cv6fu97rXOt0FP58EwrlEIYYECw0HDTDyFrXVFjUOUB90IGrsga+RuTGy
	dq4DUWuOiRJWzNhoJR2pk62XDQTI/Ml5UvxOZOFWWvpK8p4PI7EPiUMYD2Jbo6+MNLlr12R5Vpc
	g07UdwHQP/jYN5RQNpMTR8YazTd7VOeoVP7edjUUuLMDJRdEIgRdr4lOtv+c2zaXMiJEHFDXNMu
	QfnDMt3jH3JCC2F/6vaIYV6I9BLgB/UxFB98kbK93Zfkc2jySQiNN1c58aN8Vtveg5pdpNK915B
	Zu7l24crvXyTQIiSMNXb9Lu+4BvRw==
X-Received: by 2002:a05:693c:4097:b0:358:8bd2:fda1 with SMTP id 5a478bee46e88-3588bd2ffb0mr35278255eec.30.1792143224613;
        Fri, 16 Oct 2026 02:33:44 -0700 (PDT)
Received: from chitransh.. ([2401:4900:9390:ec4c:7580:f3c1:62f7:b0b6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3608308a87csm8697922eec.28.2026.10.16.02.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:33:44 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v3 1/2] platform/x86: dell-uart-backlight: extract
Date: Fri, 16 Oct 2026 15:03:01 +0530
Message-ID: <20261016093302.55528-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016093302.55528-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
 <20261016093302.55528-1-chitranshmandhaniya@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Move the response-byte processing and checksum validation out of
dell_uart_bl_receive() into a new dell_uart_bl_receive_data() helper.

The helper always returns the number of bytes consumed from the input
buffer. The caller checks dell_bl->status to determine the outcome:
-EBUSY means the response is still incomplete, 0 means success, -EIO
means an error occurred. This preserves the original behaviour.

No functional change. This is a preparatory refactor so that a
follow-up patch can call the helper again after resyncing on a stray
byte from the EC.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 42 ++++++++++++-------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..af9c5f9a566f 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -205,20 +205,13 @@ static const struct backlight_ops dell_uart_backlight_ops = {
 	.get_brightness = dell_uart_get_brightness_op,
 };
 
-static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
+/* Process received UART data; returns number of bytes consumed. */
+static size_t dell_uart_bl_receive_data(struct dell_uart_backlight *dell_bl,
+					const u8 *data, size_t len)
 {
-	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
 	size_t i;
 	u8 csum;
 
-	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
-
-	/* Throw away unexpected bytes / remainder of response after an error */
-	if (dell_bl->status != -EBUSY) {
-		dev_warn(dell_bl->dev, "Bytes received out of band, dropping them.\n");
-		return len;
-	}
-
 	i = 0;
 	while (i < len && dell_bl->resp_idx != dell_bl->resp_len) {
 		dell_bl->resp[dell_bl->resp_idx] = data[i++];
@@ -231,7 +224,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 				dev_err(dell_bl->dev, "Response length %d out if range %d - %d\n",
 					dell_bl->resp_len, MIN_RESP_LEN, dell_bl->resp_max_len);
 				dell_bl->status = -EIO;
-				goto wakeup;
+				return i;
 			}
 			break;
 		case RESP_CMD: /* CMD byte */
@@ -239,7 +232,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 				dev_err(dell_bl->dev, "Response cmd 0x%02x != pending 0x%02x\n",
 					dell_bl->resp[RESP_CMD], dell_bl->pending_cmd);
 				dell_bl->status = -EIO;
-				goto wakeup;
+				return i;
 			}
 			break;
 		}
@@ -247,7 +240,7 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 	}
 
 	if (dell_bl->resp_idx != dell_bl->resp_len)
-		return len; /* Response not complete yet */
+		return i; /* Response not complete, status stays -EBUSY */
 
 	csum = dell_uart_checksum(dell_bl->resp, dell_bl->resp_len - 1);
 	if (dell_bl->resp[dell_bl->resp_len - 1] == csum) {
@@ -257,11 +250,30 @@ static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data,
 			dell_bl->resp[dell_bl->resp_len - 1], csum);
 		dell_bl->status = -EIO;
 	}
-wakeup:
-	wake_up(&dell_bl->wait_queue);
 	return i;
 }
 
+static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
+{
+	struct dell_uart_backlight *dell_bl = serdev_device_get_drvdata(serdev);
+	size_t ret;
+
+	dev_dbg(dell_bl->dev, "Recv: %*ph\n", (int)len, data);
+
+	/* Throw away unexpected bytes / remainder of response after an error */
+	if (dell_bl->status != -EBUSY) {
+		dev_warn(dell_bl->dev, "Bytes received out of band, dropping them.\n");
+		return len;
+	}
+
+	ret = dell_uart_bl_receive_data(dell_bl, data, len);
+	if (dell_bl->status == -EBUSY)
+		return len; /* Response not complete yet */
+
+	wake_up(&dell_bl->wait_queue);
+	return ret;
+}
+
 static const struct serdev_device_ops dell_uart_bl_serdev_ops = {
 	.receive_buf = dell_uart_bl_receive,
 	.write_wakeup = serdev_device_write_wakeup,
-- 
2.43.0

