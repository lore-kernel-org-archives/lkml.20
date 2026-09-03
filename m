Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C6B367B84
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788440017; cv=none; b=cL0pZdzaJjI/Wjnszom2gxN1OouBSjhzIhCLkxXgRKk5D4c/u9I7uP4WWtSxtt49j1qO5GZCN3wxO3aW8Bmh7KcRM97mwIhcJHjnSaGJpZvRAuALKPyJAjxyIuS1obD127qNcK7gsonueq/xroyqShwXuqhK6nCT8PC5BeR0m1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788440017; c=relaxed/simple;
	bh=dHxgVoXugnnTmSqU/QbhM/ywN/YiWktpg4R2HHANpxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4jz/DcTZ9FjIS4lWo+d68drhKTl0SrJmI0584AD82WI5k35MrsfmjqTFIJG+TQ/K4V8gd1qSF/1RxEXs6rgSwjA0QcD8HCqqKJKW0ghZCj90NKREq+oTzWK3bSSZh1JaDnRQUsRa9DXM4FMqidfIkPiXRsXLYVtC1RWD9sHn/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-966e7380109so1459268241.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788440015; x=1789044815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rOaM/A6xTTi3n14xGii1RnS5RLxKPImxgE8KsoH56tk=;
        b=iPhTPSo10FSKOtd8CuVQjCN/mkBRUcA0zlXkT5JPOsbiGORLeg38KJJB7h7ZrS37zH
         PQMinlCCGQqpnHi/QVzUqSeGWUXP3oYZUy26MyPT15deYi2jfv4+j6oui5wD3W+q2WNe
         JMPPnnlQZPCgndYdnS7yW8ZOKmAG0406wOtEX+pEFnUA7kXAg5fVFpsSUnaKS07+u4YL
         Z5/pW+e3PBx7MSeh5raWLcnDk7eJvQyTVhwoxoKPdLKdBV6GCTXfqhrr/psCinD3rPet
         4rDakwG6hRFN22ocKkAdF0TdGD01GqdOcxUMrhoQA3cyF0/zZaHzxJwQNxVxcAeSAV9L
         fByA==
X-Forwarded-Encrypted: i=1; AKwUvByQKWma5jNM5ZlCqPofocb4IGtCcwbiI5/rBbUQxBollAddkFzdn6H3avGhjrMF6EWqLtnFOUWZBfDPg0w=@vger.kernel.org
X-Gm-Message-State: AFuF++n9YVBPecTmUXup0XD/UgM08LIrVlfvsKS2gbRGUVGk/2buzr2B
	1TVF8rCSEB9nCT7lA3nrCaCWFmzhazp3UsJdcURpnh+1bm/N4hxBEZD05Cu0OeiEocM=
X-Gm-Gg: AYBFou1YIMHJKC5RxaUw1Sa/CfSC+UtQyOZkE0sB3zOy78Htr1fWHw3GQkC1wqOKrBa
	msqI1+zLo6HViYciiYj2DM714gwlcJ8Zicdma/y7CkZAeRPDBixnlG/2KZjABsNv2JyK6hypLS1
	0HTmHO12KPGYjZHa3CiJN7hREkiRrc1iRtU9yOhvnxKrxn0N5oVrCM0dVA0Oi4P5dCLDCcYFHCU
	8DlH/2V7SWzPtqNto/wBpR4ITDmdEZ8NdO28xtZuCRBtJfQS7xy43AgXqKqE685/+LWF2ZDs93G
	vaIakCE7mmk/pM7KbSANvyhK+APywZtMwZtonnmCeoefAoeB7dDhXI7rtiIXPZkafqLSFdFb33W
	MiUjkwJKl7rCT3XWIBKtT+BpUy/ECYa5wRd+9SU+Lx1UPChGrAf87l8Ol5Lev3WNa63k8dX3LLn
	5iSHOUCB7kaxWlXukW0wezCxaEAtRXBC11e7lVNs1g7ceZev944fpl8ipy5eK0adzrmfARq3brE
	lLDcw7vM5EhE4+mTAWGlgx3Qw==
X-Received: by 2002:a05:6102:32cd:b0:785:eb33:87aa with SMTP id ada2fe7eead31-78a1f31103dmr4462550137.5.1788440014826;
        Thu, 03 Sep 2026 05:53:34 -0700 (PDT)
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com. [209.85.217.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9807764dec9sm2298219241.12.2026.09.03.05.53.32
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:53:33 -0700 (PDT)
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-784a1696a21so1856909137.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:53:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxGDSxnCNWSgwnbmlJGNEIdXFAZbGFNisMSMIVofbZMuFriAO8iwHTXx8Me3jRsvQOo6HOoBDO/xa2VkM=@vger.kernel.org
X-Received: by 2002:a05:6102:2c03:b0:785:8f76:654d with SMTP id
 ada2fe7eead31-78a1f4c036amr4772497137.13.1788440012478; Thu, 03 Sep 2026
 05:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-4-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 14:53:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpMW4GJzgf6MSw+rwNjw6d9sHnR9J9NxoKh-2cXJwNLA@mail.gmail.com>
X-Gm-Features: AcwNN1WEDUqTnWdhnLOvtpe3Al5LdzBVrMsYUowriY_1M3N1Njo7kHKct1Dq1Gw
Message-ID: <CAMuHMdXpMW4GJzgf6MSw+rwNjw6d9sHnR9J9NxoKh-2cXJwNLA@mail.gmail.com>
Subject: Re: [PATCH 3/4] PCI: rzg3s-host: Add support for RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Add SoC-specific data for the RZ/G3L (R9A08G046) PCIe controller and
> register its "renesas,r9a08g046-pcie" compatible string. RZ/G3L reuses
> the RZ/G3E config init/deinit callbacks and power resets, with its own
> L1-allow syscon offset and mask.
>
> Also increase the timeout in rzg3s_pcie_set_max_link_speed() to fix
> the "Failed to set max link speed" message seen on RZ/G3L.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
