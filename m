Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608993DE440;
	Mon, 31 Aug 2026 09:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168378; cv=none; b=H66l8cIvmVcA9eFBithEEDrnDETmhf7+br55VGBPvCG48NoIlgzTDoYWNyZnXS+UDo9CQrNYN3CjYddw4PWiEDGtFZpqbSAYO8HFM43GxyV0ZFFP/AXqO/JMmuJoD1m0eIYR3EqHl8ew3CsmgiJLFuDYVX19P+L6aXFh7//r3JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168378; c=relaxed/simple;
	bh=CQqiK8C/TPmS2k88DGgJVVdHewzuL7tpYUnfdIojjUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z7PLGoYc//HnYuMXExRlzPWsOa0ZBXgXqs8wZkEpwDTS/xEygkRLgPBYk++s3ncMRL2r/2aKGYJsrEBOQA+HA7CLnaIJ3zLdvf0AGW6qgJVHhj1WxzmT3I4TlOEK2xcbUE/WWm1UzbG8QRaUU9ddfz9K5O11Y58zfh1B63KiX3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VtkUD/bt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VtkUD/bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788168376; x=1819704376;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CQqiK8C/TPmS2k88DGgJVVdHewzuL7tpYUnfdIojjUI=;
  b=VtkUD/bty43WKSpZUN+F2tFy/vQSHG7cv5SowxdqlNXIbqtYe3T9T/Im
   X/0Flny55xCJRsB7g22deZsETpePCLV+7CUgha6XF6cvUMu85Jrf0v8O0
   xxWKi4VVDZhNzpZOgh31D/cWOe3UtSKY6qnnisT26LHjuXGAMc9PpRLna
   3QMM2XX+WIYiy4znEUPr7QvP2fafSuySMV2us3I14ueLivNBspJTluTjG
   FtKZyKbHLyT71hSHE6UdBhPn+sW5295UN/XhqijQp1R7aUdllvYhe28LQ
   9zIi08ETXATjElvzP+xXKluZuyVDm7gbfXKE+Tl9Z/ZCYQMwuVbcwa/K3
   Q==;
X-CSE-ConnectionGUID: KdhHure2RrO1O1N2hbJp5w==
X-CSE-MsgGUID: J7YSoALpSNadjM8o9FZTJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="92257547"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="92257547"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2026 02:26:16 -0700
X-CSE-ConnectionGUID: 8WNqRrXfQZeceHggR1Cq/Q==
X-CSE-MsgGUID: 4DW6iyahRVqIiwQh0MK5Pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="262620361"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa009.fm.intel.com with ESMTP; 31 Aug 2026 02:26:14 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 209A799; Mon, 31 Aug 2026 11:26:13 +0200 (CEST)
Date: Mon, 31 Aug 2026 11:26:13 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] thunderbolt: validate DROM entry extents
Message-ID: <20260831092613.GE124825@black.igk.intel.com>
References: <20260813152206.28059-1-pengpeng@iscas.ac.cn>
 <20260831065258.GC124825@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831065258.GC124825@black.igk.intel.com>

Hi,

On Mon, Aug 31, 2026 at 08:52:58AM +0200, Mika Westerberg wrote:
> Hi,
> 
> On Thu, Aug 13, 2026 at 11:22:06PM +0800, Pengpeng Hou wrote:
> > The generic DROM walker can read a two-byte entry header from a one-byte
> > tail and accepts an entry whose declared length is shorter than that
> > header.  Separately, the USB4 product descriptor parser reads a complete
> > struct tb_drom_entry_desc without requiring that structure to be present.
> > 
> > Split those contracts into two patches.  The descriptor check now uses
> > sizeof(*desc), as requested by Mika Westerberg, instead of spelling out
> > the fields manually.
> > 
> > Changes since v2:
> > https://lore.kernel.org/all/20260731141700.3-thunderbolt-v2-pengpeng@iscas.ac.cn/
> > - split the generic entry and USB4 descriptor checks
> > - validate the USB4 entry with sizeof(*desc)
> > - rebase and re-review against the current tree
> > 
> > The series was reviewed statically. I did not test it with malformed
> > device DROM data.
> > 
> > Pengpeng Hou (2):
> >   thunderbolt: require complete DROM entry headers
> >   thunderbolt: validate USB4 product descriptor entry size
> 
> I dropped the Fixes tag, I think these are more like improvements. In
> addition I changed the first patch to use const where possible. Please
> check that it makes sense for you.
> 
> Both applied to thunderbolt.git/next, thanks!

Now I actualy tested this and this:

  thunderbolt: validate USB4 product descriptor entry size

fails now on my test system, I think because the structure is actually
larger due to alignment and so. Dropped this patch now. If you want to
revisit then I think the correct check is against what the spec says for
this entry (e.g it must be 15).
