Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629497;
	b=1Pq4EyExvFeMpQ1v4yIXZM5OU6WYJ0o3S8rI2D1La32Tjrof9rfdXlPGzJuYsd9I3Yhj
	 jwWd7XyQsBJnqB5yKRnyjy4qgblLfV51ceLOGIpR2n/sOvwcYtG+9gX9yg/XODKUPvqKe
	 oNE4nUdGopcarUbEg9DxZcn3g//J55AXOi/UvdFNDjrFyXkogcrCNHKDEU31arFnM96KS
	 conUdNohZFm/TBk/YnPIKCwoJ6zaBHZUSmE/Nc+autAxlt2D72zR1KZbZ9ucr3kuvA2fV
	 Q2ix5rxhUA7OpKVP1f/NRjPc8x3RfJCkvco6fEfO6CoRw36INKKDjsXNZz+3teFGMXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
	b=bqI07n/RACPWF9VPCG5rbOlexFhE8iXg1feCh3TaiSEtg59UHcAnVSCMqXkHFpTsV6/z
	 sb1MtJ4NJ6XaLdzZQmzuDJ2KKMwul4IdPocvlNpSFUNcg+MUyk8QJMYYmZYhkzSbCUwdm
	 CgtI/TV22J0Q+mX2r1qRe7MaNcmSfBcJzsABcLqwV08iVgZkbcYI+fxdc3d9uUQNxmnhF
	 71nXHPARrcBZa7CMpPWbSlzBo3XEYEJNvKbHissKcyPtwYUSS9/JlIGzwQSZ1389vSFXI
	 hs3lgOFWuVzsKSIkmdc5lvcR6JsXmzd5cUDU9gXGNyer8lLeL3BK3HDZgeWqWo4pZIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="CGf/6wG6";
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E485606C3FC
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:24:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E485606C3FC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CGf/6wG6
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2e7e742a2c7so20489455ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629496; x=1794234296; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
        b=CGf/6wG6HrD1nXTDASXQnD+Py+nvrQdLruMml935MtSVqpMqRekdAtsa7uvlpxZ+1Y
         8PHql+xyG69D71HRpkBzDGG5fWIdtyh83VaBKeRDHQqDRbIMw1W6jETA+ycr+1N50SaE
         sV6L1+suxdiHPijgn/jedn0+KcMZKBsSrZ86BrY6kT+IL3OZMVjQG51injm1sd5TWBD3
         DG6ig865RrIhZVMIrBJaF0ezJoOIHwFPWp+a7JT0kIheHXHPYBl7feIs/uW/PvSoqtoH
         Dm1xZLNWah8+S11qO3EaH7JKiUMea+mDtohV+IcGLvEsYitZ42oM+jZLos4QqKFhOs34
         heJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629496; x=1794234296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e+OZmX8JIf6s1L/six0W6PN/I70GBs5nxLKcsSZPbfs=;
        b=uyFSozzL+01Q1jwxh81whabLjbcS7cssTSEBWdmB4p7wif2qeZnXSzxLYSXw139atP
         AhxgDY3QlHsBhZb1XyudtxXbPLHjRyLpmfIENxhES5JtwOHe+oRz5XcG1SSSfaGpMWdl
         VqwskLAmxRm1ufroWInk6VoawE7CAYVs9Y0sdUdVw/xmXp/zq1VcWD1Jo7DCmHgldm/Z
         qg/aQezmzVLN6Db20efxLYD7COpamAvxVbPiIztMwnp+pKhI8W7AYrogjy9NWRGKkQZI
         QEzfJgqYpUqqS0DT7dHYy3cszV5nLmLak/vGd23mXC1j3rU+B7IuwGvaTefTsoB+VVpw
         S8Tg==
X-Forwarded-Encrypted: i=1; AKwUvBz2Kaz00KbiAPbjCkNErgof6WwaZYOP4YxRt9LI7juFVTC4Pq0QsXUrB4+Xk3isF/+A32+J05bu+tKo2xQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8a4X+d3Jqnq+0eESrSIL4XkWlaut7Vjlol7dsgv7zLzBka7Y0z
	iFHiXe5KhVZ22rbh+r6uofLpe/v4PTm/ZegnNjZZLKqexNajEcGPuARB
X-Gm-Gg: AYBFou1VGQDeDHVlHkp22A87VHxGu01IRoReFeoCsqYurn5vIf/eDv6MUTCdG3jIR3D
	RrpGdlXnvEU+XKxLQs8HBJPBts0102nZkToeS6hLrfGlz+WZjiibYNMRurXmHdzBVtagVpPFqvL
	VsC5ySVv89sM0+8zrP+gCXgFgOJfLym882VUPnm7x2JIlv/9ax3mjohj4ULi+P5EbdPZY3JZVkt
	DERokjNUdVlVVmUDFByQ3ewpNk0GvbUAub5gpqLjik28RlZIzMvJAIJcJILYAO/6tPnoYJPmuxV
	AuNksLyW7KndhYVzBcfLcKAPRDIb8gtb0WDybxTkuAdyLE1XiB+BG7wJm0geDoFaACQXXJknjRC
	SmI29EBdspIU1L4lDLmYkfZ6UeipVHfxnGrRiZPF7syjQVdyCFTv6XDkU0qO30jKjOBMArA4UDc
	Tf7of5A2piXJqkLftzF0g2ZShDPyuuZe4IgsdExig9xDs3sGGPovklKv3iZwMqExNlxw/Z/jDS4
	gLh1gqD7gVzVG8uJEzUW/lTI5xWhAO1QYouC9C3qrg13rokZRnm5sMcpHSWnQt5tFjDi+pTVyIY
	+U4vvbLvtAuJGVsbYhCoIbJHtDhTZl3BUSeRpXDB2+GW0ApfjUe+mgi3sQ==
X-Received: by 2002:a17:903:1a4e:b0:2df:9e44:32f1 with SMTP id d9443c01a7336-2eb364e1741mr69092915ad.29.1793629495462;
        Mon, 02 Nov 2026 06:24:55 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39298543sm28720445ad.60.2026.11.02.06.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:24:54 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Han Gao <rabenda.cn@gmail.com>,
	gaohan@iscas.ac.cn,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Drew Fustini <fustini@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH 14/18] riscv: dts: zhihe: add A210 UARTs
Date: Mon,  2 Nov 2026 22:24:46 +0800
Message-ID: <20261102142448.3784989-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ef0957a4ceaf754989f8a7132cb6276686244d24.camel@pengutronix.de>
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

On Thu, 22 Oct 2026 11:22:51 +0200 Philipp Zabel <p.zabel@pengutronix.de> wrote:

> On Do, 2026-10-22 at 03:53 +0800, Han Gao via B4 Relay wrote:
> > From: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > 
> > Add the ten A210 UARTs with their clocks, resets and interrupts, using
> > the snps,dw-apb-uart compatible.
> > 
> > Signed-off-by: Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>
> > Co-developed-by: Han Gao <gaohan@iscas.ac.cn>
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/boot/dts/zhihe/a210.dtsi | 150 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 150 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/zhihe/a210.dtsi b/arch/riscv/boot/dts/zhihe/a210.dtsi
> > index bbad51a3edb0..a07b67d10633 100644
> > --- a/arch/riscv/boot/dts/zhihe/a210.dtsi
> > +++ b/arch/riscv/boot/dts/zhihe/a210.dtsi
> > @@ -405,6 +405,66 @@ rst_peri1: reset-controller@2010400 {
> >  			#reset-cells = <1>;
> >  		};
> >  
> > +		uart0: serial@2014000 {
> > +			compatible = "snps,dw-apb-uart";
> 
> Prepend a vendor compatible if you need two resets, similar to
> "starfive,jh7100-uart"?

Thanks, agreed. The RFC that replaced this series adds a
"zhihe,a210-uart" compatible and lists both resets.

> 
> > +			reg = <0x0 0x02014000 0x0 0x400>;
> > +			clocks = <&clk_peri PERI1_UART0_SCLK_EN>,
> > +				 <&clk_peri PERI1_UART0_PCLK_EN>;
> > +			clock-names = "baudclk", "apb_pclk";
> > +			interrupt-parent = <&intc>;
> > +			interrupts = <321 IRQ_TYPE_LEVEL_HIGH>;
> > +			reg-io-width = <4>;
> > +			reg-shift = <2>;
> > +			resets = <&rst_peri1 PERI1_UART0_PRST>;
> 
> This looks to me like it should be
> 
> 			resets = <&rst_peri1 PERI1_UART0_PRST>,
> 				 <&rst_peri1 PERI1_UART0_S_RST>;
> 
> instead.
> 
> regards
> Philipp
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
