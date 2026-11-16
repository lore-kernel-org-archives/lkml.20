Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794847073;
	b=5PAibe0NDLypBQ5z98x7x15t+sAOCK5zfm/vrNU99YPFIJEAmF46MLyhlLf1bUN7yBBk
	 rcHOWRiwv0pjCK84eF34Mi4eqy7muREvN7XtWCT6uHoiOkdcadXIyClZgzUvCEdITXrtf
	 4KQDFWsJrv7IPAD4jfSetglDbY7tOsHUlz1p8s3LrhuERbV4+s2Crz/xlIkbBPVGQUHNA
	 Lxt5uEcuoKZ8c3si/+3hT5GzRgcyBtoiaPlWNTi1ftdga/9sBTky91y4MDpF9U1QoQ0op
	 E5RzkFuP55QuOHCGe7hq5ZDSC5C+9KLy6ktbybRP1ovr7jXBQp4nU1lER7NDfrxjJCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794847073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
	b=QTfgIBhL5a6W2PJrmMTWsO8zKdaL1a5fx7m2cois1L00IuN+0BG4rYV6bud06V7PX+gb
	 2iLqscjsO6ysvGo4+W927MwjhHMYv+jabN6zEMZruhYjFhdxPjLeA7GE3YxF0sZpqaxDb
	 lz3faADj+yIfdV3/roJ2azOPsyN01xfxjd+bn1oP+ZoVjQOBZ1SJFS9cbi6mua+K6AohH
	 WqVEFrI6tZwD4Jmgse8rC2k2jES+7P0u095t93/Vseofr7eZGH+RmzeaIlsqpAHRe9J5r
	 IazBUYLszuvu+IHR+TKx14rgYDefcrHp+31yLVAW1Qmwds5msDHJWuyzM1+Q8dJBl7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNqMq4pd;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A943606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A943606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eNqMq4pd
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-497614c95f0so1758914f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794847072; x=1795451872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=eNqMq4pdG7+RtREnW0nLtbAhfw8loOwD8ch/NLM+mhlO9edO9Xpuh8aJi6/ITtGecp
         SN5fptk7D0/UooZZhSLhlEfkd024Hbrq8zj1AoWJH6DXOsRvSXZ7CpdvuM/cLqVATFcx
         2BKKTLjWXhEvZPkxdUO3iReMBvWvi/3LRR+U5SrooY0v1uRabJ+zptC8o7Gt02M3Egis
         TSW9HwosoAUxvxas8Oqp6Wg+kevVJHOZVQqrkA6N7+U/g6/Js/3IkmN1DGa1UQruVY4H
         cpSmDdTkTw+Qf7cBPBY6VP4Ej5rn9x09uZyaCeQql8eSz30sM/zAD9iliCtW1VhTQCl4
         lghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847072; x=1795451872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DFx9VNe+QiyXsTiYK+4RI8C7x8ltmh7n6mja+3S/b68=;
        b=yr8RWAL53oCOU3axvuCVmsrHMOK+masB4Qmf3vZuvPDPHpP7HNOsrLH9KWRq3fDlpI
         BkBPgRnHN9i25b+1RFuuDd4ie1h1C2QSYU8ZNpd/J9dPRpsNcziGhJnPzxGTea9p/1vV
         YvRz75ebCvQTpkb6sqEuDQeYNVjp/Hi5WgZY/Q2toOz0Msu1sFv24dokAq4PbRR5YqSX
         NxAgBLbW8ud/65n1eBJkRX3CnVEwUeS1yrnztE2tiIa40zzdUpGcaTIsYVRB1oqUnqd3
         exbzzv2RlJbOa/JM9EdQSOfF6CSMxz+v8Xvm3ih5WV0BC27jW8XEGQNUjR7E7xe1wSu3
         SWEQ==
X-Forwarded-Encrypted: i=1; AL+hErHEhCJ3Vr3GIRYhXRbhw4Tw3FCCQsL7Jhgt7KM8hwocAVsAdV9p80kq68edbYrMTr4lZrK3KVgsylYazVM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3zZs4Y74t2J0J/Mpc+kTzMJYx4d5sx7LKlMnGIHy63Di2Bl7P
	C4fE+0aQ9ZVHVfWFh34EXRmWI+7/oksGM9J8cDma/cUTFoh3C2A7EPfr
X-Gm-Gg: AZFdTZc58iuUyqqTP0DWWMrV0nnvi50pxt80dCsugZy6yzW+V5hQzhnPEQj1chlGJww
	7QQwwaou/YyY7V711DrKqPVTfX0WIW497YxL1b1iSI744yPgxJIZyqU79aOdxFSQSdJK13/nH6d
	xRLLLOzqpMGWDyBKyDGieAm9zysCOU07WzEfbBBpAuchTalUw49cWKUFF52iW1iwaxpRexZzT8e
	pJBQgh064jKdMybZJoKLqguwCUfFi3Lr4jvddxU6MePlHPAT3TGEqvC93IZ11l5IA7LVKUZtQJG
	b2NCQg2+Mbfh2lIx3A8aUZmyCN3eMg0JQKIJBe8Lmts5oteTKqNTE0NzNIK8GPzMNI3Sf+xq7ok
	9abNy2RFfN0dl90Nsjim1LJ/2OXJgmjSJtx3fqwZ6SfGIntuZSMqkQgN5RKrxuVDP8BTg3URKwk
	Zj0Z7nz/lut8lCu9n0PtB0w2p/YUMlK4YSR4LLEuVk+v2njROFnVKdsZkX32aO28c4e9IAXCsiQ
	2B7fsTDpgHctCaK/vbewFtxWHL5c6zH9Du/4TRjtXXNJpBZeZMhP1eWXJwHxgDR9h2zqLDsCYM9
	klrCW+fxd/vuwynPPHgl33+mNZN8vc9iRJHsnlIMV85cSa+XRYXXMg2vKH7ljX24CSAaQsSJ9ZC
	lEGAxX0hN07sYCg/x
X-Received: by 2002:a05:6000:4289:b0:492:b221:ac38 with SMTP id ffacd0b85a97d-49c7381b4e2mr22865762f8f.26.1794847071978;
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Received: from Ansuel-XPS. (93-34-92-103.ip49.fastwebnet.it. [93.34.92.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5a32d336sm25103969f8f.0.2026.11.16.08.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:37:51 -0800 (PST)
Message-ID: <6afb315f.7f974077.2e08bb.6940@mx.google.com>
X-Google-Original-Message-ID: <avsxW86_xeNrm6Dz@Ansuel-XPS.>
Date: Mon, 16 Nov 2026 17:37:47 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
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
	Justin Stitt <justinstitt@google.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH net-next v21 07/15] net: phylink: add capabilities helper
 and track modified advertising
References: <20261116163412.551438-1-ansuelsmth@gmail.com>
 <20261116163412.551438-8-ansuelsmth@gmail.com>
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
In-Reply-To: <20261116163412.551438-8-ansuelsmth@gmail.com>

On Mon, Nov 16, 2026 at 05:33:50PM +0100, Christian Marangi wrote:
> In preparation for PCS release/late attach, it's needed to introduce an
> helper to calculate the capabilities after a PCS is removed/added and it's
> needed to track the advertising in link_config changed by the user compared
> to the originally one calculated in phylink_create().
> 
> To archieve this, introduce dedicated advertising variables in phylink
> struct and update it when the new phylink_update_capabilities() is called
> or advertise is updated in link_config.
> 
> In phylink struct the new advertising will contain the full advertising
> bits right after a phylink_validate and the new user_disabled_advertising
> will be the mask of modes that were disabled from an ethtool ksettings
> (with the parsing done in phylink_update_user_disabled_advertising()).
> 
> This double reference is needed to account case when a PCS gets removed and
> attached again to preserve user-defined advertising rules.
> 
> phylink_update_capabilities() will calculate the new supported modes and
> the new capabilities, update the full advertising in phylink and restore
> the user-disabled modes.
> 
> phylink_create() is also updated to init the phylink advertising and
> link_config advertising.
> 
> phylink_update_mac_pause_capabilities() is updated to use the new
> phylink_update_capabilities() to account for user-disabled advertising
> modes and update the full advertising in phylink.
> 
> phylink_sfp_set_config() and phylink_choose_sfp_interface() are updated to
> account for the user-disabled modes, first in the
> phylink_sfp_interface_preference loop and then on updating the link_config
> advertising.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

This is a leftover from the title rename... Please ignore.

-- 
	Ansuel
