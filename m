Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792660652;
	b=zKd9Uy//GRzTFN5QHjyAILnbEhvClPjWnr9q5r0PvNjSPZbQR2iAyTB5ggBGbQez7Iqr
	 5+b61VSDoGFEhwfi7YZ5Tz4+Rm7L9XtHHYoJUwTwFkSDuUfqQ4/27bV8RX7m1TOX+CRt6
	 3zviqFRJ0TMQ//XhP1o3WzCIfS67lnwcUpuQZCGzn77J0h6C/IsMvhPPnvIRkX91FnLR8
	 tvDc7ZgFc43dNJDISmXRNquA7DuR5QqXqS9ISylE6UHij7GkB/LTx0WvaIdSC5Bpo+z5w
	 VmtIaBC7kbo4Tp+LPOjDKSJ/28l4G1poU0HhKtYFHGUSVOns//t22YZhH5OxeeZ9u2A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660652;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=T75Ev+zmY9+TyBZeNfZa9ivEcQCv7sC4JnP+VJ1K3fY=;
	b=E2M9DiadMmfChU23R2RdHOKTJksiZ3TlLJ9oCxIGdfln8FCyUVr9aPmDa6XZcYVDHYFb
	 ZZ1T3vIsOmncC8Z9X+TavSxeQfsJu9HggTf39D9zeolnrglOkkNnMpyw+wtdaDLtROUj5
	 X+I9GRwciGb8C7XXcwNfcxC8xG6NTL5iU3YyTlHkZyT2XTTWU0B0bAAoM/TAAqhADXBwD
	 TjEwnXayTFDlu6s/UwifM/8FXVyE1KBZI3uye7MbM2bCGVf6GksIB6VINyicg+XB2nV5H
	 8Idripu2aLyuxLj1pWi+Y3ASdVyEuBN20NNbEiLxEgGebl11IlICEpfGO83kKCFPp4g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=0x0f.com;
	spf=pass smtp.mailfrom=0x0f.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.179
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEC2606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBEC2606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8b0a28a720aso16457727b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:17:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792660650; cv=none;
        d=google.com; s=arc-20260327;
        b=AvHl1RiXAmd+D6SqOisIE0iTPnV+TyKoiJun7OMa0bJ+5AbcTlwCW3FIeu4zuTydc2
         LQsifCthmR0CeB9y6slKqqHyFROP7o+Kysfbxj7LApK3/c+HuYbYncV63QwCOR2qZwfB
         JcUKWoBi8jndZspD5peooS3Fwlk/SJIQTONTw1/VLLuVrux+XbiKlA1KsviIvIYga7DW
         F/fJ2Agd9OiWKpJypk1F3E3b5GQN/28JzpEHMprNv+fWHynXVyVdUFw/yXv1nB/SmuL8
         Ga1R07E1IU07Pcbj0wHvn/kup3odKcz2LHNIA3FRo1Bnl1KVdHQbZagGy4sbS17bLbaj
         JaeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=T75Ev+zmY9+TyBZeNfZa9ivEcQCv7sC4JnP+VJ1K3fY=;
        fh=gCcAhe2G32mSXIgMYFZXorIAa9K9oA/wW209Mo4mW9g=;
        b=gb5KyKmM87vxwAnMtN4wJCCwq6A/sSTqYyK3zo5JRIMJw7q6H4EyzJiLgIqxgUN6L7
         1k5NtvcszgjhXVL6VE/ML4pQuqXiEqZEj5hiJ1nXmUfMgK0ur/f6Uuy45scfitK1+Qno
         s2zPgGI9v2QSjcDGWUQeTFE7xv12Z3lP8tYsqPQBYZ2g/lVxhqJHR1QjWGYwUEwAIUf+
         hNieGsrRvxNU4ErO7iidHQ9nHIkhgTSb+W7nhqQ9C/y0cvzFitLfYSbzRlirdHzSAWI+
         W2nFWLMKyEjIpoZ/wDCHzFfW1ZJ0NYGdfImtLfhPHoApHL89GlZvKs9Gh51R0IcMTI15
         uD1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1792660650; x=1793265450; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T75Ev+zmY9+TyBZeNfZa9ivEcQCv7sC4JnP+VJ1K3fY=;
        b=QS/VIZ4dgQSENDa+6BaYJAzoA5uVw9/TbVenjpW14qvL7kCWLJmEy1T6yUrMG7IJGj
         b3SCPtOwZwfsm80dgzNO2ImjhSOS7GLSif2dCBM0/YMP3shuzQbXoh4j/pcS1jK0Ja6f
         7zAx/FHVVcFAXfvPrdlute4fKZdAjeL2Zc1Yw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660650; x=1793265450;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=T75Ev+zmY9+TyBZeNfZa9ivEcQCv7sC4JnP+VJ1K3fY=;
        b=xdC+kmzkKAYTcQhIMEviYtz5CqMFfiUvQWLliZ0l5fFsgdGUI073u7N5Fho6I9WNH9
         6QU+cJVOfBSk1N3XLsoHIS+V/mGc5Y87nbCIS5o7IHqOLyLVMXfPzBd3P14q+OFlQbAN
         hfAEUX8HjRVCjlP7cBpOJd8if7WEEJgjKSh7bXW6rD1R2gLFeF0nfopW/xrp1XD64IO0
         Mco7BUjE0CzEg6tM3qtJn4oRh8b1N2biWp5+8JCpD8idU1AYqkfBlpiRpf+Tl7d296Yu
         wcTrwQNSBW3jeJ9xHcYfIG2ObAnrUOJZQW1AJ+R24fxspYe78z1EDJk8ytWnTnKYeDpn
         +kkg==
X-Forwarded-Encrypted: i=1; AKwUvBxeKphmj0ms21TnhiiRbO/qFRn71JUgSeEd7MnJeDFo3+4XUm6CElRwCd2zAeyMELfkjo088mtOHq4VckI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8wU7CQafvZ1NA/2pDLqFhKrGWxQc/3ThkpPmlgJ+TS9QGwbsD
	N7BcVWbl6JsndprQJkdDCjNObGvdD2d9dVyCJhFay/LqDoEz1OmMjLCS90fbvYXODFoHY4KsSUc
	UX6Iptp2c5kr6xFIfiJmmY2KTp+n5bPF3dUDoZIqSVg==
X-Gm-Gg: AYBFou2Hk3m13Bs+wkm2fL2CLVJxVO/allc9hzSG9/WtBRu6VfjI4Y9X2pe74nRNPe+
	dcrMkjFDZEHAWz5H3xldMEE/tBjmNZh05z/ZHWe+Msy2TCjR1sZlVjfCLfz/S1OmAatjLUZvhPF
	yG423wKFo9sJAmsZ7L2vGRJA7I3FbDzCx+fiVoT4ILQmwrx0Wa54h85a8qxGAU+uS96NZUoDmAl
	Fp4yo7lbzdQxIy2yEYZXsKhYo/VcxTFsp9Lp+KwPxnPpEJacTMjJS5HaS1HPibGstid1xp0GcA+
	s2aBcv9lEK+agdZboV5778j9GiYOjwMe4tiLDnKPjonCiyxYOQ0+1ZJzujwdsxyZNOlPmRQAUqM
	9XD062h/a1XdlYOJlnSGYbN0HbOpvDH54kOF6avqZ5LiVPrMs02ox0dUkGWp8
X-Received: by 2002:a05:690c:6603:b0:873:5c7b:c102 with SMTP id
 00721157ae682-8b133f865b4mr28955697b3.58.1792660649848; Thu, 22 Oct 2026
 02:17:29 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017041419.311921-1-daniel@0x0f.com> <20261017041419.311921-2-daniel@0x0f.com>
 <3f657b75-64c9-442b-a609-987cc16f5501@kernel.org>
In-Reply-To: <3f657b75-64c9-442b-a609-987cc16f5501@kernel.org>
From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 22 Oct 2026 18:17:18 +0900
X-Gm-Features: AclHuK_xkZziVetz0qA3HvsssgwelX2fb-dhEKVmNQmS_hEtJeTxKXJZsKa-iK4
Message-ID: <CAFr9PXnNKfZtXpBe2OVZvu=rf+fsx5NEp7tSGS_FxRKsL3+wQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ata: pata_artop: read the ATP865 mode register
 through pci_iomap
To: Damien Le Moal <dlemoal@kernel.org>
Cc: ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	cassel@kernel.org, linux-sh@vger.kernel.org, linux-ide@vger.kernel.org, 
	geert@linux-m68k.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Damien,

On Thu, 22 Oct 2026 at 16:01, Damien Le Moal <dlemoal@kernel.org> wrote:
> > +     case 2: {       /* 6280 or 6280 + fast */
> > +             void __iomem *bmdma = pci_iomap(pdev, 4, 1);
> > +             u8 cfg;
> > +
> > +             if (!bmdma)
> > +                     return -ENOMEM;
> > +             cfg = ioread8(bmdma);
> > +             pci_iounmap(pdev, bmdma);
> > +             if (cfg & 0x10)
> >                       ppi[0] = &info_628x_fast;
> >               else
> >                       ppi[0] = &info_628x;
> >               break;
> >       }
> > +     }
>
> This is really ugly... Please move the "case 2" variable declarations to the top
> of the function so that you do not have to do something like this.

That's fair. I'll fix that up.

> Of note also is that this switch does not have a "default" case, which is really
> bad practice, even though in this case, we should never hit unknown values.
> But I would still prefer seeing something like:
>
>         default:
>                 pr_warn("Invalid driver data\n");
>                 pci_disable_device(pdev);
>                 return -ENODEV;
>         }

Can we fix that later or should I roll it into this patch? Being an
old driver I think it probably has a bunch of preexisting style issues
that need to be fixed but that seems like a separate issue from making
it functional again.

Cheers,

Daniel
