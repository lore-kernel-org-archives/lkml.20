Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABB637997E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386858; cv=none; b=svYefPXPRDOx40gG7uREwQC0vSlpZFhBxH6QH+z9awuBQ1uKTH4y3MXR926OYI/oIUspJWpBPnY39ZZzroOg3azCuImDhKXU174P6WEy5pGGwOyGXLsjdgJkkQ8kbo1iXA9s1DhkezJk0QjQZrf9EE7j752VeOiGEz03pxJ5TLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386858; c=relaxed/simple;
	bh=HHcwdsUXEm2ayaVu7SSBBQ8NDirWwcRsDg4gbWZ/4ak=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iLPBJ+K+MQGAm7gF21A+8fRqX9dZUG2WrILm9yMck+K0PqRYioPQCJwuA1z4XfU5Hl9CR8YMDpSf80tBRZsu1FW4UsYlq49/yjCAe1Xw5qHKBHNs25jiwBAxsqyxu1Qd3C8IdNZUSqM/p7CsFI6I/cOuJtl5fm1VcvthvZwzJlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KPg28wpb; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KPg28wpb"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-8871ada1a26so15897707b3.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:54:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789386855; x=1789991655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vvOpnlEvc0lDTY/fJ/50aU18KEAzaXSSdE1MwD9cp2Y=;
        b=KPg28wpbhqcywZNrpCMyZUph12lU+ataZdQcM+1ZZZvqPcmAXy3DW89af7FGZ1ySBY
         7jPQjBkEAW6AZqJQmAXT+veQrH9sgj/Crs8qyna0R0fS9KFEfjdmV8F6yratCHUFjWZv
         gCAuUAhkSnsX/iIOmKF7WF8Y5WBbB/HSq5HrYQTHyn7mYhcqfD9258OBsEgA0h4oRb6D
         gpowLoZnyz83JYjcabD4UOoQSzE1Tt+Ka88RSaM5NhTzs+Vj5HCHj4R3JL0WQPePm1Pk
         i0LkaN/lPUXq327nql1CnCF4RqJNwEZjhCpDpIvTJlPRNp2IwgWkGpMkK+XN56FP7Ol/
         O0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386855; x=1789991655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vvOpnlEvc0lDTY/fJ/50aU18KEAzaXSSdE1MwD9cp2Y=;
        b=jxYtEy5ddDOn0kL9JnAOttsykdKnx6kRCoz+2V7ecLeIEXvqUW0vpfz67clgmSVZ4l
         Vm8n12qAAuqYgr2ifO6MEv9q0uubTjhPK5nvxdAx1V43LFWVRHhUPX/tQBYRcJmAiuI2
         W9iJu3h80U3Uzc38yuijZZ5STW0q5p0U0xWxqsAk9uZO/p9ONXKpruof4pRBTQcq2R2v
         YVxdLmv24nRD/NKT20IAdG27Hv6L6LExG81Ag54h9UPRCxZVl9d4e3NXYm55ZlYsPk71
         ni1/UISTIbqJiHKMnQdvWVi/E19D+94uDp3DtFZcMge2pqUBEptanE9f/ocR+4QFb1hC
         BfbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH2foJiNqZJ9tcuop1hRoq80NsjeZcT2iBwjZ4l2KUK4kI3rt4jgrQVCczasEcwhVglak3/oRyOSCGEZ4=@vger.kernel.org
X-Gm-Message-State: AFuF++lzncPG3fQHZwxcXo0aOSxq9ENbUOhqB1i1MzAAQAuvjbGD17D8
	8lBC4YeWEwptit0EJfHk1lViOMz2uDnGB6HCtDUbNCazaAzqgqd3PBuU
X-Gm-Gg: AYBFou3Jfv+h62V5MtDGV8QuZtxE0OCyulj9sn97o1gULyi1Atd+nsYksaVJWF7ocyH
	OaMxw10NVQKR96CWxETLnOM/Yyu02yUT3WHcnXR3cki3RxVvyRfQZ0wLdVqkTnYDzda05rifn2b
	eWUYmAQxV8ZL+gqvxjVFw4HF8I2sK2ztYEKV/NDwZCgQqLDlNGz/mi7AZ1ZxBbh2pOnPSvr6y83
	6KAYrICo3jQgfCNwY/oadua2aiCG0Gmw+gFAG/7SiYoHFq1xhrp4ztcb7x7coCKEed5hg/q4WI+
	FyNOl6f9nE6Zt4Bg8N6olEz7u3uvn7EY9ufXwqanqfvX1CSeHkSCMKX2bw+7CqMj7FCUt6CZkMU
	2xTS56RuL/OT/0vinI/ZM05v533FIZQMbiD+Yn11f2QI+fWish/OEGsknMqdXJbL+aclB7aLjfy
	cYXsPEixWRDoljmBVrki/qkLODkUE5kKnr++DPddrD/UZ0k6z7jYG2Kw==
X-Received: by 2002:a05:690c:e15b:b0:873:5bb2:6c37 with SMTP id 00721157ae682-88d2426b390mr3468467b3.62.1789386855441;
        Mon, 14 Sep 2026 04:54:15 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-88487ea9478sm34802197b3.34.2026.09.14.04.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 04:54:15 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Daniel Baluta <daniel.baluta@intel.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] iio: dummy: free software device on configfs release
Date: Mon, 14 Sep 2026 19:54:04 +0800
Message-ID: <20260914115404.1691763-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

iio_dummy_probe() allocates struct iio_sw_device with kzalloc_obj().
The error paths free it, but after successful registration the normal
removal path only frees the contained IIO device, leaving the software
device allocation behind.

The software device embeds a config_group. device_drop_group() calls
iio_sw_device_destroy() and then drops the config_item reference with
config_item_put(). Therefore, freeing the software device directly from
iio_dummy_remove() would free the embedded config_item before that
final put.

Configfs requires dynamically allocated config_items to provide a
release callback which frees the containing object when the reference
count reaches zero.

Add a release callback to iio_dummy_type and free the software device
there.

This issue was found by manual code inspection.

Fixes: 3d85fb6f8104 ("iio: dummy: Convert IIO dummy to configfs")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/iio/dummy/iio_simple_dummy.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iio/dummy/iio_simple_dummy.c b/drivers/iio/dummy/iio_simple_dummy.c
index 19fcdbbc11c6..7d2ff1d4a06e 100644
--- a/drivers/iio/dummy/iio_simple_dummy.c
+++ b/drivers/iio/dummy/iio_simple_dummy.c
@@ -23,7 +23,19 @@
 #include <linux/iio/sw_device.h>
 #include "iio_simple_dummy.h"
 
+static void iio_dummy_release(struct config_item *item)
+{
+	struct iio_sw_device *swd = to_iio_sw_device(item);
+
+	kfree(swd);
+}
+
+static const struct configfs_item_operations iio_dummy_item_ops = {
+	.release = iio_dummy_release,
+};
+
 static const struct config_item_type iio_dummy_type = {
+	.ct_item_ops = &iio_dummy_item_ops,
 	.ct_owner = THIS_MODULE,
 };
 
-- 
2.43.0

