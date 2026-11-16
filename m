Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847762;
	b=xeCrEW1ZbtkOi2enh1/gUoBRWG7OIZL4obZSo18fLqcCYRIxhMRjrMN+/dt3XCPGxUY3
	 YViDUm1lFuEJ+HcIGwh0b7Ae3Y9/1tIMYvCroiUTbquUI1wA/C6KbQsxe4r+LPpwRv/sS
	 0iRFLh2KmLBcm3DmPhp+OLIunQ897OXdEmoQf5g58Wi+NtxOmwPtgWcFJ3EkhPQBXePnJ
	 YknWte4nQ0A4oPb3+fehBB/xW4uooOhnSvx1R3InrCJ5Ux3pNCUmdydU/Q/vXwHCayxMX
	 8M+g9a/i2Oe5RBaRvqxba1f2w6m3kmr0aVZLbGiV24piozCJBifHY1oSKTq6pXdqrUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847762;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vfyJOsUskHlLJmN+D44oLPMzWH54O2TfU7FlES5/KAc=;
	b=p7z3On4cxTZ/EJTnsAKMKB9TgXQx6i/U7XUzqEs0qoiVVAtjwR6fqQ43fDT7W9m10Lya
	 x1CX6D1htBZRSoXNBs2Wo5HV7laaZsczesA6SCCslF0A13z+LnOpM4cF+p8+0id3xuUwL
	 kkdAK+77KyA+l1EoYowbobzlhLoUihld1G4r94t9WBvFP+KxMCxoT0Z2M3MMlkyJee00y
	 IXowaMS9Mp6335Sy8DxZrT3PDCGAriQe2p2UKsQXTGIyzyikVCUDWeDy6xabLRDj04Z11
	 M1uspfDO01F8ymA6mfhym9xLkKQP6dErj24uS2g/3CX5KwHJ8zioXFoa3aIIOqY263Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=niEZmZ8C;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0378606A322;
	Mon, 16 Nov 2026 16:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0378606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=niEZmZ8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794847760;
	bh=Mg+KnOr2PFN0W5qEG2JQtutKLFPy/XXNDzadik7RWfE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=niEZmZ8Ca5/vAfQ5KRtxF/P+bkvPeRTeQn5UTp3DSmBcefuKctoSECS1Ut9jo5HU5
	 2OYtEUInAqTff99qAA4wiWLO4SGL5g1y5Hhc9vZDXU6ARDDnrn19WzRpPopHgCfuEF
	 TQoa50oYjzc7sCvBe1coRxpd7xHg5mvA/xvU/RacKj598V/8WU+hqDJqekIGIsBEak
	 7WTLcj9zcmKeKkn/yGf+V11Q6cwIfQbsTP3PfE1zQyqYxAc+hAfmdmmELj1QFOOuOn
	 kRIP5HRmi1/9YTQ5b/k8RI5Y0apg2WGFVYqx+78pRqbgjnatfbwLOUaFyXLf7IZzr2
	 KlOooQGbuNJeQ==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id DE1DE819D7; Mon, 16 Nov 2026 16:49:20 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5
Date: Mon, 16 Nov 2026 13:48:47 -0300
Message-ID: <20261116164847.3432765-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <avsebFtnIASV-KpV@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com> <20261116091757.1656602-3-magnusleatti@kernelriot.com> <avscVrGbi7mFicuz@pie> <avsebFtnIASV-KpV@pie>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Yao,

On Mon, Nov 16, 2026 at 03:17:00PM +0000, Yao Zi wrote:
> > Does the chip automatically enables WoL and loads MAC from eFuse on
> > power-on?

Yes. I pulled the power cable, kept the driver from loading and dumped
the registers before anything touched the chip: OOB WoL enabled, eFuse
address in filter 0, PMT armed for magic packet, receiver on. The
packet wake bit in WOL_CTRL is clear.

> Aside from a clean power-on, its behavior on reset also matters.

Same state, about 2 s after SYS_RESET. Probe disables OOB WoL before
that, so a cold and a warm boot look the same to the driver. But the
chip arms with the eFuse address, not the one in use. The vendor
driver writes the address again after enabling OOB WoL, for the same
reason.

> we might probably call stmmac_dvr_remove() in .shutdown() to detach
> the NIC from kernel's infrastructure, then reset it with SYS_RESET to
> get a functional WoL state in S5.

YES! Bingo, and I built AND tested now :) .shutdown calls
stmmac_dvr_remove(), then with "wol g":

  reset only                          no wake, 1 of 1
  reset, wait, address                no wake, 1 of 1
  reset, wait, packet wake            wake on the eFuse address, 1 of 1
  reset, wait, address, packet wake   wake on the address in use, 3 of 3
  "wol d", remove only                no wake, 1 of 1
  reboot, remove only                 link back, 1 of 1

"wait" polls PMT until the chip has armed itself, 2.6 to 2.7 s, 7 of 7.
"packet wake" is the bit in WOL_CTRL, the reset clears it. PME was
enabled in every row but the first. It also wakes without PME and in
D3hot, 1 of 1 each. No warning in any shutdown log.

So v2 would be, glue only:

 - every shutdown: stmmac_dvr_remove()
 - power-off with WoL set: motorcomm_reset(), poll PMT, write the
   address in use, set the packet wake bit, pci_wake_from_d3(), D3hot

Two questions:

 1) The glue writes MAC_ADDR0 directly after the remove, two writel().
    Is it reasonable?
 2) Power-off takes about 2.7 s longer with WoL set. I can't write the
    address earlier: in a test that left the registers returning
    garbage until the driver was bound again.

Maxime, this needs no helper in the core, please ignore my question.

So my plan for this week: I'll write a v2 that addresses everything
you've mentioned (once again, thanks) and send it your way. If
something else comes up there will be a v3, and a v4, until WoL works
on every YT6801, NUC, laptop or add-in card. Deal?

Magnus
