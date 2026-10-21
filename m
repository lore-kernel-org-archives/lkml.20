Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792615527;
	b=tJEcij4P6qqvLjwERo715ubjJlwL/kfoFN8HZxrLdGVCqLI65KvfKF0wvxsdkQjwn62Y
	 FfJgVG7vVBjhsXcdyDXwX0QM6ugUsirAHMOGw0afALUTK3VUM/AZ3BHxLFtkxNfSh+PGn
	 MqzeZW+rLVJKEtna/fd18FwFgjA5JMXTwcfE+J+viVn8jQ3MUXCplbsEskEqSHkyUDQPJ
	 i5gjfj3Xp8EB4JYMRNo3ajGGN5Czw1mC+cugy566oiD22S7i3Kww5devUHwNYfqwC4Ojv
	 HNa5iR1tw/HFp3CD+t4fXX5Y0VG781b6fg4zUYGyQhKcawSdUhXWufu1ymEbHRXjm6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792615527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nnIUuPzYQicGUZpybEaz6HenxwpcqBgX6YEGmj74Tzs=;
	b=D0VxFN40vJ7F+3JPPIJvSsEJ+i6In64gicjQ81ox60Klm3nJhhSpmAd+w4zkKxve0aEB
	 kaBMzklxy288Y9PUdg88RlNpQMaHg5R+d2t10NY/60QMyrabIDmRuDaBq8z/cLqGguGx8
	 VvOBQEGw/TIRbQLaD59LGQbB4i5/JlIerTxsm3Sd0Jkh+UUAPS5yQRtku2P4Sb8RuoGSA
	 RgANu6Pyj/n8is6PBLz+z4ZWUWLcXB5qVe8dFd9RxdxLj3iaZ4AoC3VyND2434mBU4V+u
	 VeW2upqNGtxvUZNAe4aG066neoqdxMd07hiNxWulqoWE56TAQN6kb5UfMk7ur8a/qlQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2GTVLdo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0562606A31F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 20:45:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0562606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E2GTVLdo
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-66fca0709caso1003913d50.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 13:45:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792615526; cv=none;
        d=google.com; s=arc-20260327;
        b=MfYq+90w24XHH+9KOOfzHLOnBzCP1rEQsUjh/elxgUWSRbTJ9PmF1vbQWt7j8ESo3W
         vJCmODOK9lJOwftmZlXs9NglPCbIfmsWh5KkASfs1Puq2wx7VXjjsZKnEUViBdrneSx+
         /EovM1t5Y4Ia6pRO5JfdP8+hdKApSq75gVUN6/ALOhOsIrrZLmnKF+yqnW16luBbWic7
         X51FnN2JvOESorvL1dkazJCKTfzr1r1OFuWzWGXE92YWksbqBRUTxfScQpFl25BDyHsG
         CdjqDd2IAj0AyCQWiWNsQSnFdpULLRNEsfEbRmEpNocHHnE9OsXswroES1T/vQwyg7MK
         1mfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nnIUuPzYQicGUZpybEaz6HenxwpcqBgX6YEGmj74Tzs=;
        fh=JRPJsgrFqopXH7Lv5O617G6HZcZVK23Nf2w1oMiBvRk=;
        b=pE4SnNPuz7LAoWb8owXBtlH8YpoEh1atmkGKHjh1OHahpSbU92Gr+LtEN1tbGhCRn1
         rUIOc/z/vZZ0ZEEs1U+33s0K/aa1/yZwcqGR+cf4MWlhGXunXAzQzLjn7QXqE5lsTY8g
         DJBV5hsbOzmcUaN+B19o8Rlwgr+ft1EqLt5aK2cIBiCkkcvbwSc8ZsGcnlGXRkm0V13N
         tONImf7Z9oOAekNM4XnyxeFbVqZfczUTyMf5V7AU8aFBRwXivsoLGjUzIsILI6QE7CqA
         INDasaDeHZRpQ16GnDIznvkTIlhsd8BW6knz3DwBK90oFUDmhEFV1nGtIQ8Vd7vMA2Jp
         vhaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792615526; x=1793220326; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nnIUuPzYQicGUZpybEaz6HenxwpcqBgX6YEGmj74Tzs=;
        b=E2GTVLdoEoKP4/36dM6Rt+ujq8xHjhA72Dki1Ri7kLFvWK+VxAEg+MLJX98lJ4ED5/
         ve3Ei8uNci1YteC/PxUpHGMQi6gBts5H5BmOQ5Q8S01U3waEOAUaBXC7PdH4sYyKbrBb
         85gL+hDJPSnI07vs4QEFIaQiipQiHJIdr6bOTAv5di46twuhRyfJrQBkvSP8hvNVqswR
         gG9VjRrhmJSEJdTpyhMtkYVbYyu6KGvnxxP3kVOt8mwo2oQYQaOZOHLTEXcLQsO12WO6
         DK7kU9vJZ7UryCuXiJjzb8OgEU846DLsJ90OvMM4vBlnKBOpWhUhvSePck1umrje15jn
         K4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792615526; x=1793220326;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnIUuPzYQicGUZpybEaz6HenxwpcqBgX6YEGmj74Tzs=;
        b=aI6ulqvmdCycJWU5P/dNQ+81wpK4GVPoXorcY7J6hCjf/UPy3xljNaV4CSmOQ3P2wY
         /YauUPkJ3Y8tBuP70CnEo9M5COEO++vHPl+VwKdgSGxX6vQ90HZXQrv+xyWWg2j2hI0z
         2n+nC2TeKxbdnJn/hM5OdTGjOb+iKbw3E4AxUMDQoy/Jw95Whkcf1oAKgOXjq3R8rM0g
         N59CMPRtQ9CM0N74c+xHV9nR3/lHXua6T+psS/mWKc+iOpr9T10DavRCpvY3UhyQsYIJ
         kvq69fC9RtwWtzODF35/l1r11O175jtrcxjA26s13BW2p2WUFsL03sEU4+QE5aKBejd6
         kBQA==
X-Forwarded-Encrypted: i=1; AKwUvBwVytJ6JPjugqm33p3QKEaYzHImMWyv+zw1g6sphquDVaxVxuQd4p26Bs+bF16ZYVr675FOap8JebON3iQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+e7FBVJ23RxDb73aXly2lnbfdogC23nE/IbGou010HyRWOAW6
	h2UEsIIDfcTLjK/em1UtR84GWDZ2PzJ548QR9w5zlWAFK2oxDljYFkMYm+KYBqZZTxG+w+rNUd0
	sCI6+xKW6FwoWwgb0KcyzNIk/ClJqGQA=
X-Gm-Gg: AYBFou1b+R0ImSepSyrZPjorNw/j6U9kkbgnwTmpRbF/JcikP9gDroMU03mCAAa3Q00
	utqMUWCz3lcQOn5n6BhIjoqHCiepXlGzTTplIGYno267qqpsDs0eNNDVeTV/mcOHpvfBObqC5UO
	0Y27pDKotJBnfBxsgQy+5cOuJmHgAa7ZjyCltVCmcmQA47E61hceJfEq6ITDNDxMquSYyuqHXoA
	DW5Kuwyocc0vdpyHl+B90JwIuWKMttwkGl5NHH+ph1HfaDHgGbCP7PpUTFXQDitJmRoF6/Hgk1O
	emZFzEc/1Sp1E2nEhlmL7p0SUu6sVoS6Ebq0gZFbxLdT/ajdJiJfydMiS9BofxjwxmG0GdUYXWq
	hbxEnKraWnpbd8w922C6OgZelZBR8RiAC+/e1WALhEn9La4Al0926SpLDr0vY3I7UF/k=
X-Received: by 2002:a05:690e:80c:20b0:671:26c4:3ac6 with SMTP id
 956f58d0204a3-67a0e4cfb65mr1060933d50.37.1792615525992; Wed, 21 Oct 2026
 13:45:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020202614.30277-1-stefanomunari.sm@gmail.com> <1449a6a1-670c-4d1d-bb98-51f92e32d848@lunn.ch>
In-Reply-To: <1449a6a1-670c-4d1d-bb98-51f92e32d848@lunn.ch>
From: Stefano Munari <stefanomunari.sm@gmail.com>
Date: Wed, 21 Oct 2026 22:45:14 +0200
X-Gm-Features: AclHuK-ZK4ETNJ9EthtOCxXQFK-JYsgPoO094x_9rBDc8C162jyjBrY68mcMpzM
Message-ID: <CAAcd9sOF5weSUoxLtj62t4fGNH-Ar90J9CHh=DvCgwSkrtH1pQ@mail.gmail.com>
Subject: Re: [PATCH net v2] net: usb: lan78xx: fix error handling in lan78xx_open()
To: Andrew Lunn <andrew@lunn.ch>
Cc: Thangaraj Samynathan <Thangaraj.S@microchip.com>, UNGLinuxDriver@microchip.com, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Nicolai Buchwitz <nb@tipi-net.de>, netdev@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Andrew. I'll send v3 to net-next without the Fixes tag once it reope=
ns.

Is the Fixes tag being dropped because the bug is unlikely in
practice? For future patches, should similar bugs go to net-next, or
are they not worth fixing?

Stefano


On Tue, Oct 20, 2026 at 11:05=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote=
:
>
> On Tue, Oct 20, 2026 at 10:26:14PM +0200, Stefano Munari wrote:
> > A failed interrupt URB submission leaves NAPI enabled and EVENT_DEV_OPE=
N
> > set. A subsequent open enables NAPI again, triggering BUG_ON() in
> > napi_enable().
> >
> > Clear EVENT_DEV_OPEN and disable NAPI on the submission error path.
> >
> > Reproduced using failslab on a Raspberry Pi 3 Model B+ (LAN7515).
> > With the fix, the injected allocation failure returns -ENOMEM and a
> > subsequent open succeeds. Verified connectivity with ping and SSH.
>
> Memory allocations for small blocks generally don't fail, so this is
> theoretical, and very unlikely to happen. Please target net-next, and
> drop the Fixes tag.
>
>     Andrew
>
> ---
> pw-bot: cr
