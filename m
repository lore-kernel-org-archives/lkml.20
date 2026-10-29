Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793293179;
	b=FbqAqctR3SUrJRt9CWp39lEPo91QQDSpGbDtxrq1lrwRl3BeFEiH1hQHCPbKrP9AsD1u
	 4svSUv483XUCA8TrA4rkk6OzSwmUXPsq5hatrt0hakD2YCpDT9+h09FTeDyac7thV/nO6
	 nvo0gNAaYp/mU6hZC0yIW2wO7PB8Jkg+V0QOS86iu7qcHu1a78bDD70aXEdE2dH4xiRqM
	 FHq1SE04dodR4slSQWA5XjYKpiz+3eVA8Szdap9hmIxocW543hEq12XFEKiK1pg9Rn7gU
	 KBnjUCsEmwoDH+Hn3CE35d0pLQb95G6HfybPNosu1jnCWGIbP/rpmEyTPMK8Uab5g2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793293179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TMKRLZBe9Zxx6OkgvRZd/gzaOpd1SutD5pCKyyI0lvo=;
	b=3VV401JoSnzHz+D7AkxSxD3UsLWtFBXLbP1lB9n4wrne9nO3i/yIifNW8GMKra1gw6d5
	 5vOZehvz1G9bArmHDgXGU+pDSzuQgKd8Gb0sOp/oqngUgGoOrU6RPMyT9iKZWC6ZS3x/i
	 FzgpuZCkffkrsXMopSWpB48jrS9owGjSasGu7p4anXDg3eSJI1LklJBUAGCOdP0jXYfA9
	 HY9t4s0AArF/r15lYlhfA+GdSWNPVxKlYGw2uO/vb6X4dP20nt2UmjQc3xLA5KOaBUt6B
	 j8gPyl3/HLMTESEiHo9NK2LDd9tP03KdfE8ZjnNSoKDIK8xxdBdwbStT1xpiqtTygLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="w/W3r7N/";
	arc=fail smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B710606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 16:59:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B710606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w/W3r7N/
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso406834466b.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 09:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793293177; cv=none;
        d=google.com; s=arc-20260327;
        b=bhx7NRWqcacj8tcWemVj4WqRicuRJMXow7LheJ3TsgJxgsT0oQIF+tNso2TF1nKeb8
         1BMhNarQcy4jSYclU2/agGYAOXHVC1h/BzhCYMP2dNr7qftCglxClsq9E49f6BzIe3bi
         M1LlwYaWC7b7fkZ5EeK/58gNMFLm7Lz7/jyqRlxM4dfXcD0Nhp9iEz+P9L0tfZPknePP
         1VVCSVPrVjT4W98BbtMIHRz7119BGPzfWq4rLdK3oKlDCqnaefVnu2hbQRnsRHeM85VV
         T8DjUCvpqBhyHfLcTSkfYIjFpZ8TB+e1OR6oWxLHkbBJVSsU3+EtfeZYcDAUCd23Yexa
         s3XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TMKRLZBe9Zxx6OkgvRZd/gzaOpd1SutD5pCKyyI0lvo=;
        fh=FBjp1oH9fdPOQAhap+gTXGLzQLlBFFQ5eDIBBSLIaSQ=;
        b=olSk4rInMDidhbFIvU+PO2ikbAEFn5QJ8i/P8G2fGmVc/2rg22usRAxsN4vvys04xP
         cB9TLGxv3k+ku3gktjOP9yyengX6hObRsyPtmg5hFSzMbdaBG/wHgjO7tmT7Z73M4MvV
         BwEQTjdDnhtbNN8iH6/uBEEkwwg8bGUZa4q/eJEIz2qXGShZey18TAMAS8pTrOfu3WEc
         gPS7rHW5i2R96Cdnb1+U2Bsu/D3QJbIJJXIBHa3DYQnEiWazrI54RTMhnob9fNdpJr8u
         tELRtLXw0hNT24zzb7z3XBGdP0TImzl1oudRdfB+YHAVU0w0b4eMBZ6YDPIDGX4mgY3I
         H6tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793293177; x=1793897977; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TMKRLZBe9Zxx6OkgvRZd/gzaOpd1SutD5pCKyyI0lvo=;
        b=w/W3r7N/SJr54wDY1L/oCQ1C9mPzgXlh6wwRdJP0grwX/zuDPX9RiSp0M6F/kkt2PK
         ukEw0OavBDLUyYCHnzvmXZBeG7wvOtNnJsJmWLQyOb4iT/5dcOJl1TWC/WgG83/ZnzLk
         VhvPuu/Czm7XtDeSuHHTO+evFYN25LJlce7P1QJasKKOmay66IPleODyV/HSj0JH8J3P
         KvJJztkfPFVN07G+lw8LWo9rU/OKLBjQih8q/XKA3GgD1OQcQSI2sA/E2vCMwzLaEKQ9
         Hsr6sC9RlMZrKQ7+40zq+ah6k4NuGer5STNrkqm8FbbaYqoK8KnhESxA7aoN7hK6tH90
         YOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793293177; x=1793897977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TMKRLZBe9Zxx6OkgvRZd/gzaOpd1SutD5pCKyyI0lvo=;
        b=Tkc8BSOKE6tjm+m5Im9gBGNUubAzomL1yIq+zEoSN33lK88ZpsehGFAcOQtPBfay/N
         N1mccnmdt+dz0wEKD9Se1bzA2qtGvKz248Y1XO04rf9Rw8AxerWCcnKUfV87r4kMPXej
         xqaOqhKne/077Oi7lOU0PBSlZJA3pIIeya4OanQ98fBaHyEpfW9mLGsRg+1tTOasUPqc
         NEb9uJYy5B9YWyyeuocWI9GXVLhIo0qbaVSpWKTNtHhOuwIU+E9vn/P7pH53tzxPdcU3
         v9ML1t2Bbm1kExhCSx0EDeQCyQPf4kUhYA8FANp4CKkxWHZCQmZ1lSwBUx4IzBt70fus
         zRLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzFN1GLVl/2FxGQKIAXutPpb9YVKA02shebU5MSK2GAMejELc6K9vXULSC2NSfr7ySNVrAECmyc1qDRXyA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKhWugsBkMoXT8NEBr4wRjvxWco3EeqhJCktPrhbP4+sF9twV9
	vK8QFoZ8A5n0iYh/q1R8VV0K0LRQtvkmSJnQkjiHevL9ZK/nJKJYX5rCTR5h4nQK5qQm2p1mk5R
	u7XdeeIxnO43pYWP5aCXAmgTb7xgxmss=
X-Gm-Gg: AYBFou2gyw5xETstVbyULTwoA3p+Sawr60dz2U4/0Ilj9l7NmvX+PgOpPAM1FzlEJdi
	rrisBgggpKo4CswQPHqLbzhK0BJzVJ7YfnfUnwqrME88I7TtuRRxKYFbZOZs3FogyoPo52pP8Iz
	J7ukyRXZrK9lCfdltSJsHr1lKZ1mHUPR25vdnkupsrjvZ0WU5zLKewYcixBPuCkH8abX/sKgzx1
	39oBtrkx6g/e2ltCdB7b1X1hFHNzfAKg3QIFeWqkOL5jk0rYyC79LIRXoqDoazIxR6yGhzPdw1C
	HuwsLQgrui9m4m4HZjrP1FXzPXHtRP9u1tcZdPDf5h15vvye1uOtqJyF7E7I5ux0Yf8pFXdL3PU
	Zsegz9UFOCCHqi9QIfNlU+42hJss4GdA3Vq3ZVJ/jZMsUkpqoVex+laP0wZShSfPTq0Fe
X-Received: by 2002:a17:907:5c1:b0:c34:e9fe:82ed with SMTP id
 a640c23a62f3a-c49bdfb8a28mr524419866b.28.1793293177297; Thu, 29 Oct 2026
 09:59:37 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026125751.1700779-1-stjepan.poljak@gmail.com>
 <87pkwv385p.wl-tiwai@suse.de> <CAKVkeTxg4LWANUmqa4rzC-w8Ai62vcxeSU1FCAWSyA76iyK8yg@mail.gmail.com>
In-Reply-To: <CAKVkeTxg4LWANUmqa4rzC-w8Ai62vcxeSU1FCAWSyA76iyK8yg@mail.gmail.com>
From: Stjepan Poljak <stjepan.poljak@gmail.com>
Date: Thu, 29 Oct 2026 17:59:25 +0100
X-Gm-Features: AclHuK98Zm30j0tBYNImXihCxI3zMiNZFSiJRCGdpYIM09guBTiISqkFn91_MFY
Message-ID: <CAKVkeTypfVTfrJtEz6O-umJR8hUWqi+bKQCkD_uCihSTq=5gzA@mail.gmail.com>
Subject: Re: [PATCH] ALSA: usb-audio: reset a MIDI device whose input is stuck
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Clemens Ladisch <clemens@ladisch.de>, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 11:38=E2=80=AFAM Stjepan Poljak
<stjepan.poljak@gmail.com> wrote:
> Hi Takashi,
>
> Thanks for your time, and agreed. The host should have seen the
> disconnect and on xHCI it does. The Pi uses the downstream dwc_otg
> host driver, so I'll first check whether mainline dwc2 has the same
> problem and take it to the Raspberry Pi kernel or to linux-usb
> depending on that.
>
> Sorry for the noise: I sent a v2 yesterday, fixing the review bot's
> findings, before I had seen your reply. Please disregard it.

Please drop this patch. Takashi was right that resetting the device is
the wrong fix. The cause is in snd_usbmidi_urb_error(): -EPIPE falls
into the default case, so every stalled URB is logged and resubmitted at
once, and on the Pi that loop keeps the hub's disconnect from being
processed. I've sent a one-line fix for that instead:
https://lore.kernel.org/linux-sound/20261029165701.2004391-1-stjepan.poljak=
@gmail.com/

Stjepan
