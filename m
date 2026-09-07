Received: from mail-106112.protonmail.ch (mail-106112.protonmail.ch [79.135.106.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A86B4FB9AE
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788792702; cv=none; b=awXj2IWAVncCtKl3anKOmGFQdHoYblEBiybiyLVQrqQmfU8cBAL4T/LvP6p0n6pmTCBMwhLjO0wDGc6YsthtBu5CKiQ64OjaMOu7LXXdCSKr3ZODWr0moJkTkUF8I63N3ObGGXbNzXLMe5zZtAWLZROcXdV1+Vojh611VUm205M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788792702; c=relaxed/simple;
	bh=n+2ur0mO1O06HHQSlDD4hKB9J0Qh+/SnMNMi2uaqzCw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mrd93KuOwKFb5kt1n2Zi6GXCCnyG2YyaYKagm8YOsDRRSgQdmgajuhRkJTJVhZdjlMrTLwCweEkCdlJHvoHFA2tiOyw7AeDTbIgcOFd0qStZbjCeEm009WDdcrQGGk6FeHhUKCzRpDDMeVPKGv6nsvP9RKjaakZtY48r8RN1JrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=d4oh+6ZV; arc=none smtp.client-ip=79.135.106.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="d4oh+6ZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail; t=1788792684; x=1789051884;
	bh=xTI6Jpz3mbGWtyBI7AXBaUs5FytAzB58eQV9Bg7VxBk=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=d4oh+6ZVss81wROtlYAxfJPmpn3/syVVQPQmhCtSdWt9YXN7xUeSn1vhOcUNlNtk0
	 L70IEU6NYNTZLuKsBQ9mXunFjQ6xNh6Vc8tG0IMefOmQo30T07qEGa2mpawo9ShG66
	 768yoc/kmG9XOrUiciEBL+/gOzMV9ug/3gWLNPEhByVO0rq9MAPlzoAZVU3vvFwEp0
	 +4jKxgDy1fc3MChagIKzodxRB8fAmyJEbuP4VjlzjfnihjIgAMGf9wtFGur9pLRflq
	 9M568e5xps4I03rlhuH28cNT+hIcMsUMA8hEV0y5yPRh2ZjJ2pEg5sbvPS6i2JBgLh
	 hdmwgz3rwoSNw==
X-Pm-Submission-Id: 4hdqlH3v4zz1DFG2
From: Esben Haabendal <esben@geanix.com>
Date: Mon, 07 Sep 2026 16:51:01 +0200
Subject: [PATCH v8 6/9] iio: accel: mma8452: Add comment block for struct
 mma8452_data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-mma8452-open-drain-v8-6-c17407e22118@geanix.com>
References: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
In-Reply-To: <20260907-mma8452-open-drain-v8-0-c17407e22118@geanix.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Martin Kepplinger <martink@posteo.de>, 
 Sean Nyekjaer <sean@geanix.com>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Martin Kepplinger <martin.kepplinger@theobroma-systems.com>, 
 Christoph Muellner <christoph.muellner@theobroma-systems.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-iio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788792664; l=1346;
 i=esben@geanix.com; s=20240523; h=from:subject:message-id;
 bh=n+2ur0mO1O06HHQSlDD4hKB9J0Qh+/SnMNMi2uaqzCw=;
 b=JfPSjJTWsQask37ej3+k8IXL+OR2IxAUyDUDUs/S3x4+Isypbu3hwBzlOoQb6EbKaOjst8N8V
 OzyP6he4qh+D2GriV3CMKZPqYmwQ2xnVeZGuWbUC3vxm/lC24V+4PHe
X-Developer-Key: i=esben@geanix.com; a=ed25519;
 pk=PbXoezm+CERhtgVeF/QAgXtEzSkDIahcWfC7RIXNdEk=

The struct mma8452_data is central for this driver, and it makes sense to
have a description of the fields in it to make it easier to work with the
driver.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 drivers/iio/accel/mma8452.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iio/accel/mma8452.c b/drivers/iio/accel/mma8452.c
index c6af68d2a297..2c1b97b77bc1 100644
--- a/drivers/iio/accel/mma8452.c
+++ b/drivers/iio/accel/mma8452.c
@@ -104,6 +104,22 @@
 
 #define MMA8452_AUTO_SUSPEND_DELAY_MS		2000
 
+/**
+ * struct mma8452_data - IIO device private data structure
+ * @client:			the I2C client object
+ * @lock:			mutex for synchronziation of register
+ *				read-modify-write and holding chip in STANDBY
+ *				mode while writing to registers
+ * @orientation:		mounting matrix, flipped axis etc
+ * @chip_info:			chip specific data
+ * @vdd_reg:			reference to VDD regulator
+ * @vddio_reg:			reference to VDDIO regulator
+ * @buffer:			triggered buffer
+ * @sleep_val:			time in ms to sleep while waiting for drdy
+ * @ctrl_reg1:			CTRL_REG1 register shadow value
+ * @data_cfg:			DATA_CFG register shadow value
+ * @open_drain:			true for irq pin in open-drain mode
+ */
 struct mma8452_data {
 	struct i2c_client *client;
 	struct mutex lock;

-- 
2.55.0

