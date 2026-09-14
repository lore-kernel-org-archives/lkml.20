Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04ABC3115AC;
	Mon, 14 Sep 2026 08:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789375929; cv=none; b=n30L4VHls1DgiAupUjJ1QQ7JHiFNF6V9g9/W7CDc/OaKpAj+/l7yfJp4jFccpKfScUrJkh7AxzPzVvAro+vNI27iO/1Q2IxgZh5OucL2P2/X0UABt6hFASI87ZVHaM+wQV42MMp5rxBREoCcagTK+mNP0IMVmtNAKV7ZaqAN73s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789375929; c=relaxed/simple;
	bh=jzqEDZaTUIyRsbYzvWrdlv16UybcqOcTHPZz8hdyo2M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F1ZxajJs/SrSv3xuWnTtTyUN8i2FZxo2pAdT1VX4ptDtISkVL7Zoc5gWRcIasn1k4/LxlEesHCioP+QN4uqwfbP2ba+SOlAkHE8cgONeme36i4owAl74LpMkOKHSc02T8e2xY0JYH+XCTm3chvmIExEhO6XuoJItL40QU6wd+XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZaCFZ4my; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZaCFZ4my"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789375922; x=1820911922;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jzqEDZaTUIyRsbYzvWrdlv16UybcqOcTHPZz8hdyo2M=;
  b=ZaCFZ4my74Lis1pbDImXr4b3kq2UKdXnuffc6mylG+PpZV2nbxpmpGLv
   wJxxCVR6cc816LBz2MDEVEinv/NIohgP3YzZAjczE1pAWtvY5AtcnLBn1
   2OXIL5OU9+/rMrbuDcrZAu54A97mBzO/bdf9vpwYlrE17WqPgRAFDk3zc
   OsAScIcxdGg1DVvqd53QASP3POlZghLygKWdCtJu4xDE9a3IErUnFbXAo
   3SVywWsYn+e+bC5BqPy64z+yPICKumP5rRbmW1R8QOh5+nk8TkdJBTS/9
   wzoOBYN10oQmsq7PbUJRZZcnp76qqbN1oCvaVl2X6UvysuQR8LtNj1lvJ
   g==;
X-CSE-ConnectionGUID: GNwxMruTRL+8EFGRRVjf/A==
X-CSE-MsgGUID: nAVTzPh+QVCHQwBmT5jZvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="89932981"
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="89932981"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 01:51:59 -0700
X-CSE-ConnectionGUID: CskLL6m8RuiafZqVYg0a6g==
X-CSE-MsgGUID: T4rCyc4eRI6hknMmkSY3Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,102,1787036400"; 
   d="scan'208";a="818193"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa012.fm.intel.com with ESMTP; 14 Sep 2026 01:51:57 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 06D6D99; Mon, 14 Sep 2026 10:51:56 +0200 (CEST)
Date: Mon, 14 Sep 2026 10:51:56 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Daehyeon Ko <4ncienth@gmail.com>
Cc: Mika Westerberg <westeri@kernel.org>,
	Andreas Noever <andreas.noever@gmail.com>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Reject oversized XDomain properties
 responses
Message-ID: <20260914085156.GB106095@black.igk.intel.com>
References: <20260909010737.1883610-1-4ncienth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909010737.1883610-1-4ncienth@gmail.com>

Hi,

On Wed, Sep 09, 2026 at 10:07:37AM +0900, Daehyeon Ko wrote:
> tb_xdp_properties_request() allocates room for 45 data dwords in its
> 252-byte response buffer.  The XDomain length field is six bits wide,
> however, and a malicious peer can set it to 63.  After the fixed response
> fields are subtracted, the driver treats this as 48 data dwords.
> 
> Commit 322e93448d90 ("thunderbolt: Clamp XDomain response data copy to
> allocation size") only bounds the copy against data_len.  If data_len is
> at least 48, memcpy() reads 192 bytes from the 180-byte res->data array,
> causing a 12-byte heap out-of-bounds read.  Commit 4db2bd2ed478
> ("thunderbolt: Limit XDomain response copy to actual frame size") limits
> the earlier copy but does not constrain this header-derived length.
> 
> Reject response data lengths that exceed the allocated source buffer
> before copying them into the assembled property block.
> 
> Fixes: d1ff70241a27 ("thunderbolt: Add support for XDomain discovery protocol")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>

Applied to thunderbolt.git/fixes, thanks!

BTW, there is similar for res->data_length == 0 below, maybe you can look
at that too?
