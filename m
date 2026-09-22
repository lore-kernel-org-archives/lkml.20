Received: from mail-ua2-f43.google.com (mail-ua2-f43.google.com [74.125.226.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073C24766A7
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790068662; cv=none; b=Ggyd3FWp6fxizrzK7hw/PlU+VzSmVN1wD2aGuRv1dHxJo4ccDhGdwFc6Bgh04r3GhL64SJD+bmdvN+SBvH0gp5shhzpjOb2sN3Sk549f0Bs9TeeuRtCSZ74SzaESQoU8kF2azaWnshO8jNJVCgVoPkzpWuZ1+hBHDsNoZ37HUi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790068662; c=relaxed/simple;
	bh=CZ3oPkSBqFVLdsQgqxzEWOijGFMKadDxp1f+3SNDcts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ChXCak3sXZSGUQTTIuSb/Wkss5b8/itvakALUpzX15+9RrIZN27k/8LBe8+7ySS0H0vdi8/ug56xohLEp/fjd1Qx4TJgg1Wa84JRQCkyuoQ+tMYChbd5x0X5CH1DAVb5z8x/R5r4UufLT4GcMbklRBOo4iMPTXgvID2eimXEUyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f43.google.com with SMTP id a1e0cc1a2514c-97eaa1155b1so2060053241.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790068660; x=1790673460;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oT5SmnnEiCJkeSE3HgFIBSVwvA/3E4ZeuxsouiwktnY=;
        b=XlG3fEc4YCc97+LFZlCYKqDb+W3pCm/1QOEHH2CY2xqZlxG0xicQDsozyoDew2vd4N
         e4IYJi4TQ9ndo08LbT1La1aVMuabnXp4Xv4PLS0PjDwx5zTYnHlsmlFAFAS0icMLBU/f
         Vp8fzuVX7CqQ6hYEFomzNYRd65GN7HdVtQBbrtOT8+lxvhjmZTRNy6cJfmvZOAVP3JWw
         orNUnPzuSla41Ny+CFZxV0FM4B6wL+xyxF9auTUQ6eDgRsv56Zn9NbhSeqep5tOG7mPv
         /tlcbjLOqvwyhD2M3oY7vOicBb+u+GQcGMmrkSK0qSvyVnMz5x633M2m1xiwGHWUKNcv
         oOdA==
X-Forwarded-Encrypted: i=1; AKwUvByr6+zocFgxlJ2OBBSv/h3j9lS5cw5WDn8Y0XPFjgOz+CTFtWxiHNeshbc/WPytkCXHCE29m3UYGze3lOM=@vger.kernel.org
X-Gm-Message-State: AFuF++kpLlfEkNNtWRopX1IO+BF+zulK78L+Chlczo46N5+KuWJvb2oF
	tTGD5Yd3PnN7d/g47BNzrKzYJxHBrWlPpK1Um1PjU5R4llM5h6i3QYixnOWz5vzJoe8=
X-Gm-Gg: AYBFou1fTUJV98m6w0ApCrucZhaToXsfxcZ28tVntlm5j0Ht2/wzpmj94Ykg3fni45C
	N0Df4AsFLrp3x8ZJ/TeGPXRn8DvOb1FUEacOCILnIR9ZRLI5fDfnTPv2klzRywhdD+b6JEDX+cn
	iqVt45Zb8O9onDxwWyPsx9+pBgNeiJzWCMPqVXQOtP+xOJZZl29k1ZK2rF9uhpmDz8NK5yjWwrv
	KpcEBXWoGW8fI9qdxGFLeEeO9+5OOJcGnZKpgyDnHgiN2NPJ53RTcOT3HHabLoqIsiC0gEgguPJ
	FVdW4xvTw54mHqjyqgdLotbWEBnRtxrUBjFpRktvPO4zSMyvCQxv0KlMhPl4P4WkF6q1gEssb5t
	E35WXManTK2JaaZqm0wsUxm6pue50VQG99j1FCkAlHqHjj/VAHFIl3Owc2WRkaeKugrnvYyz7Sk
	CSkYPqibQf7hoB01cIPWQJG2NOtkeLvEXZDqwl81rsMJ8b22/uXTdNr9su/JzAq/CoiQRmDGyge
	X6sJRKPCYIrl/DjwoGZfS2/a30nv0cnQOXzX5nAxY5sIyU=
X-Received: by 2002:a05:6102:304c:b0:7a6:b18e:6d24 with SMTP id ada2fe7eead31-7a6b18e6dd7mr5822414137.23.1790068659748;
        Tue, 22 Sep 2026 02:17:39 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9850d661d77sm1109842241.7.2026.09.22.02.17.39
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 02:17:39 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id ada2fe7eead31-78565b4db79so2109195137.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBymBIjf3J1p0nukeNmqUhrYZ/OmGVbPnh/6LOGIZOvOATcxhncF1SvmOHGNf9uTas7w7S6bphJRLt6Ed3g=@vger.kernel.org
X-Received: by 2002:a05:6102:1492:b0:7a7:198a:c2b6 with SMTP id
 ada2fe7eead31-7a7198ad381mr4988859137.30.1790068658957; Tue, 22 Sep 2026
 02:17:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
In-Reply-To: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Sep 2026 11:17:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
X-Gm-Features: AclHuK9pjyjJZh6DYzu8j0CaKCcKmJ8CfBcbQ8aIBw9Bf-OTlVvyy4dIW39Xywc
Message-ID: <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
To: ricardo@pardini.net
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Ricardo,

On Thu, 10 Sept 2026 at 22:08, Ricardo Pardini via B4 Relay
<devnull+ricardo.pardini.net@kernel.org> wrote:
> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
> NICs whose PCI function nodes are not described in the DT. Describing
> them allows for stable ethernetN aliases (matching the GMAC alias
> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
> stay stable across boots and U-Boot and kernel MAC match.
>
> Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
> u-boot correctly adds local-mac-address property there which is
> correctly picked up kernel-side:

Have you tested this at 2.5Gbps? With which firmware?
I am asking because I have problems at 2.5Gbps using the firmware from
linux-firmware (on a different platform, though)
https://lore.kernel.org/CAMuHMdXPAeHoeaQbM9rXbXukoMbFV+0k28n6sRMw8XF8720WUA@mail.gmail.com

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
