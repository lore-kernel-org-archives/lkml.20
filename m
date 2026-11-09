Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204692;
	b=X5MtopQjfifopua7xPoxt8cCKdASa3SXm4Nt9zLzgmoAehdSrXjl5Cw3bASpVAKS8EjH
	 BqA1OYo5ymnUbxX5huivwNfaWD58ZKQpb3sllQ2J8bCLCXMmUtSXlZfBKCJ1jPXBWR4eC
	 /yKwNRTz66A1frg1IiVgqq1TXoLibJBETIvGby/W/qCspl2yAEi4uQj0WpO6/zqSJOqX8
	 IByt10CfkrZugIeEWfkqkztt0EMTRPNwNUv5ZUI2tFn2b1YSxbrHU47QdPwXkPPgrarjC
	 ONwHupYdOwdH0JaTevhLBBqIrM2A1bBbkY2OpwMzj0yEbSbzVpJvtbyQF6w0bR5yq5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RvWIcIIXPCWIw1rDnK1jAirBnM7DqOltnfOILQIkZoY=;
	b=gwbcw7xpnWVhH5TV8pA+k83UE681gX3HlSX1MPrtJE0NnGVp644bElxglqlyNUdOO8uH
	 F3iKaddrl6GFAZeaYDyLstaMr/SxgXAM4KVyav8+s2DBFwge16YWmE/3aQH1MSJGP9IOZ
	 oAsDJ0yeewYT5U9CUx2aCGu6rTkyMYngjP0v9EGNGO8JB3bvVnaT+OhX9hlacb4dCIcaS
	 DlAtVlmX8KUjPVMT4T3xvZI/oksOQ7VEhjyNVJAf7RcvX2/mAYQr8PNVs2XHA3mLDHGBK
	 VPhPaj0I+BPPigdeiC4BpHjVquFNyfEPHPtSRJQC+GskljQsZaIExw/OSqEcIuoONOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NGgyAfjr;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1010606D817
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 06:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1010606D817
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NGgyAfjr
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-37000e7234bso1688376eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204686; x=1794809486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RvWIcIIXPCWIw1rDnK1jAirBnM7DqOltnfOILQIkZoY=;
        b=NGgyAfjrK9ii4LTmvG4jUz7TgWgVIB85fDPCYxyVKyTzqHdPYC/Tlj9r5qShcf0ITg
         lahCrVMxhhgvc3Zi0uAJeZaFphxz5MlwjBRg0zqFZl/S9+xmgVG2gmAGpz6msm2Rgoa+
         8Y4UR81ccmETxNd3yn5Iand+ARteI+5zBX7QLVUxlBrNOoOfkv1Q8CpYwt+F6HdFdMOu
         QB3NpBGfpIvByFzJr3CXV9p245JWEcl90GsDFl2ju2rB7AhfFVkh169j+Fi21FZXD1fF
         c2V5V0RfzBQjAmokrhCi+OMHJvXkdzFlOWqTZA+RY/wSxy4TAGCvBAbgMN0aWcWwJmgg
         kwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204686; x=1794809486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RvWIcIIXPCWIw1rDnK1jAirBnM7DqOltnfOILQIkZoY=;
        b=DiOuL8zJ7h7nLLt9e8WOB2Rwj739fwqO3YUE06xRUdkORNhlsmDAfa2vfLaLneQqbp
         na+BkBY5LT3GYGRbZ/xFKzdGq4UQ/aHLEUTnmxbcWURXxmDeQDIJ0ZqZ3NCXYy5cZY4o
         aLAyUROqug7OmGkkwVt2JBv39pCxT+hAghyShCeYn6lSXNOlEvPiHXE3P1VpY0W9vDSg
         DxwHtU6dVk4KRHxXlkcDMnCOBW17KpDVi9HvjflaOaJoXGMPmog2T7PoLV82QmO9bhM+
         5CSIOmYNx2NFryB3QqgFdQ9uj8yiuUaBvBNeulJRKBODWLaXruuNDEVxH+w1uU3TO1XP
         72jQ==
X-Forwarded-Encrypted: i=1; AL+hErHC+wNj2vM9omR6xaHdl11Ie+Yn2nzH/4mnI1k1VGKRaTq6jUVI3VVARzFbQ+m6UJqrUPsdHrZOTl3PFdo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8fiBn3Sh037ZNGD588Wx/P7WPcN8O3nP2phynJUII+MmlgCnnR
	d9869g76GuxsC137I/INOBCkYd6/3c1okWF9hPi1scdp2snl3paLb7Ge
X-Gm-Gg: AYBFou2pfLP+cwq+6bxBkTTWUdVF94FS9NONx3reBuKmia8KzaLHKO5gFaXAn7dx+Yz
	OGtl7N1rOKg7togLbXIgcqUv7RU8W4u8Ha2X6PxZ1x9YJm8rgKBvtldyFxa1Av6BGGPyDc/7FS9
	2mKtj9mnrI+5fuX/EJAANOEBj1jU5psJR4AuHMT/MNUmltFe7bR/WKSKf2tiGS0gSmguXsSRwhK
	KNqklCqPcPEULXD0CmWUR7EgtufBgPMoW2yVIOL932xqSyE7ow7+Y2zblkGYjcRkQ6U8+m+6apq
	aoRGyQVIYriGNhl195665mE83qO8ckhqiZZ9Gl7DroJi4p9nmolwfU6vqNVbmOPYfAJe+7Px5lz
	8y3DPvHCtd+TJx5kUBsop2dKxYoXtuAWIbnl25nccGEtJucT/Xl4vKszMQ90MunFdy+/qEZzMdP
	j5IrL15xvqLJUFfRK+a4cQPCqY6zxHeRTWPb1qngpzWy8yZF5Jo3kjPL6pUZH3krP698kb0Yo15
	CQci7zqoNLGsa/+1EmnEjmaS1Hu79JN0D4xs9gdz9Mw0umeCpoZXqkKist8p7vKrNMQ1HzqLY10
	JZw8io11Q2QX6VWowjXk0+/Yh093q5XqWIU911ZxSuHGW76g6ACC9Zo+BvKVAMW/Anu89stxVs8
	t0vLE1dXPqpMUYkRZ
X-Received: by 2002:a05:7301:9f18:b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-3725641e19bmr9182681eec.29.1794204685753;
        Sun, 08 Nov 2026 22:11:25 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:3588:b56:78bf:db5e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372661ede11sm12201192eec.21.2026.11.08.22.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:11:25 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Gideon Heinz <gideonheinz02@gmail.com>
Cc: =?UTF-8?q?Filipe=20La=C3=ADns?= <lains@riseup.net>,
	Bastien Nocera <hadess@hadess.net>,
	Hans de Goede <hansg@kernel.org>,
	Edwin Velds <e.velds@gmail.com>,
	Stuart Hayhurst <stuart.a.hayhurst@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/18] HID: logitech-hidpp: shut down G920 force feedback on input unregister
Date: Sun,  8 Nov 2026 22:10:55 -0800
Message-ID: <20261109061103.2887636-12-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.56.0.506.g506a7eabc5-goog
In-Reply-To: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
References: <20261109061103.2887636-1-dmitry.torokhov@gmail.com>
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

Force-feedback teardown currently runs only in the force-feedback
destroy callback, which is deferred until the last open event handle
is closed. If userspace holds an open handle across USB disconnect or
driver unbind, device removal frees driver state and destroys the
command mutex while queued force-feedback work is still active, causing
use-after-free errors.

Move workqueue teardown into the force-feedback stop callback so input
unregistration drains queued work while driver and HID state are still
alive. Keep calling stop from destroy as a safety net for registration
failures, guarded so repeated teardown is a safe no-op.

Fixes: 08c453f6d073 ("HID: logitech-hidpp: do all FF cleanup in hidpp_ff_destroy()")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/hid/hid-logitech-hidpp.c | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/hid/hid-logitech-hidpp.c b/drivers/hid/hid-logitech-hidpp.c
index ad3edd15cdd2..5169f3873257 100644
--- a/drivers/hid/hid-logitech-hidpp.c
+++ b/drivers/hid/hid-logitech-hidpp.c
@@ -2840,16 +2840,35 @@ static const struct attribute_group *hidpp_dev_groups[] = {
 	NULL
 };
 
-static void hidpp_ff_destroy(struct ff_device *ff)
+static void hidpp_ff_stop(struct ff_device *ff)
 {
 	struct hidpp_ff_private_data *data = ff->private;
-	struct hidpp_device *hidpp = data->hidpp;
-	struct g920_data *g920 = hidpp->private_data;
+	struct hidpp_device *hidpp;
+	struct g920_data *g920;
+
+	hidpp = data->hidpp;
+	if (!hidpp)
+		return;
 
 	hid_info(hidpp->hid_dev, "Unloading HID++ force feedback.\n");
 
 	destroy_workqueue(data->wq);
+
+	g920 = hidpp->private_data;
 	g920->ff = NULL;
+	data->wq = NULL;
+	data->hidpp = NULL;
+}
+
+static void hidpp_ff_destroy(struct ff_device *ff)
+{
+	/*
+	 * Workqueue teardown normally runs in ff->stop() when the input device
+	 * is unregistered. Still call it here as a safety net for error paths
+	 * before registration completes; once stopped, it becomes a safe no-op
+	 * that never touches freed driver data.
+	 */
+	hidpp_ff_stop(ff);
 }
 
 static void hidpp_ff_close(struct input_dev *dev)
@@ -2922,6 +2941,7 @@ static int hidpp_ff_init(struct hidpp_device *hidpp, struct input_dev *dev)
 	ff->playback = hidpp_ff_playback;
 	ff->set_gain = hidpp_ff_set_gain;
 	ff->set_autocenter = hidpp_ff_set_autocenter;
+	ff->stop = hidpp_ff_stop;
 	ff->destroy = hidpp_ff_destroy;
 
 	dev->close = hidpp_ff_close;
-- 
2.56.0.506.g506a7eabc5-goog

