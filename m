Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3635F3D9043;
	Wed,  9 Sep 2026 07:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788939398; cv=none; b=De3uhwA2che6yyUT3bfoS0fKkF9m8UmEDd6xZdeOQ3eiVvxy7KjcaMgcvs5liovDcpNA2B4UnUWe2q5sE0ZmOqoRqnR2HWjo96QDZyMuOo/IrwFP9/icz5Ag2l04fLFRbqQLVllpCexebTFxl4C7dClqCpSTREqPAw1S+wL1hn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788939398; c=relaxed/simple;
	bh=X5F8OS/0tInD8LKhiFiTv1ifVTXXTDNYolXcxLLi9OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BiL7Q6H/usOgwnkISUeMK4+lwF0L5vROg96htpljHYscfSzbvBY/jg5wbU1zy6vWIN1JoGTFKbkXUEpOU6BumN9IWePAbt8WgOsOpsbGM/yNeRiCmQsAK7A8LjPmIINoAFB1SSiLZd9Pq/yuHqFwnzNoUIqdq78XV2VOOa2P+gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=gu6zjS24; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="gu6zjS24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54BE1F00A3A;
	Wed,  9 Sep 2026 07:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788939387;
	bh=X5F8OS/0tInD8LKhiFiTv1ifVTXXTDNYolXcxLLi9OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gu6zjS244jlxoTfpgau+WcvvEJVws7M1g3CKTw6UMsf3CLG5wRNONS4GSeD6OnFeA
	 xd2fv+c6gfelRkhcMceBAGpibdIc9PM5S8YyFNhrYQeqjekpQXGUb9HqZp0IUHjRAe
	 DcQYsB6qdluxgY2UcRhw+BXi2X7qy5zKwNgqqyY8=
Date: Wed, 9 Sep 2026 09:36:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Amir Mohammad Jahangirzad <a.jahangirzad@gmail.com>
Cc: Valentina Manea <valentina.manea.m@gmail.com>,
	Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzkaller@googlegroups.com,
	Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
Subject: Re: [BUG] KASAN: slab-use-after-free in usb_control_msg /
 kobject_put (vhci_hcd)
Message-ID: <2026090937-exert-olympics-e8e7@gregkh>
References: <20260909015438.274093-1-a.jahangirzad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909015438.274093-1-a.jahangirzad@gmail.com>

On Wed, Sep 09, 2026 at 05:24:38AM +0330, Amir Mohammad Jahangirzad wrote:
> We have found two related KASAN slab-use-after-free bugs in the USB
> subsystem (specifically involving vhci_hcd and usbip) using syzkaller.

There are lot of those, please see the mailing list for suggested
patches, or better yet, submit patches yourself for the reported
problems as you have a reproducer.

But note, usbip runs on a trusted network, with trusted devices, so
perhaps you are fuzzing the wrong thing?

thanks,

greg k-h
