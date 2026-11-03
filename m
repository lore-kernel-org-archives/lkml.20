Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793671668;
	b=CsqlgWFrl2dnMG2SbeFbWe/oQPemSLUmhAknT7dmwXX0mlce0aRdR08AfBK9osKpVYsA
	 V9LnYSNj6wFfy5BgJj7jBgoa8H2BVDi7ocC/TzWylMvffbExdxIsSchwR+QSL4Ea+7bI4
	 gVM0UyDJpMllAnt3l5+zhwQFZh5sGpylr2xsUhC74G8MgdzXswGJmEC4QxpaKAmQGtO1Y
	 wFHOde82RGGOTYpMSbiIxaGTLyQQ3Hx5cLzURnX4RInYrozPphY7omq6HP+qQFQhJoGiZ
	 8DRa8u003KPMytIoyXYYSkZsMMn3YIt1RH7QZmpLBbCFGRufdLjoR2NGO8a4T4DHcUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793671668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
	b=RyPy18A/UirDmk/TeOjJMBaMn7JvCl2sLjkxCZKu5k7PeUiZtp9/ne2sB/0qyhsjRX9P
	 viMWwz8qM/wH28JH14tw7dSaDPvf7mDoNiC989VnbNk1Uitly/gdS4b0A1P9lTtGtq0Ve
	 aGhtpTkZ+0A5sPtioq9WDYx9nhrLO943waDyMrSmmPJ0HGO3ceANmrZMbBHf9/pnAdYl7
	 05W4rB9QV7VOF0/hLcxRMKUwsLcd894oaBMClpEOdYypAWxd/bkDu0kaiuRu87/cNEusa
	 o+f1aSbbZh/CuQqno3Mk0/zXP0xCFMOjW4RrjeelMm8UmYjYkrtUeKg+iI1sOfIQQ6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLjZ44wG;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF93606D808
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 02:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AF93606D808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=aLjZ44wG
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1a8cc11ac42so3520629c88.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 18:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793671667; x=1794276467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=aLjZ44wGmMHqn8e7JX/I8P1V8VARuQh9o/ia1bogyOm6JOCislA1YcxOmIPAwzWMj1
         IStM6BfN0n6A/Mi7nmKeP+I/YEQ4JUI7eoCX12cJ9HDCtLihrgNPebZlvOTpH2BmP9dD
         jawS7ea3vQz4o3ANdgnbSTDQswDHEQkKX/To8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793671667; x=1794276467;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mnCMgi1Mjc7rqcgOPGVHBPcSRGGmUVFCpLTaHePthjU=;
        b=OT4Cvjx+2gWAZFMH4+li/h0R72bDVRjkU7iX4N25pKK0K3JFV2m6s/tmpoxdbyodbG
         eWPAlSAqionQsDgJQUdgSDvlLwNOuMVrqSomvjTYRbAGoMrcfG9fP8h0DgdYH3CzIXum
         59P3yFec++0hD2ZcMKF/9nMiE1/80w6HkDpHQyYOYfDYvQ5+Y7VnfFM3XsJtsY6AQK/y
         OLsts3UQDJNAHyMmLO45VV96sQzwPUS6fQE4uOLl0fyctjwGvuComW9DPOJlgdmmEf79
         17vw2Uwg3zmhGKOyvAOxaaRsWMdWiT4XjcaV21cWD/p0hjuSZVre+0x0OuRfLEXo35k7
         Hq1A==
X-Forwarded-Encrypted: i=1; AKwUvByo0xgvTF3Cv3yx/3KazIx/C/xe4LAvZ0cYRdsWO/+pO9NS0KyVWbLLMv+4tg2fHGtDRIiG5GEUNAlLQsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLADi9L2+2IfjElPVLW9tTT23yhE3+jaN3Rsv/Psmxiagi3ZTQg
	XacIye64e4pGn4Txc71ZJy3mwHQq2+rw8mfI/c+qWhJbyiKQj/e/ANg7Qni9xo9Mkw==
X-Gm-Gg: AYBFou0glWGaSyoNzLg+He6RgfHiuH+Kibc9fH7Er0A1Cxvu1uKe8JK/JY49iYVjeOq
	DOmie8wbOQ+KMW6Xjzc1a3sUaBaptwc6X/7AhwMGHtGGvgm0hw5fsBhabRz2cTRs7rpklczckqH
	D1aVWEl84ATfwp/qibhyAq4/r6X8DV2NAJp0PNPdhf21NyBxrP5k5/GZbTBPMIA1hbw0hItUciH
	tn6zBLlDu/Cduu/qHNyC6ikIxLh2XrMjhCjYKfTjtUK5CYDYTmi6UmqHs/201lC/KMokCKJCGIk
	+iTwWhQrgGq0JjgQLDA7HnmLjV7J/RSDmET2a0WVjQDTB3JvFMZHoaZddZW88liRjRMsILEXvoJ
	2jLdj/ilcprAGj/znR1lq30TeDfRx14WT+ez0pjUlqOTjhzoGvJczD4IjDg3MCFByGEsgFcHlHJ
	nkLPuo5Hvl4rQDLPai8HJcThG6zUgvfTx3ucqeRnwGqJGaoB8Tf4OlmnwjOSDkMGE6/4pBp2Z8O
	QzD45mYRfCPrPv0sy8qnNGY3vJCElYoi7aQfy51Fx+WNt3lg1keuOeRxgH+fP7NvXjg1hGnk/aP
	eVSD4OqoNvy3aOZAhpLt8N3F3FynLJR5T03rSCiIqIRpluin1iLdUwzyyl8vsTgc6/E=
X-Received: by 2002:a05:7022:f105:b0:168:e942:4e62 with SMTP id a92af1059eb24-1ac601d2f3amr14793852c88.40.1793671667220;
        Mon, 02 Nov 2026 18:07:47 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:c57d:c93d:3543:aab5])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b23b847348sm4090158c88.4.2026.11.02.18.07.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 18:07:46 -0800 (PST)
Date: Mon, 2 Nov 2026 18:07:44 -0800
From: Brian Norris <briannorris@chromium.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	devicetree@vger.kernel.org,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	linux-samsung-soc@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	Mariano Marciello <mmarciello@google.com>,
	Douglas Anderson <dianders@chromium.org>, linux-clk@vger.kernel.org,
	Jakub =?utf-8?B?R8WCb3dhY2tp?= <jglow@google.com>
Subject: Re: [PATCH 3/9] soc: google: Add CPM over MailBox Array driver
Message-ID: <aulB8F6hc1eDvyfj@google.com>
References: <20261026214359.3122870-1-briannorris@chromium.org>
 <20261026144346.3.I7bc547c83b7bf677a62670099f481a91ac737073@changeid>
 <20261028-literate-pony-of-valor-3209fb@quoll>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-literate-pony-of-valor-3209fb@quoll>

On Wed, Oct 28, 2026 at 02:27:05PM +0100, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 02:43:41PM -0700, Brian Norris wrote:
> > --- /dev/null
> > +++ b/drivers/soc/google/Kconfig
> > @@ -0,0 +1,13 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config GOOGLE_CPM_MBA
> > +	tristate "Google Tensor CPM MailBox Array Interface"
> > +	depends on ARCH_GOOGLE || COMPILE_TEST
> > +	depends on MAILBOX
> 
> Can it be compile tested without mailbox?

I don't think so. mbox_request_channel() and friends do not have stub
implementations for the non-CONFIG_MAILBOX case.

Brian
