Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065433A3E8B
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790518586; cv=none; b=H90xsTaLXveqAQVBwrY67ZEh4RLEn/AT+3mxoigRl+6T/nwuzVqRpFuK+D3uy0dLdpO0QliDmG9QOEsgL5GBGmySGjhRramyBe3HyNHBUv2gD+XJf6WhgS/B5Cnj4/woG/ZntloORepgMvBesp3aL96V/DtvskmZsIg1OnT0w8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790518586; c=relaxed/simple;
	bh=/XwSdfF+044rUgyrOIZNdmuJ/A7mXol293yRwESL6lU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KYTJ+R+Tgz0XG3gWnJyWRr3DohFbTHQxfDp3F1de4Y5nMRVh6uIMt1RWWq5cd0zHC+p6HXHfU8OEJnZu9RSnQpjWUPzIY8SZZH4mfIREqvLJ/lL6m3YPiULGkBtnV/iVNHgWvZef4biTJ5NPvBmv2bEM/WTbYhWqNPXa7muEvJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-9809f3af20cso533598241.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790518584; x=1791123384;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yZul2+MEjvVjxyG2r6stUnfr/1uKRHHyHEXb7+uRqh8=;
        b=DWMoDQMel/qUXFkPo6qxR5XowfavigZzghBV/FoSf88iJLo8eWXKuf0R6YccVL9BDs
         Wbo/P3Hewdd4DhMSUiAEgIO5i4yWdK2bHcv6BkD/5s2jHn+kPu8/CEgrqfmMDO6BcTJI
         jX/cIMCY+JrdH/QkNisteyb/xjA3BF7z+A5JnZ+E9lQQ5SV25ALxYTXaRhpFVkWnRBvH
         p73h01jaH1q3OiQFMFKybr168eey3CXSx0nrL77PM0wem5m1eyl55IQRNZFJSFAcqHdQ
         4GZjgzJUMzvZayRMDSkSpSDpcWaGVOkD5ZeIdd4oDle1h+YAfKTACKaq5i04OmSV9OMV
         AGJQ==
X-Forwarded-Encrypted: i=1; AKwUvBx1VGVvxEoBa2SMqOH0fZrG0rNS9/BDPrzTvdXtLHozcPM+GEUeWTSTlAxV1nUeV8+MsKr40zJQp7Bpb3k=@vger.kernel.org
X-Gm-Message-State: AFq9FYKqBluffIvbFzmO/dM83r4aa9IUz8IypSmD3VRr/bKDor/tkuz5
	7jgj4vx9PD2+4jS5iWMLTLqRxBvF6ZC682Q9OzQQbif4tSY1smCiLXUiO0XUYdh2
X-Gm-Gg: AYBFou1QKDOjUy1s+avo78FsGAO7CYd+uJBPAn6VWwrmzab7Muor2BgWYQHg28DFfgX
	VNwofoISOMc2R3gibOOfBH8TjwaHhNddDST5mEYR3Zyx2u8YcdsrovsLSoR/+K46lkPFaHQg9YV
	FY1OW18ledu/NaCRv3oTrzvzzwOxJ4nUt/iSwESR+bphY6QqKfcnX53ZBttiaxb6Rt3crQ1fZV5
	A9Pz8KO65ks6kWbwzUcco8nKEIVDRcCJqsDEsv23uh1gMTjtdv85XDx4RFpE6u81eW1sDSNJ1p6
	XBmYfzoasAX+fEzgRIvEdCbOg1KaVISEPCDv94KWyLjEwItjY65MX5/3/A8vqlYZG5NskwtxSjj
	hS3G0jSeDrTiJb21xNvR2Z510unhD6/CIaYn1DU+nIx72rquk62AOV+oFBo5yrC6lIbCRgi8kOK
	TodxyTqE4LQdLuwfxo8w9fWKpb/XQO4nw2BoNpy+9Qro5Fv2RZTU8bEMKLqaCf0N4yI+0e/Lce7
	T7vTeoZBAX0JrjBcY0JPl2za4cOOdZQnBv2
X-Received: by 2002:a05:6102:5346:b0:7a7:19aa:f0d2 with SMTP id ada2fe7eead31-7af1f40a6ebmr3382112137.31.1790518583808;
        Sun, 27 Sep 2026 07:16:23 -0700 (PDT)
Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com. [74.125.227.38])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b0b8e62sm2873584241.8.2026.09.27.07.16.22
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 27 Sep 2026 07:16:23 -0700 (PDT)
Received: by mail-vs2-f38.google.com with SMTP id ada2fe7eead31-7b3a6aa10c2so312998137.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:16:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwKuTpSaszEqtee1MBejEZ/EKHHL/rkSKGgsKw/9XMo9qaUpB3KZrptjOiHc3xtUdYszYnqdFERsLRzuE4=@vger.kernel.org
X-Received: by 2002:a05:6102:5129:b0:7a7:3485:3386 with SMTP id
 ada2fe7eead31-7af1e9f48b4mr3427784137.24.1790518581788; Sun, 27 Sep 2026
 07:16:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731094402.741645-3-thorsten.blum@linux.dev> <20260731094402.741645-4-thorsten.blum@linux.dev>
In-Reply-To: <20260731094402.741645-4-thorsten.blum@linux.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 27 Sep 2026 16:16:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWOVeZZ1x79T14kBWxBZY-+FQYK1WhuN5+Vv7KGXVGMMA@mail.gmail.com>
X-Gm-Features: AclHuK9DYh46tGYLxKsX0NeKdBugbu4_C4Y0o8fi0yLPxiReP62zN2LjQEAKld0
Message-ID: <CAMuHMdWOVeZZ1x79T14kBWxBZY-+FQYK1WhuN5+Vv7KGXVGMMA@mail.gmail.com>
Subject: Re: [PATCH 2/2] m68k/serial: Add include guard to asm/serial.h
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jul 2026 at 11:44, Thorsten Blum <thorsten.blum@linux.dev> wrote:
> Add an include guard and remove the stale comment while at it.
>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
i.e. will queue in the m68k tree for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
