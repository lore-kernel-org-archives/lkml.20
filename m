Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793782887;
	b=Z50M5fp2YE4pl0oqSf+PbqKnfVRmnujXhdEsAN+ok6A0v1F9i7a9SI6Yb5nKd1JoAphH
	 G+xT1+b80jS9C3mVd2ZC7nJqur4MuEOxF1Vnjg/s9hsxK9o7qe0Mg85IKcbmFIIVrOKNX
	 W8z7z5AmB3WjrJd1xCxpVRuJETUygOWFqZIdp+xhdek1RGNbPXDrFvhIy/vPVp1/LuApu
	 F+/8fRUlmvBf8OiHICTeQ2JNTCyQgvR3LABlQ2QB4w52ttbKu2jTKaZMnjxAMq7YsezCL
	 wrP+IHIT3cFtSwi+Nu/7gAKuPvLQ/0fiB8WbI4ATaao1zgreg0kkxs5KZE9Pj1wQayw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793782887;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AaKiM9W+fdOJ7e3/KZVbbDmGDM/hjoRoSVQ8Q/hFZsc=;
	b=lWThrYlwwCkJPsm8DOIc5k8E0LUj30Xnl0GPhdZMpOUjb+tgHTfOBNbG+En+5ZXoat8D
	 HcfKMFfbZZ6sCC2c3XB2sBS8UW5+je+YvA568w9qvLKHvTXAvigAM1kIjbKj66sjLVyyv
	 Y++njAAcQgPBTjFN7NY3f0Qecwp8U3Bqxq0o1DQMGznRFV+3n8j1hx8SB/4ZkEodYwdmA
	 He4ysUbS9xEQW+KmOUvZQvWpQH/o03EazMFHbRvqDlYSzdIoSHZrjEzxtYy7ylwyIgk0i
	 gUWKmhpJIAGyqZLU8V6lVp/p9hBRYjhsAGSQXM+9+F4mO7mCRydpaZDudS//2B9vaVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD60606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 09:01:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FD60606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2e9d7791b00so3830635ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793782886; x=1794387686;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AaKiM9W+fdOJ7e3/KZVbbDmGDM/hjoRoSVQ8Q/hFZsc=;
        b=JpMfIUS/uB9WkNV+3LlsfqdA2D6Qke4j2sLApzhV0i55We+9rNfyZii2R2PZd3sN5Z
         R0B5pkQpz5upgfPSyTmA/HQy0xUFS2Z5aYKrOALGKhDC6APlmnRqJ6nL7ehai1hKsjIU
         XlzZ/dxvXoWnJci1Izy2MhHVIpMqlAUamdIZQSAv1JR1RSTtslNWfZ3CulV3L/2/IIVC
         f11Evx87eK7lFRk+s27Wwkp7XMo2M4Rn3C58kd4T5adRN2HcR5a1nYrEmzJG+9kOT8Mu
         Xjq5RyrlwU4MyiM411vu7ahY/b3a63GJBHKc86xaWxoQWsEu6MS9Tpd9IDkIdb+1kY1K
         WsLA==
X-Forwarded-Encrypted: i=1; AKwUvBx5li5UxPQfPXufiufKEgdDoj5xs7cWx13h8Srtoo/efpMYE4szLpWx3+EEmvCljyVdlrNZMi/H1gCDfwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9iMjxQeaf1DbTpZtrJLJUVAAJNFvSotNgT3SC/uHj3wBg31fjW
	ce5rW1egRV8QDJCxWK67N0t4kQKJmtijaNXQxcpZ9/sp91QFH5Zz7KTKxVkGzAdT
X-Gm-Gg: AYBFou2N4wC7+aPZ3/Nk9J48nNCRk7CTAzhPSZo8eISBE1giOJD71Jqa4YailpJ6jOc
	4Ani7UnNtYDbb2TtkK/EvfhYVZc6JZTqEJ7Uy/7d/gS7j1RhTEGa4BHP9KlWsi7Dz4jkyhBegYy
	V21uzCfZ0++5P+vSoduNJ/+EtWRZ+yBR7IVcTQ4TydYm74aAkl6D8aknXGzT1J8UVhS6gxqqpj8
	eY/xlFOXN1X7XYXXOXu3jJkENgIpdNj36T6Qu7z3I/ihe4SBfq/5RBwd6FkicMR32rHYyzDNMIc
	BhnnXoRZieX2cahJy9MWf339nzzC1p8LG/ZcWsCwWdsPof+Pv58XS9iGahcBcAT1uZ85zwFJqyZ
	JYMBx6kihNmVwsth8HDMlRQZpz6rViY7zPHXdSCgPS8EnS9iwq2qE7h6yfrCxtAA8s099k6wvXj
	WxnehkfxBeOGzONRpoBiLDjtVLa86kJf82INM/LhfqY1A7z0LyUGgNg/Heunop1ItDyL+hjndWO
	tcdDjSlicr9wEnJE7trIVpNTV8MfAYquqfkGkDdjSF3PGUiBy0j6f/MKLKURJyNbLY9ZhnN3OMz
	hSzrlukWztylp4PGJM69z7WPo/6ZChf1obj92okXp7Wf57fzvrkO3lMGacTrH8UxJeUTSf/qoSo
	MWpRkCHB4Ni7o00aRgMgYs6zyWoKmBm90s0b80S9xIgs=
X-Received: by 2002:a17:902:d484:b0:2e9:5ed2:c393 with SMTP id d9443c01a7336-2eb364faed2mr127604725ad.60.1793782885913;
        Wed, 04 Nov 2026 01:01:25 -0800 (PST)
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com. [74.125.82.170])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed0908587dsm4714435ad.36.2026.11.04.01.01.25
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 01:01:25 -0800 (PST)
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-36a18fc7a38so992540eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 01:01:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByxvrzOqAfIOvSZT7/e9AzfoBFdW6POPr00cYkXTdj0ocmXJradJpWOeZq4u5CiBTywvrFSwUX5b7fsmf8=@vger.kernel.org
X-Received: by 2002:a05:693c:4144:10b0:35d:4185:5395 with SMTP id
 5a478bee46e88-36a423a205fmr27260638eec.16.1793782884949; Wed, 04 Nov 2026
 01:01:24 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101-ktd202x-et6326-v1-0-eb51eddad08c@telaak.dev>
 <20261101-ktd202x-et6326-v1-5-eb51eddad08c@telaak.dev> <20261102-enthusiastic-flounder-of-domination-fb3a01@quoll>
 <CAPY4CJ4cm117fjoZa302TKRmok_NnO62HhBWTSpNEzD8qAacdg@mail.gmail.com> <4fb6c428-85fd-4674-8480-919191db1277@kernel.org>
In-Reply-To: <4fb6c428-85fd-4674-8480-919191db1277@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 04:01:13 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ7CY6hitrp7xk6=r65EEQNYc74RYg-BjVSJo=6UBLq36g@mail.gmail.com>
X-Gm-Features: AclHuK9uQeJIR1NfXJqyf9nbtbfdJiELHYiw7wy3ZTo2enB8PX2i4vU_7m4oveI
Message-ID: <CAPY4CJ7CY6hitrp7xk6=r65EEQNYc74RYg-BjVSJo=6UBLq36g@mail.gmail.com>
Subject: Re: [PATCH 05/10] dt-bindings: leds: kinetic,ktd202x: Add Etek ET6326
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Griffin Kroah-Hartman <griffin@kroah.com>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> No, it is not. It has clear and obvious checkpatch warning.

Sorry, my wording was ambiguous. I meant that I've fixed it in v2,
which I haven't sent yet, and v2 passes checkpatch --strict; v1
doesn't.
