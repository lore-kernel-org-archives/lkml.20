Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEDC9397694
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790224410; cv=none; b=u4TPXqNNHEYyZACi4+b0QEcqbLRmlqAp37qkKmle1pqWlkSzfYYVUkOYSNY15eNFDExRjdkBz6gqWA6X8a2l//72NYn6dPD1LqXA0LNLxD+N/ZR2lWeVltgWZBi5yytD/GV6zpWL5eJBhdDF/54Z/N3V0nmKQysi5rqZE1eVLPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790224410; c=relaxed/simple;
	bh=OrSXABowRLKXcfGGx5eoS81GIA6P1ugsfb9hzNaC6lg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=q+3H9gs8qOrBk4gC3/AFyITIWUvpbV5ODEKl02fdCoFkY1voFDFN/YZqWeNcVulvFx9hNnoLqP4c/u4lEBWgF2RuM4D5N0pfBn7R2KZTe+Q3u50eS8C+P4R2sC7NgCAIU13pBSXCEARs4ZFF1o+q+OfCZXJWFoi4Wcwl8IQyURM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YySIPBb9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YySIPBb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790224408; x=1821760408;
  h=date:from:to:cc:subject:message-id;
  bh=OrSXABowRLKXcfGGx5eoS81GIA6P1ugsfb9hzNaC6lg=;
  b=YySIPBb9Tjc5xYM0sKpNVBmrG0nKR88ahl5z4DjE9kaZPc3mjNz14Efu
   rdSUeIW1Pb6oZdJfKgujvVO73/Ug5nAl1zJM9ZYLcu3dKp//4CsN3cpvl
   WsVG1B2VYWMuXMAf/3kqygol2ymBKZP5K5hDyEha4+H8eeQ3IEqz0mmpA
   0tK9nYcirS3twhNLXE5m1rftRk210zCZfLbZMdW8cc4II+zTi35BdeU28
   oi37exe47dD/g4Mr10EHBEHoA76Wy6qHNykmbgesj1sKGrmCkqjYWqfS/
   bwH97ghhQW4ECBml6Ir0k6Hy3YbFg+NrM+zgH3YLO4kytSttmA9zjpOUf
   Q==;
X-CSE-ConnectionGUID: DSRce9sJSvKSQx8sN33sTA==
X-CSE-MsgGUID: EFFkbLfOSZaJaiwCzTTWgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91003978"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="91003978"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 21:33:28 -0700
X-CSE-ConnectionGUID: ZqLHcQoJRZGUDAeBK26G6Q==
X-CSE-MsgGUID: 5XRDI0pZTviHi1my+ES0WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5032935"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 23 Sep 2026 21:33:26 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9b99-00000000ID2-1xAm;
	Thu, 24 Sep 2026 04:33:23 +0000
Date: Thu, 24 Sep 2026 12:32:41 +0800
From: kernel test robot <lkp@intel.com>
To: John Johansen <john.johansen@canonical.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: security/apparmor/af_unix.c:764:50: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202609241230.DoBklUpQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe2ec83746e501645709761605c2464a44fd2929
commit: 4483efe4f21510b30c24bc97d9fd0e8feab94125 apparmor: fix shadowing of plabel that prevents cache from being updated
date:   3 months ago
config: sparc-randconfig-r1307-20260924 (https://download.01.org/0day-ci/archive/20260924/202609241230.DoBklUpQ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241230.DoBklUpQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 4483efe4f215 ("apparmor: fix shadowing of plabel that prevents cache from being updated")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241230.DoBklUpQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> security/apparmor/af_unix.c:764:50: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct aa_label *l @@     got struct aa_label [noderef] __rcu *label @@
   security/apparmor/af_unix.c:764:50: sparse:     expected struct aa_label *l
   security/apparmor/af_unix.c:764:50: sparse:     got struct aa_label [noderef] __rcu *label

vim +764 security/apparmor/af_unix.c

   705	
   706	/* This fn is only checked if something has changed in the security
   707	 * boundaries. Otherwise cached info off file is sufficient
   708	 */
   709	int aa_unix_file_perm(const struct cred *subj_cred, struct aa_label *label,
   710			      const char *op, u32 request, struct file *file)
   711	{
   712		struct socket *sock = (struct socket *) file->private_data;
   713		struct sockaddr_un *addr, *peer_addr;
   714		int addrlen, peer_addrlen;
   715		struct aa_label *plabel = NULL;
   716		struct sock *peer_sk = NULL;
   717		u32 sk_req = request & ~NET_PEER_MASK;
   718		struct path path;
   719		bool is_sk_fs;
   720		int error = 0;
   721	
   722		AA_BUG(!label);
   723		AA_BUG(!sock);
   724		AA_BUG(!sock->sk);
   725		AA_BUG(sock->sk->sk_family != PF_UNIX);
   726	
   727		/* investigate only using lock via unix_peer_get()
   728		 * addr only needs the memory barrier, but need to investigate
   729		 * path
   730		 */
   731		unix_state_lock(sock->sk);
   732		peer_sk = unix_peer(sock->sk);
   733		if (peer_sk)
   734			sock_hold(peer_sk);
   735	
   736		is_sk_fs = is_unix_fs(sock->sk);
   737		addr = aa_sunaddr(unix_sk(sock->sk), &addrlen);
   738		path = unix_sk(sock->sk)->path;
   739		unix_state_unlock(sock->sk);
   740	
   741		if (is_sk_fs && peer_sk)
   742			sk_req = request;
   743		if (sk_req) {
   744				error = aa_unix_label_sk_perm(subj_cred, label, op,
   745							      sk_req, sock->sk,
   746							      is_sk_fs ? &path : NULL);
   747		}
   748		if (!peer_sk)
   749			goto out;
   750	
   751		peer_addr = aa_sunaddr(unix_sk(peer_sk), &peer_addrlen);
   752	
   753		struct path peer_path;
   754	
   755		peer_path = unix_sk(peer_sk)->path;
   756		if (!is_sk_fs && is_unix_fs(peer_sk)) {
   757			last_error(error,
   758				   unix_fs_perm(op, request, subj_cred, label,
   759						is_unix_fs(peer_sk) ? &peer_path : NULL));
   760		} else if (!is_sk_fs) {
   761			struct aa_sk_ctx *pctx = aa_sock(peer_sk);
   762	
   763			rcu_read_lock();
 > 764			plabel = aa_get_newest_label(pctx->label);
   765			rcu_read_unlock();
   766			/* no fs check of aa_unix_peer_perm because conditions above
   767			 * ensure they will never be done
   768			 */
   769			last_error(error,
   770				xcheck(unix_peer_perm(subj_cred, label, op,
   771						      MAY_READ | MAY_WRITE, sock->sk,
   772						      is_sk_fs ? &path : NULL,
   773						      peer_addr, peer_addrlen,
   774						      is_unix_fs(peer_sk) ?
   775								&peer_path : NULL,
   776						      plabel),
   777				       unix_peer_perm(file->f_cred, plabel, op,
   778						      MAY_READ | MAY_WRITE, peer_sk,
   779						      is_unix_fs(peer_sk) ?
   780								&peer_path : NULL,
   781						      addr, addrlen,
   782						      is_sk_fs ? &path : NULL,
   783						      label)));
   784			if (!error && !__aa_subj_label_is_cached(plabel, label))
   785				update_peer_ctx(peer_sk, pctx, label);
   786		}
   787		sock_put(peer_sk);
   788	
   789	out:
   790	
   791		/* update peer cache to latest successful perm check */
   792		if (error == 0)
   793			update_sk_ctx(sock->sk, label, plabel);
   794		aa_put_label(plabel);
   795	
   796		return error;
   797	}
   798	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
