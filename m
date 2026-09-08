Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77254B04BB
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 08:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788857652; cv=none; b=iueRPVfxB3uNA0U5L1kR39meKm56PL1YSmj6TJi6eQ95ByEVkAeSMdr2Tss7P/elBpNslj489ws6sqp51DlZYG6XSlIyVvufYU64mNsJYA7lW6bquQO+DpsSCocapr03OS3fKoobj6ogGilgv9acQYCash4QHFjMPXkMqeTcmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788857652; c=relaxed/simple;
	bh=DaAQfNMDqfA4SiBqN/u9osdm8oWxv6NACh882Mgt+no=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tUPEKT/7BHngZfjgeOpwb9Mb+MvUYzdlD5vv9y0yScplG+pZ1w+GVfirVDoz/K8vn0vXS4wmMRkKGg8+JVogK98U30M6PnW/Eb5zkUO+h+To0ar/WqKvScwo/dp2EBoPzKPptZa/rFXgDm2lSpEhbs7XrGLLzrbE0H0fYJ2EoEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7eb6573bd52so4082994a34.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788857637; x=1789462437;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Jpscs7JaPB6a7DSYaibBo7ovev0XT0EFpj0jxoPpShE=;
        b=cb024wp5fiGmAJcDGuPKxOwecS/s126F6e7kAlQzJINPUsU+3MXnUs3aQIaBxEOKxi
         fnE44AuiiFRalwQlb46IVh7wtyICHHTtkJNkyG5Yut/LQjHQSluAWl5QeguURDJUXIGG
         Lrh7CwyajxI8CSQ8FcNlsCeOxgKBIXSdkxarGJlaZaq7VmecvEJlkcdgZEJgl6NMeR6D
         oTQLM3Sk0ujBPUzArYMgGXw4zcWDvgqjaPVfVdK7cN/nyimrrxt6Ee452Z8gesYAvaNA
         sEeN001BCRhsYTrZi2+hcBpxEKT1lYSoXPTIKvAY8Non4SoFhXDvGMHTP4Jie5aZ1ETL
         Ithw==
X-Forwarded-Encrypted: i=1; AKwUvBwl+4P09Z9I/zGpcSEko1ismT9Woc0wed+bjGGHpUVaEY3q2/fiRvd3nVF2pKyuXV3rl9JhXHCAC4VDhw8=@vger.kernel.org
X-Gm-Message-State: AFuF++n//2mQiJnKmpj0euZKNfbpmLv5rDnzruW8XWdwZUHeeWwuNH1i
	agG/DcX+IS9nTAbbyKogwUhluZgvE1CNvfpkGfaesI9qjbJN2VxbFvlFO5irEAwO
X-Gm-Gg: AYBFou3fe2qc+mjpctvBEWiKBv/gn/huT7nYuEjSdA198g31++W78M/oLwzDDJo6SRW
	jmz6mP2vPBhnfuQIgZ0ceWojrYDebAdLkQGFC7weQO9uao07llEnhURKxRix3Msllk6hfJv9RQ7
	r37vO0NA/kQ2T007dELm6UytYaJIAdgG7Iv+JJ5O93KEYy8f3vJjpHxf+JocTmv87T0iyO9z5qD
	fBRSvjiFsvYAsn6p+OZXqF7wgR5IoRWcjFkz9TB4P6Kzo1tbFldfkqPw2XBDPemRno0puJsrjJy
	MqWaayHs3/l2W62zb+vM63YcrISVQ4vKmzhnirKTXQC2kUupI1Nq+7Igb4A8T9MlXYSj2WQHsxD
	d3RSEHtfdC3Pbj/63ya9LOgMT5SG2/OMAaqgHNeBjUsMxwpM0W8upmWxY8r7znAyvXpbaqXydNA
	b16QhB4+kg2d/Pid3SibwtU6+q0EOgPqX/K2NISz7Fgq+uhgdf5ZY9O0d/+Dawu593qfqe7AjG7
	GwLLMdREmgWLzYI5KsmeYMJyeMC3A==
X-Received: by 2002:a05:6820:2912:b0:6b7:46fa:169f with SMTP id 006d021491bc7-6b746fa1b22mr14547405eaf.52.1788857637561;
        Tue, 08 Sep 2026 01:53:57 -0700 (PDT)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b98d230019sm8389152eaf.8.2026.09.08.01.53.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 01:53:57 -0700 (PDT)
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4a45b3f0becso2991726b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 01:53:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByVKfKfM5aKH/1eYHuH8WuEoNkAi1MCMZwu3AMjPMHktKuYgUgLRuDurRfYrGBVdGIibJ6FSN8I/q+ZKyc=@vger.kernel.org
X-Received: by 2002:a05:6102:3054:b0:726:cd42:d023 with SMTP id
 ada2fe7eead31-78a4aa3506cmr8542865137.11.1788857192323; Tue, 08 Sep 2026
 01:46:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260809200429.843212-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 8 Sep 2026 10:46:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
X-Gm-Features: AcwNN1U6U5lTYgv4OCUonWRRw758LHZnUmo8hmQI7dJ9Temn454yHA3PWD6OCBM
Message-ID: <CAMuHMdXpq170gW12KEzmf5cUkUfRQ-6Vj_hMyeGeUny_WUCohA@mail.gmail.com>
Subject: Re: [PATCH v5] arm64: dts: renesas: r8a779g0: Add GICv3 ITS and
 update PCIe nodes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 9 Aug 2026 at 22:04, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> This SoC implements GIC600 with GICv3 ITS and PCIe host mode on this
> SoC can use it. Add GIC ITS node into GIC node, update interrupt-map
> and add msi-map into PCIe controller node.

I missed before that "msi-map" is not actually added?

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

> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -809,6 +809,7 @@ pciec0: pcie@e65d0000 {
>                         resets = <&cpg 624>;
>                         reset-names = "pwr";
>                         max-link-speed = <4>;
> +                       msi-parent = <&its>;
>                         num-lanes = <2>;
>                         #address-cells = <3>;
>                         #size-cells = <2>;

> @@ -2148,11 +2150,22 @@ ipmmu_mm: iommu@eefc0000 {
>                 gic: interrupt-controller@f1000000 {
>                         compatible = "arm,gic-v3";
>                         #interrupt-cells = <3>;
> -                       #address-cells = <0>;
> +                       #address-cells = <2>;
> +                       #size-cells = <2>;
>                         interrupt-controller;
>                         reg = <0x0 0xf1000000 0 0x20000>,
>                               <0x0 0xf1060000 0 0x110000>;
>                         interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +                       dma-noncoherent;
> +
> +                       ranges = <0x0 0x0 0x0 0xf1000000 0x0 0x200000>;
> +
> +                       its: msi-controller@40000 {
> +                               compatible = "arm,gic-v3-its";
> +                               reg = <0x0 0x40000 0x0 0x20000>;
> +                               dma-noncoherent;
> +                               msi-controller;

Likewise, make dtbs_check: "'#msi-cells' is a required property"
And it must be <1>, so msi-parent above is wrong, too?

> +                       };
>                 };
>
>                 gpu: gpu@fd000000 {

I have already queued this in renesas-devel as commit 7fe73a3a3f2c3718
("arm64: dts: renesas: r8a779g0: Add GICv3 ITS and update PCIe nodes"),
but I can still amend it.

Thanks!


Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
