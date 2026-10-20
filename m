Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792485502;
	b=1obf51F8NapCqO99kA6zDXTCHfAN1LYruMt/baZ7R4vh5WlP1MPOv/lIvdA7FevPDPiW
	 01bbPnxqmdILa/gD6/+IcLyBIwMjQbw7JPukcdf0bUfJui64y86KwZO4/T8pBEpAtOuUd
	 9rjLw6X4nkU9hH0EUtgUZtXHC3oUNczV4xXuvTWrTkM7k730avgTwdRenekxmsCcaEfwE
	 fFPIhiHVPn6LkSwy5+AMsq//k0Iji/BOU6aadblYXtuwjLdLZWtz02Mh/K71tOn/+Loq6
	 2k9JEJm0ciwc0oiPnCRsN5swHTe3K8roXdAOYL2pVw4pEyXN+lN4qO/4LjTQlX2T01g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792485502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=3a978/iWfjMwwVZvL1+s6j16eVM0+TnP/Uzgo/nVM4c=;
	b=a5U6OjUgUxL9soUZwr6ZPv+KrZd3kPY9rETBs3MpYWBusgPLk6gymF3yoXlcWzrU6XYr
	 by3l7vMRXNocpHGg3OaoBSVUAv5m4O1HpLErz6dvpxVSuvl3KlWULCO4u81yJ/1JlCO35
	 wDon4+ME09al/nXP8lii82h/z9nOQhVjRaPw1IL9L++Exmmis2sKVC3aQLo8ekonxyqaH
	 REBG2h3c8WVC0WXy/fTOWcVWMg6RSJkTiiYwyf6Lk0/NfCa8H9RRp1+7EJ9sjB8GGz+Cc
	 vJcXVC5z7BXvH7HIF6PHvQnsZQPHDhwxsVBj1bn4iehQz2qDKVkBDO9lC++Z9V8Zu5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xAVz2vO7;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C65606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:38:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82C65606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=xAVz2vO7
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so16885235e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:38:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792485500; x=1793090300; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3a978/iWfjMwwVZvL1+s6j16eVM0+TnP/Uzgo/nVM4c=;
        b=xAVz2vO7Ltvqn9wr2sOmxRzszaervw2B63r90/KR1p5HBng3lMJO13PjroTle5N8sG
         yfj1SI0dEBp+cDVm2cI+7u7QwyfYohmqRC7otCtd4/Pl1NKxn2ONl1CmNErylD2j8sEy
         b+yQnCCBQu0XcNDqd7KeXi2oeJsbCWreqLKRS5CeZeERqWBOL1YVbRZVut4sEOi1fhOo
         +NLV+aO3bYTwW4oAuY4W1mtUG7RZ/ivkx4YsJM7GMPfTMCG35nZcbbIFlsonl06EjlOQ
         ILj6Y1AWfjcdghOzctqkG+LL2i6LfIGHJhAuxFMapFNlLEzsI0OI+edoMEn2Iqvrn+XS
         PrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792485500; x=1793090300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3a978/iWfjMwwVZvL1+s6j16eVM0+TnP/Uzgo/nVM4c=;
        b=IzpD4JpYcY1V4iEbNwmsDa+/dM4sRPWc7SAj8SMbq97DWM3xMkZwN22kVrKhKmS5I3
         wHeBVBM6kMTXRr1XoOE5k2u0Be8gNCO+57ix95csbGG0CCo1YfP3zcOg7Xz4GQ3Um5at
         7TR7jc5uiavIz11OUdvtS2G2Zr/6z+1a6guNV3ijKuRUHfMk6EiZxipzgsrFXziGN3kc
         qsrOhJrP3s9ueCpOEhUNTNLLY2fzOSNja8JFudatvJl1BhhW0BkdlAaG6zbltLCl/9Fg
         Qpn+3AchFsvxnlNz9/CdjhMLlXIDyY3nq7jkGgqQTUEXuHUquC9vduqwhS8LjYrmuDka
         /uog==
X-Forwarded-Encrypted: i=1; AKwUvBy45F6PSY45y59PXWXYZiyd6iwbfwE8uqQHjPtvkEMvC7bybO/CZsSu0T4rbuOUr63Hccl2tpJNFhZvaB4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTeYpFjTIMTmdEgaIvlcrhyqsVir6lKls9TnbLaLaS7LQOV7xA
	58/2e1jKqblGZE1IeVITyoC66SR0cJYMw4PR6OMeqkHMli0C/Aq6cCoX0BaWNOHJlEk=
X-Gm-Gg: AYBFou0Nm5z2o7WoCWq+gq0S3cG8uW6DMGXbrCxFUZO1DKosrUMG2DMQXtMfqq7ZS/J
	rRH50gjsKYVkzGNelzCkVYtUBy0B0VgJG0zWJR6kKnR2fN9fx9hN1LFYd1jF0+hb79EDKOEoF8d
	uFAJ8KJVq2gqA70DXa27TzTRWSS7ZsERZSbf4s/nXRNachWm+T5ccomwtFD/KZ5xQrPdiBWmctO
	mPyeMd81JEBftggOr605RgOvapwdE9Ajp8JLzloKk9z0hAId7B3rvHhq8IulXDEejfNI7Zdg5Ji
	KoZWgAPAN/uni5Fw+q8WbUoDDfU7I/LxbAhAFWV8usOMBdBcKK43J9MgPlNZfdhOWTM2oxy5kV6
	98+enkIWPooX+r+eHcp4gVPh/HOAUsG2/hQtKiwsnlTq9UrJnlHGs39aMieli+QZbYjbx+nctTc
	8ctoad3LspmzB4n2l/uqR4aLezUJHP7XtGgoZNyvfqeTnezfB7Wm2yKS9yuS04p6pEwzBuJkcyh
	q2bGTzhtietKcw5NcDrrlX2+Qfe+VoTYRtMP5nLYnaTpLnWCRbMX60VOOsWU/lfVyZpLQS57jQ/
	MndbvqfZE/JJF89Vs8gOc+6mUb+fYW7ZXHJp1a8d2a6cKfDFHUcDzVPjDLw=
X-Received: by 2002:a05:600c:4e11:b0:49f:bc43:9e96 with SMTP id 5b1f17b1804b1-4a1d75f2396mr206375345e9.8.1792485498960;
        Tue, 20 Oct 2026 01:38:18 -0700 (PDT)
Received: from aspen.lan (aztw-33-b2-v4wan-169864-cust3247.vm26.cable.virginm.net. [92.239.204.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc8e98sm59739325e9.9.2026.10.20.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:38:18 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:38:16 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: netdev-bot+sashiko@kernel.org
Cc: elder@riscstar.com, andrew@lunn.ch, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 1/2] net: pcs: xpcs: re-order xpcs_pre_config()
 to update after the reset
Message-ID: <atcoeLhohLkjVz-I@aspen.lan>
References: <20261014223100.304486-2-elder@riscstar.com>
 <179232845425.3135.8614802619087243641@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <179232845425.3135.8614802619087243641@kernel.org>

On Sun, Oct 18, 2026 at 01:00:54PM +0000, netdev-bot+sashiko@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential
> issue(s) to consider.
>
> Critical: 0 · High: 0 · Medium: 3 · Low: 1
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>
> - [Medium] This patch adds a generic XPCS soft reset on Wangxun TXGBE
>   parts every time SGMII is configured.
> - [Medium] The patch drops the interface-change check that gated the
>   SGMII reset, while the new comment still says the reset happens on a…

I think some of the other Medium issues are closely related to dropping
the interface-change check... and that it either a mistake in my part

Definitely needs a respin:
pw-bot: cr


> - [Medium] The commit message describes a preparatory reorder that just
>   'hoist[s] the special case logic for SGMII into the parent function',…
> - [Low] The error handling in xpcs_pre_config() now behaves differently,
>   and the commit message does not mention it.


Daniel.
