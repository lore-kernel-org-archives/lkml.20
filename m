Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039503;
	b=iRBBheL2DX6ZCB1Nz82b20u6qqioXxPlmK3cQekp4aM7bX/NfywWAj1Y9yTLYhQccpAG
	 KpXZjRFuzCAsy4wiCGTYgXGT69ejn8e/tZbyOUXGoiRDCcpBQp87AYcLHghrR0IqLBuAR
	 C2gU0WaoJecHUb7doQ/WYsCPrTN1e7qwwfBrPT8G6BHs3JebHuOzhCWLtJL07Nl6Eqeay
	 A0WAngGePa1nXafqrJxIaqACuJj9zOsnHgmLN0Dk7Fk/GcIhcreInEafD/Pv0DuMOMaaG
	 WwWwz6XYAWQ/pyA846sXSNbJ+4mjXPPBrL11AbyXyiKCBKpPLd3CAdZB1hQimTd6Bvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039503;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=;
	b=XqAx/o9XG0+yb2WpnnE7BSq95jGhIglsan0m+QjALfuWH9KetgoIWLN5N8GuaTD6c/cv
	 c+MuwMkzXXw0BFW0WnoqXdGyCha4sUBoc7QuEUGRklPC4QPvKRde8T0wi2ul0tBLdvaLG
	 Zi2FiEc0QRKGTqdL/+xcQ2V25nrcT94a7Bj9KH1YrMdrxPMQjUq0fcxTHRfyrIx/dBOUG
	 QGodDxWM3GX3nDwMAHDVlMGeR7gqfoVmxTzVesGO7d289MAE8E4ZX62WqiS3FJBNAD9Oj
	 CPLhpLoKkXZhucX1UWWM95pT7eJSt20akDmIAqQfQartvfyeLlaeiavrbNqVuv0M0sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUdLLuxy;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A93B3606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 08:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A93B3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uUdLLuxy
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9eb579c0eso7646515ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 00:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794039502; x=1794644302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=;
        b=uUdLLuxyl3UJP4spFk3NxgQpmrV3TmK9yeFUh1vl5evvBlg6C5YftzRlsdtpVUqUAL
         VPwKMdFyu4VK1c5tKq8BWJQ/IrK34OvioJHOCG0eqvMUASiYSn985yNhimije8kbYFC1
         3ATGnIJnKzT/V0igv4JRmNc3IjiAOUyD64Q2ruQVvdcyYFLRgNIl3o+soZ9NhK7zf0tg
         NQ67e3pwL4aZszws6XccLeLQAyYDC9EdfD2oxlJ7uZRR13Vd3SipU6b6R9En4o+yQwrG
         78Z3yJtteRvnYajuzqPZnJFQdEEjaqRfEZ5WAdcYmDpNkukpza7aul36o6VZBbUDh2Sz
         Sv+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794039502; x=1794644302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=An1bRoE/6CxmwaSRosrMArcH/TfHD3aBe6vo4ktdg0I=;
        b=2WBPIZ3rlulOAbQmmwJ+ZzMU/dKU3FI1LB+BXXhecSCZT7kEA4RrVUxQ17W5ryK1om
         faT403CEefLrPSvS+h2HCJ3dWzwCTnC+Dwic8opeWnExEJxXMxTt3CfGwNsLOnK08VJ1
         9RILZlRVwbmiFXI6o6VTMSOMrDT+pbXjrQB2fKf4kWENekpplLghgJaLdGCvI1eBrZne
         K+Hge84idE7SianfB/JXq3O0CuFOPuO6oGaJ3y9RuvrWHX1mN0l9QseWyE0Ff5hthzIG
         1Grd0AHwAs+rZ90OQqyQarxozxKwyd7lF6F8ku7CMCWnqnIFpSu16tMfypR23tXQGpB0
         TJHA==
X-Forwarded-Encrypted: i=1; AL+hErEeomyrwAHm1GGg4Y0H8jGNx3dcEuAi9+un+tGc1wek0ueqrunyzzGDFrwpTWO7TEueS7cVxkb8SsIT5wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/vAyXh/ZLYSNE04SJ0IVQxiQ94/TCFYRo38anNhCdDPQEscNie
	GMAZP1WTA7OL3XJhKZyDpmaawc8xPiosQYUfWxMrYSx6OdeMWgWXuX1M
X-Gm-Gg: AYBFou26HvZKCVo1pHY3DNZmGP8evnxc47RbeK23Kv4rzWeXJjSDbhf0UpKgjw0BCHp
	19+yzy9ZXTLv3JBBrc5QBXqAnbIe7qwWtIEXwSL/j9xUGLkERDaZ9qRqrOvqz/HSvjquYfvZx0G
	4jTk39Dj80qeDupF0XGnmAi3m2ZkttzaTP++H+MydZxOetJth923vhs7ESRBwO7W6IKTuRiOkIo
	3KTZ+P8/7SVYaT+fcuFjpqDjsAHYSSAN0Xk8y1r4PfwBLOn+NPPHEiARwaxZopwGHCcHGpp9ZWX
	hLoM98j/8XF3yiWtAbpDdH7fCSRHj6w03sG5P0Gz4AbiQcOHF/RT9q86V3BFZlvyXsNqGqe23Sy
	CGvKduPJ4n3Z53sAJctS3svyD7jaum4fvCB+CDTUu3k5b1xuYtDOAWQMZ6T+1iQhqg5NZt0LdvH
	TRXJjUe6aReOWpC5O4YYY15WSkm11uighSpNLm7lL4drKJhSVf6dTh9hoELrKVxGwHDVfiq73XN
	VniSsQuKGspxldf1TYdyeYwv8TXtUTNciYnspOTh/A1bBlCdU2gXLZXbzNePyR8MuFa/4KYWSXc
	Bkg/ZiL2J+I/2D+0BQ==
X-Received: by 2002:a17:902:d48d:b0:2e8:1c7b:3b6e with SMTP id d9443c01a7336-2ed40aca726mr55809015ad.26.1794039501791;
        Sat, 07 Nov 2026 00:18:21 -0800 (PST)
Received: from buffalo-ssd ([2a09:bac5:45bc:1e1e::300:1a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47528e5dsm11943395ad.4.2026.11.07.00.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 00:18:21 -0800 (PST)
Date: Sat, 7 Nov 2026 17:18:17 +0900
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Alexander Letuchiy <asalde.le1@gmail.com>
Cc: Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6895
Message-ID: <au7UMdlP9O6oo41i@buffalo-ssd>
References: <xUMh3NwVp4cBhFsWWFE2Xng4h8YH95iJM37_I158WAyVmsRCPbirWT1iU8eMFeiSFw8xco0X45o-2NOeB6Jc4_nWAg25pFPgDMwK3mKzm34=@protonmail.com>
 <20261105222435.571449-1-asalde.le1@gmail.com>
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
In-Reply-To: <20261105222435.571449-1-asalde.le1@gmail.com>

Hi Alexander,
(Resending with the Cc recipients I missed; sorry for the duplicate.)

On Fri, Nov 06, 2026 at 01:24:34AM +0300, Alexander Letuchiy wrote:
> On Thu, Nov 5, 2026 at 11:50 PM, Roman Vivchar wrote:
> > Does mt6895 actually share the same reset layout as mt6589? Given the
> > generation leap between these, the former is very unlikely to use
> > the same resets.
> 
> The vendor kernel for this SoC binds the watchdog with the same
> compatible list ("mediatek,mt6895-wdt", "mediatek,mt6589-wdt") at the
> same address, and its register definitions are identical to mtk_wdt.c.
> 
> The TOPRGU reset layout is the one thing I can't confirm, as I found no
> reset table for MT6895 there. This series does not use it: the DT has
> no #reset-cells and no consumers. If reset lines are needed later, I
> will add a dedicated mt6895_data to the driver.

The MT6589 wdt driver now also registers a TOPRGU reset controller:
f12d5facded7 ("watchdog: mediatek: Add wdt/toprgu resets for mt6589")

The driver now registers a reset controller with 12 reset lines
for the "mediatek,mt6589-wdt" compatible, regardless of whether the DT
specifies #reset-cells or has any reset consumers.
"mediatek,mt6589-wdt" used to be a watchdog-only fallback,
since it did not register a TOPRGU reset controller.
That is no longer true.

Since the MT6895 reset layout is unconfirmed, it must not claim
compatibility with the MT6589 TOPRGU reset controller by using
"mediatek,mt6589-wdt" as a fallback.
The compatible list is part of the Device Tree ABI and cannot be
changed later.

As I noted in [1], "mediatek,mt6589-wdt" is only a safe fallback where
the reset layout is known to match. Many SoCs do not share MT6589's
reset layout, and MT6895 gives no reason to be treated as an exception.
We should not add yet another MT6589 fallback whose reset layout is not
known to be correct.

Please give MT6895 its own "mediatek,mt6895-wdt" compatible without
"mediatek,mt6589-wdt" fallback. Its TOPRGU reset support can be added
once the actual reset layout has been confirmed.

[1] https://lore.kernel.org/linux-mediatek/xqnpukvhtezpqhwjnxbqeddiaqlro4m5yjukpplv5mjfxodlfp@ijaf2trst7p4/

Best regards,
Akari
