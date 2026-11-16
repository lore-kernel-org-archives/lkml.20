Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850400;
	b=WN8Rtwtic4pWWixlHb6L4romfN+w4+4gqj6DXv+iu4fun9px8coMdWlCULXr9cJRM6Lm
	 kz0IqjHnHBjKw9tLbXyQiUgoL9MOEToI4KQbMhRNhxRXqWVf1Ci2HsXNZBIBcicA41Lp4
	 Y63NOj0zxNiZtPiFfOiWrMM6fGUurOC1CRjCD726l1FMMelwb75zj8TLtbXqLnCt8Aepe
	 1f3DmI7a0p6fxG0Sln79qUBawN7N95sc3NMun5zA2E2RWXvxHyareyz1bP7LHwo0XMyTY
	 w+d4Qx3iLD+xPq/BKTkSU/k9T3j6eVgEnwm3QqVHQ+AQoj6Ay8Brc3pN61Y13oh3aBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850400;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
	b=dLzJoR9ezC3hpasmjQmKA76YvXqxmiORBa20wFQCI/GXQR8ScumaIneQpRtc2xZ65ZPz
	 MQaocbcmgoPElFylN3FMgTWO/w6CY9SSVf1tKKrL4ZNmpFAdjFwmvIEHdrJoKnHlaAfWV
	 XRqdZeC96hyCvtK0gtSqUtf7cqCv7t9bw6z+8MTfnYKFN9OAwdK9IXz+H5ILZHIZ3mA74
	 LNIf8qtwR6fyZxmyVhNPDEKMtfYzlnD6mjWkMHo9mS/HOi93bi3gxjMalX8oLJhCBV2rJ
	 QQtdMgUo0VEZSLXZvyiuzw3IFqkbc57VmUjubnCuRBISP177LoEZs284o49dy6pqHMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnKDhOwR;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C09C606A322
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:33:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C09C606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SnKDhOwR
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb606491faso12216305e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:33:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850398; x=1795455198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
        b=SnKDhOwR5tgdadrFwvHn93b37aN4q5Gh7FM4QLzz9gohk/670mFtGsPCOz6Rx77nvn
         T2/LRf4LAEbDHfP2RSUTr69b4x3uKiW2FqfeEVBgO9XQs2HgOQXvb+dF7BaBm0dQ3WCT
         sEOzMTz1Ket9y0lVXKPRejygv8nhSSpRPwPmEvCM0aWEeZg0/qW7BiH7HsctunmZx7sv
         3VraXx1ZR3FCS6wO5hjrrK3rjFEAd44vQFieUFgURPcgtX2v17VxYxLvYJ9FyVMIqmjO
         bvPiE+0oufmlt9h5BubvDGooNrFksu0X2Yl5OccED8qW2WKqcj8y5Vrqyu4NLrn4wb54
         U5GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850398; x=1795455198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hg9Uic1Jci3EVD6ABAnH87aOxyU3YxP5Q27E7GZD9Wc=;
        b=u5WfbYm39+gwx2Kz3akzKK9vXfMAleI3izkZk/b1TvP2aLdtxN0GJW8x8CBZcetT4i
         K397Ubm7Wb9zl+zgOfx3fVlxKXJvdxNr9PzQlyarmSZEuXwnEz7MgCT96nBxTTD+/vrV
         Wvraw819r/v51rhV6P1j/34WaLxmThtPyinLUTsDk44vgGPqa+AMRt3KQqwIZevLoFWG
         EJpcWh5XfFUyJ3BF5IoFqxc82zwwpbhzdp2x4CQ14X23XNt+Iltv5WEqRQDpFP4/tmes
         UsewAaz17BHplFDs3/MlEGNo3iKyBspeld7Qw9498XCBtIgsbgnt1tiWvWDVNiwj8YWJ
         4KWQ==
X-Forwarded-Encrypted: i=1; AL+hErGEmLOREaLEJgUP2Tpmups7k7AjLxUu7EMy0HpqrMxDVI8hVwgn2N9DZ3y7CgJ4mVi8osUblElAZcTOGBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+QT+mq1vctDwTyEeJaMiVzwQEgV+n6AorT171Vel/uxNG1UBJl
	FGaqFfAPxHREe0NzPVwDz6lojEX1M5X16JuwGNBGxgYy3OBrd0PbONF+
X-Gm-Gg: AYBFou1nkM61uD4hnCzSP7ba75n79dO5qKAGup2wCDX1PyJS6cCiX7GMJiEkhVyrZ2a
	I4rePV9AJGGlIkaaERNqo5+RdpXKPVNIkSxMyCOZw1+s0SmG2qDUSZj56rXtP6ZPG0wfQ+TPYlb
	9Sm5lrdLTbbMs7p+jQBXrxc376XEqW5xZ88MaDIWErHUtE9GA/FmYgdwXSxcOhAYkAi7kaTeuZ6
	3DRqdv6vcgMaJ/3caja/dGUDSlTtH2iiZEvbKcARx7KiI4uwXaWGOk+n5laNbxOTJS6W2sqrYix
	+i5YYMNj0VPr+ueI1XhKwoKYn4P1srdLjZRb/grm2bSwBNIhFDUGLZkqzuYDofV8o3r07Ic+JAG
	DRy4j7l2I66P19GUFnMaGOJ6j2DZRdpFUc02SP977MohxmU5PrJVZOMyVPikKT1bqQEGnxsYl/8
	YX4H618bNUmiIeeGZ6xmLE2ruqgk4tm6ZwfIFciprrDo5zN1AMFkmA9pXAsGqMeZ1psEOVSVe4G
	pUOvhRSgPDyR5IDO6vUUDkrFNN87VrmDZN+lOapXghOUqcxMHRBUDwOTE/P+18kMrtVeB6Te4yK
	PfeHIbSh8TG8unEYRN1OhqtaA2e2ffkZvhtykS/dg3VjrLVqe9nKTfyIpCx3X+bCI60=
X-Received: by 2002:a05:600c:8905:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb55a57c66mr161878745e9.8.1794850398200;
        Mon, 16 Nov 2026 09:33:18 -0800 (PST)
Received: from Kyiv.home.arpa ([2a0e:1d47:4093:b600:498f:88ac:2ca1:60d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430752sm3327525e9.12.2026.11.16.09.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:33:17 -0800 (PST)
From: Volodymyr Chapman <volodymyrchapman@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Volodymyr Chapman <volodymyrchapman@gmail.com>
Subject: [PATCH] media: atomisp: csi2-bridge: Don't cycle the PMC clock if its rate is correct
Date: Mon, 16 Nov 2026 17:33:06 +0000
Message-ID: <20261116173307.14169-1-volodymyrchapman@gmail.com>
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

atomisp_csi2_set_pmc_clk_freq() enables and disables the sensor's PMC
platform clock to be able to change its rate to 19.2 MHz. ACPI however
also controls this clock, through the CLKx power resource in the sensor's
_PR0, and caches the state of that power resource. When ACPI has already
turned the clock on, the clk_disable_unprepare() turns it off underneath
ACPI. ACPI keeps considering the clock to be on, so a following power-on
of the sensor does not run the clock's _ON method and the sensor does
not respond on I2C.

On a Lenovo ThinkPad 10 (20C3) with an IMX175 rear sensor this makes the
sensor's probe fail intermittently, depending on probe ordering:

  atomisp-isp2 0000:00:03.0: Found supported sensor INTCF1A:00
  imx175 i2c-INTCF1A:00: Error reading reg 0x0000: -121
  imx175 i2c-INTCF1A:00: probe with driver imx175 failed with error -121

The effect of the clock cycle was also reproduced directly: with the
sensor powered through ACPI, a single clk_prepare_enable() +
clk_disable_unprepare() of pmc_plt_clk_0 makes it stop responding.

Only cycle the clock to change its rate when it does not already run at
19.2 MHz. The DSDT's CLKx._ON methods on this machine already select the
19.2 MHz PLL.

As a side effect, a clock which the firmware left enabled at 19.2 MHz is
no longer turned off by atomisp_csi2_set_pmc_clk_freq(). It is turned off
when ACPI powers down the sensor, e.g. when the sensor driver
runtime-suspends it.

Tested on a Lenovo ThinkPad 10 (20C3, Atom Z3795, BIOS GWET50WW 1.50),
with this file built out of tree against a 7.2.15 kernel: without this
change the IMX175 probe failed on 2 out of 10 boots, with it on 0 out of
10 boots. The probe failure and the direct reproduction above match;
the boot counts on their own are too small to be conclusive. This change
was also part of a media.git next kernel (7.4.0-rc1) built with the
pending IMX175 driver, on which the IMX175 probed on both boots tested.

The problem was investigated and this patch drafted with the help of an
AI coding assistant (Claude); the testing was done on the hardware by the
submitter.

Fixes: 0af9078315c1 ("media: atomisp: csi2-bridge: Set PMC clk-rate for sensors to 19.2 MHz")
Signed-off-by: Volodymyr Chapman <volodymyrchapman@gmail.com>
---
 .../staging/media/atomisp/pci/atomisp_csi2_bridge.c   | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
index cca91c6d7..a49996e26 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_csi2_bridge.c
@@ -257,6 +257,17 @@ static int atomisp_csi2_set_pmc_clk_freq(struct acpi_device *adev, int clock_num
 		return ret;
 	}
 
+	/*
+	 * ACPI turns this clock on and off through the sensor's _PR0 power
+	 * resources, without the clk framework knowing. Cycling the clock
+	 * below turns it off underneath ACPI, which keeps considering it on,
+	 * so only do so when the rate must change.
+	 */
+	if (clk_get_rate(clk) == PMC_CLK_RATE_19_2MHZ) {
+		clk_put(clk);
+		return 0;
+	}
+
 	/*
 	 * The firmware might enable the clock at boot, to change
 	 * the rate we must ensure the clock is disabled.

base-commit: 3fc9303dba01676c2090768126e5327e341b7761
-- 
2.43.0

