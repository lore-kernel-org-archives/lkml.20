Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794222648;
	b=mot7SNE3FVAX6gI1hhKR5/chMiVTNXOEaOfN+hQlzPq3UbNVcKEEWBWUhaNrcV00/gAz
	 ev2ohRVbunvcUulHLmWrz3UmOwZe6xUGrcFVgKM6IUnxnsaE5rlnwPmE2xH1BnbANncTb
	 i7Gy/zW1ZoPP+xu3Y1F0IDNT5sfzT7mUkhx6MDz1JoGSuowz48ZWfyQeXvf+wVCoh6Ej/
	 I9TlNRFQ+hQo7KtgSCy3FP5P3vwedYXlszLkampY8JXVfNHVU/5Gqu/dyNJlR8waZ+pb3
	 xWWXhaGYJpcqujmnaKLyL8jWCrH38PG6d8SzWLJgnZ/W5sgsBNkOcUeepP7hI5rbXDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222648;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
	b=hodSJU/MmKhb5ANZRxIKtIzfMsfJX1uByK4+dEv1/Y0GlGx6xJRLsgGWR8BgndqRrv7p
	 qkWz6N23mu0pGQ4uXmh4gc2L+hwA4z64CGEsjCz0LA9fASoUTHaDGaQ9qNw2EU1QBF6rh
	 ZJp2T1pKqM61WduBLyA5CeNcjGd8pt5O9MiJjky+W/yMGzZ1sSiwjlaYPMHGsfIs2nY8I
	 fnyPu/2j/6PIly7BZAxj299sWFOfUp6QyjL7cH4MCnNAE5vpCV9q/yXz7Mku6fF/lcImm
	 KMCLyD1tBoDrObbbXy/9fWX4nS4hAN7DIEhoiGxNzO6YDJFJdQ5XEruInw/TDyTpZdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=l5b68OsS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89797606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89797606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=l5b68OsS
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E8ACC3F2D6
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794222638;
	bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=l5b68OsSoga1Tc/V2WxA4LnSS//BWiPJpGdA0cGXiFcTBlGnvBHORXTaGLL7XMa4G
	 e+I8VXkaAzbWOnSSroPen36IXqwnm+TL0zSWTo3clnKWBnNIf2IkPjc85sxZKprPM+
	 iXWqANQ6gSUfM7u0VcE0pyu8zt6wNtsQgahvZGl0gr6suip1A+Fbndn+WxWEEWYjQw
	 omWLte5rceEpgUqp42iFM4RbuNdhFrKH4dJyqKJsFLyJLYCwZRHttHHim3azjBepEx
	 F9yhfqUw4hNgVLnlD2lBM3YNh5ok0UdnhoNNh6b7IqIGxi6jwrG4bfxX9p0WUCeVgp
	 ePZqS5u6oPrQaG06VdHWR+dfL5TRnpEK44Z6PFkFgqIyRLrNiimtvVRm3nc5n4ZjvD
	 xb2taZU+25gYSxzTrGkVdYZz9TqYWQBSFIqU+diuZDgbJHUjo2RVtBOSlwaJfomNSu
	 kp/GW6Fu6nFcxlBpRJxoEGAImYW/05j1DK/wSD0drL8wuFasa/w37cct0MJVNatX96
	 LxZXyhB0EHVup6u0ykAfTqIxSbSPNszseSddR8VjdmRZCs+hFZZ/hHTLUihHqqJVU4
	 HmDkjmq2dula8Gg/DGsjhtcIexSsJ757M1KfYP9IP9CqeZMHnT23dYIG4FNdX1asrc
	 hX/zRA2F82eS1qM017KND09U=
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c25edb54d22so97960066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:10:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222638; cv=none;
        d=google.com; s=arc-20260327;
        b=PKvGAhSNkXrbchQtEKqNBsNBp7dzqBlOGCJPMJ73Oc9yO2TyqWx1VAYCkGtd6CwL7L
         MuNDTSSRq7jfqM7A+AuEbdXkasIEZn/m13f+nWTSQvutCie/56jYkaPeRoiEyKM5kP5q
         xV4rOYMnYtKbqFo9Y+fIff6+RI8bBW5JMrGKOLCjeEcXcE8jEosN56AlmuQXly/fTL6r
         VqvzkzQ9BoYmv3XlpsEdiPEYup32leRtwUnQP16yoaDxkbPlK8xawsKimPL99iufr0BE
         rWCFIFyTtRMyS4UK4b+M7X7u6l3qa4L5mJvlIbbdbbAETuwr25K/fq6cvKsi4b0Vps3V
         Brig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version;
        bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
        fh=fZbjxYJSgSkCAmsrwnibfP90i+691/TWoNpCPtmeANc=;
        b=lCnsKGPe39ZlCJPsvIMmotMhPbLuMvD4cXZfa22cviEVvEKyWfoLDeJDoptAkJG68o
         Gkb1+Lbf4C1VEkvxcgdwi9vREC7gEjZJKT0qd1ft641qkuCzSWRKyxAOac01WccLmwZs
         /FgdIem8tn6OCyvs5iv51zh/hea3H2FIfckpV00TLCHkcqq2vSlkxtKm8C6gxP5Ul+8+
         GGz3p7AFFgL7Behf5ib3L93QDHTDIXxrNwydYoHNT7syNPIfWIRKfofXetMj5Fx+jLCk
         3aM1CTxFme1dZgfmr8px0h3f0zqpoefQKBDTsE/oBEr0iz2mm/uymS2v9OY5v1ZVh666
         0lCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222638; x=1794827438;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=llvqyMiXnc/47moE8culPRvGGeNKWMoMtXMZ7VTfmpM=;
        b=VbDyscJKOOq6/fnyqIylVMXm7V4ECWQoufJV7rAn5uJE3cmdF2EqoyR6QZtQF27ofg
         /x84FXMwOy03tzGBmMXl7WkdmqAtkrFBmPbzBSB2WWO4IamLY/nKNN6nl34tHWpbpP9A
         MlCh9agu0Dck8bINUfKHUwRWv7cwysZs0DM60wW4vECHxDFFS+oCVSUjJp/jA+dCpNUW
         qXBqHNC2gAISvChhQcxza1k0uKQ7ez3P4/Bcj0HTzf8cMuJZe500JxKLqjjjHPhP0Waa
         xyEfqJTlnJfgqO/3wsXIl6gs/q9WSye90W6N+grgxRW5w52BN5lwWvoV7qGExGgkhFkx
         A5Kw==
X-Forwarded-Encrypted: i=1; AL+hErHAxfmGQcSbg3YTqDKvO7WlE5vuFwzt0gaUuMWa+PSlR3DO9+ExHZ2Y4j9hSL5McrUA2i2g2KbalgfqVrE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+qEgCmCKDoEbsdSj9YEbxIFVw7KO+TDCi8Dw9SVjkrUxvySBNY
	v6sqsbng13CTLuLmqw01/ix92TjINKBlIb/5c2ha2W3EFQXQatW0Vso0ueLO2tCPBb6N7AYeLAV
	BSpogTdUT220NrHTnLrct32o+5fiX8ulgoKRPipXdvBqCr9TIkLVouv5IXOcHM1c+9eWzaLjKkH
	WR5jdy2v9Wk6Q/bft5sn1aeyxAxYKIDJN5pO94yLkL+VfjgA2iBU5l6hMS
X-Gm-Gg: AYBFou3XdYX/lx2zpo+w0oi02tp4fGI0P9jDFJnSnPgnEGAQjGvG0OmgS2XTQGkr8jH
	m6d4K+mrJy5wXyXe8aTNePCDW8/c1dxQoPhJUFFtVGD5baOZoiM/1rXuOPoWndVAM6Er6xhKPj6
	K8e2oKAUJs4xS4AW2LuHIoFYBAVRAahnKqEKhCna491TzufbgWkfU/m6I=
X-Received: by 2002:a17:906:f591:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c4d6daf39ccmr262302266b.30.1794222638452;
        Mon, 09 Nov 2026 03:10:38 -0800 (PST)
X-Received: by 2002:a17:906:f591:b0:c41:960c:8c62 with SMTP id
 a640c23a62f3a-c4d6daf39ccmr262300066b.30.1794222638061; Mon, 09 Nov 2026
 03:10:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
 <20261104-k3-bs01dcma-v1-2-794025247e4a@linux.spacemit.com>
 <CAJM55Z9Yj87hqwMugqRsf_RL9np=KqzCj-J9RyutuWKd-w-n+g@mail.gmail.com>
 <CAJM55Z9nuO3MneQqBm3K2V2SjOXqXsZcDx9pMzVhxMJJ73xc9Q@mail.gmail.com> <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
In-Reply-To: <DMNTD3S9CNW1.1H4CMNHDJM69D@linux.spacemit.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 9 Nov 2026 12:10:10 +0100
X-Gm-Features: AclHuK966um7PTpChOfRAdNHmU0xq_O_8ADd9fyC1m0kLv_yr1nWEQyElP2Eazg
Message-ID: <CAJM55Z_HOuvxNmAi2m3kjtQ3tuYEDNtfyvrcb=F-Z1p6K1VSCQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add K3 BS01DCMA support
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Nov 2026 at 04:39, Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:
> On Wed, 4 Nov 2026 07:43:03 -0500, Emil Renner Berthing wrote:
> > > I just had a talk with Dong from Spacemit. He tells me the
> > > BS01DCMA is the name of a module similar to the com260, only it has
> > > a different form factor and each module consists of 2 separate K3
> > > nodes. Similar to how the com260 module can be used in a small
> > > carrier board (spacemit,k3-com260-ifx) and in a 10-node server
> > > (spacemit,k3-com260-tq), I'd expect to see a
> > > common arch/riscv/boot/dts/spacemit/k3-bs01dcma.dtsi describing the
> > > module itself, and then an
> > > arch/riscv/boot/dts/spacemit/k3-bs01dcma-<something>.dts that
> > > describes the extra peripherals that can be accessed when the module
> > > is plugged into the server.
> > >
> > > [...]
> >
> > Ah, it's called the Cluster Server RV2768of much
> > https://spacemit.com/community/development-kit/cluster-server-rv2768
>
> Hi Emil,
>
> I've checked with our hardware team. BS01DCMA is indeed a module, so
> the "board" wording in this series is wrong and I'll fix it in the next
> version.
>
> I'd still like to keep a single k3-bs01dcma.dts though. The module is
> only used in the RV2768, and that carrier is essentially just cabling
> to PCIe network cards. Those are found by enumeration and there's
> nothing else on it for the K3 to control, so a
> k3-bs01dcma-rv2768.dts would have nothing to describe.
>
> Does that work for you?

Honestly I'd still rather have the k3-bs01dcma-rv2768.dts. It's hard
to predict the future and I think having the extra file is a very
small price to pay compared to the confusion of having
'spacemit,k3-bs01dcma' describe the RV2768 server and then something
else to describe the module, that's actually called just BS01DCMA if
someone ever makes a different carrier for the module. Also it makes
the physical reality of the RV2768 being a server of multiple BS01DCMA
modules more obvious from just reading the device trees.

/Emil
