Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835117;
	b=0phufADTjXiijAeDbAnhz8ThJMxe0akSYdRXU9Oe+9cZCdj6raPXLIcoKnyJR/xcdj5+
	 ZmFw6PH7NjDf6lUfvUq+5piE+v/LF6Btr3V1MyFjY2DTRAPo+KCEfpqFuDdG40WWf8vgu
	 3P2jsy7uTTqqgTfsq7Ogh6wAH4XLoZtVjf8ADRLuFEWCJJm/C6kaeCINxFD1kvagu6DQx
	 rTlXUHpyzNnseEpBYuuhDLwY/vRebcKFjps0LGuPYOpYdqMOs6yrjV9223UaKj3EHqLu4
	 +ODjUav2GZnF1W7Vr5MJ229qIKICz8vdx03UD7gYIgix1wti6BIJ1aPpL5hfJdFMWjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835117;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=p+rWhgjtOn/Lo10hRDaMGIqFyQOaUCAXo3KMace5rKk=;
	b=I7W6zz05szTsc7cQ5xBGybLyJ1feMqkq3b/6BrbaFYM7siWMp3wVsWknMOIR9zXOlmjw
	 35/yYKCn2A3SRCxF8v3kicXxyexUpXkjkYL7jHiL28bPAeeXg/rLrQ62ULyOju0X6FDvP
	 Add4ccLWWD8nobRpaIG2efgA427l4f6VKvlLKTrbirtHHiIzUo4lXvNqjz6cNkj/onWUo
	 LC0HyZbB/eHylRgS4prNoXrq1N17j4BNfX4VcqEYdOoD3nKByqs7y4kVa+dHW66xsU739
	 LGG53QzbfK36tGMOInv0GSWdI5LftU/mVKQupsBDWnc06LYjjs01gvZCf03oFaZW/QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XWpwkv0I;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D089B606A31C;
	Mon, 16 Nov 2026 13:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D089B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=XWpwkv0I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=p+rWhgjtOn/Lo10hRDaMGIqFyQOaUCAXo3KMace5rKk=; b=XWpwkv0IJhb1znKdhAQPG6jNLO
	0IdDI+qY6hnlaGmee7rX6zV7Uh6ZekOuOBbRvZLF8etn/fB+UDuFfmk9RW1oAHHktT1kuEAn4gV9I
	Rr6scnvRq3jsbFgE6GF6E5TE+rLSVcPIC53TnClHGYgMPgZMljfvCMo138n2AtB+mYj4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSwbM-00Gv1o-R0; Mon, 16 Nov 2026 14:18:28 +0100
Date: Mon, 16 Nov 2026 14:18:28 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yibo Dong <dong100@mucse.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <cf674063-6c6f-43f6-a18a-d7ed5bef8a5c@lunn.ch>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
 <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
 <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
 <2207C8DCDD49F5EE+20261116044737.GA1342898@nic-Precision-5820-Tower>
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
In-Reply-To: <2207C8DCDD49F5EE+20261116044737.GA1342898@nic-Precision-5820-Tower>

> link, speed, duplex and mdix are updated asynchronously by
> the mailbox event handler, outside RTNL. link_lock protects these updates
> and provides a consistent snapshot in the getter.

O.K, thanks for the explanation.

I removed too much context, so i cannot see here. What about
lp_advertising? That also comes from the firmware, reported on link up
when autoneg completes.

	Andrew
