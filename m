Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794267944;
	b=aQWT/aqWEswD1MbqVd/SSMUHnOSg/qknTT/WyrZwV6fWL6VDLiLXZdKQMXQw405fvqnk
	 WyyFIZEew7s5pBHsfjgH6KnnNkW79vPneonzr7PQwiBPg5gFUIyPBNZgBrMROL22qQ38R
	 S0eSybz8ryVcvt0bUVgyWeZsx0Dzl0d9qgi3SXQ9UsKZnXwU4OUCO6JnJ3DbNBxI5g6se
	 ZH/lPxsKm50olx/YccTia75UarE94wmxI/lEhNN4HqldX9JWvHVgX3LiPE4sQoO0J/1ex
	 5OAeZwtCCC87F2e9RXFv5ZyfRHYxv5l6Qn3hQn8WjHIzubfsF7/kHDHgmIM3K4O+txQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794267944;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=X9fMC0zqN3ETxlJdsyr5ayEq0uPBqTA5dIHIwwyBzMg=;
	b=b9BC7auUDISmZ/Qq6Qb1UKS6cU6VJhUfTjTIB4rgq0s3ZcduLEAxsTvBu9cAP8n/xS39
	 r9Xlq6HXzjRQNs7WTkZNkgHkoy70ZDBu2E/nR7ENdphu4kHJv0CwD5I2SJ9BTGlrfkOZP
	 5g2palj9epGoqunf1REw4AfgbN0rOoNi70x176Y6xIUkYXGbDrIZZ4k7ARCWWaRHx7Bo7
	 VgcqO1CNCotWj8Uk7JyomckK9IM5oDNuwthXN6vyQ7Yd2fKKqjxH3K80DwqhbkWJREmkv
	 /QeHG+MReWsVIoX953WH+UtIvhhT2ALtt35M/XqN289ylgvwl23ORHj3eI4WHOzwXgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2655D606A338
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 23:45:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2655D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b4c8b51b58so1009748b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:45:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794267943; x=1794872743;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=X9fMC0zqN3ETxlJdsyr5ayEq0uPBqTA5dIHIwwyBzMg=;
        b=DY7d4NhfVQLM68IoSVYb33OUICHQX12jOd3QK6iXKsyRSzeRs1DwLHc8D9NnDCrdAk
         gNYUz5I/skhWGwYNE+fTZ4BEkePdG/KGH0veuxjUwTbT6CAyTeg1VOQBnwhbjZXmwXdZ
         M2pjP7CVyGjaR9ocKn/K0jIvUpD4tavmD+6l9+7LNVrh3h7PELtyCLKJirXAdyMarSLi
         YuvQD6dEOYRVasas6xqFvzlsO6urU/YPKc7Uo0wcYC9JcGTEZmeTgA6R1LjTBrE5aQSW
         gThtP3XRuvmmBwpibKQYBiJYSMCvY/IdWyrHKipoum02NTtU03u0kMvyiA/561+wDVeA
         WNug==
X-Forwarded-Encrypted: i=1; AL+hErHm+dwnGN65zcOO9hvZcg8UEN8JvCLf4yWUJFNif/RamaqXpMpq1lmIkHbaEE16HdW9/p6EyJDjBs850NI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3VR7DtgomwazjdHGtvstfEXZetzebtVTHm5rmr5hf98nZ9G8z
	nl34OxbeeJkedxy+b2K6+uYmhd1sCs4A8HpeTXgaDuEqcLp54IQ3BwIg8qFh1i7h
X-Gm-Gg: AYBFou3bpdaiGTNB7i2YON4hxDYHq2/89SKzZ6XgZochzCd03x+cD0ssF3Fr7GjJWN+
	C4mq2BYI0x32YPQp/LfMZruaTnbIysgGej9JaydYY14WjmZ0/I59AZsxoCfTpxciC/ifyz3R9JL
	ZO9fuE3NKBxe6bm4kjw40fPm48XHQ5JMBo9Mw8DFPFtYoWPVyXLQzOwsZqUT5phC7dbmi9+s9L2
	4M3x03Q8J0BiS5L4RePfniKofwKnodyv2vP+TtFFpq+QX1H3w4PWoRUxoZ6V9n0Xdl8NqMWOZwF
	hlxlymosAOqymCdtW7J3GFbGTCVemZVAJpAUXvVJ+zcxpg0pd7D5s+jgG0axkgiVk7mYem9IaYb
	VaYUK6iRwyms3C1YSRxxa5yl8h5YDao24loac620uQUhvuNxQH1pIy9zcPo2Hx32DyV0PF3POsf
	dP7PysH+CIz65aQOyWOrktftcjNS1fQAkQFQNEkM9EghSZVpR1DsKH2eGfhwcDLUCCR+iRYmsSP
	a1UVqNnrK9W7lUa4oIfwFXUTi6QEwtkrER6mHphk0sumpDTH0X3/yuBErw5QYHOU7Cc7DL4n0xr
	+e95FMAugS0nJhrrLf81sKg3AFVQJOd3zw4PBblLIk5aiqCE2UcJJIxLdNcGGd/7voCPzQm38P8
	y89UK+PRh2uE/YIeMKpx7khkXD1k0exDp/Jy38QHXqLY=
X-Received: by 2002:a05:6a00:3c84:b0:8ac:2c22:4b79 with SMTP id d2e1a72fcca58-8ba88b946e1mr1191845b3a.18.1794267943318;
        Mon, 09 Nov 2026 15:45:43 -0800 (PST)
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com. [74.125.82.175])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baaad41578sm206170b3a.32.2026.11.09.15.45.42
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 15:45:42 -0800 (PST)
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3282db206d3so2888204eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 15:45:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF1Fsm7J574PqDljNhbCCgQ/oA9+3OKKP6Tgiw/+V0vJNXd8ch/lXsgDbmSjA3tNsJggk6k/wFVAaec3qo=@vger.kernel.org
X-Received: by 2002:a05:7301:6790:b0:36a:1904:60a3 with SMTP id
 5a478bee46e88-3751ef79800mr1511776eec.15.1794267942134; Mon, 09 Nov 2026
 15:45:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261108-mxl-gsw1xx-reset-v2-2-46c1da093893@telaak.dev> <179426744353.994134.16211561618771955131@kernel.org>
In-Reply-To: <179426744353.994134.16211561618771955131@kernel.org>
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 9 Nov 2026 18:45:30 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ5oMoZoJ9ivcOBe97MmT5t0wa4aj1dc8BS_YXOsbPO0bA@mail.gmail.com>
X-Gm-Features: AclHuK-cQP4T-VAWBA1r5t7qJjfPj8sdhzoAjpgY1zmdvVatkQxJQLIbryTxlWU
Message-ID: <CAPY4CJ5oMoZoJ9ivcOBe97MmT5t0wa4aj1dc8BS_YXOsbPO0bA@mail.gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: dsa: mxl-gsw1xx: reset the switch
 through reset-gpios
To: netdev-bot+sashiko@kernel.org
Cc: hauke@hauke-m.de, andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, 
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, daniel@makrotopia.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> If CONFIG_RESET_GPIO is disabled, does this lookup silently return NULL even
> when the switch node has reset-gpios?

Yes, as for every driver that gets its reset-gpios through the
reset-gpio fallback. A platform that uses reset-gpios enables
RESET_GPIO.

> Would a gpiod based lookup, or a gpiod fallback, make the documented
> property work whatever the reset framework config is?

v1 did that; Daniel asked for reset-gpio instead, so v2 uses the reset
controller API.

> Does this full chip reset conflict with the slew rate binding?

It does: a board that adds reset-gpios gets the power-on defaults for
the slew rates it does not set. v3 will say so in the binding.

> Does each deferred probe then repeat the full 250 ms + 1 s blocking pulse?

Yes. The switch is not registered at that point, so the cost is the
delay, and only when the conduit defers.

pw-bot: cr
