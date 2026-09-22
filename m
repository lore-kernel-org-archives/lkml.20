Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361623AA1B5
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790045310; cv=none; b=raAwqL0ijPu9MYwk6bGMt1FwaJZM9t1ptFjTh8BB3t/llpeZYLK5QGjP4kIvKYmI9QAARo2cckBU4ZD/vKm8sbg2c+AR2rJRFlYrF79mrGsFYjDI747VTVF00hAII3peeyPSZRW4/pA0CSDb6RPcMdY9ItApQTFOepo/XBjYz8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790045310; c=relaxed/simple;
	bh=CZc4QBGy+BG9JJGrAOVmoVxgxeojzJnci50cnAtfNzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E+iAxH8jrVjWnM59ZZAxsyv2qZ4wtCyFggtP4tE4gGUk6hggvifvQR9Fp9c/I9SZqsGRmhG6P/bvgMqR/5qkKqd6XmnahGL0+0QK/haBWetqB7Jn0TqJGIoY6QItXfSIqjmiRmrb/cZ9EUqeDF+l1nhV41MtJtEfc+DI5ex5jN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aX0vjANr; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aX0vjANr"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccda24afso2627415a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 19:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790045308; x=1790650108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rWmT8GXNkKIjtVq2Tp5ZmO6NxHuTlquOEZj2eN8N3GI=;
        b=aX0vjANrtzKgVtIZGdfa9N0e+322OLQitOduMj0y9pu/VDQ7/dhy308mXhyJ2K6iZY
         O/N/s2FKnNXl/qFj1ZqtpK7hiktpgVkX94Pot9PbHWIa2/ptiatpGJqaRhdDctWQ2JiP
         J2JRVDBXc993XkbtpgTl6GlOSa7t3jf09oHYmwtiRO6U72qqBrUWtNZr4OejKjKMb75q
         yeRIQzlC4olZdQHSTpRa3ggIlZkerIQZXr4+cH85FfsKD4tYlCCcEzKBixa2CoPhJ6hy
         oq04HgZ9Ce5gX94QyKJZ5kONJYYVWgagBPOYPDBT2tqANiHwkwb8ScX4j2qfXNikK0Sz
         6dcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790045308; x=1790650108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rWmT8GXNkKIjtVq2Tp5ZmO6NxHuTlquOEZj2eN8N3GI=;
        b=OnwaMCJ+wjkg+w2DVt5lyBIn1e0oFevs8QrBsbYfhClXgh3ayVAdQlNYK9Oy+DiPVh
         LIfrNLyoq2fUyQJoZpNkLMCbOTJhcszM2EGuTL2v9q6bhT9P33wvAM1Mc+ZiuU8SaUUN
         Tb1XT/iAk4c4Pgw92wCnRlK/41rpT00Z2Ce3BcpD3m3P3DuRzJzYJCLTL9cYzL2Fqfgc
         ooGl8zVmoWsEPrV3yf7YgBnSKT/jAGkWhBNv28YeOHODbL0OMD1o0Hcjrp21n46BDRcE
         /j3YEEetPohJvoZm09sAuPiz3ubem0C35Knd7r2fkOl3M17XzO5dL0tL0JnDiVfKcQS8
         Bvdw==
X-Forwarded-Encrypted: i=1; AKwUvBxzXWUIsoyUcV5K6lcAGhreXEjn5bl6Ac1OzHoYqvkufkJdc9OIDR4reGFP2cx4Yszh3V1zWlPYgi2q+H4=@vger.kernel.org
X-Gm-Message-State: AFuF++lB4KBxksYW13/W8rWipl3Oe6RUva99ALfehq6074KOVy3yMXvQ
	Ye5aT07Xo14NVR26ophRg04M8yc+J5VbCUyI1OSlN6i9KbI23oWEZhUn
X-Gm-Gg: AYBFou0SOJjhDz5SsVJrwg7pdyxZsaZkFGL4ilq9mTeOrScUGca0y6eud9ZUK4vSZlb
	wDph8nqzBDP7fRddelNVI8bu46jFbTVoRVDzVwAuxkxqR53QyCDiE8glVDZBzQdi9P3uZLBYylF
	FPoHU+z1ttlDkHZhAlHYQ1mIRGjmjVxM/36FbcY/FdR6iuYGSI8HY3Ef5N93INfQdWEOydWWrKp
	8SrDKTI1EYjrwGOjL69VjDNJMXqVHzEUH6EsQnItashcVmoIj+C1a7+RO+UDAsyFQaNhbr+gB9C
	tnjJOvXezyiPb7vLZrCDcPuWBUF3ffOu04o5VrqCPf27TL7zaLIAv2JI/PDBVEMuyk50d50Xbph
	B9EP0yTOQk45oEgqIwxp23ANtq2TmQl8LGAn7GiEYwEFC46ojIQNfHub/+IFY3zIzqOal2NVcSw
	wSooeUn+sa44z5sRp2Dm+qzvClM0eyumNmXbB7SQCRy/iNDbCVXxCjApD5siKvZwG6rs+hIoGz9
	kRND+Ff
X-Received: by 2002:a17:90b:224c:b0:39d:f317:44cd with SMTP id 98e67ed59e1d1-39e54eab3dbmr22577003a91.14.1790045308578;
        Mon, 21 Sep 2026 19:48:28 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06caf4a73sm297312a91.2.2026.09.21.19.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 19:48:28 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Damon Ding <damon.ding@rock-chips.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [RFC PATCH 2/5] ata: libahci_platform: Adapt the return value changed for disabled blob
Date: Tue, 22 Sep 2026 10:47:17 +0800
Message-ID: <20260922024724.191412-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922024724.191412-1-inochiama@gmail.com>
References: <20260922024724.191412-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Check EOPNOTSUPP for disabled helper function as the change in phy core.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/ata/libahci_platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/ata/libahci_platform.c b/drivers/ata/libahci_platform.c
index 6e072d681341..3e8ddbeb49b3 100644
--- a/drivers/ata/libahci_platform.c
+++ b/drivers/ata/libahci_platform.c
@@ -371,11 +371,11 @@ static int ahci_platform_get_phy(struct ahci_host_priv *hpriv, u32 port,
 
 	rc = PTR_ERR(hpriv->phys[port]);
 	switch (rc) {
-	case -ENOSYS:
+	case -EOPNOTSUPP:
 		/* No PHY support. Check if PHY is required. */
 		if (of_property_present(node, "phys")) {
 			dev_err(dev,
-				"couldn't get PHY in node %pOFn: ENOSYS\n",
+				"couldn't get PHY in node %pOFn: EOPNOTSUPP\n",
 				node);
 			break;
 		}
-- 
2.55.0

