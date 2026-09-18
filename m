Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8283D4121
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 19:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789760431; cv=none; b=i3VhoZZdShnSIvq5bCDOnUXZrL6NFxnwqTEqWO/E8HxLOFi1WhhFPQcpMjwngCBzCap8jM8Bn+HCnadsA3+Yw7JBxPH9pYLtsfhJBSOMBl9q1UTQnEAfFrPLUhWPvuKy94xXjkvCpZpjD6uRl+Z2AHRALzsQ+MG4bs9RNs86CIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789760431; c=relaxed/simple;
	bh=cfnx+ocGvY7dZ2oH39KlI1r2UmNaPRzBb1z1/+adMF0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WSSwBjJnoUq69BrGE7kKTuICfj5EKS5qILx6MxWc8ViL4gIeJoCb03hMM//P/S1QzurllP8SQhilnjwXhkb/S8sBrgpFrIktssgrxkRUF4G3Vy/wJ+7QoLMXDdQLGrU9Uxb8k4Lj4pdMFyrYv6/0GirrCA9JSlvqxeCGY/YJUIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DOSnmYSx; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DOSnmYSx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789760430; x=1821296430;
  h=date:from:to:cc:subject:message-id;
  bh=cfnx+ocGvY7dZ2oH39KlI1r2UmNaPRzBb1z1/+adMF0=;
  b=DOSnmYSxRPBSUJ1zg6mp2nLFYyOJ1MZBqkO7UWE4xuH90hJP8NdEss+3
   /qQ0qM/S29lxmODIuwbRUDuaFnFXrZ0LLdi8fQBScUGLdJXKkFVGZk2IO
   dwMRpo6MKduoN76EjViEaWoxC29v0SEREGZm5SqXRGMkygQUgpI0F8xkb
   +qwDu4wkyCFDHEaUDyuPQo5O6aAV9pbv8PJ9T0qs29oiMyevRWiDDjp48
   MvyfyZWR4zZLtcCDu32ak1/W5eIPndY2lONUJSCOVf4L0RmJJt9HWzqLN
   Wq5h8Ltm2deKA8QsTJFbU/epGK4VY2RzPfQGQID/FYy9v47HLK6p+7Eqf
   g==;
X-CSE-ConnectionGUID: 5BfzX1cpTnCRuRoidrJINw==
X-CSE-MsgGUID: ycNr/rGmRYmH/B0MpHW/+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="799353"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="799353"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 12:40:30 -0700
X-CSE-ConnectionGUID: 7uivv5a+Ta2uOXZY6NUmmw==
X-CSE-MsgGUID: i8o60g7wR4m5pF4Sm1xQaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="299654034"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Sep 2026 12:40:28 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7eRd-00000000AFF-1Px3;
	Fri, 18 Sep 2026 19:40:25 +0000
Date: Sat, 19 Sep 2026 03:39:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ankit Agrawal <ankita@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alex Williamson <alex@shazbot.org>, Zhi Wang <zhiw@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>
Subject: drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse:
 cast from restricted vm_fault_t
Message-ID: <202609190345.V7aClDxX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f259f446f5198d98e13756d2cd531812a0ad3064
commit: 9db65489b87298f20baef683e70143c108959793 vfio/nvgrace-gpu: Add support for huge pfnmap
date:   10 months ago
config: s390-randconfig-r1300-20260918 (https://download.01.org/0day-ci/archive/20260919/202609190345.V7aClDxX-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7252edd9aa82ef1c570ff6694ef7f4763a8a5d2f)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190345.V7aClDxX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9db65489b872 ("vfio/nvgrace-gpu: Add support for huge pfnmap")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609190345.V7aClDxX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/vfio/pci/nvgrace-gpu/main.c:167:9: sparse: sparse: cast from restricted vm_fault_t

vim +167 drivers/vfio/pci/nvgrace-gpu/main.c

   142	
   143	static vm_fault_t nvgrace_gpu_vfio_pci_huge_fault(struct vm_fault *vmf,
   144							  unsigned int order)
   145	{
   146		struct vm_area_struct *vma = vmf->vma;
   147		struct nvgrace_gpu_pci_core_device *nvdev = vma->vm_private_data;
   148		struct vfio_pci_core_device *vdev = &nvdev->core_device;
   149		unsigned int index =
   150			vma->vm_pgoff >> (VFIO_PCI_OFFSET_SHIFT - PAGE_SHIFT);
   151		vm_fault_t ret = VM_FAULT_FALLBACK;
   152		struct mem_region *memregion;
   153		unsigned long pfn, addr;
   154	
   155		memregion = nvgrace_gpu_memregion(index, nvdev);
   156		if (!memregion)
   157			return VM_FAULT_SIGBUS;
   158	
   159		addr = ALIGN_DOWN(vmf->address, PAGE_SIZE << order);
   160		pfn = PHYS_PFN(memregion->memphys) + addr_to_pgoff(vma, addr);
   161	
   162		if (is_aligned_for_order(vma, addr, pfn, order)) {
   163			scoped_guard(rwsem_read, &vdev->memory_lock)
   164				ret = vfio_pci_vmf_insert_pfn(vdev, vmf, pfn, order);
   165		}
   166	
 > 167		dev_dbg_ratelimited(&vdev->pdev->dev,
   168				    "%s order = %d pfn 0x%lx: 0x%x\n",
   169				    __func__, order, pfn,
   170				    (unsigned int)ret);
   171	
   172		return ret;
   173	}
   174	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
