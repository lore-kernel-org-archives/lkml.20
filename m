Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794049291;
	b=LteX2eOSbyNArkx8S2lttTmbHF/7N3y7LPY8GucgFm+ra4Yif3QlrfMt+S/htdwTrY41
	 j/MLPWA9xLTfloNhbQBtAf3mWN2YjjagFXKZYnte+3PLnw33y7rPpuWgX7eTcxLK1pzTM
	 eSHod6qonnSHfjqnw/7PmytynKS/g8ZypPR2TAhCtHH1J9yjdWAzNQn3jRdALZqUT93gU
	 WeP2jCfpbD8d3kEScgqAttVPd0vrQPFsy13LMhLbrT8ORLoWMyosXtwSyf/ZZIy3ZlEMQ
	 Bkcn4Zgajg66X+6bBksDsIGTeTACXEem8xImaKKuGf1DbRlpWvZmYV2b38seSl/AKfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794049291;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:From:To:Cc:Subject:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=kBXkyTlojH4uL63bSswEOrUWuL0WEvMQDYQ8Uv3J1TA=;
	b=Vg8ipvNJWk06ovgkzyKW2Gvj7WvKfiZDnbJHpCnlDCTrW8fSvei4WMF3FCkge/ceDMu+
	 /9DEmHJKl55zdbQB3e7QKKLXmTHIJd5PeP66Ete9ufhxyFn6YO8DjiyPC8KPDS1rTj/kT
	 J3uU6fjJRpZ4r65ejNfX/ATh9BRagJDJSIHB2wf2UFEGuKPJew0QpLeIbXDoJhDV774cH
	 yuh52N+MarPk0N79zSaEXqMsLI1kmXJqzuwazvkDekJIvKVXuimIvVZRSfxq61Tq/GQ19
	 sDgO3BeJDxJtGwa0thhS5CBp9Q0KJhlay14Pb3v+u7Y5ZgJLv/xHNTxFJ4jWA2DsFkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SZ1oVdH0;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A240606A32C;
	Sat,  7 Nov 2026 11:01:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A240606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=SZ1oVdH0
Received: from killaraus.ideasonboard.com (2001-14ba-7086-3000--a06.rev.dnainternet.fi [IPv6:2001:14ba:7086:3000::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D85F1C14;
	Sat,  7 Nov 2026 11:59:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1794049147;
	bh=W7NW3Qj6PaImYAp39PMi3+HLoLZTTPDXnAGDxIJLkvk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SZ1oVdH0IiVVVgyZRq4+4QJnNMAcKA1heCQRNUmdQ+Q/Kjv1pp28flHG/gHr9aiEq
	 /hJP0pm/v//Z01UXMEGXyJ/MTggpMvW3zfXoy/+ulW1FqeBOVcc1UzdCcF32gxb2hE
	 1fyTA6CVqOiV0jPZJmdpZ5rg/3DtonaoSEmJRwTY=
Message-ID: <03690d4f815fa696cd645e16a394edfd@killaraus.ideasonboard.com>
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, linux-media@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: nxp: imx8-isi: Fix potential pipe leaks on removal
Date: Sat, 07 Nov 2026 13:01:23 +0200
In-Reply-To: <20261107-0d0c29e10a-media-imx8-isi-1@mail.sdu.edu.cn>
References:  <20261107-0d0c29e10a-media-imx8-isi-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hello,

This is an automated reply.

You have sent a patch or bug report that appears to have been generated
by an LLM. The commit message, code and/or problem description show
little to no real understanding of the issue and changes being proposed.

Such patches or reports require a large amount of work to handle. They
rely on maintainers to propose - and often even implement - a proper
design. The probability that the author will learn from the experience
to improve their future contributions is close to zero.

As a result, to make good use of maintainer time and keep the kernel
development process sustainable, your contribution has been rejected.

If you believe the change you proposed is important, take time to study
the problem, learn, and develop a solution without AI assistance.
Answering this e-mail or generating a new version of a patch by feeding
this reply to an LLM will only result in your e-mails being ignored.

Please note that if your patch attempted to address an important
problem, maintainers or other contributors can submit and merge a
similar or entirely different fix without crediting you.

Your contributions to the Linux kernel will be welcome if you genuinely
desire to invest your time and learn.

Thank you,

Laurent's mail bot

On Sat, 07 Nov 2026 14:54:32 +0800, Guangshuo Li <liguangshuo@mail.sdu.edu.cn=
> wrote:
> The allocated pipe array is never freed. Its embedded video devices
> and their parent state can also remain in use by open files after
> unregistration, so freeing the array during remove is not sufficient.
>=20
> Keep the state until both device-managed cleanup and the last V4L2
> reference finish. Disconnect and drain capture and M2M queues before
> releasing hardware resources, and complete outstanding capture power
> references so late closes cannot affect a newly bound instance. Apply
> the same cleanup to partially registered devices on probe failure.
>=20
> This issue was found by our static analysis tool under development.
>=20
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Signed-off-by: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
> ---
> Validation: Changed-object compilation passed with W=3D1 in the recorded
> configuration. No hardware/kernel runtime test or full linked-kernel
> build.
> OpenAI Codex assisted with source review, patch implementation and
> commit-message drafting. The submitter has reviewed the changes.
>=20
>  .../platform/nxp/imx8-isi/imx8-isi-core.c     | 94 ++++++++++++-------
>  .../platform/nxp/imx8-isi/imx8-isi-core.h     | 16 ++++
>  .../platform/nxp/imx8-isi/imx8-isi-m2m.c      | 80 +++++++++++-----
>  .../platform/nxp/imx8-isi/imx8-isi-video.c    | 40 +++++---
>  4 files changed, 162 insertions(+), 68 deletions(-)
>=20
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/=
media/platform/nxp/imx8-isi/imx8-isi-core.c
> index 0ae5f35e017c..bd046a0751b9 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
> @@ -114,6 +114,47 @@ static void mxc_isi_pipe_unregister(struct mxc_isi_pip=
e *pipe)
>  	mxc_isi_video_unregister(pipe);
>  }
> =20
> +static void mxc_isi_release(struct kref *ref)
> +{
> +	struct mxc_isi_dev *isi =3D container_of(ref, struct mxc_isi_dev, ref);
> +	unsigned int i;
> +
> +	mxc_isi_m2m_cleanup(isi);
> +	for (i =3D 0; i < isi->num_pipes; ++i)
> +		mxc_isi_pipe_cleanup(&isi->pipes[i]);
> +	if (isi->crossbar_initialized)
> +		mxc_isi_crossbar_cleanup(&isi->crossbar);
> +	if (isi->media_initialized)
> +		media_device_cleanup(&isi->media_dev);
> +	kfree(isi->pipes);
> +	put_device(isi->dev);
> +	kfree(isi);
> +}
> +
> +static void mxc_isi_put(void *data)
> +{
> +	struct mxc_isi_dev *isi =3D data;
> +
> +	kref_put(&isi->ref, mxc_isi_release);
> +}
> +
> +static void mxc_isi_v4l2_release(struct v4l2_device *v4l2_dev)
> +{
> +	struct mxc_isi_dev *isi =3D
> +		container_of(v4l2_dev, struct mxc_isi_dev, v4l2_dev);
> +
> +	mxc_isi_put(isi);
> +}
> +
> +static void mxc_isi_video_unregister_all(struct mxc_isi_dev *isi)
> +{
> +	unsigned int i;
> +
> +	mxc_isi_m2m_unregister(isi);
> +	for (i =3D 0; i < isi->num_pipes; ++i)
> +		mxc_isi_pipe_unregister(&isi->pipes[i]);
> +}
> +
>  static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  {
>  	struct fwnode_handle *node =3D dev_fwnode(isi->dev);
> @@ -128,9 +169,11 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  	media_dev->dev =3D isi->dev;
> =20
>  	media_device_init(media_dev);
> +	isi->media_initialized =3D true;
> =20
>  	/* Initialize and register the V4L2 device. */
>  	v4l2_dev->mdev =3D media_dev;
> +	v4l2_dev->release =3D mxc_isi_v4l2_release;
>  	strscpy(v4l2_dev->name, "mx8-img-md", sizeof(v4l2_dev->name));
> =20
>  	ret =3D v4l2_device_register(isi->dev, v4l2_dev);
> @@ -140,6 +183,8 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  		goto err_media;
>  	}
> =20
> +	kref_get(&isi->ref);
> +
>  	/* Register the crossbar switch subdev. */
>  	ret =3D mxc_isi_crossbar_register(&isi->crossbar);
>  	if (ret < 0) {
> @@ -211,33 +256,25 @@ static int mxc_isi_v4l2_init(struct mxc_isi_dev *isi)
>  	return 0;
> =20
>  err_m2m:
> -	mxc_isi_m2m_unregister(isi);
>  	v4l2_async_nf_cleanup(&isi->notifier);
>  err_v4l2:
> +	mxc_isi_video_unregister_all(isi);
>  	v4l2_device_unregister(v4l2_dev);
> +	media_device_unregister(media_dev);
> +	v4l2_device_put(v4l2_dev);
>  err_media:
> -	media_device_cleanup(media_dev);
>  	return ret;
>  }
> =20
>  static void mxc_isi_v4l2_cleanup(struct mxc_isi_dev *isi)
>  {
> -	unsigned int i;
> +	mxc_isi_video_unregister_all(isi);
> =20
>  	v4l2_async_nf_unregister(&isi->notifier);
>  	v4l2_async_nf_cleanup(&isi->notifier);
> -
>  	v4l2_device_unregister(&isi->v4l2_dev);
>  	media_device_unregister(&isi->media_dev);
> -
> -	mxc_isi_m2m_unregister(isi);
> -
> -	for (i =3D 0; i < isi->pdata->num_channels; ++i)
> -		mxc_isi_pipe_unregister(&isi->pipes[i]);
> -
> -	mxc_isi_crossbar_unregister(&isi->crossbar);
> -
> -	media_device_cleanup(&isi->media_dev);
> +	v4l2_device_put(&isi->v4l2_dev);
>  }
> =20
>  /* -----------------------------------------------------------------------=
------
> @@ -479,11 +516,15 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  	unsigned int i;
>  	int ret =3D 0;
> =20
> -	isi =3D devm_kzalloc(dev, sizeof(*isi), GFP_KERNEL);
> +	isi =3D kzalloc_obj(*isi);
>  	if (!isi)
>  		return -ENOMEM;
> =20
> -	isi->dev =3D dev;
> +	isi->dev =3D get_device(dev);
> +	kref_init(&isi->ref);
> +	ret =3D devm_add_action_or_reset(dev, mxc_isi_put, isi);
> +	if (ret)
> +		return ret;
>  	platform_set_drvdata(pdev, isi);
> =20
>  	isi->pdata =3D of_device_get_match_data(dev);
> @@ -521,48 +562,35 @@ static int mxc_isi_probe(struct platform_device *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "Failed to initialize crossbar\n");
> =20
> +	isi->crossbar_initialized =3D true;
> +
>  	for (i =3D 0; i < isi->pdata->num_channels; ++i) {
>  		ret =3D mxc_isi_pipe_init(isi, i);
>  		if (ret < 0) {
>  			dev_err(dev, "Failed to initialize pipe%u: %d\n", i,
>  				ret);
> -			goto err_xbar;
> +			return ret;
>  		}
> +		isi->num_pipes++;
>  	}
> =20
>  	ret =3D mxc_isi_v4l2_init(isi);
>  	if (ret < 0) {
>  		dev_err(dev, "Failed to initialize V4L2: %d\n", ret);
> -		goto err_xbar;
> +		return ret;
>  	}
> =20
>  	mxc_isi_debug_init(isi);
> =20
>  	return 0;
> -
> -err_xbar:
> -	while (i--)
> -		mxc_isi_pipe_cleanup(&isi->pipes[i]);
> -	mxc_isi_crossbar_cleanup(&isi->crossbar);
> -
> -	return ret;
>  }
> =20
>  static void mxc_isi_remove(struct platform_device *pdev)
>  {
>  	struct mxc_isi_dev *isi =3D platform_get_drvdata(pdev);
> -	unsigned int i;
> =20
>  	mxc_isi_debug_cleanup(isi);
> -
> -	for (i =3D 0; i < isi->pdata->num_channels; ++i) {
> -		struct mxc_isi_pipe *pipe =3D &isi->pipes[i];
> -
> -		mxc_isi_pipe_cleanup(pipe);
> -	}
> -
>  	mxc_isi_v4l2_cleanup(isi);
> -	mxc_isi_crossbar_cleanup(&isi->crossbar);
>  }
> =20
>  static const struct of_device_id mxc_isi_of_match[] =3D {
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/=
media/platform/nxp/imx8-isi/imx8-isi-core.h
> index 58b47335afc7..b1357ab67148 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
> @@ -10,6 +10,7 @@
>  #ifndef __MXC_ISI_CORE_H__
>  #define __MXC_ISI_CORE_H__
> =20
> +#include <linux/kref.h>
>  #include <linux/list.h>
>  #include <linux/math.h>
>  #include <linux/mutex.h>
> @@ -208,6 +209,8 @@ struct mxc_isi_video {
> =20
>  	/* Protects the vdev and vb2_q operations */
>  	struct mutex			lock;
> +	unsigned int			users;
> +	bool				disconnected;
> =20
>  	struct v4l2_pix_format_mplane	pix;
>  	const struct mxc_isi_format_info *fmtinfo;
> @@ -270,6 +273,9 @@ struct mxc_isi_pipe {
>  };
> =20
>  struct mxc_isi_m2m {
> +	/* Serializes open, close and disconnection of all contexts. */
> +	struct mutex			contexts_lock;
> +	struct list_head		contexts;
>  	struct mxc_isi_dev		*isi;
>  	struct mxc_isi_pipe		*pipe;
> =20
> @@ -287,6 +293,10 @@ struct mxc_isi_m2m {
>  };
> =20
>  struct mxc_isi_dev {
> +	struct kref			ref;
> +	unsigned int			num_pipes;
> +	bool				crossbar_initialized;
> +	bool				media_initialized;
>  	struct device			*dev;
> =20
>  	const struct mxc_isi_plat_data	*pdata;
> @@ -354,6 +364,7 @@ int mxc_isi_video_buffer_prepare(struct mxc_isi_dev *is=
i, struct vb2_buffer *vb2
>  #ifdef CONFIG_VIDEO_IMX8_ISI_M2M
>  int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struct v4l2_device *v4l2=
_dev);
>  int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi);
> +void mxc_isi_m2m_cleanup(struct mxc_isi_dev *isi);
>  void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m);
>  int mxc_isi_m2m_resume(struct mxc_isi_m2m *m2m);
>  #else
> @@ -366,6 +377,11 @@ static inline int mxc_isi_m2m_unregister(struct mxc_is=
i_dev *isi)
>  {
>  	return 0;
>  }
> +
> +static inline void mxc_isi_m2m_cleanup(struct mxc_isi_dev *isi)
> +{
> +}
> +
>  static inline void mxc_isi_m2m_suspend(struct mxc_isi_m2m *m2m)
>  {
>  }
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c b/drivers/m=
edia/platform/nxp/imx8-isi/imx8-isi-m2m.c
> index b729eecad0fe..5349e09e9b57 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-m2m.c
> @@ -46,6 +46,7 @@ struct mxc_isi_m2m_ctx_queue_data {
>  };
> =20
>  struct mxc_isi_m2m_ctx {
> +	struct list_head list;
>  	struct v4l2_fh fh;
>  	struct mxc_isi_m2m *m2m;
> =20
> @@ -629,6 +630,10 @@ static int mxc_isi_m2m_open(struct file *file)
>  	struct mxc_isi_m2m_ctx *ctx;
>  	int ret;
> =20
> +	guard(mutex)(&m2m->contexts_lock);
> +	if (!video_is_registered(vdev))
> +		return -ENODEV;
> +
>  	ctx =3D kzalloc_obj(*ctx);
>  	if (!ctx)
>  		return -ENOMEM;
> @@ -654,6 +659,7 @@ static int mxc_isi_m2m_open(struct file *file)
>  		goto err_ctx;
> =20
>  	v4l2_fh_add(&ctx->fh, file);
> +	list_add_tail(&ctx->list, &m2m->contexts);
> =20
>  	return 0;
> =20
> @@ -670,6 +676,8 @@ static int mxc_isi_m2m_release(struct file *file)
>  {
>  	struct mxc_isi_m2m_ctx *ctx =3D file_to_isi_m2m_ctx(file);
> =20
> +	guard(mutex)(&ctx->m2m->contexts_lock);
> +	list_del(&ctx->list);
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  	mxc_isi_m2m_ctx_ctrls_delete(ctx);
> =20
> @@ -740,6 +748,8 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struc=
t v4l2_device *v4l2_dev)
>  	m2m->pipe =3D &isi->pipes[0];
> =20
>  	mutex_init(&m2m->lock);
> +	mutex_init(&m2m->contexts_lock);
> +	INIT_LIST_HEAD(&m2m->contexts);
> =20
>  	/* Initialize the video device and create controls. */
>  	snprintf(vdev->name, sizeof(vdev->name), "mxc_isi.m2m");
> @@ -750,6 +760,7 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struc=
t v4l2_device *v4l2_dev)
>  	vdev->minor	=3D -1;
>  	vdev->release	=3D video_device_release_empty;
>  	vdev->vfl_dir	=3D VFL_DIR_M2M;
> +	vdev->lock	=3D &m2m->contexts_lock;
> =20
>  	vdev->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_VIDEO_M2M_MPLANE;
>  	video_set_drvdata(vdev, m2m);
> @@ -759,14 +770,14 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, str=
uct v4l2_device *v4l2_dev)
>  	if (IS_ERR(m2m->m2m_dev)) {
>  		dev_err(isi->dev, "failed to initialize m2m device\n");
>  		ret =3D PTR_ERR(m2m->m2m_dev);
> -		goto err_mutex;
> +		goto err_return;
>  	}
> =20
>  	/* Register the video device. */
>  	ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret < 0) {
>  		dev_err(isi->dev, "failed to register m2m device\n");
> -		goto err_m2m;
> +		goto err_return;
>  	}
> =20
>  	/*
> @@ -790,11 +801,11 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, str=
uct v4l2_device *v4l2_dev)
>  	vdev->entity.function =3D MEDIA_ENT_F_IO_V4L;
>  	ret =3D media_entity_pads_init(&vdev->entity, 1, &m2m->pad);
>  	if (ret)
> -		goto err_video;
> +		goto err_unregister;
> =20
>  	ret =3D media_device_register_entity(v4l2_dev->mdev, &vdev->entity);
>  	if (ret)
> -		goto err_entity_cleanup;
> +		goto err_unregister;
> =20
>  	ret =3D media_create_pad_link(&vdev->entity, 0,
>  				    &m2m->isi->crossbar.sd.entity,
> @@ -802,13 +813,13 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, str=
uct v4l2_device *v4l2_dev)
>  				    MEDIA_LNK_FL_IMMUTABLE |
>  				    MEDIA_LNK_FL_ENABLED);
>  	if (ret)
> -		goto err_entity_unreg;
> +		goto err_unregister;
> =20
>  	m2m->intf =3D media_devnode_create(v4l2_dev->mdev, MEDIA_INTF_T_V4L_VIDEO,
>  					 0, VIDEO_MAJOR, vdev->minor);
>  	if (!m2m->intf) {
>  		ret =3D -ENOMEM;
> -		goto err_entity_unreg;
> +		goto err_unregister;
>  	}
> =20
>  	link =3D media_create_intf_link(&vdev->entity, &m2m->intf->intf,
> @@ -816,7 +827,7 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, struc=
t v4l2_device *v4l2_dev)
>  				      MEDIA_LNK_FL_ENABLED);
>  	if (!link) {
>  		ret =3D -ENOMEM;
> -		goto err_devnode;
> +		goto err_unregister;
>  	}
> =20
>  	link =3D media_create_intf_link(&m2m->pipe->video.vdev.entity,
> @@ -825,23 +836,14 @@ int mxc_isi_m2m_register(struct mxc_isi_dev *isi, str=
uct v4l2_device *v4l2_dev)
>  				      MEDIA_LNK_FL_ENABLED);
>  	if (!link) {
>  		ret =3D -ENOMEM;
> -		goto err_devnode;
> +		goto err_unregister;
>  	}
> =20
>  	return 0;
> =20
> -err_devnode:
> -	media_devnode_remove(m2m->intf);
> -err_entity_unreg:
> -	media_device_unregister_entity(&vdev->entity);
> -err_entity_cleanup:
> -	media_entity_cleanup(&vdev->entity);
> -err_video:
> -	video_unregister_device(vdev);
> -err_m2m:
> -	v4l2_m2m_release(m2m->m2m_dev);
> -err_mutex:
> -	mutex_destroy(&m2m->lock);
> +err_unregister:
> +	mxc_isi_m2m_unregister(isi);
> +err_return:
>  	return ret;
>  }
> =20
> @@ -849,13 +851,43 @@ int mxc_isi_m2m_unregister(struct mxc_isi_dev *isi)
>  {
>  	struct mxc_isi_m2m *m2m =3D &isi->m2m;
>  	struct video_device *vdev =3D &m2m->vdev;
> +	struct mxc_isi_m2m_ctx *ctx;
> =20
> +	if (!video_is_registered(vdev))
> +		return 0;
> +
> +	guard(mutex)(&m2m->contexts_lock);
>  	video_unregister_device(vdev);
> +	v4l2_m2m_suspend(m2m->m2m_dev);
> +	list_for_each_entry(ctx, &m2m->contexts, list) {
> +		guard(mutex)(&ctx->vb2_lock);
> +		vb2_queue_error(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx));
> +		vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx));
> +		v4l2_m2m_streamoff(NULL, ctx->fh.m2m_ctx,
> +				   V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
> +		v4l2_m2m_streamoff(NULL, ctx->fh.m2m_ctx,
> +				   V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +	}
> =20
> -	v4l2_m2m_release(m2m->m2m_dev);
> -	media_devnode_remove(m2m->intf);
> -	media_entity_cleanup(&vdev->entity);
> -	mutex_destroy(&m2m->lock);
> +	if (m2m->intf) {
> +		media_devnode_remove(m2m->intf);
> +		m2m->intf =3D NULL;
> +	}
> +	media_device_unregister_entity(&vdev->entity);
> =20
>  	return 0;
>  }
> +
> +void mxc_isi_m2m_cleanup(struct mxc_isi_dev *isi)
> +{
> +	struct mxc_isi_m2m *m2m =3D &isi->m2m;
> +
> +	if (!m2m->isi)
> +		return;
> +
> +	if (!IS_ERR_OR_NULL(m2m->m2m_dev))
> +		v4l2_m2m_release(m2m->m2m_dev);
> +	media_entity_cleanup(&m2m->vdev.entity);
> +	mutex_destroy(&m2m->contexts_lock);
> +	mutex_destroy(&m2m->lock);
> +}
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers=
/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index fc907d357149..2ac860876491 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -1370,6 +1370,10 @@ static int mxc_isi_video_open(struct file *file)
>  	struct mxc_isi_video *video =3D video_drvdata(file);
>  	int ret;
> =20
> +	guard(mutex)(&video->lock);
> +	if (!video_is_registered(&video->vdev))
> +		return -ENODEV;
> +
>  	ret =3D v4l2_fh_open(file);
>  	if (ret)
>  		return ret;
> @@ -1380,6 +1384,7 @@ static int mxc_isi_video_open(struct file *file)
>  		return ret;
>  	}
> =20
> +	video->users++;
>  	return 0;
>  }
> =20
> @@ -1388,11 +1393,14 @@ static int mxc_isi_video_release(struct file *file)
>  	struct mxc_isi_video *video =3D video_drvdata(file);
>  	int ret;
> =20
> -	ret =3D vb2_fop_release(file);
> +	guard(mutex)(&video->lock);
> +	ret =3D _vb2_fop_release(file, NULL);
>  	if (ret)
>  		dev_err(video->pipe->isi->dev, "%s fail\n", __func__);
> =20
> -	pm_runtime_put(video->pipe->isi->dev);
> +	if (!video->disconnected)
> +		pm_runtime_put(video->pipe->isi->dev);
> +	video->users--;
>  	return ret;
>  }
> =20
> @@ -1460,6 +1468,14 @@ int mxc_isi_video_resume(struct mxc_isi_pipe *pipe)
>   * Registration
>   */
> =20
> +static void mxc_isi_video_device_release(struct video_device *vdev)
> +{
> +	struct mxc_isi_video *video =3D video_get_drvdata(vdev);
> +
> +	mxc_isi_video_ctrls_delete(video);
> +	media_entity_cleanup(&vdev->entity);
> +}
> +
>  int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  			   struct v4l2_device *v4l2_dev)
>  {
> @@ -1490,7 +1506,7 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	vdev->ioctl_ops	=3D &mxc_isi_video_ioctl_ops;
>  	vdev->v4l2_dev	=3D v4l2_dev;
>  	vdev->minor	=3D -1;
> -	vdev->release	=3D video_device_release_empty;
> +	vdev->release	=3D mxc_isi_video_device_release;
>  	vdev->queue	=3D q;
>  	vdev->lock	=3D &video->lock;
> =20
> @@ -1543,7 +1559,8 @@ int mxc_isi_video_register(struct mxc_isi_pipe *pipe,
>  	return 0;
> =20
>  err_video_unreg:
> -	video_unregister_device(vdev);
> +	mxc_isi_video_unregister(pipe);
> +	return ret;
>  err_ctrl_free:
>  	mxc_isi_video_ctrls_delete(video);
>  err_me_cleanup:
> @@ -1556,14 +1573,15 @@ void mxc_isi_video_unregister(struct mxc_isi_pipe *=
pipe)
>  {
>  	struct mxc_isi_video *video =3D &pipe->video;
>  	struct video_device *vdev =3D &video->vdev;
> +	unsigned int i;
> =20
> -	mutex_lock(&video->lock);
> +	if (!video->pipe || !video_is_registered(vdev))
> +		return;
> =20
> -	if (video_is_registered(vdev)) {
> -		video_unregister_device(vdev);
> -		mxc_isi_video_ctrls_delete(video);
> -		media_entity_cleanup(&vdev->entity);
> -	}
> +	vb2_video_unregister_device(vdev);
> =20
> -	mutex_unlock(&video->lock);
> +	guard(mutex)(&video->lock);
> +	for (i =3D 0; i < video->users; ++i)
> +		pm_runtime_put(video->pipe->isi->dev);
> +	video->disconnected =3D true;
>  }
>=20
> base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
>=20
