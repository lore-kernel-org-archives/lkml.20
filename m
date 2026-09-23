Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C86327A10F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790165728; cv=none; b=hZ60Q2PX1tNN4rkKKlJqOeE88awaF8DfS0P29dLKiaFvKD1kDy62TtfditqbmPMmgfIQgGoTXksoYJJ2ZOI/acR6cE1WazRqevAve6ol68TLk4VbjwYenn8MbxKWZBC7yqgV+urNfORS1qaJc+AYFBFkNys6jYdLRSpi/6e+H7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790165728; c=relaxed/simple;
	bh=ILC8YMwS7rhzyAjRnvJ9OmCm5KF0bepa5aTmTNNVx2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hPczCK9W9KKlmaVsa68DlTPbcIL5epdI3phTkMCOknCeyWa40iOoUbhNBgUCiOpXmQ30yS9l8TeVYwJIASU9aRd5R/7RzQ23waGg+VCbKwzJn6Ls/6c2JaMJylzkTn3OV3icALQmVDbXveTuEOmjuIAZgh+fFS0vjh2c9Ev076k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lXZc8zLc; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lXZc8zLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790165726; x=1821701726;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ILC8YMwS7rhzyAjRnvJ9OmCm5KF0bepa5aTmTNNVx2k=;
  b=lXZc8zLcGTqU3n97z6/1LZCSLZ3DSh0YrKJtl+44WC5DYomUh2RX5++i
   1C9uzMXhX0DmluKDkksX1nYxFSpF3ZaHick2bIKRhzoWHi9hDb7S9hOJg
   3HFUJ2sQNEBQ4F/D6P0eaz1VhLfIHvP7SlB/SCJOYJ0uJi/Rfy6JhtSHe
   NOt8kn3+cqWvTrFp+6ECRAbTwIY+hTkRb56vnCrECmB56mXPn2PR0DxUC
   IpH81Gvp+l3SR6XbLJm0eSF84RLODC7jLMMvetk9DhbiIw7LPL0Z7wRKk
   n5sk5y1JCbYEdg71VFsWgm31WSRSw0p+vKAo+THR5vX+RSszd2rxgJvKR
   Q==;
X-CSE-ConnectionGUID: 2+KUcbZQRkKulx/2hLD7Jw==
X-CSE-MsgGUID: KpUscVlkTGmT17dk26KSfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="101517457"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="101517457"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:15:05 -0700
X-CSE-ConnectionGUID: Z9LlQkOzTj6af26wOOvruA==
X-CSE-MsgGUID: vwaESG/sRDizDO8mNSj1iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="4669750"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.235])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 05:15:03 -0700
Date: Wed, 23 Sep 2026 15:14:59 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: Petr Mladek <pmladek@suse.com>
Cc: David Engraf <david.engraf@sysgo.com>, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: Remove console options before decoding the
 name
Message-ID: <arPCw7eyRYYsveTy@tlindgre-MOBL1>
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
 <20260917060754.37315-3-david.engraf@sysgo.com>
 <arOdv1HHPWzXgW7h@pathway.suse.cz>
 <arOnowDZHimj_86C@tlindgre-MOBL1>
 <arPAwpfKLSv8ZwpY@pathway.suse.cz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arPAwpfKLSv8ZwpY@pathway.suse.cz>

On Wed, Sep 23, 2026 at 02:06:26PM +0200, Petr Mladek wrote:
> On Wed 2026-09-23 13:19:15, Tony Lindgren wrote:
> > Nice, you could now initialize idx = -1 to start with to leave out the
> > else for setting devname idx?
> 
> I would personally prefer to keep the else part because it makes it
> clear how the "devname" variant is handled. But I could live without
> it as well.

OK thanks, that works just fine for me.
