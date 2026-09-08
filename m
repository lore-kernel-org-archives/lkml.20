Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55342D24B7
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 15:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788880775; cv=none; b=oXBelCp8mxw1vHFcM2eNwsBuHaKF/YjRxtIjMZ97oyHGOKsxdkvCq2pstIQgWbOY8Pt5FsQ1Kej1zjM1XE3hDu0HZxaIjNJ8hzJVpN7k8mJ6qprRpmnKEzlsDgNnECgMBimlPui77kQ/ErvfvQdufS1tsMIad98Yogvc/OyY1V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788880775; c=relaxed/simple;
	bh=2E2paIhVSecgEqjIXBb7PZzzAn2OOgH65j7qNTEeMiY=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KN61SXBMeRU8SWhYVRnnHWyfFrEOqTybDqeJzDYGnQDgAwO/JJSMXrJEYwCrOFP88R6ElcwY95MAwelM204/uTaKGQsW74qEpm2iBqfFDm/ln0gYEv7d2u6ROxz4rLJHTqkmRU18Z4GDL6laAOmasYLp/u3B5yyLa6qIRiR4O9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CFBxOYKB; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CFBxOYKB"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8706dfdcd4fso59566287b3.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788880761; x=1789485561; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QhdCOmP4zDl1C4qG/vDZ2J5jFE+DMqbe+H/tbxij/K4=;
        b=CFBxOYKB3iRfvLbButzgKpzs1fOoQywfEeAYQVEyRRu0uRJHy9btNUKKy6vQ/FYDlf
         KY0X7JPm+TPmkMLm4oXmTnri693RhMPrR+MSsie4WAgAzLJFtcMZDR645ARELlf/eONu
         b1LQbzBGi6u7leRHYiZ0Mi03+3C7Hl66lYz9s785Dzu9oY1HWjaDlhkD72A6cZT7bs7o
         m7vF/XYi6N13hl8kkbL4m/R2/bKZ/szzUFGIFPXWDHA25l33JiiaDHCLkn2zT6oIYTBn
         DdepwaZ50w2KKo33Enz1rdxsF6J1VJULQol2YAhDOzoIQkjPKq8QfOr5xDCnET0ENzst
         MwWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788880761; x=1789485561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QhdCOmP4zDl1C4qG/vDZ2J5jFE+DMqbe+H/tbxij/K4=;
        b=oqBewOIaBe75+g3q1NrsLdHJTBxrDtSujOykkJlfEuO7DVzT5gQ65rSqC6uHokRF1N
         HQhjrjK6Jaqw1jbx8vNZPT+lgYm1/IIYpiaP2M563oO5QNjc+vOlWhGNip0VUC/hWsRh
         RXPkdfSZZu6/Jw66Pd+cr1Cs+avl/nl2dkf+QEwBQb1LLFri9apuJlUAsBbPx4RcV7vL
         RJojgpsJeIyS0gTwHtWEJcLsGozlSHFyChp+oV8jwwbkZZy8YndDuqEKz7ejup6L+/BN
         0KR/9RU67hrY8JhA/kNTicyQwq8VyxIJc/PuQpWCVktqNvDxcrw5kkKyMw5WWEpfHxG/
         Bc5g==
X-Forwarded-Encrypted: i=1; AKwUvBwVSKgudP+P5wU7XgUwbffCMdPxhtj1j23pd9VxOah20f6yeUe8EVKuEWFOU3kVdK5hKWKal1TE2KBt4YA=@vger.kernel.org
X-Gm-Message-State: AFuF++mtCUeh+8XID3hsbIu9aLkFxStNxiViNBCI5+bGrxiX1XzyXXDY
	hLWe9wiisVaWJAbo/P3qjCcOXbAXkwIPyh4FyEiHBGkZPz3D2SPQ/06W
X-Gm-Gg: AYBFou0N9NB2CstKzAn+vH5jG1dPYEVutsJ1Y1IM8CZOnbsQ83bZa1FukrEllxmFIl/
	60taMQvTZhKV2gf+zlTbUNfPW+SpXPQS04oASlHF1YogbFYHc3xApGniY3gqdbYq3I3bzFkcs1p
	72hInaWxNy6Re3TGe1R+yt5ET3AeUEeB1HmXdMr51xmDo6XJdbKP8Zs6fvb6VD5rg2i+l4GunyH
	c80SbmppI5C33Py5/ZDIqqX8Um1EuPqD6oSmgQWrpIuTYoF1kEBUonAFB7qIAbR4CVZOR0Iaq9d
	RDk3BKJolvIjZCNWOp9I7lkqe3/FOtUKqKUlTmPJCABHF5Q8ioCittbqcgMu2MkcRSyKAsycfd3
	6Lo/Havd80yZb3WUpB1BGcl3JyhFf8c6c4eoDibPRiGlL5/VM8nbQK16/P3dZYr95U29A/n3JZO
	5emZx5yQxnEtoZacRFpjNFlTVh2Zeg19lE8FSpkDgC1c3czmnTb21BEisx0NzkjoDgwsBz1k8E8
	Fv4FrRi0b4VZxsMGw==
X-Received: by 2002:a05:690e:4893:10b0:66f:c6b0:e10b with SMTP id 956f58d0204a3-670f63fcd8fmr2064936d50.68.1788880760843;
        Tue, 08 Sep 2026 08:19:20 -0700 (PDT)
Received: from localhost (c-73-105-0-191.hsd1.fl.comcast.net. [73.105.0.191])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-670febedc44sm1035024d50.11.2026.09.08.08.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:19:19 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Tue, 8 Sep 2026 11:19:19 -0400
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yury Norov <yury.norov@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Raju Rangoju <Raju.Rangoju@amd.com>,
	Prashanth Kumar K R <PrashanthKumar.K.R@amd.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jian Shen <shenjian15@huawei.com>,
	Jijie Shao <shaojijie@huawei.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	intel-wired-lan@lists.osuosl.org, linux-usb@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH 7/9] net: phy: use linkmode operation return values in
 phy_device.c
Message-ID: <aqAnd1gpXne2lqCT@yury>
References: <20260907215439.409858-1-ynorov@nvidia.com>
 <20260907215439.409858-8-ynorov@nvidia.com>
 <67ed1522-cec8-4137-85df-ffbae654e07c@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67ed1522-cec8-4137-85df-ffbae654e07c@lunn.ch>

On Tue, Sep 08, 2026 at 03:52:09PM +0200, Andrew Lunn wrote:
> > -	linkmode_and(sfp_support, port->supported, caps->link_modes);
> > -	if (linkmode_empty(sfp_support)) {
> > +	if (!linkmode_and(sfp_support, port->supported, caps->link_modes)) {
> >  		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");
> 
> From a readability perspective, i like linkmode_empty(). It is more
> obvious than !linkmode_and().

OK, a function returning 2 values is not something obvious in C. What
about this?

        
	sfp_supported = linkmode_and(sfp_support, port->supported, caps->link_modes);
        if (!sfp_supported)
		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted, no common linkmode\n");

> None of this code is in the hot path. So we should put readability
> above performance. 
> 
> >  	/* Some PHYs may advertise, by default, not support EEE modes. So,
> >  	 * we need to clean them. In addition remove all disabled EEE modes.
> >  	 */
> > -	linkmode_and(phydev->advertising_eee, phydev->supported_eee,
> > -		     phydev->advertising_eee);
> > -	linkmode_andnot(phydev->advertising_eee, phydev->advertising_eee,
> > -			phydev->eee_disabled_modes);
> > -
> >  	/* There is no "enabled" flag. If PHY is advertising, assume it is
> >  	 * kind of enabled.
> >  	 */
> > -	phydev->eee_cfg.eee_enabled = !linkmode_empty(phydev->advertising_eee);
> > +	phydev->eee_cfg.eee_enabled =
> > +		linkmode_and_andnot(phydev->advertising_eee,
> > +				    phydev->advertising_eee,
> > +				    phydev->supported_eee,
> > +				    phydev->eee_disabled_modes);
> 
> So, which is more readable, the original or this?

The new version is more readable to me. What about this:
        
        eee_advertised = linkmode_and_andnot(phydev->advertising_eee,
	                                     phydev->advertising_eee,
                                             phydev->supported_eee,
		                             phydev->eee_disabled_modes);

  	/* There is no "enabled" flag. If PHY is advertising, assume it is
  	 * kind of enabled.
  	 */
	phydev->eee_cfg.eee_enabled = eee_advertised;

Thanks,
Yury
