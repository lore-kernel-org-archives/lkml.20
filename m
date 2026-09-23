Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B2C51FCB9
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 12:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790167258; cv=none; b=TGJXufpPlxkUd89Ug+Pl42w7eIUJFkDF2ETEmA1AMQv2ZDLxpRgpVpU3/Woo+MgO2gWnM3ZXIbFkDKORNbYwDM+8Qhj0muogadROh4cjo14kDWv+hyAWvoYujKXMMjDELYvcV+Hiq24b1DAsigaWj2sdiP9ONiIsiWBrUexr+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790167258; c=relaxed/simple;
	bh=EfNXHDSpd8SaNyXGdUaOjzW2OpbKeUB9UNXfiskVQ6Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDjAxc6HTCZNKDut4w+d+zYGdHnydtyCisYW47WGpiHWQQtGXKI4qoglUArJxdZEbE02srOb7kS9kmvIzlQtKl+wCoHgPL4cU/30uhqeWJ2RvsBfQDz+SOCU+qtOOZAWeF4hSU0Xz8EoBlTTt9mIvSSAj3EIZfMcJWQ8I4fOHhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e4fffc0so391228e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:40:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790167256; x=1790772056;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5hc1TTWP/ig0ekllF54ZiQ7BuKR9C4G2lvuDy9dKjh8=;
        b=oAzZMJSc00EPflwPQH2eDw/NMbAQcD4Cu27fRR0a+Jfwz1Zh+xEf1T4KpeWgCkH8xp
         L5yA32AwUvQmxca9h0yIujm8+KXPJuuOTV1Av71aCAPRCg5IwtYnj44bxjel5uhmiQle
         /mq3azjiWef17887wWPHErdjQ5bKWJe6jSdXDzA82NE755r7tpbNq1byW0ziWdlOWLbw
         kR/yM6JxYg1pBAnajfStp4pi5VctJFE5E7u8pkKHN0jIg3aTBUPfl1rjxyMcdeqR1glZ
         atuoOTenUtC9ZD/w5gxG8KZoQPOpg8fj/zwCsj5/5tDKEACr3r7XioIjGf7DvPQmcyj+
         KtZA==
X-Forwarded-Encrypted: i=1; AKwUvBzoLIBAL0Up7VF06RGp1V84n//voJ6U/d2ET4uNLPvsWNghKcnuddH896/Wu8PkJQpZILmxZTzxkEB7vSc=@vger.kernel.org
X-Gm-Message-State: AFuF++lINzb+UwD4Km5AxN0ON6Q68aOXZoX+wHvDvedG8fr+K/PdUYoN
	KlVraoYFrVmcziSfe37SgmM47JFCD9ZCAWK17teWvPJeWMRViT4hl0QdGbtBn20Myn0=
X-Gm-Gg: AYBFou2NkOsTVBfbgbeLqX0THJV+ip7yfP/lg9Bq826dlGmo8oMZU80TaNP57iebRcF
	6vpxqk8aJmbOEJ8ESBr/cO/Pi0dH7cpCIQht06KVmk9Hy6sEnssQOpIkLHLqqEa39xcg8JV6Pco
	GdFPfltpTvXyTYB/yyUDHaSfMrvuFR/m9cYZDlqZf8EmN1pRZX3n2PeRjk9Nc8Tv+24S5VqOoop
	Jc3C818DZA4NzE/fojSkxRhIupJnC13f2XqCNFB/mBHGZ43nSz30tsTstjKHZtq8g034SyCh3i4
	TFSeLz1kbSca5dTNmXBksil0va7ZetW8ozbk8fN6Z6XGLtUoSRpD+R+RY7VABnUBObFKXz0tgqx
	tFIIF/9tWHsmqQyp0OG2dfLJqzgPenKThfjlznIFwFT9XeGWouX0riho2biyjxfdFJl/7iYJvZW
	mRNQ6toouvwsv0EilGF89vW8Kwb5EvLFjdJ48PLDZcDXVb8gz6Bu1ncqPVraHJKWFutRC6luXv6
	9VrA4Oz3ogcA40y3f8WskDkf+HwRVQnpG63
X-Received: by 2002:a05:6122:1b0f:b0:5c8:3697:9289 with SMTP id 71dfb90a1353d-5c9f15c954cmr2569914e0c.8.1790167256222;
        Wed, 23 Sep 2026 05:40:56 -0700 (PDT)
Received: from mail-vs2-f13.google.com (mail-vs2-f13.google.com. [74.125.227.13])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f03c7966sm3091845e0c.2.2026.09.23.05.40.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 05:40:55 -0700 (PDT)
Received: by mail-vs2-f13.google.com with SMTP id ada2fe7eead31-795a0ab5227so332782137.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 05:40:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz487bD8UgkKoCkd1z/H6lB/U9o+cimlotAuF+ZmejW/dxl7LEznyW2dBF4MVGQtSWHFb5cgzuAeFqGVUg=@vger.kernel.org
X-Received: by 2002:a05:6102:4b0a:b0:7a5:e455:1823 with SMTP id
 ada2fe7eead31-7ac1d4f39fdmr2199964137.27.1790167254685; Wed, 23 Sep 2026
 05:40:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-10-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-10-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 14:40:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUkhnGxssjiV5+v9VizEMK6BEyYm9Eor2_b=H9VpPKLrw@mail.gmail.com>
X-Gm-Features: AclHuK85Jpqk5GFMNdOgnv-jyW7mXfscimJBoxQw6oeOM-P6bOVrQRWi9Fs-eqY
Message-ID: <CAMuHMdUkhnGxssjiV5+v9VizEMK6BEyYm9Eor2_b=H9VpPKLrw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] arm64: dts: renesas: Add HiHope RZ/G2M v3.0 SoC
 sub board support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> The HiHope RZ/G2M sub board sits below the HiHope RZ/G2M v3.0
> (a.k.a. R8A774A3) SoC main board.
>
> The RZ/G2M v3.0 SoC sub board is similar to the RZ/G2M v1.3 SoC sub
> board, so there are already DTSI files available in the kernel. These
> DTSI files will be included once additional support (e.g. CAN, PCIe
> and ethernet) is added for the RZ/G2M v3.0 SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> ---
> v1->v2:
> - Corrected indentation
> - Updated licensing to "GPL-2.0-only OR BSD-2-Clause"

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
