Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58DF2DECBF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 13:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788527106; cv=none; b=l7BjLkAAMC2/LXHn/o6GgCpWjPiWVKFmOhWo2BdJdn2TZbRcxKpSw9NJ6NG5vGJbvE6j/ABQ4Hj3xo3wU+Sqe4uFbYuUigftpov+5U+WxvqMcL25GeuLaplH97e13Z8yWlvWFdyfjIqQeNqOPYUcJ1hBxeQd2FEzhj5hp1HWuY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788527106; c=relaxed/simple;
	bh=9xSOtnR0JMeRis+2A9+69QPm6YPp5GCesQOz8P1BqIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUn/jLVuM6l96ZrzsrK4VMpuS2jQvaSraZ1rlAZi5WayAzDzBjmTmDTizgcJ3UAb3ZOhMiMKQMazFLGOF8K72RYn7yUoYA6p62lEpGucNFACK/ICYQov7etnh5NJKELlMxfqEnHEHS8zVn8Ch+XfH+qAneNGGgT/oQNgxraYy5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7841b831381so317358137.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788527103; x=1789131903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RX5/AQcrp5g9z3JYNb5ynUUaEFHGVwH0550eIwcyIWE=;
        b=CviZR3d2PRTot8YQ9ql4VkgUW24GAntB6VCUp1T1IjmY3TsnTLTr7N+njOdpkvnGfm
         +pYZDpXpk0PfK4ijSaOYn3XPPS07q+L4FGpAd9i3jAEJJak+HJ/W1x1oiXFM0NaZYbCf
         XHwg2f8wARwXW+mNxqh4WPW8FxLqsq2W2NIVnUX799oQdUgud8VNs0HPQYjrgrNnxc83
         tKhLrIUEGwicCxj8XrX8HhaAbmGmfeylNJnRRzLHmgN+GZDgCdbHMZUZb3jC3tE5YdYp
         TN+LO3svlhFjU2lWjlKCAzEV3YNsdPFJYjjoIsFQaR8P8qJYfnr+hCFf3F1I0J0/X/06
         rHIA==
X-Forwarded-Encrypted: i=1; AKwUvByiqzQCTIyRxR4K0qyrf4Pb490CNtyOOQ7wAuS5rWLIBBMLYopVIuzbJnfEwT9wWk7iSKFsGxKmT0j/z+M=@vger.kernel.org
X-Gm-Message-State: AFuF++mRmWr9Pyj4O+abUF8y62Mpvcx3vR7g46BmOBGM5DOPxFn8zYKT
	pnTJWpO14oTcbYQbyrd36hkKYaQFDXExjNwcwxa+GkKqQHK1mP+1rU+zlxYd1Pqn2GY=
X-Gm-Gg: AYBFou3yUd2OXWaT+Mpcwkz6XDhed9iP83Qk29BrV9lRjjXPnyS0PEDwd6M1AJKMLFq
	vcLpgXVzjlUl2ZT83/xY1KM5mJl3UOSQQHyd9Z8pfd2xf2E+CFJ+tEZfwvhskNpx8ePCJ/N1yMC
	JUpCTlgcItGYw9vVDoWQXPliRpvvkQS24+7LiGLIRUWQ3bmFyPkKxyDZWUN+7IAmsLBsRqGFri0
	Mf5c5367NMsViEEZQMCMcKLH16lo+KWNNIhb8iQ2o9TMwHYzxGVFJ/0jWDY9Zeh5u87wfSX1+91
	NC4l6hAlEa0/TWMNG3iB/cZH+XKbrrF0E2HiPBOBc+GhCIyBeMD0cJlO1X/rzwdXdiheYRJGdgm
	Cx/GE8JWfp0Y1f/MttxFnsnlU3iXQO4hxI3fTHfLp2A1mvwojYljFVibwR2b72SmGQ9tgLOmQTp
	4vru/KzFblpASjtT39NtdVe/R7mmvxXKtxB5IqEbTeN3dyd3cCN/hYEMtTZEDn8yirIkZ5twxO8
	Q3HcSHgAyEmMi/STb5oUfJyes7g/H7ztrue
X-Received: by 2002:a05:6102:3ecf:b0:781:9922:78f8 with SMTP id ada2fe7eead31-78a4a926209mr1357317137.13.1788527101818;
        Fri, 04 Sep 2026 06:05:01 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1f14asm1462077241.3.2026.09.04.06.05.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 06:05:00 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-78a4dff7ddfso183558137.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 06:05:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwzwjU3o23kvj3bG33gKdwnOYDPhV+jEb765ZqcsXmqr22xiyIXlKngGUfwerQjf11sZt7bmCoU+rqK3OA=@vger.kernel.org
X-Received: by 2002:a05:6102:8098:b0:783:79ac:9dc3 with SMTP id
 ada2fe7eead31-78a4a880ccdmr1610149137.10.1788527100013; Fri, 04 Sep 2026
 06:05:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904125425.412632-1-claudiu.beznea+renesas@tuxon.dev> <20260904125425.412632-4-claudiu.beznea+renesas@tuxon.dev>
In-Reply-To: <20260904125425.412632-4-claudiu.beznea+renesas@tuxon.dev>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 Sep 2026 15:04:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXMyNqkuLbRuxjmAfx3K9uY2v4Bi3E55Oi83ty3183diQ@mail.gmail.com>
X-Gm-Features: AcwNN1WoMZ_PTeRAOvmLdFtKHfL1Mzb06YSXX-uH--FGhySrvI3MRJ8Z9p2r4tY
Message-ID: <CAMuHMdXMyNqkuLbRuxjmAfx3K9uY2v4Bi3E55Oi83ty3183diQ@mail.gmail.com>
Subject: Re: [PATCH v7 3/5] pinctrl: renesas: rzg2l: Unify the power source handling
To: Claudiu Beznea <claudiu.beznea+renesas@tuxon.dev>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, claudiu.beznea@tuxon.dev, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 14:54, Claudiu Beznea
<claudiu.beznea+renesas@tuxon.dev> wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The previous code handled power sources using a mixture of power
> source specific definitions and lookups in the available_ps[] array.
> Unify the power source handling by introducing
> struct rzg2l_pinctrl_ps_desc, whose purpose is to describe a power
> source through its power source value, associated register value,
> associated capabilities (e.g. Ethernet), and associated IOLH index.
>
> Introduce two new functions, rzg2l_ps_to_desc() and
> rzg2l_pwr_reg_val_to_desc(), using the
> RZG2L_PINCTRL_PS_DESC_MEMBER_TO_DESC_FUNC() macro, as their
> implementations are similar.
>
> These functions retrieve a power source descriptor based on either a
> power source value or a power source register value. Other functions
> that need to perform power source specific operations can call them to
> retrieve the corresponding power source descriptor.
>
> The register values for the soft power sources were kept to zero since
> they are not used across the driver's code.
>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>
> Changes in v7:
> - collected tags
> - dropped 2.5V voltage domains for SDHI and QSPI

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
