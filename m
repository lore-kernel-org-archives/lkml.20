Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B232B9BA;
	Mon, 14 Sep 2026 03:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789356822; cv=none; b=gj4/ZBr1zaXdBZpZqMiwfWe4CZSzA2uElvNK7avHjFlWcJK5/0HNVCq1VA3s23lBmdTj4RFGcAY3LSjoWWwLTvWIUzSbfjuVsITZ1JP62eXJpeNVyiKKcKHF/Ge+mRnrH8pr4bx0gHLaKJMbHC+CpTJdWyNUQBGp95IfYgst8Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789356822; c=relaxed/simple;
	bh=236WAL/SVgLvSVtYPtEU82p2g0kMPt5QCc4VChf1E1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JDby9Bc0tDa7OibN/Dt9hvyDDPunSKVKxryZIehlQ3bfpV/HdVAvsSntJvBu5sy956SwtqDXotHk1ijoWA66ZkXbCRX/QzhFRUMT1QyPvkk2hVssN/0XKpDUd8wWmKbUADpY1yTm8oCi1CcElmCuzd8sYo7gY3rNLQn7qXF1wAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=xirn+Ven; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="xirn+Ven"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4hjrN11n10z8sqP;
	Mon, 14 Sep 2026 05:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789356817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zi/HNH51DYMqF6FrKwXWRt/DS3wGH248vhAG+zCzkeg=;
	b=xirn+Venw00wFe+IUQ/RNMvSnxo+YxdBpuOkeFNaf8GxFGck+yfpKHTWTVWaE8ewbq5Erd
	6W6Xsheui0UA/3iOKYpuHARwG2zg1EOslox7KPmeX9JTLVs+grgYayBb+4xe4CATN0votw
	KJDukKN8RQ+Sft9qJYtx6F6uaHRYPNODsOHITu9soAP6a7WUt8dxmUtT8RfoomqR1e3Fgk
	jSpzWcS6sHnSCXnjnVykK14cm+gGRmxRxK5/IHF63/JesQgPg+g+G2MV/xKjC7IVfHL7Pt
	WIgqHQzrEn/0kQthFqruGUszK/GfHLqZG6IwDsIKIBDHb05UHMRZLrf5pyqIyg==
Message-ID: <c88cad21-dc3c-4791-837c-49a6a41a811c@mailbox.org>
Date: Mon, 14 Sep 2026 05:33:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 2/2] phy: renesas: Add Renesas Multi-Protocol PHY driver
 for R-Car X5H
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-phy@lists.infradead.org, Thanh Quan <thanh.quan.xn@renesas.com>,
 Phong Hoang <phong.hoang.wz@renesas.com>, Hai Pham
 <hai.pham.ud@renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Arnd Bergmann <arnd@arndb.de>, Biju Das <biju.das.jz@bp.renesas.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm
 <magnus.damm@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Herring <robh@kernel.org>, Tam Nguyen <tam.nguyen.xa@renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Vinh Nguyen <vinh.nguyen.xz@renesas.com>, Vinod Koul <vkoul@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20260828192223.402422-1-marek.vasut+renesas@mailbox.org>
 <20260828192223.402422-2-marek.vasut+renesas@mailbox.org>
 <c2rlwdyn2xm3tti7skniz3uldwh4lly4jlqdmggqjm2a2xpyxq@nczmbl7tyqa7>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <c2rlwdyn2xm3tti7skniz3uldwh4lly4jlqdmggqjm2a2xpyxq@nczmbl7tyqa7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: 8bfkjky1pt3whjxf1p558bchj4awyzb1
X-MBO-RS-ID: 2deee22f53a4f685405

On 9/3/26 12:15 PM, Manivannan Sadhasivam wrote:

Hello Manivannan,

>> +/* Firmware update */
>> +#define MPPHY_FW_BASE			0x10000
>> +#define MPPHY_FW_CH_OFFSET		0x20000
>> +#define MPPHY_FW_NAME			"rcar_gen5_mp_phy.bin"
> 
> Is this firmware redistributable? I would assume not as like other Renesas IP
> firmware. If so, you should add a documentation about how an user can get the
> firmware, and package it. Like,
> Documentation/PCI/controller/rcar-pcie-firmware.rst

I will do so in V2 .

The Gen4 firmware is now part of linux-firmware, so I updated that piece 
of documentation and sent a patch.

[...]

>> +static int mp_phy_probe(struct platform_device *pdev)
>> +{

[...]

>> +	return pm_runtime_resume_and_get(dev);
> 
> Since the runtime usage count is incremented and not dropped anywhere else, the
> driver will never runtime suspend.
> 
>> +}

I do not think we can actually runtime suspend the PHY itself, so this 
is expected.

The rest of the feedback is handled in V2, thank you !

-- 
Best regards,
Marek Vasut
