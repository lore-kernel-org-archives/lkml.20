Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793067294;
	b=hOUslbhBeyceUt/GtZWwwPO9Tp0Txa0fQZFlNr0oLjxtdVGD/T+BIXjXGFnDY8/qOdUd
	 ZIUF5IZtiA/i+TvyNiTRTHD8wzKoS8DhJRr9+bS018TubQtiR+cF0FIjPs9cp1Z3ixEsu
	 SyCAh0gnf/3QDxxQE8kq+DpXzS1TL0XZK+br1Kfk5ciuMF+vv89IvFolC92eS9XBqOBTV
	 16LLXJluCYD5hwZ0SHjLzK2TqEQvXKz34LG2NEBFLkd64B5GwsvGLe5ozBpnHcb0EYFms
	 BLN7MfL4QoJp1JtKYnhw5Qs3YtCq8nCOk0TQLUnBOArEtGFdn3QhirPZEO7oCqZI0pw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793067294;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ROfiEfk295+SItu3RnjH0m+IhVQ1UPEgGDJHSeo7Yss=;
	b=B1frahjf7rKhd9HqZmUMGLAFdz7Rvsu2FUck7YFLlxQX4OsjfZpasSodML8a0XXbzB/X
	 P3pX/R79hBAwXZA1/LkuiBTxGCxpeFEF1a6Idx7fwje3EuaqRPDFAIXqxKJeD0/fQ1lJv
	 VcsSMPUcPhH7tgr1KFQueqbIEX6ukBAgAZ+I00xXD6BfFoAQ13OKNCJUXHA+iWy+DUeoE
	 oVgEPap3hZ3oBtFZnK00HmH0AFIyrIX6iHV6n+LxTVODZKWKY70dPsg+cxlQqBxUGSspz
	 gGMqh95HH715PpEE+bjCZsNJn9sNou9eTT3JEd/jLNEBhfG2EBrk3XOC11kyztVal3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EpyG1g7z;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDF7606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CDF7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EpyG1g7z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793067293; x=1824603293;
  h=date:from:to:cc:subject:message-id:mime-version:
   in-reply-to;
  bh=5lA/7pKtWck7vCkOArCrpRySsoQA1+UgX9wXJWD4Lx4=;
  b=EpyG1g7ztj1JmYpZNTASU/kTboryMQ98gF+Z5hclvEinvzxywW/rGlDj
   3v3fF/fMhdyo4XjWIqWmCENOl4SS5LsjfPoBLGDcLAV5ZLznsWN/ics1w
   yb40YAIT/Q9Ehpf4QsL63B0vVpFEElhL4TQ7diunH5/SNebWF+P0j4Dl2
   ukP/Dm8ngvOOIM+ETGvW4K/fjy+SMLLOnIOTeMCMkW7WBGWheGJfvARmF
   R+12ur2pzoLo5i+e8XXw/9YDlAJyzdWsmdpzmCO/bysTF0qt6WjYUBsrI
   Jyrh2mSSN+lluDMlC7JXzmNDXwSq3rzmYlV4G0jjxRd0Y3J+VAh6kvb87
   A==;
X-CSE-ConnectionGUID: 1Z2pSekYQ4+N6MaN3kKnCQ==
X-CSE-MsgGUID: OKY/vCmiRZWeIN6rJDSCRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1766394"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1766394"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:14:52 -0700
X-CSE-ConnectionGUID: BBkXL+RGRbmu52r90EePmw==
X-CSE-MsgGUID: 2uWGC/EqS3CQ29R2mdsaXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="4370330"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 19:14:50 -0700
Date: Tue, 27 Oct 2026 10:14:46 +0800
From: kernel test robot <yi1.lai@intel.com>
To: Haoran Wang <haoranwangsec@gmail.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com,
	linux-f2fs-devel@lists.sourceforge.net, ltp@lists.linux.it,
	jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org,
	haoranwangsec@gmail.com, yi1.lai@intel.com
Subject: Re: [PATCH] f2fs: verify inode data-block ownership at mount
Message-ID: <202610262143.a92547a9-lkp@intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ad2359d.0083e9c2.97e0f.79de@mx.google.com>


Hello,

kernel test robot noticed "last_state.incomplete/bootup failure" on:

commit: 612a9db3132785844663564c15691d5feac8a259 ("[PATCH] f2fs: verify inode data-block ownership at mount")
url: https://github.com/intel-lab-lkp/linux/commits/Haoran-Wang/f2fs-verify-inode-data-block-ownership-at-mount/20261016-223258
base: v7.3-rc7
patch link: https://lore.kernel.org/all/6ad2359d.0083e9c2.97e0f.79de@mx.google.com/
patch subject: [PATCH] f2fs: verify inode data-block ownership at mount

in testcase: ltp
version: ltp-x86_64-af1ad307f-1_20261024 with following parameters:

	disk: 1HDD
	fs: f2fs
	test: ltp-aiodio.part2-02


config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)

[  +3.766884] [    T594] mount: /fs/sda1: fsconfig() failed: Structure needs cleaning.


If you fix the issue in a separate patch/commit (i.e. not just a new version of the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yi1.lai@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202610262143.a92547a9-lkp@intel.com


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20261026/202610262143.a92547a9-lkp@intel.com


--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki


