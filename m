Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FB848662F
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159520; cv=none; b=dBQPXJMLHVkPduNxxQmH34Yxe7Ia5OkuyDO8qe+TUnVc1o3b+RZ3fgMQzsHsYMOhcmOWyd6bKDEuTCPvLAuS2iFTgx8kFjcN6RJXAourtJmSpYMpAVFVgl56ngDQysIJkfrL2dtwWJX8tTiv+7sdkAbIOEUuqAH+SF65K+QRYDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159520; c=relaxed/simple;
	bh=qHmJ0LuimTPz5IfDSza+MI0wTd/JNm6z/p09kQHUHlo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rau6PZvKuPx6V9s3xcdsn4sP8ishuSVH62s4BnTq9BIurPb1R0fbdtzjDqoHML5geFWEnQBpnbf5D1OkwkI5DU8Sz9xq2B/rXzetjSxazIUOYQaSW+/3mfRFsTs20Ghnx6Mqu27LsweXacXMDXAsuLpHafpEj3vxLGAzDgWrB9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e529da9so309172e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:31:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159507; x=1790764307;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=otCNGSUWSvhuDPnjx1VVioLIbir8+cGg0W90YM641IM=;
        b=WDWH6rPta0PW960xWu6zP0dzmA4JQpc+ZXleWIR75jZyOsM2jDwvUBKpgq2vvhZjST
         /adrgwsd5A589n5ks6FYf6JuVmLadcFJFLBhTyHmPE50P4OjcN0S46hx2dVsWkhSks9D
         ZKK8MVRS9YLWbPqrUChJEWA/y1qgJzueGm+B9zxc3BNSM76FI62itjHwwcfxu3FbJT45
         LFZRNQFCnR9/sQ09K7a9p3C6IF3xhCyjBt1ZXUnua9FZHX43frHULshT5AUmTkh9WNcX
         AP9JdNHebXYtH9TbqwAIL9Ath8sDzvYL3Cpu+Bhy1r5ORStzd64wScHYmIagOu9Zqssi
         /pJA==
X-Forwarded-Encrypted: i=1; AKwUvByA72+5+m7Jyz9mQHvb4sd9sBuiukJSjIkvWb+UI4gZnYxACQkd2REGVB2McPLLLA5ozxU9F0M3ZHvQakA=@vger.kernel.org
X-Gm-Message-State: AFuF++lyYUL+cdUIJGanA84+Z6KMI+YbXIDBX72FdbODYDkUHMTmavwA
	R8t2ICluG9LeWoQ2E9/Qe6F8pem8ONrobvmo9VnHCEPMA2KKHLYLtMPHlabC/8kYw+k=
X-Gm-Gg: AYBFou2N9q6BVruiLI+LMPRaBmiJeUpkJo5uNLQobQwRYu7i2lD0TgmrmUWGwniJcwA
	4KI0k0OkE+FULJHhutK00pmFTdPHDlEYZSRFXYcfUrsUwoYESamNPb/R9Gr4COskNK7SurnxaTT
	pjUCWaKV0LALNIhRBSfMO2pFBcJZFxLLuyvjtmI0gxcPJJjpR/eMbXUHrfWSLHM6wOBbdngjBC3
	DCzqZrKGHaQ3GAIhPw6K3vjC9RrtPXE9BQFdJ4kT4R07Vn8oL4iCfIo0uFVNng1DWSsAYy0iQ35
	WpLkd7s8Z3r7PDu0rv9mgMZ5u6YJctWT2L1mrNuUd0T4xRFFP00cOYU4BIhqEerNdBdz3Nq1l2f
	4ir2PDJtNRspkWIaX7+3BScPMlcyLL/b2bxdf8TxQEXs9zyL7e8RnA74qneQ/+F1HpRVYbaX+W6
	zAEWbSpWtcq8e37iTMgCEXMBBeVE7vyq7p/uH1XUvN3Xlwp1ikjkRNhcQqbcrn4MiekNUyp+2T+
	1EG4WxkcihUJGEG4v+yd1s7qS0Bc/Pf/E50AQ==
X-Received: by 2002:a05:6122:6602:b0:5c9:67f9:652b with SMTP id 71dfb90a1353d-5c9f1580423mr2787340e0c.5.1790159507473;
        Wed, 23 Sep 2026 03:31:47 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c161fsm2487566e0c.4.2026.09.23.03.31.46
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:31:46 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e80579b7dso253371241.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:31:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwgtXyPjU5LVacwRkTfmY+lQhxIVw4xT8ZCnPsva//V8DtyudGvtXtE6/bvo2w8PqmT3+38enp2jVaU2kU=@vger.kernel.org
X-Received: by 2002:a05:6102:370b:b0:7a1:f971:78f3 with SMTP id
 ada2fe7eead31-7ac1de3bd78mr2006784137.31.1790159506008; Wed, 23 Sep 2026
 03:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-3-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-3-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:31:34 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV6w13GNnQFiCWGkmW-=mwxnkuKJvp7=AF_xpb462C=xA@mail.gmail.com>
X-Gm-Features: AclHuK8KfViTXJxG4ecvsKtRjnbyEzEnCYUI_WTdfSW3Wds9FPM263MV1B6y2_Y
Message-ID: <CAMuHMdV6w13GNnQFiCWGkmW-=mwxnkuKJvp7=AF_xpb462C=xA@mail.gmail.com>
Subject: Re: [PATCH v2 2/9] dt-bindings: power: Add r8a774a3 SYSC power domain definitions
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

CC Ulf

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add power domain indices for the Renesas RZ/G2M v3.0 (a.k.a. R8A774A3)
> SoC.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Updated commit message
> - Renamed file to include vendor prefix
> - Added vendor prefix to include macros
> - Added Reviewed-by tag

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in a branch shared by driver and DT source code.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
