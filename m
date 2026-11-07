Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794034480;
	b=WtVOAlgyhN/M+RI9APSLMiomzB53hPOC/KJL3KBCDqNqV77Mr+PD3c+8w0wp1qO9E00I
	 0QfsT6t4G33xpsONW+NYfwQEd0D8ib4S8mOM+SIvnfaOvURITMV1Uc+YgcIjkBNkcMsni
	 r/70LFYycVUiUt9/Wc/tvvNu5rnmgPYiutMLRpfksfpKFbxVj7ZiK5oakKKfEjW527fUL
	 fKg+GQGsfnHkcr/qYOnmTFhz8J79NugZejjcObh575j7RpVppIAZnYRhnSK4j/4LINW89
	 qEZT7yyFd8jdf2CXGdU+vC3uXoNSmCQdJDCofTm3iAuLWn64Qcy2BgjDhgQysmhU8UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794034480;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=pmCe0GVS8cEYC38vku8ybkaWHsFIKYjNTpdj8ylZk48=;
	b=tZjYCdT0ghEGKzddwQrdyv7aVr5ESKrCRhyKuDEh+Rx8FsJKb+RNYiXEf9phpFnq64cg
	 NFlDTxzcJibxNYtsisr8KphMvNtbqReRaqE9N+1kHk/pTAHIQpHk6cGVWe7bQri3vipQN
	 vxtj/bmNefLNWqWmNX8rCb++D+ggQARgJyIGqQE7vsAZWuzI2ycBMobZKPvE8cRuR3/tb
	 sCXAG6TgYMgOOXHwETSnS/hGKPYRSCX1c6f9qBikDAfyABxS+voUNkwLloHwnJw123EWt
	 /K8InauRlF5woCgzqEOzq8BL7pCb2MjR1Ea9pdpcxzxs16xfahj6w2aNncjGRZnwiog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=YmFHj0H7;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98B3606A326;
	Sat,  7 Nov 2026 06:54:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B98B3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=YmFHj0H7
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 53d65d8f6;
	Sat, 7 Nov 2026 14:54:33 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: nxp: imx8-isi: Fix potential pipe leaks on removal
Date: Sat,  7 Nov 2026 14:54:32 +0800
Message-ID: <20261107-0d0c29e10a-media-imx8-isi-1@mail.sdu.edu.cn>
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
X-HM-Tid: 0aa1b4c99a7603a1kunmda8f23ec82b57
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSUwZVh5MTkpJSkweGhpKTFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0hKTE
	1DVUpLS1VKQktLWQY+
DKIM-Signature: a=rsa-sha256;
	b=YmFHj0H7QXjLneSXJgVlUSWz/8im3yh9zy6Qw7AowFUbYGfvqtGlOhkbJQY6mX8iMnNfqeieZM1Q7ED+0/5AmanoqFsKAonwO4Ek4pzYGgPeshEecc+tZmqDdQYCjuRLdfDWTuelclOI832jQwIERDbnHJwurWo/+r2HrUujW8Y=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=pmCe0GVS8cEYC38vku8ybkaWHsFIKYjNTpdj8ylZk48=;
	h=date:mime-version:subject:message-id:from;

The allocated pipe array is never freed. Its embedded video devices
and their parent state can also remain in use by open files after
unregistration, so freeing the array during remove is not sufficient.

Keep the state until both device-managed cleanup and the last V4L2
reference finish. Disconnect and drain capture and M2M queues before
releasing hardware resources, and complete outstanding capture power
references so late closes cannot affect a newly bound instance. Apply
the same cleanup to partially registered devices on probe failure.

This issue was found by our static analysis tool under development.

Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
---
Validation: Changed-object compilation passed with W=1 in the recorded
configuration. No hardware/kernel runtime test or full linked-kernel
build.
OpenAI Codex assisted with source review, patch implementation and
commit-message drafting. The submitter has reviewed the changes.

 .../platform/nxp/imx8-isi/imx8-isi-core.c     | 94 ++++++++++++-------
 .../platform/nxp/imx8-isi/imx8-isi-core.h     | 16 ++++
 .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 80 +++++++++++-----
 .../platform/nxp/imx8-isi/imx8-isi-video.c    | 40 +++++---
 4 files changed, 162 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index 0ae5f35e017c..bd046a0751b9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -114,6 +114,47 @@ static void mxc_isi_pipe_unregister(struct mxc_isi_pipe *pipe)
 	mxc_isi_video_unregister(pipe);
 }
 
+static void mxc_isi_release(struct kref *ref)
+{
+	struct mxc_isi_dev *isi = container_of(ref, struct mxc_isi_dev, ref);
+	unsigned int i;
+
+	mxc_isi_m2m_cleanup(isi);
+	for (i = 0; i < isi->num_pipes; ++i)
+		mxc_isi_pipe_cleanup(&isi->pipes[i]);
+	if (isi->crossbar_initialized)
+		mxc_isi_crossbar_cleanup(&isi->crossbar);
+	if (isi->media_initialized)
+		media_device_cleanup(&isi->media_dev);
+	kfree(isi->pipes);
+	put_device(isi->dev);
+	kfree(isi);
+}
+
+static void mxc_isi_put(void *data)
+{
+	struct mxc_isi_dev *isi = data;
+
+	kref_put(&isi->ref, mxc_isi_release);
+}
+
+static void mxc_isi_v4l2_release(struct v4l2_device *v4l2_dev)
+{
+	struct mxc_isi_dev *isi =
+		container_of(v4l2_dev, struct mxc_isi_dev, v4l2_dev);
+
+	mxc_isi_put(isi);
+}
+
+static void mxc_isi_video_unregister_all(struct mxc_isi_dev *isi)
+{
+	unsigned int i;
+
+	mxc_isi_m2m_unregister(isi);
+	for (i = 0; i < isi->num_pipes; ++i)
+		mxc_isi_pipe_unregister(&isi->pipes[i]);
+}
+
 static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 {
 	struct fwnode_handle *node = dev_fwnode(isi->dev);
@@ -128,9 +169,11 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 	media_dev->dev = isi->dev;
 
 	media_device_init(media_dev);
+	isi->media_initialized = true;
 
 	/* Initialize and register the V4L2 device. */
 	v4l2_dev->mdev = media_dev;
+	v4l2_dev->release = mxc_isi_v4l2_release;
 	strscpy(v4l2_dev->name, "mx8-img-md", sizeof(v4l2_dev->name));
 
 	ret = v4l2_device_register(isi->dev, v4l2_dev);
@@ -140,6 +183,8 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 		goto err_media;
 	}
 
+	kref_get(&isi->ref);
+
 	/* Register the crossbar switch subdev. */
 	ret = mxc_isi_crossbar_register(&isi->crossbar);
 	if (ret < 0) {
@@ -211,33 +256,25 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
 	return 0;
 
 err_m2m:
-	mxc_isi_m2m_unregister(isi);
 	v4l2_async_nf_cleanup(&isi->notifier);
 err_v4l2:
+	mxc_isi_video_unregister_all(isi);
 	v4l2_device_unregister(v4l2_dev);
+	media_device_unregister(media_dev);
+	v4l2_device_put(v4l2_dev);
 err_media:
-	media_device_cleanup(media_dev);
 	return ret;
 }
 
 static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
 {
-	unsigned int i;
+	mxc_isi_video_unregister_all(isi);
 
 	v4l2_async_nf_unregister(&isi->notifier);
 	v4l2_async_nf_cleanup(&isi->notifier);
-
 	v4l2_device_unregister(&isi->v4l2_dev);
 	media_device_unregister(&isi->media_dev);
-
-	mxc_isi_m2m_unregister(isi);
-
-	for (i = 0; i < isi->pdata->num_channels; ++i)
-		mxc_isi_pipe_unregister(&isi->pipes[i]);
-
-	mxc_isi_crossbar_unregister(&isi->crossbar);
-
-	media_device_cleanup(&isi->media_dev);
+	v4l2_device_put(&isi->v4l2_dev);
 }
 
 /* -----------------------------------------------------------------------------
@@ -479,11 +516,15 @@ static int mxc_isi_probe(struct platform_device *pdev)
 	unsigned int i;
 	int ret = 0;
 
-	isi = devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
+	isi = kzalloc_obj(*isi);
 	if (!isi)
 		return -ENOMEM;
 
-	isi->dev = dev;
+	isi->dev = get_device(dev);
+	kref_init(&isi->ref);
+	ret = devm_add_action_or_reset(dev, mxc_isi_put, isi);
+	if (ret)
+		return ret;
 	platform_set_drvdata(pdev, isi);
 
 	isi->pdata = of_device_get_match_data(dev);
@@ -521,48 +562,35 @@ static int mxc_isi_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret,
 				     "Failed to initialize crossbar\n");
 
+	isi->crossbar_initialized = true;
+
 	for (i = 0; i < isi->pdata->num_channels; ++i) {
 		ret = mxc_isi_pipe_init(isi, i);
 		if (ret < 0) {
 			dev_err(dev, "Failed to initialize pipe%u: %d\n", i,
 				ret);
-			goto err_xbar;
+			return ret;
 		}
+		isi->num_pipes++;
 	}
 
 	ret = mxc_isi_v4l2_init(isi);
 	if (ret < 0) {
 		dev_err(dev, "Failed to initialize V4L2: %d\n", ret);
-		goto err_xbar;
+		return ret;
 	}
 
 	mxc_isi_debug_init(isi);
 
 	return 0;
-
-err_xbar:
-	while (i--)
-		mxc_isi_pipe_cleanup(&isi->pipes[i]);
-	mxc_isi_crossbar_cleanup(&isi->crossbar);
-
-	return ret;
 }
 
 static void mxc_isi_remove(struct platform_device *pdev)
 {
 	struct mxc_isi_dev *isi = platform_get_drvdata(pdev);
-	unsigned int i;
 
 	mxc_isi_debug_cleanup(isi);
-
-	for (i = 0; i < isi->pdata->num_channels; ++i) {
-		struct mxc_isi_pipe *pipe = &isi->pipes[i];
-
-		mxc_isi_pipe_cleanup(pipe);
-	}
-
 	mxc_isi_v4l2_cleanup(isi);
-	mxc_isi_crossbar_cleanup(&isi->crossbar);
 }
 
 static const struct of_device_id mxc_isi_of_match[] = {
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index 58b47335afc7..b1357ab67148 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -10,6 +10,7 @@
 #ifndef __MXC_ISI_CORE_H__
 #define __MXC_ISI_CORE_H__
 
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/math.h>
 #include <linux/mutex.h>
@@ -208,6 +209,8 @@ struct mxc_isi_video {
 
 	/* Protects the vdev and vb2_q operations */
 	struct mutex			lock;
+	unsigned int			users;
+	bool				disconnected;
 
 	struct v4l2_pix_format_mplane	pix;
 	const struct mxc_isi_format_info *fmtinfo;
@@ -270,6 +273,9 @@ struct mxc_isi_pipe {
 };
 
 struct mxc_isi_m2m {
+	/* Serializes open, close and disconnection of all contexts. */
+	struct mutex			contexts_lock;
+	struct list_head		contexts;
 	struct mxc_isi_dev		*isi;
 	struct mxc_isi_pipe		*pipe;
 
@@ -287,6 +293,10 @@ struct mxc_isi_m2m {
 };
 
 struct mxc_isi_dev {
+	struct kref			ref;
+	unsigned int			num_pipes;
+	bool				crossbar_initialized;
+	bool				media_initialized;
 	struct device			*dev;
 
 	const struct mxc_isi_plat_data	*pdata;
@@ -354,6 +364,7 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *isi, struct vb2_buffer *vb2
 #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
 int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev);
 int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
+void mxc_isi_m2m_cleanup(struct mxc_isi_dev *isi);
 void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m);
 int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m);
 #else
@@ -366,6 +377,11 @@ static inline int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
 {
 	return 0;
 }
+
+static inline void mxc_isi_m2m_cleanup(struct mxc_isi_dev *isi)
+{
+}
+
 static inline void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m)
 {
 }
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
index b729eecad0fe..5349e09e9b57 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
@@ -46,6 +46,7 @@ struct mxc_isi_m2m_ctx_queue_data {
 };
 
 struct mxc_isi_m2m_ctx {
+	struct list_head list;
 	struct v4l2_fh fh;
 	struct mxc_isi_m2m *m2m;
 
@@ -629,6 +630,10 @@ static int mxc_isi_m2m_open(struct file *file)
 	struct mxc_isi_m2m_ctx *ctx;
 	int ret;
 
+	guard(mutex)(&m2m->contexts_lock);
+	if (!video_is_registered(vdev))
+		return -ENODEV;
+
 	ctx = kzalloc_obj(*ctx);
 	if (!ctx)
 		return -ENOMEM;
@@ -654,6 +659,7 @@ static int mxc_isi_m2m_open(struct file *file)
 		goto err_ctx;
 
 	v4l2_fh_add(&ctx->fh, file);
+	list_add_tail(&ctx->list, &m2m->contexts);
 
 	return 0;
 
@@ -670,6 +676,8 @@ static int mxc_isi_m2m_release(struct file *file)
 {
 	struct mxc_isi_m2m_ctx *ctx = file_to_isi_m2m_ctx(file);
 
+	guard(mutex)(&ctx->m2m->contexts_lock);
+	list_del(&ctx->list);
 	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
 	mxc_isi_m2m_ctx_ctrls_delete(ctx);
 
@@ -740,6 +748,8 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev)
 	m2m->pipe = &isi->pipes[0];
 
 	mutex_init(&m2m->lock);
+	mutex_init(&m2m->contexts_lock);
+	INIT_LIST_HEAD(&m2m->contexts);
 
 	/* Initialize the video device and create controls. */
 	snprintf(vdev->name, sizeof(vdev->name), "mxc_isi.m2m");
@@ -750,6 +760,7 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev)
 	vdev->minor	= -1;
 	vdev->release	= video_device_release_empty;
 	vdev->vfl_dir	= VFL_DIR_M2M;
+	vdev->lock	= &m2m->contexts_lock;
 
 	vdev->device_caps = V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
 	video_set_drvdata(vdev, m2m);
@@ -759,14 +770,14 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev)
 	if (IS_ERR(m2m->m2m_dev)) {
 		dev_err(isi->dev, "failed to initialize m2m device\n");
 		ret = PTR_ERR(m2m->m2m_dev);
-		goto err_mutex;
+		goto err_return;
 	}
 
 	/* Register the video device. */
 	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
 	if (ret < 0) {
 		dev_err(isi->dev, "failed to register m2m device\n");
-		goto err_m2m;
+		goto err_return;
 	}
 
 	/*
@@ -790,11 +801,11 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev)
 	vdev->entity.function = MEDIA_ENT_F_IO_V4L;
 	ret = media_entity_pads_init(&vdev->entity, 1, &m2m->pad);
 	if (ret)
-		goto err_video;
+		goto err_unregister;
 
 	ret = media_device_register_entity(v4l2_dev->mdev, &vdev->entity);
 	if (ret)
-		goto err_entity_cleanup;
+		goto err_unregister;
 
 	ret = media_create_pad_link(&vdev->entity, 0,
 				    &m2m->isi->crossbar.sd.entity,
@@ -802,13 +813,13 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev)
 				    MEDIA_LNK_FL_IMMUTABLE |
 				    MEDIA_LNK_FL_ENABLED);
 	if (ret)
-		goto err_entity_unreg;
+		goto err_unregister;
 
 	m2m->intf = media_devnode_create(v4l2_dev->mdev, MEDIA_INTF_T_V4L_VIDEO,
 					 0, VIDEO_MAJOR, vdev->minor);
 	if (!m2m->intf) {
 		ret = -ENOMEM;
-		goto err_entity_unreg;
+		goto err_unregister;
 	}
 
 	link = media_create_intf_link(&vdev->entity, &m2m->intf->intf,
@@ -816,7 +827,7 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev)
 				      MEDIA_LNK_FL_ENABLED);
 	if (!link) {
 		ret = -ENOMEM;
-		goto err_devnode;
+		goto err_unregister;
 	}
 
 	link = media_create_intf_link(&m2m->pipe->video.vdev.entity,
@@ -825,23 +836,14 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2_dev)
 				      MEDIA_LNK_FL_ENABLED);
 	if (!link) {
 		ret = -ENOMEM;
-		goto err_devnode;
+		goto err_unregister;
 	}
 
 	return 0;
 
-err_devnode:
-	media_devnode_remove(m2m->intf);
-err_entity_unreg:
-	media_device_unregister_entity(&vdev->entity);
-err_entity_cleanup:
-	media_entity_cleanup(&vdev->entity);
-err_video:
-	video_unregister_device(vdev);
-err_m2m:
-	v4l2_m2m_release(m2m->m2m_dev);
-err_mutex:
-	mutex_destroy(&m2m->lock);
+err_unregister:
+	mxc_isi_m2m_unregister(isi);
+err_return:
 	return ret;
 }
 
@@ -849,13 +851,43 @@ int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
 {
 	struct mxc_isi_m2m *m2m = &isi->m2m;
 	struct video_device *vdev = &m2m->vdev;
+	struct mxc_isi_m2m_ctx *ctx;
 
+	if (!video_is_registered(vdev))
+		return 0;
+
+	guard(mutex)(&m2m->contexts_lock);
 	video_unregister_device(vdev);
+	v4l2_m2m_suspend(m2m->m2m_dev);
+	list_for_each_entry(ctx, &m2m->contexts, list) {
+		guard(mutex)(&ctx->vb2_lock);
+		vb2_queue_error(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx));
+		v4l2_m2m_streamoff(NULL, ctx->fh.m2m_ctx,
+				   V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
+		v4l2_m2m_streamoff(NULL, ctx->fh.m2m_ctx,
+				   V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
+	}
 
-	v4l2_m2m_release(m2m->m2m_dev);
-	media_devnode_remove(m2m->intf);
-	media_entity_cleanup(&vdev->entity);
-	mutex_destroy(&m2m->lock);
+	if (m2m->intf) {
+		media_devnode_remove(m2m->intf);
+		m2m->intf = NULL;
+	}
+	media_device_unregister_entity(&vdev->entity);
 
 	return 0;
 }
+
+void mxc_isi_m2m_cleanup(struct mxc_isi_dev *isi)
+{
+	struct mxc_isi_m2m *m2m = &isi->m2m;
+
+	if (!m2m->isi)
+		return;
+
+	if (!IS_ERR_OR_NULL(m2m->m2m_dev))
+		v4l2_m2m_release(m2m->m2m_dev);
+	media_entity_cleanup(&m2m->vdev.entity);
+	mutex_destroy(&m2m->contexts_lock);
+	mutex_destroy(&m2m->lock);
+}
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
index fc907d357149..2ac860876491 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
@@ -1370,6 +1370,10 @@ static int mxc_isi_video_open(struct file *file)
 	struct mxc_isi_video *video = video_drvdata(file);
 	int ret;
 
+	guard(mutex)(&video->lock);
+	if (!video_is_registered(&video->vdev))
+		return -ENODEV;
+
 	ret = v4l2_fh_open(file);
 	if (ret)
 		return ret;
@@ -1380,6 +1384,7 @@ static int mxc_isi_video_open(struct file *file)
 		return ret;
 	}
 
+	video->users++;
 	return 0;
 }
 
@@ -1388,11 +1393,14 @@ static int mxc_isi_video_release(struct file *file)
 	struct mxc_isi_video *video = video_drvdata(file);
 	int ret;
 
-	ret = vb2_fop_release(file);
+	guard(mutex)(&video->lock);
+	ret = _vb2_fop_release(file, NULL);
 	if (ret)
 		dev_err(video->pipe->isi->dev, "%s fail\n", __func__);
 
-	pm_runtime_put(video->pipe->isi->dev);
+	if (!video->disconnected)
+		pm_runtime_put(video->pipe->isi->dev);
+	video->users--;
 	return ret;
 }
 
@@ -1460,6 +1468,14 @@ int mxc_isi_video_resume(struct mxc_isi_pipe *pipe)
  * Registration
  */
 
+static void mxc_isi_video_device_release(struct video_device *vdev)
+{
+	struct mxc_isi_video *video = video_get_drvdata(vdev);
+
+	mxc_isi_video_ctrls_delete(video);
+	media_entity_cleanup(&vdev->entity);
+}
+
 int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
 			   struct v4l2_device *v4l2_dev)
 {
@@ -1490,7 +1506,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
 	vdev->ioctl_ops	= &mxc_isi_video_ioctl_ops;
 	vdev->v4l2_dev	= v4l2_dev;
 	vdev->minor	= -1;
-	vdev->release	= video_device_release_empty;
+	vdev->release	= mxc_isi_video_device_release;
 	vdev->queue	= q;
 	vdev->lock	= &video->lock;
 
@@ -1543,7 +1559,8 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
 	return 0;
 
 err_video_unreg:
-	video_unregister_device(vdev);
+	mxc_isi_video_unregister(pipe);
+	return ret;
 err_ctrl_free:
 	mxc_isi_video_ctrls_delete(video);
 err_me_cleanup:
@@ -1556,14 +1573,15 @@ void mxc_isi_video_unregister(struct mxc_isi_pipe *pipe)
 {
 	struct mxc_isi_video *video = &pipe->video;
 	struct video_device *vdev = &video->vdev;
+	unsigned int i;
 
-	mutex_lock(&video->lock);
+	if (!video->pipe || !video_is_registered(vdev))
+		return;
 
-	if (video_is_registered(vdev)) {
-		video_unregister_device(vdev);
-		mxc_isi_video_ctrls_delete(video);
-		media_entity_cleanup(&vdev->entity);
-	}
+	vb2_video_unregister_device(vdev);
 
-	mutex_unlock(&video->lock);
+	guard(mutex)(&video->lock);
+	for (i = 0; i < video->users; ++i)
+		pm_runtime_put(video->pipe->isi->dev);
+	video->disconnected = true;
 }

base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
