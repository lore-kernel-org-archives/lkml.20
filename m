Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B94A044C4FF;
	Wed, 16 Sep 2026 07:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545231; cv=none; b=Q4TR39dPh3H4Hl3PtWUFc1T02i+pDFWvbdTrP3XX7UUwpagtTI9Qx1+Z4+nEurWrw7n+3xUEiw691ihDCCF+0KcEOWWpRlEDBIk15hfeMTuNxP9dvarCxshiAda4oO33ugd25eiCG3nB7PnUGgCSJpt0f7/d9JASM70rwZ0kzpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545231; c=relaxed/simple;
	bh=0BbCD+scxjoq1sVfAW11VROWso9acoCyPccdVzEXvqc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=JTNvpFFL6XW2A3FWVlCP+lNQJQqZBc00Mgd1qi1keKKSA7zeJb14K89NskThYo6PXHWkLJ6jGIp9KGAvXg5jrLXHLqpjixtku7R5GbWPJrqdremutEx3Q4wKI+jhWL5BJ5PCr2ed9pfdW+l7kEVJC6ur7VbveeSntPvScnOdxks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=n1lv9jOb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="n1lv9jOb"
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:85de:a3c9:9357:b164:bf0b])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D24A512;
	Wed, 16 Sep 2026 09:51:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1789545108;
	bh=0BbCD+scxjoq1sVfAW11VROWso9acoCyPccdVzEXvqc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=n1lv9jObvWM9SH1je2d/doCrQ2ZhMiQQIKLh48PP+SmkIX6Gxp0Q3pzHNC8MMAQPJ
	 llrQ44jav0RK2T/VkVa+D4tK24bxhVwS9lU/I+4kfDUSjuWJdnTPcqLAE5rOHnS/QQ
	 4oYpddcUdTyUaondE4EmH3HfgoJDaK42t38g3QlI=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <178851345992.52643.1647135321873562514@neptunite.rasen.tech>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-8-fb8235e15c68@ideasonboard.com> <178851345992.52643.1647135321873562514@neptunite.rasen.tech>
Subject: Re: [PATCH v3 8/9] media: platform: broadcom: Add bcm2835-isp driver
From: Jai Luthra <jai.luthra@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Florian Fainelli <florian.fainelli@broadcom.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Paul Elder <paul.elder@ideasonboard.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Wed, 16 Sep 2026 13:23:23 +0530
Message-ID: <178954520343.3405342.4600573287696603300@freya>
User-Agent: alot/0.13.dev35+g4a69c46ca

Hi Paul,

Quoting Paul Elder (2026-09-04 14:47:39)
> Hi Jai,
>=20
> Thanks for the patch.
>=20

Thank you for the detailed review.

> Quoting Jai Luthra (2026-07-17 20:04:23)
> > From: Naushir Patuck <naush@raspberrypi.com>
> >=20
> > The BCM2835 ISP is a fixed-function hardware block that performs image
> > processing on Bayer, RGB, and YUV frames. It produces two processed
> > video outputs at different resolutions and can generate statistics for
> > Bayer inputs. The hardware is not accessible directly, so this driver
> > programs it through the VCHIQ MMAL interface.
> >=20
> > As the topology cannot be represented as a simple V4L2 M2M device, we
> > register a media device with 5 video nodes: one output (sink), two
> > capture (processed frames), one metadata capture (statistics), and one
> > metadata output (config parameters). The VCHIQ firmware supports two
> > concurrent users, so instantiate two identical media graphs.
> >=20
> > ISP configuration uses the V4L2 extensible parameters framework through
> > the dedicated params node, allowing userspace to batch multiple
> > parameter blocks (black level, gamma, CCM, lens shading, etc.) in a
> > single buffer that is applied on the next frame boundary.
> >=20
> > Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> > Co-developed-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > ---
> > Changes in v3:
> > - Rebase on v7.2-rc1
> > - Drop redundant buffer list and locks for params (we send them
> >   immediately to firmware on queue)
> > - Drop .stop_streaming() for params node
> > - Minor cleanups
> > ---

[...]

> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.=
rst b/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst
> > new file mode 100644
> > index 000000000000..6ed1d1e7890f
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-bcm2835-isp.rst
> > @@ -0,0 +1,101 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. c:namespace:: V4L
> > +
> > +**********************************************************************=
*************
> > +V4L2_META_FMT_BCM2835_ISP_STATS ('BSTA'), V4L2_META_FMT_BCM2835_ISP_PA=
RAMS ('BCMP')
> > +**********************************************************************=
*************
> > +
> > +.. _v4l2-meta-fmt-bcm2835-isp-stats:
> > +
> > +BCM2835 ISP Statistics
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +The BCM2835 ISP hardware calculate image statistics for an input Bayer=
 frame.
> > +These statistics are obtained from the "bcm2835-isp0-capture3" device =
node
> > +using the :c:type:`v4l2_meta_format` interface. They are formatted as =
described
> > +by the :c:type:`bcm2835_isp_stats` structure below.
>=20
> Since this is a new upstream driver, I personally would've preferred exte=
nsible
> stats. Is there a reason for preferring nonextensible stats?
>=20

Yes, the VC4 firmware-based ISP populates the statistics struct and this
driver passes it to the userspace without modifications.=20

The current layout is already "extensible" i.e. it does have u32 fields for
version and size, but it doesn't use blocks with headers like v4l2-isp.h
expects.

The ISP features are mostly stable and unlikely to change, but in the
unlikely case that we do end up requiring an extension to the stats, it
should be possible to switch to v4l2-isp stat blocks at that point.

For now, I prefered avoiding firmware changes.

[...]

> > +struct bcm2835_isp_params_buffer {
> > +       struct vb2_v4l2_buffer vb;
> > +       struct list_head list;
> > +       void *config;
> > +};
> > +
> > +#define to_bcm2835_isp_params_buf(vbuf) \
> > +       container_of(vbuf, struct bcm2835_isp_params_buffer, vb)
> > +
> > +static int isp_set_param(struct bcm2835_isp_params *params, u32 parame=
ter, void
>=20
> I'd put void on the next line.
>=20

Oops, will do.

> > +                        *value, u32 value_size)
> > +{
> > +       return vchiq_mmal_port_parameter_set(params->mmal_instance, par=
ams->port,
> > +                                            parameter, value, value_si=
ze);
> > +}
> > +
> > +static int map_ls_table(struct bcm2835_isp_params *params,
> > +                       struct dma_buf *dmabuf,
> > +                       const struct bcm2835_isp_lens_shading *v4l2_ls)
> > +{
> > +       void *vcsm_handle;
> > +       int ret;
> > +
> > +       if (IS_ERR_OR_NULL(dmabuf))
> > +               return -EINVAL;
>=20
> Isn't this already checked for in the sole caller
> bcm2835_isp_params_lens_shading()?
>=20

Indeed, I've reworked a lot of this in the next revision, along with
integrating Dave's helpful patches that batch together parameter updates to
the firmware in a single IPC message, saving multiple milliseconds.

> > +
> > +       /*
> > +        * struct bcm2835_isp_lens_shading and struct
> > +        * mmal_parameter_lens_shading_v2 match so that we can do a
> > +        * simple memcpy here.
>=20
> I was a bit concerned about manually synchronizing these structs but I gu=
ess
> neither is expected to change I suppose it's ok.
>=20
> > +        * Only the dmabuf to the actual table needs any manipulation.
> > +        */
> > +       memcpy(&params->ls, v4l2_ls, sizeof(params->ls));
> > +       ret =3D vc_sm_cma_import_dmabuf(dmabuf, &vcsm_handle);
> > +       if (ret) {
> > +               dma_buf_put(dmabuf);
>=20
> Wouldn't this result in a double dma_buf_put? afaict it's already put in =
the
> error-handling path of vc_sm_cma_import_dmabuf_internal.
>=20

Good catch, will drop.

> > +               return ret;
> > +       }
> > +
> > +       params->ls.mem_handle_table =3D vc_sm_cma_int_handle(vcsm_handl=
e);
> > +       params->last_ls_dmabuf =3D dmabuf;
> > +
> > +       vc_sm_cma_free(vcsm_handle);
> > +
> > +       return 0;
> > +}

[...]

> > +struct bcm2835_isp_params *
> > +bcm2835_isp_params_register(struct v4l2_device *v4l2_dev, struct devic=
e *dev,
> > +                           struct vchiq_mmal_instance *mmal_instance,
> > +                           struct vchiq_mmal_port *port, int video_nr)
> > +{
> > +       struct bcm2835_isp_params *params;
> > +       struct video_device *vdev;
> > +       struct vb2_queue *q;
> > +       int ret;
> > +
> > +       params =3D devm_kzalloc(dev, sizeof(*params), GFP_KERNEL);
> > +       if (!params)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       params->dev =3D dev;
> > +       params->v4l2_dev =3D v4l2_dev;
> > +       params->mmal_instance =3D mmal_instance;
> > +       params->port =3D port;
> > +
> > +       mutex_init(&params->lock);
> > +
> > +       /* Initialize vb2 queue */
> > +       q =3D &params->queue;
> > +       q->type =3D V4L2_BUF_TYPE_META_OUTPUT;
> > +       q->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +       q->drv_priv =3D params;
> > +       q->ops =3D &bcm2835_isp_params_vb2_ops;
> > +       q->mem_ops =3D &vb2_dma_contig_memops;
> > +       q->buf_struct_size =3D sizeof(struct bcm2835_isp_params_buffer);
> > +       q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_COPY;
> > +       q->dev =3D dev;
> > +       q->lock =3D &params->lock;
> > +
> > +       ret =3D vb2_queue_init(q);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to init params vb2 queue\n");
> > +               return ERR_PTR(ret);
>=20
> Do you need to destroy the mutex here (and in the below error handling to=
o)?
>=20

Yikes.. will do.

> > +       }
> > +

[...]

> > +#define BCM2835_ISP_NAME "bcm2835-isp"
> > +#define BCM2835_ISP_ENTITY_NAME_LEN 32
> > +
> > +#define BCM2835_ISP_NUM_OUTPUTS 1
> > +#define BCM2835_ISP_NUM_CAPTURES 2
> > +#define BCM2835_ISP_NUM_METADATA 1
> > +#define BCM2835_ISP_NUM_PARAMS 1
> > +
> > +#define BCM2835_ISP_NUM_NODES                                         =
 \
> > +               (BCM2835_ISP_NUM_OUTPUTS + BCM2835_ISP_NUM_CAPTURES +  =
 \
> > +                BCM2835_ISP_NUM_METADATA)
> > +#define BCM2835_ISP_PARAMS_PAD BCM2835_ISP_NUM_NODES
> > +#define BCM2835_ISP_NUM_ENTITY_PADS                                   =
 \
> > +               (BCM2835_ISP_NUM_NODES + BCM2835_ISP_NUM_PARAMS)
>=20
> I was wondering why params is separate but I see it's a special node.=20
>=20

Yes, the other videos nodes are "ports" on the firmware, directly dealing
with the video/metadata buffers. The parameter buffers otoh are completely
ingested by this driver as the firmware API for configuring the ISP is
through IPC (MMAL) messages on the video ingest port.

[...]

> > +static int populate_qdata_fmt(struct v4l2_format *f,
> > +                             struct bcm2835_isp_node *node)
> > +{
> > +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +       struct bcm2835_isp_q_data *q_data =3D &node->q_data;
> > +       int ret;
> > +
> > +       if (!node_is_stats(node)) {
> > +               v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +                        "%s: Setting pix format for type %d, wxh: %ux%=
u, fmt: %08x, size %u\n",
> > +                        __func__, f->type, f->fmt.pix.width, f->fmt.pi=
x.height,
> > +                        f->fmt.pix.pixelformat, f->fmt.pix.sizeimage);
> > +
> > +               q_data->fmt =3D find_format(f, node);
> > +               q_data->width =3D f->fmt.pix.width;
> > +               q_data->height =3D f->fmt.pix.height;
> > +
> > +               /* All parameters should have been set correctly by try=
_fmt */
> > +               q_data->bytesperline =3D f->fmt.pix.bytesperline;
> > +               q_data->sizeimage =3D f->fmt.pix.sizeimage;
> > +               q_data->ycbcr_enc =3D f->fmt.pix.ycbcr_enc;
> > +               q_data->xfer_func =3D f->fmt.pix.xfer_func;
> > +               q_data->quantization =3D f->fmt.pix.quantization;
> > +
> > +               /* We must indicate which of the allowed colour spaces =
we have. */
> > +               q_data->colorspace =3D f->fmt.pix.colorspace;
> > +       } else {
> > +               v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +                        "%s: Setting meta format for fmt: %08x, size %=
u\n",
> > +                        __func__, f->fmt.meta.dataformat,
> > +                        f->fmt.meta.buffersize);
> > +
> > +               q_data->fmt =3D find_format(f, node);
> > +               q_data->width =3D 0;
> > +               q_data->height =3D 0;
> > +               q_data->bytesperline =3D 0;
> > +               q_data->sizeimage =3D f->fmt.meta.buffersize;
> > +
> > +               /* This won't mean anything for metadata, but may as we=
ll fill it in. */
> > +               q_data->colorspace =3D V4L2_COLORSPACE_DEFAULT;
> > +       }
> > +
> > +       v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +                "%s: Calculated bpl as %u, size %u\n", __func__,
> > +                q_data->bytesperline, q_data->sizeimage);
> > +
> > +       setup_mmal_port_format(node, node->port);
> > +       ret =3D vchiq_mmal_port_set_format(dev->mmal_instance, node->po=
rt);
> > +       if (ret) {
> > +               v4l2_err(&dev->v4l2_dev,
> > +                        "%s: Failed vchiq_mmal_port_set_format on port=
, ret %d\n",
> > +                        __func__, ret);
> > +               ret =3D -EINVAL;
> > +       }
> > +
> > +       if (q_data->sizeimage < node->port->minimum_buffer.size) {
> > +               v4l2_err(&dev->v4l2_dev,
> > +                        "%s: Current buffer size of %u < min buf size =
%u - driver mismatch to MMAL\n",
> > +                        __func__,
> > +                        q_data->sizeimage,
> > +                        node->port->minimum_buffer.size);
>=20
> Will this cause any serious problems or will the stream just kind of not
> stream?
>=20

That's a good question, I'm afraid I don't understand the firmware side
enough to answer it, so I'll defer it to Dave or Naush.

From my testing with different resolutions, the firmware always returned
minimum_buffer.size =3D=3D sizeimage.

I will add a ret =3D -EINVAL here in the next revision so this error
propagates to the userspace when they call S_FMT.

While we usually want to avoid errors on S_FMT for size issues that could
be updated by the driver, in this case a failure likely means something is
broken with the firmware, similar to an error with
vchiq_mmal_port_set_format() above.

> > +       }
> > +
> > +       v4l2_dbg(1, debug, &dev->v4l2_dev,
> > +                "%s: Set format for type %d, wxh: %dx%d, fmt: %08x, si=
ze %u\n",
> > +                __func__, f->type, q_data->width, q_data->height,
> > +                q_data->fmt->fourcc, q_data->sizeimage);
> > +
> > +       return ret;
> > +}
> > +
> > +int bcm2835_isp_node_querycap(struct file *file, void *priv,
> > +                             struct v4l2_capability *cap)
> > +{
> > +       strscpy(cap->driver, BCM2835_ISP_NAME, sizeof(cap->driver));
> > +       strscpy(cap->card, BCM2835_ISP_NAME, sizeof(cap->card));
> > +       snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
> > +                BCM2835_ISP_NAME);
> > +
> > +       return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_g_fmt(struct file *file, void *priv,
> > +                                 struct v4l2_format *f)
> > +{
> > +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +
> > +       if (f->type !=3D node->queue.type)
> > +               return -EINVAL;
> > +
> > +       if (node_is_stats(node)) {
> > +               f->fmt.meta.dataformat =3D V4L2_META_FMT_BCM2835_ISP_ST=
ATS;
> > +               f->fmt.meta.buffersize =3D
> > +                       node->port->minimum_buffer.size;
> > +       } else {
> > +               struct bcm2835_isp_q_data *q_data =3D &node->q_data;
> > +
> > +               f->fmt.pix.width =3D q_data->width;
> > +               f->fmt.pix.height =3D q_data->height;
> > +               f->fmt.pix.field =3D V4L2_FIELD_NONE;
> > +               f->fmt.pix.pixelformat =3D q_data->fmt->fourcc;
> > +               f->fmt.pix.bytesperline =3D q_data->bytesperline;
> > +               f->fmt.pix.sizeimage =3D q_data->sizeimage;
> > +               f->fmt.pix.colorspace =3D q_data->colorspace;
> > +               f->fmt.pix.ycbcr_enc =3D q_data->ycbcr_enc;
> > +               f->fmt.pix.xfer_func =3D q_data->xfer_func;
> > +               f->fmt.pix.quantization =3D q_data->quantization;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_enum_fmt(struct file *file, void  *priv,
>=20
> s/  / /
>=20

Argh, will fix.

> > +                                    struct v4l2_fmtdesc *f)
> > +{
> > +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +
> > +       if (f->type !=3D node->queue.type)
> > +               return -EINVAL;
> > +
> > +       if (f->index < node->num_supported_fmts) {
> > +               /* Format found */
> > +               f->pixelformat =3D node->supported_fmts[f->index]->four=
cc;
> > +               f->flags =3D 0;
> > +               return 0;
> > +       }
> > +
> > +       return -EINVAL;
> > +}
> > +
> > +static int bcm2835_isp_enum_framesizes(struct file *file, void *priv,
> > +                                      struct v4l2_frmsizeenum *fsize)
> > +{
> > +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +       struct bcm2835_isp_dev *dev =3D node_get_dev(node);
> > +       const struct bcm2835_isp_fmt *fmt;
> > +
> > +       if (node_is_stats(node) || fsize->index)
> > +               return -EINVAL;
> > +
> > +       fmt =3D find_format_by_fourcc(fsize->pixel_format, node);
> > +       if (!fmt) {
> > +               v4l2_err(&dev->v4l2_dev, "Invalid pixel code: %x\n",
> > +                        fsize->pixel_format);
> > +               return -EINVAL;
> > +       }
> > +
> > +       fsize->type =3D V4L2_FRMSIZE_TYPE_STEPWISE;
> > +       fsize->stepwise.min_width =3D MIN_DIM;
> > +       fsize->stepwise.max_width =3D MAX_DIM;
> > +       fsize->stepwise.step_width =3D fmt->step_size;
> > +
> > +       fsize->stepwise.min_height =3D MIN_DIM;
> > +       fsize->stepwise.max_height =3D MAX_DIM;
> > +       fsize->stepwise.step_height =3D fmt->step_size;
> > +
> > +       return 0;
> > +}
> > +
> > +static int bcm2835_isp_node_try_fmt(struct file *file, void *priv,
> > +                                   struct v4l2_format *f)
> > +{
> > +       struct bcm2835_isp_node *node =3D video_drvdata(file);
> > +       const struct bcm2835_isp_fmt *fmt;
> > +
> > +       if (f->type !=3D node->queue.type)
> > +               return -EINVAL;
> > +
> > +       fmt =3D find_format(f, node);
> > +       if (!fmt)
> > +               fmt =3D get_default_format(node);
> > +
> > +       if (!node_is_stats(node)) {
> > +               bool is_rgb;
> > +
> > +               f->fmt.pix.width =3D max(min(f->fmt.pix.width, MAX_DIM),
> > +                                      MIN_DIM);
> > +               f->fmt.pix.height =3D max(min(f->fmt.pix.height, MAX_DI=
M),
> > +                                       MIN_DIM);
>=20
> Why not clamp_t?
>=20

Indeed, switching to it now.

> > +
> > +               f->fmt.pix.pixelformat =3D fmt->fourcc;
> > +

[...]

> > diff --git a/include/uapi/linux/bcm2835-isp.h b/include/uapi/linux/bcm2=
835-isp.h
> > new file mode 100644
> > index 000000000000..85b7f56edf5a
> > --- /dev/null
> > +++ b/include/uapi/linux/bcm2835-isp.h
> > @@ -0,0 +1,530 @@
> > +/* SPDX-License-Identifier: ((GPL-2.0+ WITH Linux-syscall-note) OR BSD=
-3-Clause) */
> > +/*
> > + * bcm2835-isp.h
> > + *
> > + * BCM2835 ISP driver - user space header file.
> > + *
> > + * Copyright =C2=A9 2019-2026 Raspberry Pi (Trading) Ltd.
> > + *
> > + * Author: Naushir Patuck (naush@raspberrypi.com)
> > + *
> > + */
> > +
> > +#ifndef __BCM2835_ISP_H_
> > +#define __BCM2835_ISP_H_
> > +
> > +#include <linux/media/v4l2-isp.h>
> > +
> > +/*
> > + * All structs below are directly mapped onto the equivalent structs in
> > + * drivers/staging/vc04_services/vchiq-mmal/mmal-parameters.h
>=20
> This path probably needs to be updated.
>=20

Will do.

> > + * for convenience.
> > + */
> > +
> > +/**
> > + * struct bcm2835_isp_rational - Rational value type.
> > + *
> > + * @num:       Numerator.
> > + * @den:       Denominator.
> > + */
> > +struct bcm2835_isp_rational {
> > +       __s32 num;
> > +       __u32 den;
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_ccm - Colour correction matrix.
> > + *
> > + * @ccm:       3x3 correction matrix coefficients.
> > + * @offsets:   1x3 correction offsets.
> > + */
> > +struct bcm2835_isp_ccm {
> > +       struct bcm2835_isp_rational ccm[3][3];
> > +       __s32 offsets[3];
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_custom_ccm - Custom CCM configuration.
> > + *
> > + * @enabled:   Enable custom CCM.
> > + * @ccm:       Custom CCM coefficients and offsets.
> > + */
> > +struct bcm2835_isp_custom_ccm {
> > +       __u32 enabled;
> > +       struct bcm2835_isp_ccm ccm;
> > +};
> > +
> > +/**
> > + * enum bcm2835_isp_gain_format - format of the gains in the lens shad=
ing
> > + *                               tables.
> > + *
> > + * @GAIN_FORMAT_U0P8_1:                Gains are u0.8 format, starting=
 at 1.0
> > + * @GAIN_FORMAT_U1P7_0:                Gains are u1.7 format, starting=
 at 0.0
> > + * @GAIN_FORMAT_U1P7_1:                Gains are u1.7 format, starting=
 at 1.0
> > + * @GAIN_FORMAT_U2P6_0:                Gains are u2.6 format, starting=
 at 0.0
> > + * @GAIN_FORMAT_U2P6_1:                Gains are u2.6 format, starting=
 at 1.0
> > + * @GAIN_FORMAT_U3P5_0:                Gains are u3.5 format, starting=
 at 0.0
> > + * @GAIN_FORMAT_U3P5_1:                Gains are u3.5 format, starting=
 at 1.0
> > + * @GAIN_FORMAT_U4P10:         Gains are u4.10 format, starting at 0.0
> > + */
> > +enum bcm2835_isp_gain_format {
> > +       GAIN_FORMAT_U0P8_1 =3D 0,
> > +       GAIN_FORMAT_U1P7_0 =3D 1,
> > +       GAIN_FORMAT_U1P7_1 =3D 2,
> > +       GAIN_FORMAT_U2P6_0 =3D 3,
> > +       GAIN_FORMAT_U2P6_1 =3D 4,
> > +       GAIN_FORMAT_U3P5_0 =3D 5,
> > +       GAIN_FORMAT_U3P5_1 =3D 6,
> > +       GAIN_FORMAT_U4P10  =3D 7,
> > +};
> > +
> > +/**
> > + * struct bcm2835_isp_lens_shading - Lens shading tables.
> > + *
> > + * @enabled:           Enable lens shading.
> > + * @grid_cell_size:    Size of grid cells in samples (16, 32, 64, 128 =
or 256).
> > + * @grid_width:                Width of lens shading tables in grid ce=
lls.
> > + * @grid_stride:       Row to row distance (in grid cells) between gri=
d cells
> > + *                     in the same horizontal location.
> > + * @grid_height:       Height of lens shading tables in grid cells.
> > + * @dmabuf:            dmabuf file handle containing the table.
> > + * @ref_transform:     Reference transform - unsupported, please pass =
zero.
>=20
> If this is unsupported, why is it exposed? Is there a possible future whe=
re
> this will be used?
>=20

Ah, this is mostly for backward compatibility. More on this just below.

> > + * @corner_sampled:    Whether the gains are sampled at the corner poi=
nts
> > + *                     of the grid cells or in the cell centres.
> > + * @gain_format:       Format of the gains (see enum &bcm2835_isp_gain=
_format).
> > + */
> > +struct bcm2835_isp_lens_shading {
> > +       __u32 enabled;
> > +       __u32 grid_cell_size;
> > +       __u32 grid_width;
> > +       __u32 grid_stride;
> > +       __u32 grid_height;
> > +       __s32 dmabuf;
> > +       __u32 ref_transform;
> > +       __u32 corner_sampled;
> > +       __u32 gain_format;
> > +};

[...]

> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index eda4492e40dc..f691a0d4e119 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -870,6 +870,8 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_D4XX        v4l2_fourcc('D', '4', 'X', 'X') /* D=
4XX Payload Header metadata */
> >  #define V4L2_META_FMT_UVC_MSXU_1_5  v4l2_fourcc('U', 'V', 'C', 'M') /*=
 UVC MSXU metadata */
> >  #define V4L2_META_FMT_VIVID      v4l2_fourcc('V', 'I', 'V', 'D') /* Vi=
vid Metadata */
> > +#define V4L2_META_FMT_BCM2835_ISP_STATS v4l2_fourcc('B', 'S', 'T', 'A'=
) /* BCM2835 ISP stats */
>=20
> This is kind of bikeshedding but why not BCMS?
>=20

The downstream used BSTA instead. I debated whether I should call the
params one BPAR, but that sounded likely to conflict with something in
future.

The initial idea was to not add any breaking changes to the uAPI compared
to the downstream driver for backward compatibility, given Raspberry Pis
are widely used. That's of course not possible since we've switched to
using parameter buffers (a much cleaner solution IMO) instead of custom
V4L2 controls for the ISP configuration.

But it is still possible for the downstream tree to expose both the V4L2
controls along with parameter buffers if they think that might ease
transition for their users. I've split my libcamera series for param
buffers into modular patches for the same reason.

Tiny tweaks to the uAPI like the FOURCC here, or updating
s/ref_transform/reserved in the LS struct are trivial things that might
make that cumbersome or even impossible, so I wanted to avoid those.

>=20
> Otherwise this is looking pretty good imo.

Thanks again for your review and tests.

--
Jai

>=20
>=20
> Paul
>=20
> > +#define V4L2_META_FMT_BCM2835_ISP_PARAMS v4l2_fourcc('B', 'C', 'M', 'P=
') /* BCM2835 ISP params */
> > =20
> >  /* Vendor specific - used for RK_ISP1 camera sub-system */
> >  #define V4L2_META_FMT_RK_ISP1_PARAMS   v4l2_fourcc('R', 'K', '1', 'P')=
 /* Rockchip ISP1 3A Parameters */
> >=20
> > --=20
> > 2.54.0
> >=20
> >
