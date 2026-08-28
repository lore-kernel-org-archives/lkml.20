Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411FF39EF39;
	Fri, 28 Aug 2026 06:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787897510; cv=none; b=P8zlIJiwwAX7lAlAs/exw2LANEgzJcYRl8H7Vzq6MuSf4EWvFhxVRxuWd19FtUOowxPVIfmy5oSvWNlxv45uT7N/VfnWoBJ6RTCEnMX3U6Oig9neVMsUcyBVwWtfCVW4qcLbnStmfs4ym0bwzxNzrt45qLuOdnN0Ro+2Ydi+tro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787897510; c=relaxed/simple;
	bh=ONOantvwTcskUzlFu/Rp2Gw8ocC9uwBsD/hWpyHilyA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PxLP8xXmmhy4V8h8bUEvLn1zoPcwhDtcgtFYJxwHoXcp37Xkxpp0LtC29WI3Js6ZRkwO5t3LqC0yc6fozWU2Chtd8bBQ4eWkXz3uo7YlscgaDjG98+DbSRbgKjw8NrwwqvhJWBGWHzru9yQv3M1rNbimXyK6teCAlfH26J3/enY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=esPprOGF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="esPprOGF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 332371F000E9;
	Fri, 28 Aug 2026 06:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787897508;
	bh=mKxrA/PSkEo5bbhThUxBYyhecaoPo9twCca+t8ttJG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=esPprOGFTfXMGy/8+wd7VyQyClgg2S0efaCHz4QZeVEmnD3MeMULs00yteC6CNpnV
	 GWnqBC942fCmBkuZQ0YZvY5NSfGSm4LPRkbBkPwmsNZ5Oxp+gkD+yup55vihNRIZf5
	 yoUMDoi9Ua7XE3A14bz6gPG4A0knwyLLRYTH7Ng8=
Date: Fri, 28 Aug 2026 08:11:46 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Peter Chen <peter.chen@kernel.org>, falemi@asu.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
Message-ID: <2026082853-silenced-yoyo-75a8@gregkh>
References: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
 <2026082846-lethargic-ability-93dd@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082846-lethargic-ability-93dd@gregkh>

On Fri, Aug 28, 2026 at 08:01:19AM +0200, Greg Kroah-Hartman wrote:
> On Thu, Aug 27, 2026 at 10:34:56PM -0700, Farhad Alemi wrote:
> > Hello,
> > 
> > As part of the kernel research at ASU's SEFCOM
> > lab, we hit the crash below. Crash reports can be found here:
> > 
> >   https://github.com/farhad-alemi/public_bug_reports/tree/main/150-usb-chipidea-foreign-platform_data-oob/
> > 
> >   BUG: KASAN: slab-out-of-bounds in ci_hdrc_add_device+0xb76/0xd10
> >   Read of size 4 at addr ffff88810e9061c8 by task repro/9505
> >   Call Trace:
> >    ci_hdrc_add_device+0xb76/0xd10
> >    ci_hdrc_usb2_probe+0x22d/0x370
> >    platform_probe+0xf9/0x190
> >    really_probe+0x267/0xaf0
> >    __driver_probe_device+0x1e2/0x350
> >    device_driver_attach+0xe0/0x1d0
> >    bind_store+0x1d0/0x220
> >    kernfs_fop_write_iter+0x3af/0x540
> >    vfs_write+0x61d/0xb90
> >    ksys_write+0x150/0x270
> > 
> > Our reproducer.c is available upon request.
> > 
> > Happy to test a patch if that would help.
> 
> Please send such a patch.
> 
> But again, stop messing around with root-only sysfs files without
> understanding that you get to keep the broken pieces of the kernel if
> you touch them :)

To be honest, all of these "reports" look like you set a fuzzer loose on
the kernel, while running as root, and are surprised that things broke.
You should be more surprised that you actually only got a few crash
traces and that your whole system wasn't randomly corrupted and
permanently destroyed :)

Perhaps you might want to look into the "guardrails" that other more
mature tools like syzbot has in place to not go and do things that are
"obviously wrong" and add that to your llm "harness"?

good luck with the research.

greg k-h
