Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4B13C1D6A;
	Fri, 11 Sep 2026 06:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106545; cv=none; b=lXhY0eLvRB1UlClnt+bRHLBBUA1rzEAriXQslKAlCIRSwH/svmi6JWeRqh7gJ7XOR6jWIH+T90z1JEZVePXWOQzCmqOT/NvQIU3Dk/GaGxDlwQ+ZgUY0a7m0gFKP5xzU43AWssjSjmH/tszetXlsOCfUh4H8kQIP6mOzcbM45TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106545; c=relaxed/simple;
	bh=5VDZeViSqzK8Fu9n4jxhh9yOff54U7Ehj50D82xJcuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lViPI4yfBvrWpP8DVNZ2Xf8Zs5nTWLXxiUxyP7F/WMr+AhTVF6VRm0L8KqFVMUXZBCuO7Jz56PF4FWpcrxmjmf7NY1HDymvy3DkdNFxLFPXHdIBsaWkaF4oBh5n6kU4Slav3jobdnIbzdCaPGiAtbPWmICZKw1mAv38TttyU0NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tqvpZISf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tqvpZISf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB5F1F000FF;
	Fri, 11 Sep 2026 06:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789106544;
	bh=q++EVy/8oOAQSwq1tgfxkXr09cak9GNilyco3DCsB8g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=tqvpZISfeZZ/Gr438ZqvhHSOK15N1mvblCj3JvKc5PwBy9MgYpGX+CICQICpY5Wkp
	 TIkfsNC782uz09spFjKN5mPY5PQsADOKbB+AURLNSsvZzquirwTwHgFYIwF15qkH15
	 MHxD1w/pHFdYHNyX9XkyUzBY88ZpDQZARVswC+3o=
Date: Fri, 11 Sep 2026 08:00:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] slimbus: messaging: hold lock until transaction is
 completed
Message-ID: <2026091111-appear-stopper-6fd6@gregkh>
References: <20260911045911.1327413-1-lcy8047@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911045911.1327413-1-lcy8047@gmail.com>

On Fri, Sep 11, 2026 at 12:59:11AM -0400, Changyul Lee wrote:
> slim_msg_response() drops lock after idr_find() and dereferences txn.
> If the requester times out in the meantime, it frees the TID and
> returns, so the handler writes the reply into msg->rbuf and calls
> complete() on txn->comp, both of which have already benn freed.
> 
> Keep lock held until complete(txn->comp) finishes, so a requester
> in slim_free_txn_tid() and cannot return while txn is still in use.
> Call idr_remove() because slim_free_txn_tid() takes the same lock.
> 
> Fixes: afbdcc7c384b ("slimbus: Add messaging APIs to slimbus framework")
> 
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>

No blank line between these please.

And how was this found and tested?

thanks,

greg k-h
