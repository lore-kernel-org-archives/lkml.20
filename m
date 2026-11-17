Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903217;
	b=IuF5B8GDXx3Ne6q8lxBPOvd4fasLXMU8HPOalHHOkw3JTGzMBgZ7JVvn6MFH+ELn368V
	 erEJ2yY9s2uQQmir6Fub2bCBxrN3tKfwtKLrxDa9u1i4nDTyE/o6rhPhrFf0EPlz75bIU
	 YBQ0886OKyRoXMCHimCuoL05oLewrgX6rQI4BaGQCGV/nMEBHZ/r58HxSbaFSuq8HN2Sj
	 H1e6LxWyRNy++iqJUKpKFQetSiw0fBeJ/rHaQeVE56cG+m1m6IcQaDrhiGACHFcmq0njE
	 go/tDLfmgUpM0kuq1VgXwaIWuIhGNxq41ip03LMX6IWOW3TgEeAPlmr5dV8XrYvQyUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903217;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=3O6S7yO4SQJHxOcv2++oGhLkkx0cIpw5t3Ed/1hH8U4=;
	b=e3GdzfVUdWZLHVw3AjXsoPEjNJHF/tw/v2Rc9NFkAZ3jr2Phlj/PAWLeryYR9LLVcI7w
	 ofTnqywqXgCD+nZ2h07PvAOGWromcyo8UH1xIXExW2tuBXlwyPD2PWW6CtUiriu+fM9Wc
	 jo1k4WwBN7APLEpwuS/Lafp+77aO+1wF9bzUihRBfTDL2Zhk3WHSczXjlvFwnuKodk2hG
	 IRy71a+tLYK/22FwqowI+Q/GMi9m1BHEKCcOFjbqWs4tycC9fAf2EPPszFYHaAWwU8FtT
	 VbMzIpUmPsJh9yocgwGHozEoSdDocLXshmslT67P9D5xnqWv4d8Ig6HCLTg0Rc4WXHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANkW0hyQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D6A2606A31C;
	Tue, 17 Nov 2026 08:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ANkW0hyQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6F0A1F000C4;
	Tue, 17 Nov 2026 08:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903216;
	bh=3O6S7yO4SQJHxOcv2++oGhLkkx0cIpw5t3Ed/1hH8U4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ANkW0hyQxMDE36CgnUWo7ZifITT+NGNfdL5+Iv2W28jTFWKh0ltv549rzmQaop0Ys
	 aMbHp3snSOH22SlS4BIxv6PysQ5Qw8THqbXEQRcRAS1PL8b3FybPwHRXYEwDSrGVr9
	 j/YhYwyeex47SsE0mkSWjWBwBKRVnQpOSjhoBCf6y7G31aMemRzTUAuofSsoFlxnzM
	 2mEVh5JJrsWI0N+fiQd1O0aTtj8ZNLG5EX+Ar6JnP644Pyt/usW4pl+EGe2s2rSUHp
	 G+5OfysEvToubt8D5uIomoIRF8b+SYZYMSU3lZdMnuRhAiW0UB53QDtWkzbIaRdDzx
	 D6bZ3xHjihFxQ==
Subject: Re: [PATCH net-next] net: stmmac: dwmac-sun8i: Defer probe when the
 EPHY clock is not ready
From: netdev-bot+sashiko@kernel.org
To: aiyengar1990@gmail.com
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, clabbe.montjoie@gmail.com,
 netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Tue, 17 Nov 2026 08:13:35 +0000
Message-ID: <179490321548.3136.12535368591168637116@kernel.org>
In-Reply-To: <20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com>
References: <20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe@gmail.com>
X-sashiko-severity: High
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The patch makes get_ephy_nodes() in
  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c return -EPROBE_DEFER…

--

net: stmmac: dwmac-sun8i: Defer probe when the EPHY clock is not ready

With this patch, get_ephy_nodes() returns -EPROBE_DEFER when of_clk_get()
on the internal PHY node returns -EPROBE_DEFER. Before, it skipped the
node and the probe ended with -ENODEV. Other clock errors still skip the
node.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 2ece7ba9dd73b..8163e49fa7ad0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -801,8 +801,13 @@ static int get_ephy_nodes(struct stmmac_priv *priv)
>  		struct clk *ephy_clk;
>  
>  		ephy_clk = of_clk_get(iphynode, 0);
> -		if (IS_ERR(ephy_clk))
> +		if (IS_ERR(ephy_clk)) {
> +			if (PTR_ERR(ephy_clk) == -EPROBE_DEFER) {
> +				of_node_put(mdio_internal);
> +				return -EPROBE_DEFER;
> +			}
>  			continue;
> +		}
>  		gmac->rst_ephy = of_reset_control_get_exclusive(iphynode, NULL);
>  		if (IS_ERR(gmac->rst_ephy)) {
>  			ret = PTR_ERR(gmac->rst_ephy);

[Severity: High]
Does this deferral come too late in the probe?

The only caller of get_ephy_nodes() is sun8i_dwmac_probe(), and it calls
it after stmmac_pltfr_probe() has already run:

sun8i_dwmac_probe()
  stmmac_pltfr_probe()
    sun8i_dwmac_init()          (plat->init, enables the phy regulator)
    __stmmac_dvr_probe()
      deasserts the stmmac reset
      stmmac_mdio_register(ndev)
      register_netdev(ndev)
  pm_runtime_get_sync()
  get_ephy_nodes()
    return -EPROBE_DEFER
  goto dwmac_remove
    stmmac_pltfr_remove()
    sun8i_dwmac_unset_syscon()

So when the new -EPROBE_DEFER is returned, the MDIO bus and an ethN
netdev already exist as children of the platform device.

Documentation/driver-api/driver-model/driver.rst says to defer as early
as possible, and it also says:

  -EPROBE_DEFER must not be returned if probe() has already created
  child devices, even if those child devices are removed again
  in a cleanup path.

The commit message describes an EPHY clock provider that probes later.
In that case, wouldn't every deferred probe retry do all of the
following?

  - power up the phy regulator
  - toggle the MAC reset
  - register and unregister the MDIO bus and an ethN interface that
    userspace can see
  - rewrite the syscon EMAC clock register

driver_probe_device() also re-triggers deferred probing if
deferred_trigger_count changes during a probe:

drivers/base/dd.c:driver_probe_device() {
    ...
	if (trigger_count != atomic_read(&deferred_trigger_count) &&
	    !defer_all_probes)
		driver_deferred_probe_trigger();
    ...
}

If another device binds during any attempt, this starts another full
cycle. That can become the endless .probe() loop the documentation warns
about.

get_ephy_nodes() only uses priv->device->of_node and the sunxi_priv_data.
None of the mdio-mux lookup, of_clk_get() or
of_reset_control_get_exclusive() on the iphy node needs the MAC to be up.
The "mux must be registered after parent MDIO" comment only seems to
constrain sun8i_dwmac_register_mdio_mux().

Could the EPHY clock and reset lookup move into sun8i_dwmac_probe(),
before stmmac_pltfr_probe()?

The commit message uses the existing reset lookup deferral as precedent.
That path returns -EPROBE_DEFER from the same late point. Would moving the
lookup earlier fix both cases, instead of adding a second late deferral?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261113-b4-sun8i-emac-ephy-defer-v1-1-12a8591702fe%40gmail.com
