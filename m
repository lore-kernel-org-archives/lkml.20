Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E65743B0599;
	Sun, 20 Sep 2026 05:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881511; cv=none; b=pArqpUX1y5lilNYtnVaeV6C4U332ZsBgjm3matR+6inJ32jk94ksk6kDmz4tfbGJIb5gTWvdJVOyNfoMgw05bDDmvNUdZ59N1vqbeS2PA3r/DLY97eSDieZM+EYc2V3Cah2QMQ47e3HN6l/DqGzcUsfH1T6RHYtRtUZaS88YR38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881511; c=relaxed/simple;
	bh=oxQhkzqwkx/4Z19Qxxrrn5gJJmSWzLDy8+saoX0ciQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXEXSPoW1qowsa7bB8sEmg+8sxAkup5SaymDieq0icAkNoaBjcr5LHbQiNQFRiozk69FZGGNCRE+UZXccKricyP23HveJhxtiLPMQkwjEEGLsjcR2eOAhGIaoHtAoRCDHi3Rzfk9Yn2wAK0ck/0SpFjf6EYvb3HwmRQTZBxBnwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DufwMxt+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DufwMxt+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2312D1F000FF;
	Sun, 20 Sep 2026 05:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789881509;
	bh=Bz4a3q82FcxUOGi/13u2Aegz4MpJ+A5rvBednWkW6r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DufwMxt+pVdBoOJT0s8Ji8NA3UN+q82KhyEQxewHHysW1xfnejtU6YLqblZO0ChXL
	 u344Z0312uMdZBKgMNEMMIcFD/qdUWAvj22nUTIorETPTUZGszDzNz+x1Rtjjd8dTA
	 tb81vtQrL3EgLpWv2KK1cJ0tZiI1A3zozxAKDRc0=
Date: Sun, 20 Sep 2026 06:16:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Omer PALA <palaomer100@gmail.com>
Cc: "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: rtl8723bs: Use guards for mutexes
Message-ID: <2026092014-despair-secular-d579@gregkh>
References: <20260919172419.60288-1-palaomer100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919172419.60288-1-palaomer100@gmail.com>

On Sat, Sep 19, 2026 at 08:24:13PM +0300, Omer PALA wrote:
> Simplify lock management across the rtl8723bs driver by replacing
> manual spinlock and mutex acquire/release calls with scope-based
> cleanup guards (guard() and scoped_guard()).
> 
> This reduces boilerplate code, removes redundant error-path unlock
> logic, and prevents potential lock leaks on early return statements.
> 
> Signed-off-by: Omer PALA <palaomer100@gmail.com>

Please read the email archives for why we don't take patches like this.

thanks,

greg k-h
