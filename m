Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794893183;
	b=EywdOUK5QFomPk1Fvf11ALPTAO/fuqXMZASHC9m0XwaH+vzOsjf5onL3EUeABvGErKF7
	 UqySKxA1LTqR/FSAZ3mrmGsYGchYh6ibUdun+QHAC3bZOdSCuMjtQikY9ku7i2KVklFeZ
	 rfx825iQprrN9/XrVxwxhKQR/RYSf//2KMq9UewAgGal/2ip0X7Yb/WqQjdbTHeplSztw
	 A7sN2P2D2G9AOA401BHt3yMyGwsfezQY6rsbNPfaaTC7EImaUtXfGUk2gZZWC/s2wwLnC
	 5sxqNuMlEPr6Dm12Kv840oWOdmYiPQ33NqSN76niIWjX94OBtgEizwfqX3G+FFugIdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794893183;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=93U50a2DJWt9X0cq+xWCbY02gmFDmWqUj6QyKaq2hHw=;
	b=lDYCyqo3xhro1mF0342x3IRXYZGKD/T2yM55KZit4sJhAzxm+/9F2oKFW7mq1TPH8jCN
	 a52RFB+lMt2Ie+Goj/MXLKaNoOWgeIen0ZQi8DhuQqTeExr/59eLXxQ9t1oRW6wNYdFY5
	 wVd+S4sEMMeue6Yyk8T5Y04oG8IW0qMzzM8vrn9RNSMwxV+7iMwXZ9ggaSe+Ee7KaVMTP
	 bm88kWCiOYYue13hzREl33TY1rUDZkP3bPTryKYxfzHysNNgU7siOTn+jUTvG0o5lcQzz
	 cQjp5/os0eVsDFumThtNBk8BlBxz4Bc+zvn2BuEB039MIj1g4Ty+KZiofuWbGEppQZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GZJ1qzBw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F51606A31C;
	Tue, 17 Nov 2026 05:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=GZJ1qzBw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 160F71F000C4;
	Tue, 17 Nov 2026 05:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794893182;
	bh=93U50a2DJWt9X0cq+xWCbY02gmFDmWqUj6QyKaq2hHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GZJ1qzBwfENjHgCgnV1VMT7/zLGsthBuOXwdi2VhUrH+wXAfqwY6v+ExM1s9Q4JQu
	 qrvlFqs/cU2uN34Er0pOJTGAzjTpntVF3WCX3F4oxCGRV60tePgBNr4nv+/Ts0q4ib
	 zNYYPEtEDoHIlfYCmkARRymFqrqGsUau2qHu93Yc=
Date: Tue, 17 Nov 2026 06:26:12 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: r8a66597-hcd: Fix clock leak and unchecked
 clk_prepare_enable()
Message-ID: <2026111752-planner-uproot-4a2d@gregkh>
References: <2026111648-landfill-skeleton-efe7@gregkh>
 <20261117010754.1599-1-laixiangwu@cmss.chinamobile.com>
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
In-Reply-To: <20261117010754.1599-1-laixiangwu@cmss.chinamobile.com>

On Tue, Nov 17, 2026 at 09:07:54AM +0800, Xiangwu Lai wrote:
> Hi Greg,
> 
> thanks for taking a look.

At what?  Sorry, there is no context here.

Remember, some of us get 1000+ emails a day...

