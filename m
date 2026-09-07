Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8E33EFFDB;
	Mon,  7 Sep 2026 16:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788798044; cv=none; b=FGGMD800nNxZYVPRXPID006gt3bdM/lwF1P3nkuxZ3GdoRd0BvOfa1a6bvtdQyl8+oeBtLSGpiET6CMUMClJMosRV8L93dC8tFjQp3NOYc0XKXQSeh7Nmym/IO+RCTRoTCmq/zMbGt1uy1vAE9eEgYHqkhHh0vN13zZeY8ajVZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788798044; c=relaxed/simple;
	bh=0Tbq3ac+lSe9IgYl8Fh1OMt4SG3N24CB06XVJIwZqn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTxeX06kecDmcLwfBK+8tLqmDv+VranOOlIuAEujurZIC2CTluhXXfziDp37qTnaegpp46IpnqpbwqKp+bJs9tutx3Kg78lxfs7Fj5KUCI85uyg6ZBRm04p43TX3MlqDhCWBjFQX586wqWnWlNVS8KMp0/LuLtAJMBiE9qkOkv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wCuTtJ59; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wCuTtJ59"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0132E1F00A3E;
	Mon,  7 Sep 2026 16:20:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788798033;
	bh=G2P4ScBhyUHuViwijKeEbjMpGiDu7kAScKSwuPR3Kng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wCuTtJ59bXELfBVuqMKM/v7cM/otOpE2rpdtCWN+nVVEGa0i1P54GxkHwd9XAGjts
	 dvS1X66J2+oOxFD8wvJj4sww7IABIJzq39Dhf6vuit0Eu2JRhQuDAbmy2GP/BYc6GA
	 MwPf/X78PNxOhlbc+hEwR68e5tJfkoBJHA96kEoM=
Date: Mon, 7 Sep 2026 18:18:24 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Pannawat Sripor <pannawat.sripor@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length and coding style in
 ieee80211
Message-ID: <2026090704-garter-gains-5e09@gregkh>
References: <20260901160530.58974-1-pannawat.sripor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901160530.58974-1-pannawat.sripor@gmail.com>

On Tue, Sep 01, 2026 at 11:05:30PM +0700, Pannawat Sripor wrote:
> Wrap the function call to match with the Linux kernel coding style,
> and clear checkpatch.pl checks

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
