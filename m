Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792490605;
	b=biH0HYgbHTRCe2bxa1Nw60niiIQ+BGctRydvQAprqa8eUaG5zRfDt4B4ril8hUL1p2gG
	 X6AH9YOctmywDm3scTNi/Ewk9CeXQLdD4DboxdSBRWpw3kDyU1LmqFvR0xf50uyMMS7vN
	 U4Dp6GAUnLFGWmza5RcRZlySY8YUu2liicCB103Ss/WZrX+RcZx4gH0OSCn8ZDRgKDU/H
	 qjv5v+f1hw5cKYx5FDAAR3i3ivcIe5gyQSvHGepdxMUEImNA0AHssu5EXnpFbP2aOhoec
	 Y03XMY800TqbImIXsjTvKP7GB8nOp3AUj8zl/aHeBif/Tl2+r2cqKiGZiSgHPRM7VZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490605;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=0uupRHpCPIAnfVVmmMtZVRVwnEHBLHGwl/qJmmSWTA0=;
	b=WlfC1L93b62EeKhgNQ0FSB4n/wo9o8ZhSK5/lhTNHNSIAgiXHCdclk/NndQW+ZRkz5S5
	 2nHV/l+DAye2KFexTPgSVBRb4Yn6XNBcTRuCRPvtveTcHcAEahYHL7HUQ7IgHOIFTuUJi
	 IQzy6R2jMrphlHOm9ZeNNhqMAbqP+WgTsZR4T4ApGd0jT/kHXeGc0J7cJ3OVppLX2SmhD
	 1ayY9rVAyVGqlc/C/oN4MrCR8wPj6voxJaWsNle2JMSrP6DOUmluyMDZnZSa3cweJBrCr
	 sfl2XEn1NCurGhsUpJBJA5UYqldLoSNEr6ykX8Zwg6Z0jYGJbz9kYGNHDfkbM1F6WwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hpaz8a+C;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FE1606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:03:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8FE1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hpaz8a+C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792490604; x=1824026604;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0uupRHpCPIAnfVVmmMtZVRVwnEHBLHGwl/qJmmSWTA0=;
  b=hpaz8a+CEgfrDaiS1/TPXnR/D2J2Ko0eUg51s9UMiHF7bWMkfZz2QOEc
   /HhzeYl65+F6LNiBW7/PCuNKXkZ3DVKqyq1IQV/G6rJ7BHXtKgA0bVqWb
   GxXE21zJVc4al9l2Y47b19mATd3XP9HaWuowgMUhZtzyiQ911H0WH2Yix
   zz8vc1v6DDvtPDgucAJGsHkMQ2qbBufPe9i0yPlfH8IVKUG8geeOvX130
   YCTuo8cRiAtnDaPqS+DtlzyBfNZI17FNhBYjlyb+UCll9nRyl0Q6n9IiJ
   Z92K/Af4FSMmI7ja+btqR/hYTPskKYX8p1YswU8gviyz1VZ7aaZoj/zc9
   Q==;
X-CSE-ConnectionGUID: B1Muc/FTTyKlxBG7LbmHfA==
X-CSE-MsgGUID: wOoyJz9eRSOECR+38MWhuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1082677"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1082677"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:03:23 -0700
X-CSE-ConnectionGUID: 3l70Pp/sSLu4oxS8pxyXKA==
X-CSE-MsgGUID: Fz6ZIbqwQSO/OvnglPRIwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2890222"
Received: from sdp-s2600wc.sh.intel.com ([10.112.229.16])
  by fmviesa002.fm.intel.com with ESMTP; 20 Oct 2026 03:03:21 -0700
From: Guobin Zhang <guobin.zhang@intel.com>
To: tchiu@tenstorrent.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	guobin.zhang@intel.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: [PATCH] riscv: signal: protect regs->status RMW from concurrent preemption
Date: Tue, 20 Oct 2026 18:03:20 +0800
Message-Id: <20261020100320.2107301-1-guobin.zhang@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <atMjHBJI9LoEve8-@Tao-Chiu's-Mac>
References: <atMjHBJI9LoEve8-@Tao-Chiu's-Mac>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andy,

Thanks for the review and the suggested approach. I'll send a v2 that
disables preemption at the fstate_save()/fstate_restore() level and
adds the fstate_{save,restore}_preempt_off() variants for the scheduler
and kernel_mode_fpu.

Thanks,
Guobin
