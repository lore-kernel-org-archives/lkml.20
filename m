Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960586;
	b=sQU51gUXeMtvT5ECXvv3jf5QFS/1x1gpckpk+OzgY4cmhfZ0mb14eIwFAjoeUz+cz01T
	 xMFo37xEN8LMycdUMjFvP075JXYQnhM7jsf5lgidGSIwgnMqqf5qN5/u41+3y9ozzOXmp
	 kTshCxoL/Tz5q2iHaCST0puC8VTYl2BEY8XqMZlC4Y+cBAkrhqa/L2kzN/p81CGSXIXqT
	 egkZh+P0IumkioCWtn9Xqu2HcThniajKYL1K2h//Y11LzocqM+3wz7rY8Zk55oSpbCUKY
	 6xyE92FsJGHZgW/KdapOeoXzJ1oc23YYBX259QifzchTKQHHNodm51fLir7ERz9NXxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960586;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:Received:Date:From:To:cc:Subject:Message-ID:
	 MIME-Version:Content-Type;
	bh=GEoC8F4eB0PfwmVCHxs7o9aZ4KaiSSvOJtT9yXnvsVw=;
	b=32GWDFToS19QQhEu7VKWBHdw1mOYubFrA/M0r02vHKpbUduRDYdiEpprs3gwcraM5II8
	 HFaXhpfkYX/9gyqDK5NdLyIJFnK/CeBeeF083y7/xB+PfmhEGVVTwjd7FYQaIS1iV4ICV
	 kYT3XblHOnPDyx/lN4kt2mV879auZYhWxrZ97JXux+Q99J7bjvNu0iEDS/OWGfX4Ytg4M
	 wXwS3tIYV6uBAkt/MUDgKWAYij9MyoXVfUjSl/GN1PT7kGPmLK7HSBGzQFa/r9N1L1iQ3
	 brFHYrMFWhjNsunq5AVlF/1t3NgMFyd8nJ0v3Z6lK3byUpLHckLXVfAERASxDgo0wNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=inria.fr;
	spf=pass smtp.mailfrom=inria.fr;
	dkim=pass header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b="kdaYF/9B";
	arc=none smtp.remote-ip=192.134.164.83
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC796606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:23:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC796606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=kdaYF/9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GEoC8F4eB0PfwmVCHxs7o9aZ4KaiSSvOJtT9yXnvsVw=;
  b=kdaYF/9BjSG25rSydb0MFf5icQnV7DqUixxdLNLIKzGlHXz1PDGKqWVu
   7N3iZHmKAvYzVJ6suX35hI3rZ6JjgQebwINd6i3UI3y/bzJqXYglpL+md
   pY9NYlAm9plxsAsobliznHn1kzT9hCC5wBE9GuQp6tju4j2TgicCn7HIm
   k=;
X-CSE-ConnectionGUID: ZxYoFyceSHWeOWkeGL67DA==
X-CSE-MsgGUID: XxMv6/BKTRexXbFTkqgnAA==
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.27,197,1787004000"; 
   d="scan'208";a="304164825"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 11:22:54 +0100
Date: Fri, 6 Nov 2026 11:22:54 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
To: Namjae Jeon <linkinjeon@kernel.org>
cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
    Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@lst.de>
Subject: fs/ntfs/iomap.c:481:14-15: WARNING kmalloc is used to allocate this
 memory at line 460 (fwd)
Message-ID: <598c2f18-21f3-d252-98da-e9288356c480@inria.fr>
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



---------- Forwarded message ----------
Date: Fri, 06 Nov 2026 07:59:12 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/ntfs/iomap.c:481:14-15: WARNING kmalloc is used to allocate this
    memory at line 460

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Namjae Jeon <linkinjeon@kernel.org>
CC: Amir Goldstein <amir73il@gmail.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66469d9905b39d2c260a15d7d6db450f4db67c1
commit: 47503f989736d6c4c9f8bfca1c28d267473ccd4b ntfs: add Kconfig and Makefile
date:   9 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 9 months ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261106/202611060717.0Na5FqQR-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 47503f989736 ("ntfs: add Kconfig and Makefile")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611060717.0Na5FqQR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/ntfs/iomap.c:481:14-15: WARNING kmalloc is used to allocate this memory at line 460

vim +481 fs/ntfs/iomap.c

b041ca562526b3c Namjae Jeon 2026-02-13  378
b041ca562526b3c Namjae Jeon 2026-02-13  379  static int ntfs_write_simple_iomap_begin_non_resident(struct inode *inode, loff_t offset,
b041ca562526b3c Namjae Jeon 2026-02-13  380  						      loff_t length, struct iomap *iomap)
b041ca562526b3c Namjae Jeon 2026-02-13  381  {
b041ca562526b3c Namjae Jeon 2026-02-13  382  	struct ntfs_inode *ni = NTFS_I(inode);
b041ca562526b3c Namjae Jeon 2026-02-13  383  	struct ntfs_volume *vol = ni->vol;
b041ca562526b3c Namjae Jeon 2026-02-13  384  	loff_t vcn_ofs, rl_length;
b041ca562526b3c Namjae Jeon 2026-02-13  385  	struct runlist_element *rl, *rlc;
b041ca562526b3c Namjae Jeon 2026-02-13  386  	bool is_retry = false;
b041ca562526b3c Namjae Jeon 2026-02-13  387  	int err;
b041ca562526b3c Namjae Jeon 2026-02-13  388  	s64 vcn, lcn;
b041ca562526b3c Namjae Jeon 2026-02-13  389  	s64 max_clu_count =
b041ca562526b3c Namjae Jeon 2026-02-13  390  		ntfs_bytes_to_cluster(vol, round_up(length, vol->cluster_size));
b041ca562526b3c Namjae Jeon 2026-02-13  391
b041ca562526b3c Namjae Jeon 2026-02-13  392  	vcn = ntfs_bytes_to_cluster(vol, offset);
b041ca562526b3c Namjae Jeon 2026-02-13  393  	vcn_ofs = ntfs_bytes_to_cluster_off(vol, offset);
b041ca562526b3c Namjae Jeon 2026-02-13  394
b041ca562526b3c Namjae Jeon 2026-02-13  395  	down_read(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  396  	rl = ni->runlist.rl;
b041ca562526b3c Namjae Jeon 2026-02-13  397  	if (!rl) {
b041ca562526b3c Namjae Jeon 2026-02-13  398  		up_read(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  399  		err = ntfs_map_runlist(ni, vcn);
b041ca562526b3c Namjae Jeon 2026-02-13  400  		if (err) {
b041ca562526b3c Namjae Jeon 2026-02-13  401  			mutex_unlock(&ni->mrec_lock);
b041ca562526b3c Namjae Jeon 2026-02-13  402  			return -ENOENT;
b041ca562526b3c Namjae Jeon 2026-02-13  403  		}
b041ca562526b3c Namjae Jeon 2026-02-13  404  		down_read(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  405  		rl = ni->runlist.rl;
b041ca562526b3c Namjae Jeon 2026-02-13  406  	}
b041ca562526b3c Namjae Jeon 2026-02-13  407  	up_read(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  408
b041ca562526b3c Namjae Jeon 2026-02-13  409  	down_write(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  410  remap_rl:
b041ca562526b3c Namjae Jeon 2026-02-13  411  	/* Seek to element containing target vcn. */
b041ca562526b3c Namjae Jeon 2026-02-13  412  	rl = __ntfs_attr_find_vcn_nolock(&ni->runlist, vcn);
b041ca562526b3c Namjae Jeon 2026-02-13  413  	if (IS_ERR(rl)) {
b041ca562526b3c Namjae Jeon 2026-02-13  414  		up_write(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  415  		mutex_unlock(&ni->mrec_lock);
b041ca562526b3c Namjae Jeon 2026-02-13  416  		return -EIO;
b041ca562526b3c Namjae Jeon 2026-02-13  417  	}
b041ca562526b3c Namjae Jeon 2026-02-13  418  	lcn = ntfs_rl_vcn_to_lcn(rl, vcn);
b041ca562526b3c Namjae Jeon 2026-02-13  419
b041ca562526b3c Namjae Jeon 2026-02-13  420  	if (lcn <= LCN_RL_NOT_MAPPED && is_retry == false) {
b041ca562526b3c Namjae Jeon 2026-02-13  421  		is_retry = true;
b041ca562526b3c Namjae Jeon 2026-02-13  422  		if (!ntfs_map_runlist_nolock(ni, vcn, NULL)) {
b041ca562526b3c Namjae Jeon 2026-02-13  423  			rl = ni->runlist.rl;
b041ca562526b3c Namjae Jeon 2026-02-13  424  			goto remap_rl;
b041ca562526b3c Namjae Jeon 2026-02-13  425  		}
b041ca562526b3c Namjae Jeon 2026-02-13  426  	}
b041ca562526b3c Namjae Jeon 2026-02-13  427
b041ca562526b3c Namjae Jeon 2026-02-13  428  	max_clu_count = min(max_clu_count, rl->length - (vcn - rl->vcn));
b041ca562526b3c Namjae Jeon 2026-02-13  429  	if (max_clu_count == 0) {
b041ca562526b3c Namjae Jeon 2026-02-13  430  		ntfs_error(inode->i_sb,
b041ca562526b3c Namjae Jeon 2026-02-13  431  				"runlist(vcn : %lld, length : %lld) is corrupted\n",
b041ca562526b3c Namjae Jeon 2026-02-13  432  				rl->vcn, rl->length);
b041ca562526b3c Namjae Jeon 2026-02-13  433  		up_write(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  434  		mutex_unlock(&ni->mrec_lock);
b041ca562526b3c Namjae Jeon 2026-02-13  435  		return -EIO;
b041ca562526b3c Namjae Jeon 2026-02-13  436  	}
b041ca562526b3c Namjae Jeon 2026-02-13  437
b041ca562526b3c Namjae Jeon 2026-02-13  438  	iomap->bdev = inode->i_sb->s_bdev;
b041ca562526b3c Namjae Jeon 2026-02-13  439  	iomap->offset = offset;
b041ca562526b3c Namjae Jeon 2026-02-13  440
b041ca562526b3c Namjae Jeon 2026-02-13  441  	if (lcn <= LCN_DELALLOC) {
b041ca562526b3c Namjae Jeon 2026-02-13  442  		if (lcn < LCN_DELALLOC) {
b041ca562526b3c Namjae Jeon 2026-02-13  443  			max_clu_count =
b041ca562526b3c Namjae Jeon 2026-02-13  444  				ntfs_available_clusters_count(vol, max_clu_count);
b041ca562526b3c Namjae Jeon 2026-02-13  445  			if (max_clu_count < 0) {
b041ca562526b3c Namjae Jeon 2026-02-13  446  				err = max_clu_count;
b041ca562526b3c Namjae Jeon 2026-02-13  447  				up_write(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  448  				mutex_unlock(&ni->mrec_lock);
b041ca562526b3c Namjae Jeon 2026-02-13  449  				return err;
b041ca562526b3c Namjae Jeon 2026-02-13  450  			}
b041ca562526b3c Namjae Jeon 2026-02-13  451  		}
b041ca562526b3c Namjae Jeon 2026-02-13  452
b041ca562526b3c Namjae Jeon 2026-02-13  453  		iomap->type = IOMAP_DELALLOC;
b041ca562526b3c Namjae Jeon 2026-02-13  454  		iomap->addr = IOMAP_NULL_ADDR;
b041ca562526b3c Namjae Jeon 2026-02-13  455
b041ca562526b3c Namjae Jeon 2026-02-13  456  		if (lcn <= LCN_HOLE) {
b041ca562526b3c Namjae Jeon 2026-02-13  457  			size_t new_rl_count;
b041ca562526b3c Namjae Jeon 2026-02-13  458
b041ca562526b3c Namjae Jeon 2026-02-13  459  			rlc = kmalloc(sizeof(struct runlist_element) * 2,
b041ca562526b3c Namjae Jeon 2026-02-13 @460  					GFP_NOFS);
b041ca562526b3c Namjae Jeon 2026-02-13  461  			if (!rlc) {
b041ca562526b3c Namjae Jeon 2026-02-13  462  				up_write(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  463  				mutex_unlock(&ni->mrec_lock);
b041ca562526b3c Namjae Jeon 2026-02-13  464  				return -ENOMEM;
b041ca562526b3c Namjae Jeon 2026-02-13  465  			}
b041ca562526b3c Namjae Jeon 2026-02-13  466
b041ca562526b3c Namjae Jeon 2026-02-13  467  			rlc->vcn = vcn;
b041ca562526b3c Namjae Jeon 2026-02-13  468  			rlc->lcn = LCN_DELALLOC;
b041ca562526b3c Namjae Jeon 2026-02-13  469  			rlc->length = max_clu_count;
b041ca562526b3c Namjae Jeon 2026-02-13  470
b041ca562526b3c Namjae Jeon 2026-02-13  471  			rlc[1].vcn = vcn + max_clu_count;
b041ca562526b3c Namjae Jeon 2026-02-13  472  			rlc[1].lcn = LCN_RL_NOT_MAPPED;
b041ca562526b3c Namjae Jeon 2026-02-13  473  			rlc[1].length = 0;
b041ca562526b3c Namjae Jeon 2026-02-13  474
b041ca562526b3c Namjae Jeon 2026-02-13  475  			rl = ntfs_runlists_merge(&ni->runlist, rlc, 0,
b041ca562526b3c Namjae Jeon 2026-02-13  476  					&new_rl_count);
b041ca562526b3c Namjae Jeon 2026-02-13  477  			if (IS_ERR(rl)) {
b041ca562526b3c Namjae Jeon 2026-02-13  478  				ntfs_error(vol->sb, "Failed to merge runlists");
b041ca562526b3c Namjae Jeon 2026-02-13  479  				up_write(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  480  				mutex_unlock(&ni->mrec_lock);
b041ca562526b3c Namjae Jeon 2026-02-13 @481  				kvfree(rlc);
b041ca562526b3c Namjae Jeon 2026-02-13  482  				return PTR_ERR(rl);
b041ca562526b3c Namjae Jeon 2026-02-13  483  			}
b041ca562526b3c Namjae Jeon 2026-02-13  484
b041ca562526b3c Namjae Jeon 2026-02-13  485  			ni->runlist.rl = rl;
b041ca562526b3c Namjae Jeon 2026-02-13  486  			ni->runlist.count = new_rl_count;
b041ca562526b3c Namjae Jeon 2026-02-13  487  			ni->i_dealloc_clusters += max_clu_count;
b041ca562526b3c Namjae Jeon 2026-02-13  488  		}
b041ca562526b3c Namjae Jeon 2026-02-13  489  		up_write(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  490  		mutex_unlock(&ni->mrec_lock);
b041ca562526b3c Namjae Jeon 2026-02-13  491
b041ca562526b3c Namjae Jeon 2026-02-13  492  		if (lcn < LCN_DELALLOC)
b041ca562526b3c Namjae Jeon 2026-02-13  493  			ntfs_hold_dirty_clusters(vol, max_clu_count);
b041ca562526b3c Namjae Jeon 2026-02-13  494
b041ca562526b3c Namjae Jeon 2026-02-13  495  		rl_length = ntfs_cluster_to_bytes(vol, max_clu_count);
b041ca562526b3c Namjae Jeon 2026-02-13  496  		if (length > rl_length - vcn_ofs)
b041ca562526b3c Namjae Jeon 2026-02-13  497  			iomap->length = rl_length - vcn_ofs;
b041ca562526b3c Namjae Jeon 2026-02-13  498  		else
b041ca562526b3c Namjae Jeon 2026-02-13  499  			iomap->length = length;
b041ca562526b3c Namjae Jeon 2026-02-13  500
b041ca562526b3c Namjae Jeon 2026-02-13  501  		iomap->flags = IOMAP_F_NEW;
b041ca562526b3c Namjae Jeon 2026-02-13  502  		if (lcn <= LCN_HOLE) {
b041ca562526b3c Namjae Jeon 2026-02-13  503  			loff_t end = offset + length;
b041ca562526b3c Namjae Jeon 2026-02-13  504
b041ca562526b3c Namjae Jeon 2026-02-13  505  			if (vcn_ofs || ((vol->cluster_size > iomap->length) &&
b041ca562526b3c Namjae Jeon 2026-02-13  506  					end < ni->initialized_size)) {
b041ca562526b3c Namjae Jeon 2026-02-13  507  				loff_t z_start, z_end;
b041ca562526b3c Namjae Jeon 2026-02-13  508
b041ca562526b3c Namjae Jeon 2026-02-13  509  				z_start = vcn << vol->cluster_size_bits;
b041ca562526b3c Namjae Jeon 2026-02-13  510  				z_end = min_t(loff_t, z_start + vol->cluster_size,
b041ca562526b3c Namjae Jeon 2026-02-13  511  					      i_size_read(inode));
b041ca562526b3c Namjae Jeon 2026-02-13  512  				if (z_end > z_start)
b041ca562526b3c Namjae Jeon 2026-02-13  513  					err = ntfs_zero_range(inode,
b041ca562526b3c Namjae Jeon 2026-02-13  514  							      z_start,
b041ca562526b3c Namjae Jeon 2026-02-13  515  							      z_end - z_start);
b041ca562526b3c Namjae Jeon 2026-02-13  516  			}
b041ca562526b3c Namjae Jeon 2026-02-13  517  			if ((!err || err == -EPERM) &&
b041ca562526b3c Namjae Jeon 2026-02-13  518  			    max_clu_count > 1 &&
b041ca562526b3c Namjae Jeon 2026-02-13  519  			    (iomap->length & vol->cluster_size_mask &&
b041ca562526b3c Namjae Jeon 2026-02-13  520  			     end < ni->initialized_size)) {
b041ca562526b3c Namjae Jeon 2026-02-13  521  				loff_t z_start, z_end;
b041ca562526b3c Namjae Jeon 2026-02-13  522
b041ca562526b3c Namjae Jeon 2026-02-13  523  				z_start = (vcn + max_clu_count - 1) <<
b041ca562526b3c Namjae Jeon 2026-02-13  524  					vol->cluster_size_bits;
b041ca562526b3c Namjae Jeon 2026-02-13  525  				z_end = min_t(loff_t, z_start + vol->cluster_size,
b041ca562526b3c Namjae Jeon 2026-02-13  526  					      i_size_read(inode));
b041ca562526b3c Namjae Jeon 2026-02-13  527  				if (z_end > z_start)
b041ca562526b3c Namjae Jeon 2026-02-13  528  					err = ntfs_zero_range(inode,
b041ca562526b3c Namjae Jeon 2026-02-13  529  							      z_start,
b041ca562526b3c Namjae Jeon 2026-02-13  530  							      z_end - z_start);
b041ca562526b3c Namjae Jeon 2026-02-13  531  			}
b041ca562526b3c Namjae Jeon 2026-02-13  532
b041ca562526b3c Namjae Jeon 2026-02-13  533  			if (err == -EPERM)
b041ca562526b3c Namjae Jeon 2026-02-13  534  				err = 0;
b041ca562526b3c Namjae Jeon 2026-02-13  535  			if (err) {
b041ca562526b3c Namjae Jeon 2026-02-13  536  				ntfs_release_dirty_clusters(vol, max_clu_count);
b041ca562526b3c Namjae Jeon 2026-02-13  537  				return err;
b041ca562526b3c Namjae Jeon 2026-02-13  538  			}
b041ca562526b3c Namjae Jeon 2026-02-13  539  		}
b041ca562526b3c Namjae Jeon 2026-02-13  540  	} else {
b041ca562526b3c Namjae Jeon 2026-02-13  541  		up_write(&ni->runlist.lock);
b041ca562526b3c Namjae Jeon 2026-02-13  542  		mutex_unlock(&ni->mrec_lock);
b041ca562526b3c Namjae Jeon 2026-02-13  543
b041ca562526b3c Namjae Jeon 2026-02-13  544  		iomap->type = IOMAP_MAPPED;
b041ca562526b3c Namjae Jeon 2026-02-13  545  		iomap->addr = ntfs_cluster_to_bytes(vol, lcn) + vcn_ofs;
b041ca562526b3c Namjae Jeon 2026-02-13  546
b041ca562526b3c Namjae Jeon 2026-02-13  547  		rl_length = ntfs_cluster_to_bytes(vol, max_clu_count);
b041ca562526b3c Namjae Jeon 2026-02-13  548  		if (length > rl_length - vcn_ofs)
b041ca562526b3c Namjae Jeon 2026-02-13  549  			iomap->length = rl_length - vcn_ofs;
b041ca562526b3c Namjae Jeon 2026-02-13  550  		else
b041ca562526b3c Namjae Jeon 2026-02-13  551  			iomap->length = length;
b041ca562526b3c Namjae Jeon 2026-02-13  552  	}
b041ca562526b3c Namjae Jeon 2026-02-13  553
b041ca562526b3c Namjae Jeon 2026-02-13  554  	return 0;
b041ca562526b3c Namjae Jeon 2026-02-13  555  }
b041ca562526b3c Namjae Jeon 2026-02-13  556

:::::: The code at line 481 was first introduced by commit
:::::: b041ca562526b3c4a71b41b80ba5e520eac636ad ntfs: update iomap and address space operations

:::::: TO: Namjae Jeon <linkinjeon@kernel.org>
:::::: CC: Namjae Jeon <linkinjeon@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
