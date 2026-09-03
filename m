Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BE1403151
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788439325; cv=none; b=uyqkwi+UXPoGPeSH/gLHzCGttkhKkFinUp4rq+Y0SZMo+cK0GKad3bI0WnMF+xXGHfJ2UJeh6Sij31jwDL/ddX4H9VDBBuClRQ19NyIb0SSNWSEcszRmEax4RK1ZOZdxqX/g+rkFJ03bXc5xd2jinc2PZRvuAhHlLNKMCMJPQXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788439325; c=relaxed/simple;
	bh=52IhV1NlD8VpIKm2oG40lSwrnp/KluZG7LbmqWFL7xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ggMfwCQwTFRg20upcVO0xx5f6uwqNEVfX5B1SuQ+6gn9Eh03yjSoyXAuzvfZxZp/nBh6pJnj1NK48dxgMmk3rRDTw4tftHhW7yX3c93bNH5SH+uxeWbux9HqR5g7aYSjmVHlhap3NaE/gnNALh2KoUT3x56xLM8BbBvS3XNtvQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so1149646241.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788439323; x=1789044123;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4aThBV/MKXRTLxxMP9NP7CiDSYoBXBhVSup6n2UINuQ=;
        b=knwfa74DsLjt4lISiREUc5hBvdMS16bVhsmKLDVBki0SRXalLB31SPCTRMrPDUpHz7
         BGe6FEw3rc5aSta7jrARIzdDSt+OmgBUMNLLALoHQsPkVsO54IvAOTqf/ymtk4CnMoCS
         X+w4/fnaluYox//Iy1OlOCyVi2XqyU7kmDW7a3HskeViZkMm13h8AxLgxqORtYJVWRqX
         49xNZunQfDw0G7OtcFI8DosmeB1axOz1ONgjmNyWErs1DC4x+JtxDGEa7K8QAIwk4RoI
         miwX+IcGGMnZrpZFkM69YKfFNViT39LRlFtUtDVOJVYNhlzXjayiMhPHYD2mJWHtU074
         oFtw==
X-Forwarded-Encrypted: i=1; AKwUvBz7YBxcJCihp4nBfCLs3KgV2wjJE2acyypzV7XigPmmt7VDPcLJvMTvey8BJIag/TxUXaerVxvu7Iw8EYQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l1LgNp0sjM/BW2DQIDdkpPbZxm61dQ44Q6+GUbsUydt8FWrz4X
	pxQyzeFM9+hk5xQnmqMcn9Da9xRBlPLClBf5wBI4J4pjKHSduKCnLPy41iWtGn8B1UY=
X-Gm-Gg: AYBFou1+CSLdf2rNq21nVDUWjAAfZc6BksR5ml/YFKYDEkW1dSsU5IyqYKPy5GISGkb
	STSuOp0QJGpeqmIzajgzBn4PqHpHfBiHtmeAo3grnqE84R1fORW02xwtFoGZp6SPLCOPtssL6L6
	bFxANAsFi1sRVU75VrIkSAH82gwl+sxoinaL2K6T4W0Pfz6y+EUW41HAvh01GOSeI2rc8PDGSzW
	lrEWAY8zQxUhckfhb1JPO2rXv6/Mn1JxAZY2CSLGs/a5WMBRN7RmlFFY5yLO0+ezqpQJEBc+a6g
	L/vfrtYMEHIo0yOwZ3Fm7DlnHOK6ab1RpV5lHIyIQ1fYkcKuMJiGrkxgR0OnGLP3TKAxDFtYSjX
	xPTM+WXLVZeFCLfyhT5HkoczvTi/F1dW7Fa7xvFT5d8VBDD0v9qEUI8RDDdgrEXR7dvLxE3dCz3
	qDQu3KIfF4ej8+/HUzTpcPIZVm2SuJX+DVra55AQ75WGn8KAtM/YNvIhaL8DPemoCVqHreVKCuV
	cpfIo6InVnEkF3hcrZcF+TWhA==
X-Received: by 2002:a05:6102:fa7:b0:786:dfa:c5ea with SMTP id ada2fe7eead31-78a1f233c09mr5386583137.5.1788439322582;
        Thu, 03 Sep 2026 05:42:02 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-78a1a510cbcsm4362469137.10.2026.09.03.05.42.01
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 05:42:01 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-7542a2ee156so1395104137.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 05:42:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4Px/7sncEeCnLO++2NFjKkP6xkmre3haD8Emy8ZkiqNpinODM6a6X+d9bdemdCrXdvjgljAqps1V71yo=@vger.kernel.org
X-Received: by 2002:a05:6102:330c:b0:786:fb19:d5d6 with SMTP id
 ada2fe7eead31-78a1f19f88fmr5114359137.1.1788439321117; Thu, 03 Sep 2026
 05:42:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260825095047.9971-1-biju.das.jz@bp.renesas.com> <20260825095047.9971-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260825095047.9971-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 3 Sep 2026 14:41:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW+ejFSGv-gTfvgk8ZSxX+QWns_kyteYr-KQkLnio8PJA@mail.gmail.com>
X-Gm-Features: AcwNN1Uzwrt2F_57qLud1MQRI-EP0blNweC_SW2rpdknAoyXWxcnxu0jErknhrc
Message-ID: <CAMuHMdW+ejFSGv-gTfvgk8ZSxX+QWns_kyteYr-KQkLnio8PJA@mail.gmail.com>
Subject: Re: [PATCH 1/4] dt-bindings: PCI: renesas,r9a08g045s33-pcie: Document
 RZ/G3L SoC
To: Biju <biju.das.au@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 25 Aug 2026 at 11:50, Biju <biju.das.au@gmail.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Extend the existing device tree bindings for Renesas RZ/G3S PCIe
> controller to include support for the RZ/G3L (renesas,r9a08g046-pcie)
> PCIe controller. The RZ/G3L PCIe controller is similar to RZ/G3S but has
> some key differences:
>      - Has 3 clocks compared to 2 on other SoCs.
>      - Has a different set of reset signals
>
> Add device tree bindings for renesas,r9a08g046-pcie compatible IPs.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml

> @@ -87,14 +88,18 @@ properties:
>    interrupt-controller: true
>
>    clocks:
> +    minItems: 2
>      items:
>        - description: System clock
>        - description: PM control clock or clock for L1 substate handling
> +      - description: PM control clock or clock for L1 substate handling

As pointed out by Krzysztof, the "or ..." part should be dropped...

>
>    clock-names:
> +    minItems: 2
>      items:
>        - const: aclk
>        - enum: [pm, pmu]
> +      - enum: [pm, pmu]

... this can only be "pmu".

>
>    resets:
>      minItems: 1

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
