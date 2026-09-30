Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C1C509F05
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 16:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785677; cv=none; b=iomnnGLhXUImuTf/yQiVX/3MjnsEhT8SIno1cNOKFBlE90S8hvxs/Bp6y+ko7UCGzTPtkjzGXK/mnaBRvq8+9hPlR97Nd/RIZy+hfpHT9/NvkJvtWTNLNd0zT0d8A6urYH74AqbRVlFoaisbxB/8u3Ck2yn3Iyp/ACH50+255eM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785677; c=relaxed/simple;
	bh=upjCr22iKJqYwTagnY8AT9tYkCB4mB/xktCctQ1iRRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=crv5DmKmIma84+OMD2cvGvZSZFhrG1VCCSsocmf6oERuts/BB3Z4rop8F60iS0U8LyRbj9S2iHfh7RZDCm9Y8psIiFGIFG4YtTIOSx1pvq4S310k0Ml1tc/8bLLS/tT3qSGrid6SWv40bXDwv0L3ZnFVTzW3LOxDZIV6I19UlzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XZ9J/G1T; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XZ9J/G1T"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2d747f05ffcso26780065ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 09:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790785668; x=1791390468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ESvfJdyUX/Gf02eSRIMGYGSsgV6vnYOlTJu8ebesA4E=;
        b=XZ9J/G1T0d2hecWAxO1DW1t4Gl/bzK9b/Hll1nWfy+ljYZ/Pn0YAmTpWh0fbtJeBYX
         5yjiEi8YZnlridfLuNaOl4RCjXCwZ8H6jru5Mg9DOm8SrWjhLkVtL2D/PijGX37GbvVy
         957Ebst/FphPZfkoQzSfl1a4nVuuhA7qN7T1fbxqiEFAi6D30uX08TyDbdXP388DdTLV
         nEPLeoeS1WI4EMqVFNPvkWavOoiIYo0mjdFJuGY5utHVtJ8WIiYh2LMep7YMIJiTultx
         OZyCrjFAXlBZVlOuybhAu9j5dlWuKpnji1mVSZ3f7sACQLK3v/7XZ35ir4I0hMyLkZCJ
         WoGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785668; x=1791390468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ESvfJdyUX/Gf02eSRIMGYGSsgV6vnYOlTJu8ebesA4E=;
        b=QnVyKBVLH/42eBt+HJYnvam8tI25N6jS8hwUpJDStApL+EC4ij/iZFPvN56IyZaFNP
         CDz6CPavOhU8S8T2k9fOdfE4v6voV6LoN4ekiS0TWiUdXh92jXLDX/6xTQVSwMXdMnOE
         TTi59yaHicxhMxFfe9qDq8C/XtG4A46cQmvUCfhGa1eNhm598U5tByoykfwHiQy/kcm2
         hXcXlYyacrlIbnYBA2WXOyV5WFK5m1HusxlFCxgArIrjO+gRiiqDjbgyA6QdpLI/iYni
         esBXZHutW6uFdthw0HQIkZgu2JnI8i7O6p8QLHeoqw63ZlVtvBd9WYhrFe3FT8FaAYL4
         PeTw==
X-Forwarded-Encrypted: i=1; AKwUvBwIyvORhcs02FfeJwc5M2N9b1Npdn7jMO+OMalSF+y1mE7J1zVJ1N+xbrgQ6FEQQGWVCxLgGC9U8cxAEV8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIk2twW6N3QcXUPaa83xxmXWt14HrOZrHSAOvwg5QeJ/6LLazL/
	TKK7sm3kyourSrTSz8onFAdbb+flO7pUdLrwJkhSADQQNtmjQ4nimTh2KrSUQdCUUVtqIT5xlsm
	cYSO5
X-Gm-Gg: AYBFou07VR7I3rUBtHWwz23wCwGesM0FxvZlz7dvVL8idVam4G+Lh+ZSWs0ZeRmJJEe
	QL/5KUKKImtjFhU8Kh+yzO+9XdeY1uBK5FhAt8KeU20sBgNH5JEuS3A4AYn9WOgYlvi8auUAN1o
	1mlvhHCw+f4eLsvfYUxzuGmapyZ8I1a6F+0WRtuircf2v1nUSq7Ra2z43hp/IMz3ylcPjHE0zg2
	hcGohCFUYcBxRqp3XfynP9+zjVEVkFdtDfbtbIduTWFTgV/kHU4SAvrxlkFLQdlmJn7hlsvGqZq
	GvRgWNMaNavtR4+NryLXo5wLpQNYzxJhZwgeySAWBMp22xR8UDk/y0JlZ9Q/TUuBj/GDSgKNZ4N
	/0Rr9o0nyKJ9a1bkI0RHlVXh8IE0tUnk3rfnKwFf2VfigV1LgJwvmRsn/lHPgDQ2Dr5SB4McnbE
	cxVQpTKx+VowjqMbM6HFYxKkvkJ03tZouomExwkJDpbQDm+JaNfMHGvyDtRUA7/ZfkXMrrLhHU
X-Received: by 2002:a17:902:f54a:b0:2df:b45a:b673 with SMTP id d9443c01a7336-2e2e4b51981mr15004645ad.41.1790785668045;
        Wed, 30 Sep 2026 09:27:48 -0700 (PDT)
Received: from p14s ([2604:3d09:148c:c800:f5b4:4d0e:70d:9fba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e30099ac1csm48285ad.20.2026.09.30.09.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:27:47 -0700 (PDT)
Date: Wed, 30 Sep 2026 10:27:45 -0600
From: Mathieu Poirier <mathieu.poirier@linaro.org>
To: Tanmay Shah <tanmay.shah@amd.com>
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
Message-ID: <ar04gWStZiwMUogH@p14s>
References: <20260924203409.2484068-1-tanmay.shah@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924203409.2484068-1-tanmay.shah@amd.com>

Hi,

On Thu, Sep 24, 2026 at 01:34:09PM -0700, Tanmay Shah wrote:
> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
> separate subsystems. In this case, both cores can boot independent of
> each other. This is platform management firmware configuration to manage

I'm not sure to understand what the above sentence adds to the changelog.  I
suggest either reworking or removing.

> cores. In such a configuration, if Linux went through an uncontrolled
> reboot during active rpmsg communication, then during next boot it can
> find rpmsg virtio status not in the reset state. In such case it is
> important to reset the virtio status during attach callback and wait
> for the remote to handle virtio device reset. After reset, the remote
> is expected to generate the notification to the host or the host will
> eventually timeout and continue the normal boot flow.
> 
> Assisted-by: LLM
> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> ---
>  drivers/remoteproc/xlnx_r5_remoteproc.c | 74 +++++++++++++++++++++++++
>  1 file changed, 74 insertions(+)
> 
> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> index 630621288430..6e7e2a5ea83c 100644
> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/dma-mapping.h>
>  #include <linux/firmware/xlnx-zynqmp.h>
> +#include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/mailbox/zynqmp-ipi-message.h>
> @@ -15,6 +16,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/remoteproc.h>
> +#include <linux/wait.h>
>  
>  #include "remoteproc_internal.h"
>  
> @@ -33,6 +35,8 @@
>  #define RSC_TBL_XLNX_MAGIC	((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
>  				 (uint32_t)'m' << 8 | (uint32_t)'p')
>  
> +#define RPROC_ATTACH_TIMEOUT_US (1000 * 1000)
> +

Please see if you can use a kernel defined time constant instead of minting your
own.

>  /*
>   * settings for RPU cluster mode which
>   * reflects possible values of xlnx,cluster-mode dt-property
> @@ -167,6 +171,9 @@ struct xlnx_rproc_crash_report {
>   * @rsc_tbl_size: resource table size retrieved from remote
>   * @pm_domain_id: RPU CPU power domain id
>   * @ipi: pointer to mailbox information
> + * @attach_wq: wait queue for attach-time vdev reset acknowledgment

I don't understand the explanation for @attach_wq - please rework.

> + * @waiting_for_attach_ack: whether attach is waiting for remote interrupt
> + * @attach_ack: remote interrupt observed while attach wait is active
>   */
>  struct zynqmp_r5_core {
>  	struct xlnx_rproc_crash_report *crash_report;
> @@ -181,6 +188,9 @@ struct zynqmp_r5_core {
>  	u32 rsc_tbl_size;
>  	u32 pm_domain_id;
>  	struct mbox_info *ipi;
> +	wait_queue_head_t attach_wq;
> +	bool waiting_for_attach_ack;
> +	bool attach_ack;
>  };
>  
>  /**
> @@ -270,10 +280,17 @@ static void handle_event_notified(struct work_struct *work)
>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
>  {
>  	struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> +	struct zynqmp_r5_core *r5_core;
>  	struct mbox_info *ipi;
>  	size_t len;
>  
>  	ipi = container_of(cl, struct mbox_info, mbox_cl);
> +	r5_core = ipi->r5_core;

Is there really a chance that ipi->r5_core be NULL?

> +
> +	if (r5_core && READ_ONCE(r5_core->waiting_for_attach_ack)) {
> +		WRITE_ONCE(r5_core->attach_ack, true);

Why use READ_ONCE/WRITE_ONCE here - what does it give you?

> +		wake_up(&r5_core->attach_wq);
> +	}

If @rsc->status has been set to 0 in zynqmp_r5_attach() and an IPI is received
before ->kick(), the core may erroneously think the remote processor is
acknowleging the reset.

>  
>  	/* copy data from ipi buffer to r5_core if IPI is buffered. */
>  	ipi_msg = (struct zynqmp_ipi_message *)msg;
> @@ -820,6 +837,62 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
>  
>  static int zynqmp_r5_attach(struct rproc *rproc)
>  {
> +	struct zynqmp_r5_core *r5_core = rproc->priv;
> +	struct device *dev = &rproc->dev;
> +	bool wait_for_remote = false;
> +	struct fw_rsc_vdev *rsc;
> +	struct fw_rsc_hdr *hdr;
> +	int i, offset, avail;
> +	long time_left;
> +
> +	if (!rproc->table_ptr)
> +		goto attach_success;
> +
> +	for (i = 0; i < rproc->table_ptr->num; i++) {
> +		offset = rproc->table_ptr->offset[i];
> +		hdr = (void *)rproc->table_ptr + offset;
> +		avail = rproc->table_sz - offset - sizeof(*hdr);
> +		rsc = (void *)hdr + sizeof(*hdr);
> +
> +		/* make sure table isn't truncated */
> +		if (avail < 0) {
> +			dev_err(dev, "rsc table is truncated\n");
> +			return -EINVAL;
> +		}
> +
> +		if (hdr->type != RSC_VDEV)
> +			continue;
> +
> +		/*
> +		 * reset vdev status, in case previous run didn't leave it in
> +		 * a clean state.
> +		 */
> +		if (rsc->status) {
> +			rsc->status = 0;
> +			wait_for_remote = true;
> +			break;
> +		}
> +	}
> +
> +	if (wait_for_remote) {
> +		WRITE_ONCE(r5_core->attach_ack, false);
> +		WRITE_ONCE(r5_core->waiting_for_attach_ack, true);
> +	}

Again, I would like to understand the motivation behind using WRITE_ONCE()
here...  I just don't see what kind of re-ordering issue you need to guard
against.

> +
> +	/* kick remote to notify about attach */
> +	rproc->ops->kick(rproc, 0);

Will older FW be able to deal with this properly?

> +
> +	if (wait_for_remote) {
> +		time_left = wait_event_timeout(r5_core->attach_wq,
> +					       READ_ONCE(r5_core->attach_ack),
> +					       usecs_to_jiffies(RPROC_ATTACH_TIMEOUT_US));

The condition where the driver is removed or the remoteproc shut down needs also
needs to be handled as a break out condition.

Thanks,
Mathieu

> +		WRITE_ONCE(r5_core->waiting_for_attach_ack, false);
> +
> +		if (!time_left)
> +			dev_warn(dev, "timeout waiting for remote vdev reset ack\n");
> +	}
> +
> +attach_success:
>  	dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
>  
>  	return 0;
> @@ -920,6 +993,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
>  	r5_core = r5_rproc->priv;
>  	r5_core->dev = cdev;
>  	r5_core->np = dev_of_node(cdev);
> +	init_waitqueue_head(&r5_core->attach_wq);
>  	if (!r5_core->np) {
>  		dev_err(cdev, "can't get device node for r5 core\n");
>  		ret = -EINVAL;
> 
> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
> -- 
> 2.43.0
> 
