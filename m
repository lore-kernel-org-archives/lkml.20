Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5C14D2EFE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648279; cv=none; b=QIesbnP3BKpj3daX7dWmNo3oqHVpLAMQroTHKPzUDnKQ74zMHRN5wiFJfU7jFhb9ZB5hN1CjSs158oh/AIltuFqrZS7Uhl13OinnV+Xe1vbRGglt4vhi96qLhcdSjG/X9cbN8FvSVd9mbE5G8ekErRRds4rfhW17h5qmbQ1CXZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648279; c=relaxed/simple;
	bh=xVd1RTkdbiyDk5251EsyWPH6288ZHCCNYwltjTBUzr8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rsPUwh/lzeKls/120lLbUnjpuTEJVEqwDquc1S2wG7gDFzJ48eU/RsLo9Tk3CQU783yvLbgEsOzELYm2/wXyn9xJJzX9qLqvJhEf2T7KFWCUhc1IPZXTs+/pcDuIv7rxV5P8QQhsPZ2ElWzOdzfRhO/VYLqo1e6nX3gwmufKWZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Xa8dMvk7; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Xa8dMvk7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789648263;
	bh=xVd1RTkdbiyDk5251EsyWPH6288ZHCCNYwltjTBUzr8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Xa8dMvk7gEV28KcOsHSpGkvhO4nG7I62E6gcfHFam3xWV6MC6eHX3gNIldPXlQPp8
	 f42nVOmpzZ/VV3BZTJ3WyT1VySbU7RdBOrdc6ndtxqne+9E8uLORzXjDkfAlunyNgM
	 9E/BiOos6Dzj4320sVuzEoD6SQ2aFiTvBGgkCA09wVrBGMNc4z6QkPhXAHY4oxRGXb
	 1JsoxZ9WnYb/VIAFsaAFXCCodSwTiN5BMXu+HDH2VPGncBW21cNaZfPfzfmvZ48Rd3
	 JOTgVY7tlnS3mH5vluUzGFmkOhiL816VBl/p45hM+pOIcg6Jvwbi0MVsaHvWGsUrI/
	 mNqgEsHxTbxJg==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFAAC17E007B;
	Thu, 17 Sep 2026 14:31:02 +0200 (CEST)
Date: Thu, 17 Sep 2026 14:30:53 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel@collabora.com
Subject: Re: [PATCH v3] drm/panthor: Display priorities of panthor groups
 over debugfs
Message-ID: <20260917143053.06ca1728@fedora-21.home>
In-Reply-To: <20260904-panthor-sched-group-prio-v3-1-678afcca08b8@collabora.com>
References: <20260904-panthor-sched-group-prio-v3-1-678afcca08b8@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 04 Sep 2026 19:38:09 +0200
Nicolas Frattaroli <nicolas.frattaroli@collabora.com> wrote:

> Analogous to what was added in Commit d41c79838c47 ("drm/panfrost:
> Display list of device JM contexts over debugfs") for panfrost, add
> similar debugfs information for panthor.
> 
> The group priority does not change over the lifetime of the group, so no
> effort to synchronise with the scheduler lock is being made.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Queued to drm-misc-next.

> ---
> Changes in v3:
> - Move group number to after the per-file specific information, which
>   helps readability
> - Link to v2: https://patch.msgid.link/20260831-panthor-sched-group-prio-v2-1-a74c79b4b830@collabora.com
> 
> Changes in v2:
> - Take groups xa lock around the loop in show_file_groups to guard
>   against group object UAF
> - Flatten the listing, removing most of the code in show_each_file,
>   printing that info for each group instead
> - Also show queue count for each group
> - Link to v1: https://patch.msgid.link/20260818-panthor-sched-group-prio-v1-1-1836857c53e9@collabora.com
> ---
>  drivers/gpu/drm/panthor/panthor_drv.c   |  1 +
>  drivers/gpu/drm/panthor/panthor_sched.c | 73 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_sched.h |  5 +++
>  3 files changed, 79 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
> index 46a3080b0b20..8cdba0c1a14b 100644
> --- a/drivers/gpu/drm/panthor/panthor_drv.c
> +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> @@ -1769,6 +1769,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
>  {
>  	panthor_mmu_debugfs_init(minor);
>  	panthor_gem_debugfs_init(minor);
> +	panthor_sched_debugfs_init(minor);
>  }
>  #endif
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 60b2417deb81..ac6aee554820 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0 or MIT
>  /* Copyright 2023 Collabora ltd. */
>  
> +#include <drm/drm_debugfs.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_exec.h>
>  #include <drm/drm_file.h>
> @@ -4175,3 +4176,75 @@ int panthor_sched_init(struct panthor_device *ptdev)
>  	ptdev->scheduler = sched;
>  	return 0;
>  }
> +
> +#ifdef CONFIG_DEBUG_FS
> +
> +static const char *
> +panthor_sched_prio_str(enum panthor_csg_priority prio)
> +{
> +	switch (prio) {
> +	case PANTHOR_CSG_PRIORITY_LOW:
> +		return "LOW";
> +	case PANTHOR_CSG_PRIORITY_MEDIUM:
> +		return "MEDIUM";
> +	case PANTHOR_CSG_PRIORITY_HIGH:
> +		return "HIGH";
> +	case PANTHOR_CSG_PRIORITY_RT:
> +		return "REAL-TIME";
> +	default:
> +		return "UNKNOWN";
> +	}
> +}
> +
> +static int show_file_groups(struct drm_file *file, struct seq_file *m)
> +{
> +	struct panthor_file *pfile = file->driver_priv;
> +	struct panthor_group *group;
> +	unsigned long i;
> +
> +	if (IS_ERR_OR_NULL(pfile->groups))
> +		return -ENOENT;
> +
> +	xa_lock(&pfile->groups->xa);
> +	xa_for_each_marked(&pfile->groups->xa, i, group, GROUP_REGISTERED) {
> +		seq_printf(m, "client_id %8llu pid %8d command %s: group %2lu priority %s queue count %u\n",
> +			   file->client_id, group->task_info.pid, group->task_info.comm, i,
> +			   panthor_sched_prio_str(group->priority), group->queue_count);
> +	}
> +	xa_unlock(&pfile->groups->xa);
> +
> +	return 0;
> +}
> +
> +static int show_each_file(struct seq_file *m, void *arg)
> +{
> +	struct drm_info_node *node = (struct drm_info_node *)m->private;
> +	struct drm_device *ddev = node->minor->dev;
> +	int (*show)(struct drm_file *, struct seq_file *) =
> +		node->info_ent->data;
> +	struct drm_file *file;
> +	int ret;
> +
> +	scoped_cond_guard(mutex_intr, return -EINTR, &ddev->filelist_mutex) {
> +		list_for_each_entry(file, &ddev->filelist, lhead) {
> +			ret = show(file, m);
> +			if (ret < 0)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static struct drm_info_list panthor_sched_debugfs_list[] = {
> +	{ "sched_groups", show_each_file, 0, show_file_groups },
> +};
> +
> +void panthor_sched_debugfs_init(struct drm_minor *minor)
> +{
> +	drm_debugfs_create_files(panthor_sched_debugfs_list,
> +				 ARRAY_SIZE(panthor_sched_debugfs_list),
> +				 minor->debugfs_root, minor);
> +}
> +
> +#endif /* CONFIG_DEBUG_FS */
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/drm/panthor/panthor_sched.h
> index 9a8692de8ade..d87cbdba4d40 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.h
> +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> @@ -10,6 +10,7 @@ struct drm_file;
>  struct drm_gem_object;
>  struct drm_sched_job;
>  struct drm_memory_stats;
> +struct drm_minor;
>  struct drm_panthor_group_create;
>  struct drm_panthor_queue_create;
>  struct drm_panthor_group_get_state;
> @@ -55,4 +56,8 @@ void panthor_sched_report_fw_events(struct panthor_device *ptdev, u32 events);
>  
>  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfile);
>  
> +#ifdef CONFIG_DEBUG_FS
> +void panthor_sched_debugfs_init(struct drm_minor *minor);
> +#endif
> +
>  #endif
> 
> ---
> base-commit: 17c6b88e85ffe5de5720004ae8c2176d52944aca
> change-id: 20260814-panthor-sched-group-prio-c987f6a15690
> 
> Best regards,
> --  
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 

