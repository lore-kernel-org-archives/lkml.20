Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794530308;
	b=jdfjFQSuP31kkUeD9zvQblReMtDFdkgOWKx6gAs35vlqPsS7tgUrylzfC0HC/bMZNFog
	 1ffaF9lTDgdWMV9MQ9kSm8BG3ZXPRhzitMKFioKVubChxKlWKO8up2UUkq3mvowmu6hXK
	 ikiqbiQD8brwaUJOBtL3pn5Buha50knpR7j2Qect4olrWusjPLW9/h265DoWpLQxgM79V
	 si794UZUFpWcT1PKliJ9v5KpHC/C8Y1O//7CiRDURFjUqOVxYUuyuzZdvHZvD18EoqLzj
	 7hXUk0Bdc9jt0dB3HRAq1Y9rfE77hkIIqjCka1MWZfeE68oF1EtuyOiJ6uk83rHKb6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794530308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=;
	b=Pvf0dXroMbnqQ70k++bGZcW1HB5Z6HMjdrvh6xavweI42RX724Xm7MHP8JuW50oPGD5R
	 JaerSX6l9lsA22SyPFuzzwKQ4Yzzt5w/2ppAa1u7BCU6QJG2djz/d0tT9eTErTSx0wTpb
	 PnilzKIQyXlfP/OeMZ4eG6I3A7Pl2n0Oo0IZrzeSiglkBKLkKDFFdNf3Gp7Xrs9xPlTLS
	 jayJNyXxQKV0/s7ymLvdAvCJFCRtuYA0kREAsyfQxKyTdNw8lpdVmVZH/essvXiw5N3Kn
	 1EsWvAlYnTa10DPhrTD6NyA/DuIOUEQ5X3Tqm5Bk0MNcsXT2mYim7AW/66QsgDRKWow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wriMB4Ds;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85E606B7E2
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C85E606B7E2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wriMB4Ds
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a215e64962so5893505e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530306; x=1795135106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=;
        b=wriMB4Dsld87YFqNWQv6a5U3pmzdG4WOObP58uk/kuhN53e/HmBjWr50KMY8coCN7m
         /BGyIroDjib2TGMolHIFz1FXRWUIV9p7SE7Stz4WyVVGwVJpMRn/8R80W3tGP3o4DPvW
         ziXadZTdw3dchUAPFrzFlLdVI/cb8dSn7xc8cOwLNbs1Ob5f8LM5UXzIpoAXxjPeUh4T
         TTEq+lr8OsE0QYIj0c6BUOHbMcWaQ3a8a0F1bcaXcoiW4boqd+hw5n0MMCT6jVOIJLsF
         sL7VtehjRE5wd3Ck8a4MmtQ8LUAUJL4tAAXTEuZ3K3BO1vncoAavm6YwEj5gaizDyK/o
         El0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530306; x=1795135106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NuJWbidnT5EA+aFxRD5SM39/Oj0VNhJI4etsJtJ9CI=;
        b=mTz5iZmopTGxE9O1+Mr37iVP8dNknumQich20XpzoSPGU58LO885CMnXcvTb5n0Ch8
         cQC/TfBuqjqGXKJCjvOfynHKYmjgWodEwZUrSh5yySuxiKLNPBsAxl0D/btLly7wIiDc
         SADyUsyVTGU5ArXtNwPrBQoI6LIMdqwv039Fn2WFDgBNwajy0FlBNxFzSDdMIaBCDMrD
         5Xf6oiz2xV5VyMVQXUM4D4HpsvpqeJs5pY2KupL1BVb8Lh1G4m4M2nxjYnA0vwqCSdei
         k5C1D6yfBwKyLtdG4O4b15qz4/uNU2X4lFcuDUc78oC80Nc+ggr6sg5Ju4UZZS21J3qF
         hECg==
X-Forwarded-Encrypted: i=1; AL+hErEsiu51BetZQcmP0ieKvBn9V9g0eZBCqns6/nHDntF9+3JXyJMp1dcsoNFkGRidAvST4YeG4Tqy1EzlZGg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/5fWpswz6DCPMJ12tx4w1Lu7s7iczwlaeA27f8yGm0nZsrpUvp
	xs4nMSQenDMKJTDBTi5KcNWKytoh4rxrzQzKTefLfDVShhwmwLXaLl8B
X-Gm-Gg: AYBFou0FB4hPpus+dN8whTgnVWQD7nSAl5mMd+i2Lcwc7N4u2FxtOVT9sCym8VNEXls
	yp75feEVRa3/U9wGeeHJT5jtZXuEseSSECnc4jPzXhUnBNuZzh2Ps0TkgJ9pcbotsVxUjv5ott0
	tAWTGeQAx8Gp/kC3f74XTTOGuooSHJy+5a+vx8Qf9/AHzsgnSt25lC0MCuT9XgxkTUJx3OUUOxr
	y1wUeErtJ8Div4excsIpj0DMA3JYb7cJPI/1s/73PXN7h/usKkFwkpZKGm5pT5yN0dxjPiseYoq
	PraCIFZMkWJoByFbgmjX3+2CoH0LmlHMms17JdI+bP5rmf/tE1C3vJ9GtcNVhGQQn9A6P1KsqRG
	GLhL8Vc/g8EkNd/JiBiPNooEOHLPMr9PFWG7BwNLciZtHIhsw1Dh2OAbkaP1AbDFxogfuhiSG5U
	MY4nQWUJHn1VETnYg5ljGRxLeeVtJnB1pj8Byj5msE6xx7JhAfaJJOg8p5pawFnN1/FZQcVzEOR
	7JRCXHp5xprm9fCVcB5du6+GgGVK5wK9siAhtO23djC+QfLIcV+ooBC+jzD6D2LTf6NwXNmuMDl
	5Cz1srBoDiCxbwb6ExzpsaDdQTvjQJV8olZ8S8TaGllCifbKGnbFcw10IH3m6XuTIdBQkxg0943
	e2Q/t5/P+tl+THSt+9GGRPcFBUq416VbafF1yrZW8Lk4nns0VDLTwXqF6aUc6Ij10gZLc2Z+AQM
	1mYnPEZJr7zH5SvkoFB4XbiS5otXN1aVSPyulzQIE=
X-Received: by 2002:a05:600c:4e56:b0:4b3:9540:47a6 with SMTP id 5b1f17b1804b1-4bb55aad2demr18252015e9.28.1794530306547;
        Thu, 12 Nov 2026 16:38:26 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55ace535sm19669805e9.6.2026.11.12.16.38.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:38:26 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: arnd@arndb.de,
	stefandoesinger@gmail.com,
	krzk@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 08/24] gpio: Add ZTE ZX279128S GPIO driver
Date: Fri, 13 Nov 2026 00:38:24 +0000
Message-ID: <20261113003824.3670843-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-9-ghahramani.navid@gmail.com> <CAMRc=MfhnbwvM+c=e1=ga4wALCmj8Bi8LWkB_W4_0YHkK3Hikw@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bartosz,

Bartosz Golaszewski wrote:
> > +	struct gpio_generic_chip_config config = { };
>
> Don't initialize it here, instead...

[...]

> ... do:
>
> 	config = (struct gpio_generic_chip){
> 		.dev = dev,
> 		...
> 	};

Done in my tree, the config is now set with a compound literal like
that. The GPIO driver will come back as its own series after the base
support for this SoC.

> Looks pretty good, I love small drivers like this.

Thanks, that is nice to hear.

Best regards,
Navid
