Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1073F23C5
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 14:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790175383; cv=none; b=hlZHJ4AzIlKORThsJrtCN1THSaxGB8zsQN7V36+9AExJSwm1i3kbdYk4VgK/ubPR8A7yBXygGLru7oiyLfICC/6YHza0RHX7BymzyQqaynxMMPI7LYgiXCN5yiw/hZ700/rucCRviiUcP5TWrvt7VlbDDhxEKvigH+3gh7fVU8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790175383; c=relaxed/simple;
	bh=R0Hl1uM+B2TCFyzAh2mRelpWA1TgmI+2NQ2VkDXBKN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F0mGw9+mlp+tnEnG2tidksaTtJ6S6x1WPcDaXZ+oJ1uIfqqyrFCNViqEhNXp6bdf8cbnKg6mfrTdOReZ2z6E1heCpXQw45Aj2OAEI9E+QbX7RTyixpKk3Un1Q+PvuqLpCn31E3+I1L4J3/w7KJzURTozsJHZdkH7cUguVdu64/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-790b4aeb66bso554492137.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790175381; x=1790780181;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=u4gaNTKxdC+sW3aviG7p02o1OWtFZhqrn2Ys43SAJgs=;
        b=r5lOQuQX3mwilzqiVfMjlZkjEO+QfwppXShD/cNYnl4xTfz9j3kSwacmlG9w6VZb2+
         HJzM0zksi4VSbaM3wxzHlAaEDcluSJzqDkG4Qp7fRozxAu/63KLtL8d6CdZfZb7ENLTg
         pB8IORpf+WZS6eeZ/5bgUIat3YKLpGU9sjznfROE3n8kysWfO0Vhb78xmLPaA9QnQDy9
         guNvaQBbvXD6vhJzAYDttiQdoUTftIvIHs84fJpGn8v5Q2TweRvmE2GA1Eq5E+liSUqD
         wHjpxYDfOWEE4Nu2YXx9BsrmOXhJXQlGf/tA7BzDtZUU4CaKsny4aWjKKL5GgfHQcast
         mugw==
X-Forwarded-Encrypted: i=1; AKwUvBznu2otB3F3b5w0UZtXxTCfZWCWJsXBBFT7xaR9MyP6PGw42bTdjR6tkyhI3eYUToFX9/PMPKpcPJEZrHo=@vger.kernel.org
X-Gm-Message-State: AFuF++mM6CjqOx/seGCU5vxmMr0cDlTIj2MzI44bqYHvXbDgzOuMYIDZ
	Wl63c1/DomPPKPzhUi7srzj8zkbA59lVfaQ3tuS/dc3a5H2XwQPcQJ1v3XwydNVmpww=
X-Gm-Gg: AYBFou3aWPWO+Y/Lqy+DFwTEtWfjhx8zmmDvHCP3f6Ai5AM9ebDaRvNQYG245/QcvLv
	h1TrVgd6f92fdvK51CdtL1LHpbbxtYaKoLgmrMw3WJk/0XHtn36CTvlIbcVxjVis4EQZT9qu8u2
	jvqrmtRyqcMoPDJ+jUCFzA5SmUe8dq7HwAZVQGBOSNpLauAjpQ5Jy4DG1kRs7vuok/Nqdjf3h/X
	9cpTxxYlf6sJ2+8MKsQ2bC1beoPdYBOC9Qumhsd2/nXF93RlvYI76FwRzUNibXnBPJcS9OBW/6R
	jmrIj/XmZv6CbB6dMPS/fu8gjwvB0rRG/oe9YQvFQDGLd5K6+MnIpXiEsGU7o3CIEot7BIxJrt+
	wwDJuD5UDeF3DWGd6Ek/+Zvraoi7FToEeqVYsVFT4qudi925+/Bbfx7jwkiKHITztiBuWv+rrOI
	8WHLjRt617EDPFjIVQQK0WDuTIP4uPrt4RcCF+TwnFzYztBQvbLECjAO6x2wX92C4+f2FgLGMuH
	lBrdo3I5X3H/lHEpFM77K2XIuym7eZgidHz
X-Received: by 2002:a05:6102:3a08:b0:79e:2b00:b4da with SMTP id ada2fe7eead31-7ac1b205df4mr2772376137.6.1790175381101;
        Wed, 23 Sep 2026 07:56:21 -0700 (PDT)
Received: from mail-vs2-f40.google.com (mail-vs2-f40.google.com. [74.125.227.40])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7abf5674f44sm3688927137.3.2026.09.23.07.56.20
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 07:56:20 -0700 (PDT)
Received: by mail-vs2-f40.google.com with SMTP id 71dfb90a1353d-5c9a1536864so724700e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 07:56:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy/CxYbGIYCcoSMQ+42U3gdPlM6sMopSP3nmLYJceq82IVEiilvM6SSRFmlioEpnFr4JmOZDeFjKrEo7VM=@vger.kernel.org
X-Received: by 2002:a05:6102:5e93:b0:7a1:f7d2:e827 with SMTP id
 ada2fe7eead31-7ac1e25c9a0mr2449263137.32.1790175380384; Wed, 23 Sep 2026
 07:56:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904-rzg2-sr-boards-v8-0-94c4674927e8@solid-run.com> <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
In-Reply-To: <20260904-rzg2-sr-boards-v8-7-94c4674927e8@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 16:56:09 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
X-Gm-Features: AclHuK_46aJgUmbOx6pmISWhWZ74QNKHCsrv6CnnvbaLCpF8u6RT7TH__uXbV0M
Message-ID: <CAMuHMdUYm-hG5RcQpa4GGF=r07Lrgc5t5=Nu9qPhJTyx5kebzA@mail.gmail.com>
Subject: Re: [PATCH v8 07/11] arm64: dts: renesas: rzg2l(c)/rzv2l hb-iiot: add
 dsi panel dt overlay
To: Josua Mayer <josua@solid-run.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Benjamin Bara <benjamin.bara@skidata.com>, 
	Linus Walleij <linusw@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Jon Nettleton <jon@solid-run.com>, Mikhail Anikin <mikhail.anikin@solid-run.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Sept 2026 at 13:57, Josua Mayer <josua@solid-run.com> wrote:
> The SolidRun HummingBoard IIoT features a DSI connector supporting
> touch-screen displays and is usable with RZ/G2L, RZ/G2LC and RZ/V2L
> SoMs.
>
> Provide addon for the Winstar WJ70N3TYJHMNG0 1024x600 dsi panel.
>
> Add the addon in Makefile for all supported SoMs SoC targets.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
