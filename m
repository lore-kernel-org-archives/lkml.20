Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FEF49B1E5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 07:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792050263; cv=none; b=Wrfnsvhmwqg8ecvI+0FmL5opJXxsrWHXcn7JRXedyle+GxwfnJw8UHdTUP+Uj3GVxROrC63QfT/iuIg43dIjYLmOo6wwBmBEhblscrPsPiE6k8wP+5/OkXfo5ovbFqV5s3BPPXqjJ/S7W6tT1Miw0ZgWUrm89NNYeLQUkavoOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792050263; c=relaxed/simple;
	bh=yhUlIp18d7878UrLimCqmEvF6mmb+xteJ7eUoweywJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gs5B6eApEiyUNeoUsAHx4FvfvfKXFnbDHx7dt+9noljfstdcwxDovHuYsd3dDEYJPdoHNMYHz60aDvVXi8rzAzA6mRCdp/YYyyQqA4qdU7mn+JgxPQYn4VvRySijSAr34Y8v4V7L7jAvVBlLtGfhyokoRp4ANkRZhm7TEa+s40I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b66UuWKh; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b66UuWKh"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e42560ebcso687034a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 00:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792050260; x=1792655060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DDEevMacbooi2fkIJdKH3aMGF4FSdtM40ZuCloog92o=;
        b=b66UuWKhUf+eh3oScpVJ657be2qW7NhECFzuuiCRSReM4v4CLtyZzzGJhlE9TM8I85
         SjvXqVobK82jC6q71xVfo/mGIVyIEfXDX4Ej9Ib/oLQ7rA73dDK24bqSNnqU0XUiJR4f
         d1bOkSPHIqao34T98UWRZl/aSzZD8IjbgMRii/2Bzm2f9eQfIFu72pNfdoA6FgIdXU/G
         mogDAIvBuA2n3NMIwtqwiV56m6fG8qT/Ya8DywWDAdXSBLqSw2zK7XnWJ9BrOc/4NM6u
         +t9+0+G+DU8EWl4a4ZGVaVe83kTjFes1n9feKskaVZPeW/cd3gmfPLxMO/0i6Z7c+GY+
         tDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792050260; x=1792655060;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DDEevMacbooi2fkIJdKH3aMGF4FSdtM40ZuCloog92o=;
        b=He0ArCh+D3jK6K/rWFP0H+9Wd3gVlCAx3qdd9EpGJ4PytOVpsGUk7zH5uFwIKhO3Mq
         CkYuFyLxaomb3OCbrNEgJ8IBJU4sRL4mnwbAOS17i9UVLIeyDZC3a5N3WfgbahNfahvp
         Hyd41dr8uLZo6/IBwzVAfWDoaiTKjIiAKAY7gzc+Q03uZdRUG0elbx5J7wy5kmam7/2E
         kP2Nb8J8MIXxsAvF5NpjAr4fzyexAGh0Md6Z47RUY68ogxMvBYg20gxEO0JgXYi/y33I
         nP/7tKl1sM1VMJHQbinRQVjciBvK77+kPnRnwe+c802LuThmeK58OgnwKpmZraY14ICs
         1fRw==
X-Forwarded-Encrypted: i=1; AKwUvBwgchBB9TVFFnqBoM3AFTjPMt5UOKVgceHtlVLDm5YcyrH57GDdAEVlV6a1qqZu8w2Er1XiAjxzh760RX4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIp7SVhkV8t+ip3RXs8yP3XscwbDLaSVdVgKDoThS2oNAwPiyaM
	N0XBpJqAJJtSc/vPi8Mp0hIagxitZTEgkvx8MZdAPvckFhtW07rHUznZ
X-Gm-Gg: AYBFou2WaCsy99mPLWrFmj/49EDVNMg3n/ChkS2RjaAxcpXOfYm9QtQ0ZifaxiWE9+a
	5pEpcU7Etp5+MvR0jCCFnUtFvqlFuhrmY9PIWDaPEaHZmdoJjkdDh1iz6lXBO1VtRyh7o0P65Ay
	W6fAjNC3IZXrxV9buNwSiA/R8yfXUKCTnGanBu+b2upwk6MmyhNlKqhEtLZFkIkBXoTsYf3DqJN
	UbyuRq+PXhzhsouwhFEYkT1ULLBcZaiWgkkfCfUwRirCuXDi7OWTUwmXjelIRdWdx6u10AHnDlX
	2hGAJDNQizhxg11EsrPYxJ/lRlBsBdmG+9Yne/bpOSi1JFAv+EOZAN70C7ZqkGtTaiFpa1ninLu
	a6HP17SNyQVfh7eFZdWJ0imFT85x8jCHKPwdLBQz3DYW5W3vcORA281hCLu9p/DlWfXjLaiVVtP
	EVtXg5f24mtHMVVp1HI2frbMGGpsPwZ3qLMaaS7bi+NljulfnRpIG/CDs/GQfpdIuRzUm3FqBPa
	D2qxG3bCvW1o5rBt8e5GWI=
X-Received: by 2002:a17:90a:e7ca:b0:39e:4c80:f67b with SMTP id 98e67ed59e1d1-3ab3a7a1526mr15067914a91.26.1792050260255;
        Thu, 15 Oct 2026 00:44:20 -0700 (PDT)
Received: from chitransh.. ([106.202.101.59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm3007423a91.8.2026.10.15.00.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 00:44:19 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com
Subject: [PATCH v2 1/2] platform/x86: dell-uart-backlight: extract dell_uart_bl_receive_data() helper
Date: Thu, 15 Oct 2026 13:13:38 +0530
Message-ID: <20261015074339.27388-2-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261015074339.27388-1-chitranshmandhaniya@gmail.com>
References: <20261004110333.5790-1-chitranshmandhaniya@gmail.com>
 <20261015074339.27388-1-chitranshmandhaniya@gmail.com>
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

No functional change. This is a preparatory refactor so that a
follow-up patch can call the helper again after resyncing on a stray
byte from the EC.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 .../platform/x86/dell/dell-uart-backlight.c   | 42 ++++++++++++-------
 1 file changed, 27 insertions(+), 15 deletions(-)

diff --git a/drivers/platform/x86/dell/dell-uart-backlight.c b/drivers/platform/x86/dell/dell-uart-backlight.c
index f323a667dc2d..b61499d7b3f8 100644
--- a/drivers/platform/x86/dell/dell-uart-backlight.c
+++ b/drivers/platform/x86/dell/dell-uart-backlight.c
@@ -205,20 +205,13 @@ static const struct backlight_ops dell_uart_backlight_ops = {
 	.get_brightness = dell_uart_get_brightness_op,
 };
 
-static size_t dell_uart_bl_receive(struct serdev_device *serdev, const u8 *data, size_t len)
+/* Process received UART data; returns bytes consumed or -1 if incomplete. */
+static int dell_uart_bl_receive_data(struct dell_uart_backlight *dell_bl,
+				     const u8 *data, size_t len)
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
+		return -1; /* Response not complete yet */
 
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
+	int ret;
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
+	if (ret < 0)
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

