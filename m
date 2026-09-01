Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721C630649C;
	Tue,  1 Sep 2026 04:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788236793; cv=none; b=MKY4j1QZ8o2FqrP1xYr5L4aBb0fwshza/iK4chJI70XUaJ8ZHToktROY8Da9xYLgjdCu+GcV6j+Ra8R9+tQF1C/QiJ/BKM5YSJet9tvw8ZRNIKCymhat9IBvU7B1je0GVaG2Hlwsw6tFYysLQtWGS38To8gqry/gqZnZnInTX7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788236793; c=relaxed/simple;
	bh=UL3/IpsdX9CoJRATjGUBxTUwCBJYIWUOgM7y9ufieT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MWLV/zRxAULtWkvYUJhIRW6UDJ7iLc+tWYXeAoO85vsFNoNlaPIck/ZPNtpLNvM5wfmdfygwQyUOVtZ2ZsQKmhB4fYwKB1kCIUZ8QT/DrSxUCTw6aMgQo/6ihOWSfx3fBJ5xtLfynQo1a2lvA/TUVhsafzwTjOA5/TT+FCpmoTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=105pQsNf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="105pQsNf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 721361F00A3D;
	Tue,  1 Sep 2026 04:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788236792;
	bh=XenD/fDOr7jFfTSGqCgMIgIsiHJUocc+iVOEgG/5f4o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=105pQsNfBqdAH4PLJq4bmJGoDD3tQPrTxsfoZDrWSLeO/wrIKHDQ8n7jho0Ezea2W
	 K4ww9m9VWZw1JD4KA1Vp19DSM5K+wt+E3jHLI7kkfRXfgJA5XLa7i4tWsW4+M49MOd
	 KcmVEKu3j4jYnlddgHbEC04z6M3RgLkoaY83k9ek=
Date: Tue, 1 Sep 2026 06:26:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: ZW Tang <tangzw515@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [BUG] media: usb: siano: WARNING in free_large_kmalloc from
 smsusb cleanup path
Message-ID: <2026090106-badland-vertical-7b57@gregkh>
References: <CAA2SOT5LP5kNmw5qG6OCDijBYQNZoxCiKGRM8zcbApN62UKnTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA2SOT5LP5kNmw5qG6OCDijBYQNZoxCiKGRM8zcbApN62UKnTA@mail.gmail.com>

On Tue, Sep 01, 2026 at 11:54:43AM +0800, ZW Tang wrote:
> Hi,
> 
> I am reporting a warning triggered by a syzkaller USB reproducer on
> Linux 7.2. The issue is reproducible with HEAD commit
> 45c13f3f9e3bb15fd89ff2864c6f627a3b4b4229.
> 
> The reproducer connects a crafted USB device that is bound to the Siano
> SMS USB media driver. During probe, the device repeatedly returns URB
> errors. The driver then fails to start the device and enters the cleanup
> path.

Great, please provide a patch to resolve this and we will be glad to
review it.

thanks,

greg k-h
