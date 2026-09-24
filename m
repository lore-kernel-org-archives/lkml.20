Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A291F1304
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 00:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790210110; cv=none; b=UrQu5M/AQJ/iCZnIRZogKinfLkIclVFDnDAsnd14cfuX3anfUOwE1x8mfVL8vhYSiphU6TyGmkzrLgrTJq/TrMBoC2Pa6vaGqz20wRByusTVHp+4qvgSM5HjcITR2w37CRYVBxGxrF8lNnXALfRKpNfkLs9X4rpywe8wOfYQ+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790210110; c=relaxed/simple;
	bh=bGReus9zlh3bkExHnHhk6dx9YMJz1ozvPWbibJzTJqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXh1S6tFI5adhvN35ZtMSsa4nTBIZ6TfCEfxiyJVeimsr0a7jk7rNr30M/lY5ab1xgCtx0sIV/QR/o2NYr/31wgeISnaeavsyMiOBntxPUMvUuSljfvXFt1aceZK7SPTUEmaVMaYF78B9fcw6sVDEkpeoHjqRvPwqpyom0FE7w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EWYlN/m/; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EWYlN/m/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790210109; x=1821746109;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bGReus9zlh3bkExHnHhk6dx9YMJz1ozvPWbibJzTJqI=;
  b=EWYlN/m/18KTbRWbyI4GAgiw8odnR0m3ty/CkeXRlJGR8ycI7L/Kluos
   6bqXB56+9klw3FC9bRSrr9Azg88WxT6NBM6bqgEDO/GlFPszcjRWgS6eB
   X1QvhJrK5mjxJDLxZitXmaFy4VdwfCzDtCY5/9RVU5pMk5KvYxpg2jhJR
   hSR6lj6GfcSOuodxnCIdD4PC5RjQyt7jfAD+2l6IGS11J2rw4NHhNzTFu
   qov52dESizSFae9bQOJlyMb7czkn8uZlmplpxwKvtuy0rCiOVzbSr56kn
   nF4cmz1imZCgg+/xiwZ05Shioer8DJQvE+JuBUwQ0kUiVC7Psn0qHaYZ5
   Q==;
X-CSE-ConnectionGUID: Id8wvbXmRNKDQXPSCqhJ0A==
X-CSE-MsgGUID: Padjz7lIT0KZ/x6m9pQNWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91070321"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91070321"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 17:35:09 -0700
X-CSE-ConnectionGUID: 0E4/0s0zSMmMTac+lFJS/A==
X-CSE-MsgGUID: 6d8XMUvwT9COxXAvkoi5/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="273032850"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Sep 2026 17:35:07 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9XQW-00000000I1u-1i5N;
	Thu, 24 Sep 2026 00:35:04 +0000
Date: Thu, 24 Sep 2026 08:34:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	LKML <linux-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Matthieu Buffet <matthieu@buffet.re>
Subject: Re: [PATCH] tomoyo: fix socket permission checks
Message-ID: <202609240841.x5ug9vqH-lkp@intel.com>
References: <db497449-b16b-4a61-9f06-fbbe7a3dcc73@I-love.SAKURA.ne.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db497449-b16b-4a61-9f06-fbbe7a3dcc73@I-love.SAKURA.ne.jp>

Hi Tetsuo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v7.3-rc4 next-20260922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tetsuo-Handa/tomoyo-fix-socket-permission-checks/20260923-005744
base:   linus/master
patch link:    https://lore.kernel.org/r/db497449-b16b-4a61-9f06-fbbe7a3dcc73%40I-love.SAKURA.ne.jp
patch subject: [PATCH] tomoyo: fix socket permission checks
config: i386-randconfig-1300-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240841.x5ug9vqH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609240841.x5ug9vqH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609240841.x5ug9vqH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/tomoyo/tomoyo.c:554:22: sparse: sparse: restricted __be16 degrades to integer
   security/tomoyo/tomoyo.c:555:22: sparse: sparse: restricted __be16 degrades to integer

vim +554 security/tomoyo/tomoyo.c

   504	
   505	/**
   506	 * tomoyo_sctp_bind_connect - Check permission for sctp's bind or connext.
   507	 *
   508	 * @sk:      Pointer to "struct sock".
   509	 * @optname: Type of operation.
   510	 * @address: Pointer to "struct sockaddr".
   511	 * @addrlen: Size of @address.
   512	 *
   513	 * Returns 0 on success, negative value otherwise.
   514	 */
   515	static int tomoyo_sctp_bind_connect(struct sock *sk, int optname, struct sockaddr *address,
   516					    int addrlen)
   517	{
   518		int len, err, walk_size = 0;
   519		void *addr_buf;
   520		struct sockaddr *addr;
   521	
   522		/* Process one or more addresses that may be IPv4 or IPv6 */
   523		addr_buf = address;
   524	
   525		while (walk_size < addrlen) {
   526			if (walk_size + sizeof(sa_family_t) > addrlen)
   527				return -EINVAL;
   528	
   529			addr = addr_buf;
   530			switch (addr->sa_family) {
   531			case AF_INET:
   532				len = sizeof(struct sockaddr_in);
   533				break;
   534			case AF_INET6:
   535				len = sizeof(struct sockaddr_in6);
   536				break;
   537			default:
   538				return -EINVAL;
   539			}
   540			if (walk_size + len > addrlen)
   541				return -EINVAL;
   542	
   543			switch (optname) {
   544			/* Bind checks */
   545			case SCTP_PRIMARY_ADDR:
   546			case SCTP_SET_PEER_PRIMARY_ADDR:
   547			case SCTP_SOCKOPT_BINDX_ADD:
   548				err = tomoyo_socket_bind_permission(sk, addr, len);
   549				if (err)
   550					return err;
   551				break;
   552			/* Connect checks */
   553			case SCTP_SOCKOPT_CONNECTX:
 > 554			case SCTP_PARAM_SET_PRIMARY:
   555			case SCTP_PARAM_ADD_IP:
   556			case SCTP_SENDMSG_CONNECT:
   557				err = tomoyo_socket_connect_permission(sk, addr, len);
   558				if (err)
   559					return err;
   560				break;
   561			}
   562	
   563			addr_buf += len;
   564			walk_size += len;
   565		}
   566	
   567		return 0;
   568	}
   569	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
