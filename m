Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793781037;
	b=Q59tQxi+3qQAS3sK0qbdYLzBgOLrpit3+wPTj6ohmLvDR0pLYknsyHGhG6A5z6imLuka
	 QdGoGTFqaOCwRzfzgf3t4pqs3Dcu+yqUjQW2r0HJLpzr1k72L2GZHmw07cO1XmpIMgp9z
	 WA++OnRGoPdMJ2cvjxcLcNBBOdThHKlA3+bCpZpjk1R7+nmn/gr1OpjQv3o2UtsHb2s3n
	 rNKsp307wxUGnewLBSVFyo3rjPlU7OyuVRtN/0ePl+XpR2PARuELysJWPM6puA12Vrr/u
	 L16vSSXjcAF6WA/8pcOHHjOauPfIDbBd1EJccLMkSSaD0r6xnrAD44CbBeBa2BVJrGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793781037;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=VTnZ9KxipM57oeI6XdWPJAXVctjy3UG+Ti/EianJRiM=;
	b=gQtwmbfnNLTFGL5+VZ9xkkA/3gKpHnQxySnJHOGlVYdTzWm5a39qPLg7nVZKyS1UZCnX
	 ExSJAWPXK8nEmlRIj1LQemIW5FDwWBkxKML03fM9y+MvM2lXeSrxlWZjEMt8n1qcdWVrm
	 3phpZzY954t/gE8sUF4V/gcGcVKafOJ0YJvR3jiXbok5i+miz+f6g1Ul/vDxLs0dzDuaA
	 WOfZvWX5TD7Q77dMQRl62AW7SXL1uKuTdDrPIUOAh+dRCx0bF/YSrh9Mx6PRu7HU8HX6X
	 KPPmdscBdMDkKD1vGCYqzfTw2gzHyxxOG9m47FVhxA5zDtZsnSchiLhDARtmO7RSJPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D57606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:30:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8D57606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc53938a8fso215584137.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:30:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793781035; x=1794385835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VTnZ9KxipM57oeI6XdWPJAXVctjy3UG+Ti/EianJRiM=;
        b=jzBgPqBZpimQtppqK2HL2u02rce/Wy2sTbgVzITwXYlSq+w5VV4yQP8g65n8ZHwhjT
         Pn2j+Daov4YS61CKaezb9WKZVclCmY8xt6aAEhw78fxdpFiogXgnrDVD73O5J7+KwAhe
         4z5ebZGgdcHtqIrabeynBlwVIMPs3kCslxRDiXqZC2dBGTYGefxTLYdrdT4TVuuBXO5B
         HFl4VP1GZXm2FPcivRYOtKNBEtw/A2rA/vdFPSywxNheTcnE8lykN6ntbuwm4wDD2Vdb
         EEJBTZmCaka3c6hZ+2hv9w2JOKsJ+SrX/RviXUCR1j5fX5QtBV/L/6z3JKhb+G4oNcCY
         WhKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEdGZEo0yzZ5bqW0cs1XtC+QLTSHQxW6s4qENiZY2TgUFyRUXUQkNergMmv6wEiupzWSB8wpp+hT2auD4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sE50pHaH1wvCFaLXjWwhOZaXGrtOtELuOtoeXf2GeRa6ocHFd
	yJhdsCCFVon61OkfLrtkE7fp1joI0pckELsyoDJmp7/flazTHfhwiHdWwUl0qXe3
X-Gm-Gg: AYBFou1LxLHz9vU3qxmQiDelshzF8zd942IMh8pRJe8Ku38brDrl3LxqEyUF5Tw17QD
	nLjgqzE6XMuQFY8N7pAzvSCcyT8/NtA9oq+yLlvdLs8VC1nEA52dYoVncgY2ZqS5Fr8oU0+4TiZ
	JGNdZ5lAwc4QwxJ2CcQRCyMDCj2dgaqqsIKBvYYlgv3vItjENfDaSKTGC9uxUxOBi9Mb6Y1n6c1
	H+U2i5/K0cYKvSdYoZktVnaB2RZUJ9bMcOnvUfCWO0WZ24awGu8iXkE8EHGBTE6jcBgsrpe8+AU
	9IkJedOoJgIa6al6LVrY177rl4OLOzprZoA12R4Neaz66W9OR7cnlRXaw8SD0LdoKNEipjahv12
	wnsVHWP6b6Se6iQARBwb+KKO/CnKUFbszltnM7O+45ZorHovBIozwswhq2eFdlNIZuSAI6Fh6ak
	3D5b64IcnpYFRmxDZLgMu6DDnBbgyTn+ReP+//EVKdhqlWG7LQmYzpDDMNOHGtyIvZqRPEn/igq
	IrvQScInTdzeeemG1NJQTJKwU6Z52RyaymvLDpGkCXrw5BA6d1op2yCg6/lOzUQhlsNiVFvhjwG
	OJS9Ko+iLwAY4TVjLtGH7tF+TWthnlGHcdAA/Hc+5wCEOZdgko6WfEm9vMmv/iyQ3A==
X-Received: by 2002:a67:e70e:0:b0:7b2:f3ff:6b34 with SMTP id ada2fe7eead31-7d07277c9e4mr6718637137.1.1793781035354;
        Wed, 04 Nov 2026 00:30:35 -0800 (PST)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm1109791137.3.2026.11.04.00.30.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:30:34 -0800 (PST)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-7c03a445cb8so246185137.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:30:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxvyKBojXqIno3Vpz8BVJ1RznWVrwx/CgWm/wm71U/JYKEUybp/cB7pUVii6rGGnjuzLElGYUdhOft1/D0=@vger.kernel.org
X-Received: by 2002:a05:6102:8099:b0:7cc:bc0:b2d0 with SMTP id
 ada2fe7eead31-7d072d59168mr6120354137.33.1793781034293; Wed, 04 Nov 2026
 00:30:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de> <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
In-Reply-To: <20261103-reset-regmap-test-bits-v1-5-1b33607a76b0@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 09:30:22 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX8-8nEYKOB3Hhbb5DiXHcOgYaMCtJ0do=evQDbYNEMLw@mail.gmail.com>
X-Gm-Features: AclHuK8USmfzs7i7XtJ90bDmKjuz-weCg5Jo9uiJtfA3Xj-kpN0lb8TQTdngXvE
Message-ID: <CAMuHMdX8-8nEYKOB3Hhbb5DiXHcOgYaMCtJ0do=evQDbYNEMLw@mail.gmail.com>
Subject: Re: [PATCH 5/8] reset: mpfs: Use regmap_test_bits in mpfs_status
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Damien Le Moal <dlemoal@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 15:53, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Simplify mpfs_status() by using regmap_test_bits().
> Now returns 1 if asserted for all bits.

and propagates errors.

>
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
