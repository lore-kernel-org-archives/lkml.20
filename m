Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B2B3F0749
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419355; cv=none; b=A7dZCpUkdUMn53LA3/oVIYkqGmNySK5PMbYe1x1i13obGpjQuoPWL0MY1zGAEye61yiDd6O45o5sWYQVqXEmt7vwDqnwF+kPclxhKR9kAB35+gaMM8onqnX43eqHkTMITOpRwc2L/WqKycFfgPMoFWjoryVuoJeTuQVrXElalQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419355; c=relaxed/simple;
	bh=Bw5159SWZK0MfXRnp1tl8h36EKMSwk4lSrReIomW8O8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMudVKrOSBo97CORZWaIPjn7+sMW3NgkquxtqMtafU9of99/QAzpFXAA2+3EWeiMDwDs7AVcXMd50G0wvuo3E0JxbbVDWuj8vv/RxtXHS0TSELTNM52TmlGAwYIHZ/rX6xYdAUyAboGGTQBiNk4l5oQ0JZzjupj8iM/tdUQjbL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7c33cc572e6so2090939137.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419353; x=1793024153;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gTsMBv+BX/aLxxsbc3oBL3K2Qt4xiXtXHE4nz5I9X0E=;
        b=ZcNqVnKndE24LNEwJ2zfLLxvoKjkjYIDA0baJLZIWZNdRIz5LLJtlBrxZfm/ssgVYM
         Li95JxmiSsCkBJRXYHGzIxHG/i0XInwVjKeUrj2pE0mm4y+MW8lDVPaPxXRkvU6B/lly
         MJgAgZAkm+RSOUH6k/rAaM56Q1hy1IKVxgOJr2fS/KEiJccd3OMKPYbcD5PzUXYC0JET
         AfQI376iCpV4UZSUa6R+Sa8FaXcn0y1qd4X+OviRj7VLjadb6wUHR7XPmIDmcy9QSaJy
         ZMFAFRyqWLwym4aN/S6ma5x0R2Sw1ImZb3LxCwZpR9pjUeN7rqBuc49uVBfPaJJYYkKx
         zqHg==
X-Forwarded-Encrypted: i=1; AKwUvBzK23jmkbZOSVomFKeZEiP54ppgojUVi6nVu5hbg+huTr8htXP2C30mxsD2zgyT1iiFW7/cfmdiTebKnY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+tNFgEsd9ef4fQqq6bhTfmkIspvIEVP6fErYbqIYSCwStwg/7
	YEa7Z11cZzv5+k8cSZClo8yPQU85915gjuS+Q4niIxYMK9C85VYu5rw2S//RdvOl37I=
X-Gm-Gg: AYBFou0+d5uem/NgjjvJnDg3DB7GY+xBkH1cfyUk0ipsI32Xw881hNypHtWYXdioF2n
	Er//UoGDJ+5nQYoDGLYrXYTc95YgDpZMh2grzjLUpnwKWKq8tIk+7Mqe33BlhjCxpw+1thY1gB8
	2wqHGQxZdp76Yner2DysarxoIvcQtm1d1ccVzkm5f0TzUUto4yfrL3VXj2K6PWu1EJTFcoArmAK
	wd8b9Dxta1gDYzUTjnZuOJgiHZ4SCTxcqcG9tWLxVSCVjan9b1ZJo/hmOtDCeeBgFJBa9HRC+b7
	7oSsPLnMNY7T5E6uJmb2jVRtRNRPLYPQ7JL5YwE4RTQ1caTB8YCqihZ0z5ArRZap+f0z5745lba
	nhVBDacZXrj2CwGNmQAZ3FZtxh8OZnvqYnKJ9qMynVvwffdlbcTFJgC6PJzf4jgrEqvvJYLQSZf
	I7/w7d/g5ycLVsMxLvEzuvduwWZKYxYG9sqpkOON/Gpp2C/9ggzE0o/Mf9q40IXaxC3qNRtmUL6
	pHgSc53q8CKLB4qegYf9KlRAVIEBkg1BDIeULVYseCnaM0=
X-Received: by 2002:a05:6102:292b:b0:7bd:ce85:b00f with SMTP id ada2fe7eead31-7cc18271943mr2533415137.40.1792419353144;
        Mon, 19 Oct 2026 07:15:53 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990bb334183sm261105241.5.2026.10.19.07.15.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:15:49 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-9908346255fso1635610241.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxUKX8HDAFcWA7Ua2tr7Xin09z0lfLFM8oa5hd5rbsn7xDlNsvYy7u4cN0fI8uf+CJHkuu7wIgG0f/uvbk=@vger.kernel.org
X-Received: by 2002:a05:6102:75a:b0:7ba:7a64:5946 with SMTP id
 ada2fe7eead31-7cc1823be8bmr2159864137.35.1792419347856; Mon, 19 Oct 2026
 07:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261001082225.125956-1-herve.codina@bootlin.com> <20261001082225.125956-4-herve.codina@bootlin.com>
In-Reply-To: <20261001082225.125956-4-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 16:15:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUXbeTU9ROjHQKje_+-hUCgtBOXEUpvnpRMh_dyJTo+Ew@mail.gmail.com>
X-Gm-Features: AclHuK91kcP9qOZ_DEuR872u-j2nw4CzwPaKsUs5BANpggKtpgKKO3z0eBpg8xs
Message-ID: <CAMuHMdUXbeTU9ROjHQKje_+-hUCgtBOXEUpvnpRMh_dyJTo+Ew@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] ARM: dts: r9a06g032: Add support for timers
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Pascal Eberhard <pascal.eberhard@se.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 at 10:22, Herve Codina (Schneider Electric)
<herve.codina@bootlin.com> wrote:
> In the Renesas RZ/N1 SoCs family, two timers block are available. Each
> block contains 8 timers composed of 6 16-bits timers and 2 32-bits
> timers. Each timer has its own interrupt line.
>
> Describe those timers blocks.
>
> Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Thanks, will queue in renesas-devel for v7.5.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
