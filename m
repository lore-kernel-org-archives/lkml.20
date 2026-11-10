Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794329287;
	b=TJOaI5K8sGcE15drh2cuLhmsVo5Q5l0nGMDbgv0z/ZX6Oh1jiORMYWvw0hnD4kBg/qUf
	 RBzVNXBNNkdYOzpoFHyY2YmVWGZA0fTNQGWAwXljf0ezuSB8EEg/bH2Wcl+FOQnoVAnVo
	 8/GyeTIDa8IaFMC7CzUWMsjd59Q10Vj/SYEw1aIoZnrqWgzjJN2z57Vx/tnpTaIabPdFM
	 D4P+NIFJbPCmyCRSVyOpg426Zyq+uHO0oX32/+5C8nFoilp1QQK7Me1tgwlY72v7UAGN/
	 ehmyy7Ou2wVQI5bksdmUg2BOROsu8eAHvwu2lDc9bpS8NtA5iopcdNkdqBxCoLhSzng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794329287;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=5jNzkTDWBY7EoZ5CQOKUTiIbRDsD/JgXPPmATkQN3UY=;
	b=px8HcfreXzQKh9meAZu/uv7D1SQ1ePojhUN4j2+iwrQZ3b9nq+R7d7KmaacY0BPPWfQv
	 aeP6JSZrjcaWbK39c7FzfW3/2+ZcK8Cc9VxgSHJJ41yhnJ38lN0ByMmkPbevCGAAZEn9d
	 rBxx5Jf6DzF1IKyOOe+4r6ziWAV+7PJ8ZGqttpgRIQsyAYTg5jwnCdyE2IECOAH0+O9n+
	 wmXUZ09pBWEWkiiPX4hnm1/9T3VBAAIhiivN52ik+9NR1bcYxTqr6SU2nipj6Vy02AGxA
	 eWPLlkVHG5TN0FXu59Y0jlVkk7oX1KX2rD2cI+Or3QxN5FbarBDRt8173YVCA0tWMdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCZF4QP4;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5994360A2631
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5994360A2631
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lCZF4QP4
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso22096055e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 08:48:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329286; x=1794934086; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5jNzkTDWBY7EoZ5CQOKUTiIbRDsD/JgXPPmATkQN3UY=;
        b=lCZF4QP4AjuhBOJJsPDMFGyzhYeIqrHW0Hn1HFxfTDI5bEYAdwIzuXsAKJHNA63LRR
         ncrgIiGXnnXgn1+yv6irzFe0FGoc/du9AubpTQ3Vnv1vrMLEpkXn//CtTugGD+4Rj8cX
         LNqgXJ0rANvrgK4vZlOK30zAHCSzeCxGpRd6xi0NxTwGjrRzoMbFI1Rig41Xvuw99+fb
         ocS+0IrFflXv24cpbB8kqB9EV4zL4u/etsEmv2tlEptPBw9cmFb3GdD1OYoS27Vax+As
         qN6RBasQHAKoJqJ8s4LD11SBTRGNhP4wesWIZsZErreMHBP5iTCzIu5CDQhRJUtnk9/D
         tZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329286; x=1794934086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5jNzkTDWBY7EoZ5CQOKUTiIbRDsD/JgXPPmATkQN3UY=;
        b=tZ58xTndnQaxe5vfYWTuZ5JmAVgq19X5dCTEP4gMtXznccemJPjhjLuFLSnxBQtbRf
         xoH2Af+qhTtAmsybn4Gbf684z+ZNKu2uN3Xlqv/mrY9ti9DFmfL6CTjyAYxa8F0LgULh
         QuBuSsCfdhBPWU0Dw634xzzoeuWluTia4eigt34S6aHVuTlrAr4CoIQZgnTS6vjdy65p
         erKrdWlaT9vI4fvLj+ggG+W/4CmZt6B9rNXHnv5fYcDAGs9/tS4F2btqB4yDkbMqyfeO
         51Nl3ab8hk20HS392PgaZMSS4mBKrcBlBnCQlczWXjGZ7kKfefDsxSU8WoL4DtMbH1S8
         ZFqw==
X-Forwarded-Encrypted: i=1; AL+hErHJIoP96LmMa8ANii78AYDEXyZvUFkqrGQPRgE7rK29V7xgnaqr892C3DQUHyPFRa+F5DtJJiycMSViW/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9k/r6LbJkNdHeEUJtxuqashYdzmRb+QjpWUB4nTIXmBjHUHX5o
	4h9oMpJdiZYDnINJgeKfVy4zxdq+a/5/1WXYEkmn0xiuzoJJpDjW1Y0bCWH3kWOkW7U=
X-Gm-Gg: AYBFou3xopQedkC5ACDQKvC5M8keSQ7DWFkOPgqwcAjSPHNFegmknh6ciPSCOH5agvn
	w3dmQYm6qj0nEUQwuSC/Gnw0/bMFoDA9szos6VIHHtfumKgHcdiJpF6pqgwtHu3LpsIiZ480Aft
	QUOgai4nVZnlJdX0xB1u+q4Ic0C9l1kE/HcRzycHSt6mRVdPzdYD5gyQiabYTIcL5Eu5dt8I/jY
	kkPxucAb6GdjQk0AlTt+FPuy80sd9qqvDc3+LFpYvBR/z5PK/SNpouiJF75PPcevEoZAPJN8ijq
	TprTljEdM5/hbwKd/n2Q2YP/Iika9jS47IQmUS/eRED9c7fnbFffvUGwnhWo9QjjxGNEPMgoGH6
	32ewXL3VZ3coIL97/vqcVSl5uccv1YLU353N6j4UJG3qUHKnQoJZbZYzIXku3CgOBcBlf8Ewnfo
	CjyX6aINmTt1gmny6lQRyilxOOZsJPvhryQZyOpSROGWYd5hpE+QIgSSAmzgk4XgfiJgMZzMn6h
	vBXg0z3ZDLXLbmzuLkBwqXqs66B1svoJT3QfuWisQ33NIGTI1K5T24ES+wvPpJj4yaDGZkFII1f
	c86yhjctmeAsRkVZTrrwR8n+mrMEcC+NtHum32RoO9869U2vHh/3yV0WyHbrzyrIsyYBA0uuIZO
	ZIuuwb13nVaAjkGjbZWo9UEQB99Hz43Mv+EHI
X-Received: by 2002:a05:600c:3b8e:b0:4b2:2ec5:8a2b with SMTP id 5b1f17b1804b1-4ba023367dbmr73326205e9.10.1794329285394;
        Tue, 10 Nov 2026 08:48:05 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:05 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Tue, 10 Nov 2026 17:47:51 +0100
Subject: [PATCH v3 5/5] firmware: raspberrypi: Store child devices in
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
Message-Id: <20261110-fix-raspberrypi-firmware-v3-5-e001feb542dd@gmail.com>
References: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
In-Reply-To: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5290;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=cCr9oSQ7ijmTl0sHNAB0mmcjcqvy+3BnH3Zv/rG+4pA=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80rA7SOj4zCwP4LvqClwcUlAL3SUUi5sg3T75
 Dso4NA7juWJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKwAAKCRB4zXhFDAXI
 Z1FaD/9nRWH78cALEuYlTOoVLuBlFwnxBDk5lcmdQPOlJvETMq+CEqsq+t6v9/eKLtLLoxEdH4T
 jw+AIUtoY81iQ33bh7PNl+0GcWB+HCWpkvnj/0c8jZq8ARhpoJ8aTfOgp7OWrm2VZlfwcj9JPuM
 mYDw7cxR5k4JhALV07WeqyN9XyN2bcGGEuFBPevk2Gzo9np93mc/lqwwv3/F4koHBN2d+NV+fvK
 BPuuDdFznh7RrxTMOjHjSLe3/jZ7zKBcd2kEviwcbq7aIP5ftAWwR8u5MjKZEQaEg5M/eHgSOK4
 cPo67KB1EyftRLGXBfvgWjZmfg8BQpaMc3L6vpP4EwcVRoYq+zYQXkNWbMoxc78sgdyaGhanfVH
 mOvkTuzbadxQt7fCjK26uPKs59icGp86793lHUtgc8PL5wLTpY0o6IajBCsokMm7O06AuBGAOki
 OoKtUx07MU1eRuT17r7XhF7NLUcm5p/2e0iot5gLjjdDWhNzN+PBBj0HzPGRbCnTH+DbtDkSkQm
 ZEywDAYRHWk1mXJasgT4OBmEoIdbjamtulKgd7QBQH+vorqgKfqd80VxjUnUifOAmCsDGKlc6qR
 a7ThQ91fSGhMxq1Wt/P8tIoMMazk0+g32orU0dy5vKLkKbcuOnYblQM5wbFebUEBKIwggjNEUpt
 m7SlfgYSxxcwM5Q==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867

When the raspberrypi-firmware driver is probed multiple times
(e.g. via multiple device tree nodes or dynamically loaded overlays),
rpi_firmware_probe() blindly overwrites the
global child platform device pointers rpi_hwmon and rpi_clk.

During initialization, rpi_firmware_probe() calls
rpi_register_hwmon_driver(), rpi_register_clk_driver() and
rpi_register_rtc_driver() to allocate and register new child platform
devices, storing them in global static variables. On a subsequent probe
the same platform device names are already in use, so
platform_device_register_data() fails and returns an ERR_PTR. The old
code never checked this return value and stored the error pointer
directly into the globals, overwriting the previous valid references.
When an instance is later unbound, rpi_firmware_remove() would then call
platform_device_unregister() on that error pointer (or on a pointer that
belonged to a different instance), while the previously allocated devices
were permanently leaked.

Move the hwmon, clock and rtc platform devices into struct rpi_firmware
so each instance owns its own children
and their lifetimes are correctly paired with the parent.

Also check the return value of platform_device_register_data()
so that an error pointer is never stored.
The child devices are optional; do not propagate registration
failures so the main firmware interface remains available.

Fixes: 70eea1bbb556 ("firmware: raspberrypi: Register hwmon driver")
Fixes: 91f2cf4a6b21 ("firmware: raspberrypi: register clk device")
Closes: https://sashiko.dev/#/bug/linux-667c4859-a44e-4461-aa3f-5b04056cc1d3
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 drivers/firmware/raspberrypi.c | 50 ++++++++++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 19 deletions(-)

diff --git a/drivers/firmware/raspberrypi.c b/drivers/firmware/raspberrypi.c
index ef3326d5cf30..7d8b89aeaf02 100644
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
@@ -204,6 +204,7 @@ rpi_firmware_print_firmware_revision(struct rpi_firmware *fw)
 static void
 rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
 {
+	struct platform_device *pdev;
 	u32 packet;
 	int ret = rpi_firmware_property(fw, RPI_FIRMWARE_GET_THROTTLED,
 					&packet, sizeof(packet));
@@ -211,13 +212,19 @@ rpi_register_hwmon_driver(struct device *dev, struct rpi_firmware *fw)
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
@@ -231,11 +238,16 @@ static void rpi_register_clk_driver(struct device *dev)
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
 
@@ -252,7 +264,7 @@ static void rpi_register_rtc_driver(struct device *dev)
 	if (IS_ERR(pdev))
 		return;
 
-	rpi_rtc = pdev;
+	 fw->rtc_dev = pdev;
 }
 
 unsigned int rpi_firmware_clk_get_max_rate(struct rpi_firmware *fw, unsigned int id)
@@ -329,8 +341,8 @@ static int rpi_firmware_probe(struct platform_device *pdev)
 
 	rpi_firmware_print_firmware_revision(fw);
 	rpi_register_hwmon_driver(dev, fw);
-	rpi_register_clk_driver(dev);
-	rpi_register_rtc_driver(dev);
+	rpi_register_clk_driver(dev, fw);
+	rpi_register_rtc_driver(dev, fw);
 
 	return 0;
 }
@@ -349,12 +361,12 @@ static void rpi_firmware_remove(struct platform_device *pdev)
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

