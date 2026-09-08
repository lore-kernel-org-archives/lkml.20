Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD393CB54B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902768; cv=none; b=Anj0GFvCKkNUAKEG+jO0bZloi/tqJe1Uz8K4ysNu7Z6pTNSmAw3ozjMMJ7sYFr+F05280jWtzLCeb1uISxDZ6mNW7T+r4lXqDZo5qhMgyQqJgHk7vKpLKhgcfD5zjMez++IOXPLAZWGT1wwQfn4NrUc3hS9f0iYF8gKp7nWFJmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902768; c=relaxed/simple;
	bh=RFvjS155ZvdGD2YVXxfuKxFce81xapOIJy4GCdmvshg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oM2uT4XNLRJxz0h65W8sAckeDuYlCYAnLUQueCbuH8/ByBItk8hbb8GMN859cGm5t0hZNVMtvf4qaWGa611hY2SF06bDbDSu53wxZIRdsAfZJ4YRUaTKD1F2QAEwB0pz2uKwX69zBFIwirXK9sJDUDUePS+GqTvngTP9F7g4GZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ijlytMWV; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijlytMWV"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so72173545e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788902765; x=1789507565; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fo0YbEFL8wMrCYE2f1oBd51v/3oi28C2SOi3ZLEFoU0=;
        b=ijlytMWVXcWyad1ELpjX7YSxmV3pHCJODP7yGy8ZLFk/WebAQa3FJ5q+iZWD02Yt85
         lmaGgd1Dz5L8krBWEFd+eDgMcAZhuhLd1G82TOHATR4aPGCf65mhrsTPG45Gz3eOUhmb
         SF2huAzSL65Voek1nJ96x4XosjPs4Zj50KEtoofNLRjUZr1aS1ZEYiZ63De17KxC97Ys
         ZIqx91w46PniSy7EoqFfyJ8wTnZ6xIKXrJ0/GjeDm6kikvWc8jWvoldz7Z0LL0aDmZde
         bh4xFJRG6+/Ljr2nMmJg9QLvBFP9zRRlzn1IplOadwr2WbY3G7HjlzhwLU7IEXBOZdu5
         5zmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902765; x=1789507565;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fo0YbEFL8wMrCYE2f1oBd51v/3oi28C2SOi3ZLEFoU0=;
        b=ZRJkgSyNCPf0wQnyqBjekBinQorH8FNXG5G2rYz9go8fMh+gZHQ4BVxc9pKRsLhdQ9
         kBGtiAQTovvVx3jADsuY/Q//tgAPCrdOEChmwYq6kbotzZXsHdNsAf7AOzA8nTrdHHEW
         8HewPVbB/Z0+5r1LcObWgSyurLbWalap8kGSQt/vNt5MCDnB+PFS26Y82FkAwkoyGQBK
         fn532FzJ74Lv4lA4L6/qCHRsfIHY87zxLsiR0JEvbenTDdpZtdA+uz/O6C1XI+MNn3RU
         VabEG17CEqXps+HcfXBtKEul4jRjM6CLYIMneB9KaKR2KzMSXeY0piP8PRJTskCLuTnl
         cqEQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgoYSQBolf2mfdoFxZ9BSPYqVmSPIH51zvdLSRJgcncJUdKpoWy2mwwer/6Lmz5cyCmoCcun7ci1rWj8c=@vger.kernel.org
X-Gm-Message-State: AFuF++nBLrLCguQo4Ti+YCRMomiK45ggE/G45VpJEU7A4W7Z4tRz9iDh
	LQLcuX8p8cApKFstDzjPrNECWHk0pVlYewUtS01RDthdTgFwy9QtdLdd
X-Gm-Gg: AYBFou1CjIFOYmdyBvobilqrL+ZybSAGHzOO8S3plq0K16Si9B4GBXcx/6oVFQwErh7
	huHguqkM0MeB6GbuwCiywg3c9zBAk/glzZhtqD/v0t1dTA7bbDzYW+Cm6fz0vf/NyAQfyGbXUe3
	Bco+vroO1tTRp+bu+cXD20j7L86QM/GqRLphLdMovpnik0zo9Xm2+zisTOnkOJy2NubQsbZM7+f
	jabNCRaStnoaiWkhpDurzjnw+QBtYTqUzH9+gEHP1Xw3BR0+uAPzaIThRtYRnCdh/1vpuQOSTJ4
	GAoe5kLFqk7ittEV5DjlubPECFbFJ/CSM58Ml2JEf9eWPEMIBoe1n/sad9WIsJQSqLq0wLbJO+y
	ysPSpToPQ/S0KZbxeKAEIrywmj/ZShSq7l3IezfreZocdihoWh8Ahg6Hta+FrPmt1yhdJXIJv3i
	W+tFA4XPviDHoFYfsHwQxKOeie8RbQTlK1Sr9SP42X4xv+yLV5tam03T7eZ70Is39P0rYn6TKPY
	CX2a86O5xjtMOpX+r3SCvG2pg==
X-Received: by 2002:a05:600c:3495:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49cf8244bc5mr319923725e9.7.1788902765257;
        Tue, 08 Sep 2026 14:26:05 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm32433704f8f.13.2026.09.08.14.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:26:04 -0700 (PDT)
Date: Tue, 8 Sep 2026 22:26:02 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Nicolas Pitre <nico@fluxnic.net>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij
 <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>, Drew Fustini
 <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Rob Herring
 <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Liviu Dudau
 <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, Lorenzo
 Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Vladimir
 Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman
 <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, Tony Lindgren
 <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>, Gregory Clement
 <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore
 <enelsonmoore@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo
 <shawnguo@kernel.org>, Karl Mehltretter <kmehltretter@gmail.com>, "David
 Hildenbrand (Arm)" <david@kernel.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
Message-ID: <20260908222602.7b2aab1f@pumpkin>
In-Reply-To: <ccd58677-5e25-1f9f-2bb4-d1770fce8ac4@fluxnic.net>
References: <20260908152808.3928630-1-arnd@kernel.org>
	<20260908152808.3928630-2-arnd@kernel.org>
	<ccd58677-5e25-1f9f-2bb4-d1770fce8ac4@fluxnic.net>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 8 Sep 2026 16:36:47 -0400 (EDT)
Nicolas Pitre <nico@fluxnic.net> wrote:

> On Tue, 8 Sep 2026, Arnd Bergmann wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > Most sa1100 platforms were removed a few years, with the remaining
> > ones left as a starting point for a conversion to devicetree.
> > 
> > Nothing ever happened on that front, so remove the rest now,
> > including the sa1111 and locomo drivers that were once shared
> > with pxa but are already sa1100-exclusive now.  
> 
> The SA1100 was the starting point of my career. Feels strange how much 
> time has passed.
> 
> I parted with such hardware a long time ago in any case.

I failed to 'steal' a J-Slate when I left Tadpole.
(a very early 'tablet' computer with an LCD panel)
So I don't have one either.
Although that ran VxWorks and rtx-windows (after I patched bits so it worked!).

	David
