Received: from mail-vs2-f41.google.com (mail-vs2-f41.google.com [74.125.227.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8BE154146B
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 17:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703825; cv=none; b=YhiEyK9yIKyDHMPJ4/kGKy+PQgMWAVagCFGFks+l4TU+/QSfhlve8HFeFTZu9u2pBQKaQvIDr7bwl+RqS2p9BVJLKigDdj2y9blWKosuYaq0rxIkDyIaqvEy8/+PLN1hVYtEl1eLklRIiEOjhkUJxbpKHKKV+gd9aigo/QU05LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703825; c=relaxed/simple;
	bh=To2pz33WHeqtYIBpo3tdxLVVXHw7FWx2+MU4WwcX1A0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ji8NEXgqEPjMTPHQQJI6Fo3sa6Q3yKRX3Y2Nik7279Sav7tZGwLs3/QHmEog15OfeZC79PfUnYnDnwOrEVRzkM0L5u+1Iwd4IIR+LfoFzZqRjU/SiQsG9wxqPdiMxbrvYX3qv+IMSrh+mf/QNkaRcpmSAp7W7tB5AbBZw9a6bWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f41.google.com with SMTP id 71dfb90a1353d-5c67e529da9so1464471e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703821; x=1791308621;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K3FpjckKknSKtbxyzZ5D1wObsYxIm/YvEg91ak3C6aI=;
        b=0a9IcWyOGo4dWRSI16nXeVgO043pyhZfiJIJJ0VRC2zKP+cK1V8SWMKeZl/Ace4S1E
         v3OKp10bAW1qa8JlZR4HOJ2NokjGNrH4H2pQJWfZ4KO3Egxe94jmyqpOx5rPYNu7uGPa
         jn9PkLzGKczQJ8ojgxAELGCGsJtJohRu92QcIIeN4HcIbABIzqOBxNSXekKluvHcaLkE
         rd++1F9atmMX0Mg6wyrBx9OfZriISjq/c2/M8r1SAj3NENaOrsYjy9hmx1SPhRDRihqs
         upvbv+T/CVRnMYehyPcOJSqwC4TsdXyRzC3BT5chW4ZB+5otAHrfGRZ+p1ofE0Fll+oC
         FtvA==
X-Forwarded-Encrypted: i=1; AKwUvBznempnKMBZ4xr5Ku2Vn3Z4+WtcqQ43cFk0rUQlznelWQcyZdzYUV01GOCYO0deuE37704eWZG7LoO3p+0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiI3jW7jFejRvcg+3NJm6APfs0HxXZUeiPcYEpyOjbAj+neB/g
	DgUD69RJSh+uiVkypxYfI0Vr1dlKv19hLYs2hprg5fsFi6YA0M9VE7Y15TDCnlmf
X-Gm-Gg: AYBFou2qEaavIujvBLNO9s2mh089UdkNmkiv+pZo0qjVAKAerwnZz/cHm0PtOQDaNNY
	erbWHRXgzscowZJ71L/ZmCtCqjjOubAY217jumtxMWZLk9eK2FaJsn8HjOJ/aAkAfaVT3AQyUjN
	0Q9u1BLUUDjPWa7esvoaAfouxVUJsfziG6vkavmB223Zw4wYrA9Hx7s1sFz+coV6XgzmJgEg4nf
	WMMGESiwcXLDGkfFabAM7aghWNBmMuGH6V6QEep9NiVLaZFc2XIDZblHsA6Rx93Za5GRRQmM440
	/gS+qTtAcqEIfUEuJFCmnLmz0DhKNH4HsGWOpaQOeR720yQ3Bi29lUcfWjPmyQ1douQB7PDbEqH
	Jqh9Lh07wtor+E4y8x+uM2kD2hk2dmx02j8oeYkhXFUWw/b+ecuwIDvI5+1dn81Mh3U19j6vTm0
	Wr+DotkUD+EBWFIcfQhWJTipbcrkRqV5GxY/uH6NAdJSslk5H5/qFp4pMy8BEeqY0aXGCTxzK9V
	YCcYMWjrTg71p7HmieFBLBRnDj4meaEFF3B
X-Received: by 2002:a05:6122:da3:b0:5cd:575f:93c7 with SMTP id 71dfb90a1353d-5d518a32d77mr46362e0c.6.1790703821387;
        Tue, 29 Sep 2026 10:43:41 -0700 (PDT)
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com. [74.125.227.37])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5d4e88f57f6sm411628e0c.8.2026.09.29.10.43.41
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 10:43:41 -0700 (PDT)
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b9c8db8c4eso362445137.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 10:43:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzAtkOYq3Bc8AE79tzwW2DcbdV72U+rYhy5+iaEkamFgRO6L+Uh308ROZeWs6TNuZLKXw4E/fjvDJ1l8o4=@vger.kernel.org
X-Received: by 2002:a05:6102:f91:b0:79a:21f6:20fc with SMTP id
 ada2fe7eead31-7bc3b59255fmr83403137.10.1790703820885; Tue, 29 Sep 2026
 10:43:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928165230.3397664-1-den@valinux.co.jp> <20260928165230.3397664-11-den@valinux.co.jp>
In-Reply-To: <20260928165230.3397664-11-den@valinux.co.jp>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 29 Sep 2026 19:43:28 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXoKFCroL1d6-fLwYR0UkLBL7suKy=rOFavioLd7rC4OA@mail.gmail.com>
X-Gm-Features: AclHuK8JzfDwBbpW5Y3ODVdWtxAiX7XsdrE_LjubbR8Xd7qhHEJIEFJLyf_DRos
Message-ID: <CAMuHMdXoKFCroL1d6-fLwYR0UkLBL7suKy=rOFavioLd7rC4OA@mail.gmail.com>
Subject: Re: [PATCH v2 10/15] PCI: rcar-gen4: Take over the iMSI-RX interrupt
To: Koichiro Den <den@valinux.co.jp>, Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Jingoo Han <jingoohan1@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Niklas Cassel <cassel@kernel.org>, 
	Wilfred Mallawa <wilfred.mallawa@wdc.com>, Serge Semin <fancer.lancer@gmail.com>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Den-san, Marek,

On Mon, 28 Sept 2026 at 18:53, Koichiro Den <den@valinux.co.jp> wrote:
> On R-Car Gen4, intreq_pcim_sub ("msi") carries more than the integrated
> MSI receiver: the controller's reset requests and the Root Port's PME
> and bandwidth notifications are signalled on the same line, and the
> following patches need to handle them. With the DesignWare core owning
> the line through its chained handler, the driver would have to hook into
> that handler when iMSI-RX is used and request the line itself otherwise.
>
> Instead, request the interrupt in the driver in all configurations and
> set pp->msi_irq[0] to -ENODEV so the core does not install its chained
> handler, as spear13xx, keembay and dra7xx do. The handler demultiplexes
> the MSIs through dw_handle_msi_irq() when the APP block reports
> msi_ctrl_int. With an external MSI controller or pci=nomsi the iMSI-RX
> is not set up, so keep msi_ctrl_int masked rather than enabled, and the
> handler has nothing to do there yet. Request the interrupt before
> enumeration, as endpoint drivers may use MSIs from their probe, with
> IRQF_NO_THREAD so the MSIs are demultiplexed in hard IRQ context like
> the chained handler did. The interrupt is required by the binding.
>
> Release the interrupt in .deinit, before asserting the controller reset
> and disabling its clocks. Disable it around a Root Port reset because
> the handler accesses the MSI status registers through DBI.
>
> The DT routes downstream INTx to the same line, but the driver has never
> supported INTx (no INTx domain, INTx enables never set), so requesting
> the line exclusively takes nothing away.
>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>

Thanks for your patch!

FTR, this interacts badly with "[PATCH v2] PCI: rcar-gen4: Add missing
PM ops"[1] during resume from s2idle:

    Unbalanced enable for IRQ 57
    WARNING: kernel/irq/manage.c:775 at __enable_irq+0x38/0x64, CPU#3:
s2idle/686
    Modules linked in:
    CPU: 3 UID: 0 PID: 686 Comm: s2idle Not tainted
7.3.0-rc5-rcar3-09216-ga295839bfe55 #696 PREEMPT
    Hardware name: Renesas Gray Hawk Single board based on r8a779h0 (DT)
    pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
    pc : __enable_irq+0x38/0x64
    lr : __enable_irq+0x38/0x64
    sp : ffffffc08904bab0
    x29: ffffffc08904bab0 x28: ffffff8446a4a880 x27: ffffffc084e64828
    x26: ffffffc084e64838 x25: ffffffc08069e630 x24: ffffff8443ad7cb0
    x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000070
    x20: 0000000000000039 x19: ffffff8443ad7c00 x18: 00000000e630bb27
    x17: 0000000000000000 x16: 0000000000000000 x15: 0720072007200720
    x14: 0720072007200720 x13: 0720072007200720 x12: 0000000000000566
    x11: 0000000000000000 x10: ffffffc08418a038 x9 : ffffffc08158a090
    x8 : ffffffc08904b798 x7 : ffffffc08904b7a0 x6 : 3ffffffffff7ffff
    x5 : fffffffffff7ffff x4 : 0000000000000000 x3 : 0000000000000000
    x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffffff8446a4a880
    Call trace:
     __enable_irq+0x38/0x64 (P)
     resume_irqs+0xf0/0x130
     resume_device_irqs+0x10/0x18
     dpm_resume_noirq+0xe8/0x190
     suspend_devices_and_enter+0x524/0x594
     pm_suspend+0x22c/0x270
     state_store+0xa8/0xe8
     kobj_attr_store+0x14/0x24
     sysfs_kf_write+0x4c/0x64
     kernfs_fop_write_iter+0x13c/0x184
     vfs_write+0x148/0x1b4
     ksys_write+0x78/0xe0
     __arm64_sys_write+0x14/0x1c
     invoke_syscall+0xa0/0x100
     el0_svc_common.constprop.0+0xb0/0xcc
     do_el0_svc+0x18/0x20
     el0_svc+0x3c/0x114
     el0t_64_sync_handler+0x58/0x134
     el0t_64_sync+0x158/0x15c
    irq event stamp: 0
    hardirqs last  enabled at (0): [<0000000000000000>] 0x0
    hardirqs last disabled at (0): [<ffffffc080092a2c>]
copy_process+0x9e0/0x17b8
    softirqs last  enabled at (0): [<ffffffc080092a34>]
copy_process+0x9e8/0x17b8
    softirqs last disabled at (0): [<0000000000000000>] 0x0
    ---[ end trace 0000000000000000 ]---

[1] https://lore.kernel.org/20260907153711.653861-1-marek.vasut+renesas@mailbox.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
