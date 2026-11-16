Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794837044;
	b=b2ZxqJBHihb+RYDrjak73sEHE9uJPwqWhXSHVozp/AxdJ81si818KT/wkXj/w8nZZaFk
	 dxCWOqPLegYPcy1q+aifJddCPrRiA7Ssc0yt7VXh0GcJ3MwAjpENG5P9uSSeK7lx9GT0G
	 ALOWb/aEokvez4A0BRLU9dSX9GHOuFFvNBobN6I5kmco1oE1e37MEWdQfnu7tHH6OdKrf
	 wMDP9xbz6Qu/SJxPTOAbOtwaNdixUiDA+peRUlf+/Mj2AC8c/nZL1P/41Bp0MDLMz2maZ
	 uXCq4IFckHcnarGhZh4FMjyl2hvRF6FVedvxi4zv41JUY3Y4sX9ISq0V4GCydeEA4GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794837044;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=uRFviz/P/Rq31yiMk9CbEywo6qCv0MBbNeVhyjXUEeM=;
	b=tCzMNwwpbB2F88yDSdhFPKV9ldJXHUfd7kRHpknwbukGZHMsvxrOQKdRhecmO0b5m37c
	 y+O8FmMMsl7VFC3qK7o37p+jWJ8JQXOwy+fYcdUL6/pa4sEP1NZtT1dp1X1ABmoGOlLeT
	 ++vQ5YaEqyyiSwXbP61HiMg9OQVTlG3GPrXeU+t3fw0jKCY4JjgTJcUBNKFmirWCHKiM+
	 JqXlnenjf/PET6lY0S58623fAelfoBNqRZbZVO40HKG24ezgRfdPh46WE2PJK5o6PHkB1
	 u4Gy/i0Ap9x9ujT0BPlHjtDTW4UVe4vEWALnBzZcBSRmL5Q2v1jA4otgnjriplOfejw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XklXBhHB;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982A8606A89E;
	Mon, 16 Nov 2026 13:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XklXBhHB
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FD401F000C4;
	Mon, 16 Nov 2026 13:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794837044;
	bh=uRFviz/P/Rq31yiMk9CbEywo6qCv0MBbNeVhyjXUEeM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=XklXBhHB2Zhcr/rhwELX6ANHrSIQiAUjM3hsXTcuXS78BX0GsX5Nc3GQKg6ouJg4h
	 5Xe5AxYy7B2iZ8XEnDVM5FLtF5QAl1vuZVR5Z6Z7Ut7EQ+bkobwhkTEsIl1eWGTLfO
	 /0sKmKTGNG1f782mkYs6oSFr6KvdLDTxUx0Mf4oFkztwrOAcMdtF60wlYR4WfevxZN
	 nT4AhuK0Ftq7sRMIRSDnDoLECtUMgEauq9M/K6vysmZ6tI7Z1CEY6MTNExoMrEaave
	 EWiGE1smQF5x+Z94JNw7Zytvqg+UY7Nm5j6qudNb382jwJEvMFr9SKSjKTzm6d4uNi
	 q/aDBFxugDwow==
Subject:
 Re: [PATCH net v2 04/12] net: au1000: report MDIO transaction timeouts
From: netdev-bot+sashiko@kernel.org
To: f.fainelli@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, hkallweit1@gmail.com,
 linux@armlinux.org.uk, shaojijie@huawei.com, horms@kernel.org,
 runyu.xiao@seu.edu.cn, mmyangfl@gmail.com, hvr@gnu.org, jeff@garzik.org,
 danny.kukawka@bisect.de, mugunthanvnm@ti.com, sebastian.hesselbarth@gmail.com,
 linux-kernel@vger.kernel.org, manuel.lauss@gmail.com
Date: Mon, 16 Nov 2026 13:50:42 +0000
Message-ID: <179483704272.3136.4869685253432664524@kernel.org>
In-Reply-To: <20261112045301.3669532-5-f.fainelli@gmail.com>
References: <20261112045301.3669532-5-f.fainelli@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The patch adds a second timeout exit to au1000_mdio_write()
  (drivers/net/ethernet/amd/au1000_eth.c), and both exits log the same…

--

net: au1000: report MDIO transaction timeouts

This commit makes au1000_mdio_write() return -ETIMEDOUT instead of
reporting success when the MII controller stays busy. It also adds a
readl_poll_timeout() check after the write so that a failed final
transaction is reported to phylib. The read path now returns -ETIMEDOUT
instead of -1.

> diff --git a/drivers/net/ethernet/amd/au1000_eth.c b/drivers/net/ethernet/amd/au1000_eth.c
> index 7063f9e5bc7c0..6b2e216a83618 100644
> --- a/drivers/net/ethernet/amd/au1000_eth.c
> +++ b/drivers/net/ethernet/amd/au1000_eth.c

[ ... ]

> @@ -292,26 +293,27 @@ static int au1000_mdio_read(struct net_device *dev, int phy_addr, int reg)

[ ... ]

>  	while (readl(mii_control_reg) & MAC_MII_BUSY) {
>  		mdelay(1);
>  		if (--timedout == 0) {
>  			netdev_err(dev, "mdio_write busy timeout!!\n");
> -			return;
> +			return -ETIMEDOUT;
>  		}
>  	}
>  
> @@ -320,6 +322,13 @@ static void au1000_mdio_write(struct net_device *dev, int phy_addr,
>  
>  	writel(value, mii_data_reg);
>  	writel(mii_control, mii_control_reg);
> +
> +	ret = readl_poll_timeout(mii_control_reg, mii_control,
> +				 !(mii_control & MAC_MII_BUSY), 20, 20000);
> +	if (ret)
> +		netdev_err(dev, "mdio_write busy timeout!!\n");

[Severity: Low]
This isn't a bug, but could this message use different wording from the
one in the busy wait loop above?

Both timeout paths in au1000_mdio_write() now print "mdio_write busy
timeout!!". The first one fires before anything is written to the
registers. The new one fires after writel() has already started the
transaction, so the PHY register may or may not have been changed. From
dmesg there is no way to tell which of the two happened.

au1000_mdio_read() already uses two separate messages ("read_MII busy
timeout!!" and "mdio_read busy timeout!!"). Something like "mdio_write
completion timeout" here would separate the two write cases the same way.

> +
> +	return ret;
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261112045301.3669532-1-f.fainelli%40gmail.com
