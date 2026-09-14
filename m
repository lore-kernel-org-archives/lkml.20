Received: from arkamax.eu (128-116-240-228.dyn.eolo.it [128.116.240.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF444398F2
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.116.240.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378121; cv=none; b=Uiew5IXeaE9wSinltDhKirfSeg5FUUbPdebXgTCIwWaRWgXwMOXPf960MHgjfgmUrSzZVNRrWtTxlANsiNJTc+g9O3z5q6o+pEyiX1OqQiCXTNcFD/nj77A8nv4DGLCQPtaJ2o3hhXmw7vqnNgWcD3YiT5Y+W2d01FOnYnmt4os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378121; c=relaxed/simple;
	bh=B3Z+znTM9B8bpncXq8heSxOsMWGGrWDybfw7VJSgOxw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=OQhv7BOqxIT5+T2L716EmQBc9K/Da1xsGff/cVgOPqmGzBFet7zENj19CyNFF4y7QEUhmMEhRc2KdA0YkHYqoPRJDE6QtFVImjn5Zj0h41iQnIlouZ0i3Fn5OgdjHc7H914zXj2/ZH5I1OtoWhX+Vh6k62LRmdrhV8SeVOfxBxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu; spf=pass smtp.mailfrom=arkamax.eu; dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b=hG1dbGCJ; arc=none smtp.client-ip=128.116.240.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arkamax.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arkamax.eu header.i=@arkamax.eu header.b="hG1dbGCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=mail1; bh=B3Z+znTM9B8bpn
	cXq8heSxOsMWGGrWDybfw7VJSgOxw=; h=in-reply-to:references:to:from:
	subject:date; d=arkamax.eu; b=hG1dbGCJHx1Llgjb8O3BZ0QTkf/24M/v7KSaTsMw
	9/80PwPgHK2Ia4OlUdgoxlB0CBpZ6rp/ecw2QA1GpoiE8gMCs8w5wSK/WIMPt32xbIOFdT
	DG4H0mjDHIc9lzSYg89VJCz9sBaaQISKHHctL4B1PZOoOn4wjfHFJLcHwh9p+t9FjtTCIh
	VjRmW75j++Gn+leHnZoOstWTf3UXsDNWQqIL6sIU5IgXyQUptkrzBYwndJUc1R9Kfre4Rp
	d4oSKom03LaclW3MIlxRVuK0/F/19+4O1eQbQErzuke0nsKuWOuA9RuZv63uwydNnBl9N3
	jhYDT5UwOv1LoRGFcBol3w==
Received: from localhost (128-116-240-228.dyn.eolo.it [128.116.240.228])
	by arkamax.eu (OpenSMTPD) with ESMTPSA id 82239975 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 14 Sep 2026 11:21:55 +0200 (CEST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Sep 2026 11:21:55 +0200
Message-Id: <DLEXGM8VZOW9.1J9A20FEP43RM@arkamax.eu>
Subject: Re: [syzbot] [nvme?] WARNING in nvme_loop_reset_ctrl_work
From: "Maurizio Lombardi" <mlombard@arkamax.eu>
To: "syzbot" <syzbot+4a1d521d19d6321f5aad@syzkaller.appspotmail.com>,
 <hch@lst.de>, <kch@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <linux-nvme@lists.infradead.org>, <sagi@grimberg.me>,
 <syzkaller-bugs@googlegroups.com>
X-Mailer: aerc 0.22.0
References: <6a9ed559.6e6c5f9e.240462.0003.GAE@google.com>
 <6aa6c282.4c28b7d0.c1bba.000d.GAE@google.com>
In-Reply-To: <6aa6c282.4c28b7d0.c1bba.000d.GAE@google.com>

On Sun Sep 13, 2026 at 5:34 PM CEST, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    2f0c1cf72f46 Merge tag 's390-7.3-3' of git://git.kernel.o=
r..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/li=
nux.git
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D159b19f958000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D8c5c3949d762a=
91f
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D4a1d521d19d6321=
f5aad
> compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for D=
ebian) 2.44
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=3D1074f61558000=
0


It seems that a reset operation is enqueued before the controller
initialization is completed.

when the nvme_loop_reset_ctrl_work() finally runs, it will find the
controller in LIVE state, thus hitting the WARN_ON().

Maurizio
