Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794380200;
	b=pdY71zlp7kiuhK1ZsCEDiGa6c3IX5Czm8732cTzfkAJg8j74Gbod60puTl44PnX9yF0a
	 Kssa19twPBQZXuiUC7VjgDDcL8FPJf48kwLd9uhwMNP0Sa+RJCg8SOOup9ONIxkhEMhtL
	 aMQZjrKSpH+uvi9lplDgPFfVxe25Ap9ikpcUbsUSSPktgfXR16GcQRkhdkNfUOJDuMtW/
	 ezvhlx6HzV1kowOUNsL36oDGg1Ddce1eX6iWeW6nSk3IWVe0fv9kO8+at4Sop79Pl8vrH
	 Tp9PNf0ia+cubrL+ny8e58I5QTyjeoiukgKOBHbG0dg+EylKlA+XNJ7LMrzRvvZogbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794380200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7SmbT2885p8gf81jXCe3S6/qBsJ2yVrjvPyxx2QWJ7c=;
	b=bsmng+4nSa+DprYX3Q0rDeL5ILXjsWY0WowAe4DBZJYzOb315EMoJIyzokedzFutDhbV
	 Nb3qd4jXXQgUIG8mudrxgnC0PJAIw3GllsPbOcWTCQmVsquFbFL6d0LOPKLsBXC3IZ9Z7
	 X8KwVurBcMm91GRmDSmdh/374M1sVR6nT5SMTbP2NLfMft491c2EhIaEw1193AxvE4rv6
	 INA41RQ372xLbmOdOEIDLEnkFRLYUiL9IqLrsqJigocZokkn+qIjMdIu2LoF3u7UnVrSq
	 o6XAmbefOt0wGbqoULcJVSx7hjQLbXIM3dmUlqILjQiCh31tsT0HpVRLy8asrBFbn1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHqp2NLG;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F16060A5BE7
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F16060A5BE7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uHqp2NLG
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-170135e43c7so373859c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794380200; x=1794985000; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SmbT2885p8gf81jXCe3S6/qBsJ2yVrjvPyxx2QWJ7c=;
        b=uHqp2NLGhzK00XTIfrkQRkQuKuh0Mmw5nB/Kat4LqWbqhnMoF9FAnCYO72jDqDvksL
         Df8i04ZsPDBrImnMyZRZFGMuRlO8BTUd/nrGj2C/XCcd3Sw/Pypv6A4hX96itvrSKwGD
         gcpI3tXeOCYEfxmvDMoke8M36spvzjONIRQGerRRpnjrxto+uw7iacIxRuo9yLHtRxBA
         muGbVzAki4EKjgZ0bk9GJ9s0CUGQ1//D1kRp9hes2LTBixo6E8nKapTwnAG0FcMU9f1F
         XMOdO6e/nyn5GXPWX/lp5G5XUYytIXbRpvNMMmIwlen9Dcx+yBvgQJrjJQ99NocQaKgj
         KnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794380200; x=1794985000;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SmbT2885p8gf81jXCe3S6/qBsJ2yVrjvPyxx2QWJ7c=;
        b=mzaIGGC6SfZOfRBkeZP/lq1VLRrraMc2WQ7+1EYsaPgpF2+F25dSGuzbVD6SEiTIre
         zDJJ4vCVm+CEbmfmZtEDl1D/ekzS0i54vHp+7BZRXJB2zErclOj+UpkCn3XPIlvv53lB
         r1qZf7e7jVtjahGw2nkXKb0gpXJTbodBaUClYcsWNLUREaX5zqsp17nrk17WKOOckZv3
         ArYBMu7esOEq3oFp/9hflkSLeFm22fyK+do9AJQB6b3EvpITK5L52W/NNlXvvaIQQUTX
         AXp63k0E5akbBA7NuXQo7PSrMu5EKTtFBcXSEDwHZJ+uJoaYpYePJ2CuKD95QcL2deMG
         cXTQ==
X-Forwarded-Encrypted: i=1; AL+hErEj2YuFTlI4onTXWuMrhdNZ0zGtWgazbVRfGfIWZFNNqbhid3J7dIhzZzDQuhjCWNSPnZoOljsXfO0PTd0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Ey2mVFuIQRoW7WqOcMX87ssqu/XkFlHqg2iq6+Go4Pf3U1Vp+
	GZSiGCIeVabxbAsjs09KzRIVZbCm74onuqBYv4IyLuQOpl1o6A2fjz4Z
X-Gm-Gg: AYBFou1dRU+ipUm9R+wdAfvryhgKIDbA6L7RnNq87jlbtnn1SJJAhOID0FdA4FmIqfX
	TdPL1x0du72qMfymoOvunDPKm5e4brVzRlTH4+Lb8mcFVM0wjpA1JXtSDXzsnpDoTknbgMhwpwe
	4ye8cq5SvmNmGuP7rPsGnCOMyX3NihfvMBBLkLItol3COLhc9ndV3i4jWe+q1F6+1x6jVQ7CD10
	kpr/KQoHMleGvxcpvYHPdnVPaTQPQQxbS6kN+722vOyQ3xlwTp82B8GpB4PNrGQOnUY5FuUIfhn
	0UNJScinoQwGpbhdWN10V6YVOHI9aB5HlLTSx+JMCLGfdpbzObkkxEP2LndXRTFO/ozhYvQVYYj
	VTzs/ZeUuBN+8FpAJUSdncmvEijGE10Pny06tuUR6nYycaKqnShExL6XJJDC1rPFxXaBoTARBug
	3m3zfu1CEVtO/7xQqD70Waidrp5DLgOQCzQfYHttO1d/BSLIt1o2IvGZvbuqEB6i84LobSBEn+D
	d7mj5HQwZgyAROqpVLS/CwU/z8EaKlMHtaChLfLQTHG+YuKbZJLftWRSAll62+3cnmf3zl5aG+n
	kHGo2XWeeX30G9dE3udaTbgDuKrEDg227ZLS/fA88tWTHQawGG1ZgOEJteHT3/XcPFQ45xvIqJ5
	2h4eBRf3bgvinGB/DBg==
X-Received: by 2002:a05:7022:7f0b:b0:192:e5a8:6bae with SMTP id a92af1059eb24-1b3c034e292mr1417864c88.40.1794380199197;
        Tue, 10 Nov 2026 22:56:39 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:311a:ad7a:93f8:96c8])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11435sm13858121c88.4.2026.11.10.22.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:56:38 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 10 Nov 2026 22:48:09 -0800
Subject: [PATCH v2 11/33] HID: logitech-hidpp: handle negative errors in
 hidpp20_get_adc_measurement_1f20()
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
Message-Id: <20261110-hid-logitech-hidpp-v2-11-30743e91d83b@gmail.com>
References: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
In-Reply-To: <20261110-hid-logitech-hidpp-v2-0-30743e91d83b@gmail.com>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>, 
 Bastien Nocera <hadess@hadess.net>, Hans de Goede <hansg@kernel.org>, 
 Edwin Velds <e.velds@gmail.com>, 
 Stuart Hayhurst <stuart.a.hayhurst@gmail.com>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

When hidpp_send_fap_command_sync() fails with a negative transport or
timeout error (-ETIMEDOUT, -ENODEV, etc.),
hidpp20_get_adc_measurement_1f20() only checked if (ret > 0) for
protocol errors and fell through. It then parsed zeroed response
parameters (0 mV) and returned true, marking a disconnected or
unresponsive device online and triggering spurious "possibly using the
wrong voltage curve" warnings.

Return false whenever ret is non-zero, logging the debug message only
when ret is a positive protocol error.

Fixes: c361982a13c9 ("HID: logitech-hidpp: Add support for ADC measurement feature")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index 0ec2f2fd6dec..28402baf04fb 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -1952,9 +1952,10 @@ static bool hidpp20_get_adc_measurement_1f20(struct hidpp_device *hidpp,
 					  CMD_ADC_MEASUREMENT_GET_ADC_MEASUREMENT,
 					  NULL, 0, &response);
 
-	if (ret > 0) {
-		hid_dbg(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
-			__func__, ret);
+	if (ret) {
+		if (ret > 0)
+			hid_dbg(hidpp->hid_dev, "%s: received protocol error 0x%02x\n",
+				__func__, ret);
 		return false;
 	}
 

-- 
2.56.0.542.g3ef89b7020-goog

