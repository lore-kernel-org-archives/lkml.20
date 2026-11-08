Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794175499;
	b=fGFI2l070vBhn5wa0Pf6fJ8/6kDCqgG81T4ji3JCaww3Lxtrogny4lLzCWt/f6JFa9aW
	 0Ylb32ipwzZI3s6TqACvB5DvHqeDXwmHc7CpyxLQ7xbl78+mtuxNJJnYYmf2jc+V1SKxU
	 oZJWx3LvGnCT0/ewTUIwmEA/lViE9krpl0FSmtLURRjsbFVAEYcworVNRUL1niSNOFbI3
	 hfysyWwpNunDvEE1lZXkkva1kSuz5lIoJ9/ZQ7ea3xJ1UvucAqvGzZ6rNF/mNzL0tRNFZ
	 D13dqhzZAPaBIZEUObNxCbDDwH6uE01LvYqdhUg4Ulm3apQIHDQCaFNv4FJE8uHTrHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794175499;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=H/CcamKTQfMjaSJiajoERENx/3ROWxMLBiv4UmCbwv0=;
	b=aLvyfSKkfju9/IONeWbBKtj5zqp5NWRUveMVPR3cUqEsBbl0gN3cnAVkuJTVwu4jIMt/
	 aMkUO5jThcg8XzvZ5XQBl7Xu3BotvsZt3EML6l0NGsltPQjMTb4tZCmhgnT6bt9IJznrJ
	 enNpYaDTHsF+C2Y/pyFsER6xevFL+GKsSgPGjzx5IMhUuODnNzgUPP+ss2yGJtALA00l3
	 pFaZIgylyphYWKO4eSvYxvuNOSyvEy1CQot02AnunoI9/Bn63dB1ph2Ywz5px35wMsrN3
	 yG/wDHiqCBeOrEaIU+3TCT8WGnVBfrsU8I9Cdh91X+k2Lt8d2ImZGucyplx3rhR1cvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 657B9606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 657B9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3ac78f4c10bso114259a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:04:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794175499; x=1794780299;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H/CcamKTQfMjaSJiajoERENx/3ROWxMLBiv4UmCbwv0=;
        b=gajMmNKJ8h/k5GQSnKME31elikrqv0sdnl0eUEsYBo2/f1+8zAwUIcRUaAdzJ2C5GK
         ZcFQHZ6CNzCk4cUky3BBEH0odRzab5kL/UJ55ywRPNxI1d6Le0UWuQpGCaIFwZL+Ce9d
         vuZr/TvsVrm2E8RFUMsi9rwF7mKFa3Et8dBXW2wlgZQn7lVpVfSCJDO+l5GGmLGI41ID
         9gtutGtJh6Lwaqpbkgz0UHL2XB9Ni43/sla5Kl3oE10oS7nmzJ64Sc8vNXVsN24PQqRr
         IPGSWmho6TxZU/CJ3sobaxmhUKQOM1g7gbJEi/hoW7nD41xmXwgcj9Ku+7QI7msvicBl
         JP1Q==
X-Forwarded-Encrypted: i=1; AL+hErElMzgU7H0GWe66dI3YJ1cig240UdtR8Q3vsjBi8IYRDp01nkPbhKsA2/aAlATGbM5yq4X8ZYxnDBDwSn8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+f3VqHgDWECA08Z51uCUHbvG3s/ANC2WjcOQ+9nvO4pTbLLDWs
	lec+GnhK+nBNSfy/Or4h4EGUAiNeVc7znU8fUI/505GMZveI0jE6kBhSTXkrKEBb
X-Gm-Gg: AYBFou3o7eRSTBy+/pj5U727H2mEusBnMfGLSvGfjag6cgo86L4/QpMlQEmCGCWVlU8
	70ORo1QcCKJd/C8304CcNgxIS7vpDjVaVzkvjAU/YfYyrD3ECR1AN+AsmEsqXEwKLyZ2pn8cvZ+
	etV/lXiAMoYxI2eUfPU2fRP+6ueVC0RWgZS06llgkJdRyeUpLpj8MtK8xpqbNa/6a9uyqbOoiFV
	376OAxGhyqVYONoSyTKyIfKm/BUXkKS1E5mk0Jyifz1mPkAwrcw1P0WkKyPi/Yma5itnKm96AEs
	rquuyT+IvA6gC8VnbwplDA0y73Ecw+oCs/bXU4p8UQcUZ7AHiojbT0OEsqHkNmO/PTG69XsWuzE
	L0WfZiIX1KXxaBkf752Cu4cLDcNFI/zWa/lGWWBuVJxm7w8J0HpOeT1O7wuc9Zh0QL2qLzJAbGp
	LIm04VWBIlrRmKjCOmWzL5Ts+19oXk57aVISSrSe8Bpl9cyv2T/bmTjQNs7h84OhsS1bRFXSzRL
	CZg8Kgzv7w4NQrURfuxP5PGYO2OiSxLXnjPw6ceBXZRv0PO3w8B4Tbr7f1vBVqc6B17Oewr5FjK
	MJqxdkfaEjZw+tz3zUe6D5M6awg7sTGgUyBfYC9/2iiWd/JnDwBaYTUHMDRhqLyFvgb+ztkZO0x
	2tmAjlT2ixode7sBcweVb+tebzKrIekqH0/fSm7q9UURmpAcxxBb9myXV2llDlKhT
X-Received: by 2002:a17:90b:3dcd:b0:3b0:b35e:b373 with SMTP id 98e67ed59e1d1-3b12d0e71famr2132578a91.4.1794175498713;
        Sun, 08 Nov 2026 14:04:58 -0800 (PST)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com. [74.125.82.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc4dc537sm5174461a91.1.2026.11.08.14.04.57
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 14:04:58 -0800 (PST)
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-3720addb068so441594eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:04:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFO0mHmt9Prb9qoq3MOqaIm7yynZK6xRdZg177Gi6wFxZtiT/d1H5/Smo1SUZ81BLy1hHioKN4Mj4iHIkY=@vger.kernel.org
X-Received: by 2002:a05:7301:9f03:b0:370:cc56:b61a with SMTP id
 5a478bee46e88-37258c2acefmr5845036eec.39.1794175497365; Sun, 08 Nov 2026
 14:04:57 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev> <au4Hc7LAXH-ujDPj@monoceros>
In-Reply-To: <au4Hc7LAXH-ujDPj@monoceros>
From: Joseph Telaak <joseph@telaak.dev>
Date: Sun, 8 Nov 2026 17:04:45 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6PzrCkNuHEib8WrYoYw3eeUuK6rCeBYPQg+iPzbVEECQ@mail.gmail.com>
X-Gm-Features: AclHuK94cu5PMN_CR3MHF5B50stfHn_PtAIMtZ8wHEf1hN8qZJlhM6zrg1Ysdd0
Message-ID: <CAPY4CJ6PzrCkNuHEib8WrYoYw3eeUuK6rCeBYPQg+iPzbVEECQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
> good enough to provide of_device_id already. If you insist on full iwyu,
> please use <linux/device-id/of.h> instead.

v2 includes <linux/device-id/of.h> instead.

> Please drop the trailing , after the list terminator.

Will do in v2, and in the gpio driver, which has the same.

Thanks for the review.
