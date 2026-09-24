Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD174BD10B
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 19:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790278792; cv=none; b=HgC9Sq2rlNL7tqqEGqc6rYrQPKCUUR/A9vAaUGUBCAvWWRkBgCGQPV8Fo5YcZX4fjN+CaT2O2z8qwHuFugG/Zn6bRvr3K+QhBNwp91l5xtA/bb1u1VE6rfsn78ANWo6JFAMoHbfJQs7kCiQ3MWZjS7U61jET4dq++kuMGHYj5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790278792; c=relaxed/simple;
	bh=cdOH0TQFx2/yle8Oxw+LbUiqtgMIOe8sbY3XW9lC+1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRy0dMvcal/93tZhLuv6oUN5v+OVHqiPdzybGcGsyfmJEQaqQCeRCvk0wzUliJMl6CjdJ5QTk+dAmS7+D0AenI1ySgIkDEe9hXAgTwOWUePQMtwOVy4ZP99/s1IL9/4+/zl+aoflmSuhUBZrPL0tDQ+jFeCYpywptxDe0W63kUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frVh9iim; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frVh9iim"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so1314105e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790278786; x=1790883586; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XVpUm2vxAmiJvxOEbkoDqlOy/q982BD2NVBKlRMKmW4=;
        b=frVh9iimoyM+By47heeVoCCgbVikqk4B1d0qmuYSynHa7ru/5U6NtvZexe1AJcJJEk
         Jd8Y+k0nQk47kxk9hVZxKSABS0h9DuYZh3wM5li0eArSRguyxr+Ab9d5MbehncMTN8nE
         OIBt8YEFcrWxOzkd98/LHnxABjviESgupp1eer4hGibQCpXK75wLnb7pRgozeyfbtG+S
         n8+Kg/Zw90vFfK5kZPVLV3S4t0ZEcrmI1nMi7MU7uCoO9JCdzmPS2U1ZvJW8EGMWF/qU
         W5Syr9YFk6QAKTht297nXJVQNIn3CsTEwH5KBkhu5Sf+ny4MBTYAh0kw1/TMiqDto+oM
         e3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790278786; x=1790883586;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XVpUm2vxAmiJvxOEbkoDqlOy/q982BD2NVBKlRMKmW4=;
        b=HMybE/yDs3ilmgRpiUf3jCHEkD8mRN4S0olnWc/FbHkZYZWCWqzaQLvF0t+AwM3yhi
         pZgtoEg618bcTlQ/Br3A6ytLTMcy0nIKg462eThtyaXi6EFgd2y2HvFIj/EZz53rwM6h
         hsKjWiVb8DKS0dDEdKMVUEWE9QQsAOpMb4pAljEbwGLPT6gwffXNsPmz9irSjiG15e2U
         YZRU7FuW0KZHOo5dEKrnf/kpYKiHz7CaNzjY+sCv5tI5+h99sfNANYeDMsJj1iqoARRv
         wWsBhXFuQlD6QHyify575jDbvPUkMKTldxn07aMPhx1Bk2+QK4Q1mST2/xCsTQJl2ahZ
         6qdA==
X-Forwarded-Encrypted: i=1; AKwUvBx8NQWG8LrE9iIeqrbIwW8mGlaEEesi8EVx/Ny3IYI6WgfbaCzF4Id10qINwEO1GL68xN25b7d07/ABmwU=@vger.kernel.org
X-Gm-Message-State: AFuF++l7+HKpXaLwrM0bLIITw6k/GM9zYyuMI7niMeqC2HNUG72MifER
	hifhZAP3IKx7kgtePPUOqA8+6j0zW/gI87P/UoP7bVlqePyI2YnM05EY
X-Gm-Gg: AYBFou3SLMOiHSZKNEw8IUFcFG4lW42Ael2u9ZASYS97m7RXnz3kbz7tqWwbHv39rVm
	0X1jlTCZPRrmwIIVRdxrRlcPNC0z0Xa5q+KfUfjGnLUStSMVEptbm5bWV6VNV/0LCQBafo7FJxW
	5LDDjk7VO3CmEYe7zfh7IiGeZLr7/bCSMAWuweoosWLdnMxWYptwiE9rdFMlHczQEYORlnOWjmU
	xZdolv93nedcAqgLBDZPpcuw7QsLtgR7JdZkFCB7rEQmhsMMrgoJb/k59BNRYrqyiv40CY8tJwc
	Wu/sBUPsLxcxmnXcxyS/pgW0KbNfNMAUqqDKdxDscaU6RtLEdTSyeWHITeHRxPch3ksWGwyS2Tp
	0DHhLwDxIF0Y/7QKgtMZsFIQWKyHIgqjyvf+AFu211tktHIWxjVDKvW/VG/3n+PdgsKwAAq1DY5
	Rfpa02MuUIiNxQUpA+Pofjp7ywzPuYQk2cK760+zBiPcoVBSRSrLHu1YTL8HhCxptWces=
X-Received: by 2002:a05:600c:468f:b0:49c:fa20:cc02 with SMTP id 5b1f17b1804b1-49fe66f4fc6mr58492795e9.25.1790278785696;
        Thu, 24 Sep 2026 12:39:45 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff023f12esm1758795e9.0.2026.09.24.12.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 12:39:44 -0700 (PDT)
Date: Thu, 24 Sep 2026 22:39:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/xen/gntdev.c:817 gntdev_get_page() warn: mask and shift to
 zero: expr='(addr & ~(~((1 << 12) - 1))) >> 12'
Message-ID: <202609241805.VsLzGPLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   62f4c998b297cf233997a2b4cd6fc2d2df0319c9
commit: d70242427110123b65c095594eb74a703d3af156 ARM: rework ARM11 CPU selection logic
config: arm-randconfig-r2200-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241805.VsLzGPLn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70242427110 ("ARM: rework ARM11 CPU selection logic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609241805.VsLzGPLn-lkp@intel.com/

smatch warnings:
drivers/xen/privcmd.c:488 privcmd_ioctl_mmap_batch() warn: potential user controlled sizeof overflow 'm.num * 8' '0-u32max * 8'
drivers/xen/privcmd.c:495 privcmd_ioctl_mmap_batch() warn: potential user controlled sizeof overflow 'm.num * (4)' '0-u32max * 4'

vim +817 drivers/xen/gntdev.c
   470  static long privcmd_ioctl_mmap_batch(
   471          struct file *file, void __user *udata, int version)
   472  {
   473          struct privcmd_data *data = file->private_data;
   474          int ret;
   475          struct privcmd_mmapbatch_v2 m;
   476          struct mm_struct *mm = current->mm;
   477          struct vm_area_struct *vma;
   478          unsigned long nr_pages;
   479          LIST_HEAD(pagelist);
   480          struct mmap_batch_state state;
   481  
   482          switch (version) {
   483          case 1:
   484                  if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch)))
   485                          return -EFAULT;
   486                  /* Returns per-frame error in m.arr. */
   487                  m.err = NULL;
   488                  if (!access_ok(m.arr, m.num * sizeof(*m.arr)))
                                              ^^^^^^^^^^^^^^^^^^^^^^

   489                          return -EFAULT;
   490                  break;
   491          case 2:
   492                  if (copy_from_user(&m, udata, sizeof(struct privcmd_mmapbatch_v2)))
   493                          return -EFAULT;
   494                  /* Returns per-frame error code in m.err. */
   495                  if (!access_ok(m.err, m.num * (sizeof(*m.err))))
                                              ^^^^^^^^^^^^^^^^^^^^^^^
These integer overflow bugs are from 2012, but I guess your patch exposed
the arm32 build to the zero day bot.  The bugs only affect 32bit systems.

   496                          return -EFAULT;
   497                  break;
   498          default:
   499                  return -EINVAL;
   500          }
   501  
   502          /* If restriction is in place, check the domid matches */
   503          if (data->domid != DOMID_INVALID && data->domid != m.dom)
   504                  return -EPERM;
   505  


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

