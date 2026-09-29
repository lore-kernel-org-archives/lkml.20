Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9B43D8116;
	Tue, 29 Sep 2026 16:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790698037; cv=none; b=IcWcjNR02gFExp9a1vKxq5xTH9DOeJqtFaSSq3/fL2rt0oFs0grgVeHInTYNAXhkPTj+zwJTOhcXEWWjVdCt2YWOsKBVJm/udgA9aBg86s93A41JF0UMD8wls+LKtnCG7RVv8pZ3m6jgXd/PIwPaH+4Q5nBJilF1ejdnSGh2cIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790698037; c=relaxed/simple;
	bh=dIF0+y7mAXkyfweuZLejR6xxvcj3m54PVHgFliAxWoA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HMt3dKd4uOU85cXQQhbGetrl/QaXKCgz0iqFcO+SSSdGUplyq2eT3xhwlTZr3tAc2j7R0h8BDOV7hqhgSq1aSMHJfFCJNPLceLGasdtpiV3NwX4Euqe6vucSYcCO5dxkfSziBwtu5MBjjSNGvKNXH11XtbQcb0pJhPVPYIOz0Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXkOxPBM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXkOxPBM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E7B1F000FF;
	Tue, 29 Sep 2026 16:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790698033;
	bh=xMWCFx92XcGWuRxVKhe2OhcdQAJ/RLsggdEsiRvqW60=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=RXkOxPBM4rP1wQgmAWIGQgPWvglfxa924yhj5x0/KiY8JGJheb5KtcySVXUfYYpUz
	 P2ftb7biPz+xBx70YlgVK/L2V+v6mOGcQqCXHLxp3wnqIJgug9h81C13FAOYJ4M8al
	 XzIDyZzrVxL/jc2B7VhLZsE78UolDsnWs2uju7JTK7YQRdi8OXYpli4OaaP0ebW8xh
	 MgMC4nEDOlNF4mXrm9+Jy9mKgcnDmj3iCYMXb2Z6xusPPDFimGzepCVbXzbtSqZvsH
	 H2+e73m3T7cNvcd/bcGrfiryKIeVExWdQeYl7FO2zToxEnY572l1veT0RWnXMAzMqC
	 ZoblZ00Na1ZiA==
Date: Tue, 29 Sep 2026 11:07:12 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Logan Odell <loganodell@google.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure in the final build
Message-ID: <20260929160712.GA2327182@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c7088c6-28dd-4e5b-bcb0-0d951183b884@sirena.org.uk>

On Mon, Sep 28, 2026 at 03:13:13PM +0100, Mark Brown wrote:
> On Fri, Sep 25, 2026 at 05:09:53PM +0100, Mark Brown wrote:
> > Hi all,
> > 
> > In the final build today's linux-next build (i386 defconfig) failed like
> > this:
> > 
> > /tmp/next/build/drivers/pci/probe.c: In function 'pci_class':
> > /tmp/next/build/drivers/pci/probe.c:1902:12: error: unused variable 'rev' [-Werror=unused-variable]
> >  1902 |         u8 rev;
> >       |            ^~~
> > 
> > Caused by commit
> > 
> >    8a2a9fa37b814 (PCI/IOV: Read VF config values that need not match PF)
> > 
> > I have reverted that commit for today.
> 
> This issue is still present today.

Sorry, it should be fixed in the current pci/next
(81bebadfa0f7 ("Merge branch 'pci/misc'"))
