Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C1FF3655FC;
	Tue,  1 Sep 2026 03:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788232143; cv=none; b=PGFw00BsqkqhlIcYUAnGcr7lXc0RJZcfrVQggxJi7hqRB1QdRaEhk1j85kMbauLb+ZZj8baRFVG6o/cLnLsAcColmpUqaKdI11H3uHBaTyyA+mr2CbsMTn41a7Lrprlmwp+/nLK9Q7ILg+bf1aaJxk/dsEtwBFBgliy8ENg+vbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788232143; c=relaxed/simple;
	bh=RtRYHZ6r1GttNgmugfx2hiMKiJTZBjNGcVqKd1T20ho=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HWsa4KoVOcCkmzYJlsL2uT2jkvUh5uMVvqKxoXcUuYB5GfUz/7kWMccQ4jZwgZmXPFwKxyS25Bn/MAZr0dKFVb3aMBNWb1HzmYIRZiYMoIKs1HnAVJnXRgHucrCbeTRxvE7+EzvKhs/BhX3wlrrU+nOeLq1GdWCQsED3+IxfPu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=eJBOYtck; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="eJBOYtck"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=bIDSWWJL1/ZyKjvyzV3U4YRE3sZdN82loB/qsAbNygo=; b=eJBOYtckzCo9aPCCE8FmIKImVq
	jvBOo1tgpkOED8vrSiPmue7K9O0ir3t3gZro0lLzAl9144TJdd3sVgVVfmr9hBkCN9Ktg16aAiM1V
	WW9FBMZq5iBptrBkXvQRC9ylhC6xntR9Ce630gBn+vf181HUOYjsNtiUXa0n2j/a+FvA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1x1Ero-002IIS-6C; Tue, 01 Sep 2026 05:08:56 +0200
Date: Tue, 1 Sep 2026 05:08:56 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: add Wake-on-LAN gpio key
Message-ID: <e1087196-fcfa-4c1f-96da-ef76a3e03a11@lunn.ch>
References: <20260901025311.955936-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901025311.955936-1-rosenp@gmail.com>

On Mon, Aug 31, 2026 at 07:53:11PM -0700, Rosen Penev wrote:
> Add a gpio-keys node exposing Wake-On-LAN on its gpio0 18 input,
> allowing the board to be woken from suspend.

Could you explain this some more. Why a GPIO key? The MAC needs to
know if the PHY can wake the system, in order to offload the WoL to
the PHY.

    Andrew
