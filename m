Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56CB4F93D3
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 16:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958884; cv=pass; b=I6MOvnNdIDa5QaumQvRVNgUNhbXkhu56dCAel6TE/1184KhdE9yM7JO3VxN1D3ZY0t6RLk6S35Pb+xnUPyOU8alTSDXCIyuBVmdI8sVaoZWkDmdm0MAEN5kAmKuU/TaVAUpci/0eFiVQjQHIJiUTA1uPS7BksR69QZ/MmRVmZzY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958884; c=relaxed/simple;
	bh=kyGG97NiUwbxqy7J9CmBK8sT28vxnfJtEoyI3V98l3A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h++4A9ogAVZj23ajc20XA9zofFb4EjkgT/NPjrhfGycnnBc3eus2PMmu94XmbO00++X/WAoChJaGEcmjIn1Yrl9ZCKU9B/YrbJEhOOGdKxMHWokCACvMR6ZxEcynPc7uWCk6LkpKJAMOZXaLVNf3vXn6f3FLIMYbQXcj4hd0gik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HdlXyWqb; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HdlXyWqb"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae185cc40fso106885a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 09:34:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790958880; cv=none;
        d=google.com; s=arc-20260327;
        b=oAjkHSNj3IdKfJXJRS+Uy7fVjWEYxTlXcbZRMjdIthC0VKTFvWe1Wfp4v6/+DJJHEk
         JCEu7zfKARH1NRuxps34eEfyHuIvxVAINL4eqLo18i49T9Uxx04OI1rGcZiQRdjNc9xF
         jpUpkJ6aEWyUGQBCflVtnrhLoUPigU71axqmMgjYBLFig5OkzYWE0/BXYvTIJaaIMh9R
         La/2pinVmgmLoygMxfVS4Qhk49dhhy8ECbOTNsfFL1SODlXBQXN6Sbi5A37Mbo7bSh16
         n7femZZqbcdWNSLaZ7+PW+IRBrlGUJWGGFfryN2dkmQerGEKk9GfEAh3Fc+xyG9oH3i0
         /dtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MksekO+MSLkGrBlhvN5gTB12u9YT563qpJvDNcoiCfc=;
        fh=yalR0FDv4jMciLT8Gh8XEJeQ6pNaz/iECv5obZSacOg=;
        b=RqWnSO4lFzBJvhLzF9UHutrK6KfBk0rlG+Yp4Mgs7m8UtY4wIL8ib26Ly1SDAIdt/k
         drdxbzQI0jEYYLBb3jwp8u6zgE0qogYp6hq+JQh1Qrl2C8Pe/c35uzd/vwUdfaOzeVUU
         zOGMiXcOfGXNs1o4X8nBCnK4lD9vIp+k6nbWpjEJMxO4BkD7Ev0UCV8olt4S20UrMWio
         i7NHslXWAENPjoLLszrD1wQUGQnegBHI0yIN5MqdnnV+fJxhz69gri9fKNDww6eSIaOb
         ZtNnuopZ7UKQhnZGw7R3ul/sqzUiLXUA9ivKSjDn+nETrdbtrgDNokn09JT5fcI1nYUa
         NoZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790958880; x=1791563680; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MksekO+MSLkGrBlhvN5gTB12u9YT563qpJvDNcoiCfc=;
        b=HdlXyWqb/uzY99S2lyyUokkGIUNfWosuDoeyejPTBb4xOKM9AuOZZim0MURD9y2hrm
         g+ZUW7xBG2R21Ka1vgzkDxIAZgqPOF4mWtwAoV7MBiZsi+Tw+DfWCrivbiFk364hfgPJ
         u4NhU7Pu1iDgz7Q3LZYSf8OGjQM+7E3TQ+nAuYL/VXdOyXlB7HDp3fyTclw9iEaDxU/N
         b5GgzbG+Ij/6Y6vwviBHjmRI4OvG/sUsJHx4rax1RAQ3ywY6bkzGM7/vIeYZP/ToS1zD
         C1yx2sRUOMdeWjGb1YYi6Hh938q4VkApDI/5/iAb2G6Xi2O6+kP2ruFidWjmyCiHpy6K
         0iJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790958880; x=1791563680;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MksekO+MSLkGrBlhvN5gTB12u9YT563qpJvDNcoiCfc=;
        b=au8snlg1z6xx0u2ZaZU2J5dsG73CBkMrY0KQe9R9pL/cwtjOPWr8/xM8NU50Z7WNyf
         zdQh85bdOjx3perj6IJ2hc7y/Dshia3ZF2zv0CeqaGfPO4J7/FHKY15qwKaNI0fml3v2
         utzDuW9uL5jNL2e97QyNnxFFQJJIBIemvhwGABfAxCIcTtN7ZlddDovcym8N+GbPwz1d
         VGNcpfJ53dBMS3F3+mpgH4rMmH363O4WqhTSNViJxg6XUfmcy9q+y0ecSgOhf9I4fJ2V
         7STNEnhrFrugaRgFt2czfsTrlJ7GmUo/sWOxIX4A2At+ZAZmEKsk8A76IbffhBpiB6eA
         4ccw==
X-Forwarded-Encrypted: i=1; AKwUvByVlB6lFu89Z8VrfrIOnOwZrEUz5Fvq73eOgZBW58hZTLxprl8XsG1ZKAFipyBDPdIoiVfBa31wAuVRuDQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLX3vYqmXVilfHgnEYk4u8ptxnYtA8ICWwN+lZ+91GPKkNXRHYn
	R3XBM8Df8+l9gK4YcspUTBTMl9JfHMWLDes8qVDJm45OjzR3Ps5pRDZO/lpm3M4LRbPL1MLluUY
	UsuV29M84zGbKjVT0u4e3bNZdBWvyd4EElSXGIS6VjA==
X-Gm-Gg: AYBFou30YciYMSJS+guSeZjnvBpKdECV7RuylIblV4vmbUDPaF2cCEgl3sBEbCVvQ/K
	z05ypz9N7Ic2kARBOusNmzxBqdCIom1lAB3OY4nJTrksaJ8aJIeOoPCK1NyFnW4EQgddace/pTo
	zu5KoI08vLWXPlME4jc7BRJeX3e5m5FgRLJ/bve+litXSgGe7JoDYRoIW6uPy7Q2GItYtK150Bq
	BHsNUup4XVPH4Q94FbuQmNvPMwQmntU+wdy71X9ThjwHv6cHarcg9hwbNiROKJ8K+jASpiH8Y6Z
	Cv9Qz3MnOziyY3H48fE9O/IWHAvggAzAMD1dXOkIFPK7tcG0vXE44EkqeU5e526dEWRLdSl0y85
	qBJGru9DD/m7YZrVfOQRSr1nY
X-Received: by 2002:a17:907:2da2:b0:c2a:fe4e:61c5 with SMTP id
 a640c23a62f3a-c2e33ffd009mr512655366b.22.1790958880499; Fri, 02 Oct 2026
 09:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924203409.2484068-1-tanmay.shah@amd.com> <ar04gWStZiwMUogH@p14s>
 <2a4054f2-624c-4479-a4fb-8acd9b9654d3@amd.com>
In-Reply-To: <2a4054f2-624c-4479-a4fb-8acd9b9654d3@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Fri, 2 Oct 2026 10:34:28 -0600
X-Gm-Features: AclHuK_Tjl5pmr2hlp_pRWsX_qLl7w88-ZDc0t-stunuOVrLW5eJ12QNo39CA0k
Message-ID: <CANLsYkxGSgO1pY9Wcbt3mtThaN2_ULKQHFL+qfRGGQV19D7nbA@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: xlnx: reset virtio status during attach
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 10:51, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 9/30/2026 11:27 AM, Mathieu Poirier wrote:
> > Hi,
> >
> > On Thu, Sep 24, 2026 at 01:34:09PM -0700, Tanmay Shah wrote:
> >> On AMD-Xilinx platforms cortex-A and cortex-R can be configured as
> >> separate subsystems. In this case, both cores can boot independent of
> >> each other. This is platform management firmware configuration to manage
> >
> > I'm not sure to understand what the above sentence adds to the changelog.  I
> > suggest either reworking or removing.
> >
>
> Ack, I will remove it.
>
> >> cores. In such a configuration, if Linux went through an uncontrolled
> >> reboot during active rpmsg communication, then during next boot it can
> >> find rpmsg virtio status not in the reset state. In such case it is
> >> important to reset the virtio status during attach callback and wait
> >> for the remote to handle virtio device reset. After reset, the remote
> >> is expected to generate the notification to the host or the host will
> >> eventually timeout and continue the normal boot flow.
> >>
> >> Assisted-by: LLM
> >> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >> ---
> >>  drivers/remoteproc/xlnx_r5_remoteproc.c | 74 +++++++++++++++++++++++++
> >>  1 file changed, 74 insertions(+)
> >>
> >> diff --git a/drivers/remoteproc/xlnx_r5_remoteproc.c b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> index 630621288430..6e7e2a5ea83c 100644
> >> --- a/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> +++ b/drivers/remoteproc/xlnx_r5_remoteproc.c
> >> @@ -6,6 +6,7 @@
> >>
> >>  #include <linux/dma-mapping.h>
> >>  #include <linux/firmware/xlnx-zynqmp.h>
> >> +#include <linux/jiffies.h>
> >>  #include <linux/kernel.h>
> >>  #include <linux/mailbox_client.h>
> >>  #include <linux/mailbox/zynqmp-ipi-message.h>
> >> @@ -15,6 +16,7 @@
> >>  #include <linux/of_reserved_mem.h>
> >>  #include <linux/platform_device.h>
> >>  #include <linux/remoteproc.h>
> >> +#include <linux/wait.h>
> >>
> >>  #include "remoteproc_internal.h"
> >>
> >> @@ -33,6 +35,8 @@
> >>  #define RSC_TBL_XLNX_MAGIC  ((uint32_t)'x' << 24 | (uint32_t)'a' << 16 | \
> >>                               (uint32_t)'m' << 8 | (uint32_t)'p')
> >>
> >> +#define RPROC_ATTACH_TIMEOUT_US (1000 * 1000)
> >> +
> >
> > Please see if you can use a kernel defined time constant instead of minting your
> > own.
> >
>
> Ack.
>
> >>  /*
> >>   * settings for RPU cluster mode which
> >>   * reflects possible values of xlnx,cluster-mode dt-property
> >> @@ -167,6 +171,9 @@ struct xlnx_rproc_crash_report {
> >>   * @rsc_tbl_size: resource table size retrieved from remote
> >>   * @pm_domain_id: RPU CPU power domain id
> >>   * @ipi: pointer to mailbox information
> >> + * @attach_wq: wait queue for attach-time vdev reset acknowledgment
> >
> > I don't understand the explanation for @attach_wq - please rework.
> >
> >> + * @waiting_for_attach_ack: whether attach is waiting for remote interrupt
> >> + * @attach_ack: remote interrupt observed while attach wait is active
> >>   */
> >>  struct zynqmp_r5_core {
> >>      struct xlnx_rproc_crash_report *crash_report;
> >> @@ -181,6 +188,9 @@ struct zynqmp_r5_core {
> >>      u32 rsc_tbl_size;
> >>      u32 pm_domain_id;
> >>      struct mbox_info *ipi;
> >> +    wait_queue_head_t attach_wq;
> >> +    bool waiting_for_attach_ack;
> >> +    bool attach_ack;
> >>  };
> >>
> >>  /**
> >> @@ -270,10 +280,17 @@ static void handle_event_notified(struct work_struct *work)
> >>  static void zynqmp_r5_mb_rx_cb(struct mbox_client *cl, void *msg)
> >>  {
> >>      struct zynqmp_ipi_message *ipi_msg, *buf_msg;
> >> +    struct zynqmp_r5_core *r5_core;
> >>      struct mbox_info *ipi;
> >>      size_t len;
> >>
> >>      ipi = container_of(cl, struct mbox_info, mbox_cl);
> >> +    r5_core = ipi->r5_core;
> >
> > Is there really a chance that ipi->r5_core be NULL?
> >
>
> Recently, INIT_WORK was moved before
> mbox_request_channel_byname(mbox_cl, "rx"), In this case, if interrupt
> occurs between requesting "rx" channel, and assigning r5_cores to ipi,
> then r5_core can be NULL.
>
> >> +
> >> +    if (r5_core && READ_ONCE(r5_core->waiting_for_attach_ack)) {
> >> +            WRITE_ONCE(r5_core->attach_ack, true);
> >
> > Why use READ_ONCE/WRITE_ONCE here - what does it give you?
> >
>
> I think this was added by AI agent, and I think it is to maintain atomic
> nature of variable access. But if you prefer to protect these variables
> via locks I will do that. These variables are shared between attach()
> context and IPI interrupt, so I think they should be protected somehow.
>

READ_ONCE/WRITE_ONCE don't guard against concurrency, only against
access reordering.

> >> +            wake_up(&r5_core->attach_wq);
> >> +    }
> >
> > If @rsc->status has been set to 0 in zynqmp_r5_attach() and an IPI is received
> > before ->kick(), the core may erroneously think the remote processor is
> > acknowleging the reset.
> >
>
> Ack. Probably need to set these flags after kick(). I will do that.
>
> >>
> >>      /* copy data from ipi buffer to r5_core if IPI is buffered. */
> >>      ipi_msg = (struct zynqmp_ipi_message *)msg;
> >> @@ -820,6 +837,62 @@ static int zynqmp_r5_get_rsc_table_va(struct zynqmp_r5_core *r5_core)
> >>
> >>  static int zynqmp_r5_attach(struct rproc *rproc)
> >>  {
> >> +    struct zynqmp_r5_core *r5_core = rproc->priv;
> >> +    struct device *dev = &rproc->dev;
> >> +    bool wait_for_remote = false;
> >> +    struct fw_rsc_vdev *rsc;
> >> +    struct fw_rsc_hdr *hdr;
> >> +    int i, offset, avail;
> >> +    long time_left;
> >> +
> >> +    if (!rproc->table_ptr)
> >> +            goto attach_success;
> >> +
> >> +    for (i = 0; i < rproc->table_ptr->num; i++) {
> >> +            offset = rproc->table_ptr->offset[i];
> >> +            hdr = (void *)rproc->table_ptr + offset;
> >> +            avail = rproc->table_sz - offset - sizeof(*hdr);
> >> +            rsc = (void *)hdr + sizeof(*hdr);
> >> +
> >> +            /* make sure table isn't truncated */
> >> +            if (avail < 0) {
> >> +                    dev_err(dev, "rsc table is truncated\n");
> >> +                    return -EINVAL;
> >> +            }
> >> +
> >> +            if (hdr->type != RSC_VDEV)
> >> +                    continue;
> >> +
> >> +            /*
> >> +             * reset vdev status, in case previous run didn't leave it in
> >> +             * a clean state.
> >> +             */
> >> +            if (rsc->status) {
> >> +                    rsc->status = 0;
> >> +                    wait_for_remote = true;
> >> +                    break;
> >> +            }
> >> +    }
> >> +
> >> +    if (wait_for_remote) {
> >> +            WRITE_ONCE(r5_core->attach_ack, false);
> >> +            WRITE_ONCE(r5_core->waiting_for_attach_ack, true);
> >> +    }
> >
> > Again, I would like to understand the motivation behind using WRITE_ONCE()
> > here...  I just don't see what kind of re-ordering issue you need to guard
> > against.
> >
>
> Ack. I will remove and introduce locks if that plan works.
>
> >> +
> >> +    /* kick remote to notify about attach */
> >> +    rproc->ops->kick(rproc, 0);
> >
> > Will older FW be able to deal with this properly?
> >

This question hasn't been answered.

> >> +
> >> +    if (wait_for_remote) {
> >> +            time_left = wait_event_timeout(r5_core->attach_wq,
> >> +                                           READ_ONCE(r5_core->attach_ack),
> >> +                                           usecs_to_jiffies(RPROC_ATTACH_TIMEOUT_US));
> >
> > The condition where the driver is removed or the remoteproc shut down needs also
> > needs to be handled as a break out condition.
> >
>
> So this whole feature will be helpful only if linux gets rebooted
> without proper cleanup. If driver is removed, it will call detach() via
> zynqmp_cluster_exit(). If machine goes throug 'reboot' command, then the
> driver has 'shutdown' callback registered which will call 'detach()'
> operation. In these cases the remoteproc reset is guranteed and the
> status will be 0 on next boot.
>
> But if linux didn't get chance to execute above callbacks, only then the
> status will be left non-zero on reboot.
>

What if you insmod the driver after an unexpected reboot and then
rmmod the driver while waiting for the remote processor to come back
up?

> > Thanks,
> > Mathieu
> >
> >> +            WRITE_ONCE(r5_core->waiting_for_attach_ack, false);
> >> +
> >> +            if (!time_left)
> >> +                    dev_warn(dev, "timeout waiting for remote vdev reset ack\n");
> >> +    }
> >> +
> >> +attach_success:
> >>      dev_dbg(&rproc->dev, "rproc %d attached\n", rproc->index);
> >>
> >>      return 0;
> >> @@ -920,6 +993,7 @@ static struct zynqmp_r5_core *zynqmp_r5_alloc_rproc_core(struct device *cdev)
> >>      r5_core = r5_rproc->priv;
> >>      r5_core->dev = cdev;
> >>      r5_core->np = dev_of_node(cdev);
> >> +    init_waitqueue_head(&r5_core->attach_wq);
> >>      if (!r5_core->np) {
> >>              dev_err(cdev, "can't get device node for r5 core\n");
> >>              ret = -EINVAL;
> >>
> >> base-commit: 5f639b3018c0026a5341949724b4b921cf3a3d5d
> >> --
> >> 2.43.0
> >>
>
