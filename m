Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792544485;
	b=DapBSS4fkF04SSn28IB2s6Oj7l7HOfGhUbApAC+RDnVUCvm+2/ynW2k+ggfb7v8Oo3wd
	 Lio0R4+ynFpl+zVuwfITr2odpixFbuYThmfV2VFBsjUnEBwNBtJfii3k1VFrRwZ+foWAT
	 Kj28zpsuQAtDL24FU2VK9jd3WHj04o77aRILxwvkJLKpPSYRwe40g6Vs7UMdBOC/vwBLi
	 mM+HCvj1r9ZTjTkYwRYfaUN1NACkm6nxU0kxMajW9H1fxZ/upzsFBHhNH0OyLQBdLmXX1
	 BF7pFGTj0rQJAUEvWK/l13Y4ljVSmMJZBA+LYlBjDsHG9V8gE3QnJO0x14IsXQClA4Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792544485;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=zv4v9mywYl+AK1vWFeNrf6/w5gOM9zmsMP2K5/SuJaM=;
	b=QVAiwiq6flw+vM0UmHd49kySx568XSqnYIOMX5JOoto7MQI1gfKwUfoStDGKsFXUjkEI
	 cxUe0zqrFOZuz/pucauiFftVc77PRH8Wz1//HejWLb4xGOWtVxtX5eiYPfIXfld/XN6vX
	 Qshv80noYgvFsIp/DDpmBgNnx9Lh+MbZMlB+sH/9QYBBZGJtBTdK1o9FuYycSbw2dA2q0
	 yO8RgeDPdYnnBS6FldhBG8jfbsDGKvf2h/BDm21cNSFvMBNXv2KChHRr9RMy9sCqp8RDV
	 ZLVcecjvulPridXMbyCUSnVbT6hhV8GBtwxslfMB3i0zwDUUPyzy5sU65zQRTvbb6Vw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TARDGcDT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 794BF606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:01:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 794BF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TARDGcDT
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f699fe49b3so141089b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:01:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792544483; cv=none;
        d=google.com; s=arc-20260327;
        b=oQu+mGBA6bemjE7EvftP3zNUueBRDMP1uMLEuvaC3Y17zm6hNJJ9Fx/BHKpDZnCUrr
         80p0Uz+NwaOitENSWsHkePnllTgVN/OLUxv+dt2WQHPYXvCac8/y62GCOA3eEYlYa2Dj
         2E5jNTd8vVU3JPauwHCg8fDS3uno2OfWLgJqaxv+n1+q2x2atKpPvoRrTV6/gSAjRY7B
         /KjwVH63uPtk2RBXagkP6Fll0whvjp85eftxJmK1QRkm9oPYR8svROl8sH21cWUZhVpW
         Q9PMaiiYYw8EUzI2fz7NaQ40l0z7e9dPUWTNjwmfxXrz0p5LHljWPVl8r6pfwNdNf7lh
         1Pfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zv4v9mywYl+AK1vWFeNrf6/w5gOM9zmsMP2K5/SuJaM=;
        fh=w7wZi5mUvaQtmNN3qheEm/Z7KXVMG84n/2sI2j0wDIA=;
        b=KNUZYBxydL4V8YhaRbsXbE7KR6jxTFJL3QUEmUlm9STKes8wGn/LiXVJOe6IQlTSPX
         9rDlgT6mgrnSGVkZavB5zE8VNyJQ0mokK6WwYsl0vFqDNqo5aszIa6U1rnr5Ooekw/RS
         scQbf/9eATZi91vXFjJ+OPDk7hDHYNFDjRwZ4zhI9ZTxjFPED7B8Ms2gg9bxnjBOZ68t
         1KCByaEI2W9Q1jIRN5bXM7dKiyIwAhMGaxZIy/4MLiSoReF7m7ZCa91C/mMBraU6Ij6n
         BVkmMYxMeW0Ic5PCwlrbSmGBX65ySFjaaHfDKWx9FY9W8Hev9vYZ012QQ8grFUfrP3x9
         Jgbg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792544483; x=1793149283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zv4v9mywYl+AK1vWFeNrf6/w5gOM9zmsMP2K5/SuJaM=;
        b=TARDGcDTt7hEWYBakf0H3mUOO8T2JBqyoYbvuqIfMqkrCBAOa5hNhWDAJA+Q6llIHV
         SHlSHecXCwQvYI2VGO20FDgye1zeUy4mUFfgRXUcNUCV/jwb6msBIEE2ltWKWf7xE1fA
         +rmfI8cTOORczWM4hH79IKM13+O0NeEcRgV8Dk9obo6hNnHOxDSZvT+MAp1UeziF9XzE
         xxQeyM6C+YQRBwjdLCePxcvaUG5W7IioY50luvu375vL3Nhdd/IRHgsRvlTAdPgDHi1v
         PK9g/yI+Is3ROgVAeFBLSdYCuL9swOePv9Eaqx0hTnaXBDKXsLfPi/zZSv9dIf+pbAhH
         B5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792544483; x=1793149283;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zv4v9mywYl+AK1vWFeNrf6/w5gOM9zmsMP2K5/SuJaM=;
        b=X65H7nQ+f74imYvd12P0K6KAJtddfvjEoSxBucifszTGsvPKdsTDJYAEQAsF1Xmyk1
         2FTh9KhfI56OkTn8v/MvAoKzWbeXHbk5dqSJ1iUrwlHvH0dXpoevgIqwe/0par4A5Xw7
         UG/aMOqO9VxEU95aq9bJ1TdsakN56qjeCvm+DwjFzASnJLoPuZxfBPeJLfjLTLu1GVln
         QhCVTSdsBJfRj3H+5QrWa4GIQwm3QQB3zIc1b6PncMeBlxwNMD+hwNYbr+B2zFMb66El
         eSYNJI11ZnR4F351IJrTM72Sj/TxQeFeLUYLVAQttvm9L4kmOmXMiLoxF2aHz2T196g1
         C89Q==
X-Forwarded-Encrypted: i=1; AKwUvBzieQaCtkQiKk0SkjaHCrIyc4tkX32gCEOSanIl1n4diIYw8Hb3vxbq2ZqsYEXmpMadKZG+pbSSifhp3VU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJlrNL6l4mOivSGuzxwqw7YjTKZmKeRH5KdVc70P4NNTv7AFj/
	LRsGtGHB8jZzIzJ5Z7XVO5LS8EOmHslmjh9fjZrvYGCuVWkfxWiNbj7yDfPXHhQHGofRuRqeeWq
	OgcCkcUIyrYV0ddYGLgq8AsKc6qmrPMg=
X-Gm-Gg: AYBFou2qLfxDLE7h58RUcsC6Frbwj4xajofVtWr2g5ss0Iq01GoZOm3njqAsbJuglRc
	jeibTkxSrgSQdseOjVnW4d/yhecBLmWvF3sPqOLQWuAIioL1uzUYY1CT3nbY3ow4tJfndW7AatW
	xO2tXdtzsfZbUMvkfdS/YrUgI0h26ZWsiwkmTSpVY22TC7OQ+fed55GS+cYz2Dx2P8EJtATgT7W
	WzAOlfFRwdT2prS2/kwzObGieM874oC6ZFLzSKWj8V4nFM/CvyDco4kkrqS84BlM+2GowYj5bBh
	Dm3fhGG1sTSQ/jduGHMd7bKP6nm0159acKFamAH+Y52nJKaWr312CIHMOkoxVChDy7FO95WIE55
	o2IEX8906QumzoJeZxCjwV320RJuZ+rvZYQPcrXmtCySNgEvnnbYLIaXvN4iZQOkEswkO
X-Received: by 2002:a05:6808:2507:b0:54f:ee4e:51ed with SMTP id
 5614622812f47-553557b3c63mr401658b6e.19.1792544482984; Tue, 20 Oct 2026
 18:01:22 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261002152821.410591-1-yupeng0921@gmail.com>
In-Reply-To: <20261002152821.410591-1-yupeng0921@gmail.com>
From: peng yu <yupeng0921@gmail.com>
Date: Tue, 20 Oct 2026 18:01:12 -0700
X-Gm-Features: AclHuK_n6qsIakhZRQK5TQcKEGD7lzYcbicyH70R9FV2PExAFzVNyl2NSTa2zSY
Message-ID: <CAG3TDc1Ydhjx1GD7-ZCqmzYbZv5+DM0O7wPnzKLWJ1ycK9C2sQ@mail.gmail.com>
Subject: Re: [PATCH v8] nvmet: add cgroup_id to charge namespace I/O to a cgroup
To: Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, Chaitanya Kulkarni <kch@nvidia.com>
Cc: Keith Busch <kbusch@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Josef Bacik <josef@toxicpanda.com>, Jens Axboe <axboe@kernel.dk>, 
	Maurizio Lombardi <mlombard@arkamax.eu>, cgroups@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tejun, does this patch look good from the cgroup perspective?


On Fri, Oct 2, 2026 at 8:28=E2=80=AFAM Peng Yu <yupeng0921@gmail.com> wrote=
:
>
> nvmet issues namespace I/O from kernel threads, which are in the root
> cgroup, so io.max and the other io controller settings can't be applied
> per namespace. When namespaces on shared storage, e.g. LVM volumes on
> the same physical volumes, are exported to different users, nothing
> stops a noisy user from slowing down the others. Unlike loop, there is
> no userspace process whose cgroup could be used instead.
>
> Add a cgroup_id namespace attribute that takes a cgroup2 ID. While the
> namespace is enabled, nvmet holds the cgroup and charges each command's
> I/O to the cgroup's effective io css. Block device and file backed
> namespaces are supported, but not buffered_io: buffered writes are
> written back later by flusher threads that don't know the namespace's
> cgroup.
>
> Signed-off-by: Peng Yu <yupeng0921@gmail.com>
> Assisted-by: Claude:claude-fable-5 [Claude Code]
> Assisted-by: Claude:claude-opus-5-5 [Claude Code]
> ---
> Change since v7:
> * Write the commit message as prose (Tejun).
> * Add a Documentation/ABI/stable/configfs-nvmet entry for cgroup_id
>   (Tejun).
> * Associate the read/write, flush and zone append bios through
>   nvmet_blkcg_begin()/end() and drop nvmet_blkcg_set_bio(), so each
>   bio is associated only once (Tejun).
> * v7 1/2 was applied to cgroup/for-7.4 as d5632ae01502 ("cgroup: Track
>   the effective css in each cgroup"). This patch doesn't depend on it.
>
> v7 (with test steps): https://lore.kernel.org/all/20260929232411.101087-1=
-yupeng0921@gmail.com/
>
>  Documentation/ABI/stable/configfs-nvmet | 15 +++++++
>  drivers/nvme/target/configfs.c          | 47 +++++++++++++++++++++
>  drivers/nvme/target/core.c              | 54 +++++++++++++++++++++++++
>  drivers/nvme/target/io-cmd-bdev.c       | 22 +++++++++-
>  drivers/nvme/target/io-cmd-file.c       | 21 +++++++++-
>  drivers/nvme/target/nvmet.h             | 42 +++++++++++++++++++
>  drivers/nvme/target/zns.c               |  7 ++++
>  7 files changed, 205 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/ABI/stable/configfs-nvmet b/Documentation/ABI/=
stable/configfs-nvmet
> index 36b587404ee7..bdcb705aa8c9 100644
> --- a/Documentation/ABI/stable/configfs-nvmet
> +++ b/Documentation/ABI/stable/configfs-nvmet
> @@ -314,6 +314,21 @@ Description:
>                 attr_subsys_vendor_id: Shows or sets the PCI subsystem
>                 vendor ID. Displayed in "0x%x" format.
>
> +What:          /config/nvmet/subsystems/NAME/namespaces/NSID/cgroup_id
> +Date:          October 2026
> +KernelVersion: 7.4
> +Contact:       Peng Yu <yupeng0921@gmail.com>
> +Description:
> +               Shows or sets the cgroup2 ID of the cgroup to charge this
> +               namespace's I/O to. Writing 0 clears it. The I/O is
> +               charged to the cgroup's effective io css: the cgroup
> +               itself or its nearest ancestor with the io controller
> +               enabled. The namespace must be disabled before
> +               modification. Enabling the namespace fails if the cgroup
> +               can't be found or if buffered_io is set.
> +
> +               Only available when CONFIG_BLK_CGROUP is enabled.
> +
>  What:          /config/nvmet/hosts/HOSTNQN/dhchap_key
>  What:          /config/nvmet/hosts/HOSTNQN/dhchap_ctrl_key
>  What:          /config/nvmet/hosts/HOSTNQN/dhchap_hash
> diff --git a/drivers/nvme/target/configfs.c b/drivers/nvme/target/configf=
s.c
> index 6286e38436dd..cef832303d72 100644
> --- a/drivers/nvme/target/configfs.c
> +++ b/drivers/nvme/target/configfs.c
> @@ -561,6 +561,50 @@ static ssize_t nvmet_ns_device_path_store(struct con=
fig_item *item,
>
>  CONFIGFS_ATTR(nvmet_ns_, device_path);
>
> +#ifdef CONFIG_BLK_CGROUP
> +static ssize_t nvmet_ns_cgroup_id_show(struct config_item *item, char *p=
age)
> +{
> +       struct nvmet_ns *ns =3D to_nvmet_ns(item);
> +       struct nvmet_subsys *subsys =3D ns->subsys;
> +       ssize_t ret;
> +
> +       mutex_lock(&subsys->lock);
> +       ret =3D snprintf(page, PAGE_SIZE, "%llu\n", ns->cgroup_id);
> +       mutex_unlock(&subsys->lock);
> +       return ret;
> +}
> +
> +static ssize_t nvmet_ns_cgroup_id_store(struct config_item *item,
> +               const char *page, size_t count)
> +{
> +       struct nvmet_ns *ns =3D to_nvmet_ns(item);
> +       struct nvmet_subsys *subsys =3D ns->subsys;
> +       u64 cgroup_id;
> +       int ret;
> +
> +       ret =3D kstrtou64(page, 0, &cgroup_id);
> +       if (ret)
> +               return ret;
> +
> +       mutex_lock(&subsys->lock);
> +
> +       if (ns->enabled) {
> +               ret =3D -EBUSY;
> +               goto out_unlock;
> +       }
> +
> +       /* Writing 0 clears the association. */
> +       ns->cgroup_id =3D cgroup_id;
> +       ret =3D count;
> +
> +out_unlock:
> +       mutex_unlock(&subsys->lock);
> +       return ret;
> +}
> +
> +CONFIGFS_ATTR(nvmet_ns_, cgroup_id);
> +#endif /* CONFIG_BLK_CGROUP */
> +
>  #ifdef CONFIG_PCI_P2PDMA
>  static ssize_t nvmet_ns_p2pmem_show(struct config_item *item, char *page=
)
>  {
> @@ -833,6 +877,9 @@ static struct configfs_attribute *nvmet_ns_attrs[] =
=3D {
>         &nvmet_ns_attr_buffered_io,
>         &nvmet_ns_attr_revalidate_size,
>         &nvmet_ns_attr_resv_enable,
> +#ifdef CONFIG_BLK_CGROUP
> +       &nvmet_ns_attr_cgroup_id,
> +#endif
>  #ifdef CONFIG_PCI_P2PDMA
>         &nvmet_ns_attr_p2pmem,
>  #endif
> diff --git a/drivers/nvme/target/core.c b/drivers/nvme/target/core.c
> index 43871a8f56ca..6d9d55eb11eb 100644
> --- a/drivers/nvme/target/core.c
> +++ b/drivers/nvme/target/core.c
> @@ -4,6 +4,7 @@
>   * Copyright (c) 2015-2016 HGST, a Western Digital Company.
>   */
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +#include <linux/cgroup.h>
>  #include <linux/hex.h>
>  #include <linux/module.h>
>  #include <linux/random.h>
> @@ -474,8 +475,57 @@ void nvmet_put_namespace(struct nvmet_ns *ns)
>         percpu_ref_put(&ns->ref);
>  }
>
> +#ifdef CONFIG_BLK_CGROUP
> +static int nvmet_blkcg_ns_enable(struct nvmet_ns *ns)
> +{
> +       struct cgroup *cgrp;
> +
> +       if (!ns->cgroup_id)
> +               return 0;
> +
> +       /*
> +        * Buffered writes will be handled by a separate thread,
> +        * these IOs have no namespace/cgroup information at that time,
> +        * so we don't support buffered io.
> +        */
> +       if (ns->buffered_io) {
> +               pr_err("cgroup_id is not supported with buffered_io: %s\n=
",
> +                      ns->device_path);
> +               return -EINVAL;
> +       }
> +
> +       cgrp =3D cgroup_get_from_id(ns->cgroup_id);
> +       if (IS_ERR(cgrp)) {
> +               pr_err("failed to resolve cgroup id %llu: %ld\n",
> +                      ns->cgroup_id, PTR_ERR(cgrp));
> +               return PTR_ERR(cgrp);
> +       }
> +
> +       ns->cgrp =3D cgrp;
> +       return 0;
> +}
> +
> +static void nvmet_blkcg_ns_disable(struct nvmet_ns *ns)
> +{
> +       if (ns->cgrp) {
> +               cgroup_put(ns->cgrp);
> +               ns->cgrp =3D NULL;
> +       }
> +}
> +#else
> +static inline int nvmet_blkcg_ns_enable(struct nvmet_ns *ns)
> +{
> +       return 0;
> +}
> +
> +static inline void nvmet_blkcg_ns_disable(struct nvmet_ns *ns)
> +{
> +}
> +#endif /* CONFIG_BLK_CGROUP */
> +
>  static void nvmet_ns_dev_disable(struct nvmet_ns *ns)
>  {
> +       nvmet_blkcg_ns_disable(ns);
>         nvmet_bdev_ns_disable(ns);
>         nvmet_file_ns_disable(ns);
>  }
> @@ -602,6 +652,10 @@ int nvmet_ns_enable(struct nvmet_ns *ns)
>         if (ret)
>                 goto out_unlock;
>
> +       ret =3D nvmet_blkcg_ns_enable(ns);
> +       if (ret)
> +               goto out_dev_disable;
> +
>         ret =3D nvmet_p2pmem_ns_enable(ns);
>         if (ret)
>                 goto out_dev_disable;
> diff --git a/drivers/nvme/target/io-cmd-bdev.c b/drivers/nvme/target/io-c=
md-bdev.c
> index f2d9e8901df4..615a403d2e06 100644
> --- a/drivers/nvme/target/io-cmd-bdev.c
> +++ b/drivers/nvme/target/io-cmd-bdev.c
> @@ -262,6 +262,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *r=
eq)
>         struct sg_mapping_iter prot_miter;
>         unsigned int iter_flags;
>         unsigned int total_len =3D nvmet_rw_data_len(req) + req->metadata=
_len;
> +       bool associated;
>
>         if (!nvmet_check_transfer_len(req, total_len))
>                 return;
> @@ -289,6 +290,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *r=
eq)
>
>         sector =3D nvmet_lba_to_sect(req->ns, req->cmd->rw.slba);
>
> +       associated =3D nvmet_blkcg_begin(req->ns);
>         if (nvmet_use_inline_bvec(req)) {
>                 bio =3D &req->b.inline_bio;
>                 bio_init(bio, req->ns->bdev, req->inline_bvec,
> @@ -315,6 +317,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *r=
eq)
>                                 rc =3D nvmet_bdev_alloc_bip(req, bio,
>                                                           &prot_miter);
>                                 if (unlikely(rc)) {
> +                                       nvmet_blkcg_end(associated);
>                                         bio_io_error(bio);
>                                         return;
>                                 }
> @@ -331,6 +334,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *r=
eq)
>                 sector +=3D sg->length >> 9;
>                 sg_cnt--;
>         }
> +       nvmet_blkcg_end(associated);
>
>         if (req->metadata_len) {
>                 rc =3D nvmet_bdev_alloc_bip(req, bio, &prot_miter);
> @@ -347,6 +351,7 @@ static void nvmet_bdev_execute_rw(struct nvmet_req *r=
eq)
>  static void nvmet_bdev_execute_flush(struct nvmet_req *req)
>  {
>         struct bio *bio =3D &req->b.inline_bio;
> +       bool associated;
>
>         if (!bdev_write_cache(req->ns->bdev)) {
>                 nvmet_req_complete(req, NVME_SC_SUCCESS);
> @@ -356,8 +361,10 @@ static void nvmet_bdev_execute_flush(struct nvmet_re=
q *req)
>         if (!nvmet_check_transfer_len(req, 0))
>                 return;
>
> +       associated =3D nvmet_blkcg_begin(req->ns);
>         bio_init(bio, req->ns->bdev, req->inline_bvec,
>                  ARRAY_SIZE(req->inline_bvec), REQ_OP_WRITE | REQ_PREFLUS=
H);
> +       nvmet_blkcg_end(associated);
>         bio->bi_private =3D req;
>         bio->bi_end_io =3D nvmet_bio_done;
>
> @@ -366,10 +373,16 @@ static void nvmet_bdev_execute_flush(struct nvmet_r=
eq *req)
>
>  u16 nvmet_bdev_flush(struct nvmet_req *req)
>  {
> +       bool associated;
> +       int ret;
> +
>         if (!bdev_write_cache(req->ns->bdev))
>                 return 0;
>
> -       if (blkdev_issue_flush(req->ns->bdev))
> +       associated =3D nvmet_blkcg_begin(req->ns);
> +       ret =3D blkdev_issue_flush(req->ns->bdev);
> +       nvmet_blkcg_end(associated);
> +       if (ret)
>                 return NVME_SC_INTERNAL | NVME_STATUS_DNR;
>         return 0;
>  }
> @@ -380,9 +393,11 @@ static void nvmet_bdev_execute_discard(struct nvmet_=
req *req)
>         struct nvme_dsm_range range;
>         struct bio *bio =3D NULL;
>         sector_t nr_sects;
> +       bool associated;
>         int i;
>         u16 status =3D NVME_SC_SUCCESS;
>
> +       associated =3D nvmet_blkcg_begin(ns);
>         for (i =3D 0; i <=3D le32_to_cpu(req->cmd->dsm.nr); i++) {
>                 status =3D nvmet_copy_from_sgl(req, i * sizeof(range), &r=
ange,
>                                 sizeof(range));
> @@ -394,6 +409,7 @@ static void nvmet_bdev_execute_discard(struct nvmet_r=
eq *req)
>                                 nvmet_lba_to_sect(ns, range.slba), nr_sec=
ts,
>                                 GFP_KERNEL, &bio);
>         }
> +       nvmet_blkcg_end(associated);
>
>         if (bio) {
>                 bio->bi_private =3D req;
> @@ -431,6 +447,7 @@ static void nvmet_bdev_execute_write_zeroes(struct nv=
met_req *req)
>         struct bio *bio =3D NULL;
>         sector_t sector;
>         sector_t nr_sector;
> +       bool associated;
>         int ret;
>
>         if (!nvmet_check_transfer_len(req, 0))
> @@ -440,8 +457,11 @@ static void nvmet_bdev_execute_write_zeroes(struct n=
vmet_req *req)
>         nr_sector =3D (((sector_t)le16_to_cpu(write_zeroes->length) + 1) =
<<
>                 (req->ns->blksize_shift - 9));
>
> +       associated =3D nvmet_blkcg_begin(req->ns);
>         ret =3D __blkdev_issue_zeroout(req->ns->bdev, sector, nr_sector,
>                         GFP_KERNEL, &bio, 0);
> +       nvmet_blkcg_end(associated);
> +
>         if (bio) {
>                 bio->bi_private =3D req;
>                 bio->bi_end_io =3D nvmet_bio_done;
> diff --git a/drivers/nvme/target/io-cmd-file.c b/drivers/nvme/target/io-c=
md-file.c
> index 0b22d183f927..570e65259ad8 100644
> --- a/drivers/nvme/target/io-cmd-file.c
> +++ b/drivers/nvme/target/io-cmd-file.c
> @@ -79,6 +79,8 @@ static ssize_t nvmet_file_submit_bvec(struct nvmet_req =
*req, loff_t pos,
>         struct kiocb *iocb =3D &req->f.iocb;
>         ssize_t (*call_iter)(struct kiocb *iocb, struct iov_iter *iter);
>         struct iov_iter iter;
> +       bool associated;
> +       ssize_t ret;
>         int rw;
>
>         if (req->cmd->rw.opcode =3D=3D nvme_cmd_write) {
> @@ -97,7 +99,10 @@ static ssize_t nvmet_file_submit_bvec(struct nvmet_req=
 *req, loff_t pos,
>         iocb->ki_filp =3D req->ns->file;
>         iocb->ki_flags =3D ki_flags | iocb->ki_filp->f_iocb_flags;
>
> -       return call_iter(iocb, &iter);
> +       associated =3D nvmet_blkcg_begin(req->ns);
> +       ret =3D call_iter(iocb, &iter);
> +       nvmet_blkcg_end(associated);
> +       return ret;
>  }
>
>  static void nvmet_file_io_done(struct kiocb *iocb, long ret)
> @@ -251,7 +256,13 @@ static void nvmet_file_execute_rw(struct nvmet_req *=
req)
>
>  u16 nvmet_file_flush(struct nvmet_req *req)
>  {
> -       return errno_to_nvme_status(req, vfs_fsync(req->ns->file, 1));
> +       bool associated;
> +       int ret;
> +
> +       associated =3D nvmet_blkcg_begin(req->ns);
> +       ret =3D vfs_fsync(req->ns->file, 1);
> +       nvmet_blkcg_end(associated);
> +       return errno_to_nvme_status(req, ret);
>  }
>
>  static void nvmet_file_flush_work(struct work_struct *w)
> @@ -274,10 +285,12 @@ static void nvmet_file_execute_discard(struct nvmet=
_req *req)
>         int mode =3D FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE;
>         struct nvme_dsm_range range;
>         loff_t offset, len;
> +       bool associated;
>         u16 status =3D 0;
>         int ret;
>         int i;
>
> +       associated =3D nvmet_blkcg_begin(req->ns);
>         for (i =3D 0; i <=3D le32_to_cpu(req->cmd->dsm.nr); i++) {
>                 status =3D nvmet_copy_from_sgl(req, i * sizeof(range), &r=
ange,
>                                         sizeof(range));
> @@ -300,6 +313,7 @@ static void nvmet_file_execute_discard(struct nvmet_r=
eq *req)
>                         break;
>                 }
>         }
> +       nvmet_blkcg_end(associated);
>
>         nvmet_req_complete(req, status);
>  }
> @@ -336,6 +350,7 @@ static void nvmet_file_write_zeroes_work(struct work_=
struct *w)
>         int mode =3D FALLOC_FL_ZERO_RANGE | FALLOC_FL_KEEP_SIZE;
>         loff_t offset;
>         loff_t len;
> +       bool associated;
>         int ret;
>
>         offset =3D le64_to_cpu(write_zeroes->slba) << req->ns->blksize_sh=
ift;
> @@ -347,7 +362,9 @@ static void nvmet_file_write_zeroes_work(struct work_=
struct *w)
>                 return;
>         }
>
> +       associated =3D nvmet_blkcg_begin(req->ns);
>         ret =3D vfs_fallocate(req->ns->file, mode, offset, len);
> +       nvmet_blkcg_end(associated);
>         nvmet_req_complete(req, ret < 0 ? errno_to_nvme_status(req, ret) =
: 0);
>  }
>
> diff --git a/drivers/nvme/target/nvmet.h b/drivers/nvme/target/nvmet.h
> index dbda55895f4f..db46f8fd583d 100644
> --- a/drivers/nvme/target/nvmet.h
> +++ b/drivers/nvme/target/nvmet.h
> @@ -21,6 +21,8 @@
>  #include <linux/radix-tree.h>
>  #include <linux/t10-pi.h>
>  #include <linux/kfifo.h>
> +#include <linux/kthread.h>
> +#include <linux/cgroup.h>
>
>  #define NVMET_DEFAULT_VS               NVME_VS(2, 1, 0)
>
> @@ -115,6 +117,16 @@ struct nvmet_ns {
>         struct nvmet_subsys     *subsys;
>         const char              *device_path;
>
> +#ifdef CONFIG_BLK_CGROUP
> +       u64                     cgroup_id;
> +       /*
> +        * Resolved from ->cgroup_id when the namespace is enabled and
> +        * released when it is disabled, so it has the same lifetime and
> +        * visibility rules as ->bdev and ->file.
> +        */
> +       struct cgroup           *cgrp;
> +#endif
> +
>         struct config_group     device_group;
>         struct config_group     group;
>
> @@ -732,6 +744,36 @@ void nvmet_bdev_execute_zone_mgmt_recv(struct nvmet_=
req *req);
>  void nvmet_bdev_execute_zone_mgmt_send(struct nvmet_req *req);
>  void nvmet_bdev_execute_zone_append(struct nvmet_req *req);
>
> +#ifdef CONFIG_BLK_CGROUP
> +static inline bool nvmet_blkcg_begin(struct nvmet_ns *ns)
> +{
> +       struct cgroup_subsys_state *css;
> +
> +       if (!ns->cgrp || !in_task() || !(current->flags & PF_KTHREAD))
> +               return false;
> +
> +       css =3D cgroup_get_e_css(ns->cgrp, &io_cgrp_subsys);
> +       kthread_associate_blkcg(css);
> +       css_put(css);
> +       return true;
> +}
> +
> +static inline void nvmet_blkcg_end(bool associated)
> +{
> +       if (associated)
> +               kthread_associate_blkcg(NULL);
> +}
> +#else
> +static inline bool nvmet_blkcg_begin(struct nvmet_ns *ns)
> +{
> +       return false;
> +}
> +
> +static inline void nvmet_blkcg_end(bool associated)
> +{
> +}
> +#endif /* CONFIG_BLK_CGROUP */
> +
>  static inline u32 nvmet_rw_data_len(struct nvmet_req *req)
>  {
>         return ((u32)le16_to_cpu(req->cmd->rw.length) + 1) <<
> diff --git a/drivers/nvme/target/zns.c b/drivers/nvme/target/zns.c
> index 23a17c02abee..c6cc4730285b 100644
> --- a/drivers/nvme/target/zns.c
> +++ b/drivers/nvme/target/zns.c
> @@ -480,8 +480,11 @@ static void nvmet_bdev_zmgmt_send_work(struct work_s=
truct *w)
>         struct block_device *bdev =3D req->ns->bdev;
>         sector_t zone_sectors =3D bdev_zone_sectors(bdev);
>         u16 status =3D NVME_SC_SUCCESS;
> +       bool associated;
>         int ret;
>
> +       associated =3D nvmet_blkcg_begin(req->ns);
> +
>         if (op =3D=3D REQ_OP_LAST) {
>                 req->error_loc =3D offsetof(struct nvme_zone_mgmt_send_cm=
d, zsa);
>                 status =3D NVME_SC_ZONE_INVALID_TRANSITION | NVME_STATUS_=
DNR;
> @@ -511,6 +514,7 @@ static void nvmet_bdev_zmgmt_send_work(struct work_st=
ruct *w)
>                 status =3D blkdev_zone_mgmt_errno_to_nvme_status(ret);
>
>  out:
> +       nvmet_blkcg_end(associated);
>         nvmet_req_complete(req, status);
>  }
>
> @@ -542,6 +546,7 @@ void nvmet_bdev_execute_zone_append(struct nvmet_req =
*req)
>         struct scatterlist *sg;
>         u32 data_len =3D nvmet_rw_data_len(req);
>         struct bio *bio;
> +       bool associated;
>         int sg_cnt;
>
>         /* Request is completed on len mismatch in nvmet_check_transfer_l=
en() */
> @@ -572,6 +577,7 @@ void nvmet_bdev_execute_zone_append(struct nvmet_req =
*req)
>                 goto out;
>         }
>
> +       associated =3D nvmet_blkcg_begin(req->ns);
>         if (nvmet_use_inline_bvec(req)) {
>                 bio =3D &req->z.inline_bio;
>                 bio_init(bio, req->ns->bdev, req->inline_bvec,
> @@ -579,6 +585,7 @@ void nvmet_bdev_execute_zone_append(struct nvmet_req =
*req)
>         } else {
>                 bio =3D bio_alloc(req->ns->bdev, req->sg_cnt, opf, GFP_KE=
RNEL);
>         }
> +       nvmet_blkcg_end(associated);
>
>         bio->bi_end_io =3D nvmet_bdev_zone_append_bio_done;
>         bio->bi_iter.bi_sector =3D sect;
>
> base-commit: 2ee54f01f07c0307deaf90ca8691a4643ae0357b
> --
> 2.53.0
>
