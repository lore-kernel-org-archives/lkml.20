Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794836024;
	b=Lh6TA9s6KmQ0o/juXIvR1YRx44nHOkxi7QULTo9NDtjuRtqBV9CdkumSY9Wyy5TzIdP7
	 fgMAtSgVszs7oKjepvyw9gmj+tomFr9r9xtLVst6Mgvcz8LGjN8vDYpLLPIO1sUzEOjVB
	 Gq3ynp7AbwfAMSCabcLZHBAJfapvDAGFJoq8BGp+V0lgnFXtiA+ebgf/bILkEfA5xeki7
	 xRpCVsB4m4cvyvfQgXKo8l7G7ALa5Jclz4gVyXwcL8RH4d2E4eHgtaORmNnCIK+92xZ8k
	 zhU07+y3Cbv2o6zG8hGgDAHjgIyYfYk59GqF1q0RPiiAV9RjlZDcl2yHM21IEZNr2IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794836024;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=ZcnyPhcxTot59tf8PtMshG+n/kse4h0RgXHi4ivebCE=;
	b=QWseSN2BSY7aPAcp6Vc3i5Nb/NwRgxH5uPwcCQ3hBHxzzm41a5U+aafL/8vQ699yJlfB
	 LowC8voi2oMdvhP1F8yMXYNbWL6WlqR+ObFSgp3YhwjyCS63TQo1nhCiVaHjPCagxymbC
	 2eQrAPnKwBNeXvg8su7PamMsYCr5M3q/V6cCmFl4/aTg5DE01oLvbEwbf84tY5uDpLmrZ
	 tFQW60UUpR1a3RNCpMEyZpoUVJll+yC3Z1c6/YK7cCDx3/3az6DhH5MG7niRRqwUu0x8e
	 +/vZ1TZ4O+9H4Gy7YH+7oP5cyOgki6pyjHW4W8+yY2JK40+HklvbUg/Tb8oKxN0vBdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KebFq6MZ;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6537606A31C;
	Mon, 16 Nov 2026 13:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6537606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=KebFq6MZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ZcnyPhcxTot59tf8PtMshG+n/kse4h0RgXHi4ivebCE=; b=KebFq6MZDIdqXgPnkqgqxItwl7
	+SStrWsRRX0f3smxm2UBOd5cGeTHBCccWJDz5Bcbag9+nYgSjRW9fZru8YQkeKTDEgwThV8kUvvlp
	77V9z2e69mn2RFBKSgXO806dbzGZbS9WOvQBBl8XB+HIJetAfJhJbf2IAJPTsmSSYIsI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xSwq0-00GvCH-1e; Mon, 16 Nov 2026 14:33:36 +0100
Date: Mon, 16 Nov 2026 14:33:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Hongmei Xu <hongmei.xu@oss.qualcomm.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
Subject: Re: [PATCH net-next v4] net: phy: aquantia: Poll global status
 register for provision ID
Message-ID: <c7467c7c-a8eb-4a23-a1a4-20d6ae6dc7d0@lunn.ch>
References: <20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a@oss.qualcomm.com>
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
In-Reply-To: <20261116-aquantia-poll-global-status-register-v4-1-1b44fe85db5a@oss.qualcomm.com>

On Mon, Nov 16, 2026 at 07:14:50PM +0800, Hongmei Xu wrote:
> According to the AQR113 PHY databook, after firmware reset, a 20ms
> timer needs to be engaged to allow the supplies to settle prior to
> allowing the PHY to boot. The working flow is:
>   -After the 20 ms timer has completed, hardware state machines
>    designed to guarantee PLL and band-gap stability engage.
>   -After the PLLs and band-gap are locked and functioning properly,
>    the processor and digital circuitry are released from reset.
>   -The PHY image is then loaded through MDIO boot-load and the
>    processor boots.
>   -After the processor boots, any provisioned register values are
>    set, and the PHY enters the provisioned operating state.
> 
> Starting subsequent firmware operations before the provision ID is
> valid leads to steady link failures; this has been observed during
> AQR113 PHY bring-up.
> 
> Poll VEND1_GLOBAL_RSVD_STAT1 on AQR113/AQR113C until the provision
> ID field is non-zero before returning from aqr_wait_reset_complete().
> A timeout indicates a hardware-level provisioning failure that
> software cannot remediate; the warning is logged to flag the hardware
> problem, but probe is not failed since a timeout does not necessarily
> prevent link establishment.
> 
> Co-developed-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
> Signed-off-by: Sagar Cheluvegowda <sagar.cheluvegowda@oss.qualcomm.com>
> Signed-off-by: Hongmei Xu <hongmei.xu@oss.qualcomm.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
