Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42C8384CEE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788533333; cv=none; b=sZw7oU2sO/JCMUrWl7czOHBLRFFnVgD3HqJxh58u+0c5nE4t8rKFIWt5gNSJ5U3uB+TpNGVErS76yc7l3UxMssTBaYJV+zVu5MR63AtUWXOEfbgfWZVbzKAkZ005QIco9Wcp0jYwIZqwvyLk1m6G+cPyw2/w8u/TY7JiH2nA40w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788533333; c=relaxed/simple;
	bh=TcGIo92RiATa8vkGJVdjHgxt9WlzbewL1KtAW6cGFCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b3G3uhVN/dxd6JKGFmLiaWWFJUXvR2nlCchJ9DR6+UDBI/WaBdHIo0LmWtnHgeNdbRqRW5VPSWzGWBckVjJx5YCZeHpMCa8T+WECEh63W1B70jfn3YLAWCYq2ooSn1U/mE2UMOEFOzCcm/5f8gYFdhKPXopK1jbM2o28KnQihAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1103749a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:48:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788533331; x=1789138131;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iy22q1YzKGiQPGN9B1bpmbrGTjC/sYmYXe5uXN4aXJo=;
        b=mFN7SXA1oEfMBoPNXMC4EYWowds8BjsdVfgQHRuKVh/5E4cytLQBbsPPyH0p1RT61m
         +Jac934PV0DMZJ/rulmYCHkokSo6V474sD/0JvbQbsP4cHtMDu8ibKWsBDQOwpKBV9+Z
         TESwlJ0KYeg/tsA/MwQx51ETWJ8yyspwwJDZugRmNMGXrSV+1XOaDX/9CtpEZKxqkj7L
         Li2VKPahPtEwjEj/2C37S+raTC24ZSerw7pY7y8dd93VaHQNIanMtDB9b1Nh73cLGYLg
         XpLYyGpdx3qu+IxTVDm+OY+Pu354hY7JDFMl20395B7SHkC3sXv3PJOQ53eWH7Oh8OGj
         CCrA==
X-Forwarded-Encrypted: i=1; AKwUvBwD90cJUKiJe/Ld6qtaUDOliEJ5NdhZlgNW6yKOhbPC874pMIcQHeohvEHldQ4/Xi4bkvftjhnAuyFUqS8=@vger.kernel.org
X-Gm-Message-State: AFuF++nyhCm2X8OcIlYs1C5mxETioi7APFazzBU8tuua7BrKDf2OJrVS
	8R8sj4z7gXzr6p6hOcEmJFcykzrBz5fIs6hxZ2A1TAcdpFx4Q9dLY/2d0RZQSj9J
X-Gm-Gg: AYBFou1+iev5ysCi4skRmOKYQMwO6wCjuVaDeMjMt74SgrJzicH3Db1sZAjWRYI8ujm
	whiLDJy71YtYDSj1H8EzDqSwRsZvD7ZnuV5HYrIVpqsrvdeM0iQegms3rIZo6YpFhmnKZY35ZqZ
	5eKfaVDGkG4I0c26ehm0PpUNu6WRNgtlDwwJdIAuprfsMvRV8k6thxXWFCd5B1dUsKT4AVX5FJa
	i0165Zdw6w1c3wbPDlsRQVLjqwF1nZD/AeKLnIJgHSF5wfA+4jdFKCO9+mTk00mmcpkEcwFaxCk
	EW8woKepAd8Mzkeh78RHZSlgSzMn5yvs9tB5Job1lSuHh5KCAIxKXKM7qMH/8eO8ZZ3/oTImrzG
	gksabArIfrErvGPH9Ls9VWb6u1kuPQ7u+SQhJFrfIY1lnfML6iRVLE31wpSLkYvVhWOxUgCmiCS
	Ux4kdIvagnlv/KOqow/ZmDgvxB1UC5ArA/LIBIzN55zwfiMO+7F0nP2dXdHt5Q1myaEkpsu1PY6
	4QmhloazVM7uH/x/JRf2W8wIQ==
X-Received: by 2002:a05:6a21:134b:b0:3c4:1916:9d40 with SMTP id adf61e73a8af0-3da39fb757emr10022035637.12.1788533330872;
        Fri, 04 Sep 2026 07:48:50 -0700 (PDT)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com. [209.85.216.42])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4554b5642sm922787a12.32.2026.09.04.07.48.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 07:48:49 -0700 (PDT)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3964e480f76so1218334a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 07:48:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4EmFIv7333p0ai42osD7MitCh0eX8lHaQL2Bf0dZewZcX0K3UEspdcZuPKcqXFtXO5n/RWhUM9Jfhhpk=@vger.kernel.org
X-Received: by 2002:a05:6102:2d04:b0:785:eb33:87a8 with SMTP id
 ada2fe7eead31-78a4a883885mr1900429137.4.1788532960799; Fri, 04 Sep 2026
 07:42:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788338320.git.geert+renesas@glider.be> <2cf42d7ef9b452efbab3007ec2c2340cf87adbbf.1788338320.git.geert+renesas@glider.be>
 <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
In-Reply-To: <20260904-fabulous-lionfish-of-cookies-0d614c@sudeepholla>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 16:42:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
X-Gm-Features: AcwNN1WAkp69Or55f6uh4v6WhdtMEG7Qz9QclhM1mQOZ0FBl4cYNnC9KwnYi2zM
Message-ID: <CAMuHMdU_u1ticUomZffY8iU2GoWgyTNDPaL2O6KB7yucr47dDA@mail.gmail.com>
Subject: Re: [PATCH v3 01/12] dt-bindings: clock: renesas,r8a78000-cpg: Add
 renesas,scmi-firmware property
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Cristian Marussi <cristian.marussi@arm.com>, Saravana Kannan <saravanak@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	=?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>, 
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Sudeep,

On Fri, 4 Sept 2026 at 16:03, Sudeep Holla <sudeep.holla@kernel.org> wrote:
> On Wed, Sep 02, 2026 at 01:29:17PM +0200, Geert Uytterhoeven wrote:
> > On systems using the ARM System Control and Management Interface (SCMI),
> > the Clock Pulse Generator hardware registers must not be accessed
> > directly.  Instead, the SCMI message protocol must be used for inquiry,
> > configuration, and control of clocks.
>
> Why is this node needed in the devicetree at all or why is it not disabled
> so that any driver in the OSPM is not probed at all.

The node is needed so the corresponding driver can bind against it.
The driver takes care of remapping DT hardware descriptions to the
abstractions offered by the SCMI firmware when SCMI must be used.

> > Add a "renesas,scmi-firmware" property to distinguish between systems
> > with and without SCMI, and to indicate which SCMI firmware interface
> > provider to communicate with.
> >
>
> I still don't see the need for this if you disable the node, so still

The node is not disabled.

> NACK. Sorry if I have missed some discussions, please present the information
> as part of this patch in the commit log if not the actual binding itself.

That's why we have cover letter, with links to previous versions and
discussions.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
