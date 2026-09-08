Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D2554857C
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 14:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788878461; cv=none; b=lj+IIwSpAECzmZwFryPiCPPGzsLqQ++3yo2FdQJx7399x2wdyhQCG8ZBM0uuzolHf411hIoxGap0cr+wVf/qBl+wFj3b58W6loi7mCZlic4XHK3ZNl+nTgHiXLomwuN3OPAVRQA6QTkGGTZU6KCng4+d7ts67Ez/xLQdyhHk3/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788878461; c=relaxed/simple;
	bh=5cup85Qb2q3dpZ9j4NJ+riAqKzhV1ATVnwyRINFCU4Y=;
	h=Message-ID:Date:From:To:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jWcs4hR50bTIPN2e+WIBRd4OYaGwMmga/OEg2WMxNiLYj9Y7P9Sy+Z9k3g1cRcN6yO/sxnNo+ri/AUsGvh2x1FtGAPxQ//Iglxbo0X0FhiKn2srZy3kBkK/QBREy+dfHk5okCDc9uFjIWmTQRAylzuWLYfQJu9T72qdsT61b1Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCNsePWP; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCNsePWP"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-482ea739de2so3221384f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 07:40:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788878449; x=1789483249; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Miv8sjNJdTG6Gu0+wUlQ27sQKF6CmSEymk2ANPK2DPg=;
        b=NCNsePWPXgamXF5gE4I3+PMEkTLFk+CMHkSX+Y6c/fky3QE9NjQkeZCz2HIM7CcR3N
         h+oTpBpH60cySSKTMUG030QaKEw73BFKARvuS/VRF70SRsnEuP/JdlTBKj4mI+TthW4s
         U3oGATfgegngzuY92haEsHeG3VxR2oP51lbevojyhBOWxgisEfApusaLEl3gxDoo7PrO
         1FFOAksWQOpIp4Ne5on8E5NH5qjBwFgmFFZ/uzMTPT9LaSSu+TNLYeFKtypkUlUNPGRo
         /pSXaaqben506bSbbdIZpeosm5j8GvkOGE/oZQZBMbyMm/ize14mfMpGm6OlqgVlL1xi
         PAWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788878449; x=1789483249;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Miv8sjNJdTG6Gu0+wUlQ27sQKF6CmSEymk2ANPK2DPg=;
        b=qyy+m9ap+1XqSpb8SB8D6mPzqojLqHciPFRkh8MRTw3TbcoO+K6DQxWrifX57wdxG7
         QWM8LZnINxJZppafipw4dddlsDkZD58KRYJXMVF3sdgw49+qd57Do7/RZauFHxU3oRLe
         lUICtKsSgVRYRO/zhNcyOaGipQxpNuyG42xAqssB7N5VaZaQcvZrUkHx6eUZ0RVW45um
         jALFTDfT810UrZX2RUbNJalBvaeksaMriFOfU0H/l/YIFmc/6Ltmy1alAdm6C6rqKcfR
         4bWa6A81t7CKx0IznRt+zONj5frCauxqyqEvdMlqyBEAA9LBkaQ5x9yN/6zLR/Vl9Rqu
         amaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRJziTjlCwgcLVJUwdMT66Gn7OeD0fG8E9JwVLFdazV6fYzkBNI/yPcrqyMdMNTX4LXp/hfSxOBK+oPbE=@vger.kernel.org
X-Gm-Message-State: AFuF++mQAEwdQBOpoL4THenWF0jur/yQz22ImQs6xiIpkMr4qr4BKRbY
	HWWYrMxmskR4eHQIAUpLQrtvQNTJKnF/jbX3leBN+xheikq7sQNjpTxw
X-Gm-Gg: AYBFou0mfinU35Bea7zOYr6JrvIQ3rOovywnvUqW2iJgdd7EZh2vjfwqwcgSsj/cKfZ
	3p73l/XYXsfERVAn2L/9GraCaGDycsDSqq8MXcBYJNiWYhNagDPJxaCOW9yIXNILCfE8yenLUkw
	gTj/8xrU6fKzDG4B21hE5qs2DO/YuySveD1ea4UsICkNk8QyO9cZSSuhBqCIuQ1ckY18o3YRCe4
	0kh9rqyRqR9rqYpBom9oMsgAT2n1/6LAJK8hsCOcrtKC7F6xLwX2dhQSdiW02zBwlN3yf9vLxhz
	qVb8vri+Km3n/5291ZcwC0OXGi5ErhnOdwkWsOBh7APO/Fzup0C+mbbJ77OUc6rtBUQf/g1vjXP
	oCa3IT8l1gb4WNrJBdwAVZO1g69CPhedAXxDI/gk8YF+1wxShG+z1c0TV8w2PgIlnCcedNufyZ4
	7RziHf7qnO17bygepHiie1BPk7PFGAEjb3jCYY5sOHb/iTyv9PtH3IPybFqRWFOszKN6SvrMV9a
	2sGPKDWk2EXPnH+BV5LZW1fAmRA+TWs2vyj
X-Received: by 2002:a05:6000:46c2:b0:484:4769:18a4 with SMTP id ffacd0b85a97d-485872cd677mr23543135f8f.14.1788878449028;
        Tue, 08 Sep 2026 07:40:49 -0700 (PDT)
Received: from Ansuel-XPS. (host-79-26-252-140.retail.telecomitalia.it. [79.26.252.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883959f0sm39338196f8f.10.2026.09.08.07.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:40:48 -0700 (PDT)
Message-ID: <6aa01e70.ebbd881c.32bd35.196e@mx.google.com>
X-Google-Original-Message-ID: <aqAebOgm5w4VILoS@Ansuel-XPS.>
Date: Tue, 8 Sep 2026 16:40:44 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v15 00/12] net: pcs: Introduce support for
 fwnode PCS
References: <20260901083001.8044-1-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901083001.8044-1-ansuelsmth@gmail.com>

On Tue, Sep 01, 2026 at 10:29:15AM +0200, Christian Marangi wrote:
> This series introduce a most awaited feature that is correctly
> provide PCS with fwnode without having to use specific export symbol
> and additional handling of PCS in phylink.
> 
> At times there were 2 different implementation (this and the one
> from Sean) but Sean agreed that this can be picked and used in favor
> of his implementation as long as his case with race condition is
> correctly handled.
> 
> ---
> First the PCS fwnode:
> 
> The concept is to implement a producer-consumer API similar to other
> subsystem like clock or PHY.
> 
> That seems to be the best solution to the problem as PCS driver needs
> to be detached from phylink and implement a simple way to provide a
> PCS while maintaining support for probe defer or driver removal.
> 
> To keep the implementation simple, the PCS driver devs needs some
> collaboration to correctly implement this. This is O.K. as helper
> to correctly implement this are provided hence it's really a matter
> of following a pattern to correct follow removal of a PCS driver.
> 
> A PCS provider have to implement and call fwnode_pcs_add_provider() in
> probe function and define an xlate function to define how the PCS
> should be provided based on the requested interface and phandle spec
> defined in fwnode (based on the #pcs-cells)
> 
> fwnode_pcs_get() is provided to provide a specific PCS declared in
> fwnode at index.
> 
> A simple xlate function is provided for simple single PCS
> implementation, fwnode_pcs_simple_xlate.
> 
> A PCS provider on driver removal must call fwnode_pcs_del_provider()
> to delete itself as a provider.
> 
> ---
> Second PCS handling in phylink:
> 
> We have the PCS problem for the only reason that in initial
> implementation, we permitted way too much flexibility to MAC driver
> and things started to deviate. At times we couldn't think SoC
> would start to put PCS outside the MAC hence it was OK to assume
> they would live in the same driver. With the introduction of
> 10g in more consumer devices, we are observing a rapid growth
> of this pattern with multiple PCS external to MAC.
> 
> To put a stop on this, the only solution is to give back to phylink
> control on PCS handling and enforce more robust supported interface
> definition from both MAC and PCS side.
> 
> It's suggested to read patch 0003 of this series for more info, here
> a brief explaination of the idea:
> 
> This series introduce handling of PCS in phylink and try to deprecate
> .mac_select_pcs.
> 
> Phylink now might contain a linked list of available PCS and
> those will be used for PCS selection on phylink_major_config.
> 
> MAC driver needs to define pcs_interfaces mask in phylink_config
> for every interface that needs a dedicated PCS.
> 
> These PCS needs to be provided to phylink at phylink_create time
> by setting the .fill_available_pcs and .num_possible_pcs in phylink_config.
> Helpers to parse PCS from fwnode are provided
> fwnode_phylink_pcs_count() that will return the count of PCS entries
> described in the firmware node and fwnode_phylink_pcs_parse() that will
> fill a preallocated array of PCS pointer with the actual available PCS
> (ignoring the one that still needs to be probed).
> 
> phylink_create() will fill the internal PCS list with the passed
> array of PCS. phylink_major_config and other user of .mac_select_pcs
> are adapted to make use of this new PCS list.
> 
> The supported interface value is also moved internally to phylink
> struct. This is to handle late removal and addition of PCS.
> (the bonus effect to this is giving phylink a clear idea of what
> is actually supported by the MAC and his constraint with PCS)
> 
> The supported interface mask in phylink is done by OR the
> supported_interfaces in phylink_config with every PCS in PCS list.
> 
> PCS removal is supported by forcing a mac_config, refresh the
> supported interfaces and run a phy_resolve().
> 
> PCS late addition is supported by introducing a global notifier
> for PCS provider. If a phylink have the pcs_interfaces mask not
> zero, it's registered to this notifier.
> 
> PCS provider will emit a global PCS add event to signal any
> interface that a new PCS might be available.
> 
> The function will then check if the PCS is related to the MAC
> fwnode and add it accordingly.
> 
> A user for this new implementation is provided as an Airoha PCS
> driver. This was also tested downstream with the IPQ95xx QCOM SoC
> and with the help of Daniel also on the various Mediatek MT7988
> SoC with both SFP cage implementation and DSA attached.
> 
> Lots of tests were done with driver unbind/bind and with interface
> up/down also by adding print to make sure major_config_fail gets
> correctly triggered and reset once the PCS comes back.
> 
> The dedicated commits have longer description on the implementation
> so it's suggested to also check there for additional info.
> 
> It's worth to mention that OpenWrt is currently using this on
> Mediatek SoC and QCOM ipq807x/ipq60xx/ipq50xx and Airoha are
> already ported in staging tree for testing.
> 

Any news of this? I feel this version is now very mature and wonder if an
human review is possible or any feedback of any needed change to make any
progress?

-- 
	Ansuel
