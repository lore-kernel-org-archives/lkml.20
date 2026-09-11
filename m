Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483FB3403E9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137760; cv=none; b=ZUh8PuCFZGHitlH/WDh0QXS/IS5JxfG828QbTKPiaKfTrv3v+oYnrYVobb8JwSwg3XK1HO09M2EFxHLza72lMVZssgXAaMwMHEXK8+2OkClWeSPEXHYquqOqqYusfIqVpJOkO0hI7RWZddYFpwIqkfOh0LGwZNghrR4fRY6nz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137760; c=relaxed/simple;
	bh=5zxX65EsgMSnwA9LaLnXNrbofZqKtF68O7+85+Lb16A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tY90O1wG7X7BF2bkXuMTMQZ+PWi3z8k6V+Ja6wPRp6KdEy7rbcu4LlvtHejJpNY9CtBwdzj7RdOXmwt5jCmRXXYJ9Ubwj/dKcUNPYkSLmi4CT4icJhrp+/jZMdyWxXfkPjTorehx4PiQgE82S1nJqnhAHBD5JLcZv8Jc6aU7FZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZViVVoUa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZViVVoUa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789137756;
	bh=5zxX65EsgMSnwA9LaLnXNrbofZqKtF68O7+85+Lb16A=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ZViVVoUa2WNarXuYtJbvW4e4vgJOH1/kCJWWU8khbVg8kjREWtSXaUZdmaMJ+UqBl
	 jN/aebZ5HnqlHdiB0+AN2SUH8eddgF9aGuKagiUt+5x4GmAawasvTBH/BxmYUyFwvI
	 N6zMn1OoSKRckVaZkom4iigDpJ2yeE6OIBypDUC8psSeUnnbSRUKsZ08wI6yBWTQm/
	 mTe9njz+ThDq5bjh3h9JFoMUmULK0QeS+dw9t3WRw8ybjXGW5vOSi8CvodjR9nPCYs
	 sLijTgPUy4KcEYimTZkuchYoOa/jDWT7psS5H2J5FIZy/QORfkYDQt7bXhFwTtW7fM
	 zlCIU64xi1f0A==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F20E717E093B;
	Fri, 11 Sep 2026 16:42:35 +0200 (CEST)
Date: Fri, 11 Sep 2026 16:42:29 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 6/6] drm/panthor: Expose protected rendering features
Message-ID: <20260911164229.6858768c@fedora-21.home>
In-Reply-To: <20260911114014.79139-7-ketil.johnsen@arm.com>
References: <20260911114014.79139-1-ketil.johnsen@arm.com>
	<20260911114014.79139-7-ketil.johnsen@arm.com>
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

On Fri, 11 Sep 2026 13:40:14 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
> 
> Extensions to Panthor uAPI:
> - New IOCTL for user space to provide protected FW memory.
> - New query for checking protected rendering availability/status
>   and requirements.
> - Extends group creation to allow user space to provide a protected
>   suspend buffer.
> 
> The Mali GPU FW needs some protected memory when executing in protected
> mode. This FW memory section is assigned a VA during device init.
> A user space process with the needed privileges (CAP_SYS_MODULE) must
> provide a suitable memory buffer before the Mali GPU is capable of
> executing in protected mode.
> 
> Processes who want to execute in protected mode must also ensure they
> pass a protected suspend buffer during group creation.
> 
> Added panthor_kernel_bo_import() to allow user provided buffers.
> Refactor panthor_kernel_bo_create() to allow shared code with the
> new import variant.

There's just two many things happening here, so I'd suggest splitting
this patch into:

- Add the section_vm_map_flags() helper
- Add size/VA to panthor_fw_section
- s/panthor_gem_debugfs_set_usage_flags/panthor_gem_debugfs_add_usage_flags/
- support creating kernel BOs from a pre-existing GEM object
- add support for FW PROTM init (with the new ioctl)
- add support for PROTM group init
- bump the driver version to expose the new ioctls

>  /**
> - * panthor_kernel_bo_create() - Create and map a GEM object to a VM
> + * panthor_kernel_bo_import() - Create a kernel BO from an existing GEM object
>   * @ptdev: Device.
>   * @vm: VM to map the GEM to.
> - * @size: Size of the buffer object.
> - * @bo_flags: Combination of drm_panthor_bo_flags flags.
> + * @bo: BO to use for our kernel BO.
>   * @vm_map_flags: Combination of drm_panthor_vm_bind_op_flags (only those
>   * that are related to map operations).
>   * @gpu_va: GPU address assigned when mapping to the VM.
>   * If gpu_va == PANTHOR_VM_KERNEL_AUTO_VA, the virtual address will be
>   * automatically allocated.
> - * @name: Descriptive label of the BO's contents
> + * @vm_map_size: Size of the BO to map to the VM.
>   *
>   * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
>   */
>  struct panthor_kernel_bo *
> -panthor_kernel_bo_create(struct panthor_device *ptdev, struct panthor_vm *vm,
> -			 size_t size, u32 bo_flags, u32 vm_map_flags,
> -			 u64 gpu_va, const char *name)
> +panthor_kernel_bo_import(struct panthor_device *ptdev, struct panthor_vm *vm,

Not sure I like the name, because the BO we pass is not necessarily
imported. I think I prefer panthor_kernel_bo_create_{with,from}_bo() or
_{with,from}_gem().

> +			 struct panthor_gem_object *bo, u32 vm_map_flags,
> +			 u64 gpu_va, u32 vm_map_size)
>  {

[..]

> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
> index 1fe77e5c41995..d73fc2f6633a6 100644
> --- a/drivers/gpu/drm/panthor/panthor_sched.c
> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> @@ -1429,10 +1429,15 @@ cs_slot_process_protm_pending_event_locked(struct panthor_device *ptdev,
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
> +	if (!(ptdev->protm.info.state & DRM_PANTHOR_PROTM_INITIALIZED))

Should we instead check that the group is initialized for PROTM
support, and then have a check in group init to reject group PROTM init
if the device itself is not PROTM-initialized.

> +		atomic_or(BIT(cs_id), &group->fatal_queues);
> +	else
> +		atomic_or(BIT(cs_id), &group->protm_pending_queues);
>  
>  	sched_queue_delayed_work(sched, tick, 0);
>  }


