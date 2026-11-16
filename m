Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794828229;
	b=W9XKPfW5//9ig5vO0JVvaakphQOn1H6GMnlgrBRrq50dZL/k+2atrK202kzOauQD9wL9
	 sJD4Tj5Crwwb0KnjtyWJX7FgPaGy6ZEx8aTI9VDsiwos9faNNjuJyDjDEaCfvMt694qQk
	 rldWTkjhU8+YVNJL2AsdLqatfImAubWnUQ21CsBm44lVYppHo3T32IPOlYIsGSp4z37Wi
	 JXTm/10H1EF7O2L0+TVkMavke3MWb6ZAAhsXDjuCqojnkOzDuS1JM32NarxxOjtR0Z73a
	 gt5xFgXZKFjiGEyO9TyZU/jaU5/gcqv89vt12sDspTUP23XynMSbdg7mWVJHiRE9xkg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
	b=rBc2ak1WATmgHKnJi0ltbKzqB0sAmovgbB5uYxf2ut7NMppLx6mcjv6/ErKr0/eQVmKq
	 l4XJKTq8Quw/6HDa61nSpGlVNrBbkN6Benuuo/xxGfMqe5zI9IrzeY7lSjsWmyhgLLLn0
	 5GpAopUczzdH5lOkkrIJQ4S2EcqahL/ZGTWnAOgeqTYvkvhRmR1MHLsjcmWaOmIjJdIdE
	 2nkXMfEBdgMtUVpVOPqRkwD5WlipSn1oroKRrGuMzZ2XJUwbYHaQnkuWiayRotw11yFWX
	 2go73JTiK1U2F+kOmIE5XGSFW9oa0a9x1UIgX65Vc2iRDbJ0NQ+HbfI4GRn2tBui0QQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTPv96oK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64D40606AB75
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64D40606AB75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CTPv96oK
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-49d64a88222so1336127f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:23:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794828228; cv=none;
        d=google.com; s=arc-20260327;
        b=EaIwXDpDRtocpDpNSyIWvlFqzhFa5YPbR1M9hXlxMFiLry14Vnbk5UdNE7ifn0oHzQ
         KEgekC6ZOC6iFoPCuGpBUnleTbuFNBmK4y1gsIcUGvIJbYa4Y17fvpGc3mPG06q0LckV
         lFbDO4N8s13+Fyf+IS2UevtXY8jxBFU58+6JcK508QxsbvkrIwhvgjIsfctz+7z1UcMs
         44tfWsDhE2YjW8KxTlLYk9WLtnekF8IVUby8YJtQRcjkkZrcv8OF7/NZNHS1hEgYS8J5
         LT5WmvdhGsxg3ggfSMIhd2VnrTs/eD+FFiYzQ5McaG9hVTSjRRFwN4c3fvq907Pedcld
         hPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        fh=bqQtuWjXWbsiOedoBQVkkMaDm92uSqaIhO1YT5O3jP4=;
        b=Yu5kXvu+RwoUaJKqtW55nhjyj8hLhaTe4RcXXnfcgOftJH2oZI7LEC0pjMKk0z6COX
         qM1O5U2mG57vRimdVKuC2/yG5FaQ5spvRbj5IQV5PjS4qzsCxneEPXg7Y/SJTm7LbmNB
         DOrWT0Ka9O/Raisjf/ymRKoHrunh53zNMOv8QMvA3yRnpSxONBsC2WXva84bqyMVFvmV
         aQGOuSvcDgwVaOFuaR3+wA5eqDSXaexvr6F/ARZLW90ajCG5888fedsVlzMTpGcfGPtH
         QZnXfY9SsqFhJIAkrhA6+nOMImKCwe6HoxsOO8tNKyCcs3mfhbhMUBv92EmRh9/gpdd0
         /TVQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794828228; x=1795433028; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        b=CTPv96oKruVMu5+1xy5CsLjHaPzMA8IUmSwT+AGs+LX8npV8stuzU+uRYRzRWNauOv
         tjkz+gsdmZ0SDshzFDlbLZ1T0IhQL2lqUkfhF2LEuYdMDv+N/K5YFkAZGa0mPIHkywTC
         qhxfI4FN2t/ruCC2Kjt73UBpWzzvmzlpJAKPApFd+HEhy8iHoxHORRtnl5Ci33nSdkKa
         VJxVf2NGnAsYyvnY4urlpq9wZeSzHS5WUVf9DzjbOf9TESD6UowIX84AFRHNKj1uRG+X
         hiCbiK+gE/h6cLOlM8CWcm0S7vF2s4feUUTFSC1M1RBy8ibT1M5M+hs2auBf2X10FThP
         DwWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828228; x=1795433028;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IFTIRi6DR/4GBO7pnHZgtAC31IQ40N5eezi1VUpmpyg=;
        b=M+enGOLdVCmZkOvE6l8NwYJn3c+SIcT97V29aqf7PSG3bfSTR6c2r7ibNED9jWzNCr
         OnFjOwH5uzBjyfCHE8GF9m20qKYyGdKMxH/R5bRTfHIoLxs1MSbXCU11n7If5+dMVXCD
         4IqFxE/J88qeNSORspibJXNfKc/zb7oPr/e1Oe8KI9PLXB5/uNGn8CiLnO8gxd9+txYu
         JRBXb+NpQQhZ1oO+iG1oOt8fb7DoUaEG+eSy9LhO4A45B+jmsl+Oqm7ZQUC0+8i2B1Rx
         FS3+lCINWmsvwwSbt8BbD8qGvBSA56v8B2iH/n3IWyYBy6OijE7nljnTRYBoPDuaAmK0
         Z+LQ==
X-Forwarded-Encrypted: i=1; AL+hErFhzZjOPzGklg8JD5hsY7Dxxr+x/eFQ0C11BFy6hR4lbfH+8uUEC3JvK/e3ldYsq/Z1Ru6H7dKgDO5orNU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/k6wyTcQryR5OSUxlNHBrseThyHFlNj/xLV+gUypsnH4eg7v1O
	0CGEscnXoOF1LrzMtA9ZzNRKj/y9a5WCKgcNf0U7iV3U+l1nUAJTBK4uTkQH02oOvjppkuzR6HF
	grZGqrw41wDi5MQyoVxGnoxihdIWnPzM=
X-Gm-Gg: AZFdTZeV6u+Y7kFuH7Z94DsB9x//Qce2LuneThvb5dtRCDPtU3dT5YUTCaV2Lki4Irt
	TgxzWI/BMiT9MnUdpJHpfnMF25Ls9CtF+stgD09FMtQBEh5h8WZmPQgzTLfFB9XrVOS8oBYXUXb
	nFQL/dTWRI9NPVgSY30ApuhlhRb0Nz8L7dqVMzJWU0kATWp6GWhBqqog3k/Xl2bC1LBl+0aopZ5
	iAn+HPMq34Tr9f3+FRbb+DPQtjArgh3LwctXtZlFpRxoOlvA/lRKApHblfGVVqazT7A/nVsqO7x
	wa4dWUP+aTbdvZ7TrkbXrxouoUto8nwhTYnQmwWS/6X3jWFTYkvBUrzSm3UXXEo+sxa2fw9vEMC
	LlDsLNqHjX3z0E1+ap7Ceu7s1quc1S8oXgXJ24+XPXgeiABLDa0AEbXKMs6cucII3qgc=
X-Received: by 2002:a05:6000:401f:b0:48a:f4d4:e1f3 with SMTP id
 ffacd0b85a97d-49c6ff8142amr23541572f8f.13.1794828227485; Mon, 16 Nov 2026
 03:23:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
In-Reply-To: <20261116091757.1656602-1-magnusleatti@kernelriot.com>
From: Giuseppe Nespolino <g.nespolino@gmail.com>
Date: Mon, 16 Nov 2026 12:23:35 +0100
X-Gm-Features: Aa3M54rcJmWUc1Ncq_Fk9iW3VcokWpJC0yoijn8Jeo0Icrve_bZeoYCpsWMQggs
Message-ID: <CAKx9m6O=uqC16v5-swStrtq4xzNzExbM0xFoi5znQOmnwDvSZA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/2] net: stmmac: dwmac-motorcomm: shutdown hook
 and Wake-on-LAN from S5
To: Magnus Leatti <magnusleatti@kernelriot.com>
Cc: me@ziyao.cc, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Magnus,

On Mon, Nov 16, 2026 at 10:17 AM Magnus Leatti wrote:
> Giuseppe, this is the OOB WoL enable you and Yao discussed in the
> s2idle thread [1]: it is only enabled when powering off, because only
> a chip reset disables it again. If you can try "wol g" and a power-off
> on the Slimbook, a laptop would be a good third board.

Tried it on the Slimbook EVO15-A8 (Ryzen 7 8845HS, BIOS N.1.14GOS07).
I ran Ubuntu's 7.0.0-43 kernel with both patches applied to the
distro's dwmac-motorcomm.c and built out of tree, so not net-next
itself. The module also carried my pending reset-on-resume change and
a register dump, neither of which runs at shutdown. Magic packet sent
from another host on the LAN about 75 s after power-off, on AC:

  patched   wol g, BIOS WoL disabled   no wake, 1 of 1
  patched   wol g, BIOS WoL enabled    wake, 1 of 1
  distro    wol g, BIOS WoL enabled    no wake, 1 of 1

One thing worth knowing for laptops: on this one the firmware gates
the root port. \_SB.PCI0.GPP5._PRW (SSDT23) returns {0x0F, 0x04} only
when the BIOS setup "Wake on LAN" option is on, otherwise {0x0F, 0},
and /proc/acpi/wakeup shows GPP5 at S0. It was off here, which is why
my first attempt didn't wake.

I couldn't check for warnings from the shutdown path: the journal
stops before devices are shut down, and I have no serial console or
netconsole on this machine.

Tested-by: Giuseppe Nespolino <g.nespolino@gmail.com>

As before, I worked through this with an AI assistant; the test runs
and their results are from this machine.

Thanks,
Giuseppe
