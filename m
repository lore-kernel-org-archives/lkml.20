Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913721;
	b=gIARA880XrF9LGObL6nuPtzpiVEiQWE3XGeiB90BFVrsjl+kQ9F7UYc5CkxyZGVkvR1O
	 xxgvhYBLYkfhGw81uzZ8Bl7brxMO99bqfU0L8OenlvvoD45gNiDpOCZ6o6WvUp74T3gRT
	 QNFKV4/WsEPwWgZP+GnZrH53Rl78Cl8NPkGtOU5clH8tB9z/dPwpzxgx2a7bpZe+dx23u
	 g5Cy88xYkKgT4c+BLVau/5GnGp68tdIxWqjwPwGcgMocj/45wA7bnO1pymeq6UUtQ1ap9
	 44ThHn6nLAwgJpFMZxn0qMcIYr98e51uXFM4JPhlcYZG/QZTPQrB2/3NAL2Qc2HBlpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913721;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-Originating-IP:X-CM-SenderInfo;
	bh=pS8zreZq0UmY4tUREcQdbf6JTwonN2UYxET701BoXbw=;
	b=OIEiUovYGjoeJ2EcI++IlGcTEeEUo7nnKvSgco5SyptkLRCRSNG7xEplfU8WtX+nrsfx
	 uorOrhf8fdtlOQMlUHx3ERg4Ld4x3+BjOe7EHxVtI/g1Y98t6oycZKrUI3sY4d7Hz5pA9
	 2nKHmZEl5dkLp9Com1NgJmC+YULt3YuOkL48C1vmKnGYR5K4O6yzQrNxcLasA5s33askQ
	 iUEko2yZ1294SVJbScz1Syudd46Yetzr+mEcNg6jV7fZyqoUfs8OOv3j32mysKcBjb6dS
	 qpyvaf5QRIpLp5VmhP1SHgRNLW3ArgQy+J4xT7c0tu+ZDSmoKDY7UjyQZTj1kA1N4HQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PZdQ456q;
	arc=none smtp.remote-ip=117.135.210.4
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F760606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F760606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=PZdQ456q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=pS
	8zreZq0UmY4tUREcQdbf6JTwonN2UYxET701BoXbw=; b=PZdQ456q2luCJuD1ma
	r2ygTIEI6otSZnz5D5W8fZuKIg/tHkAe1SLnCw7W0UzWDXIFUh4emUXlvwcmh43J
	LAbjptHqXCGnuDIE2qYSAq7p3Sd7x/qkK0iWjGq3FXCOdRigb0q2tqTfen+GBmNb
	kDsvgvwbILCc3umUesRxv9R9A=
Received: from SYPC (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDHb0+oNfxq1owtGg--.36967S2;
	Tue, 17 Nov 2026 19:08:25 +0800 (CST)
From: Yang Siyuan <hsyysy@163.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH v3] reset: core: honour optional resets when the GPIO fallback returns -ENOENT
Date: Tue, 17 Nov 2026 19:08:12 +0800
Message-ID: <20261117110812.20371-1-hsyysy@163.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261117095503.14115-1-hsyysy@163.com>
References: <20261117095503.14115-1-hsyysy@163.com>
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
X-CM-TRANSID:PigvCgDHb0+oNfxq1owtGg--.36967S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AFyfJF1UXFy3Zw4ruw4DArb_yoW8ZFWkpF
	s8Jr4rArn8uw18Cr48ZrWSyF1Fv3WfKFWUWF48C393ua15XFyfJrW3K3Waqr4UArZ7ua4Y
	yF47JFn7ZFyqy3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UhNVkUUUUU=
X-CM-SenderInfo: 5kv152r16rljoofrz/xtbC7glRhWr8NanURwAA3q

__fwnode_reset_control_get() honours RESET_CONTROL_FLAGS_BIT_OPTIONAL by
returning NULL when the requested reset is not described in the device
tree.  The reset-gpio fallback breaks this: when
__reset_add_reset_gpio_device() fails with -ENOENT, the error is returned
even for an optional reset.

This is reachable on Allwinner SoCs, whose pinctrl uses three-cell GPIO
specifiers.  The reset-gpio fallback only supports two cells, so it
returns -ENOENT and a consumer asking for an optional reset fails to
probe instead of falling back to its own GPIO handling.  mmc-pwrseq-simple
on the Anbernic RG35XX family hits this: its wifi_pwrseq node has
reset-gpios but no resets, so the SDIO WiFi adapter never probes.

Return NULL only for -ENOENT when the reset was requested as optional.
A reset that is described but cannot be used is still an error, so
-EPROBE_DEFER and all other failures are propagated.

Signed-off-by: Yang Siyuan <hsyysy@163.com>
---
Changes in v3:
- Drop the Fixes and Cc: stable tags.  The patch does not apply on top
  of c721f189e89c because the surrounding code was changed by
  1f10008aff71 ("reset: use lock guards in reset core") and
  9035073d0ef1 ("reset: convert reset core to using firmware nodes").
  It is a mainline fix only; older stable trees need a separate backport.

Changes in v2:
- Only translate -ENOENT to NULL for an optional reset; propagate all
  other errors, as suggested by Philipp Zabel.

 drivers/reset/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d..daa4038 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -1181,6 +1181,8 @@ __fwnode_reset_control_get(struct fwnode_handle *fwnode, const char *id, int ind
 		ret = __reset_add_reset_gpio_device(fwnode, &args);
 		if (ret) {
 			fwnode_handle_put(args.fwnode);
+			if (ret == -ENOENT && optional)
+				return NULL;
 			return ERR_PTR(ret);
 		}
 	}

base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
-- 
2.56.1

