Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1AF1470136
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788249003; cv=none; b=K3Djq1QQT+m1RBkDUEB4YkGIMG+kL9HZGMyBDVNC9JF9bs6VTaFmx1jJNrjwMaGXihLEb4DuVkozeqp0eBzZWFF3evxcbGb58AXma4RJaqyyxm3cBaTKm3ZiQM4tchHc0+9YqRulwj340ABqkWOpRyEVL4RkdRxtc+HbkW81+fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788249003; c=relaxed/simple;
	bh=KSh5c40N/ncjUkxNS2dUoSiZ9wDsl5oOe77nz1eIIdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oJdnJe1mY91g0dZQVwxivq265iSua5+xJLPRjn8fJdRLaZDzUoWBNM7i0vSYdl/GB5rFKqFA1IJHRO16SeMfoEuAi46G39bD8s/NsEcOZBs7TXfwoOszht5vcf7r2rijFS+S58H8zTeEWrQ9oAJD/vEy+ZCEqwW1Hkl93Nz03lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Lq846xDp; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Lq846xDp"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d7200b2e15so47414895ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788249001; x=1788853801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=;
        b=Lq846xDp2aXhMzO0BQBk2BNWZI23Zq2slbPd+5IkCZNq59bQxrB1RfACIKZaPBzzoE
         7LeWfaoFDZW0aL0f6gq6AIjS5ZIJX1FYRrBjDf5VpyRADYTZNYCuQPPJhWyzanlDJfkh
         gE89DdoSmckyYlvPRmQWRk4B/75Im9he7yJcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788249001; x=1788853801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJzWbza2zag3QhFxPq/teShXqDf76npySrhO2+9Jdis=;
        b=OirjuL1VqZtYhXnttcm/pDE+Ak/QKbK4lUpsA2fwQMR8j01FaO2iqVkwbbP/g6tClN
         vdcdaoRcUKLeZaTsxFE7QPTGYihj5H2GfFWkk2V7FuK+U4Hv+DVdXYfxLAQsnK1yikHW
         Fmv3iqcj7OqaUajtxVAqwLVtmRrw73Ed9dhKWOVGzw0xdyxtpfu34qEn6yFf14jZFh8S
         8ZTsF1777M7qDZ+dy1MfxRcZMuPJ/1fSVK558GytgPXM9AL39/OX5ihhe67dwdOPf5OT
         j69gBdFtjuwmH5I6o/+Fyt7cW6QoOY2B2YEJii6VBoGp6lgUNZPHlo7fPapdAE0qzSSy
         DAyA==
X-Forwarded-Encrypted: i=1; AKwUvBx8EMDoRuGR/2Nu+/S9hiq+SVIdH86OPZ0072NlvydrKEMQZryjSngl1KZJ6jH4mRkacRi0YIX5wq1/uBE=@vger.kernel.org
X-Gm-Message-State: AFuF++kiBpaPTGvxyNNGn5nG5icFIwnS7etepf7NozxjRdCm8z7F76rA
	IAESf0G0dsoXZ0MbJ9k5tonQHMnTfuHm20VLXu/cdR3QG4hz+X1P7gsMBaIY1dMnKQ==
X-Gm-Gg: AYBFou0uIaYYpto2VSKt0sihQ+WUwwslu27l4fJ+hGr3X4j3ZdMOVZDOMJHUxqrSlFW
	0ZDyFjptcexP7fNproZPM+fNkWYPs3OcBGa32InDphKlK77ZirgblaHuhdPDncUUpttmZZ6SuSG
	NoVqRFIlF/PYCYJEeX+NEf1tgvRvtgt6prTgclcFkzvx12RNHs0vHL9zPvqU6uTMQZ4DQfepjTp
	Xe4/jyQv08hZWJNTqg9otvDazWgBkk6EFJqjp7IcQj6wOXqXo3sZOm0n+IDU+xJd1DOFWNtKo/8
	WCqGR/1HwOAQ1eZXddm57WoTbcUJkkQmICsIuOEq8wup/fxdy7+4irTUXyNF8jhz59RqKNML4uC
	NfwGj/36pGJH/jHtpHGPCs/xdYgqgLxV7nLQyRnD92qcej2utTUty7xwekuEQRq3OK/EFx2gkFr
	xyM/GfaMsDDrzWU2Zu5CaTa8FWny2jcqNOrcKA93E3cfQ1g/QP5De5YuVkHTGFBx27SmxUPuy9X
	JaMPwWgFYBrwd6Vu6JXI7QJ/uR0if5xL19yOIi6qtL4RQ==
X-Received: by 2002:a17:903:3d0e:b0:2d8:d4d7:f055 with SMTP id d9443c01a7336-2d94a930d44mr91456335ad.22.1788249000970;
        Tue, 01 Sep 2026 00:50:00 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:8cf:6df0:9c4e:f5e1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75988b699sm48142515ad.59.2026.09.01.00.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:50:00 -0700 (PDT)
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
Subject: [PATCH v6 3/8] HID: i2c-hid-of: skip post-power-on delay if powered on sufficiently long
Date: Tue,  1 Sep 2026 15:49:21 +0800
Message-ID: <20260901074930.764550-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.897.gb25b4bd76c-goog
In-Reply-To: <20260901074930.764550-1-wenst@chromium.org>
References: <20260901074930.764550-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
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
2.55.0.897.gb25b4bd76c-goog

