Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806850;
	b=Kzpmtux9UK4Na8Y0PB+maaqwk8xtuXfG/kd4OOihakp0b6EpgmQtzLBzUm8MSks5zY8t
	 +2/pcnp7ras0SnochFBK7BRJyP8zV5ybI27P68v2S0f4v0JBDP/mV+RVqlpRyChRfCgzw
	 lCGbdzeQ/loxBXSiwevzWoviW5zKcAM3q6ghgImcYfpmO3r+Cr67z8ncTFchR4QmiZOPd
	 WQqoBKNCW6oNBgl+u2ZiuYJLfNRW41XtIbNHjuyIi2rHqF7/ppk50PbqAC4bOFoKWolqX
	 3sm3RV5+zasXnXN0FPx4VeZh31FJrVPp2W5Slwd60gMchCPBP/CkdZw3mudlVFJmkvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zvERbDGiSiR6GByxVkFLzYXaCstRo5terpd4p4QbZQI=;
	b=xT+wqHOMRvC568LUzSohhwdjYUkdSEQ2hD1ue5HjkHVITMPsgiSAXPNYd0pJ281VpO1U
	 AkO/Rz3fXIh4OmUO/Bzk6fAPToerVzBZZh2I8vFuEIWtz+QjPUTwrpCoBnK4LLJaH/Y/M
	 X5PPeGHGJzxvbTIm1AxHtlm2NmaYL+5KDOJIs3bGfSse1/qd/yW0669MuaoIe23EKfdix
	 MGTM/3AlaUYzDucHiyN36AJ+gPfBeI6Bx5CkfImTN4MJt8t+dCqPnOmVwVMjAhv5LuUFl
	 IYEHDEw0WH7CcW261DfRnGLxJIA20eThOVfI8uaYnddAvSI7CF1DER6kxAX+/6PKFlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQlblhL5;
	arc=none smtp.remote-ip=74.125.224.132
Received: from mail-yx2-f4.google.com (mail-yx2-f4.google.com [74.125.224.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C5D606A323
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C5D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HQlblhL5
Received: by mail-yx2-f4.google.com with SMTP id 956f58d0204a3-67dadb25d08so494395d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794806848; x=1795411648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zvERbDGiSiR6GByxVkFLzYXaCstRo5terpd4p4QbZQI=;
        b=HQlblhL58lr/wiCr7vhfgv7eIS3XoJ6kk0WGDhuddytLJDyh1Ecpqb4G+ubAY1OB0A
         WH+iVuB0t7dWz2rVvg/cyUPHftHtvouRKoy94sekmC1Tepp3NRICTLn+V8O9X2qi7I2n
         E88czHyIIiPxww6eYgfOaC80LvqngT1HOoopSSa3pgAUM7JDK0Z+eyCLSnLvDIBFxPCD
         aqiqs9VUpmPu4Dp0UPyDhV+5Pz2AUXfc+qiC/VqS5IT0QWveD3EMVasMDUVZKoOQE5ms
         wQOvGnG+HE/jL3JFuCw8D5pV+My/7zKq9Le83qsq5Z+GSqQ3sjjNcpLH1FNrTeoujH/v
         wG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806848; x=1795411648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zvERbDGiSiR6GByxVkFLzYXaCstRo5terpd4p4QbZQI=;
        b=Pd2Bkb27yjkR+Owg6sce/6TkdGFdfifbMPNT+Hnci3ZHh6d+ksa5BeZef1X7hN2Qxy
         DYOKjP+VoaQJVUDkMql3nXgGILydoRp4AnLCmM4KqVAru93/Xk8BswfDVa2NcoH2IKJy
         qm4efGDWIICcMkgzvI7ZD93P03HXDDDFBtUaHcPYSh7ySnILVMdV62lwZnN29q3fx7DH
         QYt5CHIgrBDnwQtBsu2BGPw4LVzrpimSzijB0JHMTjzCtAmucYrtALFXktXHdI16kB4o
         MDznMbYaU/rI8z5TLn5JzHluhTxHgL4TgvhJVEdPGi5v98AVcpnfEhxkx0JBk1zXSRCj
         5WLQ==
X-Gm-Message-State: APuU4Z+yB3TKz0q3rCyzvdvpi62T8/cnJSihAmwOjaauoo7U7yudnQx5
	xbDlpcJY+f8sG9nxLKlNslgAiYt93q/13yHctHNt70mWZgDgSSMvVfRr
X-Gm-Gg: AZFdTZeeQhPCoJNRBYElx7jKgirhMB+SEXSZMQZSXekrXlYQ4/NcXqUFVOpTbSeNk9H
	qIy4HbZhBviIkMXv672dWCuTpOtCtsMh1zsh9/6qRNYMhjfteb8KjuDWnUbM1yWf+6elXedFjJX
	Bs+jiGxGfcixjrXHTn9xjDd4ZcY1si/i1VXZaI1R31r+gGs/wHqc09fooR5hX5fl1WacTIBg83N
	bjrCcicDQ4ZnTvDB3OhVNUGEOY9iqKEaa+5SC9BQpDzM5JzaZ9s2Vy4yMQp7NK/j5X1E9POlUfU
	cFMJdIHkCSnrqvC0hy8MnJZDT+mRdUwMl69h6CHzGrBhbo1G+phuHpqV1wdXwVPVO4v/tnRq2fl
	O/78xw4d/kxbw/Muy7CdyzfCs7HWMf6g8rovHC6gEr3NcUHEYr21tU1C8RXZHLj/I+puA3c8U/M
	tPtWJ4tue+f3spislP3leFY8TvNnqOtO8UFbM58abYjgrN41WvT37UzLlhwDZLzhwG5+thGGWcN
	Xbe7gUBHtJNZp8m1eDvjGJWEFLukck8tW/9EldAmqlYf1WmErKVe9w9S0UZprdlAar1WAdjOZx2
	11KzyBwhELQUS8lTGLa2FmUNnXMC4tL90XXCOyifciF9s2W/d0swMR1LQNKrbUBMTPnGItS5I6d
	7Vi9aYa6I
X-Received: by 2002:a05:690c:446:b0:8b3:5b88:a21d with SMTP id 00721157ae682-8b4aa2f5f21mr51183477b3.58.1794806848550;
        Sun, 15 Nov 2026 21:27:28 -0800 (PST)
Received: from Xinshengs-MBP.attlocal.net ([2600:1702:7d20:7d20:28d5:8044:61b9:9cf6])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9fae24sm78414917b3.41.2026.11.15.21.27.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 21:27:28 -0800 (PST)
From: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	mchehab@kernel.org
Subject: [PATCH media v2] media: cx231xx: cancel module loading work on probe failure
Date: Mon, 16 Nov 2026 00:27:21 -0500
Message-ID: <20261116052721.14467-1-xinsheng.zhu.ny@gmail.com>
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

Fixes: ab232e46bf01 ("[media] cx231xx: enforce check for graph creation")
Signed-off-by: Xinsheng Zhu <xinsheng.zhu.ny@gmail.com>
---
Changes in v2:
- Add a Fixes tag.
- Reuse the existing err_video_alt cleanup path instead of
  duplicating resource teardown.
 
 v1: https://lore.kernel.org/linux-media/20261116035159.40755-1-xinsheng.zhu.ny@gmail.com/
 
 drivers/media/usb/cx231xx/cx231xx-cards.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/media/usb/cx231xx/cx231xx-cards.c b/drivers/media/usb/cx231xx/cx231xx-cards.c
index b0941cd2a2d8..e24c2999687e 100644
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
 
@@ -1900,8 +1906,10 @@ static int cx231xx_usb_probe(struct usb_interface *interface,
 	if (!retval)
 		retval = media_device_register(dev->media_dev);
 #endif
-	if (retval < 0)
-		cx231xx_release_resources(dev);
+	if (retval < 0) {
+		cancel_request_modules(dev);
+		goto err_video_alt;
+	}
 	return retval;
 
 err_video_alt:

base-commit: 48fe5a7834cc10081887d7bcd9ff0a4cadc3fa8c
-- 
2.54.0 (Apple Git-157)

