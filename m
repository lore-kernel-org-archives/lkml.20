Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794246482;
	b=ZQhGZcOFt/23noWFdqC9i6ygF+CzZKWvpRvRgpxdKjZsHgwk8QLAcddG3p//ngCLwwoR
	 FYkbwffje2r/VJ3VCfPiH2lrg0251pDqYFClTOUfqcsJOcQTYz2xVSR/J4wIaBD23kr3Z
	 WvCx49VlcYrzkF45ysJ/G+VYAhxqXH87HTSVWbcxX/gqPnjqNIuAMwWQrb5QhDIufW116
	 cUwDYnxs45wxNcQiFlueLfmr0BslQbEWTOfgmvRgcZ3/8buV/4P2ww+F2er7pE9f2pxTC
	 d00QOQseHLlQO9we+LCRYND8NEyFGNCuxW0MDRrSepP331o4gWZYK1va+V0m/SJXCeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794246482;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tczO0T2acqzLBXDm0bXtzLxXrF1+AKk/7INkxfR+dio=;
	b=Rjocp/vDF7RdV/cEsUSxc9zdh7QMVgOAuIL1ZHdGevMF3ZPV+3CVwsNioNl4bn+fkUmJ
	 +/kYGX4Y49gcI/P81DsczyBTOtqCweZJ84lBrCCI9lLyIXv1B0M4s21pPB7jbl4LRwblj
	 ZTA8Qui7UaH+pjg0wh0HdFak1uN3lck7pcM9eGpOtuCB08Gi13UhFILCIOjF55P62feVk
	 M0Or4+rCJzvhXSN882hdN3KbBPkP0O0q5XswNazdxxOXUhHvq4ps/fP7Hnee3sOBOZh7N
	 IoFW5PTqFiu35KBvu+OfOtxfAkp4J0S6Ac0/VK9GT2jImmzFnReQZ+TkC0AxfgoHd1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=OV5rh1oA;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464D860A2634
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 17:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 464D860A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=OV5rh1oA
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490585eddfcso970421f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 09:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794246481; x=1794851281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tczO0T2acqzLBXDm0bXtzLxXrF1+AKk/7INkxfR+dio=;
        b=OV5rh1oAMSZdpVKbq/NriZTyay8/W8OE2CeSgfLLXfT95l4zVXRS+i/3QYOzlm7cRb
         5f3SNszNs39EHFU0EniBTgMJYf88n7Gc/+yVK8EB1XJlqU2MoXMSFH0cZZjHdBItFR83
         az1JQ5SrG/l+VV5ECHGrp7eQ8iI6vnwAjmcXsDTdmKJPGKLRMBAtXPtbgbEnFPpf5YyX
         N6NiAcqVOTsIgcYjksiBr1JszhwRetumagyQYW1kYgxpyfFqwZnLJt+z+3Rd1qsMZCrK
         WGRaj7PQd8mzNz5bfA+oULp7dllZxfAKiVsc0RazcLGG42K39ipnc4XsOJSO05QFm0/e
         yJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794246481; x=1794851281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tczO0T2acqzLBXDm0bXtzLxXrF1+AKk/7INkxfR+dio=;
        b=tE8z6RJTLOPTQwxByp0zmq2cVVYP9+SgczmmHfNHvMXOfquZtmHFzsQkN0LeffWNVv
         nb2oiJfxPjTO1OjJr8LIr0GZoeAzio1JfsAQViBbeQOacEwLZC8IQ780FXeE4yyDb+KZ
         blb4LBXBcMipmbxMoCKoSW4BMVYE3KtMZTilLHsim+6NeRJgdClyMJOGX2zLGqd49hqx
         Z+CkTRa+F16+PN3cNCpjqs4Y+pLCoDVviRPWl8KDJZRM4SOVJrxxindrVSspYaQrTibK
         mmrv/xM17qsIg4f3wfVZgnnQkPX5akd0MRHiTVvt9NNNN63e5K5H+wdBwRQ16oySwsJk
         JQow==
X-Forwarded-Encrypted: i=1; AL+hErEPYLjUAAWFYhpOCQ90owhBggavCFuDWnpp3bJVxFIAdwURCmyg53vSbSDZcadg8NEsih0ehelzGyfkPZI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+a6uIFgrTJ+Iwzy+0ESZxByG8BTmT9miBkoLvT4W/2a9de5CJH
	SlZdPz+4815fsb78Pu9ng5QaLqFc+36Rz1T/pnAOF2kZSQuS/QkHNtIXw7tLTooxsQ8=
X-Gm-Gg: AYBFou0vYfPcjCX+Ns0J/8Vb2d9L4kwK38QBTdiy4JjCTVMw1gjohidYxjsMt5fkpkC
	MCOufQWRFzgBiA0m4bsAQwgPBmQX7GxRNwzpx1h7SunPxphTkpyeIRxhlexZ/9Y8cO03E+IUCPR
	TD+dTA9lA8W52MPpKJ/7rY3+Kc3ck97MoTld8990H8hQ6MmkbIlfz1UGojv5kICa8jG/63+nhwU
	Waunyfpp/UEYDNPdaXtbQ9lcSdtccjLodq0WtIcrI+/8EY8h91+C4y2xAqpzQaGeYZvNvGZa0v7
	IbcG/ARv3tdUveQpUvdOLEoC8WB51ly/ra9EyBKq07S1fignGcAxQB02k7+dUdJ3wbm1I+FfQEn
	KMW3BXkGS15nEo+o7HwaJfMoVzI0ncqyrle7Y871k2OUjTNbJspohvF/p7Gyqx55xW7nbfUAQbD
	rKcwoVFKmffnWTdPfDi61AK6bFzBzJLK0Pf5bs7hYlAUeUGfPL06fyLNN+yjA6IYO6hjD0kVHZ7
	F1ustvWJSoFchvF3c4owLQmk6SoebTIkO0FlnQ+Pgo56P8VWsPtiNlOWqQ4NMRYQW0LS+pLfmV4
	GUF9mzSvhwA2WuwILqidm7XBFSt2Ee1QpHg4uXMldjfA6UQFmE3mXgDpLAcYSRuPHdbEwdFqdcB
	hWEo0G6YhZg==
X-Received: by 2002:a05:6000:25f1:b0:491:9fc1:e6c2 with SMTP id ffacd0b85a97d-498318067demr229440f8f.51.1794246480672;
        Mon, 09 Nov 2026 09:48:00 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:e834:fd4d:2ecb:b787])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a3f4esm167322f8f.53.2026.11.09.09.48.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 09:48:00 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v4 5/5] drm/panel: Add the HiBy LG35583
Date: Mon,  9 Nov 2026 18:46:40 +0100
Message-ID: <20261109174640.96951-6-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261109174640.96951-1-olivier@mgcrea.io>
References: <20261109174640.96951-1-olivier@mgcrea.io>
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

The 480x800 parallel RGB panel of the HiBy R1. It is set up over a 3-wire
SPI bus with 16-bit words, each carrying a register address byte or a
data byte, which no existing panel driver speaks. The set-up sequence is
the vendor kernel's; prepare sends it up to sleep-out, and enable and
disable switch the display on and off. It asks for BGR666: in RGB order the
R1 shows red and blue swapped.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 MAINTAINERS                                |   1 +
 drivers/gpu/drm/panel/Kconfig              |  10 +
 drivers/gpu/drm/panel/Makefile             |   1 +
 drivers/gpu/drm/panel/panel-hiby-lg35583.c | 342 +++++++++++++++++++++
 4 files changed, 354 insertions(+)
 create mode 100644 drivers/gpu/drm/panel/panel-hiby-lg35583.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ddc559cac674..062270232344 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8350,6 +8350,7 @@ DRM DRIVER FOR HIBY LG35583 PANEL
 M:	Olivier Louvignes <olivier@mgcrea.io>
 S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/hiby,lg35583.yaml
+F:	drivers/gpu/drm/panel/panel-hiby-lg35583.c
 
 DRM DRIVER FOR HIMAX HX8394 MIPI-DSI LCD panels
 M:	Ondrej Jirman <megi@xff.cz>
diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 26ffa2378f55..79528ff0100a 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -209,6 +209,16 @@ config DRM_PANEL_LVDS
 	  handling of power supplies or control signals. It implements automatic
 	  backlight handling if the panel is attached to a backlight controller.
 
+config DRM_PANEL_HIBY_LG35583
+	tristate "HiBy LG35583 RGB/SPI panel"
+	depends on OF && SPI
+	help
+	  Say Y here if you want to enable support for the LG35583, the
+	  480x800 parallel RGB panel of the HiBy R1 digital audio player,
+	  which is set up over a 3-wire SPI bus.
+
+	  To compile this driver as a module, choose M here.
+
 config DRM_PANEL_HIMAX_HX8279
 	tristate "Himax HX8279-based panels"
 	depends on OF
diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
index 365f2e73f6b4..9f5cacfaba29 100644
--- a/drivers/gpu/drm/panel/Makefile
+++ b/drivers/gpu/drm/panel/Makefile
@@ -21,6 +21,7 @@ obj-$(CONFIG_DRM_PANEL_ELIDA_KD35T133) += panel-elida-kd35t133.o
 obj-$(CONFIG_DRM_PANEL_FEIXIN_K101_IM2BA02) += panel-feixin-k101-im2ba02.o
 obj-$(CONFIG_DRM_PANEL_FEIYANG_FY07024DI26A30D) += panel-feiyang-fy07024di26a30d.o
 obj-$(CONFIG_DRM_PANEL_FOCALTECH_OTA7290B) += panel-focaltech-ota7290b.o
+obj-$(CONFIG_DRM_PANEL_HIBY_LG35583) += panel-hiby-lg35583.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX8279) += panel-himax-hx8279.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83102) += panel-himax-hx83102.o
 obj-$(CONFIG_DRM_PANEL_HIMAX_HX83112A) += panel-himax-hx83112a.o
diff --git a/drivers/gpu/drm/panel/panel-hiby-lg35583.c b/drivers/gpu/drm/panel/panel-hiby-lg35583.c
new file mode 100644
index 000000000000..9189c7c19665
--- /dev/null
+++ b/drivers/gpu/drm/panel/panel-hiby-lg35583.c
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The LG35583 panel of the HiBy R1
+ *
+ * Copyright (c) 2026 Olivier Louvignes <olivier@mgcrea.io>
+ *
+ * A 480x800 parallel RGB panel, set up over a 3-wire SPI bus with 16-bit
+ * words: 0x20 and a register's high byte, 0x00 and its low byte, then 0x40
+ * and each data byte. HiBy calls it the LG35583; its controller is not
+ * identified. The set-up sequence is the one the vendor kernel sends.
+ */
+
+#include <linux/delay.h>
+#include <linux/gpio/consumer.h>
+#include <linux/media-bus-format.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
+#include <linux/spi/spi.h>
+
+#include <drm/drm_modes.h>
+#include <drm/drm_panel.h>
+
+#define LG35583_ADDR_HI		0x2000
+#define LG35583_ADDR_LO		0x0000
+#define LG35583_DATA		0x4000
+
+#define LG35583_SLPIN		0x1000
+#define LG35583_SLPOUT		0x1100
+#define LG35583_DISPOFF		0x2800
+#define LG35583_DISPON		0x2900
+#define LG35583_RAMWR		0x2c00
+
+struct lg35583_write {
+	u16 reg;	/* 0: wait val milliseconds */
+	s16 val;	/* -1: no data */
+};
+
+#define REG(r, v)	{ (r), (v) }
+#define CMD(r)		{ (r), -1 }
+#define DELAY(ms)	{ 0, (ms) }
+
+static const struct lg35583_write lg35583_init[] = {
+	REG(0xb100, 0x06), REG(0xb101, 0x01), REG(0xb102, 0x54),
+	REG(0xb104, 0x07), REG(0xb105, 0x06), REG(0xb106, 0x06),
+	REG(0xb107, 0x4a), REG(0xb108, 0x21), REG(0xb109, 0x08),
+	REG(0xf101, 0xc0), REG(0xf103, 0x01),
+	DELAY(5),
+	REG(0xb400, 0x01), REG(0xb600, 0x10),
+	REG(0x3a00, 0x77), REG(0x3b00, 0x03), REG(0x5e04, 0x02),
+	REG(0x3600, 0x08),
+	DELAY(5),
+	/* Gamma */
+	REG(0xe000, 0x00), REG(0xe001, 0x2f), REG(0xe002, 0x3f),
+	REG(0xe003, 0x1f), REG(0xe004, 0x21), REG(0xe005, 0x2c),
+	REG(0xe006, 0x2c), REG(0xe007, 0x61), REG(0xe008, 0x1c),
+	REG(0xe009, 0x18), REG(0xe00a, 0xbc), REG(0xe00b, 0x27),
+	REG(0xe00c, 0x59), REG(0xe00d, 0x6a), REG(0xe00e, 0xbb),
+	REG(0xe00f, 0xbe), REG(0xe010, 0x3e), REG(0xe011, 0x48),
+	REG(0xe100, 0x00), REG(0xe101, 0x32), REG(0xe102, 0x45),
+	REG(0xe103, 0x26), REG(0xe104, 0x21), REG(0xe105, 0x2c),
+	REG(0xe106, 0x5c), REG(0xe107, 0x63), REG(0xe108, 0x1c),
+	REG(0xe109, 0x19), REG(0xe10a, 0xd3), REG(0xe10b, 0x28),
+	REG(0xe10c, 0x59), REG(0xe10d, 0x6b), REG(0xe10e, 0xdb),
+	REG(0xe10f, 0xde), REG(0xe110, 0x5f), REG(0xe111, 0x6b),
+	REG(0xe200, 0x7f), REG(0xe201, 0x7d), REG(0xe202, 0x86),
+	REG(0xe203, 0x89), REG(0xe204, 0x10), REG(0xe205, 0x1e),
+	REG(0xe206, 0x41), REG(0xe207, 0x77), REG(0xe208, 0x0d),
+	REG(0xe209, 0x1d), REG(0xe20a, 0xc8), REG(0xe20b, 0x30),
+	REG(0xe20c, 0x5f), REG(0xe20d, 0x71), REG(0xe20e, 0xc3),
+	REG(0xe20f, 0xbe), REG(0xe210, 0x3e), REG(0xe211, 0x48),
+	REG(0xe300, 0x7f), REG(0xe301, 0x7f), REG(0xe302, 0x86),
+	REG(0xe303, 0x93), REG(0xe304, 0x10), REG(0xe305, 0x1e),
+	REG(0xe306, 0x41), REG(0xe307, 0x89), REG(0xe308, 0x0d),
+	REG(0xe309, 0x1d), REG(0xe30a, 0xe0), REG(0xe30b, 0x30),
+	REG(0xe30c, 0x5f), REG(0xe30d, 0x70), REG(0xe30e, 0xe4),
+	REG(0xe30f, 0xdf), REG(0xe310, 0x5f), REG(0xe311, 0x6b),
+	REG(0xe400, 0x00), REG(0xe401, 0x43), REG(0xe402, 0x6f),
+	REG(0xe403, 0x60), REG(0xe404, 0x21), REG(0xe405, 0x2c),
+	REG(0xe406, 0x5a), REG(0xe407, 0x6d), REG(0xe408, 0x1c),
+	REG(0xe409, 0x18), REG(0xe40a, 0xc6), REG(0xe40b, 0x27),
+	REG(0xe40c, 0x59), REG(0xe40d, 0x6a), REG(0xe40e, 0xbb),
+	REG(0xe40f, 0xbe), REG(0xe410, 0x3e), REG(0xe411, 0x48),
+	REG(0xe500, 0x00), REG(0xe501, 0x46), REG(0xe502, 0x75),
+	REG(0xe503, 0x67), REG(0xe504, 0x21), REG(0xe505, 0x2c),
+	REG(0xe506, 0x5a), REG(0xe507, 0x7e), REG(0xe508, 0x1c),
+	REG(0xe509, 0x19), REG(0xe50a, 0xdd), REG(0xe50b, 0x28),
+	REG(0xe50c, 0x59), REG(0xe50d, 0x6b), REG(0xe50e, 0xdb),
+	REG(0xe50f, 0xde), REG(0xe510, 0x5f), REG(0xe511, 0x6b),
+	DELAY(5),
+	REG(0xc200, 0x70), REG(0xc202, 0x70), REG(0xc203, 0x44),
+	DELAY(20),
+	REG(0xc200, 0x51), REG(0xc201, 0x06), REG(0xc202, 0x51),
+	REG(0xc203, 0x66),
+	DELAY(20),
+	REG(0xc100, 0x45),
+	DELAY(5),
+	REG(0xc700, 0x46), REG(0xc000, 0xa3), REG(0xc002, 0x8a),
+	DELAY(5),
+	CMD(LG35583_SLPOUT),
+	DELAY(130),
+};
+
+struct lg35583 {
+	struct drm_panel panel;
+	struct spi_device *spi;
+	struct gpio_desc *reset;
+	struct regulator *vcc;
+	struct regulator *vccio;
+};
+
+static const struct drm_display_mode lg35583_mode = {
+	.clock = 28000,
+	.hdisplay = 480,
+	.hsync_start = 480 + 24,
+	.hsync_end = 480 + 24 + 24,
+	.htotal = 480 + 24 + 24 + 24,
+	.vdisplay = 800,
+	.vsync_start = 800 + 14,
+	.vsync_end = 800 + 14 + 5,
+	.vtotal = 800 + 14 + 5 + 8,
+	.flags = DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC,
+	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
+};
+
+static struct lg35583 *to_lg35583(struct drm_panel *panel)
+{
+	return container_of(panel, struct lg35583, panel);
+}
+
+static int lg35583_word(struct lg35583 *ctx, u16 word)
+{
+	/* Copied to a DMA-safe buffer. */
+	return spi_write_then_read(ctx->spi, &word, sizeof(word), NULL, 0);
+}
+
+static int lg35583_cmd(struct lg35583 *ctx, u16 reg)
+{
+	int ret;
+
+	ret = lg35583_word(ctx, LG35583_ADDR_HI | (reg >> 8));
+	if (ret)
+		return ret;
+	return lg35583_word(ctx, LG35583_ADDR_LO | (reg & 0xff));
+}
+
+static int lg35583_write(struct lg35583 *ctx, const struct lg35583_write *w)
+{
+	int ret;
+
+	if (!w->reg) {
+		msleep(w->val);
+		return 0;
+	}
+
+	ret = lg35583_cmd(ctx, w->reg);
+	if (ret || w->val < 0)
+		return ret;
+	return lg35583_word(ctx, LG35583_DATA | w->val);
+}
+
+static int lg35583_prepare(struct drm_panel *panel)
+{
+	struct lg35583 *ctx = to_lg35583(panel);
+	unsigned int i;
+	int ret;
+
+	ret = regulator_enable(ctx->vccio);
+	if (ret)
+		return ret;
+	usleep_range(5000, 6000);
+
+	ret = regulator_enable(ctx->vcc);
+	if (ret)
+		goto err_vccio;
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(ctx->reset, 0);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset, 1);
+	msleep(50);
+	gpiod_set_value_cansleep(ctx->reset, 0);
+	msleep(30);
+
+	for (i = 0; i < ARRAY_SIZE(lg35583_init); i++) {
+		ret = lg35583_write(ctx, &lg35583_init[i]);
+		if (ret) {
+			dev_err(panel->dev, "Unable to set up the panel: %d\n", ret);
+			goto err_vcc;
+		}
+	}
+
+	return 0;
+
+err_vcc:
+	gpiod_set_value_cansleep(ctx->reset, 1);
+	regulator_disable(ctx->vcc);
+err_vccio:
+	regulator_disable(ctx->vccio);
+	return ret;
+}
+
+static int lg35583_enable(struct drm_panel *panel)
+{
+	struct lg35583 *ctx = to_lg35583(panel);
+	int ret;
+
+	ret = lg35583_cmd(ctx, LG35583_DISPON);
+	if (ret)
+		return ret;
+
+	return lg35583_cmd(ctx, LG35583_RAMWR);
+}
+
+static int lg35583_disable(struct drm_panel *panel)
+{
+	struct lg35583 *ctx = to_lg35583(panel);
+	int ret;
+
+	ret = lg35583_cmd(ctx, LG35583_DISPOFF);
+	usleep_range(5000, 6000);
+	return ret;
+}
+
+static int lg35583_unprepare(struct drm_panel *panel)
+{
+	struct lg35583 *ctx = to_lg35583(panel);
+
+	lg35583_cmd(ctx, LG35583_SLPIN);
+	usleep_range(5000, 6000);
+
+	gpiod_set_value_cansleep(ctx->reset, 1);
+	regulator_disable(ctx->vcc);
+	regulator_disable(ctx->vccio);
+	return 0;
+}
+
+static int lg35583_get_modes(struct drm_panel *panel, struct drm_connector *connector)
+{
+	/* Red and blue are swapped on the R1 without it. */
+	static const u32 bus_format = MEDIA_BUS_FMT_BGR666_1X18;
+	struct drm_display_mode *mode;
+
+	mode = drm_mode_duplicate(connector->dev, &lg35583_mode);
+	if (!mode)
+		return -ENOMEM;
+
+	drm_mode_set_name(mode);
+	drm_mode_probed_add(connector, mode);
+
+	connector->display_info.bpc = 6;
+	connector->display_info.bus_flags = DRM_BUS_FLAG_DE_HIGH |
+					    DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE;
+	drm_display_info_set_bus_formats(&connector->display_info, &bus_format, 1);
+
+	return 1;
+}
+
+static const struct drm_panel_funcs lg35583_funcs = {
+	.prepare = lg35583_prepare,
+	.enable = lg35583_enable,
+	.disable = lg35583_disable,
+	.unprepare = lg35583_unprepare,
+	.get_modes = lg35583_get_modes,
+};
+
+static int lg35583_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct lg35583 *ctx;
+	int ret;
+
+	ctx = devm_drm_panel_alloc(dev, struct lg35583, panel, &lg35583_funcs,
+				   DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
+
+	ctx->spi = spi;
+	spi_set_drvdata(spi, ctx);
+
+	spi->bits_per_word = 16;
+	ret = spi_setup(spi);
+	if (ret)
+		return dev_err_probe(dev, ret, "Unable to set up SPI\n");
+
+	ctx->vcc = devm_regulator_get(dev, "vcc");
+	if (IS_ERR(ctx->vcc))
+		return dev_err_probe(dev, PTR_ERR(ctx->vcc), "Unable to get vcc\n");
+
+	ctx->vccio = devm_regulator_get(dev, "vccio");
+	if (IS_ERR(ctx->vccio))
+		return dev_err_probe(dev, PTR_ERR(ctx->vccio), "Unable to get vccio\n");
+
+	/*
+	 * Deasserted, which keeps a panel the boot loader left on as it is, but
+	 * as an output: after a reset the pin is an input, and prepare's reset
+	 * pulse would never reach the panel.
+	 */
+	ctx->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->reset))
+		return dev_err_probe(dev, PTR_ERR(ctx->reset), "Unable to get reset\n");
+
+	ret = drm_panel_of_backlight(&ctx->panel);
+	if (ret)
+		return ret;
+
+	drm_panel_add(&ctx->panel);
+	return 0;
+}
+
+static void lg35583_remove(struct spi_device *spi)
+{
+	struct lg35583 *ctx = spi_get_drvdata(spi);
+
+	drm_panel_remove(&ctx->panel);
+}
+
+static const struct of_device_id lg35583_of_match[] = {
+	{ .compatible = "hiby,lg35583" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, lg35583_of_match);
+
+static const struct spi_device_id lg35583_ids[] = {
+	{ "lg35583" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, lg35583_ids);
+
+static struct spi_driver lg35583_driver = {
+	.probe = lg35583_probe,
+	.remove = lg35583_remove,
+	.id_table = lg35583_ids,
+	.driver = {
+		.name = "panel-hiby-lg35583",
+		.of_match_table = lg35583_of_match,
+	},
+};
+module_spi_driver(lg35583_driver);
+
+MODULE_AUTHOR("Olivier Louvignes <olivier@mgcrea.io>");
+MODULE_DESCRIPTION("HiBy R1 LG35583 panel driver");
+MODULE_LICENSE("GPL");
-- 
2.39.5

