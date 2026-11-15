Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.13.80.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768718;
	b=GQ4ccZGwRg6LocEfSZtUEyge60I3Jsw72UHO7bygQcGNK3Yx+jJSz/VCK9SmhjXTQOwA
	 xatA8f2RSbqE4jCga4azJ2Zi12qsV4pc6V3nFQkoUQaA0Q6ttxqQkm5HWgEDnHqc1+1Aj
	 GbcHafX+UfuX8MYo6GLBm96S0lTjMP/cQLor3nwFd23ZRmO6NbdKavtGZmLh6aESnsWCx
	 CgUJL589kNtuPCTWa+ILQJSxZHXt3vpawkcwuNk90y8Oei3hq6I516DaWuQuj9EtxOc4z
	 gxv6TCp7JIF8fh4h9zXx1wkNSY5OQVOE0dB2dNrjGXIAaPBHM4Jh/veRFf2BssGyrLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768718;
	h=DMARC-Filter:Received:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=TX1RY3u91alVrnKBjY7XHoRmEpFzQEPO5YB4TC0t61A=;
	b=xXtI4NaaZ6/g3kI4954OWWPUyY7mBce4EyWKyBSff3fH5PImnlbExjqy9ImeyNgr1/Lf
	 xIluAOioyU2lpy/68KrhlVZ07pAz9c8w1rJfB2jWPIm/4S57ZdCR6wUAVI3xoxiXwS3GT
	 pleof1ujdi4MGBujZl31GeZBIbzVpGiYMAdC5uNFyx9T7ER6UkU0p9r0iqC04TvmRx9i3
	 +v/dvUEexB1gNgcmi7jUoH8kb7CKnvBJb8R4+p1ZzWqyWbGhc+S5QsRM6YzjgzB+tCCxY
	 W6sP9WomaekqOfeQvk6lkbGLl3FdupzJAP/UL1ACi+JTpjMWUoj1dCaKWFfjV8W6Rcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tipi-net.de;
	spf=pass smtp.mailfrom=tipi-net.de;
	dkim=pass header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=fSYmeqqC;
	arc=none smtp.remote-ip=194.13.80.246
Received: from mail.tipi-net.de (mail.tipi-net.de [194.13.80.246])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7159606A327;
	Sun, 15 Nov 2026 18:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7159606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tipi-net.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tipi-net.de header.i=@tipi-net.de header.a=rsa-sha256 header.s=dkim header.b=fSYmeqqC
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29249A167E;
	Sun, 15 Nov 2026 19:51:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1794768715; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TX1RY3u91alVrnKBjY7XHoRmEpFzQEPO5YB4TC0t61A=;
	b=fSYmeqqCt3VYHOr3AIfeGwVQjLlDBZpezG6lbP9hBnJdfRyh79BOIAM462nRH4Pq4pHS8D
	irH/MZ1eXnv2V2WTg+9azW8zMZWVWZEg5dSwJ3HMBJMjx+OCZ4jmDOe8wH+F8XB2HEEtqB
	pJhq6WG/bEnKNZ7TpPF/LzyjKN+lPfVKk0kHTWWGLALK79XxGl0hSnere771XB4haid1I8
	5odCUW4kV+xvfoeBNQ1+RypU66ZlxlBDjV7YaRN2DvHa/hUwBEtbSEZmndkteydtc4vswv
	dcrsl9YV0mgwVEIyi2EgangmaWfLC1Jxpa/nlxC8jDIISHPcrusIeyEVGNYedQ==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Sun, 15 Nov 2026 19:51:55 +0100
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: netdev@vger.kernel.org, Carlos Soto <carlos.soto@broadcom.com>, Doug
 Berger <opendmb@gmail.com>, Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, linux-kernel@vger.kernel.org, Mlody12 mlody12
 <kudzo51@gmail.com>
Subject: Re: [PATCH net-next 2/3] net: mdio: mdio-bcm-unimac: Poll for
 completion at 1us granularity
In-Reply-To: <20261113211554.2058181-3-florian.fainelli@broadcom.com>
References: <20261113211554.2058181-1-florian.fainelli@broadcom.com>
 <20261113211554.2058181-3-florian.fainelli@broadcom.com>
Message-ID: <6372266a7e2f7ebd83bbaf75056ce1ea@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

On 13.11.2026 22:15, Florian Fainelli wrote:
> The current polling code unconditionally waits 30us, which was sized 
> for
> a ~25us Clause 22 transaction, and then polls MDIO_CMD with a sleep of 
> up
> to 2ms between samples.
> 
> Adding Clause 45 support means that every access becomes two back to 
> back
> transactions (an ADDR cycle followed by a READ/WRITE cycle), so a fixed
> delay sized for a single C22 transaction is no longer meaningful, and a
> sleep of up to 2ms between samples can add significant latency to each
> access when the transaction has not completed at the first sample.
> 
> Instead, poll the MDIO_START_BUSY bit every microsecond so that the
> completion is noticed as soon as it happens, regardless of the type of
> transaction. This turns the wait into a busy wait, which is bounded by 
> a
> timeout reduced from 100ms to 1ms: a 64 bit MDIO frame takes about 33us 
> at
> the lowest MDIO clock the driver can program from a 250MHz reference 
> clock,
> so even a two frame C45 access completes well within that.
> 
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Co-developed-by: Carlos Soto <carlos.soto@broadcom.com>
> Signed-off-by: Carlos Soto <carlos.soto@broadcom.com>

> [...]

With what Andrew already asked:

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai
