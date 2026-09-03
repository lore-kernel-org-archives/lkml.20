Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE6C4FB9BD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 18:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459064; cv=none; b=NRwt6l+U2gagFyfq4xOMs0u4wXRgB5rJKmxYnsCmsdElILJSFfHyhw4MmerBnMXvNZuoZGctm5oQ5zObVf9wat3Ul43EfJH4zlhL3uddeBLF7BHfgwflAksV+UFLA5Y05li01hBea50JthazNzG+F6LaxMFX+uHZ3je0+iZDYic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459064; c=relaxed/simple;
	bh=NeEWEh6osYZomfU8a3ZRvzXa61aRgTgHMGGV61D2qfU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l0NYiPYO8zE+j5Nsx1IzA0huibft18RqKbGJKLU3sKyV8SKBQwIuij3+3feSYNBPgV2UZrLZQfm0FlDUi5iX/XrNHjC0SqjJBoG29bSFZ8jDNtCxZ2GfqYape5XpvTwNJrT6w4Sac43jgjN+Lo9Hkdd9cJWWpmMigCFJVdpEjFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivfMe6Q3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivfMe6Q3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788459063; x=1819995063;
  h=date:from:to:cc:subject:message-id;
  bh=NeEWEh6osYZomfU8a3ZRvzXa61aRgTgHMGGV61D2qfU=;
  b=ivfMe6Q3zcRgdjeq1wSqdJf8Uh0h//uMWBTvvqGgWRG595NzBE4cgbSX
   FBQOydNdDZDLhR2OJaiYkKoKvM2HVX18QHmjHlJ86qOzbRmWK3uGjCpma
   ei6sooIyEw9yIH7+hs+Z39hflgnCsgBIq5V847MSoX+364bKTQGLu7GaZ
   5bQS+38wrvbr9entLIMiW2G7u03Zz5uc37p8HRNuebRdChoHkExo38lwY
   KHNB1yPrn+OuGZVwIrx3SDRbHyRVpSWilwaKX8aH+tM7L2VkZbwbT2LYu
   8L4bY7a0AKj4CHZU5SNl6yn59NpZIvxH0mdi61oao1nue5JXl+IBAzTOr
   Q==;
X-CSE-ConnectionGUID: s/yIYy21Q/ONR6JEth6lwQ==
X-CSE-MsgGUID: 21GLYa0fQ7iv2Tybur6baQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="111724772"
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="111724772"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 11:11:03 -0700
X-CSE-ConnectionGUID: wWNTYA9pScumfXynBy2lnw==
X-CSE-MsgGUID: TjebFYuGQjiRLq53jfZSLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,260,1779174000"; 
   d="scan'208";a="269791860"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Sep 2026 11:11:01 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2Btp-000000005D2-3lQR;
	Thu, 03 Sep 2026 18:10:57 +0000
Date: Fri, 04 Sep 2026 02:10:13 +0800
From: kernel test robot <lkp@intel.com>
To: Krystian Kaniewski <krystianmkaniewski@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: fs/ocfs2/xattr.c:643:5-8: Unneeded variable: "ret". Return
 "0" on line 665
Message-ID: <202609040247.8B3lmoqX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ab1afb2eb246ab15b301cd255b5943d208a93c1
commit: bd7c05fb4a4776dff5a87b19008d28458647d15d ocfs2: fix circular locking dependency in ocfs2_init_acl()
date:   3 weeks ago
config: riscv-randconfig-r052-20260903 (https://download.01.org/0day-ci/archive/20260904/202609040247.8B3lmoqX-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: bd7c05fb4a47 ("ocfs2: fix circular locking dependency in ocfs2_init_acl()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609040247.8B3lmoqX-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ocfs2/xattr.c:643:5-8: Unneeded variable: "ret". Return "0" on line 665

vim +643 fs/ocfs2/xattr.c

534eadddc1de87 Tiger Yang         2008-11-14  637  
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  638  int ocfs2_calc_xattr_init(struct inode *dir, umode_t mode,
89c38bd0ade3c5 Tiger Yang         2008-11-14  639  			  struct ocfs2_security_xattr_info *si,
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  640  			  int *want_clusters, int *xattr_credits,
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  641  			  int *want_meta, struct ocfs2_acl_state *acl_state)
89c38bd0ade3c5 Tiger Yang         2008-11-14  642  {
89c38bd0ade3c5 Tiger Yang         2008-11-14 @643  	int ret = 0;
89c38bd0ade3c5 Tiger Yang         2008-11-14  644  	struct ocfs2_super *osb = OCFS2_SB(dir->i_sb);
0e445b6fe93c72 Tiger Yang         2008-12-09  645  	int s_size = 0, a_size = 0, acl_len = 0, new_clusters;
89c38bd0ade3c5 Tiger Yang         2008-11-14  646  
89c38bd0ade3c5 Tiger Yang         2008-11-14  647  	if (si->enable)
89c38bd0ade3c5 Tiger Yang         2008-11-14  648  		s_size = ocfs2_xattr_entry_real_size(strlen(si->name),
89c38bd0ade3c5 Tiger Yang         2008-11-14  649  						     si->value_len);
89c38bd0ade3c5 Tiger Yang         2008-11-14  650  
89c38bd0ade3c5 Tiger Yang         2008-11-14  651  	if (osb->s_mount_opt & OCFS2_MOUNT_POSIX_ACL) {
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  652  		if (acl_state->default_acl && S_ISDIR(mode)) {
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  653  			acl_len = acl_state->default_acl->a_count *
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  654  				  sizeof(struct ocfs2_acl_entry);
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  655  			a_size += ocfs2_xattr_entry_real_size(0, acl_len);
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  656  		}
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  657  		if (acl_state->acl) {
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  658  			acl_len = acl_state->acl->a_count *
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  659  				  sizeof(struct ocfs2_acl_entry);
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  660  			a_size += ocfs2_xattr_entry_real_size(0, acl_len);
89c38bd0ade3c5 Tiger Yang         2008-11-14  661  		}
89c38bd0ade3c5 Tiger Yang         2008-11-14  662  	}
89c38bd0ade3c5 Tiger Yang         2008-11-14  663  
89c38bd0ade3c5 Tiger Yang         2008-11-14  664  	if (!(s_size + a_size))
89c38bd0ade3c5 Tiger Yang         2008-11-14 @665  		return ret;
89c38bd0ade3c5 Tiger Yang         2008-11-14  666  
89c38bd0ade3c5 Tiger Yang         2008-11-14  667  	/*
89c38bd0ade3c5 Tiger Yang         2008-11-14  668  	 * The max space of security xattr taken inline is
89c38bd0ade3c5 Tiger Yang         2008-11-14  669  	 * 256(name) + 80(value) + 16(entry) = 352 bytes,
89c38bd0ade3c5 Tiger Yang         2008-11-14  670  	 * The max space of acl xattr taken inline is
89c38bd0ade3c5 Tiger Yang         2008-11-14  671  	 * 80(value) + 16(entry) * 2(if directory) = 192 bytes,
a0f8a9a9636e19 Dmitry Antipov     2024-11-15  672  	 * when blocksize = 512, may reserve one more cluster for
89c38bd0ade3c5 Tiger Yang         2008-11-14  673  	 * xattr bucket, otherwise reserve one metadata block
89c38bd0ade3c5 Tiger Yang         2008-11-14  674  	 * for them is ok.
6c9fd1dc0a597e Tiger Yang         2009-03-06  675  	 * If this is a new directory with inline data,
6c9fd1dc0a597e Tiger Yang         2009-03-06  676  	 * we choose to reserve the entire inline area for
6c9fd1dc0a597e Tiger Yang         2009-03-06  677  	 * directory contents and force an external xattr block.
89c38bd0ade3c5 Tiger Yang         2008-11-14  678  	 */
89c38bd0ade3c5 Tiger Yang         2008-11-14  679  	if (dir->i_sb->s_blocksize == OCFS2_MIN_BLOCKSIZE ||
6c9fd1dc0a597e Tiger Yang         2009-03-06  680  	    (S_ISDIR(mode) && ocfs2_supports_inline_data(osb)) ||
89c38bd0ade3c5 Tiger Yang         2008-11-14  681  	    (s_size + a_size) > OCFS2_XATTR_FREE_IN_IBODY) {
9b7895efac906d Mark Fasheh        2008-11-12  682  		*want_meta = *want_meta + 1;
89c38bd0ade3c5 Tiger Yang         2008-11-14  683  		*xattr_credits += OCFS2_XATTR_BLOCK_CREATE_CREDITS;
89c38bd0ade3c5 Tiger Yang         2008-11-14  684  	}
89c38bd0ade3c5 Tiger Yang         2008-11-14  685  
89c38bd0ade3c5 Tiger Yang         2008-11-14  686  	if (dir->i_sb->s_blocksize == OCFS2_MIN_BLOCKSIZE &&
89c38bd0ade3c5 Tiger Yang         2008-11-14  687  	    (s_size + a_size) > OCFS2_XATTR_FREE_IN_BLOCK(dir)) {
89c38bd0ade3c5 Tiger Yang         2008-11-14  688  		*want_clusters += 1;
89c38bd0ade3c5 Tiger Yang         2008-11-14  689  		*xattr_credits += ocfs2_blocks_per_xattr_bucket(dir->i_sb);
89c38bd0ade3c5 Tiger Yang         2008-11-14  690  	}
89c38bd0ade3c5 Tiger Yang         2008-11-14  691  
0e445b6fe93c72 Tiger Yang         2008-12-09  692  	/*
0e445b6fe93c72 Tiger Yang         2008-12-09  693  	 * reserve credits and clusters for xattrs which has large value
0e445b6fe93c72 Tiger Yang         2008-12-09  694  	 * and have to be set outside
0e445b6fe93c72 Tiger Yang         2008-12-09  695  	 */
0e445b6fe93c72 Tiger Yang         2008-12-09  696  	if (si->enable && si->value_len > OCFS2_XATTR_INLINE_SIZE) {
0e445b6fe93c72 Tiger Yang         2008-12-09  697  		new_clusters = ocfs2_clusters_for_bytes(dir->i_sb,
89c38bd0ade3c5 Tiger Yang         2008-11-14  698  							si->value_len);
0e445b6fe93c72 Tiger Yang         2008-12-09  699  		*xattr_credits += ocfs2_clusters_to_blocks(dir->i_sb,
0e445b6fe93c72 Tiger Yang         2008-12-09  700  							   new_clusters);
0e445b6fe93c72 Tiger Yang         2008-12-09  701  		*want_clusters += new_clusters;
0e445b6fe93c72 Tiger Yang         2008-12-09  702  	}
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  703  	if (osb->s_mount_opt & OCFS2_MOUNT_POSIX_ACL) {
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  704  		if (acl_state->default_acl && S_ISDIR(mode)) {
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  705  			acl_len = acl_state->default_acl->a_count *
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  706  				  sizeof(struct ocfs2_acl_entry);
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  707  			if (acl_len > OCFS2_XATTR_INLINE_SIZE) {
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  708  				new_clusters =
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  709  					ocfs2_clusters_for_bytes(dir->i_sb,
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  710  								 acl_len);
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  711  				*xattr_credits +=
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  712  					ocfs2_clusters_to_blocks(dir->i_sb,
0e445b6fe93c72 Tiger Yang         2008-12-09  713  								 new_clusters);
0e445b6fe93c72 Tiger Yang         2008-12-09  714  				*want_clusters += new_clusters;
89c38bd0ade3c5 Tiger Yang         2008-11-14  715  			}
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  716  		}
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  717  		if (acl_state->acl) {
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  718  			acl_len = acl_state->acl->a_count *
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  719  				  sizeof(struct ocfs2_acl_entry);
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  720  			if (acl_len > OCFS2_XATTR_INLINE_SIZE) {
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  721  				new_clusters =
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  722  					ocfs2_clusters_for_bytes(dir->i_sb,
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  723  								 acl_len);
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  724  				*xattr_credits +=
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  725  					ocfs2_clusters_to_blocks(dir->i_sb,
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  726  								 new_clusters);
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  727  				*want_clusters += new_clusters;
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  728  			}
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  729  		}
bd7c05fb4a4776 Krystian Kaniewski 2026-07-30  730  	}
89c38bd0ade3c5 Tiger Yang         2008-11-14  731  
89c38bd0ade3c5 Tiger Yang         2008-11-14  732  	return ret;
89c38bd0ade3c5 Tiger Yang         2008-11-14  733  }
89c38bd0ade3c5 Tiger Yang         2008-11-14  734  

:::::: The code at line 643 was first introduced by commit
:::::: 89c38bd0ade3c567707ed8fce088b253b0369c50 ocfs2: add ocfs2_init_acl in mknod

:::::: TO: Tiger Yang <tiger.yang@oracle.com>
:::::: CC: Mark Fasheh <mfasheh@suse.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
