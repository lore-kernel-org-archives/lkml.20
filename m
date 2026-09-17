Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B53443E2F
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 07:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629910; cv=none; b=KJM/chQLeZROwX4F1uEgSG82gqDFRQIFFCZhE7tPHzrbElYa/7fLqncezodZW9tKwhFJiorvBXmAy4owaT5mgG2c4GiraqvHQOQ1sRowsZZY+b/scSIxyZC2oFwahcEZ2KGcAyDitQKvhea2iujnp77AGx0MG1nSEXT5AvjP9/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629910; c=relaxed/simple;
	bh=0ExmstC50og9xBON5JSqwUjaO32oZ+Us92a2veJ+voY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rIPigN7ry9Hx4HrSa1SAnYm8UUgLHd8aoe8KMyCgbhoZrILjCiEVda+14Kk07ViwyAYiAESNgmuVjrI1WnCLB5vmdHql2ye02sC34kEIjtgbIfGAay2JYJQfXnJsnqhPRlrCicK4siZBqVvSdJ+G4LIAcEzK1l6u4hhIQ2yjDJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X27eB7+1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X27eB7+1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789629909; x=1821165909;
  h=date:from:to:cc:subject:message-id;
  bh=0ExmstC50og9xBON5JSqwUjaO32oZ+Us92a2veJ+voY=;
  b=X27eB7+15d8k4HoXHxulpi84TnIPk15bTmAFazc14pLwoNR3pMMik2/i
   F40NEddm2tok5/KCdKDCfsqWKeS/5mE0tTjzrFgwTBr77R4IAATdtVE3o
   Cq2O0N2aB6DouWNpw3lGm0+hq4SdmUEpyWLrdeMdzmEPjUqTBzPqSajx5
   sE+NsvOqiytPWcL2HeT6Hv9WVeAQhQTA0hdFfhUk3uR5xXdrR8odYFrHB
   XXdUDnrO5KVuXlv5WyiFqqM452M2ln3Ug8MtdSWw0NWzX+4z4Lj8WLRe/
   JJE+Jl2xYPvbCnkOiaS+WVXhuzC1Rr77pOAQ4Jw2e97UNdzmA0effcCd2
   A==;
X-CSE-ConnectionGUID: 2RTBc6QUR+e8k1laLu/+Aw==
X-CSE-MsgGUID: 6MbrtCuJTZmOqvZPxJGd8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107531007"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="107531007"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 00:25:08 -0700
X-CSE-ConnectionGUID: wDaF4WI4So6LUV6drn9mkA==
X-CSE-MsgGUID: qRYzIb/JQXKar2t2rvTyTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269345810"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2026 00:25:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x76US-000000007Ej-04AP;
	Thu, 17 Sep 2026 07:25:04 +0000
Date: Thu, 17 Sep 2026 15:24:35 +0800
From: kernel test robot <lkp@intel.com>
To: Neill Kapron <nkapron@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/usb/gadget/function/f_fs.c:2428:48: warning: '_rw'
 directive output may be truncated writing 3 bytes into a region of size
 between 1 and 8
Message-ID: <202609171504.8fgEluKO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

Hi Neill,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 0f0ea552cd215a01baca1e99eec02e2f8df0c897 usb: gadget: f_fs: Introduce rw_proxy file descriptors
date:   10 weeks ago
config: arm64-randconfig-1000-20260917 (https://download.01.org/0day-ci/archive/20260917/202609171504.8fgEluKO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260917/202609171504.8fgEluKO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 0f0ea552cd21 ("usb: gadget: f_fs: Introduce rw_proxy file descriptors")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609171504.8fgEluKO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/gadget/function/f_fs.c: In function 'ffs_ep0_write':
>> drivers/usb/gadget/function/f_fs.c:2428:48: warning: '_rw' directive output may be truncated writing 3 bytes into a region of size between 1 and 8 [-Wformat-truncation=]
       snprintf(comp->name, sizeof(comp->name), "%s_rw",
                                                   ^~~
   drivers/usb/gadget/function/f_fs.c:2428:4: note: 'snprintf' output between 4 and 11 bytes into a destination of size 8
       snprintf(comp->name, sizeof(comp->name), "%s_rw",
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         epfiles[i].name);
         ~~~~~~~~~~~~~~~~


vim +/_rw +2428 drivers/usb/gadget/function/f_fs.c

  2378	
  2379	static int ffs_epfiles_create(struct ffs_data *ffs)
  2380	{
  2381		struct ffs_epfile *epfile, *epfiles;
  2382		unsigned int i, count, epfiles_count;
  2383		int err;
  2384	
  2385		count = ffs->eps_count;
  2386		epfiles_count = count;
  2387		if (ffs->user_flags & FUNCTIONFS_RW_PROXY_EPS)
  2388			epfiles_count += count / 2;
  2389		ffs->epfiles_count = epfiles_count;
  2390	
  2391		epfiles = kzalloc_objs(*epfiles, epfiles_count);
  2392		if (!epfiles)
  2393			return -ENOMEM;
  2394	
  2395		epfile = epfiles;
  2396		for (i = 1; i <= count; ++i, ++epfile) {
  2397			epfile->ffs = ffs;
  2398			mutex_init(&epfile->mutex);
  2399			mutex_init(&epfile->dmabufs_mutex);
  2400			INIT_LIST_HEAD(&epfile->dmabufs);
  2401			if (ffs->user_flags & FUNCTIONFS_VIRTUAL_ADDR)
  2402				sprintf(epfile->name, "ep%02x", ffs->eps_addrmap[i]);
  2403			else
  2404				sprintf(epfile->name, "ep%u", i);
  2405			err = ffs_sb_create_file(ffs->sb, epfile->name,
  2406						 epfile, &ffs_epfile_operations);
  2407			if (err) {
  2408				ffs_epfiles_destroy(ffs->sb, epfiles, i - 1);
  2409				return err;
  2410			}
  2411		}
  2412	
  2413		if (ffs->user_flags & FUNCTIONFS_RW_PROXY_EPS) {
  2414			struct ffs_epfile *comp = epfiles + count;
  2415	
  2416			for (i = 0; i < count; i += 2, ++comp) {
  2417				struct ffs_epfile *ep1 = &epfiles[i];
  2418				struct ffs_epfile *ep2 = &epfiles[i + 1];
  2419				bool ep1_in = ffs->eps_addrmap[i + 1] & USB_ENDPOINT_DIR_MASK;
  2420	
  2421				comp->ffs = ffs;
  2422				comp->is_rw_proxy = true;
  2423				comp->epfile_in = ep1_in ? ep1 : ep2;
  2424				comp->epfile_out = ep1_in ? ep2 : ep1;
  2425				mutex_init(&comp->mutex);
  2426				mutex_init(&comp->dmabufs_mutex);
  2427				INIT_LIST_HEAD(&comp->dmabufs);
> 2428				snprintf(comp->name, sizeof(comp->name), "%s_rw",
  2429					 epfiles[i].name);
  2430				err = ffs_sb_create_file(ffs->sb, comp->name,
  2431							 comp, &ffs_epfile_operations);
  2432				if (err) {
  2433					ffs_epfiles_destroy(ffs->sb, epfiles, count + (i / 2));
  2434					return err;
  2435				}
  2436			}
  2437		}
  2438	
  2439		ffs->epfiles = epfiles;
  2440		return 0;
  2441	}
  2442	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
