Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CEAA47A0A6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 09:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789465388; cv=none; b=JlqjPQ8rHu4iwBb0NgABjvX95Jeu+79UM74O0c7/qargvcp2q/Zh8kBn3Kyt4qn6+t9fOsyBD327t6FqxvlpK8K7EoqEjKUqXZxvZxCE48mYUNXHc973eKSNtGQALQhqfGaQJR1Y7YgIaH12zRuE+bJpt8Dz4zt/qHyFY2z3ioY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789465388; c=relaxed/simple;
	bh=VyeplrMBWX9gIbnAWAoJIe4EUJ/Bhml+BvmnrlPRG3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sMp4q2MRJKXPqrV1kkMvibIGvfA0Os9enJ7t9BJlB7646qK9EP48U7Gl1x6fUs0MhqkzDIVifr/9OpbEHCRThX+qgyqNlzWX4S3Fy9eCX9CNxfM9uGiOC9qjv5cekzDxEPoCX0rQ0xxHuU768kHijk6wFqB4afGzfnxSnaLBO3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SuUBSlGz; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SuUBSlGz"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48437356d60so44940f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789465380; x=1790070180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bW+iPkrSzo0otQQoBYJMGRZoMXs1UqJR5g1BDpvaw78=;
        b=SuUBSlGzNbD9/YPIE8c0YdTyuPDV9AzpHH3xD3ZcybXE4aEI/15OHKlZ6DJGv0pyLB
         pjKW0lozwXYZYbtalcxaDmtwNKu/mtU8MIiGoOsdJFtqGTfY9JXXcVkbkQGC7SYM+5C0
         lmICabhQEj9t0e9ax7Q8lkl1KohzBwW27IMiR4/bO0djfic1n7kTbfK7Rmn85xyw0dw/
         xbhVVlK9mwt9T6VX/Ki2VhsZdYktYZO3IVeFRUcZ96D29/1DAjCSM8d83C+wq3oyL6Uk
         91uUUcj36Oo+2angyF6jecY9HGNz+TOtddyz3+U5S+2tULJF7Hk5jfoNDJFofEwH74xu
         +DPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789465380; x=1790070180;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bW+iPkrSzo0otQQoBYJMGRZoMXs1UqJR5g1BDpvaw78=;
        b=os0zcToHYUIUqiITfcodIXIsvFE+cC8REI5wf+DijGRhdP+ARMKpllEzdTDi5vxUFu
         ff/bWNitzcLjFmQFN6mDQxrMyPyGZy3Y/e+X1wEFHIaWjsodr/5T3uwfv2bRDtB/4am9
         /OmTB7kD2VKx/mCSL8Dki3rEZMhAbcCOiFYTrI2wcquR7Au5nO5/8SqwhVRyM/fjGiM3
         krDv+446nR+qcLxjxGHxH7OMmsYFuOLWfsaNqp2DnSkG+8YL1SI3b7ACBfkyOgMvxS8X
         5s0h5TyBw8A8SuQzWJRDGXVvJBeNzGMESnuziiRsn5ICFZF22bSxMbOSTZH0plrz0qGg
         Mk0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwTjY5hfVgTyoLQs2p5GIl3bS4rI+ld3xDtOXTypLvticJGULhPRprL0GM4O213hCJHowLAD9yPk0txgIQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l8wG2T02XORz7eZRXr8YUPpGHh0u5nFfxGBEx9Ows4xi+1PGvE
	idgSzaxS5edpzA7LB3PFfJA09l0pi0XaKUZLOBgh7QlxzfgEYKwX3OTE
X-Gm-Gg: AYBFou2+My7DnQlgXBUENVUmEqRgoYV1+++78DUkvnuNjjUtR/ZiWhOMt7/46WJ+bIK
	7RXlQ5L/uMa1p6Lm9o082zTdo+bO0alQjQ6FGv6InYZGbCFcNaoMPlKB832HwH4znVZaI+PU9BG
	qnm5ksnviuzFvvbqpFh5myY6Loxy8ESyGhfhS23RalTDyNdg0u8V1QzNRdwgndnrk/82uo6zSOQ
	nmFRl15uhfpIk16Z7aP1JKZottkZJr0TQZe1kGSrFY1Onv58L3CeUfUZZ8a41IFznC/hVQaud3Y
	0Auq75M0bTTbEHpoQAomyxgQgYsRPhngizGT6FiOW2i3RdcqvNXaXG300JU1lQ9iXNbfQif+QaU
	4Z1cxLc0z30Efck284rev+RDWh4tUvuZ12+tFnDzexC9VbBWBIxbOIhGEKu8nrPsDp46IMZw6hT
	hbcHkEllHNRyJY+b4FSPgCqFXTNieGeh9iPin3D/TXubBTMZT5mJlB0o8lZAEV7aOAwN1oGZns
X-Received: by 2002:a05:600d:8651:20b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49e82915984mr584455e9.25.1789465379457;
        Tue, 15 Sep 2026 02:42:59 -0700 (PDT)
Received: from mobilestation ([185.195.191.165])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef28e6asm49140045e9.1.2026.09.15.02.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 02:42:59 -0700 (PDT)
Date: Tue, 15 Sep 2026 12:42:55 +0300
From: Joseph Steel <recv.jo@gmail.com>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: "maxime.chevallier@bootlin.com" <maxime.chevallier@bootlin.com>, 
	"andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>, "davem@davemloft.net" <davem@davemloft.net>, 
	"edumazet@google.com" <edumazet@google.com>, "kuba@kernel.org" <kuba@kernel.org>, 
	"pabeni@redhat.com" <pabeni@redhat.com>, "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>, 
	"alexandre.torgue@foss.st.com" <alexandre.torgue@foss.st.com>, "shuah@kernel.org" <shuah@kernel.org>, 
	"joabreu@synopsys.com" <joabreu@synopsys.com>, "yi.fang.gan@intel.com" <yi.fang.gan@intel.com>, 
	"jun.ann.lai@intel.com" <jun.ann.lai@intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net v4 3/7] net: stmmac: Rework S-VLAN handling
Message-ID: <judv4nfaaapgqpykt5lbnne33mojwqcwvipbxc3xuyc46j424h@cxqtyhepnbpu>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
 <20260908164309.59282-4-ovidiu.panait.rb@renesas.com>
 <ybotecadvx2x3ucgqjunv77fuyeaxmwl5tn77fswraztiklrdo@ajhpl4c52hcy>
 <OSCPR01MB12769E621C234C53F33FA88F7D3BA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSCPR01MB12769E621C234C53F33FA88F7D3BA2@OSCPR01MB12769.jpnprd01.prod.outlook.com>

On Tue, Sep 15, 2026 at 09:27:51AM +0000, Ovidiu Panait wrote:
> Hi Joseph,
> 
> > 
> > Hi
> > 
> > On Tue, Sep 08, 2026 at 04:43:05PM +0000, Ovidiu Panait wrote:
> > > The ESVL and DOVLTC bits control S-VLAN tag processing and have
> > > nothing to do with the double VLAN feature, which only provides a way
> > > to process an additional inner VLAN tag. However, the driver code
> > > that handles them always refers to "double VLAN", which is unrelated
> > > and makes the implementation confusing. The driver does not use any
> > > of the inner VLAN tag features, and the networking core does not
> > > support offloads for the inner tag anyway.
> > >
> > > To simplify the logic and to reduce the confusion regarding S-Tag vs
> > > double VLAN handling, drop the is_double logic and add a hw_svlan_en
> > > flag that is set when S-Tag hardware handling is enabled.
> > 
> > I believe I suggested to just change the "double" word to "svlan", and
> > not to drop the respective logic completely. The number of S-VLAN tags
> > added/removed must be still counted, otherwise any subsequent VLAN
> > S-Tag removal will disable S-VLAN processing even if there are S-Tags
> > left added.
> > 
> 
> While working on this I realized we don't actually need to toggle the
> S-VLAN bits on/off whenever a S-VLAN tag is added/removed. We can just
> keep them always set as long as the NETIF_F_HW_VLAN_STAG_RX or
> NETIF_F_HW_VLAN_STAG_FILTER features are advertised.
> 
> This simplified the S-VLAN logic quite a bit, by getting rid of the counting.

and reduces the system security by permitting the packets that
otherwise would be filtered out by the controller if there is no any
S-VLAN tags added. So no. The counting logic here is quite
appropriate(-ish).

-Joseph

> 
> Ovidiu
> 
> > -Joseph
> > 
> > >
> 
