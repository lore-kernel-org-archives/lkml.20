Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893223;
	b=pvkGmg6BzCU6mH/RfFj8kngPv0hoOUoyIHZmj8neEI/vjUqW5RO/NfU6mlcLg0nueL07
	 IKUG/MBcjJrD1eZIhQQgqEePO3UDKdzGa74atugyfCdF2KrBINewBbKQSNAmnPuNT0qbj
	 prkVQGyNaVIvAU+3tTyRhvYSLUrZ5ujslsm+xlkHPiw3QafkcuRKh5PUifYbpmrqu3SDD
	 Ytuco+ixZez9fMpQbD7M+glZ3YSTbgy6afDK92oQeOIovGbUc+CkhdCCbclLzVFOGhE3M
	 VUBSwM961+Zxl1S4NGekLiE3EoU01Gv9QJvhZMlgPBa1BgbaKmjF5fTK/G9x3v6Apow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893223;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JSObDYvkOpJ/es70rf6LKflOVMKrBuRwaVf/ziJgxa4=;
	b=a+DC0O22ON/VGZCgheEWGsmKXQeGIlSlOAjKFjMDxw1jYZ5ItU5XeXJQprZQHq1F61pq
	 ouwB9gwidF5lGYLKGxjGY5FITrlP8nwmPeAXVDKa0F/JuEaXZIsL0b+jtCuKL1v+Nl22q
	 7e3Tjs2cFi8KvQbhxG2mLJg0B6EULS1038wDVoUvIevDuUCUKZeeZSh8mWLh2V7zae48/
	 NQ3A4HQJCL4RCR2bqhJKY5FSMboaUGiY3YNgp3r8uj7Ak94Ax3YRt27fou8xj4HjO3e7a
	 fX50Wllmx02+UoVO8Vjg4MMkkQNzSWY88wMOdQDSuAbU84xflToya1sKnW7A6f5rcnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=of1+oVfO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6152606A31C;
	Tue, 17 Nov 2026 05:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=of1+oVfO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F035E1F000C4;
	Tue, 17 Nov 2026 05:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794893222;
	bh=JSObDYvkOpJ/es70rf6LKflOVMKrBuRwaVf/ziJgxa4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=of1+oVfON52cxZzc3a/3WKeL277QTLi1XVC4UU8HLJ4ftABEbb0Ge7VFkclhJuCzZ
	 OtMRuAfeDFvgm3QiZKjmhi8UY11kxwUNmQz5guII5RGwmq01ZLCa35c/KmGFC1YKQ6
	 HnvDJayjTXpAhS9TpH4dokXigbLxSvIO1n7E2hgY=
Date: Tue, 17 Nov 2026 06:26:52 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: Kevin Cernekee <cernekee@gmail.com>, Neill Kapron <nkapron@google.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: udc: bcm63xx: Propagate iudma_init() error
 code
Message-ID: <2026111742-worrisome-twiddle-809b@gregkh>
References: <20261103014457.1255-1-laixiangwu@cmss.chinamobile.com>
 <20261117011400.1676-1-laixiangwu@cmss.chinamobile.com>
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
In-Reply-To: <20261117011400.1676-1-laixiangwu@cmss.chinamobile.com>

On Tue, Nov 17, 2026 at 09:14:00AM +0800, Xiangwu Lai wrote:
> Hi,
> 
> gentle ping for:
> 
>   usb: gadget: udc: bcm63xx: Propagate iudma_init() error code
>   https://lore.kernel.org/all/20261103014457.1255-1-laixiangwu@cmss.chinamobile.com/
> 
> bcm63xx_init_udc_hw() calls iudma_init() and stores the return code,
> but then returns 0 unconditionally.  When iudma_init() fails the
> hardware has already been torn down, yet the probe believes the
> initialization succeeded and registers a gadget controller with
> non-functional IUDMA channels.  The patch propagates the error.
> 
> Is there anything blocking this patch, or does it just need more
> time?

Has it been tested on real hardware?
