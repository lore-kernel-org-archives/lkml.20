Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841122;
	b=3vmdDgv11PVK/U306/S3UGRzofiixqAm+JvQPBRDB1TC8kISub/1wca33KJ+fV9snlat
	 sXc8XGwO8luvhIdvz2fNvx5txBUARNyREH4tDqj8iGpCwlOZqOHkYZyVj4icco7APLnbz
	 ooSHFVkw8QEQ950fDBui3y7g20LoJzPtsu440Wqkjj6i4jaNQOfYt75DPx4euAuui0+c2
	 VGKE7Y1yX36NIirP8c3cb563wEvj0l1VUZ7FVcatE+uUyysxQy5J/Ob3nZH/tbUiIZVcq
	 e2PEvXmm/78FXw5TfpPa4rtoARF6v94TU5AbIXLg1kynURNa3mKrO8cdrt0DLV1XOUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841122;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fNYP6nVvRxqwPGp7tM8Nr2Iha6DD2mGej6Jc0Znc4jA=;
	b=m71/W97TEQ5K5cj/ksFJERFRumHZnLhA7qLkm9R1juXHbhL9RGQ6hFbHUbwwRIkvTCqG
	 HxPDCIQC8TPmL9ZGk2GoC7PuWAaeTZBtFiysg0amgpICv6ZZWINhfwIX6t0slcHpIAAsG
	 EQwd0skB6iiiVt7xAi/5sDGZ7yQgjMIfpaeWjM765z6DXPHCe13JDf8EwjBODcLLXdznB
	 XlONVQfXja+lHYofNTKnXfNp6rjDIba/N9GPcvxJKq1cT3VE8VPmGbarS1K5kIg+OYPqz
	 U5GwpJCk140MqFifHTo1Dil2TZG1Rys9DMcq7Zm0OFBf/39en56iJbfK/QpE+7uFEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=Aw0Q0zSp;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4D3606A8A9;
	Mon, 16 Nov 2026 14:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4D3606A8A9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=Aw0Q0zSp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1794841121;
	bh=2TMsT4OVc4sp3OPhBOTrfBghYpamHYgE3s1CFvg1zYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=Aw0Q0zSptqmYNbyqP8019WOG1/8FqilaE/5ARuKDNqEylY1EIHBd4bpRxabQWGzEt
	 uCEFdq/w/le8oD99HYu2qN2vx2nfnuJRROPWpp76U/PzUotBZciZYcdNOYTy44tCWp
	 x7puOSjOr2Kjf7mUvoonE06lWHBi3A2TTHtyIVCr7i4BsQSb7Dla1ewnW5F8S2DGuw
	 FKUFW3vp1wdf/OIXrHNOW2YAB21cH6C5Ug8j6yPg3QwnDRNmVzHNzbXsoro8JXx68S
	 9vPpPiEaNTSoqBj1hsvBns+6QJSiJ/aEbSmzA0VIz/WA4pZBbYNyAHCVMYVs/JUawO
	 osiKN+5m+DBVw==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 6A410814D2; Mon, 16 Nov 2026 14:58:41 +0000 (UTC)
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
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac-motorcomm: quiesce the device at shutdown
Date: Mon, 16 Nov 2026 11:58:20 -0300
Message-ID: <20261116145820.3005689-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <avsTEglKKD_wl_Fi@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com> <20261116091757.1656602-2-magnusleatti@kernelriot.com> <avsTEglKKD_wl_Fi@pie>
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

On Mon, Nov 16, 2026 at 02:33:17PM +0000, Yao Zi wrote:
> I think this is abusing the API, and all the other changes in this patch
> are working around its side effects. So here's my NAK.

Hmmm... Fair. stmmac_suspend() is the PM callback, and the other two
hunks are only there because I call it outside of PM. I will kill that
approach.

> We do want to fix the problem though to ensure the device is stopped
> upon shutdown, especially iirc, many YT6801 NICs in addon card form are
> totally supplied by 3v3aux, thus S5 alone won't reset the NIC reliably.

I didn't know about the 3v3aux cards. Both of my boards have the chip
soldered down, and on the N3350 one it keeps its register state across
S5 as well.

> But this should be done in a cleaner way.

I can only see two ways to do it, which one should we go for in v2?

 1) In the glue only. Take RTNL, netif_device_detach(), and dev_close()
    if the interface is running. No PM callback, so no PME to undo and
    no guard for a failed resume.

 2) A helper in the stmmac core that stops the device for shutdown,
    which the PCI glues can call.

Patch 2 adds one constraint though. For the chip to wake from S5 the PMT
register has to be armed and the PHY has to stay up at power-off. That
is what stmmac_suspend() did for me. With 1) the glue has to arm PMT by
hand after closing the device, and I have not tested that yet. With 2)
the helper can do it the way the suspend path does.

Maxime, would you take a helper like 2) in the core, or should this
stay in the glue?

I'll hold v2 until I know which way to go :)

Again, thanks for answering so quickly!

Magnus

pw-bot: cr
