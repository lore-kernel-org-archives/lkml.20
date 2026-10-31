Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793427329;
	b=5fEgHn9ELDyr5ibiAo/B9vFHSmAsfVPR3HedFGa0Yt4j35XaGbaks3LAFHL+HgUkaxNP
	 uG965FMrfL9w90O8RTVdDJFjJNo09EbBGMasIcMV9IgjnidQlP+Jy0GDQbgt6bLKhK70B
	 3qt4oiyhscRzzj0+ktzEE6Il3kRQNvVMp5NPh+sq9k75/tuW+WI6/jdXlUIs+7PKlivnI
	 j0IaLdL43o/bJ2PWn9OaScK+hqYX6G2AuNzPrTfBooHEH+sE7xZvp3ajS5H2mA2RisNhW
	 I1I3KugkMXyp2Mfi++i7tHeFqpYXGipLjDJfKNI/A/1FqNHip5sx/6Aa1jvIzh8Clvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793427329;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=HuGUo0v+R9av9/MPhsxSkYxao4B6X/dKacIweSE1NvI=;
	b=ceQthYLxUJ+tZN5E2RyTKhsZq3WJdsM8RUdNAniGm+LRq53/DiXlG2PZNhAGAi/xmIiC
	 y7CPis+zuWxgx1CBrkVc2CZrWNp59FP4gVL7gn4T+CS9nZiRTHGP7VtEPt0cyM0ynusJi
	 mel3tms4UOCDeaqAj42k/mYcji/EGHsbYz7SoI5EhhpZb2vZSpAYSo4aUclPHih5dD/BV
	 GQTd25paIIHTgEQ7XMnwlQDClz73mgn/Pko68YzJ3OgWc+7w9EWiDG3vL/Yea4wjTpNZ3
	 P7I//lkeDZAWCLyABmr13c1NUoMCLj6wP8cabUxvYX4qFD0Os8nXnSDOLrRL4D1kdTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FlUzJJbt;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A0606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 06:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 788A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FlUzJJbt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793427329; x=1824963329;
  h=date:from:to:cc:subject:message-id;
  bh=vWcV4k3CKrpu0RXSR1JUj3KTs6CCAB1EnUXXgEEr9UY=;
  b=FlUzJJbtvd3mDFpvDamulOd7S9XF05S3CHAVfszQSlXJF/ASJeXX7yzh
   h/m+4GQ0CEGUXQKoJEI8jSRktcXmtfgHvGEO7VX96NlsDftwu0W2zjnMN
   UKIWQ6UgTJIzos3piDA/pMQBJGlhju0ekLwxVMtsiTvqx7OXkONUkNH8f
   EpPNDsHj8P7KoAHmS8CppPNaJzKhYiG8XnbsgfLeqeF06Z6PLEvczgmTZ
   3OQB3EPwvk3fpACUwAkgSk+s29PfmJV0HtXocfgUF2nKYs1lEWMicxlCc
   Y3Y+YQH+aQVYC86iSmbmGJr5gNMBCN5QuX8EfYVp1dDd+Xd90CgDHnVxv
   g==;
X-CSE-ConnectionGUID: /3k+RmRgRsCBzx020YwU+g==
X-CSE-MsgGUID: 7kVtYNGtQESLE3pGutxQqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2080867"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2080867"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 23:15:28 -0700
X-CSE-ConnectionGUID: Nc64eSwwReeISxRtBCQIpw==
X-CSE-MsgGUID: MxsqBaK3R26oTxW3C2vu6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="6028674"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2026 23:15:26 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN2N9-000000005tF-1tue;
	Sat, 31 Oct 2026 06:15:23 +0000
Date: Sat, 31 Oct 2026 07:14:37 +0100
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: fs/ecryptfs/miscdev.c:285:13: sparse: sparse: restricted
 __be32 degrades to integer
Message-ID: <202610310715.jnQiuxAF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   36aad21d50d1af3f6954bb0c988257a908202477
commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd LoongArch: Adjust build infrastructure for 32BIT/64BIT
date:   6 months ago
config: loongarch-randconfig-r2300-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310715.jnQiuxAF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310715.jnQiuxAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310715.jnQiuxAF-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/ecryptfs/miscdev.c:285:13: sparse: sparse: restricted __be32 degrades to integer
>> fs/ecryptfs/miscdev.c:285:13: sparse: sparse: restricted __be32 degrades to integer
>> fs/ecryptfs/miscdev.c:285:13: sparse: sparse: cast from restricted __be32

vim +285 fs/ecryptfs/miscdev.c

48399c0b0e6172 Tyler Hicks     2012-01-14  196  
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  197  /**
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  198   * ecryptfs_miscdev_read - format and send message from queue
2ecaf55db6dcf4 Tyler Hicks     2012-06-11  199   * @file: miscdevfs handle
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  200   * @buf: User buffer into which to copy the next message on the daemon queue
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  201   * @count: Amount of space available in @buf
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  202   * @ppos: Offset in file (ignored)
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  203   *
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  204   * Pulls the most recent message from the daemon queue, formats it for
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  205   * being sent via a miscdevfs handle, and copies it into @buf
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  206   *
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  207   * Returns the number of bytes copied into the user buffer
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  208   */
f66e883eb6186b Michael Halcrow 2008-04-29  209  static ssize_t
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  210  ecryptfs_miscdev_read(struct file *file, char __user *buf, size_t count,
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  211  		      loff_t *ppos)
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  212  {
2ecaf55db6dcf4 Tyler Hicks     2012-06-11  213  	struct ecryptfs_daemon *daemon = file->private_data;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  214  	struct ecryptfs_msg_ctx *msg_ctx;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  215  	size_t packet_length_size;
48399c0b0e6172 Tyler Hicks     2012-01-14  216  	char packet_length[ECRYPTFS_MAX_PKT_LEN_SIZE];
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  217  	size_t i;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  218  	size_t total_length;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  219  	int rc;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  220  
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  221  	mutex_lock(&daemon->mux);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  222  	if (daemon->flags & ECRYPTFS_DAEMON_ZOMBIE) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  223  		rc = 0;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  224  		printk(KERN_WARNING "%s: Attempt to read from zombified "
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  225  		       "daemon\n", __func__);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  226  		goto out_unlock_daemon;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  227  	}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  228  	if (daemon->flags & ECRYPTFS_DAEMON_IN_READ) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  229  		rc = 0;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  230  		goto out_unlock_daemon;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  231  	}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  232  	/* This daemon will not go away so long as this flag is set */
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  233  	daemon->flags |= ECRYPTFS_DAEMON_IN_READ;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  234  check_list:
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  235  	if (list_empty(&daemon->msg_ctx_out_queue)) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  236  		mutex_unlock(&daemon->mux);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  237  		rc = wait_event_interruptible(
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  238  			daemon->wait, !list_empty(&daemon->msg_ctx_out_queue));
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  239  		mutex_lock(&daemon->mux);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  240  		if (rc < 0) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  241  			rc = 0;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  242  			goto out_unlock_daemon;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  243  		}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  244  	}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  245  	if (daemon->flags & ECRYPTFS_DAEMON_ZOMBIE) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  246  		rc = 0;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  247  		goto out_unlock_daemon;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  248  	}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  249  	if (list_empty(&daemon->msg_ctx_out_queue)) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  250  		/* Something else jumped in since the
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  251  		 * wait_event_interruptable() and removed the
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  252  		 * message from the queue; try again */
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  253  		goto check_list;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  254  	}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  255  	msg_ctx = list_first_entry(&daemon->msg_ctx_out_queue,
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  256  				   struct ecryptfs_msg_ctx, daemon_out_list);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  257  	BUG_ON(!msg_ctx);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  258  	mutex_lock(&msg_ctx->mux);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  259  	if (msg_ctx->msg) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  260  		rc = ecryptfs_write_packet_length(packet_length,
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  261  						  msg_ctx->msg_size,
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  262  						  &packet_length_size);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  263  		if (rc) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  264  			rc = 0;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  265  			printk(KERN_WARNING "%s: Error writing packet length; "
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  266  			       "rc = [%d]\n", __func__, rc);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  267  			goto out_unlock_msg_ctx;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  268  		}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  269  	} else {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  270  		packet_length_size = 0;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  271  		msg_ctx->msg_size = 0;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  272  	}
48399c0b0e6172 Tyler Hicks     2012-01-14  273  	total_length = (PKT_TYPE_SIZE + PKT_CTR_SIZE + packet_length_size
48399c0b0e6172 Tyler Hicks     2012-01-14  274  			+ msg_ctx->msg_size);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  275  	if (count < total_length) {
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  276  		rc = 0;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  277  		printk(KERN_WARNING "%s: Only given user buffer of "
df261c52abdef1 Michael Halcrow 2009-01-06  278  		       "size [%zd], but we need [%zd] to read the "
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  279  		       "pending message\n", __func__, count, total_length);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  280  		goto out_unlock_msg_ctx;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  281  	}
79bc12a0a09c2e Al Viro         2008-05-21  282  	rc = -EFAULT;
79bc12a0a09c2e Al Viro         2008-05-21  283  	if (put_user(msg_ctx->type, buf))
79bc12a0a09c2e Al Viro         2008-05-21  284  		goto out_unlock_msg_ctx;
48399c0b0e6172 Tyler Hicks     2012-01-14 @285  	if (put_user(cpu_to_be32(msg_ctx->counter),
48399c0b0e6172 Tyler Hicks     2012-01-14  286  		     (__be32 __user *)(&buf[PKT_CTR_OFFSET])))
79bc12a0a09c2e Al Viro         2008-05-21  287  		goto out_unlock_msg_ctx;
48399c0b0e6172 Tyler Hicks     2012-01-14  288  	i = PKT_TYPE_SIZE + PKT_CTR_SIZE;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  289  	if (msg_ctx->msg) {
79bc12a0a09c2e Al Viro         2008-05-21  290  		if (copy_to_user(&buf[i], packet_length, packet_length_size))
79bc12a0a09c2e Al Viro         2008-05-21  291  			goto out_unlock_msg_ctx;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  292  		i += packet_length_size;
79bc12a0a09c2e Al Viro         2008-05-21  293  		if (copy_to_user(&buf[i], msg_ctx->msg, msg_ctx->msg_size))
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  294  			goto out_unlock_msg_ctx;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  295  		i += msg_ctx->msg_size;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  296  	}
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  297  	rc = i;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  298  	list_del(&msg_ctx->daemon_out_list);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  299  	kfree(msg_ctx->msg);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  300  	msg_ctx->msg = NULL;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  301  	/* We do not expect a reply from the userspace daemon for any
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  302  	 * message type other than ECRYPTFS_MSG_REQUEST */
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  303  	if (msg_ctx->type != ECRYPTFS_MSG_REQUEST)
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  304  		ecryptfs_msg_ctx_alloc_to_free(msg_ctx);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  305  out_unlock_msg_ctx:
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  306  	mutex_unlock(&msg_ctx->mux);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  307  out_unlock_daemon:
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  308  	daemon->flags &= ~ECRYPTFS_DAEMON_IN_READ;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  309  	mutex_unlock(&daemon->mux);
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  310  	return rc;
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  311  }
8bf2debd5f7bf1 Michael Halcrow 2008-04-29  312  

:::::: The code at line 285 was first introduced by commit
:::::: 48399c0b0e6172888a2e2e36df1595ab1e049ba8 eCryptfs: Replace miscdev read/write magic numbers

:::::: TO: Tyler Hicks <tyhicks@canonical.com>
:::::: CC: Tyler Hicks <tyhicks@canonical.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
