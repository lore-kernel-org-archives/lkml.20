Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794559492;
	b=mvmrQswkUs/6FNzC4wxzqJMiFyQ68m699n8UToLB39wqNeklQdnAGixhBJ+gKURd0Ao0
	 JFKQUmcM/8rh/D3ZUDrTkoUfBwK8a1UGTL+1jmLHaSfBfyMa0eUhkmIxLh+XU9iXw9Usy
	 0pD3ROEKiCBHXvrKWpblwSoxlK3BtJ3gS/qTx5cBI3N9/tA9Xvg77q9ejaAAPHF/cO1z1
	 k+TH0UKsWu0bdPpix86t80cmqYK6IPNLuzWQ+fFUKZJzzpteN7CHh3pQBO95RSA/qS/Kn
	 Ba6PYFGH4ffYVWt7EnU3+l99mP8tR20O44XGiHoEeUbeqMvQ4ywQgzeZ3a1K5qTr5fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
	b=DjH+PoB0Sa5/eDEOFyJwFuAdawgu8AU7o2zj6XbS52vj6H5GoNWFLUFl6vXv2ZLXcUyM
	 5E6D2oWwcX91zvQiM29Gk8vV3UOrLW9CQAbg3YVEEH7BmHGAqV3jTiSwvqr3aQXbVq8Rq
	 yIu56YVmNsd94r9TnD7cDqgWJ10Z4uYWnSBqbqvlUpsMkuNBVPbmfeGdzZOt0BUUObn4v
	 xEn/bd0wDkPUlNoQgqOxAXP6u5o8Xl2nz/houRmbv0VsaJ4vbhdLFiokskPs9W2qXWRBv
	 PhAD4GhwdovjTeyjf+CeiYAgfomU/enWHHH831fwzb5d6MH6+onM2qTzPN9SyuZXDQg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LRt62w/y";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.47
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30962606A8A2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30962606A8A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LRt62w/y
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c14b6ac47eso61886e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:44:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794559490; cv=none;
        d=google.com; s=arc-20260327;
        b=Tm09kauZRVfyRrGPrHvWwEwB5KULOX4szuzLHaWlmgmZvfZGLBt8VQ5cDiqzAKux5j
         e7U/4TupzvvQuxPBa1tt5xSD5ByNxvOjd6n68Iy6Z6BzHvJ2N+b73gapt0yxxn9sejBc
         +eMqGqG+gMOo62+HRaVcV4GKjMWMhrVRbYN6Az0JCQ1W4yHIfGcubBgA/oTTPG0hrY2+
         IdDQguwKwerDTAu0q0oe1I3DAiMbhs/XMoYe0dvGrHKjNwTZPsssICiQpQw1iJLXU17c
         OaGiOAbJcGHc46r/YDn08XMZBtlFqbMKTx5pgnpGrzWt3j5/8/NKc2D8/EKVC2X5Y9wO
         ahHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        fh=VP/EglDy7EC4Ikc2w4tpXptOE4SjK+BtRQj3fU5G+wU=;
        b=OCQRdCWyc0pybDXS1HD8rkYMMQp00246Rvb7ujlNlqPgVmSjNhKWbW8IR4yDhuWLqa
         cz4SJcDdzKxGOXwekrRCeyZWBjBeDtIWPf+UnREyx+136Ug2u9ahOsYC4KZ8yMMl+qyA
         TVRWxVifNScXXKoPYMqxpATCIvb0cFN/RlCW6N7wDva+a+LX61IyTawIijKAGJ7c3c5b
         v8Or+JInSTiH5ENMkiXilhgSQNIOluDyivGCvhyysjntm8MdgkBzZ22Uqm3CLKBv+7CW
         JqAGfi16gx1Z1AeTo6LI0osAAnJWrTQZkU61juZbcxOxPPg60oYncSNXGekYjZ/UUTof
         HB5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559490; x=1795164290; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        b=LRt62w/y8VopVF/oeriVfTbTpOD3YUSedXMVVmtyWQ7IlaJIJlofiZIjsrr2kI3F+E
         3N/PhqvWfujU9SJUQgpkcAT9F/ZNFNSWCDRPX7uLwQ6e0zD9cOgsVHbcq7Au0NeZCyKG
         CBCpMGQQWKiXT8TKDKdjEIg8JfNppAhy6ZkvaaiIatrBjZcAUpfdSzoLf1TNDmhMPvkP
         JK05p/4YxTE3GTCgP52/z8f0PLwmlwwk1D0aAUaVEI05jT4fsIIQfndKOg7Rmn7OfpIs
         LU0QlKoo/2etD7RCwKmX7p1SE7LPCuZ97tKLiyGAdrmHhcyu8vEpIzZJ9pyoNsRDJEVz
         wMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559490; x=1795164290;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x+fjXvjMRilqC/1PD9XiiBtX4xwfGR8XcMAZq+mM81o=;
        b=feF6rlzI+tKDbGzjTNSXvgz0kmijEtQr5ML6Il+FcKF32opIPNFV2HA7JZndZXRQe1
         CCAbp4/f6nnc6Y7z0u378Ecqj1p9rw3E8dc+HIGZ1rTZdrRJmJCqqbB+cFdzfJX4EC55
         D2rN9RCFqAaH40rGwCoyFcnABNZUrObAbBQEZ60x1scuhtppAVfq3XDP98K1KRL3p4Dz
         sjjnHYQ6WoHvtk38GDi1Fk3aHc5B0df4mNDht6/ntWT10cy32CgdrnHkp/OWdw4GkWlB
         KxKmqo8zNsPekzWUZf76CJ5OuOHtWmP7dzj3gwarJOBCZsPKL2t+uASv4EdaAnOApmrt
         QfzQ==
X-Forwarded-Encrypted: i=1; AL+hErEhZQbzwKUNLeBLEpOCfyzPKJIckDCK6TRxmTtOXDV/tDCxnQtG7ZiP0WysEXiI9fFAlKbYRVI8sGHEt/E=@vger.kernel.org
X-Gm-Message-State: APuU4Z/LUEjmjgItClokV0n+uH/PnLSMamESSID4noS4BWQ64eHwM1nX
	E36rYZSBJgSPR7bsIOwVgiWYnmAPtacxPDBV3Kub/AkFvzE/+V6i38gk/C3PQUSMWtxv1SrYCIV
	k45cKTPrSp8nPPp8dB9hITVTA/qRhDbU=
X-Gm-Gg: AYBFou3k91QY0BBU2CFn039G5whlWVonpA4fI7WRxPDxFUmlkESTK/JrlAroqDCSyFM
	k0EVT7R9oi8iyvpkeIZWlliSMDiVxNjwGHomLG8UWKXSVWXnjjGWPjAwzplLIjSwYZIShsa5+s2
	1TLD5GAtWjmrXCl8m9xZM8fE5ZxQii5JcxKxiDTwEX61jTqpQ9kSn7/CJ65Kh3gF9Bq1/AAOUQ6
	O5Fm/QKeRGfXD1v5EGBgZVUnofmZIIBMrb/86Qi7gooWSMV+sgrxdzatQno5uqfqsXD+0HrThLr
	ULkjkZqvJ3uoPfgNvQDzi5x8vzYAn2ZRSI9cBT7HM4YgnnFWTO4odMy1i+I2Snd0BkLMl3hYKTK
	HeeP81H2T4S/KkYmIsyQpZ6y2N57QGM+yISqK/RVIYP60We3Yt1xcGj0OrBljZ+dYTOqMblk4xl
	WU4x7FVoJwlr9i4Nx6
X-Received: by 2002:a05:6512:3e0d:b0:5bf:a66f:e5e with SMTP id
 2adb3069b0e04-5c17058b108mr873253e87.0.1794559490194; Fri, 13 Nov 2026
 00:44:50 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-smmu-v3-pcie-pd-v1-0-628819ca44b9@gmail.com>
 <10924894.NyiUUSuA9g@diego> <ea8fa04c-4a8c-4c55-b4fa-f37d74267e93@rock-chips.com>
 <9_7qTfdNSViwtNUGq9D13w@sntech.de> <avU2I_QzCiBPVTDC@venus>
In-Reply-To: <avU2I_QzCiBPVTDC@venus>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Fri, 13 Nov 2026 00:44:38 -0800
X-Gm-Features: AclHuK8fX0XCl2Od3Qw3inFMre3WawrBORUXKfjsC28PcE94ozVVaEPRCoHPifo
Message-ID: <CAEy9hNX8fmEZsy-RfTDQz8Th-H8Z+o5tQN4WseiK_+RpZkbTNg@mail.gmail.com>
Subject: Re: [PATCH 0/5] iommu/arm-smmu-v3: power domain and clock of the
 RK3588 PCIe SMMU
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>, 
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Simon Xue <xxm@rock-chips.com>, 
	"finley.xiao" <finley.xiao@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"

> And yes, I think the other smmu should also use the same handling.

I'll send a series that enables mmu600_php with its clock; it is tested
on an Orange Pi 5.

> @Arun care to also add a runtime-pm patch? :-)

As Sebastian wrote, Pranjal's v11 adds it. I've tested its system sleep
ops on mmu600_php (not runtime PM) and sent a Tested-by there.

Arun
