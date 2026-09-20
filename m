Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com [115.124.28.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 904A12BE034;
	Sun, 20 Sep 2026 01:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789869576; cv=none; b=rh16uRXPrepYfzr+KWLGA21xfXxxCCbizadzkoiohvTtDOCY4RnT/nitmhWtzBsH3Qpvlrph8tj6mRmaCS0WDczuwODoM+91fE9n4TEpex/y87t4qrIB29zV1zDHLML6XTgz5O0OMk6F97Wta+SGbCUpEHAKrXdDndadjn2QgAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789869576; c=relaxed/simple;
	bh=NicB8UjZ7AhDGYBH43QmJsxIWbyfXeYVZKDgG/p1crQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bDiB0RMtLcvfxtJG8R1CcJ1TK7IU43QkaA8dmMHPQOD5ghzJWt8lqH+lqqOsCMwkfu/xzY2QNywCggRy21vgoS6VfnyCYeDeDzsKxjDS5Eg5AM2Zx8lVp6AETf8ziflBvcC4CJRf/N2cjTBQ7dL2X4bWtu+5o7xH/EXJeSrDOPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com; spf=pass smtp.mailfrom=xiaopeng.com; dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b=lpuZDrPj; arc=none smtp.client-ip=115.124.28.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xiaopeng.com header.i=@xiaopeng.com header.b="lpuZDrPj"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1789869565; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=vpMbT8vuLVxppBLB/RyFsClpUUZNW5nPrPiRCsBnCvc=;
	b=lpuZDrPjIUimmNJglBhIyZj4oemUbJj/uuisoQ8Tq+J/8Ivb0hbGqp6LVvh7JVw8mqxxeNI+oTh3tHcBex7jvhKGe6ZaMplL4TGBFyo8BpqTtx9oUrB7ivE08owfMzArxVwW6AiSd4B9Aa4cusI7O4jW/r47Qv0Hw4A/ZnJIuN4=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07436846|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0311594-0.000396556-0.968444;FP=16490625187164439698|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037022039;MF=guozh23@xiaopeng.com;NM=1;PH=DS;RN=5;RT=5;SR=0;TI=SMTPD_---.jHmgDtb_1789869564;
Received: from localhost(mailfrom:guozh23@xiaopeng.com fp:SMTPD_---.jHmgDtb_1789869564 cluster:ay29)
          by smtp.aliyun-inc.com;
          Sun, 20 Sep 2026 09:59:24 +0800
From: Guo Zihao <guozh23@xiaopeng.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Liu Chao <liuc63@xiaopeng.com>
Subject: [PATCH v2] media: cobalt: bound the dv timings to the descriptor buffers
Date: Sun, 20 Sep 2026 09:59:23 +0800
Message-ID: <20260920015924.750499-1-guozh23@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
v2: declare the local struct cobalt pointer in cobalt_s_dv_timings().
    The cobalt_info() macro expands to v4l2_info(&cobalt->v4l2_dev, ...),
    so the function needs a variable of that name, which the previous
    version was missing. Found by the kernel test robot.

 drivers/media/pci/cobalt/cobalt-v4l2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/pci/cobalt/cobalt-v4l2.c b/drivers/media/pci/cobalt/cobalt-v4l2.c
index 51fd9576c..8ffee8ed6 100644
--- a/drivers/media/pci/cobalt/cobalt-v4l2.c
+++ b/drivers/media/pci/cobalt/cobalt-v4l2.c
@@ -617,6 +617,7 @@ static int cobalt_s_dv_timings(struct file *file, void *priv,
 				    struct v4l2_dv_timings *timings)
 {
 	struct cobalt_stream *s = video_drvdata(file);
+	struct cobalt *cobalt = s->cobalt;
 	int err;
 
 	if (s->input == 1) {
@@ -630,6 +631,13 @@ static int cobalt_s_dv_timings(struct file *file, void *priv,
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
@@ -781,6 +789,14 @@ static int cobalt_try_fmt_vid_cap(struct file *file, void *priv,
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

