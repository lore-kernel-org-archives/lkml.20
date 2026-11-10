Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794296663;
	b=0mOzuwD20K09epYpPAmCKl7kuzI5T/7v+kCcILZ02lUFmzfd8Tuw9nwr8Dw8GHqUUfiG
	 +SOhtVRJdbvsQy5Jdo/AJj9cuZQJ8vSUkYuUow1z6EP3jJLCedhY/eP1fggREhqkOZ6+M
	 voMCWvMeCMI5bs/CCFCLRTBBwH/f2Rcd8kPLUmRq6r6TVk1ys+XfNkFuNnlYJvx1n4Rqv
	 rLzPogvCulBcuCmk43DnRlKr7s9crjQ0jANtaAWZq/HLYjRvKSU12IYuQYZCcBuExtF81
	 E50ShkZTg68j8dy20lpLF7PRCT2YlJ27UnpueLkIMWT960cZ4rTRU6IEUneR4kFWQGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=IAYsb8CQhquDM/WpsloaWHJqp5TKYZ428PRJAG8/2hU=;
	b=BfHCd48uuFd5Le9lsJn2JzcVG4Dx+sXcShTTJ/6hm6ZC9ajDGNi9+W1vzGHvkRv40wy1
	 aMujQTUk7PGn2lgBubYWpbCgs8+CpipkV2QfDhLFMA3nz7jflvrNc/FpteqUYyu6aGUZk
	 eiX/8qfcx4BRWzyOH3OxBJv5C098cX41eg82nHkoCgR7JTe9aJL1VWx2SWuPNSsoD6hZ/
	 9AyT4C41ejKj7KC52ufwZQTmEZmIMsYEaqZ3/yZpu5+OwSSoO1yjHwOyE6fCKrMEUIcCU
	 OGmWNXBXqpWwmkGUXqgiB2F/WNJerbohcmAevCkGT1Ovq2RLi5CkivrZ2P9oYGoYeRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIFgRiap;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40290606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40290606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lIFgRiap
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-825b40f8a26so783693a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 23:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794296661; x=1794901461; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IAYsb8CQhquDM/WpsloaWHJqp5TKYZ428PRJAG8/2hU=;
        b=lIFgRiapLqYkXy1v2XbU4FODk3y12utvbOW3VlF/w28kflC+UoqohDogu7I9V8IFdg
         QiRntjJUp0lBBw80L1mt3ZXFl5P68ksj3juupwd6DPusivYyqIXQTWAVmSOrFZNX1m3f
         a4IJm1B1C13vp/TVfPEJ1/XEwNhAvvhuH2h009E+mhNUu3a7VkB4E60miFO9F9YA2PhN
         AxYy/khlc2OjAfLlJCeOogsFs/AyF6fOtvmXXRHKVeyIB5+uVw7eiKi4w2tWmTx+1WG2
         9T8Zui0FmWMTUjcM8quwiiX5C3RZ4vnYHDW3YU2j9Nk4NMh0xKMzRIS3sDpjQAbsu2aE
         8SZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794296661; x=1794901461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IAYsb8CQhquDM/WpsloaWHJqp5TKYZ428PRJAG8/2hU=;
        b=XQel8r+oA5rggNUNXh5eJpS8yKkCkrR2oEi7o2o2cSIes4xSR1/QqXnpRgEFjJQ1MV
         CPKNd3ghSZrq0dkpCdMmtTxZ2sZSGucok9a9glcEN9COgIA0DojJ9NdoSPK4mtk0Sn3d
         1wB6UAjaFmg3DPATSeXZMzFzyOfmSJNjqejAHNwwWX3psZslGFv6yFJ9wm1nGcaQUInA
         Yf6PSbrkjJC9j6nuoTO3BtL+gMpsNT3O6z30gPnSC2ORVmwLbEmfD+23upIXc2QTc0GK
         SiQfQR71ep0hCsxpq+NxMvlh9ygMrjKgGJEV1ELYRV5jDm6JzVnVqDXi3xoNtM/ko6VK
         OICw==
X-Forwarded-Encrypted: i=1; AL+hErGSV9n+zACr4LJUwdJkQViKQzgLK32fTPD8j3wUTfGZ7x4dkbbrWhXyOkhLBDsQONtZusgi8/WSXPoQP7A=@vger.kernel.org
X-Gm-Message-State: APuU4Z97H8aMdMRXftM9DU9wea/+WxgXwIQxdBudwB7T6wu8C8kYo4Tk
	1x3PT0OBtB+gUGl7BZXJeTzW6KxlzFW+i9eeg5eKEV0NzS7j2KzTynaFlANON6cB
X-Gm-Gg: AYBFou1oooKL6p8OW/pHf5V6ZyRIfOw+TzU9bQDZzPn2UIQJMNeWmu7ZGDPCILHtMHr
	xAvXDzvKT1yng5JbXx/clZ4ZomnZjQVWzTEaf74KvfUwWf2MVfikpasWCtdy13r4EBS/01MkNpm
	9iLY2HFnSa/vqd3vwXnsJYTF2B+vk49vrpg3kAUvyg5M/we80VHXLec8gCQLkXYkl9EMk2NXIre
	uL17zJarbjDMRTE2NnVq60/r87+FOzhgZCqDCuN3zr4zHIbiUnT+4I1flmzndzEbYJC1u7qRLoF
	pwlmGbX0522xvYtOXeHBMDRxDeMJom3FSm61DqOEaJBQVwpB9CxgLyHngZdz6UzdgVGFcBiA0tL
	uwzJnRVllESa40OhpdMVUVWoVvV8F57QRAGmEYSWaeUBfAcnbMnzQCG+xwDuPlONMTx5Ud4cSrc
	mIeX+0a8GCwYeblQHnCooEDNEtG/Smvr1od0adsx/VD7RDktvJevsomKm/tuSoy2hJIwSGfz9tB
	3YVBrsU6fuV+s2KbztjuMa67MPD2FeZjFo8bbwjaTcqwG30m3peEz7a+6RoNJ03A9rl1KUTmA5Q
	uHI9P6MMyQHNCdTypQFFui5wXd4fB5cWUu66QM633Zejsw4VizwMjCFtMa5SV4McY2BLguKbWU8
	VfVMYeYz7CUoFEk8XDe+4bGDmO0GFtG7yM8F4iWXTJEW+oTq2sbL6U/9UHZ0EK/J9YGSoyEdc07
	ek90/0JGTnPg97mxUeFMZzhfvJtovi1tWw5gIBSASgtND4BiSZdrFf
X-Received: by 2002:a05:6808:4f52:b0:4f1:6ab6:8fc0 with SMTP id 5614622812f47-5683cc10679mr1895310b6e.15.1794296661135;
        Mon, 09 Nov 2026 23:44:21 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5690504fdb5sm1522804b6e.3.2026.11.09.23.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:44:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 10 Nov 2026 00:44:04 -0700
Subject: [PATCH v2 01/58] nvmem: retain provider context through final
 device release
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
Message-Id: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-1-9137d08f05df@gmail.com>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>
X-Mailer: b4 0.15.2

An NVMEM provider can keep its read/write context in an object separate
from its parent device. Retaining the parent does not keep that object
alive, and nvmem_unregister() can return while consumers still hold the
provider. A device reference can also delay release after the last
consumer is gone.

Add optional paired callbacks to take a reference to the private context
before publishing the provider and drop it from the final device release
callback. Balance the reference on registration errors as well. Require
both callbacks together. Pin their module before taking the context
reference and release it only after the final put callback returns; the
context callbacks can belong to a different module than the provider.

MTD OTP providers need this ownership because they are children of the
physical flash device, while their callback context is the separately
allocated MTD master.

Cc: Srinivas Kandagatla <srini@kernel.org>
Cc: Tze Yee Ng <tze.yee.ng@altera.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/nvmem/core.c           | 18 +++++++++++++++++-
 drivers/nvmem/internals.h      |  2 ++
 include/linux/nvmem-provider.h | 12 ++++++++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 0556d140170a..8846354ae063 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -541,6 +541,9 @@ static void nvmem_release(struct device *dev)
 
 	ida_free(&nvmem_ida, nvmem->id);
 	gpiod_put(nvmem->wp_gpio);
+	if (nvmem->ops->priv_put)
+		nvmem->ops->priv_put(nvmem->priv);
+	module_put(nvmem->ops->priv_owner);
 	kfree(nvmem->ops);
 	kfree(nvmem);
 }
@@ -896,6 +899,9 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	if (!config->reg_read && !config->reg_write)
 		return ERR_PTR(-EINVAL);
 
+	if (!!config->priv_get != !!config->priv_put)
+		return ERR_PTR(-EINVAL);
+
 	nvmem = kzalloc_obj(*nvmem);
 	if (!nvmem)
 		return ERR_PTR(-ENOMEM);
@@ -922,6 +928,17 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 
 	device_initialize(&nvmem->dev);
 
+	nvmem->priv = config->priv;
+	if (config->priv_get) {
+		if (!try_module_get(config->priv_owner)) {
+			rval = -ENODEV;
+			goto err_put_device;
+		}
+		ops->priv_owner = config->priv_owner;
+		config->priv_get(config->priv);
+		ops->priv_put = config->priv_put;
+	}
+
 	if (!config->ignore_wp)
 		nvmem->wp_gpio = gpiod_get_optional(config->dev, "wp",
 						    GPIOD_OUT_HIGH);
@@ -945,7 +962,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 	nvmem->word_size = config->word_size ?: 1;
 	nvmem->size = config->size;
 	nvmem->root_only = config->root_only;
-	nvmem->priv = config->priv;
 	nvmem->type = config->type;
 	nvmem->keepout = config->keepout;
 	nvmem->nkeepout = config->nkeepout;
diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
index 4e610deeaa7b..21e26b73c160 100644
--- a/drivers/nvmem/internals.h
+++ b/drivers/nvmem/internals.h
@@ -11,6 +11,8 @@
 struct nvmem_operations {
 	nvmem_reg_read_t	reg_read;
 	nvmem_reg_write_t	reg_write;
+	void		(*priv_put)(void *priv);
+	struct module	*priv_owner;
 };
 
 struct nvmem_device {
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 6063fe5b7784..b674774ee156 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -98,6 +98,9 @@ struct nvmem_cell_info {
  * @word_size:	Minimum read/write access granularity.
  * @stride:	Minimum read/write access stride.
  * @priv:	User context passed to read/write callbacks.
+ * @priv_get:	Optional callback taking a reference to @priv before publication.
+ * @priv_put:	Matching callback releasing @priv at final device release.
+ * @priv_owner: Module containing @priv_get and @priv_put, or NULL if built-in.
  * @ignore_wp:  Write Protect pin is managed by the provider.
  * @layout:	Fixed layout associated with this nvmem device.
  *
@@ -107,6 +110,12 @@ struct nvmem_cell_info {
  *
  * Note: Specifying name and setting id to -1 implies a unique device
  * whose name is provided as-is (kept unaltered).
+ *
+ * Note: @priv_get and @priv_put must be supplied together. Each @priv_get
+ * call is balanced by one @priv_put, including on registration failure.
+ * The put can run after nvmem_unregister() returns, when consumers and
+ * device references have gone away. The core holds @priv_owner until
+ * @priv_put returns, independently of the provider's @owner.
  */
 struct nvmem_config {
 	struct device		*dev;
@@ -132,6 +141,9 @@ struct nvmem_config {
 	int	word_size;
 	int	stride;
 	void	*priv;
+	void	(*priv_get)(void *priv);
+	void	(*priv_put)(void *priv);
+	struct module		*priv_owner;
 	/* To be only used by old driver/misc/eeprom drivers */
 	bool			compat;
 	struct device		*base_dev;

-- 
2.53.0

