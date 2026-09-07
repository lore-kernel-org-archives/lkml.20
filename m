Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 265EC51A75C;
	Mon,  7 Sep 2026 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798692; cv=none; b=oDbTzh2Xi+OuxgeYdkrjh2ynjGhnGFpqKBihPICV5c8BfoUy1ilv4/NoOuBHkbxdYlyZK4UoiY6DAf/RpKMmX21Jtfv0SV1WBxeV4JowSljM9Re3nvYTPRWPX5e76KxTWHsFdhw/EMTMuNAqGR+hc4WRrf15l1rYmudeOrCeP24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798692; c=relaxed/simple;
	bh=fY8vl7GDxM6eefJTmcCbIoGsRSR0fg+tHBlSSgyE3EM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdZBRM5dza/x/cWFsZt1DyKIMIIPRTSAKZxzkulG7uzzEZi5Dux0AAnZ6u2EbS/G8unG+ChGEB2GWirMcYGBxfgkLj6jYR3vfeDu1upGQDz4LFH2EWH2/XFLto7WUyLiXnA5J9qBxUZSPKidLoJ0lQvdW94Lkf3XTcJMEAiwo3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wP7OyOaQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wP7OyOaQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08A1F1F00A3A;
	Mon,  7 Sep 2026 16:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798690;
	bh=RNRlTS4igMuxIgZGkQ9n1WFx3YFhsS6SdPB9tEv8YYs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wP7OyOaQG5pQ6boUpvpWGkkdo+VF8FjIgcTthZScsyxdF1xyZ2e7POD7KroalDbth
	 NZfEEKQ9g5sbF4XcCN6BWlZHXVKpYSeh4PHUSz1EHu6a7+emv9wSVKb/hohJSa+u1e
	 1Mgb/pWitV9l8xpKdTkSBj5UheSMXoj4X2yhGKdc=
Date: Mon, 7 Sep 2026 18:29:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
Cc: error27@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org, sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] staging: octeon: fix use-after-free in tasklet
 teardown
Message-ID: <2026090710-disposal-tameness-3d85@gregkh>
References: <20260905153530.36693-1-ayushmukkanwar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905153530.36693-1-ayushmukkanwar@gmail.com>

On Sat, Sep 05, 2026 at 09:05:29PM +0530, Ayush Mukkanwar wrote:
> cvm_oct_tx_shutdown() kills the tx cleanup tasklet while
> the net devices are still registered. This could lead
> to use-after-free when a tasklet is scheduled after the
> tasklet_kill() is called which might run after the net
> devices are freed.
> Fix it by unregistering the net devices before the tasklet
> is killed.
> 
> Fixes: 4898c560103f ("Staging: Octeon:  Free transmit SKBs in a timely manner")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/message/20260615172734.42038-1-ayushmukkanwar%40gmail.com
> Signed-off-by: Ayush Mukkanwar <ayushmukkanwar@gmail.com>
> ---
> Note: This patch has only been compile tested. No runtime testing was
> performed as I do not have access to Octeon hardware.

Please wait until you have the hardware, as the sashiko review comments
say there are still issues with this patch series :(

thanks,

greg k-h
