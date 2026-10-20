Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496861;
	b=mZjyGOeWkd4GODrFxWY2s4lzlStYVrieFvOu0QbW6/8JW2OfMCW/D1qYzx6e4ZmiMXqH
	 LSMkdFwmV6tIjV/+8n4aE/FJxW2aGdijeNeCBLS67bHaSUXu+rHxa+N+rMtyBIDSH1+Jy
	 58rAzavbA/TGznC8UVxTPIeMUE1R2m5Or2EWdkhzLtxXFxQB757fnD4R2j3U2Non9xIGR
	 nmJdxbERdaoXVAt0Apzq1DCv3VdoMSS4l3y9kEpmLMrqZHbGG7VBWMrGNnj5DkpoU8xph
	 9DI+onmRpNuq9a1ibRdHbpCy2sBcINU3vecbLhriL17Sml5sFpfh3WiC6jK79TxR6rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496861;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=7AH5KLYkXXpwtDoOq342gqQ4JtDTxtQFyRIk7TQMJ3k=;
	b=1QtxOZVhXySqe7MB2hNwjWQ8HMCG4nlumuvIOX2Hl848MwgCmremDnlDD/0UgVYIiP8g
	 1jJ4qm8L6zAvfv053hEQhXcBdWhcN8Be3UG7MXQlTWp41uy3YYAe13VJ9+3t3a3NduZOu
	 KJgvp2HkWs3VX/d7BYLzL7aw0ECQzfrCp2Ib94Vvl2+bowxB9Zp8rByGW9rwXVCo/bb6h
	 qqeEGbYFHaNzDD9d0REXWfQvYtnieDn/UUMsdt9yuZlJDssxJP/G5StUEO8peK0kzBqSE
	 +69t4PD+FxhinTvP/LngKK7j98XMmNo7ggXk7rL6b7vy0QhytpQz3NuSvD/celMW7uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CB7C606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:47:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CB7C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eabf243d05so896557e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496859; x=1793101659;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7AH5KLYkXXpwtDoOq342gqQ4JtDTxtQFyRIk7TQMJ3k=;
        b=fZMR0sRR5gZonRJB15Fw6PEpJwOpxMD8BYh8kY8QNbxVt+XdbXwgyqIYhDEbmiF8N1
         PExeV+VZYxiHsvUaccZvZatYU3lSfkKy7ETZptXmarnul5KgGicj4q/hsRAQf9XEVcUw
         WlstwStTMr5HphHvQnaCi9KzYjBSzMA2juOa1YR8TO8bP6lO9k67MZ9VIK4QvoNDKMLv
         qYFRBYFjwlObjFY/wjT+ZQ//XQpztLxl9I/m3NZvEyQzKBC1yp0mbyuNjOT9MJdv1VL6
         dAkl7A8h7fSdpwrd5srY4eKQOmybC1+zv1hUu8DCTMTEqG5epOvx5GOY6VHrqWfswPEy
         upFg==
X-Forwarded-Encrypted: i=1; AKwUvBxDA5F+Ho7RxM25mCDd4QdY9c00Tv3VXigSHH+eW1Su0Gc/lU1syovUKVyxZQUdfyDVZirq2GEODADES6s=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrGaW1PmdA5fkkYpHLArdpa2MCTJW2fnpiECykPylW8qwllQ/5
	0PLFpaJNbHIMhXzEhpZIedKcTQWHebpUrtxci7xccy5YL+/G1G+GYI0BSxg0MzBIWoM=
X-Gm-Gg: AYBFou3nL8RhcxypRQ8nmMwM4EZKB4MNDhkydZOs6Gp5D7pzVdaPygffYA/pyVqfruQ
	9rw6AueU5yMXhaPzptXEZmmEB4vbZclQWFjugXmurpVJfqurIwhfX/HtS/pWQ6Eb/yQNKa3AMlp
	cJkJg4cPVP+P/4QkaJjF6u5TaRdtVNNh24B1ArEqNJUpXtHKAGajcWNg4LcWN1atfdT8uTlNctH
	+S7IUie6wF6MmPFJ+lhie2wn3iktBnVJBrf+VKP6KR9uo4LRl3LC0+Txc74Jiaqi8v//YGWn3bi
	fa/QmsVjuWbvgTF4G/kyuqPVxhJYlSuuh0OLYL7FkrkL8RcFmTjggMgNJiTjP/xuOnsxzW2B4PQ
	7Xli07iW0gDMSOwFCdYDEJ+wnqt10CWYUEo1y9/hHVfn3CK3MXA9tvs8bKn1+v24J3b3rOtxVbm
	9Q6NovwFnrin0ytE0Zg0u8wiqI5JzKCYWgP5NEyOEkIyhlgmPX16vV7/oUrGtMVLJHWzLRnM/Jm
	W1KYJlcFSXqcPW1ucT7ydRMF+SRlwnOdjYb
X-Received: by 2002:a05:6122:21a1:b0:5ea:c084:6f19 with SMTP id 71dfb90a1353d-5eac0847583mr1880190e0c.12.1792496859488;
        Tue, 20 Oct 2026 04:47:39 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eabe1b2026sm7590634e0c.17.2026.10.20.04.47.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:47:35 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-99061e2171cso830077241.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 04:47:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzxgUcO/pp1scgLJidWPXcsiEe043fj+Xqs1rK3Rqja2y1FTGj+tUOi3C5GS0to72EoQ2Pk3uAgy1waGsE=@vger.kernel.org
X-Received: by 2002:a05:6102:5108:b0:7cc:2c29:54ef with SMTP id
 ada2fe7eead31-7cc36a1fdd5mr2439750137.19.1792496853877; Tue, 20 Oct 2026
 04:47:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020031049.969895-1-den@valinux.co.jp> <20261020031049.969895-11-den@valinux.co.jp>
In-Reply-To: <20261020031049.969895-11-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Oct 2026 13:47:22 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV2wTNjaT3HacNiAAwSNU9MtvXqdFg6uSk-pZUBh+9tXQ@mail.gmail.com>
X-Gm-Features: AclHuK-oSwXELoK3ftCuQEMht83trZrqGJxwnNQHzvwYJozTnmt64-x3G5ZnW4o
Message-ID: <CAMuHMdV2wTNjaT3HacNiAAwSNU9MtvXqdFg6uSk-pZUBh+9tXQ@mail.gmail.com>
Subject: Re: [PATCH v5 10/17] PCI: dwc: Free the MSI domain after the host
 .deinit() callback
To: Koichiro Den <den@valinux.co.jp>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Shawn Lin <Shawn.lin@rock-chips.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Niklas Cassel <cassel@kernel.org>, Wilfred Mallawa <wilfred.mallawa@wdc.com>, 
	Serge Semin <fancer.lancer@gmail.com>, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san,

On Tue, 20 Oct 2026 at 05:11, Koichiro Den <den@valinux.co.jp> wrote:
> dw_pcie_host_deinit() frees the iMSI-RX domain before calling the host
> .deinit() callback. For a core-owned parent interrupt,
> dw_pcie_free_msi() removes the chained handler right before the domain.
> A glue driver that owns the parent interrupt and demultiplexes the MSIs
> itself through dw_handle_msi_irq() can only stop its handler in
> .deinit(), after the domain is gone, so a late interrupt can still
> dispatch into the freed domain.
>
> Remove the domain after .deinit(), in dw_pcie_host_deinit() and in the
> dw_pcie_host_init() unwind. Keep removing the chained handlers of
> core-owned interrupts before .deinit(), which powers the controller
> down. Clear pp->irq_domain when the domain is removed so the unwind can

FTR, this is now pp->msi_irq_domain since commit 8f0b8cc3a655f56b
("PCI: dwc: Rename pp->irq_domain to pp->msi_irq_domain") in pci/next.

> tell whether it exists.
>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
