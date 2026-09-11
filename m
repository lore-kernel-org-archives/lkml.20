Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732DC3C4176
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120127; cv=none; b=pUu94jtmz0kspIGpzkjfaw5eNY6h8uHBkxPQFSHzye/Pztjxxw/AUUHCEDbsCvNmVVr0xLbI5Z7SJXUPU/z+oB8/aMcf6BKwS+eo3S7hipBNbU0yvzvPjnlX0ZgRN3CNib3dqdMs2STjvJ/otcqonveuHvsYL+Dq6CglF5Cc4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120127; c=relaxed/simple;
	bh=2Ia720BNPykED/s8jbz6oZu4P8LQgK+RhVa2cbWEivY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c5OlAVfliA6BZBlQpVVDxteMroTmilvd9u4P7famRQFDVWMvKbnlZqgQ3FP5bveTUomJ8p7P7P/jpWlbrhD4XtgB2JZyHnBa+dxzRtsLePmCTPhs7wrekWydVxlnIYpYDZQMkgoODrCLfDr0vDZdBKC0PCzZHuPImdIQz720GhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=odD76gQW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="odD76gQW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789120123;
	bh=2Ia720BNPykED/s8jbz6oZu4P8LQgK+RhVa2cbWEivY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=odD76gQWzlIXC5GLQt8rQe9NSxAGvpUGVWxtBy5kemQE35NWMFzgrg1DXEODTmE0J
	 kY9pdt+SyYsEAiznnQrmpc/C3n6sCFs9wxbcwZNNNgCejnCwqMnNPzB7Y+i+k1N2ma
	 pGJ1ZyQcTDeNtTuJ+441c8oqFeaQFzOTC9UeJ4fYrGJF1sewzELrciuEwIexoR7o1P
	 ND1NnfYROGJ7lqNOlpGTyKDaBpJqgCSUgntAHAJKTL3nEFfoIm84HQMfYtFcmdsVQJ
	 8IbrH7izni9vzWMtKfzjNYJrRB0npBU2a+Dwkh8vE8OntcLcMi/fdZk9CmkH5/Z5Ra
	 RXjykZ8jrFTmg==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1C4117E0785;
	Fri, 11 Sep 2026 11:48:42 +0200 (CEST)
Date: Fri, 11 Sep 2026 11:48:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Adrian Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/18] drm/panthor: Split panthor_vm
Message-ID: <20260911114837.23e28e6b@fedora-21.home>
In-Reply-To: <aqK1DzIYzFLVz3od@sobremesa>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
	<20260826-panthor-unplug-fixes-v4-8-982cc8f4234b@collabora.com>
	<aqK1DzIYzFLVz3od@sobremesa>
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

On Fri, 11 Sep 2026 04:37:48 +0100
Adrian Larumbe <adrian.larumbe@collabora.com> wrote:

> On 26.08.2026 16:56, Boris Brezillon wrote:
> > The way things are currently defined makes the cleanup procedure harder
> > because the panthor_vm object cleanup happens after drm_gpuvm_fini() has
> > been called, and sometimes we need a drm_gpuvm to undo things.
> > This has been worked around by things like the panthor_vm_unmap_range()
> > call in panthor_vm_destroy(), but there are still situations where this
> > is problematic, like the show_each_vm() where we walk a list of VM and
> > call drm_debugfs_gpuva_info() on each, with the risk of hitting an object
> > that had drm_gpuvm_fini() called on it already.  
> 
> I think you haven't changed show_each_vm() in the whole series. Inside show_vm_gpuvas(),
> it keeps accessing struct panthor_as from its unique reference in a struct panthor_vm,
> but I thought the main goal of this commit was ensuring you can still access panthor_as's
> when the referencing VM's have been released.

The goal of this series is to not be able to access a panthor_as whose
underlying drm_gpuvm object has been destroyed. This is addressed by
having panthor_vm own a panthor_as ref, and given show_each_vm()
operates on the panthor_vm objects in the panthor_mmu::vms list, it
can't happen anymore: either the VM is in the list, and we know for
sure its panthor_vm::as is valid, or it's not in the list (we remove
the vm from the list in panthor_vm_release() before we release the ref
we have on panthor_vm::as in the same function).


> >  /**
> >   * struct panthor_vm - VM object
> >   *
> >   * A VM is an object representing a GPU (or MCU) virtual address space.
> > - * It embeds the MMU page table for this address space, a tree containing
> > - * all the virtual mappings of GEM objects, and other things needed to manage
> > - * the VM.
> >   *
> >   * Except for the MCU VM, which is managed by the kernel, all other VMs are
> >   * created by userspace and mostly managed by userspace, using the
> > @@ -243,13 +360,11 @@ struct panthor_vm_op_ctx {
> >   * by default).
> >   */
> >  struct panthor_vm {
> > -	/**
> > -	 * @base: Inherit from drm_gpuvm.
> > -	 *
> > -	 * We delegate all the VA management to the common drm_gpuvm framework
> > -	 * and only implement hooks to update the MMU page table.
> > -	 */
> > -	struct drm_gpuvm base;
> > +	/** @refcount: VM refcount. */
> > +	struct kref refcount;
> > +
> > +	/** @as: VM address space. */
> > +	struct panthor_as *as;  
> 
> Overall although I understand that an AS must be kept around for longer than a panthor_vm to avoid
> UAF after driver unplug, I find panthor_vm keeping a reference to a panthor_as while the latter is
> the true superclass around a generic gpu_vm a bit confusing.

Well, that's more of a naming issue than a relationship issue IMHO.
panthor_vm is actually the user-facing object and does more than just
managing the virtual space (there's the asynchronous VM_BIND queue
in there, which is more a user of the VM than the VM itself).
Similarly, drm_gpuvm is really mostly about page table updates and cache
maintenance operation around it, which is exactly what an AS (in Arm's
naming convention) is.

The problem really is that we're conflating all these VM-related
concepts in our uAPI, which is why I decided to keep panthor_vm for the
user-facing object, and picked a new name (panthor_as) for the internal
object that deals with just the page-table, cache maintenance and AS
residency bits.

> Also, wouldn't this kind of UAF risk
> also affect all the other drivers? 

I guess they did it right from day one, and we're the outlier. The point
is, what we do currently is not only cumbersome, it's just wrong. The
vm_unmap_range(ALL) happening in vm_destroy() is a symptom of this
improper relationship between user-facing VM objects, and their
internal representation backed by a drm_gpuvm.

I don't mind changing the names if you have a better suggestion, but
the isolation between what I call VM and AS are needed IMO.

> In the commit message it is claimed that 'This object owns a drm_gpuvm ref' when describing
> a struct panthor_vm. However, it seems that reference, other than in vm/as creation error
> paths, is only put either when the panthor_vm is being released or at BO reclaim time.
> 
> I think this makes it look like a reference count is not truly necessary, because it's
> always one. 

drm_gpuvm refs are dispatched to all the active mappings that exist
under this VM, so even if panthor_vm itself doesn't need a refcnt
because it's always a 1:1 relationship between AS and VM, other bits in
the VM logic do.


> > @@ -3316,20 +3391,20 @@ panthor_mmu_reclaim_priv_bos(struct panthor_device *ptdev,
> >  		/* If the VM is still in the temporary list, remove it so we
> >  		 * can proceed with the next VM.
> >  		 */
> > -		if (vm == list_first_entry_or_null(&vms, typeof(*vm), reclaim.lru_node)) {
> > -			list_del_init(&vm->reclaim.lru_node);
> > +		if (as == list_first_entry_or_null(&vms, typeof(*as), reclaim.lru_node)) {
> > +			list_del_init(&as->reclaim.lru_node);
> >  
> >  			/* Keep the VM around if there are still things to
> >  			 * reclaim, so we can preserve the LRU order when
> >  			 * re-inserting in ptdev->reclaim.vms at the end.
> >  			 */
> > -			if (vm->reclaim.lru.count > 0)
> > -				list_add_tail(&vm->reclaim.lru_node, &remaining_vms);
> > +			if (as->reclaim.lru.count > 0)
> > +				list_add_tail(&as->reclaim.lru_node, &remaining_vms);
> >  		}
> >  
> >  		mutex_unlock(&ptdev->base.gem_lru_mutex);
> >  
> > -		panthor_vm_put(vm);
> > +		drm_gpuvm_put(&as->base);  
> 
> Because of my impression that a struct_as->base refcnt is always 1, wouldn't putting it right here
> mean this particular panthor_as will be immediately released?

It's just releasing the ref we acquired earlier in the function through
kref_get_unless_zero(), so that alone proves it's not always 1 or zero
;-). And yes, it might be that the refcnt drops to zero in this path,
which just means that the VM got released while we were considering the
AS for reclaim, and that's fine.
