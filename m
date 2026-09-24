Received: from mail-qv2-f21.google.com (mail-qv2-f21.google.com [74.125.230.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E588418360
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232659; cv=none; b=LlzVg8iLk6YHbj+UBPldk64t5uQFlrtlmj01aH9IxnC+ioA2oy5Ecm3L3ePq4qMIxLHjFg9ybD9YpEH5mDDLmU6YqfOtPKmDtUOmLu3bXXhWZd9FmBTu3yuv4tj2uTPgpvQcUknbXetxtdwbi3JziqvFhg4usf+G3e9WWcHJ1sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232659; c=relaxed/simple;
	bh=FdfaAL0trSoU1tq71ePewjKCGhNumJNlW4lMnJDUJrg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IO02/zx3io0yolskK660d+GYcMxghhEMwTaz9+8KuwustVo9JdHfCxu6LFiLp/Btj7B/C19u67tmPzWAWYtsYgQwDyJ2sRUnA9kzxD/sGITNhAOMDO6Wky+KAJICvs3qEThOwLiARIf5DY3J0Nj75iq/Vb0y8RCTZyHaEq65V6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv2-f21.google.com with SMTP id 6a1803df08f44-90cdfbd148aso12869566d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:50:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232657; x=1790837457;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WYSLaHavJ4PglZOT+cFIpQNUnogOMDphRk0Ds36kk5w=;
        b=O0AIBV3Cgnv++MJLsOo4PmmS0DMftd90VhpMM8uRP4cXfiPXL7ghXdXNsaQW4bO4sB
         o3gWhXUYZJia6PbyDrWKoV0R+FWytF/Dhw+Svn26XuUlCfDsxRcU9WhZAYU+2MMNkYbf
         f07F77t69hBheayiEDj5A69jJWmU5ymfzCSSWQCVpSf5x4/HujvDOxbxEh2Dqnu3TOg8
         U1lEq83uJecwWUUYT9lx4/mAaUD5Eua+UKIReXrPknBNWbICNYVCM+8JJTkHU+WbP7cD
         bhWqgFLvvz5hAwJBtl9IyGhf+0MePuuIKg8KXlb1sWLldPeAhjAFkMLJjiPY93EwJYi/
         z+HQ==
X-Forwarded-Encrypted: i=1; AKwUvBydER9u7gDnoeklO3aDjp+H9TBCngEbJYSk7+gooaczX/gK8tg4N1DRpJfBVIojtE6de9L+/aoaVMgwmr4=@vger.kernel.org
X-Gm-Message-State: AFuF++lXedwg0pPTxCjOwGByX9YhKPc9pJdIsBVtWnQwi+ORqeEBUCmE
	YIuoggj5Itd+speL0jP2cx/Ns2L5yHV44EwYNcOJ7mfodcNo3x/hT/nyRVIA/wCiErY=
X-Gm-Gg: AYBFou02suiAtcsy4u+dBgRyIPPNn6GiZjqI3rRjqgEaOIpA3mvwrBZ63AERXqJvkKj
	xMqSUDwieyTPef0GRtBwFPsjz1LGoSEtnKHK2V6awvVboyzjGJsNRGYNyUedsjtlWv3ClMMknmF
	MukWibEh8vXNZ7gJwHyMZvpiML4W+qE/8djIHi6Ei9MwKYcI1C6mmUKAoYjxJSffKXGMzgmrT6R
	d5pg+n1bj1E1YbMvd1qi7c3sqF6NxAZrQ04Aba+cTdBSTw3//OlOaUpazC+eWF5mX16uBMEnUPW
	f8ru+LarsiiF/J8ORMqEaxlzNUqRSk2ayQSitHhpJgBjW85lQRL2QfyB9q5zAcScLLYcr5R/LVZ
	pXIAjCTun7GpDPv1Y28Ku9UF6Nt8dIdy6KMikWjKWANJEdtUrw4qekh9S3FNgGFNW8uhTaFsqHL
	hGwWSSh5ruFzPUX1QEjEc7XmnHOJfV5R8qdg0k4/J7uFTTf706IZf88e9fA8SyKenPXIv3010gj
	8S9PDWwEHZIRhzWe7gFnG4jXBgrLsqsrbAZV2TwIyutleDB
X-Received: by 2002:ad4:5ce3:0:b0:914:1400:9463 with SMTP id 6a1803df08f44-91421cc6c9bmr11238496d6.17.1790232656522;
        Wed, 23 Sep 2026 23:50:56 -0700 (PDT)
Received: from mail-qk2-f43.google.com (mail-qk2-f43.google.com. [74.125.230.235])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9141e219788sm10849156d6.15.2026.09.23.23.50.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:50:56 -0700 (PDT)
Received: by mail-qk2-f43.google.com with SMTP id af79cd13be357-939eb3249c1so138303285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:50:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxW2lpGGt47Y28yNDzGOk/dnd1+t8nJ7oF4EJDTUWVThhpNp6RLw2jM3OD63LnVYvgD6ZuAiE0RUtTqozg=@vger.kernel.org
X-Received: by 2002:a05:6102:e0c:b0:7a7:a382:6bd7 with SMTP id
 ada2fe7eead31-7af1dadc05bmr812949137.27.1790232328063; Wed, 23 Sep 2026
 23:45:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-rk3588-dts-rtl-eth-describe-dt-alias-v5-0-c1b9e5f10cd6@pardini.net>
 <CAMuHMdXMjxgj+pT5A=jd_A5BVQctHXJqeiU4EhPA_ZSANZAAmQ@mail.gmail.com> <e166f6e2-05b3-4f36-a1c3-b75861618c75@pardini.net>
In-Reply-To: <e166f6e2-05b3-4f36-a1c3-b75861618c75@pardini.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 08:45:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+Dum1VaMOQx9aS_hBn1Bmq_mZ1qaH-WegK7Q=pEdmTA@mail.gmail.com>
X-Gm-Features: AclHuK8sCbd_Nwk8hcPDRDy2MSUfMylLVdDaP4Bmdtue73-db_SXAulz9teSuSc
Message-ID: <CAMuHMdU+Dum1VaMOQx9aS_hBn1Bmq_mZ1qaH-WegK7Q=pEdmTA@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] describe RTL8125 PCIe NICs on Rockchip boards (and
 add DT binding)
To: Ricardo Pardini <ricardo@pardini.net>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ricardo,

On Wed, 23 Sept 2026 at 20:49, Ricardo Pardini <ricardo@pardini.net> wrote:
> On 22/09/2026 11:17, Geert Uytterhoeven wrote:
> > On Thu, 10 Sept 2026 at 22:08, Ricardo Pardini via B4 Relay
> > <devnull+ricardo.pardini.net@kernel.org> wrote:
> >> Several Rockchip rk35xx boards carry on-board Realtek RTL8125 2.5GbE
> >> NICs whose PCI function nodes are not described in the DT. Describing
> >> them allows for stable ethernetN aliases (matching the GMAC alias
> >> convention on these boards) and lets U-Boot's fdt_fixup_ethernet()
> >> inject mac-address properties from its ethaddr/ethNaddr env, so MACs
> >> stay stable across boots and U-Boot and kernel MAC match.
> >>
> >> Tested on a NanoPC-T6: /sys/bus/pci/devices/0004:41:00.0/of_node ->
> >> /sys/firmware/devicetree/base/pcie@fe190000/pcie@0,0/ethernet@0,0 and
> >> u-boot correctly adds local-mac-address property there which is
> >> correctly picked up kernel-side:
> >
> > Have you tested this at 2.5Gbps? With which firmware?
> > I am asking because I have problems at 2.5Gbps using the firmware from
> > linux-firmware (on a different platform, though)
> > https://lore.kernel.org/CAMuHMdXPAeHoeaQbM9rXbXukoMbFV+0k28n6sRMw8XF872=
0WUA@mail.gmail.com
>
> Hi Geert, yes, the RTL8125's on those boards work at 2.5gbps just fine
> (both with and without the fixed-function nodes in this series). They do
> get quite warm at 2.5gbps. I'm using one of those el-cheapo 8-port
> 2.5gbps switches.
>
> Currently:
>
> [    3.254450] r8169 0002:21:00.0 eth0: RTL8125B, 8e:b4:90:97:32:30, XID
> 641, IRQ 124
> ...
> [   10.480872] r8169 0002:21:00.0 end0: Link is Up - 2.5Gbps/Full - flow
> control rx/tx
>
> # sensors r8169_2_2100:00-mdio-0
> r8169_2_2100:00-mdio-0
> Adapter: MDIO adapter
> temp1:        +52.0=C2=B0C  (high =3D +120.0=C2=B0C)
>
> I'm using whatever is in Armbian's armbian-firmware package:
>
> # ethtool -i end0 | grep -i firmware
> firmware-version: rtl8125b-2_0.0.2 07/13/20

Thanks for checking!

Mine is RTL8125D XID 688, i.e. a different variant.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
