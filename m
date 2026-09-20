Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B684737DAC0;
	Sun, 20 Sep 2026 15:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789917299; cv=none; b=AEbQmWhdVpsbk5VpvqmpD2MiVJbaPnab0kdHMf0gqRgOgJmTV66jRKwXt4LcbNq9gioouRXwzlqFa/F7vqm0V5X3qGHnK1EIo/rbeSOxRRSR9LvcZZn/06gQVTo4f/hTi3En+2JYBYHV+0OtPb69NtZs2W2k1MbIjKalKcd6FGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789917299; c=relaxed/simple;
	bh=qU60AEnWDnM5Ty1D7IKvGpgIdNdwLnPlDDHQTpHucXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a82Mb7I1O5iyuThXJtEk9uMp4AFiwd1jtDLN8WJr2xiVLDQBgsC18ewWwz4aXbu3/4Eg8Jt8PhGo1cvfmQ1GsVp0JhCtLHJrlFfDCFbVPNJ+wSrbbufbxiB1z5oHBTOY/FwN/y5Zf8P+hVKAxpAqvEru+gR5IM28faflxZYjHK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qlppejBn; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qlppejBn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=SvRcN97+jbxD6uQgpvhSo80k6y8QmG3eSAaiOeHxkVA=; b=ql
	ppejBnN0PZNUqLKTHWkJM+HmHsYVsli3gyQekHvcOEfLfLGMguGBHbBszTS+Vu7Yazf+jxA4OgLsr
	oG/1Q7/Gf/S4+7daMuDriuVEcZ258h6VrpCW4/UYBhPRWoV1Vad/rKZQaaW83DLJ1zHy5tdmu2gyF
	5tl4p1EI6bOVmuU=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x8JFk-006Ady-8f; Sun, 20 Sep 2026 17:14:52 +0200
Date: Sun, 20 Sep 2026 17:14:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?iso-8859-1?Q?Nicol=F2_Giuliani_-_nicolo=2Egiuliani6=40studio=2Eunibo?=
	=?iso-8859-1?B?Lml0?= <nicolo.giuliani6@studio.unibo.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: R: [PATCH 3/3] arm64: dts: marvell: Add Sophos XGS 107w NPU board
Message-ID: <feea5596-f4ef-42af-b9f7-6bf170620532@lunn.ch>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-3-365615a74ef3@studio.unibo.it>
 <6b935e31-169a-4cd1-b385-62dc659c1256@lunn.ch>
 <DU4PR01MB12163AE447B65B21A7D585A0D80852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DU4PR01MB12163AE447B65B21A7D585A0D80852@DU4PR01MB12163.eurprd01.prod.exchangelabs.com>

On Sun, Sep 20, 2026 at 08:48:20AM +0000, Nicolò Giuliani - nicolo.giuliani6@studio.unibo.it wrote:
> Hi Andrew,
> 
> Thanks for the review.
> 
> > The reset line of the switch (CP GPIO2 pin 17) is deliberately not given
> > to the mv88e6xxx driver as reset-gpios. The 88E6193X needs about two
> > seconds after a reset before it can be used, much longer than the driver
> > waits, so the probe would time out.
> >
> > The obvious question is, why is your 88E6193X special?
> 
> I don't think it is.

So please fix the driver to accept that the 88E6193X is much slower
than any other Marvell device.


I saw the probe time out when I started the kernel with kexec from the vendor Linux, so nothing had reset the switch before the driver did. When the boot loader resets the switch first, which is how the board normally boots, probing with reset-gpios works on this board (Linux 6.18). I have not been able to test a driver-only reset yet, because the boot loader always resets the switch first, so I cannot say what made the difference. I have not checked whether an EEPROM is attached. v2 describes reset-gpios and drops the comment.
> 
> > +&cp0_i2c0 {
> > [...]
> > +     gpio@20 {
> >
> > Which port?
> 
> It is the LED expander of the eight RJ45 ports (two pins per port). Nothing uses it yet, so I dropped the node from v2. It can come back together with the LED nodes.

Doesn't the 88E6193X have LED controllers of its own? Why do you need
additional LEDs?

	Andrew
