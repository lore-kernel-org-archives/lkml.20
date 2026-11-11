Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794393865;
	b=LKqXRlvEbkyybSJDb4fKtcOOeA2vxgzabGWZkLMM6TsROkMv2PxxG8iVB6wZIfnrs89x
	 iVwYyx0yo3XXamL7Syx8YHMaTKrK00brMUE8uutEBrnTsi0+qsGpVvgfuRssFRzdpBZGM
	 lp49lRawOMhOheZ9e0iUz3EL70BQWx3XRubmjZjm3DsPRrCcHHUwEJLyyKj632YhW4ry6
	 Tnmp1Y2wQBSvIKuZ/t1AaJsFXQEXdnOIRiCEKAoLalilp+6F9r/qw8iyi5fLAtqI8Rz89
	 KVEP/QPbV//K4KET4T9ws5/klej1Hh3IvPvz6g3k/BTQN3Tj3ziqdZlDQVnlrfUZV1A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XDltiKjGMBTBW0kCAum/jL7npP4ychg3vu8xCXEIE5Y=;
	b=OMk6xUzc26H5kE3J5rhtgfuWsVU+5qg14Hsd2YMxiYrH+H4mqgtI+NTzgjAKulUNqZNf
	 VZjOkAuIBckHHslqiW9fXI+LY2+gfMoAFgGRT1hWzBbAeToawkLYYKMcFQtPjlFfZdgRK
	 hSb5UZhrv8kRltiamTvTqGcWN54MrIbFGuxFjWZZ5KuM8z2UAHjcMdafWgFVYDMVJeX+x
	 ti92gAASxQZSKim77lnt6FoKz/GRxD/9Tk4kg6kyhMo16dFj5rJTanUoWcfXqnSiMnO79
	 hFcy76gcK4b+PZtTfB6iL2E1wSEiF/KjSYpBG8+VElPZdPgb+wVj00DrdvUH+uMx24A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fs8YFliw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C5E606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:44:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8C5E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fs8YFliw
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so38349395e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:44:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794393863; cv=none;
        d=google.com; s=arc-20260327;
        b=frWoYWbkCVKZIOtCfdACG2HZdJX74OC0cLDgafLYYHAPC5LftWibI/6M52wrRu2anT
         NSiETKNVbeGUwZgM9o6KU1fiNtDi1IAUAWeSGsWQSjLfW32NQ1v+Ef6i4lSp0U8LWW7Y
         +rV+GflBVjIIjzDj1Aq6lZszdl/vbD8GFZwMaYm8Fe/gd4ilC7CRrHIVNTR2w4iwF56/
         4ELF0kr2aXoHCR3VgdvTchM1LcBuH7QBbzaKUM5ICp8zg6XDKYkHbj5JNJ6mszJkZgrY
         OIv/Jr7rVgOmEuBZrfwhZ3k1p7+076VuVbJ+fK22phDpaftMTQDCivE07rOHbboJioIl
         TdAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XDltiKjGMBTBW0kCAum/jL7npP4ychg3vu8xCXEIE5Y=;
        fh=ibL00Pn7aAS9T/MlR55GqD74mRzJX+bdalQBwWXQdEE=;
        b=dVnbQd5iQDVLIR0SiDQcbVd5tQL014xbmkDlG0jqJPnNaSg7xEIQWwFBL5fGPh8ZrM
         /BNNUNC4IjnQpxXQ29PDA1mzSNs423pfGAypRAetUICgDb2Mf2XjbHMDKVmyfmKVdXf+
         oEe+WQq3sj/R4EbJYX2Na6/5hxY7wnP6ZEzm6qr1V6EpCxuDn1HneLKZtC2ymuyXS1xw
         Y+77imJvNL5Afp2CPrQ6sgkI7Y3uzcUzRkPQhmlTokXQOeitAjZyThNSysz7Q0DKR3d0
         nxKDDu3JbqMPOSwbKNmODoORkjLfgPn0PoZt+VltEF9y+8NHh88wszQ/qO6qwd8HBo2O
         t3QQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794393863; x=1794998663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XDltiKjGMBTBW0kCAum/jL7npP4ychg3vu8xCXEIE5Y=;
        b=Fs8YFliwR0dE34yAPVXf0YnsrVCXForfvJ5syM6fGnqXF0TTrrD5zLHNLZoIj967Wn
         RkAiWlwsQ+st7JAel/3WbkKBe3YGM5XueyFFIrdx2dWshV1w16XKa0uRdcaYj0ENjexd
         RyOynvqSjSfduPmadS6ldC1bPwlAaUW56tFRBvyyJ6zx+maDOCLVHqCZHRotfKppcOvW
         GVtKM1+P/6pCmQOeLmBtcl+lbgnKIWaIjmgPB622r7IrZGKxMfaoTw17fX2o9ZO1ABgp
         /rEM5vemp+9VtVNA75SbpJMAbgJVCWY6lK53nhEfMpprCN1m2ArawIwFpZRa9e5hXbKE
         V29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794393863; x=1794998663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XDltiKjGMBTBW0kCAum/jL7npP4ychg3vu8xCXEIE5Y=;
        b=eevg57AkrNLFVRu040FnQpWr70tB6nkn0bulWPVVzlIwNzYd/w8RtzSFDuwjEtAp0i
         DBqtf4GXwgRAZbF/OJ7jRyOV+7sd/zIK/Jq7BJw5YsOMTu6zxQL8w8sMxhkAYa9w9zwK
         sFNQmGUOMO5aGz5P0Rjq82TnYZ+4ylMKKNWc3Xv0Y/92/TjjbzYrLGSRk2Z9ajjGuzC6
         Wsemr14BvIlJLnqRI/+N136818BRlBchd8Fe+RXNllzHQcWxVgq96gnrLlBj5FL7IobJ
         egSEtaoxA73oZp7W6tdpXjnW790MUEbPCPHzveoG1Vfft4cJDzEU3Bld/dtRCkLp0ID/
         hoKg==
X-Forwarded-Encrypted: i=1; AL+hErH+7tDdjYbCK1/CSo6hfA2Ey1qzym5a8TDRRXqcxxr3ZPCFiZ8hotelBlnB10lrXn442fuTFQyqGPBWarU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YGRJuu//+FKEByKtu4f0L7KMcW3pCCUHJ5FrkrMqRQhzCUX9M
	cCrbbuR5F/Rh3Br+vuR8VvP2EI0LTNoWgGrl1NSxU7nr7rymGwf2COeAJ9xy39jlp1LshBlfADd
	6Sxd4AJXfC855TXj2Hpt8Ar/6bFxvQ9E=
X-Gm-Gg: AYBFou3Ka8jxngt4ArI90SFaGS2TFyxT2XvKZDALXABwbCgzkCyUANTDkn19HZuLesS
	WdYQVMJ3WkF57aPBSEtKmVb7Q+zGG6W03ukuSwXHWPGOhNLajD25BUzQtqxF6etuN0XNBRctzWJ
	/Bzqr4LcDwFNsY6V9vs/N/rrERgBlVY/KXqYDaosOEDjt/Ga+tEdZrSyGa8VmMHL7HhLYtb0Ho9
	1y60AHnsozQjOvGiApXivFQ/J0swNt3XSAXv8/9TW5r4Efk56niUuS9bD1x45hbXYlSDEmTF3zE
	5mBm5MvlATfZLA4mdr5DGPlRfs8PN0L1lILD2JQDTQ5drPfDFsMf396u66iGqhSZWcEaiCn8hCa
	yRQrz0KkQn/JC3YK8RHQIVEbqXi3IpJIrior4RfQIbIs+I0/tZ2NjNSQXwbhEcbpvy9OJegmq9+
	aAM66QvIneYIRDSxqxg8wJHvk/lUUTjbKnHwfAefQUIf7IZ832D/LqLA8JEmVF45V4iTtiqRIar
	zhTMOo=
X-Received: by 2002:a05:600c:a00d:b0:4a2:1a:a129 with SMTP id
 5b1f17b1804b1-4ba093b7ffcmr37431285e9.35.1794393863111; Wed, 11 Nov 2026
 02:44:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMRc=MdcWS0c9E0V3cJj9B9WMAe0vSs9e2s2EauRH5zFkOng+w@mail.gmail.com>
 <CA+V-a8uVxwP+AFbRYb-weN+EHQ5rFxo7gXPus4muSrMri1QAAA@mail.gmail.com> <CAMRc=McjH1CE9wZpqWVWOa23oQn-Zxsq64akB4FgW=dA28vGTA@mail.gmail.com>
In-Reply-To: <CAMRc=McjH1CE9wZpqWVWOa23oQn-Zxsq64akB4FgW=dA28vGTA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 11 Nov 2026 10:43:56 +0000
X-Gm-Features: AclHuK_vtK80w1Fs6m3xd960NvDg0_oPO4I0vQEHXEfEWlJLombO_D83MeFpWaU
Message-ID: <CA+V-a8uERLULKgthkRu87eqCjNPexNi9sUKz_6SKx-y6WNq-OQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add ADC power sequencing support for RZ/V2H(P) and
 RZ/V2N SoCs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Oct 15, 2026 at 1:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 15 Oct 2026 13:05:10 +0200, "Lad, Prabhakar"
> <prabhakar.csengg@gmail.com> said:
> > Hi Bartosz,
> >
> > On Thu, Oct 15, 2026 at 10:43=E2=80=AFAM Bartosz Golaszewski <brgl@kern=
el.org> wrote:
> >>
> >> On Fri, 9 Oct 2026 18:57:05 +0200, Prabhakar <prabhakar.csengg@gmail.c=
om> said:
> >> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >> >
> >> > Hi all,
> >> >
> >> > This patch series adds support for ADC power sequencing on the RZ/V2=
H(P)
> >> > and RZ/V2N SoCs. It introduces per-SoC probe functions for the
> >> > renesas-pwrrdy power sequencer driver and ensures that the necessary
> >> > Kconfig options are selected for these SoCs.
> >> >
> >> > Note, the ADC driver and binding patches have been posted separately=
.
> >> >
> >> > Merge strategy:
> >> > option #1:
> >> >  - Once the pwrseq-renesas-pwrrdy driver is merged in only then
> >> >    the sysc driver can be merged via renesas tree.
> >> > option #2:
> >> >  - Merge all the patches via renesas tree.
> >> >
> >>
> >> IIUC there are no build-time dependencies, so the pwrseq and soc parts=
 can be
> >> queued separately?
> >>
> > Yes there are no build-time dependencies, and since renesas-soc is
> > closed for v7.4, the pwrseq patches can go via your tree.
> >
>
> It's rc7 so I prefer to leave it for the next cycle too.
>
Gentle ping (the patches apply cleanly on top of next-20261110)

Cheers,
Prabhakar
