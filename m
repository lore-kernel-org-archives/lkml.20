Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204EF30F819;
	Sun, 11 Oct 2026 07:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703030; cv=none; b=UqpduCaLanYJD0ZFTj1lYbVRQUBVLCj+Em7vatqLW9hvomm+j3E9JFP6PQxScPrkZeN/p/iN/LMQOXU64AUQxlMhacY07bWjQJ9qmu+amMHf7gGlGga0ksawbmtkl7YRhUovrv67JXRFEu+2WpuwNxVJ/fLxClw5Hby9BBFWrIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703030; c=relaxed/simple;
	bh=vaprpEmzouCpdD1Rthj1vDAmflcJw1XqhfTqrrdUVzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z/zDYtvyYFm2DOrkEOQQ0nTZBUR3MHIy/fvjO7fmn/hBsfnu2jAlRBBWjCUteSB5XqUknWObHeyeoJL6HBapsh+0+he9GIy+xJfNNvNQ0w9H04+1XPkNbToRIm1x7NwASYuCtMYnX8nuNL7EKoZB+rPoN1wiBHudh4g+QhkJr9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QOwqhsV6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QOwqhsV6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15EB91F0089B;
	Sun, 11 Oct 2026 07:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791703028;
	bh=rtjyG2VbIHel6WniqRmWGwdhudibhFsPCcPO0FUzuS8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QOwqhsV6FjQ5ZK6GNseY6EW8s6NGZQC8ITxt1kpvrcnIaHftuY3788aEVLvNoKM8Y
	 21hqFcFHHuMVGaR5T9NZ5MVDBdd/n6z1IzRHiR15qvNScWk7VHplYKoRUFDsPdhtzN
	 SPvxIIInoLyiLK3uGXPyZ1ThnhN83dWyugTWOsH4=
Date: Sun, 11 Oct 2026 09:17:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Orgad Shaneh <orgads@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: octeon-hcd: keep SOF interrupts while a periodic
 pipe is due
Message-ID: <2026101100-untamed-bling-d7bb@gregkh>
References: <20260915081724.25637-1-orgads@gmail.com>
 <20261011065652.2374071-1-orgads@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261011065652.2374071-1-orgads@gmail.com>

On Sun, Oct 11, 2026 at 06:56:51AM +0000, Orgad Shaneh wrote:
> Hi Greg,
> 
> A gentle ping on this one. It fixes aebbc7d63407 ("usb: octeon-hcd: sleep
> on an hrtimer for far-off periodic transfers"), which came in with the
> usb-7.3-rc6 pull, so 7.3 will ship with the regression unless this is
> picked up: a periodic pipe that is due but could not be started can wait
> up to a second for the next SOF.
> 
> If it looks fine, could it go to Linus through usb-linus? If you would
> like anything changed, I will respin.

Sorry, but there is no context here, where is the patch?

And I am way behind in patch review due to travel and conferences, will
be catching up "soon".

thanks,

greg k-h
