Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B36C493623
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405053; cv=none; b=un8xjk0fmckCT1qOo1+/d0Y5lKUhbslq5XZSNwDg2UvmX1TLdkgQXJT1NhZN2Btojm8eiNgSf+k5MuBZsPkl5Qpo2qOe4o7NZDT29pf4zdEjL8hx5xYE0HN3BssNA1c/I70xjLul3FQlMFDVc56kAznzz7S3Z35gFSv4iyxMnXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405053; c=relaxed/simple;
	bh=ushmip9d2SFG6bnjsZ8yz5Zdtn5SOGcJMUGcTuHYRJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7Fr+K5zZAk0dWOrYEPwphhWtT/uUVsoVu/g1SjQDCpTk1u2qvyJNCc60Ng4JxtD/j+DeyIIo4YA5+fJcH34AnfcgCFFehCDklKMjYvnWkEeTnBv8foMCaVkcztUrVlsObl5/WgjZD/M8NM15DhNmu+ENio2k/8Ux858vpMWzlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982dd15d169so891493241.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:57:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789405050; x=1790009850;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UifqEQ+KQQAg0kseH9X1CMJd1CDr8OUeTRsEVk1uHRo=;
        b=H17OCZ84nIdoxum/hoDpbW0JSLddEJY3KI9BR1oP3qLLFgm1dcAbJ/v5bIH9x2MhST
         d+Hc9Br5rPoNv4n9DYlUf3Mos/8rT7WL7xbkADe+40sg4r3t5ysTjweFdEBvOx6mtAjC
         NWRFCEh5Nox/ZC79jkEecOMSLksEUNrvbGrgC8RXa9RXvDVkmHSa1OXH3RI6rX8STsLZ
         Wa4M1WJ5U4AV+O8RJj3rbz3LnJn2o9wbQJz4rblR31e8PSb4Z8vnQjmNufh2rrW1bJ3I
         WR7SQewK62E9VDVSKNIC3+AHY+2prFdZFu3Aoxinke1w70LGUUqPgMgtqTvTWhkbtDie
         HO1g==
X-Forwarded-Encrypted: i=1; AKwUvByHWiwKDJbhxAk4ruGlo7mtzDfkf8dIB4Jee0y5Jwsu0nHYaUrNBOus+mtxYQ8jHpNGt5bWSarDSAKERr0=@vger.kernel.org
X-Gm-Message-State: AFuF++m/526UAesZ5RoRCdD/9G16coo0Unfyl5llVryrf51v1kTSmlW2
	EtKnynLuFSJv9FvJLTM4gQKViZqQLXextAmmZVTfCXn75O2zqUdhSEpDr5rZTgyp
X-Gm-Gg: AYBFou3oQQtKjQgukqigyfrX1t1eLvqAMRKZm8q3NP9EtrK9jhbTOHu4FrnxAWIYlja
	XsXlxzRSGQe68Kxuhkipdgj2p9RHYjdBOwT/q55u7/zbR2fVb4IvWi5u2RWQDq8n++X7OHVHbS7
	+gV+nGmEpGUQpLN5E1U8sX6PYjiZyE2MiG+iZ4y+Xehc5J3Dr4IH6kmvJ31D/scMpkNUBKOUPRU
	aaoNcsC2EfDVNwDnN8hZPkzTDS5muZIKkVHeDmUTHM3JsokxP42REgOjz34afU51pDisGvgKfUm
	iNdA7eggHI/6Akby/zIfCeqJ/EBR39rt2VBY7+LoxVq9b7gq//yWw+H4DJQuwG+paGVisElq3Gi
	9GoXVowNrfEoQMXPcI+9vhGFppQc4oOyueqi67+eucj2FoltP4uOLfmYTQl71ISMpKLzerR4E4t
	6MfhsCgNanFyzehIKOX5jneMd8WiAnAm7JfWFOZy0D0T5Nx+ppk198x1tdeiLp3BUTL2dSfy2qk
	sfnQ+9R0MTStNEqCDedmTIuDUIXq/SJ3NratMw=
X-Received: by 2002:a05:6102:38ce:b0:785:10ea:be93 with SMTP id ada2fe7eead31-79b57ca27eemr3994825137.4.1789405050109;
        Mon, 14 Sep 2026 09:57:30 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9ed9257sm11532632241.5.2026.09.14.09.57.29
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:57:29 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c7bab8eso1080780241.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:57:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx4iiUs04zxltmcbjI0K3ocNnJlLCy97OpXxgwLEHnJlA1Ozz/IAu5I2QLg4t+bIJ+IbXU4ipHvkuMJC8s=@vger.kernel.org
X-Received: by 2002:a05:6102:148f:b0:79b:a93c:14a with SMTP id
 ada2fe7eead31-79ba93c04b6mr4018053137.8.1789405049110; Mon, 14 Sep 2026
 09:57:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260914-rzn1-miic-fix-array-v4-0-069112feec86@reliablecontrols.com>
 <20260914-rzn1-miic-fix-array-v4-1-069112feec86@reliablecontrols.com>
In-Reply-To: <20260914-rzn1-miic-fix-array-v4-1-069112feec86@reliablecontrols.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:57:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVg02LSTMweWn4MN4qa5w8CyuVjynyGYH+HUxExSw6GSw@mail.gmail.com>
X-Gm-Features: AcwNN1UCiZdEM7pRQ2nOAAFuR2AD8XncIqdUbLRRpmHPk43RN4HtjN0VXTDTOVg
Message-ID: <CAMuHMdVg02LSTMweWn4MN4qa5w8CyuVjynyGYH+HUxExSw6GSw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] net: pcs: rzn1-miic: Fix config array initialization
To: khendry@reliablecontrols.com
Cc: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 14 Sept 2026 at 18:41, Kyle Hendry via B4 Relay
<devnull+khendry.reliablecontrols.com@kernel.org> wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>
> Fix memset parameters to initialize the entire DT value array
>
> Fixes: f39e968dc168a7bd ("net: pcs: rzn1-miic: Move configuration data to SoC-specific struct")
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
