Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794601327;
	b=WiMDlUK3f34Hy0HKu8ZfMOI+W3MW9ev0eYSWyePW5fTaPqAIyT0jN2t186NnXGlwcFaj
	 uikODhwceHu8yH8q+YcgrcGXOkOOVO8BGd/uwoS5pGTpOymTntXq9PM4sxHKVpdTaLxM/
	 kg419EMObcRgpop5NoKKJ5viFECGAR/EkSAxnYUfIK8MxLvjleJAniTkUvowGzqVz5tfe
	 fB3QOdAoCuvGFDOYTvdC+3fm5GsW3+Bn8hMsVzhIV/pMZOcDTfKEs8zV2jUpSXCBbwJdz
	 olsfLl9WUiysy+OcQZm9+Wa6zyF4giUg73to6K1Adate0bP16k3n40tEgj2j/R393Vw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
	b=oEQi0FmxrKYVY3CONUP22gD7015MMadydkk1QFOU8+ftGQkHhcXbaq7qKf0/u0JzdxmT
	 plFnS8MQ1WJ91scdkUc+RY8obNlG/OMVcbagMPsXM36IWJ6lWJkaq0TfM2zE3Gy+vYPX1
	 M6SA89q5c0PUQB0567SmGgOI6/lLvMygoPnbT2QnLGRYaq+znNsyp9/TGomMr4OS9jYjH
	 lknOp0U5CfbGc29P+ssEabvAJxr+vlA0WAuKNYR9FtcCQL7ZJwuufbVE9XXixJu/0yYzz
	 P3+TaOkFDsRXZwtZU+5E8NSlrVc4alS0eVJ5b5rHYLI/9aMUm4RNgJTHKG+xrEy6Kvw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eliaN/OP";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B505C606A337
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:22:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B505C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eliaN/OP
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ad3ef75223so1905021fa.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:22:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794601325; cv=none;
        d=google.com; s=arc-20260327;
        b=qcXm/2qbb9K95HUlQ91/W0AkeJO2qIyvY9KnLzQRzb4wKiaH4pvhw8ij6PZhzVV4Li
         m33XeCE9pfOW1BFB03nh9ZZSVFpodJ2wcHXmE2004VDjMr0RmIFaheFpPeSFASSOAjBC
         Oi3UwE/Qwjtvra7DmYHYGbo8kkpOdZfF6b3B6Owoln1r4JHNRGwpdBYNS/vMsTOZyekm
         aY54UyjUn7ZI2tXqkhrokKDpTku96q56r5Q2lMRMsCNuRLkH07FrqipqGmAw5hxdaAeo
         xhYVgKhiyBz/IXdMNQ8wsMlM9oH5LadBEUQgbImrj07oC6SHaWwHQKktmDJSH9CcpvCI
         7WxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        fh=yUUsyU6lk9Wjp4C1Tu1JjHobDplk7mTF9FRWWegVx4o=;
        b=O2W36v7usKP+Po+Sow0PkEHMXwhcWv5Aizl8QP+ntRiVk7xHp+XYAOCtaUgD0iSlie
         r2Do4fgcykd9GGid1PXDc5mfW6BArB7NBPSk8P/71bzqFBpvK561Nic7xoXX2S408rIt
         hLzd1x7nJZTivKnOqXldcgKRB2lnZwGbgr5krb6I63uj1cxeSBnD2JTplMk7Dio9gjil
         gtJrEZnDnoJTKoPnn0PGI+B1PzT/QgGbPFei7eFm38CPVqY0wgHlTEFzG8pLhtL0D1D1
         UWyEK9RZi8UFuvhoxTVkjsfsizVnG8ZyRQqqVAES0BRThcBrwVEpCjPVo7jNfXQdBif8
         NM/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601325; x=1795206125; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        b=eliaN/OPLV5MQHHag51KNNYs9r1vwyaqcfJdkPEf/RxGAIxD8jHs7xlRZ8nZvj2xWc
         X+oTBEK8j+nPB2xjkjIpsQ7e0ql3O3uCheaVkZPsuT4Qzr72cKyMRk4ekxeEakNcVIvP
         56DIHjQtA9jeGJWIsKAS3TnLjuqKom/OdQMD7XwpY9FyxmdSx2XmODmyJuy3cb7/Ya6L
         dbVdWc+5/H8udaY3R3ewLTMY8GnySiNfHfJbMNidIhZc02OSafSuUgEkBEX6Cq+i3uzP
         3wacvfEu4+WIm11XYq/xPB2//IpU5VJJCpJTwyik5YREF01ZKwV9uFMwMbtJgb7HtEXK
         padg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601325; x=1795206125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xtumAuvNbWuwUXK0cxJRs7l5/r2sAahJH/6uzW92HAc=;
        b=HI536+xDSDDrobMXa9ADKTd0pF1nFkJ5sQkWKZkwkvLePTK8WtyDdnQTxyJ19mT83h
         ozguMrh0MCQqXabHPOLo+41ZUyBRkkgeU8ydJ+TAO3Hk7HA6gaus35dyWa0T1BESilga
         DzEDtP3dEvgBokWmogdAvBykSC4RG6lG/NYI6ujXgYsxnyelEu058dcNGlXNYDsm5q7Z
         LhmdXC6CP73GtfgwV+BI+L4u90W9J7E3pHdL05C5f0V2E9pFyq+nIpMeFoGX8lqYSeKA
         hWH+E4p3qpcWiGtSmFqJcM1zl/2ai6BIhVJ1QCQlQq/qg0vYMhMO13ul+ggT+lqLCisn
         Kuhw==
X-Forwarded-Encrypted: i=1; AL+hErEo8JBNoYPmSs1g3/wL9k4QggYp22jY5XbCcXyEUOc0woouilOuWNUSq0Lcod4PX1YtjKkQOYs1yJehxjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vmADwM89WJoofv5ZIWzbxhP0KkK3lX08yl/uT8U5COVoKJGjd
	tRJ3lRvvjjymakpqSSH5iC8VdGQHq2FO7GCicfaWMldzOxyf4vn203zqvfBal9rI++bsvw8TwIb
	gbQbi2UjfnFQN5TQtfPk7N5dUQI4ifn0=
X-Gm-Gg: AYBFou1anpdyYLCOLcFAjb2SEaAk93LGv4lVk2MfIOA0GtRqg8ULhfW3s1AhaEHBBEU
	BCfm4B1cnxnQGnfkx/egdVwENAkd79kXaGmBRG155h2HTSWLCBgHKNn/z7fklLtV7Wigpt8qyZ6
	uopbz3LWfXXxddRe/cORDgfX+6hq0t5otir4CY1maWzDRBmU0iceOZjJpTs1nV0JPL/BNTPqFl1
	htGb1Zk0QUmLwt5y8CM3VHdMcpGl6BMgRJ0+o3njZmp5s+YOB6roqkRhQUoxLrbyvaWkD2YwUp7
	vtw990ojm+c/TWH6n4wBhadNozfZp+QITLzFoMsJvURUSAQ8lK8HyXwVg4vmBapEcpYfyEvixys
	zsSHXchkB1FzyMgPPQQ5YEZ5FLp2SEmLNUidE/QSReGb7Z9L+E+F7MptIPTcNEuwuB7tipcZhA9
	a2hrJn4CmawHET/WhU
X-Received: by 2002:a05:6512:1322:b0:5c1:57b9:90b2 with SMTP id
 2adb3069b0e04-5c170746a13mr1720283e87.1.1794601324638; Fri, 13 Nov 2026
 12:22:04 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
 <20261112-hantro-robust-v2-2-18561fd48838@gmail.com> <c97eef1ba88daf83d231d2ecc78b47fcf524385c.camel@pengutronix.de>
 <f212840b-92fd-4d97-a6a7-2768a55483f7@collabora.com> <CAEy9hNU2ox76TFKtdisqUHDxZ=3gPVBDBcjz_W8RtCpCpK5d7g@mail.gmail.com>
 <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
In-Reply-To: <b3fa092ec9390cf5bfe2f4338af68327be70e6e1.camel@pengutronix.de>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 12:21:52 -0800
X-Gm-Features: AclHuK_r_rPrVJRj0pkug0EuQb97pNCsN4qnHk9bddNHOrBile8NMgFa-B299mE
Message-ID: <CAEy9hNXNaAdcL4NMmNf7sETknV+jQBp-inqFd-qAPut041GjJw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: verisilicon: Don't hold the VPU in reset
 after remove
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
	Hans Verkuil <hverkuil@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
	Tharit Tangkijwanichakul <tharitt97@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Would that more correctly describe the hardware though?

Yes. The IOMMU is inside the AV1 block and the TRM has no reset for it,
only these four. v3 adds them to the vsi-iommu binding and node.

> So this likely would require exclusive reset controls with
> acquire/release.

v3 does that: both drivers get them as released exclusive controls.
vsi-iommu acquires them to deassert on probe, hantro for its probe
deassert and for the timeout pulse of the encoder cores. Remove still
leaves them deasserted.

v3: https://lore.kernel.org/r/20261113-hantro-robust-v3-0-82383c722ad2@gmail.com

Arun
