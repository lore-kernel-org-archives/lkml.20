Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BF7223EA83
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598682; cv=none; b=RYwNU2ikpE4nE/aA14MYg2AzYQwR0ShzY4p8sUqL2sArI8qhhfPzHTuYISD6PbvUFQS2tISJS1yNbxttv06pXoblZY1XHPK88RXKyqoWcZFhxV34O/X/l0jN9BrJNZMEokZFiHsLhTMY6Zk/Cy80UCo7Jpju+S+QeEIw7olXEg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598682; c=relaxed/simple;
	bh=dAzrEI9839gxqP34NL2S4L2PwWrSAB87LlgLNLgpMmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GGrkDiKHHpamADNhlvg1Skqaepc2JxLYCy1iA5Z/gqRwzASYii/4FPb5qVoadGQUkCUCrreYrv0r5aUCwWQhZEBkRDr7umgFDedf7BuUZLFThY3NIbgvQpRn4+pOLZKb1v3dr5Im5GV5g+IBUrWJLOuYrdkWOPCUJUTI4nkDbg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b42f1cbcf3so957640137.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790598680; x=1791203480;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vX8fnci6iFn6CHmX7sG+fk0Twbr8n5Wsj89p/Y2EOqw=;
        b=CEy7CoBxeki3tX/XD03VuUMZ1UG409ppqzyZOjQ5iDYV5WiMHK97otHFcyJmSUqnc2
         e/tCRKj70iW1Sz0m6eR4Pi3JKG3rlFsIM7Xj7bgo8B2GaPjGvc9BTsxHd0M/etQxLK3a
         H0EDC++uki2C25/2FRG3laGk58gfW85ty1QsY7Qa2mgbmQcekMi5gMXEUspD+zvYcuT4
         NdYrHkaoc6CYBwjAY8FoHJuWNFDtkgNaGjtr/TfELw4bCDrAF3JoMhOMNFWPh6ip1tJW
         KMyV4gosIqK1WkXB8TQBOlvK0luMAzEnJjkwpOzzEe+gtLtiiMIHkdsRmrFiRDyF+lzA
         kJXQ==
X-Forwarded-Encrypted: i=1; AKwUvBxCIf7zOPcU9nhZ/A56vV6tUGLfZNJ0G/z2mBD/e27Lo7eNjgK8OZxf8fAQkekP4Ihksn8njXUHAfxDOrI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL+RxHWT9L2fCJZF81xWnGu75eIYED233c6OkeEiEpqTy+FP/Dl
	bEKBJ/DtiR8AVzNbrEY4wE0uS5p2jmraEcYKj6vfzReoT6oNhzVHqJg1ChMQNsde
X-Gm-Gg: AYBFou1e0xneGrNggD4gAoHSr3leDX8nnZu2rDMfsFFcNF7yNn/i3Jd12LXRCxV4sxA
	W4YEYtSltZXN5vw+V0ZA6wryk52KkO4giOR3zztSSBxaZeMPFq6L+UExYrfEA8jUfjesOusGXjF
	zdjLIklwPgWWSaYoucbMyhF+b3Hg7DHgEd/JFbkpEKLpCugeFZLU6PA2IE3hlru4+4urjMRk2C4
	/p3rW0A3S6JP1TCFcq/fqg9jyC7vPEm98YCddO7/sYULCaEsVjzoFn2Ju1o5hY1RC1CyJPAP0Nd
	VHfI6QrZ7yWuDQC0cTXbTWEiTpdstsBg+0v4lyWgbwRueX3sJvZ+fKxK5jZTYAqdNStyyw+kreG
	fZ62tuAfJvmfwvvXqDN9jGFajLvrfILnRiCu6uRI1DphqWQl2rkVvE5CIAZi/t4UJNOaXKRl+Sb
	PMK0oQGBPWgBwbA4g0A8rnWbc5M2+C3XrAchwPFE/uNq2cotIdxyrdm+52DDuRvDra0mJJdUiFb
	k3RexdSPXgtF4j4jSVsSnl5CkLFAZZBvq3xV+xvVDM4V+Y=
X-Received: by 2002:a05:6102:3e96:b0:7aa:a6e5:fc76 with SMTP id ada2fe7eead31-7af1cb9e186mr4858762137.9.1790598680271;
        Mon, 28 Sep 2026 05:31:20 -0700 (PDT)
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com. [74.125.227.37])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9889b08af8asm6557324241.3.2026.09.28.05.31.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 05:31:19 -0700 (PDT)
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b47bba7c88so742326137.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:31:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByAk6emMsEzBBXaXO9htQa741xvzTMYtgt71M0hRBtWYbTrPsrNP4A6p7jeMKEkPwXw6SqUhYc2o3HPvfg=@vger.kernel.org
X-Received: by 2002:a05:6102:4422:b0:79e:373e:8216 with SMTP id
 ada2fe7eead31-7af1973fc40mr5087011137.0.1790598678847; Mon, 28 Sep 2026
 05:31:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925224927.14951-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260925224927.14951-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 14:31:06 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTm-1cU2d3qp+S6BQ4u4n8uOTWgjiKUh0iu25j-wgcHA@mail.gmail.com>
X-Gm-Features: AclHuK8Y7bvMXweSx6eMM6II_gls33bh9_LjqJ-ADdLud7pCMby5J_qA5oVEsFg
Message-ID: <CAMuHMdVTm-1cU2d3qp+S6BQ4u4n8uOTWgjiKUh0iu25j-wgcHA@mail.gmail.com>
Subject: Re: [PATCH] soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 26 Sept 2026 at 00:50, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Explicitly select the RZ/V2H ICU driver for RZ/G3E and RZ/V2N, as GPIO and
> IRQ interrupts are routed through the ICU block on these SoCs.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
