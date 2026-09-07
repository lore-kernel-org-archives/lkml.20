Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A91C44B693
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 10:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788776817; cv=none; b=SR4s97R5dShu7meTXML+O8Ly6LBUjZo93ITPHu8+TkB5l+YQw9Zj6GjdEXhJ72XoTXowT0uZ91+zvyDO8AGfiJXKWUgjTz8V/Xj7oMfyMeBvZyWNFtOLkFYeTcp8B5c6zrOdmDuGmfhDdmxGDve6xzwjykdgqpMlY5DOFvdYGyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788776817; c=relaxed/simple;
	bh=WXRZsD3v33qBAuPkHtARz2nCLJEB+edBNngFTzuWl5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JY+qeqd5jwif1YxD1oCst2sYeJ0K3Fll0edpRbPUoMMUThssTLU8wJTQsf+I5V7iZsDP4fLzNKYR9g8Gr/Wibelw6eHJ9MPRCG+fpwKcsibHy0jrnvuVJEx/txLCG1jh3S+TOdNWSfzopYK4xhze09w9EM87rKDc9NnNMfwNOAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c7d1512dbfso2804691e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:26:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788776815; x=1789381615;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hSWXrsN8UfIXC+P+F15lvL0/C8YBIn2HdB2Vgr/1RcY=;
        b=RcOf22TxXrHTV6IGULneP9CQUhjQwbkfwh04ozkpfA7y5kR+STl8N69SYM1BwLArQe
         EO+C6Uv4ZHLI6f0QYzbSJvy81GQxuFDtZ2FjTYEzFiHR+kzuK3ESPi+vlIYVe6mtXRJS
         FCE7PukekLtRXxXLyUTWrgI4nJ2dEZFfiI3LJThDajkVF1Q275HkKV/JhW5oxHqc8FnW
         M08Ag45QYat5OT6Ao1K12yI2k8I5g+bSqu0yp7xZsxRwpIABvDN2NnQqLpEhLTJl4T1H
         yWpKzjYSLo60NZDVA1k6ZhODebMnZ/C55rBQ87LzPvdamTZ0fTCUhaa+IcUDAW7UyavA
         XjTA==
X-Forwarded-Encrypted: i=1; AKwUvByBj5M0MXNtMpF9nKcLgbf1Rvfi2KGGkwWxf1Dzf9GefMRBqCOnyszfWZ+PkbxGxGBWJUuHd+j3yunNSpg=@vger.kernel.org
X-Gm-Message-State: AFuF++lXAe+zN0ff69q3+ZvHQgpv2Jm76eMo3JNtdBK2h0NKZoXp9tEf
	BP1fCpSh+2Jjv8D3M0bv/FDVQdOKBnt2thuJbqKsTFxaVrlMErdALFTOigCBiUPI
X-Gm-Gg: AYBFou0+DcBuk9L72DM4DF0zajxDXZ2CORXzJe4LYmaY02QpKnamxj4gHE0VGAOWa67
	nzvw6Yb9xYdd6Gtqst9Qx3IiiP7gGSIlPbdJ/0TYI547hkI9zEowXAkV9gdPGRTK0UHWZ8uFUt6
	7FOUsNTR3JcyErAPOMJXK7YO1A4cRAAGQBxc/6E4JhcEAmRBKhDqTD/jtks7BQypGKwby7ieUb9
	5aAT1F7H5qY/Nfd+23my6sp7MUoOEUscB/jY5xCGy4rGw+FeI1XmAtmHYpGhDE8OnDVqF3/FQos
	rw4/Fiv9KUTb2na/hCsa0E39InRlQa1oiyvD25Cr3mS2LGySL4JiRInCv08elRIsPjKk6OFlzz7
	oVDb5r7wwcmVBNgE2UkPuzFjqhJufjZARTIdIFBfyu6/8+LPlNW9Q/yLNVcYDj350+ZhAB8tqBs
	rJApWwTVSJ7Bq1rbvuTYmhYustCYL/9zXMu2KK69eCR+B7qKzC77EG5ivZxdn8YFe0lOn+gRpGE
	qs6D6zxK0IVgVi8GC9nswUPVw==
X-Received: by 2002:a05:6122:490e:b0:5c2:c0b2:9880 with SMTP id 71dfb90a1353d-5c7ed478a49mr11004443e0c.1.1788776814998;
        Mon, 07 Sep 2026 03:26:54 -0700 (PDT)
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com. [209.85.217.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ed1dc86sm6958749241.5.2026.09.07.03.26.53
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 03:26:54 -0700 (PDT)
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-784a1696a21so2296401137.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 03:26:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzKR3yvcNk+EERKPJsuE3UCvrVbRs7b4qA18+iv93hfmqX3G1KSbXBhbT4Ch2t+4cR3Zu1olIJr6GXVSSo=@vger.kernel.org
X-Received: by 2002:a05:6102:578e:b0:778:4fe0:8297 with SMTP id
 ada2fe7eead31-78a4aa70e09mr10103340137.11.1788776813353; Mon, 07 Sep 2026
 03:26:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906173234.522400-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260906173234.522400-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 12:26:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWLxG8xSHwTneu=xT8bxs4io7QSw7ziyPUDo6nc-zx6Qw@mail.gmail.com>
X-Gm-Features: AcwNN1XXd7v4I08TWK48osXGJh7gXuS6LbVWPy2G64ghI87CCZ4swuROz-rYLO8
Message-ID: <CAMuHMdWLxG8xSHwTneu=xT8bxs4io7QSw7ziyPUDo6nc-zx6Qw@mail.gmail.com>
Subject: Re: [RFC][PATCH] PCI: rcar-gen4: Add missing PM ops
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Sun, 6 Sept 2026 at 19:32, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The R-Car Gen4 PCIe controller is part of a power domain. On R-Car S4
> and V4H, this is an always-on power domain which is not shut down in
> suspend. On R-Car V4M, this is a dedicated A2PCIPHY power domain,
> which is shut down during suspend, and the controller loses state,
> which prevents the PCIe from working after resume.
>
> Fix this by adding generic suspend/resume noirq ops for the controller,
> which tear the link down on suspend, and restart it on resume. Use the
> same PM ops on all of R-Car Gen4 to gracefully suspend and resume the
> PCIe link on V4H and S4 too.
>
> Test case which demonstrates the problem on R-Car V4M:
> "
> $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/pre
> $ echo s2idle > /sys/power/mem_sleep
> $ echo platform > /sys/power/pm_test
> $ echo mem > /sys/power/state
> $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/post
> $ diff -Naru /tmp/pre /tmp/post
> ...
> -00000000  12 19 32 00 07 05 10 00  00 00 04 06 00 00 01 00
> +00000000  12 19 32 00 07 05 10 00  00 00 00 ff 00 00 80 00
>                                           ^^^^^
>                                     Class 0604->00ff
> "
>
> Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks, the output of "lspci -v" is now the same before and after
s2idle.
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

I don't have a setup for endpoint mode, so I could not verify or refute
Sashiko's claim that suspend will crash in endpoint mode.

> --- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
> +++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c

> @@ -952,10 +968,14 @@ static const struct of_device_id rcar_gen4_pcie_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, rcar_gen4_pcie_of_match);
>
> +DEFINE_NOIRQ_DEV_PM_OPS(rcar_gen4_pcie_pm_ops,
> +                       rcar_gen4_pcie_suspend_noirq, rcar_gen4_pcie_resume_noirq);
> +
>  static struct platform_driver rcar_gen4_pcie_driver = {
>         .driver = {
>                 .name = "pcie-rcar-gen4",
>                 .of_match_table = rcar_gen4_pcie_of_match,
> +               .pm = &rcar_gen4_pcie_pm_ops,

pm_sleep_ptr(&rcar_gen4_pcie_pm_ops)

>                 .probe_type = PROBE_PREFER_ASYNCHRONOUS,
>         },
>         .probe = rcar_gen4_pcie_probe,

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
