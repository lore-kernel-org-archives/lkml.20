Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50C3363096
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814457; cv=none; b=qJka2etOte9SSERcl791vNiUzRziRI6HdPBZMq95R3+Fcvp71cT1qWwDNc1P8rehs2qAhOPi+kjrm77pqWNa9w8fJzYdHtPjSJq00AnoTbsMutHukC3GDsNCYaeMeY18dnbQM4e1oej+AOrMG/hMs1UzqtK9k1JQIvqZeyU6p2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814457; c=relaxed/simple;
	bh=xON4dTCYI11gc9I1ss2ZDpffd+cnlQVGEoVamWChjnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EYw/pIYnY1plH6yObiU+dL2i2wFkgqw+jPW7ewmPFiP0p3CLqQxo6zqD65FWpxrNmPyF0C4fgZa2DW6xxnuVMaq9paq4Sy0+oqdtUOaRXRyfzaJ4l3/hTIIfe6T6tW7bJPt9jH3AdeQ+cw//y4Ot8s+zqQ/5nMkreFDiFB4bDbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J4TSmKTH; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=CVz4XHyx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J4TSmKTH";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="CVz4XHyx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790814449;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Nk4sGQfUZPJr906VGnTLrhpfwNs9+S7HqUA3QKJmnY=;
	b=J4TSmKTHWiyiGi4BxmklrzEDbZGRK5cQV0wjFBuEE+qseaqntyxWE1Ahm65qcHx78rPVql
	ibjg/rsuUVMOgwHOGtqcqP7pVrC/ZQpdz6Bv26vErzwsUv8vIKm2ilwzzAm/i8txesdPIp
	bxKB69lcbwKz+0tvS+fKJdhLQvc8iPI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-464-cd83EeZYNq6zXk3whwzG6A-1; Wed, 30 Sep 2026 20:27:27 -0400
X-MC-Unique: cd83EeZYNq6zXk3whwzG6A-1
X-Mimecast-MFC-AGG-ID: cd83EeZYNq6zXk3whwzG6A_1790814447
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-532c6028621so70516471cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:27:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1790814447; x=1791419247; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Nk4sGQfUZPJr906VGnTLrhpfwNs9+S7HqUA3QKJmnY=;
        b=CVz4XHyxmHXRsOLdeUw70/SoniBJKaJepu+ln3Tqhbas6w7wvntkFriYuwN3mI7N9B
         2SwAJCdeSjL2LdILT1+mVn/OKEyarKN1P3DwrFV3ik6GRDtbFEK2uakgLOanz/1W6PNh
         UOVJplwZsin4o50OVLmT4pdxe6NGXJcZuapwdDuN9aW2mZRhTdevcJkfumOQ0rO8i0bH
         5SVNbPt4y+EO8ku8PUUGUSwLk+RTQiZ4GsBj8vxAiwoAMwKRENq1l9yPrR9yY6UeCfnI
         7Z0bDkix3yYVJHdoq2J0cC+CMely4+3g7jH7Alb4+V0T91umO7Ko/vIzzTXV7+L85bmh
         p4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814447; x=1791419247;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9Nk4sGQfUZPJr906VGnTLrhpfwNs9+S7HqUA3QKJmnY=;
        b=YOt3DMjaB3NVCOfOnZjmbn/H2BzGfwPdbsSgOhz3YOQl5XuHqpChMYeGR5BhhKXjZ7
         2tbwIKL2W7SMdQZdSDg6QyIYKyq0Rzxb2rp5fWWKMMzl8g2X0aZ6h4Rd6Zbi8rsSnpea
         vRYjuyuKyD2SusQglOP8m+J4ugrn+FQkcJbElvkWOzTHzIn5Ie80yz4ZOUhqX/Cb3ZdT
         DxADbgH/djfzCiHzet5I2SET/H1cbmbDVroakgZdiwiPfMv2PJmzsz1zYr+pWOAQf2qo
         57H2gYVzqCYSf9D0aLu34AQe2fxhgbBgLTfv68L2ypBpFq0rcqn5HtSYZQWOzklTJrZ/
         j8Zg==
X-Forwarded-Encrypted: i=1; AKwUvBywHFErJOqinF2XQtTvYLjOitAAFzD30pZCvJcst4sutJ/sIY5x1Iw2iYmoWJOgCdzevCuFQ9hpUoBpsIk=@vger.kernel.org
X-Gm-Message-State: AFuF++mjXFvz8vl9hXthLuZqijfIYuxkFEYRiMFWImar01yxVPIYknV8
	TXtODu932YH1xB/r9S7+0kgIEN/6fiHA0Rlq9NBAKfFs7VTiYtpBDUYP1+H+n46dplBUWSXtLPj
	kU/qY08nlICpZT+dcQLE30rlfcodqkSfdM6PNFKTM+uXztSXEFXfVyO9knNWh1Csj9Q==
X-Gm-Gg: AYBFou3AZrN+0H/fIermDNPXd5mV6ZCwFHpbz6DobUa33V/Rd7Y3DebkLh12S4WU75w
	pqBR7NfevnxjZVw7i09BfC4k8K49lNHsbQlR6ZUEwqvniqTFLHopYvb2e6akobb4W79Pk3sKW3N
	1Qo6VLp3HETSREgviEHKgvmWZngmh0FtCRiyczGx0vEN6wVs092b4qj3vGnJ8k8mf8TjrHfNxo7
	OtXG9al+hbvLOmL50f8dJWFL/Mssz2Z793RePTWtbmBIOSP8mgCsFRSK+fzkbxXjEMF1TxEeRB5
	P/CYcYxprXSUbG5icjnPbVM1rDluQmNUTmASZoQv8Sro5fqnrUXjnTETAr1OBXO1vcoswP2Vahs
	GeHQadJ+oW++jPzmJKYiJl0t2eTH5MoKPxNk=
X-Received: by 2002:a05:622a:4d9a:b0:533:3868:1f78 with SMTP id d75a77b69052e-53374328747mr61077691cf.51.1790814446779;
        Wed, 30 Sep 2026 17:27:26 -0700 (PDT)
X-Received: by 2002:a05:622a:4d9a:b0:533:3868:1f78 with SMTP id d75a77b69052e-53374328747mr61077101cf.51.1790814446078;
        Wed, 30 Sep 2026 17:27:26 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53385f87469sm6552381cf.3.2026.09.30.17.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:27:24 -0700 (PDT)
Date: Wed, 30 Sep 2026 20:27:23 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, Brian Masney <bmasney+clk@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, mturquette@baylibre.com
Subject: Re: [GIT PULL] clk: zte: zx297520v3 clock bindings and driver
Message-ID: <ar2o6yUzJP0H1YJv@redhat.com>
References: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <LTD3_tELRsyCnoeF8FU_TQ@gmail.com>
User-Agent: Mutt/2.4.2 (2026-08-30)

Hi Stefan,

On Wed, Sep 30, 2026 at 09:40:12PM +0300, Stefan Dösinger wrote:
> Hi,
> 
> This pull request contains the device tree bindings and clock driver for ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree.
> 
> The patches have been reviewed and carry appropriate R-B tags by Krzysztof Kozlowski (bindings) and Conor Dooley (clk driver).
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> The following changes since commit b1470947e92aeedd522ddb7363369c956e55d6b6:
> 
>   Merge branch 'clk-pile' into clk-next (2026-09-29 14:14:32 -0400)

Please send a new pull that's based on v7.3-rc1. Or if it's easier you
can post a new version of the patch series with just these clk patches.

Brian


> 
> are available in the Git repository at:
> 
>   https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-clk-for-7.4
> 
> for you to fetch changes up to 89e2c0fa481f6a0da23ad5c4dc98bcd940f09fd2:
> 
>   clk: zte: Introduce a driver for zx297520v3 LSP clocks (2026-09-30 20:03:29 +0300)
> 
> ----------------------------------------------------------------
> clk: zte: Add clock drivers for zx297520v3 SoC
> 
> This tag contains the device tree bindings and clock driver for ZTE
> zx297520v3 boards. It contains the next step in adding support for
> zx297520v3 boards: Documenting clock and reset manager hardware and
> adding drivers for its PLLs and clock tree.
> 
> The PR does not contain the MFD, reset and device tree patches. They
> will be submitted to the MFD, reset and soc trees respectively. The
> clock driver compiles without them, but won't be instantiated without
> the MFD parent.
> 
> ----------------------------------------------------------------
> Stefan Dösinger (9):
>       dt-bindings: clk: zte: Add zx297520v3 top clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 matrix clock and reset controller
>       dt-bindings: clk: zte: Add zx297520v3 LSP clock and reset controller
>       clk: zte: Add Clock registration infrastructure
>       clk: zte: Add regmap-based clocks
>       clk: zte: Add zx PLL support infrastructure
>       clk: zte: Introduce a driver for zx297520v3 top clocks
>       clk: zte: Introduce a driver for zx297520v3 matrix clocks
>       clk: zte: Introduce a driver for zx297520v3 LSP clocks
> 
>  Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml    |  101 ++
>  Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml |   98 ++
>  Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml    |  122 +++
>  MAINTAINERS                                                           |    7 +
>  drivers/clk/Kconfig                                                   |    1 +
>  drivers/clk/Makefile                                                  |    1 +
>  drivers/clk/zte/Kconfig                                               |   28 +
>  drivers/clk/zte/Makefile                                              |    6 +
>  drivers/clk/zte/clk-regmap.c                                          |  237 +++++
>  drivers/clk/zte/clk-zx.c                                              |  192 ++++
>  drivers/clk/zte/clk-zx.h                                              |  137 +++
>  drivers/clk/zte/clk-zx297520v3.c                                      | 1657 +++++++++++++++++++++++++++++++++
>  drivers/clk/zte/pll-zx.c                                              |  576 ++++++++++++
>  include/dt-bindings/clock/zte,zx297520v3-clk.h                        |  154 +++
>  include/dt-bindings/phy/zte,zx297520v3-topcrm.h                       |   12 +
>  include/dt-bindings/reset/zte,zx297520v3-reset.h                      |   62 ++
>  16 files changed, 3391 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-lspcrm.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-matrixcrm.yaml
>  create mode 100644 Documentation/devicetree/bindings/clock/zte,zx297520v3-topcrm.yaml
>  create mode 100644 drivers/clk/zte/Kconfig
>  create mode 100644 drivers/clk/zte/Makefile
>  create mode 100644 drivers/clk/zte/clk-regmap.c
>  create mode 100644 drivers/clk/zte/clk-zx.c
>  create mode 100644 drivers/clk/zte/clk-zx.h
>  create mode 100644 drivers/clk/zte/clk-zx297520v3.c
>  create mode 100644 drivers/clk/zte/pll-zx.c
>  create mode 100644 include/dt-bindings/clock/zte,zx297520v3-clk.h
>  create mode 100644 include/dt-bindings/phy/zte,zx297520v3-topcrm.h
>  create mode 100644 include/dt-bindings/reset/zte,zx297520v3-reset.h


