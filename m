Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54AC04DDB28;
	Thu, 17 Sep 2026 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789679547; cv=none; b=ShdPMSkI829ZzalRZeu+QRUodQoklQf5vcNUPtyzg/46Bp1x5hnNnGsCM0B8EpoIJvB7KdiKC6MlQFt9ntHsNnGyNSAK/aFI+pf2CA0mdvPlwyyOclHBe2qjTMqdXXB6M92/UWzYOXaXYinz6h6KQ10+pOjw2hDWivFgHfO/EIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789679547; c=relaxed/simple;
	bh=oGQ3oXrBpnwRHJnvdwLotJ6RYL8SUtFTM+EjGPJn/lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=flByeZ3XIR4eg7t4vBakDJOkhCl/9Fmuk6xh/5zkjdXcWoCT0HIDvDe15IerTNEx2HrPOhBzfUx+XgameONY5ccgBTWp0vi0sdSlb4trgDF2w7R9YoQGnHJRih8ZZU3RUzW0D3k5usD3QTnJeszSCrTnoPNECwQVVSO5pa+K+RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=LKaYeZhM; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="LKaYeZhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1789679519; x=1790284319; i=wahrenst@gmx.net;
	bh=EEWkA5U6VJSD/AKKo9ts9p6ItgTRZ6+jB81EYlCvsU8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=LKaYeZhMO05Gw8Cnp9QspAcYwe2nG0KJKz8tYZKJr3/x6xQbeDpszFvt6o3ubguz
	 lmuonD6NXVA6SaglF+UPR8kPhFORMCblotrXbKI5TFnBO+Hq3fYh0KH4AP7sP0hyG
	 cOOhyZWDAWoGnDAYWOmoj8u8VuM41JPSlBn7fjxd4lXt2AXM9O6of0J/9oujBcBa4
	 riVkHNT/9k/QHizdjumI6PpRNNPvaHYJ9giiSFXQ7HukhlvBgL+e2ouydRJi3Rydx
	 qKvFTlESVOHPRtW0N2zpewog+IZ/jDViTHy+ZcsbzoIWFT8vr5WAcVU0ZJ9HG3OF9
	 kj+Seio1Bne8cqC5FQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MeU0k-1wX9AI3OPk-00ZdMa; Thu, 17
 Sep 2026 23:11:59 +0200
Message-ID: <ee59ed22-c800-4945-a4cf-11d38baad688@gmx.net>
Date: Thu, 17 Sep 2026 23:11:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] platform/raspberrypi: Add VideoCore shared memory
 support
To: Jai Luthra <jai.luthra@ideasonboard.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 Dom Cobley <popcornmix@gmail.com>,
 Alexander Winkowski <dereference23@outlook.com>,
 Juerg Haefliger <juerg.haefliger@canonical.com>
References: <20260916-b4-vc-sm-cma-v4-0-476d1142b5df@ideasonboard.com>
 <20260916-b4-vc-sm-cma-v4-3-476d1142b5df@ideasonboard.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
Autocrypt: addr=wahrenst@gmx.net; keydata=
 xjMEZ1dOJBYJKwYBBAHaRw8BAQdA7H2MMG3q8FV7kAPko5vOAeaa4UA1I0hMgga1j5iYTTvN
 IFN0ZWZhbiBXYWhyZW4gPHdhaHJlbnN0QGdteC5uZXQ+wo8EExYIADcWIQT3FXg+ApsOhPDN
 NNFuwvLLwiAwigUCZ1dOJAUJB4TOAAIbAwQLCQgHBRUICQoLBRYCAwEAAAoJEG7C8svCIDCK
 JQ4BAP4Y9uuHAxbAhHSQf6UZ+hl5BDznsZVBJvH8cZe2dSZ6AQCNgoc1Lxw1tvPscuC1Jd1C
 TZomrGfQI47OiiJ3vGktBc44BGdXTiQSCisGAQQBl1UBBQEBB0B5M0B2E2XxySUQhU6emMYx
 f5QR/BrEK0hs3bLT6Hb9WgMBCAfCfgQYFggAJhYhBPcVeD4Cmw6E8M000W7C8svCIDCKBQJn
 V04kBQkHhM4AAhsMAAoJEG7C8svCIDCKJxoA/i+kqD5bphZEucrJHw77ujnOQbiKY2rLb0pE
 aHMQoiECAQDVbj827W1Yai/0XEABIr8Ci6a+/qZ8Vz6MZzL5GJosAA==
In-Reply-To: <20260916-b4-vc-sm-cma-v4-3-476d1142b5df@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:VcZDKqTxB4njfsN7OolJJBFEWuda1SvNsR+SPaFkWa+Qg4vFwEE
 t0R/CFKpDe65T1lHQjBiafw9eHqIj6NYvXWs2CEDvphwPeU49kNd5vF390vDEyBG6GwaWWI
 OOSXQ09frpiYEvQjLPxyhShMuz75dV2gJ7EZE4Vh97miFBDd6+BFzHRqJtLQRLNei3ZxUW6
 3UFHX2djOO5D2w75kJSFw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:f6G7i+oljlU=;Var8KBrzMPKkMhCfCSMDA/xJ0i4
 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
 hf+p82Cjbkow1RqMQ==

Hi Jai,

Am 16.09.26 um 16:25 schrieb Jai Luthra:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>
> Add support for the vc-sm-cma driver, to enable sharing of contiguous
> CMA memory allocations with the VideoCore VPU on Raspberry Pi. The
> driver allocates CMA-backed buffers, imports external dmabufs, and
> manages their lifetime via VCHIQ messaging to the VPU service, ensuring
> buffers are not released until both the linux userspace and the VPU
> confirm completion.
>
> VC4 can only physically address the lower 1GB of RAM and requires
> buffers to be mapped through specific uncached address aliases
> (0xC0000000). Thus, standard CMA could not be used as it has no
> mechanism to ensure allocations are visible and valid to VideoCore
> firmware, or handle cache flushes as VC4 can't see ARM's cache state.
>
> The vc-sm-cma driver bridges this gap by allocating memory via CMA on
> the ARM side and explicitly importing it into VideoCore via VCHI.
>
> This driver is primarily used by the wrapper V4L2 drivers for codec and
> ISP, where firmware running on VC4 does the actual video and image
> processing, while the linux userspace interacts with standard V4L2
> driver interfaces. For example, the ISP driver populates large
> lens-shading related tables for a particular camera setup, and uses
> vc-sm-cma to share this buffer with VC4.
>
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Dom Cobley <popcornmix@gmail.com>
> Signed-off-by: Phil Elwell <phil@raspberrypi.com>
> Signed-off-by: Alexander Winkowski <dereference23@outlook.com>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
> [clean-up for mainline and switch to xarray instead of idr]
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> ---
> Changes in v4:
> - Rebase on v7.3-rc1
> - Cut out all userspace import and VPU alloc code (from Dave)
> - Fix most of the overflow lines (> 80)
> Changes in v3:
> - Rebase on v7.2-rc1
> - Switch from kzalloc with sizeof to kzalloc_obj
> - Fix lkp bot errors with Kconfig dependencies
> ---
>   MAINTAINERS                                        |   7 +
>   drivers/platform/raspberrypi/Kconfig               |   2 +
>   drivers/platform/raspberrypi/Makefile              |   1 +
>   drivers/platform/raspberrypi/vc-sm-cma/Kconfig     |   9 +
>   drivers/platform/raspberrypi/vc-sm-cma/Makefile    |   5 +
>   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c     | 806 +++++++++++++=
++++++++
>   drivers/platform/raspberrypi/vc-sm-cma/vc_sm.h     |  64 ++
>   .../raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c         | 510 +++++++++++++
>   .../raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h         |  64 ++
>   .../platform/raspberrypi/vc-sm-cma/vc_sm_defs.h    | 298 ++++++++
>   include/linux/raspberrypi/vc_sm_cma_ioctl.h        | 110 +++
>   include/linux/raspberrypi/vc_sm_knl.h              |  76 ++
>   12 files changed, 1952 insertions(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3a19da74d00c..b887ac593088 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5626,6 +5626,13 @@ L:	netdev@vger.kernel.org
>   S:	Maintained
>   F:	drivers/net/ethernet/broadcom/tg3.*
>  =20
> +BROADCOM VIDEOCORE SHARED MEMORY DRIVER
> +M:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/raspberrypi/vc-sm-cma/*
> +F:	include/linux/raspberrypi/vc_sm_cma*
> +
>   BROADCOM VK DRIVER
>   M:	Scott Branden <scott.branden@broadcom.com>
>   R:	Broadcom internal kernel review list <bcm-kernel-feedback-list@broa=
dcom.com>
> diff --git a/drivers/platform/raspberrypi/Kconfig b/drivers/platform/ras=
pberrypi/Kconfig
> index 2c928440a47c..68a7a2d5701c 100644
> --- a/drivers/platform/raspberrypi/Kconfig
> +++ b/drivers/platform/raspberrypi/Kconfig
> @@ -48,5 +48,7 @@ config VCHIQ_CDEV
>   endif
>  =20
>   source "drivers/platform/raspberrypi/vchiq-mmal/Kconfig"
> +source "drivers/platform/raspberrypi/vc-sm-cma/Kconfig"
> +
>  =20
>   endif
> diff --git a/drivers/platform/raspberrypi/Makefile b/drivers/platform/ra=
spberrypi/Makefile
> index 2a7c9511e5d8..1980f618e218 100644
> --- a/drivers/platform/raspberrypi/Makefile
> +++ b/drivers/platform/raspberrypi/Makefile
> @@ -13,3 +13,4 @@ vchiq-objs +=3D vchiq-interface/vchiq_dev.o
>   endif
>  =20
>   obj-$(CONFIG_BCM2835_VCHIQ_MMAL)	+=3D vchiq-mmal/
> +obj-$(CONFIG_BCM_VC_SM_CMA)		+=3D vc-sm-cma/
> diff --git a/drivers/platform/raspberrypi/vc-sm-cma/Kconfig b/drivers/pl=
atform/raspberrypi/vc-sm-cma/Kconfig
> new file mode 100644
> index 000000000000..4af14a0e3458
> --- /dev/null
> +++ b/drivers/platform/raspberrypi/vc-sm-cma/Kconfig
> @@ -0,0 +1,9 @@
> +config BCM_VC_SM_CMA
> +	tristate "VideoCore Shared Memory (CMA) driver"
> +	select BCM2835_VCHIQ if HAS_DMA
> +	select DMA_SHARED_BUFFER
> +	help
> +	  Say Y here to enable the shared memory interface that
> +	  supports sharing dmabufs with VideoCore.
> +	  This operates over the VCHIQ interface to a service
> +	  running on VideoCore.
> diff --git a/drivers/platform/raspberrypi/vc-sm-cma/Makefile b/drivers/p=
latform/raspberrypi/vc-sm-cma/Makefile
> new file mode 100644
> index 000000000000..0419b9770b68
> --- /dev/null
> +++ b/drivers/platform/raspberrypi/vc-sm-cma/Makefile
> @@ -0,0 +1,5 @@
> +# SPDX-License-Identifier: GPL-2.0
> +vc-sm-cma-$(CONFIG_BCM_VC_SM_CMA) :=3D \
> +	vc_sm.o vc_sm_cma_vchi.o
> +
> +obj-$(CONFIG_BCM_VC_SM_CMA) +=3D vc-sm-cma.o
> diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c b/drivers/pl=
atform/raspberrypi/vc-sm-cma/vc_sm.c
> new file mode 100644
> index 000000000000..80c13ccd8897
> --- /dev/null
> +++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.c
> @@ -0,0 +1,806 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VideoCore Shared Memory driver using CMA.
> + *
> + * Copyright: 2018, Raspberry Pi (Trading) Ltd
> + * Dave Stevenson <dave.stevenson@raspberrypi.com>
> + *
> + * Based on vmcs_sm driver from Broadcom Corporation for some API,
> + * and taking some code for buffer allocation and dmabuf handling from
> + * videobuf2.
> + *
> + * This driver has 3 main uses:
> + * 1) Allocating buffers for the kernel or userspace that can be shared=
 with the
> + *    VPU.
> + * 2) Importing dmabufs from elsewhere for sharing with the VPU.
> + * 3) Allocating buffers for use by the VPU.
> + *
> + * In the first and second cases the native handle is a dmabuf. Releasi=
ng the
> + * resource inherently comes from releasing the dmabuf, and this will t=
rigger
> + * unmapping on the VPU. The underlying allocation and our buffer struc=
ture are
> + * retained until the VPU has confirmed that it has finished with it.
> + *
> + * For the VPU allocations the VPU is responsible for triggering the re=
lease,
> + * and therefore the released message decrements the dma_buf refcount (=
with the
> + * VPU mapping having already been marked as released).
> + */
> +
> +#include <linux/device.h>
> +#include <linux/debugfs.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/dma-buf.h>
> +#include <linux/fs.h>
> +#include <linux/list.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/raspberrypi/vchiq_arm.h>
> +#include <linux/raspberrypi/vchiq_bus.h>
> +#include <linux/raspberrypi/vc_sm_cma_ioctl.h>
> +#include <linux/raspberrypi/vc_sm_knl.h>
> +#include <linux/slab.h>
> +#include <linux/seq_file.h>
> +#include <linux/xarray.h>
> +
> +#include "vc_sm_cma_vchi.h"
> +
> +#include "vc_sm.h"
> +
> +MODULE_IMPORT_NS("DMA_BUF");
> +
> +#define DEVICE_NAME		"vcsm-cma"
> +#define DEVICE_MINOR		0
> +
> +#define VC_SM_RESOURCE_NAME_DEFAULT       "sm-host-resource"
> +
> +#define VC_SM_DIR_ROOT_NAME	"vcsm-cma"
> +#define VC_SM_STATE		"state"
> +
> +typedef int (*VC_SM_SHOW) (struct seq_file *s, void *v);
AFAIR we should avoid typedefs
> +struct sm_pde_t {
> +	VC_SM_SHOW show;          /* Debug fs function hookup. */
> +	struct dentry *dir_entry; /* Debug fs directory entry. */
> +	void *priv_data;          /* Private data */
> +};
> +
> +/* Global state information. */
> +struct sm_state_t {
> +	struct vchiq_device *device;
> +
> +	struct miscdevice misc_dev;
> +
> +	struct sm_instance *sm_handle;	/* Handle for videocore service. */
> +
> +	struct xarray kernelid_map;
> +
> +	struct mutex map_lock;          /* Global map lock. */
> +	struct list_head buffer_list;	/* List of buffer. */
> +
> +	struct dentry *dir_root;	/* Debug fs entries root. */
> +	struct sm_pde_t dir_state;	/* Debug fs entries state sub-tree. */
> +
> +	bool require_released_callback;	/* VPU will send a released msg when i=
t
> +					 * has finished with a resource.
> +					 */
> +	/* State for transactions */
> +	int restart_sys;		/* Tracks restart on interrupt. */
> +	enum vc_sm_msg_type int_action;	/* Interrupted action. */
> +	u32 int_trans_id;		/* Interrupted transaction. */
> +	struct vchiq_instance *vchiq_instance;
> +};
> +
> +struct vc_sm_dma_buf_attachment {
> +	struct device *dev;
> +	struct sg_table sg_table;
> +	struct list_head list;
> +	enum dma_data_direction	dma_dir;
> +};
> +
> +static struct sm_state_t *sm_state;
> +static int sm_inited;
> +
> +static int get_kernel_id(struct vc_sm_buffer *buffer)
> +{
> +	int handle, ret;
> +
> +	ret =3D xa_alloc(&sm_state->kernelid_map, &handle, buffer, xa_limit_31=
b,
> +		       GFP_KERNEL);
> +
> +	return ret < 0 ? ret : handle;
> +}
> +
> +static struct vc_sm_buffer *lookup_kernel_id(int handle)
> +{
> +	return xa_load(&sm_state->kernelid_map, handle);
> +}
> +
> +static void free_kernel_id(int handle)
> +{
> +	xa_erase(&sm_state->kernelid_map, handle);
> +}
> +
> +static int vc_sm_cma_seq_file_show(struct seq_file *s, void *v)
> +{
> +	struct sm_pde_t *sm_pde;
> +
> +	sm_pde =3D (struct sm_pde_t *)(s->private);
> +
> +	if (sm_pde && sm_pde->show)
> +		sm_pde->show(s, v);
> +
> +	return 0;
> +}
> +
> +static int vc_sm_cma_single_open(struct inode *inode, struct file *file=
)
> +{
> +	return single_open(file, vc_sm_cma_seq_file_show, inode->i_private);
> +}
> +
> +static const struct file_operations vc_sm_cma_debug_fs_fops =3D {
> +	.open =3D vc_sm_cma_single_open,
> +	.read =3D seq_read,
> +	.llseek =3D seq_lseek,
> +	.release =3D single_release,
> +};
> +
> +static int vc_sm_cma_global_state_show(struct seq_file *s, void *v)
> +{
> +	struct vc_sm_buffer *resource =3D NULL;
> +	int resource_count =3D 0;
> +
> +	if (!sm_state)
> +		return 0;
> +
> +	seq_printf(s, "\nVC-ServiceHandle     %p\n", sm_state->sm_handle);
Is %p really necessary?
> +
> +	/* Log all applicable mapping(s). */
> +
> +	mutex_lock(&sm_state->map_lock);
> +	seq_puts(s, "\nResources\n");
> +	if (!list_empty(&sm_state->buffer_list)) {
> +		list_for_each_entry(resource, &sm_state->buffer_list,
> +				    global_buffer_list) {
> +			resource_count++;
> +
> +			seq_printf(s, "\nResource                %p\n",
> +				   resource);
> +			seq_printf(s, "           NAME         %s\n",
> +				   resource->name);
> +			seq_printf(s, "           SIZE         %zu\n",
> +				   resource->size);
> +			seq_printf(s, "           DMABUF       %p\n",
> +				   resource->dma_buf);
> +			seq_printf(s, "           IMPORTED_DMABUF %p\n",
> +				   resource->imported_dma_buf);
> +			seq_printf(s, "           ATTACH       %p\n",
> +				   resource->attach);
> +			seq_printf(s, "           SGT          %p\n",
> +				   resource->sgt);
> +			seq_printf(s, "           DMA_ADDR     %pad\n",
> +				   &resource->dma_addr);
> +			seq_printf(s, "           VC_HANDLE     %08x\n",
> +				   resource->vc_handle);
> +			seq_printf(s, "           VC_MAPPING    %d\n",
> +				   resource->vpu_state);
> +		}
> +	}
> +	seq_printf(s, "\n\nTotal resource count:   %d\n\n", resource_count);
> +
> +	mutex_unlock(&sm_state->map_lock);
> +
> +	return 0;
> +}
> +
> +/*
> + * Adds a buffer to the private data list which tracks all the allocate=
d
> + * data.
> + */
> +static void vc_sm_add_resource(struct vc_sm_buffer *buffer)
> +{
> +	mutex_lock(&sm_state->map_lock);
> +	list_add(&buffer->global_buffer_list, &sm_state->buffer_list);
> +	mutex_unlock(&sm_state->map_lock);
> +}
> +
> +/*
> + * Cleans up imported dmabuf.
> + * Should be called with mutex held.
> + */
> +static void vc_sm_clean_up_dmabuf(struct vc_sm_buffer *buffer)
> +{
> +	/* Handle cleaning up imported dmabufs */
> +	if (buffer->sgt) {
> +		dma_buf_unmap_attachment_unlocked(buffer->attach,
> +						  buffer->sgt,
> +						  DMA_BIDIRECTIONAL);
> +		buffer->sgt =3D NULL;
> +	}
> +	if (buffer->attach) {
> +		dma_buf_detach(buffer->imported_dma_buf, buffer->attach);
> +		buffer->attach =3D NULL;
> +	}
> +}
> +
> +/*
> + * Instructs VPU to decrement the refcount on a buffer.
> + */
> +static void vc_sm_vpu_free(struct vc_sm_buffer *buffer)
> +{
> +	if (buffer->vc_handle && buffer->vpu_state =3D=3D VPU_MAPPED) {
> +		struct vc_sm_free_t free =3D { buffer->vc_handle, 0 };
> +		int status =3D vc_sm_cma_vchi_free(sm_state->sm_handle, &free,
> +					     &sm_state->int_trans_id);
> +		if (status !=3D 0 && status !=3D -EINTR) {
> +			dev_err(&sm_state->device->dev,
> +				"%s: failed to free memory on videocore (status: %u, trans_id: %u)\=
n",
> +				__func__, status, sm_state->int_trans_id);
> +		}
> +
> +		if (sm_state->require_released_callback) {
> +			/* Need to wait for the VPU to confirm the free. */
> +
> +			/* Retain a reference on this until the VPU has
> +			 * released it
> +			 */
This comment style looks strange
> +			buffer->vpu_state =3D VPU_UNMAPPING;
> +		} else {
> +			buffer->vpu_state =3D VPU_NOT_MAPPED;
> +			buffer->vc_handle =3D 0;
> +		}
> +	}
> +}
> +
> +/*
> + * Release an allocation.
> + * All refcounting is done via the dma buf object.
> + *
> + * Must be called with the mutex held. The function will either release=
 the
> + * mutex (if defering the release) or destroy it. The caller must there=
fore not
> + * reuse the buffer on return.
> + */
> +static void vc_sm_release_resource(struct vc_sm_buffer *buffer)
> +{
> +	/* We've sent the unmap request but not had the response. */
> +	if (buffer->vc_handle)
> +		goto defer;
> +	/* dmabuf still in use - we await the release */
> +	if (buffer->in_use)
> +		goto defer;
> +
> +	/* Release the allocation */
> +	if (buffer->imported_dma_buf)
> +		dma_buf_put(buffer->imported_dma_buf);
> +	else
> +		dev_err(&sm_state->device->dev, "%s: Imported dmabuf already been put=
 for buf %p\n",
> +			__func__, buffer);
> +	buffer->imported_dma_buf =3D NULL;
> +
> +	/* Free our buffer. Start by removing it from the list */
> +	mutex_lock(&sm_state->map_lock);
> +	list_del(&buffer->global_buffer_list);
> +	mutex_unlock(&sm_state->map_lock);
> +
> +	mutex_unlock(&buffer->lock);
> +	mutex_destroy(&buffer->lock);
> +
> +	kfree(buffer);
> +	return;
> +
> +defer:
> +	mutex_unlock(&buffer->lock);
> +}
> +
> +static void vc_sm_dma_buf_release(struct dma_buf *dmabuf)
> +{
> +	struct vc_sm_buffer *buffer;
> +
> +	if (!dmabuf)
> +		return;
> +
> +	buffer =3D (struct vc_sm_buffer *)dmabuf->priv;
> +
> +	mutex_lock(&buffer->lock);
> +
> +	buffer->in_use =3D false;
> +
> +	/* Unmap on the VPU */
> +	vc_sm_vpu_free(buffer);
> +
> +	/* Unmap our dma_buf object (the vc_sm_buffer remains until released
> +	 * on the VPU).
> +	 */
> +	vc_sm_clean_up_dmabuf(buffer);
> +
> +	/* buffer->lock will be destroyed by vc_sm_release_resource if finishe=
d
> +	 * with, otherwise unlocked. Do NOT unlock here.
> +	 */
> +	vc_sm_release_resource(buffer);
> +}
> +
> +/* Dma_buf operations for chaining through to an imported dma_buf */
> +
> +static
> +int vc_sm_import_dma_buf_attach(struct dma_buf *dmabuf,
> +				struct dma_buf_attachment *attachment)
> +{
> +	struct vc_sm_buffer *buf =3D dmabuf->priv;
> +
> +	return buf->imported_dma_buf->ops->attach(buf->imported_dma_buf,
> +						attachment);
> +}
> +
> +static
> +void vc_sm_import_dma_buf_detatch(struct dma_buf *dmabuf,
> +				  struct dma_buf_attachment *attachment)
> +{
> +	struct vc_sm_buffer *buf =3D dmabuf->priv;
> +
> +	buf->imported_dma_buf->ops->detach(buf->imported_dma_buf, attachment);
> +}
> +
> +static
> +struct sg_table *vc_sm_import_map_dma_buf(struct dma_buf_attachment *at=
tachment,
> +					  enum dma_data_direction direction)
> +{
> +	struct vc_sm_buffer *buf =3D attachment->dmabuf->priv;
> +
> +	return buf->imported_dma_buf->ops->map_dma_buf(attachment,
> +						     direction);
> +}
> +
> +static
> +void vc_sm_import_unmap_dma_buf(struct dma_buf_attachment *attachment,
> +				struct sg_table *table,
> +				enum dma_data_direction direction)
> +{
> +	struct vc_sm_buffer *buf =3D attachment->dmabuf->priv;
> +
> +	buf->imported_dma_buf->ops->unmap_dma_buf(attachment, table, direction=
);
> +}
> +
> +static
> +int vc_sm_import_dmabuf_mmap(struct dma_buf *dmabuf, struct vm_area_str=
uct *vma)
> +{
> +	struct vc_sm_buffer *buf =3D dmabuf->priv;
> +
> +	return buf->imported_dma_buf->ops->mmap(buf->imported_dma_buf, vma);
> +}
> +
> +static
> +int vc_sm_import_dma_buf_begin_cpu_access(struct dma_buf *dmabuf,
> +					  enum dma_data_direction direction)
> +{
> +	struct vc_sm_buffer *buf =3D dmabuf->priv;
> +	const struct dma_buf_ops *ops =3D buf->imported_dma_buf->ops;
> +
> +	return ops->begin_cpu_access(buf->imported_dma_buf, direction);
> +}
> +
> +static
> +int vc_sm_import_dma_buf_end_cpu_access(struct dma_buf *dmabuf,
> +					enum dma_data_direction direction)
> +{
> +	struct vc_sm_buffer *buf =3D dmabuf->priv;
> +
> +	return buf->imported_dma_buf->ops->end_cpu_access(buf->imported_dma_bu=
f,
> +							  direction);
> +}
> +
> +static const struct dma_buf_ops dma_buf_import_ops =3D {
> +	.map_dma_buf =3D vc_sm_import_map_dma_buf,
> +	.unmap_dma_buf =3D vc_sm_import_unmap_dma_buf,
> +	.mmap =3D vc_sm_import_dmabuf_mmap,
> +	.release =3D vc_sm_dma_buf_release,
> +	.attach =3D vc_sm_import_dma_buf_attach,
> +	.detach =3D vc_sm_import_dma_buf_detatch,
> +	.begin_cpu_access =3D vc_sm_import_dma_buf_begin_cpu_access,
> +	.end_cpu_access =3D vc_sm_import_dma_buf_end_cpu_access,
> +};
> +
> +/* Import a dma_buf to be shared with VC. */
> +static int
> +vc_sm_cma_import_dmabuf_internal(struct dma_buf *dma_buf,
> +				 int fd,
> +				 struct dma_buf **imported_buf)
> +{
> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> +	struct vc_sm_buffer *buffer =3D NULL;
> +	struct vc_sm_import import =3D { };
> +	struct vc_sm_import_result result =3D { };
> +	struct dma_buf_attachment *attach =3D NULL;
> +	struct sg_table *sgt =3D NULL;
> +	dma_addr_t dma_addr;
> +	u32 cache_alias;
> +	int ret =3D 0;
> +	int status;
> +
> +	/* Setup our allocation parameters */
> +	if (fd < 0)
> +		get_dma_buf(dma_buf);
> +	else
> +		dma_buf =3D dma_buf_get(fd);
> +
> +	if (!dma_buf)
> +		return -EINVAL;
> +
> +	attach =3D dma_buf_attach(dma_buf, &sm_state->device->dev);
> +	if (IS_ERR(attach)) {
> +		ret =3D PTR_ERR(attach);
> +		goto error;
> +	}
> +
> +	sgt =3D dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
> +	if (IS_ERR(sgt)) {
> +		ret =3D PTR_ERR(sgt);
> +		goto error;
> +	}
> +
> +	/* Verify that the address block is contiguous */
> +	if (sgt->nents !=3D 1) {
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	/* Allocate local buffer to track this allocation. */
> +	buffer =3D kzalloc(sizeof(*buffer), GFP_KERNEL);
> +	if (!buffer) {
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	import.type =3D VC_SM_ALLOC_NON_CACHED;
> +	dma_addr =3D sg_dma_address(sgt->sgl);
> +	import.addr =3D (u32)dma_addr;
> +	cache_alias =3D import.addr & 0xC0000000;
> +	if (cache_alias !=3D 0xC0000000 && cache_alias !=3D 0x80000000) {
> +		dev_err(&sm_state->device->dev, "%s: Expecting an uncached alias for =
dma_addr %pad\n",
> +			__func__, &dma_addr);
> +		/* Note that this assumes we're on >=3D Pi2, but it implies a
> +		 * DT configuration error.
> +		 */
> +		import.addr |=3D 0xC0000000;
> +	}
It would be nice to replace these magic hex values
> +	import.size =3D sg_dma_len(sgt->sgl);
> +	import.allocator =3D current->tgid;
> +	import.kernel_id =3D get_kernel_id(buffer);
> +	if (import.kernel_id < 0) {
> +		ret =3D import.kernel_id;
> +		goto error;
> +	}
> +
> +	memcpy(import.name, VC_SM_RESOURCE_NAME_DEFAULT,
> +	       sizeof(VC_SM_RESOURCE_NAME_DEFAULT));
> +
> +	/* Allocate the videocore buffer. */
> +	status =3D vc_sm_cma_vchi_import(sm_state->sm_handle, &import, &result=
,
> +				       &sm_state->int_trans_id);
> +	if (status =3D=3D -EINTR) {
> +		dev_dbg(&sm_state->device->dev,
> +			"%s: requesting import memory action restart (trans_id: %u)\n",
> +			__func__, sm_state->int_trans_id);
> +		ret =3D -ERESTARTSYS;
> +		sm_state->restart_sys =3D -EINTR;
> +		sm_state->int_action =3D VC_SM_MSG_TYPE_IMPORT;
> +		goto error;
> +	} else if (status || !result.res_handle) {
> +		dev_dbg(&sm_state->device->dev,
> +			"%s: failed to import memory on videocore (status: %u, trans_id: %u)=
\n",
> +			 __func__, status, sm_state->int_trans_id);
> +		ret =3D -ENOMEM;
> +		goto error;
> +	}
> +
> +	mutex_init(&buffer->lock);
> +	INIT_LIST_HEAD(&buffer->attachments);
> +	memcpy(buffer->name, import.name,
> +	       min(sizeof(buffer->name), sizeof(import.name) - 1));
> +
> +	/* Keep track of the buffer we created. */
> +	buffer->vc_handle =3D result.res_handle;
> +	buffer->size =3D import.size;
> +	buffer->vpu_state =3D VPU_MAPPED;
> +
> +	buffer->imported_dma_buf =3D dma_buf;
> +
> +	buffer->attach =3D attach;
> +	buffer->sgt =3D sgt;
> +	buffer->dma_addr =3D dma_addr;
> +	buffer->in_use =3D true;
> +	buffer->kernel_id =3D import.kernel_id;
> +
> +	/*
> +	 * We're done - we need to export a new dmabuf chaining through most
> +	 * functions, but enabling us to release our own internal references
> +	 * here.
> +	 */
> +	exp_info.ops =3D &dma_buf_import_ops;
> +	exp_info.size =3D import.size;
> +	exp_info.flags =3D O_RDWR;
> +	exp_info.priv =3D buffer;
> +
> +	buffer->dma_buf =3D dma_buf_export(&exp_info);
> +	if (IS_ERR(buffer->dma_buf)) {
> +		ret =3D PTR_ERR(buffer->dma_buf);
> +		goto error;
> +	}
> +
> +	vc_sm_add_resource(buffer);
> +
> +	*imported_buf =3D buffer->dma_buf;
> +
> +	return 0;
> +
> +error:
> +	if (result.res_handle) {
> +		struct vc_sm_free_t free =3D { result.res_handle, 0 };
> +
> +		vc_sm_cma_vchi_free(sm_state->sm_handle, &free,
> +				    &sm_state->int_trans_id);
> +	}
> +	free_kernel_id(import.kernel_id);
> +	kfree(buffer);
> +	if (sgt)
> +		dma_buf_unmap_attachment_unlocked(attach, sgt,
> +						  DMA_BIDIRECTIONAL);
> +	if (attach)
> +		dma_buf_detach(dma_buf, attach);
> +	dma_buf_put(dma_buf);
> +	return ret;
> +}
> +
> +static void
> +vc_sm_vpu_event(struct sm_instance *instance, struct vc_sm_result_t *re=
ply,
> +		int reply_len)
> +{
> +	switch (reply->trans_id & ~0x80000000) {
Please make this special number a define
> +	case VC_SM_MSG_TYPE_CLIENT_VERSION:
> +	{
> +		/* Acknowledge that the firmware supports the version command */
> +		sm_state->require_released_callback =3D true;
> +	}
> +	break;
> +	case VC_SM_MSG_TYPE_RELEASED:
> +	{
> +		struct vc_sm_released *release =3D (struct vc_sm_released *)reply;
> +		struct vc_sm_buffer *buffer =3D
> +					lookup_kernel_id(release->kernel_id);
> +		if (!buffer) {
> +			dev_err(&sm_state->device->dev,
> +				"%s: VC released a buffer that is already released, kernel_id %d\n"=
,
> +				__func__, release->kernel_id);
> +			break;
> +		}
> +		mutex_lock(&buffer->lock);
> +
> +		dev_dbg(&sm_state->device->dev,
> +			"%s: Released addr %08x, size %u, id %08x, mem_handle %08x\n",
> +			__func__, release->addr, release->size,
> +			release->kernel_id, release->vc_handle);
> +
> +		buffer->vc_handle =3D 0;
> +		buffer->vpu_state =3D VPU_NOT_MAPPED;
> +		free_kernel_id(release->kernel_id);
> +
> +		vc_sm_release_resource(buffer);
> +	}
> +	break;
> +	default:
> +		dev_err(&sm_state->device->dev, "%s: Unknown vpu cmd %x\n",
> +			__func__, reply->trans_id);
> +		break;
> +	}
> +}
> +
> +/* Driver load/unload functions */
> +/* Videocore connected.  */
> +static void vc_sm_connected_init(void)
> +{
> +	int ret;
> +	struct vc_sm_version version;
> +	struct vc_sm_result_t version_result;
reverse christmas tree please
> +
> +	/*
> +	 * Digging the vchiq_drv_mgmt, so low here and through a global seems
> +	 * suspicious.
> +	 *
> +	 * The callbacks should be able to pass a parameter or context.
> +	 */
> +	struct vchiq_drv_mgmt *mgmt =3D
> +		dev_get_drvdata(sm_state->device->dev.parent);
> +
> +	/*
> +	 * Initialize and create a VCHI connection for the shared memory servi=
ce
> +	 * running on videocore.
> +	 */
> +	ret =3D vchiq_initialise(&mgmt->state, &sm_state->vchiq_instance);
> +	if (ret) {
> +		dev_err(&sm_state->device->dev,
> +			"%s: failed to initialise VCHI instance (ret=3D%d)\n",
> +			__func__, ret);
> +
> +		return;
> +	}
> +
> +	ret =3D vchiq_connect(sm_state->vchiq_instance);
> +	if (ret) {
> +		dev_err(&sm_state->device->dev,
> +			"%s: failed to connect VCHI instance (ret=3D%d)\n",
> +			__func__, ret);
> +
> +		return;
> +	}
> +
> +	/* Initialize an instance of the shared memory service. */
> +	sm_state->sm_handle =3D vc_sm_cma_vchi_init(sm_state->vchiq_instance, =
1,
> +						  vc_sm_vpu_event);
> +	if (!sm_state->sm_handle) {
> +		dev_err(&sm_state->device->dev,
> +			"%s: failed to initialize shared memory service\n",
> +			__func__);
> +
> +		return;
> +	}
> +
> +	/* Create a debug fs directory entry (root). */
> +	sm_state->dir_root =3D debugfs_create_dir(VC_SM_DIR_ROOT_NAME, NULL);
> +
> +	sm_state->dir_state.show =3D &vc_sm_cma_global_state_show;
> +	sm_state->dir_state.dir_entry =3D
> +		debugfs_create_file(VC_SM_STATE, 0444, sm_state->dir_root,
> +				    &sm_state->dir_state,
> +				    &vc_sm_cma_debug_fs_fops);
> +
> +	INIT_LIST_HEAD(&sm_state->buffer_list);
> +
> +	version.version =3D 2;
> +	ret =3D vc_sm_cma_vchi_client_version(sm_state->sm_handle, &version,
> +					    &version_result,
> +					    &sm_state->int_trans_id);
> +	if (ret) {
> +		dev_err(&sm_state->device->dev,
> +			"%s: Failed to send version request %d\n", __func__,
> +			ret);
> +	}
> +
> +	/* Done! */
> +	sm_inited =3D 1;
> +}
> +
> +/* Driver loading. */
Not sure this is a benefit
> +static int bcm2835_vc_sm_cma_probe(struct vchiq_device *device)
> +{
> +	int err;
> +
> +	err =3D dma_set_mask_and_coherent(&device->dev, DMA_BIT_MASK(32));
> +	if (err) {
> +		dev_err(&device->dev, "dma_set_mask_and_coherent failed: %d\n",
> +			err);
> +		return err;
> +	}
> +
> +	sm_state =3D devm_kzalloc(&device->dev, sizeof(*sm_state), GFP_KERNEL)=
;
> +	if (!sm_state)
> +		return -ENOMEM;
> +	sm_state->device =3D device;
> +	mutex_init(&sm_state->map_lock);
> +
> +	xa_init_flags(&sm_state->kernelid_map, XA_FLAGS_ALLOC1);
> +
> +	device->dev.dma_parms =3D devm_kzalloc(&device->dev,
> +					     sizeof(*device->dev.dma_parms),
> +					     GFP_KERNEL);
> +	/* dma_set_max_seg_size checks if dma_parms is NULL. */
> +	dma_set_max_seg_size(&device->dev, 0x3FFFFFFF);
> +
> +	vchiq_add_connected_callback(device, vc_sm_connected_init);
> +	return 0;
> +}
> +
> +/* Driver unloading. */
ditto
> +static void bcm2835_vc_sm_cma_remove(struct vchiq_device *device)
> +{
> +	if (sm_inited) {
> +		misc_deregister(&sm_state->misc_dev);
> +
> +		/* Remove all proc entries. */
> +		debugfs_remove_recursive(sm_state->dir_root);
> +
> +		/* Stop the videocore shared memory service. */
> +		vc_sm_cma_vchi_stop(sm_state->vchiq_instance,
> +				    &sm_state->sm_handle);
> +	}
> +
> +	if (sm_state) {
> +		xa_destroy(&sm_state->kernelid_map);
> +
> +		/* Free the memory for the state structure. */
> +		mutex_destroy(&sm_state->map_lock);
> +	}
> +}
> +
> +/* Get an internal resource handle mapped from the external one. */
> +int vc_sm_cma_int_handle(void *handle)
According to the defintion the vc_handle is u32. Maybe we should name it=
=20
vc_sm_cma_get_vc_handle() or something similiar?
> +{
> +	struct dma_buf *dma_buf =3D (struct dma_buf *)handle;
> +	struct vc_sm_buffer *buf;
> +
> +	/* Validate we can work with this device. */
> +	if (!sm_state || !handle) {
> +		pr_err("%s: invalid input\n", __func__);
> +		return 0;
> +	}
> +
> +	buf =3D (struct vc_sm_buffer *)dma_buf->priv;
> +	return buf->vc_handle;
> +}
> +EXPORT_SYMBOL_GPL(vc_sm_cma_int_handle);
> +
> +/* Free a previously allocated shared memory handle and block. */
> +int vc_sm_cma_free(void *handle)
> +{
> +	struct dma_buf *dma_buf =3D (struct dma_buf *)handle;
> +
> +	/* Validate we can work with this device. */
> +	if (!sm_state || !handle) {
> +		pr_err("%s: invalid input\n", __func__);
> +		return -EPERM;
> +	}
> +
> +	dma_buf_put(dma_buf);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(vc_sm_cma_free);
> +
> +/* Import a dmabuf to be shared with VC. */
> +int vc_sm_cma_import_dmabuf(struct dma_buf *src_dmabuf, void **handle)
> +{
> +	struct dma_buf *new_dma_buf;
> +	int ret;
> +
> +	/* Validate we can work with this device. */
> +	if (!sm_state || !src_dmabuf || !handle) {
> +		pr_err("%s: invalid input\n", __func__);
> +		return -EPERM;
> +	}
> +
> +	ret =3D vc_sm_cma_import_dmabuf_internal(src_dmabuf, -1, &new_dma_buf)=
;
> +
> +	if (!ret) {
> +		/* Assign valid handle at this time.*/
> +		*handle =3D new_dma_buf;
> +	} else {
> +		/*
> +		 * succeeded in importing the dma_buf, but then
> +		 * failed to look it up again. How?
> +		 * Release the fd again.
> +		 */
> +		pr_err("%s: imported vc_sm_cma_get_buffer failed %d\n",
> +		       __func__, ret);
dev_err() ?
> +	}
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(vc_sm_cma_import_dmabuf);
> +
> +static struct vchiq_device_id device_id_table[] =3D {
> +	{ .name =3D "vcsm-cma" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(vchiq, device_id_table);
> +
> +static struct vchiq_driver bcm2835_vcsm_cma_driver =3D {
> +	.probe =3D bcm2835_vc_sm_cma_probe,
> +	.remove =3D bcm2835_vc_sm_cma_remove,
> +	.id_table =3D device_id_table,
> +	.driver =3D {
> +		.name =3D DEVICE_NAME,
> +		.owner =3D THIS_MODULE,
> +	},
> +};
> +
> +module_vchiq_driver(bcm2835_vcsm_cma_driver);
> +
> +MODULE_AUTHOR("Dave Stevenson");
> +MODULE_DESCRIPTION("VideoCore CMA Shared Memory Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.h b/drivers/pl=
atform/raspberrypi/vc-sm-cma/vc_sm.h
> new file mode 100644
> index 000000000000..acb00b9fbd8e
> --- /dev/null
> +++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * VideoCore Shared Memory driver using CMA.
> + *
> + * Copyright: 2018, Raspberry Pi (Trading) Ltd
> + *
> + */
> +
> +#ifndef VC_SM_H
> +#define VC_SM_H
> +
> +#include <linux/device.h>
> +#include <linux/dma-direction.h>
> +#include <linux/kref.h>
> +#include <linux/mm_types.h>
> +#include <linux/mutex.h>
> +#include <linux/sched.h>
> +#include <linux/shrinker.h>
> +#include <linux/types.h>
> +#include <linux/miscdevice.h>
> +
> +#define VC_SM_MAX_NAME_LEN 32
> +
> +enum vc_sm_vpu_mapping_state {
> +	VPU_NOT_MAPPED,
> +	VPU_MAPPED,
> +	VPU_UNMAPPING
> +};
> +
> +struct vc_sm_buffer {
> +	struct list_head global_buffer_list;	/* Global list of buffers. */
> +
> +	/* Index in the kernel_id idr so that we can find the
> +	 * mmal_msg_context again when servicing the VCHI reply.
> +	 */
> +	int kernel_id;
> +
> +	size_t size;
> +
> +	/* Lock over all the following state for this buffer */
> +	struct mutex lock;
> +	struct list_head attachments;
> +
> +	char name[VC_SM_MAX_NAME_LEN];
> +
> +	bool in_use:1;   /* Kernel is still using this resource */
> +
> +	enum vc_sm_vpu_mapping_state vpu_state;
> +	u32 vc_handle;	/* VideoCore handle for this buffer */
> +
> +	/* DMABUF related fields */
> +	struct dma_buf *dma_buf;
> +	dma_addr_t dma_addr;
> +	void *cookie;
> +
> +	struct vc_sm_privdata_t *private;
> +
> +	struct dma_buf *imported_dma_buf;
> +	struct dma_buf_attachment *attach;
> +	struct sg_table *sgt;
> +};
> +
> +#endif
> diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c b/d=
rivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c
> new file mode 100644
> index 000000000000..9a2fc4df1603
> --- /dev/null
> +++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.c
> @@ -0,0 +1,510 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * VideoCore Shared Memory CMA allocator
> + *
> + * Copyright: 2018, Raspberry Pi (Trading) Ltd
> + * Copyright 2011-2012 Broadcom Corporation.  All rights reserved.
> + *
> + * Based on vmcs_sm driver from Broadcom Corporation.
> + *
> + */
> +
> +#include <linux/completion.h>
> +#include <linux/dev_printk.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/semaphore.h>
> +#include <linux/slab.h>
> +#include <linux/raspberrypi/vchiq_arm.h>
> +#include <linux/types.h>
> +
> +#include "vc_sm_cma_vchi.h"
> +
> +#define VC_SM_VER  1
> +#define VC_SM_MIN_VER 0
> +
> +/* Command blocks come from a pool */
> +#define SM_MAX_NUM_CMD_RSP_BLKS 32
> +
> +/* The number of supported connections */
> +#define SM_MAX_NUM_CONNECTIONS 3
> +
> +struct sm_cmd_rsp_blk {
> +	struct list_head head;	/* To create lists */
> +	/* To be signaled when the response is there */
> +	struct completion cmplt;
> +
> +	u32 id;
> +	u16 length;
> +
> +	u8 msg[VC_SM_MAX_MSG_LEN];
> +
> +	uint32_t wait:1;
> +	uint32_t sent:1;
> +	uint32_t alloc:1;
> +
> +};
> +
> +struct sm_instance {
> +	u32 num_connections;
> +	unsigned int service_handle[SM_MAX_NUM_CONNECTIONS];
> +	struct task_struct *io_thread;
> +	struct completion io_cmplt;
> +
> +	vpu_event_cb vpu_event;
> +
> +	/* Mutex over the following lists */
> +	struct mutex lock;
> +	u32 trans_id;
> +	struct list_head cmd_list;
> +	struct list_head rsp_list;
> +	struct list_head dead_list;
> +
> +	struct sm_cmd_rsp_blk free_blk[SM_MAX_NUM_CMD_RSP_BLKS];
> +
> +	/* Mutex over the free_list */
> +	struct mutex free_lock;
> +	struct list_head free_list;
> +
> +	struct semaphore free_sema;
> +	struct vchiq_instance *vchiq_instance;
> +};
> +
> +static int
> +bcm2835_vchi_msg_queue(struct vchiq_instance *vchiq_instance,
> +		       unsigned int handle, void *data, unsigned int size)
> +{
> +	return vchiq_queue_kernel_message(vchiq_instance, handle, data, size);
> +}
> +
> +static struct
> +sm_cmd_rsp_blk *vc_vchi_cmd_create(struct sm_instance *instance,
> +				   enum vc_sm_msg_type id, void *msg,
> +				   u32 size, int wait)
> +{
> +	struct sm_cmd_rsp_blk *blk;
> +	struct vc_sm_msg_hdr_t *hdr;
> +
> +	if (down_interruptible(&instance->free_sema)) {
> +		blk =3D kmalloc_obj(*blk, GFP_KERNEL);
> +		if (!blk)
> +			return NULL;
> +
> +		blk->alloc =3D 1;
> +		init_completion(&blk->cmplt);
> +	} else {
> +		mutex_lock(&instance->free_lock);
> +		blk =3D
> +		    list_first_entry(&instance->free_list,
> +				     struct sm_cmd_rsp_blk, head);
> +		list_del(&blk->head);
> +		mutex_unlock(&instance->free_lock);
> +	}
> +
> +	blk->sent =3D 0;
> +	blk->wait =3D wait;
> +	blk->length =3D sizeof(*hdr) + size;
> +
> +	hdr =3D (struct vc_sm_msg_hdr_t *)blk->msg;
> +	hdr->type =3D id;
> +	mutex_lock(&instance->lock);
> +	instance->trans_id++;
> +	/*
> +	 * Retain the top bit for identifying asynchronous events, or VPU cmds=
.
> +	 */
> +	instance->trans_id &=3D ~0x80000000;
> +	hdr->trans_id =3D instance->trans_id;
> +	blk->id =3D instance->trans_id;
> +	mutex_unlock(&instance->lock);
> +
> +	if (size)
> +		memcpy(hdr->body, msg, size);
> +
> +	return blk;
> +}
> +
> +static void
> +vc_vchi_cmd_delete(struct sm_instance *instance, struct sm_cmd_rsp_blk =
*blk)
> +{
> +	if (blk->alloc) {
> +		kfree(blk);
> +		return;
> +	}
> +
> +	mutex_lock(&instance->free_lock);
> +	list_add(&blk->head, &instance->free_list);
> +	mutex_unlock(&instance->free_lock);
> +	up(&instance->free_sema);
> +}
> +
> +static void vc_sm_cma_vchi_rx_ack(struct sm_instance *instance,
> +				  struct sm_cmd_rsp_blk *cmd,
> +				  struct vc_sm_result_t *reply,
> +				  u32 reply_len)
> +{
> +	mutex_lock(&instance->lock);
> +	list_for_each_entry(cmd,
> +			    &instance->rsp_list,
> +			    head) {
> +		if (cmd->id =3D=3D reply->trans_id)
> +			break;
> +	}
> +	mutex_unlock(&instance->lock);
> +
> +	if (&cmd->head =3D=3D &instance->rsp_list) {
> +		dev_err(instance->vchiq_instance->state->dev,
> +			"%s: received response %u, throw away...", __func__,
> +			reply->trans_id);
> +	} else if (reply_len > sizeof(cmd->msg)) {
> +		dev_err(instance->vchiq_instance->state->dev,
> +			"%s: reply too big (%u) %u, throw away...", __func__,
> +			reply_len, reply->trans_id);
> +	} else {
> +		memcpy(cmd->msg, reply,
> +		       reply_len);
> +		complete(&cmd->cmplt);
> +	}
> +}
> +
> +static int vc_sm_cma_vchi_videocore_io(void *arg)
> +{
> +	struct sm_instance *instance =3D arg;
> +	struct sm_cmd_rsp_blk *cmd =3D NULL, *cmd_tmp;
> +	struct vc_sm_result_t *reply;
> +	struct vchiq_header *header;
> +	s32 status;
bcm2835_vchi_msg_queue / vchiq_queue_kernel_message returns an int
> +	int svc_use =3D 1;
> +
> +	while (1) {
> +		if (svc_use)
> +			vchiq_release_service(instance->vchiq_instance,
> +					      instance->service_handle[0]);
> +		svc_use =3D 0;
> +
> +		if (wait_for_completion_interruptible(&instance->io_cmplt))
> +			continue;
> +		vchiq_use_service(instance->vchiq_instance,
> +				  instance->service_handle[0]);
> +		svc_use =3D 1;
> +
> +		do {
> +			/*
> +			 * Get new command and move it to response list
> +			 */
> +			mutex_lock(&instance->lock);
> +			if (list_empty(&instance->cmd_list)) {
> +				/* no more commands to process */
> +				mutex_unlock(&instance->lock);
> +				break;
> +			}
> +			cmd =3D list_first_entry(&instance->cmd_list,
> +					       struct sm_cmd_rsp_blk, head);
> +			list_move(&cmd->head, &instance->rsp_list);
> +			cmd->sent =3D 1;
> +			mutex_unlock(&instance->lock);
> +			/* Send the command */
> +			status =3D bcm2835_vchi_msg_queue(instance->vchiq_instance,
> +							instance->service_handle[0],
> +							cmd->msg, cmd->length);
> +			if (status) {
> +				dev_err(instance->vchiq_instance->state->dev,
> +					"%s: failed to queue message (%d)",
> +					__func__, status);
> +			}
> +
> +			/* If no reply is needed then we're done */
> +			if (!cmd->wait) {
> +				mutex_lock(&instance->lock);
> +				list_del(&cmd->head);
> +				mutex_unlock(&instance->lock);
> +				vc_vchi_cmd_delete(instance, cmd);
> +				continue;
> +			}
> +
> +			if (status) {
> +				complete(&cmd->cmplt);
> +				continue;
> +			}
> +
> +		} while (1);
> +
> +		while ((header =3D vchiq_msg_hold(instance->vchiq_instance,
> +						instance->service_handle[0]))) {
> +			reply =3D (struct vc_sm_result_t *)header->data;
> +			if (reply->trans_id & 0x80000000) {
> +				/* Async event or cmd from the VPU */
> +				if (instance->vpu_event)
> +					instance->vpu_event(instance, reply,
> +							    header->size);
> +			} else {
> +				vc_sm_cma_vchi_rx_ack(instance, cmd, reply,
> +						      header->size);
> +			}
> +
> +			vchiq_release_message(instance->vchiq_instance,
> +					      instance->service_handle[0],
> +					      header);
> +		}
> +
> +		/* Go through the dead list and free them */
> +		mutex_lock(&instance->lock);
> +		list_for_each_entry_safe(cmd, cmd_tmp, &instance->dead_list,
> +					 head) {
> +			list_del(&cmd->head);
> +			vc_vchi_cmd_delete(instance, cmd);
> +		}
> +		mutex_unlock(&instance->lock);
> +	}
> +
> +	return 0;
> +}
> +
> +static int vc_sm_cma_vchi_callback(struct vchiq_instance *vchiq_instanc=
e,
> +				   enum vchiq_reason reason,
> +				   struct vchiq_header *header,
> +				   unsigned int handle, void *userdata,
> +				   void __user *cb_userdata)
> +{
> +	struct sm_instance *instance =3D
> +		vchiq_get_service_userdata(vchiq_instance, handle);
> +
> +	switch (reason) {
> +	case VCHIQ_MESSAGE_AVAILABLE:
> +		vchiq_msg_queue_push(vchiq_instance, handle, header);
> +		complete(&instance->io_cmplt);
> +		break;
> +
> +	case VCHIQ_SERVICE_CLOSED:
> +		dev_info(instance->vchiq_instance->state->dev,
> +			 "%s: service CLOSED!!", __func__);
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +struct sm_instance *vc_sm_cma_vchi_init(struct vchiq_instance *vchiq_in=
stance,
> +					unsigned int num_connections,
> +					vpu_event_cb vpu_event)
> +{
> +	u32 i;
> +	struct sm_instance *instance;
> +	int status;
reverse christmas tree please
> +
> +	if (num_connections > SM_MAX_NUM_CONNECTIONS) {
> +		dev_err(vchiq_instance->state->dev,
> +			"%s: unsupported number of connections %u (max=3D%u)",
> +			__func__, num_connections, SM_MAX_NUM_CONNECTIONS);
> +
> +		return NULL;
> +	}
> +	/* Allocate memory for this instance */
> +	instance =3D kzalloc(sizeof(*instance), GFP_KERNEL);
Shouldn't we check the result?
> +
> +	/* Misc initialisations */
> +	mutex_init(&instance->lock);
> +	init_completion(&instance->io_cmplt);
> +	INIT_LIST_HEAD(&instance->cmd_list);
> +	INIT_LIST_HEAD(&instance->rsp_list);
> +	INIT_LIST_HEAD(&instance->dead_list);
> +	INIT_LIST_HEAD(&instance->free_list);
> +	sema_init(&instance->free_sema, SM_MAX_NUM_CMD_RSP_BLKS);
> +	mutex_init(&instance->free_lock);
> +	for (i =3D 0; i < SM_MAX_NUM_CMD_RSP_BLKS; i++) {
> +		init_completion(&instance->free_blk[i].cmplt);
> +		list_add(&instance->free_blk[i].head, &instance->free_list);
> +	}
> +
> +	instance->vchiq_instance =3D vchiq_instance;
> +
> +	/* Open the VCHI service connections */
> +	instance->num_connections =3D num_connections;
> +	for (i =3D 0; i < num_connections; i++) {
> +		struct vchiq_service_params_kernel params =3D {
> +			.version =3D VC_SM_VER,
> +			.version_min =3D VC_SM_MIN_VER,
> +			.fourcc =3D VCHIQ_MAKE_FOURCC('S', 'M', 'E', 'M'),
> +			.callback =3D vc_sm_cma_vchi_callback,
> +			.userdata =3D instance,
> +		};
> +
> +		status =3D vchiq_open_service(vchiq_instance, &params,
> +					    &instance->service_handle[i]);
> +		if (status) {
> +			dev_err(vchiq_instance->state->dev,
> +				"%s: failed to open VCHI service (%d)",
> +				__func__, status);
> +
> +			goto err_close_services;
> +		}
> +	}
> +	/* Create the thread which takes care of all io to/from videoocore. */
s/videoocore/videocore
> +	instance->io_thread =3D kthread_create(&vc_sm_cma_vchi_videocore_io,
> +					     (void *)instance, "SMIO");
It would be nice to make the thread name to give a hint this is related=20
to videocore. Also lowercase would be nice in order to align with vchiq.
> +	if (!instance->io_thread) {
> +		dev_err(vchiq_instance->state->dev,
> +			"%s: failed to create SMIO thread", __func__);
> +
> +		goto err_close_services;
> +	}
> +	instance->vpu_event =3D vpu_event;
> +	set_user_nice(instance->io_thread, -10);
> +	wake_up_process(instance->io_thread);
> +
> +	return instance;
> +
> +err_close_services:
> +	for (i =3D 0; i < instance->num_connections; i++) {
> +		if (instance->service_handle[i])
> +			vchiq_close_service(vchiq_instance,
> +					    instance->service_handle[i]);
> +	}
> +	kfree(instance);
> +
> +	return NULL;
> +}
> +
> +int vc_sm_cma_vchi_stop(struct vchiq_instance *vchiq_instance,
> +			struct sm_instance **handle)
> +{
> +	struct sm_instance *instance;
> +	u32 i;
> +
> +	if (!handle) {
> +		pr_err("%s: invalid pointer to handle %p", __func__, handle);
%p isn't helpful here
> +		goto lock;
> +	}
> +
> +	if (!*handle) {
> +		pr_err("%s: invalid handle %p", __func__, *handle);
> +		goto lock;
> +	}
> +
> +	instance =3D *handle;
> +
> +	/* Close all VCHI service connections */
> +	for (i =3D 0; i < instance->num_connections; i++) {
> +		vchiq_use_service(vchiq_instance, instance->service_handle[i]);
> +		vchiq_close_service(vchiq_instance,
> +				    instance->service_handle[i]);
> +	}
> +
> +	kfree(instance);
> +
> +	*handle =3D NULL;
> +	return 0;
> +
> +lock:
> +	return -EINVAL;
> +}
> +
> +static int vc_sm_cma_vchi_send_msg(struct sm_instance *handle,
> +				   enum vc_sm_msg_type msg_id, void *msg,
> +				   u32 msg_size, void *result, u32 result_size,
> +				   u32 *cur_trans_id, u8 wait_reply)
> +{
> +	int status =3D 0;
> +	struct sm_instance *instance =3D handle;
> +	struct sm_cmd_rsp_blk *cmd_blk;
reverse christmas tree
> +
> +	if (!handle) {
> +		pr_err("%s: invalid handle", __func__);
> +		return -EINVAL;
> +	}
> +	if (!msg) {
> +		dev_err(instance->vchiq_instance->state->dev,
> +			"%s: invalid msg pointer", __func__);
> +		return -EINVAL;
> +	}
> +
> +	cmd_blk =3D
> +	    vc_vchi_cmd_create(instance, msg_id, msg, msg_size, wait_reply);
> +	if (!cmd_blk) {
> +		dev_err(instance->vchiq_instance->state->dev,
> +			"[%s]: failed to allocate global tracking resource",
> +			__func__);
> +		return -ENOMEM;
> +	}
> +
> +	if (cur_trans_id)
> +		*cur_trans_id =3D cmd_blk->id;
> +
> +	mutex_lock(&instance->lock);
> +	list_add_tail(&cmd_blk->head, &instance->cmd_list);
> +	mutex_unlock(&instance->lock);
> +	complete(&instance->io_cmplt);
> +
> +	if (!wait_reply)
> +		/* We're done */
> +		return 0;
> +
> +	/* Wait for the response */
> +	if (wait_for_completion_interruptible(&cmd_blk->cmplt)) {
> +		mutex_lock(&instance->lock);
> +		if (!cmd_blk->sent) {
> +			list_del(&cmd_blk->head);
> +			mutex_unlock(&instance->lock);
> +			vc_vchi_cmd_delete(instance, cmd_blk);
> +			return -ENXIO;
> +		}
> +
> +		list_move(&cmd_blk->head, &instance->dead_list);
> +		mutex_unlock(&instance->lock);
> +		complete(&instance->io_cmplt);
> +		return -EINTR;	/* We're done */
> +	}
> +
> +	if (result && result_size) {
> +		memcpy(result, cmd_blk->msg, result_size);
> +	} else {
> +		struct vc_sm_result_t *res =3D
> +			(struct vc_sm_result_t *)cmd_blk->msg;
> +		status =3D (res->success =3D=3D 0) ? 0 : -ENXIO;
> +	}
> +
> +	mutex_lock(&instance->lock);
> +	list_del(&cmd_blk->head);
> +	mutex_unlock(&instance->lock);
> +	vc_vchi_cmd_delete(instance, cmd_blk);
> +	return status;
> +}
> +
> +int vc_sm_cma_vchi_free(struct sm_instance *handle, struct vc_sm_free_t=
 *msg,
> +			u32 *cur_trans_id)
> +{
> +	return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_FREE,
> +				   msg, sizeof(*msg), 0, 0, cur_trans_id, 0);
> +}
> +
> +int vc_sm_cma_vchi_import(struct sm_instance *handle, struct vc_sm_impo=
rt *msg,
> +			  struct vc_sm_import_result *result, u32 *cur_trans_id)
> +{
> +	return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_IMPORT,
> +				   msg, sizeof(*msg), result, sizeof(*result),
> +				   cur_trans_id, 1);
> +}
> +
> +int vc_sm_cma_vchi_client_version(struct sm_instance *handle,
> +				  struct vc_sm_version *msg,
> +				  struct vc_sm_result_t *result,
> +				  u32 *cur_trans_id)
> +{
> +	return vc_sm_cma_vchi_send_msg(handle, VC_SM_MSG_TYPE_CLIENT_VERSION,
> +				   msg, sizeof(*msg), NULL, 0,
> +				   cur_trans_id, 0);
> +}
> +
> +int vc_sm_vchi_client_vc_mem_req_reply(struct sm_instance *handle,
> +				       struct vc_sm_vc_mem_request_result *msg,
> +				       uint32_t *cur_trans_id)
> +{
> +	return vc_sm_cma_vchi_send_msg(handle,
> +				       VC_SM_MSG_TYPE_VC_MEM_REQUEST_REPLY,
> +				       msg, sizeof(*msg), 0, 0, cur_trans_id,
> +				       0);
> +}
> diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h b/d=
rivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h
> new file mode 100644
> index 000000000000..6b6fa2837c9f
> --- /dev/null
> +++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_cma_vchi.h
> @@ -0,0 +1,64 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * VideoCore Shared Memory CMA allocator
> + *
> + * Copyright: 2018, Raspberry Pi (Trading) Ltd
> + * Copyright 2011-2012 Broadcom Corporation.  All rights reserved.
> + *
> + * Based on vmcs_sm driver from Broadcom Corporation.
> + *
> + */
> +
> +#ifndef __VC_SM_CMA_VCHI_H__INCLUDED__
> +#define __VC_SM_CMA_VCHI_H__INCLUDED__
> +
> +#include <linux/raspberrypi/vchiq.h>
> +
> +#include "vc_sm_defs.h"
> +
> +/*
> + * Forward declare.
> + */
> +struct sm_instance;
> +
> +typedef void (*vpu_event_cb)(struct sm_instance *instance,
> +			     struct vc_sm_result_t *reply, int reply_len);
> +
> +/*
> + * Initialize the shared memory service, opens up vchi connection to ta=
lk to it.
> + */
> +struct sm_instance *vc_sm_cma_vchi_init(struct vchiq_instance *vchi_ins=
tance,
> +					unsigned int num_connections,
> +					vpu_event_cb vpu_event);
> +
> +/*
> + * Terminates the shared memory service.
> + */
> +int vc_sm_cma_vchi_stop(struct vchiq_instance *vchi_instance,
> +			struct sm_instance **handle);
> +
> +/*
> + * Ask the shared memory service to free up some memory that was previo=
usly
> + * allocated by the vc_sm_cma_vchi_alloc function call.
> + */
> +int vc_sm_cma_vchi_free(struct sm_instance *handle, struct vc_sm_free_t=
 *msg,
> +			u32 *cur_trans_id);
> +
> +/*
> + * Import a contiguous block of memory and wrap it in a GPU MEM_HANDLE_=
T.
> + */
> +int vc_sm_cma_vchi_import(struct sm_instance *handle, struct vc_sm_impo=
rt *msg,
> +			  struct vc_sm_import_result *result,
> +			  u32 *cur_trans_id);
> +
> +int vc_sm_cma_vchi_client_version(struct sm_instance *handle,
> +				  struct vc_sm_version *msg,
> +				  struct vc_sm_result_t *result,
> +				  u32 *cur_trans_id);
> +
> +int vc_sm_vchi_client_vc_mem_req_reply(struct sm_instance *handle,
> +				       struct vc_sm_vc_mem_request_result *msg,
> +				       uint32_t *cur_trans_id);
> +
> +#endif /* __VC_SM_CMA_VCHI_H__INCLUDED__ */
> diff --git a/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_defs.h b/drive=
rs/platform/raspberrypi/vc-sm-cma/vc_sm_defs.h
> new file mode 100644
> index 000000000000..7cabbadfe7ca
> --- /dev/null
> +++ b/drivers/platform/raspberrypi/vc-sm-cma/vc_sm_defs.h
> @@ -0,0 +1,298 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * VideoCore Shared Memory CMA allocator
> + *
> + * Copyright: 2018, Raspberry Pi (Trading) Ltd
> + *
> + * Based on vc_sm_defs.h from the vmcs_sm driver Copyright Broadcom Cor=
poration.
> + * All IPC messages are copied across to this file, even if the vc-sm-c=
ma
> + * driver is not currently using them.
> + *
> + **********************************************************************=
******
> + */
> +
> +#ifndef __VC_SM_DEFS_H__INCLUDED__
> +#define __VC_SM_DEFS_H__INCLUDED__
> +
> +#include <linux/types.h>
> +
> +/* Maximum message length */
> +#define VC_SM_MAX_MSG_LEN (sizeof(union vc_sm_msg_union_t) + \
> +	sizeof(struct vc_sm_msg_hdr_t))
> +#define VC_SM_MAX_RSP_LEN (sizeof(union vc_sm_msg_union_t))
> +
> +/* Resource name maximum size */
> +#define VC_SM_RESOURCE_NAME 32
> +
> +/*
> + * Version to be reported to the VPU
> + * VPU assumes 0 (aka 1) which does not require the released callback, =
nor
> + * expect the client to handle VC_MEM_REQUESTS.
> + * Version 2 requires the released callback, and must support VC_MEM_RE=
QUESTS.
> + */
> +#define VC_SM_PROTOCOL_VERSION	2
> +
> +enum vc_sm_msg_type {
> +	/* Message types supported for HOST->VC direction */
> +
> +	/* Allocate shared memory block */
> +	VC_SM_MSG_TYPE_ALLOC,
> +	/* Lock allocated shared memory block */
> +	VC_SM_MSG_TYPE_LOCK,
> +	/* Unlock allocated shared memory block */
> +	VC_SM_MSG_TYPE_UNLOCK,
> +	/* Unlock allocated shared memory block, do not answer command */
> +	VC_SM_MSG_TYPE_UNLOCK_NOANS,
> +	/* Free shared memory block */
> +	VC_SM_MSG_TYPE_FREE,
> +	/* Resize a shared memory block */
> +	VC_SM_MSG_TYPE_RESIZE,
> +	/* Walk the allocated shared memory block(s) */
> +	VC_SM_MSG_TYPE_WALK_ALLOC,
> +
> +	/* A previously applied action will need to be reverted */
> +	VC_SM_MSG_TYPE_ACTION_CLEAN,
> +
> +	/*
> +	 * Import a physical address and wrap into a MEM_HANDLE_T.
> +	 * Release with VC_SM_MSG_TYPE_FREE.
> +	 */
> +	VC_SM_MSG_TYPE_IMPORT,
> +	/*
> +	 *Tells VC the protocol version supported by this client.
> +	 * 2 supports the async/cmd messages from the VPU for final release
> +	 * of memory, and for VC allocations.
> +	 */
> +	VC_SM_MSG_TYPE_CLIENT_VERSION,
> +	/* Response to VC request for memory */
> +	VC_SM_MSG_TYPE_VC_MEM_REQUEST_REPLY,
> +
> +	/*
> +	 * Asynchronous/cmd messages supported for VC->HOST direction.
> +	 * Signalled by setting the top bit in vc_sm_result_t trans_id.
> +	 */
> +
> +	/*
> +	 * VC has finished with an imported memory allocation.
> +	 * Release any Linux reference counts on the underlying block.
> +	 */
> +	VC_SM_MSG_TYPE_RELEASED,
> +	/* VC request for memory */
> +	VC_SM_MSG_TYPE_VC_MEM_REQUEST,
> +
> +	VC_SM_MSG_TYPE_MAX
> +};
> +
> +/* Type of memory to be allocated */
> +enum vc_sm_alloc_type_t {
> +	VC_SM_ALLOC_CACHED,
> +	VC_SM_ALLOC_NON_CACHED,
> +};
> +
> +/* Message header for all messages in HOST->VC direction */
> +struct vc_sm_msg_hdr_t {
> +	u32 type;
> +	u32 trans_id;
> +	u8 body[];
> +};
> +
> +/* Request to allocate memory (HOST->VC) */
> +struct vc_sm_alloc_t {
> +	/* type of memory to allocate */
> +	enum vc_sm_alloc_type_t type;
> +	/* byte amount of data to allocate per unit */
> +	u32 base_unit;
> +	/* number of unit to allocate */
> +	u32 num_unit;
> +	/* alignment to be applied on allocation */
> +	u32 alignment;
> +	/* identity of who allocated this block */
> +	u32 allocator;
> +	/* resource name (for easier tracking on vc side) */
> +	char name[VC_SM_RESOURCE_NAME];
> +
> +};
> +
> +/* Result of a requested memory allocation (VC->HOST) */
> +struct vc_sm_alloc_result_t {
> +	/* Transaction identifier */
> +	u32 trans_id;
> +
> +	/* Resource handle */
> +	u32 res_handle;
> +	/* Pointer to resource buffer */
> +	u32 res_mem;
> +	/* Resource base size (bytes) */
> +	u32 res_base_size;
> +	/* Resource number */
> +	u32 res_num;
> +
> +};
> +
> +/* Request to free a previously allocated memory (HOST->VC) */
> +struct vc_sm_free_t {
> +	/* Resource handle (returned from alloc) */
> +	u32 res_handle;
> +	/* Resource buffer (returned from alloc) */
> +	u32 res_mem;
> +
> +};
> +
> +/* Request to lock a previously allocated memory (HOST->VC) */
> +struct vc_sm_lock_unlock_t {
> +	/* Resource handle (returned from alloc) */
> +	u32 res_handle;
> +	/* Resource buffer (returned from alloc) */
> +	u32 res_mem;
> +
> +};
> +
> +/* Request to resize a previously allocated memory (HOST->VC) */
> +struct vc_sm_resize_t {
> +	/* Resource handle (returned from alloc) */
> +	u32 res_handle;
> +	/* Resource buffer (returned from alloc) */
> +	u32 res_mem;
> +	/* Resource *new* size requested (bytes) */
> +	u32 res_new_size;
> +
> +};
> +
> +/* Result of a requested memory lock (VC->HOST) */
> +struct vc_sm_lock_result_t {
> +	/* Transaction identifier */
> +	u32 trans_id;
> +
> +	/* Resource handle */
> +	u32 res_handle;
> +	/* Pointer to resource buffer */
> +	u32 res_mem;
> +	/*
> +	 * Pointer to former resource buffer if the memory
> +	 * was reallocated
> +	 */
> +	u32 res_old_mem;
> +
> +};
> +
> +/* Generic result for a request (VC->HOST) */
> +struct vc_sm_result_t {
> +	/* Transaction identifier */
> +	u32 trans_id;
> +
> +	s32 success;
> +
> +};
> +
> +/* Request to revert a previously applied action (HOST->VC) */
> +struct vc_sm_action_clean_t {
> +	/* Action of interest */
> +	enum vc_sm_msg_type res_action;
> +	/* Transaction identifier for the action of interest */
> +	u32 action_trans_id;
> +
> +};
> +
> +/* Request to remove all data associated with a given allocator (HOST->=
VC) */
> +struct vc_sm_free_all_t {
> +	/* Allocator identifier */
> +	u32 allocator;
> +};
> +
> +/* Request to import memory (HOST->VC) */
> +struct vc_sm_import {
> +	/* type of memory to allocate */
> +	enum vc_sm_alloc_type_t type;
> +	/* pointer to the VC (ie physical) address of the allocated memory */
> +	u32 addr;
> +	/* size of buffer */
> +	u32 size;
> +	/* opaque handle returned in RELEASED messages */
> +	u32 kernel_id;
> +	/* Allocator identifier */
> +	u32 allocator;
> +	/* resource name (for easier tracking on vc side) */
> +	char     name[VC_SM_RESOURCE_NAME];
> +};
> +
> +/* Result of a requested memory import (VC->HOST) */
> +struct vc_sm_import_result {
> +	/* Transaction identifier */
> +	u32 trans_id;
> +
> +	/* Resource handle */
> +	u32 res_handle;
> +};
> +
> +/* Notification that VC has finished with an allocation (VC->HOST) */
> +struct vc_sm_released {
> +	/* cmd type / trans_id */
> +	u32 cmd;
> +
> +	/* pointer to the VC (ie physical) address of the allocated memory */
> +	u32 addr;
> +	/* size of buffer */
> +	u32 size;
> +	/* opaque handle returned in RELEASED messages */
> +	u32 kernel_id;
> +	u32 vc_handle;
> +};
> +
> +/*
> + * Client informing VC as to the protocol version it supports.
> + * >=3D2 requires the released callback, and supports VC asking for mem=
ory.
> + * Failure means that the firmware doesn't support this call, and there=
fore the
> + * client should either fail, or NOT rely on getting the released callb=
ack.
> + */
> +struct vc_sm_version {
> +	u32 version;
> +};
> +
> +/* Request FROM VideoCore for some memory */
> +struct vc_sm_vc_mem_request {
> +	/* cmd type */
> +	u32 cmd;
> +
> +	/* trans_id (from VPU) */
> +	u32 trans_id;
> +	/* size of buffer */
> +	u32 size;
> +	/* alignment of buffer */
> +	u32 align;
> +	/* resource name (for easier tracking) */
> +	char     name[VC_SM_RESOURCE_NAME];
> +	/* VPU handle for the resource */
> +	u32 vc_handle;
> +};
> +
> +/* Response from the kernel to provide the VPU with some memory */
> +struct vc_sm_vc_mem_request_result {
> +	/* Transaction identifier for the VPU */
> +	u32 trans_id;
> +	/* pointer to the physical address of the allocated memory */
> +	u32 addr;
> +	/* opaque handle returned in RELEASED messages */
> +	u32 kernel_id;
> +};
> +
> +/* Union of ALL messages */
> +union vc_sm_msg_union_t {
> +	struct vc_sm_alloc_t alloc;
> +	struct vc_sm_alloc_result_t alloc_result;
> +	struct vc_sm_free_t free;
> +	struct vc_sm_lock_unlock_t lock_unlock;
> +	struct vc_sm_action_clean_t action_clean;
> +	struct vc_sm_resize_t resize;
> +	struct vc_sm_lock_result_t lock_result;
> +	struct vc_sm_result_t result;
> +	struct vc_sm_free_all_t free_all;
> +	struct vc_sm_import import;
> +	struct vc_sm_import_result import_result;
> +	struct vc_sm_version version;
> +	struct vc_sm_released released;
> +	struct vc_sm_vc_mem_request vc_request;
> +	struct vc_sm_vc_mem_request_result vc_request_result;
> +};
> +
> +#endif /* __VC_SM_DEFS_H__INCLUDED__ */
> diff --git a/include/linux/raspberrypi/vc_sm_cma_ioctl.h b/include/linux=
/raspberrypi/vc_sm_cma_ioctl.h
> new file mode 100644
> index 000000000000..4dc006d8057a
> --- /dev/null
> +++ b/include/linux/raspberrypi/vc_sm_cma_ioctl.h
> @@ -0,0 +1,110 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * Copyright 2019 Raspberry Pi (Trading) Ltd.  All rights reserved.
> + *
> + * Based on vmcs_sm_ioctl.h Copyright Broadcom Corporation.
> + */
> +
> +#ifndef __VC_SM_CMA_IOCTL_H
> +#define __VC_SM_CMA_IOCTL_H
> +
> +#if defined(__KERNEL__)
?
> +#include <linux/types.h>	/* Needed for standard types */
> +#else
> +#include <stdint.h>
> +#endif
> +
> +#include <linux/ioctl.h>
> +
> +#define VC_SM_CMA_RESOURCE_NAME               32
> +#define VC_SM_CMA_RESOURCE_NAME_DEFAULT       "sm-host-resource"
> +
> +/* Type define used to create unique IOCTL number */
> +#define VC_SM_CMA_MAGIC_TYPE                  'J'
> +
> +/* IOCTL commands on /dev/vc-sm-cma */
> +enum vc_sm_cma_cmd_e {
> +	VC_SM_CMA_CMD_ALLOC =3D 0x5A,	/* Start at 0x5A arbitrarily */
> +
> +	VC_SM_CMA_CMD_IMPORT_DMABUF,
> +
> +	VC_SM_CMA_CMD_CLEAN_INVALID2,
> +
> +	VC_SM_CMA_CMD_LAST	/* Do not delete */
> +};
> +
> +/* Cache type supported, conveniently matches the user space definition=
 in
> + * user-vcsm.h.
> + */
> +enum vc_sm_cma_cache_e {
> +	VC_SM_CMA_CACHE_NONE,
> +	VC_SM_CMA_CACHE_HOST,
> +	VC_SM_CMA_CACHE_VC,
> +	VC_SM_CMA_CACHE_BOTH,
> +};
> +
> +/* IOCTL Data structures */
> +struct vc_sm_cma_ioctl_alloc {
> +	/* user -> kernel */
> +	__u32 size;
> +	__u32 num;
> +	__u32 cached;		/* enum vc_sm_cma_cache_e */
> +	__u32 pad;
> +	__u8 name[VC_SM_CMA_RESOURCE_NAME];
> +
> +	/* kernel -> user */
> +	__s32 handle;
> +	__u32 vc_handle;
> +	__u64 dma_addr;
> +};
> +
> +struct vc_sm_cma_ioctl_import_dmabuf {
> +	/* user -> kernel */
> +	__s32 dmabuf_fd;
> +	__u32 cached;		/* enum vc_sm_cma_cache_e */
> +	__u8 name[VC_SM_CMA_RESOURCE_NAME];
> +
> +	/* kernel -> user */
> +	__s32 handle;
> +	__u32 vc_handle;
> +	__u32 size;
> +	__u32 pad;
> +	__u64 dma_addr;
> +};
> +
> +/*
> + * Cache functions to be set to struct vc_sm_cma_ioctl_clean_invalid2
> + * invalidate_mode.
> + */
> +#define VC_SM_CACHE_OP_NOP       0x00
> +#define VC_SM_CACHE_OP_INV       0x01
> +#define VC_SM_CACHE_OP_CLEAN     0x02
> +#define VC_SM_CACHE_OP_FLUSH     0x03
> +
> +struct vc_sm_cma_ioctl_clean_invalid2 {
> +	__u32 op_count;
> +	__u32 pad;
> +	struct vc_sm_cma_ioctl_clean_invalid_block {
> +		__u32 invalidate_mode;
> +		__u32 block_count;
> +		void *  __user start_address;
> +		__u32 block_size;
> +		__u32 inter_block_stride;
> +	} s[];
> +};
> +
> +/* IOCTL numbers */
> +#define VC_SM_CMA_IOCTL_MEM_ALLOC\
> +	_IOR(VC_SM_CMA_MAGIC_TYPE, VC_SM_CMA_CMD_ALLOC,\
> +	 struct vc_sm_cma_ioctl_alloc)
> +
> +#define VC_SM_CMA_IOCTL_MEM_IMPORT_DMABUF\
> +	_IOR(VC_SM_CMA_MAGIC_TYPE, VC_SM_CMA_CMD_IMPORT_DMABUF,\
> +	 struct vc_sm_cma_ioctl_import_dmabuf)
> +
> +#define VC_SM_CMA_IOCTL_MEM_CLEAN_INVALID2\
> +	_IOR(VC_SM_CMA_MAGIC_TYPE, VC_SM_CMA_CMD_CLEAN_INVALID2,\
> +	 struct vc_sm_cma_ioctl_clean_invalid2)
> +
> +#endif /* __VC_SM_CMA_IOCTL_H */
> diff --git a/include/linux/raspberrypi/vc_sm_knl.h b/include/linux/raspb=
errypi/vc_sm_knl.h
> new file mode 100644
> index 000000000000..f3e6b5648b23
> --- /dev/null
> +++ b/include/linux/raspberrypi/vc_sm_knl.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +/*
> + * VideoCore Shared Memory CMA allocator
> + *
> + * Copyright: 2018, Raspberry Pi (Trading) Ltd
> + *
> + * Based on vc_sm_defs.h from the vmcs_sm driver Copyright Broadcom Cor=
poration.
> + *
> + */
> +
> +#ifndef __VC_SM_KNL_H__INCLUDED__
> +#define __VC_SM_KNL_H__INCLUDED__
> +
> +#include <linux/dma-buf.h>
> +
> +/**
> + * vc_sm_cma_free() - Release a VideoCore shared memory buffer
> + * @handle: Pointer to dmabuf representing the buffer to free
> + *
> + * This function should be called to release handles obtained from
> + * vc_sm_cma_import_dmabuf(). It decrements the dmabuf reference count,
> + * which triggers the cleanup sequence if this was the last reference.
> + *
> + * The actual memory deallocation is deferred until both the ARM-side
> + * references are released AND VideoCore confirms it has finished acces=
sing
> + * the buffer. This ensures safe cleanup even if VideoCore operations a=
re
> + * still in progress.
> + *
> + * Returns 0 on success, -%EPERM if the device is not initialized or ha=
ndle is
> + * invalid.
> + */
> +int vc_sm_cma_free(void *handle);
> +
> +/**
> + * vc_sm_cma_int_handle() - Get VideoCore handle from dmabuf handle
> + * @handle: Pointer to dmabuf representing the shared memory buffer
> + *
> + * This function retrieves the VideoCore firmware handle associated wit=
h
> + * a dmabuf that was previously allocated or imported through this driv=
er.
> + * The VideoCore handle is required when communicating with VideoCore
> + * firmware to reference the shared buffer.
> + *
> + * The handle parameter must be a dmabuf pointer that was obtained from
> + * either vc_sm_cma_import_dmabuf() or through the /dev/vcsm-cma device
> + * allocation ioctls.
> + *
> + * Returns VideoCore handle (non-zero) on success, 0 on failure or inva=
lid
> + * input.
> + */
> +int vc_sm_cma_int_handle(void *handle);
> +
> +/**
> + * vc_sm_cma_import_dmabuf() - Import a dmabuf for sharing with VideoCo=
re
> + * @src_dmabuf: DMA-BUF to import
> + * @handle: Output pointer to receive the new dmabuf handle
> + *
> + * Imports an existing dmabuf into the VideoCore shared memory subsyste=
m,
> + * making it accessible to VideoCore firmware. This allows sharing of
> + * buffers allocated by other kernel drivers (such as V4L2) with VideoC=
ore.
> + *
> + * The returned handle must be freed with vc_sm_cma_free() when no long=
er
> + * needed. The handle can be passed to vc_sm_cma_int_handle() to obtain
> + * the VideoCore firmware handle for use in MMAL or other VideoCore API=
s.
> + *
> + * The imported buffer must be physically contiguous and located in mem=
ory
> + * addressable by VideoCore.
> + *
> + * Returns 0 on success and @handle is set to the new dmabuf pointer,
> + *         -%EPERM if the device is not initialized or input is invalid=
,
> + *         -%ENOMEM if allocation fails,
> + *         -%ERESTARTSYS if interrupted by signal during VCHI communica=
tion.
> + */
> +int vc_sm_cma_import_dmabuf(struct dma_buf *dmabuf, void **handle);
> +
> +#endif /* __VC_SM_KNL_H__INCLUDED__ */
>

