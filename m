Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794911261;
	b=5dD5iTiOdg/6DsuiSt1aIGfVykjUf1ZXzB7obmEzAoMLDT6EAGEZzTvv2ueUbIlYxW0H
	 i978l8Q+SzGrTIwdm+erSqQdxdDDeUnZJQUIIar0oNqN9cR0Dgc/+5cWq2177I/dAaCxk
	 uDEfLZVrJ3hk4NUq9lix38a7VmKFied00xT3gbHcMycu7rpdwdQNA63qYvlmw5/zCyEPi
	 vTZanYv0rIpUoIjW0UEZs6QyPouLiNlT8fTV4BZB/nVOSjKmP+Ob2qDCx9xRi//AxtcIU
	 ycToVFSnuvsqREfhEjzD4iSeK5ChzN0fLK0Jkl5/hmylEEejNJxbplJ7mgQqr+aE0wQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911261;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=CaJ1rJLSwQEJ3xQnkbS25PPEL12zni1uFP562brZmQ4=;
	b=ZC8owrjdmqNmrFjbPlaFXBJteI4JyZIVbOxl0dM6qdUgfhyk2FkjI6GOullogcraMtaL
	 ZiQQhIY8NgNfd9ERMb8bX2c9Fjkm4Qjh0UmPiIe61bltfPGiP4SoaKoYEDHbHzJTt7o9a
	 /Vm3QHHHUzUqe/qRM/+SMDR5kqqsjz/+pViMeppfBGlkWLPfQQrsQE3SNW8BtaI5KLIYI
	 m6omPg0hdP2scrr42G03f527HTh7hUeu63ixjlM/kzVSiOD/ImPaGZDljuqMxtMGs1HTE
	 18QNhmq6kMVMVfeLTwwTDNeIR96Ka71M6fnOKYaTiGsrffIUa5hD2ubmtYcrSc80lnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ziyao.cc;
	spf=pass smtp.mailfrom=ziyao.cc;
	dkim=pass header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=INKXdEZy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.15
Received: from sender6-op-o15.zoho.com (sender6-op-o15.zoho.com [165.173.180.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C4A7606A88E;
	Tue, 17 Nov 2026 10:27:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C4A7606A88E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=INKXdEZy
ARC-Seal: i=1; a=rsa-sha256; t=1794911223; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Clivc2j+q5iAoTxjufxOwW0bo9td3gtNSStaakH9pymqYeMRDRmgZIttaIqehx22kg03Y6iknKn1NiNtyjdZmoyC9wOy3+J6ukoTlmuh34lQOHXyI/nMQQo7Ewk75/EChGm3o9Nsb8RrJon1EbK+ysdJxged/YTtuyqf1hoZbw0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794911223; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=CaJ1rJLSwQEJ3xQnkbS25PPEL12zni1uFP562brZmQ4=; 
	b=EtSjqUUSE6CJPBZYq9sEyKfLY5odPpgCXRpaTtixpSx61m9JdyX+nHpuIUvo0T868TyWTh1w/JnjNJlO2z4Ey4pfvtJDzQqIxmcefHn5UeZBOS83gC6tDTMxIoZPzjnT1Re5LfPpccSm9HdX9I9xiSVhFrYItlNMYyshSgsXb4o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=INKXdEZy9k32hIXFyq4r4o92XYBB2kusiyHKlp9yXTRTLIX/Q3AcUkUs6FEOnVl/9MLDyEiLN259SiyyL+4zNyXdBaKO3zcKm/M76KRvp6moc3QnIBdMezjEllMXkRdu4SOnyeeW0iIG8ZUsMD+lJR0Q+GPm7Ox5Oe1Fb6/Na14=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=CaJ1rJLSwQEJ3xQnkbS25PPEL12zni1uFP562brZmQ4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794911222333275.566664836868;
	Tue, 17 Nov 2026 02:27:02 -0800 (PST)
Date: Tue, 17 Nov 2026 10:26:52 +0000
From: Yao Zi <me@ziyao.cc>
To: Andrew Lunn <andrew@lunn.ch>,
	Magnus Leatti <magnusleatti@kernelriot.com>
Cc: me@ziyao.cc, Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support
 Wake-on-LAN from S5
Message-ID: <avwr7G83tUvZ1HP2@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-3-magnusleatti@kernelriot.com>
 <avscVrGbi7mFicuz@pie>
 <avsebFtnIASV-KpV@pie>
 <20261116164847.3432765-1-magnusleatti@kernelriot.com>
 <84566846-2ddd-471d-8f4f-068ef10f522d@lunn.ch>
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
In-Reply-To: <84566846-2ddd-471d-8f4f-068ef10f522d@lunn.ch>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.900.72
X-ZohoMailClient: External

On Tue, Nov 17, 2026 at 02:27:07AM +0100, Andrew Lunn wrote:
> On Mon, Nov 16, 2026 at 01:48:47PM -0300, Magnus Leatti wrote:
> > Hi Yao,
> > 
> > On Mon, Nov 16, 2026 at 03:17:00PM +0000, Yao Zi wrote:
> > > > Does the chip automatically enables WoL and loads MAC from eFuse on
> > > > power-on?
> > 
> > Yes. I pulled the power cable, kept the driver from loading and dumped
> > the registers before anything touched the chip: OOB WoL enabled, eFuse
> > address in filter 0, PMT armed for magic packet, receiver on. The
> > packet wake bit in WOL_CTRL is clear.
> 
> I've seen BIOS poke around in PHY registers before, especially if the
> BIOS has an option for WoL.

I think it's likely not BIOS setting this up, since the chip's behavior
is the same when a reset is manually triggered, according to Magnus'
test.

I could grab some devices with U-Boot as firmware, and check against a
YT6801 addon card, which should confirm the power-on behavior.

Anyway, the approach of resetting the chip on .shutdown() to get WoL
working in S5 should have nothing to do with the power-up behavior. It
only affects whether the WoL behavior is consistent regardless of the
reason of entering S5.

>      Andrew

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.
