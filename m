Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B162337A4B8
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404455; cv=pass; b=uCdG6cA+fg+VNQv1hNkEqhnkaT5o0TsOLhQGL8S/3PsyWDLYfHSMFvzTmwNMSVW7auoBJL5vKzvd9eFL36+kcsXp7ZKgsM9QHzBZvIIBqLmnP7QcWkW8cpRTX1MpjJ23Rp0dcwWyDOyzm415OyEKOIBHdspyVY5Z/nq2znS+JOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404455; c=relaxed/simple;
	bh=RkE6X5THUFFClDrCCGzDnmSjjX+TpSX08MYyT/jVWbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFqtcx09T1V04bR6FtLCN2bKdT5gIkMMtSDbgdiRsA0ZYBaWyyuSlYFX3EExJohvXE3twCssUsGmjZ9r8x7kDIJLKHKGv1sP2P4s3Jq5AZZCkLgxEnZuWCGboJbRsGeCrDPlSLq97HmXdKK+krGye9fnXffDzxpzZkRoAwd3sog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=woK31qOL; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="woK31qOL"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso3028943a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:47:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789404451; cv=none;
        d=google.com; s=arc-20260327;
        b=b5d3mKwVU6wdhKh4G9TibQsguZKFDt2LXDdsD28yn3u1LoyKJACTUnjfrq4eAb8tGK
         +UzubK5w06i9NQbbiEH23w6OCvAsxpV3wo/TTN2ObnwzpMJoa3WNDhb3A/eRI/MpYl3Y
         ECeMNParmqmMfz81VYNFnuS+l4opp0I75FFzzCEqafKBh6lo8KUWolCMidIxmRjgzAGK
         95P03Jm0F1qoODHfiORBrgqXGRBbO6E8p0ViMCX86xGo0nean6mohCfLyDYwxZdXJhhM
         8fya2kKatGV1p/7dJSD5NuxEZip20wI63vrBFtiBN9OhxnV/XZz5LKf9snLcRXyJh7hv
         5gnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nhBJnKjdv7yVDRtTuQR9/j5aJL6hnO/234qxL4Z0wQM=;
        fh=zlGcvUw0rgCQu9W7c/4+jaVjrfGkhiJU9sZK8oFsGLQ=;
        b=eLACjSGjRVP/9sLCRl2j4Fhw1fwGGalBz5IbrAX152VilQq/ezaHbnBNE7lAcUFKMU
         xDvhIIqrBX7rUHo0RMXz5z5pZ3bwFCLp1fIHHttgC0oC9iLdBKBhJxnb7HaRrwHFfNG7
         2lUnoM8x+SkDrZuBCNVEIxfob2A/hG9CJKjzqROcWfuqdbuoyJOhtMLcPRi93761cQIn
         4sihwcmybi0uABN9d9lAZXF0uDBU3c0jKDggMtdnC3vO1GSpBkolDqQNssQmTsupJOZb
         MBOY6HTZpoE8W+5NHj5wODSYKW29NXGIsIT3Mmg8bTAXo6avld2FbLiim6Y/OOt+M2yf
         Ae4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789404451; x=1790009251; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhBJnKjdv7yVDRtTuQR9/j5aJL6hnO/234qxL4Z0wQM=;
        b=woK31qOL0sOQkfD7TQ1bdIuP7+g/RQLGfQbPN+wxwcZbjHoVq/lQ2FXReNSnrFdDS1
         SZFV33DyjJ2hAGCQ35nyaNqCjanvAaxs6yfTGmAhruQ40Ns1u+F6N/WZXvvuW14kqIJY
         sANs4F/kwqBQIFpyR570fMJDRSYau2kgFuOq7eQQCQ31Vb0qryRAtJ8NOcik+ol9ZZEF
         cKjz4mycP7y1+czqaUMWaWmRBpI53wRco445bqn7nXebPDLcbrUXLwGTT5E8Tf0mP/bV
         +qJJPHMj2HtqsOGW4PkZ0bph2FU5OzlJJEQ2RxP1XwvILY26Emlp5U9O6o1TA1GuBzL6
         u3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404451; x=1790009251;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nhBJnKjdv7yVDRtTuQR9/j5aJL6hnO/234qxL4Z0wQM=;
        b=jx1o/DFkkwI5aqHd0NPGpfHE0a92WcB3tsFfQP7Y8tBNgcOKAvAx+Z7EQ3gtiMmEDj
         mG2MNeGgVdgZH2C8wzTEkoNb/IAACAs4dwGDq37rOHJKqFexqMF0ym/47CPT0qWUPj/v
         DOlPPw5z7zTOASBW8xPTA3XcGbmvPN3iMegyOb93e+4jkuVbDa+p1hoSwBYHpfviSR6o
         9lMBkY+6i5i30OjE/IhA/ZcIdVpyz+8MfkbVAFz4WCHOTB1rAfN9f53YdeAqOSEqjT/K
         Bmy6kqGzEODZu9YRFVk1Us2pXDM7Lkmxzwxm5pe0hACSkVpAcBQ8XET3acRNbC4xKf27
         iG6w==
X-Forwarded-Encrypted: i=1; AKwUvBxrTp8QG4xVEz1bo4FaIixBfCZ7A34ufnhPh88biuiDSkxHkuYkJ+Mbl8nz/fq4RG//mxSuB7hahXwwoWM=@vger.kernel.org
X-Gm-Message-State: AFuF++nzucDcmJouMZaPTB3t5Tq4/nsWHag6TjaXhg3r5nZu+rgWlVES
	e1VfiNxnGTnijzK1siU/P8j1kAPzHbBzXe2UT5eCDnL3Wzm53hemT/f6jVvHqiYkNaBHzGt+m70
	ggUrk3hCNgXU7YdohHMEGSfmD/Su2MAnYNga3zMp6qg==
X-Gm-Gg: AYBFou33i67LkpzEWby5oPY2KVZr6x++bSbEXX7wGearGtfTrvBQbI6cS/f2sOHjfkQ
	4BuuhVwm5Jmw96B9lwFF0CnzkQIi4ppcjWXpehc50rjJy7llfEPNTQepV6mYb6BQ7vwMJY8aDcS
	J6tyK/3gdwW+BQmn6LITXNIWHUqa3NWVQIDo/i/nrIrq0i3LL/tvdXg7D6L5hkHANA6ajE2uCs8
	3FrtQ/QkW1kppLxSL6iVY3Tk9G0Oc+o4p3hMx142HR9Rsradlzoh3s10t6hWvcwDc20abY8pV3w
	n+KzIBZBtAmirXlpS/jcwpKM6RnAxtR8kf2AJA9Rg9xeXt7CEzhtD/WYrDBhOrej0zb8O6NKUPj
	A6X7IOFehrGR/5g==
X-Received: by 2002:a05:6402:13d1:b0:6a9:cc6a:dd65 with SMTP id
 4fb4d7f45d1cf-6a9f63d77b1mr2060955a12.30.1789404450733; Mon, 14 Sep 2026
 09:47:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902214453.634339-2-tanmay.shah@amd.com> <aqBNoaF7m_JEiVYY@p14s>
 <281ad636-7963-43ad-b88a-8a196eab217b@amd.com> <aqQW7eOsFE7jRTXT@p14s> <935f29ea-adf0-45c2-84fc-0df40b6f591b@amd.com>
In-Reply-To: <935f29ea-adf0-45c2-84fc-0df40b6f591b@amd.com>
From: Mathieu Poirier <mathieu.poirier@linaro.org>
Date: Mon, 14 Sep 2026 10:47:19 -0600
X-Gm-Features: AcwNN1WWQzykg9rw3090_I8Xxvm7IlgoLsteBPx15M331KvA054T5B6_tgRl7b4
Message-ID: <CANLsYkzWXRbQiystuX101POObnkhSAyyP-6sOf9Fb+X5H_5y3A@mail.gmail.com>
Subject: Re: [PATCH] remoteproc: remoteproc_virtio: add acknowledged vdev reset
To: tanmay.shah@amd.com
Cc: andersson@kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 11 Sept 2026 at 12:03, Shah, Tanmay <tanmays@amd.com> wrote:
>
>
>
> On 9/11/2026 9:57 AM, Mathieu Poirier wrote:
> > On Tue, Sep 08, 2026 at 02:21:53PM -0500, Shah, Tanmay wrote:
> >> Hello,
> >>
> >> Thank you for the reviews.
> >>
> >> On 9/8/2026 1:02 PM, Mathieu Poirier wrote:
> >>> Good day,
> >>>
> >>> On Wed, Sep 02, 2026 at 02:44:54PM -0700, Tanmay Shah wrote:
> >>>> The existing remoteproc virtio reset path clears the vdev status locally
> >>>> without notifying the remote processor. As a result, the host cannot tell
> >>>> whether the remote side has observed the reset request or completed its
> >>>> cleanup.
> >>>>
> >>>> Add a new resource type, RSC_VDEV_V2, for virtio vdevs that support an
> >>>> acknowledged reset protocol. For these resources, encode a reset request
> >>>> in the virtio status byte, kick the remote processor using the vdev notify
> >>>> ID, and wait for the remote side to clear the status back to 0.
> >>>>
> >>>> Keep the existing RSC_VDEV behavior for backwards compatibility by
> >>>> clearing the status locally. Also reset remoteproc-created virtio
> >>>> devices before unregistering them, and expose RSC_VDEV_V2 reset state
> >>>> in debugfs.
> >>>>
> >>>> Assisted-by: Codex:GPT-5
> >>>> Signed-off-by: Tanmay Shah <tanmay.shah@amd.com>
> >>>> ---
> >>>>  drivers/remoteproc/remoteproc_core.c     |  3 +-
> >>>>  drivers/remoteproc/remoteproc_debugfs.c  | 29 +++++++++++++++-
> >>>>  drivers/remoteproc/remoteproc_internal.h | 21 +++++++++++
> >>>>  drivers/remoteproc/remoteproc_virtio.c   | 44 ++++++++++++++++++++++--
> >>>>  include/linux/rsc_table.h                |  5 ++-
> >>>>  5 files changed, 97 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> >>>> index 1ed406714849..31d79684977c 100644
> >>>> --- a/drivers/remoteproc/remoteproc_core.c
> >>>> +++ b/drivers/remoteproc/remoteproc_core.c
> >>>> @@ -471,6 +471,7 @@ void rproc_remove_rvdev(struct rproc_vdev *rvdev)
> >>>>  static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >>>>                         int offset, int avail)
> >>>>  {
> >>>> +  struct fw_rsc_hdr *hdr = ptr - sizeof(*hdr);
> >>>
> >>> Spurious change.
> >>>
> >>
> >> Ack will remove it.
> >>
> >>>>    struct fw_rsc_vdev *rsc = ptr;
> >>>>    struct device *dev = &rproc->dev;
> >>>>    struct rproc_vdev *rvdev;
> >>>> @@ -485,7 +486,6 @@ static int rproc_handle_vdev(struct rproc *rproc, void *ptr,
> >>>>            return -EINVAL;
> >>>>    }
> >>>>
> >>>> -  /* make sure reserved bytes are zeroes */
> >>>
> >>> Same
> >>
> >> Ack, will be removed.
> >>
> >>>
> >>>>    if (rsc->reserved[0] || rsc->reserved[1]) {
> >>>>            dev_err(dev, "vdev rsc has non zero reserved bytes\n");
> >>>>            return -EINVAL;
> >>>> @@ -1009,6 +1009,7 @@ static rproc_handle_resource_t rproc_loading_handlers[RSC_LAST] = {
> >>>>    [RSC_DEVMEM] = rproc_handle_devmem,
> >>>>    [RSC_TRACE] = rproc_handle_trace,
> >>>>    [RSC_VDEV] = rproc_handle_vdev,
> >>>> +  [RSC_VDEV_V2] = rproc_handle_vdev,
> >>>>  };
> >>>>
> >>>>  struct rproc_rsc_cb_data {
> >>>> diff --git a/drivers/remoteproc/remoteproc_debugfs.c b/drivers/remoteproc/remoteproc_debugfs.c
> >>>> index b86c1d09c70c..1fe99749f5b4 100644
> >>>> --- a/drivers/remoteproc/remoteproc_debugfs.c
> >>>> +++ b/drivers/remoteproc/remoteproc_debugfs.c
> >>>> @@ -274,7 +274,7 @@ static const struct file_operations rproc_crash_ops = {
> >>>>  /* Expose resource table content via debugfs */
> >>>>  static int rproc_rsc_table_show(struct seq_file *seq, void *p)
> >>>>  {
> >>>> -  static const char * const types[] = {"carveout", "devmem", "trace", "vdev"};
> >>>> +  static const char * const types[] = {"carveout", "devmem", "trace", "vdev", "vdev_v2"};
> >>>>    struct rproc *rproc = seq->private;
> >>>>    struct resource_table *table = rproc->table_ptr;
> >>>>    struct fw_rsc_carveout *c;
> >>>> @@ -336,6 +336,33 @@ static int rproc_rsc_table_show(struct seq_file *seq, void *p)
> >>>>                    seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> >>>>                               v->reserved[0], v->reserved[1]);
> >>>>
> >>>> +                  for (j = 0; j < v->num_of_vrings; j++) {
> >>>> +                          seq_printf(seq, "  Vring %d\n", j);
> >>>> +                          seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> >>>> +                          seq_printf(seq, "    Alignment %d\n", v->vring[j].align);
> >>>> +                          seq_printf(seq, "    Number of buffers %d\n", v->vring[j].num);
> >>>> +                          seq_printf(seq, "    Notify ID %d\n", v->vring[j].notifyid);
> >>>> +                          seq_printf(seq, "    Physical Address 0x%x\n\n",
> >>>> +                                     v->vring[j].pa);
> >>>> +                  }
> >>>> +                  break;
> >>>> +          case RSC_VDEV_V2:
> >>>> +                  v = rsc;
> >>>> +                  seq_printf(seq, "Entry %d is of type %s\n", i, types[hdr->type]);
> >>>> +
> >>>> +                  seq_printf(seq, "  ID %d\n", v->id);
> >>>> +                  seq_printf(seq, "  Notify ID %d\n", v->notifyid);
> >>>> +                  seq_printf(seq, "  Device features 0x%x\n", v->dfeatures);
> >>>> +                  seq_printf(seq, "  Guest features 0x%x\n", v->gfeatures);
> >>>> +                  seq_printf(seq, "  Config length 0x%x\n", v->config_len);
> >>>> +                  seq_printf(seq, "  Status 0x%x\n", v->status);
> >>>> +                  seq_printf(seq, "  Number of vrings %d\n", v->num_of_vrings);
> >>>> +                  seq_printf(seq, "  Reset request pending %s\n",
> >>>> +                             rproc_rsc_vdev_reset_requested(v->status) ?
> >>>> +                             "yes" : "no");
> >>>> +                  seq_printf(seq, "  Reserved (should be zero) [%d][%d]\n\n",
> >>>> +                             v->reserved[0], v->reserved[1]);
> >>>> +
> >>>>                    for (j = 0; j < v->num_of_vrings; j++) {
> >>>>                            seq_printf(seq, "  Vring %d\n", j);
> >>>>                            seq_printf(seq, "    Device Address 0x%x\n", v->vring[j].da);
> >>>> diff --git a/drivers/remoteproc/remoteproc_internal.h b/drivers/remoteproc/remoteproc_internal.h
> >>>> index 3a742ef6ef60..f07a96ff82a4 100644
> >>>> --- a/drivers/remoteproc/remoteproc_internal.h
> >>>> +++ b/drivers/remoteproc/remoteproc_internal.h
> >>>> @@ -14,6 +14,7 @@
> >>>>
> >>>>  #include <linux/irqreturn.h>
> >>>>  #include <linux/firmware.h>
> >>>> +#include <linux/virtio_config.h>
> >>>>  #ifdef CONFIG_HAS_IOMEM
> >>>>  #include <linux/io.h>
> >>>>  #endif
> >>>> @@ -42,6 +43,26 @@ struct rproc_vdev_data {
> >>>>    struct fw_rsc_vdev *rsc;
> >>>>  };
> >>>>
> >>>> +/*
> >>>> + * RSC_VDEV_V2 requests an acknowledged reset by writing an otherwise
> >>>> + * impossible virtio status pattern: DRIVER and FAILED set while
> >>>> + * ACKNOWLEDGE is clear. Other status bits are left unchanged.
> >>>> + */
> >>>> +static inline u8 rproc_rsc_vdev_reset_status(u8 status)
> >>>> +{
> >>>> +  status |= VIRTIO_CONFIG_S_DRIVER | VIRTIO_CONFIG_S_FAILED;
> >>>> +  status &= ~VIRTIO_CONFIG_S_ACKNOWLEDGE;
> >>>> +
> >>>> +  return status;
> >>>> +}
> >>>> +
> >>>> +static inline bool rproc_rsc_vdev_reset_requested(u8 status)
> >>>> +{
> >>>> +  return !(status & VIRTIO_CONFIG_S_ACKNOWLEDGE) &&
> >>>> +         (status & VIRTIO_CONFIG_S_DRIVER) &&
> >>>> +         (status & VIRTIO_CONFIG_S_FAILED);
> >>>> +}
> >>>> +
> >>>>  static inline bool rproc_has_feature(struct rproc *rproc, unsigned int feature)
> >>>>  {
> >>>>    return test_bit(feature, rproc->features);
> >>>> diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
> >>>> index d5e9ff045a28..e682caa546b2 100644
> >>>> --- a/drivers/remoteproc/remoteproc_virtio.c
> >>>> +++ b/drivers/remoteproc/remoteproc_virtio.c
> >>>> @@ -13,6 +13,7 @@
> >>>>  #include <linux/dma-map-ops.h>
> >>>>  #include <linux/dma-mapping.h>
> >>>>  #include <linux/export.h>
> >>>> +#include <linux/iopoll.h>
> >>>>  #include <linux/of_reserved_mem.h>
> >>>>  #include <linux/platform_device.h>
> >>>>  #include <linux/remoteproc.h>
> >>>> @@ -234,12 +235,48 @@ static void rproc_virtio_set_status(struct virtio_device *vdev, u8 status)
> >>>>  static void rproc_virtio_reset(struct virtio_device *vdev)
> >>>>  {
> >>>>    struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
> >>>> +  struct rproc *rproc = rvdev->rproc;
> >>>>    struct fw_rsc_vdev *rsc;
> >>>> +  struct fw_rsc_hdr *hdr;
> >>>> +  int ret;
> >>>> +  u8 val;
> >>>> +
> >>>> +  /*
> >>>> +   * During crash recovery, vdev can be stopped. But the driver can't reset
> >>>> +   * the device, as device is already crashed. In this case, reset becomes
> >>>> +   * no op.
> >>>> +   */
> >>>> +  if (rproc->state == RPROC_CRASHED)
> >>>> +          return;
> >>>>
> >>>>    rsc = (void *)rvdev->rproc->table_ptr + rvdev->rsc_offset;
> >>>> +  hdr = (void *)rsc - sizeof(*hdr);
> >>>> +
> >>>> +  if (hdr->type == RSC_VDEV_V2) {
> >>>> +          /*
> >>>> +           * RSC_VDEV_V2 encodes an acknowledged reset request in the
> >>>> +           * status byte. The remote is expected to complete the reset
> >>>> +           * and then clear status back to 0.
> >>>> +           */
> >>>> +          rsc->status = rproc_rsc_vdev_reset_status(rsc->status);
> >>>> +
> >>>> +          /* after setting reset request, kick the device */
> >>>> +          rproc->ops->kick(rproc, rsc->notifyid);
> >>>>
> >>>> -  rsc->status = 0;
> >>>> -  dev_dbg(&vdev->dev, "reset !\n");
> >>>> +          /*
> >>>> +           * When device completes reset, it is expected to set status
> >>>> +           * to 0.
> >>>> +           */
> >>>> +          ret = readb_poll_timeout(&rsc->status, val, val == 0,
> >>>> +                                   1000,      /* 1ms between reads */
> >>>> +                                   3000000);  /* 3s total timeout */
> >>>> +          if (ret)
> >>>> +                  dev_warn(&vdev->dev, "vdev reset timed out\n");
> >>>
> >>> The problem here is that we are introducing behavior that is not compliant with
> >>> the virtio specifications.  One way to acheive the same behavior could be for
> >>> the remote processor to check rsc->status before sending a interrupt of using
> >>> the virtqueues.
> >>>
> >>
> >> That is what remote is supposed to do. But what if remote do not
> >> respond? If remote is deadlocked for some reason, then the Linux will
> >> hang at this point too. That is why we need some kind of timeout.
> >
> > If the remote is dead then a watchdog timer should fire at some point.
> > Moreover, that situation won't be different from other circumstances where a
> > remote processor locks up.
> >
>
> There are few concerns:
>
> 1) Heterogeneous system where Linux is handling many remotes, the
> watchdog might not be available to all the remotes or watchdog mechanism
> is not implemented at all on the remote side.

If a watchdog is not available adding a timeout upon resetting
rsc-status won't help.

>
> 2) Let's say watchdog is configured for 10s, or so then for that long
> Linux will be stuck too. I am trying to avoid this case where Linux gets
> stuck for long time.

Same resoning as above - if the remote processor dies and a watchdog
timeout is set for 10 seconds, adding a shorter timeout when
rsc->status is modified will do very little.

> > Looking at your patch, sending a kick() won't do anything for a dead remote
> > processor.  If the remote processor is alive, it should monitor rsc->status and
> > take action when it is set to '0' by the host.  If it is locked-up, the normal
> > lockup procedure should apply.
> >
>
> Notifying virtio device on the status change is standard virtio
> mechanism. In the virtio statck it's done via virtqueue_notify so I am
> trying to do the same. It also helps remote to avoid polling on status.
>

Can you point me to that code?  Having the same mental picture will help.

> > I'm not sure what problem this patch is trying to address.
> >
>
> Some platforms allow Linux and Remote boot independently.
>
> Let's say Linux reboots without reseting the remote then during next
> boot Linux will find virtio status is not in the reset state.
>

That should be handled via the attach()/detach() state machine.

> In such case, linux need to issue virtio device reset, and wait until
> RPU completes the reset and start the device again. The virtio framework
> already issues the reset during boot here:
> https://git.kernel.org/pub/scm/linux/kernel/git/remoteproc/linux.git/tree/drivers/virtio/virtio.c?h=for-next#n570
>
> However, the virtio_reset implementation for remoteproc_virtio simply
> set the status to 0, and doesn't wait for the remote to complete the
> reset. Due to this, attach operation becomes successfull, but the rpmsg
> channels are not created on the linux side.
>

I think this situation should be handled in driver code rather than
the remoteproc framework.  We can consider adding this to the
remoteproc framework if/when several platforms implement the same
logic.  Otherwise I fear we'll bloat the framework with something that
isn't generic.

> This patch solves this issue. It changes the reset mechanism while
> maintaining the backward compatibility for old way of reseting the device.
>
> I had sent a different patch regarding this before:
> https://lore.kernel.org/linux-remoteproc/20260317201251.3920841-1-tanmay.shah@amd.com/
>
> Old patch was rejected because we decided to modify the reset mechanism
> instead:
> https://lists.openampproject.org/archives/list/openamp-rp@lists.openampproject.org/thread/DDIFUMGQQ2R7CQZJHK7EB6UDO3ISAAVU/
>
> Thank You,
> Tanmay
>
>
> >>
> >> I think timeout mechanism is better for AMP systems over waiting forever
> >> for remote to clear the status.
> >>
> >> Thanks,
> >> Tanmay
> >>
> >>
> >>>> +  } else {
> >>>> +          /* back compatible for RSC_VDEV type of rsc vdev */
> >>>> +          rsc->status = 0;
> >>>> +  }
> >>>> +  dev_info(&vdev->dev, "reset !\n");
> >>>>  }
> >>>>
> >>>>  /* provide the vdev features as retrieved from the firmware */
> >>>> @@ -469,6 +506,9 @@ static int rproc_remove_virtio_dev(struct device *dev, void *data)
> >>>>  {
> >>>>    struct virtio_device *vdev = dev_to_virtio(dev);
> >>>>
> >>>> +  /* reset virtio device before unregister */
> >>>> +  virtio_reset_device(vdev);
> >>>> +
> >>>
> >>> Regardless of this feature, I think it is wise to reset the device before
> >>> unregistering with the virtio subsystem.
> >>>
> >>
> >> Agreed. I intend to keep this.
> >>
> >>> Thanks,
> >>> Mathieu
> >>>
> >>>>    unregister_virtio_device(vdev);
> >>>>    return 0;
> >>>>  }
> >>>> diff --git a/include/linux/rsc_table.h b/include/linux/rsc_table.h
> >>>> index 71b60125310e..2398a6d7033e 100644
> >>>> --- a/include/linux/rsc_table.h
> >>>> +++ b/include/linux/rsc_table.h
> >>>> @@ -66,6 +66,8 @@ struct fw_rsc_hdr {
> >>>>   *                    the remote processor will be writing logs.
> >>>>   * @RSC_VDEV:       declare support for a virtio device, and serve as its
> >>>>   *                    virtio header.
> >>>> + * @RSC_VDEV_V2:    declare support for a virtio device whose reset request is
> >>>> + *                    encoded in the virtio status byte.
> >>>>   * @RSC_LAST:       just keep this one at the end of standard resources
> >>>>   * @RSC_VENDOR_START:     start of the vendor specific resource types range
> >>>>   * @RSC_VENDOR_END:       end of the vendor specific resource types range
> >>>> @@ -83,7 +85,8 @@ enum fw_resource_type {
> >>>>    RSC_DEVMEM              = 1,
> >>>>    RSC_TRACE               = 2,
> >>>>    RSC_VDEV                = 3,
> >>>> -  RSC_LAST                = 4,
> >>>> +  RSC_VDEV_V2             = 4,
> >>>> +  RSC_LAST                = 5,
> >>>>    RSC_VENDOR_START        = 128,
> >>>>    RSC_VENDOR_END          = 512,
> >>>>  };
> >>>>
> >>>> base-commit: d4d61a4b0a52e8f3cdb3e1578602850a3452ec3e
> >>>> --
> >>>> 2.43.0
> >>>>
> >>
>
