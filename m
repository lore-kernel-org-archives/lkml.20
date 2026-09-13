Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76D63EC6B9;
	Sun, 13 Sep 2026 12:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303952; cv=none; b=goKKrJa55JkcwjyiPoXkvTxvx6LzRkYLlxdvX9STEgxL1/r09yTHX8O0/jDUFrUnfW4/EYb38Xddpi56A9Lx44an0ZgtAEeTJ/4w4g2ZvLfqvBVtmdwzIZwdqbJMD9E709Xz4LvilJgJBb5GZ72tP/yK3XtqmqE86fBwsBoHGH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303952; c=relaxed/simple;
	bh=0yH7up9wK7bv67DsfaGyN0fOIYkMs3mBFn4P28xQ0oc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jbIXadWa+4CEMPmWK/IJ8xK7wmww6IrWJRR9CrlV6PMfIt7I/P8cBnYzapFneK+hce9Il/1Wxclcry9N5ubTkrwE3LFV/xe01GqL1cLXLIPGInyuUWb4EK2RD5Sn6KhC6H5/iTZVZyQne3HczftHaiI3pMoldF7WykAu2HzSnME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=Dagyz37S; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="Dagyz37S"
Received: from seu.edu.cn (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d907a3f9;
	Sun, 13 Sep 2026 20:52:27 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: jacopo.mondi@ideasonboard.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com
Cc: kernel-list@raspberrypi.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH] media: pispbe: check configuration buffer CPU mappings
Date: Sun, 13 Sep 2026 20:52:24 +0800
Message-Id: <20260913125224.110051-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa09ad37f2803a1kunm913aef5425120d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhlLVkNKGh1PGExNQkxLGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhOQ0
	NVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=Dagyz37SunneW4iPEWr7VosuEqqD4oMyF1/h+LUo0AbEk627gU9+e57qlXP18NS2C7Rxd9i9lsPadoE/LT0QdZIUUO4muLGh1KQ8abLNZleFJxEq60fwE8RFp5TsbxjHpFskqPgwERSVCsw4N7nspm1w3jWm9LNG+BT6TBSVvF8=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=zneXk2zvxhOJsgdPO+EexwvyQ2vdihR/t5cnjfiXPTE=;
	h=date:mime-version:subject:message-id:from;

vb2_plane_vaddr() can return NULL when a DMA-BUF exporter cannot
provide a CPU mapping, even when the buffer's DMA mapping succeeded.
pispbe_node_buffer_prepare() unconditionally copies the configuration
from that address.

Reject the buffer with -ENOMEM before copying or validating the
configuration if no CPU mapping is available. No buffer is queued or
hardware operation started on this failure path.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 12187bd5d4f8 ("media: raspberrypi: Add support for PiSP BE")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/media/platform/raspberrypi/pisp_be/pisp_be.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
index d60d92d2ffa1..56bcf69d70f8 100644
--- a/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
+++ b/drivers/media/platform/raspberrypi/pisp_be/pisp_be.c
@@ -839,6 +839,9 @@ static int pispbe_node_buffer_prepare(struct vb2_buffer *vb)
 		void *dst = &node->pispbe->config[vb->index];
 		void *src = vb2_plane_vaddr(vb, 0);
 
+		if (!src)
+			return -ENOMEM;
+
 		memcpy(dst, src, sizeof(struct pisp_be_tiles_config));
 
 		return pisp_be_validate_config(pispbe, dst);
