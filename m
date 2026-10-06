Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7739B3D7D8E
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791282099; cv=none; b=qGP9XZVKDmW7IUGZLunFSYHLlECnRxK3NHDEt+StM3eEFHzWYFiuHG1qYqjMiv+HszU5/14zLKPBhfEBUiS9gEjbjJm4gnZuSwvr0yU4JNYndwEJ+0ODhEck0QiSgX5B6NxOjs6Z6KF52WZnN37qaASlP9I+bQP4xD1IOPaDJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791282099; c=relaxed/simple;
	bh=db45InZwlCLw5+zJ7k3UiSa7UkwxluAY3GaXg8gG2xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cijFagKVBMpwzFVO5FZ28QQ0CPV7IrF02bXv3zXKyVFiG6IYOSrTsxj+DwDIHjFo7Az/GWbO3HtivzIXByD0gV66EcWjCqVYlMGRQKKp9smRcpHIHrqI3ZMtaAEF09H2RXDwLbRI0JR/SADr79LdW/y0W/XI6seZvEaAEHjY3mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=TPSn/Vqs; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="TPSn/Vqs"
Received: from killaraus.ideasonboard.com (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 16EEE493;
	Tue,  6 Oct 2026 12:19:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1791281972;
	bh=db45InZwlCLw5+zJ7k3UiSa7UkwxluAY3GaXg8gG2xI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TPSn/Vqs4qUmTNwufVQdSraKtPZpD44eoyXKWO91SQcBTZEl7J4sq9qEWpZ1y25Hx
	 wswNOBX5w2c/BKKZ5XVzISuIPrEcINFQSmY1+YInDqKfc4Frj3Trx00IG+yR+g1vFg
	 Xxm+PKqsBnVJx6dsbci3cRsvQ6jPkEeT91iX19r8=
Date: Tue, 6 Oct 2026 12:21:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>
Subject: Re: drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c:72:6-12:
 inconsistent IS_ERR and PTR_ERR on line 73.
Message-ID: <20261006102127.GA596590@killaraus.ideasonboard.com>
References: <202610060853.t5Q4BX8P-lkp@intel.com>
 <DLXN2NHRB139.7OA9W663817Y@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DLXN2NHRB139.7OA9W663817Y@bootlin.com>

On Tue, Oct 06, 2026 at 11:14:09AM +0200, Luca Ceresoli wrote:
> On Tue Oct 6, 2026 at 8:40 AM CEST, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   2c3418fffa9d037b2038a6db48be63f9e2291806
> > commit: 5b03d4907db93627ef48396f39c3455ce644c946 drm: rcar-du: encoder: convert to of_drm_find_and_get_bridge()
> > date:   6 months ago
> > config: sparc64-randconfig-r2106-20261005 (https://download.01.org/0day-ci/archive/20261006/202610060853.t5Q4BX8P-lkp@intel.com/config)
> > compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 195c81658995a4b7531c30a12c5aef6cf2bbd671)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Fixes: 5b03d4907db9 ("drm: rcar-du: encoder: convert to of_drm_find_and_get_bridge()")
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202610060853.t5Q4BX8P-lkp@intel.com/
> >
> > cocci warnings: (new ones prefixed by >>)
> >>> drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c:72:6-12: inconsistent IS_ERR and PTR_ERR on line 73.
> 
> ...
> 
> > 9a248605980a75 drivers/gpu/drm/rcar-du/rcar_du_encoder.c         Laurent Pinchart 2020-12-03  @72  		if (IS_ERR(bridge))
> > 5b03d4907db936 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c Luca Ceresoli    2026-04-09  @73  			return PTR_ERR(no_free_ptr(bridge));
> 
> This looks like a false positive to me. I guess this code would not trigger
> any warning without the infixed no_free_ptr(). But no_free_ptr(p) is
> transparent in the sense that it returns a copy of p.
> 
> So I guess no fix is needed for this driver. Just let me know in case I'm
> wrong.

That's my understanding too. The coccinelle semantic patch probably
needs an update.

-- 
Regards,

Laurent Pinchart
