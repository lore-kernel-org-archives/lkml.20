Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46F24A2613
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049824; cv=none; b=pQilrzwdCP9fh03c0B3BRMTdhjh2QyE0xTLDHAvI+HYkXBgtMVK0m7ywZQp36QaDM2v5aWf9O4LwG8b12ZQsFTLk1dTpBH/pNzi3bdSRx4SxkgS03SMn6MqpR2OU9ZiZNo6TqnTHN9B7coXXWIm8E6sgSFakc1+ZX3nOtnx6CSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049824; c=relaxed/simple;
	bh=CjNNNaVv9KXfLBZwpOPF/OJsIKss3hZhjwJRSj/WrbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=APjCYx1f6xdQDKpkGfUz5cUBiXtg64xF9G27UUidR4/HWm/FOdr+FXaZjwSC+HLTa3TNpxrd3dD+/2aTJHQV+3uQbOi11q3jxQTp2Oz+bpn7bd0CfxWkF/2gpT+vFp1831TzOJvcacZ7wkUlcr4wYU7cimN4m8gSLdBdb1HyavA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gzxWmu/b; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gzxWmu/b"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so12377495e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049818; x=1789654618; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZNv1IJHXjclUxxs9te9sqmzRhOxAa9ASWy+fWccWYN4=;
        b=gzxWmu/bwG7kMmhfPbwGcJVHzzupA/7iTAJIfVa2xLu11niHy2pEnDrCxxUeN9JOMB
         vYDd2jMfzCYv1sTvsle4+D4rRRq4DnOv6PrM2iO25Yh4amp6ZsRxxt4Jz5PSoKcisqmp
         jBsYnMuO0NFa/MNaIsRZhMR1V46RdIv2/i2Pl6yd6rtpWZ+iCnS3Mr2UrNtNJF32wYkr
         VtWGfsDVEuGurmtzKyVebwJ6YF+obp89tJ8KBcaDBX4Gp1ixkZBtNN4BphUlN6jhOG2L
         P8qasAhxCIsJsHNLFdZunbFaduagVFH9OWB26QggwmjtsyTCOJzuP/hCbknXgyyPjbm5
         QfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049818; x=1789654618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZNv1IJHXjclUxxs9te9sqmzRhOxAa9ASWy+fWccWYN4=;
        b=dYR3SDdPrYiPMoeJ1TIJGLqrzL29Peks/3vThuna0gi4Umb60hXrqgJZRvl2on9PSZ
         lPqIdWcASRvBrLW0tSHqdpI4YqDJFkvaFBVaDuBVKgqEm2C7DnssQNEqRD9URsJ4PWdP
         kr5QqB0sxW7nzkrNCFrVUDPzw7iD0w0L6aRv/ZejOe/OkYXRwbTYMz45wzvEqGrTPbF4
         ozkXRZGRciuDOyl2KfZQlk0S22iHb+LejF4HplI3sKVi30VFkAi7YPXhE64h44hReF8Y
         xRt/txCo52TizErL68XlpFIpvzI0mhVgHeRsobnWD1YzX92ky6SUrop8KD9alMPnUK6t
         keWA==
X-Forwarded-Encrypted: i=1; AKwUvBx+AutRjL7qvOgAydWOQG2SJjKb0q+1+ogeU3UzXPXXHrKzDIbognoAul1nLWYLjCaMehEPVpAriIPgMtY=@vger.kernel.org
X-Gm-Message-State: AFuF++nb71w9wDcdawZMulNMu+D5Awy09czP7S9G/YqDtgPyHcdh6j3s
	6/iwdECiHnw3GMeAT/2fvEgWWDQ/sBwtr+NAumDRwvgtK4Mtv1gvFYDtlfzHMeQX
X-Gm-Gg: AYBFou2KXbIILcNWGMbxG2/4IXjfS02W51bgCwGCYmdc9FFJj7DQ899lF9u20lxE+ro
	eksJH/gdkI06KiPC6a0GbgKegIMSbJSJD8eD4vOypzXj4b6JJy+hCDq6UMBHSFX/jYU6c43NvYo
	VJe4/KBvDI26GnSOBL3zSQdd2l+Kibro4xuOglVw78yCjhcUg8XxRYtqB/UVrJp8PyAGSm17/2o
	Rf3zZXvzsdssAJV8HtaM97kY2PsbO8lGz/Da8XFaIltTleWXEJSNX/IO9B55mUT0tkfvVReE9Z2
	wLl4FOZTT8mEsB+GChGCMyZ3aGzwFhCo/xUaFQaQwoRhYlyWbnIPPRwcyfSFVRAsZkffErh4U6X
	z8ZRqnPLil7B4slZFXGWVYMLwVlM+LFard+OQNfrw61aKIL4W7DTCMOMW58CpqxEAnJBSMInltN
	kirbE9/FF5Dc24BL6oeksqHoyoVhkonTc4buUcbkIhdGmGG2MzE9zbx+lNgtTZtbbv1jOEFGldw
	C+MlGIPfrxiBfSv+bOX/HZo+fBeWtvJrpcDT/L+NXr77lVKdpn6BCRqf2aGD/N1VEqqdj1kNA==
X-Received: by 2002:a05:600c:4712:b0:49d:2705:7030 with SMTP id 5b1f17b1804b1-49d270571ecmr49038005e9.7.1789049818180;
        Thu, 10 Sep 2026 07:16:58 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:57 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:48 +0200
Subject: [PATCH v2 7/7] of: unittest: Test fw_devlink with clock nexus maps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-7-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>
Cc: "Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, 
 Frank Li <Frank.li@oss.nxp.com>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Leonardo Costa <leonardo.costa@toradex.com>, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Extend the fw_devlink OF unit tests with clock references routed through
a nexus map. Verify that the mapped consumer has exactly one link to the
final clock provider rather than to the nexus.

Also cover a direct clock reference to ensure that it continues to
resolve to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/unittest-data/tests-phandle.dtsi | 14 ++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index eef966615b22..aaf0b871c01d 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -81,6 +81,10 @@ consumer-b {
 			};
 
 			fw-devlink-tests {
+				clock_provider: clock-controller {
+					#clock-cells = <1>;
+				};
+
 				gpio_provider: gpio-controller {
 					#gpio-cells = <2>;
 				};
@@ -90,8 +94,10 @@ pwm_provider: pwm-controller {
 				};
 
 				fwdevlink_nexus: nexus {
+					#clock-cells = <1>;
 					#gpio-cells = <2>;
 					#pwm-cells = <2>;
+					clock-map = <0 &clock_provider 1>;
 					gpio-map = <0 0 &gpio_provider 1 0>;
 					gpio-map-mask = <0xffffffff 0>;
 					gpio-map-pass-thru = <0 0xffffffff>;
@@ -100,6 +106,14 @@ fwdevlink_nexus: nexus {
 					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
+				clock-consumer {
+					clocks = <&fwdevlink_nexus 0>;
+				};
+
+				clock-direct-consumer {
+					clocks = <&clock_provider 1>;
+				};
+
 				gpio-compat-consumer {
 					gpios = <&fwdevlink_nexus 0 0>;
 				};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index b739a69997a9..2859a44c3fe5 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -765,6 +765,8 @@ static void __init of_unittest_fw_devlink(void)
 		const char *consumer;
 		const char *supplier;
 	} cases[] = {
+		{ "clock-consumer", "clock-controller" },
+		{ "clock-direct-consumer", "clock-controller" },
 		{ "gpio-compat-consumer", "gpio-controller" },
 		{ "gpio-compat-singular-consumer", "gpio-controller" },
 		{ "gpio-consumer", "gpio-controller" },

-- 
2.43.0

