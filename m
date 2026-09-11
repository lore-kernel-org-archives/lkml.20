Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2328B1A3166
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 14:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789137514; cv=pass; b=HNRPTT50PaHIokAdJeSyPZOZDF6EGhDHR03/Dqr3QURpZk86XUcnFhhUL/XemRK2jsCAAtks8ytEY60YT16ElyOz21hHbrRcdUniAyUPexBpap100vIYzwDcGd2pNYpeSgwVFCjOg+m6S2f/ZDXiFNcs0iEQTTec+Vkb+u1qJ/E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789137514; c=relaxed/simple;
	bh=XLpKjuu4srfrU1du6/lAaUzD7jl948KYiIqSg/FlWVg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C8AUajxE8QFK0F8L73yel1HVvjzLsn4Id9Tbm2wHCW7AKoxYi6Y/9eRyCkRDpL3LthDiNMxqEecF8jhU7I0nQLERmgY0xrrg/bWGhy4acH6RrxqYTHM+Erlzo3MFSbjk7GaVxBZUZjiRv8e0IRvCPsNBs6q2e2QKiQ2+m2vJ0Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=HB8Y+RT4; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="HB8Y+RT4"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-857ff9fef54so8010497b3.1
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 07:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789137507; cv=none;
        d=google.com; s=arc-20260327;
        b=icDPAI6SwqSrmtz+gqXlOOkxCL+ra1cAR0h+OR19d8rw5zc7DCDhiMT1ox5DzEnYA6
         SMlQA5qbpKBQZNNjVGu+na1N3TV0lVuyEYtJaKCU2PnHrbm32I/s7/ALCyFOc/gG4nbd
         q72c3w0WHUBsxt42fOCwa0Omc9ppTLmVvoq3Q3cxATmOIz9wtJVhiqG5676FTYnWHNAi
         DHSe3eec6rI1+3CCkIiyOCIr8kl1iVvNmDbtodbd6G0vnHK5EabAxTTRZtRIhMRPA+Ot
         D01/MUYnYg1DLLpzEB1MtSCUyOXN5ZhclPPlK0mnGnD5oTmOeetCPqLYh809zsujl16O
         umlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        fh=fgSeoq/tnTWtGfC5wIzTrXoV89UF+syxtLQ9zUmnvso=;
        b=UxZ9fmttVCqA1MyQCt1X0Kx+ESNHbVUYS+U/Amlvv1+Nn8BOEutH9Prd4BQqLLmOZ7
         r7TJNNUs2Xyiorg3Ha21SVezcUg1/lhMMoEgaqTNOVQnXfYs31jaS61hgnUEWBlnQ2Dn
         uzjTmeck/Wr22yTI4w4WFai1o/oHJu9EqmK+/TIB6x0ncE2b6l0SYbK9cR9VVq8+R7xN
         x5kiNBfkH1CBMvXdmsgetW4fH27t6cWcd16uAFTFR0409hu+c3YKQ9SB6oJEXmR2JWyz
         lVjHv6yIQGHw6KfXtbxnqNXP0SeIGM5QX8lgcpODRJaKuGJhgBeH6FmyVmkhpRMgdXDn
         pLFA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1789137507; x=1789742307; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        b=HB8Y+RT4TRPooM8mqpi8DeLFRTPVsBx9aCjZB/tdFSV51HaKr7YUqtjHQkphkOVbT6
         uuwIWKH3SAN0TzGoi7GXFe0YJRT5iKtXrRz5k8GxzTLnZPeidsaT8lGynlHxy7GjzZ9r
         wzrI72QggorLaBikBSbsEG1noEYrmgMFuOan4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789137507; x=1789742307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jpJbb5DSDD0uOBnoN5sYAo9U83labpJz6g7jqXOS7q0=;
        b=kymXpE7EOc6Q/AH8JqZFzg5v9OE6Duy1QkyO8D6z323QSWKU0DdQkvY2l3sBYXk+2+
         kderEeXlRfet3XGeY2qI0v/iCn1O/wUM+41ICpNKgmmaEhxoICVoFL+nMBLAqDcBMc4y
         mWc2maQ/bB/GfLcQFezqvxmm9ptqAIYfI+y+rMfdBR+6UQRR9IqWGaPqIJaKz+h9YmqE
         t+HGZo/V6q5QT72WlQvXinY9nwb8/ytsbhbKuwOsO7W5RilC2JeEniqaCDrPSpWEzGsJ
         VFqEBF8cZqVxFgzCzCOqxQyxzc+LW7NYxTgyZKJ04qTe4CqNiI9FG18fpyG5temz+F9q
         dAoA==
X-Forwarded-Encrypted: i=1; AKwUvBztTHp7cp8BsZjVAz40QZ6Pr70ZRpZeOLB2dJwGwtW5xN0hy8FudXBJ8KAVSXsxZSyoB7GqYk8YhDW5B2U=@vger.kernel.org
X-Gm-Message-State: AFuF++lmJPcos6yWFoVGkWH8Th8lpYDkHLyFGQY5qFX60VWY5nK0Kuo2
	VjWOnO3eqkCUdzwWHoZD721xUsdIcwaCbIf8g0L+lHsAfL7z3EhnQ2P73mggk6RQjoPfdA1drKD
	MMIIUAIgplGTvj8p1gw05/tTTQqqZHRmXB0OZtuWRlA==
X-Gm-Gg: AYBFou3eLvGssQpmJcdU4G1YVAinLXuFLyyU/9DZkIMEQ/BzpwJPGwGZ2woD0XI3+iB
	JhrNNR3hAVcmLakEtruyPOd8oOoQ4vypma0JLMFjmZjTxLA30o3rL1DfYHwYaakkDKQRqZJjPbK
	47c6hxLO5sIKrZFT/Z0e9E6LL//q2S4cdaFPg8l7rGxP9EbB5E8u8k/PBpn1bX+knn1ZmKZGgMP
	n5+RkiT01cEQMEg7V9uSLCjapf3n/4EMbNBXiSGqg8CRxE05j+oE62BsjgWssDaDtInXADrn7hf
	/ot56Y6/Kg8zvupRNFY0ijVYKbXwjblBvW82HMNT5BCbNSxJdztTDlH2/J1PNOnp
X-Received: by 2002:a05:690c:399:b0:873:5bb2:6c10 with SMTP id
 00721157ae682-884b7316b4dmr14810657b3.58.1789137507274; Fri, 11 Sep 2026
 07:38:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com> <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
In-Reply-To: <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Fri, 11 Sep 2026 23:38:14 +0900
X-Gm-Features: AcwNN1V8w1uOymS_yob5PvYfeWzm1NprI6fjxQoUm4Mlo3gyAoZUnypuVT5lDl8
Message-ID: <CAFr9PX=_FmMdR4TeP+tqURZdZCTjw8UYxAxeszs_vcpTbX+_aw@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Linus Walleij <linusw@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Fri, 11 Sept 2026 at 18:11, Linus Walleij <linusw@kernel.org> wrote:
> - One camp that are enthusiast like yourself. That kind of people
>   are running the show inside arch/m68k on Amigas and Ataris.

I have SMP working on m68k (dual 68040, real hardware) among other
oddities. I think some people would get a kick out of seeing it but
also I think some people would also ask why we can't just delete
everything that isn't arm64/amd64/riscv. I'm putting off sending
patches like that to avoid everything getting deleted. :)

Cheers,

Daniel
