Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CFB4471CE4
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 19:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790364717; cv=none; b=pgtGPZofbsvdxq8iHqbNHn8VK0AAhL01V/o6HfapM6S+E4KlqQvTtA1CLaS+4f0/I7lllexdBVIx5TnEzsLTtjqP3LPZSL/liyEAMpM8dj2m+cbipMyQvbpz+AlOBeXJTENWeqk8UZzdx1PKH+fNExpM2yaFK6zxdgHq0s1y5gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790364717; c=relaxed/simple;
	bh=cYiVeZguetQ2DZ7DdyUR8Q0IdUlxNmguR0zDq8TQ450=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rvjHAnU9roZbUVUgao9eaVCf9u0709TTEkuDwfp65D1NTXObwl+R1YHGPtn5vB2+LtW3Mhff+m3FA+CyPfawmqD6dxXkOwYTcN68j7nIX7egbTwwEdnMxlk0fYjFGYCQNDe5KzTShE4XXaYgFR5weCmxZJDUdB2zQvae6ouFFBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cXeEC0Yb; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cXeEC0Yb"
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c83a304930so44983e0c.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790364714; x=1790969514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BHhX4lWU7b61qXvFhT2xwAHTxPoZGFp0LuRIrYtjK68=;
        b=cXeEC0YbpkQNFZXbh3Oy6ws7BSOT5yU2I06BgJCIIJOfkFkkFyZVdNPc05uOicqz8i
         OcwJNTiOFD+SxWc1QhbujKZq9iZ5VsqWbrI1lcneBSpxN+lK2lOAvRNyRLdfgtud/fFf
         esbM7mm1VYZSO+ApJH+zeBjXojB8/5mSvk9McIwd2egHC4wRT14CktBIpi0Gh6UIHSTR
         MDrJkWQ7JeePez2SOyHhHJqqBV0it7jLLzxT73jKnylAtesKVeHElWYDNfPxXsSaknZf
         bYO/Wj8gi157S+1dA1+RxftjUpvEi9pcOnB36dm2bFJOCZqmI+fqppYBklmXzhl48shJ
         0jLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790364714; x=1790969514;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BHhX4lWU7b61qXvFhT2xwAHTxPoZGFp0LuRIrYtjK68=;
        b=yTPbDVF056D//XGR7dpf9i8UZCFGk7WRYXY6eGsm83vZkEJD/MTQ3LivE0ndlVF9lg
         rqEF1JbVL9exUfuI+MJqn8U/OhKjqkl0na2brXIsiei7v0Yd2QhVdodd5GGC+IFXXRdJ
         3JJCO3v0FijzTA09YGzEaJ9+KLUvSaqX1esnPkL0x63nzAWGH5iGwGLI/z7S5f/mYI9E
         y1AW65VWKmQGGYRGpjuYZLTQv/UCtBZtKjSpTuONIGAqI5F4jLYVTBsNhTRWoRkQNQsT
         Meg2nIBB4RYRHjR8cvMMP4YPI/xRp7Pw5xQIsrP7BZ7IbMhO+Tqr5sA2yciMgFZLSutn
         QHyg==
X-Forwarded-Encrypted: i=1; AKwUvBwT09QV1xJ1e0GLmDCrM/7iTRIPBlU2Wsv1LDTsXqzKPtEJgj2IZKUHHBPhQo0lXctmgr8TgHJqDolbZKo=@vger.kernel.org
X-Gm-Message-State: AFuF++mK+DpmFP5gUczeSw2Gk/hfh+eeqUHujK0LYmawWggEKEXSCt25
	ioVZzPp/kzOIqZDyhqgtY9ivYOF4dVfGW+INLO1hn1kLZ/lmq35h1bsC
X-Gm-Gg: AYBFou1Jkf0zmc1M9XH5CP2LMNrwa64/+9fkgTEZRamS1SAoSvxzMGmk7Xmp2EIzhqd
	05s8QPG6nB34xAIV+bOn6etxj/8F86ifrshbat4ZAvtvCsztejpbsOFdLOprzT6/YRHUl6vlUX+
	KVqG8Ao3hn4o3szikzg1brGLGeg22Rq03Mk29CP6feBN6doC0vpcbSbtATzizAeTSBZ8h/k4CJd
	aJ0tm+ixALTnUyLIS9QORAqvAPbRfUH7Tjxj47op6zShTFUonQYmaCeYQByVB9I8JIpCLl2+Qgw
	JgTb7iu/FOFnOMIaRgzMxAkbJkAaIxPnyJmzbenLaDap+eH/HBofWm8mNwbR8pwSJvvBcwCRP0q
	l2HMxV7zjbWuCBWPfDsWzgp/iCQwsXYwCa5lco+5LW5Ql96pU5wfHuCA+X0hAp4dcdTaXvnxipR
	mB82rvFP8FEN1l9NYcbpb2zEN+DqTO3+3v9bFKEgug88ddmPa/2tNnJ/Z6VQqirfk40S2ngdWxj
	ixB+241+0fYhPFESazT/xDSEDzvQA==
X-Received: by 2002:ac5:c7d3:0:b0:5c8:39c7:ba55 with SMTP id 71dfb90a1353d-5cb061001fdmr2264470e0c.0.1790364714250;
        Fri, 25 Sep 2026 12:31:54 -0700 (PDT)
Received: from Tifa.lan ([2804:1124:fd10:e01:5236:1a05:963b:44ce])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5cd23e654e8sm2043280e0c.16.2026.09.25.12.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:31:53 -0700 (PDT)
From: Carlos Junior <cjuniorfox@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>
Cc: linux-ide@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Carlos Junior <cjuniorfox@gmail.com>
Subject: [PATCH] ata: sata_mv: enable SoC SATA LED presence indication
Date: Fri, 25 Sep 2026 16:31:34 -0300
Message-ID: <20260925193134.114566-1-cjuniorfox@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the SoC SATA LED controller in mv_soc_enable_leds().

Set the LED controller enable, device presence multiplexing, and
activity blink bits in the SoC SATA host-controller register. This
enables SATA device presence indication on boards using the SoC SATA
controller.

Signed-off-by: Carlos Junior <cjuniorfox@gmail.com>
---
 drivers/ata/sata_mv.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/sata_mv.c b/drivers/ata/sata_mv.c
index d260f04e6..4a6a6dc7b 100644
--- a/drivers/ata/sata_mv.c
+++ b/drivers/ata/sata_mv.c
@@ -251,6 +251,7 @@ enum {
 	SOC_LED_CTRL		= 0x2c,
 	SOC_LED_CTRL_BLINK	= (1 << 0),	/* Active LED blink */
 	SOC_LED_CTRL_ACT_PRESENCE = (1 << 2),	/* Multiplex dev presence */
+	SOC_LED_CTRL_ENABLE	= (1 << 3),	/* Enable SATA LED control */
 						/*  with dev activity LED */
 
 	/* Shadow block registers */
@@ -3382,12 +3383,21 @@ static void mv6_phy_errata(struct mv_host_priv *hpriv, void __iomem *mmio,
 	writel(m2, port_mmio + PHY_MODE2);
 }
 
-/* TODO: use the generic LED interface to configure the SATA Presence */
-/* & Acitivy LEDs on the board */
+/*
+ * Enable the SoC SATA LED controller and device presence
+ * indication on the board's SATA LEDs.
+ */
 static void mv_soc_enable_leds(struct mv_host_priv *hpriv,
 				      void __iomem *mmio)
 {
-	return;
+	void __iomem *hc_mmio;
+
+	hc_mmio = mv_hc_base(mmio, 0);
+
+	writel(SOC_LED_CTRL_ENABLE |
+		SOC_LED_CTRL_ACT_PRESENCE |
+		SOC_LED_CTRL_BLINK,
+		hc_mmio + SOC_LED_CTRL);
 }
 
 static void mv_soc_read_preamp(struct mv_host_priv *hpriv, int idx,
-- 
2.54.0

