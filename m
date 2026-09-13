Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C632037AA97;
	Sun, 13 Sep 2026 09:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789291140; cv=none; b=anTDMaOnZ34T2Txi1pen778hd4UvMGMSQhuSPBskMP+U7LhjvodnLXSYufGo8PHq/uvZb6X3GBD5vDRXvOauEqwVD7wy2hEC5hjKraNkL4ERTI82bHlQxLwNhJwFhQcTdZWDnMrLiuX0xHsBXC3ioeOezm/O43SYIlyHhwDNM1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789291140; c=relaxed/simple;
	bh=myoXA/RCR7y1roO7JW6pQM2SaNkPGSp1Z37as9Ho41o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PWZmD27bq/09DT34xPRAaS+w7lqHLketD8A/yqYojrYXuPmujL5UYtyBt4Yw5qztyJPpxC9hBW5zx6d/VtxtNRsvF700RGPR0RFTszPO2R2IZHB5batG6hWRWTXclXdlsyr5Q2hTpu5euHGgwwEMjcXaoLxETwxu1hBSmggTZx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=O2nErXYh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="O2nErXYh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4171F000FF;
	Sun, 13 Sep 2026 09:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789291139;
	bh=SQBxCuK5Qw/xVQfYJk/Jwj5HgEK/gfZ7leOZ1lW+ogk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O2nErXYhSlph0pinjd9E5dsm3ZzHPgQ5yCjcNfPiduQeRRu50OejYz5tj+/3FCZ0P
	 PaD3zQf91dBJUfsMN6T+ZWWH6FVLjs32/q/3KvbNDIjSf3uLWNj5aW9mMSL2felVub
	 PWwtchtv/vJJCxr++C/YWzQwlFUEnsIIb665er0M=
Date: Sun, 13 Sep 2026 11:17:08 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xiang Mei <xmei5@asu.edu>
Cc: co <co+66c3f58096d0bde8@bugs.sh>, linux-usb@vger.kernel.org,
	Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	Suwan Kim <suwan.kim027@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [BUG] drivers/usb: NULL pointer dereference in
 stub_recv_cmd_submit()
Message-ID: <2026091348-sheep-showman-5a20@gregkh>
References: <J3vQPnNHSkQ6YUiFvu1bk8ai3Q8aZ7a9J1Y7@bugs.sh>
 <2026091217-almighty-slouching-de2c@gregkh>
 <CAPpSM+TjBEDy0zpkeNfz2ZeCZxYBHSKrw3spDBYS-kBw=EXL8g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPpSM+TjBEDy0zpkeNfz2ZeCZxYBHSKrw3spDBYS-kBw=EXL8g@mail.gmail.com>

On Sat, Sep 12, 2026 at 11:41:00AM -0700, Xiang Mei wrote:
> On Fri, Sep 11, 2026 at 10:47 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Sat, Sep 12, 2026 at 02:06:13AM +0000, co wrote:
> > > This is a bug report, not a patch submission. See
> > > https://bugs.sh/reporting.html
> > >
> > > We found a bug reachable in:
> > >
> > >     path    drivers/usb/usbip
> > >     crash   NULL pointer dereference in stub_recv_cmd_submit()
> > >     commit  2f1baf1fc892 ("Merge tag 'trace-v7.2-rc7' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace")
> > >
> > > Config, environment, the sanitizer report and a C reproducer follow.
> > >
> > > == Notes ===============================================================
> > >     If you fix this bug, this tag credits the report and lets us
> > >     close it on our side:
> > >
> > > Reported-by: co+66c3f58096d0bde8@bugs.sh
> > >
> > >     Everything in this mail is validated by the reproducer below.
> > >
> > >     We also hold an unreviewed LLM-generated analysis and candidate
> > >     patch. The same reproducer panics the unpatched kernel and runs
> > >     clean with that patch applied. Use it as a starting point, or ignore
> > >     it and write your own:
> > >
> > >         patch.diff  https://bugs.sh/b/66c3f58096d0bde8/patch.diff
> >
> > Please just submit patches like normal, in a format that can be applied,
> > and do not make us go to random links to attempt to get any information.
> > That's not how kernel development works at all.
> >
> 
> Hi Greg,
> 
> Sorry about this. We may have misunderstood your earlier reply in this thread:
> 
> "But sure, posting bug reports is fine, but again, patches are better :)"
> 
> https://lore.kernel.org/all/2026090139-shortlist-junkie-9bee@gregkh/#t
> 
> We interpreted this as meaning that sending bug reports without
> patches was acceptable. We understand your concern with the current
> format, and we will stop sending reports in this format to you and
> linux-usb@vger.kernel.org.
> 
> To make sure we understand correctly and follow the appropriate
> practice going forward, should we:
> 
> 1. Send pure bug reports without any LLM-generated analysis or
> candidate patch, similar to the bug reports syzbot sends to kernel
> mailing lists;
> 2. For USB, do not send bug reports and only submit patches in the
> normal kernel format; or
> 3. More generally, do not send bug reports to Linux kernel mailing
> lists and only submit patches in the normal kernel format?
> 
> Sorry again for the misunderstanding, and thanks for taking the time
> to clarify this despite your busy schedule.

Think about what _you_ would want to see if you were on the receiving
end of hundreds of patches a week.  Would you want to see a vague email
with links required to dig stuff out to potentially have to make up a
fix yourself for an unknown and poorly worded description, or would you
want a real patch, in mergable format, that describes the problem and
how it is being resolved?

I think the latter :)

Right now, most developers just ignore syzbot reports, as we are
drowning in real fixes from developers instead.  There's no need for us
to go research new fixes when we are having a hard time keeping on top
of the stuff people are sending us that are in mergable state already!

thanks,

greg k-h
