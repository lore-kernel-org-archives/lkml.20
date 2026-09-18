Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com [115.124.28.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E5031F9A4;
	Fri, 18 Sep 2026 07:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716346; cv=none; b=Hig6rkIs6ma7C4XNxhUQ5s1ol+IbObiQyGmbDmRe0vJDNK5vEOpZVH/uGFzPdaVECYy61TZVJMbihF4icZBIwCCinuZ3w10jHyYYR4p7pPp8kRI0cAYjfpTII9myl/i3Cttic28cRuy1kfJDmtLFMCVKZJ4BGlgi9F3jbImcPco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716346; c=relaxed/simple;
	bh=yueMONiV/Cmb+liEi0wBSz7qlsE84Pw6JtOT63JQ0jg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e4QDB5+O48XaJAUcS4S1dZyXSNSdqbvM0Ka6S6hpBvNeljlXj1qcZ8dX8o4HFpYfVc0dOoE11dVRXsbpRXvKVkcsgpcO1Y/XcGg8k/fR2WRBnrV6y03mw7s88FxxgzUVCQwEpDKlPFnloycJCBYiLk5mqo6rnQjDsWCDO+EHj1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=V3r7wrAE; arc=none smtp.client-ip=115.124.28.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="V3r7wrAE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789716327; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=sll5laKba92JNQbjfcpaT+WqIaDeKOZTZ5DZL3y6kZ8=;
	b=V3r7wrAESuw+ki2pNpr+cHvcJ/VxxTwqnS5uWa60gb1XBQbY7yMzeEaEhJfw4yj7x8CmAenu17Ix8UhB21+pNluFy2TLYZa49wkxcLdo1yChgRbF3ND58e/okXGC8IqPGB7V+npxWjWtq6Wk0swrM7Ip1eFd22HoJDVOZLmgr8Y=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07438509|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0152483-0.000600922-0.984151;FP=16635866275147140262|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037026024;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jGhvVKy_1789716326;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jGhvVKy_1789716326 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 18 Sep 2026 15:25:26 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH] media: cobalt: bound the dv timings to the descriptor buffers
Date: Fri, 18 Sep 2026 15:25:26 +0800
Message-ID: <20260918072526.2478529-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

media: cobalt: bound the dv timings to the descriptor buffers

The DMA descriptor buffers are sized from the maximum frame the driver
supports:

        const size_t max_pages_per_line =
                (COBALT_MAX_WIDTH * COBALT_MAX_BPP) / PAGE_SIZE + 2;
        const size_t bytes =
                COBALT_MAX_HEIGHT * max_pages_per_line * 0x20;

With COBALT_MAX_WIDTH 1920, COBALT_MAX_HEIGHT 1200 and COBALT_MAX_BPP 3
that is 115200 bytes, or 3600 descriptors of 0x20 bytes each.

cobalt_s_dv_timings() however records whatever the subdevice accepts
without checking it against those maxima:

        err = v4l2_subdev_call(s->sd, pad, s_dv_timings, 0, timings);
        if (!err) {
                s->timings = *timings;
                s->width = timings->bt.width;
                s->height = timings->bt.height;
                s->stride = timings->bt.width * s->bpp;
        }

descriptor_list_create() in cobalt-omnitek.c then walks the whole frame
and writes one descriptor per scatterlist segment, with no upper bound of
its own. An HDMI source at 4096x2160 with bpp 3 gives stride 12288 and
size 26542080, which needs far more than the 3600 descriptors the buffer
holds, so d[] walks off the end of the coherent allocation.

cobalt_try_fmt_vid_cap() and cobalt_try_fmt_vid_out() already cap width
and height at 1920x1080, and this patch adds the same bound for the
timings path plus a stride limit on the pixelformat path.

No Fixes tag. The descriptor sizing and s_dv_timings() both come from the
initial driver, 85756a069c55 ("[media] cobalt: add new driver").

Reviewed-by: Liu Chao <liuc63@xiaopeng.com>
Signed-off-by: Guo Zihao <guozh23@xiaopeng.com>
---
The timings come from the subdevice, which for the HDMI inputs is the
adv7604/adv7842 receiver, so connecting a source above 1080p is enough
to reach this. That is an ordinary signal, not a crafted one.

The stride limit in cobalt_try_fmt_vid_cap() covers the path where
bytesperline is chosen from userspace rather than derived from the
timings.

 drivers/media/pci/cobalt/cobalt-v4l2.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 51fd9576c..32d967254 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -630,6 +630,13 @@ static int cobalt_s_dv_timings(struct file *file, void *priv,
 	if (vb2_is_busy(&s->q))
 		return -EBUSY;
 
+	if (timings->bt.width > COBALT_MAX_WIDTH ||
+	    timings->bt.height > COBALT_MAX_HEIGHT) {
+		cobalt_info("timings %ux%u out of range\n",
+			    timings->bt.width, timings->bt.height);
+		return -EINVAL;
+	}
+
 	err = v4l2_subdev_call(s->sd,
 			pad, s_dv_timings, 0, timings);
 	if (!err) {
@@ -781,6 +788,14 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv,
 		break;
 	}
 
+	/*
+	 * The DMA descriptor buffers are sized for at most
+	 * COBALT_MAX_WIDTH x COBALT_MAX_HEIGHT, so limit the line stride
+	 * accordingly.
+	 */
+	if (pix->bytesperline > COBALT_MAX_WIDTH * COBALT_MAX_BPP)
+		pix->bytesperline = COBALT_MAX_WIDTH * COBALT_MAX_BPP;
+
 	pix->sizeimage = pix->bytesperline * pix->height;
 	pix->field = V4L2_FIELD_NONE;
 
-- 
2.50.1

