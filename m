Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680678;
	b=lMBQTUvoCnyB8GT0/LnCeFu50KiEPYTEkVJjEIyVOdV/cKxC6+FPhWyodoOSyxp7qu18
	 2v0fvzsCemyAZGHuMVkOdvZnE/Ey+ZOfDK8/UdUi63YPaF5s1iqSLXxRn2/RW5L8XqXj3
	 IdAbLY6UaYvfwg2o5aWsq3ScqYv+TTt6iKLnJOGBOm49qvBc8B1iS/7YqEu8/1Nt7Fkpd
	 gEYjea3g3WDD6yAzBQQeSh9fnNdMisumbWy7SnINclQg+QiqINdr9lXjOt81cztPwgxWR
	 V0lCAiQ57HmGqZb5737+/BSyJNWIfQxmOLDScIj7yyVCbt6wAj9Hb1QrxM6kf2zzAAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
	b=u3oX5kHJWP18fxWJbdZXGUC7AC8B9rtU/7SkoMbI58B3MHT5GXM9017PfdapKrBMx+tM
	 gz0QlhjX+it5s9m/kcgzNHzbw6RtjQsoBtIsnH+IpTY49kCjUqR78hHsi7BN4p5Fz/d68
	 LaLYPh4S5Bbq47gOQI62/cT1a9eLHeP0Ukou2srDQvvQy840yU6Ldo0MM/wWkaiBr9rwU
	 /xPM+ZdjMEbturS+8KsnCLndGjPMJ4TCEkfLJqj1LyW+g74pU4OQAFS2zph/RuqeG0mmU
	 oriaGQt2//bE2Vqgcy2L1e4aYb4Y3TpjtQ5LNT3ydCjWinlk7fVjvb3PZJngTNlATyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZKpGzlmX;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E940606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E940606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZKpGzlmX
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae486f8a27so2108879a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793680677; x=1794285477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=ZKpGzlmX0djeNLrXuX9lTpy2ii6SP/KxxSi6BOaEFbrjgQBU3M2vDz2L4c67FfPral
         JfFDWMhXs1qA1QUSktgnWBvfFFLuvqdgkCOFmwIDZwxycU4385176BZckVSjX/CqV7ZQ
         +wfL45iXhYgGfu3vN5nwL+d1+dOh10dong9Ek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680677; x=1794285477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+m0KRotnRI6Y4M0Q7c+lnB20WP0kpPO3hQuPyKu7qTg=;
        b=LwzKGjbenpeuAoCpn0R3H1FrOGilcqPRDN0IS5RODW+8uQtu9u/NQJdhqZWhtAWyAP
         593rdW4T20MoLrF8dos17Tn2uzMYYPLyhxUC7VPd7/cn0DHRsLU52Am+kuQlSHpd5PpH
         QBhBooXNqivnv7HJp/cRkuCICJbEacKtINrL3gkyABW4zXAGL3NG/0HNEid9wD2h3ger
         u0OXign1bhM40vQbxKCdOGkviX0FKJ9b2FvKoyGQtn1C9d7SkDnS9fsbKdGyQ9/sg4sx
         rihXQbj27r6pv8S+nrNGBAHqqfzmXTCXc0yJ+r259PCd/4Cwh2YcKcgPrQVei8uhBVYv
         bypg==
X-Forwarded-Encrypted: i=1; AKwUvBy1J0jpBNXiBkoVAwhtJmQT3439EkzsIA+HPP4UOfyEI8f2DWTKOM1+LxinksTlKIzXVxONKBJSVo7ux2M=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eX/AvXPpSC7zZX6yskysvTdYX2uV/DsbU6+w2+9HM+UVVGPNY
	wPiMBzLoMmBQ5Aaqh/ORTNeLTfR342Jvh0kLhQ91ogWSDEstq/rLnHlfSTS6pCMQyg==
X-Gm-Gg: AYBFou1hzxl1iuXFA/0JdpkG8VtjB5vffqmstACHA3LuSN9J00ag4XqCnrX+aaXZlDw
	MC+Cf5YoR7tsM5RJAw8QY3XTALPQv8cZQ81GUFo6zpKxV1HIbICiTYRmLCXkU9fHX+1BwaBJfg5
	iq7qHf9t1BcLfTeGW/P05zKQXYvF+XbNhgdNdKyEDWfOgLUGfJgP6WSA4nWxd1ZgxVpsndBHkT0
	HYYEC3uJsBod/WEO1RMMJhLjwcU7fxsVomzupKF3mwLzcb8YG76tm0Nx59WGkDdOtKJapqk1dp2
	j27GafMHVcbZ3ndqAwBRkDf4v0PXr89oY/Q3deOm2mi5hjalJYQp47NJe+L7txbWw+gxk0e99ug
	OTFEzRo3xm8cIIFfwK8EbDCy2HTU2LdClp+J7W/zT862vyz1XMV7vN3LhLNPk+HdTVDTkWM6XCM
	IMKuT3yxtmUOBvXpwqtemJzoJ7OiE2mReDvCj19XLF7j4OP1S+eElrhGZ43LmUFM1ANPz4P0VLi
	ryWzgfc+sA9qdI0LYOW1p59SCV6YXQDKb13SSVNgvnEt1Ww+7nVLpUOnljre9GzcsbA8cI336vc
	G0jJNR7t7rIWTxzoyWwdM/3UHCBgJbGEEXR8oqmbp7P7lBls511G9pwjJOUkt+GaX+OBaVt6rAk
	mqkY+aZEJvaeE
X-Received: by 2002:a17:90b:3b51:b0:3a0:cbe2:9e0c with SMTP id 98e67ed59e1d1-3ae897c8800mr10534419a91.63.1793680677425;
        Mon, 02 Nov 2026 20:37:57 -0800 (PST)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:dea6:6326:4502:bb8b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c71c253sm2072761a91.16.2026.11.02.20.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:37:56 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Jiri Kosina <jikos@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  3 Nov 2026 12:37:27 +0800
Message-ID: <20261103043734.2179858-4-wenst@chromium.org>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261103043734.2179858-1-wenst@chromium.org>
References: <20261103043734.2179858-1-wenst@chromium.org>
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

On some devices the HID device is powered from an always-on power rail,
or the power rail has been left on by either POR defaults or the
bootloader. By the time the driver probes, the device most certainly
has finished initializing. There is no need for the delay.

In such designs, the system integrators tend to work around the delay
to avoid the boot time penalty by simply omitting it from the device
tree. This is undesired, as the device tree is not fully describing
the hardware.

Switch to the new regulator_bulk_enable_and_wait() function that makes
sure a certain amount of time has passed since the regulator supplies
were actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Switched to new regulator_bulk_enable_and_wait() API
---
 drivers/hid/i2c-hid/i2c-hid-of.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/hid/i2c-hid/i2c-hid-of.c b/drivers/hid/i2c-hid/i2c-hid-of.c
index 59393d71ddb9..fdaad451e710 100644
--- a/drivers/hid/i2c-hid/i2c-hid-of.c
+++ b/drivers/hid/i2c-hid/i2c-hid-of.c
@@ -29,6 +29,7 @@
 #include <linux/of.h>
 #include <linux/pm.h>
 #include <linux/regulator/consumer.h>
+#include <linux/time.h>
 
 #include "i2c-hid.h"
 
@@ -48,16 +49,14 @@ static int i2c_hid_of_power_up(struct i2chid_ops *ops)
 	struct device *dev = &ihid_of->client->dev;
 	int ret;
 
-	ret = regulator_bulk_enable(ARRAY_SIZE(ihid_of->supplies),
-				    ihid_of->supplies);
+	ret = regulator_bulk_enable_and_wait(ARRAY_SIZE(ihid_of->supplies),
+					     ihid_of->supplies,
+					     ihid_of->post_power_delay_ms * USEC_PER_MSEC);
 	if (ret) {
 		dev_warn(dev, "Failed to enable supplies: %d\n", ret);
 		return ret;
 	}
 
-	if (ihid_of->post_power_delay_ms)
-		msleep(ihid_of->post_power_delay_ms);
-
 	gpiod_set_value_cansleep(ihid_of->reset_gpio, 0);
 	if (ihid_of->post_reset_delay_ms)
 		msleep(ihid_of->post_reset_delay_ms);
-- 
2.56.0.385.gac671c819a-goog

