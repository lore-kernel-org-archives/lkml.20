Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.12
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794839668;
	b=jrIjJn6OBVtm1TKm7oQdYgtfzSNGh+GtS92zriGOPh6F9Kz3YPzjN6x5K3K/ZTDF4nZh
	 aubdIgS5KamrbBfSgob7+JWaHFihbzfaFSMqyYmteD/89C9Pz9rHOYjHR18jhpJ42xVQJ
	 astXR4UykjOaZuE8BRUXzT7Kegkt8ImImUT3Zx98PIMG+5fud6y9gFweSjV7Jz9gVU9Lo
	 mjvKkKT9VKerKawTGEWAg90cLePw7KpUA84kAy/dI9+vAsH/Y32YAlZEup1gUw5UHcGE3
	 K0gGlaq1HxRnQfRabGcSAGnFwQF/iMQDuQXK5Rji5yK+1wgS9AB4YNTNBMmT/pmUoiQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839668;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:X-ZohoMailClient;
	bh=uZW8BBGAXcVOrAuBE0st9EwPXj9eDOm+blhYJCGmFjE=;
	b=NRfiswPuvk/RQKE70uZcIY6FNk5gNwa/OxKvhad+2hGut6JRI6u2xsVjPRSDuu5FkN+b
	 jrENKOgQZlvc78EgaM1uPEZUgRIEvDkAdxQUeE0nFAhZpK51IkMZMziOr31Gm5kEOf+de
	 34/mtTQ8P5zKh0tpLsEv5D+N7VCV1h+E9JluulplHRUG2C48Tfgo19K8XHPTTbN45/RbH
	 c6vhsLAxp4QKRwLNJf16mSYPEPzH2ZvEufXb143BNxKDUObsgmTwyUlDWl0n0+oyYQcRc
	 Kxkr9m8ALO/+Jww4AjHeW/cITfHhdEja+W/1w9YMcJEHPxuSXKrFK+THwL8f26LTe5A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ziyao.cc;
	spf=pass smtp.mailfrom=ziyao.cc;
	dkim=pass header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=bTXJ3TUS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.12
Received: from sender6-op-o12.zoho.com (sender6-op-o12.zoho.com [165.173.180.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE00C606A330;
	Mon, 16 Nov 2026 14:34:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE00C606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziyao.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ziyao.cc header.i=@ziyao.cc header.a=rsa-sha256 header.s=zmail header.b=bTXJ3TUS
ARC-Seal: i=1; a=rsa-sha256; t=1794839616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B+H+Ctp40C+rGuq63OYRnQuk1U+dUkC21ttAptj5zuaQ/MU70ZPguO2RelJHt2E8DCA1OAIKTUtuaNU7tvjgSdKZC8COMUSIrIZ0+Yet036sGW4GS61Ihkf1gF1ccjFn7DhstXWACI6Oxw4YUQi098kR8LmnH+8+fmW0VfLWPJ0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794839616; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=uZW8BBGAXcVOrAuBE0st9EwPXj9eDOm+blhYJCGmFjE=; 
	b=AhnL1NkiY0hws2DRdbQj17UzgXeHjQXDssp+QuoyGuooDG+Rcnt1lOrWUCx9euHTj/ubE/Ua8PHOmfEbB6MJjWTCA7dRui5g+JurIKzoyp8MYiROYSKIyUqREIaV9dCEgN4Fkr88enY7hK36uHNyYVYwH76UwntoqEpi4yJoYyM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: a=rsa-sha256; b=bTXJ3TUScD8QGr11vGi+e7CXhAL1R8lfOXxDllh1ZrsYERpjB2JiAiiA30UiJZQ67g8w0B1MzobRzVOI1iWNPC5qOu/7S5A/KjV0Uh0RHoI+C+alPLx56RT1yvgmkbHgc0JcrB4xT4tCVrKeG7cJhGn05rg8DCBASfqoWu8rEn4=; c=relaxed/relaxed; s=zmail; d=ziyao.cc; v=1; bh=uZW8BBGAXcVOrAuBE0st9EwPXj9eDOm+blhYJCGmFjE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794839614784710.0250758152407;
	Mon, 16 Nov 2026 06:33:34 -0800 (PST)
Date: Mon, 16 Nov 2026 14:33:17 +0000
From: Yao Zi <me@ziyao.cc>
To: Magnus Leatti <magnusleatti@kernelriot.com>, me@ziyao.cc,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: stmmac: dwmac-motorcomm: quiesce the
 device at shutdown
Message-ID: <avsTEglKKD_wl_Fi@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
 <20261116091757.1656602-2-magnusleatti@kernelriot.com>
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
In-Reply-To: <20261116091757.1656602-2-magnusleatti@kernelriot.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.637.76
X-ZohoMailClient: External

On Mon, Nov 16, 2026 at 06:17:56AM -0300, Magnus Leatti wrote:
> The driver has no .shutdown hook. At reboot, kexec and power-off the
> MAC and the DMA engine are left running.
> 
> Add a shutdown hook that calls stmmac_suspend(). With Wake-on-LAN off
> it detaches the netdev and stops the DMA, the MAC and the PHY. With
> Wake-on-LAN set it stops the DMA, arms the PMT register and keeps the
> receiver and the PHY up, as it does for suspend. That is not enough to
> wake this chip from S5, so the system still does not wake.
> 
> stmmac_suspend() ends in stmmac_pci_plat_suspend(), which enables PME
> if wakeup is enabled for the device. Disable it again, since nothing
> arms the chip.
> 
> A failed resume leaves the netdev detached with NAPI disabled. Skip the
> hook in that state: stmmac_suspend() must not run a second time.
> 
> Signed-off-by: Magnus Leatti <magnusleatti@kernelriot.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-motorcomm.c | 22 +++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> index 42f0b11a7b60..1e142ad39e33 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-motorcomm.c
> @@ -204,6 +204,27 @@ static int motorcomm_resume(struct device *dev, void *bsp_priv)
>  	return 0;
>  }
>  
> +static void motorcomm_shutdown(struct pci_dev *pdev)
> +{
> +	struct net_device *ndev = dev_get_drvdata(&pdev->dev);
> +
> +	/*
> +	 * A failed resume leaves the netdev detached with NAPI disabled, and
> +	 * stmmac_suspend() must not run on it a second time.
> +	 */
> +	if (!netif_device_present(ndev))
> +		return;
> +
> +	/* Stop the device before reboot, kexec or power-off */
> +	stmmac_suspend(&pdev->dev);

I think this is abusing the API, and all the other changes in this patch
are working around its side effects. So here's my NAK.

We do want to fix the problem though to ensure the device is stopped
upon shutdown, especially iirc, many YT6801 NICs in addon card form are
totally supplied by 3v3aux, thus S5 alone won't reset the NIC reliably.
But this should be done in a cleaner way.

> +	/*
> +	 * stmmac_pci_plat_suspend() enables PME if wakeup is enabled for the
> +	 * device. Nothing arms the chip to wake the system, so undo that.
> +	 */
> +	pci_wake_from_d3(pdev, false);
> +}
> +
>  static struct plat_stmmacenet_data *
>  motorcomm_default_plat_data(struct pci_dev *pdev)
>  {
> @@ -374,6 +395,7 @@ static struct pci_driver dwmac_motorcomm_pci_driver = {
>  	.id_table = dwmac_motorcomm_pci_id_table,
>  	.probe = motorcomm_probe,
>  	.remove = motorcomm_remove,
> +	.shutdown = motorcomm_shutdown,
>  	.driver = {
>  		.pm = &stmmac_simple_pm_ops,
>  	},
> -- 
> 2.56.1
> 

-- 
Thanks,
Yao Zi

Meow-mrrp-mrow, I'm a cat.
