Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F6730E853;
	Sat, 12 Sep 2026 05:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789192032; cv=none; b=kmlU+EYivWjOsDcnrdG7X4zE3Mptg4LmtC7Jj4tiQHPth6fLgKIFJ/FB5GXsQpJCKMkZjL7wuhals63dvzT75B7bVnzPGzmApL2u3edMD37Db3XCgv3XcfCtfWVs80Ex/oOQaqkL67JBjOxKfwQAVD5fCk9I9K/Z3GHN/P8WEGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789192032; c=relaxed/simple;
	bh=XtjdVOa4ofFL2/map0QAzdphOu8JVuMkNoLmzpb4YmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQjvPe5Z0OvH5Y6rhgnH+h4NxQ8aZF/rk6rOEp0RGWl/ViGDg8tZhKYhCSY24HXkRZlxHsRIn/I+GgXp8SY2FVTjXjq3wGHWatSP5b2CcBN2hoAic7cY6gKUQ/leY45LkUa2iitlsjub99UQ/9Ct8jJkrxLmBv+xmUsItV6uR+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aa2PHdQg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aa2PHdQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66191F00893;
	Sat, 12 Sep 2026 05:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789192030;
	bh=I1xw0WIHIZxIqpPpXrHwOD6f1qs8OsT841gbBO28lGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aa2PHdQg4+PvANHacVKowSLHfTGDeGCuR7LhcLPwyghvZVnaARHPauLW7qErLoiJa
	 SvNDBQ2Tdjl76HqDjB7JHQsCtb2kqsFUvb+hXfLlhUd2AyFk/o0gSASk8i3LNzTTyD
	 qFm6J49svMxKux/Fcm27pyUsVIPvZkE/Zxka4lX0=
Date: Sat, 12 Sep 2026 07:47:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: co <co+66c3f58096d0bde8@bugs.sh>
Cc: linux-usb@vger.kernel.org,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	Suwan Kim <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [BUG] drivers/usb: NULL pointer dereference in
 stub_recv_cmd_submit()
Message-ID: <2026091217-almighty-slouching-de2c@gregkh>
References: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh>

On Sat, Sep 12, 2026 at 02:06:13AM +0000, co wrote:
> This is a bug report, not a patch submission. See
> https://bugs.sh/reporting.html
> 
> We found a bug reachable in:
> 
>     path    drivers/usb/usbip
>     crash   NULL pointer dereference in stub_recv_cmd_submit()
>     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> 
> Config, environment, the sanitizer report and a C reproducer follow.
> 
> == Notes ===============================================================
>     If you fix this bug, this tag credits the report and lets us
>     close it on our side:
> 
> Reported-by: co+66c3f58096d0bde8@bugs.sh
> 
>     Everything in this mail is validated by the reproducer below.
> 
>     We also hold an unreviewed LLM-generated analysis and candidate
>     patch. The same reproducer panics the unpatched kernel and runs
>     clean with that patch applied. Use it as a starting point, or ignore
>     it and write your own:
> 
>         patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.diff

Please just submit patches like normal, in a format that can be applied,
and do not make us go to random links to attempt to get any information.
That's not how kernel development works at all.

thanks,

greg k-h
