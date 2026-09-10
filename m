Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0182E4A014E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049820; cv=none; b=Pz3alJVQQZ6jnylJVO2YZQnlWk3AuhcuYE/HAmCoO5626lNwYsrfc1Jp1eOxkXCm27Yd8lDzM23Mvj56zkaUIS3Izqd8YsMhA8o1O+HWjNuxpgZXaWGh/Ml5JsoJgk9g/iB6Up8P+fghoC4Jbbp0AFbDrmOstMOds7zQ2F3YDEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049820; c=relaxed/simple;
	bh=xA45Y61XTBAgpBy6OAEVUm+aoRID/iBFxEHp4Q6aM/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=COLR8OwnaDHaWfdtseWW/hfmaolQ6V2bydTxkuFGyeeSjRprg/JhP77Qy0UYARbZPdlJPHvE1gLcwfnR2Hv5z0Ps4I2T/8HiZkxkBh6+y7WR15OxN2/asK2ZDbf5gAT8Snuw0noh1revradRKC+BqZkx18z1fY9ZM0/RfrkGFuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lQ9clEgS; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lQ9clEgS"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso68322745e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049816; x=1789654616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WKuPMePtnop5uPfXFl1ahyGCh0WOUAD5jTxVfDVb9I=;
        b=lQ9clEgS3Tw6dpdrUNTsv5JC6Pv6Mvk1nNq1+006g7fVDdjBRc9cF6cNuJpQYuJoLl
         rsSoRZbq8pwaV9OLBVFVWFcpKIIlHlhUeabZaTRxbyBpw7bEx0wVcdFk7Xbb/g/1FT3N
         tt3VK4Pps6RhuxY+6CfCO1mKKkMhQ1YwDRJ+/MbYaa0sM+jzi3rhP85Ksy8IlsE+Fq5f
         CI4e/dE8B0UkoC8hrq3QiCc/nQTsgjn7Y7bKH+yphaUuRPRTHtXZhKfl0oitdsGRrECb
         /5b3fFheIcitWvRzGSxrP421yH48vIuNZAHXTdyoTNti0MlyJpbMuxw1RUqBpPgpUdkq
         y4bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049816; x=1789654616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WKuPMePtnop5uPfXFl1ahyGCh0WOUAD5jTxVfDVb9I=;
        b=Wg8ycHd0WYDZuu5wziFt1fG9ZL1NW0L1yy2mcOdZbuG17FPDg+z66cVzCBRQ7yxv8O
         MR/ZB7K55DsectyI8t2Bkz1s0ayppCOR6zYOe5zRTt8e8oJY8w/nvDuNmc/gUxE5gXS3
         tDLoUzptCLaRCZSTl/e1p7hs2kjZ72/qeT4YyOZ/lrRZJVciWoqni977RsqAU0fkjBFJ
         j0P7MFIdeSqiuhcZeBd28e+8/6ZxtHlohWx9PTVzryBGSMdKUNH9lwY1zKXDoeioAw4q
         qVJSIU5PPPbuJmxn4i19JRE2W9o2zBdTA+kAHS5NWR7MXVivZxNZDFFSAPnceX6Fg7hC
         Wv3A==
X-Forwarded-Encrypted: i=1; AKwUvByrKvvWr5spS2xXXbtRQPKyuMOWqslaoiqtM1HvgLf82QHOzEtiX8wIqzfMuHbvEfsDX/JojQiAsEJhRDs=@vger.kernel.org
X-Gm-Message-State: AFuF++ll4mdPkwqehumYVxQjh2osBrIHca5j0hAQU44AXfY0Mqx/rozA
	hpTn/7uJzMc+1WLs8Osgmr8z6z6rUdA+wlDDazAPFMXuAkpIdf6mZvfP0rYaMbnQ
X-Gm-Gg: AYBFou3QyRKJugaQcP5Oo7ogNOmEi74oTzSrQ7u8H1ceJRUbiE9ERBJUVD/3u/OELxW
	5L9wQLiS+ux9ZSwnf70vn0Cw0sSv02v59fxIOx2KBsm+3eFVLntUw2X8htUN0QcSuu7Lo1vkhsD
	oK5tj+B/2kYuBcRwYBWgqrBGxTPyiwZIqUs9lhCGQ8azkDUrzMQACGcMeEyuRxyW4mX3rI//1Q1
	WuEHJLatuYSrLdV/jTuxN7AlJ+r2Jd4rLmaD3P/1NbHhrxSx+/EnFYeNHK9AK4xEJge+YwTuRD3
	4RU+HKFg8jZ/WqDNhP5akTFzvCjYlmrXYLnVRfRd1XfeXeTlmZTjSXc82SwEmoi0c94xvRuCCcQ
	/VbmHCy6oU0OComxxF5eGTUTHlh6us67P32B+lrOBruHvUPJ42c55BTX6ghuIpXwCQR2brWei+o
	/oudci5dtSeAz7smDVxWlK+oZJh2zKBOcz8NPFwvKO8Er5qK/dJmbsUyahCMk7tfx9uwWzh1lIx
	IMwP+TQG3p/zM7sIHYaV90toNNZ8T97meSHnE92fttxG3gV1GAPq22DsZ1msTjHBLEo0leudQ==
X-Received: by 2002:a05:600c:c168:b0:49c:edfa:15a with SMTP id 5b1f17b1804b1-49cf826c5f5mr415258855e9.13.1789049816022;
        Thu, 10 Sep 2026 07:16:56 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fce7a7sm293895575e9.4.2026.09.10.07.16.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:16:55 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 16:16:46 +0200
Subject: [PATCH v2 5/7] of: unittest: Test fw_devlink with PWM nexus maps
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-fw-devlink-nexus-ready-v2-5-17ac82dbe226@toradex.com>
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

Extend the fw_devlink OF unit tests with PWM references routed through a
nexus map. Verify that the mapped consumer has exactly one link to the
final PWM provider rather than to the nexus.

Also cover a direct PWM reference to ensure that it continues to resolve
to the original provider when no map is present.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 drivers/of/unittest-data/tests-phandle.dtsi | 16 ++++++++++++++++
 drivers/of/unittest.c                       |  2 ++
 2 files changed, 18 insertions(+)

diff --git a/drivers/of/unittest-data/tests-phandle.dtsi b/drivers/of/unittest-data/tests-phandle.dtsi
index c3727ed15bde..eef966615b22 100644
--- a/drivers/of/unittest-data/tests-phandle.dtsi
+++ b/drivers/of/unittest-data/tests-phandle.dtsi
@@ -85,11 +85,19 @@ gpio_provider: gpio-controller {
 					#gpio-cells = <2>;
 				};
 
+				pwm_provider: pwm-controller {
+					#pwm-cells = <2>;
+				};
+
 				fwdevlink_nexus: nexus {
 					#gpio-cells = <2>;
+					#pwm-cells = <2>;
 					gpio-map = <0 0 &gpio_provider 1 0>;
 					gpio-map-mask = <0xffffffff 0>;
 					gpio-map-pass-thru = <0 0xffffffff>;
+					pwm-map = <0 0 &pwm_provider 1 0>;
+					pwm-map-mask = <0xffffffff 0>;
+					pwm-map-pass-thru = <0 0xffffffff>;
 				};
 
 				gpio-compat-consumer {
@@ -111,6 +119,14 @@ gpio-direct-consumer {
 				gpio-singular-consumer {
 					test-gpio = <&fwdevlink_nexus 0 0>;
 				};
+
+				pwm-consumer {
+					pwms = <&fwdevlink_nexus 0 0>;
+				};
+
+				pwm-direct-consumer {
+					pwms = <&pwm_provider 1 0>;
+				};
 			};
 		};
 	};
diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index dfa3c885d142..b739a69997a9 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -770,6 +770,8 @@ static void __init of_unittest_fw_devlink(void)
 		{ "gpio-consumer", "gpio-controller" },
 		{ "gpio-direct-consumer", "gpio-controller" },
 		{ "gpio-singular-consumer", "gpio-controller" },
+		{ "pwm-consumer", "pwm-controller" },
+		{ "pwm-direct-consumer", "pwm-controller" },
 	};
 	struct device_node *tests;
 	int i;

-- 
2.43.0

