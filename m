Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3687E47D936
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 11:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349574; cv=none; b=RrERXE86LPNNDd3AvrrsLdW4Tek1i6jiKI+NAkiJ/oXMtnEu78gRUgJNjg1Niu8O0ERxqgOfZ5M5zYtM6LGgaewh9nTzWChjlmG/xP/KCvtZVzofluGnWeLXol1p6jeBtxAVRsnM9d9cD6fV87v1YeKVFUlIUD2MuwbYxX0/c/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349574; c=relaxed/simple;
	bh=GrBIm0BKS+Mu7/OLWlqezUi4tFJ6U0Srqj6VjLPOZaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iu0KTePkk79NEEtsKgWbxWg/ZuJj5+liXu7OuC+9TC2X+ke8Hp66+UAmXgiTQk7JUHMDD2Tt2HuTSiraDiZ65KnvkMa7XnXHuFkI2Qkwchdfk7XCsoExIrnnbiV6j3Ybqo0lf06B9OwaFd2Poci43d9jLs1HBNq4SdH5abXajIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so1149842a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788349566; x=1788954366;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XEAVGW99jRYpfKK+i5q1QjOfB2bMJtHxW0mUFyR7MIM=;
        b=Qeq3bczF8UkfRDmkIfCwoZ1ZO53ikyoudWvd16EbqM7sHi9gfkKdHLcn7Y4/Jenid/
         XDRx/Y6L2sAuy3L3aMpw0v+HWDKFUq7tDdU9dvFPq3WfjioDZGNm54km4AB/owMCCyFY
         oq3YZS1GHONag2wm3usZUtx6Zm3QgAYT8PQH/got8WYMH/q8zwNPYBdTpzsjpfc8f23C
         17dTimnl2lLKG+5bMXIVou57bZ1UefFL1dofKJ9255a7Qb6MFnbTuGoVIagVaVwa3KQs
         IOQilA67yWd1qRfPfNnJm0YULUbNH6eJLgyjoDfJYAHB+hc6FMxYEHLc/DyjdFBgQnhc
         1bIA==
X-Forwarded-Encrypted: i=1; AKwUvBxlqOxzvgF1oFSciSJH7WdvoVZM6C/LdRas+DiyxQrk394jmwp1M1C2ePd7OLjttfWbQ5BZVNFIz4qf/+k=@vger.kernel.org
X-Gm-Message-State: AFuF++kIVjIDsoaD8UTpuc16oTKLaaPIiT5yIP5yjJVFc84SWrb/Qu8p
	MeRgN9EUSOPtK+Kd+YG2G5wzZUDnbSR1Trl/qZHryGoiokb/XHZkqPxHlsvwlih0
X-Gm-Gg: AYBFou2IcVc+Mmu+okC35meNJ0JW5gVpLK0MWOMT+WSAiMXt5zXNwAiwT895K41apwm
	i4PoKkZ5isCy8tcT+qAPEIJ1Zct1oBiU3tWiaAvkJC7OQUsg6lE3DdwSEHC4TgE5tDi/95xYd5x
	5pdsy+eTMjibDz3aY/LdZX7rfknnJiks5dDowk0vDkyKddumr6belCR7cMnjJejvP+x61c2ZmCf
	U/leVTZT/wGDQKYnyZic4ES8yvmE/I0zO+7nC2jDt2Zcylah9VbSCaH28L+hMJpRYGZgyD6dcBK
	k3KcnrXun10jwfqzS9YNvgt8ofGSWikUXRZJINWgSs9+LX6RrACw6TxmqT6EdUGy1/bRhGW98Uq
	fddzIW7QcUDSMuyKrKE+GbZT/DYt0vm63EfMpwvrsacFyxWLjKnUfKjOLY0/KnhVuK2K1pgZFYW
	Iw0ugEi3yIX141yIBDiT48Ovi24Dk0IAdfxQJnBIitmtWs4SpUnvdywkyqNpBb5jF1OhfRQ+TWF
	1z5x81vdbt4LWTtU7JxnKXPr5bbaQ==
X-Received: by 2002:a17:90b:3d81:b0:398:c150:e7b3 with SMTP id 98e67ed59e1d1-39aedf5d923mr6530964a91.4.1788349566257;
        Wed, 02 Sep 2026 04:46:06 -0700 (PDT)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com. [209.85.214.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae8ccdecdsm1087728a91.2.2026.09.02.04.46.05
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 04:46:06 -0700 (PDT)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d7195706f1so9952195ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 04:46:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxJ1vWLNVjYNIy1Koq5ZIuHuO1YoPXX7gK77kSI7uvlfxKVwvbNcUAAG+wBY+75gNptPZylJsOdV2SyjYg=@vger.kernel.org
X-Received: by 2002:a05:6102:faa:b0:785:bfc7:26f5 with SMTP id
 ada2fe7eead31-78a1f33dfd3mr1197143137.12.1788349174855; Wed, 02 Sep 2026
 04:39:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Sep 2026 13:39:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
X-Gm-Features: AcwNN1XYp2AmohzI9M0wS5P-4B-ztdbPdhzMYLGxaK77VTrG86b4xj0U-T2WG1g
Message-ID: <CAMuHMdUCRF_r3TXCRYZs_-AAn9WL36HUF4_VjGs4Y8Y4T2uRTA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
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
> Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
