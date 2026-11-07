Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034487;
	b=GPg5s/+7Sq+R7kdt4qKw3pf0NqNQrB9jM1GetKITG3O/xjYpn7tsNrekd/EHH9c06q+d
	 sSCcd70kM+SJ4yhPHqn6z7MBkUS/wYn3UUnWflYAHONcD/VSglUI0VHSowdPFqTz/EbVd
	 idCt51pnZszJ2LInpzuO/U4sIhEPv6lrB+MfrkUkduV/M/3c7MofHPqweKBlpWAWOLHMN
	 ljbgy/tNd82iczK1VQ5H8AEXUU9tq/t5LXhS0t+obnEKmMoCD0cqoNYAD5U3j5SJAPPVa
	 uaCi/Gfk+ILokiqhLQC2A3TmjjCYvCv5jdlcbrc2SyLX5hofhXPnC5NGatlqrxI+1DQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034487;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=/FCux6jgIPm46jP4gUFYYgvKYW+4Rz5Ju8SSHD0kUhE=;
	b=P6MZ1d4ciySbzRZ4PnvArDj5ccpLRWn+piipf8Am3TYoUnfrdJ7NUFtG2ckDHF7MIZVe
	 12+R6hLgiwAiu60xsmxzbzrPNDzm/eKwpW4Qg0Y5WP6pT2hrObLb0vxRfc19G7zeDSVee
	 3XBYOpHoj7G0i86hJPhEiJgkOO1Hkx5RdPo8tqF6qLaFPSAoxO6IpyxaFnTrdJ8yJpYsF
	 YTmBU5LZSL4yp8AFAloITOezyjeLO7ruQC+IFFzN0DYjXi1H8t1yKFy8kchmO+Gw1CzI1
	 594muLgP9KtuW5HKjeQk01RNC4j24KSDvCDwuvbIjwZlNf7XWdQdnrmITH0JmKJCaiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=G1onGQ1W;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16ABE606A32C;
	Sat,  7 Nov 2026 06:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16ABE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=G1onGQ1W
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53d65d8fa;
	Sat, 7 Nov 2026 14:54:36 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mediatek: mdp3: Fix potential use-after-free on SCP removal
Date: Sat,  7 Nov 2026 14:54:35 +0800
Message-ID: <20261107-0d0c29e10a-media-mediatek-mdp3-1@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa1b4c9a39903a1kunmde59ae2f82b65
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCT0hIVkNKGEtOSk5MGhoeGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0hKTE
	1DVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=G1onGQ1WeE2CyEpmKCJixxA/33f6sKFropE31Up8JTuxaXXSkhd0XLVIDTC+kVxOAALy6gbEsLbUhTadqDe+nSf7IkGdYznvlNDZD8BPOK5M6creVX4+iLleoBfx21wOwBsLzuA9aSqswWQxMQ/LMwHBMDRvV+eX/UqA1J8Spzo=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=/FCux6jgIPm46jP4gUFYYgvKYW+4Rz5Ju8SSHD0kUhE=;
	h=date:mime-version:subject:message-id:from;

MDP contexts can outlive the SCP driver whose data they use for VPU
teardown. Unregistering only the V4L2 parent neither disconnects the
video node nor finishes these sessions.

Link MDP to SCP and disconnect the video node before draining jobs and
closing every VPU session. Release hardware dependencies during remove,
while retaining the software state for the last open file. Balance the
remoteproc references on session shutdown and failed initialization.

This issue was found by our static analysis tool under development.

Fixes: 61890ccaefaf ("media: platform: mtk-mdp3: add MediaTek MDP3 driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Validation: Changed-object compilation passed with W=1 in the recorded
configuration. No hardware/kernel runtime test or full linked-kernel
build.
OpenAI Codex assisted with source review, patch implementation and
commit-message drafting. The submitter has reviewed the changes.

 .../platform/mediatek/mdp3/mtk-mdp3-core.c    | 84 ++++++++++++++-----
 .../platform/mediatek/mdp3/mtk-mdp3-core.h    |  1 +
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.c     | 34 ++++++--
 .../platform/mediatek/mdp3/mtk-mdp3-m2m.h     |  3 +-
 .../platform/mediatek/mdp3/mtk-mdp3-vpu.c     |  2 +-
 5 files changed, 96 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
index f412aadb5996..9fe42181a08c 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c
@@ -108,6 +108,7 @@ int mdp_vpu_get_locked(struct mdp_dev *mdp)
 err_init_vpu:
 	mdp_vpu_unregister(mdp);
 err_reg_vpu:
+	rproc_shutdown(mdp->rproc_handle);
 err_load_vpu:
 	mdp->vpu_count--;
 	return ret;
@@ -118,19 +119,24 @@ void mdp_vpu_put_locked(struct mdp_dev *mdp)
 	if (--mdp->vpu_count == 0) {
 		mdp_vpu_dev_deinit(&mdp->vpu);
 		mdp_vpu_unregister(mdp);
+		rproc_shutdown(mdp->rproc_handle);
 	}
 }
 
-void mdp_video_device_release(struct video_device *vdev)
+static void mdp_hardware_cleanup(struct mdp_dev *mdp)
 {
-	struct mdp_dev *mdp = (struct mdp_dev *)video_get_drvdata(vdev);
 	int i;
 
+	flush_workqueue(mdp->job_wq);
+	flush_workqueue(mdp->clock_wq);
+
 	for (i = 0; i < mdp->mdp_data->pp_used; i++)
 		if (mdp->cmdq_clt[i])
 			cmdq_mbox_destroy(mdp->cmdq_clt[i]);
 
+	mdp_vpu_shared_mem_free(&mdp->vpu);
 	scp_put(mdp->scp);
+	mdp->scp = NULL;
 
 	destroy_workqueue(mdp->job_wq);
 	destroy_workqueue(mdp->clock_wq);
@@ -151,10 +157,16 @@ void mdp_video_device_release(struct video_device *vdev)
 		if (!IS_ERR_OR_NULL(m))
 			mtk_mutex_put(m);
 	}
+}
+
+void mdp_video_device_release(struct video_device *vdev)
+{
+	struct mdp_dev *mdp = video_get_drvdata(vdev);
 
-	mdp_vpu_shared_mem_free(&mdp->vpu);
 	v4l2_m2m_release(mdp->m2m_dev);
+	ida_destroy(&mdp->mdp_ida);
 	kfree(mdp);
+	video_device_release(vdev);
 }
 
 static void mdp_put_device(void *_dev)
@@ -213,11 +225,45 @@ static int mdp_mm_subsys_deploy(struct mdp_dev *mdp, enum mdp_infra_id id)
 	return 0;
 }
 
+static int mdp_get_scp(struct mdp_dev *mdp)
+{
+	struct device_node *node;
+	struct platform_device *scp_pdev;
+	struct device_link *link;
+	int ret = -EPROBE_DEFER;
+
+	node = of_parse_phandle(mdp->pdev->dev.of_node, "mediatek,scp", 0);
+	if (node) {
+		scp_pdev = of_find_device_by_node(node);
+		of_node_put(node);
+	} else {
+		scp_pdev = __get_pdev_by_id(mdp->pdev, NULL, MDP_INFRA_SCP);
+	}
+	if (!scp_pdev)
+		return -EPROBE_DEFER;
+
+	link = device_link_add(&mdp->pdev->dev, &scp_pdev->dev,
+			       DL_FLAG_AUTOREMOVE_CONSUMER);
+	if (!link) {
+		ret = -ENOMEM;
+		goto err_put;
+	}
+	if (!device_is_bound(&scp_pdev->dev))
+		goto err_put;
+
+	mdp->scp = platform_get_drvdata(scp_pdev);
+	if (mdp->scp)
+		return 0;
+
+err_put:
+	put_device(&scp_pdev->dev);
+	return ret;
+}
+
 static int mdp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mdp_dev *mdp;
-	struct platform_device *mm_pdev;
 	struct resource *res;
 	int ret, i, mutex_id;
 
@@ -285,27 +331,16 @@ static int mdp_probe(struct platform_device *pdev)
 		goto err_destroy_job_wq;
 	}
 
-	mdp->scp = scp_get(pdev);
-	if (!mdp->scp) {
-		mm_pdev = __get_pdev_by_id(pdev, NULL, MDP_INFRA_SCP);
-		if (WARN_ON(!mm_pdev)) {
-			dev_err(&pdev->dev, "Could not get scp device\n");
-			ret = -ENODEV;
-			goto err_destroy_clock_wq;
-		}
-		mdp->scp = platform_get_drvdata(mm_pdev);
-	}
-
-	if (!mdp->scp) {
-		ret = -EPROBE_DEFER;
+	ret = mdp_get_scp(mdp);
+	if (ret)
 		goto err_destroy_clock_wq;
-	}
 
 	mdp->rproc_handle = scp_get_rproc(mdp->scp);
 	dev_dbg(&pdev->dev, "MDP rproc_handle: %p", mdp->rproc_handle);
 
 	mutex_init(&mdp->vpu_lock);
 	mutex_init(&mdp->m2m_lock);
+	INIT_LIST_HEAD(&mdp->contexts);
 
 	for (i = 0; i < mdp->mdp_data->pp_used; i++) {
 		mdp->cmdq_clt[i] = cmdq_mbox_create(dev, i);
@@ -373,10 +408,19 @@ static int mdp_probe(struct platform_device *pdev)
 static void mdp_remove(struct platform_device *pdev)
 {
 	struct mdp_dev *mdp = platform_get_drvdata(pdev);
+	struct video_device *vdev = mdp->m2m_vdev;
 
-	v4l2_device_unregister(&mdp->v4l2_dev);
+	if (!vdev) {
+		kfree(mdp);
+		return;
+	}
 
-	dev_dbg(&pdev->dev, "%s driver unloaded\n", pdev->name);
+	/* Keep the software state until removal and all open files finish. */
+	get_device(&vdev->dev);
+	mdp_m2m_device_unregister(mdp);
+	mdp_hardware_cleanup(mdp);
+	v4l2_device_unregister(&mdp->v4l2_dev);
+	put_device(&vdev->dev);
 }
 
 static int __maybe_unused mdp_suspend(struct device *dev)
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
index 05cade1d098e..cf9662bd2792 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.h
@@ -134,6 +134,7 @@ struct mdp_dev {
 	struct v4l2_m2m_dev			*m2m_dev;
 	/* synchronization protect for m2m device operation */
 	struct mutex				m2m_lock;
+	struct list_head			contexts;
 	atomic_t				suspended;
 	refcount_t				job_count;
 };
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
index ad3ae89c231c..ce0efe15866d 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c
@@ -490,7 +490,7 @@ static int mdp_m2m_queue_init(void *priv,
 	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	src_vq->dev = &ctx->mdp_dev->pdev->dev;
-	src_vq->lock = &ctx->ctx_lock;
+	src_vq->lock = &ctx->mdp_dev->m2m_lock;
 
 	ret = vb2_queue_init(src_vq);
 	if (ret)
@@ -504,7 +504,7 @@ static int mdp_m2m_queue_init(void *priv,
 	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->dev = &ctx->mdp_dev->pdev->dev;
-	dst_vq->lock = &ctx->ctx_lock;
+	dst_vq->lock = &ctx->mdp_dev->m2m_lock;
 
 	return vb2_queue_init(dst_vq);
 }
@@ -577,6 +577,11 @@ static int mdp_m2m_open(struct file *file)
 		goto err_free_ctx;
 	}
 
+	if (!video_is_registered(vdev)) {
+		ret = -ENODEV;
+		goto err_unlock_mutex;
+	}
+
 	ret = ida_alloc(&mdp->mdp_ida, GFP_KERNEL);
 	if (ret < 0)
 		goto err_unlock_mutex;
@@ -593,7 +598,6 @@ static int mdp_m2m_open(struct file *file)
 	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
 	v4l2_fh_add(&ctx->fh, file);
 
-	mutex_init(&ctx->ctx_lock);
 	ctx->m2m_ctx = v4l2_m2m_ctx_init(mdp->m2m_dev, ctx, mdp_m2m_queue_init);
 	if (IS_ERR(ctx->m2m_ctx)) {
 		dev_err(dev, "Failed to initialize m2m context\n");
@@ -609,8 +613,6 @@ static int mdp_m2m_open(struct file *file)
 		goto err_release_m2m_ctx;
 	}
 
-	mutex_unlock(&mdp->m2m_lock);
-
 	/* Default format */
 	default_format.type = V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
 	default_format.fmt.pix_mp.width = limit->out_limit.wmin;
@@ -620,6 +622,9 @@ static int mdp_m2m_open(struct file *file)
 	default_format.type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	mdp_m2m_s_fmt_mplane(file, &ctx->fh, &default_format);
 
+	list_add_tail(&ctx->list, &mdp->contexts);
+	mutex_unlock(&mdp->m2m_lock);
+
 	dev_dbg(dev, "%s:[%d]", __func__, ctx->id);
 
 	return 0;
@@ -647,6 +652,7 @@ static int mdp_m2m_release(struct file *file)
 	struct device *dev = &mdp->pdev->dev;
 
 	mutex_lock(&mdp->m2m_lock);
+	list_del(&ctx->list);
 	v4l2_m2m_ctx_release(ctx->m2m_ctx);
 	if (mdp_m2m_ctx_is_state_set(ctx, MDP_VPU_INIT))
 		mdp_vpu_put_locked(mdp);
@@ -727,7 +733,25 @@ int mdp_m2m_device_register(struct mdp_dev *mdp)
 
 void mdp_m2m_device_unregister(struct mdp_dev *mdp)
 {
+	struct mdp_m2m_ctx *ctx;
+
+	mutex_lock(&mdp->m2m_lock);
 	video_unregister_device(mdp->m2m_vdev);
+	v4l2_m2m_suspend(mdp->m2m_dev);
+
+	list_for_each_entry(ctx, &mdp->contexts, list) {
+		vb2_queue_error(v4l2_m2m_get_src_vq(ctx->m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->m2m_ctx));
+		v4l2_m2m_streamoff(NULL, ctx->m2m_ctx,
+				   V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		v4l2_m2m_streamoff(NULL, ctx->m2m_ctx,
+				   V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+		if (mdp_m2m_ctx_is_state_set(ctx, MDP_VPU_INIT)) {
+			mdp_vpu_put_locked(mdp);
+			atomic_andnot(MDP_VPU_INIT, &ctx->curr_param.state);
+		}
+	}
+	mutex_unlock(&mdp->m2m_lock);
 }
 
 void mdp_m2m_job_finish(struct mdp_m2m_ctx *ctx)
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
index dfc59e5b3b87..f473f5f20aa2 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.h
@@ -27,6 +27,7 @@ struct mdp_m2m_ctrls {
 };
 
 struct mdp_m2m_ctx {
+	struct list_head			list;
 	u32				id;
 	struct mdp_dev			*mdp_dev;
 	struct v4l2_fh			fh;
@@ -36,8 +37,6 @@ struct mdp_m2m_ctx {
 	u32				frame_count[MDP_M2M_MAX];
 
 	struct mdp_frameparam		curr_param;
-	/* synchronization protect for mdp m2m context */
-	struct mutex			ctx_lock;
 };
 
 int mdp_m2m_device_register(struct mdp_dev *mdp);
diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
index 67f3001153ae..c1fd639930e5 100644
--- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
+++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c
@@ -62,7 +62,7 @@ void mdp_vpu_shared_mem_free(struct mdp_vpu_dev *vpu)
 {
 	struct device *dev;
 
-	if (IS_ERR_OR_NULL(vpu))
+	if (IS_ERR_OR_NULL(vpu) || !vpu->scp)
 		return;
 
 	dev = scp_get_device(vpu->scp);

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
