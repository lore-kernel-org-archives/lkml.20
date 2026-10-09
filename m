Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ECC399CE9
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 03:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516947; cv=none; b=lasHRefKp//WqptnIE66yCZFl50yrCMZfhW4u9JCGqPPmVjnJPORfXZ3PEMxtRXDfSoxU/HdiAPWOFtscnF9dIT38YtuPQxoLc8z0HR6tfZx5hsiIPKllCPMhA/OSDlQNKVzcDcjPno+HZvLrt1SFGAGTw6UGIcHjSjp6oCf938=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516947; c=relaxed/simple;
	bh=K6q4MF3KQVdFM11TrkIgJqKHb0XoGqPxlhPB3Xblsu0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Q7iQ6HQ30XxJB6SNtyJQT72H+Qnp4vP1XS5eeU9spJOXFeIBSmw0tGO3A/0UYb+L5UER/byRJkmnjn62xxNQ9qyMZ2V1vsmLLQoL8a2swsnB4pYVtvBSF8kIEhH2CBZIKvjB9AByCeTZ9AnH9b1XctzELcL94UYQcjIddcfv31Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from fc87d0ffb700.home.arpa (unknown [36.110.52.2])
	by APP-03 (Coremail) with SMTP id rQCowABXVzUGYchqJ9MaCg--.1960S2;
	Fri, 09 Oct 2026 11:35:35 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linusw@kernel.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/kmb: fix bridge reference leak on probe error and remove
Date: Fri,  9 Oct 2026 11:35:37 +0800
Message-Id: <20261009033537.3065836-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowABXVzUGYchqJ9MaCg--.1960S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WrWUKrW3GF1UKFWUuF1kAFb_yoW8Jw4Upr
	W2gw4IkF40qr47ta17Aa18Ja4rAanrtFWrWrZ7K395Zw4rXa43WrykAFy29ryUCF4xWFZr
	tFs8tFyF9FykAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkmb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr
	1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY1x0262kKe7AKxVWUAVWU
	twCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
	1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
	64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr
	0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF
	0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjxUqqNKUUUUU
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRUPA2rIHibzcwAAsK

kmb_dsi_host_bridge_init() looks up the ADV7535 bridge with
of_drm_find_and_get_bridge(), which takes a reference on the bridge, and
stores it in the global adv_bridge. That reference is never released, so
unbinding the driver leaves the bridge refcount permanently elevated and
prevents the bridge driver from ever being removed. The same happens
when probe fails after the bridge has been found.

Release the reference in kmb_dsi_host_unregister(), which is called both
from the probe error path and from kmb_remove().

Fixes: abbe7f8144d5 ("drm/kmb/dsi: convert to of_drm_find_and_get_bridge()")
Assisted-by: DeepSeek-V4.1-Flash
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/gpu/drm/kmb/kmb_dsi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
index 59d0e856392f..483f4afe6317 100644
--- a/drivers/gpu/drm/kmb/kmb_dsi.c
+++ b/drivers/gpu/drm/kmb/kmb_dsi.c
@@ -184,6 +184,10 @@ void kmb_dsi_host_unregister(struct kmb_dsi *kmb_dsi)
 {
 	kmb_dsi_clk_disable(kmb_dsi);
 	mipi_dsi_host_unregister(kmb_dsi->host);
+
+	/* Release the bridge reference taken in kmb_dsi_host_bridge_init() */
+	drm_bridge_put(adv_bridge);
+	adv_bridge = NULL;
 }
 
 /*
-- 
2.25.1

