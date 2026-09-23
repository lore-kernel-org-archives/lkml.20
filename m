Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1E5143B3EF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790156590; cv=none; b=VHlH3hiAqc2cYkRrNLgNFs0uMxxtoYibRK865lu6goJPCWqiNappECbGAmNhBgtOvhQP3Bv2oAnf4JeRSVcVfwTD7JJt9KTHZfu0h1a3lUce5Gk/W9l/YL3JbsfZzK+c1K4Nz6rLnJ5fEa48tgEAtW8KzQENjDi9CIaVzBe/Y78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790156590; c=relaxed/simple;
	bh=kXRIYiD+xenQqUzM6yr57E7e+H4wDyAglPgjREDARWw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JZ+Hpf6KY+usDYe/nfROickTowsC0u5y45YBD54wfBnSypjurej4gYBOJDSRLT9jUifp4v03KQ5a+Qt/YjW919aB0W3WeBCC6nXCOp/TT5DojHMYxjVh4v99Fca3OdCH445NdUS/ulxb6uskM9bLnlDzSCvc09fIR+CVG8xtBdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-785686d2764so164637137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:43:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790156588; x=1790761388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SiQX30aX3aRyR4XyZV6+3F+T8bea/FfKCnzec63MSFM=;
        b=Bp4dg8NufBUlS7AlEKncpqm1QLbnKHDwriKtNfKDhmclNt5gwKVv8ZuTlyNQbJimDB
         2zFowhf8o7C2IwVinpfX9uOc+c/6FizofYZBV5aBMubA3peqLl+AB5MjUA6xL5hESKuB
         SzRsVOb354guTq6Lxyud4Z4tdicdk9Q2Qfpc42anGlbgYjoRTIhby7SQKn2xZ8Lnfr+Z
         tIH5we+rOfz8Xd65bd4aI/waZ95cPW7ztM2VwUBINaLEUKKbUfR6C+wm1Qkkh3Ex/dEI
         8iAPsiQ5VGp+CkgHVDL82YUM3RbmVDnuE/ummnC5Nd2MNvpRfZE2SOTT2qVBiqU9eXEp
         1Y1Q==
X-Forwarded-Encrypted: i=1; AKwUvBw0+ZikRsAsGsbNDBTw6ybDPnwLNSNMSLC5EETviM2mkiLMpdxPQOWZ90iUq4FCAkUDbsmsGSxnj/En2LY=@vger.kernel.org
X-Gm-Message-State: AFuF++n+kNdkN60h+kQyftD4LliRE3PK1X7udldha2EzfyGiU+TZY01/
	tEUIVGU0GLDkAqOYznNkhH1ykFUEjyZcAMrEjKl7cBzbNpseOssdoPszZWROzdWQ4WM=
X-Gm-Gg: AYBFou0vk7bshI492kilTmCI7xG4OlkzkIPS77Duzd1X5KefUBSsQ96Ehmtjqjdy5XZ
	Rpd0ORgT0o/xxZ+Cj6gkU25ltgDEBMf9OnMoLLz7bqGZZL+NsGXutC2cFKn1YmszAT1yZJfMjOw
	faDDKY1Kv3dxc7H+a6iRgj6LA2rkBrjKuo4XYGX3NluPwYvVNGJvwgyQbzK8Oez46udEIOla5cd
	qlI5BCrDJj/CPmDaCVR8Vnv7pKEUUijCGn6rqVSWcMczaecV8YaDf01p7rV57AWuwko2kYZ8N5P
	88LsmxaGx0wXHVWBuqvXvOJqm9JjM6u1QyN3FGXVoa2EkS6M8Vip92A4t1zEvjhzkMm+oscsY+l
	H7xiaoWkSETzFm+ihFhVjVYJfGlvshKbvZI0GYED3r3QSSrFsqj6VpK3CzUPONPsHDbK5e3PlrD
	j2PjBHIhy3FxZoQGGWuL8+9Yp7g+7ekCWRPdmnWEu0tZp/eeXAf92LK5GvNFvYIK7ULkyeyTjmq
	Sz+jF1SzLMzqpPE8G2kbSx7LrAo21HqAVWS
X-Received: by 2002:a05:6102:808e:b0:785:c39b:6a1 with SMTP id ada2fe7eead31-7ac1acd62e2mr1891189137.6.1790156587675;
        Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com. [74.125.227.12])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf608a27esm2632786137.10.2026.09.23.02.43.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4fff62so296211e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:43:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwo7kKDd2gD83XerDiciHSweSl0GKgTUdLM013Cy7AZKsxGVncvmTRzpHb+bIRQjCRgOnAHblILSHrAeU4=@vger.kernel.org
X-Received: by 2002:a05:6102:162a:b0:7a5:d652:2e3c with SMTP id
 ada2fe7eead31-7ac1b41557dmr1905945137.9.1790156586853; Wed, 23 Sep 2026
 02:43:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1790005703.git.tommaso.merciai.xr@bp.renesas.com> <540fcb8ccfe7efd15844823c030f393efb536076.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <540fcb8ccfe7efd15844823c030f393efb536076.1790005703.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 11:42:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWFUM7xVNOfEhCN08UgdgEu7ZAnkR8GDGgT4d-wg5TpJw@mail.gmail.com>
X-Gm-Features: AclHuK-GoN-PXrLEwtbZvvcfh_d25jq7EgJX0WCMepbHIeyPLfj-FzR3-jNoD1U
Message-ID: <CAMuHMdWFUM7xVNOfEhCN08UgdgEu7ZAnkR8GDGgT4d-wg5TpJw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] arm64: dts: renesas: r9a09g047e57-smarc: Enable
 USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sept 2026 at 00:27, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Enable USB2.0 support on the RZ/G3E EVK board. The USB1B_1A_HOST and
> USB5_4_HOST connectors support host operation only, while USB0_OTG
> supports both host and peripheral operation.
>
> renesas-smarc2.dtsi is shared by all boards based on the RZ SMARC
> Carrier II Board. USB2.0 is not yet supported on the RZ/G3L SMARC
> EVK, so disable the common USB2.0 nodes in its board DTS until proper
> support is added.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> ---
> v3->v4:
>  - Drop usb21_pins.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
