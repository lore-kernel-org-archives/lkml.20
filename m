Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com [74.125.227.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D45420469
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 12:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791031979; cv=none; b=jPEHdR6dnfbW5C0O6zzOkG9KVNgpLe+Zs+lYHugSANs4vv6SF90587gGkWdaNyAKJVM1tCILEUigasoEBAUFeJIsW61Shq7QlJh5UTpMWo6Ab+hqWVIwNRt6ai7dA9Zr8jBoOhy0APfJKz15O0t4vOu5if6A25oDPHYM+kx7K0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791031979; c=relaxed/simple;
	bh=v+jwntNOMYJdKRBzEK88YlkJTtdZozXA5YAwPWxDfdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gajtmw+vjrpvV41z3hGKJNxv6uJ62b8OhKYrs+eeoahbV6y413lb9xFx/XwoZTgvuFA555wRCMRR6Dhsno3T9WiVcdopx4GYErLFCLHFFEszpnrawAa9HBhr29dFGnbfxz2X2ZmsQ8Rw9wPJd+AmfWEJaAUomxQ8xS2dF/ukGn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f37.google.com with SMTP id 71dfb90a1353d-5cfe8de4f54so266612e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791031976; x=1791636776;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Wz/vUQeiU0meQrL5M8qbzU31TXMfocPVY9f/7xGtNm4=;
        b=O1OJxnxE73PIFO0dZ6wrxj4T41LYV9HQh71Z2NVTewkTXAs+pW0Ol8VVYmUahbTnao
         Oy9YV0lpFDvlWROSq8/Dz8E3CYm72B8A3S1rTwkOcYXFBH/ReUp1T30GDnzBBpVRiLnw
         K+x/NO2f6n+bHw3qRIv2bebMV1DOUE184Ly9PyGiegnBZ205xJJz6riBad1+KfEMA6/P
         hOOfLCCvCGLgvilLiLLlhdHh3aW8IWAiF2gbuSdm3B3QrA1WHG6rMhZ7pXDzjfdkHvcO
         EGoXqUWaSPsL4Mya8AgKm0f76Kr+CWvXvspku25pPsjhS+V4uU8QkBMMFzatGjqgDnuG
         Dyug==
X-Forwarded-Encrypted: i=1; AKwUvBzzHqaKSe23bgckPKUQFKaiURAdm6FsNhVIfWYQQKAL3vs8lIlG9ammTxEid4LAlQcPQ4DUJ9NDbJTciqI=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/Q+35SE7c7DxbvwAqOqS7URkiJzJ2a51AhCZV5JQEj9PRnFL6
	IVY1tAdLuGDY//kHRnKWJF6mZtFZ6SXhiTDU9js6wj7MsRAREs2dyUYDreDDmb0QoQY=
X-Gm-Gg: AYBFou1rkrxPkQ6MaDejjwz0SBt3UFzo0mZNdRhSmscw8ydel+p2Ieo45AkAS4U2PNA
	xK8zO33x6hkC9ELwEjAEXyTFeB+h82ZRgmNZETPLB1sr2A5tsugtlPjnwc4wjbQxf3fEidb5kUA
	l/aHPiEgzJA4wYv4ZsbmsS6TMV4eAobSQ0ghlyh6p77mTkNlZVfoXMRQ8767gZfhZs+oqtRW610
	ouciZQjOyc6BJS/RIySjk0aSMElGNzzL3/gfFrJQ8kvIXNRoS5XXu0o8eXQ+nXoqMfvcxA/ibBM
	FkPtjKhXDvGeCW4U5I9bf5oFrmORgBVb/m19Dxb5mUzNX08v1UuiLxcq06CxrOSEyMQ7T4zyy4r
	TO2w+7rZZugLSRkRwiKGJ6AP3FB92byk8N/oNekbXdkgUagkd32hg4O3i/LrPUtdu7erGN4Ve41
	DGfeAvAisgEkgog8LN3qkT+67x/f6PGWmaO/4nIqrIFtf2Yvg9qsl4vUv4pvFPAQZDcD5/Eudom
	s9bxlyiCAv1DJUxEGOhQWgYC6W+vSi79ORvLkLSP/UylXo=
X-Received: by 2002:a05:6122:8d5:b0:5cd:a394:eed7 with SMTP id 71dfb90a1353d-5dab28cb4ddmr2078964e0c.18.1791031976150;
        Sat, 03 Oct 2026 05:52:56 -0700 (PDT)
Received: from mail-vs2-f35.google.com (mail-vs2-f35.google.com. [74.125.227.35])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5da61112784sm6893657e0c.6.2026.10.03.05.52.54
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 05:52:55 -0700 (PDT)
Received: by mail-vs2-f35.google.com with SMTP id ada2fe7eead31-7bf947fae49so173003137.2
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 05:52:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxAv6h2SkPtWmy9jG0dDn6/HttjwCrTxCfPFk0MLdu8rVRqC4vhv8O1jCIL7e/FbUbO4SLNEC1TXqyxb5U=@vger.kernel.org
X-Received: by 2002:a05:6102:e0f:b0:7a9:f088:14ef with SMTP id
 ada2fe7eead31-7c0f46870f9mr1638667137.13.1791031974398; Sat, 03 Oct 2026
 05:52:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003082833.21511-1-kmehltretter@gmail.com>
 <a4dcd9e615dc4e3c98c00e75cdd0c7fdeef02254.camel@physik.fu-berlin.de>
 <e3c88969f18c493859f7c382db7ed2afeb15b4fa.camel@physik.fu-berlin.de> <asDOl5bvtlbauh9x@gmail.com>
In-Reply-To: <asDOl5bvtlbauh9x@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 3 Oct 2026 14:52:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+Z504HZ3N+oRjAKQWSPiNDVEtEX-wShV-FGbMg+kkYA@mail.gmail.com>
X-Gm-Features: AclHuK__UZnxPIRNyiBJwMilVEAnpSvwJO3EcZnN4TsogOR7Tt7txkrTbZOyzBw
Message-ID: <CAMuHMdU+Z504HZ3N+oRjAKQWSPiNDVEtEX-wShV-FGbMg+kkYA@mail.gmail.com>
Subject: Re: [PATCH] sh: sh7785lcr: register the PCA9564 as I2C bus 0
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Yoshinori Sato <yoshinori.sato@nifty.com>, 
	Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Karl,

On Sat, 3 Oct 2026 at 11:51, Karl Mehltretter <kmehltretter@gmail.com> wrote:
> On Sat, Oct 03, 2026 at 11:38:43AM +0100, John Paul Adrian Glaubitz wrote:
> > > Reviewed-by: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
> >
> > I have to admit though I don't fully understand the description of this
> > patch. Either I don't have enough coffee or it's not precise enough.
>
> Thanks for testing and reviewing! I agree the changelog doesn't explain
> why -1 is wrong and 0 is right for this board very clearly. I'll give it
> a day or so to step back and submit a v2 with your tags and a better
> changelog.

Perhaps something like:

Before commit 44454baa7ca7bb57 ("i2c: Dynamically assign adapter id if
it wasn't explictly specified"), a negative ID was replaced by zero,
and I2C bus zero was instantiated.  Since that commit, a negative ID
is passed verbatim, instantiating an I2C bus with a dynamic number.
As SH boards still use i2c_register_board_info(0, ...) to register I2C
devices, they rely on the I2C bus being bus zero, causing registration to fail.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
