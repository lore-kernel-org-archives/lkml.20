Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822739;
	b=OcAjqBNIpNJRL4+AmANwzjhReI4m4+Un+Z7SMHfu3YXhNzZt7CI6Y4AhYEdiItrZTSxF
	 998mIuSSFErkRCCGc4mAgRYBIUJiOKObpgmpu0TfVLdjhaQ8Hn/SHW6VpUlkDysNNZZeE
	 i+XTBN57z0KHOFCojXNJTbPwITT1b4plwUKXY87hfNeqblJCvFlt3r4soZ4LUJbzj0jPv
	 I63Sbq5JKNot/KW6Gb2fcflSIt/1yXj5sWkpiF1WMiDWKR0N0+5R678O3IXYG2yEdBYMt
	 h4nlNb7rNM5zheiyY/bPUCifmpv8EbbnqH4QKtlXNlfIGpYrGDQj1KDBwAbRayxvztQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822739;
	h=DMARC-Filter:DKIM-Signature:Content-Transfer-Encoding:Date:
	 Message-Id:To:In-Reply-To:References:X-Lms-Return-Path:Content-Type:
	 Cc:Subject:From:Mime-Version;
	bh=2iklAlBcpFJxRr/HPLPp4nje7OoKOirn0CCaVROWVsk=;
	b=Xq2PI2/J6K6gQnQ7XxiVW+pjH6jC5pb5UMlC1Zd0n3t9ARObqsl2lgzlsBhQ5fWiI4gd
	 7FIdxha+oK2S1+P4LOdojQ5UAqZlhnQZmnb472NxGRlR+zfxs3n6AcWQUurH3b457pYbP
	 JeFpELc4zUCYX85LQn36hLe2t4ydU0D7wNXnUuVEJxxcq5y/qfMlK7cr4fSkYPWTMhV/f
	 syT1TURqITddBYVyBoWIdZwLgnNMLeChXQzzgXeI0bb24oXtYjQYbcBj9JU/2xMGE9PeD
	 YYmEsg8HPaDBEYXfj6x+yBkXYgWysARST9IQ+ii4B42mR4eomrZPldhtwuIfjKWXb+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=deepcomputing.io;
	spf=pass smtp.mailfrom=deepcomputing.io;
	dkim=pass header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=j1R36lNw;
	arc=none smtp.remote-ip=209.127.231.28
Received: from va-2-28.ptr.blmpb.com (va-2-28.ptr.blmpb.com [209.127.231.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B0F606A884
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B0F606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deepcomputing.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=deepcomputing-io.20200927.dkim.feishu.cn header.i=@deepcomputing-io.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=j1R36lNw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1794822731;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=2iklAlBcpFJxRr/HPLPp4nje7OoKOirn0CCaVROWVsk=;
 b=j1R36lNwjUJ2addpgThY4YRKGX9vowt87a0A16L4g8HECGOeaVFtirnSJnzZYO2T/lctba
 bMW5tENiSmXuy4dRDwDsno+bvZOjZfcv1T3TAfvaUpkQ9k6nmwp9+8Fs92F2rx7cfNnEdU
 i+/wkUrokfrUfeV5JRwqYr/PY2StxwlNDvmVodmBE8wFnSWzi5CVEX9YYLbZ/wu1TrpSzp
 rsQG4ceW44HekJQLvFCkgM8BXG5DfH1Meurmf3gmzSpke/y5/oySyD+RoeaQ8WTm3tv5qq
 P7tsZPQFMHHFmqEFcbD32PCALoBReuKOReej/ov+48ydzegHN6EjoJIe29uAcg==
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 17:52:08 +0800
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.63da97eb.e7e5.488f.8751.a4a1c53db9df@feishu.cn>
To: "Yixun Lan" <dlan@kernel.org>
In-Reply-To: <20261116082350-GKB100890@kernel.org>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033348.361452-1-sandie.cao@deepcomputing.io> <20261114075506-GKB100523@kernel.org> <407ce3d77416bb2522b7906b0df3d5adf02c27ee.efc7f10c.ccd0.4025.9bef.e587b1e9e4e8@feishu.cn>
	<20261116082350-GKB100890@kernel.org>
X-Lms-Return-Path: <lba+16afad249+646179+vger.kernel.org+sandie.cao@deepcomputing.io>
Content-Type: text/plain; charset=UTF-8
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"devicetree" <devicetree@vger.kernel.org>, 
	"linux-riscv" <linux-riscv@lists.infradead.org>, 
	"spacemit" <spacemit@lists.linux.dev>, 
	"linux-kernel" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05: Enable SD card support
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0

Hi, Yixun:

> From: "Yixun Lan"<dlan@kernel.org>
> Date:=C2=A0 Mon, Nov 16, 2026, 16:24

> >=C2=A0
> > In version 1 [1],=C2=A0 the patch is cd-gpios =3D <&gpio K3_GPIO(88) GP=
IO_ACTIVE_LOW>;
> > but K3_GPIO(88) is fake cd-gpio, it's tied low on board.
> So, there is gpio cd pin, but didn't work? it's hard to say without
> the schematic, but can you check with hardware people, if it
> can be fixed with SoC's internal GPIO BIAS pullup or pulldown?
> So, gpio pin is able to reflect card insert status
>=C2=A0
>=C2=A0

I did check with our hardware team, and the answer is:=C2=A0
there is a CD net on the slot, routed to K3_GPIO(88), but it is hard-tied
=C2=A0to GND on the board. (v1 of this series used=C2=A0
cd-gpios =3D <&gpio K3_GPIO(88) GPIO_ACTIVE_LOW>, which of course
always reports "card present".) It is a direct connection to GND, not a
strap resistor, so the SoC's internal bias cannot pull it up.

> > So In version2 [2], the patch changes to non-removable.
> > And In version3 [3], add comment.=C2=A0
> >=C2=A0
> > The options: cd-gpio, non-removable, broken-cd=C2=A0 all work on this b=
oard.
> >=C2=A0
> it works, but does not reflect the hardware status
>=C2=A0
> > We just need to detect the SD card when bootup, don't need the driver=
=C2=A0
> > to detect hot-plug event , non-removable should be suitable and faster,=
=C2=A0
> > we recomment to use non-removable.
> >=C2=A0
> No, this isn't a valid reason, it's use case should have nothing to do
> with the property.
>=C2=A0
> My point is: if the gpio cd pin still doesn't work, and the SD card is
> actually physical plugable, then should use "broken-cd".

The SD card slot is onboard [1],=C2=A0 put the board into casing, there is =
no
way to plugin/ plugout the card. So there is no card-detect event that can
ever happen at runtime.

If you still prefer broken-cd,=C2=A0 I will follow in next version.=C2=A0

[1]: https://deepcomputing.io/dc-roma-risc-v-mainboard-iii-unveiled-at-fosd=
em-powered-by-spacemit-k3-for-framework-laptop-13/

Best regards
Sandie
