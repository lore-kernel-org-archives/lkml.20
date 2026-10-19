Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1866948594D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393600; cv=none; b=iSWN04wMEt4eI3xHrXTEFAjWVgTd7i1RXKP9WuBRGBXKTOlmNjOa8vGx1diNL2n++Kmo0T1TOuvlgYKRlHhKxEiKimpk6gaK6uf1984A3YISoh6u/VxY8oGweOEL38tfPH+x7HBwMMlwHXXnMMMjKv4CHjaWdupPWP5sjz0C4ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393600; c=relaxed/simple;
	bh=P8xJGaUWRfCF8FqZhZvElxrMdxQK2gqfDHniHzz5j+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uIeprSIh+bhiJaOvuPd3lZ1Ly8fpxdOAAhkxAW2OsuBFm2gAUzgvPZTI7Zjk+YiOYZMC3Nr3M8f2b0sIztAuq2HKQ4GkDg7w1yk3Cp0kHzCQWKGxlfYzmEmhusbaX8TdEr8s9NtPV/4cKEjMWCr1yGLFKgkOKbJ/sL/colqodqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-74ab6c88052so431188137.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393598; x=1792998398;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=eu8vGumKNUEJq0ogznls0IACooxNZPVx2SWES3Vu4VA=;
        b=YEm/ErfyJNP7kPg6FfjkvTifX/oXI5MlrsvwLtaRbq2jthfcm9qqrigc4ACeWD29oI
         CqrVAHvCKPrsT2m5lEeWF35wRWIzUN+RwS30zIkCYIStSZKK0h2jyBzQkDyxIfILKggG
         DTVo1l3FRxZRN5mtNHyqI3KGxxpuuIZJgnWebrAACS13I3WhpP2iK9hV1bQ7uf1pPoWs
         QmoVzn5wnng8L92h5gpZmTDYNpx4ihHXmEFYYL65Wp+eH8La57Prasr+b33uSgC8vNMZ
         yUPwsT2cpgibXZ7sJ54gNdFdnoAAjqDaMKUolkMVOa9mIX/YFUv4IPBwX3z2u5r4I/af
         1E5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxZkG4zWkxlRU66T2eIotN2IE2P4B3L17y1Uo3FPAScH6reVVQCyOIcV8x2/ht9pXXIi5cPechghcAwBsE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKrXWdwLM/qoKNf7gH1oi3hzPmnSDcyQZFiR9PbFwNkKVuCHoy
	xtyFM74hQtVZPUovA3jSPnlKDpjwS6MOpMyD7azY5ahPUuzgo/j/qveQzivJxAWX
X-Gm-Gg: AYBFou2qOgKwumV5gvqHZWgd99KumeGHBj9OgevvDVSk2FSq2Lawq5J7sAmEmmRerAs
	psIqnRqR9QPJgf1DcdMqU2qiBfU+R5e+m2X5bxrtpRfONWpJYJwNE19XBwh7UM1Ksk1VSCDXFqH
	f6rRgYoTx9bHcdgNx2t154zJm8YubOv/BwMYbgfUuJMnYbbalfVAR8XWWq7MQysvnjMleR1ShMS
	D3gL36pvKo2IYuDEszTcLNKdxwlzVHL9sEPTgjsKQRSlPqg2+IzgmQKfWjprh2ekjPSVl0f+LPB
	4I8IgDz6ArdabSOXQlziOWNfsFH0r59hcoqPl0kCPJT3CtniH/Idj76/pTna6zlRlQaqb8o5lzc
	djReZrqrB8/oGHjIB523LuXC58ziM09cf73RZIJInlLplooNCaB7qanz4YunWO+PHTrwVXAjFZo
	i5YH7Zkf50/Zr07YduQQ51nyiRb5rpJckCNT1rryck1UsYe7U1UJEfj09c2+RpMhXRdLkWXhaJi
	AEd/j5Vva1vwpt1+EhmxlPLe4xfMyrCewyLts2O
X-Received: by 2002:a05:6102:3c92:b0:7c5:4da3:aefb with SMTP id ada2fe7eead31-7cc36afe9e1mr1646528137.34.1792393597762;
        Mon, 19 Oct 2026 00:06:37 -0700 (PDT)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990833c2c2dsm7925699241.2.2026.10.19.00.06.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 00:06:37 -0700 (PDT)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5eac01ff101so284593e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 00:06:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzk7fR0nxdZIfLwPkCh+pK4lEhysspvmVidOf8bJgiUUvnofyIN1U+02TXowy0p8sKbed5sr6jVllgnlys=@vger.kernel.org
X-Received: by 2002:a05:6122:f1b:b0:5ca:fc48:5634 with SMTP id
 71dfb90a1353d-5eaaa419d47mr2207684e0c.11.1792393596973; Mon, 19 Oct 2026
 00:06:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004011851.866833-1-marek.vasut+renesas@mailbox.org> <atMEOFH8isshAwN8@debian>
In-Reply-To: <atMEOFH8isshAwN8@debian>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Oct 2026 09:06:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUEUNBA8mDjSTi7MwsSMkKbfftu6OLXdbei8oUxibL_5A@mail.gmail.com>
X-Gm-Features: AclHuK8T-_1RFv1uF7KAoei6UxD8kd-EB3eCG1Lls8ceu8LKgfvwrJWWOjqTf_U
Message-ID: <CAMuHMdUEUNBA8mDjSTi7MwsSMkKbfftu6OLXdbei8oUxibL_5A@mail.gmail.com>
Subject: Re: [PATCH v5] PCI: rcar-gen4: Add missing PM ops
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-pci@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Koichiro Den <den@valinux.co.jp>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mani,

On Sat, 17 Oct 2026 at 07:18, Manivannan Sadhasivam <mani@kernel.org> wrote:
> On Sun, Oct 04, 2026 at 03:18:13AM +0200, Marek Vasut wrote:
> > The R-Car Gen4 PCIe controller is part of a power domain. On R-Car S4
> > and V4H, this is an always-on power domain which is not shut down in
> > suspend. On R-Car V4M, this is a dedicated A2PCIPHY power domain,
> > which is shut down during suspend, and the controller loses state,
> > which prevents the PCIe from working after resume.
> >
> > Fix this by adding generic suspend/resume noirq ops for the controller,
> > which tear the link down on suspend, and restart it on resume. Use the
> > same PM ops on all of R-Car Gen4 to gracefully suspend and resume the
> > PCIe link on V4H and S4 too.
> >
>
> In the future, if any one of your Endpoint didn't allow the link to enter L2,
> then you need to set the 'suspend_poweroff' flag for V4M or other SoCs which
> pulls the plug during suspend:
> https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?id=f845c1e2d2d4506802244ea2a378ae7b04e90bfe
>
> > Test case which demonstrates the problem on R-Car V4M:
> > "
> > $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/pre
> > $ echo s2idle > /sys/power/mem_sleep
> > $ echo platform > /sys/power/pm_test
> > $ echo mem > /sys/power/state
> > $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/post
> > $ diff -Naru /tmp/pre /tmp/post
> > ...
> > -00000000  12 19 32 00 07 05 10 00  00 00 04 06 00 00 01 00
> > +00000000  12 19 32 00 07 05 10 00  00 00 00 ff 00 00 80 00
> >                                           ^^^^^
> >                                     Class 0604->00ff
> > "
> >
> > Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
>
> Note that I changed this fixes tag to below while applying:
> Fixes: 0270dbe4f891 ("arm64: dts: renesas: r8a779h0: Add PCIe Host and Endpoint nodes")
>
> to reflect the fact that the V4M support is what caused the issue, not the
> initial driver support.

I beg to disagree: the bug is in the driver, but it was exposed by
the R-Car V4M DTS addition.

To make life easier for the backporting team, I think it is best to
list both Fixes tags.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
