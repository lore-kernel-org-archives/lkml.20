Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432501;
	b=UaHG1KD18MHIq8XietlilyRgP03X9MB+FtIZ49JhngzCWmMj7IuQznoe74fNWHncJRcx
	 btMLFZ0OfElrCA6YfwzmE3Jquabtt4grImkDsChPDyWrFHmotpWqcGUXPX0V90lTWdT/I
	 1l3WrQ7Qxjlov4XaAd4W8++zFffBEKSv2zBbHzwRghGmerV0rAlUpcAd8OEUc/AwSW7Hf
	 OSC9GRIfHMtXlbkIVG5d0sNCrVnuup4ucLINAsQ7pgdsJhwJB887DkAqt5Kj5YAxXVO7P
	 8kO2lErRg+NKck6kaEgpaKEwURd1UTYjtm3LflhNZ5QFWFuAHXFRRPTCmKPyRID3Qiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=74uvMze8U6BbGPbd8gwymf11h9qlFwlZm+CW2Kl7KEg=;
	b=M+WLixUKTS3YTbQrKXxB/iv7NJby+07bKqy+WCujZ2dVKem0bEj4qi0FSh9VSfxsEI9X
	 LUYVo3YKlE6Oi4HzXMsjJl7hmYzRVigjRY0Z531z3OlcqgLrajiHpJ/85FohjU/1892b4
	 gQjjnP411GQYxb+xE2XaQ9MYCgpsKVCqOPuviclnElx+HmzHwHo5KwFy6gVnGP1+nRcz3
	 yB9zPUa7+LW+TkZmr/5xbRhknyOSEyyUxKWm3VhcQ77MSwnWPda0ZQJr36M4uayg7+L26
	 zOY5VccFvGeqSiSK27tlGwLI38z+5dwbHSMXL2SQUXZx3ezI9EBJEtqmUU+nj0iyFLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MxpWCR3D;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94E1606A319
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 17:55:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C94E1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=MxpWCR3D
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-14394530ec6so1313284c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 10:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792432500; x=1793037300; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=74uvMze8U6BbGPbd8gwymf11h9qlFwlZm+CW2Kl7KEg=;
        b=MxpWCR3DAHiy8ATYRQfZv3AhdGgy2YPwicgIIgmfdWj7CIzfokPtBq2AyC6HCD4FxK
         7cv9o1cKnYUUrkElZPMRw3MJIpfXHAj+nI1EWFq9iObMf5umIP13GrmUTKpmfplYIyzy
         lmim7ggXKICyAiiEUt1QlaMufnih2UBDQ7lMOl1CrdvYPvhn+8w2DCToNLyfsOtC0AhU
         lbTrnBKvwZYV9ruCEEEfuEktFtXIHyRi+pyDCRI1cnkD5fhm6nf94OKkJdWHme3GpNfu
         MMteHUZefjQ0F3KfHDZv5fgpLy1kqYpysG/nCsk/feNaygTljSs3DR/CCdXlhwIUgPCk
         O9Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432500; x=1793037300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=74uvMze8U6BbGPbd8gwymf11h9qlFwlZm+CW2Kl7KEg=;
        b=M25Lh3wDKpRfCnzpaK8W1znyiGJxKUZV+06alCap7o3+lpJ4g9rDqVwGiIV4Zyyd9x
         cDi9gIMPPjllu9nT/f4T0CEtsaAEghmaItt7KticLzXAIzD3sN+VzPa50hXJFpa4eFE6
         Xrm3Vq2GdxKYUQsf8iAXv7Dhbo4w55yqxZx0tLMdYvr1RnvNjamI3fZ9U5fQhLS0wjVr
         C22yHBFyojXbCDJ3lmKe1MrHc3ifn++Pbsxvx7KxXpwYg6TZ6tRHcKBojdgDn5/1iwjC
         IB2Vl8L48QsI3EziRUiV4XbtsWGKwmuvAqhuCuL1sptERLZm7civRnQJRw5PrVH6sxHF
         8dcw==
X-Forwarded-Encrypted: i=1; AKwUvBxofHCC2UBQV4j2yOFMYI1HjRHUcUL7W8mbtqqa1/T1dP/MYXx7RvjcO5E5NZicDbUqqnN12KtrM6lFTa4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKCkT4uT6yv+Djl08zs7X1TpDsM7Gdd8MuE98x+rJjnPaf2u9Mm
	fWSzdin/k9YpUQuZeOsjbXK1tyUJPL/KC7tKDf7KidFa2oSZXzCCnaaF
X-Gm-Gg: AYBFou2PTPdIifXb9vDZOyhG5Gy/uBSzByMeAVE4L4kXIIwhhNyO8zRHPllZUPFu29k
	yHOTgSRnOZmcq6jjGAAVlE91v5PpQTxWpPbfl+53qdypBBQj3Sj8uJjdr/YcDSwFqFHYfAfYPmJ
	OZs3h9tlhWBdZhxc8EgH7aoipJ+YjsSdKQpskNGX+zDeFJSfkVskmsU/RcKtKwEapBIb1GSoRRW
	CxGF9svarFYNWYj8o22aoxsdZB5ZOyPVkWXoz6tgeE0T7UL3hU4fCSV17BgJxQijn0KJ4yuVZ5T
	9y5ZXs5ttsY+6dO2hyR4Mv/tushlNZDXaxX0GyWuWqSdteFdPHvnuJlebhpJOL67KSrkyxkd19u
	GH+B08rev+W82YXAOrIlmpu3WOyu+jqwDAHT/Ww18wIsxKlcIhMTIAOC2ZPjJ4WCclJs4UFEgGw
	6/S+3C55U5t1qQtilJWGHs1knUZe4b2J0Tdn+eGMV8HCIC1GVDlgQUDu3vonCw/2TiQiGfsXGep
	w1y9P5y5MfDEjIME1v80Q0PcCVFeNolvqO+HXY=
X-Received: by 2002:a05:701b:4587:b0:143:26cf:8615 with SMTP id a92af1059eb24-18512b42d8emr13262304c88.25.1792432499621;
        Mon, 19 Oct 2026 10:54:59 -0700 (PDT)
Received: from localhost.localdomain ([136.126.251.209])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c5cb39esm31837697c88.22.2026.10.19.10.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:54:58 -0700 (PDT)
From: Henry Zhang <henryzhang62@gmail.com>
To: henryzhang62@gmail.com,
	Maxime Ripard <mripard@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/vc4: dsi: Serialize host transfers
Date: Mon, 19 Oct 2026 10:49:30 -0700
Message-ID: <20261019174930.7237-4-henryzhang62@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019174930.7237-1-henryzhang62@gmail.com>
References: <20261019174930.7237-1-henryzhang62@gmail.com>
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

vc4_dsi_host_transfer() fills the command FIFOs and the TXPKT registers
and waits on a single completion without any locking. Two callers
sending at the same time, for example a panel driver and a backlight
update, can overwrite each other's packets, and the timeout recovery
added in the previous patch could reset the block under a transfer
that is still in flight.

Hold a mutex for the whole host transfer, including the recovery.

Signed-off-by: Henry Zhang <henryzhang62@gmail.com>
---

Notes:
    New in v2 (Sashiko review).

 drivers/gpu/drm/vc4/vc4_dsi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
index 2d985bc..627adf0 100644
--- a/drivers/gpu/drm/vc4/vc4_dsi.c
+++ b/drivers/gpu/drm/vc4/vc4_dsi.c
@@ -25,6 +25,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/dmaengine.h>
 #include <linux/io.h>
+#include <linux/mutex.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
@@ -595,6 +596,8 @@ struct vc4_dsi {
 	 */
 	struct clk *pixel_clock;
 
+	/* Serializes host transfers, including the recovery after a timeout. */
+	struct mutex transfer_lock;
 	struct completion xfer_completion;
 	int xfer_result;
 	int irq;
@@ -1434,6 +1437,8 @@ static ssize_t vc4_dsi_host_transfer(struct mipi_dsi_host *host,
 	u32 disp0_ctrl;
 	ssize_t ret;
 
+	guard(mutex)(&dsi->transfer_lock);
+
 	ret = vc4_dsi_transfer(dsi, msg);
 	if (ret != -ETIMEDOUT)
 		return ret;
@@ -1911,6 +1916,7 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct vc4_dsi *dsi;
+	int ret;
 
 	dsi = devm_drm_bridge_alloc(&pdev->dev, struct vc4_dsi, bridge, &vc4_dsi_bridge_funcs);
 	if (IS_ERR(dsi))
@@ -1918,6 +1924,9 @@ static int vc4_dsi_dev_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dsi);
 
 	dsi->pdev = pdev;
+	ret = devm_mutex_init(dev, &dsi->transfer_lock);
+	if (ret)
+		return ret;
 #ifdef CONFIG_OF
 	dsi->bridge.of_node = dev->of_node;
 #endif
-- 
2.47.3

