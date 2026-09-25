Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2406D282F21
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 12:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338720; cv=none; b=Jk2nQO4SkFkWOC7DzxMogsoo8oWMhEdJ2imJGLeF9EH8CVdFom+9biQXu9MYEwUgDtJ3Fy2m0vVfoMll++qKdrFibTT+I6yCkRKlGJCXpTV4zAmeyd6Rqm/HIeOxmD3Gs5GRri79BC9JCwBQJ5/iOnJlU/JgqaL9QBSbIVCROiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338720; c=relaxed/simple;
	bh=w5Zl/EPNvC/XBW3ei7KCzh1t/4jW9CoaI4l+1Mti42E=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G01fFbOPu49sHbULsGxS8KDPwLhKOpVqzyqdTv8igt41u53h6W2Ehwi0dato5vTQkIrHrDyGohtIdv5ANbou2hvkNbbhiYb2aMgBZDdfqdq5ktOEK2aHjXhAey9ojZEG4sEBcKOeNovG1NuIJXVLpcsx0K4F6vHxZIcBePcEoGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OmCyWXoL; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmCyWXoL"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d822dso6068885e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 05:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790338717; x=1790943517; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pT/KmnLSIMqs/Cj4fywS3jj8PSkfoHHHPLTRKemb7E8=;
        b=OmCyWXoLA1DgDsDmPZauassFvnrOe/3gltaIPwqSH9hpbuhsX4V2WAwMHnXzSE05Rz
         hpBp4EhlFrNeW+3zKND0is8PoREcOEqun/J9C0mtzeekQpuzS3E2mkJKFUal9sJaqAog
         +SeXsKUspbDfDSALbwDkRk4x3tSxQf46SMcU3kD8WhMIolF4N1YMOLy9F8khhm+MmWv7
         twx/RyN3Eimqu6J68OANGUXS36ILkTmWYXGVPi17o9+gJQCVkAgBCliEa9prDdCDx0Iy
         zA0LOWJKik5Kdgx4Tn8vF8RVxRGFHTYebq2/u+W0QgzuXFAKmeUeRMPpCThcAdPRBIzY
         zvKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790338717; x=1790943517;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pT/KmnLSIMqs/Cj4fywS3jj8PSkfoHHHPLTRKemb7E8=;
        b=1wQS/QP9IuU1sTkGHrGgDUUwf943OrayC4O8MFXPg1A6auDkSeOzXOKvExkFIDtSnC
         4FiZGqeHUvWYmrNJ2NgFwl2G2zMdoaHeOFKp2TeoSlyrl9U8mfTBHhZJ5aKg6fZ0PYwg
         ACiROsZ75wsN/Y6ehkAo7uAvt55mMgK2rSXS6/vettylZH5sMpxlcRTdB13QPLJ9G1cH
         +pWkq8X2NYmj0LiFUP3fdytro3DHvfQRaPN5ky7oBkHOk77YlROClakHM4HeWJAGuEcC
         zdItSU9iFkK1aiSmW8Cq3fQjCHtCvOaQbo8UH97mPqjpVxuEFw2rFXBklcvNeyJfhZoT
         o1FA==
X-Forwarded-Encrypted: i=1; AKwUvBxgBGTPYfW9jz3YZc1+4fhG3m3MmodSEkE9uUTehn+TonR0h7lbb64q238AVBYWyS3IepDA0aLD7Fozuhw=@vger.kernel.org
X-Gm-Message-State: AFuF++nTaa03JxgkdJbLNq6TehIZyahP4DNmg/eCQ/JDAmtlJZCHYV/X
	wUBtPOI6rCt4+XbA5M8PmrLwqptf6LgEx8TcqA6HbbW9p9QCtdxT4dFS
X-Gm-Gg: AYBFou0hgYQ8cDpiPqSels8VVlVQFW+tWpxyc4GuBx2NF/XIMeHT1HDP2/TemPkH9WB
	cSH3hurh5FgemKuRF8LL5eKfUfa8bQY1DVeuKW6IaL5Izm0GYYaVWZwolFz13rL34APAbtq1JoS
	yQYU8CaIB44tzn+xtP+limmCN1WJ+SstVmJ6n5FafwXZqzN8KDK+q/uaXHWx7EimxolvFd4Xrul
	lsN47WxgnrqdddaDn+rtsM/xxEokol6+5+Q0ImOK8tBG1x8sale+W340g1BRxNmkBgS3l7jwef4
	udkHKnq7ZhXqF2tQSbsCSPlYAg7esXSU7TlfR9GZgCSXiV03oWoZGQ2jvkrp1vO+n1eM0vbQjmg
	TyCafO4V7mB4Z+YqIdupcfkctCyGezd4WcdboPYEVhYfBQZ+r9amGFmcGI8Ap7Hh9K4OrkkUMGO
	Fymz5bREEUBmz8J1lvbg3IgFW5XZFPNp79LVjIV6D45Sw/e6uy54/Tx20Ve32TXagMzX8EMZXh4
	lkn6H3IlSO7PJ3t5N11tE22VH70IjqC1xkZBfCabVB8OgQ=
X-Received: by 2002:a05:600c:c494:b0:49c:fa21:1c81 with SMTP id 5b1f17b1804b1-49fe7bab979mr84434895e9.22.1790338716731;
        Fri, 25 Sep 2026 05:18:36 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-29-83-136.business.telecomitalia.it. [79.29.83.136])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fee915f3dsm57440585e9.1.2026.09.25.05.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:18:36 -0700 (PDT)
Message-ID: <6ab6669c.232cdbff.15fa39.f0d3@mx.google.com>
X-Google-Original-Message-ID: <arZmmhkSyvse_YVK@Ansuel-XPS.>
Date: Fri, 25 Sep 2026 14:18:34 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [RFC PATCH net-next v2] net: pcs: airoha: add support for Airoha
 AN7583 SoC
References: <20260925072712.23419-1-ansuelsmth@gmail.com>
 <12d6e310-3aa9-45f1-925e-e3c8f2f0efad@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12d6e310-3aa9-45f1-925e-e3c8f2f0efad@lunn.ch>

On Fri, Sep 25, 2026 at 02:07:52PM +0200, Andrew Lunn wrote:
> > +static void an7583_pcs_setup_scu_pcie(struct airoha_pcs_priv *priv,
> > +				      int index, phy_interface_t interface)
> > +{
> > +	u32 xsi_sel;
> > +
> > +	if (priv->phy)
> > +		return;
> > +
> > +	switch (interface) {
> > +	case PHY_INTERFACE_MODE_USXGMII:
> > +	case PHY_INTERFACE_MODE_10GBASER:
> > +	default:
> > +		xsi_sel = AIROHA_SCU_PCIE_XSI1_USXGMII;
> > +	}
> > +
> > +	regmap_update_bits(priv->scu, AIROHA_SCU_SSTR,
> > +			   AIROHA_SCU_PCIE_XSI1_SEL,
> > +			   xsi_sel);
> 
> I suspect the AI will be here soon. xsi_sel is initially a random
> stack value. IF interface is something else, you use that random value
> with regmap_update_bits().
>

Doesn't default address that case? Anyway PCS for PCIe here is quite
special...

It does support 2500BASE-X or 10G/USXGMII, but 2500base-x is handled by the
USB serdes and 10g is handled by the PCIe serdes and this is internally
handled by the SCU reg.

This is modelled by the presence of the PHY in DT.
- no PHY -> 10g
- PHY -> 2500base-x and configuration done by the USB PHY
 
> >  static const struct of_device_id airoha_pcs_of_table[] = {
> >  	{ .compatible = "airoha,an7581-pcs-eth", .data = &an7581_pcs_eth },
> >  	{ .compatible = "airoha,an7581-pcs-pon", .data = &an7581_pcs_pon },
> >  	{ .compatible = "airoha,an7581-pcs-pcie", .data = &an7581_pcs_pcie },
> >  	{ .compatible = "airoha,an7581-pcs-usb", .data = &an7581_pcs_usb },
> > +	{ .compatible = "airoha,an7583-pcs-eth", .data = &an7583_pcs_eth },
> > +	{ .compatible = "airoha,an7583-pcs-pon", .data = &an7583_pcs_pon },
> > +	{ .compatible = "airoha,an7583-pcs-pcie", .data = &an7583_pcs_pcie },
> > +	{ .compatible = "airoha,an7583-pcs-usb", .data = &an7583_pcs_usb },
> 
> Device tree binding update to list these new compatibles?

Yes since the AN7581 is still to be merged, I just posted the driver for
reference for anyone that is currently using AN7583 and the updated schema
will come when it will go out of RFC.

> 
> 	Andrew

-- 
	Ansuel
