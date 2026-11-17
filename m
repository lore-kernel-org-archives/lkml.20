Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907044;
	b=KiDT0laxYTvQ6EvVkui4NmpcmyV+923DIb749rD+LYdiOKuoODrB7aLGbpx+nN1qjyqk
	 zAS8HLtQ9czF1hEysD+wc7EW29NtmhHDYRmcip7KsdHYBHTpjE8rWXaPKXEwdqP77fDBM
	 iZLqp7w1wAGUoLSlKDicFejBgNF4GHQox7sDiImYuIhc9/I/h/PDV4/3DY3TRkgPDMEq8
	 SWOBoM9UescOl8kINpE98cOqRJzP6upYXQYY0DfdZvmTYYsnqk7cpT84xi2amJ+zZxjr2
	 laeMJrUwjhtQhOcek7I7gVqrGeuyvR5CwTRbET/i9W1CoghDrL/QMx4TZaEXwJYKQBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907044;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=yZ0fAR/QCay6UZgUjG0ZZBVxDPQuZejQY6FBcdailnQ=;
	b=kFOZxJXmFJxuJZSjp4rEHp2Sq4KR2mxYuIWx4lIBOzgM3NqBpOHU47TPJ/wBbFDAWsU2
	 JxpVbrrOpfa6nVxhUQTMyM5jPdMMQj6si/pS8OioBcwDyMA0sY3ht4/O1bzpGQDOGoWLg
	 Afz8igS9tUSHqtRqc6I3MZ3yhJy8375tb+Qq4bx0cHzriZsfF6I/VTZvsOszC8CVjJj2I
	 5EkiroZ7kwPWGk+nX0fa8dXvAbw45h1GUbvDQs4h4ia/O1MeUdpXU00rHrEMvCrRERFJ8
	 E7wayka7089nJKCsLlVZozG/OIhTp0fRhkhp5eshRb4+rC4MvZ4CH+ogfbnefWQwbew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=uC+K7fY5;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3785606A32C;
	Tue, 17 Nov 2026 09:17:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3785606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=uC+K7fY5
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ACBB7A0E37;
	Tue, 17 Nov 2026 10:17:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794907040; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=yZ0fAR/QCay6UZgUjG0ZZBVxDPQuZejQY6FBcdailnQ=;
	b=uC+K7fY560vQHp9hzdSs/zSj9et9Mpp9alYYZbfB3FTk5AxdE7ZXQnfUl4+VTpJxBec43g
	1vqcBgel0UP3xRaN/KzjuxP0im088fg0lNACF0Cub5TZ4rSTSPYWf6GyMEQZF96j5DC80E
	LxBMHOjGEYC494LS+i+XcwrJx2SksdFN/B/FuEIpUxfWhUBnFw/cspgQuppkz0u6sk0Cur
	AhaJtZ7disj6Aj89xXWsxkLtBwYKIplDS8T0oaaJuKl2at4oMUzZ5TpPsTRADhh1ucXxTr
	1SrCFo9dDctHSEj/OiCOuW/6IK3cA+Bs99wJyiFxtujke2eOVMrSQUFcTDz9Mw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Tue, 17 Nov 2026 10:17:19 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: netdev-bot+sashiko@kernel.org
Cc: opendmb@gmail.com, florian.fainelli@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, f.fainelli@gmail.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, pierremarinleclercq88@gmail.com,
 dave.stevenson@raspberrypi.com, justin.chen@broadcom.com
Subject: Re: [PATCH net-next v7 9/9] net: bcmgenet: reassemble jumbo frames
 from status block fragments
In-Reply-To: <179474771487.2199510.9115361919445613385@kernel.org>
References: <20261112-nb-genet-mtu-nn-v2-v7-9-43a5d90b3256@tipi-net.de>
 <179474771487.2199510.9115361919445613385@kernel.org>
Message-ID: <fb5dcb28401cf523601ea61e2118219b@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 15.11.2026 14:01, netdev-bot+sashiko@kernel.org wrote:
> [...]

> [Severity: Medium]
> Has the wider TX descriptor length field been confirmed on GENET v2, v3
> and v4, or only on v5?

Only on v5 (see 6/9). There it is at least 14 bits. A 16361 byte 
AF_PACKET
frame is one linear descriptor with the payload matching exactly.

> [....]
