Received: from out28-125.mail.aliyun.com (out28-125.mail.aliyun.com [115.124.28.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27FAA48E0F6;
	Fri, 18 Sep 2026 06:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789714323; cv=none; b=EjdXTDnQTvDn/ZcQkCg8jHPHUCIy3piY/roZdn7cB3Fetr1T3JzZHX2XMVS25R0N1D+Yyq7O80qiUCKa96CVLs505nR6WfCXRtH6B0qNELgiyI8UTwy52OcsnHs0OO039lHrIZ5N6S2Yxgl0Sb4Yqjgs3nch1ougyICv8J5EOnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789714323; c=relaxed/simple;
	bh=txZH199vw690dNhXLQvW7Udujx8CM5gx0O5+g32S2Zw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VsQPqlEfsh+S3cFso/ZozyLokFK4QaxVL9D88+uNxpuoFaK8MJ4+59FMoy/oF0Aob7jTqZkzVZnOZZ3xTZ+OOYpJbxPpbxXZDG6kqcebkgNSczcd2jK/J061CrjDcK+FmIWyWCcEdAHrZulTaLKTGTOCl4kiUK0Pn41TonbSEG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=JuCf/o6k; arc=none smtp.client-ip=115.124.28.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="JuCf/o6k"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789714311; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=fBc7z6BmUPbEJK7bc4oDeYwu2kUD4x9vpH5N3FZxqMQ=;
	b=JuCf/o6kEArp2JE1lj2b6xTOif8MCG+06VfLew4iawZY/BYrZqh1kD7TeFN2Ir1LjQS+lPpRAwzRJEnYMZwYqVs7EFrvlvosD4NXXDJaifENJNxDcVPF6WART1U2b25Q607l3kW/W4YR2s68yOzbwPZeq3BpPttGs21rZow7Dlg=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07458936|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0450445-0.0526231-0.902332;FP=13831582604903113374|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033068005250;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGcgmTz_1789714309;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGcgmTz_1789714309 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 14:51:50 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] media: cx18: clamp bytesused in the single buffer MDL path
Date: Fri, 18 Sep 2026 14:51:49 +0800
Message-ID: <20260918065149.2232468-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cx18_mdl_update_bufs_for_cpu() copies mdl->bytesused straight into the
buffer when the MDL holds a single buffer:

        if (list_is_singular(&mdl->buf_list)) {
                buf = list_first_entry(&mdl->buf_list, struct cx18_buffer,
                                       list);
                buf->bytesused = mdl->bytesused;

The value originates from the firmware. cx18_queue_get_mdl() receives it
as its bytesused argument and stores it in ret->bytesused; the mailbox
handler calls it as cx18_queue_get_mdl(s, id, mdl_ack->data_used), so
data_used from the firmware ACK is what ends up in the buffer. Firmware
that reports more than the buffer holds therefore reaches
cx18_copy_buf_to_user(), where

        size_t len = buf->bytesused - buf->readpos;

turns into a read past the end of the DMA buffer.

The multi buffer path already guards this: _cx18_mdl_update_bufs_for_cpu()
clamps each buffer to s->buf_size before assigning. Apply the same clamp
in the single buffer case.

The single buffer path is the common one here, not a corner case:
cx18_stream_init() sets bufs_per_mdl to 1, so list_is_singular() is
normally true.

No Fixes tag. Both paths were introduced together with the driver
(1c1e45d17b66, "V4L/DVB (7786): cx18: new driver for the Conexant
CX23418 MPEG"), and the clamp in the multi buffer path was added later,
leaving this one behind.

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
Reaching this needs firmware that reports a data_used larger than the
buffer it filled. The two paths then assign the same value and only one
of them bounds it.

The impact is a read past the DMA buffer rather than a write, and the
surplus data is handed to the reader of the stream. The clamp in the
multi buffer path keeps that case inside s->buf_size; the single buffer
path has no such bound.

 drivers/media/pci/cx18/cx18-queue.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/pci/cx18/cx18-queue.c b/drivers/media/pci/cx18/cx18-queue.c
index 04d6828f0..a973367d4 100644
--- a/drivers/media/pci/cx18/cx18-queue.c
+++ b/drivers/media/pci/cx18/cx18-queue.c
@@ -114,7 +114,10 @@ static inline void cx18_mdl_update_bufs_for_cpu(struct cx18_stream *s,
 	if (list_is_singular(&mdl->buf_list)) {
 		buf = list_first_entry(&mdl->buf_list, struct cx18_buffer,
 				       list);
-		buf->bytesused = mdl->bytesused;
+		if (mdl->bytesused > s->buf_size)
+			buf->bytesused = s->buf_size;
+		else
+			buf->bytesused = mdl->bytesused;
 		buf->readpos = 0;
 		cx18_buf_sync_for_cpu(s, buf);
 	} else {
-- 
2.50.1

