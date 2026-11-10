Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310727;
	b=LXDfjyaBXNmFSdktoPiqoX0CV6WQF+OCFVyhuSZy9XFjSDshIr06L1BBUmU4dXlVHqwZ
	 9m8IOt8vNQFGg1lf5T1f3H+SlhGqc5mPqt5RBG2ELmjgCPXUQu3BQ9HcWKqi4BCFhHQgP
	 RvtopHe498dguArmBJT236XdKSiRaF+94rrrfByi+I100HlHCFNE1e/bLXqXRVHkkWuty
	 NsiaIYTcSXxhg2Wd3F1ytz2O4Q9suQlVj49NOm4mtoa9ncVBSlhx53ymyNTJcIDspVtbQ
	 aKDm1ITeIvzCQq+66Hqc8KylV9scPyHlYd6zfcJF2E8kAt0wP+vOogG0j3vbRAEoXNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310727;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=6I+JHeyZuaCKZLVFRW5Ed83CP01+3aMwrBoHmGNmzl8=;
	b=CCRxw8aG9uY8bq8yTZO+Z+IiiGBHoeKSaoCD29EENA4u15jhm2N9WEeOyaxva2s4d+rv
	 JG3uL3Hq5FiDsT0xZ0sNzXPuEDMiZS9TFau73gBWk4hN5/37UIyGIpTNVouhhs9OqqH4o
	 IFt9nJKyjhqS5ACW4pOB2khbXRca4RqqPp5QXrZJ1pmi8JZ8Oi62aM7L8XRA261o2hCYI
	 AeKHCtOwZuLzNNvH0dMbX/C+YwsrgxtNe8cs6Je18rD9/Zid2HKY1+9W3r7i0vCBwFHxM
	 5Xx4GyLmI+7ec6mCSck+++LFtnIYvOzVsix8gcjm2peHeynLxlyB/odPhzwkdnwL3LA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C33606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C33606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-999b2b06bd7so844365241.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794310726; x=1794915526;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6I+JHeyZuaCKZLVFRW5Ed83CP01+3aMwrBoHmGNmzl8=;
        b=XHW4UxgeX2w8Np2s+UWypHpifHiylPUmv5cqt51LXQ9OoNBBf4W1TWgZzlaOkRgXVQ
         Gxn4cAa3kz1El+94R6lcRfIADqM/En9Hgd/U4HB2hI2ABiSIFL2t3fiff5IQ/nZ608EL
         NLYMzXnaLqjwk2Rg/qNPRdpd6pkyk61PVp0ywaqDIOamh+P+W95i06ZKol3sNHHGmUth
         DTI7Md+ljUrVzprrkoiYFka27r9daHNd+ONEXZ7NaCo6sBkyJVXUBfca9oLxo5N8ctFp
         Q88GH/VZYc3eTz0PJqKBXyhTDAcSVAascuicVpOMxVVNO9e7j5k4e+ol/eRWc0eVbR3y
         ezlg==
X-Forwarded-Encrypted: i=1; AL+hErE/8hKStY2cx0czYG6FeQ8r9Hr443xRTaa25okD3mfJQDj0OUC5SeXUIlRXnN0yaOoKar3cJdFstUwiep8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Lm3x0OcpJT9VtWKZRnOsdek/cxAGnZccETbMOBD2i8GHOtSWe
	Ud9txY1clHA+9Ohoabtlwc2WQwzvFYnZDbMDVkA9uoJ14ldS05Yjk1B5uoHe564lkRo=
X-Gm-Gg: AYBFou068eQgUk0q8HVfmVbawfik8o2mcRbVvyLWZ8Dhk+iAeDag2b4atI8LeaL97lu
	XM1kWzDYsbaLGjIcXe1JAetazWcxAcTkBvhLJjPnzLKG04Rafi3m25Ne+CxUMhzKcLhlN3HQG5o
	sBnUb7xo7MXvuQ601l5EOZuUCQY7GhgHjDGPGSUvcuwOVJyoMHf/R3xvEYvRWZexsR+Xd8bQKdE
	Ggdw7joYIUQwcKuaKtaotqtFR668a91dQJd80BDm/IRbiZvCgkalAwr2JezF91Fsj+EaSET4da1
	JdBwwo73Mt9R45ggNmonkMhzuC1feNkI9F4h9c3VgrhFvpqwr317GfC/YEjfVA3E/6il0yiq9cY
	uqsnovri1ArorVOTLGKnczmGPqXApmwdZTRBjzBMt7BBJLKm8D1HsexIkamQpgBoQwwPRVMpRJM
	x7gaCAaZ2z5yW/2tJ+BUXHVNtp3LbAHg/759l2p7n5uzVQ2zCi432jacrD9e/rvyhxYLVi5yy5Z
	DZn/zhJSi3LODFbJ7EhBoaX8sgrRgym13Hz7SHunAEDgKHcwcbqqggQLygTxw/9kYuYlylE+MH0
	gaHqq4WeTqr9I0MzO8gIVDJhc3WRRATfS7FVB2mj+SlT+J+9u77ZXpS/46D52bGOBX24LmY=
X-Received: by 2002:a05:6102:688e:b0:7a8:1837:9eb9 with SMTP id ada2fe7eead31-7d301c1a90dmr782425137.27.1794310725926;
        Tue, 10 Nov 2026 03:38:45 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99c200004e7sm1687078241.3.2026.11.10.03.38.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 03:38:45 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5eadadf23e5so1222632e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:38:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGy1I9GvAz2nhncyPbLVA2EEK3oPHkCRGV2ZPFEv8+fsk4gd4fz/Xta7QKLtOxrmaVxAjADllsbejQZWKg=@vger.kernel.org
X-Received: by 2002:a05:6102:688e:b0:7a8:1837:9eb9 with SMTP id
 ada2fe7eead31-7d301c1a90dmr782422137.27.1794310725440; Tue, 10 Nov 2026
 03:38:45 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260902141544.565763-1-claudiu.beznea+renesas@tuxon.dev>
 <20260929-loon-of-remarkable-romance-197df6-mkl@pengutronix.de>
 <CAMuHMdUE1Jh605kgj4ADU7p1UjE-0u3ydBehL_5wsQPbe1EPMw@mail.gmail.com> <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
In-Reply-To: <20261110-urban-bald-mastiff-d3cc34-mkl@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Nov 2026 12:38:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
X-Gm-Features: AclHuK_lxOefaCYe09vBlve1NogRGIcO0y48-fj-2S6VLM4EBEDUoZvwulW0sXI
Message-ID: <CAMuHMdX-jMZ+cxq54DdECVHTN+noavo0RfW8vv+GAgoxUyEkqg@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] can: rcar_canfd: Add support for Renesas RZ/G3S
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>, mailhol@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, fabrizio.castro.jz@renesas.com, 
	claudiu.beznea@tuxon.dev, linux-can@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Marc,

On Tue, 10 Nov 2026 at 12:28, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 10.11.2026 12:08:49, Geert Uytterhoeven wrote:
> > On Tue, 29 Sept 2026 at 16:19, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> > > On 02.09.2026 17:15:37, Claudiu Beznea wrote:
> > > > Series adds CAN support for the Renesas RZ/G3S SoC. Along with it a typo
> > > > fix patch was added on the CAN driver.
> > > >
> > > > Merge strategy:
> > > > - patches 1-5/7 should go though the CAN tree
> > >
> > > Applied 1...5 to the linux-can-next tree.
> >
> > Thanks, but six weeks later they are still not visible?
> > Same for " [PATCH] dt-bindings: can: renesas,rcar-canfd: Restrict
> > resets in top-level"
> > https://lore.kernel.org/20261009-holistic-warping-puffin-3b92fe-mkl@pengutronix.de
> >
> > Am I looking at the wrong tree?
>
> I tried to get stuff into the last merge window. For various reasons it
> didn't happen. Anyways - I've pushed all queued Renesas related patches
> to the can-next/testing branch. I hope I've collected all the latest
> series. Can you have a look?

Thanks, LGTM at first sight (I guess Biju or Claudiu will scream if
something is still missing).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
