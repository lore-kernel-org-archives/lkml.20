Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794075740;
	b=zosCya0/YLPGI6AIWBPOdsD8cpWEehEPxk3akQuTwe+2jCBlMgkT3Khvcy/IZyB79uBt
	 mqDBQ4s3JKtiZCye8CzekpqX+RldblzKOsnnIsXWlcDP6r3wvUvHe4sASDFcK/v5VgStQ
	 3x6tF4jXMPuv5xBBuwtnLjPsusy7sA2Sz0jyedS2J1Jn+ycQxMIkidDqNooG9sWz6Ozh1
	 GxbOGHiezcY3Fm8chTJdQHxVyw3R7RMgl3KtjJHeY6OB8v/pFHVu6Tt/tIe+83KBNXk+X
	 SQylN/UNzR7GLRfw+lAoYxVdhIjRdkGqP1lLqgg4bZv0Pt70X6T06iUUpkxWBT98HHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794075740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=BYbBpOX1ICSydHDClkzINp6GH4fkbXId2tUAz3RtG28=;
	b=P7QOXxmD+3ueefLMB5UskY/MOB/ANcGhb8qCuR0L1K8Fez6hIwlWwRD/uG6GP7Hy1TXw
	 nUUyb/1d9XjnoYeWfC/NOG7yT/6FK26UvQjQEumjq7MUuTCmdaKDEqKURjZVjEXQK1mLu
	 pkJ4QD6q4rrVAEUS/N50bDrpCbN2kEDuEed4j8sMbZI+dNDo06bJMYgbZw9DRG4pLG8/u
	 9rLNTgRPeOPckooJYHehE7ZN5UKlRUHekK8CfR28+38f3sEM/Uj2UKuzVwDwIqLf4ePr5
	 BQpkOZmVELxPta52FGWvYlWKLbTxyPozMYHVjXWGoibbj0aP6NZ5o2bpxd1wwZejJqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aJCz/VDa";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849D7606A336
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 18:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 849D7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aJCz/VDa
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a2069b9710so15419915e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 10:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075739; x=1794680539; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BYbBpOX1ICSydHDClkzINp6GH4fkbXId2tUAz3RtG28=;
        b=aJCz/VDavAZzpo2452JlUXnLE1xZpmTcUpPzGhTezRh0rUVVNru8RA/kFWTzpRAT0i
         CMPc/i8NA2N3xP3dhDvE0sACc3dYQVgnneiZ6r5vocFqsr/p6tKPiscSU0ztc90qoRHI
         7neEpNODwuTFKDHi7AKKg/Z2AO/UfmGHDoNm0Z3++ZS3Ug0ICtQ8ly4D3eKzS+2cpM/P
         a9M5PcbLLiGHrbQalYD8cP+vommQKOaHdd2jL99L6K6Vyyq9LQMRRss4EMl2FdDt6nyF
         LsWQ8Poo3j8LTbBpad2OlcC7FmozqmiTpFXrAztqQPtR+d6itDN35MYhNwxSOl3HGOm+
         kjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075739; x=1794680539;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BYbBpOX1ICSydHDClkzINp6GH4fkbXId2tUAz3RtG28=;
        b=UAbTRFtbnXtF59MP+lHv/gZo4ub5rV4zpJC+FtvmfwMqQisr7tx0i/Ozk+Wuc67Mf+
         RsFGkCnEyXH2cCkfo61fOFdQAPvNYcu9YbAZ6qLF28r3MXS76PwKoqdJIAmU7r7oH3Hj
         7N3LloCzi6ZjxdigfCQYKxz9HGnXbyhKi6FMwSVkM8y+m0BWTuswZjpy0rIYf2M+/chY
         69CATbfWkkA1pYHMv6FpqGWzKSPpyaI60MP8huVEDEO5PTAR5GR8hTwYllD+E11JE2Rl
         BXOdSm5vX554JKQNtR7o6g5pK0/9+aq1ogn/DYcFT/cRcMODYmCIpt4l5DetejeaKiPK
         o18g==
X-Forwarded-Encrypted: i=1; AKwUvBxF0sxT5qDvtTlVlaIVW7SaJVUoPHKAzeuw/tJb5XV7PMN5dEs8dF8DaPZRxTykcg/mhq0SZcQfvnvHXNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DIwulDU57HDWVlMZIqE4vs0J/CFyNnKRVh7gcX5A6zsObzTjT
	CyiYW/aZa+Eks5UhEi6D4mBOjWseSqEB9r1e6aokEoPIyI639IhoZbji
X-Gm-Gg: AYBFou3YPWYOnaPMw6ueN82w4Y3J9V6BjjdAOQUetG452Vdkqke9Uyu4pz+EzSK6uKi
	KWir6B1w8Yh4jLlnWhRUs0rn5duAkflbd/3hEx2TlB8qAyGfSfeKccZeZZdXia2hoP3/2Hmirjp
	jh++2catVQCH9R0Jq4d8XbE78PcHDOJYs4Hfew80QmDg/8fDPcnKLQujAxnPP4wbY7RhXEjh4Az
	OcB5qOJsYkYWQRs7d1AwgvQMaS4cXSwQUuFr/izPzY6nbPB4q7dpij2jNXVh7BeBJu80W5bqwDY
	y+r+CNDkPj1WIMkI0q6o5b5+wd45zBqMEjaHN60nWjiehJHJmc1plPHOPDSN9PXdjcLxbyAmyqZ
	aNiBJdOniE3SleJ6dtM2q4+fkJuYzhJBBbKRJhZ+mtCDdJUfI4T+pH+9NMwJWl6++SPuxDGAoD1
	rt84tDpyLMnItC+yASilfwx2q0PzB28ci7iJS4G9C0U+xw0gY+ZFzGTKUsLzB6tqMwsoWWbaeaq
	pIOcSulfnBm08rcdID6oL8v7NOwcmJZqiDe313B4yxmdkDaL+KBfh8Nf8TMo1u5myxAlS3y93nD
	KvcnZKXciv5KkQP9it4lVBgEC/6+BfR7koH0zDsPueEajbAc/FZnNOJnVTxlVuQ6URLwUbT47b1
	CyESGKdasQ9TMXlI=
X-Received: by 2002:a05:600c:621b:b0:4a2:190f:cf6a with SMTP id 5b1f17b1804b1-4b6dfbab213mr101294005e9.35.1794075738943;
        Sat, 07 Nov 2026 10:22:18 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:18 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Sat, 07 Nov 2026 19:21:36 +0100
Subject: [PATCH v2 6/6] firmware: raspberrypi: Store child devices in
 struct rpi_firmware
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
Message-Id: <20261107-fix-raspberrypi-firmware-v2-6-5bfe605a5cc5@gmail.com>
References: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
In-Reply-To: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4093;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=wnTc0W2BT1b0hDhYdyzMhCioXM95BZxCQUV9L0U+rtQ=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xVTOn9p+UeYx1LoZfu9GlsXkE40Y6WNtsSS
 +MImAgLElGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z8GkD/98oNq7SqOLXbbquxf4gMviUgoSLFQIpBCwWLeMzTHstaWkDzT8DAmIGfoFooxSqx3nUXZ
 jRRcV2BxL4jrVswFW3UySET4koaqLh45TQThXdpLsVoiNis4Es9lc/oxAFjzidIs+itmuCPd0DH
 1WXGWka9c/kPkSVNSkeLEVNC5MXjOE8U/XtazhLIzt46eIA/8nmwdOEt7bDlvlRgPVkoyH8WPgK
 1XSHj0+5GduiIXKVJvQ9+tFpmckHpr/MDjSoZNLho2zhRMGLLaj0kcvjQjaL5gvyKBHYWs0gWPV
 94lm+wp7TGVT8aRmBKFDXLmhfgOrbaJU/JTjGIhEUr7SStg0Nq761acSzyMPCOpnkcPPyK93yQb
 oefehFGxZQ7qx7R4UdIxQvgJNF3+ek4uLZzFKoYLUh/e170jbI0ZhCZe1whEERMf3dNiqGyb2sJ
 aeD/9mdj4Z6RRTuegz+PyakZR6+2gGIv7eR7q2Oj7HTs0JVBPGOjpJUN9ZttHvvpcj3VRtE2pqw
 81+mNdg6N4jF+iV0NDG6RzOgPXjXnCTD32o5rbqWyFvxzVu6G8+loVLioFxfb9KwQRqEaS88znp
 MU70kuVjyh/if7TpGIsRenUwLZyC/00FtsM3VIToNM4lBa0S8ReKFkAUcXy+4v0hOr0711cWWBE
 IVBHnyDCbn9Swfw==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

The hwmon and clock platform devices were kept in global variables.
Move them into struct rpi_firmware so each instance owns its own
children and their lifetimes are correctly paired with the parent.

Also check the return value of platform_device_register_data() so that
an error pointer is never stored.  The child devices are optional; do
not propagate registration failures so the main firmware interface
remains available.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 50 ++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index 57f21e4e65d6..d44b2c9f0d96 100644
--- a/drivers/firmware/raspberrypi.c
+++ b/drivers/firmware/raspberrypi.c
@@ -22,10 +22,6 @@
 #define MBOX_DATA28(msg)		((msg) & ~0xf)
 #define MBOX_CHAN_PROPERTY		8
 
-static struct platform_device *rpi_hwmon;
-static struct platform_device *rpi_clk;
-static struct platform_device *rpi_rtc;
-
 struct rpi_firmware {
 	struct mbox_client cl;
 	struct mbox_chan *chan; /* The property channel. */
@@ -33,6 +29,10 @@ struct rpi_firmware {
 	u32 enabled;
 
 	struct kref consumers;
+
+	struct platform_device *hwmon_dev;
+	struct platform_device *clk_dev;
+	struct platform_device *rtc_dev;
 };
 
 static DEFINE_MUTEX(transaction_lock);
@@ -203,6 +203,7 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 static void
 rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 {
+	struct platform_device *pdev;
 	u32 packet;
 	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
 					&packet, sizeof(packet));
@@ -210,13 +211,19 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 	if (ret)
 		return;
 
-	rpi_hwmon = platform_device_register_data(dev, "raspberrypi-hwmon",
-						  -1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-hwmon",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	 fw->hwmon_dev = pdev;
 }
 
-static void rpi_register_clk_driver(struct device *dev)
+static void rpi_register_clk_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct device_node *firmware;
+	struct platform_device *pdev;
 
 	/*
 	 * Earlier DTs don't have a node for the firmware clocks but
@@ -230,11 +237,16 @@ static void rpi_register_clk_driver(struct device *dev)
 		return;
 	}
 
-	rpi_clk = platform_device_register_data(dev, "raspberrypi-clk",
-						-1, NULL, 0);
+	pdev = platform_device_register_data(dev, "raspberrypi-clk",
+					     -1, NULL, 0);
+
+	if (IS_ERR(pdev))
+		return;
+
+	 fw->clk_dev = pdev;
 }
 
-static void rpi_register_rtc_driver(struct device *dev)
+static void rpi_register_rtc_driver(struct device *dev, struct rpi_firmware *fw)
 {
 	struct platform_device *pdev;
 
@@ -251,7 +263,7 @@ static void rpi_register_rtc_driver(struct device *dev)
 	if (IS_ERR(pdev))
 		return;
 
-	rpi_rtc = pdev;
+	 fw->rtc_dev = pdev;
 }
 
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
@@ -328,8 +340,8 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
-	rpi_register_clk_driver(dev);
-	rpi_register_rtc_driver(dev);
+	rpi_register_clk_driver(dev, fw);
+	rpi_register_rtc_driver(dev, fw);
 
 	return 0;
 }
@@ -348,12 +360,12 @@ static void rpi_firmware_remove(struct platform_device *pdev)
 {
 	struct rpi_firmware *fw = platform_get_drvdata(pdev);
 
-	platform_device_unregister(rpi_hwmon);
-	rpi_hwmon = NULL;
-	platform_device_unregister(rpi_clk);
-	rpi_clk = NULL;
-	platform_device_unregister(rpi_rtc);
-	rpi_rtc = NULL;
+	platform_device_unregister(fw->hwmon_dev);
+	fw->hwmon_dev = NULL;
+	platform_device_unregister(fw->clk_dev);
+	fw->clk_dev = NULL;
+	platform_device_unregister(fw->rtc_dev);
+	fw->rtc_dev = NULL;
 
 	rpi_firmware_put(fw);
 }

-- 
2.56.0

