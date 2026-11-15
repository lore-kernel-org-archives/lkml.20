Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727876;
	b=Z4+2zEh3oirNftM9BF25tYLP/kzCKfhKJYjC/GkjVbVd/fx+3/Gykwd+gJc+wvJPPBoo
	 9e0TEBvIaTYymsfs8w/WerltZBnpu2judVVVINQbtOtXWaibyoXs+bryu8OilUqmQR0qU
	 r+R6swvYmk3D8Aawr9KKLEj/aBxJrphLJFvtcc3maaDTs8TCSOXa0cieZHG8X1GXdsFeR
	 htehb/agb6U88k5w8T17EVqhq9yL5Sko/pKR3hUKbws5SN+ZyCzcL2zJz0gqGdQIGKx+M
	 KI6qr7aCypLBvRr6jfehveq73Xo9FY1TYvEYwaB5/Y2K7n845tK1eHqU3hvFhXZkx8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
	b=Z0ez9izwSRKiiWedAFiepSiwl1HxnjdixbSZhsCBBFkRzQoF19Ox/qD0mtwormF9zHxK
	 i2iQQVPBp9StELyTFQHKsiflW2WwKgYtp1qlgiAtC+ft8vWRFlDAI2W73Pc3ctRAicRBi
	 GxjeOLSEngXIIRJCxWfMDQtH3HpCppHu8fviio66l5GqfYezacG/VPbVliVlWUxlfJa0U
	 Ctd4goBw4IoQafZmRqlX0PNIQP/cOsLG78zz+yhA3NJNT+Ebrbs8O395WE2HWi4cywpvl
	 Pg2hXNeLznVpZg6Wvv3VnOEDhbsStPNTjzoybCjGgvH3pL21eDAIEcqtAu4SI6SvFog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90FBB606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 07:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90FBB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-498f5fa4f70so2719972f8f.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727875; x=1795332675; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=sfHX33b9HzNVq08BaSf4y0sViK/MK0chzVBJ0Q+gvrAe9T8wXjtDwJMVvfNxxjvT9l
         SEWTWE0sZtcsNwKWEFyXzvLZNe89AQsVdApUgEXQBL0TJsoj+jbScFkEv+3jRZ1lB8vf
         d/rISxDPp+F/K0bJHknHkk8CXnGYEM/127Yv2NeUvCKPhYO+eTU9rpQmEU6Dd62/EQvB
         fz0HUNzeHXC6U3b4kz52ODEk3D6rWUXeADFYBeeqPtDrSrS3EHKV1D44l3N4ZEbUKSDw
         GOdF9hL5WuF6stzHu5B4BcrufdthWBPcUDcNVZnPgxjB1MxYoePPvR2o1eoXKeb9bMzV
         K9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727875; x=1795332675;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=F/TfEwDHE12rnGI3f+ZhVHac6SEsTzoONQXv9UzOuqB/UIT8WuO2YzjFsdnw0ymZGO
         MACn9eDzX1x7hi3pETC6xOmFdgmttUmcR1Qn3qYiLFSdf4qNXRcf1Pm95Aj8Wfs45f+o
         NfBa8AAyFzyj84VAkjo2HKP+G7qYptdIeWKe4Z0reyI10xM+bxJyfujpwO/ZLPld9bnu
         YTBeK1DB/8Y2/r6U3uIuMs43pcHYQ8HqcDTBQlr9gVrOYRWXXAgFndTtQiVf/XZqnwVZ
         PnBFgybVfL4Hn8c6diKfMi4GLI2jySYcEd22cEab8pePgz7FzaFXL/KqkUH+iXKmanLX
         T4nA==
X-Forwarded-Encrypted: i=1; AL+hErFApf1vL/MghrMNz5nlOIhbFQBXJIvUUjMnTwDPnp5tuz+ytTfs6AM9eAuBysimlVxSpr8OrcZdudFNfHk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9vUSS9HABMy3ZBfzYr9EnjsZOSevuAoAcyJnVIYcuNdKxsoMvM
	Acp2cROhCcYD0aOX6EQ917dDe3jBU2dFNlXPaH+1jvQ9QkFbLty9JFSq
X-Gm-Gg: AYBFou1Zq8k8X60i3YJcFnnC81MBskxqp49vxwwJ7nnU5/syj/zLhVmR1EsIxfoP/8M
	y4QEx39L4RoAVn89jrWmQL20HeXR+JUSbg5bA6equJLjufje16ABg+NaTDVVVSpjmpPkLD7GJL1
	+y9RTjG3le7LSWgBhHL4eRiH+lfF3LLaNe/rngRwvz8fgrwgwamNXN9JObOdvbj4RKEteukf1fk
	nzXe73baAND/Aj+20o9bNvHeKBQd/ImxiC3DjunZKfIMvcSZG7ZAygnwDlYNYmuQW8pg4QR1LRd
	eqzTzuEpdNfhBKaugwxNK94Ying3eiaR9ULt5INYFhkSt72wzhWi2ZuQ3rNwZ4YXUDYy2XHMRBg
	rsxgf6D/Lzwg+pVJpYUqx39RIaCFyulOL0tWsmizLzq0PrYPZiCctYivVNOYBhYsY/Q1EYf5K0/
	JTJ9ApfTZTvIYBfgSCnnIFPim1oziVrDR3OgRn8HdC0AfQ8wQs6MjQLbpAqpStyq5vHY+z03hn7
	TKSXOP/CIuvZw6XB+6VD4K6ZAOdY0qj7cJoXrHF8Wn/dFPgzHMasjLBEDCY+TvzzSIUKipVQgEh
	9GX9lsM238i07g+snzzhhEMCKUrSgM2deumXqvg4aq2kLLoIrtRhXc1yJqWpgafX8dsweExgBam
	5FXzRtSEuUuRlAXT4mBxgPcUfUaOIcsKXCbt2ZuDz/f/vNh22nxMfWm3aYkeLUBkwTQpXj5Gujj
	saa6gr18bTUe7piNkW0sAZb3dq6Gaef6ZvKKwrVhs23ww3DkwdXa8ZY8c1Dh+tKl5v9D2b0uxa7
	hUBY7xA72zohGvDXY5s8Ub7lg==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15660384f8f.29.1794727874441;
        Sat, 14 Nov 2026 23:31:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm12992274f8f.19.2026.11.14.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Han Gao <gaohan@iscas.ac.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, gaohan@iscas.ac.cn
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Sun, 15 Nov 2026 08:31:11 +0100
Message-ID: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=8Da=
s je Han Gao via B4 Relay napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Add the main CCU driver for the V861, based on the A523 one. The CPU
> PLL, the CPU subsystem clocks and the E907 clocks are left to the
> firmware.
>=20
> Unlike on the A523, the second divider of the 27 MHz output is a power
> of two. pll-audio-4x does not pass rate changes up, as its parent also
> feeds the UART clock mux.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Do you have any user manual for it? Or at least BSP code? It's hard to
review patches without any of those references.

Best regards,
Jernej


