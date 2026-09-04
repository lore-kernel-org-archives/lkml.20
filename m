Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC233DDB17
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 08:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788510149; cv=none; b=esOWBf+QMJbybtzExd2PVRyXWXystnD/1uboWfAlZ0MmK2aIrDporbGTARzAxEBQTK4VGTfcKkcJwoOvf+ImQIpmafE8qOW298WLK6X0+rNHcVngOHnLkx5BnyOgVZfI55ikFNoXQdogR9KJK/DSnnQu9XBK6MMMZV63odDUUXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788510149; c=relaxed/simple;
	bh=oyDxmpF/0rXv8EzH2b2HV9ktlFAjPfgd1vY1EFEf3Cc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GE0BQmu2FDKdz95jkCgb7RNzdv/geNRMnjLCdUnNfb/4y758WrZdCSUV8qnFytBDj5miqlC1tOSIEnyyUcAvis7m0dKbIftzkcI7XPzPD88zTVyRyrSAH5G/wCFD96dsXyKDLh0po+lSc9MfJTBLIk6Xs/fK3paIAyH46b4op2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-7f48c750afcso644293a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:22:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788510147; x=1789114947;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8Hg5enr8UVGmoY4IFaKJm1CFD+8hJCgKWPLT+95rrjA=;
        b=MZnNPkc21WJfdW3zLVWgrrGmFu+5ibz6J9pXrx+tRmgJnppOtmziIQWrxmzn0+hNnx
         GQc9/WWU3GJuux7xen32Kcn+JD0quWDkrJ6+G8kqX6qzCA2q+BHTKpybnGufGS1Htj2H
         hdVlNforMkDIoQMGd34dQPcupkdAlexndIOl5D1h/xb0QeS7nDWpMHfikaNVzNuB2b60
         XWm+LTX6TZomse8f/s0lvuJKSmd5CTwk2iKDPUSPiYikOlMw4hqq1dce9cwhJNUaSQEA
         IQPHnXj3YScGTcyokq/gs5KDEvhqaJo1/jRlef0Bg1+GuyrXJHYGxT1hVq4RKVr/6xn/
         OyFg==
X-Forwarded-Encrypted: i=1; AKwUvBwui2/ovwKdbmy/X3XnwHM8nopP208xb9CmwZFqHLoUot2j55KWXwjbeXsz6SCeywDvWN67C90o0dg4InU=@vger.kernel.org
X-Gm-Message-State: AFuF++nZUxAUMwLfps5qWPFZ55ZC9jPZCSbyUo2gU400sH0Kk9jB73NG
	oMpfZ8r2Rfy/yFp7Igr3BeICOoTkaxvbxh5REzLj+kBplW/QI1ExcIeLZcUI02hC4F4=
X-Gm-Gg: AYBFou2bFFMBdzDGmXyMOiCpiOCWL6jWq4xzYvI6rnMsGIdzqVpEIfra3H6QAazfbZK
	2Zch7Ky86Z6t0EItoN75NugaGKD22ng7rOwPsna0qf/04xywfKAyaLzobF/rPQiicDbRyhoq16B
	yPO3/RBOUhmnNDKltM8vT2lDYoMoU1PoKN7iCAu2oz0Xr3MJwJI6FSjGZXGKEh6LSh0A8m4QBu9
	tB5pRZVnMxvKl2D+fQcPYDpMOMrDDaBQVdREqhjUg7Da2PWBB21l7F4TUJc5btDIVoGaoFdVwIX
	mgdymowma68rV7P96P7JShYH0bE/x4la7nGsmos3W9USEAMI8sVavGsmQCo2HZJtgoAW4tlR2zn
	VaDOCH0v+OLN39q/NJlsuODVLHjW3T0oITnlFanQeVr83XqkqxlfTpWDEVd5XBYo6D8cHlzGDOS
	TtlS+pVyi98Ul9+w0Nr4qk63iM4kzyZ/oWNhavYx+gJnPA/Y1TSo6XOt+TpVgUcLPBTUt2X+FLf
	8RsxrzAmDS2Eb6//8GO2XpY6Q==
X-Received: by 2002:a05:6830:82e9:b0:7f6:8bfc:ddff with SMTP id 46e09a7af769-7fa1e6c1b5dmr4372410a34.5.1788510146779;
        Fri, 04 Sep 2026 01:22:26 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f461431fsm2454396a34.2.2026.09.04.01.22.26
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 01:22:26 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7f4f53975e6so622803a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 01:22:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw6uQwA+Dci7qXZpZ6c+vFEGlSDGaEdugWwx+wv2JFXLAgJGFEVUWlAz3SGbj4bKXLlzRMj17lEd5p6OG4=@vger.kernel.org
X-Received: by 2002:a05:6102:534e:b0:77f:fb50:8822 with SMTP id
 ada2fe7eead31-78a4a9106f4mr984477137.7.1788509665014; Fri, 04 Sep 2026
 01:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904043724.2955444-1-s-vadapalli@ti.com> <20260904043724.2955444-23-s-vadapalli@ti.com>
In-Reply-To: <20260904043724.2955444-23-s-vadapalli@ti.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 10:14:13 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
X-Gm-Features: AcwNN1UYeUOEoTpTj0vmkU4IKRIpHFGa-g95RrL_FdgZr5R39yo0yU6G4UOZ8vE
Message-ID: <CAMuHMdVXHwWKu_oqNQBR=hytL0JQVzMsnVWyBueds5PHDJWmWg@mail.gmail.com>
Subject: Re: [PATCH net-next 22/33] net: dsa: rzn1_a5psw: Remove comma after
 sentinel-entry in match-table
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: dario.binacchi@amarulasolutions.com, mkl@pengutronix.de, 
	mailhol@kernel.org, msp@baylibre.com, florian.fainelli@broadcom.com, 
	jonas.gorski@gmail.com, andrew@lunn.ch, olteanv@gmail.com, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	kurt@linutronix.de, hauke@hauke-m.de, chester.a.unal@arinc9.com, 
	daniel@makrotopia.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ansuelsmth@gmail.com, 
	linusw@kernel.org, luizluca@gmail.com, alvin.sipraga@analog.com, 
	clement.leger@bootlin.com, justin.chen@broadcom.com, dlan@kernel.org, 
	rogerq@kernel.org, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	rjui@broadcom.com, sbranden@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, opendmb@gmail.com, 
	andrei.botila@oss.nxp.com, wangruikang@iscas.ac.cn, amadeus@jmu.edu.cn, 
	kees@kernel.org, tmshlvck@gmail.com, c-vankar@ti.com, horms@kernel.org, 
	vadim.fedorenko@linux.dev, daniel.zahka@gmail.com, 
	nora.schiffer@ew.tq-group.com, v-singh1@ti.com, oss@vassilevski.com, 
	haokexin@gmail.com, alex@sverdlin.org, aleksandr.loktionov@intel.com, 
	lgs201920130244@gmail.com, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 06:41, Siddharth Vadapalli <s-vadapalli@ti.com> wrote:
> Since sentinel is the last entry and we do not expect further entries
> following it, remove the comma.
>
> Signed-off-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
