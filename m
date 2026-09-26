Received: from mail-lr2-f35.google.com (mail-lr2-f35.google.com [74.125.230.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A964A38C42A
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 07:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790406170; cv=pass; b=P/98a4fHSe47KS6L3cPokuHH1GEB9+TjvF9O/42G84+HHtgQBpKDN3IgSfqh1+7mtyEfWJ+49jXcIpuvV8NiX2Ji4Kr89UjlgZbGxofnnDFoDZjLJBW3mTKDQsMDBcorHX/zd2CmxrrhKbREmxyQqHgthXhBKOYJK2Xd6hvOFaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790406170; c=relaxed/simple;
	bh=krXieruHfDNk79o9gey9Pm0eZok9Dc2xnoHAn+WVBgk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LoiWr1TkpB5sRV1jHvSHCeGq1oVCgzA8rWIzQDnV6GlXYBYJqe6ISITzEvBHy+jvqcCN0IAKzMyu5oJnbHERuKCNRywQ5HORMxuQvYsRiPoPTE8r6bQvmGGHICpwC9ql6j2Lps96GcegAwgtyeQTMWQsdLbHe2qXdho99HLksAc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bwcY+1J/; arc=pass smtp.client-ip=74.125.230.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bwcY+1J/"
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a49bc59559so11223931fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 00:02:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790406167; cv=none;
        d=google.com; s=arc-20260327;
        b=hT3IjrilTDaqWf9DltQ+vlV6gXcT7It+Xb/Qyzj6H5+TU+uUQUbyvNy6Ok/ds5v949
         4wx+s6q/B5PIiUNEXP/am6J+LicDUssgN8zSp95bg3kazqlM2I65bHvt9ZzYTw//NKaB
         wyR9ERoEsfQTC627PZAJgJtPhJjdmK73hvCKAcMp+RgGepMJIyXPAtPHqi0tHk6F5gbG
         KIEgMCzyf9GD3kmEr6eIL3AFVnBbqNJw5izWiFy4CIyJv4s4KQg8UU5eucF4ecHdRLPr
         EcHHh12JmwZr/kPinfyG0aSGDi8DTVqlE3ccTSxO5l3AQEjN71pbIcOZsi9Cx5PTEGf5
         B0sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=krXieruHfDNk79o9gey9Pm0eZok9Dc2xnoHAn+WVBgk=;
        fh=sAaAHejIkoM2BtPA/Vhck1Ff0j3vSQ834VNmhso5LOM=;
        b=Vho8PG/BfPi/HxCd19bf/9aH+FK5oL7PiRbGcR18nEreaFfZst6vcLQP9z3Xtuj4+B
         ZQy/hCf9dbv7YpCOcrfWxlC9DYKjnOOTTnoiJNzpdLkxCdJy3TyO0p2oSI9QurKaMjtu
         5H/Mose/IdkfrY9LvvYFQ43MxXuGzE3pRVgMclhwzdxXhxXhqPUKjqMpjBU6AOWzu8Xa
         Sf1OzrdpOZSEgKlHvkIp6qMxMgzVWQF6P32cZr8ShiXlZClDq4Qu+tIF1AQF3onlk4Y1
         jr2elJXiNTAvqrkCya1nRP3LMBIvmDk7x+PV3J8Me2x9EZp8pUDGVlQhSvIk6dfvC4Hh
         PG4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790406167; x=1791010967; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=krXieruHfDNk79o9gey9Pm0eZok9Dc2xnoHAn+WVBgk=;
        b=bwcY+1J/5QUzoD9giyqfZGNKr5xwUSjxXwqxhkM0pDX8PSJ7nMNrdTGHY8LVCStX9G
         O2v5yFlbcqjNc02z6khHCHoDFJzMdD1R38kTTa+HHAaxHDs8gBgSb2buYys6moAktk/p
         gOV+m7tZPZgmdPVbtqYR9+15THj+8+6xf+ejmS3e7KUzHvJIT4cUChjAvh6e12GzdBqb
         Rjpww+SjjXAWB8lCvXmXj5v94i/yjO59Q/Fk0wCDpTp4DRe0xdW84ONmQjWnCwHkVqQM
         BRA8V9NgOrraP8o+7iAKaR0XFFU1D2nR4IXVfm6qVRhrKRtEYbhGuPI8ZnToXk36JikR
         Dv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790406167; x=1791010967;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=krXieruHfDNk79o9gey9Pm0eZok9Dc2xnoHAn+WVBgk=;
        b=zC91tPahe5JDIkeyCpFRHt/EXowb3HtjHsJqXMhtTXGOGYMBbNQAy/qyaz4EbqtU5f
         yQWfpubxMGhHMYUq3glu2ZP89m05C2rkEv9JSX0e1q17o6zrK1Wpk58H6yCdV3t2hAUw
         dZno8nKM2Fm5wuZwB8wu1JGh+iSTmNzI8ovW9/X6OEMC6tDtryafs7aWNm7EVDwRfnBA
         mTip7RdxXCdgSZg+4a/GVUu4gNwc+n7BZ+s18bNiD9uGCHLZwPgmj7EAB9UlbUIdKW62
         53Adw+nClfvBpiCpMgCy0jog2ymyWMSh4bFEMFCXrT/pPZGv5OI7leBMEtwAQYOdnwvO
         pijQ==
X-Forwarded-Encrypted: i=1; AKwUvBwgc/CG8sSqHqtwAAlPEZeVDMRuxFXnUXirOoSBMmRV4cfaKahMBODaflP/QBErD06AtJ8G2zgpUZYC1OM=@vger.kernel.org
X-Gm-Message-State: AFuF++ksgSpBDKhpbuqWTNPHF982Ib7AC9hHcEu7mS5hASxiNAzJ9Jge
	09CHqBcYQgiu42p3KEW0cZbnANCD4MFpkY0hGypPCO9bRNwC4r43lk/Z+VYGFtpQbWgyLWRpzOC
	KzV+lGRIfF5ze0rhYZS4TUt10BtW8eGE=
X-Gm-Gg: AYBFou0XJoiMSwjYOshbl63PQFy3go++RGkdcMJK+e3qtTwSEL3MtzNvMn8Dq35l5wu
	uRcFhKvJp99JeO981ettoq9n0lz/y6h41DRkiCXv3gGBOvlMokjWF3DrVsljug1uBspcXo2Vo+p
	+UAx7zVXjeD33T7Wp3/V4aivi9OGUIHWYYP8E6DWxNkqn/98EwDAzHUgqSQHYHFrg0ZQNjfYHFl
	wddvsFkU9cFVlfcOoUNGcmnkW34o1+wWVgZ1dXNpXFVRGioS0lhq58w7arj/XVjn7Iei1WxQDNU
	gKFWKo3KxrjXZB+rOAuHakVC/9WXpIXJuIqOOcDXeh2GQ+RgiOChx5gkuXj7GbMQEBDBi5lhrsr
	sktcsGF0wFGg=
X-Received: by 2002:a2e:a9a9:0:b0:39c:8124:93b3 with SMTP id
 38308e7fff4ca-3a64c7419a0mr11104021fa.9.1790406166593; Sat, 26 Sep 2026
 00:02:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924011554.3494-1-sigefriedhyy@gmail.com> <20260924011554.3494-3-sigefriedhyy@gmail.com>
 <6541b309-4e1f-462b-a867-57b67bba1b94@6wind.com>
In-Reply-To: <6541b309-4e1f-462b-a867-57b67bba1b94@6wind.com>
From: Yuyang Huang <sigefriedhyy@gmail.com>
Date: Sat, 26 Sep 2026 16:02:36 +0900
X-Gm-Features: AclHuK8GvYlXAIGomaFcHDshMtPeFRf47FxfSP2FpiyAnegN159jNnhl7hdQoVQ
Message-ID: <CA+7S2vL-6m4RACthX==UVhVw7N4xRc73EbwMJHLXTY+=Px=z_A@mail.gmail.com>
Subject: Re: [PATCH net-next v7 2/5] net: add a generation counter for dev->mc changes
To: nicolas.dichtel@6wind.com
Cc: Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
	Donald Hunter <donald.hunter@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Ido Schimmel <idosch@nvidia.com>, Jacob Keller <jacob.e.keller@intel.com>, 
	Jakub Kicinski <kuba@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Nikolaos Gkarlis <nickgarlis@gmail.com>, Paolo Abeni <pabeni@redhat.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, Willem de Bruijn <willemb@google.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> There are several lists owned by a device (dev->dev_addrs, dev->uc, dev->mc,
> dev->rx_mode_addr_cache), the name 'owner' does not reflect that it is set only
> when the list is dev->mc.
> I wonder if the name should be changed or if __hw_addr_init() should be updated
> to always set owner when the list is owned by a device.
> list->count and dev_mc_genid evolves together. Perhaps some helpers would be
> less error-prone for future patches?
>
> __hw_addr_count_inc()
> __hw_addr_count_dec()
> __hw_addr_count_reset()

Thanks for the suggestion, will update based on the suggestion in patchset v8.

Thanks,

Yuyang
