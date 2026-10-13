Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAD73A1685
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 07:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791878171; cv=none; b=SQOGkJxkjI9Pw4oW9OWjzCjUWiLNUQzKUfTpA9zzsMtioh9NsYoPllQYVRD9Fc1MKJPA7Ycpc5s27RQclira5cStdRSJEhM30rW6PrnfB0apv3cm6WxlOWhXx8QFKeyaIOXAHclMNPk+o56IJpVEgwYBrYnyDHZFIvke7DFyRxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791878171; c=relaxed/simple;
	bh=FPqUzrLz5+Mbic78aW+tIjOGw4jxHiV4CV8UNQpyUKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PRiR8tzweMks4XaGnUEYU0BpEIHmrl9dJYy/czcCRVQAVJZV1teOpQa3qUvV+YYq1BgSTG4PO7h2pA22P2PtyCTFG/F+gKTYBtHoIyLqoZuy49RPJbTunNaM8vmS56NISJketfvFqIlbr64Neg6Zf/EQOfyQIt/YAkQBsdTEqbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-7c4818e4165so2271775137.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791878168; x=1792482968;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9fAWZ7x6Dy4YpG9Dduo7Jtd1E0y1cfkP0evcWuU7n9I=;
        b=JRR4UBTG+0fCe6JeWq1S82VQFdiI45cLTIy/gxCjh4tNepDOVXfih9YhGoYkOnBrCm
         vU8jXvr+icQLN7miqb/+Qa4o3FIw26MSmDVaipsuFepS/ciUBgVS9Cc3NPmVU0T6XR8G
         3oZZYbWaCBl1j0FLUTVfDbeN0LrzXt3zhJ9y6Zs7ycV9jE2mD68ptK6HOGSHUS4N9/2v
         LvZWtMTWr0fNI/a3sQy7OIdevKq2XVVrnMUl0E+GwyA0J6NamGIFGiJ6hl3QACFtnIFb
         9suB6tUQyGSWSApPUH6CM5UPFi2F4TsX3ChaB9gJWBJTTvt0Njz1fmrI6GvW3leJQsWg
         6n8A==
X-Forwarded-Encrypted: i=1; AKwUvBwtjeysombEuGupL0BB2WWHhs9OziCRpfMjSb4ZODzhtMbGbBDrtPYnyVnfMypGzR3lFnfUurZ+thKNPmA=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4NuPfR0AYvHbrL44ZyjFycg45sFx9Km0r1tPPiYGs7KvSlFOU
	/f0LeaLvD96fFu9biXq4X8tIn6iqLRKOeQerN2tQwxlLCJvQx8T0ntdctTM/gL91
X-Gm-Gg: AYBFou2j3JoYUik2hSCmxFX827o6XEmL0qoMcuPIo4sSYmrwOR/fsXMp60uqvkqAhsy
	p2QgEmjfO9/vnF3OnbrcOqhv2PzHRGNMVUuLKqq/FeYouMXi7KYDUSSeCIo5t62GuaUYFxb3ZNc
	71gYqqQfPEjftm/84Qtht3ttrnvd8S+MXjoNH5OjabbAmO/sWLFEkcJuKRA1QuiRaRT+yosClAz
	eec76YMsorSjTcXI2qbDR+iquTatZGpilkUMlBiKjDKGyFEKMhAWfDqnJWyAL2tv7i7h9o3XeK6
	ruD63aq7QM1MgmPJpzStX+gCVhNgitd99Sl/GH+O5tYdkOoQuVJRgwPk+2R4Bj7UD3xf8StTDvQ
	M/CiM3u+B5Ki5iOuaOlOtz+wHucjR2W+xk7vPrMcN/Dm52daUq6HT3CRaCb0wQL68pCQWt2gZXC
	HutmC6chY42LOZy+8cAgYAo7Yty/X1O2Q+5VTxkffhxo/ZEOVfa1uvLOKhqRD9yoVFyc97qm4w1
	33WvdtRlYAtWnoQPMo0GnHzrR5jlk8UYaeH
X-Received: by 2002:a05:6102:3912:b0:7ba:b5ea:c4b8 with SMTP id ada2fe7eead31-7cb423873f7mr2424731137.1.1791878168213;
        Tue, 13 Oct 2026 00:56:08 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cb354681e4sm8418577137.10.2026.10.13.00.56.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 00:56:07 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c33cc572e6so1919830137.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 00:56:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFBkg4B5aV9jI4hGMM73b015MoYn84pZ7088BDGvS880ODMOce1Yct9OHcjNj9Gh8dcG/hjPxrCVgkCNU=@vger.kernel.org
X-Received: by 2002:a05:6102:44c1:20b0:7c2:37c5:dd21 with SMTP id
 ada2fe7eead31-7cb39ffa0c0mr2123690137.17.1791878166862; Tue, 13 Oct 2026
 00:56:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aslAEm5Qsgp-9xD9@sirena.co.uk>
In-Reply-To: <aslAEm5Qsgp-9xD9@sirena.co.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 Oct 2026 09:55:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVRP2RaDvX1-usBjiYUW0sCaCccd64a=rAH-LubYMkTyg@mail.gmail.com>
X-Gm-Features: AclHuK8bLxOSxcXpfIpgmHR08UPT6dIGR9_XUIdBL3o1cXFtPLMptGHwNPscJlA
Message-ID: <CAMuHMdVRP2RaDvX1-usBjiYUW0sCaCccd64a=rAH-LubYMkTyg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the pci tree with the pci-current tree
To: Mark Brown <broonie@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Lukas Wunner <lukas@wunner.de>, 
	Priyank Rathod <rathodpriyank@google.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 9 Oct 2026 at 21:36, Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the pci tree got a conflict in:
>
>   drivers/pci/pcie/aer.c
>
> between commit:
>
>   79c168e2aa957 ("PCI/AER: Skip error recovery on false alarms")
>
> from the pci-current tree and commit:
>
>   d4c842c3af5bc ("PCI/AER: Fix memory leak in aer_recover_work_func() when pci_dev is missing")
>
> from the pci tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
> diff --cc drivers/pci/pcie/aer.c
> index 922a726a52a50,c376c3adbefd2..0000000000000
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@@ -1393,15 -1383,15 +1391,21 @@@
>                 ghes_estatus_pool_region_free((unsigned long)entry.regs,
>                                             sizeof(struct aer_capability_regs));

While your resolution looks correct to me, it can be shortened
by inserting

    if (!pdev)
            continue;

here, avoiding the need for breaking long lines.

>
> -               if (err) {
> -                       if (entry.severity == AER_NONFATAL)
> -                               pcie_do_recovery(pdev, pci_channel_io_normal,
> -                                                aer_root_reset);
> -                       else if (entry.severity == AER_FATAL)
> -                               pcie_do_recovery(pdev, pci_channel_io_frozen,
> -                                                aer_root_reset);
> +               if (pdev) {
>  -                      if (entry.severity == AER_NONFATAL)
>  -                              pcie_do_recovery(pdev, pci_channel_io_normal,
>  -                                               aer_root_reset);
>  -                      else if (entry.severity == AER_FATAL)
>  -                              pcie_do_recovery(pdev, pci_channel_io_frozen,
>  -                                               aer_root_reset);
> ++                      if (err) {
> ++                              if (entry.severity == AER_NONFATAL)
> ++                                      pcie_do_recovery(pdev,
> ++                                                       pci_channel_io_normal,
> ++                                                       aer_root_reset);
> ++                              else if (entry.severity == AER_FATAL)
> ++                                      pcie_do_recovery(pdev,
> ++                                                       pci_channel_io_frozen,
> ++                                                       aer_root_reset);
> ++                              }
> ++                      }
> ++
> +                       pci_dev_put(pdev);
>                 }
> -               pci_dev_put(pdev);
>         }
>   }

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
