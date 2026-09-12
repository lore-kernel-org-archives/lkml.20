Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8D626A0D5
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 04:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789187578; cv=pass; b=NGGlKZlqzGXPJOXj3GEd/CvrLM2FLxWzjeZzDF3osMOXoxbUsWSr6ucn4WBHlqKy3JIaDilJdWvu5edTXw9jicJ94VJnVq1FInKFLOeQv1HFQD8K6jK19TbbEU/zMhucuE4gbiPI+oqWgjWq0NYvxLHnUmm43ekSik14nbAX92U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789187578; c=relaxed/simple;
	bh=vJxa2A/3rOOORvzNhRcBlzIBKMNk6f1s0vIeCYqnmPc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lje95T1qyyAtFnVOACeApS8vHY2wdMSkBTlgYrxLOa+FPQ3Ae/0CjfXL2kQwY9gL4nHcArqIVF4o6XJNQzDjORjcfsQvi9OOSlv/BtK+sJ5oahKXsSycKOfzJ4DgHXLPTLk0yuwE3hgb55jLfaAk++wqenuMr9TRtFMLNGP/1ms=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuHcBo+Q; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuHcBo+Q"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e211a0so199992b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 21:32:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789187576; cv=none;
        d=google.com; s=arc-20260327;
        b=YOxpVk77H0loqyGJPbMvggosPBGZnFCUIWxhsDTb3mxMK4YhSAlWjjl5HtfnP0/w+/
         PP0r06E3OpPhfPue/IYCfXdIhc7zTxzdRfQELY7uML57KtXhGkB5Cz77cuicIk6xMY6P
         Fame46ZRJ+Gc3FOCWiEFZwciW+xREGFt1n4nbaa/QLQlHSCUs1gwEXBKcSU1o9+8NDSn
         F/gbdZMQ+07yeimYQtlU2RGBHn0Dr7G6XDKBg29I2w/NMZRtphqBcGpEyoHIEwbYzqOQ
         Gj7YIyh3JMapCnnK+kSos31DmlfR38yycmSMCjMZog8cQeLxefnXFMv6sjtcopR14k0H
         lQIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vJxa2A/3rOOORvzNhRcBlzIBKMNk6f1s0vIeCYqnmPc=;
        fh=EklIXtYn0QGV3cASc/NAXx+SBNY287Sl/6Rz+ZKJivQ=;
        b=IFM4oxkNRKmXZNluplh8W7PelbydJisuQ8OafN1HgrcjPo8WA9kU6ESa23kOGyQk57
         Oy0+oKZQYOoG4nF50Eghdcb2pPoYlUbwKPQWoLBeFANi9dpmifqx6JDD9RXHEkQRFQm3
         nUvQ+FCVKESvpcofosTbw7Y3CSGFmI/JIsF+3V5B50gex5a9H5hF/6l77pf99IIEzhFM
         BnJkcw6DIoAmyOf4jmCLP63TUuRV2F3wlBhTzzyJcBF57bfEdvh+kwIVeEmE9aztf3E8
         KyrkCb/K7qQBShehOhjD+s5hX18L8eACMncMYXvNFISTYGMQ1mRNppq5iQmi8o3r7Sqp
         xL+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789187576; x=1789792376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vJxa2A/3rOOORvzNhRcBlzIBKMNk6f1s0vIeCYqnmPc=;
        b=YuHcBo+QeGndKfamSszK9WPfkbor+lOXuRfip43WQrQLCRVscGY3ywaPXoB2KWCgVx
         ORz8EcQCGRkuTCP5XcY0ZWTWwviyiF6Ze0Yth4j2KteM/12DAfw2c/t46QBxoVtnrMjM
         6dSx4149ZTHP19Ggi8z+Mlf+FTRdWvtP3aV4vk/nwwA2/uJXWCsJ50cIFApwS/KvhKXo
         r+afkKFduo4qV17i8EJHgowASSz8m48IiES7qWeYiajNhLWpg0e11pkCugTmZZtr2vvQ
         NGCdAypSY9nWH3rOPjQzUriNCH++qaVd1Pk486XL3xPGdNure/3PaWLZU2/yO7M5MsU1
         LP9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789187576; x=1789792376;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vJxa2A/3rOOORvzNhRcBlzIBKMNk6f1s0vIeCYqnmPc=;
        b=Phl6+mX+yOd/eMe94cO4T0XjXSFv+kWJyomdGkW3ABMdh0UmaSPn3Jy7Ps/QqQMJjV
         A/PDxveT8kfaQKBv8yc9Ezm2aI479mUxPZrewpSULBHp3IDKx/KnNCPw5nUziQZ7d+88
         qwxORpSpVjmHgUdC7Wlu476VyQMYt20wu/cxpRFzlCW7e1qy1Wzts+yNRZU5loHTZU4k
         pH6zY/aNXuXAMjbkpdb3sE7tVagbqH9o26WoFPBb7u0jfziHyG3eg/I6tAusmig4NVJJ
         TmPgbSlsEai9pi4VY573s8vK+/9O9zGhAk/TCJZ4npwnOegmwpe7ON0aNiNCE4JrME7T
         D5xA==
X-Forwarded-Encrypted: i=1; AKwUvBxUrJyNKuNAKtgCbThEbgVSmeKdCPP4JCzmqpKv3TmH06T2ZuKFOmkUINCQw/NDBibatNNiCZFYMgADHI0=@vger.kernel.org
X-Gm-Message-State: AFuF++nT/jY+urbRrMgps3nD/wkMFdWycQz+b6ULy2nkiqFv8R1W3Zf+
	glLZzkyOprpOnuSGQ84aedYqQMqvaiLGL49qDT1iq2XzpzoHiof7SGSi5Dd2AV8tvDk8+qrm+xI
	8M5yc9wfm/my2lBbovIgYnQBAbB2gRLszVWZs
X-Gm-Gg: AYBFou2oWPt/UlIcIE956K3PDtgHni48LClNKg84s7C8091+9yVnOSMKhNOSmEyV5oZ
	d150rDgEQHiYrOfBqp3QzQaSOEQisSBoJbz54e/O+HbkTCLc7IdljxWd0Rdl6xNC+PAtXUAgYfp
	pGuXhCchVl0OG7EwVEM85B9UwRzO6K262wgrWO23t2oV/k+zoAR7Q8LsS0PuMKUwbcLAu+WUwIS
	XHl3oZPaSsC7JrWxK2IFLSAiGfnHkd8woni7+9bM1dSfjBPFjpjFpyfjwbvGFP6CrIBtDfSO/Et
	3UiOVPBkJxh722M7kSlRIZK6Zt5xBn59uSH2mKnLHK7GlNu2V6BD8du5JDyLQ860X2yRHFvbvPE
	PxZxE7FtbJlNypyxYxZcbsAcThXRxH9jPq/TuCPZ+OPXWIqPq
X-Received: by 2002:a05:6a00:9286:b0:869:9298:ba59 with SMTP id
 d2e1a72fcca58-86cc58b3feemr1893927b3a.0.1789187575535; Fri, 11 Sep 2026
 21:32:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807160526.379-1-strst.gs@gmail.com> <20260911191429.GA549927@bhelgaas>
In-Reply-To: <20260911191429.GA549927@bhelgaas>
From: Semih Baskan <strst.gs@gmail.com>
Date: Sat, 12 Sep 2026 07:32:44 +0300
X-Gm-Features: AcwNN1UPlx4zHiHBwu2SiU3dxKzddih3M0ikGVdRzc6FKwE8r_Mspr0-EsTYEe4
Message-ID: <CAAsRjR=F7_7M-_tC_u1WRxB4Toj8nbcQh0WeXuNhzCQAs=vbuA@mail.gmail.com>
Subject: Re: [PATCH v3] PCI: iproc: Use the EROM outbound window on BCMA
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, robh@kernel.org, bhelgaas@google.com, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, rafal@milecki.pl, 
	florian.fainelli@broadcom.com, arnd@arndb.de, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rosenp@gmail.com, rani.hod@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2026 at 02:14:29PM -0500, Bjorn Helgaas wrote:
> If the EROM supplies the information the driver needs, why does this
> BCMA driver use DT at all?
>
> AFAICS, pcie-iproc-bcma.c doesn't use any of the information from DT.

It doesn't. need_ob_cfg is set only in pcie-iproc-platform.c, so the
windows devm_pci_alloc_host_bridge() parses never reach
iproc_pcie_map_ranges() here; the applied patch only had to get them
out of the way of the EROM window.

The follow-up keeps bridge->dev.parent set by hand, because the wifi
nodes under pcie_bridge0 in bcm4709-netgear-r8000.dts are resolved
through the root bus, and frees the bridge itself on the error paths
and in remove(). The one DT dependency left is the IRQ, and that goes
through bcma_core_irq(), not through this driver.

The follow-up is in reply to this mail: pci_alloc_host_bridge(), nothing
from DT requested or handed to the PCI core, request_resource() and
release_resource() instead of devm since pcie->mem sits inside the
bridge allocation. The ranges property is still read, but only to
compare it with the EROM and warn. That is the warning Arnd asked for
before v2: the same property feeds the platform driver on the same
nodes, and on core revision 0x01 it is wrong, which only a BCMA boot
can notice. If you would rather the driver did not open the DT at all,
that check is one separate function and comes out cleanly.
Both shapes are tested on the RT-N18U (core revision 0x01): the warning
lines match the applied version, /proc/iomem and the enumerated devices
are unchanged.

One thing changes with it. With PCIE_IPROC_PLATFORM and PCIE_IPROC_BCMA
both enabled, a core revision 0x01 board now gets a second probe from
this driver: the DT window sits elsewhere there, so the collision that
stopped it before is gone. Revision 0x07 still collides. That
configuration does not work on revision 0x01 either way, since the DT
window there is one the hardware does not decode, and Rafa=C5=82's DT commi=
t
was tested with the platform driver, so I take that as the intended
path on mainline. It is in the commit log.

If it is better squashed into 552aa843e4c5 while that is still on the
topic branch, I can send it that way instead.

Best regards,
Semih
