Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793994715;
	b=rrkPSiv9xv3kjndB0xdkCq4CBcejoZcWlrlDpvMaa3YTuyP4c2TYRfYe1zSJO8D75Zut
	 g5VKJ1xK28xxHuJg4NTNRy1jrhwWz9fFuRHO66ocplBH71kSY1R2RS8ZnlS3SoFlzVjga
	 1unM/d4FBADeWWrqfn41Of7C5cpxgJc13O4T7FDM+ued7qDL83jaodF/4pHF63J2cMzqb
	 oAwZbTiEXYrYz0YrvhwITpGBlrhvXi9z+vZsGFyPkQmqS1bEGXQ7jG+dhkjDOH8IX5Sc8
	 XyZVmcWUOL5dIwpDneI4Oxe4SG7J0YDLNDdDR2oZjkSo2zZll6/x6l+oWb5Z8LHt2qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793994715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=9uDqiU9m0I45FXevXHOe2/irro6MBqjLHqDakyWB+MM=;
	b=Y43VVId0EmfOuLSzO+doApU7WxSAenCbC9HtBiChXXtL2P9fU/N9uNEIEKS3kEdR60ar
	 lsdNzUcGLGOjTXBSNVuGgQ3tTww8LZFZJHQSvXlvsw/4Y/JerblwTOYmc/m57mbCCfM9b
	 hi8ujSFA3+BwK4EpX7UG6V5gob/Far2Plzk3k/5WVERLT/vezg4jV/SRgYRwnCx6u6bIb
	 QqavOzufKk0gKlYkuhyNirrZWZcYZ4VoL5O35OEIhCUQp6EUE41Y1UaMnyCHsgZzDwsyG
	 JAomsZLIGarjV0/g2iYjf2el6/5H2y+yEVfNopvuxam/4u48CHrD1gyy2bUoKOTZYpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=N9Dh84hq;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23EDF606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23EDF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=N9Dh84hq
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-15ea896ddc8so1825242c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1793994714; x=1794599514; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9uDqiU9m0I45FXevXHOe2/irro6MBqjLHqDakyWB+MM=;
        b=N9Dh84hqvF7NaouHGTiQxo5yUnhRZPrGood/HRPGvI94n2FAymdyOkmuHs+cX2k00s
         Ojg76cnlrLMwoKnLry57oy5CjHRZkKLOOHsanyhME8VE28XIru/MhtJPSFeiWnfMXgTt
         RACGj77C8Jbmz/KIawDskDqaDpWRH/nFO9egOUoxfXIu0kbDXsogCKQTcojei5RvZPZ0
         L1Zm+GDTyCFNXQsGnAay4rXtccS3bGGWHFdhyOAPRQojgYRPD9qUaXyd3GmFg0wQHpce
         rp+Ikk1nPrrSK2FFQihUpTcexubikUGumIK1328V/t47KJ6lzTACITNb6Fs1McSMOKFO
         k6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793994714; x=1794599514;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9uDqiU9m0I45FXevXHOe2/irro6MBqjLHqDakyWB+MM=;
        b=1RpPl5qPSOLT43s3jMl08pHbaS9HnX0GIPyORneQ7I3B7js/9v2qdpBZ0XhiBxgEzN
         YbYID4H87wijbyqECfWjKeUG0vh/2N+8Nn8Qbvf2iSRCQvfvp4i5vBtzI1mTRLUW17iY
         qC0B34EVr7HcblwRuOWdPM8C20mddlmdM4Z/vWOet9h4/CGtBQPN+U0HAViHCRrszJqt
         nTlVkGgF4uvNwK381E7opxD9c4V6BI7K9R4sIFcm+MkUXzOPAPLuMRBdnJJz7csGD8JQ
         vjBNp3HaKvNNYLpMcnJ+Lg/CsvVny98+VZrSZ35V0h6FAUlXL76GBbBTm2V9HHWPvxEX
         D8qw==
X-Forwarded-Encrypted: i=1; AKwUvBxXz1bMAYEl+gHBsyEqVXZqe82Ou1AOdoUwNUa5cu+t/DI0USUtujM5tdyaDotMXAAq8DwsXGy4771r3P0=@vger.kernel.org
X-Gm-Message-State: APuU4Z88IqlFe+M5lVWfnhAi14g1FwpspuYsrog94pr2UtqoppAEp3wK
	+lXDXPx1MsVrnVfLqc+rEdxa4/R9yhjNAYEp+7XR+C/9ZWpUbnM4QTG/iFPIy5+vzWg=
X-Gm-Gg: AYBFou1MCIvKibe+DqG5qwOWuV0DZAV5mFHpLiifDSYc5ZOviOTy2t0ehoIJYhe0YEI
	eOfkJRQkGjsJTosSE+x38P9C1fW+mwoo5ILGXKTQ8zb9ONt8aRvQ+L2cViYVhwHCV9Qb7av4Lsb
	HcK66Q007GcMA+mFrQSgcgInogFHTr1jsesttpdapTJ1PqJ9nsq39zBxcfWiKCeNS70CYRhhByp
	eWgwjAVo8rFgTKoVyt2/qVtV3R2miGff6Qn1eoPYoOfZJDlCMT8CqwBoO3hqgawzE6ViDjYQ0Th
	RfLh4GY168q0L471wNjyLHaQvenE0kybAsjFTYwiVnPL7iIMl0ILYirxHGYp6ZyH6B2aDM3IrqO
	KVVHdrOYNKwWs3fONFNixy0kx8XKgsfdz6qCzNOzMxw1rLcGElAzn4K92mrN81zByh6YQJ9Pv3D
	PHh2h15UQSmoOX0hXCm6c5FmGhAlZWUMeTc1PFmuH0qWJ0//IGmD0zggXW9PJc1SOMwKM2kab+D
	eYzRWTzzNXB4JlZRaDrPBak85YfKhgZ0USjUKRH8sB+XFb+cAxrhRvBb+z1QV2DuVR0MEuPd30D
	8SNxAVcwcR367y4Kui78AmNhT+Nq1Q==
X-Received: by 2002:a05:7022:c82:b0:143:2968:564c with SMTP id a92af1059eb24-1b25d315d51mr4434155c88.26.1793994713996;
        Fri, 06 Nov 2026 11:51:53 -0800 (PST)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e485ce2sm7568630c88.7.2026.11.06.11.51.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 11:51:53 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 11:51:52 -0800
Message-Id: <DMOE1TFEAB6G.EC2KYRBTZR9@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
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
In-Reply-To: <20261106132432.GA2551143-robh@kernel.org>
References: <20261014-nh-of-alias-overlay-v8-0-0f74f05ac762@nexthop.ai>
 <20261105124030.GA1449284-robh@kernel.org>
 <DMNRHQBO1JLB.3IO0N8NYJML4G@nexthop.ai>
 <20261106132432.GA2551143-robh@kernel.org>
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

On Fri, Nov 06, 2026 at 07:24:32AM -0600, Rob Herring wrote:
> What I would like is aliases are not supported in overlays (applied
> after boot).
>
> Don't we already have consistent naming on hotpluggable devices such as
> network adapters? All that is solved in userspace. Why do we need DT to
> solve this here?

Netdevs can be renamed, and that is why userspace can solve it for them.
i2c adapters can't be renamed.

I'm also not sure "after boot" is a clear boundary. Overlays applied by
drivers such as lan966x_pci, or for an FPGA on an x86 host, are applied
during probe. They describe fixed, soldered-down hardware in the same
way a base DT would. The same /aliases node gives stable numbering when
it is in the base DT and is silently ignored when it comes from an
overlay, even though it is written to the live tree and visible in
/proc/device-tree.

If an alias is a request, as you said, then honoring it when possible
and falling back with a warning when it isn't can't break a working
system. Today such a request is simply never honored. That was the
regression you were worried about, and the fallback covers it.

If you still don't want overlays to set aliases, is there another way
you'd accept to get stable bus numbers for hardware described by an
overlay? I'm happy to rework the series in a different direction.

Thanks,
Abdurrahman
