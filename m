Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793638905;
	b=PxcpB17jhIECE+y1GHict3ojETvL8NVOKCV8RnAiXdQm01RbfvN5M1adLGNJvGw16UDR
	 Apqn81EwtFnQLy58kfheG7qdPMfHPe4rJclt8+OBKMMX8K6iQFFptcsMwrNtlOvegEWNN
	 10VzqFa9cZygqKlhRkkAGN+mGjn65N/8A1v/6BpBV7ywnhzcJLgHdHhAg4RZliIO/JpwI
	 N9oZyR2C0t9tyS9tegcdlf+t5VJc/Xx/I8dv/Eiqk6LfN6PJ7GKt6e0baa5OEYRNXr4te
	 izmvHX7NmHASvqY+WLrm+vMP2sDRh7eDPdVoGzKcQbfhLYEQdMni6i0FOYgqsB7g3Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793638905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=//2dH0tf9WsNJ1T/56d2QvgVSnUsRCYl2PIU9XEdbPI=;
	b=k16hM2b9bNExMxOvZ4h9farSigzZub6rxVLwjraX00suQguPZ34B2YLjL3X321qpSMBa
	 quRpfOQmHpF8PZd0DFwk5Tx6PK/a1BCQj/CwK/eqPhC621t6jnZNX7mr3vtrru5ro1Z86
	 KhxbM5y/x2CYSIBksAh9RULSBg/NHgSLPG1lVJOy8m9oHTJINX2c8AFu0sbApAhn4X29i
	 oOEUyem/hS395Le4r6nYMnXdl8HvwkXDz2AVoJ6CFBbE4TkB2Wx6qsxTMhPHjDA8U4FcF
	 jtvDLA4Em2JBSx0fYbStIQF1EwMKhv8BFjIA5GFq1oPJH8X6OX39O3/rmWUcf6ulOfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0M4GQdk;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5595E606F229
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:01:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5595E606F229
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n0M4GQdk
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso25734285e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793638904; x=1794243704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=//2dH0tf9WsNJ1T/56d2QvgVSnUsRCYl2PIU9XEdbPI=;
        b=n0M4GQdk28w4KtKpcrsogDAta86YM5Wp928CKaOwOkxmtfRhJtNe4E360NEhiHoyEX
         t9fm8FwNtQEjXWDUqvu5aY0R2jxNWL65fDnRJ/95QLOM5Q8Ex+MK1kDVasCVgkKss2rA
         AceNYF2yTnDaTVyQanJ7fvrCnAIp5EGxC8bBgchj54TTXcQ97ErKJHsFfIhwWR7zcYZP
         mpiW28w8zrQjfmsC6OT89zUFDrpt0QfDLL83o1EzOqrQLjvTmNs2XJzLSG/e106a8jqG
         AftueCoUUSyUxnqiGHKNqvOxHwuG3gws4V+2XmOXo44oDOoYeZQwYGYSRfG/0Yzu3tmU
         SHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793638904; x=1794243704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=//2dH0tf9WsNJ1T/56d2QvgVSnUsRCYl2PIU9XEdbPI=;
        b=1jRAZJ1qcjJX/TSSjpE+HJYytPUQRnLeuczvE24X58U0zxL3fDrtL2kmoHnZIUA1vW
         aEW6kG7M+b6MwltwLtazRukg8cz9/J16tEbpPYVRDj5wLuHt/vSJ7jUvzi8AaL4Qxsqc
         TBy1glOC3Dy75g4liILIrCukA17CQq8zbXoPzZTArkrq5Dxs1MHoDgqz9qlcZs2+raEn
         mlvsegutP3Xen/VI5c5DS4BFYAKOxqfkwT/oRY3N8vn+NI8BrYZRcfNeDSs64Xa45XuJ
         w78FICxphLlJ42crB1dmzqba/UV8QrFKCO9ze8eOPLpgzJC7CDpp3qnTXw/zLLnR88A3
         2sDQ==
X-Forwarded-Encrypted: i=1; AKwUvByasxthZ1ZXrAxzpHFv/V9txcdbD7UAWKiQRXGq8wrhYdJsPUhfAQ3f+MgvnlqdgKPIBNlUJ+6v0sxsdos=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1lXBgVf0WaRbFTdUwcooLPKZ+4U1qCrUF/n8UzgtJTbPhwPB2
	cWRaptd2NIOBQ6p10JAi0x7QsEv5S95xSi9rL7zSNi4WLAginvzkWm4rngChar1A
X-Gm-Gg: AYBFou0zRK/XOgpUDrW7S7ms8E14O5ZAnDXzk+wrCMQHfUgPFwJ6Vx1dmRY/WzikhJk
	Cf0W4zAfFAVvJdHcz9qAyOPp84/BL8UbwPpypeFZbsLZetCKMwXEPS+mUgDrIbNx9qxFNYoLMAt
	xZ3liPghkJ1eL6V9S3Oh5hv58A1+0q86TjxI0TErTXtzBr+lNzZx6gOoi5+hyBbXqdYLwAUoDVm
	vYHkMAliWTUQeNt6kbAeU2gie/MHxN9dsGXY4jU7hhrZ6UkmHearfP3cUQHm0J1xBQjCG3B0TRM
	WQIKAJpAwD3u2d3cKY4RhQRiaSdlP9KHChBl1FEn4sVh6GGcdBDIoRhRqyHwX/kfg4+YTqYahMH
	yxMoWaGLhadpsTsvXfKBNct+fXOHmLXbbiZGfbMJPrEqWzu6tg//U7Ur8gAWQsuwcJhc1YuF/r5
	7UL/a2QU92shMPqfbyQVqZDabU40T77ZUWGo4kDOI6w58F78HQiNweTUBBE03lKOMw8A+PZ3Sic
	hCpZO4Jp1gF4n7A7rMrKXckT0KABceMFbbyncgV2xBjJ/DFo7UHQ1F0+veex83a99NiszB6KVYw
	RPV2iQqqbbYC4uRzrw/0gcztLPfNIdzW+c3LkzeR+tuMrQ2N8lmo4wDhyNTq/oMc3HJ8HCBK9cv
	YS0vZtcy3Sj518V73E7OxweiS+Isz6J9iTR0niqhtyTT4ANVelZZVvFLZB3Jp6rEvpR9WmyDPUv
	Y97pOSlC1NGA1WiykqXsKE5194SgjdrUDnDrdmn0YPqQsVKdcRNo22zWfTQ5mchDUr9dLHUp0Ei
	Q==
X-Received: by 2002:a05:600c:314a:b0:4a2:fd2:985d with SMTP id 5b1f17b1804b1-4ac1775316amr237285955e9.12.1793638903629;
        Mon, 02 Nov 2026 09:01:43 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-0499-f85d-af98-1439.ipv6.o2.cz. [2a00:1028:8388:a84e:499:f85d:af98:1439])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a5372d8bsm1215295e9.0.2026.11.02.09.01.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 02 Nov 2026 09:01:43 -0800 (PST)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Thorsten Blum <blum@kernel.org>,
	linux-crypto@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Marius Dinu <m95d@psihoexpert.ro>
Subject: Re: [PATCH] crypto: atmel-i2c - find the bus speed behind an I2C mux
Date: Mon,  2 Nov 2026 18:01:41 +0100
Message-ID: <20261102170141.54660-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <auieEHLkx76881ZL@solitude>
References: <auieEHLkx76881ZL@solitude>
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

Hi Marek,

thanks for the ack and the warning.

The hwrng core starts a fill thread for the current RNG, whatever its
quality. It reads 32 bytes every 60 seconds, even when idle.
atmel_i2c_send_receive() puts the ATSHA204A to sleep after each
command. That means about 1440 seed updates per day, and 100k cycles
in about 70 days.

The ATSHA204A becomes the current RNG when the MCU firmware has no
TRNG. It also stays current when it registers first, because both RNGs
have quality 1024. Today the probe fails on the Omnia, so it is safe.
This patch could wear out its EEPROM within months. It is also marked
for stable.

The patch also lets the ATSHA204 on the Turris 1.x probe, as its I2C
controller has no clock-frequency either. There the talitos hwrng wins,
because the ATSHA204 has quality 1. Without talitos, the ATSHA204 would
wear out the same way.

Should we fix the wear before this patch goes in? Does "proper power
management" mean the idle command instead of sleep? I can look into
it.

Josef
