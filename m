Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792596794;
	b=vL/ooPw2MSKLM0YwpjVKSuLWi6tYCosZVE+EikzajAZCdlIdWR8tWTFpHC+EZbG+d40f
	 m6KaQcd64oRUOdfqJf4ZDiYK90V3HuRaQN/pa4G3CAWhKcZo8tnibHgWFlz0e1hTcivg1
	 b39PXJ9FYHzFNTc566y3FqCpGdCeVt9vt3jS36RKkhs/+PKmBfjzXd3oi1QfWW9izBtsf
	 pWaVtzVbIWUSK2UYJVed/kBdbltiEVi5R2G2qKp45qXDJalovn/yTxMZ+vns0CJF4F1eV
	 HpjmGsUxW6W3UU7tZ0MeJGr80rf9tYpB0w6z8oKBD2TlcFQMy+JeybZx2N2xHdlgkSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792596794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
	b=QBhFTirVWZAGGCLbObBaMul1iV2ZU3uJrsMdtCNIIsinN7p4HSLVeO7XIt3Pdda3gTBT
	 QKRQzAnyzQPNBI0OJK0UMwH+dorpEy5hLtPCI2+ldbePQOyvTAXdjtmWjqQWInBWmzir8
	 0GX+E3Hi/Xe2+e+AcNhZ2lgN67yc9XunRjlq7uaEubQpsJYh7nFkrL7kF34lWzxWn0dQQ
	 fu/fBtRoZ+GCVHY6ooJQ3M/1b+0fhlPlWrshXwEOPQNK0mX8gBIr4fMIQvzSZ+jG4tCFp
	 Z7xCHdv8I72ijYZrWFogmL/k9ze9gPDP3bswPxr/tgJMwYaiuwvKgWMrjm8luvRPomw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I7nQRYHH;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638D606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 15:33:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2638D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=I7nQRYHH
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1dede3c2cso11639625e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1792596791; x=1793201591; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
        b=I7nQRYHHtdAkH0SfvkXhvsU6RtTUjm+0BzSmlN2Kd6jJMMa5w6ieA87y07koAAaAOe
         /8UqAm/sbX2L8YKnEgrIg8kaCEoRCjbNOjKwqQPPPl3SidXoTeQbGwydGB/gVr58AqeI
         f8HPOYYLCpZN08CSJlW8j9WgvQKs94EJgdN1J1lvNP8l7e54G5cEk2Cy0P3qz8im5ccm
         U5kuNZ4NfTDixsIttnTuQBKAVB4GyLCaV6PZMPdDatJQSVSDrf04nSp3TxSaQVSa1cyG
         BERkOIZPdjTcbXb8I9ajo7uP3yAXDuZKJXDB6hEWTRDC9FRpKHesfXbKyfMMsai5iieG
         QXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792596791; x=1793201591;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2T7x52CfJh7PTM89ij+e5+OFtjfOrYsnGcRAlxn/5p0=;
        b=gpeqp0ATKyGesQ3n3+dtbGdIJ/FQSphlx5n8znWpGGqnRGihihTjPDI0cLWqJ8SFPM
         DEOpBWhYckKQLIhFID1E0RE8kqF8PbAl7s4ic442GuSPYHqSnb19oituS9fzLuJ/ruUN
         FlJTVkBN+QYt5bF91JLA0TAB0+hrxEzldmGCS2Cu66E8NQ5SJYWWWbk2QB1MFS0G5QHn
         q4Qq9STSekjU9tpD8wbpAaeF9489bJuBpLZUyWzShrOINCCB9CEKjJkkcbooTKfd0Nwy
         APhGE//PpsdNouu0EP3p7Me71bsyBnVnjVzzz2hENOUbUO1261fAa15FrlTHfCsNoEPs
         F5mQ==
X-Forwarded-Encrypted: i=1; AKwUvBxaXK6YpQDA/PtdL8AXLc4Lpiq+4YtIusmBuqP7eiHA/g6MEmFepFerugAo0KR1FMCsX1bWfIbkoVK0uRY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlKmuJt145ICvSA8zBYwXrMD7ShKYVvvwfJZSTUfNBXDe3eqWM
	8O7o+mfWqqXOoU7O97FaZlUZ8115nGfBk6+xSDcsUH16BBKzyYEqBa41e8xp1+dzS7k=
X-Gm-Gg: AYBFou3qnZocjeAxH0UK1kI0bmmmMAGKh/99D+T0/Ixa8oIAli0aMu6UpABEJYBnSuC
	N7yiBl2qWDY2IwzR3UyIkfqE/sPCLzOQFmWGKhA+yvLPG4n8xJtW4to0VploTgJ22u7jxH0FlJ6
	ojbcypAsLA+gg1KkEI4Yb9KNVHknfwR6L8RjwDfBGsMxuTKqLXdPalYQNIjm0wHUHJrbNqGqVFR
	E+GXv8++JO1CEF+Jv6kbM+Qr7GYDs/2DF7B8qusx8JGM3vtQHTlReloOFnb6SvOpz6X1z68xiXI
	9hrgGlJlfXlLYPcKSaShI5R4CN4oZGW+uqC4q0oYQ7srBy5jES045VruHg7E384bIeCd+PTOzZ/
	7PoLRaZJ7nFKjeUZcQ2GiAN7NoCkLC51/8ktrHvDNp/n+OH7JQcOMz2LW9D+d9xCzfMO0zyxML6
	cFRV3pzmPV3jUXEBZz6Pw9okhR3pttEjd+L7AtCZ8kjbjaXEGyjoExM1PkLrHeACyHbRnEAUHdn
	tkk7okNzNB+jQVS/LX1P6ByYzbykNCmrhcc+X45tMpS8y05CqYEzWXPueuC/rpvEqMEScT8kE2C
	Eu1379Zf572G+A1Ng2dFXMhj9zMt/+yGMyHOyqgVoJMdKBSg04O4jjLgkb1DkhhGdnm2ag==
X-Received: by 2002:a05:600c:3b17:b0:49c:cee0:e7c1 with SMTP id 5b1f17b1804b1-4a1fdd31aebmr56977285e9.16.1792596791483;
        Wed, 21 Oct 2026 08:33:11 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-79-21-165-229.retail.telecomitalia.it. [79.21.165.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fc0b42bdsm59333825e9.0.2026.10.21.08.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:33:10 -0700 (PDT)
Date: Wed, 21 Oct 2026 17:33:08 +0200
From: Carlo Caione <ccaione@baylibre.com>
To: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino@collabora.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	David Lechner <dlechner@baylibre.com>, Julien Stephan <jstephan@baylibre.com>
Subject: Re: [PATCH v2] arm64: dts: mediatek: mt8390-genio-common: add boot
 phase tags
Message-ID: <atjbCWF1OU1c-Vtt@macbook.homenet.telecomitalia.it>
References: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-ccaione-upstream-mt8390-bootph-v2-1-82f67feadf7a@baylibre.com>

On Thu, Jul 30, 2026 at 10:04:41 +0100, Carlo Caione wrote:
> U-Boot SPL runs after the platform DDR loader has initialized DRAM on
> the Genio 510 and Genio 700 EVKs. It needs the debug UART and eMMC
> controller, together with their clock, syscon, pinctrl, interrupt and
> watchdog providers, to load the firmware FIT.
> 
> Mark the nodes consumed by the current SPL configuration with
> 'bootph-pre-ram' so that the canonical devicetree carries the boot-phase
> information and bootloaders do not need local overrides.
> 
> Signed-off-by: Carlo Caione <ccaione@baylibre.com>

Gentle ping on this once more.

thanks,

--
Carlo Caione
