Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794850068;
	b=tPg5WwoUcKP7EQyuXfcvRWIddoye4U0grF3YiIW37CgV8DkDfkZLTp88/njZ8gxY77ER
	 UuxQzFxr4tJJ/+CAlVhuR6RZSUNFGK5Y+KqrziX1jFBxbZzVj2Uv7IWIbVLiFu39jqH7R
	 UZG40xeWlRjYZLBRUDznvKptXeD1k+NeY89jUs76IrEY/5byEFN11XNh6eqb3uHZqIwhj
	 zOpE6Ys/zy0j97O5M3eBOh98zAMfT28/GGdOf2q9HhYKqWlKTEqT/1616oJDegwshelvg
	 AFupAhn1xKQ+6WsP2AeFTv1K3aavaFr79OsNUJbwnqDwWPHR+4rnk4tZC6Wa2Dw7svQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850068;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=o/s4ptVKvvewZCdNnEs/tgBGB2jIJlIfwFpn+zlkZ08=;
	b=eIsXs4BFZ3u3xSx1bQevi86XnYL5jLuCNDzl/t6C/iGfjyTTIYwCNy7Dh3ShRUUg3BbW
	 M3oYhOb4ZRtzl//tRHngMHgvHmlhO46pYFx3Vvlc+4EkEsGapVyfzqMHhxFtuEGJRtoyv
	 Vr8EGbjDnGW02Ar00mLRdkf4D+tX5pujPzquzV0bw+yzpIwsgFvBpHx3/za8e47o4Y99n
	 8nqQRA7OGwGevj5ID/uf9xOeRjAUKnzuMbdixDx9ijDpgc+TvnF2FoXBH1ib+SwY5w8Pa
	 4355l8/ltO5CI1O6n8PtI+vPwXSH/SOluunMlqUR54YZMhrS/M9PVF10U9lfSnzhx9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ziyao.cc;
	spf=pass smtp.mailfrom=ziyao.cc;
	dkim=pass header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=YiQZc7jP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.12
Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20730606A332;
	Mon, 16 Nov 2026 17:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20730606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=YiQZc7jP
ARC-Seal: i=1; a=rsa-sha256; t=1794850027; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZlxepA0Rs4VAkFBZ7P3O7VFcnZ1cwacWFqY1I4LkidrEBisoW4+5ABJLq7dw6JltJpKA9gSY+FXZ4KQs/yMsJ2SmqTv8rufVDE2AApMPEauOntzDt2nNrdPZ97Pl1kbl+eERYGqXu5IPBR0Dw5wlPC710tCxqNNcarJlwj3TzME=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794850027; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o/s4ptVKvvewZCdNnEs/tgBGB2jIJlIfwFpn+zlkZ08=; 
	b=Rcu7z/CUPxPY8VvY3QBAhmYMdqK9T6Vfiz9ubEvweZ92yeQoMohd5i7meEodf2ajRSQRatR6znp1teljM1DtuVnsl/QMEvq52DJPWDUrOwbBfmbKLdJMpuaDjdiUwi2vRdjfxKRb2x9gzXuix337EDomkQ8yT4RAHrDzSHNRI90=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=YiQZc7jPC1Rc8+ssgUZBSUeq0HpSunYZ7zmsNj8h8G4VuqfXN7ikDQDF33KooiM2ciBOAhlXwRcg3CHP5Je/kevzDjkqQTj2KiLm3pxHfIxavZCimJEvcLpt5SP8RneQgitdGUkegragVPAzX1RtTIZv1MchpHJWAdSq0ij5O3c=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=o/s4ptVKvvewZCdNnEs/tgBGB2jIJlIfwFpn+zlkZ08=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794850025599407.37875575874534;
	Mon, 16 Nov 2026 09:27:05 -0800 (PST)
Date: Mon, 16 Nov 2026 17:26:53 +0000
From: Yao Zi <me@ziyao.cc>
To: Magnus Leatti <magnusleatti@kernelriot.com>, me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
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
Message-ID: <avs83CgSuGULMzmq@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-3-magnusleatti@kernelriot.com>
 <avscVrGbi7mFicuz@pie>
 <avsebFtnIASV-KpV@pie>
 <20261116164847.3432765-1-magnusleatti@kernelriot.com>
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
In-Reply-To: <20261116164847.3432765-1-magnusleatti@kernelriot.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.637.76
X-ZohoMailClient: External

On Mon, Nov 16, 2026 at 01:48:47PM -0300, Magnus Leatti wrote:
> Hi Yao,
> 
> On Mon, Nov 16, 2026 at 03:17:00PM +0000, Yao Zi wrote:
> > > Does the chip automatically enables WoL and loads MAC from eFuse on
> > > power-on?
> 
> Yes. I pulled the power cable, kept the driver from loading and dumped
> the registers before anything touched the chip: OOB WoL enabled, eFuse
> address in filter 0, PMT armed for magic packet, receiver on. The
> packet wake bit in WOL_CTRL is clear.

Nice. But with packet wake disabled by default, wouldn't the card fail
to wake the machine if it just recovers from a power failure?

This behavior is confusing to me, but yes, useful.

> > Aside from a clean power-on, its behavior on reset also matters.
> 
> Same state, about 2 s after SYS_RESET. Probe disables OOB WoL before
> that, so a cold and a warm boot look the same to the driver. But the
> chip arms with the eFuse address, not the one in use. The vendor
> driver writes the address again after enabling OOB WoL, for the same
> reason.

Makes sense.

> > we might probably call stmmac_dvr_remove() in .shutdown() to detach
> > the NIC from kernel's infrastructure, then reset it with SYS_RESET to
> > get a functional WoL state in S5.
> 
> YES! Bingo, and I built AND tested now :) .shutdown calls
> stmmac_dvr_remove(), then with "wol g":
> 
>   reset only                          no wake, 1 of 1
>   reset, wait, address                no wake, 1 of 1
>   reset, wait, packet wake            wake on the eFuse address, 1 of 1
>   reset, wait, address, packet wake   wake on the address in use, 3 of 3
>   "wol d", remove only                no wake, 1 of 1
>   reboot, remove only                 link back, 1 of 1
> 
> "wait" polls PMT until the chip has armed itself, 2.6 to 2.7 s, 7 of 7.
> "packet wake" is the bit in WOL_CTRL, the reset clears it. PME was
> enabled in every row but the first. It also wakes without PME and in
> D3hot, 1 of 1 each. No warning in any shutdown log.
> 
> So v2 would be, glue only:
> 
>  - every shutdown: stmmac_dvr_remove()
>  - power-off with WoL set: motorcomm_reset(), poll PMT, write the
>    address in use, set the packet wake bit, pci_wake_from_d3(), D3hot

IMHO, this would be the right way to go, but I'd like to drop the part
of writing the MAC address, since AFAIK WoL from S5 is usually achieved
through the real hardware address by convention, and

> Two questions:
> 
>  1) The glue writes MAC_ADDR0 directly after the remove, two writel().
>     Is it reasonable?
>  2) Power-off takes about 2.7 s longer with WoL set. I can't write the
>     address earlier: in a test that left the registers returning
>     garbage until the driver was bound again.

if we keep using the real hardware address, at least problem 1
disappears, and I do think it's a little cursed (but not much) to write
the core MAC in a glue driver. And at least now we don't need to write
the address on our own, so if packet WOL bit could be set before PMT
polling succeeds, the second problem goes away, too.

> Maxime, this needs no helper in the core, please ignore my question.
> 
> So my plan for this week: I'll write a v2 that addresses everything
> you've mentioned (once again, thanks) and send it your way. If

Then feel free to add a Suggested-by tag :)

> something else comes up there will be a v3, and a v4, until WoL works
> on every YT6801, NUC, laptop or add-in card. Deal?
> 
> Magnus

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.
