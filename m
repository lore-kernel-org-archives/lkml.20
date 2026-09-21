Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D3F3264C2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789967884; cv=none; b=EODYw6/5jSgo498cLgNcBaksLVCMwa6d/IQhgqHe99AFg/8R+6lR3cXG4TFNICX4b68rH23Tb28JnbjgaL78qaanI9gcNg7ml5naVsUMhaqDWHNc0aRltX7fWcr2bJcsGh/lcrg6PUxrvuRXd4SHZcAwOMedGmjIvnT4TLpbpeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789967884; c=relaxed/simple;
	bh=m78wGxsixy6w2K5ih3IZ3O47sknZDoJcbeHNcIOu4Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b122yyMcwOgpd7FWMW6xxOg7yIDktjRKNlz2tjCWVm5SFpM+tnTG8zKdNPbjH+jMeXSyd557WTFtVNR8d0o82qKM6NpdE3iZ7QqMz2TGI4FWEzF511lRtEVqN7uOLX8keBZMH5S+FEsYbtr239ZkC5gCnvW32a5K/KfmB1kDZ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bvmbJL42; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bvmbJL42"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789967882; x=1821503882;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=m78wGxsixy6w2K5ih3IZ3O47sknZDoJcbeHNcIOu4Vk=;
  b=bvmbJL42HisIJ+nN/UiCbz6jjanwa1h1hF3fNDAbRoDEPpikM/lTHM0T
   1OTXnthewE3doq5JwHMVxXqbaBg950U2kS+fr5kcCRX0+zBPNnJ0wMc5Y
   RZQDbUlMbAV964qqr/l8Dn279hLJ7oyE9CRhDaW9uhXe5qPAwFdcnAXDE
   1EQgiltbAgj0eKa4Ho1Vw9aedV9trZbR3hRsqe/n/83u8qtzrSdihoXP8
   s0lR+lgXdhsompr9x8Troavo80sTX6ETMk7H87H9S+HWG9k4bvzJMJWWn
   Wg7BSNyCBF2CYlptlvuUa9PSBJdEgaDT6wJiqrR/uyFbwpEpstWgsZoto
   Q==;
X-CSE-ConnectionGUID: vBxjRmQMQ3u6Y5SX6yqiwg==
X-CSE-MsgGUID: Prl8o6EQRV6QgDxNq7HAVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="965710"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="965710"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 22:18:01 -0700
X-CSE-ConnectionGUID: /DsguA2hSlKJltvEReTedw==
X-CSE-MsgGUID: LMShu49DSvWCvWiGyRoptQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="271963977"
Received: from bradocaj-mobl.ger.corp.intel.com (HELO localhost) ([10.245.246.168])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2026 22:17:59 -0700
Date: Mon, 21 Sep 2026 08:17:52 +0300
From: Tony Lindgren <tony.lindgren@linux.intel.com>
To: David Engraf <david.engraf@sysgo.com>
Cc: pmladek@suse.com, rostedt@goodmis.org, john.ogness@linutronix.de,
	senozhatsky@chromium.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] printk: Remove console options before decoding the
 name
Message-ID: <arC-AESD17-UYVCM@tlindgre-MOBL1>
References: <05107b0b-394d-4023-bbd5-8efef73f5542@sysgo.com>
 <20260917060754.37315-3-david.engraf@sysgo.com>
 <aqvzHtWzLZBFY5wk@tlindgre-MOBL1>
 <05a12842-f121-4ee9-98ff-459a1e1a628e@sysgo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a12842-f121-4ee9-98ff-459a1e1a628e@sysgo.com>

On Fri, Sep 18, 2026 at 09:27:03AM +0300, David Engraf wrote:
> On 17.09.26 17:03 wrote Tony Lindgren:
> > On Thu, Sep 17, 2026 at 09:05:51AM +0300, David Engraf wrote:
> > > This fixes a regression when a console option includes ':'. Commit
> > > 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> > > introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> > > colon. If the colon is part of an option the name is handled as devname
> > > instead of ttyname.
> > 
> > Just curious, which console did you hit this issue with?
> 
> It's a self-developed console driver to access our hypervisor.

OK thanks. From a "fix or feature" point of view, I wonder if this issue
can happen with some of the current Linux console drivers too?
