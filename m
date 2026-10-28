Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793177781;
	b=Au1XH4ij+fJaMOPYWdaoGFnXFk1oEAYjKCZJtLKYouSXdJJORRMtTUae45M6q8EEmiV6
	 ONmWisd7bM91fTrs9MVdFfS0g0oWWQzL8oBR9UKACjGGiaEbbaC/j4Vds01pZX19E9U59
	 5XbXfBOlM6EFc1y/UAWvRRe+7VWu5I/3KMU+oUHS1ZjazC8g5QEJg/QITOQ3pIDJJMiVD
	 Z2RjhsROu7/3xZMfM+3YK49wtm1huuGHioOpPcp8faL+mqnu28QPPA8vfVpUVZON4RISE
	 VQSjrofgxgIyhPbQK60Qkefa7eVwV0zQdAOVgOZryi9/qYqS7lwaJPBWm0c6TPVnC8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793177781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
	b=YF7tq5nj7qyQPA0xOvczflPkvq1WJXCUHhd0IurmlRd4kEea1AVCEby+P8sXMEoYm/MM
	 um/iZg67f0L3OL/a+AOVpmDbAnCiYuUygGw/CCF5r/DYHSvv2pn87tJzgh9+hovMEjl1w
	 bmRBQGyw5pRjJ8zef/IGqLAeVuwFLGPGf7b4oj/ccvsUNE279LkIG4ZM6z/s9gRUI4RC1
	 dBSZLt6opQ4Au+iTzsWvqXRicGSLIpPFD3ZJwqu/gpA0wJlYbYyx7FDqQ4LNIBG41Ti+h
	 i78vUsak+XPn/AdjIgWan8lVF/ZautbyQ51v+oJYU7EUZV+zcj4wvOw+Gm9nnMwgYlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="mruVMPJ/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1400B606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:56:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1400B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mruVMPJ/
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6acbdf8e70dso144358a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:56:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793177779; cv=none;
        d=google.com; s=arc-20260327;
        b=RpiCFqFSEnSfF1w2X4unWmixH5/qolgiO5j4c5q6ZfppFw5rfCpD4wfdIr3LHOd+q0
         6ScEVTgMJ8u7Pi6uW72u3K56sa02hZDJz+t94J9HzK1Rp3vlaAgfI6keerq/GHK0QS4T
         2B79fOkrG0D0/lxvmVcrZxVkbSi3KV1Z4VykAYbD7WoANC1YGppOGYswIKfyKrVrnKKC
         bqQdThN6JX9S8of7RblkpA+XYPGXnDHEjQ5epNSPJUDmAHnao2hq0pN/nmZao1uo+ilq
         LXOo/TLnwOh90ww2VBY/UbBoF7CwCGEdvPQWuY+sqx+0kd0mJknonzEmpCbLpiPvKwZN
         oIMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        fh=1ncn4xPmJuShd6JnqR6cPRXQS9XI/30vtJXPmFBc2ss=;
        b=eaf3q8Y8/V6bVCp/WeljgNcaTSgBAq1q+sR7L6nT7Nwuwlxw7HjR2v3j2hnD+lKu2s
         ZzXr+6ppJA17X4ox96u5cCyPaYc+h65B0/AWcLxLdADNfkMQ7j/AOhvmZQ+VAx7Bj4Ih
         LRzbDeYLOq4ao/hMemkiSK2ZqaFfNqWlcVgG8wNGG9VBow75aeY1FeksJV35bSKtHVP5
         c1qydrhaCPJDVVI/ePDBabUB4CXba5EAnbu0oNEI8K9JGA+wuNbHlIijiaPbcPz+2AiZ
         ySWyZzuI17OccmuzP7P5EjVFv32N0osnROMS9/VJGDv3wlZidMS1PF/+6YBBqAEWpbat
         7aDw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793177779; x=1793782579; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        b=mruVMPJ/9OpbsKV1VDevagR40Axv0wmAtsiJf0F5Lzs3d6b9TnCUMU8i/r++T5oRdV
         8XDmcKovaWNTcKRPxiqTONWZ07h5jLkjB10BeAiccbaM0fHVDzm4/FzpOEDTNQLlV8/T
         a0Cm+alaI3p+pOSafXohx3DX5FpPRwJ33jPVh8TOqiLJz4WDSxcASwh3A2Wo0+9Eh8Kp
         GSuuTSO6aGerjRdr3dbq3arqUDmiZyWlQhfQ5XmvYhkpaMFWrBhNhM4eGhjojUT4cPJr
         Adw+UdNpq158nHVlr7efmydS/d60bpNI6ObgblDxYAf0UyP7gfHUTtcKsod5860oXiiv
         GEAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793177779; x=1793782579;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZZQo695rVLd/9P8OSYiw403iPH4b0i2xMXdXOpikEz8=;
        b=lrURZDz6I04OfijnBHl5o92ZGhNYuaDJZn3riukfLtpYNC7/WZvhr6T8jqVYAyt05Y
         +tokxt691Ml0FvHEZceTmt/CXtNFcAJ79mMPVtV4lvGPlulyDfG1iz500x/hjd9Hv9Z1
         RXM45AxoJWVMdbkIyjiiNPuKEspmBbdGAlcDjJtJ2Rf5kB4ZObJF0nBC/2acEGWA3QLT
         0Nq9MvskqOBC9rl6YAzk6ONzymrHOVIDhgSQNWG21kBLi0Bz7dMSWtLynlxBSlgnhsst
         12osxTKkjk/tg6rYIh/YIU/VqUZ13wLptkb4Ipi93DvWT9GTOcKb8uGSKn5UeXR3PDQe
         XkCA==
X-Forwarded-Encrypted: i=1; AKwUvByfiokOtsWTLfxbZ4vECph5TI6fZFxtvaBkRJv4kXJmIEi/fLPU7fIObS9mX0QdlfjYmprnsPxl7icWTZc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzgUPKgxuyAp20OU1Z8yyoGFE0JKig5ltd6tqtLTqxxIwEildY
	jyEQLYKlxy02+nDwa+CksOARV4+vHSYKYa+PRG7uiFMo2Nar13e7hZxNvb8WaPbdzepCVtl6wu1
	3WARAqS59av4mnpdAf+RV0mwVDaZJYaE=
X-Gm-Gg: AYBFou0XIWjWfoqcd0Wv5/TBdMDyw8qMi7QBaiHMxk4emcaai2nMuAe/TZDy/oFJvX1
	K0x2ICy3EQIVLh3SqiuyapWXZjyxuwQuu4UYlaI89554FD6SXAv25BSZnUcIKzywambXTNkGD+B
	wRQLtQfO4TodVvrAIxNpsD7WLY2R1wvpyhijRmgLBVigL9I8pJZvFSGpAQUSDpVkNtEv4DVTNzE
	rsTzvnDRXZ6C9RovkEMFzFJXt/grUqPVTogjvCkv7mMd650XOnSVQLYe2fPAk99jW9AnmZlVjzo
	2gC0v4pfHMrNTHdYoCb6LFL3UwD8cxuo4XohFYWy95/8VR1Cljsa5974jj5s3FS1jo1J4HIez6u
	3K03iUDQFMs9Gfvs5zrwqDNupkHrXz+mPCWzSQDbRVzEvPYX2KGkcRqLTZQ==
X-Received: by 2002:a05:6402:a6d2:10b0:6b1:da27:34cb with SMTP id
 4fb4d7f45d1cf-6b49cbce701mr976968a12.2.1793177778791; Wed, 28 Oct 2026
 01:56:18 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <25254818.ouqheUzb2q@diego> <20261021024239.GA3667411-robh@kernel.org>
 <3435698.oiGErgHkdL@diego> <850be915-d42b-427e-a036-907b9364f9d2@collabora.com>
In-Reply-To: <850be915-d42b-427e-a036-907b9364f9d2@collabora.com>
From: =?UTF-8?B?5qWK5pm65oiQ?= <jason98166@gmail.com>
Date: Wed, 28 Oct 2026 16:56:06 +0800
X-Gm-Features: AclHuK9Sjf7k3U-KBE-ExwCBQXl-_hQw7npOFvb6IJVRf4k6WS3oRrSiOtSkTyI
Message-ID: <CAPwA33J1nud++bYV1JnPJqvA+ocz5H1=DnyJy3HGX4np6JxaEw@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Add
 a cell to select TX or RX
To: Michael Riesch <michael.riesch@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guochun Huang <hero.huang@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Michael,

I have just started drafting the code changes and comments following
the discussion above
(including your comments on patches 3 and 5 in v6), so it will
probably take one to two weeks.

Best regards,

Jason
