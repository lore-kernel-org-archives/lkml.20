Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42CE037A496
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789407306; cv=none; b=ZnKUL0AxmySKDG3jKTFQHjKuYtnUBAnOODutGde5Se/VY7oR6L32mcY6pURyeTkbzD7P+/72AzoXOuxJhIzUuvOnWnTKWD1Qn3EFh4XwhRwm+GSJZgRaynTF99aIzDrINsaRDh2ZOYTY2EArSrwwcGZWLwWT2XfHwRLx3he6/kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789407306; c=relaxed/simple;
	bh=Vsfrgq4Z1iO5Wgf2nTiGn/7pth86QSJP/A56JZdeAO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SMXAkz4seMNexXtpgoCpEcnNXa9RDlHoP9S3WKfqseTPEx7yImtNp431Di5/PWcQMzMXPHuSybvLZwJys1odE8oar2A0vbz3UktBVwTbqYD0/z2ylrXrbIyhwCobD92Kghzpooe682O+wQDlq4eETTPtkVsKHBQPHlrcr9rQt5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78569cf871bso1735248137.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:35:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789407304; x=1790012104;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0NUX54nJDMCbpqD/MoUkH89fRfTiAlUe06ZP87dx3t8=;
        b=S2x5fbYvcH4KaYHLUboLmobtpFYwH3sZQxD4lwZNhKfZiZcJXP/erAnvE6eCRlSI3X
         Mb4okoY7+IJ2IBH6Jt5h/fiJZHDeGT2DPh9gSJ7g9h/Ez/wFBxFsrMRog1exZbKwWaqt
         xoWMO4819nfy5rJNuCI+TcTTNQuMh/FmKswAKQbXoXaLc+qybjZ517oQ8NtC48/ae3Qq
         s/7NK51pfyq/IoFY3xPRbS1Z9Xg2lMPH4yM3d6MnAC2Qi24OdEzPMF/A4ebbh7OtO+iN
         Jk95G5hSUypiah34mXq2bi/yV9vXv427b/Latd74uHbBv3bP75pLKZznAiikvjUdGAVH
         tfow==
X-Forwarded-Encrypted: i=1; AKwUvBzZkJJTSSMC4ZrgSXu54eKHP9V5m4yw5nSgkdUAsPB1rDAV3JeIBkOgviAwwnRLw6FIofGKsPbOERh2XEs=@vger.kernel.org
X-Gm-Message-State: AFuF++nfx0sd3CbLMackI5ODbsqn0kWiVWJYaSmfijp8lWcNcU9aSXrH
	B9h04QUlWlRyG12eyF2MWlzEXu3K3W10rW6Lgqbls19Czw+bvJeiEx3GURYx7/iZ
X-Gm-Gg: AYBFou3uX9slK41w0tYLeJQjM8rzEJOFCSHyIiqO/kXeJSVn+Z34hVBPfF/lF5q9MtT
	4y6FdQv5mi/YuWT0fJmyuHM6ot0wdagFjDH069Gdasm6tu2NPBtKjril2nkg3y7CFFadEKPX7Es
	G1B8W+gdqKVn5OL1WKpZ6WmaViTfqGvxUbqoCFiQmZAHSOKP7HdyPvWygGJyX8c6gn+L0O4PzMO
	3H2zlelW6Po2h9g0LZ5opMGnTPfAZPpbg4pRUKhIUzdLPNYAuFci54FfxHVFXBoRticXqgZ4O9b
	NHG1UTZV3AF08x2nzt2z9BNrtEYzGdIRkK4fwRbD6VqHPQttOXZKsqqBpF5//L1mkwMuxUB26V4
	n52vhMRq6qqg0Hbtk4WxGeabi9gnvIM0VLeBg564VONkp6H5PpG4KSbhH8V6pt+dnbY60xjJUuG
	4IO/ywWVbafJXaXxXUtUxYq5VF6NpCVg/bR2czjni+E7mbbsAa0uL4y0DhO9MBrtDA1hBaeylrg
	wjPybJf9wCh3sQTVqzwW97Pj+NlNCXtKO3cFA==
X-Received: by 2002:a05:6102:548a:b0:796:1ed:ba47 with SMTP id ada2fe7eead31-79b51c81486mr1900341137.0.1789407299099;
        Mon, 14 Sep 2026 10:34:59 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982e805c24esm4483638241.4.2026.09.14.10.34.58
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 10:34:58 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7d4so1355354241.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:34:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw+hHP7DxZ7P+nVqUYNkLzRxgSVIN33/KJZTU4psGKaCvnzYhASu2WH1LRvF+VIuIdRgTFVR34UJEgviD8=@vger.kernel.org
X-Received: by 2002:a05:6102:149c:b0:790:cba0:960 with SMTP id
 ada2fe7eead31-79b5acb355emr2241619137.10.1789407293829; Mon, 14 Sep 2026
 10:34:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1788943229.git.tommaso.merciai.xr@bp.renesas.com> <3ee335429dbf7c2d105d03e184d8f74872b680f0.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ee335429dbf7c2d105d03e184d8f74872b680f0.1788943229.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 19:34:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVqRynsmD2nPqmZa2Exqxu735U0OD5FCdOszg6cgWKAvA@mail.gmail.com>
X-Gm-Features: AcwNN1WoxHDmzn2F97DUjx3relfUn6leVozV88qE-5Mopf8vJX_28JLL2_fcd10
Message-ID: <CAMuHMdVqRynsmD2nPqmZa2Exqxu735U0OD5FCdOszg6cgWKAvA@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: renesas: r9a09g047: Add USB2.0 support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, 
	linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 10:55, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> The Renesas RZ/G3E ("R9A09G047") SoC supports 1x channel with OTG/DRD
> and 1x channel with host interface.
>
> Add the EHCI, OHCI, USB2.0 PHY and reset control nodes for USB2.0 channels
> in R9A09G047 SoC DTSI.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
