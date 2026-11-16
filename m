Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855550;
	b=5dgqBejXMgybbQK7p7CwfJJ7mPv0FBf7XeQ0m0FLKezn0Dk214WMGB1A6dtIJtBXslQt
	 FyQXiBErcWfxa0MsFpcMJ0aGv4J599dU/6Iy6GqQSiafF77ZVKmuYNgl8XNWfnzP1mw7A
	 V+nCje+YGlcv13sK7SZrQTJcLJSK4tC+EUI9rw5EREwdETsRBJ+INN5Ks2NljqzMVYwvC
	 nZjsKvrvl9rAoFZx3The8LyF/XuAF/useI8sVYmpntKQQukpZ14abXUxKxKMlPWnZzUWh
	 RE7FCu9Iri7LZohoNs94NYZsvT3icw5nWqIWYAzWnF8xKpm4neTLj9+CbZdorp6M6Ew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855550;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=OKuapl7pxJVZ9ih+JjiApVj2U7or+RT35W4g1hlcqf4=;
	b=gNev/t58sktR6dfr9t8zcYxtG47dqKhwBqIas5SXytV6Ir1c5R8+tw64eI1CwFzdKcdB
	 3VoHhKfdHWvodulUB03jGuZI5GTcpwk2otiL938m+DVlLmkr0iFv/xFNFh0QNW24q+UnG
	 qz1bbiq4ZoEFxMPiWrDQQ93DVJru6MahHotdPuNVyKqxKKZtllw0lV6BJ2qTtgeW8jAyT
	 9ye59JQlFCVNAnaQzZMbYEFCslkCOpqeEtllpQd2u8XQH1bTaSSpbvSjrWjm9ZqC6At3A
	 2ncyHnvthc3wiB6TQPSksYaYl48szuiSW1Nh8Vt0jaNMdjGOkH/zVbIwvdYi27YLewQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aazqUdLt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D34A606A89E;
	Mon, 16 Nov 2026 18:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aazqUdLt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3021C1F000C9;
	Mon, 16 Nov 2026 18:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794855549;
	bh=OKuapl7pxJVZ9ih+JjiApVj2U7or+RT35W4g1hlcqf4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aazqUdLtYeeamJwl1hwJYAF96pgNZdf29ZdAH5YIP0MGUjVRx2E2PYVPS4ZirF9bj
	 ZVPGFwVY9QVLhIpgRpQPZILtqVOeyRf2vTuf4VJeN3gUoFYfs6J5ikmIp3DQvqndtJ
	 FlrcazoE9bRylOGIVzpC2vV2QjNV5Lsk75Kua+ml2tzjKFqZl+RsmWvIyG6B0pFlC2
	 8j9jqQ5FQPU2/FSBgfFhxt2BtySd9GcVwWfttaUyf3s5EI5f4AK+SGy1oemDqlD3VL
	 NEKRiGWvHqxvl5ZSjS/TApYUQ1adEtkRopl6/nmPerI/b+TUrtJkxPJHya1rk+XHFQ
	 OghLHd5UQpxWQ==
Subject: Re: [PATCH net-next v2] net: phy: et1011c: don't write an error code
 to the config register
From: netdev-bot+sashiko@kernel.org
To: elias.pukari@gmail.com
Cc: netdev@vger.kernel.org, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 18:59:08 +0000
Message-ID: <179485554872.3136.2853572906945647083@kernel.org>
In-Reply-To: <20261115180735.649299-1-elias.pukari@gmail.com>
References: <20261115180735.649299-1-elias.pukari@gmail.com>
X-sashiko-severity: Medium
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] net: phy: et1011c: premature speed update in
  et1011c_read_status()

--

> diff --git a/drivers/net/phy/et1011c.c b/drivers/net/phy/et1011c.c
> --- a/drivers/net/phy/et1011c.c
> +++ b/drivers/net/phy/et1011c.c
> @@ -62,16 +62,22 @@ static int et1011c_read_status(struct phy_device *phydev)
>  {
>  	static int speed;
>  	int ret;
> -	u32 val;
> +	int val;
>  
>  	ret = genphy_read_status(phydev);
>  
>  	if (speed != phydev->speed) {
>  		speed = phydev->speed;
>  		val = phy_read(phydev, ET1011C_STATUS_REG);
> +		if (val < 0)
> +			return val;
> +
>  		if ((val & ET1011C_SPEED_MASK) ==
>  					ET1011C_GIGABIT_SPEED) {
>  			val = phy_read(phydev, ET1011C_CONFIG_REG);
> +			if (val < 0)
> +				return val;
> +
>  			val &= ~ET1011C_TX_FIFO_MASK;
>  			phy_write(phydev, ET1011C_CONFIG_REG, val |
>  					  ET1011C_GMII_INTERFACE |
>
>

[Severity: Medium]
With the new early returns, et1011c_read_status() updates the static
speed cache to phydev->speed before either phy_read() is attempted.

Suppose the read of ET1011C_STATUS_REG or ET1011C_CONFIG_REG fails
while the link comes up at 1000Mbps. We return the error without
programming ET1011C_CONFIG_REG, but speed already equals
phydev->speed. On the next poll the speed != phydev->speed test is
false, so the block is skipped. ET1011C_GMII_INTERFACE,
ET1011C_SYS_CLK_EN and ET1011C_TX_FIFO_DEPTH_16 are then never applied
for that gigabit link.

The error path in _phy_state_machine() does not help either. Entering
PHY_ERROR clears phydev->link but leaves phydev->speed alone, so a link
that comes back at the same speed will not retrigger the write.

Could speed be updated only after the reads (and ideally the
phy_write()) have succeeded, so that a transient MDIO error is retried
on the next poll? Or is there a reason the cache has to be set before
the register accesses?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261115180735.649299-1-elias.pukari%40gmail.com
