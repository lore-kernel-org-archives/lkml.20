Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988447;
	b=BpB7S2yP6N7ueENy+7mGwjw7O/DSCkASwcg48ayDZXyxitWXQbE5O1h4pLEs2dmLnnkz
	 hPuyCgEvS6kqKv/xcsqZHgOu3PZUpPwD+2CBVIm9HY4+U999tpeMPck1ZSPJGTpW0O2gc
	 w5zyKO771uyI++PgWNOTkRWHVj5ALzbJlbX0x6opRetwjHcExgwspe5Fg6wciJI7E82VT
	 /S/8BIBDfhcJgiozFe2eMF3+ZpGcmZnwUh44a6qNIPA531g+14Es+U31jUJYscxNCiJRk
	 pr/pP6UpN2G5xyDnSksOOmRHe/HZJQG5AOpFgJauwPKo5xZXJibNz3yVqsC0/uWP/ZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988447;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:X-Google-Original-Message-ID:Date:From:To:Cc:Subject:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=aTv8lkvWYYtmkfaYVZ3RQ1F7LBmnW9Tpy7fJ2ahU4OA=;
	b=mACUIDWl1Dd4yQVkLOJrkbeVgVkzel1hnZ2VILOhlP1i0StOM9TgaOsTJAMtF+Z/Ti8y
	 4yEcTKlayIrsdyA17ZwgGCXcIymuZdT4CtPEE3qjn7ZquF20XnXckxi6Vfz7EC9N7VPih
	 oq99YocNy44P6iYb1rB2QKBz/UIBGGnBAHswewvHyTflIKkC25MfMxyTr7LA5Zd2xS7jr
	 71W9C1b1B3yKj9ljk4WVF6JJFKXYLEOKmmdPSAvtvPbBFqrJ7/lTLHU/G6mIGtkaoWZRb
	 O8gheB4h6Do1I3Jc+VTQ09tphtYuZwTNicVRd1AwilV1JRrL4csL15b9VAdVdICLsBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KbUnUMSQ;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6D5606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 18:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD6D5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KbUnUMSQ
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso567745e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988445; x=1794593245; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aTv8lkvWYYtmkfaYVZ3RQ1F7LBmnW9Tpy7fJ2ahU4OA=;
        b=KbUnUMSQd5t/j3E8RLeWdRCbRs0NdNgN8nMaCA7IO68kJqdioMqCpQLNMJH4H0g87o
         jrPY6IFoGXEboP6vHxQjNYNzF8wXguVzdux3dzoziKp74LeuS5qIi65/5nKsvDqnDH/V
         FrX+vrC/I2hrZB/I3gF5ojm6t88sjkIBy/sOBiD8CngKhW5TUJKilJA33nUQlKrhJqNv
         wk0D35TrgHIRvrHGAUuHvuroitlxoKWC9QkhURo47BzCXoGHGZ3hvKmNC2OoxMoWDKrT
         gE7vAnH+LFd5qAX8P9ueSn3H031ktjAbRGYmVIs7FywSivan/EUkuilJsIYtv/wc/0WC
         dnFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988445; x=1794593245;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aTv8lkvWYYtmkfaYVZ3RQ1F7LBmnW9Tpy7fJ2ahU4OA=;
        b=ki63qivJlzKNpAu9ubMwa14xxdSYit+HeXxa311Mj/bbNuHTIVZyPEO2aWapHwR3p0
         lt7Zq8/y2jH82AJcQvYprAXO0t9jaQ6i6ZlZAFmXbTudQGRUTp0mR0Al12nZMYRoHciN
         plqOBp5rEiqBmfA2CYo2SWnQzfXHgi8TotWkgMaa9uTebhILfRs3AL2ix8iWKICLewZO
         hVjEkLgB/PgSDPV/1mhFYQkZKjvFptZ8/biF4u8yalhTVfWjDaSE9i2yYcUUC3Xw9tkr
         mxHmusUY5ZG+oOSBnd2WCNMiHoKBcYHq6eVr2SZTRT14DYwSCiadaHhtK0VEUNq/VBlS
         NzLw==
X-Forwarded-Encrypted: i=1; AKwUvBwqH4JmgTLZAhoQA4Fe5R9XPk5ASJB3n6LPgVSPwnCJ8R6ASJzRrQxbG2kNXbl/OSQ6RGXRDqO83X+Y+AU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jKp0j5h+fNTKN1XLmPEXBA9GdxNXL372b3MabdsUgrBmvtywk
	5PHlH8v4fULgcIk5fp7pYA7PA0RlJQa8YW3rMU/kLcpPNBEZPQMtysT/
X-Gm-Gg: AYBFou2hHtXCcH5CbmnptuuY2Prl533cFxbtYqwnbZ+IyUsKp7DOwKpcH3JujuHJ6Ac
	duXXWdo/G1rePAQrbwp4ZUv7lGSFrNWWDhysrY8e4gSOaMkQzkPfVeLP/0/JcZHhHxedGNrYvi8
	1oOq9W4sFqGpJQlh6D5Wg1n0JBUsi5KHcfgyoC1b2LOLZakbNRaekGHjV4RorDICFcZt10T8pZ4
	/5qfnE7QkBU0/3xS3yDRCmFwrwTfcMS/iyYQkKxlnndNahDlQvVbTj5ccLonFAAxFe70M3Vut1b
	zYwg4vbr8XQcEe/t3387vfOmoXabOyO6tFKhoH+N6EPcC6K6dnFVAfa8EwXepag2o+Sm6uwpA6T
	6+r+H24Q1HBH5ld5g9Ki+aiAwkYcA3r1yeUvdt1OIFmbVRlZNBNVsSmgo/qNYakpek4FJ+569Z+
	W9chhDo48EoAMpe8/6RTLMlVMD69rZwHZjikvJRjdG3TUhB/j35kRSQqmcuC/z1yG0As8Xhlss2
	YcxNrj90XA7PIeUFCjZ9EC9ZPTAwI0r+6ulqjqEMlevLKzfebRu8kplOJAlhzo5StHXoHzvMu+N
	g1uIgASzzWPsSQ0QO9PTouF8ypFq6xpl2H2P7KCC4jZFuRKSGO4TcrgUVNNmI0PWe7mlGR4LCV8
	qNg/oOTTWaq/P2uI=
X-Received: by 2002:a05:600c:348f:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4b6de788f12mr56588375e9.10.1793988445013;
        Fri, 06 Nov 2026 10:07:25 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7c8a01afbsm64905e9.12.2026.11.06.10.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:07:23 -0800 (PST)
Message-ID: <6aee175b.f01aa0c8.37eba4.18ea@mx.google.com>
X-Google-Original-Message-ID: <au4XV3gQmbXyvqIA@Ansuel-XPS.>
Date: Fri, 6 Nov 2026 19:07:19 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Yongzhao Chen <yongzhao.derek@gmail.com>, netdev@vger.kernel.org,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org, Ziyang Huang <hzyitc@outlook.com>,
	Stanislaw Pal <kuncy7@gmail.com>
Subject: Re: [PATCH net-next v8 1/2] net: dsa: qca8k: let regmap serialize
 register access
References: <20261104120130.48455-1-yongzhao.derek@gmail.com>
 <20261104120130.48455-2-yongzhao.derek@gmail.com>
 <6aca850a-ef67-4451-aaf2-977be884d1b0@lunn.ch>
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
In-Reply-To: <6aca850a-ef67-4451-aaf2-977be884d1b0@lunn.ch>

On Fri, Nov 06, 2026 at 02:38:37PM +0100, Andrew Lunn wrote:
> On Wed, Nov 04, 2026 at 01:01:28PM +0100, Yongzhao Chen wrote:
> > From: Stanislaw Pal <kuncy7@gmail.com>
> > 
> > The regmap is created with .disable_locking, on the ground that the
> > qca8k read and write callbacks do their own locking. They only lock the
> > bus transaction, though. Since the driver moved to the regmap
> > read/write API, regmap formats the register and parses the value in the
> > map's shared work_buf, outside of the callbacks, so two concurrent
> > users can swap or corrupt each other's register and value.
> > 
> > Most register access runs under rtnl, but not all of it: phylink's
> > resolve work (mac_link_up/down) and the LED class callbacks do not, so
> > a link change can race with an ethtool or LED access and write the
> > wrong switch register or read back the wrong value.
> 
> Do any of these operations which don't take RTNL do an open coded
> read/modify/write? Does the regmap read/modify/write operations hold
> the regmap mutex over the entire operation?
> 

Maybe I'm just tired from destroying board from my HW project but... I'm a
bit confused of when read/write are not serialized.

Operation of the LED and on the port have their own dedicated register per
port and for shared stuff, there is a dedicated mutex for it.

So I'm not sure what case this patch is fixing...

Both mgmt and mdio operation locks at the start and unlock at the end of
the read/write or rmw operation.

Using the regmap lock seems redundant and this is why I disabled
originally. 

I would like to have more explaination for the 

"regmap formats the register and parses the value in the
map's shared work_buf, outside of the callbacks, so two concurrent
users can swap or corrupt each other's register and value."

case.

-- 
	Ansuel
