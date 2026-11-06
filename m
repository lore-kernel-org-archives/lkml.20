Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956831;
	b=dY9O99Wg4mTpqWcG0fWSKIrnFNyK6Wl+kgTddJEpyAxj0Rs0MjFgbhkq39NsU982F3uB
	 U6gJXmYR5tdOrDR5ta7nle4BmSJuC07VIDMkE001/UuOfw3hswIqmn0q4Tlc3nIVfttNb
	 xZMiQl3IPus92JAbdOU8OyoG0ZUbBGTIqKWj2ZI2pJXbIOeyRRyUx2IH18r2YNfNIfUYP
	 VBuK0WtvuyuC0u9DjEnYB8DD/URPDZiGT95SVTP+XR1gU2ncnCyqXG48uI73XYdIXXIwm
	 9Hrwvlka8L1JsA+NTtu0CEz25RApt16Nld/jVc5iUvvYtkZEAa08zaiMAcSaQEvc62A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=;
	b=s4/7cMucmpBzyYnpRVs3FrWV5wRmd13Fy1ODAuDBF1yjwNDWwQ3hNqWtpoohfavw/xxm
	 zs0GXWMIuFBccr+TVwjyay2ZbBBg6+1CR9TOjewYmrwiL2uf2g4pbXB0ryorriW5jhxOo
	 S9MO2ZG1GrV7qDkp8hKD8TX0dYbzXP907SsANV3rSSvlzvNwJlld7xAEjqB1DUc5YlVjn
	 X1S2mvjGZ12sF9eDF1HXHECJy+IMrO145xAl+9sAEQj8mRN3LHdy5MQcaoM4w+lupGdFT
	 IB6i6zPqqZkcvmTfuo7AIIRLtljOj4emO49+UK/TC83CEAEvOJTW6Xdy5Cj0OwKQ6uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d9sEdFZx;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E8C606D806
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 09:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1E8C606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d9sEdFZx
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso717356eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 01:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793956830; x=1794561630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=;
        b=d9sEdFZxl/F57JPnGEkODh45bf2mF+RYjB6EC9cR505zxJxmd1sisNxiS9eewFjf8g
         EnYac85LVJf2eSpER58mQmykeYcYFzWyn57Wq4TB3DqwYlpK7xsvN3BQNC4Z+IgiEMvV
         a3MqpJVn8KZRDuC8tMkrSOJcaPO53uurv9/XilACN0duQL788w4S5d3avOTu+d+CbASR
         3XMAzWTERKQSo1SzBKgtNlwJTzjzegTXoxJ7p3Xu7jFJ41Dz3xPIBGEZWK2DC/X6fpIn
         SJBqeTZpQOsh1ZgdbJEMLDzVx0wETPLZR0okAcZVxENgoYE+gX9c27W5kh+EJ3wsP3Hy
         8gjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956830; x=1794561630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggqU2z0JBuwwyOOBFpelvoLoHdUUbWw3FkHf6dtYia8=;
        b=QeAsOlF9knttAWFTCf9z0A0I0EeVeLpUQrW2Oe3b3A6M9OuYxj6FhV2cCcOgaI3fc4
         CFrh5Alxn5fXAaDlva8qxJp862zH2/WQ6Tq1chanclXJN0XiEDldoWHu3JBwOe5+0xwj
         Qs7tI9pETkBwA1OJTLl69ccupH2S1q10J+8hue/DyTxTiGfvESHT79fVXuPfPK7AlBBA
         yekwiqHqsI2tu9kPCQAGrhqBk7HAutkEKxxPKbxmd4Qe3W7kogVrWgE/E0Q5KEQKdh9X
         JkL9CoJgzkddkygERw4oWYCkzv/IGY3Z1Pc0SFsz4kyRT5g4REOLsPjmYgmMhfm4C9Uh
         /5dg==
X-Forwarded-Encrypted: i=1; AKwUvByxB4qyGflQg7bnz4ApKosrmNkKMev/ZJTE/0BOGnfbcBrCiRrOJVOzfpweFVOTcN4y78EUx0+vyaeulf4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jzSJfAV5e0VDb4tPdlIZUNS8wALvnTNaDYisSxY3ZTlVyoA4M
	sOmgtOMwuLxCAKqd01vNCIAMBzsVnRDrXE9cZdEWg/Pt+7rjIaPqHTk=
X-Gm-Gg: AYBFou0/VOdjzf7OKo+t5G2gCHKHrzx1xYezc4kEq4XXr/BWez5mQ0MlZmQqk6Qlvu2
	0LcoL/63RreXEowOzeJp38MSmNhjqhLqjN8hhSMQitcfRU8oczbaBMfyjRwJdECgkr+YGSgdze1
	NUfmXoEiMf1juCrFbONGt4ZbhrwGQK+j1A5E6lYDiYi5J28tGeNtyHhMDuxwVgWQvJTb0Ss19CS
	IxvpmnCPnG1TcAA2YNuhap32BEcz8J1gMPhCLOqP1Jg+vwN4ys/+xeWGu5eJcBqx9l0A5d3+h84
	T2DwaPemCfjZz8jqL7QoHPTa+EdlnBlzaqh9iONikVgUWwIahsgi6u9bFnwox7RBLD/P3N909Lt
	oJKFlOST8Qi/DqJWlVHWrHcJ4tCqPhiWALPDXHcYfIBTH/h1QMO+MW1qSXV2dCghOSd28/5Dcyb
	kw6ikYEKo/YCgsHTYy8JkgO3MlY4YZNVZyK60y1n+2ysht4q25SqsOsbJuaQ5ySWaF52GrgX69k
	ekvHySdwtSzcGkQ+WhkLNhgsIU4rJYY+JXpPJsumEcSmNg6bn3T5ivxUKSc00P0LUGG3UD8ctqy
	Gn1Vk+cs9MvcxoPKihFwNrTt8wSQLTEgMpiEwdSKf/44l+D24F1l6ZwK
X-Received: by 2002:a05:701b:4507:20b0:1b0:f0f5:e38f with SMTP id a92af1059eb24-1b25d346c12mr2313612c88.34.1793956829858;
        Fri, 06 Nov 2026 01:20:29 -0800 (PST)
Received: from localhost.localdomain ([155.69.103.70])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a610fsm3783796c88.11.2026.11.06.01.20.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 06 Nov 2026 01:20:29 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: Keep the mutex node reference across deferred binds
Date: Fri,  6 Nov 2026 17:20:23 +0800
Message-ID: <confirmed-20261105-38-2e09963f1b23@gmail.com>
X-Mailer: git-send-email 2.50.1
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

mtk_drm_probe() acquires private->mutex_node and releases that reference
on probe failure or in mtk_drm_remove(). The component bind callback does
not acquire another reference, so it must not put the node when the mutex
platform device is not available.

If this bind failure propagates through component_master_add_with_match(),
the probe error path puts the same reference again. A bind attempted after
probe has returned can also leave the stored node without its reference
for a later bind or remove.

Remove the bind-time put and leave the node reference with its probe/remove
owner.

Fixes: 119f5173628a ("drm/mediatek: Add DRM Driver for Mediatek SoC MT8173.")
Cc: stable@vger.kernel.org
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/gpu/drm/mediatek/mtk_drm_drv.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index dc8e3e917dd771b950167d04c1ab87c14dbabf72..64c912ba95899128bfb1a41765579d9d70979a27 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -630,7 +630,6 @@ static int mtk_drm_bind(struct device *dev)
 	if (!pdev) {
 		dev_err(dev, "Waiting for disp-mutex device %pOF\n",
 			private->mutex_node);
-		of_node_put(private->mutex_node);
 		return -EPROBE_DEFER;
 	}

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
