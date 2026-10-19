Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792428651;
	b=hV1YJEail9jZZr3p2w2HA2L6ZC3AEfaaXf0Fq4TcGyFDySdOmrVdEc6ruQNlVtlH4YVR
	 DWlOKOJx1OwykqDeiw/E6gOPtvzSq7hKw2gidunqpaxO5gJJ5QH89ktXUvsce2BqsHpEi
	 LWE8aewuVtMR+FAzLDWUazV3Ge/i1H5caikmecLEuiZZhxcyNp7Li7WfYzJGoxUfyq5rJ
	 30E/tuO8Nz9gz3wFi/K11uW9ddgLeX9/c+pQFJZtpmmcurz8eSoCmgkIIHYAoe/iz5c7o
	 HEEnN7mbRAI+Ybxmb2KVTeZQpMnrOyeFPzTe2VlNcz1HncBjxxSM7i5qWwcf3eKEchQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=iVwRMBbuzg7b5pNfa4A9rRUh+XfwqITm1ddr4+PZFxo=;
	b=CWGTVfNn6EvgvPbDqyS3nRi2SC98Ype2UBT7KeXO5l7pPZOkzzNjbW5ZAr/AJUJlqh5j
	 0F+IQEfyuZ3rY3TE2KZM0KPHhjfHVeVxQMzm+fMrufq77T7H3LFnxxBQgeOIhsVXL4avh
	 SsR2vTaUv06J4JLBtVtnrQ9+6McGLa45/g9bD0kdHLeAPEaTWllUfAPHybMhHTKiLLimQ
	 cb4pmi6PuZ/wJ9OMxKzABI8M2+Gfzi6fsZQ2z7szXA8hZf+oGztXE5PDUfkzvUvt8Bw8s
	 nypvBVfhinWogXufTC3IQYfC+eT1KgvvrnYBDJAkBXatc4p0cERLiqZXu9FydTFK+5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=flipper.net;
	spf=pass smtp.mailfrom=flipper.net;
	dkim=pass header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=wRRuBfgs;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57835606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57835606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=flipper.net header.i=@flipper.net header.a=rsa-sha256 header.s=google header.b=wRRuBfgs
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c263415982eso281025266b.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 09:50:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792428650; cv=none;
        d=google.com; s=arc-20260327;
        b=e/vPTACkf7AvzqOyxJMZF/tr7zsMeqnySJWzLSdaCYpzmp13xw5TQOz7ERw0ixCn8W
         s9A0AXKD5ePHvCqHHsrHqnV+CJdQxs+VGMgVqZukEejGYMtm29JlE24SHugvGznMxz/p
         KMhWevE7DYHKM5dwJn/b3S6AcyFR8wL7Oh22XTUpZqTH9GF+cBvVZ86Xu0SQMrMX6yBw
         kbY75K61nRHDvjOyG/9cpzogfSidbZ9GlvYD+cVp9/khtrpznFtYjNlXuBXxkMygelcJ
         HXaUEAbGbvo6JQ1UdSKaI1jES9ZBrlMLVVH4Ysu54eV44y3+eU2skT5Lo0mVRAIEE74R
         bCeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iVwRMBbuzg7b5pNfa4A9rRUh+XfwqITm1ddr4+PZFxo=;
        fh=4CAAJsWAYAknA5fK+UdAdy7h8Dvly0pVcZOEOIl3WnU=;
        b=TQm4hDuBkjBPSnvkiHjNrBqoRv7HH0MeBgA5ImQOSsheGraIIBqahIpTQ1CDPjj/Go
         7jboTPqUYQtiqmIxePUSL9PjbC8m8Ng8THP3CT9vMS/fqIfNMp3h6AonH4CVh6G6O6DA
         VZ1tIQDS4Nr0gn2mWw7ezF3vjui+7TQwWTNg6qq5my2YKhxtLMYiDOnDZMRKf+I50LXF
         Y+Xlwr7vnZofbzQJSvUADGh5tyoHTSAlLNSjPoY4a85jXU0AmMlOjV1XGVuTfjISnoq2
         yrrUAW4BD2lHyUChgFDgp0Sg9sRNzCQJPlUyWqtRhwNOi+vPCF0CMfBEyDGZVXelPUQm
         TbDg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1792428650; x=1793033450; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVwRMBbuzg7b5pNfa4A9rRUh+XfwqITm1ddr4+PZFxo=;
        b=wRRuBfgsl2skC4jYuNJzx3280933O8iSm6sUVDKwqzC/L+aCsR3XwLNoqs8NRa3AO2
         s/ro79j0ncbri5v2xGLaLZAG3c1FaHMwDY2PyMSig625U/69u9hgA8DWdu0B3jMOfn4c
         y0sh0RNUSNeoR44CulbmHpzOeaDm0FBUTc3L5caY3vUAbk33cvh3s32bBFA3Q1BSkpsL
         fYyRYfZEsFVzV5k88nkU164YKRoSt2q2m+kDbBUno5O31iFNJEKIBZEVMsF42EbsVKMi
         z5bzngU4T9YW/7xs3Lc8anoiEqeOZTP7GARrwzj662jFI/BCb+5SnpzHyYp/w98HGpWA
         jTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428650; x=1793033450;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVwRMBbuzg7b5pNfa4A9rRUh+XfwqITm1ddr4+PZFxo=;
        b=QlepB1VC8FwBzYXPOtX7tnKVpTCDCGU4oCV+D36eSGjeXRrs6BPX9qEb/USQ4jkTPV
         Qm7tCiVmM2ZbRKlLUpiUFHCRAgzKPZEpraKsoXgcCQnGiQPAKlZ+h803Cp/inewk/iJU
         39QdnzofVa2qW4SLZy3sxdqy+lgu9O2Kc2HZqeGem79gZW4CI9zUDkGRcsvE3LrIJeWH
         siFTzHQLIAr23BZt24vVK7o2OKPZYV26mgwBbt8VCDxiknG08FIhB8QtEUoliWRN1H3y
         uxBP02IWEe44qbE3uxG9havZzjXBNSiU2mYG2ZT1XcWoiMLUEDeIV+NNQwAOlMpLsJqH
         gctQ==
X-Forwarded-Encrypted: i=1; AKwUvByvTESt+FtTllR5FRE/k9x06h5mAGXhzESb8N4oPo/ptgCOZ3D+FvXyCOYQQLmiOoSGbAr6pjCri6WyVWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLs9CgUtaHYRkR9kaS8bpfZNA7YdPMQv0247avPEOtvQ39MXbu3
	FEwTgWQkuy5b221LHIDrwsiXBbnPRJY9UYAn/Cl/VKZPTUUTMMlKQGLF3RBLMyn1IbBB0lgRLq/
	kFRont3lGbBzCoOr+KRqwDB2PNQ1pHvcXgruqNhxdZw==
X-Gm-Gg: AYBFou16Z5/t9qmmxT8mLNIMFjz2uUu04Qnu+R/+Pdtpw+ZpeMjsKqUsYUreZSVE3BE
	up2RLhffAjsKBStQWsBUTogxi0icQT1+IV+vTRwvkWtnzalfRgXpTPGvrEkFlpLeDZcpPk7Llf2
	J3iEBIL2g8YtbYDEjkjs4255qCvRVu5ecwWii2KgDXJFVTVumpBtvARl+t02reboJO3G4QuASLB
	Y3YBB3Tjr4CABHiHXhhb8LfXgDVej13tCxaH2wX+29dQiS3CfmUvVV/x30KwZTTXFsuXKFYjFC8
	wBjBI/KkzrLT+OHw9W5zNLBT/I/1IhoSnpUN9QrmnvpOqBn8KvUYXo0nmu8iqEhWAkSPKCWEcWV
	2unlU5HS0fTEP
X-Received: by 2002:a17:907:c819:b0:c32:8cbb:fb3 with SMTP id
 a640c23a62f3a-c419da3f531mr597229866b.14.1792428649640; Mon, 19 Oct 2026
 09:50:49 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015-i2c-rk3x-disable-v1-1-81625845c175@flipper.net> <bfe8baa4-e740-4908-9d2a-4defc5240a82@rock-chips.com>
In-Reply-To: <bfe8baa4-e740-4908-9d2a-4defc5240a82@rock-chips.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 19 Oct 2026 20:50:38 +0400
X-Gm-Features: AclHuK8q0YJA2qpd7bG850w0xtzlJFV0bFMuoGTJWJoEbLnFUaD8-ggaMzyW9Gg
Message-ID: <CAKTNdwFYxPeaG6pZn3SYoR6cPAtON37ajo4nZpPE0Hm=y2c6Lg@mail.gmail.com>
Subject: Re: [PATCH] i2c: rk3x: Disable the controller between transfers
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>, 
	linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	"david.wu" <david.wu@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

On Fri, Oct 16, 2026 at 4:33=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> Cc: + David
>
> =E5=9C=A8 2026/10/15 =E6=98=9F=E6=9C=9F=E5=9B=9B 22:00, Alexey Charkov =
=E5=86=99=E9=81=93:
> > The driver leaves the controller enabled once a transfer completes, and
> > an enabled controller keeps tracking the bus. If the lines collapse und=
er
> > it while idle, as happens when a target's supply is switched off while
> > its bus pull-ups stay powered, its state machine wedges driving SDA low=
.
> > Every later transfer then times out, since the timeout path only reques=
ts
> > a STOP and never disables the controller, and the stuck state even
> > survives a kexec.
> >
> > Clear the enable bit once each transfer is done, successful or not, so
> > that the controller does not watch an idle bus and starts every transfe=
r
> > from a clean state.
> >
>
> I checked the vendor kernel tree and saw another case that you perhaps
> need to fold something similar below into your patch, along with your
> disabling controller?
>
>      In some case=EF=BC=8Clog like this:
>
>      [   12.393926] rk3x-i2c ff150000.i2c: irq in STATE_IDLE, ipd =3D 0x5=
1
>      [   12.416592] rk3x-i2c ff150000.i2c: irq in STATE_IDLE, ipd =3D 0x5=
1
>
>      The i2c clock is disabled, so the pending irq clean is not
>      worked. Disable the interrupt after the i2c jobs were done,
>      the error log would not happen.
>
>
> /* Disable i2c all irqs */
> #define IEN_ALL_DISABLE   0
>
> i2c_writel(i2c, IEN_ALL_DISABLE, REG_IEN);i2c_writel(i2c,
> IEN_ALL_DISABLE, REG_IEN);

Thanks for looking into this! Do you happen to have a reproducer or
any additional info on how this state gets triggered? I haven't run
into it in my setups - did I just get lucky? :)

I see the same write of 0 to REG_IEN just above my changed lines for
the case if (time_left =3D=3D 0), which makes sense because a
too-long-running transfer might eventually complete and trigger the
interrupt with the controller disabled, unless the interrupt is
disabled too. For other cases I'd be interested to know what can raise
the interrupt.

Best regards,
Alexey
