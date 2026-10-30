Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.17
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793401132;
	b=XZZWMNKMUSWzDv/dNj/ZHc6dAj5gxXmhUGHZFh6vbkseLwjpPy8Fu8Kh0otTSNxRb+o1
	 GB9+WN5Q7/hldDXgrXfrzr1h/xItWK80KLPCFkHFHe4icwiuDQ2AAX5LcoQjHge8tiTSa
	 rGDiRI4gnvuB/PU/oqyvE2i0UYAbJ7yQNvwIlyiQjS+ttMigZpHjhpJIsH4WNNGg7/DFU
	 Nzo2wdx6xUJJglP+me70HjzGfUhCCyITjg/jwJLxGfz3JYE8/Y9Jf+b8o9bCj9g5S4QoJ
	 zvxQC3LTCklryGwHYgMcvMsFTEfdgqxpN1GQn7L8fnxOb/JPgvKiqAFfMBvlySdLwEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793401132;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Py9F/bSvxh5TuUFCn+3sfMZQkcYiuncW2pnLUz7b64o=;
	b=EuTrxOrT3vHbH2QzWExGZNLjzzf0gwn+gGSjUXwC5lXotozy12mf6rSSZ94+3RzTUkSK
	 +G8bYif+tXiKThJ0V452Sg69lXMGTMm1p6fLfk1oLQWJXuwkr6Azq9mb4sgkAYUKA9Iir
	 xSFFGVxmfSYAEmncR0+tfRPTmJrs2Nl2d4qNzKZd5DT6S0MZC7n8F2kYH2Xm9p/5Zqpxq
	 XJcdkZjJn1mq9ET+fsigiBKCloUQQa77g4LYw2WQNhz+FcERv/4jEEe1EGFdsprhFeFqH
	 xr4MoQ+9KB5qDWOkzIvdAJ/7/4/WHN2mhiZ8IA/wZ0KQWmM6QaTJ0YhiRxmnPiNo4fA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=iav.lv;
	spf=pass smtp.mailfrom=iav.lv;
	dkim=pass header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=G7HgGOLV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.169.17
Received: from sender-op-o17.zoho.eu (sender-op-o17.zoho.eu [136.143.169.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF460606A31A;
	Fri, 30 Oct 2026 22:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF460606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iav.lv
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iav.lv
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=iav.lv header.i=@iav.lv header.a=rsa-sha256 header.s=zoho header.b=G7HgGOLV
ARC-Seal: i=1; a=rsa-sha256; t=1793401106; cv=none; 
	d=zohomail.eu; s=zohoarc; 
	b=dUPNvvNwdgq2FeEWanmyhO+0zn9XJxxP2cUHJ3QfuP9yfTWP7FluRceh6USw813tdlIUD8es98UDARdg+H28bBVAS0vGG/Q0d6L1bYd0g82FT8HzDVmOr+MTHwtCWv8Bzsqso2MWTBst9jGSugE027RV6isJKIA6CapDtTNd93g=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.eu; s=zohoarc; 
	t=1793401106; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Py9F/bSvxh5TuUFCn+3sfMZQkcYiuncW2pnLUz7b64o=; 
	b=GTrazlqIZBeFDjL6iG4zpo+uGue1x327ia33cJl8UkAGsvKSEz7NENXsnGyqQtfAFlSoDp1KBi/AqLJ5UvSmeFRTTRk3u1H1Qy1ibhzXI7YQJxjj9Borr0koAGmnvOsggDdeExRqen6qJG5GA9ALfN2BTDl9KrPAlgV1S42Qvbo=
ARC-Authentication-Results: i=1; mx.zohomail.eu;
	dkim=pass  header.i=iav.lv;
	spf=pass  smtp.mailfrom=iav@iav.lv;
	dmarc=pass header.from=<iav@iav.lv>
DKIM-Signature: a=rsa-sha256; b=G7HgGOLVshpH4RsL2+xxDTTGLb1KwycqmIpnrqUP86nQIKOGUKaUO524QX2B2S0Ylwf/E9CVbpAO+sV6cohYzRfMxjhDNKY7wPopVEYWn2kYEXI5Q4+H2N3z/OXVsplZSr1l9/nHTelD0bFVnWrNq7Re/LQZLjZ/NxQuYQEGIdQ=; c=relaxed/relaxed; s=zoho; d=iav.lv; v=1; bh=Py9F/bSvxh5TuUFCn+3sfMZQkcYiuncW2pnLUz7b64o=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zoho.eu with SMTPS id 1793401104198250.20342044816562;
	Fri, 30 Oct 2026 23:58:24 +0100 (CET)
From: Igor Velkov <iav@iav.lv>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
Subject: Re: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Date: Sat, 31 Oct 2026 01:00:00 +0200
Message-ID: <20261031-helios64-gpu-always-on-1@iav.lv>
In-Reply-To: <1937939.QCnGb9OGeP@phil>
References: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv> <1937939.QCnGb9OGeP@phil>
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
Content-Transfer-Encoding: 8bit

On Fri, 30 Oct 2026 20:29:47 +0100, Heiko Stuebner wrote:
> > +		regulator-always-on;
> > +		regulator-boot-on;
>
> both of these should not be needed, as the GPU should control its
> regulator. (always-on and boot-on)

Without them it breaks on this board (v7.3):
- with panfrost not loaded, the regulator core turns vdd_gpu off 30 s
  after boot and the next warm reboot hangs in the DDR init (TPL, DDR
  blob v1.25, at "change freq to 856MHz"), 2 of 2; only removing power
  recovers it. All 119 boots in my console log passed there with the
  rail on.
- panfrost loaded after that: "failed to get ack on domain 'gpu'", the
  GPU stays deferred, since pd_gpu powers up before mali-supply is on.
So I would keep always-on and boot-on, as the other RK3399 boards do.
