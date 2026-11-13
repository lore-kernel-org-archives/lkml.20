Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794533006;
	b=Na5tLsg2Lo4ZpGnz2kPJQkIwdiNG8/qzs4GmeXOh+sGqyk4Lk54ubeIbnyEQFVaULRaV
	 x6vYwWwhk9NOzzfv3aEBIl04lLTuRTTFtKdgEeWL965a6MTzU7SZA0iOoZb1FWUCXGaQ9
	 5jxt8mPmR9YXU2HmO1SQ3Bc8LpTLJtTK9lO8Eq7Ejj13Xkx3JGtoX4XIc3oI8SiTMz6XD
	 vb9+jCBgLZ0KzLNZcibDcEPn0iS42xgH+2tfvSy9NTtJenWO7OdOufXifuXHyNNqECMDV
	 8e/Oo7nqRLI8hqJNClYC49wVpyHN9bfx2ekXu/ImWX20yr5+XyusO36ORW4juQOrkqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794533006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:To:Cc:Subject:From:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=9ThB1/zw69OWXTSMpOLXkS0laxUVjvIT+W3FMQmOb3Q=;
	b=Kfddb75r0mggIH04eFe/4CBjV4FjBCt+ICz+6cZKC0kWyCcqhGj9bPRoOO52DQFaP2dn
	 /C1gzT8iK0BlAxxbpbbuuE0po3GwbuawX0F04lMHITlKOhijvVBrvm0din8wIMOlme4du
	 kTquJcwnWn67kX1aJHSUpcrhvcvHNF/XY9mG1HL71EnUMUWLWN8mXF4XxvjlNGgZDxlIv
	 r5voJU9u5/00kRDL1+lXanbkKsH2xY7tUb3deqr9f1rBZl9KlJrx6nAC4mncZwvJLR8yL
	 Efe/39O1ZuAFM++IPPt/hyXENWRFTpKC95HNCAW4zZP9nMaNQM2ewduhRwcuqoryIpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GTiaISFX;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE36606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 01:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAE36606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=GTiaISFX
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b3402105b9so4666717b3.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1794533005; x=1795137805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ThB1/zw69OWXTSMpOLXkS0laxUVjvIT+W3FMQmOb3Q=;
        b=GTiaISFXFMwlQRO0n2/KtqU9W7SvrXe5qiAcaTbvIMxPy6l6yIO+ycn/shtcvuSkpH
         Ms+TdlOHLFbh5qGXdxR8C41LOY3K27cDOfz3HD7vFkkn3ERTuR819vXjeZcU6W49zy7J
         S6J8ZrNCYAQ/2N/tXm8xoAjg9cfiSSsIMz7l9sv69JbG2fMC9Xjb0vVGtjvyGEmI7Uy2
         2JDhC/MS6YObbZ+fM7zi36etDnJ6kW8iNj442l05eZR5whnbQog4IQXrec5XfsKjkiwL
         s0+MM2plCc52hBujj/3836Huu5My2vuh7x3sriFXDV7GFGYpxjukNbeJsuqv7PUV376c
         4wHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794533005; x=1795137805;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ThB1/zw69OWXTSMpOLXkS0laxUVjvIT+W3FMQmOb3Q=;
        b=QjDgOhykG50YR6KY9r9WtuHQ3xgbn2dTQHjcikI7F7TzDZrWbL1PR3NTCE0o2AQjmT
         sfwKaeIMWaHxrGn9qLFdiIQbsNIqHrtnAZnHU29/VEmBgNvb90Gy5FjErUapxhOV6T92
         jvPAtXXIs89Vf3B5KF8IEDD4I90uHkfTpxXRasZfeSMcOkSGu+9VubOtSPNojIIKjKw0
         rRsXpO0ub4BkKSww/ICVxmvsYQkKAN8/8YjGZ8A45UT3zovkoI8WWccVRv3mIxBNlRJr
         6otYo27CQ3ofKAHUzkJV2W93EN8xGc19DauRGpuPX0jdmj86qfemu1fl3qAM4r1KEWbF
         cnog==
X-Forwarded-Encrypted: i=1; AL+hErHIA6ITH67VGKnx7Vub6jWwoOT11Yu7JRcXoQRbMCjsO4L8G6Vp1vSHBNxf1w8QsL7/IHAeOcGl+ks7/r8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nxA5AXF0OI5qA3YKej6YPvtx/Qu8LDls50hAdgWfoFANA+ncL
	mXFuvm3a7LVZq3DHQe4B2Daee5KFlPTrr67xwuW6CRYDX/SxGqv1n90VZ3nEQ9nZ4eA=
X-Gm-Gg: AYBFou3dYirUhou2dpXtEfk7Jlmg80ROPCXBYgoVtwDBS99gDovEDRaeU8802hPGzXK
	EX5zhRu4ImQMMBCZHy6fnv9GoSp7YpjxLb+7sfqQCFtrJpSjzHBDqQ1JrPGg2aHxLti8wTN6Q/C
	II37aySA0+9XCFS148qmoQxkwXgeF8BTTMScMjp7H2ucaam6pR76QwNjdNXspr+lHLtq9q3Bkcy
	d+Z8gBttdEuC08RDJ8n7Jmn8NDeiEDjJ8Rs2nYvjoQs4ijumniqrhpPo/WHQNy5qmKh+bQbLFBU
	lsA8POxFyJC3C/4MXgvnV1f2zciRBNJozd+EUKc7+JXwSCmmsssQ6DgqWXLgcRps8ejUU0K2t6Z
	8Pq5tOlIe/hfIBXOVyItumIy0he9X9vjfciSt/aT5wQQKKr+UxCHUg6sPHkx+U3kX6yu41HW8WW
	RNzaFFLfGjKa5yrAkGbDKI5a6yiD1PDetvlMCtdpqMQIYf1rQWIlEQ0eYwXDhljz/uyuv9jKSy6
	rUpwsP+ocAwdESlZ9CIAHo9F7mx9dkyl3wPMOaoOCw3Mcta7PL9rtiovIOe86VVXW41FFxbM4RC
	vOU3T7FTXs+IDcr7LCCiXXwQULIDVDLDFkqALK+lDVPULPg=
X-Received: by 2002:a05:690c:c1c1:b0:8b0:95a7:37e2 with SMTP id 00721157ae682-8b4aa33412cmr5356997b3.80.1794533004833;
        Thu, 12 Nov 2026 17:23:24 -0800 (PST)
Received: from localhost ([23.145.140.5])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9e8d20sm9341667b3.38.2026.11.12.17.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 17:23:24 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Nov 2026 17:23:22 -0800
Message-Id: <DMTOUWAKBIER.19DO7XAP7Z2R3@nexthop.ai>
To: "Rob Herring" <robh@kernel.org>
Cc: "Saravana Kannan" <saravanak@kernel.org>, "Frank Rowand"
 <frowand.list@gmail.com>, "David S. Miller" <davem@davemloft.net>, "Shawn
 Guo" <shawnguo@kernel.org>, "Grant Likely" <grant.likely@secretlab.ca>,
 "Grant Likely" <grant.likely@linaro.org>, "Pantelis Antoniou"
 <pantelis.antoniou@konsulko.com>, "David Daney" <david.daney@cavium.com>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v8 0/6] of: teach overlay code to keep /aliases in sync
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
In-Reply-To: <20261112221205.GA1425386-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai> <20261105124030.GA1449284-robh@kernel.org> <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai> <20261106132432.GA2551143-robh@kernel.org> <DMOE1TFEAB6G.EC2KYRBTZR9@nexthop.ai> <20261112221205.GA1425386-robh@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 04:12:05PM -0600, Rob Herring wrote:
> Stable bus numbers is a solution to your problem. What's the problem you
> are trying to solve?

Labeling hwmon channels on an embedded Linux system.

The board has an x86 host with ACPI firmware and a PCIe FPGA that
provides a dozen or so I2C masters, with muxes behind them leading to
PSUs, fan controllers, voltage regulators and temperature sensors. The
FPGA driver applies an overlay at probe time that describes all of this.
Userspace labels the hwmon channels with libsensors, and sensors.conf
picks a chip by its bus and address, e.g. "pmbus-i2c-12-40".

The same parts sit at the same address behind different mux channels
(PSU1 and PSU2 are both at 0x58, for example). Their hwmon "name" and
their address are identical, so the bus is the only thing that tells
them apart.

libsensors has a "bus" statement that maps a bus number in the config
to an adapter name, which would avoid relying on numbers. It doesn't
work here, because the adapter names aren't stable either. Mux channels
are named "i2c-%d-mux (chan_id %d)" after the parent's dynamic number,
and the xiic masters are named after their platform device, which comes
from the MMIO address the PCI BAR ended up at. A udev by-path symlink
for /dev/i2c-N wouldn't help, since libsensors doesn't use /dev/i2c-N
at all. It reads /sys/class/hwmon, where the bus number is part of the
parent device name ("12-0058").

> How aliases interact with an ACPI system is another aspect I have yet to
> consider...

On these systems the base DT is drivers/of/empty_root.dts, which has no
/aliases node. So no alias is honored from the base DT, every bus is
numbered dynamically starting at 0, and the overlay is the only place
an alias could come from.

> Right, but there is no fallback for some cases. Having that is the only
> way this could work.

Can you spell out what that would take? Does every subsystem that
hands out ids from aliases need its own fallback, i.e. the i2c, i3c,
spi and mmc cores, plus mtd and the serial drivers, before overlay
aliases could go in? And if so, would you want each of those as a
separate series through its own tree, landing ahead of the OF patches,
or all together in one series?

Thanks,
Abdurrahman
