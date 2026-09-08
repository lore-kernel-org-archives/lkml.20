Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7D83A0E88
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857190; cv=none; b=To/RMyZ6FR3hbJlicKt/5vfgmGtxEFx6pqFPmWRYw48/IuudJJqqdusUp1y6PJn66B7I35N08hybM2S9oH9I8iy4oUcVl1KywZ+0Xcoo6Zi3vAmhHRxX2rSYvqVMlsP4pv2QUFoNot6Nv6QpAQEMxo7XV8AAwuT4QAuHVO4QGNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857190; c=relaxed/simple;
	bh=92gyEZZTnYL7xeeh6ZEwBFSKdx2055oIqu0lK/Rebu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UkqSI/UO0xOs5iMIeq+jszvhd0XTYuZNXHmV3QF76a3jaXxIJv7dZpVtdCeN0oqF0QoSFl9b9VyFAWa7PHdSuytT11Uc/5cNDc+AfADblmJfBvmFVbx6t80bVEnQLARk4gX13gkXo3bCjmRS+VdAGFC+tbxXEtnlfVBm4xLLl/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bf83925ddaso2492481e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:46:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857188; x=1789461988;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ApssUKPvTBDPBMVIhSzHAqwCbeQAa06dIhcXYuDQzKs=;
        b=NDtRPtnIvvfZoIHXMuO8Lo/2AiJnfVLki/ZU+C9/X6KogxS7HZDu7TcvJzvZA9GtVQ
         Ioli1UPiJlcADLzvtyywwrKkZTzn7MGrAcEvHqnP8u7I0uUyZBqdWaxfO39JpBhNSxPY
         aGzss6kUJoEcO/Omv1aeKWZPORbnsIK8Er9HZd5RhqLTeC35qkJfBvMepzjLR6UhLiFD
         zTCJIboXt4Qvl7dSSzU9crPiD451Pk2fzXrfgizwfc7OMg4+hCs0zo56EK6oo63zRToQ
         M8/Xjgbde5uT2q01xyLvvaPL+EbMp5a6lvfnFT4uS7mCB1F9OBIfwNxDK+Sn5oN8SS6o
         DmRg==
X-Forwarded-Encrypted: i=1; AKwUvBziPt5IkzY/lpNApGbCL4iomyBmAbVbun3ZEGD8fxsW9KuQRaXO18PYWgXDia1E4vU4DhH+NPPDV4+ffqM=@vger.kernel.org
X-Gm-Message-State: AFuF++k69dcqH8VGuZLH+asFTwIEno11PlTPDgVSt8ggmDQwBlrK1HhQ
	XMYeM6Z8nmnn471wU/fD1kSg1uLfJNbDwv0W9o4IYxTm8sFDSW0sFOakWHIqMHC2
X-Gm-Gg: AYBFou10S5F9f6sF6lNfu80DvwedlSqf3Oe4xCe8AiG/pcj9+I37Jo4KKk/t/W+luhb
	bak+jEJ6JbjGTWyXXMUVMin+HVMLL7NRnYyMYq25/i8tIeINWN7jjaDo5gIuSebiYVzj7f7u4mp
	hXAeWYGr/aMc59eBSd/UXlWpWH9yGa1/n/GAqo2n2pD12R/qgtp7wM9Fhg7X2JaDrQQT0+/FlMj
	fAgKtpjndcdVRkzTXHP6yor1rKhQPl8G/mdBU+OiahewDOxRbC+JncfFRQ/xJer8cFLPqkOP+KK
	ovkB+2763aQeyFDIg6Z0kXph8/hcaXlwD5fnlUeSNC1nxRmQwlC1iXExjIczaIUeq0befeH5h8b
	RzXnYr5VGqOMOA7x61yKZzGPaadJXnMbb3Byfx3C6I3CbYgsNOz6ht+uOwmf5WNsmrfmkMj4sGo
	1tUi8Z7XR16mC3S5si6U6eLgC8daC5vn19vH8EieEQ+bhbrw7kX6aOpYQMSQ2lA+j9u11mQtu7R
	VpdKszLlKbwYoKhV0q1W8ZGXU+gwA==
X-Received: by 2002:a05:6122:f18:b0:5c7:a814:b987 with SMTP id 71dfb90a1353d-5c7ed298f6bmr13384577e0c.2.1788857187910;
        Tue, 08 Sep 2026 01:46:27 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec35d85fsm9598541e0c.12.2026.09.08.01.46.27
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:46:27 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c681c2a6a7so1651029e0c.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:46:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByNMkYuuXu8CsWM0/LbNOrXj+FVD88VI3txPazdWShu+XruKDFnHoqRM2ej2y/n2JP/0wIQ2jYcYzZiiJ4=@vger.kernel.org
X-Received: by 2002:a05:6122:e189:b0:5c7:a9ee:dcfb with SMTP id
 71dfb90a1353d-5c7ed3d6e40mr12626919e0c.5.1788857187476; Tue, 08 Sep 2026
 01:46:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260906140134.492084-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
X-Gm-Features: AcwNN1X8I3PAUGIRvp1JcLzwLyyr5hfRt4h4h2_fZyfEgH0XnWVqbEIcNTcm87E
Message-ID: <CAMuHMdXKr-2+_kcCd8hSB84=AZpmOtDt2-Dxpgiewyg+67O+fw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a779h0: Add GICv3 ITS and update
 PCIe node
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 6 Sept 2026 at 16:01, Marek Vasut
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

Thanks for your patch!

As I am not PCIe DT expert, I am comparing this to the corresponding
patch for R-Car V4H, which I have already queued as commit
7fe73a3a3f2c3718 ("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
update PCIe nodes") in renesas-devel, but which probably needs some
updates.

> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -691,6 +691,8 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>, <&cpg 1121>;
>                         reset-names = "pwr", "core";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its 0>;

This has an extra cell "0", which is probably correct, given
"#msi-cells = <1>" below.

> +                       msi-map = <0x0 &its 0x0 0x10000>;

This is not present on R-Car V4H (which is probably wrong).

Interestingly, Documentation/devicetree/bindings/pci/pci-ep.yaml
documents msi-map for endpoint node, so should it be added to the
pcie-ep node, too?

>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
