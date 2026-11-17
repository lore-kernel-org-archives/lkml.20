Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879860;
	b=omOTQc95g8Bv/dx70Gv+3M3ME1pKAO0ah00n8dPamPftZSw2QyXKGOJfmo1yVEs8GA04
	 XYVehGZViGoZY34xS6049Ej+HjptPwpw3rLbfdDU1BQEqlJyBTSCEb68r+Dp/zVjBZR3q
	 C5QqJiwhSwXLDCE278A7C9lpQgiSI33Y64hYe6VQIjjDyLa5I2xAMcanFGj3MJGcHo+EY
	 baVIcf+26UBaA6xOeSRCaScRjazdCDB4U781BodXs0snwtAHAIGurFpQRGJUD1rmMAnt1
	 FUrkAabtvP9CQT7eKz2j5cg0IgSKCTIW5rvQqr9whkr8HBXz6d2PLpJI+yOAGODT+7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879860;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=yVWHC5K23Yhcew1l+apNuZkuTR0KSgVD8dUt51rQE2A=;
	b=EZoFFJvxbx6euF2mntGQ09coqwRqFRyEh3T9sSqHYeJ4xIGeBrqelOrkEYtEgy7HWLl1
	 BAWYFbMsVSKT3OuCkWignNAoEbQiMwLeyPLkOH6svFdOU/ZVswQAmm6zjInJddrAcRtzh
	 6CUFrGOrXda5cQOWpnp0AxAYmphuOoTDchK4KCfAwnZ3v8oGrNEK3lnCehR/4IdoNAUSz
	 xly3usl19ehKZFOhPnvx9V0O8MVJ0U0Hoq2BQZh3mTPt7Ms3eVeQoAZ9KbL6gSyxYehOa
	 NzZupWTAGM1D32ElMiYbdTcLHUOJ+dSfyv+smhW4W1RtThknfQNnZ50dnJYCMGRuorQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NNmrYTu8;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69CB606A31C;
	Tue, 17 Nov 2026 01:44:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E69CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=NNmrYTu8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=yVWHC5K23Yhcew1l+apNuZkuTR0KSgVD8dUt51rQE2A=; b=NNmrYTu8x4z5+/iGn/sd0w4VTG
	FxLD3aWGB51FyflhetWzT2mzXSzkq1eO0Dxz0+gyPuaBOddtkQKGZ6u5RC8DWF8bQtsJjklYBAHFO
	87Wt1Ld968TSdq7Q8Emm2LmuvcRuod9MFpB34YH5JGnA+oFTCjufr0QSvBiLPIKij2GQ=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xT8Er-00H31c-44; Tue, 17 Nov 2026 02:44:01 +0100
Date: Tue, 17 Nov 2026 02:44:01 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Selvamani Rajagopal <Selvamani.Rajagopal@onsemi.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Richard Cochran <richardcochran@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Eric Dumazet <edumazet@kernel.org>,
	Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	Jerry Ray <jerry.ray@microchip.com>,
	Ciprian Regus <ciprian.regus@analog.com>
Subject: Re: [PATCH net-next v11 10/14] net: ethernet: onsemi: s2500: Add
 driver support for S2500
Message-ID: <b98d498e-0574-4a6d-913b-739896b0065a@lunn.ch>
References: <20261113-s2500-mac-phy-support-v11-0-7a186141952c@onsemi.com>
 <20261113-s2500-mac-phy-support-v11-10-7a186141952c@onsemi.com>
 <CH0PR02MB7867CE1D45CBC874F8E5FE2E837C2@CH0PR02MB7867.namprd02.prod.outlook.com>
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
In-Reply-To: <CH0PR02MB7867CE1D45CBC874F8E5FE2E837C2@CH0PR02MB7867.namprd02.prod.outlook.com>

On Mon, Nov 16, 2026 at 10:34:22PM +0000, Selvamani Rajagopal wrote:
> Andrew/Paolo,
> 
> I am asking this because I have a concern/question about the state of my submission.
> 
> I realized I messed up the title (empty subject line for the cover letter) of the recent submission. I am wondering if Sashiko review is affected due to this mess up.
> My recent submission: https://patchwork.kernel.org/series/1210784/
> 
> Why I suspect is that I got couple of AI review emails from AI review two days ago. 
> 1) As you could see, not everyone is copied. See immediately below this email.

There are two different bots. The bot you got a reply from is the
general kernel bot. It does odd things with email addresses, and it is
not as good as the netdev specific bot, it has more false positives
etc. Hence we generally ignore it.

The netdev bot will reply to everybody. It is also deliberately
slower, to stop developers throwing patches at it as fast as they can,
without engaging human brain, and burning through other peoples
tokens.

	Andrew
