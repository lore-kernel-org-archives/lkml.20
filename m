Received: from mail-vs2-f26.google.com (mail-vs2-f26.google.com [74.125.227.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B9F48380E
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789404832; cv=none; b=XNlJBAmQSxe7KH95Mow1I5cWp1zt7g+Uji2szvk80z6UMyMTKHkldf9htXQR4vc1p6n8L3Ubqph3L7UkqfvIhgdA2jSwZc1I7lybdUYBv9dGApW8Lc8RaF18fmYRlKJu87HuiaJX3N8RUx+OoZ9rZqdI1KMocj+BsTBTKD5Uq6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789404832; c=relaxed/simple;
	bh=Mh6gEpsA9iJQYd2BVSlqJWoSIMsA9HSAvPlTaQn8dqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rNxfNCMI7ImxbnZ875Pbw67xj4x+BD3hHsTkKIBXKqQuU/Xvvc6ON/gPY4oc7Y7WtoPRXnD9ExhlFbIdKOqXc/qMiMCf0Lc3Q/Zv/G7cuhQffF9L9VG9KrjvFJ5lzoWNH/0yGS1wtDy701CZOAB/HSTBIJv3LCb0BlaALowg/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f26.google.com with SMTP id 71dfb90a1353d-5c67e529da9so759266e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789404829; x=1790009629;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BQG/EJqnowJv9xXbgTYVxf8rMoXWD6yF3WQVjoo8UXA=;
        b=H0NGGlDLx2avTOATqI1k0lQhq1Ag90SouAWM3TTcDDHHCZjSGR7Byd3zil66qoXKTg
         OVktN+Zt8H0HF6E7urpIHr8RStKEpyxeBsoZ4FhSq/uM8vtzy6QaS1+cS4O8lA2gk3Wl
         oUWn5cSaJVo1T6dbElAMYbNDPfqGrA2Z2YFBBHl+1IcKsQixwrNQ1+3ZMVYFp79qWJpN
         tyqrbPE6ClJgmARWdlFvfbggun4dTlqjcB4hE9yW2yinX1eTKiyyjU3poIswJDGP+rIC
         7ErIbmNVM5ounAsZWOBg2w2TLFl8/p2HjW68XWhtHignS+Nbzc/VV1OgTRgAH4Mi9XWO
         iyUQ==
X-Forwarded-Encrypted: i=1; AKwUvBxH3+a5tN0Co7bOGAMdPIz7PuXmSpKy0s6rPQCTebFBjt+Ja/v75vUPm/JWfUV/w8jgA8QLmIpqZdAkELA=@vger.kernel.org
X-Gm-Message-State: AFuF++nJLgqlAY0Yb7uailTIywiYWGibWkHDiiSQPvTLUmqAgy513UP+
	quJyl+dRCQVuew3lQd7JLa+NWBTYDv2obRm7yeDd8KkoILobCkEYYaWnXx8kE3E+
X-Gm-Gg: AYBFou0iJ/sFGCQAHUlOLS9lsOsQIfMPjAp9nku5PmYlZvoNYXogX6d7nhwuUPBHcrv
	yM0eE9qE3cyp2x23tx7ifqMSpm0bPBKUOPJ94Qm+P9Qp0M9zn3W3mCxSQ1a4gCm8yVD5UXSVGAQ
	2JdTZiZXZNxBiJ9llLmzOZa2euTuxDCB6b1wMZnc2+qEAKKY56Uw7vy0iu8lGxiImlin6o9qbSd
	iS8cbpNC8oMbzA3V/GUDOSmc+GQdvEdH207DffW+A7yGXyEC6nEONY9ZnVfnwnCyNZPRdY1LQrE
	bkUV+8EHy1hGbULk1wmhBtCu0HfXKeeiP+2I8ta1bdcRmknsljlpijwaCA34VL+DctukgzwCyBK
	HttizAetZ2BQe0GuI+YpHUVGVXjIe/StSagiGwP2UZLEfAJ+ZHMVf8GPRwkQf2BUMln4czcgdnm
	tszHNBSQL8iHGgT43KWW/fN/asgISsTuxtMF93rChV4hy4clSAwppPn06sLJFFc08kDD9wqp2k4
	fqM2X86KSIcPUsFiaJkdx0CMj+jAVDDrOzBMhTZduqoQprp
X-Received: by 2002:a05:6122:e213:b0:5c9:67f9:652b with SMTP id 71dfb90a1353d-5c981d87f0bmr1995324e0c.5.1789404829201;
        Mon, 14 Sep 2026 09:53:49 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c847154825sm12099811e0c.17.2026.09.14.09.53.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 09:53:48 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e9af41731so450922241.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 09:53:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4p3uifls//yqM5UJM8o7AQVQ2TgBfb36Icg5bfue+VNzBhpftuVmzcnTyw5BZ0cn5URw9/wt6Q/KRpTw=@vger.kernel.org
X-Received: by 2002:a05:6102:160b:b0:799:e1cb:d690 with SMTP id
 ada2fe7eead31-79b56df9c48mr1219613137.1.1789404828557; Mon, 14 Sep 2026
 09:53:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260913195654.3371385-1-cosmin-gabriel.tanislav.xa@renesas.com> <20260913195654.3371385-6-cosmin-gabriel.tanislav.xa@renesas.com>
In-Reply-To: <20260913195654.3371385-6-cosmin-gabriel.tanislav.xa@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 18:53:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW8bsr7-nrQeNdrhT3Ohmbf+ODv-JOGEREMqRd378YYNw@mail.gmail.com>
X-Gm-Features: AcwNN1VcbIN-WIOpxXaGvhcx7QEKLAAdG5tqWb6e4fPVkeaziyHmblEewpvcoBk
Message-ID: <CAMuHMdW8bsr7-nrQeNdrhT3Ohmbf+ODv-JOGEREMqRd378YYNw@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] pinctrl: renesas: rzt2h: add a helper for reading PFC
To: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 13 Sept 2026 at 21:58, Cosmin Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> Introduce a rzt2h_pin_read_pfc() helper and replace the open-coded
> implementation inside rzt2h_gpio_get_direction() to simplify the code.
>
> While at it, use field_get() with PFC_PIN_MASK to avoid the manual shift
> and mask.
>
> Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-pinctrl for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
