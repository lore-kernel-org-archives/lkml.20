Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793397669;
	b=QHtE54ZsNRAVb19QPnKbKe3VsvXbjc+Eg4sq93PAokm6kQaQsX6yP8PK4v0A7GQY1BFc
	 TtsRaybQpRjzKPtQCSd/dyLKxAfMD8jM4ydMi+RZfcmykaijz6+HrUmccGap1QUkSJIQD
	 U8+4kG0uHVM13gknKD7Ya3pQ7oiDNyEK+eGAwCebCeNSNNqIzzqe0g7PEPeUVbbqAD+hW
	 xyz9nqe+QM/XEJST8vxZyc65ychyUgWU0mvqudsMX+0S+RVmcB5VPD9CqDJoeFW9JUToB
	 gNUJnh5P0teyZ1/lwQpg8chEdY1pqXSvOaUQ7KYYrZi1E6rgQZFOCqNO/HugNxUxgyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793397669;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=octqyFYimOsatIHMz4CJTAXuYhPX39l2GOWexDc6e+U=;
	b=seBGxFZbo33Mq2bqpKu4Y6KuEg4hVDeJ8DuUSZcjhCb5BOw+fKTG/hkVODVMHQzzth1+
	 50IYgl5m1bJzaN3XOGkHfKa0UWZzITh6zQiceWtWV24Oo7iwhvQRUDhUQ3o2T7W0TZUEB
	 zq4AJIR8yIqkn8MFk2QnbTEKMadR3vLUrvg7U+mUzIBoGhKPt2A2BpIrB3TjEeo4NTQT6
	 pGO/2Iw+hieyncu2pacBmlvGLFEwEuQwvntZeqlq5OjO2IORi4dPRxnrhh7h9y9AX+bYh
	 z80Zk59CYZJg/PknA5jYXJZa6diCLTWFQiUn80PYrVMpsEPdcGo/J1KDrqvYXxhoJNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IaLRzUoE;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DC9606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 22:01:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5DC9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IaLRzUoE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793397668; x=1824933668;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uAAszUf04DL6b+ORx9R554o6d9Wb1c7w4v3eBbP/D8A=;
  b=IaLRzUoEhK9N8Y7MUEsmwqKMLKVjILZ3gqtXAK1K45tOY146XClIHS+Y
   5yR6fHgbVixbl7BIw361zZpF2dpfCUnMyFwlbb6xG/g/NqbCvSWds5Zeu
   DcVCcRRh3Yq333ijRi5texG/XR/iWnISkqBh1yKpDxjJ8zL/OrVgC2ogF
   Of1zgwQOLiDPW3RIHcuS3GlvipM047gf7qqlihmHgPkEL/45FCr1YiBTp
   8wKCLpUAIlq+abFJSgY/bS63NhTX8PSmee0w2ovphdCPBwGyVTNMG2ARG
   XOMS9HUFnt0Bgxuvs1Cmjn2IeNkzJspZbsoFTIqWN1QzGdP8jYITeDLgK
   Q==;
X-CSE-ConnectionGUID: qWlMug+4Q8a5Vfg8K9J50w==
X-CSE-MsgGUID: vP5/ksnCT0WzzGtLdaaJNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2203064"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2203064"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 15:01:07 -0700
X-CSE-ConnectionGUID: XbVTQnfaREalV18kkXZuRQ==
X-CSE-MsgGUID: MuuUBk92Q3ChAV3JGaexbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5426383"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Oct 2026 15:01:05 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMuek-00000000cHO-1VkO;
	Fri, 30 Oct 2026 22:01:02 +0000
Date: Sat, 31 Oct 2026 06:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>,
	marek.lindner@mailbox.org, sw@simonwunderlich.de,
	antonio@mandelbit.com, sven@narfation.org
Cc: oe-kbuild-all@lists.linux.dev, davem@davemloft.net,
	b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org,
	syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com,
	=?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>
Subject: Re: [PATCH net] batman-adv: reduce softirq drain in tt_purge loops
Message-ID: <202610310549.bbi0IqHw-lkp@intel.com>
References: <20261030000222.286935-1-omermetekaya0@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261030000222.286935-1-omermetekaya0@gmail.com>

Hi Ömer,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net/main]

url:    https://github.com/intel-lab-lkp/linux/commits/mer-Mete-Kaya/batman-adv-reduce-softirq-drain-in-tt_purge-loops/20261030-025951
base:   net/main
patch link:    https://lore.kernel.org/r/20261030000222.286935-1-omermetekaya0%40gmail.com
patch subject: [PATCH net] batman-adv: reduce softirq drain in tt_purge loops
config: csky-randconfig-1001-20261031 (https://download.01.org/0day-ci/archive/20261031/202610310549.bbi0IqHw-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310549.bbi0IqHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310549.bbi0IqHw-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/batman-adv/translation-table.c:1785 function parameter 'may_sleep' not described in 'batadv_tt_local_purge'
>> Warning: net/batman-adv/translation-table.c:1785 function parameter 'may_sleep' not described in 'batadv_tt_local_purge'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
