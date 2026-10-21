Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792573153;
	b=zFmRn2Gp7tOtap6g3rJ6D6fYXicWrtwC0+xEXFGKcjTjC49K4BNWsaqsF7oB/zU8g4iQ
	 9GriFeLzF7sH5+HbQK79s+cCHoEM85atSYHdV6kf30Dgc7NWmZPdhljH+Ws/+0jYBG39P
	 4ST1sJfTuXHpI88kft5zV+pBUbGtfwWCoOroupMG90r+Uh7Sal5qw2rSBJvliCqiD1ARy
	 SxZ9xcZoOcwa7sVhV8kgvfwN+xDHv0l/G4GE1UOzqGoFZmYlWeL6RFDtbO359gmYaj1rp
	 vSCEYN+K/SZXTPfEp1vrtGG5SHOaomhW+mYj7slU4AfaMZODvZR8ci0OgBwDvTjXIdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792573153;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=3N0Wo2YQvTHSpG4OgD2IGHm2l66K1HCyg0UdeqQA/fU=;
	b=fDrUZBJLOInEYOuPgQxR/gDodu4UcrR9CUPxFB4TMERhggWnyW4c3URYMkwYXrKvkmrA
	 Ls5LHDuIjuERKLdgM5vrgwJTDNGmHydMdbJbfGTBWsl8ihQBJUmbUmwpPCX6u6QDG4bUj
	 CQm0qxNCDXuufwj5/DQn+FNbDOQerm+jMV6X0/0tn5+ARaYggPPsKba1VlGjGdku/ARmU
	 mj+uuzn++H7R83WKMpKfYMHGoY7D9EzKQ7dMte0d4kyvY1+xO7euHLxcNRm36t65Dlq8V
	 tntHm/Xi8E0PFSW7SW3TAWiEsasT20QjHF82qJnEMBE8ceM6HDLqYMrqSiPeTvQiP/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BHahQ11G;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD0B606A31B
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8AD0B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=BHahQ11G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792573150;
	bh=d3Zk6ZpB/nBqRQTNVHDwUoOKv+LbqWLF3lu9k8Yh1FA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=BHahQ11Gi4mZmrxNYHO1kJsmdmpSoRFe+ljDZXz5GZK6uKXD+09Uys+3o5Mnyzu8Q
	 OAfI8B77CFSOiWui8RBPBP9DvkuPpgYiwciKQr+D+G2hEYZ5lwtDdnJcazdIVv1lJX
	 hbY7K8pBu2yWoaHtoTcegAHX/MrCXN9qxBkNUtOnOccKqP9yFxqR3AZtZfA3GXfh8a
	 pf/SAfdIvodZsmBy6kp3e8jXDFdyfSaYdJyGNW2Vki8sKU+8IhDNEbxpALIQNtMhKV
	 D6GqEubnglyQo3SJuNxv+gWAkjyxtXV9W9fpWLi1nFVHkIsmZZYK/eUVMZkPByYYnk
	 MumEqfLCqw4VQ==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4B4B617E05F3;
	Wed, 21 Oct 2026 10:59:10 +0200 (CEST)
Date: Wed, 21 Oct 2026 10:59:04 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/12] drm/panthor: Protm support for groups
Message-ID: <20261021105904.70fad4b3@fedora-21.home>
In-Reply-To: <20261012125940.3291951-12-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
	<20261012125940.3291951-12-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:59:39 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Extends struct drm_panthor_group_create to allow user provided protm
> suspend buffer. This is needed for protm execution with this group.
> 
> Make use of the user supplied suspend buffer (import).
> 
> Allow PROT_REGION instruction for groups which provided protm
> suspend buffer.
> 
> Store the suspend buffer sizes (normal and protected) provided by FW
> after FW start. Unsafe to read directly from FW as these will return
> zero between FW load and FW start.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> 
> ---
> 
> v4:
> - First version of this change as a separate commit
> ---
>  drivers/gpu/drm/panthor/panthor_fw.c    | 24 ++++++++++
>  drivers/gpu/drm/panthor/panthor_fw.h    |  2 +
>  drivers/gpu/drm/panthor/panthor_sched.c | 59 ++++++++++++++++++++-----
>  include/uapi/drm/panthor_drm.h          | 10 ++++-
>  4 files changed, 83 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index 0af6addfd55a5..11c370ef86aad 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -269,6 +269,12 @@ struct panthor_fw {
>  	/** @protm_init_lock: Used to serialize protm initialization. */
>  	struct mutex protm_init_lock;
>  
> +	/** @suspend_size: Size of regular suspend buffer */
> +	u32 suspend_size;
> +
> +	/** @protm_suspend_size: Size of protected suspend buffer size */
> +	u32 protm_suspend_size;
> +
>  	/**
>  	 * @req_waitqueue: FW request waitqueue.
>  	 *
> @@ -1006,6 +1012,14 @@ static int panthor_init_csg_iface(struct panthor_device *ptdev,
>  	}
>  
>  	if (!csg_idx) {
> +		/* We make a copy of these sizes, as csg_iface can read these
> +		 * as zero during full GPU reset, between FW sections being
> +		 * reloaded and FW fully booted.
> +		 */
> +		ptdev->fw->suspend_size = csg_iface->control->suspend_size;
> +		ptdev->fw->protm_suspend_size =
> +			csg_iface->control->protm_suspend_size;
> +
>  		ptdev->protm.info.group_protected_suspend_buf_size =
>  			csg_iface->control->protm_suspend_size;
>  	}
> @@ -1523,6 +1537,16 @@ static void panthor_fw_ping_work(struct work_struct *work)
>  	}
>  }
>  
> +u32 panthor_fw_suspend_size(struct panthor_device *ptdev)
> +{
> +	return ptdev->fw->suspend_size;
> +}
> +
> +u32 panthor_fw_protm_suspend_size(struct panthor_device *ptdev)
> +{
> +	return ptdev->fw->protm_suspend_size;
> +}
> +
>  static bool wait_protm_enter(struct panthor_device *ptdev,
>  			     s64 protm_session_seqno)
>  {
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.h b/drivers/gpu/drm/panthor/panthor_fw.h
> index 34bc9dc82314c..98576114cc803 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.h
> +++ b/drivers/gpu/drm/panthor/panthor_fw.h
> @@ -531,6 +531,8 @@ void panthor_fw_unplug(struct panthor_device *ptdev);
>  
>  int panthor_fw_protm_init(struct drm_file *file,
>  			  struct drm_panthor_protm_init *args);
> +u32 panthor_fw_suspend_size(struct panthor_device *ptdev);
> +u32 panthor_fw_protm_suspend_size(struct panthor_device *ptdev);
>  int panthor_fw_protm_enter(struct panthor_device *ptdev);
>  int panthor_fw_protm_exit(struct panthor_device *ptdev, u32 timeout_ms);
>  int panthor_fw_protm_exit_wait(struct panthor_device *ptdev, u32 timeout_ms);
> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index fff805fd794a5..d1178be178a48 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1462,10 +1462,15 @@ cs_slot_process_protm_pending_event_locked(struct panthor_device *ptdev,
>  	if (!group)
>  		return;
>  
> -	/* Do not allow user space work to switch into protected mode, as we
> -	 * do not fully support this quite yet.
> +	/* Do not allow user space work to switch into protected mode if we
> +	 * do not support protected mode on this device.
> +	 * User space should query (and init) this support before attempting
> +	 * to use such GPU instructions.
>  	 */
> -	atomic_or(BIT(cs_id), &group->fatal_queues);
> +	if (group->protm_suspend_buf)
> +		atomic_or(BIT(cs_id), &group->protm_pending_queues);
> +	else
> +		atomic_or(BIT(cs_id), &group->fatal_queues);
>  
>  	sched_queue_delayed_work(sched, tick, 0);
>  }
> @@ -4074,6 +4079,7 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
>  }
>  
>  #define MAX_GROUPS_PER_POOL		128
> +#define GROUP_CREATE_FLAGS DRM_PANTHOR_GROUP_CREATE_PROTECTED
>  
>  int panthor_group_create(struct drm_file *file,
>  			 const struct drm_panthor_group_create *group_args,
> @@ -4083,14 +4089,10 @@ int panthor_group_create(struct drm_file *file,
>  	struct panthor_device *ptdev = pfile->ptdev;
>  	struct panthor_group_pool *gpool = pfile->groups;
>  	struct panthor_scheduler *sched = ptdev->scheduler;
> -	struct panthor_fw_csg_iface *csg_iface = panthor_fw_get_csg_iface(ptdev, 0);
>  	struct panthor_group *group = NULL;
> -	u32 gid, i, suspend_size;
> +	u32 gid, i;
>  	int ret;
>  
> -	if (group_args->pad)
> -		return -EINVAL;
> -
>  	if (group_args->priority >= PANTHOR_CSG_PRIORITY_COUNT)
>  		return -EINVAL;
>  
> @@ -4136,14 +4138,51 @@ int panthor_group_create(struct drm_file *file,
>  		goto err_put_group;
>  	}
>  
> -	suspend_size = csg_iface->control->suspend_size;
> -	group->suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
> +	group->suspend_buf = panthor_fw_alloc_suspend_buf_mem(
> +		ptdev, panthor_fw_suspend_size(ptdev));
>  	if (IS_ERR(group->suspend_buf)) {
>  		ret = PTR_ERR(group->suspend_buf);
>  		group->suspend_buf = NULL;
>  		goto err_put_group;
>  	}
>  
> +	if (group_args->protected_suspend_bo_handle) {
> +		struct drm_gem_object *obj;
> +
> +		/* Read a correct snapshot of the state */
> +		if (!(smp_load_acquire(&ptdev->protm.info.state) &
> +		      DRM_PANTHOR_PROTM_INITIALIZED)) {

Same comment I made in previous patch: let's use a regular lock to
access this state.

> +			ret = -EINVAL;
> +			goto err_put_group;
> +		}
> +
> +		obj = drm_gem_object_lookup(
> +			file, group_args->protected_suspend_bo_handle);

		obj = drm_gem_object_lookup(file,
					    group_args->protected_suspend_bo_handle);

> +		if (!obj) {
> +			ret = -ENOENT;
> +			goto err_put_group;
> +		}
> +
> +		if (obj->size <
> +		    ptdev->protm.info.group_protected_suspend_buf_size) {

		if (obj->size < ptdev->protm.info.group_protected_suspend_buf_size) {

> +			drm_gem_object_put(obj);
> +			ret = -EINVAL;
> +			goto err_put_group;
> +		}
> +
> +		group->protm_suspend_buf = panthor_kernel_bo_create_from_gem(
> +			ptdev, panthor_fw_vm(ptdev), to_panthor_bo(obj),
> +			DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
> +			PANTHOR_VM_KERNEL_AUTO_VA,
> +			panthor_fw_protm_suspend_size(ptdev));

		group->protm_suspend_buf =
			panthor_kernel_bo_create_from_gem(ptdev, panthor_fw_vm(ptdev),
							  to_panthor_bo(obj),
							  DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
							  PANTHOR_VM_KERNEL_AUTO_VA,
							  panthor_fw_protm_suspend_size(ptdev));

> +		drm_gem_object_put(obj);
> +		if (IS_ERR(group->protm_suspend_buf)) {
> +			ret = PTR_ERR(group->protm_suspend_buf);
> +			group->protm_suspend_buf = NULL;
> +			goto err_put_group;
> +		}
> +	}
> +
>  	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
>  						   group_args->queues.count *
>  						   sizeof(struct panthor_syncobj_64b),
> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index d2d21e3e6bb39..a0ed16041e178 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -956,8 +956,14 @@ struct drm_panthor_group_create {
>  	/** @priority: Group priority (see enum drm_panthor_group_priority). */
>  	__u8 priority;
>  
> -	/** @pad: Padding field, MBZ. */
> -	__u32 pad;
> +	/**
> +	 * @protected_suspend_bo_handle: BO to use as a protected suspend buffer.
> +	 *
> +	 * This BO must have been allocated from a protected DMA-BUF heap and
> +	 * imported in panthor. It's size must be at least
> +	 * drm_panthor_protm_info::group_protected_suspend_buf_size.
> +	 */
> +	__u32 protected_suspend_bo_handle;
>  
>  	/**
>  	 * @compute_core_mask: Mask encoding cores that can be used for compute jobs.

