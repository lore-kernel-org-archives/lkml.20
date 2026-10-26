Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793050948;
	b=1+uEuseaK2ZNQD82Dx9aJ7/2HVVN6lidivuSN4NYmpn6FBAmcGOOcsm9cW1ESk7VUEMx
	 K5AxnW1fKAiSebXhdXsUKRXSW62D05JVJHR6V2uwSu0biKE4WXLWRLahnUh69VkArcKnO
	 UM+gRoN6gZ2PDVDFQWdREaRejNtUM++MddawJn+fvDLJAmAN8rY5vtBS/BrVoCCAuQybM
	 4J4e/1+G2JhTvLN1qRCUw68UOIN4TYEI9LsCQ9cyOmsqRBryKYMQ3zRUoZUuD4ZR9Hsyl
	 lowkGGS6Mtjw569wX84y9rq3Eff0rJa2r0e8/SOxNcNnsYlGJ1FBYhIry7WA0D6wM4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793050948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4yu040Elw6X2wPumyGofOPyyze9mD0Pqe3Njj6wRzb8=;
	b=oFKjCZ6G5zra1L5dMJqzEgMIO23v2K2UDnwZ+ZsErd/BWeQ1bMYu8hvhkGe8G5bfU9iJ
	 NDRLWHIyHsPNpOIb5j2StUi4RIac4WwYJKOQcWXr0iV/mR2SX7mtsJBzJ1bWWCHa1BuFE
	 SxERtrD5UdnPrHdyxMuvKN9t11Tjvl95sH95vH3VwncMRelopwlGtmLj79U4IHAIVYaEA
	 xgQqeCeTj+VBDGi9olR2U1TyXnlwFgw6qZw686eBpNG9PQ8U11FJDo+ubUvP6itUbWXVr
	 Gbg/JjmPd5y+/Z/9n383MjnV1xbmedE2gtZU/N5XuQKuzMoOTqx0QTvW8L9EXKB1kZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSBEc9ww;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF8B606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 21:42:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DF8B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lSBEc9ww
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c2fc03880so4272846d6.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 14:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793050946; x=1793655746; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4yu040Elw6X2wPumyGofOPyyze9mD0Pqe3Njj6wRzb8=;
        b=lSBEc9wwVEWPqL4LnnGUvr57vTrGs9BV+zHnfEQagiu7bwhMwY8kQzBnsAiYwJVZuz
         JhZKF3477d8IsyvX6pD7iMJGROZAnlyKbl3B7tvhPp3Mumo8yAKO1x0FCty4EEFtDpjW
         uiP66R/d7YNGGP/kYklWYQzuQVN2+6K5VC9Y8N2gmXiQwJM2oI0v2niRwNqsDi4AixWL
         JDRxLgX1pf6Rr6U/FXDLfhepybMaXKqB4ItG5TO2YZtNbcg9YDAAGmATx2eTggHoEgEG
         rKgamjQoTpq9c1qmQeoNvMAX+Zu4B89LHXWS1x0bp+kJKB1w8FGvWxdtNCQD6xp1mQGu
         mhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793050946; x=1793655746;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4yu040Elw6X2wPumyGofOPyyze9mD0Pqe3Njj6wRzb8=;
        b=Yakx6dKjgoTcXe+NMAx+8hmOGTX6nGa6ww5p4dq3ts+MoFFQhSQhbUS05M2OmqBkYR
         wvjSwYUSdCc61CSeJljc0tHNYeM80rJFFpDADccyaf4jHTKCYFAkCqlM14jAwaOLuiz2
         ayIInZn4keIsNlemAnqjAgArp5u3CgybFIVbmQ4BAK7PdvIwfj8A6fpO7m3k5GG/wuHm
         1IYsaCu1UQNEVCHswLhBj8Pb1AJpz4edZCrQQtRyz7KNXL6BOsYmAX5iZHB75kX5wx5I
         0n5ZGQXyskwY443b/x1gPRBy9DtQ+IgVIEQWFdhC1/rPo00wjJ7gohSNSMnucjXroNAE
         wt7g==
X-Forwarded-Encrypted: i=1; AKwUvBzelPa41YzeTkYq3owXACcD9qxCV9siyJEZ8ssV2/fepLatpHtkg2+5Gs7pLB677PfdmAas10/qErZQ4DY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJH2642FapSl+MzYLXxYMS+wvCE/E0XvYn/UC1518HaPLe8mQlo
	URBu0kJ7Z6WZYQcCYQ5f5kvBGpRqub8tHnelirC72tA8jBUv6lRgk2PU
X-Gm-Gg: AYBFou2pFJZCKR95C6VljzFmFADH+nK+L3WimU2JGh78v04Agfi1Gfysfo5X6yysuRd
	nOEOeV/+/gBKTpa15oNryaLPpOlGVpk5NkeX+vOlxBoJSPp6upLTEQxWfD+NE8Bl6vQMUSL7X1s
	ZUWfcva2vfiR25jGOusmop2zb989+2Sq2gCMMOnzchDjuVZdCri2YBHwsPgisg4+HIaB69EX7/I
	LOevLRHU9vHxOeCW5aGndGWiCkMwsnJeVeh34wIT2Nerw7HMAxwEFt/A8slslbgGqhQN6tu5EkG
	P/MizoVPe+w8h9e5RP7CaV2huZQLZPf/X8RsVv0yv/ETFZkQNB67/y9VJ0xW9GpATgXewngSGZa
	blSvwKOuKXz2SS3T0yEAJlcSgIrzPVDyTEi6h1LlV8LRUpBCTFqYwwOVYS++O+x/S0uz+kmMKyh
	XZgTiJy8dhKkIxJdOPG40wkhF0w1ESOw+Otb/IkXpxruY78WsgiWk27RDpnNKfK+jqyot0hiaCi
	UmUsB8ignOrgF/du0BxOLgVRvKxe83Gl/CAx5tGPDWgZm8h4AtZhcEu4abMDL8iL7oZXJIjeXN9
	hbm/6A4=
X-Received: by 2002:a05:622a:ea16:20b0:536:97a3:be28 with SMTP id d75a77b69052e-53e3867c798mr13807821cf.0.1793050946114;
        Mon, 26 Oct 2026 14:42:26 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53bec3a256dsm39846191cf.22.2026.10.26.14.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 14:42:24 -0700 (PDT)
Message-ID: <ac06b9e4-4edb-417a-9fba-e3f2d3cb3ee0@gmail.com>
Date: Mon, 26 Oct 2026 14:42:22 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] net: dsa: b53: restore the NSP IMP port 2 Gbps
 mode
To: netdev-bot+sashiko@kernel.org, florian.fainelli@broadcom.com
Cc: netdev@vger.kernel.org, jonas.gorski@gmail.com, andrew@lunn.ch,
 olteanv@gmail.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, rafal@milecki.pl,
 bcm-kernel-feedback-list@broadcom.com, arnd@arndb.de,
 linux-kernel@vger.kernel.org
References: <20261022211104.2091128-3-florian.fainelli@broadcom.com>
 <179304989018.3134.16623099883424149741@kernel.org>
Content-Language: en-US, fr-FR
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <179304989018.3134.16623099883424149741@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/26/26 14:24, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential
> issue(s) to consider.
> 
> Critical: 0 · High: 0 · Medium: 2 (1) · Low: 3
> 
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
> 
> - [Medium] The patch never programs the 2 Gbps mode on BCM5301x CPU ports
>    other than the IMP port.
> - [Medium] The fix leaves out BCM583XX (Cygnus/Omega), which the Fixes:
>    commit broke in the same way.
> - [Low] Concern that b53_phylink_get_caps() advertises only
>    MAC_10|MAC_100|MAC_1000 (b53_common.c:1563-1573), while…
> - [Low] The comment in b53_phylink_mac_link_up() (b53_common.c:1666)
>    reads "Force flow control on BCM5301x and NSP CPU ports", but the…
> - [Low] b53_regs.h documents PORT_OVERRIDE_SPEED_2000M (line 103) and
>    GMII_PO_SPEED_2000M (line 149) as "BCM5301X only, requires setting…
> 
> Pre-existing issues:
> - [Medium] This problem wasn't introduced by this patch, but
>    b53_force_port_config() mishandles non-IMP ports on is5301x()/is58xx()…
> 
> --
> 
> net: dsa: b53: restore the NSP IMP port 2 Gbps mode
> 
> For fixed-link CPU ports on BCM5301x and BCM58XX (Northstar Plus)
> switches, this commit makes b53_phylink_mac_link_up() force speed 2000
> along with tx and rx pause. The goal is to restore the IMP port 2 Gbps
> mode that b6a8a5477fe9 started clearing, because clearing it left the
> switch and AMAC ends of the internal link at different speeds.
> 
>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>> index 0880310c9ce3f..1f4964c28fc57 100644
>> --- a/drivers/net/dsa/b53/b53_common.c
>> +++ b/drivers/net/dsa/b53/b53_common.c
>> @@ -1663,9 +1663,13 @@ static void b53_phylink_mac_link_up(struct phylink_config *config,
>>   	}
>>   
>>   	if (mode == MLO_AN_FIXED) {
>> -		/* Force flow control on BCM5301x's CPU port */
>> -		if (is5301x(dev) && dsa_is_cpu_port(ds, port))
>> -			tx_pause = rx_pause = true;
>> +		/* Force flow control on BCM5301x and NSP CPU ports */
> 
> [Severity: Low]
> This isn't a bug, but the comment only mentions flow control. The block
> below it also forces speed = 2000.
> 
> The comment also says CPU ports, but the commit message describes the
> 2 Gbps mode as a property of the IMP port.
> 
> Could the comment mention the speed override and say which port it is
> meant for?
> 
>> +		if ((is5301x(dev) || dev->chip_id == BCM58XX_DEVICE_ID) &&
> 
> [Severity: Medium]
> Should BCM583XX_DEVICE_ID be covered here too?
> 
> The clear added by b6a8a5477fe9 applies to every is58xx() chip:
> 
> drivers/net/dsa/b53/b53_common.c:b53_force_port_config() {
>      ...
> 	if (is5301x(dev) || is58xx(dev))
> 		reg &= ~PORT_OVERRIDE_SPEED_2000M;
>      ...
> }
> 
> is58xx() includes BCM583XX_DEVICE_ID, but the restore here only matches
> BCM58XX_DEVICE_ID.
> 
> Cygnus appears to have the same topology as NSP. In bcm-cygnus.dtsi, the
> brcm,bcm11360-srab switch (BCM583XX_DEVICE_ID) uses IMP port@8 as the CPU
> port. That port has a 1000 full-duplex fixed-link to eth0, a brcm,amac
> with no phy-handle.
> 
> For that AMAC, bgmac-platform.c uses bgmac_phy_connect_direct() and sets
> BGMAC_FEAT_FORCE_SPEED_2500, the same as for NSP amac0.
> 
> On boards like bcm911360_entphn, won't b53_force_port_config() still
> clear the IMP 2 Gbps bit while the AMAC runs in high-speed mode? If
> BCM583XX is left out on purpose, could the commit message say why?
> 
>> +		    dsa_is_cpu_port(ds, port)) {
>> +			tx_pause = true;
>> +			rx_pause = true;
>> +			speed = 2000;
> 
> [Severity: Medium]
> Is the 2 Gbps mode actually programmed when the CPU port is not the IMP
> port?
> 
> The condition checks dsa_is_cpu_port() but not port == dev->imp_port.
> For non-IMP ports, b53_force_port_config() uses the GMII override
> register:
> 
> drivers/net/dsa/b53/b53_common.c:b53_force_port_config() {
>      ...
> 	if (port == dev->imp_port) {
> 		off = B53_PORT_OVERRIDE_CTRL;
> 		val = PORT_OVERRIDE_EN;
> 	} else if (is5325(dev)) {
> 		return;
> 	} else {
> 		off = B53_GMII_PORT_OVERRIDE_CTRL(port);
> 		val = GMII_PO_EN;
> 	}
>      ...
> 	case 2000:
> 		reg |= PORT_OVERRIDE_SPEED_2000M;
> 		fallthrough;
>      ...
> }
> 
> The two registers have the enable and 2000M bits swapped:
> 
> drivers/net/dsa/b53/b53_regs.h:
> #define   PORT_OVERRIDE_SPEED_2000M	BIT(6) /* BCM5301X only, requires setting 1000M */
> #define   PORT_OVERRIDE_EN		BIT(7) /* Use the register contents */
> ...
> #define   GMII_PO_EN			BIT(6) /* Use the register contents */
> #define   GMII_PO_SPEED_2000M		BIT(7) /* BCM5301X only, requires setting 1000M */
> 
> On port 5 or 7, the case 2000 path only sets GMII_PO_EN again.
> GMII_PO_SPEED_2000M is never written.
> 
> In-tree boards take this path. bcm53015-meraki-mr26.dts and
> bcm53016-meraki-mr32.dts use port@5 (ethernet = <&gmac0>) as the CPU
> port, with a 1000 full-duplex fixed-link and port@8 disabled. On the
> GMAC side, bgmac-bcma.c sets BGMAC_FEAT_FORCE_SPEED_2500 for these SoCs.
> 
> Unless the bootloader already set BIT(7), won't the internal link on
> these boards stay mismatched? The commit message says:
> 
>      Force the 2 Gbps mode and flow control for BCM5301x and NSP CPU ports.
> 
> This isn't a regression, because BIT(7) was not touched before this
> patch either.
> 
> Should b53_force_port_config() set GMII_PO_SPEED_2000M for non-IMP ports?
> If not, the condition and the commit message could be narrowed to the
> IMP port.
> 
> [Severity: Low]
> This isn't a bug, but b53_regs.h still documents the bit set here as
> BCM5301X only:
> 
> #define   PORT_OVERRIDE_SPEED_2000M	BIT(6) /* BCM5301X only, requires setting 1000M */
> 
> Now that speed = 2000 is also used for BCM58XX_DEVICE_ID, the header and
> the code disagree on whether NSP has this bit.
> 
> Should the comments for PORT_OVERRIDE_SPEED_2000M and
> GMII_PO_SPEED_2000M in b53_regs.h be updated to include the 58xx family?
> 
> [Severity: Low]
> This isn't a bug, but b53_phylink_get_caps() only advertises MAC_10,
> MAC_100 and MAC_1000, and this line replaces the DT fixed-link speed
> with 2000.
> 
> Phylink still validates the DT value of 1000, and CPU ports have no user
> netdev. No in-tree CPU port fixed-link uses a speed other than 1000, so
> I couldn't find a functional problem.
> 
> Would it be worth noting in the comment that the DT speed is ignored
> here on purpose?

v3 indicates that the speed is forced as well now, that covers the DT 
speed being ignored by extension.

> 
>> +		}
>>   
>>   		b53_force_port_config(dev, port, speed, duplex,
>>   				      tx_pause, rx_pause);
> 
> [Severity: Medium]
> This is a pre-existing issue and was not introduced by this patch.
> Doesn't b53_force_port_config() disable the override on non-IMP ports of
> is5301x() and is58xx() chips?
> 
> drivers/net/dsa/b53/b53_common.c:b53_force_port_config() {
>      ...
> 	b53_read8(dev, B53_CTRL_PAGE, off, &reg);
> 	reg |= val;
>      ...
> 	reg &= ~(0x3 << GMII_PO_SPEED_S);
> 	if (is5301x(dev) || is58xx(dev))
> 		reg &= ~PORT_OVERRIDE_SPEED_2000M;
>      ...
> 	b53_write8(dev, B53_CTRL_PAGE, off, reg);
> }
> 
> For non-IMP ports, val is GMII_PO_EN, which is BIT(6). That is the same
> bit as PORT_OVERRIDE_SPEED_2000M.
> 
> So for any speed other than 2000, the GMII override register is written
> with the override disabled. It stays that way until b53_force_link() ORs
> GMII_PO_EN back in.
> 
> The real 2 Gbps bit for that register, GMII_PO_SPEED_2000M (BIT(7)), is
> never cleared either. Suppose the bootloader left a non-IMP port in
> 2 Gbps mode and DT forces it to 100M or 10M. Wouldn't that produce the
> invalid speed and 2000M combination that b6a8a5477fe9 was meant to
> prevent?

It could, but that's a pre-existing issue so it needs to be addressed 
differently.

> 
> This patch doesn't make it worse. Non-IMP CPU ports now pass speed 2000,
> which sets BIT(6) again.
> 

Correct, there will be a separate set of patches to for the use of IMP 
port being 8, as well as well as reject invalid settings.
-- 
Florian
