Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496353;
	b=CF2V8WY1zqatzIu0mCHd/yG8jqrZEifvMUUdt7sbgmAygLXVA2Rg54qc42zJOroe/wLb
	 ujO8gUIRC/+7AOBVZoOmSbT0uyvFhmQeAjNU7fPXjkO5vWTJJhXTexh5XxuBrRh4eteRV
	 HTlEGCuOlsiTSDZdgxSsmBnISXQaQKZzQrLL6SIZdU32koZomsAvuVQIqAALT1rip7UAa
	 6mJOzzOruS+uHCwdBK5drX+kpaWis936daZesMEyvJqleFzs4bMN55DlZYv45IJCyToe3
	 gUy9X9x71RjeikvTTjY3X3oSOcdioh9iIJibRqW/7+TkWUKDziG49ynFoYTbzjNgaTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496353;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=N6riM+q2+LiiBZRghnUvpGNT+WGCZ2bDIwVZ5hbAVRc=;
	b=B0rs3DEySkyYcVMIRkfYR5ObkAkoGehVm7/01NuDKnCX8j9l/VBMhCP8OEEHICI3y0Ct
	 CDSoOiiRPxyt7s+Ueu8luUDq3px6gnTQ+0HSiz0egEis0gfQIulLyrHGiG6OtXAFU/CzS
	 5JWVKnfx3y1Eg64qfh03jaQh8dd6z7WLXhIl4Fum4RXiy+5JM2W5TUItGXxCUgv/KFe0s
	 vmnupnOhTZBAcVGMHgEBezf/e2oJ01BP4ixD119fOs1WR8vhdTAFG7oEILXgnbZO3mgjX
	 RkzmAhvghRfwQPelCgdDHcyU/yaOGK7ApanGfF9MBChiOGcfsZzyT0P2crgsdVN5n7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XRBU6cLc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C84E606A32D;
	Tue, 20 Oct 2026 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=XRBU6cLc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0531F000C6;
	Tue, 20 Oct 2026 11:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792496353;
	bh=N6riM+q2+LiiBZRghnUvpGNT+WGCZ2bDIwVZ5hbAVRc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XRBU6cLcF/LoFryYizTUWqMTHwOKj74KbJknFukoYhKU4yYsOtH3g5BsZ7nGrjtaS
	 sG7C2o+XcKmAoPQ1ui+r1Y5OaeFniKL/p+MVQLzuIjQliWHOiWxuZD3wwH346H6E9W
	 +z48YxR+97Shg2d/fBEpI2wBbpt+qTuvXnk3aa/o=
Date: Tue, 20 Oct 2026 13:39:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Syed Tayyab Farooq <syedtayyabfarooq08@gmail.com>
Cc: David Brownell <dbrownell@users.sourceforge.net>,
	"open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Subject: Re: [PATCH] usb: gadget: u_serial: fix use-after-free between tty
 open/close and gserial_free_line
Message-ID: <2026102052-stretch-craftily-e3f8@gregkh>
References: <20260910082008.12397-1-syedtayyabfarooq08@gmail.com>
 <2026091034-slicing-same-692a@gregkh>
 <CAKD4hN41w_bRPAY3i9=tD1tWQLag3r-FGsngD5U6igM=FWe-_Q@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKD4hN41w_bRPAY3i9=tD1tWQLag3r-FGsngD5U6igM=FWe-_Q@mail.gmail.com>

On Tue, Oct 20, 2026 at 03:49:29PM +0500, Syed Tayyab Farooq wrote:
> Hi,
> 
> I wanted to follow up on this patch, if anyone has had a chance to review it.

It seems you ignored my review comments on it?
