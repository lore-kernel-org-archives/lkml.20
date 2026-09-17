Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3534BD36A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639216; cv=none; b=Y4FnbVA6+M41jf8NH/9M14JXG2FJWfem/gYzZ3275pIR99TiDmZrZS1hWgV5oJzBB9fzJDW/JGqogepmJHSRevkLW1fdVvvWmchz9ugMhKUI9zhoRIX4LrCVFwLcADHpCCz4ymeNgxuzA4LK7oEFa4ImHu2xEKe3RGwCiOwal1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639216; c=relaxed/simple;
	bh=lyxCvXomazoscclUR0t4ky/vHCgm3jn4yYZm7vcNMNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoSblLZ/vPfGcsqa1Gj+DesCFylj9MjUEnFuBPVTxNv35SFFv0qxCjPrQDgWiPTJCHD7haqn3wCrLu0EGeEm5u7uMw7kCAe22TpbO+vFzMyTxh0PpVphg9YNAptuqm9v4Bcya4r6kzjFG6Z7OJC6ViUUOfwtFciS2yiUqqEubA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id ada2fe7eead31-78565b4db77so373138137.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:59:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639185; x=1790243985;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s008ZoScdhr7BNxJ8Chjjcs4adQQJjIUFRUX5dqGglE=;
        b=hSITh9KHTOoexGwmQjB6O1m5FdvLqJHwY4RrCi9aBh46gkB3mnXriKRiJi1r+JPbjz
         HaKWuuicW92XFXNGfAyUWz74bx+tNRlKgXqEiejkcvstmigyL/KMvhS865e4YJxYZgij
         OoLbV303uufD7T2aV8VY6/t3hlgkOOZ/x8oEjxI2Kr5Sb+NiPbSJHQQf30TraJRXk4Af
         LXuus1qopvZdPccKQVWV0ciQAngbEABfgVZXmkyq10p8bttYGOQqOB7FOrLNE+u2XbHH
         +34+XfcK4111IpXNLCR8uK9Ythoib/wEHxcIxx7XgYDNzJ/MTNOCqvmRPh5mPbR+BGpI
         SGfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxM5IksQ41mpJObuqqbG9fgTjeg25MVzJlJ4+UQyXdXjhjDHcr04X4n8oZrB/08APjga9X0HvWo9630fKY=@vger.kernel.org
X-Gm-Message-State: AFuF++kixQ6zt4XoScsAPL6zeCVrGKkkeORkX+6cr2hqdBKOgsJq7vD/
	3i/6O2/hhjP8xc+cPy2KhrNiRVogi6+gmmJbM4UBSfAuKoLTXdV8IoK0fMvUS+drsIE=
X-Gm-Gg: AYBFou25TKI8GIstdewggu9ZaqngVGKdLu3hRKnpg+hURV8HG6Ze3LFWByQItBzOjsZ
	jfW1mRmtTtHoqbyS67jRD1zZ4Kbv9lyoQcd35e47C29XtjCEAnlkDKmMDCWiL2hfjBU8Hvs3OUz
	mBaH0zpSVliWq1waoGLhDG93AW+8wH4duEPKtbelDk/X4nk/b7eExRNbPxLixQJN+AQXODSaSk3
	S6IYnqlNq49PctIEpV0iOQr6PQDnkVj+4eOAcl1DG4hRpjwXMqxbTUZCwcPP2bBH25IP2LyhpLN
	XhKUQR6emmXnwP+vPN1+jKaVSPAoInst6IrerKmTVAOnWfQMELR2bTXb7EcQprcdtDlnGgIc7a3
	VM1qMNyKI6qIRZ6n/XrVNK1ypv7xeakiUIpg8vXxTibtR6zBtuTbIBD2Lr9jrF/f7fwRUyMWC3g
	X1pmpuMOrvut2do1Y6QiDuti/ZxIVsaII/43noqF3k5nGfjQ/13lL9kgZHIyFA7JZynK0D7XjfE
	MGz8yzaUxFP0j8DZNybQXXwDQMUqMpTlGIZYwnL812DC9tr
X-Received: by 2002:a05:6102:8007:b0:7a1:f7c3:3a45 with SMTP id ada2fe7eead31-7a1f7c33f5bmr1806708137.18.1789639185112;
        Thu, 17 Sep 2026 02:59:45 -0700 (PDT)
Received: from mail-ua2-f27.google.com (mail-ua2-f27.google.com. [74.125.226.219])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9832357cfe4sm2470801241.12.2026.09.17.02.59.43
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 02:59:43 -0700 (PDT)
Received: by mail-ua2-f27.google.com with SMTP id a1e0cc1a2514c-97e7c7bac31so364301241.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 02:59:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzVewVsRl7kUFSQbPf87vuo8OCXzvbNGN0ww6cBdW57aWLtf2Xwnlnqy0+Z6kwbFalVno1Dnk3ywwfxHpw=@vger.kernel.org
X-Received: by 2002:a05:6102:161f:b0:79e:cc38:c40b with SMTP id
 ada2fe7eead31-7a0285a1f25mr6780296137.11.1789639183155; Thu, 17 Sep 2026
 02:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910085430.3173166-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260910085430.3173166-9-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260910085430.3173166-9-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Sep 2026 11:59:31 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXFVd160eAuWAcxqvRWUnCHZXshCZscnRoYdiZGCzBqHw@mail.gmail.com>
X-Gm-Features: AcwNN1V3Cad5Rk6IGr1bTFS9lb5rrCjt1yRBSqziGUl61jF7JvalYEJw63TOIlA
Message-ID: <CAMuHMdXFVd160eAuWAcxqvRWUnCHZXshCZscnRoYdiZGCzBqHw@mail.gmail.com>
Subject: Re: [PATCH v2 8/9] arm64: dts: renesas: r9a09g077: Wire up DMA
 support for ADC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Sept 2026 at 10:56, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> RZ/T2H (R9A09G077) has three DMA controllers that can be used by
> peripherals like the ADC to offload data transfers from the CPU.
>
> Wire up the DMA channels for the ADC peripherals.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
