Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492903;
	b=Vw0R+Aq42fcuL79sYL/c6YiHbhNJVrYI5PNAsj6jjYVuTUWC5hzGs+chzkBztrkEh7xM
	 Aw8d6Zg/m/Jn/2tiV3nNvhORwdhZ6fFTg9VPWl/yCm8pSyYEcLpglbWvpNyQU1j7Ir1EI
	 V1vYVodQM1cBntTlP6xIHi5tHSptr7phAQyPSEvz9+uzc98adm6cuVb1eMX3ypHDRlml1
	 dhXF9S2ue30JvNSZU9FXnRxZZgsRdFohOh2Hdo4RKA9ZX5/33ZfiUbwSSjfRCLEr+LccX
	 7Sj/FARmE+SGYpqk7QetmtJMrbostieFesPpaHeOYx9AiRgwIAXXzvQYfGCMALv2I5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492903;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
	b=HD204RkRsDOSgI4EPVyGOIxi3p6eY/hU6hQ/n+0cRHiy1r21NAmRabF4vu7Z/Wkl0Nik
	 9Tiv7fxklq6Q21snZJF5JpFbNGHP0ZVi5TnfJeDTevkeq5rTYR6CPDBqCkiwTwy1KrGNU
	 v0WPVQ8/3sjpFmpz5w9L5i4rmPqcFNlD3Scs6LW1k435kQVCUkrCWZvCnJDsnZAJsMp2x
	 oFSRHbSusj6fJnY92FL4bYol4xX4raFA/LVVpv9hyhPpNNUh//NaS1RneI/FgSsB6QE6n
	 e0ZZk+ZMvWFk2DOnJHlUvvfxUIQus0GRmqaRJNsj6Q2+KY/bcNVMzu76bRJhNKjb8fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F404606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:15:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F404606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc013095d4so1589048137.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:15:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492902; x=1795097702;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p9x4nyKp58U6HRLjvUMttJNHFZj1/ft861x7cFqIKgw=;
        b=OmCngZ27S1030dKMDOxUBIPjoYCuQlFgm7phvhJJMc/XB2o2wkmJgvrHvL2AmA9KW1
         eOyMSeD0F5h2tUpkekDvrFg0gV4waxE8UKy+oGqdmE/xx1KTpLXXvz+DfYKF9OF2OaOQ
         VjKXunw6yDeh66tYAchuTs3KkaKjmmHcaR03ENBN6oo/wC2lq+aEV9wNn0HV3Z5ijy/F
         gdlI6Zb0Htmf3MHBHVlJjABSWv/EZSt4NP3/uFUE57VRIs/BJ7No3lcsc7fh0CNrv0lX
         6Ike6lqvc+v9eCNDlNRsdn9OPJsY0PuYBhJTdY4FfrFyWKfwrl8r9cODAaettS8Oac5H
         e56A==
X-Forwarded-Encrypted: i=1; AL+hErF+Yh4c/htPYtol2jqRJIttBGsjMAcRB+qslyNMmJ1JXIvVqLl6PvxsRNPIizU/LO9KVgywiG2QUbgv740=@vger.kernel.org
X-Gm-Message-State: APuU4Z/T16mGh5MuAuj4vFmlWPE4uOmQLkrnzqTf3TW3F5TsWrcFR6E1
	Ee35XlI/Kql0cd8D0+PYmjIvOm2syQgHlXeNFipOU0efj9gnfJtbWkhCRObQSbdtCGU=
X-Gm-Gg: AYBFou3Dii/GOueXAI93ttsZGH+sywniakP6BKP4wkYN2NwDOR/2K7LGxtTLKoHWsF5
	y2hyIvVf29hnEZZCno1m1ewQ6btBWJ1n/yZW+xdU00J/7OmmDlF+zAyRuhymQA7AP2oibgqETbi
	69LccjmqqqBKQKBqD3gpYn4dnHlyXWy6G0b6zbx7dBZb/6HT7nFThVeEPVYqDS4elHUKI5ofiTt
	dO86fr3XyEO6ItxBqzL89aGqu9L13hK7ELkurJkmCa9drFvYj4pg4HHH9XeEp1S26BoeywHUYks
	7JUxy40miXoiyg8PEzFOWrJoDIOqPKHkUz/yJb+k46UwYgMtqhQDLaje2fz2b8od/VMxwLPetNk
	AwXjf9fhxANW194Shv2IT5k/cZrWB9ZWj0oGIcWlJ+zAMV3g46AVcn23LOaSp0ODCqD+Jy+D7Ns
	qh+XBIj8pdU1biPwjigfZhMAPVUGy9CRgS7LDlmyfcYDV8t6LZFd/dcl3WWDAFbtqbuD+9d4y42
	MuKxuPHClTkqNzy+4951R+ou7p977lno3Mo6VKHJmPredvx8Riq96O33BZJnOnbiDHB/JKfKLX2
	l0ziEb3u29JWf3Bd/tf3lBXyq0OUOMmRHhOgwYvahcPtzyT/V1BOniW8fj0IHGJZ5qs=
X-Received: by 2002:a05:6102:2ac4:b0:7c8:4efe:5243 with SMTP id ada2fe7eead31-7d504e72e57mr1972940137.14.1794492902432;
        Thu, 12 Nov 2026 06:15:02 -0800 (PST)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c1fffe12dsm5138687241.5.2026.11.12.06.15.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 06:15:00 -0800 (PST)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99a5710ec0dso703942241.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:15:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGJnbcPBkwNTOdoNntslchLgLxjOdKl4XIj4Fmza4YOh0Q55ibdhIlWYzRxI9IiURjV0Kyrzznr8qDlrx0=@vger.kernel.org
X-Received: by 2002:a05:6102:5798:b0:7c3:881f:b620 with SMTP id
 ada2fe7eead31-7d5060e293emr2040092137.21.1794492899954; Thu, 12 Nov 2026
 06:14:59 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-0-1b2072e8c37e@ideasonboard.com>
 <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
In-Reply-To: <20261109-epaul-v7-3-rc1-x5h-vsp-fcp-v4-2-1b2072e8c37e@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Nov 2026 15:14:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
X-Gm-Features: AclHuK_i81THT_hnDNfFBzoyAYqo67SKua85inNQRuBh9I9Xk4b1lG_6SVOc53s
Message-ID: <CAMuHMdVBBySyLE=5gG5HvQV95811asBZ7LKwsQXAVPdUPjjTTw@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] pmdomain: renesas: r8a78000: Add SCMI maps for VIO
To: Paul Elder <paul.elder+renesas@ideasonboard.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Ulf Hansson <ulfh@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 14:34, Paul Elder
<paul.elder+renesas@ideasonboard.com> wrote:
> Add SCMI maps for the VIO domain to map the VSP and FCPV power domains
> and module controls.
>
> Signed-off-by: Paul Elder <paul.elder+renesas@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
