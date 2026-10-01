Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE8223EAA6;
	Thu,  1 Oct 2026 06:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837514; cv=none; b=Xmg1AP9st1nx+x40rpsTaJaRR3EBlffiBdSYfBipq/q8iyKRKsaPLHc3C0dGhX+7mngz3gb3tE63ZEMPj1uGiAzNZMzPw/cco3YoRSrCVWI7s75X1ENxBb9XDhv7hvvHNXOTFvVL3D/cj8WqvZrk893QyuGT4QDt7154OXEVuhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837514; c=relaxed/simple;
	bh=4jlcjapDOxvIbbY38pcv3++vEbGgPzl7//TuX7zWk3g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nAyDpwMRRW1PXHtQKLh3osufsFmfOcnDTDi4DYYmrtCN2Jlbno/xB8iAkT3V9KAtbldaVdbycdP/Lc7iXCNzf+/lzlRpc8e1NZOfGXcHNcudl1EHCEYywAt2k0KDN0XH2QXJlIpJ5oTQaAYkfLb5Y/pGKC9MzNX5hRpLFCKuUrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ORPk3AbI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ORPk3AbI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790837512; x=1822373512;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4jlcjapDOxvIbbY38pcv3++vEbGgPzl7//TuX7zWk3g=;
  b=ORPk3AbIIMytC94jviNrzvtzebyhvRLEvRwxdOyQgxpa2uOG+bzgnA4a
   5qxn6gtmO0PFj/Le9Y8sADmb1Ja3hn6177xQVLaNQIfmNnISdpOL+9QmE
   imIPq9FX2bO6TMmL8nReGoKMOzUj45NDrp8xhi9WYuSODF5gv8ISwwsUJ
   POXcCQy8iz64Xxxq+v8uMICQ4wSOgDRE1/oWz+8XL6dmLk44IoQfbSA0h
   1ezLxahFWpDLtljM90lhBAhAgfKOok6lqPDbjQKCqWDJWUnhqV0MJZcM0
   3Z5cYFlGftp65Y8WeEb7EoBaBomLjBq6ApaRe/DUeA5MpxjPQXTA4prev
   A==;
X-CSE-ConnectionGUID: EIhMQvmETcirbxZ227edQQ==
X-CSE-MsgGUID: o5FJ5u8IQoesHb6tpZ8qVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="117115987"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="117115987"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:51:52 -0700
X-CSE-ConnectionGUID: JyyaM/RBTeKfatLVb1LzSA==
X-CSE-MsgGUID: 8VfPLW2qRje+T1jINlcVNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275951739"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.7])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2026 23:51:49 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8E0B9121B95;
	Thu, 01 Oct 2026 09:51:46 +0300 (EEST)
Date: Thu, 1 Oct 2026 09:51:46 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Tarang Raval <tarang.raval@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"jai.luthra" <jai.luthra@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Philippe Baetens <philippebaetens@gmail.com>
Subject: Re: [PATCH v5 2/2] media: i2c: mira016: Add driver for Mira016
Message-ID: <ar4DAkCABRYLHWth@kekkonen.localdomain>
References: <20260930-mira016-v5-0-499a34ab8204@ideasonboard.com>
 <20260930-mira016-v5-2-499a34ab8204@ideasonboard.com>
 <PN3P287MB1829832B0C6C42441B18D9D18B8B2@PN3P287MB1829.INDP287.PROD.OUTLOOK.COM>
 <ar03QZc3wVMKy8F8@zed>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar03QZc3wVMKy8F8@zed>

Hi Jacopo,

On Wed, Sep 30, 2026 at 06:34:12PM +0200, Jacopo Mondi wrote:
> > Like for the above array 0xe000 register.
> 
> 0xe000 is repeated multiple times because it's the register that
> selects which bank to write to (there are 2 registers banks on this
> sensor)

If you have pages, you should use regmap's page support. See e.g.
<URL:https://lore.kernel.org/linux-media/20261001061250.37734-1-sakari.ailus@linux.intel.com/T/#u>.

There are probably other such examples, too.

-- 
Regards,

Sakari Ailus
