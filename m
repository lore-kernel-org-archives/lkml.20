Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC0B4DAFBC
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 19:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791832585; cv=none; b=bGZoL53NgSaFVpvIm1XrUpSqDlH5OPIH/cDtSZXZZys4Do84xRLVDkO2/zRXnI1MSF6Yy0/np4coIDDtnI1S73p6R3emxioBDCs6xp4SSdDXsuRzpex5bh0W6qFxuC4WbTLenF3SILevPmAWqOTlOpfObl7sByMYmG8phGJkDDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791832585; c=relaxed/simple;
	bh=F1N9sc0phttKEroqTY7fq4cUBOZftvRnSXLYqSUrN14=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=PObcs8c2SnaqVHLp+FKL/Pfeo2uG0pO5/t/V8IH56Gm12fmpR0vwibinqIEtKY+9sb4pWzCq4BX2aJTJFCsz9ZdvLmF+3GF0Mego84yDm74QwrHfFPLwF+9/62EjxKEl9mF5MqghMVS5Eu7UCF1T22DTp9qlOFjnx9fB9b5GCfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=burcliSJ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="burcliSJ"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a168355946so19428855e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791832581; x=1792437381; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CRfRncq4FuUqEgsh+Q7MKNhu4iIEz6/gs4z1N6qwQUY=;
        b=burcliSJwJy8wntjxL4duhuZcZ/y8xNQMOrS2+ed8KpsCZk0oCS5hVSf5VT9fWL6Ci
         dctnORJH/vEmrkyvaNC3JF+H6Q2Zma+iT1N7AwwuNqIBZeU9eLOS0HONZod6fxaH3WO2
         WRddL6QzfsVQXpzf3eggBoXY3SDMrkQc4Y/dqXJoK7SWNu1MT2s2kqzEH7n40kBo14Pu
         +aydu3/+zEFmbeYZXFimx3uYfWeDLCz0kt1me3eR94tW+ufDdSZlsrnKfWp1kUNMj/hy
         cShyHZjkLEwCF00gFwjtZdcxL0OWrpZstHGRHtatB4exdL4oi+1bWxcUJAC6BY0x2GBt
         GvQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791832581; x=1792437381;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CRfRncq4FuUqEgsh+Q7MKNhu4iIEz6/gs4z1N6qwQUY=;
        b=v1iz7ppYqovKM70G03w8Yy8D/bQ1ip1x3O9j8jojcsDAEyhh7uY7NVjc5pcl4HTOVE
         ahXGupuu0HsxYThlfum6l45mNUhoVGzwaUWusr62HQKFDlmobCkPy19nD2rkdJrpwrFd
         5S0veDdRvCDINnIOKeOZL4S27k5vAGzC0mzqh8K+X29Pty0HTJoNSpZl6kQKOlYuhvwS
         VDjZNGztO9CUFjvymsGBUzKhcPh5gjcBTVGlE3dJi677RSAues3ssQz/IPLw1+zF12uv
         +2bWYfHf2+JYiSwAki+QO2i7VaFJAICkVSirLgt8VEYxK/1MFxioEWTWl8v6Kbw8db5H
         rLFA==
X-Forwarded-Encrypted: i=1; AKwUvBz3AJYSnVgcVkmLYo10Dus2ahOGJQMTbvluV5rQyiw1a3P8Dj5eyB8XOl90nOwAerNyj5tqkDaBPGergTs=@vger.kernel.org
X-Gm-Message-State: AFq9FYINklatOh5dPmPoiECixNyyQeQYqFg6DMstUTRKrm4XOHl5I5ia
	cE69nQKZQRQrna2QZ3SEfGg25wTsUvaFNVjoG3HmTvxlssU+oNsBVjou7lovZ7GP8ts=
X-Gm-Gg: AYBFou3CHAYRzSNvc01CV3OIHm4OYAmS21FC9XVcVL3IeMaA1F3FvbczKSDYckYSjnU
	VJYnLPN/nLW+GRkY/OuIbXHYgCmyH/XldIVC/e436TonJdOt4ftIqzmks+fq6vlqCfRvoLYIBpq
	sfMcyBCmXC9d5tDUlM5zzhHY2BAZtmpphleuZH7Q39Tlz3asjIUHpafKy4IHcwEgiqB9qpMete1
	jSjZeEy2u7c93YiT0MrijRWrx2cna29d+5+RTbjraME7zI74oo17BhEDPUbE+nm7VBY8eGX/SoV
	N/7v0erArVXcxR4IRq4ANVxVtKyqRc82EDA6PMTyigu4Z19F2wb5rOEDU1hJPr4ddPW0bJj3cNP
	/OFnIFZpzp134pDPkSGbtcLt6HxLWxY2GahUGl5r0zLTVSuvM7bs/RPXifTGWv1CSggsQzU5erM
	QRCPiqvHu+2pD01FXvJFNaTIfgtrEunEmpSPQMf6mJhenx6PikU2fFNdeBsaMZ47S8jUfCAqiQy
	jjWRk6ruwE3l6YIsbRMTd18E3ii
X-Received: by 2002:a05:600c:8b70:b0:4a0:108:3b48 with SMTP id 5b1f17b1804b1-4a18e4a174amr194169405e9.7.1791832580955;
        Mon, 12 Oct 2026 12:16:20 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm478285355e9.8.2026.10.12.12.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 12:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v6 00/15] Add basic clocks and resets for JHB100 SoC
From: Jerome Brunet <jbrunet@baylibre.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Changhuang Liang <changhuang.liang@starfivetech.com>, 
 Brian Masney <bmasney@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <20261012-grass-guru-1ba876eda895@spud>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
 <179180050741.66744.3459927533880490879.b4-review@b4>
 <20261012-grass-guru-1ba876eda895@spud>
Date: Mon, 12 Oct 2026 21:16:19 +0200
Message-Id: <179183257960.266355.15581316876923702717.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1422; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=F1N9sc0phttKEroqTY7fq4cUBOZftvRnSXLYqSUrN14=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnjZhzV537/L/M+KX8bkkb84JgjbmKcnd7zSVXvGQ/5
 +/C/0awo5SFQYyLQVZMkaWGu1r8naTWl1nTdW7DzGFlAhnCwMUpABPx2sbIcMUr0nD6Uoazbr/u
 /xA7XB+v681zct+D7QsW+fbozLtpuZPhnxWT2QFppxW/hcrua0zme85ue+FEzqEHjZ7nmtNjjC9
 E8wMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-12 20:03 +0100, Conor Dooley wrote:
> On Mon, Oct 12, 2026 at 12:21:47PM +0200, Jerome Brunet wrote:
> > > The JHB100 SoC includes CRG (Clock and Reset Generator) for multiple
> > > subsystems:
> > 
> > Nothing really forces you to send them all together.
> > 
> > In the future, could you try to send one CRG driver at a time ?
> > 
> > It is fine to send big RFC to give context but after that, if you
> > can make you series smaller, it is generally a good idea to do so.
> > 
> > This helps us iterate on the series faster and then you can fold our
> > feedback in following series (instead of repeating the same comments
> > on multiple instances of the same thing) Thanks.
> > 
> 
> > Also your series does not apply on clk-next or -rc1 and no pre-requisite
> > are mentioned in this cover letter. Consider using b4 to point out
> > your pre-requisite if any
> 
> The dep should be the PR I sent to Brian, but I suspect what's happened
> here is that the MAINTAINERS parts of those patches (which I had dropped
> because they were all conflicting with my tree) didn't get reabsorbed
> into this series. Very annoying for review of course, even if it's a
> non-functional conflict. Of course rebase on top of clk-next would've
> highlighted that to the submitter!

Yes it was only the MAINTAINERS file which I did rebase to check if the rest
applied correctly.

-- 
Jerome

