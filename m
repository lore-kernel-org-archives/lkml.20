Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DAD46E01D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159642; cv=none; b=js2uoPdcjTXIctwj6Jre/Hj4slSbF3i5fdsWoJbM4N//KV+3j9Cjr54EIbdlldA7++oA5Zeha+gTTg0KmK9wlwTZoTUxeLPYNz2RaYtmXOFRb+iqhQI5B5NtDmLxtAo9Hq897yG+4/L3+4Jm8meaPS1z4Jz2HZE+1HBLN3PeeH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159642; c=relaxed/simple;
	bh=6QiT+5Eti1IhGEvRyNE2dwG7QghpDhUduh0GYW+kW4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F/oAvYUbTSUCLQKEpw2DXPSsQytgUOno+2wzbHM2911Bj6X5r0hJedicy1i/k2CgEu2bFGdwbpiWow9CS9pLuQyhixJse8Rfy0y4Gy65nXFU7NvoeJHHlhFs3Dgm6DhgpwuWFJXJFXjJYK1q8kqenUblSMdO9D+/5tO/4eZk6RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id 71dfb90a1353d-5c82bb05ddaso622818e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:33:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159628; x=1790764428;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YiOls8D0cbeW0kl5ScyFGGWv5xl1CQ8uKTuoQSqtSKM=;
        b=Wnfaaq3oBuKo7i6Lmvg6FRXjEkiOwAnaGB0fYs1zzPPJ4sVw8AGVf0tFdHtvss1R+a
         OsseVvfVSyUsk/SEwZC7Q+92w8exfPYkLxheHavNU6XADFO8fCVXyfUCyMvz4Mof5WVS
         +cr+MOOA6cRX/2YfoSgGVCXY78+NwcKql5hpPUwSbdIGukRsE6wuTNLwykeMJLUSrbMp
         NoLW3pWYzkko+aW4BRr9YLdVSWfkdrDswPt3OGLnwXnoasSMcbo9Q9ioKHwCzgxxxHSO
         1LLi3x/XSPc0hNV56i4DPKBEQhL9CfrdS4zS4pOfxwI/M1Iy0bW2RfwymT/4EZNY1juo
         KyTw==
X-Forwarded-Encrypted: i=1; AKwUvBz9b12L91342Ya9JtPlboAuaqNoG1CAEOFiM967CuiBnE+QbWPt/U365yaLlUJh2EStIXhkwZvMYk2XtQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++nAJWvFyYWimtbJm5HzM9oiRBBbYk6zwCudvGROg9GoLcgqpdXj
	4Phgeh2GgNKWhNZ5EQAKsJ02gzfRMn8u/jojbIDDoecGvc/JZJmdGGFVj4PR1Twvuv0=
X-Gm-Gg: AYBFou3WG6pqu52Au0QCvOmOhPcQmvovi2BBer3OcpmJUrHc8XnsjfjLS3o0lnbwck9
	u3DpSThOCL3bq6zvzht4a4oCT25ML6OeQDsE+e87HnJS7XIDW0uNc7Bxf77Miqi0F7elsyZomuB
	+d3m1zGA5DpdPThLxzIaF6KXMWhfBKMaZdNJlDytNzca5sM8Pgosj8zcH2q3OGk1dBhPthZpBay
	Yko8cMhw8N2pmDgkvkT0MNcBCWRk/Bg6tWhKHPT2J/7rktdsfibhVzsGJtRRUfRgMz0HwqWDtUY
	JboR9kJjLG9FV21fFqgXT2fgwGMplLIuXnDvowUCgUHZX7659T4wa62U/YSQzQ33B7XaEfLkJLd
	v0s0KoSno/XmhB1f9na1XKztvfnlANwFdUyngFlucTf5T5SK3K1sCgJzrG8O9zuqAxKza53otQ8
	mOpDoQ83W9obFuJqdRMgrdKIYp8J/+dlN02NXTz4IVnwODeelIq3DddtFKF5QNFlrNC9TreBX6I
	J47bV4b/a0kUwxQwTIUz0SCJGAtA+OSaCx6rwqAPKp2MG34+HY72i7Tyw==
X-Received: by 2002:a05:6122:3d49:b0:5c9:c60e:5cf9 with SMTP id 71dfb90a1353d-5c9f16cbf05mr2583857e0c.23.1790159628496;
        Wed, 23 Sep 2026 03:33:48 -0700 (PDT)
Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com. [74.125.227.41])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f053a418sm2506598e0c.13.2026.09.23.03.33.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:33:47 -0700 (PDT)
Received: by mail-vs2-f41.google.com with SMTP id ada2fe7eead31-7856441f7d8so432885137.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:33:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxQ+lGG9HhpB3kaGdexx6qdCvd9kUM+eHAsIZxO8liu4z2lp9g/IGfgifDyDvBG6WA/82nmg+mXX6pHlCY=@vger.kernel.org
X-Received: by 2002:a05:6102:3712:b0:7a1:f7e2:aae1 with SMTP id
 ada2fe7eead31-7ac1d0ca801mr2003132137.19.1790159627332; Wed, 23 Sep 2026
 03:33:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921134432.50338-1-ayman.chaudhry.kc@renesas.com> <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com>
In-Reply-To: <20260921134432.50338-4-ayman.chaudhry.kc@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:33:36 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
X-Gm-Features: AclHuK_hGN_yWlJ6BENm_qv3b3xlhGSBd5j_07ozn_vS55vMXA_7UHHfcE0Hj3o
Message-ID: <CAMuHMdVkh_qpJKqD7N=njG+35gS+rE7cFfWQ-kS3aRoTByxH_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] pmdomain: renesas: rcar-sys: Add r8a774a3 support
To: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org, 
	Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 15:45, Ayman Chaudhry
<ayman.chaudhry.kc@renesas.com> wrote:
> Add support for Renesas RZ/G2M v3.0 (a.k.a. R8A774A3) SoC power areas
> to the R-Car SYSC driver. The RZ/G2M v3.0 SYSC is similar to the RZ/G2M
> v1.3 SYSC, however it lacks the A2VC0 power area.
>
> Signed-off-by: Ayman Chaudhry <ayman.chaudhry.kc@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v1->v2:
> - Added space before closing brace for `ca57-cpu1` area
> - Updated include path to SYSC dt-bindings
> - Added Reviewed-by tag

As this has a hard dependency on "[PATCH v2 2/9] dt-bindings: power:
Add r8a774a3 SYSC power domain definitions", I will provide a shared
branch with the dependency to Ulf.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
