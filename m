Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 614B9314D05;
	Tue, 13 Oct 2026 08:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880476; cv=none; b=SQ/wWdu/e3x2jstQg7eXK3rxfxrnso6UUKfx5j122BOtRDSy+ZtZyLWcZIgmZvrd5LEHgBrsAUJPlptmKvhUVRQmuKbETkBVmkI6QAc5bFynTKbK7quJkPfQa2KSfNYPn/mWcVYd6wdhtaouszY5r3MIlXOY7t28pRSacEYm1Xo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880476; c=relaxed/simple;
	bh=4JogXz1kc7540BlLOM0Z3LcSuykNE9wH9iPoBpnnKPU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mu5vm5axvGA6GoCI6sxqsMTH4JQkiZq0nF5XUnjKcP0lKNBGS58zODkvgWalnRkOPgWJbqnGlpdceRmq0Q3fheqRLDcpCAWI7dmDL8pHUWPjophG9nDy2ksfOW+deLN8Vn8r1JY2ZY78khWV9TTmJv/nnhUBXB7NxgU+c+zTyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ljGZTKpi; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ljGZTKpi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791880475; x=1823416475;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=4JogXz1kc7540BlLOM0Z3LcSuykNE9wH9iPoBpnnKPU=;
  b=ljGZTKpirY5cCHptIlIv+FJ0dG4hAyw4S9tQeAQ7v/UKR1ttio0f6XZC
   7Q8oe4ix2VJh9DxtoWuZDo9Wq8AKIoJcAQ12vGv2sEO7gSQ2c0ZrHOAZD
   x7ERSZazgnIOyx1z8AtlVOlWG28XzkV+tZUfhpVcghLiF4wYFmeu7jq0n
   1dRTb6KuW5QQ6T/9zaE3JexlkRYeoetvioCC+oVCuS2ImFejbrxgja7FG
   +vaN6GpFtiPiti701aKY4qvf8lTiP+52pgh8LIoTYpFLTR8k2vqlozpHC
   avRlyXW0DvQUqRE+eYSKOWSnshmJM56p7yrShgUUo1nasfpzCtGx+tNrc
   Q==;
X-CSE-ConnectionGUID: pcLqOXYHTn6omrxFfI0FLw==
X-CSE-MsgGUID: /Hp4w16CRUyXm/85hMnJMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="499002"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="499002"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 01:34:34 -0700
X-CSE-ConnectionGUID: hKFHjx9gRESpaNOS/+rSkw==
X-CSE-MsgGUID: rtpfEUkDQdq13nJ1y3BHTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="1121676"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 01:34:33 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 13 Oct 2026 11:34:29 +0300 (EEST)
To: Mark Brown <broonie@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86 tree
In-Reply-To: <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk>
Message-ID: <8f4e200a-c2fd-29c6-ee4d-a91137b90c12@linux.intel.com>
References: <arUBQuAfW4HJQHik@sirena.org.uk> <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk> <asOdosd0zROmuzu1@sirena.co.uk> <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Oct 2026, Mark Brown wrote:

> On Mon, Oct 05, 2026 at 02:52:50PM +0200, Mark Brown wrote:
> > On Mon, Sep 28, 2026 at 03:37:30PM +0100, Mark Brown wrote:
> > > On Thu, Sep 24, 2026 at 11:53:54AM +0100, Mark Brown wrote:
> > > > Commits
> > > > 
> > > >   4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 support")
> > > >   9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning in fan_curve_get_factory_default()")
> > > > 
> > > > are missing a Signed-off-by from their authors
> > > 
> > > This issue is still present today.
> > 
> > And today.
> 
> And today - should Ilpo be added to the list of contacts for this tree?

Yeah, I'm in practice the person who is handling pdx86 patches these days 
so it would be good.

...Goes to do some massive history rewriting...

-- 
 i.

