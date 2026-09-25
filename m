Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC1C63BADBD
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 06:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790319440; cv=none; b=VR6uEkSs2d8Hcp7eE7STNREUZqySrOQMfs6Vv2gzTX7M8seV2YCV9JPVwf3FciIcqXuMuxJzmrjdBM3TgTe5GB9Kmbbk1lExwd/3JWsSV3tfnibid21YhFHX45LANukSfh7xfz07EvqTMXrEfqqDjoj7IrWBVZCbsmXTbCxISSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790319440; c=relaxed/simple;
	bh=u8SUmcFVH1QfhvtajZ4mJgoh3l1E0lhGn639ZcJf9+I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i765DsWClJM5k5FBGzXv6nsPINo1lSjqw7QfbpSSlbFeIk2v1hT6LkYkoUPlih48Achjk75/z62uUi3hhbV+oAU/mE7Bv2FRgyGDNEML3iacPGSVr09M1SXM6oF7NvOJ6nIOPP2VzKER/OJPpWEL3847onkOFxq47HHjHPm5Fwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id 963CB68BFE; Fri, 25 Sep 2026 08:57:14 +0200 (CEST)
Date: Fri, 25 Sep 2026 08:57:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Maurizio Lombardi <mlombard@arkamax.eu>
Cc: "Ing. Alfonso Kuen Arroyo" <gerencia@idkmanager.com>, hch@lst.de,
	sagi@grimberg.me, kch@nvidia.com, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] nvmet-tcp: fix stale comment on NVMET_TCP_MAXH2CDATA
Message-ID: <20260925065714.GA4457@lst.de>
References: <179013720383.9364.11263428288753603011@idkmanager.com> <DLMIXHATYR90.4RUG08AMWH8U@arkamax.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DLMIXHATYR90.4RUG08AMWH8U@arkamax.eu>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Wed, Sep 23, 2026 at 09:39:59AM +0200, Maurizio Lombardi wrote:
> On Wed Sep 23, 2026 at 6:20 AM CEST, Ing. Alfonso Kuen Arroyo wrote:
> > The constant is 0x400000, 4 MiB, but the comment next to it said 16M.
> > Use SZ_4M instead of a value and a comment that can drift out of sync
> > with each other, as suggested by Christoph Hellwig.
> >
> > Noticed by Maurizio Lombardi while reviewing "nvmet-tcp: report a
> > bounded MDTS instead of "no limit"".
> >
> > v2: use SZ_4M instead of the raw hex value + comment (Christoph
> >     Hellwig). The file did not pull in linux/sizes.h yet and had no
> >     other SZ_ user, so the include is added.
> 
> version differences should be put after the '---' separator, they are
> not part of the commit message
> 
> >
> > Signed-off-by: Alfonso Kuen
> 
> The mail is missing, this should be:
> Signed-off-by: Alfonso Kuen <gerencia@idkmanager.com>

Agreed on both.  Otherwise this looks great, thanks.

