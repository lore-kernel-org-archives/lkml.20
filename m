Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35904BA9F1
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788447639; cv=none; b=hbthJw7R6Zc9tXXXQK16YGLevm8J8AoN5q49dJTSyX/BRBNkl6L9boH81KIrnM7HLjkgenikxHgoME9CyIo88UoH2O7Fm94eaehgZZmMkSaHNFE6xDmSHWyIQ4F2tlsARfhqbNpBhNC5GffholCq9hILqu0fRnb2LnnbrnQWvPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788447639; c=relaxed/simple;
	bh=rEiGuSHpvriUqLhToDYgt8FFSKdOnEQptXqAy0J5nV4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eueBLqqxCLnolahB27eZXSZLO8SoZQOjZnYn9GLPfaFSSVugKp/iOeRCHUuhTM+0wOjpzqB0SfXj39ZQXKfw6L7Jp/kc3oy9tZ2DH7x4AuzzJNqARFJD5WuVGDvpz2CAa6RVGhtcV+pQGX0aR27mVFimVctmfKFYFx3itnRll+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-97bf90f4b41so1199770241.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788447636; x=1789052436;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E7IpOefrxKq1W8FoUG8547LazHe9zeJ3Q1wTKXTvt3Y=;
        b=fSk47aOyXmJoQgsqOWEKfSHRuue9YC5khGchtA2x9B9EK16YznUHRbUbcL0gZafjr4
         sCmohmp/wrUXYezo6TQ0FVI94ogWzrnuscEsIpXe2pr7OapeWudrbVQKerPtLSN0ye9L
         bbSFIo+PkmsziBFauPZ0TAczpdGKAOHBaEYNIm6K/iH0DueoZ9ek/7+ANeXhwuAWjXL4
         TMOir9/+05JprhgLEYe+aLwY0ciivsSKQN3B5t/dWrOZkUOhKQuyPAX/H4LYbKKlZKAG
         Rhs4AIfUNftH3wiRs/vs7GbA9XAr7ei9VLf8V3P8lywsi+39DPGxNHnQf4RODjP5sQGw
         eKNQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyYzbu77k0S2+9wibE0N7sA/diX2HyOrIHZgGi6tCFiUeCmCgHwGIDDrOQaz+tEWCxdPfVTb8bVRVDR9Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mLRoabbmwGiDmmziyC43QA5RcGW1+BBSdQR0aN2ZNe58AU5dRe
	NWc4vkjvTpD61N4ATgdrsnuLteboBmn0rf4IKIWeQkwP5/oxoh6JdVI/8a4uXu7vU1A=
X-Gm-Gg: AYBFou2x1g10EIylQdLO+vpOeWWyIzrHOzjPOeQJtUm6DfXDqKgxFnWr+JFenK3+qYi
	aRRL+grtisIALW6Jr6emjV0P7X5akE/bMx6rYQ1CoY5uFpWi8z38irlBAyPCXJq9khs19aDCsH+
	L21xmuggFLX273OBw3kiw3dMiRJY9THh1UojdEVhQkJFoK9Bo1DP5ySzys5QSg83qrGgPS3v+6u
	/qq6jqZ9BqPP4d6esG+11y8l8AqPD4LcIfHVPS7Bc9AA8jI2msLgfMEi/05N5/qFijl35tIMZ/m
	dv3I+0aaV6XhY7vXEx9uFlw2oozE1WW52IM6+i3UNKyo1WkI2lNzfDP0I3pohnBVas2tV45I8vj
	Ni4qWN6gkPjpQwk00CgcnCIKp05biugFFu6OM41rmPCkoAPeV7o7JGtV20AUs7MZ/yiKXDCjOOL
	x7pzR1JEjW0v+vKM+bYxl3+AvcOL/gKB0bQP8hTaRKZPOf0OcKYLt7qAxRAyXy6LqyF3gGkM/DY
	hauaB69j7rt/F8xehM0CqQ+ZA==
X-Received: by 2002:a05:6102:8084:b0:779:c38e:de53 with SMTP id ada2fe7eead31-78a1f36fe00mr6165801137.10.1788447636424;
        Thu, 03 Sep 2026 08:00:36 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9806728262esm4576462241.3.2026.09.03.08.00.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 08:00:34 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-977258a75d9so1513195241.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 08:00:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwjhkBsEPs3Nr1VDoMxxoG0uhT63DiE3PO0Bn0HHxxwieB3ZeQd/Nr0i3e5rPQn/TSEEZ1a58RN1Mg0p14=@vger.kernel.org
X-Received: by 2002:a67:e704:0:b0:77c:6bdc:824f with SMTP id
 ada2fe7eead31-78a1f1d4903mr5471476137.1.1788447632007; Thu, 03 Sep 2026
 08:00:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <e481b6de46cecc6ea604ae165272c667274cc621.1788437140.git.geert+renesas@glider.be>
 <abec6831-d344-489d-b70c-1e5dd4d43c2d@lunn.ch>
In-Reply-To: <abec6831-d344-489d-b70c-1e5dd4d43c2d@lunn.ch>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 17:00:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV98HRJEy2s824VTnXXDMGcfuMN-s0RFertQ4ymjPyp4w@mail.gmail.com>
X-Gm-Features: AcwNN1XbkTCwkdzzCUI--td_POZtF6rqFVqNEudn1e6PV9_tB5kgdfNf5dSHIDE
Message-ID: <CAMuHMdV98HRJEy2s824VTnXXDMGcfuMN-s0RFertQ4ymjPyp4w@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: ti: davinci_mdio: Drop commas after match
 table sentinels
To: Andrew Lunn <andrew@lunn.ch>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-omap@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Andrew,

On Thu, 3 Sept 2026 at 16:38, Andrew Lunn <andrew@lunn.ch> wrote:
> On Thu, Sep 03, 2026 at 02:06:47PM +0200, Geert Uytterhoeven wrote:
> > It does not make sense to have a comma after a sentinel, as any new
> > elements must be added before the sentinel.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> net-next.

Bummer. I have added a check to my checkpatch wrapper script,
so hopefully this was the last time I made that mistake ;-)

> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
