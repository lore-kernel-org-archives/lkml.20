Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792494430;
	b=GBvnF+ZcxdJVrHaV8ucO8gmBjV9CmHXnn/1xSsE9BHwzCKweg/cGmJLiOXK1yVJ9u1N0
	 sDZsUmrc/vnZKJ54YZPROk4ck5VzYuvLSobS9z66dgGnuE9VwK88NQ8/AuapqpM+qRc8N
	 ZfP61+DMWtkFN6qk6aYjhNpeg0yATs/G6AIWhKkEP9g4J/OKUxNU3j43l8UqF4mPHS/6k
	 WNpjXFbFZtYQHt5KNZPgnX1iAA/3gdZzc9XjP0weoMMup8PXaon7FB7EoeNOD+y+6RXm3
	 i635oVpYQ3FTxa8pNNX4fYdk+AFgj7eETcifI6TxtguiouauTBsULM4lOJUwS8fpFwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792494430;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:Date:To:cc:
	 Subject:In-Reply-To:Message-ID:References:MIME-Version:Content-Type;
	bh=+nnri8KOVD+ERhkDe4Xd/rLUN/DpKeYj7ODaxNj7yac=;
	b=vY2bzHydKYZzGX0fzIND0hYHOIcz4D7m7LRWy+CPJS5QHpzgTEXoMptiSYhZH40Zk++G
	 slzK00FtPLs8N2HubX4baDWJZNIWKKEJLbH8f6spZqwnSuEqf9Qx/7Z7tWmZmlinzidFG
	 eAuFWgtjXmlTCqM6bJzp1lWHBP7IN//NCezgiCY/fnUr1yv9/t4wFJEI7kImyEKh2NEpo
	 liMBGQnSHD/ghWWMZybwiDPCFhdrWttjzrSi7nHGJPbso5oMY9njotwS2HDfvI3Wd/B4R
	 hKRHDtUDXs0S+Obe155ANTF4dGwuTEmz6iT1hjmElVdyZd3gN3rhSYgYJ6uqtdRhC8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1r4qRiE;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DBC2606A319;
	Tue, 20 Oct 2026 11:07:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DBC2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D1r4qRiE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792494430; x=1824030430;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=AybVLInNist+fsVCvf7sGNK1znFzY0/gag7DVWJXQ7c=;
  b=D1r4qRiEW8Tqnpir9+hwyJQKCLZUCyyNKXKvWix0kLaPlMsyoxkB5c3D
   Or6Dsv3NQI2fawJg1sVWsa2IQfLcH9MWOCAZjsDOCFCqNfHdb+okbJOCg
   Qj13+bQySsXuIUe+Fuf0vy6c/7UMlCDF8tZGVe8/GX2jvpbGP98QQ4QxT
   UX+RukdvUxW9WDrY77PriMAP1XEq48v45aPY2qadtFGZix0p8sKPl3yE0
   e6rxkazkbhU1P/+HUO5sCB1tR3XuUjd6RKpQ8EToheP5P4r93inJ+egaJ
   P6c1p2pLQamMjELAKN9vPA6tHIAFwL+npMYTpycr+9RKjKdqhTmPZ7EoF
   g==;
X-CSE-ConnectionGUID: bBEkQYDwSaKfgKzdyglX3g==
X-CSE-MsgGUID: ZBuv4EsHQny0n0ZyfX4c5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1096879"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1096879"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:07:10 -0700
X-CSE-ConnectionGUID: d7bIo4nzTcyCp6bZxT3EtA==
X-CSE-MsgGUID: wtFbA/3LTjSOY8miVsOiIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2744933"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.181])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 04:07:07 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 Oct 2026 14:07:02 +0300 (EEST)
To: Mark Brown <broonie@kernel.org>
cc: Hans de Goede <hansg@kernel.org>, Mark Gross <markgross@kernel.org>, 
    LKML <linux-kernel@vger.kernel.org>, linux-next@vger.kernel.org
Subject: Re: Missing signoff in the drivers-x86 tree
In-Reply-To: <atZqoXnT_27rGAn9@sirena.co.uk>
Message-ID: <e1119f07-83cc-8178-3c6a-e87778d3cb16@linux.intel.com>
References: <arUBQuAfW4HJQHik@sirena.org.uk> <4ad00775-b067-452b-9869-29d5b6712f66@sirena.org.uk> <asOdosd0zROmuzu1@sirena.co.uk> <1a363159-02b9-4644-9cc8-38e210d97d5d@sirena.org.uk> <atZqoXnT_27rGAn9@sirena.co.uk>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Oct 2026, Mark Brown wrote:

> On Mon, Oct 12, 2026 at 08:03:17PM +0100, Mark Brown wrote:
> > On Mon, Oct 05, 2026 at 02:52:50PM +0200, Mark Brown wrote:
> > > On Mon, Sep 28, 2026 at 03:37:30PM +0100, Mark Brown wrote:
> > > > On Thu, Sep 24, 2026 at 11:53:54AM +0100, Mark Brown wrote:
> > > > > Commits
> > > > > 
> > > > >   4dabecbb202e8 ("platform/x86: hp-wmi: add Omen Transcend 14 8C58 support")
> > > > >   9af7fddef448d ("platform/x86: asus-wmi: suppress -ENODEV warning in fan_curve_get_factory_default()")
> > > > > 
> > > > > are missing a Signed-off-by from their authors
> > > > 
> > > > This issue is still present today.
> > > 
> > > And today.
> > 
> > And today - should Ilpo be added to the list of contacts for this tree?
> 
> And today.

Hi Mark,

Something odd is likely going on here. Neither of those commits above are 
in my tree anymore.

Your latest merge:

commit 233956951080612ff68d0c54f620606c53a1c91c
Merge: 67f116b3a9f8 98f039265e58
Author:     Mark Brown <broonie@kernel.org>
AuthorDate: Mon Oct 19 17:58:11 2026 +0100
Commit:     Mark Brown <broonie@kernel.org>
CommitDate: Mon Oct 19 17:58:11 2026 +0100
 
    Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git

I don't know how you got that 98f039265e58 but that hasn't been in pdx86 
tree for multiple days by now:

https://git.kernel.org/pub/scm/infra/transparency-logs/gitolite/git/1.git/commit/?id=1bd7f5b78426fd94a4a3f75c79835a4416809e87


$ git log ea40f1e9f07aab937b9a217633be7a1f66260394 | grep -e 4dabecbb202e8 -e 9af7fddef448d


-- 
 i.

