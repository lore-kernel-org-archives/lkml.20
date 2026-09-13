Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A3225B091
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789332132; cv=none; b=hmonO0oluMs9+XUKAkWuDSwWqo+du36/x/hkfXyJGGIYqOEuVnRohgJJwF7ZGWj1guSoO3rqA3W6aW+ufFiE2cOUYxAI5uQP37lN7l/edm7oXJ4TgIvDXBK1kk98irpwtcnp2F6LjyBRaRoaembrtM9DCerSuxBS2m0ElTrwlSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789332132; c=relaxed/simple;
	bh=8ee+7gFBh2B/5NzYVSDcJVxrx4aUxOp66VqIfZZZWKk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ivbPVk2qLYY4yxcmgDffM6ZN1olP37n54QTKIc4UNFhntNVnQega7rWWFOYng+AOHfH0og5EuOBLd3xW91/nLdKgQ/qDqF8zuUi6lEMeHAw3mIYtSpHeVN3cykc/U0EQKQQcM7kXWFX7XZbZTp1PAEUsCimnMUMOHvpcHBU5Bdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LDNFP+RW; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LDNFP+RW"
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78564421fdbso396028137.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789332130; x=1789936930; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8ee+7gFBh2B/5NzYVSDcJVxrx4aUxOp66VqIfZZZWKk=;
        b=LDNFP+RWd7ij18dzk6/MVf/eAlddcD3WClEG209fDJjRVVIWfEs9UGiATEYYMZJcKi
         7SrRZwGKLCdiRiytYmb8O43m6JAItrT5fUPbFm9r7bxTk7svpphWQdPJCPkUB+BSuxt/
         +otmT9bkkEaryJEBUhWdRtlGREfyEYN2/8OWnmJY+oy1FoEj1z54fDK5b+H0dMmbUCWA
         EMiu4OsvmfflRa1fYQhwo30cZTw1NgEScmwSIHTekFVNQPWVF1Fyznr9J6g9G5+IM7qB
         Op0RXgT2jgcYC6yXGBGTHSQKSzGFT8QQ71DmS4O5WnhvoEtGa4guUm6MlI/fzmKzOvLi
         K3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789332130; x=1789936930;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ee+7gFBh2B/5NzYVSDcJVxrx4aUxOp66VqIfZZZWKk=;
        b=ajRGOCajigDVd7R82obJ+zuNmMs1OrOKXFn7O4fkoC2AHwl4ICe1il7MtKmQBx0Uhm
         rpL8bfDte/fhP63nXUf+e94/B/LT0H2XnlamFTRMURZG7eeO066RlTYoYCarDYEVP9wd
         bv7ivmK9r0KAIhRcINJMb9eKS6mwyW3D/YYBzrDZfJOXNyXvNfAU3agHJQLqx5zALFAo
         fdxIjoEeF0GhkXNLxjk3dy+ZlU9KnoyEzoJVaVvQFkxXXyd9+LmUwJqvG6MhQHQ1Jd4U
         z4dZUVM2THnnqaSncY9koCsuhySHhofvgv7eD6uy+ddx6wqQTH4nGCquO+QHo0MNYiPM
         iWeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQP7bPOQPL7Gx7Alf3CPI0p9ZnT+MbIYgwStQrQaLOT0yfq4+ynwNtR3ifGrmy2MQbmV9CD8CLLE2eXxM=@vger.kernel.org
X-Gm-Message-State: AFuF++kMAYQgx5bGCZyLHMCg8OrYQSKAUQ4JOUPS/TFidRMcCJkTNL43
	ivaoMXQZFkztjWqNpAia+bDep35wNRoD31FY2HUHqCxTP7s1QJ+wKf4r
X-Gm-Gg: AYBFou3FU8wKJcaMjTNwFjYZCJgQw2uTzjvrp4J8VF1+UQmCmM9JlsWwBLQTs6BqYvM
	ndNCdwLfe+C1WFdaaTvv9Y1FK3Ktj8IRGrc+fdl2KgxxeshzgmolEJMFFXxvRwNY0LmUU9cSvoK
	TP9NnzqYDER8nhRMG48aRGeon3nZaHb1RDqBB/cVNvuLhJEsPlj4qK+YrT3Jj41ltPZYNArtHge
	68RVzGQYjNrPKCaP/4mB60iISyQSpBEBRc6ZqBNjaeHxYBQad4zSE9pNzASQ1jPhK8eXMxcemCF
	ztf/qs1OmpL4AByZyfMa20zGzY2MStZxjYqn5TEPa+kmu7ku0NYCw3izR1ZJwoGSdIOIQB+2HJX
	6CIWuKZ5uGKc6RbI1fDqDtX61iv96i1JTlUrscxhlRj/lfjBJuaO73leYLwHQuBrpBxuJzgeElh
	rfOMrrB17gYggXTD5UD+mlzQbC+KTiroZtKHMi6AsZv9EhuZKBTvcIs8ODnHzytE1elieTzuzhA
	w==
X-Received: by 2002:a05:6102:330d:b0:783:f3bf:f9aa with SMTP id ada2fe7eead31-792ac9e510amr4898086137.8.1789332129863;
        Sun, 13 Sep 2026 13:42:09 -0700 (PDT)
Received: from [192.168.0.10] ([189.60.169.129])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-982b9f41426sm9597329241.6.2026.09.13.13.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:42:09 -0700 (PDT)
Message-ID: <f8fbfb26a60bd664bb4c436acfa541b5e4976916.camel@gmail.com>
Subject: Re: [PATCH v2] dt-bindings: display: panel: mipi-dbi-spi: add
 sitronix,st7789v-tft28
From: Frese <freseenzo@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Noralf =?ISO-8859-1?Q?Tr=F8nnes?=
 <noralf@tronnes.org>, Neil Armstrong	 <neil.armstrong@linaro.org>, Jessica
 Zhang <jesszhan0024@gmail.com>, 	devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 	linux-kernel@vger.kernel.org
Date: Sun, 13 Sep 2026 17:42:05 -0300
In-Reply-To: <20260913-easygoing-chubby-sidewinder-67beb9@quoll>
References: <20260911203342.76692-1-freseenzo@gmail.com>
	 <20260913-easygoing-chubby-sidewinder-67beb9@quoll>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (by Flathub.org) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Krzysztof,

Thanks for the review, this is one of my first kernel contributions,
so please bear with me.

This panel is a generic hobbyist module, wired via jumpers to a stock
Raspberry Pi 4B, not soldered onto any fixed product like
saef,sftc154b (Anbernic RG-Nano) or shineworld,lh133k (LXA boards).
Mainline has no Raspberry Pi overlay tree, so there's no in-tree
consumer to add. I noticed sainsmart18 currently has no in-tree
consumer either, though it was added as part of the original binding's
example, so I'm not sure that's a strong precedent. Would a
documentation example, or an out-of-tree overlay demonstrating the
tested wiring, be an acceptable alternative here?

Vendor prefix was already fixed in v2 (sitronix,st7789v-tft28) =E2=80=94
sorry the subject change broke Patchwork's series detection.

Thanks,
Enzo

On Sun, 2026-09-13 at 11:34 +0200, Krzysztof Kozlowski wrote:
> On Fri, Sep 11, 2026 at 05:33:42PM -0300, Enzo Frese wrote:
> > This is a generic 2.8" 240x320 RGB LCD panel with a MIPI DBI
> > compatible
> > SPI interface, based on the Sitronix ST7789V controller. It is
> > commonly
> > sold by various resellers without an identifiable original
> > manufacturer
> > name printed on the PCB.
> >=20
> > A basic mipi-dbi-cmd[1] script to get the display running looks
> > like
> > this:
> >=20
> > $ cat sitronix,st7789v-tft28.txt
> > command 0x11
> > delay 120
> > command 0x3a 0x55
> > command 0xb2 0x05 0x05 0x00 0x33 0x33
> > command 0xb7 0x75
> > command 0xc2 0x01 0xff
> > command 0xc3 0x13
> > command 0xc4 0x20
> > command 0xbb 0x22
> > command 0xc5 0x20
> > command 0xd0 0xa4 0xa1
> > command 0xe0 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x44 0x45 0x0f 0x17
> > 0x16 0x2b 0x33
> > command 0xe1 0xd0 0x05 0x0a 0x09 0x08 0x05 0x2e 0x43 0x45 0x0f 0x16
> > 0x16 0x2b 0x33
> > command 0x36 0x00
> > command 0x29
> > command 0x21
> >=20
> > $ mipi-dbi-cmd sitronix,st7789v-tft28.bin sitronix,st7789v-
> > tft28.txt
> >=20
> > Tested on a Raspberry Pi 4B using the panel-mipi-dbi driver.
> >=20
> > [1]: https://github.com/notro/panel-mipi-dbi
> >=20
> > Signed-off-by: Enzo Frese <freseenzo@gmail.com>
> > ---
> > =C2=A0.../devicetree/bindings/display/panel/panel-mipi-dbi-spi.yaml=C2=
=A0=C2=A0=C2=A0 |
> > 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
>=20
> So v2 send in a few minutes, with different subject so Patchwork
> could
> not detect that it is v2, thus I spent time there.
>=20
> Same comments.
>=20
> Best regards,
> Krzysztof
