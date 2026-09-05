Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44292EEE89;
	Sat,  5 Sep 2026 11:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788607909; cv=none; b=OcPwqXN+FtCzA8Wat16rjDXZRQ7O02mF2hVMloyZp+sXZ7woHIEtDSG1mb/7K4NMGHCaAd9V6p1NqJ50ocVPUD/OmPA0uf9dStWwBNk4eyV6JcjxafezuR9Up/srY1fUSXsGn6bcuU6OOEGzoLC2VEBIDghQ1jhHm+QmofAB5wY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788607909; c=relaxed/simple;
	bh=ySRHPw/LOsF0zO9YV7YjzbFQtuceWWiRRZz3JsWXu2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qzx0LLfTLYd7G2NsMVnXFiDZFROuNkCDE5SMyVyDv53qPooLZML6BKIGlCh/5Co1MA4qQqo9TPUUiuxa8uc47IPMJ6J77BRRE/oUJo4f/U+TWOBXYwPty6n1/yLO/AeaX7Ol4c2MGfIvInDmz+CDbc8wW6V3Sz9yL83QM+DTDec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=j1E4vGdv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="j1E4vGdv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80FAF1F00A3D;
	Sat,  5 Sep 2026 11:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788607907;
	bh=ZpIA8+pyg1vmA6avFMgOrLtMcjAxXEjvFnDs+R+E7xE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j1E4vGdvkbE24aakFBHf1a2WC5Z1GUbcFuXDsiaCOxLpUIXTYAgINAE6GfK8B+Noy
	 7mZ4g0b99KvUTfrXZ8Azaa07v1l0dgdsFLZoiiJhtQUO6lQ9qiQq0yQcvS9K10LyhJ
	 nOBHW/bqTHozKqfce70tSjSLIBOs0wGKejiEyR+Q=
Date: Sat, 5 Sep 2026 13:30:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: syzbot <syzbot+7300affe388249d66dfe@syzkaller.appspotmail.com>,
	i@zenithal.me, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, shuah@kernel.org,
	syzkaller-bugs@googlegroups.com, valentina.manea.m@gmail.com,
	syzkaller@googlegroups.com
Subject: Re: [syzbot] [usb?] general protection fault in vhci_hcd_probe
Message-ID: <2026090536-numbness-enlisted-917e@gregkh>
References: <6a88066b.ae6ddae5.3da009.002d.GAE@google.com>
 <6a9bceeb.a5e650b3.26d8a.0008.GAE@google.com>
 <20260905104331.6d4288df.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905104331.6d4288df.michal.pecio@gmail.com>

On Sat, Sep 05, 2026 at 10:43:31AM +0200, Michal Pecio wrote:
> On Sat, 05 Sep 2026 01:12:27 -0700, syzbot wrote:
> > syzbot has found a reproducer for the following issue on:
> > 
> > HEAD commit:    9d80aa4617b3 Add linux-next specific files for 20260903
> > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> > console output: https://syzkaller.appspot.com/x/log.txt?x=10adf4f9580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=bb4a32c282cc2ec7
> > dashboard link: https://syzkaller.appspot.com/bug?extid=7300affe388249d66dfe
> > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=121c7215580000
> 
> Who or what is coming up with these ideas and even commenting it?
> 
>     // Iterate platform devices
>     dir = opendir("/sys/bus/platform/devices/");
> 
>     while ((ent = readdir(dir)) != NULL) {
> 
>         // Set driver override
>         snprintf(path, sizeof(path), "/sys/bus/platform/devices/%s/driver_override", ent->d_name);
>         fd = open(path, O_WRONLY);
> 
>         // Bind to vhci_hcd
>         fd = open("/sys/bus/platform/drivers/vhci_hcd/bind", O_WRONLY);

That will taint the kernel in newer releases, and syzbot has already
been told not to do this, it's not "valid" at all.

thanks,

greg k-h
