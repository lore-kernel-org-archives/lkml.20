Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629820;
	b=kKmU9VFIqfgg/nhAlo8cf/O9/K36alX81ik6mMAgTooBPsPfwED+jV9LgqoLZOaXujZY
	 rH9ZFnN3/gFn0GUuybHyFvnh8GuQSIgFQnW2eljveuKHE8U0TssisOYy35t8CaTrt5SCp
	 EaFUzkkeV6gXqDEEmZ/zh/AB97iX7c60q0X2MbXC63T68GvBjvDqZCiMIjCeRNFp5zb4p
	 SenWxn3hVgyW0AjzizHbt1pY2dRRb9coxKTU02td0T7m2YOP3t6cHpDkaLX98+W3ki7UP
	 UNgANNafarDiOYJvl0bXfkdb29nhQy+ebQo9/CoFEWWY8zgr2jrGfJOpzzZJf+9tOMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629820;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Gts2WqsGwLc0uD/7GkoBlKKwzjNqrANh5XxTu7k3RAs=;
	b=jCv8rho548uBth9/IyJpoQxJ7ptTh55PSmcxVZ6fZd7GSDuE6LZ5B0YSmktONvq+/itU
	 S2Aqo5YW767Lgy5andlYCSOPsEsrV8Klef1E95rcSan/arFxMLqWe6T2fzMqlujmoWq89
	 fVGbg7V9/hn85pv+pllctFoTEINsTDPmXoxyBOXOVV17X2KUIUyylCbgjAfWYbngxlmtY
	 gzDE9BAxmrWsP9Jjj7p8nV7NhAKYG2Qjc5CGJYdw1tbadRmRTp03ujNdbo/IeeT2U3Lvf
	 sbDCzUqhLgzbnNmyx2MtKMmQnY3z3/z4nKUjrGgdBl3FnDojrSDujSm27sbWg2OuYEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AhFrqsnC;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ECBD60716D5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3ECBD60716D5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AhFrqsnC
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so1285327b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629819; x=1794234619; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gts2WqsGwLc0uD/7GkoBlKKwzjNqrANh5XxTu7k3RAs=;
        b=AhFrqsnC3Ik6bM6eJ1D4rU8ykzPEqJVxX4+qAnGC4zFCpQiY7s2u5DjqiykTPZdl1e
         aK2gEa+6RL+uNAj8OPB5jOCsyFsbfzXmpkVK8QSeMIhVIvRG2OyGOrV5OIQJDVkWfRYb
         6flsQq7/3cm04SJf51HSMqfu9g89z7aRfaKIE5AssHjiUBr9URgi/yYXUhvcgyNDx80E
         uSBQh4szvw0fwr88zRHWGGBA5nfq4eIVoJVueSARMjyv589t0//dPKiByBx1M1EaUF+4
         Yi7Mi2pQSB+FAKrG5mdWZgJDEhQyi3uBiqDHNxo3NM0rrCWEYm2W52z8rRhSJnwRDs00
         lGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629819; x=1794234619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gts2WqsGwLc0uD/7GkoBlKKwzjNqrANh5XxTu7k3RAs=;
        b=1hYKOINYwZqoSsvN1CjFuQdYGTca9FZXxb22ZBaYwJwTJJD/iW/YuB2UtGBaRkDBJp
         GsY+WwWxBSzVpCL5fV5RTUMWd1L9Vz5ccMZiwAN2FnydetoVlGLgDk7mBtaz0Bhx458G
         T98nZiuyIfhpbVU3nPShlXIWRxQhJwcORGclkjWNzwceAPsnZZPsRKfigxZN4HVbZ/kK
         FYH5vE+Bhmpg7vputN8uZe/Nvft/rcfaGfpTNuZprNvz/liP00p21VDffYkhNy8V75pd
         lhMhJNwloz3DH3e2pfB+YIBS/Qt20xpJV/cppgJhD6Wo/MKQsthU0UB6nuVB5rtvpf1t
         rDkg==
X-Forwarded-Encrypted: i=1; AKwUvBylPzGFrtr0RnjnIsZLDkt0fQfAaqz+i1EIzFVPur55gVNg888FM7nl1/4q2BV69VVHHkoWOT5XOxYL3Vo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VyiomvyFd4zxKLHvEIfWk4BJZ1AIhFGhzm2RhTMqS1scZ6Xc6
	e9v3VYkYWTjEqQE2PyPJeOJ9QpuKjqGSZ9jHy/SulPX915Isckp7Mo1s
X-Gm-Gg: AYBFou0MGByDQEtQ/0PTHMGuTw/6UbBv5aGRPA5TGWfAOM3pC+fqclTVbdp/5FcmlaN
	TvN/ZAmj3hyJjLP0pEsQKfscEBPPJqyr2sgIy3zAEuCgQEz0sJ6ELuNiGc0euGUtip2GLdiBLYn
	U8YjtS1mS5rNPFckez1d0Gr9kEPz5YpCQJf0+A2uBMXH47ocROmPu5j/8OqW2W9h4Gts6D4E8tP
	oFXmN4dakazwXctnWveiFPiLgFHJ59piSPiZOsRNaUr5sB3cuS79ZMjH5sxEpLAoSjoXgenXwZM
	6m+CqYCOGmzVspfNNTSVoNpccSeR0Se6lz1VoYLqj3USNxhq1zn2TXLcdQ2P/kcancbG6+pkL8d
	mWMiZrHhTrm9NsVlOIkolm56APGkaDBTcHrVVbJ6Rs9zVNPtN9ZVZ3ESz4IXYQhaAhu/sHSFotG
	t9ZlyT430hoNumww0kzYoX/w7krfFtJAki/wszynqiy/rqSKtgDuQO3bwqMggRgfERGUsZ67srH
	qlLY6nzrjbAxCVTxw5jZPAVGsLrOge7ODApcD1JYgE7/Ehf7aIs0qkYKXdbJLplR+3spWsqR+bg
	ipybdUKUbQBNGGN+pAQ7sBS3R0SlEy+yH7fhtXLUquQEfrSD+3wCURWL0w==
X-Received: by 2002:a05:6a00:3908:b0:898:22b4:c8c8 with SMTP id d2e1a72fcca58-8a9ba9f783dmr7803008b3a.2.1793629818400;
        Mon, 02 Nov 2026 06:30:18 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad77fcb8dsm2219095b3a.1.2026.11.02.06.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:30:17 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Drew Fustini <fustini@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Radu Rendec <radu@rendec.net>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-gpio@vger.kernel.org,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH 13/18] riscv: dts: zhihe: add A210 core support
Date: Mon,  2 Nov 2026 22:30:09 +0800
Message-ID: <20261102143010.3785824-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-radiation-ivory-c8f9f9c66b7f@spud>
References: 
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

On Thu, 22 Oct 2026 19:48:36 +0100 Conor Dooley <conor@kernel.org> wrote:

> On Thu, Oct 22, 2026 at 03:53:33AM +0800, Han Gao via B4 Relay wrote:
> > +	soc {
> > +		compatible = "simple-bus";
> > +		ranges;
> > +		#address-cells = <2>;
> > +		dma-noncoherent;
> > +		#size-cells = <2>;
> > +
> > +		clk: clock-controller@260000 {
> > +			compatible = "zhihe,a210-clk";
> > +			reg = <0x0 0x00260000 0x0 0x1000>,
> > +			      <0x0 0x00250000 0x0 0x1000>,
> > +			      <0x0 0x10141600 0x0 0x100>,
> > +			      <0x0 0x10141400 0x0 0x100>,
> > +			      <0x0 0x04810000 0x0 0x1000>,
> > +			      <0x0 0x05810000 0x0 0x1000>,
> > +			      <0x0 0x04900000 0x0 0x1000>,
> > +			      <0x0 0x20250000 0x0 0x1000>,
> > +			      <0x0 0x10140000 0x0 0xe00>;
> 
> This looks very much like an incorrect modelling of the device.
> Most of these should be individual devices, and those labeled "sysreg"
> probably should be syscons as they likely contain multiple functions,
> not just clocks?
> 
> > +			reg-names = "pll-wrap", "top-crg", "cpu-ss-clk-sysreg",
> > +				    "cpu-ss-cpu-pll", "ddr0-sysreg",
> > +				    "ddr1-sysreg", "slc-dual-sysreg",
> > +				    "top-crg-t", "cpu-ss-ccu";
> > +			#clock-cells = <1>;
> > +			clocks = <&osc_32k>, <&osc_24m>, <&rc_24m>;
> > +			clock-names = "osc-32k", "osc-24m", "rc-24m";
> > +		};
> > +
> > +		clk_peri: clock-controller@300200 {
> > +			compatible = "zhihe,a210-peri-clk";
> > +			reg = <0x0 0x00300200 0x0 0x4>,
> > +			      <0x0 0x02010200 0x0 0x8>,
> > +			      <0x0 0x08400200 0x0 0x8>,
> > +			      <0x0 0x00540200 0x0 0x4>,
> > +			      <0x0 0x27420200 0x0 0x200>;
> 
> Same here, particularly things that are only a single word wide...
> 
> > +			reg-names = "peri0-sysreg", "peri1-sysreg",
> > +				    "peri2-sysreg", "peri3-sysreg", "tee-crg";
> > +			#clock-cells = <1>;
> > +		};
> 
> > +		clk_aon: clock-controller@30844000 {
> > +			compatible = "zhihe,a210-aon-clk";
> > +			reg = <0 0x30844000 0 0x1c>;
> 
> 0x1c is also suspiciously narrow, but believable. Is there a register
> map for this device available somewhere (ideally in english, but I
> suppose machine translation will do a sufficient job) so that I can try
> to understand how this device should be modelled?

Thanks. There is no public register map, unfortunately. In the next
version the E902 firmware will take over these blocks, and Linux will
get clocks and resets through SCMI instead, so they will no longer be
described in the DT.

> 
> Thanks,
> Conor.
> 
> > +			#clock-cells = <1>;
> > +			clocks = <&aon_110m>, <&osc_24m>, <&aon_rc>, <&osc_32k>;
> > +			clock-names = "high", "osc", "rc", "rtc";
> > +		};
> 

Sent using hkml (https://github.com/sjp38/hackermail)
