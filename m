Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793953711;
	b=Y1tw/FVGf6E7qGFD7Fd6T7TMkqHKBZY9yNAgsCsj8CZKQ4v9e0M6X711+PJZfi/bP6LK
	 nBZjHW4VHaxo7qCMZAlFVtH+SGtto9aQ+514KBF5T+5zoVDPhe/ccRAgI4Nfqrl5+UIXi
	 paIIQcY4d3uWhrNfqNaIJLJEM6SQjfaibRNbJQzyN1d/giuxLT2KTCvIImtZ+Vds+BL2J
	 +eV6bw8D7GAwoh1z2ANu1jem7ftJ2T6FqZBOr0C2ofZSFucPbA/ji27SEIraTqmoXeu8d
	 U4jKa45a3Mqtj8E4mtNej1wM9YnE63qBRVZ0yIEMNDZ2U9ztRAhoIDRsG4y17QcG1OQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
	b=wZwJ3/6ZApjVfsxWPgFIkEJUaVXBtC9uko+exETUpkykZOl5XZWYKIebwvDpDR6aoBrC
	 AZHFAOlaI43Ea8c0IsjOQf/DuEJK4Wgam059rf62mo3sFd8/9c0DISIJ2q/yOVILrwC1S
	 yCvuMbJdUwwNZOStzXS98ELScbTOblkgLb0cCCr5XGuYK88yaKyWY/WcoLxc8NfbAOHLs
	 MEnPrNxuCBKeo5SzvEgSZ4n7Y/lxHnk0lmxvMlfK+9mxqnZoLP/BiCw9duEw50KLn/jZl
	 fR0a3TiqBfxbDmBHEImDzsAgaYH8CA4ctEH4CyEYiy/AGWmK+gBNl7m3VK/iOU38o1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hEnidWAO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC53606A330
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:28:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AC53606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hEnidWAO
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc91ddf447so144759137.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793953709; cv=none;
        d=google.com; s=arc-20260327;
        b=X3YphnZecVIh6IgjmmcNeO8nUBBJAphDRrppSjpadbtyvAHc3C3FfD0sUF0/tB6Krb
         YE+/FXMLpCN+S0CicDkvjQ/Ij9PVByWheC0TkK8JT7f4y3bSJdVufyjNnH7Fqm3dzDx6
         EepVTcC75V96hQkPfu191SswGKpD2YlD1icKWrKDoyoUU/7xF5iqrpjWIGZSE/oXoxrA
         Ss2TJo52IRkjsSjudWMN5XMh0/tiRVLMoxMrX8m1PZLl++NLGebZq3J2cq8NV7E9ccwq
         k5qG+KEsK/MjdgowGZzlEVjmmpvz5IKkkX5ZwgfBZQbXakODCH2RTnBJVlaiUr3Pmw3B
         INqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        fh=6dK26Z49AjTPt/ovBcvzgVP5pItKYkOlV6nsOSnGcKM=;
        b=cjr3D+Ima09NR6mSBvnmRLckjv3CvB1YaP+gfcI6yYIntQf1xlpyiNAI8uMw/813CD
         nuvj1hZO1PGy6OMMpCDUWPu4ELPLanfMynFnzN4zB10cECbRBuwtEvtWor4RLSCuioG7
         ETEe8SDUPK4VwMCwv+bOBYZeb9dCqShqiPjwyS+yidIx96WB7jZG6jLYFIhQ+DRDXupl
         clWR7RQwEQbeuLbbkf48CtsJ90BZzK8QEBxBdjzsskH3cn3EVE1wxDU1B/9u/dgqTgY3
         N7nRnpfLN74XnEwHmPBh13tIRXnIKkMjwWak4x0CjlqlPfZEubKooM8DTW8X31WW18dc
         pDTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793953709; x=1794558509; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=hEnidWAOoNvV6D6mWgt+NTpHcZsp1xjMeBUNPwCRx84h3Jl3GOUx2gQELSrYjSaHDi
         0W6/i3x9m7UqYVVbLBvHz2w64pYRbokNhn75xH24jGXObbpD2fhhjjAMGUSvcrVrDTVa
         /jzoJDlBRtagL/bc4wjkluMtwu5D8SBRih1UZVI4RVmLaqhmrJ/Vk026G/AjH81BZmlO
         QEc4CbpBUL0kFeLIGY1qz8yLx9/OsaJIeL/dEBlW8nKQMovNTzz2fFn9B6LdrqIFWCm/
         lxdV7eqo66g0eXlu/08mtdtpfyGnDFYhuMUDCwkx00DM1SKUJ9N4cKOOrGXQVc0UHnCy
         Txpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953709; x=1794558509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=jdhek9EpFCjRdWhWHQEmil8iqeFX5Uqj+6o2UP8tll0FL8++hW7xXdbMpydx6cBx0f
         m1cWJplSWo/970k4jG+X+yBV7J7sZAgYCXAxTTXzQukeH0iurkZwqqjwoDGY9AsiLngQ
         eNilUdUfw6XbvLniTtvr9rPM5atAcEp0VUOFyVffVjFNoKkFtg0a52gIZ+/BCp95Mwsy
         3jwxDbzq0IS5aZ/IYeIpOrG0sp+XDymTgZ9zv+trpSfJsIeUlkuZBOLKBJT4RDsYPfD5
         VyLslTDCNyGy53TX/z8X2UIwDBRQ5w3E2KzZeyyHS0K49hqVUtVFMtzDQyAQdL4BQjwb
         usDQ==
X-Forwarded-Encrypted: i=1; AKwUvBxttmizmq3M0gDAAYMKdkPmWTCVLPJAZAhdM0R0IRuTNJw82taCSllxWbO79Zf/eQ1AZPPPkHW0mV3XmLU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9OdgNm5RZ8dXKJaxN9gJoMdgTPwJaBASby3e4WG+fnANcNT+Gw
	qSt0zh6W50jlCIm5R+dh0S8PpyLxpixDyO/+0Uainrwxt9QWfBJZ3262zHEBwFXrlrFdQO0dZ/1
	3SsX+1SJEUgJb5rCK6kGubDRgS0yC4WA=
X-Gm-Gg: AYBFou2kKcz4UZb+JG0y49doNMdWXFpRQj/gfgyf+XBDRTB0X3bsb54DcEiQdcUCS+x
	ECWEK90pjsvRQ1MRl3+XLZiwWCBRmIdC4P/hyAKap+eWKJ05P7PYJ85rUHWh6OYD0QAPr6YDv/X
	sPoU6nLRzDYXaG2AJgiOh6jpTL2PMHYxYE0HIukV0N0CevuG9GXDlkyn4xX30tPZglF9VVdDZpo
	AAo96S+8eMo6uxM3OYmOzlwJCsGyaImsM0BlBRb3mDfjG2zUef7i1kEFDdyMwfySTakOtV0kG17
	0f7WMkZAfkPmADPdl/eiE86BDqcljHhBgUQfqo34zVMyXytr6xQ/JKPLWwE8R3wn8r207R0Fi7Q
	gbAZ9VNMSrWioR5FDtJLoXPVZQHHXBqdc9hvbWQfWf/9q453C8xSIl/sSQ9/To9WzxmDwpTK/OV
	uyswKQ9sl9IcplGW7IEwROvolelBU59my/esyQSYZ9xTJlUcG98yiMplb1EWfDTjk1Hkfj9xJWF
	WljkxoBnkzmOYSvSXPxhBSpuJXdjw==
X-Received: by 2002:a05:6102:4bca:b0:7c3:8150:83e7 with SMTP id
 ada2fe7eead31-7d2a154169emr1074240137.9.1793953709418; Fri, 06 Nov 2026
 00:28:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
 <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
 <20261106-crystal-flat-caracara-ac1b3c@quoll>
In-Reply-To: <20261106-crystal-flat-caracara-ac1b3c@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 6 Nov 2026 01:28:16 -0700
X-Gm-Features: AclHuK97Q_fmR3tCSb11vsNOkfJ9UktWDyo2C1YoKfEXjUnSy-Rv88kHCKF-O1Y
Message-ID: <CADvTj4rYG01pNxZS3FAKzHw9yOO79W-zMdBzaXvV_hrMs+sp2A@mail.gmail.com>
Subject: Re: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 1:19=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Nov 05, 2026 at 11:55:36AM -0700, James Hilliard wrote:
> > The H616 NAND controller needs its AHB reset to stop internal DMA and
>
> So was the device working or not? Be explicit, because this is an ABI
> break.

Normal NAND reads and writes worked. The failure was in recovery after
aborting an active internal DMA transfer: the controller's soft reset
could leave the first subsequent read displaced, sometimes without an
ECC error. I reproduced this through fault injection, not ordinary I/O.

>
> Best regards,
> Krzysztof
>
