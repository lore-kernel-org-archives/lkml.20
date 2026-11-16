Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794867595;
	b=iTCdjY33qc7n5sB9nqUNfN0Lo84H9gj4O/qSgwCA9mLhb5cb/rDIvuPSwGIpiNI++mYw
	 21e58I8lCVeUy8agie7pXgfzxTGjIXZyp4hfcxJxk1sgIsVJ759GnmjMPD0FI8va/CuJ1
	 ljNorseshxBge4pitHPCTkYiRbK6OfSbhS54+dcyb0ItK3xxqSlZF+e4CALnj7FuwUgnn
	 5vZTCyTvMORHpalnakODpi1fmARn9541HbaZbKVY2w55mnFpstG6QG1PrGL02hLsChSJi
	 Md6UKu5dUONfvXZCJP8aRFtMmsFYvCiF8c88Qg4eIj4cCFWyffPNNpcdtNn2LMBJoQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794867595;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=YpKVSlQQZT9OTr5yWvZdFnKLFgbCBAUyd3j3C5Dn4kE=;
	b=I59uXqsxSXExWjlROsVlrQ9RJB2XwOM0V40xmjuT5zidmKH1v0uVZGlq6mcOYl+BYAWh
	 0lQqOHOpSYSnbnJNJJbh4H4CiIEXGiq69NZwarLdWqmW4kN2sx92TzPX6h9jtBagQ/c5f
	 6F+X1NopBnpRhuJ8BzCk90GBWzJxbBNNZNWK7cudx6CKKNSFZ4qHyhUMl4njX7b+rO+3T
	 xTdcSjEagyX7mGiAktBabIf9zL9M++CJEEfHMCYmxP6PNCNszyio3V5v0E9YxjP2Xbs/E
	 cK9XmjN2zYGBtwd6TC/q7vLHTdNNhRd2oc/tJw0wT1x1CkQtt9FzaNK1dwlQ1OP894A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Ib0bx5ro;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 643F7606A31C;
	Mon, 16 Nov 2026 22:19:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 643F7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Ib0bx5ro
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=YpKVSlQQZT9OTr5yWvZdFnKLFgbCBAUyd3j3C5Dn4kE=; b=Ib0bx5roxVWu37EBTh4mZ39Zih
	hcaTMisFoWCi6nlGVjuJrYIRgUq+X+po/AHvVS7t3owEZYXxYeImofL2c7dUq/cAsm0T8Ty4yBBPz
	72uShcJ1S6yqgiXn23Rw2hjQKYrTc7KXJgJb0ptV6VLq9lToSbOxbZVxG9lvB8E/cLeo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT53B-00H1KI-Ha; Mon, 16 Nov 2026 23:19:45 +0100
Date: Mon, 16 Nov 2026 23:19:45 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Janis Edvarts Lacis <janislacis06@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	wellslutw@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <461f7e59-6c1d-4ad5-9eb9-5e5d9b4a9e90@lunn.ch>
References: <20261114222744.535158-1-janislacis06@gmail.com>
 <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
 <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>
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
In-Reply-To: <7zevuoiao6ildvkxt5baqnalb3nrx736krdxkbrbxouelukveq@2wo6m6cfl6rn>

> I am fairly confident the change is correct, as the documentation
> supports it.

So the LLM review is wrong?

   Andrew
