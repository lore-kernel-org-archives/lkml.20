Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2211833DEF7;
	Wed,  2 Sep 2026 08:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788336555; cv=none; b=hXNWwCJg8VYKO5dWII0WwwgZBalXnlkk0VrEIY1zyQe/JUDhKzFkWAFZJIjOKVs20XiqlHGkveUd35rTnyry0uSCcSqq/Iw7lD6axaGPe9jVS5gkYTyejqBtUb+AJV/ANYRKIaNZilSnT94PQE2TdDq3mg3+pcrqL1b52beXmuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788336555; c=relaxed/simple;
	bh=gHUYDb/nrptwIi19Dsm/A0CvSrB81CF4zApKryYEANQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=XZ4ECzdffDRoHPDfrIJUEJbydRFfIha2zEYf6qUVAtjzMOOW8LyeVf9r6IBvu1isaZhyQ6V4J1oOLotXXx5s4ZYrZrvCRyOKpeNMDH1Jy9RPYpwc0HPiID8yD56QhMw4DgWfTKX1ZIzyXgYLP/X/H+OU8ewkn/v6G/60YSt/kXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=hh3BJ4Vt; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="hh3BJ4Vt"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:2fc9:e0bd:f32:e98a])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 907DCC1;
	Wed,  2 Sep 2026 10:07:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788336448;
	bh=gHUYDb/nrptwIi19Dsm/A0CvSrB81CF4zApKryYEANQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=hh3BJ4Vt0yJXpLmWYQINUDdZLHAoUrHSqLceFYQB9Nwx6K00/pSf96oZAL46ZMlwN
	 rNGh55w+raDPowxy6VatG053DpMP9alGaZFTVwFp1bKObEybFUW237hzSMf6Qmp3gw
	 xETTTV+L5/l9zbE4eIJKPvilXG7MJ0TXYoaoqLMU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3c785a3f2f8bbde033ec33987d238430895e2e73.camel@ndufresne.ca>
References: <20260824090406.3695880-1-paul.elder@ideasonboard.com> <20260824090406.3695880-5-paul.elder@ideasonboard.com> <3c785a3f2f8bbde033ec33987d238430895e2e73.camel@ndufresne.ca>
Subject: Re: [PATCH v2 4/5] media: rkisp2: Add parameters output video node
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: michael.riesch@collabora.com, xuhf@rock-chips.com, stefan.klug@ideasonboard.com, mehdi.djait@linux.intel.com, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
To: Nicolas Dufresne <nicolas@ndufresne.ca>, laurent.pinchart@ideasonboard.com
Date: Wed, 02 Sep 2026 17:08:51 +0900
Message-ID: <178833653195.2539260.6186606627402443304@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Nicolas Dufresne (2026-09-02 09:25:15)
> Hi,
>=20
> Le lundi 24 ao=C3=BBt 2026 =C3=A0 18:04 +0900, Paul Elder a =C3=A9crit=C2=
=A0:
> > Implement support for setting parameters on the ISP by queueing
> > parameter buffers to rkisp2.
> >=20
> > Support for the following parameters is added:
> > - BLS (black level subtraction)
> > - AWB gains (color gains)
> > - CSM (color space conversion)
> > - CCM (color correction matrix)
> > - GOC (gamma out correction)
> > - LSC (lens shading correction)
> > - Crop
> >=20
> > Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> >=20
> > ---
> > Changes in v2:
> > - enable bls
> > - add crop
> > ---
> >  .../userspace-api/media/v4l/meta-formats.rst  |   1 +
> >  .../media/v4l/metafmt-rkisp2.rst              |  70 ++
> >  .../media/platform/rockchip/rkisp2/Makefile   |   4 +-
> >  .../platform/rockchip/rkisp2/rkisp2-common.h  |  98 ++
> >  .../platform/rockchip/rkisp2/rkisp2-dev.c     |  17 +
> >  .../platform/rockchip/rkisp2/rkisp2-isp.c     |  13 +-
> >  .../platform/rockchip/rkisp2/rkisp2-params.c  | 923 ++++++++++++++++++
> >  .../rockchip/rkisp2/rkisp2-regs-v3x.h         |  31 +
> >  .../platform/rockchip/rkisp2/rkisp2-resizer.c | 404 ++++++++
> >  drivers/media/v4l2-core/v4l2-ioctl.c          |   1 +
> >  include/uapi/linux/rkisp2-config.h            | 343 +++++++
> >  include/uapi/linux/videodev2.h                |   3 +
> >  12 files changed, 1906 insertions(+), 2 deletions(-)
> >  create mode 100644 Documentation/userspace-api/media/v4l/metafmt-rkisp=
2.rst
> >  create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-param=
s.c
> >  create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-resiz=
er.c
> >=20
> > diff --git a/Documentation/userspace-api/media/v4l/meta-formats.rst b/D=
ocumentation/userspace-api/media/v4l/meta-formats.rst
> > index b5455229837e..6809e3d9fc22 100644
> > --- a/Documentation/userspace-api/media/v4l/meta-formats.rst
> > +++ b/Documentation/userspace-api/media/v4l/meta-formats.rst
> > @@ -21,6 +21,7 @@ These formats are used for the :ref:`metadata` interf=
ace only.
> >      metafmt-pisp-be
> >      metafmt-pisp-fe
> >      metafmt-rkisp1
> > +    metafmt-rkisp2
> >      metafmt-rppx1
> >      metafmt-uvc
> >      metafmt-uvc-msxu-1-5
> > diff --git a/Documentation/userspace-api/media/v4l/metafmt-rkisp2.rst b=
/Documentation/userspace-api/media/v4l/metafmt-rkisp2.rst
> > new file mode 100644
> > index 000000000000..e0ca6cbed642
> > --- /dev/null
> > +++ b/Documentation/userspace-api/media/v4l/metafmt-rkisp2.rst
> > @@ -0,0 +1,70 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +.. _v4l2-meta-fmt-rkisp2-params:
> > +
> > +************************************
> > +V4L2_META_FMT_RKISP2_PARAMS ('RK2P')
> > +************************************
> > +
> > +Configuration Parameters
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
> > +
> > +The configuration of the RkISP1 ISP is performed by userspace by provi=
ding
> > +parameters for the ISP to the driver using the :c:type:`v4l2_meta_form=
at`
> > +interface.
> > +
> > +The configuration parameters are passed to the :ref:`rkisp2_params
> > +<rkisp2_params>` metadata output video node, using the
> > +:c:type:`v4l2_meta_format` interface. Rather than a single struct cont=
aining
> > +sub-structs for each configurable area of the ISP, parameters for the =
Mali-C55
> > +use the v4l2-isp parameters system, through which groups of parameters=
 are
> > +defined as distinct structs or "blocks" which may be added to the data=
 member
> > +of :c:type:`v4l2_isp_params_buffer`. Userspace is responsible for popu=
lating
> > +the data member with the blocks that need to be configured by the driv=
er. Each
> > +block-specific struct embeds :c:type:`v4l2_isp_params_block_header` as=
 its
> > +first member and userspace must populate the type member with a value =
from
> > +:c:type:`rkisp2_params_block_type`.
> > +
> > +.. code-block:: c
> > +
> > +     struct v4l2_isp_params_buffer *params =3D
> > +             (struct v4l2_isp_params_buffer *)buffer;
> > +
> > +     params->version =3D V4L2_ISP_PARAMS_VERSION_V1;
> > +     params->data_size =3D 0;
> > +
> > +     void *data =3D (void *)params->data;
> > +
> > +     struct rkisp2_params_awb_gains *gains =3D
> > +             (struct rkisp2_params_awb_gains *)data;
> > +
> > +     gains->header.type =3D RKISP2_PARAMS_BLOCK_AWB_GAINS;
> > +     gains->header.flags |=3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> > +     gains->header.size =3D sizeof(struct rkisp2_params_awb_gains);
> > +
> > +        gains->gains[0].gb =3D 256;
> > +        gains->gains[0].b =3D 256;
> > +        gains->gains[0].r =3D 256;
> > +        gains->gains[0].gr =3D 256;
> > +
> > +     data +=3D sizeof(struct rkisp2_params_awb_gains);
> > +     params->data_size +=3D sizeof(struct rkisp2_params_awb_gains);
> > +
> > +     struct rkisp2_params_bls *bls =3D (struct rkisp2_params_bls *)dat=
a;
> > +
> > +     bls->header.type =3D RKISP2_PARAMS_BLOCK_BLS;
> > +     bls->header.flags |=3D V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
> > +     bls->header.size =3D sizeof(struct rkisp2_params_bls);
> > +
> > +        bls->enable_auto =3D 0;
> > +        bls->bls_fixed_val.a =3D 256;
> > +        bls->bls_fixed_val.b =3D 256;
> > +        bls->bls_fixed_val.c =3D 256;
> > +        bls->bls_fixed_val.d =3D 256;
> > +
> > +     params->data_size +=3D sizeof(struct rkisp2_params_bls);
> > +
> > +rkisp2 uAPI data types
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +.. kernel-doc:: include/uapi/linux/rkisp2-config.h
> > diff --git a/drivers/media/platform/rockchip/rkisp2/Makefile b/drivers/=
media/platform/rockchip/rkisp2/Makefile
> > index 9a9d7b5233c4..2d41b4ab8f7c 100644
> > --- a/drivers/media/platform/rockchip/rkisp2/Makefile
> > +++ b/drivers/media/platform/rockchip/rkisp2/Makefile
> > @@ -4,7 +4,9 @@ rockchip-isp2-y :=3D rkisp2-capture.o \
> >             rkisp2-common.o \
> >             rkisp2-dev.o \
> >             rkisp2-dmarx.o \
> > -           rkisp2-isp.o
> > +           rkisp2-isp.o \
> > +           rkisp2-params.o \
> > +        rkisp2-resizer.o
> > =20
> >  rockchip-isp2-$(CONFIG_DEBUG_FS) +=3D rkisp2-debug.o
> > =20
> > diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h b/d=
rivers/media/platform/rockchip/rkisp2/rkisp2-common.h
> > index 596f6ca8f755..0479a24fa7f9 100644
> > --- a/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
> > +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
> > @@ -22,6 +22,7 @@
> >  #include <media/media-entity.h>
> >  #include <media/v4l2-ctrls.h>
> >  #include <media/v4l2-device.h>
> > +#include <media/v4l2-isp.h>
> >  #include <media/videobuf2-v4l2.h>
> > =20
> >  #include "rkisp2-regs.h"
> > @@ -101,6 +102,7 @@ enum rkisp2_isp_pad {
> >       RKISP2_ISP_PAD_SINK_VIDEO_DMA_2,
> >       RKISP2_ISP_PAD_SINK_VIDEO_DMA_MAX,
> >       RKISP2_ISP_PAD_SINK_VIDEO_CIF =3D RKISP2_ISP_PAD_SINK_VIDEO_DMA_M=
AX,
> > +     RKISP2_ISP_PAD_SINK_PARAMS,
> >       RKISP2_ISP_PAD_SOURCE_VIDEO_MAIN,
> >       RKISP2_ISP_PAD_SOURCE_VIDEO_SELF,
> >       RKISP2_ISP_PAD_MAX
> > @@ -196,6 +198,26 @@ struct rkisp2_buffer {
> >       dma_addr_t buff_addr[VIDEO_MAX_PLANES];
> >  };
> > =20
> > +/*
> > + * struct rkisp2_params_buffer - A container for the vb2 buffers used =
by the
> > + *                            params video device
> > + *
> > + * @vb:              vb2 buffer
> > + * @queue:   entry of the buffer in the queue
> > + * @cfg:     scratch buffer used for caching the ISP configuration par=
ameters
> > + */
> > +struct rkisp2_params_buffer {
> > +     struct vb2_v4l2_buffer vb;
> > +     struct list_head queue;
> > +     struct v4l2_isp_params_buffer *cfg;
> > +};
> > +
> > +static inline struct rkisp2_params_buffer *
> > +to_rkisp2_params_buffer(struct vb2_v4l2_buffer *vbuf)
> > +{
> > +     return container_of(vbuf, struct rkisp2_params_buffer, vb);
> > +}
> > +
> >  /*
> >   * struct rkisp2_dummy_buffer - A buffer to write the next frame to in=
 case
> >   *                           there are no vb2 buffers available.
> > @@ -298,6 +320,61 @@ struct rkisp2_capture {
> >       } pix;
> >  };
> > =20
> > +/*
> > + * struct rkisp2_params - ISP input parameters device
> > + *
> > + * @vnode:                   video node
> > + * @rkisp2:                  pointer to the rkisp2 device
> > + * @buf_lock:                        locks the buffer list 'params'
> > + * @params:                  queue of rkisp2_buffer
> > + * @raw_type:                        the bayer pattern on the isp vide=
o sink pad
> > + */
> > +struct rkisp2_params {
> > +     struct rkisp2_vdev_node vnode;
> > +     struct rkisp2_device *rkisp2;
> > +
> > +     spinlock_t buf_lock; /* locks the buffers list 'params' */
> > +     struct list_head params;
> > +
> > +     enum rkisp2_fmt_raw_pat_type raw_type;
> > +};
> > +
> > +/*
> > + * struct rkisp2_resizer - ISP resizer device
> > + *
> > + * This struct stores information relevant to the configuration of the=
 resizer
> > + * and dual crop blocks. There is no associated subdev because hardwar=
e-wise
> > + * this resides in the ISP block, but we configure it via parameters b=
uffers to
> > + * enable synchronous crop rectangle configuration. The configuration
> > + * information is populated at s_stream time and does not change.
> > + *
> > + * @rkisp2:                  Pointer to the rkisp2 device
> > + * @id:                              id of the capture, one of RKISP2_=
SELFPATH, RKISP2_MAINPATH
> > + * @config:                  The register set for the resizer and dual=
 crop
> > + * @sink_size:                       The size of the sink format of th=
e ISP subdev sink pad
> > + * @source_size:             The size of the pad-specific source forma=
t of the ISP subdev sink pad
> > + * @source_format:           The mbus format of the ISP subdev source =
pad
> > + * @source_fmt_info:         A pointer to the v4l2_format_info of the =
pixel
> > + *
> > + *
> > + * @sink_size is the ISP sink size (corresponding to the output of IS)=
. It will
> > + * be used to compare the crop rectangle to to check if dual crop need=
s to be
> > + * enabled or not.
> > + *
> > + * @source_size is the output of the combined dual crop + resizer.
> > + */
> > +struct rkisp2_resizer {
> > +     struct rkisp2_device *rkisp2;
> > +     enum rkisp2_stream_id id;
> > +     const struct rkisp2_resizer_config *config;
> > +
> > +     struct v4l2_rect sink_size;
> > +     struct v4l2_rect source_size;
> > +
> > +     struct v4l2_mbus_framefmt source_format;
> > +     const struct v4l2_format_info *source_fmt_info;
> > +};
> > +
> >  struct rkisp2_debug {
> >       struct dentry *debugfs_dir;
> >       unsigned long data_loss;
> > @@ -330,6 +407,7 @@ struct rkisp2_debug {
> >   * @resizer_devs:  resizer sub-devices
> >   * @capture_devs:  capture devices
> >   * @dmarx:      ISP memory read device
> > + * @params:     ISP parameters metadata output device
> >   * @pipe:       media pipeline
> >   * @stream_lock:   serializes {start/stop}_streaming callbacks between=
 the capture devices.
> >   * @debug:      debug params to be exposed on debugfs
> > @@ -349,8 +427,10 @@ struct rkisp2_device {
> >       struct v4l2_async_notifier notifier;
> >       struct v4l2_subdev *source;
> >       struct rkisp2_isp isp;
> > +     struct rkisp2_resizer resizer_devs[2];
> >       struct rkisp2_capture capture_devs[2];
> >       struct rkisp2_dmarx dmarx;
> > +     struct rkisp2_params params;
> >       struct media_pipeline pipe;
> >       struct mutex stream_lock; /* serialize {start/stop}_streaming cb =
between capture devices */
> >       struct rkisp2_debug debug;
> > @@ -440,6 +520,7 @@ irqreturn_t rkisp2_isp_isr(int irq, void *ctx);
> >  irqreturn_t rkisp2_capture_isr(int irq, void *ctx);
> >  irqreturn_t rkisp2_mipi_isr(int irq, void *ctx);
> >  void rkisp2_dmarx_isr(struct rkisp2_device *rkisp2, u32 status);
> > +void rkisp2_params_isr(struct rkisp2_params *params);
> > =20
> >  /* register/unregisters functions of the entities */
> >  int rkisp2_capture_devs_register(struct rkisp2_device *rkisp2);
> > @@ -450,6 +531,23 @@ void rkisp2_isp_unregister(struct rkisp2_device *r=
kisp2);
> >  int rkisp2_dmarx_register(struct rkisp2_device *rkisp2);
> >  void rkisp2_dmarx_unregister(struct rkisp2_device *rkisp2);
> > =20
> > +int rkisp2_params_register(struct rkisp2_device *rkisp2);
> > +void rkisp2_params_unregister(struct rkisp2_device *rkisp2);
> > +void rkisp2_params_pre_configure(struct rkisp2_params *params,
> > +                              enum rkisp2_fmt_raw_pat_type bayer_pat,
> > +                              const struct v4l2_mbus_framefmt *sink_fr=
m,
> > +                              const struct v4l2_mbus_framefmt *mp_src_=
frm,
> > +                              const struct v4l2_mbus_framefmt *sp_src_=
frm);
> > +void rkisp2_params_post_configure(struct rkisp2_params *params);
> > +
> > +void rkisp2_resizer_configure(struct rkisp2_resizer *rsz,
> > +                           struct v4l2_rect *crop);
> > +void rkisp2_resizer_pre_configure(struct rkisp2_device *rkisp2,
> > +                               const struct v4l2_mbus_framefmt *sink_f=
rm,
> > +                               const struct v4l2_mbus_framefmt *mp_src=
_frm,
> > +                               const struct v4l2_mbus_framefmt *sp_src=
_frm);
> > +void rkisp2_resizer_devs_init(struct rkisp2_device *rkisp2);
> > +
> >  #if IS_ENABLED(CONFIG_DEBUG_FS)
> >  void rkisp2_debug_init(struct rkisp2_device *rkisp2);
> >  void rkisp2_debug_cleanup(struct rkisp2_device *rkisp2);
> > diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c b/driv=
ers/media/platform/rockchip/rkisp2/rkisp2-dev.c
> > index 3c7edd2e55a3..6fc0b6044121 100644
> > --- a/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
> > +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
> > @@ -122,11 +122,22 @@ static int rkisp2_create_links(struct rkisp2_devi=
ce *rkisp2)
> >                       return ret;
> >       }
> > =20
> > +     /* params links */
> > +     ret =3D media_create_pad_link(&rkisp2->params.vnode.vdev.entity, =
0,
> > +                                 &rkisp2->isp.sd.entity,
> > +                                 RKISP2_ISP_PAD_SINK_PARAMS,
> > +                                 MEDIA_LNK_FL_ENABLED |
> > +                                 MEDIA_LNK_FL_IMMUTABLE);
> > +     if (ret)
> > +             return ret;
> > +
> > +
> >       return 0;
> >  }
> > =20
> >  static void rkisp2_entities_unregister(struct rkisp2_device *rkisp2)
> >  {
> > +     rkisp2_params_unregister(rkisp2);
> >       rkisp2_dmarx_unregister(rkisp2);
> >       rkisp2_capture_devs_unregister(rkisp2);
> >       rkisp2_isp_unregister(rkisp2);
> > @@ -140,6 +151,8 @@ static int rkisp2_entities_register(struct rkisp2_d=
evice *rkisp2)
> >       if (ret)
> >               goto error;
> > =20
> > +     rkisp2_resizer_devs_init(rkisp2);
> > +
> >       ret =3D rkisp2_capture_devs_register(rkisp2);
> >       if (ret)
> >               goto error;
> > @@ -148,6 +161,10 @@ static int rkisp2_entities_register(struct rkisp2_=
device *rkisp2)
> >       if (ret)
> >               goto error;
> > =20
> > +     ret =3D rkisp2_params_register(rkisp2);
> > +     if (ret)
> > +             goto error;
> > +
> >       ret =3D rkisp2_create_links(rkisp2);
> >       if (ret)
> >               goto error;
> > diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c b/driv=
ers/media/platform/rockchip/rkisp2/rkisp2-isp.c
> > index c1c03bc71a8f..00336c5e99f3 100644
> > --- a/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
> > +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
> > @@ -93,6 +93,7 @@ static int rkisp2_config_isp(struct rkisp2_isp *isp,
> >       const struct rkisp2_mbus_info *sink_fmt;
> >       const struct rkisp2_mbus_info *mp_src_fmt;
> >       const struct v4l2_mbus_framefmt *mp_src_frm;
> > +     const struct v4l2_mbus_framefmt *sp_src_frm;
> >       const struct v4l2_mbus_framefmt *sink_frm;
> > =20
> >       /* All the video sink formats and crops are kept equal */
> > @@ -150,6 +151,11 @@ static int rkisp2_config_isp(struct rkisp2_isp *is=
p,
> >                   RKISP2_CIF_ISP_PIC_SIZE_ERROR;
> >       rkisp2_write(rkisp2, RKISP2_CIF_ISP_IMSC, irq_mask);
> > =20
> > +     sp_src_frm =3D v4l2_subdev_state_get_format(sd_state,
> > +                                            RKISP2_ISP_PAD_SOURCE_VIDE=
O_SELF);
> > +     rkisp2_params_pre_configure(&rkisp2->params, sink_fmt->bayer_pat,
> > +                                 sink_frm, mp_src_frm, sp_src_frm);
> > +
> >       isp->sink_fmt =3D sink_fmt;
> > =20
> >       return 0;
> > @@ -278,6 +284,8 @@ static int rkisp2_isp_start(struct rkisp2_isp *isp,
> >              RKISP2_CIF_ISP_CTRL_ISP_INFORM_ENABLE | RKISP2_CIF_ISP_CTR=
L_ISP_CFG_UPD_PERMANENT;
> >       rkisp2_write(rkisp2, RKISP2_CIF_ISP_CTRL, val);
> > =20
> > +     rkisp2_params_post_configure(&rkisp2->params);
> > +
> >       return 0;
> >  }
> > =20
> > @@ -727,6 +735,7 @@ int rkisp2_isp_register(struct rkisp2_device *rkisp=
2)
> >       pads[RKISP2_ISP_PAD_SINK_VIDEO_DMA_1].flags =3D MEDIA_PAD_FL_SINK;
> >       pads[RKISP2_ISP_PAD_SINK_VIDEO_DMA_2].flags =3D MEDIA_PAD_FL_SINK;
> >       pads[RKISP2_ISP_PAD_SINK_VIDEO_CIF].flags =3D MEDIA_PAD_FL_SINK;
> > +     pads[RKISP2_ISP_PAD_SINK_PARAMS].flags =3D MEDIA_PAD_FL_SINK;
> >       pads[RKISP2_ISP_PAD_SOURCE_VIDEO_MAIN].flags =3D MEDIA_PAD_FL_SOU=
RCE;
> >       pads[RKISP2_ISP_PAD_SOURCE_VIDEO_SELF].flags =3D MEDIA_PAD_FL_SOU=
RCE;
> > =20
> > @@ -817,8 +826,10 @@ irqreturn_t rkisp2_isp_isr(int irq, void *ctx)
> >               rkisp2->debug.data_loss++;
> >       }
> > =20
> > -     if (status & RKISP2_CIF_ISP_FRAME)
> > +     if (status & RKISP2_CIF_ISP_FRAME) {
> >               rkisp2->debug.complete_frames++;
> > +             rkisp2_params_isr(&rkisp2->params);
> > +     }
> > =20
> >       rkisp2_write(rkisp2, RKISP2_CIF_ISP_ICR, status);
> > =20
> > diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c b/d=
rivers/media/platform/rockchip/rkisp2/rkisp2-params.c
> > new file mode 100644
> > index 000000000000..2fac73709ae4
> > --- /dev/null
> > +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
> > @@ -0,0 +1,923 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Rockchip ISP2 Driver - Params subdevice
> > + *
> > + * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> > + * Copyright (C) 2026 Ideas on Board Oy.
> > + */
> > +
> > +#include <linux/bitfield.h>
> > +#include <linux/build_bug.h>
> > +#include <linux/math.h>
> > +#include <linux/string.h>
> > +
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-event.h>
> > +#include <media/v4l2-ioctl.h>
> > +#include <media/v4l2-isp.h>
> > +#include <media/v4l2-rect.h>
> > +#include <media/videobuf2-core.h>
> > +#include <media/videobuf2-vmalloc.h>
> > +
> > +#include "rkisp2-common.h"
> > +
> > +#define RKISP2_PARAMS_DEV_NAME       RKISP2_DRIVER_NAME "_params"
> > +
> > +#define RKISP2_PARAMS_BLOCK_INFO(block, data) \
> > +     [RKISP2_PARAMS_BLOCK_ ## block] =3D { \
> > +             .size =3D sizeof(struct rkisp2_params_ ## data ), \
> > +     }
> > +
> > +#define RKISP2_PARAMS_BLOCK_HANDLER_INFO(block, handler_postfix, prio_=
postfix) \
> > +     [RKISP2_PARAMS_BLOCK_ ## block] =3D { \
> > +             .handler =3D rkisp2_params_ ## handler_postfix,\
> > +             .priority =3D RKISP2_PARAMS_CONFIG_PRIO_ ## prio_postfix,=
 \
> > +     }
> > +
> > +union rkisp2_params_block {
> > +     const struct v4l2_isp_params_block_header *header;
> > +     const struct rkisp2_params_bls *bls;
> > +     const struct rkisp2_params_awb_gains *awb_gains;
> > +     const struct rkisp2_params_csm *csm;
> > +     const struct rkisp2_params_ccm *ccm;
> > +     const struct rkisp2_params_goc *goc;
> > +     const struct rkisp2_params_lsc *lsc;
> > +     const struct rkisp2_params_crop *crop;
> > +     const __u8 *data;
> > +};
> > +
> > +static void rkisp2_params_bls(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block);
> > +static void rkisp2_params_awb_gains(struct rkisp2_params *params,
> > +                                 union rkisp2_params_block block);
> > +static void rkisp2_params_csm(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block);
> > +static void rkisp2_params_ccm(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block);
> > +static void rkisp2_params_goc(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block);
> > +static void rkisp2_params_lsc(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block);
> > +static void rkisp2_params_crop(struct rkisp2_params *params,
> > +                            union rkisp2_params_block block);
> > +
> > +typedef void (*rkisp2_params_handler)(struct rkisp2_params *params,
> > +                                   const union rkisp2_params_block blo=
ck);
> > +
> > +enum rkisp2_params_configure_priority {
> > +     RKISP2_PARAMS_CONFIG_PRIO_NONE =3D 0,
> > +     RKISP2_PARAMS_CONFIG_PRIO_PRE,
> > +     RKISP2_PARAMS_CONFIG_PRIO_POST,
> > +};
> > +
> > +struct rkisp2_params_block_handler_info {
> > +     rkisp2_params_handler handler;
> > +     enum rkisp2_params_configure_priority priority;
> > +};
> > +
> > +static const struct rkisp2_params_block_handler_info
> > +rkisp2_params_handlers[] =3D {
> > +     RKISP2_PARAMS_BLOCK_HANDLER_INFO(BLS, bls, PRE),
> > +     RKISP2_PARAMS_BLOCK_HANDLER_INFO(AWB_GAINS, awb_gains, PRE),
> > +     RKISP2_PARAMS_BLOCK_HANDLER_INFO(CSM, csm, PRE),
> > +     RKISP2_PARAMS_BLOCK_HANDLER_INFO(CCM, ccm, PRE),
> > +     RKISP2_PARAMS_BLOCK_HANDLER_INFO(GOC, goc, PRE),
> > +     RKISP2_PARAMS_BLOCK_HANDLER_INFO(LSC, lsc, POST),
> > +     RKISP2_PARAMS_BLOCK_HANDLER_INFO(CROP, crop, PRE),
> > +};
> > +
> > +static const struct v4l2_isp_params_block_type_info
> > +rkisp2_params_block_types_info[] =3D {
> > +     RKISP2_PARAMS_BLOCK_INFO(BLS, bls),
> > +     RKISP2_PARAMS_BLOCK_INFO(AWB_GAINS, awb_gains),
> > +     RKISP2_PARAMS_BLOCK_INFO(CSM, csm),
> > +     RKISP2_PARAMS_BLOCK_INFO(CCM, ccm),
> > +     RKISP2_PARAMS_BLOCK_INFO(GOC, goc),
> > +     RKISP2_PARAMS_BLOCK_INFO(LSC, lsc),
> > +     RKISP2_PARAMS_BLOCK_INFO(CROP, crop),
> > +};
> > +
> > +static_assert(ARRAY_SIZE(rkisp2_params_handlers) =3D=3D
> > +           ARRAY_SIZE(rkisp2_params_block_types_info));
> > +
> > +static inline void
> > +rkisp2_param_set_bits(struct rkisp2_params *params, u32 reg, u32 bit_m=
ask)
> > +{
> > +     u32 val;
> > +
> > +     val =3D rkisp2_read(params->rkisp2, reg);
> > +     rkisp2_write(params->rkisp2, reg, val | bit_mask);
> > +}
> > +
> > +static inline void
> > +rkisp2_param_clear_bits(struct rkisp2_params *params, u32 reg, u32 bit=
_mask)
> > +{
> > +     u32 val;
> > +
> > +     val =3D rkisp2_read(params->rkisp2, reg);
> > +     rkisp2_write(params->rkisp2, reg, val & ~bit_mask);
> > +}
> > +
> > +static void rkisp2_params_bls(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block)
> > +{
> > +     const struct rkisp2_params_bls *arg =3D block.bls;
> > +     u32 control;
> > +
> > +     if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +             rkisp2_param_clear_bits(params, ISP_BLS_CTRL, ISP_BLS_ENA=
 | ISP_BLS_BLS1_EN);
> > +             return;
> > +     }
> > +
> > +     if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
> > +             return;
> > +
> > +     control =3D ISP_BLS_ENA;
> > +
> > +     if (!arg->enable_auto) {
> > +             /* TODO plumb BLS1 */
> > +
> > +             rkisp2_write(params->rkisp2, ISP_BLS_A_FIXED, arg->bls_fi=
xed_val.a);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_B_FIXED, arg->bls_fi=
xed_val.b);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_C_FIXED, arg->bls_fi=
xed_val.c);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_D_FIXED, arg->bls_fi=
xed_val.d);
> > +
> > +             /* Set fixed mode */
> > +             rkisp2_write(params->rkisp2, ISP_BLS_CTRL, control);
> > +             return;
> > +     }
> > +
> > +     if (arg->enabled_windows & BIT(1)) {
> > +             rkisp2_write(params->rkisp2, ISP_BLS_H2_START,
> > +                          arg->bls_window2.h_offs);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_H2_STOP,
> > +                          arg->bls_window2.h_size);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_V2_START,
> > +                          arg->bls_window2.v_offs);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_V2_STOP,
> > +                          arg->bls_window2.v_size);
> > +             control |=3D ISP_BLS_WINDOW_2;
> > +     }
> > +
> > +     if (arg->enabled_windows & BIT(0)) {
> > +             rkisp2_write(params->rkisp2, ISP_BLS_H1_START,
> > +                          arg->bls_window1.h_offs);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_H1_STOP,
> > +                          arg->bls_window1.h_size);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_V1_START,
> > +                          arg->bls_window1.v_offs);
> > +             rkisp2_write(params->rkisp2, ISP_BLS_V1_STOP,
> > +                          arg->bls_window1.v_size);
> > +             control |=3D ISP_BLS_WINDOW_1;
> > +     }
> > +
> > +     rkisp2_write(params->rkisp2, ISP_BLS_SAMPLES,
> > +                  arg->bls_samples);
> > +
> > +     control |=3D ISP_BLS_MODE_MEASURED;
> > +     rkisp2_write(params->rkisp2, ISP_BLS_CTRL, control);
> > +}
> > +
> > +static void rkisp2_params_awb_gains(struct rkisp2_params *params,
> > +                                 union rkisp2_params_block block)
> > +{
> > +     const struct rkisp2_params_awb_gains *arg =3D block.awb_gains;
> > +     unsigned int i;
> > +
> > +     if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +             rkisp2_param_clear_bits(params, RKISP2_CIF_ISP_CTRL,
> > +                                     RKISP2_CIF_ISP_CTRL_ISP_AWB_ENA);
> > +             return;
> > +     }
> > +
> > +     if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
> > +             return;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(arg->gains); i++) {
> > +             rkisp2_write(params->rkisp2, ISP21_AWB_GAIN0_G + i * 8,
> > +                          arg->gains[i].gr << 16 | arg->gains[i].gb);
> > +             rkisp2_write(params->rkisp2, ISP21_AWB_GAIN0_RB + i * 8,
> > +                          arg->gains[i].r << 16 | arg->gains[i].b);
> > +     }
> > +
> > +     rkisp2_param_set_bits(params, RKISP2_CIF_ISP_CTRL,
> > +                           RKISP2_CIF_ISP_CTRL_ISP_AWB_ENA);
> > +}
> > +
> > +static void rkisp2_params_csm_reset(struct rkisp2_params *params)
> > +{
> > +     /* Write back the default values. */
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_0, 0x80);
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_1, 0);
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_2, 0);
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_3, 0);
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_4, 0x80);
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_5, 0);
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_6, 0);
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_7, 0);
> > +     rkisp2_write(params->rkisp2, RKISP2_CIF_ISP_CC_COEFF_8, 0x80);
> > +}
> > +
> > +static void rkisp2_params_csm(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block)
> > +{
> > +     const struct rkisp2_params_csm *arg =3D block.csm;
> > +     unsigned int i, j, k =3D 0;
> > +
> > +     if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +             rkisp2_params_csm_reset(params);
> > +             return;
> > +     }
> > +
> > +     if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
> > +             return;
> > +
> > +     for (i =3D 0; i < 3; i++)
> > +             for (j =3D 0; j < 3; j++)
> > +                     rkisp2_write(params->rkisp2,
> > +                                  RKISP2_CIF_ISP_CC_COEFF_0 + 4 * k++,
> > +                                  arg->coeff[i][j]);
> > +}
> > +
> > +static void rkisp2_params_ccm(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block)
> > +{
> > +     const struct rkisp2_params_ccm *arg =3D block.ccm;
> > +     unsigned int i;
> > +     u32 control =3D 0;
> > +
> > +     if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +             rkisp2_param_clear_bits(params, ISP_CCM_CTRL, ISP_CCM_EN);
> > +             return;
> > +     }
> > +
> > +     if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
> > +             return;
> > +
> > +     for (i =3D 0; i < 3; i++) {
> > +             rkisp2_write(params->rkisp2, ISP_CCM_COEFF0_R + 8 * i,
> > +                          ISP3X_CCM_COEFF(arg->coeff[i][0], arg->coeff=
[i][1]));
> > +             rkisp2_write(params->rkisp2, ISP_CCM_COEFF1_R + 8 * i,
> > +                          ISP3X_CCM_COEFF(arg->coeff[i][2], arg->offse=
t[i]));
> > +     }
> > +
> > +     rkisp2_write(params->rkisp2, ISP_CCM_COEFF0_Y,
> > +                  ISP3X_CCM_COEFF(arg->y_coeff[0], arg->y_coeff[1]));
> > +     rkisp2_write(params->rkisp2, ISP_CCM_COEFF1_Y, arg->y_coeff[2]);
> > +
> > +     for (i =3D 0; i < 8; i++)
> > +             rkisp2_write(params->rkisp2, ISP_CCM_ALP_Y0 + 4 * i,
> > +                          ISP3X_CCM_COEFF(arg->alp[2 * i], arg->alp[2 =
* i + 1]));
> > +     rkisp2_write(params->rkisp2, ISP_CCM_ALP_Y8, arg->alp[16]);
> > +
> > +     rkisp2_write(params->rkisp2, ISP_CCM_BOUND_BIT, arg->inflection_p=
oint);
> > +
> > +     if (!arg->high_y_alpha_adj_en)
> > +             control =3D ISP3X_CCM_HIGHY_ADJ_DIS;
> > +     control |=3D ISP_CCM_EN;
> > +     rkisp2_write(params->rkisp2, ISP_CCM_CTRL, control);
> > +}
> > +
> > +static void rkisp2_params_goc(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block)
> > +{
> > +     const struct rkisp2_params_goc *arg =3D block.goc;
> > +     unsigned int i;
> > +     u32 control =3D 0;
> > +
> > +     if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +             rkisp2_param_clear_bits(params, ISP3X_GAMMA_OUT_CTRL,
> > +                                     ISP3X_GAMMA_OUT_CTRL_EN);
> > +             return;
> > +     }
> > +
> > +     if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
> > +             return;
> > +
> > +     for (i =3D 0; i < RKISP2_ISP_GAMMA_OUT_MAX_SEGMENTS >> 1; i++)
> > +             rkisp2_write(params->rkisp2,
> > +                          ISP3X_GAMMA_OUT_Y0 + 4 * i,
> > +                          ISP3X_GAMMA_OUT_SAMPLE(arg->gamma_y[2 * i],
> > +                                               arg->gamma_y[2 * i + 1]=
));
> > +
> > +     rkisp2_write(params->rkisp2, ISP3X_GAMMA_OUT_Y24,
> > +                  arg->gamma_y[RKISP2_ISP_GAMMA_OUT_MAX_SEGMENTS - 1]);
> > +
> > +     rkisp2_write(params->rkisp2, ISP3X_GAMMA_OUT_OFFSET, arg->offset);
> > +
> > +     if (arg->mode =3D=3D RKISP2_ISP_GOC_MODE_EQUIDISTANT)
> > +             control =3D ISP3X_GAMMA_OUT_CTRL_MODE_EQUIDISTANT;
> > +     if (arg->mode =3D=3D RKISP2_ISP_GOC_SEGMENTS_48)
> > +             control |=3D ISP3X_GAMMA_OUT_CTRL_SEGMENTS_48;
> > +     control |=3D ISP3X_GAMMA_OUT_CTRL_EN;
> > +     rkisp2_write(params->rkisp2, ISP3X_GAMMA_OUT_CTRL, control);
> > +}
> > +
> > +static void rkisp2_params_lsc(struct rkisp2_params *params,
> > +                           union rkisp2_params_block block)
> > +{
> > +     const struct rkisp2_params_lsc *arg =3D block.lsc;
> > +     struct rkisp2_device *rkisp2 =3D params->rkisp2;
> > +     u32 sram_addr;
> > +     u32 data;
> > +     unsigned int i, j, table_i;
> > +
> > +     if (block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +             rkisp2_param_clear_bits(params, ISP3X_LSC_CTRL, ISP3X_LSC=
_CTRL_EN);
> > +             return;
> > +     }
> > +
> > +     if (!(block.header->flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
> > +             return;
> > +
> > +     if (arg->set_active_table_when =3D=3D RKISP2_ISP_LSC_SET_ACTIVE_T=
ABLE_BEFORE)
> > +             rkisp2_write(rkisp2, ISP3X_LSC_TABLE_SEL, arg->active_tab=
le ? 1 : 0);
> > +
> > +     /*
> > +      * - No need to disable the lsc before writing the table=20
> > +      * - Table 0 starts at 0, table 1 starts at 153.
> > +      * - TABLE_SEL selects which table is active, but programming the=
 tables
> > +      *   is done by just writing to the right address.
> > +      * - The address automatically increments, so no need to incremen=
t it.
> > +      */
> > +
> > +     for (table_i =3D 0; table_i < 2; table_i++) {
> > +             if (!arg->write_table[table_i])
> > +                     continue;
> > +
> > +             sram_addr =3D table_i * 153;
> > +
> > +             rkisp2_write(rkisp2, ISP3X_LSC_R_TABLE_ADDR, sram_addr);
> > +             rkisp2_write(rkisp2, ISP3X_LSC_GR_TABLE_ADDR, sram_addr);
> > +             rkisp2_write(rkisp2, ISP3X_LSC_B_TABLE_ADDR, sram_addr);
> > +             rkisp2_write(rkisp2, ISP3X_LSC_GB_TABLE_ADDR, sram_addr);
> > +
> > +             /* Program data tables (table size is 9 * 17 =3D 153) */
> > +             for (i =3D 0; i < RKISP2_ISP_LSC_SAMPLES_MAX; i++) {
> > +                     const __u16 *r_row =3D arg->r_data_tbl[table_i][i=
];
> > +                     const __u16 *gr_row =3D arg->gr_data_tbl[table_i]=
[i];
> > +                     const __u16 *gb_row =3D arg->gb_data_tbl[table_i]=
[i];
> > +                     const __u16 *b_row =3D arg->b_data_tbl[table_i][i=
];
> > +
> > +                     /*
> > +                      * 17 sectors with 2 values in one DWORD =3D 9
> > +                      * DWORDs (2nd value of last DWORD unused)
> > +                      */
> > +                     for (j =3D 0; j < RKISP2_ISP_LSC_SAMPLES_MAX / 2;=
 j++) {
> > +                             rkisp2_write(rkisp2, ISP3X_LSC_R_TABLE_DA=
TA,
> > +                                          ISP3X_LSC_TABLE_DATA(r_row[2=
 * j], r_row[2 * j + 1]));
> > +                             rkisp2_write(rkisp2, ISP3X_LSC_GR_TABLE_D=
ATA,
> > +                                          ISP3X_LSC_TABLE_DATA(gr_row[=
2 * j], gr_row[2 * j + 1]));
> > +                             rkisp2_write(rkisp2, ISP3X_LSC_GB_TABLE_D=
ATA,
> > +                                          ISP3X_LSC_TABLE_DATA(gb_row[=
2 * j], gb_row[2 * j + 1]));
> > +                             rkisp2_write(rkisp2, ISP3X_LSC_B_TABLE_DA=
TA,
> > +                                          ISP3X_LSC_TABLE_DATA(b_row[2=
 * j], b_row[2 * j + 1]));
> > +                     }
> > +
> > +                     rkisp2_write(rkisp2, ISP3X_LSC_R_TABLE_DATA,
> > +                                  ISP3X_LSC_TABLE_DATA(r_row[2 * j], 0=
));
> > +                     rkisp2_write(rkisp2, ISP3X_LSC_GR_TABLE_DATA,
> > +                                  ISP3X_LSC_TABLE_DATA(gr_row[2 * j], =
0));
> > +                     rkisp2_write(rkisp2, ISP3X_LSC_GB_TABLE_DATA,
> > +                                  ISP3X_LSC_TABLE_DATA(gb_row[2 * j], =
0));
> > +                     rkisp2_write(rkisp2, ISP3X_LSC_B_TABLE_DATA,
> > +                                  ISP3X_LSC_TABLE_DATA(b_row[2 * j], 0=
));
> > +
> > +             }
> > +     }
> > +
> > +     /* Program grid sizes and interpolation gradients */
> > +     for (i =3D 0; i < RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX / 2; i++) {
> > +             /* program x size tables */
> > +             data =3D ISP3X_LSC_SECT_SIZE(arg->x_sizes[i * 2],
> > +                                        arg->x_sizes[i * 2 + 1]);
> > +             rkisp2_write(rkisp2, ISP3X_LSC_XSIZE(i), data);
> > +
> > +             /* program x grad tables */
> > +             data =3D ISP3X_LSC_GRAD_SIZE(arg->x_grads[i * 2],
> > +                                        arg->x_grads[i * 2 + 1]);
> > +             rkisp2_write(rkisp2, ISP3X_LSC_XGRAD(i), data);
> > +
> > +             /* program y size tables */
> > +             data =3D ISP3X_LSC_SECT_SIZE(arg->y_sizes[i * 2],
> > +                                        arg->y_sizes[i * 2 + 1]);
> > +             rkisp2_write(rkisp2, ISP3X_LSC_YSIZE(i), data);
> > +
> > +             /* program y grad tables */
> > +             data =3D ISP3X_LSC_GRAD_SIZE(arg->y_grads[i * 2],
> > +                                        arg->y_grads[i * 2 + 1]);
> > +             rkisp2_write(rkisp2, ISP3X_LSC_YGRAD(i), data);
> > +     }
> > +
> > +     rkisp2_write(rkisp2, ISP3X_LSC_TABLE_SEL, arg->active_table ? 1 :=
 0);
> > +
> > +     data =3D 0;
> > +     if (arg->window_mode)
> > +             data |=3D ISP3X_LSC_SECTOR_16X16;
> > +     /* TODO plumb the rest of the ctrl fields */
> > +     data |=3D ISP3X_LSC_CTRL_EN;
> > +
> > +     rkisp2_param_set_bits(params, ISP3X_LSC_CTRL, data);
> > +}
> > +
> > +static void __rkisp2_params_crop(struct rkisp2_params *params,
> > +                              const struct rkisp2_params_crop *arg,
> > +                              __u16 flags)
> > +{
> > +     unsigned int i;
> > +
> > +     /*
> > +      * Based on the params provided by userspace and the ISP stream
> > +      * configurations and validation, determine the input and output
> > +      * rectangles. Then delegate to the resizer routines about how to
> > +      * configure the dual crop + resizer.
> > +      *
> > +      * This handler has a different pattern from the other params han=
dlers
> > +      * because the crop + resizer is always active (depending on the =
stream
> > +      * configuration), and the hardware configuration is only adjusted
> > +      * based on the parameters.
> > +      */
> > +
> > +     if (!(flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE) &&
> > +         !(flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE))
> > +             return;
> > +
> > +     for (i =3D 0; i < 2; i++) {
> > +             struct rkisp2_resizer *rsz =3D &params->rkisp2->resizer_d=
evs[i];
> > +
> > +             const struct rkisp2_isp_window *window =3D
> > +                     (i =3D=3D 0 ? &arg->mp_crop : &arg->sp_crop);
> > +             u16 en_mask =3D
> > +                     (i =3D=3D 0 ? RKISP2_ISP_CROP_ENABLE_MAIN :
> > +                               RKISP2_ISP_CROP_ENABLE_SELF);
> > +
> > +             /*
> > +              * This is input of the combined dual crop + resizer. Whe=
n crop
> > +              * is disabled (either by crop_en flags or by disabling t=
he
> > +              * entire block), the input size will instead be set to e=
qual
> > +              * ISP sink size (corresponding to output of IS). They are
> > +              * clamped to the min/max sizes.
> > +              */
> > +             struct v4l2_rect crop =3D {
> > +                     .left =3D window->h_offs,
> > +                     .top =3D window->v_offs,
> > +                     .width =3D window->h_size,
> > +                     .height =3D window->v_size
> > +             };
> > +
> > +             /*
> > +              * Resizer (and dual crop if applicable) always needs to =
be
> > +              * handled to do format conversion and resizing to achiev=
e the
> > +              * requested format type and size for the stream.
> > +              */
> > +             if (!(arg->crop_en & en_mask) ||
> > +                 (flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)) {
> > +                     crop =3D rsz->sink_size;
> > +             }
> > +
> > +             /*
> > +              * Resizer does not work in raw mode but dual crop does, =
so
> > +              * make crop =3D source_size if we are in raw mode. If th=
ere is
> > +              * no dual crop then whatever.
> > +              *
> > +              * TODO Use image stabilizer to do the correction in the =
case
> > +              * that there is no dual crop. This logic should be in the
> > +              * resizer code.
> > +              */
> > +             if (!v4l2_is_format_yuv(rsz->source_fmt_info)) {
> > +                     /* Match the crop size to the source size first */
> > +                     if (crop.width !=3D rsz->source_size.width || cro=
p.height !=3D rsz->source_size.height) {
> > +                             crop.width =3D rsz->source_size.width;
> > +                             crop.height =3D rsz->source_size.height;
> > +                     }
> > +             }
> > +
> > +             /*
> > +              * Out-of-bounds rectangles just produces garbage data and
> > +              * doesn't break the hardware so don't correct for it.
> > +              */
> > +
> > +             /*
> > +              * TODO Invalidate invalid stream configurations in rkisp=
2_params_vb2_buf_prepare
> > +              *
> > +              * We should validate configurations that would cause
> > +              * memory-related or hardware-breaking errors in buf_prep=
are
> > +              * (like crop !=3D source_size on raw mode). Other non-br=
eaking
> > +              * errors we can just forward the parameters to hardware =
as-is
> > +              * and let userspace deal with the consequences. They sho=
uldn't
> > +              * be setting bad parameters (as long as it doesn't break=
 the
> > +              * system).
> > +              */
> > +
> > +             rkisp2_resizer_configure(rsz, &crop);
> > +     }
> > +}
> > +
> > +static void rkisp2_params_crop(struct rkisp2_params *params,
> > +                            union rkisp2_params_block block)
> > +{
> > +     const struct rkisp2_params_crop *arg =3D block.crop;
> > +     __rkisp2_params_crop(params, arg, block.header->flags);
> > +}
> > +
> > +static void rkisp2_params_crop_init(struct rkisp2_params *params)
> > +{
> > +     struct rkisp2_device *rkisp2 =3D params->rkisp2;
> > +
> > +     /* Create an initial crop configuration to configure */
> > +     struct rkisp2_params_crop arg =3D {
> > +             .header.type =3D RKISP2_PARAMS_BLOCK_CROP,
> > +             .header.flags =3D 0,
> > +             .header.size =3D sizeof(struct rkisp2_params_crop),
> > +             .crop_en =3D RKISP2_ISP_CROP_ENABLE_MAIN | RKISP2_ISP_CRO=
P_ENABLE_SELF,
> > +
> > +             .mp_crop.h_offs =3D 0,
> > +             .mp_crop.v_offs =3D 0,
> > +             .mp_crop.h_size =3D rkisp2->resizer_devs[0].source_size.w=
idth,
> > +             .mp_crop.v_size =3D rkisp2->resizer_devs[0].source_size.h=
eight,
> > +
> > +             .sp_crop.h_offs =3D 0,
> > +             .sp_crop.v_offs =3D 0,
> > +             .sp_crop.h_size =3D rkisp2->resizer_devs[1].source_size.w=
idth,
> > +             .sp_crop.v_size =3D rkisp2->resizer_devs[1].source_size.h=
eight
> > +     };
> > +
> > +     dev_dbg(rkisp2->dev,
> > +             "%s: set mp crop to %dx%d\n",
> > +             __func__, arg.mp_crop.h_size, arg.mp_crop.v_size);
> > +
> > +     __rkisp2_params_crop(params, &arg, V4L2_ISP_PARAMS_FL_BLOCK_ENABL=
E);
> > +}
> > +
> > +static void rkisp2_params_configure(struct rkisp2_params *params,
> > +                                 struct rkisp2_params_buffer *buf,
> > +                                 enum rkisp2_params_configure_priority=
 prio)
> > +{
> > +     struct v4l2_isp_params_buffer *cfg;
> > +     const struct rkisp2_params_block_handler_info *info;
> > +     size_t block_offset =3D 0;
> > +     size_t max_offset;
> > +
> > +     buf->vb.sequence =3D params->rkisp2->isp.frame_sequence + 1;
> > +     cfg =3D buf->cfg;
> > +
> > +     max_offset =3D cfg->data_size;
> > +
> > +     /* Walk the list of parameter blocks and process them. */
> > +     while (max_offset && block_offset < max_offset) {
> > +             union rkisp2_params_block block;
> > +
> > +             /* \todo Check if we want to avoid this copy */
> > +             block.data =3D &cfg->data[block_offset];
> > +
> > +             block_offset +=3D block.header->size;
> > +
> > +             info =3D &rkisp2_params_handlers[block.header->type];
> > +
> > +             if (prio !=3D RKISP2_PARAMS_CONFIG_PRIO_NONE &&
> > +                 prio !=3D info->priority)
> > +                     continue;
> > +
> > +             info->handler(params, block);
> > +     }
> > +
> > +     /* update shadow register immediately */
> > +     rkisp2_param_set_bits(params, RKISP2_CIF_ISP_CTRL,
> > +                           RKISP2_CIF_ISP_CTRL_ISP_CFG_UPD);
> > +
> > +     if (prio =3D=3D RKISP2_PARAMS_CONFIG_PRIO_NONE)
> > +             vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
> > +}
> > +
> > +void rkisp2_params_isr(struct rkisp2_params *params)
> > +{
> > +     struct rkisp2_params_buffer *buf;
> > +
> > +     spin_lock(&params->buf_lock);
> > +     buf =3D list_first_entry_or_null(&params->params,
> > +                                    struct rkisp2_params_buffer, queue=
);
> > +     if (buf)
> > +             list_del(&buf->queue);
> > +     spin_unlock(&params->buf_lock);
> > +
> > +     if (!buf)
> > +             return;
> > +
> > +     rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_NO=
NE);
> > +}
> > +
> > +void rkisp2_params_pre_configure(struct rkisp2_params *params,
> > +                              enum rkisp2_fmt_raw_pat_type bayer_pat,
> > +                              const struct v4l2_mbus_framefmt *sink_fr=
m,
> > +                              const struct v4l2_mbus_framefmt *mp_src_=
frm,
> > +                              const struct v4l2_mbus_framefmt *sp_src_=
frm)
> > +{
> > +     struct rkisp2_device *rkisp2 =3D params->rkisp2;
> > +     struct rkisp2_params_buffer *buf;
> > +
> > +     /* Save configuration information that params requires */
> > +
> > +     params->raw_type =3D bayer_pat;
> > +
> > +     rkisp2_resizer_pre_configure(rkisp2, sink_frm, mp_src_frm, sp_src=
_frm);
> > +
> > +     spin_lock_irq(&params->buf_lock);
> > +     buf =3D list_first_entry_or_null(&params->params,
> > +                                    struct rkisp2_params_buffer, queue=
);
> > +     spin_unlock_irq(&params->buf_lock);
> > +
> > +     if (!buf) {
> > +             /*
> > +              * Initialize crop in the event that are are no pre-queued
> > +              * parameter buffers
> > +              */
> > +             rkisp2_params_crop_init(params);
> > +             return;
> > +     }
> > +
> > +     rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_PR=
E);
> > +}
> > +
> > +void rkisp2_params_post_configure(struct rkisp2_params *params)
> > +{
> > +     struct rkisp2_params_buffer *buf;
> > +
> > +     spin_lock_irq(&params->buf_lock);
> > +     buf =3D list_first_entry_or_null(&params->params,
> > +                                    struct rkisp2_params_buffer, queue=
);
> > +     if (buf)
> > +             list_del(&buf->queue);
> > +     spin_unlock_irq(&params->buf_lock);
> > +
> > +     if (!buf)
> > +             return;
> > +
> > +     rkisp2_params_configure(params, buf, RKISP2_PARAMS_CONFIG_PRIO_PO=
ST);
> > +}
> > +
> > +/*** V4L2 ***/
> > +
> > +static int rkisp2_params_enum_fmt_meta_out(struct file *file, void *fh,
> > +                                        struct v4l2_fmtdesc *f)
> > +{
> > +     if (f->index)
> > +             return -EINVAL;
> > +
> > +     if (f->mbus_code && f->mbus_code !=3D MEDIA_BUS_FMT_METADATA_FIXE=
D)
> > +             return -EINVAL;
> > +
> > +     f->pixelformat =3D V4L2_META_FMT_RKISP2_PARAMS;
> > +
> > +     return 0;
> > +}
> > +
> > +static int rkisp2_params_g_fmt_meta_out(struct file *file, void *fh,
> > +                                     struct v4l2_format *f)
> > +{
> > +
> > +     static const struct v4l2_meta_format mfmt =3D {
> > +             .dataformat =3D V4L2_META_FMT_RKISP2_PARAMS,
> > +             .buffersize =3D v4l2_isp_buffer_size(RKISP2_PARAMS_MAX_SI=
ZE),
> > +     };
> > +
> > +     f->fmt.meta =3D mfmt;
> > +
> > +     return 0;
> > +}
> > +
> > +static int rkisp2_params_querycap(struct file *file,
> > +                               void *priv, struct v4l2_capability *cap)
> > +{
> > +     struct video_device *vdev =3D video_devdata(file);
> > +
> > +     strscpy(cap->driver, RKISP2_DRIVER_NAME, sizeof(cap->driver));
> > +     strscpy(cap->card, vdev->name, sizeof(cap->card));
> > +     strscpy(cap->bus_info, RKISP2_BUS_INFO, sizeof(cap->bus_info));
> > +
> > +     return 0;
> > +}
> > +
> > +/* ISP params video device IOCTLs */
> > +static const struct v4l2_ioctl_ops rkisp2_params_ioctl =3D {
> > +     .vidioc_reqbufs =3D vb2_ioctl_reqbufs,
> > +     .vidioc_querybuf =3D vb2_ioctl_querybuf,
> > +     .vidioc_create_bufs =3D vb2_ioctl_create_bufs,
> > +     .vidioc_qbuf =3D vb2_ioctl_qbuf,
> > +     .vidioc_dqbuf =3D vb2_ioctl_dqbuf,
> > +     .vidioc_prepare_buf =3D vb2_ioctl_prepare_buf,
> > +     .vidioc_expbuf =3D vb2_ioctl_expbuf,
> > +     .vidioc_streamon =3D vb2_ioctl_streamon,
> > +     .vidioc_streamoff =3D vb2_ioctl_streamoff,
> > +     .vidioc_enum_fmt_meta_out =3D rkisp2_params_enum_fmt_meta_out,
> > +     .vidioc_g_fmt_meta_out =3D rkisp2_params_g_fmt_meta_out,
> > +     .vidioc_s_fmt_meta_out =3D rkisp2_params_g_fmt_meta_out,
> > +     .vidioc_try_fmt_meta_out =3D rkisp2_params_g_fmt_meta_out,
> > +     .vidioc_querycap =3D rkisp2_params_querycap,
> > +};
> > +
> > +static int rkisp2_params_vb2_queue_setup(struct vb2_queue *vq,
> > +                                      unsigned int *num_buffers,
> > +                                      unsigned int *num_planes,
> > +                                      unsigned int sizes[],
> > +                                      struct device *alloc_devs[])
> > +{
> > +     /* \todo num_buffers? */
> > +
> > +     *num_planes =3D 1;
> > +
> > +     sizes[0] =3D v4l2_isp_buffer_size(RKISP2_PARAMS_MAX_SIZE);
> > +
> > +     return 0;
> > +}
> > +
> > +static int rkisp2_params_vb2_buf_init(struct vb2_buffer *vb)
> > +{
> > +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +     struct rkisp2_params_buffer *params_buf =3D to_rkisp2_params_buff=
er(vbuf);
> > +
> > +     params_buf->cfg =3D kvmalloc(v4l2_isp_buffer_size(RKISP2_PARAMS_M=
AX_SIZE),
> > +                                GFP_KERNEL);
> > +     if (!params_buf->cfg)
> > +             return -ENOMEM;
> > +
> > +     return 0;
> > +}
> > +
> > +static void rkisp2_params_vb2_buf_cleanup(struct vb2_buffer *vb)
> > +{
> > +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +     struct rkisp2_params_buffer *params_buf =3D to_rkisp2_params_buff=
er(vbuf);
> > +
> > +     kvfree(params_buf->cfg);
> > +     params_buf->cfg =3D NULL;
> > +}
> > +
> > +static void rkisp2_params_vb2_buf_queue(struct vb2_buffer *vb)
> > +{
> > +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +     struct rkisp2_params_buffer *params_buf =3D to_rkisp2_params_buff=
er(vbuf);
> > +     struct vb2_queue *vq =3D vb->vb2_queue;
> > +     struct rkisp2_params *params =3D vq->drv_priv;
> > +
> > +     spin_lock_irq(&params->buf_lock);
> > +     list_add_tail(&params_buf->queue, &params->params);
> > +     spin_unlock_irq(&params->buf_lock);
> > +}
> > +
> > +static int rkisp2_params_vb2_buf_prepare(struct vb2_buffer *vb)
> > +{
> > +     struct rkisp2_params *params =3D vb->vb2_queue->drv_priv;
> > +     struct vb2_v4l2_buffer *vbuf =3D to_vb2_v4l2_buffer(vb);
> > +     struct rkisp2_params_buffer *params_buf =3D to_rkisp2_params_buff=
er(vbuf);
> > +     struct v4l2_isp_params_buffer *cfg =3D vb2_plane_vaddr(&vbuf->vb2=
_buf, 0);
> > +     size_t payload_size =3D vb2_get_plane_payload(vb, 0);
> > +     int ret;
> > +
> > +     ret =3D v4l2_isp_params_validate_buffer_size(params->rkisp2->dev,=
 vb,
> > +                                                v4l2_isp_buffer_size(R=
KISP2_PARAMS_MAX_SIZE));
> > +     if (ret)
> > +             return ret;
> > +
> > +     /*
> > +      * Copy the parameters buffer to the internal scratch buffer to a=
void
> > +      * userspace modifying the buffer content while the driver proces=
ses it.
> > +      */
> > +     memcpy(params_buf->cfg, cfg, payload_size);
> > +
> > +     return v4l2_isp_params_validate_buffer(params->rkisp2->dev, vb, c=
fg,
>=20
> Should validate the copy (params_buf->cfg), so we validate a stable paylo=
ad.

Yes it should... this one really fell through the cracks.

>=20
> p.s. reported by Sashiko, but since I don't know who's anti-ai and who's =
not,
> replicating here. There likely more valid stuff, but only this one felt
> important to me.

Thanks for the consideration. I took a look at what it reported and I do ha=
ve
to admit that it caught quite a few things that are more suited for a
statistical language model than a human to comb for.


Paul

>=20
> Nicolas
>=20
> > +                             rkisp2_params_block_types_info,
> > +                             ARRAY_SIZE(rkisp2_params_block_types_info=
));
> > +}
> > +
> > +static void rkisp2_params_vb2_stop_streaming(struct vb2_queue *vq)
> > +{
> > +     struct rkisp2_params *params =3D vq->drv_priv;
> > +     struct rkisp2_params_buffer *buf;
> > +     LIST_HEAD(tmp_list);
> > +
> > +     /*
> > +      * we first move the buffers into a local list 'tmp_list'
> > +      * and then we can iterate it and call vb2_buffer_done
> > +      * without holding the lock
> > +      */
> > +     spin_lock_irq(&params->buf_lock);
> > +     list_splice_init(&params->params, &tmp_list);
> > +     spin_unlock_irq(&params->buf_lock);
> > +
> > +     list_for_each_entry(buf, &tmp_list, queue)
> > +             vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
> > +}
> > +
> > +static const struct vb2_ops rkisp2_params_vb2_ops =3D {
> > +     .queue_setup =3D rkisp2_params_vb2_queue_setup,
> > +     .buf_init =3D rkisp2_params_vb2_buf_init,
> > +     .buf_cleanup =3D rkisp2_params_vb2_buf_cleanup,
> > +     .buf_queue =3D rkisp2_params_vb2_buf_queue,
> > +     .buf_prepare =3D rkisp2_params_vb2_buf_prepare,
> > +     .stop_streaming =3D rkisp2_params_vb2_stop_streaming,
> > +};
> > +
> > +static const struct v4l2_file_operations rkisp2_params_fops =3D {
> > +     .mmap =3D vb2_fop_mmap,
> > +     .unlocked_ioctl =3D video_ioctl2,
> > +     .poll =3D vb2_fop_poll,
> > +     .open =3D v4l2_fh_open,
> > +     .release =3D vb2_fop_release
> > +};
> > +
> > +static int rkisp2_params_link_validate(struct media_link *link)
> > +{
> > +     /* \todo implement this */
> > +     return 0;
> > +}
> > +
> > +static const struct media_entity_operations rkisp2_params_media_ops =
=3D {
> > +     .link_validate =3D rkisp2_params_link_validate,
> > +};
> > +
> > +static int rkisp2_params_init_vb2_queue(struct vb2_queue *q,
> > +                                     struct rkisp2_params *params)
> > +{
> > +     struct rkisp2_vdev_node *node;
> > +
> > +     node =3D container_of(q, struct rkisp2_vdev_node, buf_queue);
> > +
> > +     q->type =3D V4L2_BUF_TYPE_META_OUTPUT;
> > +     q->io_modes =3D VB2_MMAP | VB2_DMABUF;
> > +     q->drv_priv =3D params;
> > +     q->ops =3D &rkisp2_params_vb2_ops;
> > +     q->mem_ops =3D &vb2_vmalloc_memops;
> > +     q->buf_struct_size =3D sizeof(struct rkisp2_params_buffer);
> > +     q->timestamp_flags =3D V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
> > +     q->lock =3D &node->vlock;
> > +
> > +     return vb2_queue_init(q);
> > +}
> > +
> > +int rkisp2_params_register(struct rkisp2_device *rkisp2)
> > +{
> > +     struct rkisp2_params *params =3D &rkisp2->params;
> > +     struct rkisp2_vdev_node *node =3D &params->vnode;
> > +     struct video_device *vdev =3D &node->vdev;
> > +     int ret;
> > +
> > +     params->rkisp2 =3D rkisp2;
> > +     mutex_init(&node->vlock);
> > +     INIT_LIST_HEAD(&params->params);
> > +     spin_lock_init(&params->buf_lock);
> > +
> > +     strscpy(vdev->name, RKISP2_PARAMS_DEV_NAME, sizeof(vdev->name));
> > +
> > +     video_set_drvdata(vdev, params);
> > +     vdev->ioctl_ops =3D &rkisp2_params_ioctl;
> > +     vdev->fops =3D &rkisp2_params_fops;
> > +     vdev->release =3D video_device_release_empty;
> > +     /*
> > +      * Provide a mutex to v4l2 core. It will be used
> > +      * to protect all fops and v4l2 ioctls.
> > +      */
> > +     vdev->lock =3D &node->vlock;
> > +     vdev->v4l2_dev =3D &rkisp2->v4l2_dev;
> > +     vdev->queue =3D &node->buf_queue;
> > +     vdev->device_caps =3D V4L2_CAP_STREAMING | V4L2_CAP_META_OUTPUT;
> > +     vdev->entity.ops =3D &rkisp2_params_media_ops;
> > +     vdev->vfl_dir =3D VFL_DIR_TX;
> > +     ret =3D rkisp2_params_init_vb2_queue(vdev->queue, params);
> > +     if (ret)
> > +             goto err_media;
> > +
> > +     video_set_drvdata(vdev, params);
> > +
> > +     node->pad.flags =3D MEDIA_PAD_FL_SOURCE;
> > +     ret =3D media_entity_pads_init(&vdev->entity, 1, &node->pad);
> > +     if (ret)
> > +             goto err_media;
> > +
> > +     ret =3D video_register_device(vdev, VFL_TYPE_VIDEO, -1);
> > +     if (ret) {
> > +             dev_err(rkisp2->dev,
> > +                     "failed to register %s, ret=3D%d\n", vdev->name, =
ret);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +
> > +err_media:
> > +     media_entity_cleanup(&vdev->entity);
> > +     mutex_destroy(&node->vlock);
> > +     return ret;
> > +}
> > +
> > +void rkisp2_params_unregister(struct rkisp2_device *rkisp2)
> > +{
> > +     struct rkisp2_params *params =3D &rkisp2->params;
> > +     struct rkisp2_vdev_node *node =3D &params->vnode;
> > +     struct video_device *vdev =3D &node->vdev;
> > +
> > +     if (!video_is_registered(vdev))
> > +             return;
> > +
> > +     vb2_video_unregister_device(vdev);
> > +     media_entity_cleanup(&vdev->entity);
> > +     mutex_destroy(&node->vlock);
> > +}
> > diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h b=
/drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h
> > index bb79d08d206f..d27d9a48887e 100644
> > --- a/drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h
> > +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h
> > @@ -881,6 +881,15 @@
> >  #define ISP3X_LSC_YSIZE_CD                   (ISP3X_LSC_BASE + 0x000A8)
> >  #define ISP3X_LSC_YSIZE_EF                   (ISP3X_LSC_BASE + 0x000AC)
> > =20
> > +#define ISP3X_LSC_XGRAD(n)           (n < 4 ? (ISP3X_LSC_XGRAD_01 + (n=
) * 4) : \
> > +                                              (ISP3X_LSC_XGRAD_89 + ((=
n) - 4) * 4))
> > +#define ISP3X_LSC_YGRAD(n)           (n < 4 ? (ISP3X_LSC_YGRAD_01 + (n=
) * 4) : \
> > +                                              (ISP3X_LSC_YGRAD_89 + ((=
n) - 4) * 4))
> > +#define ISP3X_LSC_XSIZE(n)           (n < 4 ? (ISP3X_LSC_XSIZE_01 + (n=
) * 4) : \
> > +                                              (ISP3X_LSC_XSIZE_89 + ((=
n) - 4) * 4))
> > +#define ISP3X_LSC_YSIZE(n)           (n < 4 ? (ISP3X_LSC_YSIZE_01 + (n=
) * 4) : \
> > +                                              (ISP3X_LSC_YSIZE_89 + ((=
n) - 4) * 4))
> > +
> >  #define ISP3X_DEBAYER_BASE                   0x00002500
> >  #define ISP3X_DEBAYER_CONTROL                        (ISP3X_DEBAYER_BA=
SE + 0x00000)
> >  #define ISP3X_DEBAYER_G_INTERP                       (ISP3X_DEBAYER_BA=
SE + 0x00004)
> > @@ -3235,6 +3244,12 @@
> >  #define ISP33_IIR_WR_ID(x)           (((x) & 0x3f) << 16)
> >  #define ISP33_IIR_WR_CLEAR           BIT(24)
> > =20
> > +/* GAMMA_OUT */
> > +#define ISP3X_GAMMA_OUT_CTRL_EN                      BIT(0)
> > +#define ISP3X_GAMMA_OUT_CTRL_MODE_EQUIDISTANT        BIT(1)
> > +#define ISP3X_GAMMA_OUT_CTRL_SEGMENTS_48             BIT(2)
> > +#define ISP3X_GAMMA_OUT_SAMPLE(a, b)         (((a) & 0xfff) | (((b) & =
0xfff) << 16))
> > +
> >  /* HDRTMO */
> > =20
> >  /* HDRDRC */
> > @@ -3264,6 +3279,7 @@
> >  #define ISP3X_DPCC_WORKING           BIT(30)
> > =20
> >  /* CCM */
> > +#define ISP3X_CCM_COEFF(a, b)                ((a & 0x7ff) | (b << 16))
> >  #define ISP3X_CCM_HIGHY_ADJ_DIS              BIT(1)
> >  #define ISP32_CCM_ENH_ADJ_EN         BIT(2)
> >  #define ISP32_CCM_ASYM_ADJ_EN                BIT(3)
> > @@ -3288,6 +3304,21 @@
> >  #define ISP3X_LSC_TABLE_ADDRESS_0    0
> >  #define ISP3X_LSC_TABLE_ADDRESS_153  153
> > =20
> > +#define ISP3X_LSC_CTRL_EN            BIT(0)
> > +
> > +#define ISP3X_LSC_ACTIVE_TABLE               BIT(1)
> > +
> > +#define ISP3X_LSC_LUT_EN             BIT(1)
> > +#define ISP3X_LSC_SECTOR_16X16               BIT(2)
> > +#define ISP3X_LSC_PRE_RD_ST_MODE     BIT(4)
> > +
> > +#define ISP3X_LSC_TABLE_DATA(v0, v1)     \
> > +     (((v0) & 0x1FFF) | (((v1) & 0x1FFF) << 16))
> > +#define ISP3X_LSC_SECT_SIZE(v0, v1)      \
> > +     (((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
> > +#define ISP3X_LSC_GRAD_SIZE(v0, v1)      \
> > +     (((v0) & 0xFFF) | (((v1) & 0xFFF) << 16))
> > +
> >  #define ISP3X_LSC_LUT_EN             BIT(1)
> >  #define ISP3X_LSC_SECTOR_16X16               BIT(2)
> >  #define ISP3X_LSC_PRE_RD_ST_MODE     BIT(4)
> > diff --git a/drivers/media/platform/rockchip/rkisp2/rkisp2-resizer.c b/=
drivers/media/platform/rockchip/rkisp2/rkisp2-resizer.c
> > new file mode 100644
> > index 000000000000..6f9812f1ae84
> > --- /dev/null
> > +++ b/drivers/media/platform/rockchip/rkisp2/rkisp2-resizer.c
> > @@ -0,0 +1,404 @@
> > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > +/*
> > + * Rockchip ISP2 Driver - Resizer
> > + *
> > + * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> > + * Copyright (C) 2026 Ideas on Board Oy.
> > + */
> > +
> > +#include "rkisp2-common.h"
> > +
> > +/*
> > + * Although there is no resizer subdevice like rkisp1, there is signif=
icant
> > + * control handling that this is split into a separate file. This incl=
udes
> > + * handling of both the dual crop and resizer.
> > + *
> > + * In rkisp2, crop rectangles are set by parameter buffers and are thu=
s handled
> > + * by params.
> > + */
> > +
> > +struct rkisp2_resizer_config {
> > +     int max_rsz_width;
> > +     int max_rsz_height;
> > +     int min_rsz_width;
> > +     int min_rsz_height;
> > +     struct {
> > +             u32 ctrl;
> > +             u32 ctrl_shd;
> > +             u32 update;
> > +             u32 src_size;
> > +             u32 dst_size;
> > +             u32 scale_hy_offs_mi;
> > +             u32 scale_hc_offs_mi;
> > +             u32 scale_in_crop_offs;
> > +             u32 scale_hy_offs;
> > +             u32 scale_hc_offs;
> > +             u32 scale_hy_size;
> > +             u32 scale_hc_size;
> > +             u32 scale_hy;
> > +             u32 scale_hcr;
> > +             u32 scale_hcb;
> > +             u32 scale_vy;
> > +             u32 scale_vc;
> > +             u32 scale_lut;
> > +             u32 scale_lut_addr;
> > +             u32 scale_hy_shd;
> > +             u32 scale_hcr_shd;
> > +             u32 scale_hcb_shd;
> > +             u32 scale_vy_shd;
> > +             u32 scale_vc_shd;
> > +             u32 phase_hy;
> > +             u32 phase_hc;
> > +             u32 phase_vy;
> > +             u32 phase_vc;
> > +             u32 phase_hy_shd;
> > +             u32 phase_hc_shd;
> > +             u32 phase_vy_shd;
> > +             u32 phase_vc_shd;
> > +     } rsz;
> > +     struct {
> > +             u32 ctrl;
> > +             u32 yuvmode_mask;
> > +             u32 rawmode_mask;
> > +             u32 h_offset;
> > +             u32 v_offset;
> > +             u32 h_size;
> > +             u32 v_size;
> > +     } dual_crop;
> > +};
> > +
> > +static const struct rkisp2_resizer_config rkisp2_resizer_config_mp =3D=
 {
> > +     .rsz =3D {
> > +             .ctrl =3D RKISP2_CIF_MRSZ_CTRL,
> > +             .scale_hy =3D RKISP2_CIF_MRSZ_SCALE_HY,
> > +             .scale_hcr =3D RKISP2_CIF_MRSZ_SCALE_HCR,
> > +             .scale_hcb =3D RKISP2_CIF_MRSZ_SCALE_HCB,
> > +             .scale_vy =3D RKISP2_CIF_MRSZ_SCALE_VY,
> > +             .scale_vc =3D RKISP2_CIF_MRSZ_SCALE_VC,
> > +             .scale_lut =3D RKISP2_CIF_MRSZ_SCALE_LUT,
> > +             .scale_lut_addr =3D RKISP2_CIF_MRSZ_SCALE_LUT_ADDR,
> > +             .scale_hy_shd =3D RKISP2_CIF_MRSZ_SCALE_HY_SHD,
> > +             .scale_hcr_shd =3D RKISP2_CIF_MRSZ_SCALE_HCR_SHD,
> > +             .scale_hcb_shd =3D RKISP2_CIF_MRSZ_SCALE_HCB_SHD,
> > +             .scale_vy_shd =3D RKISP2_CIF_MRSZ_SCALE_VY_SHD,
> > +             .scale_vc_shd =3D RKISP2_CIF_MRSZ_SCALE_VC_SHD,
> > +             .phase_hy =3D RKISP2_CIF_MRSZ_PHASE_HY,
> > +             .phase_hc =3D RKISP2_CIF_MRSZ_PHASE_HC,
> > +             .phase_vy =3D RKISP2_CIF_MRSZ_PHASE_VY,
> > +             .phase_vc =3D RKISP2_CIF_MRSZ_PHASE_VC,
> > +             .ctrl_shd =3D RKISP2_CIF_MRSZ_CTRL_SHD,
> > +             .phase_hy_shd =3D RKISP2_CIF_MRSZ_PHASE_HY_SHD,
> > +             .phase_hc_shd =3D RKISP2_CIF_MRSZ_PHASE_HC_SHD,
> > +             .phase_vy_shd =3D RKISP2_CIF_MRSZ_PHASE_VY_SHD,
> > +             .phase_vc_shd =3D RKISP2_CIF_MRSZ_PHASE_VC_SHD,
> > +     },
> > +     .dual_crop =3D {
> > +             .ctrl =3D RKISP2_CIF_DUAL_CROP_CTRL,
> > +             .yuvmode_mask =3D RKISP2_CIF_DUAL_CROP_MP_MODE_YUV,
> > +             .rawmode_mask =3D RKISP2_CIF_DUAL_CROP_MP_MODE_RAW,
> > +             .h_offset =3D RKISP2_CIF_DUAL_CROP_M_H_OFFS,
> > +             .v_offset =3D RKISP2_CIF_DUAL_CROP_M_V_OFFS,
> > +             .h_size =3D RKISP2_CIF_DUAL_CROP_M_H_SIZE,
> > +             .v_size =3D RKISP2_CIF_DUAL_CROP_M_V_SIZE,
> > +     },
> > +};
> > +
> > +static const struct rkisp2_resizer_config rkisp2_resizer_config_sp =3D=
 {
> > +     .rsz =3D {
> > +             .ctrl =3D RKISP2_CIF_SRSZ_CTRL,
> > +             .scale_hy =3D RKISP2_CIF_SRSZ_SCALE_HY,
> > +             .scale_hcr =3D RKISP2_CIF_SRSZ_SCALE_HCR,
> > +             .scale_hcb =3D RKISP2_CIF_SRSZ_SCALE_HCB,
> > +             .scale_vy =3D RKISP2_CIF_SRSZ_SCALE_VY,
> > +             .scale_vc =3D RKISP2_CIF_SRSZ_SCALE_VC,
> > +             .scale_lut =3D RKISP2_CIF_SRSZ_SCALE_LUT,
> > +             .scale_lut_addr =3D RKISP2_CIF_SRSZ_SCALE_LUT_ADDR,
> > +             .scale_hy_shd =3D RKISP2_CIF_SRSZ_SCALE_HY_SHD,
> > +             .scale_hcr_shd =3D RKISP2_CIF_SRSZ_SCALE_HCR_SHD,
> > +             .scale_hcb_shd =3D RKISP2_CIF_SRSZ_SCALE_HCB_SHD,
> > +             .scale_vy_shd =3D RKISP2_CIF_SRSZ_SCALE_VY_SHD,
> > +             .scale_vc_shd =3D RKISP2_CIF_SRSZ_SCALE_VC_SHD,
> > +             .phase_hy =3D RKISP2_CIF_SRSZ_PHASE_HY,
> > +             .phase_hc =3D RKISP2_CIF_SRSZ_PHASE_HC,
> > +             .phase_vy =3D RKISP2_CIF_SRSZ_PHASE_VY,
> > +             .phase_vc =3D RKISP2_CIF_SRSZ_PHASE_VC,
> > +             .ctrl_shd =3D RKISP2_CIF_SRSZ_CTRL_SHD,
> > +             .phase_hy_shd =3D RKISP2_CIF_SRSZ_PHASE_HY_SHD,
> > +             .phase_hc_shd =3D RKISP2_CIF_SRSZ_PHASE_HC_SHD,
> > +             .phase_vy_shd =3D RKISP2_CIF_SRSZ_PHASE_VY_SHD,
> > +             .phase_vc_shd =3D RKISP2_CIF_SRSZ_PHASE_VC_SHD,
> > +     },
> > +     .dual_crop =3D {
> > +             .ctrl =3D RKISP2_CIF_DUAL_CROP_CTRL,
> > +             .yuvmode_mask =3D RKISP2_CIF_DUAL_CROP_SP_MODE_YUV,
> > +             .rawmode_mask =3D RKISP2_CIF_DUAL_CROP_SP_MODE_RAW,
> > +             .h_offset =3D RKISP2_CIF_DUAL_CROP_S_H_OFFS,
> > +             .v_offset =3D RKISP2_CIF_DUAL_CROP_S_V_OFFS,
> > +             .h_size =3D RKISP2_CIF_DUAL_CROP_S_H_SIZE,
> > +             .v_size =3D RKISP2_CIF_DUAL_CROP_S_V_SIZE,
> > +     },
> > +};
> > +
> > +static bool rkisp2_rect_equals(const struct v4l2_rect *a,
> > +                            const struct v4l2_rect *b)
> > +{
> > +     return a->left =3D=3D b->left && a->top =3D=3D b->top &&
> > +            a->width =3D=3D b->width && a->height =3D=3D b->height;
> > +}
> > +
> > +static void rkisp2_resizer_disable_dcrop(struct rkisp2_resizer *rsz)
> > +{
> > +     struct rkisp2_device *rkisp2 =3D rsz->rkisp2;
> > +     const struct rkisp2_resizer_config *config =3D rsz->config;
> > +
> > +     u32 mask =3D config->dual_crop.yuvmode_mask |
> > +                config->dual_crop.rawmode_mask;
> > +     u32 ctrl =3D rkisp2_read(rkisp2, config->dual_crop.ctrl);
> > +
> > +     ctrl &=3D ~mask;
> > +     ctrl |=3D RKISP2_CIF_DUAL_CROP_CFG_UPD;
> > +     rkisp2_write(rkisp2, config->dual_crop.ctrl, ctrl);
> > +}
> > +
> > +static void rkisp2_resizer_config_dcrop(struct rkisp2_resizer *rsz,
> > +                                     bool is_raw,
> > +                                     const struct v4l2_rect *crop)
> > +{
> > +     struct rkisp2_device *rkisp2 =3D rsz->rkisp2;
> > +     const struct rkisp2_resizer_config *config =3D rsz->config;
> > +
> > +     u32 mask =3D config->dual_crop.yuvmode_mask |
> > +                config->dual_crop.rawmode_mask;
> > +     u32 ctrl =3D rkisp2_read(rkisp2, config->dual_crop.ctrl);
> > +
> > +     rkisp2_write(rkisp2, config->dual_crop.h_offset, crop->left);
> > +     rkisp2_write(rkisp2, config->dual_crop.v_offset, crop->top);
> > +     rkisp2_write(rkisp2, config->dual_crop.h_size, crop->width);
> > +     rkisp2_write(rkisp2, config->dual_crop.v_size, crop->height);
> > +
> > +     ctrl &=3D ~mask;
> > +     if (is_raw)
> > +             ctrl |=3D config->dual_crop.rawmode_mask;
> > +     else
> > +             ctrl |=3D config->dual_crop.yuvmode_mask;
> > +     ctrl |=3D RKISP2_CIF_DUAL_CROP_CFG_UPD;
> > +     rkisp2_write(rkisp2, config->dual_crop.ctrl, ctrl);
> > +}
> > +
> > +static void rkisp2_resizer_disable_rsz(struct rkisp2_resizer *rsz)
> > +{
> > +     struct rkisp2_device *rkisp2 =3D rsz->rkisp2;
> > +     const struct rkisp2_resizer_config *config =3D rsz->config;
> > +
> > +     rkisp2_write(rkisp2, config->rsz.ctrl, 0);
> > +     rkisp2_write(rkisp2, config->rsz.ctrl, RKISP2_CIF_RSZ_CTRL_CFG_UP=
D);
> > +}
> > +
> > +static int rkisp2_mbus_code_xysubs(u32 code, u32 *xsubs, u32 *ysubs)
> > +{
> > +     switch (code) {
> > +     case MEDIA_BUS_FMT_YUYV8_2X8:
> > +     case MEDIA_BUS_FMT_YUYV8_1X16:
> > +     case MEDIA_BUS_FMT_YVYU8_1X16:
> > +     case MEDIA_BUS_FMT_UYVY8_1X16:
> > +     case MEDIA_BUS_FMT_VYUY8_1X16:
> > +             *xsubs =3D 2;
> > +             *ysubs =3D 1;
> > +             return 0;
> > +     default:
> > +             *xsubs =3D 1;
> > +             *ysubs =3D 1;
> > +             return 0;
> > +     }
> > +}
> > +
> > +static void rkisp2_format_xysubs(const struct v4l2_format_info *info,
> > +                              u32 *xsubs, u32 *ysubs)
> > +{
> > +     if (info && v4l2_is_format_yuv(info)) {
> > +             *xsubs =3D info->hdiv ?: 1;
> > +             *ysubs =3D info->vdiv ?: 1;
> > +     } else {
> > +             *xsubs =3D 1;
> > +             *ysubs =3D 1;
> > +     }
> > +}
> > +
> > +static u32 rkisp2_scale_up_factor(u32 src, u32 dst)
> > +{
> > +     if (src <=3D 1 || dst <=3D 1)
> > +             return RKISP2_CIF_RSZ_SCALER_FACTOR;
> > +     return ((src - 1) * RKISP2_CIF_RSZ_SCALER_FACTOR) / (dst - 1);
> > +}
> > +
> > +static u32 rkisp2_scale_down_factor(u32 src, u32 dst)
> > +{
> > +     if (src <=3D 1 || dst <=3D 1)
> > +             return RKISP2_CIF_RSZ_SCALER_FACTOR;
> > +     return ((dst - 1) * RKISP2_CIF_RSZ_SCALER_FACTOR) / (src - 1) + 1;
> > +}
> > +
> > +static void rkisp2_resizer_prepare_lut(struct rkisp2_resizer *rsz)
> > +{
> > +     struct rkisp2_device *rkisp2 =3D rsz->rkisp2;
> > +     const struct rkisp2_resizer_config *config =3D rsz->config;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < 64; i++) {
> > +             rkisp2_write(rkisp2, config->rsz.scale_lut_addr, i);
> > +             rkisp2_write(rkisp2, config->rsz.scale_lut, i);
> > +     }
> > +}
> > +
> > +static void rkisp2_resizer_config_rsz(struct rkisp2_resizer *rsz,
> > +                                   const struct v4l2_rect *in_rect,
> > +                                   const struct v4l2_rect *out_rect,
> > +                                   const struct v4l2_mbus_framefmt *sr=
c_fmt)
> > +{
> > +     struct rkisp2_device *rkisp2 =3D rsz->rkisp2;
> > +     const struct rkisp2_resizer_config *config =3D rsz->config;
> > +     struct v4l2_rect in_c, out_c;
> > +     u32 in_xsubs =3D 1, in_ysubs =3D 1;
> > +     u32 out_xsubs =3D 1, out_ysubs =3D 1;
> > +     u32 rsz_ctrl =3D 0;
> > +
> > +     rkisp2_mbus_code_xysubs(src_fmt->code, &in_xsubs, &in_ysubs);
> > +     rkisp2_format_xysubs(rsz->source_fmt_info, &out_xsubs, &out_ysubs=
);
> > +
> > +     in_c.width =3D DIV_ROUND_UP(in_rect->width, in_xsubs);
> > +     in_c.height =3D DIV_ROUND_UP(in_rect->height, in_ysubs);
> > +     out_c.width =3D DIV_ROUND_UP(out_rect->width, out_xsubs);
> > +     out_c.height =3D DIV_ROUND_UP(out_rect->height, out_ysubs);
> > +
> > +     rkisp2_write(rkisp2, config->rsz.phase_hy, 0);
> > +     rkisp2_write(rkisp2, config->rsz.phase_hc, 0);
> > +     rkisp2_write(rkisp2, config->rsz.phase_vy, 0);
> > +     rkisp2_write(rkisp2, config->rsz.phase_vc, 0);
> > +
> > +     rkisp2_resizer_prepare_lut(rsz);
> > +
> > +     if (in_rect->width !=3D out_rect->width) {
> > +             u32 hy;
> > +
> > +             rsz_ctrl |=3D RKISP2_CIF_RSZ_CTRL_SCALE_HY_ENABLE;
> > +             if (in_rect->width < out_rect->width) {
> > +                     hy =3D rkisp2_scale_up_factor(in_rect->width, out=
_rect->width);
> > +                     rsz_ctrl |=3D RKISP2_CIF_RSZ_CTRL_SCALE_HY_UP;
> > +             } else {
> > +                     hy =3D rkisp2_scale_down_factor(in_rect->width, o=
ut_rect->width);
> > +             }
> > +             rkisp2_write(rkisp2, config->rsz.scale_hy, hy);
> > +     }
> > +
> > +     if (in_c.width !=3D out_c.width) {
> > +             u32 hc;
> > +
> > +             rsz_ctrl |=3D RKISP2_CIF_RSZ_CTRL_SCALE_HC_ENABLE;
> > +             if (in_c.width < out_c.width) {
> > +                     hc =3D rkisp2_scale_up_factor(in_c.width, out_c.w=
idth);
> > +                     rsz_ctrl |=3D RKISP2_CIF_RSZ_CTRL_SCALE_HC_UP;
> > +             } else {
> > +                     hc =3D rkisp2_scale_down_factor(in_c.width, out_c=
.width);
> > +             }
> > +             rkisp2_write(rkisp2, config->rsz.scale_hcb, hc);
> > +             rkisp2_write(rkisp2, config->rsz.scale_hcr, hc);
> > +     }
> > +
> > +     if (in_rect->height !=3D out_rect->height) {
> > +             u32 vy;
> > +
> > +             rsz_ctrl |=3D RKISP2_CIF_RSZ_CTRL_SCALE_VY_ENABLE;
> > +             if (in_rect->height < out_rect->height) {
> > +                     vy =3D rkisp2_scale_up_factor(in_rect->height, ou=
t_rect->height);
> > +                     rsz_ctrl |=3D RKISP2_CIF_RSZ_CTRL_SCALE_VY_UP;
> > +             } else {
> > +                     vy =3D rkisp2_scale_down_factor(in_rect->height, =
out_rect->height);
> > +             }
> > +             rkisp2_write(rkisp2, config->rsz.scale_vy, vy);
> > +     }
> > +
> > +     if (in_c.height !=3D out_c.height) {
> > +             u32 vc;
> > +
> > +             rsz_ctrl |=3D RKISP2_CIF_RSZ_CTRL_SCALE_VC_ENABLE;
> > +             if (in_c.height < out_c.height) {
> > +                     vc =3D rkisp2_scale_up_factor(in_c.height, out_c.=
height);
> > +                     rsz_ctrl |=3D RKISP2_CIF_RSZ_CTRL_SCALE_VC_UP;
> > +             } else {
> > +                     vc =3D rkisp2_scale_down_factor(in_c.height, out_=
c.height);
> > +             }
> > +             rkisp2_write(rkisp2, config->rsz.scale_vc, vc);
> > +     }
> > +
> > +     rkisp2_write(rkisp2, config->rsz.ctrl,
> > +             rsz_ctrl | RKISP2_CIF_RSZ_CTRL_CFG_UPD);
> > +}
> > +
> > +void rkisp2_resizer_configure(struct rkisp2_resizer *rsz,
> > +                           struct v4l2_rect *crop)
> > +{
> > +     bool is_raw =3D v4l2_is_format_bayer(rsz->source_fmt_info);
> > +
> > +     dev_dbg(rsz->rkisp2->dev,
> > +             "%s: Configuring crop for path %d from sink size (%d,%d)/=
%dx%d, crop (%d,%d)/%dx%d, source size (%d,%d)/%dx%d\n",
> > +             __func__, rsz->id,
> > +             rsz->sink_size.left, rsz->sink_size.top, rsz->sink_size.w=
idth, rsz->sink_size.height,
> > +             crop->left, crop->top, crop->width, crop->height,
> > +             rsz->source_size.left, rsz->source_size.top, rsz->source_=
size.width, rsz->source_size.height);
> > +
> > +     /* Apparently dual crop works on raw (untested) but resizer does =
not */
> > +     if (rkisp2_has_feature(rsz->rkisp2, DUAL_CROP)) {
> > +             if (rkisp2_rect_equals(crop, &rsz->sink_size))
> > +                     rkisp2_resizer_disable_dcrop(rsz);
> > +             else
> > +                     rkisp2_resizer_config_dcrop(rsz, is_raw, crop);
> > +     }
> > +
> > +     if (crop->width =3D=3D rsz->source_size.width && crop->height =3D=
=3D rsz->source_size.height)
> > +             rkisp2_resizer_disable_rsz(rsz);
> > +     else
> > +             rkisp2_resizer_config_rsz(rsz, crop,
> > +                                       &rsz->source_size,
> > +                                       &rsz->source_format);
> > +}
> > +
> > +void rkisp2_resizer_pre_configure(struct rkisp2_device *rkisp2,
> > +                               const struct v4l2_mbus_framefmt *sink_f=
rm,
> > +                               const struct v4l2_mbus_framefmt *mp_src=
_frm,
> > +                               const struct v4l2_mbus_framefmt *sp_src=
_frm)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < 2; i++) {
> > +             struct rkisp2_resizer *rsz =3D &rkisp2->resizer_devs[i];
> > +             struct rkisp2_capture *cap =3D &rkisp2->capture_devs[i];
> > +             struct v4l2_pix_format_mplane *cap_fmt =3D &cap->pix.fmt;
> > +
> > +             rsz->sink_size.left =3D 0;
> > +             rsz->sink_size.top =3D 0;
> > +             rsz->sink_size.width =3D sink_frm->width;
> > +             rsz->sink_size.height =3D sink_frm->height;
> > +
> > +             rsz->source_size.left =3D 0;
> > +             rsz->source_size.top =3D 0;
> > +             rsz->source_size.width =3D cap_fmt->width;
> > +             rsz->source_size.height =3D cap_fmt->height;
> > +
> > +             rsz->source_format =3D (i =3D=3D 0 ? *mp_src_frm : *sp_sr=
c_frm);
> > +             rsz->source_fmt_info =3D cap->pix.info;
> > +     }
> > +}
> > +
> > +void rkisp2_resizer_devs_init(struct rkisp2_device *rkisp2)
> > +{
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < 2; i++) {
> > +             struct rkisp2_resizer *rsz =3D &rkisp2->resizer_devs[i];
> > +             rsz->rkisp2 =3D rkisp2;
> > +             rsz->id =3D i;
> > +             rsz->config =3D (i =3D=3D RKISP2_MAINPATH ?
> > +                            &rkisp2_resizer_config_mp :
> > +                            &rkisp2_resizer_config_sp);
> > +     }
> > +}
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-=
core/v4l2-ioctl.c
> > index 17ba1ae70735..2f2e8bf76168 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1467,6 +1467,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc =
*fmt)
> >       case V4L2_META_FMT_RK_ISP1_PARAMS:      descr =3D "Rockchip ISP1 =
3A Parameters"; break;
> >       case V4L2_META_FMT_RK_ISP1_STAT_3A:     descr =3D "Rockchip ISP1 =
3A Statistics"; break;
> >       case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:  descr =3D "Rockchip ISP1 =
Ext 3A Params"; break;
> > +     case V4L2_META_FMT_RKISP2_PARAMS:       descr =3D "Rockchip ISP2 =
3A Parameters"; break;
> >       case V4L2_META_FMT_C3ISP_PARAMS:        descr =3D "Amlogic C3 ISP=
 Parameters"; break;
> >       case V4L2_META_FMT_C3ISP_STATS:         descr =3D "Amlogic C3 ISP=
 Statistics"; break;
> >       case V4L2_META_FMT_MALI_C55_PARAMS:     descr =3D "ARM Mali-C55 I=
SP Parameters"; break;
> > diff --git a/include/uapi/linux/rkisp2-config.h b/include/uapi/linux/rk=
isp2-config.h
> > index ce8093db5998..5f8c8a555003 100644
> > --- a/include/uapi/linux/rkisp2-config.h
> > +++ b/include/uapi/linux/rkisp2-config.h
> > @@ -8,6 +8,18 @@
> >  #ifndef _UAPI_RKISP2_CONFIG_H
> >  #define _UAPI_RKISP2_CONFIG_H
> > =20
> > +#ifdef __KERNEL__
> > +#include <linux/build_bug.h>
> > +#endif /* __KERNEL__ */
> > +#include <linux/types.h>
> > +
> > +#include <linux/media/v4l2-isp.h>
> > +
> > +#define RKISP2_ISP_GAMMA_OUT_MAX_SEGMENTS   49
> > +
> > +#define RKISP2_ISP_LSC_SAMPLES_MAX           17
> > +#define RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX  16
> > +
> >  /**
> >   * enum rkisp2_isp_version - ISP variants
> >   *
> > @@ -17,4 +29,335 @@ enum rkisp2_isp_version {
> >       RKISP3_V0 =3D 30,
> >  };
> > =20
> > +/* See enum rkisp2_isp_goc_segments for logarithmic segment sizes */
> > +enum rkisp2_isp_goc_mode {
> > +     RKISP2_ISP_GOC_MODE_LOGARITHMIC,
> > +     RKISP2_ISP_GOC_MODE_EQUIDISTANT
> > +};
> > +
> > +/*
> > + * The segments are:
> > + * 1 x8, 2 x4, 4 x4, 8 x4, 16 x4, 32 x4, 64 x4, 128 x4, 256 x4, 512 x4
> > + * In 48-segment mode, the last group of 512 x4 becomes 256 x8
> > + */
> > +enum rkisp2_isp_goc_segments {
> > +     RKISP2_ISP_GOC_SEGMENTS_44,
> > +     RKISP2_ISP_GOC_SEGMENTS_48
> > +};
> > +
> > +enum rkisp2_isp_lsc_config {
> > +     RKISP2_ISP_LSC_CONFIG_8X8,
> > +     RKISP2_ISP_LSC_CONFIG_16X16
> > +};
> > +
> > +enum rkisp2_isp_set_active_table_when {
> > +     RKISP2_ISP_LSC_SET_ACTIVE_TABLE_AFTER,
> > +     RKISP2_ISP_LSC_SET_ACTIVE_TABLE_BEFORE,
> > +};
> > +
> > +enum rkisp2_isp_crop_en {
> > +     RKISP2_ISP_CROP_ENABLE_MAIN =3D 0x1,
> > +     RKISP2_ISP_CROP_ENABLE_SELF =3D 0x2,
> > +};
> > +
> > +/*---------- Parameters ------------*/
> > +
> > +/**
> > + * enum rkisp2_params_block_type - RkISP2 extensible params block types
> > + *
> > + * @RKISP2_PARAMS_BLOCK_BLS: Black level subtraction
> > + * @RKISP2_PARAMS_BLOCK_AWB_GAINS: AWB gains
> > + * @RKISP2_PARAMS_BLOCK_CSM: Color conversion coefficients (in the ISP=
 block)
> > + * @RKISP2_PARAMS_BLOCK_CCM: Color correction matrix (in the CCM block)
> > + * @RKISP2_PARAMS_BLOCK_GOC: Gamma out correction
> > + * @RKISP2_PARAMS_BLOCK_LSC: Lens shading correction
> > + * @RKISP2_PARAMS_BLOCK_CROP: Crop config
> > + */
> > +enum rkisp2_params_block_type {
> > +     RKISP2_PARAMS_BLOCK_BLS,
> > +     RKISP2_PARAMS_BLOCK_AWB_GAINS,
> > +     RKISP2_PARAMS_BLOCK_CSM,
> > +     RKISP2_PARAMS_BLOCK_CCM,
> > +     RKISP2_PARAMS_BLOCK_GOC,
> > +     RKISP2_PARAMS_BLOCK_LSC,
> > +     RKISP2_PARAMS_BLOCK_CROP,
> > +};
> > +
> > +/**
> > + * struct rkisp2_isp_window -  measurement window.
> > + *
> > + * Measurements are calculated per window inside the frame.
> > + * This struct represents a window for a measurement.
> > + *
> > + * @h_offs: the horizontal offset of the window from the left of the f=
rame in pixels.
> > + * @v_offs: the vertical offset of the window from the top of the fram=
e in pixels.
> > + * @h_size: the horizontal size of the window in pixels
> > + * @v_size: the vertical size of the window in pixels.
> > + */
> > +struct rkisp2_isp_window {
> > +     __u16 h_offs;
> > +     __u16 v_offs;
> > +     __u16 h_size;
> > +     __u16 v_size;
> > +};
> > +
> > +/**
> > + * struct rkisp2_isp_bls_fixed_val - BLS fixed subtraction values
> > + *
> > + * These are signed 13-bit (-4096 to +4095).
> > + *
> > + * @a: Fixed black level value for Bayer channel 0
> > + * @b: Fixed black level value for Bayer channel 1
> > + * @c: Fixed black level value for Bayer channel 2
> > + * @d: Fixed black level value for Bayer channel 3
> > + */
> > +struct rkisp2_isp_bls_fixed_val {
> > +     __s16 a;
> > +     __s16 b;
> > +     __s16 c;
> > +     __s16 d;
> > +};
> > +
> > +/**
> > + * struct rkisp2_isp_awb_gains - Auto white balance gain in the ISP bl=
ock
> > + *
> > + * All fields in this struct are 16 bit, where:
> > + * 0x100h =3D 1, unsigned integer value, range 0 to 63 with 8 bit frac=
tional part.
> > + *
> > + * This leaves the upper two msb unaccounted for; it is unknown if the=
se are
> > + * unused or misdocumented.
> > + *
> > + * TODO investigate the upper two bits
> > + *
> > + * @r: gain value for red component.
> > + * @gr: gain value for green component in red line.
> > + * @b: gain value for blue component.
> > + * @gb: gain value for green component in blue line.
> > + */
> > +struct rkisp2_isp_awb_gains {
> > +     __u16 r;
> > +     __u16 gr;
> > +     __u16 b;
> > +     __u16 gb;
> > +};
> > +
> > +/**
> > + * struct rkisp2_params_bls - RkISP2 params BLS config
> > + *
> > + * RkISP2 parameters Black Level Subtraction configuration block.
> > + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_BLS`.
> > + *
> > + * TODO Check if auto-mode and window selection is for both blocks or =
just for
> > + * one block (it might be the same as 2.x)
> > + *
> > + * @header: The RkISP2 parameters block header
> > + * @enable_auto: Automatic mode activated means that the measured valu=
es
> > + *            are subtracted. Otherwise the fixed subtraction
> > + *            values will be subtracted.
> > + * @enabled_windows: enabled window (bit 0 for window 1, bit 1 for win=
dow 2)
> > + * @bls_window1: Measurement window 1 size
> > + * @bls_window2: Measurement window 2 size
> > + * @bls_samples: Set amount of measured pixels for each Bayer position
> > + *            (A, B, C and D) to 2^bls_samples. (TODO needs confirmati=
on)
> > + * @bls_fixed_val: Black Level Subtraction fixed values for the BLS mo=
dule at
> > + *              the front of the pipeline
> > + * @bls1_fixed_val: Black Level Subtraction fixed values for the BLS m=
odule after
> > + *               bayer noise reduction
> > + */
> > +struct rkisp2_params_bls {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u8 enable_auto;
> > +     __u8 enabled_windows;
> > +     struct rkisp2_isp_window bls_window1;
> > +     struct rkisp2_isp_window bls_window2;
> > +     __u8 bls_samples;
> > +     struct rkisp2_isp_bls_fixed_val bls_fixed_val;
> > +     struct rkisp2_isp_bls_fixed_val bls1_fixed_val;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp2_params_awb_gains - RKISP2 params AWB gains config
> > + *
> > + * RkISP2 parameters auto white balance gains configuration block.
> > + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_AWB_GAINS`.
> > + *
> > + * TODO investigate what the different blocks mean
> > + *
> > + * Block 0 is equivalent to the awb gains block on 2.x, but blocks 1 a=
nd
> > + * 2 do not exist on 2.x.
> > + *
> > + * @header: The RkISP2 parameters block header
> > + * @gains: Gains configuration for block i
> > + */
> > +struct rkisp2_params_awb_gains {
> > +     struct v4l2_isp_params_block_header header;
> > +     struct rkisp2_isp_awb_gains gains[3];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp2_params_csm - Configuration used by Color Space Conver=
sion
> > + *
> > + * RkISP2 parameters histogram configuration block.
> > + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_CSM`.
> > + *
> > + * @header: The RkISP2 parameters block header
> > + * @coeff: color correction matrix. Values are 9-bit signed fixed-poin=
t numbers with 2 bit integer
> > + *           and 7 bit fractional part, ranging from -2 (0x100) to +1.=
992 (0x0FF). 0 is
> > + *           represented by 0x000 and a coefficient value of 1 as 0x08=
0.
> > + */
> > +struct rkisp2_params_csm {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 coeff[3][3];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp2_params_ccm - Configuration used by Color Correction M=
atrix
> > + *
> > + * RkISP2 parameters histogram configuration block.
> > + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_CCM`.
> > + *
> > + * @header: The RkISP2 parameters block header
> > + * @high_y_alpha_adj_en: Enable CCM high Y alpha adjustment (TODO figu=
re out what this does)
> > + * @coeff: color correction matrix. Values are 11-bit signed fixed-poi=
nt numbers with 4 bit integer
> > + *           and 7 bit fractional part, ranging from -8 (0x400) to +7.=
992 (0x3FF). 0 is
> > + *           represented by 0x000 and a coefficient value of 1 as 0x08=
0. The
> > + *           value is expanded 128 times (TODO figure out what this me=
ans).
> > + * @offset: Red, Green, Blue offsets for the color correction matrix. =
12-bits
> > + *       wide ranging from -4096 to 4095, but only for red; green and =
blue are 11-bit
> > + *       signed fixed-point like coeff, but are still 12-bits wide.
> > + * @y_coeff: Red, Green, Blue coefficients for RGB2Y calculation. red =
and green
> > + *        are 11-bits wide and blue is 12-bits wide. The value is expa=
nded 128 times.
> > + * @alp: CCM curve y-axis point definition for ccm input pixel's lumin=
ance.
> > + *       11-bit unsigned ranging from 0 to 1024. The value is expanded=
 128 times.
> > + * @inflection_point: Inflection point of the ccm alpha interpolation =
curve.
> > + *                 The inflection point is 2^inflection_point. Since t=
he maximum y-value is
> > + *                 1024, the maximum value of this field is expected t=
o be 10 (0xa), but the
> > + *                 documentation says 4'b10.
> > + */
> > +struct rkisp2_params_ccm {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u8 high_y_alpha_adj_en;
> > +     __u16 coeff[3][3];
> > +     __u16 offset[3];
> > +     __u16 y_coeff[3];
> > +     __u16 alp[17];
> > +     __u8 inflection_point;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp2_params_goc - Configuration used by Gamma Out correcti=
on
> > + *
> > + * RkISP2 parameters gamma out correction configuration block.
> > + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_GOC`.
> > + *
> > + * @header: The RkISP2 parameters block header
> > + * @mode: goc mode (from enum rkisp2_isp_goc_mode)
> > + * @segments: segments mode (from enum rkisp2_isp_goc_segments)
> > + * @offset: offset value of the gamma out curve
> > + * @gamma_y: gamma out curve y-axis for all color components
> > + *
> > + * The number of entries of @gamma_y depends on the segments mode. The=
 entries
> > + * are 12-bit unsigned.
> > + */
> > +struct rkisp2_params_goc {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u8 mode;
> > +     __u8 segments;
> > +     __u16 offset;
> > +     __u16 gamma_y[RKISP2_ISP_GAMMA_OUT_MAX_SEGMENTS];
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp2_params_lsc - Configuration used by Lens shading corre=
ction
> > + *
> > + * RkISP2 parameters lens shading correction configuration block.
> > + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_LSC`.
> > + *
> > + * The LSC module on the rkisp2 two tables: the 0th table and the 1th =
table.
> > + * They can be programmed independently and (somewhat) simultaneously,=
 and can be
> > + * swapped by setting a single register. Hence the UAPI here is design=
ed so
> > + * that all these components can be controlled independently.
> > + *
> > + * In the first dimension of {r,gr,gb,b}_data_tbl we can designate whi=
ch table
> > + * to write the data to. write_table is then used to signal whether to=
 write
> > + * the data, and this can be controlled for both tables. active_table =
chooses
> > + * which table to activate. set_active_table_when signals whether to s=
et the
> > + * active_table before or after programming the table. This allows
> > + * optimizations such as setting a future table in one parameter buffe=
r while
> > + * swapping before setting it.
> > + *
> > + * This design gives us more control. For example, if we want to only =
program
> > + * the 0th table without modifying the 1th table, we do not need to al=
so
> > + * populate the 1th table and we can use write_table to designate that=
 we only
> > + * want to program the 0th table. We can also swap tables without need=
ing to
> > + * re-populate the tables by setting active_table and unsetting write_=
table.
> > + *
> > + * {x,y}_sizes designates the grid of the LSC, and the table entries a=
bove
> > + * correspond to the *vertices* of the grid. {x,y}_grads control the b=
ilinear
> > + * interpolation within the grid.
> > + *
> > + * @header: The RkISP2 parameters block header
> > + * @r_data_tbl: Sample table red
> > + * @gr_data_tbl: Sample table green (red)
> > + * @gb_data_tbl: Sample table green (blue)
> > + * @b_data_tbl: Sample table blue
> > + * @write_table: Set to 1 to signal to write the respective table from=
 above
> > + * @active_table: Choose which of the two tables is active (0 or 1)
> > + * @set_active_table_when: From rkisp2_isp_set_active_table_when; swit=
ch to the
> > + *                      active table before or after programming the t=
able
> > + * @x_sizes: Sizes x
> > + * @y_sizes: Sizes y
> > + * @x_grads: Gradients x
> > + * @y_grads: Gradients y
> > + * @window_mode: From enum rkisp2_isp_lsc_config
> > + */
> > +struct rkisp2_params_lsc {
> > +     struct v4l2_isp_params_block_header header;
> > +
> > +     __u16 r_data_tbl[2][RKISP2_ISP_LSC_SAMPLES_MAX][RKISP2_ISP_LSC_SA=
MPLES_MAX];
> > +     __u16 gr_data_tbl[2][RKISP2_ISP_LSC_SAMPLES_MAX][RKISP2_ISP_LSC_S=
AMPLES_MAX];
> > +     __u16 gb_data_tbl[2][RKISP2_ISP_LSC_SAMPLES_MAX][RKISP2_ISP_LSC_S=
AMPLES_MAX];
> > +     __u16 b_data_tbl[2][RKISP2_ISP_LSC_SAMPLES_MAX][RKISP2_ISP_LSC_SA=
MPLES_MAX];
> > +     __u8 write_table[2];
> > +     __u8 active_table;
> > +     __u8 set_active_table_when;
> > +
> > +     __u16 x_sizes[RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX];
> > +     __u16 y_sizes[RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX];
> > +     __u16 x_grads[RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX];
> > +     __u16 y_grads[RKISP2_ISP_LSC_SECTORS_TBL_SIZE_MAX];
> > +
> > +     __u8 window_mode;
> > +} __attribute__((aligned(8)));
> > +
> > +/**
> > + * struct rkisp2_params_crop - Crop configuration
> > + *
> > + * RkISP2 parameters crop configuration block.
> > + * Identified by :c:type:`RKISP2_PARAMS_BLOCK_CROP`.
> > + * This block is responsible for configuring main and self path crops.=
 The
> > + * driver will automatically compute the scaling factors for the resiz=
er and
> > + * any format conversions (eg. for converting subsampling factors).
> > + *
> > + * @header: The RkISP2 parameters block header
> > + * @crop_en: Enable bits for main path and self path crop below. Comes=
 from enum rkisp2_isp_crop_en
> > + * @mp_crop: Crop window for the main path, relative to the ISP source=
 format size
> > + * @sp_crop: Crop window for the self path, relative to the ISP source=
 format size
> > + */
> > +struct rkisp2_params_crop {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u8 crop_en;
> > +     struct rkisp2_isp_window mp_crop;
> > +     struct rkisp2_isp_window sp_crop;
> > +} __attribute__((aligned(8)));
> > +
> > +#define RKISP2_PARAMS_MAX_SIZE                                       \
> > +     (sizeof(struct rkisp2_params_bls)                       +\
> > +     sizeof(struct rkisp2_params_awb_gains)                  +\
> > +     sizeof(struct rkisp2_params_csm)                        +\
> > +     sizeof(struct rkisp2_params_ccm)                        +\
> > +     sizeof(struct rkisp2_params_goc)                        +\
> > +     sizeof(struct rkisp2_params_lsc)                        +\
> > +     sizeof(struct rkisp2_params_crop))
> > +
> >  #endif /* _UAPI_RKISP2_CONFIG_H */
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videod=
ev2.h
> > index 5373dba640fa..b258422288b0 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -876,6 +876,9 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_RK_ISP1_STAT_3A        v4l2_fourcc('R', 'K', '1'=
, 'S') /* Rockchip ISP1 3A Statistics */
> >  #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS     v4l2_fourcc('R', 'K', '1'=
, 'E') /* Rockchip ISP1 3a Extensible Parameters */
> > =20
> > +/* Vendor specific - used for RKISP2 camera sub-system */
> > +#define V4L2_META_FMT_RKISP2_PARAMS  v4l2_fourcc('R', 'K', '2', 'P') /=
* Rockchip ISP2 Parameters */
> > +
> >  /* Vendor specific - used for C3_ISP */
> >  #define V4L2_META_FMT_C3ISP_PARAMS   v4l2_fourcc('C', '3', 'P', 'M') /=
* Amlogic C3 ISP Parameters */
> >  #define V4L2_META_FMT_C3ISP_STATS    v4l2_fourcc('C', '3', 'S', 'T') /=
* Amlogic C3 ISP Statistics */
