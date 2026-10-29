Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793250423;
	b=V0YSkrNh2N5igENsg1nxwGsbAOuypEg+MNxHmr4J5pOZGTv+N1iTVi8ciMumbaZ9YT1k
	 nnIz3xqwCuY9QXNN+C2PxG/hPVugjQeIG5g61/mYYPv/7+aN1GU4M/4t1J0e5JxXmlcU5
	 Avvc7Kp2mm4IOkVvAoZxFo7g+9AKULc1kYZ9I68mTJDpT6d9vhrlOrMZzXPbXfz+BXoAO
	 qCRTliZ5OM8WNtlQqrtZ7X/HMlu+Em/uXKqYv1qdnOgSKm9D6XigvlEwT+i4hmPqUGji8
	 Mryn33QR3p/9HvqnpINTROUDQpsl1gtZPQu7Kwmzzg8ISg5o8WS1CmFxzsPuWTW6/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793250423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
	b=0skLNtB7zdWnltfCw0A48WFWtxjsxVkSRpYTrRVqxASJSWiWYwg3fj9QywVvuuCQEfxf
	 ppeV8NlZcquxaIfQH+omrjQU0tpCDTotXeUTXOwGt2OZk+UIvZBR8zcbb19YqOdNgctPG
	 ht2lEuJTZMy71/DuDXOBiJazU0bF3SENJhp590laAnFPGJ3AgKqOD+knbt8EBZXJ1wDix
	 lYw6OBoahEWcFRSRBoCEBeBbjZotfNJjUzuGEW66se4C3wdFVTvOhoKtwqlgshaZBp4w5
	 FhifD/PgAtqsiLkuBcodngr2Ir6HDjac4LWORxkRh85SmLHOAwy3D8jFSdIrwRQkqDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwi35f5T;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F51E606A320
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 05:07:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F51E606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jwi35f5T
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2e985106c0cso14956835ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793250422; x=1793855222; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
        b=Jwi35f5TK9NEOrvRXbIbHQzmViWwUkuV5Yy2ISL3C1ivrmVTCemVIljYoOy17cn6tr
         JpellHJL0zQ2nZkUX3/lgwEsUKH1BYRMQMIOsP3IslcYVdkK8PelyG84J99oY2ImCKp/
         55ll32AMYAjoWN/vskYDkhwQXaWxDKazw31V5nbbsQdJINvYsITVg01imn1HCcwPlRJq
         aBMgGbvl9K7u7gZKwBWNZmEHSCVJJ20ApkXi5XJqIsPHH7R0GJqbOEs1zj3ndDEh1Af6
         GrDz4L1HQ5WSRC0GzdaQATInrIFjtfW5Py2Iz1/GTzjdm3V1u/2N3AUZIn/G/n1lvNHL
         s3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793250422; x=1793855222;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qf62xHUcdwxTQhTGo7oUzUtykTsLWeHZ04Gslg9ulB0=;
        b=ZAQgY167ewQIsufIYakh1AZHSSNG++3AW6ksSYCJ63Qc6Sw6YeOWOdPpukymZH4XOq
         hjaKfaZlJpNHyTkdSyg9/dQqAiChtOGxFfDJHj6c0GJ2/7oY3wT2Q/YXMuJEquUZIbc3
         nF/DKaATv6CIhLbe0sSi/agjiDcvmxMU+MsG/C3cTTKJ8VFp7+VxaDmjWWlIwOy/0X4E
         lFrTbB/o8KgfuAMTmZvBKwtcRFPTmlSM+atYF0QlA1dWMi/5DTBaU2IdYxIszpZt+0xq
         EqK2pyVV+jUulJTz1g2vLxD+mvN20/JAr+zJs3R9C8S5lUK/ZCz3vtxp2rEUGK+yTx7J
         ptJA==
X-Forwarded-Encrypted: i=1; AKwUvBx9cjhuVyGa46aylEZTyZz1yBDqiszxqCJ6IX1o2J/p/zuuyNDMlobp5aonbUdJYGkjudUJ2G6pZ7wVepE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLT10uAu5vmOkb4LEjzm8dq09vV2EARyUNG6GafHmAOL7dR86BI
	fEwsTxnSxI9rDJpe/PmwbbfnS4Er+CrnfJvOwy3QQp6440e9o2Z6YwIX
X-Gm-Gg: AYBFou0rEzCZFBTijHIOBu8KLHlkWwCcPpasaLKF+zoZcJ8YFB59+v6OAQ7up+Q4hzQ
	7aLuJRq1r/0uGtRop/5g7BCrvuedbzwyN9Z+T0nwyHZD39Sut9rpROq4VA/V0CDrnIX+mVQF2TS
	Tx8PHwfhH8EvapuYLaFAsFPQeUOTALbjeIovSAjVkmO/lPHsp0iCsM8Za37HBsV2yOldryTLoJz
	TBx9P5dL44SPQR5LovNoYFOHouZCkigQclsF8OsN6ffyzubbhjSgoJvH6kfXUeYLVsYU0a25oyW
	qljXTYN7FMezjaiSrefpKBjs7MvU/jv2KWd4jDgjSWrQbMaKn3Jzj2Rh874AEmDScpKhtJ5HZLd
	nQsvSgk6U+v3JLRV4IJJTPrIw0vjQ++lj97WGD30ZCMGxWnREXQtl9yiUhkZ8c7VMZrWe4bX5Yo
	EASfqVpApJU8HOC4xlavpq1YVnrXR1PFtispMVWTm6dteJh4J/RWgSp6ZqBaRJOONapxOLFpJbY
	xOR90d65v4wHLlt5e03rBLM9SFyxcbR761iAbzCjwjvvHayjUfg4dzElV+P1tRYL1lqSVQsC7EI
	W+HlcAPOFgUIqe5I8KF99b4VEYiZ
X-Received: by 2002:a17:902:c40a:b0:2e9:4048:3031 with SMTP id d9443c01a7336-2eb0054029bmr40770025ad.39.1793250422229;
        Wed, 28 Oct 2026 22:07:02 -0700 (PDT)
Received: from [127.0.1.1] ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6c9d2cesm28159685ad.65.2026.10.28.22.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 22:07:01 -0700 (PDT)
From: Kwanghoon Son <asdfkwang@gmail.com>
Date: Thu, 29 Oct 2026 01:05:49 -0400
Subject: [PATCH RFC 08/12] riscv: Add Bouffalo Lab SoC selection
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-rust-bl808-console-v1-8-b736ee920078@gmail.com>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
In-Reply-To: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Kwanghoon Son <asdfkwang@gmail.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2

Add a platform selection for the BL808 64-bit D0 processor, including
the T-HEAD errata and common clock framework used by its UART.

Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c498384d3283ed23cbf2514391eee361d..ea4667da7716a9a8d2ae156c422b277064b42530 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -12,6 +12,14 @@ config ARCH_ANLOGIC
 	help
 	  This enables support for Anlogic SoC platform hardware.
 
+config ARCH_BOUFFALOLAB
+	bool "Bouffalo Lab BL808 SoC"
+	depends on 64BIT && MMU
+	select ERRATA_THEAD
+	select COMMON_CLK
+	help
+	  This enables support for Bouffalo Lab SoC platform hardware.
+
 config ARCH_ESWIN
 	bool "ESWIN SoCs"
 	help

-- 
2.47.3

