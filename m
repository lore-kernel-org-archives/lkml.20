Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151B651EE19
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789665832; cv=none; b=TtRwKsq3WTZJyQq3pTfqxFFcDX64BkJSwZpzX+plNIsW6XR+b1Ru09CGOLkjxqAs6x5xZs1pDtaBk70H5Kk66SmgFyMGL4B75ti4saZCtDpF5Jv9cEJvrT9df9mIA6ks5/VhaYDgmOEYhfkNweF0OhUub2gQ+2xyLpeijLtLzvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789665832; c=relaxed/simple;
	bh=26fjzLO/E0/TNqrgy/wk0rHyB0ACvxnYylsFJojEKzU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=O0RliAFWKyisGALHWbXFW+2z7nGob0Le+qHt51E2pV9idO7HMS37k3dCXo8y9f7Gx5HqEWFlnTFBP+qYsWl5xNaF5pIrgJlOsVxvHEm09/4TqCNsPCtS7PofBqbC4CkfvnZtDrLnM8lnIf76q7dtg9UUOKXyLqJtUSgEtZ2jT3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KEo0426o; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KEo0426o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789665829; x=1821201829;
  h=date:from:to:cc:subject:message-id;
  bh=26fjzLO/E0/TNqrgy/wk0rHyB0ACvxnYylsFJojEKzU=;
  b=KEo0426oC+RwBNugrYoZolpUw8XdZYyhPm9PwdNNuzX0hOOED11wQZFU
   jnGSoKryKAcC+1iGQAdhXIjjGIePX0qO2DXVUFEu0yQ2iEZjhmi4PU1gm
   ZGuQ/XgtoY8K2sw8NAn1EXUI4vU7FKNrGgbds3omFFbPQFaY1iWqUgAR3
   sm7U5QU/W9D+3C0BtdclqLd8SgfyYrPzODGoxjw3FfSsOzUWsMVK39nIe
   MetbTRMz2LvmRqv1gNLAVG/QIkf+29osJms9akqqbznYN4z6oY11gR4ww
   qMHPJ7T9H1pjJ/JqgP51Gmh8A3YCoNAieDnguALDKKPM0AVzlwerli33N
   Q==;
X-CSE-ConnectionGUID: x6ivCrHjSqSe3RIHo+g7zg==
X-CSE-MsgGUID: t2cDsEZZS6aDOuaFtgZEUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89048406"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="89048406"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 10:23:48 -0700
X-CSE-ConnectionGUID: ZKlVQ+ngQimP0zWXG84XOQ==
X-CSE-MsgGUID: q4/UfISlTAOSqEbbACa15A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2142019"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 17 Sep 2026 10:23:46 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7Fpn-000000008J1-364O;
	Thu, 17 Sep 2026 17:23:43 +0000
Date: Fri, 18 Sep 2026 01:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:161:34:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202609180140.JDcNhmd2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 34e27b90552acf21bd73aac395667c8aae6da480 nouveau/instmem: use iomapping interface for instmem handling
date:   10 weeks ago
config: alpha-randconfig-r1307-20260917 (https://download.01.org/0day-ci/archive/20260918/202609180140.JDcNhmd2-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180140.JDcNhmd2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 34e27b90552a ("nouveau/instmem: use iomapping interface for instmem handling")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180140.JDcNhmd2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:109:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:109:58: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:109:58: sparse:     got void *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:115:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:115:58: sparse:     expected void const [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:115:58: sparse:     got void *
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:161:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void *[assigned] emap @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:161:34: sparse:     expected void [noderef] __iomem *vaddr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:161:34: sparse:     got void *[assigned] emap
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:178:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *map @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:178:19: sparse:     expected void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:178:19: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:240:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:240:28: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:240:28: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:249:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:249:28: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:249:28: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:256:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *map @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:256:21: sparse:     expected void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:256:21: sparse:     got void *map
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:350:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *vaddr @@     got void *[assigned] map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:350:34: sparse:     expected void [noderef] __iomem *vaddr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:350:34: sparse:     got void *[assigned] map

vim +161 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c

   105	
   106	static void
   107	nv50_instobj_wr32(struct nvkm_memory *memory, u64 offset, u32 data)
   108	{
 > 109		iowrite32_native(data, nv50_instobj(memory)->map + offset);
   110	}
   111	
   112	static u32
   113	nv50_instobj_rd32(struct nvkm_memory *memory, u64 offset)
   114	{
   115		return ioread32_native(nv50_instobj(memory)->map + offset);
   116	}
   117	
   118	static const struct nvkm_memory_ptrs
   119	nv50_instobj_fast = {
   120		.rd32 = nv50_instobj_rd32,
   121		.wr32 = nv50_instobj_wr32,
   122	};
   123	
   124	static void
   125	nv50_instobj_kmap(struct nv50_instobj *iobj, struct nvkm_vmm *vmm)
   126	{
   127		struct nv50_instmem *imem = iobj->imem;
   128		struct nv50_instobj *eobj;
   129		struct nvkm_memory *memory = &iobj->base.memory;
   130		struct nvkm_subdev *subdev = &imem->base.subdev;
   131		struct nvkm_vma *bar = NULL, *ebar;
   132		u64 size = nvkm_memory_size(memory);
   133		void *emap;
   134		int ret;
   135	
   136		/* Attempt to allocate BAR2 address-space and map the object
   137		 * into it.  The lock has to be dropped while doing this due
   138		 * to the possibility of recursion for page table allocation.
   139		 */
   140		mutex_unlock(&imem->base.mutex);
   141		while ((ret = nvkm_vmm_get(vmm, 12, size, &bar))) {
   142			/* Evict unused mappings, and keep retrying until we either
   143			 * succeed,or there's no more objects left on the LRU.
   144			 */
   145			mutex_lock(&imem->base.mutex);
   146			eobj = list_first_entry_or_null(&imem->lru, typeof(*eobj), lru);
   147			if (eobj) {
   148				nvkm_debug(subdev, "evict %016llx %016llx @ %016llx\n",
   149					   nvkm_memory_addr(&eobj->base.memory),
   150					   nvkm_memory_size(&eobj->base.memory),
   151					   eobj->bar->addr);
   152				list_del_init(&eobj->lru);
   153				ebar = eobj->bar;
   154				eobj->bar = NULL;
   155				emap = eobj->map;
   156				eobj->map = NULL;
   157			}
   158			mutex_unlock(&imem->base.mutex);
   159			if (!eobj)
   160				break;
 > 161			io_mapping_unmap(emap);
   162			nvkm_vmm_put(vmm, &ebar);
   163		}
   164	
   165		if (ret == 0)
   166			ret = nvkm_memory_map(memory, 0, vmm, bar, NULL, 0);
   167		mutex_lock(&imem->base.mutex);
   168		if (ret || iobj->bar) {
   169			/* We either failed, or another thread beat us. */
   170			mutex_unlock(&imem->base.mutex);
   171			nvkm_vmm_put(vmm, &bar);
   172			mutex_lock(&imem->base.mutex);
   173			return;
   174		}
   175	
   176		/* Make the mapping visible to the host. */
   177		iobj->bar = bar;
   178		iobj->map = io_mapping_map_wc(&imem->iomap, (u32)iobj->bar->addr, size);
   179		if (!iobj->map) {
   180			nvkm_warn(subdev, "PRAMIN ioremap failed\n");
   181			nvkm_vmm_put(vmm, &iobj->bar);
   182		}
   183	}
   184	
   185	static int
   186	nv50_instobj_map(struct nvkm_memory *memory, u64 offset, struct nvkm_vmm *vmm,
   187			 struct nvkm_vma *vma, void *argv, u32 argc)
   188	{
   189		memory = nv50_instobj(memory)->ram;
   190		return nvkm_memory_map(memory, offset, vmm, vma, argv, argc);
   191	}
   192	
   193	static bool
   194	check_io_mapping(struct nv50_instmem *imem)
   195	{
   196		struct nvkm_device *device = imem->base.subdev.device;
   197	
   198		return io_mapping_init_wc(&imem->iomap,
   199					  device->func->resource_addr(device, NVKM_BAR2_INST),
   200					  device->func->resource_size(device, NVKM_BAR2_INST)) != NULL;
   201	}
   202	
   203	static void
   204	nv50_instobj_release(struct nvkm_memory *memory)
   205	{
   206		struct nv50_instobj *iobj = nv50_instobj(memory);
   207		struct nv50_instmem *imem = iobj->imem;
   208		struct nvkm_subdev *subdev = &imem->base.subdev;
   209	
   210		wmb();
   211		nvkm_bar_flush(subdev->device->bar);
   212	
   213		if (refcount_dec_and_mutex_lock(&iobj->maps, &imem->base.mutex)) {
   214			/* Add the now-unused mapping to the LRU instead of directly
   215			 * unmapping it here, in case we need to map it again later.
   216			 */
   217			if (likely(iobj->lru.next) && iobj->map) {
   218				BUG_ON(!list_empty(&iobj->lru));
   219				list_add_tail(&iobj->lru, &imem->lru);
   220			}
   221	
   222			/* Switch back to NULL accessors when last map is gone. */
   223			iobj->base.memory.ptrs = NULL;
   224			mutex_unlock(&imem->base.mutex);
   225		}
   226	}
   227	
   228	static void __iomem *
   229	nv50_instobj_acquire(struct nvkm_memory *memory)
   230	{
   231		struct nv50_instobj *iobj = nv50_instobj(memory);
   232		struct nvkm_instmem *imem = &iobj->imem->base;
   233		struct nvkm_vmm *vmm;
   234		void __iomem *map = NULL;
   235	
   236		/* Already mapped? */
   237		if (refcount_inc_not_zero(&iobj->maps)) {
   238			/* read barrier match the wmb on refcount set */
   239			smp_rmb();
 > 240			return iobj->map;
   241		}
   242	
   243		/* Take the lock, and re-check that another thread hasn't
   244		 * already mapped the object in the meantime.
   245		 */
   246		mutex_lock(&imem->mutex);
   247		if (refcount_inc_not_zero(&iobj->maps)) {
   248			mutex_unlock(&imem->mutex);
   249			return iobj->map;
   250		}
   251	
   252		/* Attempt to get a direct CPU mapping of the object. */
   253		if ((vmm = nvkm_bar_bar2_vmm(imem->subdev.device))) {
   254			if (!iobj->map && iobj->imem->iomap.size)
   255				nv50_instobj_kmap(iobj, vmm);
   256			map = iobj->map;
   257		}
   258	
   259		if (!refcount_inc_not_zero(&iobj->maps)) {
   260			/* Exclude object from eviction while it's being accessed. */
   261			if (likely(iobj->lru.next))
   262				list_del_init(&iobj->lru);
   263	
   264			if (map)
   265				iobj->base.memory.ptrs = &nv50_instobj_fast;
   266			else
   267				iobj->base.memory.ptrs = &nv50_instobj_slow;
   268			/* barrier to ensure the ptrs are written before refcount is set */
   269			smp_wmb();
   270			refcount_set(&iobj->maps, 1);
   271		}
   272	
   273		mutex_unlock(&imem->mutex);
   274		return map;
   275	}
   276	
   277	static void
   278	nv50_instobj_boot(struct nvkm_memory *memory, struct nvkm_vmm *vmm)
   279	{
   280		struct nv50_instobj *iobj = nv50_instobj(memory);
   281		struct nvkm_instmem *imem = &iobj->imem->base;
   282	
   283		/* Exclude bootstrapped objects (ie. the page tables for the
   284		 * instmem BAR itself) from eviction.
   285		 */
   286		mutex_lock(&imem->mutex);
   287		if (likely(iobj->lru.next)) {
   288			list_del_init(&iobj->lru);
   289			iobj->lru.next = NULL;
   290		}
   291	
   292		/*
   293		 * boot is only called on BAR2, if we can't remap the complete
   294		 * BAR it's unlikely things are functioning well.
   295		 */
   296		if (check_io_mapping(iobj->imem))
   297			nv50_instobj_kmap(iobj, vmm);
   298		nvkm_instmem_boot(imem);
   299		mutex_unlock(&imem->mutex);
   300	}
   301	
   302	static u64
   303	nv50_instobj_size(struct nvkm_memory *memory)
   304	{
   305		return nvkm_memory_size(nv50_instobj(memory)->ram);
   306	}
   307	
   308	static u64
   309	nv50_instobj_addr(struct nvkm_memory *memory)
   310	{
   311		return nvkm_memory_addr(nv50_instobj(memory)->ram);
   312	}
   313	
   314	static u64
   315	nv50_instobj_bar2(struct nvkm_memory *memory)
   316	{
   317		struct nv50_instobj *iobj = nv50_instobj(memory);
   318		u64 addr = ~0ULL;
   319		if (nv50_instobj_acquire(&iobj->base.memory)) {
   320			iobj->lru.next = NULL; /* Exclude from eviction. */
   321			addr = iobj->bar->addr;
   322		}
   323		nv50_instobj_release(&iobj->base.memory);
   324		return addr;
   325	}
   326	
   327	static enum nvkm_memory_target
   328	nv50_instobj_target(struct nvkm_memory *memory)
   329	{
   330		return nvkm_memory_target(nv50_instobj(memory)->ram);
   331	}
   332	
   333	static void *
   334	nv50_instobj_dtor(struct nvkm_memory *memory)
   335	{
   336		struct nv50_instobj *iobj = nv50_instobj(memory);
   337		struct nvkm_instmem *imem = &iobj->imem->base;
   338		struct nvkm_vma *bar;
   339		void *map;
   340	
   341		mutex_lock(&imem->mutex);
   342		if (likely(iobj->lru.next))
   343			list_del(&iobj->lru);
   344		map = iobj->map;
   345		bar = iobj->bar;
   346		mutex_unlock(&imem->mutex);
   347	
   348		if (map) {
   349			struct nvkm_vmm *vmm = nvkm_bar_bar2_vmm(imem->subdev.device);
 > 350			io_mapping_unmap(map);
   351			if (likely(vmm)) /* Can be NULL during BAR destructor. */
   352				nvkm_vmm_put(vmm, &bar);
   353		}
   354	
   355		nvkm_memory_unref(&iobj->ram);
   356		nvkm_instobj_dtor(imem, &iobj->base);
   357		return iobj;
   358	}
   359	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
