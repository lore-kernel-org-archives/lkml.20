Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757522;
	b=JLSi3UeeuH2cwV9bsXzuuMxxFGR5dnTLgHh4/nUxHu+XNfUXQpSzQUR/S6LaUNmrEMWn
	 PeOHxIHWp7DtLMYC06HSK6hdNmAp9D86GlkeG3kqEgc/BeR51IuJ3X4fk/NrE1JD7ryl/
	 2Fv7XdC30oSggBfnoY40s/OvLpQtnqMI6bq6BOc4Gut4AtuLwFM61R6WHweJ1LKeMSTR/
	 4gGzdqA2DaVzNtAbVsSuPSdGmrgZK54wchJdepWYZ4wbUTh61IFLoBhhdxoMMQKPrf2gG
	 aSqchUWG4ILNzaxMOkAtlzuYejF9OHg1LOaig2WxuxHezLFwB3EjI48NqamapxKkGtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757522;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=bBM/s+aQjFTftPHguTWbXGM/kzewEVvTrYdHEpzwFkA=;
	b=UbWd/ou3VTGXwMjKlY+LlHal5yyFBZwt0zkf4po7XOjyzN9WvaAJ3Sg6zsoSTy6FbCnK
	 Z6pcpgWqZFlI/AAs/qjaCh+3hILQPLL59JIuhXUmvqzhbDlLhWlBgMPXk2bksfWM3dtnR
	 AzzAEOg1RQq2StmioTxcyc3BanNkeVmOAk69vEiwE4tHpeamP7GBvlISUeu2LWlok0so8
	 XlekFSeN/wHukx7KBCHvOMEF9+eQJEdNHKWdqC+BRBoT8dY7+Gwqhf7FE4+Dbzfo/v+dR
	 UIpwwnxIcUPA500XY7RTsxLyAYSTKUL63NT0Ep6LMAq3LNDzKB3cTpd3H6hjngdQPqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=HvjuzU1j;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AFFD606A31A;
	Sun, 15 Nov 2026 15:45:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1AFFD606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=HvjuzU1j
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bBM/s+aQjFTftPHguTWbXGM/kzewEVvTrYdHEpzwFkA=; b=HvjuzU1jedJ5B5vLEaIu0J/wVS
	76PsIUbnDHa2n4G6cHNOSMvki+f7NTOeoxqTE4v+qDX0Vgff6UROCVykOSA5Wou/p6KVxRrfDgXYn
	26Hu+1B9a5UeZEh9nzXh2BwuQNUFmeOqInYoq6NP+0JyixCIyxpNEAzMtCw2U+ibxY4c=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xScPp-00GdU7-Oh; Sun, 15 Nov 2026 16:45:13 +0100
Date: Sun, 15 Nov 2026 16:45:13 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: netdev-bot+sashiko@kernel.org
Cc: hongmei.xu@oss.qualcomm.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, sagar.cheluvegowda@oss.qualcomm.com
Subject: Re: [PATCH net-next v2] net: phy: aquantia: Poll global status
 register for provision ID
Message-ID: <461d4b43-e9b4-4adc-8a98-066b60885758@lunn.ch>
References: <20261111-aquantia-poll-global-status-register-v2-1-b602fc7e80a9@oss.qualcomm.com>
 <179473078423.2199510.11398825136938509686@kernel.org>
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
In-Reply-To: <179473078423.2199510.11398825136938509686@kernel.org>

> > +	if (val < 0)
> > +		phydev_warn(phydev, "Failed to read VEND1_GLOBAL_RSVD_STAT1: %pe\n",
> > +			    ERR_PTR(val));
> > +	else if (ret)
> > +		phydev_warn(phydev, "Firmware provisioning ID not ready; "
> > +			    "interface mode detection may be incorrect\n");
> 
> [Severity: Medium]
> If phy_read_mmd() fails while polling VEND1_GLOBAL_RSVD_STAT1, the
> val < 0 term ends read_poll_timeout() right away with ret == 0. The
> code then logs a warning and returns 0, so the MDIO error is lost.

This is one of the earliest reads from the device. If the MDIO bus is
going to fail, it will fail here, rather than later. So the error
handling should be correct. Please address this issue.

	 Andrew
