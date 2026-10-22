Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792693945;
	b=ALlIU5PXJR6Ckdkyo2GoKG/cM5rmIaw0UneqdXJTn/P9ON7+BksIHdBrQebJ9VhQyKIu
	 mHDszcx6qt12QNDb6ke+IWe7+Z5cp9hLZ2YX2PN6JJaKEmdjERq09tetNn0MC8ARW7f0D
	 JiITCaO4o0rc0L3Vc4NHLUf2EDV+fZ8ke5jxbX/88/nUwDXaa13Df8wYXA5WhBRFPcHPx
	 dQQtMlFGak7eHa8MN7tYqy+Vi8Inl0kwovzNNDHbQAg5JFKk21L30Apy69stDlmliz1JC
	 oZpjn3YTwAjqU6dsLBrgnmkWegDBBl6qWCtB64ENz3c49V+1hPceptUr69cOYwCk2DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792693945;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DQi+ERJyD3sfh40jg8gA/Z3Y+m7AgqIVEp/8MzWx99M=;
	b=JBDBIcQTABr3aQBAvFLK49cDS+2E7uA2XODyGUcp9AHpfCoXizH5gaXILiCGnYoCQYoG
	 WWpcRN2uCrBQO1ba53pAWhv2E8MEwShMCjxwwPKR6VSjCTeG5rixndagvWEqoVXOAxOHm
	 /rYa8Sna1E7YHGp8FL+SZI9JIF+DbpvzuFrqTBzs9hK42jKKvkfn1YgGDtNVtGWfHKZW6
	 W2QVw2OBja8yu0uXmTBBSC1wAsAzvXPRAaSHqtW4C2FtK1bLRBkl8T9GEW1HcBqZ85U/n
	 HpZmeWWNonX9BRjkLJv03Yj5drmfQPL/bHpuNwE2J2cMtQ61XQoXbazeDYLOpk5SzMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0pqLAYXn;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37227606B7CF;
	Thu, 22 Oct 2026 18:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37227606B7CF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=0pqLAYXn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DQi+ERJyD3sfh40jg8gA/Z3Y+m7AgqIVEp/8MzWx99M=; b=0pqLAYXnkRPf5E9yN6b/T630PE
	IsTiYko2hx2nYIdLW4S4dY00KtvqwrvYtgQeidcq/xpbIkoLn357EMe5adW/J7N2QACE1XubeY1sm
	wNWP4pfgM6661puT2UTBcPqBOw5Hzo3YeBTpPjCKQQF2DnBKX8pl7s5C3kG1N8uW5AGc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xJxaI-00CJMm-GV; Thu, 22 Oct 2026 20:32:14 +0200
Date: Thu, 22 Oct 2026 20:32:14 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: David Heidelberg <david@ixit.cz>
Cc: Coia Prant <coiaprant@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Lin <shawn.lin@rock-chips.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 3/3] arm64: dts: rockchip: rk3568-photonicat: enable
 SGMII LAN port
Message-ID: <5db14c14-2386-41cf-8b66-ba248d49fd20@lunn.ch>
References: <20261022025844.150320-1-coiaprant@gmail.com>
 <20261022025844.150320-4-coiaprant@gmail.com>
 <e7f68299-1c0d-4b0f-948b-4835086c0df8@lunn.ch>
 <fbd174d9-261d-4fed-b26e-2990de7af2d0@ixit.cz>
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
In-Reply-To: <fbd174d9-261d-4fed-b26e-2990de7af2d0@ixit.cz>

On Thu, Oct 22, 2026 at 07:13:06PM +0200, David Heidelberg wrote:
> On 22/10/2026 18:58, Andrew Lunn wrote:
> > > +	sgmii_phy: ethernet-phy@3 {
> > > +		compatible = "ethernet-phy-ieee802.3-c22";
> > > +		reg = <0x3>;
> > > +		max-speed = <1000>;
> > 
> > Pointless. SGMII cannot do faster, so there is no need to limit it.
> 
> device-tree is a description. whatever the device can do should be there,
> 
> "Maximum PHY supported speed in Mbits / seconds." thus 1000 is correct value.
> 
> thus max-speed <1000>; LGTM

I did not say it was wrong. I said it was pointless. The PHY will
report what it can support, which will be speeds up to 1G for an SGMII
PHY. The max-speed property will then be applied, and does nothing,
making it pointless.

max-speed is interesting when you have an odd design, like only 2 of
the 4 pairs are actually connect to the RJ-45 socket, limiting the
media to 100Mbps. Using max-speed in this situation will remove the 1G
speeds from the supported list, and so it will not try to negotiate
such a link, which will probably be successful, but then data transfer
will fail. If the PHY supports downshift, it will then drop to
100Mbps, but it can be confusing because everything says it should be
doing 1G, but in practice it does 100MBs, or nothing.

      Andrew
