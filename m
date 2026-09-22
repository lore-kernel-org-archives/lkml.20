Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D793F2566F7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 15:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091982; cv=none; b=BiXyNI5gEnhIa8MZtsg4OmfNhZcH2JE9Hej3cNOH+b4T5ThdcLU1BvIPNDoxkEe+Uu0lA9fpT4K45rjHLLNEEEl6ajfm+B9BGtcqor0mjXI63PrzgOWWDgdhYBQF9DUFXXZzfbCbdvlrRvTL+K1XR5lj76rDaFUewJxsx02n2zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091982; c=relaxed/simple;
	bh=SeflP6g7z/vtCJOJe8rk4i+2DceeIgkJY8hpEBaZtUM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bV10h4CXWFk0ZR2PacdA1BTXPzFWrLxzaekzuUxIabud3dihQam5iVyFWyjARo6MmAgWEkauyk2Rwx/0QPpdm1zzcRz8dT5Ex2tWHPgm1kgIKf28A43sPykjuWoK3QBshVP0liWYdMZCwRn17Vv9mD8R8SGYzHeaFmVlVwM2uXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iIR2Ocfa; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iIR2Ocfa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790091977; x=1821627977;
  h=date:from:to:cc:subject:message-id;
  bh=SeflP6g7z/vtCJOJe8rk4i+2DceeIgkJY8hpEBaZtUM=;
  b=iIR2OcfaQpZbv1DNGr4E6N1UDRnqP195xInwz4wNBEuVrHCgeNUHcnqQ
   LwI8pI8WvRGogoxRefMxU6mXOcP/ElxDw+TnmJeP3dmzUS/SQqbejbnYD
   fyNf6xzo5yZbrdW2nAQEEGXAsyEUNF2zBC5CcRMigmKyINsup6YdO7Zov
   QECeO9YGcfF+YDOF/8z9r5rVavjJeb/hr3dXLvBNGC3RCh49B98+foHO0
   KZzXM9b/K6VwN4dBoci+wJasqS/ws+zHbQ7khOG5QkfsL0cTUOxQ7Yqyt
   E+Iq6XKGR1cyaXvCGI8ukUKdOYF8JnScgrm3BrTKEoC4srEw+KamGOCXg
   A==;
X-CSE-ConnectionGUID: XmB38N9jSSGYUKobAgEHzA==
X-CSE-MsgGUID: f7jMSxkCR4eMjcFNiYXkNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1208552"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="1208552"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 08:46:13 -0700
X-CSE-ConnectionGUID: jf3KktMBTPa2CgJQKxCkQw==
X-CSE-MsgGUID: vhiK2a4pRT+yVsfu8aWpdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="277950569"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2026 08:46:11 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x92h7-00000000Ff2-0m3e;
	Tue, 22 Sep 2026 15:46:09 +0000
Date: Tue, 22 Sep 2026 23:45:45 +0800
From: kernel test robot <lkp@intel.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: net/netfilter/nf_conntrack_proto.c:181:35: sparse: sparse:
 incorrect type in assignment (different modifiers)
Message-ID: <202609222347.fomKeXBU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
commit: ac46f3f35b6e68fb062ae7cf780d516c0cf4c00a netfilter: nf_conntrack_helper: add refcounting from datapath
date:   4 months ago
config: um-randconfig-r1307-20260922 (https://download.01.org/0day-ci/archive/20260922/202609222347.fomKeXBU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260922/202609222347.fomKeXBU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ac46f3f35b6e ("netfilter: nf_conntrack_helper: add refcounting from datapath")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609222347.fomKeXBU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/nf_conntrack_proto.c:181:35: sparse: sparse: incorrect type in assignment (different modifiers) @@     expected int ( *helper_cb )( ... ) @@     got int ( [noderef] * )( ... ) @@
   net/netfilter/nf_conntrack_proto.c:181:35: sparse:     expected int ( *helper_cb )( ... )
   net/netfilter/nf_conntrack_proto.c:181:35: sparse:     got int ( [noderef] * )( ... )

vim +181 net/netfilter/nf_conntrack_proto.c

   127	
   128	unsigned int nf_confirm(void *priv,
   129				struct sk_buff *skb,
   130				const struct nf_hook_state *state)
   131	{
   132		int (*helper_cb)(struct sk_buff *skb, unsigned int protoff,
   133				 struct nf_conn *ct,
   134				 enum ip_conntrack_info conntrackinfo);
   135		const struct nf_conn_help *help;
   136		enum ip_conntrack_info ctinfo;
   137		unsigned int protoff;
   138		struct nf_conn *ct;
   139		bool seqadj_needed;
   140		__be16 frag_off;
   141		int start;
   142		u8 pnum;
   143	
   144		ct = nf_ct_get(skb, &ctinfo);
   145		if (!ct || in_vrf_postrouting(state))
   146			return NF_ACCEPT;
   147	
   148		help = nfct_help(ct);
   149	
   150		seqadj_needed = test_bit(IPS_SEQ_ADJUST_BIT, &ct->status) && !nf_is_loopback_packet(skb);
   151		if (!help && !seqadj_needed)
   152			return nf_conntrack_confirm(skb);
   153	
   154		/* helper->help() do not expect ICMP packets */
   155		if (ctinfo == IP_CT_RELATED_REPLY)
   156			return nf_conntrack_confirm(skb);
   157	
   158		switch (nf_ct_l3num(ct)) {
   159		case NFPROTO_IPV4:
   160			protoff = skb_network_offset(skb) + ip_hdrlen(skb);
   161			break;
   162		case NFPROTO_IPV6:
   163			pnum = ipv6_hdr(skb)->nexthdr;
   164			start = ipv6_skip_exthdr(skb, sizeof(struct ipv6hdr), &pnum, &frag_off);
   165			if (start < 0 || (frag_off & htons(~0x7)) != 0)
   166				return nf_conntrack_confirm(skb);
   167	
   168			protoff = start;
   169			break;
   170		default:
   171			return nf_conntrack_confirm(skb);
   172		}
   173	
   174		if (help) {
   175			const struct nf_conntrack_helper *helper;
   176			int ret;
   177	
   178			/* rcu_read_lock()ed by nf_hook */
   179			helper = rcu_dereference(help->helper);
   180			if (helper) {
 > 181				helper_cb = rcu_dereference(helper->help);
   182				if (helper_cb) {
   183					ret = helper_cb(skb, protoff,
   184							ct, ctinfo);
   185					if (ret != NF_ACCEPT)
   186						return ret;
   187				}
   188			}
   189		}
   190	
   191		if (seqadj_needed &&
   192		    !nf_ct_seq_adjust(skb, ct, ctinfo, protoff)) {
   193			NF_CT_STAT_INC_ATOMIC(nf_ct_net(ct), drop);
   194			return NF_DROP;
   195		}
   196	
   197		/* We've seen it coming out the other side: confirm it */
   198		return nf_conntrack_confirm(skb);
   199	}
   200	EXPORT_SYMBOL_GPL(nf_confirm);
   201	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
