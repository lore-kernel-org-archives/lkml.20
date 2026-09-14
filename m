Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED7644C64D
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789389539; cv=none; b=lViAEyKqNtYoRxwBAY9asEXIqwjhG5GYoZSbvwkEqCi/mDLtsJWvkK4m6FSymR2nMAwyuUpvTHef0M8ycbBr7umtGfr8wdYY1QwC+uisQ0HfFk1YwgrqSNKCHZHiq3E7rd08ms+nUcoas8aKTg0V6aLdNmpy/0rWDAebPFCvP+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789389539; c=relaxed/simple;
	bh=alCv2i4afikLPEBE/ZSB/QPy8e/IVs00EB1s3dQO9nU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JUJ9yNchFNMme+yxay+J+u9UUI1cfIjDJC27kneV/kmgvnIFdTJLKxkmHubJ9HAC1NLoMKaXiaAsZ/4NE/E8rIz4kUIK5rGPlsc501q8Qc4osUsBCYoEDpbSt/QzbW35Ttz2zzFU5PJ4keKRkdtFVMop4truwtU3JU8pcbtMd8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-785643199baso584326137.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:38:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789389536; x=1789994336;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OYAVE9OAvj5W369HdyvqFVzrTYEbVyLELurCOBH65i0=;
        b=dRvpMW6sCoqU0dRBrirouX2tGK6Yy3hA2h3tOiy5nEGLFhSvBCgdSss0qYjL3xqzi9
         WbfYun0WfFbxifFGokxvmSCObTkwSO1kT9EuzwLo6UJKSDTOttfP0UnpntKdn6R10YIQ
         p+r3gvfQaabCDxoRQv5jGrTEAFp2TOl6EPqNIkkFOTJ9zOwpa3HpGpmUAqHvIKhYHLFw
         usGwgYypTYNoO/U/l5cx4KvOMMHgrthI0tGtCBaUx3Z/xv+rFH8DxqhbMlfPXSXaRCy+
         voTJrfUMyyEnZS7DvDx6U1gu719A8xi/Ws4f0l5VyQKQokKbXpIKnEwpBTleVQ6SoExa
         yPQg==
X-Forwarded-Encrypted: i=1; AKwUvBzFcoxIyk56kygtiTP9xnAPkVbDz4ePliCI4BOq7wL7yBPoSKz1kxT7e4cYp8B5dPJ6btWfJa260LDtthA=@vger.kernel.org
X-Gm-Message-State: AFuF++m+1P1oZU0+oBo43pzj2c9ia7a87mD6nK/pf5mzS8pfhqolqt2R
	mglaGn0ZyiHsHZD1Oq3+n99o+jYEibelfL39a2KTVOUniny2gHKq+hXePLCMohRr
X-Gm-Gg: AYBFou1NdPiruOdMnTURZwHB394aCGxbT7M6WSCVy429HXDQuIbfig7b90vZl5+DtO1
	TjR5av1Utx5T0w/BiWMU+w2uDJetyQfhLoVbyEMpX/rJDf52wBg/2ps4HsfefaRXbeKz9QkQzp1
	OrtGE7zYiR2wG5vsc79kKCzjiwNwMcU5ofK2iG6AxPmwvGCUMyowShsCvqUZRbUVqcwk8KXX13z
	TpCqRUBQXFPo41EM3HvyK23Zp5Me2coYUL087enLW/Dldj2YpiPYYPSOOLnpXhRSF/ib6d/sIJA
	niSGB0QGdVdehd1icMERF4bhnDsqivcPWvs5GZlSFaCSgkychxwkIhh0UNN5Bp16Wt6d4v64gt8
	vQHw8mOtiigxG9WNYmcz9MxXdk/T8QApHbiGf51UIoNltx6V7TGFIHphPBZME8NXgZjVK7U5xMF
	OciDpFFf8/7GDoKvcSDOq/L2qmGdURQ4ClmIUHFP2G6aQZD61dNakW+nBb/8ipWD5leUy67DLL4
	orWCnrX5+sw3b1kJ5uNuPgMO0pqzUDlNwcDAg==
X-Received: by 2002:a05:6102:6886:b0:790:fd7:cf36 with SMTP id ada2fe7eead31-79b5b95efa9mr1266821137.11.1789389535919;
        Mon, 14 Sep 2026 05:38:55 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-79278f87c8esm10338775137.1.2026.09.14.05.38.55
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:38:55 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-982db8d3b79so331726241.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:38:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByC7AJD1ldMaXsx0RbqjU5DMTJXMwbld0jKM0ZKV5bXMV5zljn2YbCUZLoFwEOyM9fyrQnTLkdSas71VS0=@vger.kernel.org
X-Received: by 2002:a05:6102:54a9:b0:789:5f54:2367 with SMTP id
 ada2fe7eead31-79b579b0d38mr1196005137.4.1789389535416; Mon, 14 Sep 2026
 05:38:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909175922.161658-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260909175922.161658-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Sep 2026 14:38:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX=gEiN37Su3hhVS+kdTiw2j8WXDtjy=bQy0M8drBa_kQ@mail.gmail.com>
X-Gm-Features: AcwNN1URkRSQsxTlCS1AkYCaZYHp_UGH2AcjGLEgcywIPONdLTrdjIQPHpbJFxk
Message-ID: <CAMuHMdX=gEiN37Su3hhVS+kdTiw2j8WXDtjy=bQy0M8drBa_kQ@mail.gmail.com>
Subject: Re: [RFC][PATCH] arm64: dts: renesas: r8a779f0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 9 Sept 2026 at 19:59, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.
>
> The GIC ITS does have master interface to issue transactions to RAM.
> The interface does support cacheable transactions, however, it does
> not support shareable attribute, because the AXI port signals are tied
> to inactive in this implementation. Therefore, add "dma-noncoherent"
> DT property into the GIC ITS subnode.
>
> The GIC redistributor does not have cacheable/shareable, therefore
> add "dma-noncoherent" DT property into the GIC node.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
