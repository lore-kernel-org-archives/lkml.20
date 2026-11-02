Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606241;
	b=rbbIFfvjDmpL3tL+8qCg9specpfozlRXkgFM8GePJkyamug43fgkbDRjvyeO3n9VXIhj
	 wpVrbn10p5pTzafspcHMGKNVM+cFtve0n7UDBZHvFoDDvpBCIGW0g5Ud7Yw/ciAlwHGMR
	 D8NDCxyoSflmY0jNhQ5bf9FVnnUVFcXJ21Yp/5Cezxdbw7hubpBiptibk8yysBuR+gqoA
	 9sSCbldjxUnLRvihygsrQNBYo5LSpgu2I0rsCqhBQ/8sW6I9okJKAHXldfnTG+syYIIOF
	 ftqcXwZI8Ns9WRvadC7ZfUvTsKAxXh0c4TTK72xEcTxz59b6oPekJfHSbjXqE7Mq4/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5c8E46H9D8n1iz1NiuFP9wVSIjo8xwMshDoKle/plSc=;
	b=M9Du+gRlHBN8N4DE0PXgXI40N8ufIWrWcvhfPvpFKJQefvw8YTJKSkYelOVGV2XFnaWs
	 pQKf5pDkTtdbQMczth5hSN3JJ6oUbTX58f/ZZICcjTIxTy2zKRjJnmWrrOw9IRpwYMaQp
	 QfzlZlHOpYYeuS7HQQ7k2pnCx5WYPKgZuXlZPFakCMYWTE5E7tHD6AijuVAUtVLUngSPL
	 WOQbkNGu1oQ787tiQpll93yZlNVmNpCE9WTXVzcZsIMJdiXRYyGlsfehBN2nuzdC348v6
	 3ogX1rMyZahN46d9WF5Y7GtRkolOwCG9jFqM+Qj4aRhKv7jtUlWYfgzP7TdnjYwgWKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDdzpWtG;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61453606A32F
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:57:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61453606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDdzpWtG
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so2095105a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 23:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793606241; x=1794211041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5c8E46H9D8n1iz1NiuFP9wVSIjo8xwMshDoKle/plSc=;
        b=PDdzpWtGMOwoOLfrPO8sDsEm8c1q5TKZxZsfhrFyo/wZpemg/P6zlhmZzFUPk79JHV
         3oBL1ytEl1/IWa8+Bn8VeSqcZxIVkdHNCFAMI/ucugnIZucZrmBBuaJuTpXHcc9a8hKo
         WSmfZu8PFRQeafdtChAIr9j0wOBnqCS2dIjTEt7sS5ZKdGpCyIivbLWgq+h+FGZ5v8cY
         YSs79YBlKK2gglW313UAlFcNmovMailRncuC7HQVR2C5Y0beO1LvMO5Ho1MrP1kcyx4P
         tOTtulTapMN97YlVnz5cKUawd1meRglO964+tIlZHUdHA71Ny8JjhkZM3B6n0jbZcpuk
         dZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606241; x=1794211041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5c8E46H9D8n1iz1NiuFP9wVSIjo8xwMshDoKle/plSc=;
        b=2qteXuN0rpsjGKj0dpjFWAd7jwySFXMNYUMzJEGjlI0WhvjAVIOnhlQixAhyfIYakG
         pD+vhuQqpInNluvo12Tf27GH5J+PTM/QQ/dP/p2iSQegbufEHCbmxnkq4CLT864I/rnC
         ilhkS8A2E4qqezEOLZ+J6fM2yDPbiCny7VgUcOxBYFLa9sTi2YJhLCEAG1xuEBXSElU+
         4H5oE2RamOUWGxuRULxz/osXf0EB1isWxs8kUrP5Q+TRqPHz9xJbjLv/KFWhoJoEwEEJ
         LMN9HxNqYiU43T6c21EL23WJ8jOr1iv8vQc2UxdnV9SF+DtHs78urns3W9vuJbkPNf0i
         EWAg==
X-Forwarded-Encrypted: i=1; AKwUvBzhCEO92UsSYUuksng0BhqzN9+xnjo6Ozrhhmf3V5PbY9cQ1wpeh5/yjAfZ9VvMaJeeOlEJaOULyzmfMf0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q8zUKV/OA4I0vc/+zLu5mIuLRPkxs6nGUdH0b+HMW6Z1CSI3B
	ddL1Uf4wALhbPk0iwzmDohLDU4U1+4XWEYM2mOgc5zGeW/IkueSi3AxI
X-Gm-Gg: AYBFou3Bd5sY8svO0Jme20T06MfkPJuNpr77WcbdbzZ7vofFcrLLnNLizG+h6onkzsN
	hiK6Rfsk4CZ0FcBphHnjJofOIaJINKdZEZkeNKC1rMbyvsyEKBquw7F7BoVVz8Fl3fbECx2kq1w
	bCXr2FCuuaiNXxQyf0kIwjmfrUcQcAKw7OqAdYKXEYY7rYi0tphEeQvPvhlNv2eONOLRA3BEwd8
	tNxdnFoiTsgTtbUN1X4OQNE8uABghuO9SV1sh1qhjOla0Xn5Ox5yuVDClQY0TNsNtolLHtlvqnU
	6hJC0fDSbcSBQk2GWeAacDhKyWEfuUzohisSlbb7qgZ0IamObsohqX4xWlLZzXaWC/sq9ZdMQcC
	NFAEUYSfqE3NOiCT6z+5VhbBjgyaYfubzaC+CEi2xFP2yT7Kcu4M/SLXG6gzqcoTG6dWZEpI0vc
	WzJ7mnNPV0guIUk6hoyrbwalw4c+oIoLl0P+X9L3P/eure38Jj8HSXUVwMAAiCswCOeha4hIESP
	FOMKp5oBqj7sGY/9d9PQPnLACIMuagJ7eLtHlV+g6MsDDeFRLITxXq1qti74aYgQUUyu5cpXKyl
	II43/4KI2kIC+eLpPE8hOxiiD0hMYcbSSddjXmsEe6XmN3WkCbPcp8SzBYPfgDoE1D8slz/tuZP
	0wlYAMQm7nCw6K5PIOWlHH0tkv+9i6OmMDNeF/IaqrDqTEv0JSGowDximxseAuAZzJLJ9fJ3/1g
	RN+qY=
X-Received: by 2002:a17:90b:4b90:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3ae8984b662mr7868096a91.58.1793606240670;
        Sun, 01 Nov 2026 23:57:20 -0800 (PST)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.191])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e9583c1sm18649416a91.10.2026.11.01.23.57.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 01 Nov 2026 23:57:20 -0800 (PST)
From: Yu Zhang <yuz08559@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] gpio: virtuser: remove the debugfs files before freeing the line data
Date: Mon,  2 Nov 2026 17:57:07 +1000
Message-ID: <20261102075707.41742-1-yuz08559@gmail.com>
X-Mailer: git-send-email 2.55.0
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

gpio_virtuser_probe() registers the devm action that removes the debugfs
directory before it allocates the per-line and per-array data that the
debugfs files point to. devres releases resources in reverse order, so
on unbind the line data is freed, the consumer_lock mutex is destroyed
and the GPIO descriptors are put first, and the debugfs files are only
removed afterwards.

A read or write of any of the per-line debugfs files (value, direction,
consumer, interrupts, ...) that runs in that window dereferences the
freed data. debugfs_remove_recursive() waits for in-flight file
operations, but by then the data has already been freed.

Running eight threads that read the per-line debugfs files while
another task writes 1 and 0 to the configfs "live" attribute triggers
this within a second on a KASAN kernel, with gpio-sim as the provider:

  BUG: KASAN: slab-use-after-free in gpio_virtuser_value_get+0x19/0x60
  Read of size 8 at addr ffff888005109e38 by task vu_race/3479
  Call Trace:
   gpio_virtuser_value_get+0x19/0x60
   simple_attr_read+0x109/0x290
   debugfs_attr_read+0x5e/0x80
   full_proxy_read+0xae/0xe0
   vfs_read+0x1bc/0x7a0
  Allocated by task 1:
   devm_kmalloc+0x89/0x1d0
   gpio_virtuser_probe+0x56f/0x910
  Freed by task 1:
   kfree+0x196/0x430
   release_nodes+0x77/0xa0
   devres_release_all+0xf3/0x150
   device_unbind_cleanup+0x18/0x130
   ...
   platform_device_unregister+0x3c/0x50
   gpio_virtuser_device_deactivate+0x3c/0xc0

The same run also reports use-after-free on the freed consumer_lock
from the consumer attribute.

Register the debugfs removal action after the line data has been set
up, so that it runs first on unbind, and remove the directory by hand
on the probe error paths before that point.

Fixes: 91581c4b3f29 ("gpio: virtuser: new virtual testing driver for the GPIO API")
Cc: stable@vger.kernel.org
Signed-off-by: Yu Zhang <yuz08559@gmail.com>
---
 drivers/gpio/gpio-virtuser.c | 46 +++++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
index 70ddccc..03fa951 100644
--- a/drivers/gpio/gpio-virtuser.c
+++ b/drivers/gpio/gpio-virtuser.c
@@ -927,38 +927,50 @@ static int gpio_virtuser_probe(struct platform_device *pdev)
 				     "Failed to get the IDs of GPIOs to request\n");
 
 	dbgfs_entry = debugfs_create_dir(dev_name(dev), gpio_virtuser_dbg_root);
-	ret = devm_add_action_or_reset(dev, gpio_virtuser_debugfs_remove,
-				       dbgfs_entry);
-	if (ret)
-		return ret;
 
 	for (i = 0; i < num_ids; i++) {
 		descs = devm_gpiod_get_array(dev, ids[i], GPIOD_ASIS);
-		if (IS_ERR(descs))
-			return dev_err_probe(dev, PTR_ERR(descs),
-					     "Failed to request the '%s' GPIOs\n",
-					     ids[i]);
+		if (IS_ERR(descs)) {
+			ret = dev_err_probe(dev, PTR_ERR(descs),
+					    "Failed to request the '%s' GPIOs\n",
+					    ids[i]);
+			goto err_remove_debugfs;
+		}
 
 		ret = gpio_virtuser_dbgfs_init_line_array_attrs(dev, descs,
 								ids[i],
 								dbgfs_entry);
-		if (ret)
-			return dev_err_probe(dev, ret,
-					     "Failed to setup the debugfs array interface for the '%s' GPIOs\n",
-					     ids[i]);
+		if (ret) {
+			dev_err_probe(dev, ret,
+				      "Failed to setup the debugfs array interface for the '%s' GPIOs\n",
+				      ids[i]);
+			goto err_remove_debugfs;
+		}
 
 		for (j = 0; j < descs->ndescs; j++) {
 			ret = gpio_virtuser_dbgfs_init_line_attrs(dev,
 							descs->desc[j], ids[i],
 							j, dbgfs_entry);
-			if (ret)
-				return dev_err_probe(dev, ret,
-						     "Failed to setup the debugfs line interface for the '%s' GPIOs\n",
-						     ids[i]);
+			if (ret) {
+				dev_err_probe(dev, ret,
+					      "Failed to setup the debugfs line interface for the '%s' GPIOs\n",
+					      ids[i]);
+				goto err_remove_debugfs;
+			}
 		}
 	}
 
-	return 0;
+	/*
+	 * The debugfs files point to the devres-managed line data allocated
+	 * above. Register the removal last so that it runs first on unbind,
+	 * before any of that data is released.
+	 */
+	return devm_add_action_or_reset(dev, gpio_virtuser_debugfs_remove,
+					dbgfs_entry);
+
+err_remove_debugfs:
+	debugfs_remove_recursive(dbgfs_entry);
+	return ret;
 }
 
 static const struct of_device_id gpio_virtuser_of_match[] = {
-- 
2.43.0

