Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBC53C8C60
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789541191; cv=pass; b=cd0Xl7zvLQE0d1+1powM/BxNDxIoF+jphE1MqpZGH5A/cqQQoplxCJLxmw22rSg4+ndGoxvXPC49Oj7s3Z80IBzLWu75FhJ8/myj2IJQug2ks+GvmoBEEZq40Dr3nlqT7nJlXbDawbr+FlKYR2Fy8PAfcPtf3RPMSHsyKtcSYMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789541191; c=relaxed/simple;
	bh=XlFiHTz+Dihyzf4MnSf1LVtKdUui8dM4W7PbZ/5Xzys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OQnuXGlNMeMsXjVB96659QI/feothD5MYWIoztxJ4dhpzK173d3uAjZoy8TqOvDxWuiCbe860F/bFcKmPa+eDJPj4sLFz6TDwKNC/2Mnrtkxfr1KMbtq9Y9y1Qr2GBgxtvCIhdyhHVjsW5rQS+Xg7+gA8pR//9z79ojjyfMG7mo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbgIMqyb; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbgIMqyb"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b79784a6edso636206e87.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 23:46:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789541188; cv=none;
        d=google.com; s=arc-20260327;
        b=Hh7NGZ9v6pYnNJo54NpXF/lA5tv+visusGl3UM6Uqs7y6p2CncgvJh9Omr4sTJE4qd
         D8BYbyzyW2RVhxHzucNYMgQ+FKhoqfgQXZ8XwNOg+9b5GOwXzYX44BgPGOU1AVBDm4gN
         +6KZD5Eu5kounzA2FYVTbUxkEPLVgRDAuwB/Teszi1UOfWKPlzRt0pxEMXhEBT55vlQU
         LUm4DmaegpF9Di+CzlU1pbw64zRxY2Ax/pqhjFMhvB3SNkfDYiJr7Yr8StNo2IdiSOGH
         ZlnLI4rzRNwIKLeSnn8CYtvwxXWQegf/mCKWajNJX/3y/jHyR7psDmd5GUvqACmzb9Hq
         BZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P6xB9GyEAaDD3YuwcLClG2nTPjFhbGFjC7xAq098W0Q=;
        fh=xMA8rsav9xrk9mhx8FrF9ZUWpuKwEukl3+aS+0PaXxw=;
        b=SiJWE3DFOW0Hn7h44VcbcMxO8lfK8QlG/UyyrfZ+FHnHN9Ili7W+wQtLluLBpjS4/A
         3QZ3qytGU+JBdteCD6WUzYumT23chOaID4N5Tc+2SybJB3+1S4KUCrc6Qzr0XPUre99u
         b1F3ZTUGdHOsKpFq65yT4S55hc+esSpjeSBm7d3v+nJqG9NEDbcdo4p04j5uEwWHJC5+
         1KAhqLrVlBZc1g0uY+/v6dhkoMGC6qqBSoL5OKPnckF2rUIfj35KSHlpRqerkgKCl/Hq
         N/zR7VNQPCzfDfV1J8iZhybLrttT/E2zL5XsI5AaHxueTF7sjlofFoU2nYxpjVAO5zT/
         fOkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789541188; x=1790145988; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P6xB9GyEAaDD3YuwcLClG2nTPjFhbGFjC7xAq098W0Q=;
        b=DbgIMqybNMAHy3dFCLYZAOQaZXe30HdQLKVkW9dvcDfRyfG5cUnWvDUKt5ddF/N0zR
         hTfELwzEbiibJKlEI/fhn97L3ZkOGYVjvC2WEGO3gtYAJAk+meTsmzna+Kj4X1jOf/LL
         MA2eUF6H0LadtFQbC8yWvg8L+rOvNvtIpbMvQysKOnl31Sfzty/DYavwgreEyeHD3O5G
         qjkMFLT6I3Xiloj8bGJuKjHfZbIntWF0pJ2ZYOzDw6qZ6frQNUhRVJ67+JoBvoHne7WG
         /J6Z/oIYeGZTMJSFDGnuDC+4ucu7zN+eLcFD0ptHFVmlSVvYJIzwe9eOt3D7w1C+v1xp
         VW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789541188; x=1790145988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P6xB9GyEAaDD3YuwcLClG2nTPjFhbGFjC7xAq098W0Q=;
        b=LiCIMOGfj7XNcyrQfOju089LKoNuhlLE9QCOcF/dTEto0Ep95Ebr1fOWcvz67ZQJLR
         ugtLtl12bMGbXvjkc9pZC/mlML9fH9xddqYPDUVLtwXmIn89RfZCmYsh/0ybGQXNwE1N
         u8CLj7d6TzqETVU5uOlkDwzjqIhYAY1FoZUCBH4oI23PyJ2BVU6h28zYlj+2dlabpAoX
         yNgJpyQPSFwGBDBWwZ3EiAgw9g8076+TszLqYdl1Usv/A5KD6P2P5cI1ckWQb+qmR4uH
         /A2d9WuaxWhiCQnj1ZbOEMpegmAUHwJdqp9HacXQWu/T8lTmGAVT1WmaMThMPa6i+hrO
         yofA==
X-Forwarded-Encrypted: i=1; AKwUvBz09qajgd/CZxl7KLJcvH3WtPyAINDmd9W1w4ZQJrn1a5k2yl3YGXEpHV+KGWR7tL8FuHxNIdazNmmxPrc=@vger.kernel.org
X-Gm-Message-State: AFuF++nd6+npXBRxRcWjmn73a++pkJboXSX2fx0EyNba+yor4dD3zLyd
	j4fM7MPldagwJeq96g60WDbgDJ3aAj6HX+8RN4utYT0jpw35M+7AHpkwbSthPocQptENMATr6Uy
	jtZ3Rge6hTCl1NFDCmORod3EPYCuf2TE=
X-Gm-Gg: AYBFou2OrKT4p1ioPjrS0DMKv8kLeG6ksdcKRQWcKJ5MMfJggfcZQ37ah1WphzAx9Wo
	Ipa6rkw/DwI2l+cRuC8FaHPzyW8Ig+SX+LXAayFZWjvAMTOSbSVnY+iEKg0dtq+dppeiU/JB3qr
	Oc7r3pnCO/mABxJy8cjDChbcwnJXwqqO4luNgmuGD6xe02mF12jzN27EP7K5XmCyPAB8ogjo/V6
	nyunTL7QIdJyZZND4N3ujOB+cXO7Q8Cu3n1bcqSBcFVr+d85cWAwixaFYDZh2KsqB02fYjcpTwN
	qivm9h2+zu5DilqZgyENB9JwdSFsQo3kemWk7AjWxdq5iPwAMl8lrtrDj20dGZZajPzk
X-Received: by 2002:a05:6512:1194:b0:5b6:17b6:f8d3 with SMTP id
 2adb3069b0e04-5b8b661e63amr330005e87.24.1789541187235; Tue, 15 Sep 2026
 23:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-fix-warning-in-sbitmap_get-v1-1-767c2c211a2b@gmail.com> <7a2ed1bc-bf7a-4744-84e2-72c79bd36f2a@oracle.com>
In-Reply-To: <7a2ed1bc-bf7a-4744-84e2-72c79bd36f2a@oracle.com>
From: Linfeng Sun <linfeng.sun.dev@gmail.com>
Date: Wed, 16 Sep 2026 14:46:12 +0800
X-Gm-Features: AcwNN1WNBnS3VJCLq8kKpzJnYh_F0LVNR17Lgzi-0b2V4lV0sCpEsqAPTIpRIks
Message-ID: <CA+kkGbsOD15psKucuvm2JEjHhjQdd3p+9439wK77JHkhqAvGYQ@mail.gmail.com>
Subject: Re: [PATCH] vhost-scsi: initialize command pools for late I/O virtqueues
To: Mike Christie <michael.christie@oracle.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 15, 2026 at 04:38:38PM -0500, Mike Christie wrote:
> On 9/8/26 9:30 AM, Linfeng Sun wrote:
> > vhost_scsi_set_endpoint() allocates command pools only for I/O virtqueues that
> > are already set up, but publishes the backend for every virtqueue. If userspace
> > finishes configuring a skipped queue later, a kick reaches vhost_scsi_get_cmd() with
> >
> >
> > vhost_scsi_set_endpoint() allocates command pools only for I/O virtqueues
> > that are already set up, but publishes the backend for every virtqueue. If
> > userspace finishes configuring a skipped queue later, a kick reaches
> > vhost_scsi_get_cmd() with scsi_tags uninitialized and triggers the
> > !sb->alloc_hint warning in sbitmap_get().
> >
> > Leave skipped I/O virtqueues inactive at SET_ENDPOINT. When SET_VRING_ADDR
> > later completes their setup, allocate the command pools and activate the
> > queues. Roll back both if access initialization fails.
> >
> > Fixes: 25b98b64e284 ("vhost scsi: alloc cmds per vq instead of session")
> > Signed-off-by: Linfeng Sun <linfeng.sun.dev@gmail.com>
> > ---
> > I checked QEMU and found no evidence it's affected. I haven't checked
> > VirtualBox because I am not familiar with it. However, the virtio spec
> > doesn't require a specific operation order, so a new VMM could still
> > trigger this issue.
> >
> > Crash log:
> > [   34.698961] ------------[ cut here ]------------
> > [   34.699385] WARNING: lib/sbitmap.c:286 at sbitmap_get+0x227/0x270, CPU#0: vhost-82/88
> > [   34.700542] Modules linked in:
> > [   34.701309] CPU: 0 UID: 0 PID: 88 Comm: vhost-82 Not tainted 7.3.0-rc2+ #14 PREEMPT(full)
> > [   34.701958] Hardware name: QEMU Ubuntu 24.04 PC v2 (i440FX + PIIX, arch_caps fix, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
> > [   34.702717] RIP: 0010:sbitmap_get+0x227/0x270
> > [   34.703247] Code: 41 8d 5d 01 89 df 44 89 fe e8 f5 3a 46 ff 31 c0 44 39 fb 0f 43 d8 e8 38 46 46 ff 65 41 89 1c 24 e9 25 ff ff ff e8 29 46 46 ff <0f> 0b eb ba e8 20 46 46 ff 44 89 fe 31 ff 45 31 e4 e8 c3 3b 46 ff
> > [   34.704234] RSP: 0018:ffffc90000ec3bb0 EFLAGS: 00000246
> > [   34.704677] RAX: 0000000000000000 RBX: ffff88800500dee8 RCX: 0000000000000000
> > [   34.705166] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffff88800500dee8
> > [   34.705584] RBP: ffffc90000ec3be0 R08: 0000000000000000 R09: 0000000000000000
> > [   34.705988] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000006
> > [   34.706477] R13: 0000000000000000 R14: 0000000000000000 R15: ffff8880050094d0
> > [   34.706955] FS:  0000000014d05380(0000) GS:ffff888099c36000(0000) knlGS:0000000000000000
> > [   34.707463] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [   34.707854] CR2: 00007c0c3c20e000 CR3: 0000000008e47000 CR4: 00000000000006f0
> > [   34.708592] Call Trace:
> > [   34.709259]  <TASK>
> > [   34.709822]  vhost_scsi_handle_vq+0x4a9/0x1b20
> > [   34.710437]  ? update_cfs_rq_load_avg+0x2e/0x230
> > [   34.710874]  vhost_scsi_handle_kick+0x2c/0x40
> > [   34.711292]  vhost_run_work_list+0xa6/0xf0
> > [   34.711673]  vhost_task_fn+0x76/0x1b0
> > [   34.712003]  ? __sanitizer_cov_trace_const_cmp1+0x1a/0x30
> > [   34.712506]  ? recalc_sigpending+0xe1/0x130
> > [   34.712890]  ? __pfx_vhost_task_fn+0x10/0x10
> > [   34.713325]  ret_from_fork+0x37a/0x630
> > [   34.713673]  ? __pfx_vhost_task_fn+0x10/0x10
> > [   34.714031]  ret_from_fork_asm+0x1a/0x30
> > [   34.714535] RIP: 0033:0x0
> > [   34.715201] Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> > [   34.715587] RSP: 002b:0000000000000000 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> > [   34.716158] RAX: 0000000000000000 RBX: 000000000048bb20 RCX: 000000000041ca3d
> > [   34.716571] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000003
> > [   34.716957] RBP: 00007ffcac47c4e0 R08: 00000000ffffffff R09: 0000000000000000
> > [   34.717418] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000004
> > [   34.717826] R13: 00007ffcac47c778 R14: 00000000004af868 R15: 0000000000000001
> > [   34.718363]  </TASK>
> > ---
> >   drivers/vhost/scsi.c | 44 ++++++++++++++++++++++++++++++++++++++++++--
> >   1 file changed, 42 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/vhost/scsi.c b/drivers/vhost/scsi.c
> > index 4f8c0260bc9e..069a6ff4dd40 100644
> > --- a/drivers/vhost/scsi.c
> > +++ b/drivers/vhost/scsi.c
> > @@ -2008,6 +2008,40 @@ static int vhost_scsi_setup_vq_cmds(struct vhost_virtqueue *vq, int max_cmds)
> >     return -ENOMEM;
> >   }
> >
> > +/* Callers must hold dev mutex. */
> > +static int vhost_scsi_activate_vqs(struct vhost_scsi *vs)
> > +{
> > +   struct vhost_virtqueue *vq;
> > +   int i, ret = 0;
> > +
> > +   if (!vs->vs_tpg)
> > +           return 0;
> > +
> > +   for (i = VHOST_SCSI_VQ_IO; i < vs->dev.nvqs; i++) {
> > +           vq = &vs->vqs[i].vq;
> > +           mutex_lock(&vq->mutex);
> > +           if (vhost_vq_get_backend(vq) || !vhost_vq_is_setup(vq))
> > +                   goto unlock;
> > +
> > +           ret = vhost_scsi_setup_vq_cmds(vq, vq->num);
> > +           if (ret)
> > +                   goto unlock;
> > +
> > +           vhost_vq_set_backend(vq, vs->vs_tpg);
> > +           ret = vhost_vq_init_access(vq);
> > +           if (ret) {
> > +                   vhost_vq_set_backend(vq, NULL);
> > +                   vhost_scsi_destroy_vq_cmds(vq);
> > +           }
> > +unlock:
> > +           mutex_unlock(&vq->mutex);
> > +           if (ret)
> > +                   break;
> > +   }
> > +
> > +   return ret;
> > +}
> > +
> >   /*
> >    * Called from vhost_scsi_ioctl() context to walk the list of available
> >    * vhost_scsi_tpg with an active struct vhost_scsi_nexus
> > @@ -2105,6 +2139,9 @@ vhost_scsi_set_endpoint(struct vhost_scsi *vs,
> >
> >             for (i = 0; i < vs->dev.nvqs; i++) {
> >                     vq = &vs->vqs[i].vq;
> > +                   if (i >= VHOST_SCSI_VQ_IO && !vs->vqs[i].scsi_cmds)
> > +                           continue;
> > +
> >                     mutex_lock(&vq->mutex);>                        vhost_vq_set_backend(vq, vs_tpg);
> >                     vhost_vq_init_access(vq);
> > @@ -2466,10 +2503,13 @@ vhost_scsi_ioctl(struct file *f,
> >     default:
> >             mutex_lock(&vs->dev.mutex);
> >             r = vhost_dev_ioctl(&vs->dev, ioctl, argp);
> > -           if (r == -ENOIOCTLCMD)
> > +           if (r == -ENOIOCTLCMD) {
> >                     r = vhost_vring_ioctl(&vs->dev, ioctl, argp);
> > -           else
> > +                   if (!r && ioctl == VHOST_SET_VRING_ADDR)
> > +                           r = vhost_scsi_activate_vqs(vs);
> Is it ok to just not support the delayed setup? So just do the
> fix in vhost_scsi_set_endpoint?
>
A later SET_VRING_ADDR would still succeed while leaving the queue
inactive. If we donot support it, I think it should fail explicitly
instead of causing a silent I/O stall.

> Is this a useful feature?
>
No current VMM appears to rely on it, but the UAPI does not specify this
ordering. A new VMM could reasonably use it.

> I don't think net supports it. When it does the vhost_net_set_backend
> call it does vhost_vq_access_ok. If it's not ready to go then it
> returns failure.
>
Right, net returns an error for that VQ. Simply skipping a scsi VQ would
make the later ioctl succeed without activating it.

> If we supported this, then I think vhost_scsi_activate_vqs should
> active the specific virtqueue that VHOST_SET_VRING_ADDR is called
> for.

Agreed. I will change it to activate only that virtqueue.
