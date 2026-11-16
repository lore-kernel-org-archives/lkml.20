Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801124;
	b=hX+FVPoUUKEVj8UUwRdJa8kxsZaw4XELjf+uatD4TKR0YfO8VoO+v3tTQFMZuhImPRo9
	 I2Okpdfxq5+4dRiOYWEcjgCvCRFtUH63MpNJBosz9uCXrcwJ4mmqbh4DZlJe1DJnCm63W
	 ZIExV1Q7KzDVLPXZ3WGrnmWuhU7xnv3jDJ7vgY+Vz0ls0BFTmz/8efT+RSnQnO3irPhTs
	 ycUzxYc6q4QRQaQ9FvgFK7BHYRVz8Xkyo1WWkK0CwNg0TF4FxJFuzdlt4HYrmh/I7/mTN
	 uylb7T4zHaSMwOOTvuck4QpWfySaZA9kL7ezjtph94DLgn0dK6p/b1tieLnG1u9D2Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=+QBSw5JnyJShenoN9aDMwG/bIDS9Kt5c5A1/4QeDMdE=;
	b=WhLKSaNywVOjSv6qOu6QWXHwq/FGGZNzqzFrTY29TAaRT4iyY50rk2bYxErVRM4nZxgZ
	 itXTaJlKjOa4CWVGEXs7GBAWvoF2VpZtFaIzghBW3bdnJzM1KZcttb8SoACQoG0HJRZ2C
	 uyTuL+Tl5NHzqDJPf59K89ICJ4qDSCzeoR1JIh/qYffxdzI3Xs/ISCKE+9NBaP9gE5YlH
	 SyNhBTkL9YjkMoUJvehq8FYtMUJXuvjOruIGbxiSV62IOhy/tOuh0ZDPozEhjshhmtETR
	 E011COcAhpJiImgOiC7nVTlT4okwN8EkL/RsV6tLwAMK8dka2pSMpalBIJaNCDUrqAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kk5A3Esl;
	arc=none smtp.remote-ip=74.125.224.134
Received: from mail-yx2-f6.google.com (mail-yx2-f6.google.com [74.125.224.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2D606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:52:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB2D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kk5A3Esl
Received: by mail-yx2-f6.google.com with SMTP id 956f58d0204a3-67bfda43022so1115001d50.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794801123; x=1795405923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+QBSw5JnyJShenoN9aDMwG/bIDS9Kt5c5A1/4QeDMdE=;
        b=Kk5A3EslIZIsan5XDl5LrGYxTb+D0+qGctUFhB47CTj+Zq033gaoHbtlo/Pj/j/VwU
         YOPPw6RirpzIsC3V0ievIURAb4C96VmzUn7HCE5acJHMXcbH+Tt9dxDoz5CIvNxhp46n
         qzrDSWzXGif0x60u5kKq2Xc69jznxh3W9hpp+2SCly+TETiLUyUqaSyaLCOwM1U7rbWm
         0QkjcLvraYu6zo4SLzXrTIW5uo1o939yEvgfLd0hx24EcRVujMBwcMhwXUdNdNZpLK8i
         PUOGAqebit5skzQVINph9poUVY3YRDlWW9DbpTszyEcSvu1FaTBSG3gg3OU1weqibgJt
         8nKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801123; x=1795405923;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+QBSw5JnyJShenoN9aDMwG/bIDS9Kt5c5A1/4QeDMdE=;
        b=RO1TbpB/H2ev8xkkyN7P87bgty1WaagRbXn8P4dgYOAgqMOtNj36r73oUWDS+5XoIh
         1kc/VC0H4waRjxEC2ce7TkkownGgXa3F8yQZg8bC0rEAmSlcFsy6V4N+AoJ9jviiaMB1
         U0zv65rE2iSg7ehtBUc95YlNkFdJPJd3y4K7jyqZNMfmpkuuRLlZaKS4vuJIiNu9xa/R
         2+i97jrqIUPuOpdyoCBUxvJ1iKvVlqbJTM0VdFl9N3wmXA5WfWAuE6Mt2hzu/Gmjv5y2
         E1hWjscQDTye++a/nLhMeHY43C79QkAa3P7rxS0LhlU4EAtqkiIvSgapV12WIEPGrfpl
         LBTg==
X-Gm-Message-State: APuU4Z8tQVZrwFs+yph0OSjhZsNstPl1mc7KIyQGv9KNKVx6g26Bp1VJ
	7YeasmGj0unumDzLwjObz9QEWGsGcLkUbRnJ8ygcKQdnrf+fZA0jVxPa
X-Gm-Gg: AZFdTZed8tt/ETubKnQr1SstG+tOdGNDrszEX65msamdaHzB2Aksr/P0YHkyGF+oFLP
	oLbldo8/3OKPySU33O8lTUXH+Nh6TNyo7ra8OjjPLRx3qKfZ2RVMdf3zcdzT44PoYch3nqeUdXE
	mLCJOcHDvBmoit8IHT46ffH3Owku1ZsHdlDbAGT1a+Ia7T+ZXansb+N/QVTqJVwf1w0YhxoScQK
	l0H9mxROjM5I9gCXqqyXG2uGqOXlXT2I+36d0aPh4Jpn+aLV7DqINHcROpRJxno4kx2tGoC1zL2
	S3iPt4PZA13Pq7FVC5xgAjTmn2udZcUoI7qIAD3Dg+dktYqFWJyCCchexJzd+Teuo5zTFGGqvi4
	q+9W4Jel+8dVI6N6Pyx5FIb5HkrUCCACOdEgUWUM5YDAucxsVf64oadzjF7Unfx1/M7ykP2qdUR
	9sEwldglb4bOqN5oaVfde4N+ds8pOxhKW5S98pRoAn4OcZe61wl58p5Y7h3PUsK7mDE/18EfmeK
	ueOM9tiWrJL9DrdWVUdM5Pk3quyNzhNPKU/IXM+TcUscvs22mDtiJsCNv2Mjo1avX22asBW/zv/
	knEmeTPoGnI+MY3jTB8onaa2uzYJQo6eHCrGkC2ATMzqb3hUPZUc7tKmFjQSX+x8JQtMlHVL48Y
	QGlyFmfM=
X-Received: by 2002:a05:690c:6602:b0:8b3:b358:f9fb with SMTP id 00721157ae682-8b4aa26fd0fmr50589857b3.25.1794801122737;
        Sun, 15 Nov 2026 19:52:02 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:28d5:8044:61b9:9cf6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9549fasm77253657b3.21.2026.11.15.19.52.02
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 19:52:02 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org
Subject: [PATCH media] media: cx231xx: cancel module loading work on probe failure
Date: Sun, 15 Nov 2026 22:51:59 -0500
Message-ID: <20261116035159.40755-1-xinsheng.zhu.ny@gmail.com>
X-Mailer: git-send-email 2.54.0
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

cx231xx_usb_probe() schedules asynchronous module loading before
creating and registering the media controller graph. If either
operation fails, the probe error path releases device resources
without canceling the pending work.

The work callback accesses the device structure to determine which
modules to load. Since the device structure is devm-allocated,
a failed probe may free it while the work is still pending or
running, potentially leading to a use-after-free.

Cancel the module loading work synchronously before releasing
device resources on probe failure. This ensures that the work
cannot access the device structure after it has been freed.

Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
 drivers/media/usb/cx231xx/cx231xx-cards.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index b0941cd2a2d8..f8ed894ac0ed 100644
--- a/drivers/media/usb/cx231xx/cx231xx-cards.c
+++ b/drivers/media/usb/cx231xx/cx231xx-cards.c
@@ -1533,12 +1533,18 @@ static void request_modules(struct cx231xx *dev)
 	schedule_work(&dev->request_module_wk);
 }
 
+static void cancel_request_modules(struct cx231xx *dev)
+{
+	cancel_work_sync(&dev->request_module_wk);
+}
+
 static void flush_request_modules(struct cx231xx *dev)
 {
 	flush_work(&dev->request_module_wk);
 }
 #else
 #define request_modules(dev)
+#define cancel_request_modules(dev)
 #define flush_request_modules(dev)
 #endif /* CONFIG_MODULES */
 
@@ -1900,8 +1906,12 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 	if (!retval)
 		retval = media_device_register(dev->media_dev);
 #endif
-	if (retval < 0)
+	if (retval < 0) {
+		cancel_request_modules(dev);
+		cx231xx_close_extension(dev);
 		cx231xx_release_resources(dev);
+		usb_set_intfdata(interface, NULL);
+	}
 	return retval;
 
 err_video_alt:

base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
-- 
2.54.0 (Apple Git-157)

