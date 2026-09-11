Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D193839BD;
	Fri, 11 Sep 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789120327; cv=none; b=t7NL1DjF2dJ7Pnm73SnSQ7NrnU5rizk/uoY0DVFmgr5CTxccfn99E9nsknpY0VQaaVohJOJDqlo+CSRsm1E2tvbJVxWzrFt6xRUpGbHn7tb+5jFSQiY2XLqY4QpTDt2HaXaEKLjc0+TGVe5iwD8lowjxSiiMfGSwPDLOyXL/iUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789120327; c=relaxed/simple;
	bh=tM7YVsthjLT/sRLo5quitFBK1dgegfuq0mjyP5R4MWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kp2nV9CKeIaRAen97OcqZd3y9HdCd/pnfNzxkKPJTECGXFz69HC5AAkMn2ujA9fB5/2mMqZc/0nERJAJ6CTEQqTGVTVUMjBbEIa8SEpeVyQrb1i2YsYHGRVzjHk2CyvalZOfCcAyLLIgcoS2QEpej0HCZan5AWK3G65u6rI809I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jGU7lQXH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jGU7lQXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B781F00893;
	Fri, 11 Sep 2026 09:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789120324;
	bh=avFKwm0rNcTlSgtIyUFbPzpfJLuvC9WpoKomTZDOxUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jGU7lQXHlB8r6lLIDeuFwWpqdkIfyAkQllCumocQYa7QZKhIQevjZMSlf3ja94zrx
	 nAuN5AB0V/CtQGTrpydFnKyPDSMnRjhCRWPe8FX5G7G1iXsVCPDLi+82BdMaAYQVyo
	 bo23J9p2ccpgg1NpAmGPilsVpS0eo24aLLMKbuJY=
Date: Fri, 11 Sep 2026 11:51:54 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] USB serial fixes for 7.3-rc3
Message-ID: <2026091146-sermon-earful-7faa@gregkh>
References: <aqPMDHBQ8bUm-Ohg@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqPMDHBQ8bUm-Ohg@hovoldconsulting.com>

On Fri, Sep 11, 2026 at 11:38:20AM +0200, Johan Hovold wrote:
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
> 
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git tags/usb-serial-7.3-rc3

Pulled and pushed out, thanks.

greg k-h
