Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794921719;
	b=dtkbFOe+NtNpwT0LgFEzO8nzHIXX6aEqE/XCm+SV5ahqx9sCezdJ4XJowX4uEaBF7HrF
	 RRP1Lbadhnx2SgPhRWe68Ed/ZgDfgmO2S8+rFXKaOVtlc3JT+dUhellVkaV+fDUdI/rwr
	 rdjDADR0a1KD1e46A2ekS9ufhgP+J0PyDNt30okYD5+A/2O+Jt2FjSLDNXcGlPJ+9toGF
	 RjUKsDfl18vDBKSns2n5EUiqfeiZU62L0A9WQznNYKmXM11AcWbS91A+W3dJkPR5+iy6+
	 oegkW1eHvZNA2050Q93nw/l7EAX9oueoBWtN2lk2biYghq9SlNodOfcTc35zafUD6gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794921719;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=jG/OnUlisMY7qep2I+IqNw1TKDaNTr//dvYoFFDJd0c=;
	b=bNJo8xZlRrNvbZRUglUV1MHf21NBdpLJXwg/FRKPYAYb7Ry8yCo6TTSC98HfVGu1Hm4I
	 rRUs1lpdqr15gY5YSjq3agqfVeOWi8c6HW81QfCy5LW8NgbRO7ICncHk4kVJYI1GYnFi3
	 VhOAT15BQqYqw8Q6kvQs1zEu39ML+yLBKcoUKF36DSC77qWdKtkQ4aG8wPwxtZEHJlVsy
	 h9WbiC51sMIosrnDGe14032nzlc85c+K3tN2HM3pEy7qFkNvSQV8VmivTwsgaXtHcDare
	 CCc+ymYphae/dwahGgtwZ6txN13TYPLSA16nd/DkVF7DGg2RH3H1xNmBf2cQpqObZEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Be29zpYv;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFA6606A31C;
	Tue, 17 Nov 2026 13:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDFA6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=Be29zpYv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=jG/OnUlisMY7qep2I+IqNw1TKDaNTr//dvYoFFDJd0c=; b=Be29zpYvIUO7RfTkiCnhB1B50q
	PIPV9MyGsPt6AwMCWTVSgrlUykV4HlUjezLCfPOACskDuc1Z50TKinbYf3EVca1hkRVyI+sjIVZ9+
	CUFBLcf6eUDoRElxj7ToutLsAbepTyxmzeecW1mttRTaKlpR+w3+ZbeslvW9pb9JSO40=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTJ86-00H9nm-9e; Tue, 17 Nov 2026 14:21:46 +0100
Date: Tue, 17 Nov 2026 14:21:46 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yibo Dong <dong100@mucse.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	yaojun@mucse.com
Subject: Re: [PATCH net-next v2 2/5] net: rnpgbe: Report link settings
 through ethtool
Message-ID: <edd0589c-1a48-44a6-ad15-b9133ee4f751@lunn.ch>
References: <BD205A7832D36E7D+20261116030917.1329989-1-dong100@mucse.com>
 <66AFF2810AB647C8+20261116031020.1330219-1-dong100@mucse.com>
 <d7351f56-d4fa-4ba0-a0c6-c7bdf7aac460@lunn.ch>
 <2207C8DCDD49F5EE+20261116044737.GA1342898@nic-Precision-5820-Tower>
 <cf674063-6c6f-43f6-a18a-d7ed5bef8a5c@lunn.ch>
 <236B4E2337BC768E+20261117014902.GA205295@nic-Precision-5820-Tower>
 <2ddca58c-608f-4a0f-a26d-df92c2c34c69@lunn.ch>
 <72676011073A7040+20261117025526.GA214154@nic-Precision-5820-Tower>
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
In-Reply-To: <72676011073A7040+20261117025526.GA214154@nic-Precision-5820-Tower>

On Tue, Nov 17, 2026 at 10:55:26AM +0800, Yibo Dong wrote:
> On Tue, Nov 17, 2026 at 02:54:45AM +0100, Andrew Lunn wrote:
> > On Tue, Nov 17, 2026 at 09:49:02AM +0800, Yibo Dong wrote:
> > > On Mon, Nov 16, 2026 at 02:18:28PM +0100, Andrew Lunn wrote:
> > > > > link, speed, duplex and mdix are updated asynchronously by
> > > > > the mailbox event handler, outside RTNL. link_lock protects these updates
> > > > > and provides a consistent snapshot in the getter.
> > > > 
> > > > O.K, thanks for the explanation.
> > > > 
> > > > I removed too much context, so i cannot see here. What about
> > > > lp_advertising? That also comes from the firmware, reported on link up
> > > > when autoneg completes.
> > > > 
> > > The firmware manages autonegotiation and reports the negotiated speed
> > > and duplex through mailbox link events. However, the current mailbox
> > > interface does not expose the link partner's advertisement bitmap.
> > > 
> > > Therefore, lp_advertising is currently left zero to indicate that this
> > > information is unknown to the driver.
> > > 
> > > If reporting lp_advertising is must, we would need to add a new
> > > firmware mailbox command to retrieve the link partner's advertisement,
> > > or add lp_advertising to link-event mbx alongwith link, speed and
> > > duplex.
> > 
> > It is not a must, but it is useful.
> > 
> > Or you can just throw away your firmware, expose the MDIO bus, and let
> > phylink drive the hardware. Less code, less bugs, more functionality
> > for free.
> The GMAC provides MDIO register access, so exposing an MDIO bus is
> technically possible. However, the firmware currently manages the PHY,
> and its interface does not provide a PHY ownership handover mechanism.
> Introducing host-side PHY management would require coordinated firmware
> and driver changes to avoid independently configuring the same PHY.
> 
> In addition, on this SoC, the firmware configures MDI/MDI-X through
> AXI-mapped control registers driving the PHY's pi_force_mdix_en and
> pi_force_mdix_mode inputs. This control path is outside the PHY's MDIO
> register interface.
> 
> The firmware also supports link management before the host driver is
> loaded and while the host is shut down, including wake-up handling.
> On OCP platforms, it supports preserving the PHY link across driver
> reloads and host shutdown. These capabilities are already implemented
> in firmware, although driver support for them is not included in this
> series. Any future ownership handover would need to preserve them.
> 
> Would it be acceptable for this series to retain the firmware-managed
> PHY design without registering an MDIO bus, and leave lp_advertising
> zero for now? If a mailbox command is added to expose the link partner's
> advertisement, we can populate lp_advertising in a follow-up patch.

You have not implemented anything special, other systems offer the
same features, using phylink. However, it is fine to implement it all
your own, rather than reuse existing software. SoC devices tend to
make use of Linux to do all this, and PCIe devices tend to reinvent
the wheel and do it in firmware. We are happy either way.

    Andrew
