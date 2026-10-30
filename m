Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793360292;
	b=oV5L3Xxam+W/5CZo4G2iofDk3FxGPHP7TmmmCXis67UNkB/a2ChwnlLVpdsJTUoodH3h
	 5GkKzp3Jrn7HvTVsflVt0uvhxnvmgzbkD56h0kkz4/aYQuEce9qjV1vHY58Ay7Xe1nCBB
	 UaCb4aK1Ef5XTnmOL8mZhOH3G8/UTjKKV1Tr8DetGSH9AWvOB5o0zRJKN18v80gj0XbWx
	 Hz8wg3KEq5Cq9hLHDrfYNbGcaBXLgA40vcMfpNorP2U833j69G1cmIfo1FMOAWF1Xy5a6
	 PFahcc75LjrnqZ8KC5dm0Mmy8TafjDClUygRhabGaQXvSYN9mgFIlsBE9Wi+LbpszJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793360292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=e15qUec2OZ0h2GwREdIp79FcmOHYvFA4NalPpqIJkEE=;
	b=0UWS4HSzsWE2R04t2jrIJS1DoeBsafXBR9E6tEzfTHY4yvpG3bv6E6Z6k6p8CSkzDSOM
	 Rz+bXTQ7zXvafdM0JCfJ2zzuXe7IMuc+stG8RA3FJzwEMsOUOXwNd0YBRqum68IFIdeuX
	 55QkUn3GjX6ZRLUMRpdiDfkEAGWs2DnpHBM8kCXtpoFF2yMZi2YgYVENP7C7mB3TDjlAB
	 C4ijKTDuK1ZfjdVYIvgyPV3TR1Iqogqwmqy/Mz/g4KewT0hAc9BMZSGytywvuMYSk8W87
	 7TxsvdPYppv9Nhx/aX4qCS5E+cbtnI4NPRpau+i0pE5q9H+6VCSnSOWOT0JeWb9yF9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE+EbX5K;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15511606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:38:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15511606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tE+EbX5K
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cd5d2dafeccso300614a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793360291; x=1793965091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e15qUec2OZ0h2GwREdIp79FcmOHYvFA4NalPpqIJkEE=;
        b=tE+EbX5KjLQieRMqd53kce/1beDxB0fzvNrXs+EesbVbO6RCbTs3RUvFY2aNHMLqRi
         S+BOPfIe4jnCUuWdIKhOxX9RwPb8om8Txoj5rtTVhA3UxtureS/YrL7Sz6tJ5r+Prd4f
         kKzAeVO8Hcy++POmk1YpQs4j5e5UC8tbQpcaS1nsKqHeRkD/Ioe37qOmbDTYN7QsQn39
         otQXCXtItQPWq1TWhm+b0+s+nfhP2ckecxD31qkJTUOaumPl08H4a1u3QFXro9x5HV2I
         b2BpRZCuNZPlMEJxlCCB42OEtgrFdAouSz2XGIBq2tGXmrmxX7KCtzfWzQxwtCjOjakR
         RyBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793360291; x=1793965091;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e15qUec2OZ0h2GwREdIp79FcmOHYvFA4NalPpqIJkEE=;
        b=w8GUlfI4SvzTwu+GG9vrF9Ta1Qnc2+Ls1Rpg+F8ybFPveN3q40M0Qb+1KECvS0yOpl
         j2u7OyMeCs55RPEy1/63r/vBEskCkS5jewljixkYh49ZFwRit4bV4Pi4ho2w2ELJSkdE
         tWyLApj97S8gdi6+mtLkFEarPbGj7CIDE6GlAQBIAKZAbzyVGxJJ93O2bhTnkDShNWDu
         jDE1mDKKlhsui3tub5eadoH6sfRJisKiObvl/uFXtqYrORAOMEHoaG6Rer+R6iCZfRzT
         XUXtg0Kci+7bB8deKtdBpSZskdpeT5Gg2MEoehtXdeJz3DtLRqNzaxBDO0s3j7fsC9Bn
         9KNg==
X-Forwarded-Encrypted: i=1; AKwUvByzXdbp4EjgfVVrjH8OGjavAxkHZmpyNZxXvE5VnpsDaP/Y9HXuhMWHFUEdUkMFhPmQWvbYTJlOcVr43Cs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLhag7CVTxfODESBt+LeEX4ZASzwO+jR4QJPMW7Rw7no1dnh5Oa
	4GqPJatXVutxVM4HDwWDaWm3nl+FwPGLa/WC8vUwRRBgLkT+fF08YZN8
X-Gm-Gg: AYBFou3fyu7XB2SkRtZUo7Cu7Bl+ZJGruh1kKRyaEm+qptd1v9bJSTSY81OhckgB96j
	4uB+6odMyV+C71gDfDYdSJYNEO0WG97XeTUE5VBDv8oA7hN8lJswV7/kxCYse5wDu7CqlnRgJ1h
	XiuwSXofZit0mNcSEYa/FY0jhYM47YQdg1oPQ/aG07Vb0qSnYmdi4bj6rVUcE08rMY9d/Uq6LBg
	A244N41djitonMrwXjIZEEFMxNcgNjjd1jOC35ggyAjyzVz06bgqebyx3l2vgo2nfjVuTlb4Nz+
	ws38axTHDBJg1sYCzk+zPcwZ9C68YvrghtMRTH1E4i97U3mNr6+dd7U9aA3mjrnsE9mGNjREAJk
	ogBZmv2cQGO3OqyoyUmtIGdcuvm6E20Bm67RNW5A4PtqvF6Ecns3ilxgSqJJZA6HhPHU/lDEhx5
	yaKGsU1KUe1gMxO6PY7KzRGrhKC0OEl+U8uc9WA8kqdid35X6ujeXqnLugErcS+juNF/SFX+L52
	LK1KWk7RfvYN/yS7SwNYp99JTbNCGrQCDjkJAPtelEhLYKFKivJhOc/of8WF7/Yj+FWDxJm3lkF
	t7Pi6UNxJSyakBZNcmw4EA==
X-Received: by 2002:a05:6a20:918e:b0:3e1:dfcb:5a75 with SMTP id adf61e73a8af0-3e928956abfmr1766192637.21.1793360291245;
        Fri, 30 Oct 2026 04:38:11 -0700 (PDT)
Received: from debian ([169.211.140.146])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9ea4865c8sm679545b3a.0.2026.10.30.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 04:38:10 -0700 (PDT)
Date: Fri, 30 Oct 2026 07:37:54 -0400
From: Kwanghoon Son <asdfkwang@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH RFC 10/12] riscv: dts: bouffalolab: Add Sipeed M1s Dock
Message-ID: <auSBktpboye35BrU@debian>
References: <20261029-rust-bl808-console-v1-0-b736ee920078@gmail.com>
 <20261029-rust-bl808-console-v1-10-b736ee920078@gmail.com>
 <20261029-pork-resonant-fb692b84bef7@spud>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261029-pork-resonant-fb692b84bef7@spud>

On Thu, Oct 29, 2026 at 07:07:00PM +0000, Conor Dooley wrote:
> On Thu, Oct 29, 2026 at 01:05:51AM -0400, Kwanghoon Son wrote:
> > Add the M1s SoM memory and 40 MHz crystal, and enable UART3 on the Dock
> > with a direct stdout path and 115200 8N1 settings.
> > 
> > Boot firmware initializes PSRAM, UART pads and shared PLLs. The tested
> > firmware configures D0 TIME at 320 MHz / 380, represented as 842105 Hz.
> > Firmware using another timer configuration must fix up timebase-
> > frequency. The declared 64 MiB PSRAM range must retain firmware
> > reservations or be narrowed by firmware when memory is assigned to
> > another core.
> > 
> > The stdout path selects the native polling printk console; userspace TTY
> > I/O is deferred.
> > 
> > Signed-off-by: Kwanghoon Son <asdfkwang@gmail.com>
> > ---
> >  arch/riscv/boot/dts/Makefile                          |  1 +
> >  arch/riscv/boot/dts/bouffalolab/Makefile              |  2 ++
> >  .../boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts    | 18 ++++++++++++++++++
> >  arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi | 19 +++++++++++++++++++
> >  4 files changed, 40 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> > index 69d8751fb17c803f0efb8003e111ee24144c222b..294f9c119f8f1d608c878ca1f95891843301f07e 100644
> > --- a/arch/riscv/boot/dts/Makefile
> > +++ b/arch/riscv/boot/dts/Makefile
> > @@ -2,6 +2,7 @@
> >  subdir-y += allwinner
> >  subdir-y += andes
> >  subdir-y += anlogic
> > +subdir-y += bouffalolab
> >  subdir-y += canaan
> >  subdir-y += eswin
> >  subdir-y += microchip
> > diff --git a/arch/riscv/boot/dts/bouffalolab/Makefile b/arch/riscv/boot/dts/bouffalolab/Makefile
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..4d63365edc095fbe9df31c4b12e29c4b624cbd1f
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/Makefile
> > @@ -0,0 +1,2 @@
> > +# SPDX-License-Identifier: GPL-2.0
> > +dtb-$(CONFIG_ARCH_BOUFFALOLAB) += bl808-sipeed-m1s-dock.dtb
> > diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..c719a53c6e2de45f3718b48ba2116e99c70e559b
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "bl808-sipeed-m1s.dtsi"
> > +
> > +/ {
> > +	model = "Sipeed M1s Dock";
> > +	compatible = "sipeed,m1s-dock", "sipeed,m1s", "bflb,bl808";
> > +
> > +	chosen {
> > +		stdout-path = "/soc/serial@30002000:115200n8";
> 
> You should be able to do this normally, with an alias. Why are you not
> just using what Jisheng did?

Because rust does NOT have alias OF yet.
I intended to post the Rust OF alias helper separately after this RFC.
But if this way wrong, I would patch for rust OF alias together.

> 
> > +	};
> > +};
> > +
> > +&uart3 {
> > +	status = "okay";
> > +};
> > diff --git a/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..ae54e6e301ed2c5a1448d52c530c5074515ee38c
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +#include "bl808.dtsi"
> > +
> > +/ {
> > +	compatible = "sipeed,m1s", "bflb,bl808";
> > +	memory@50000000 {
> > +		device_type = "memory";
> > +		reg = <0x50000000 0x04000000>;
> > +	};
> > +
> > +	cpus {
> > +		timebase-frequency = <842105>;
> > +	};
> > +};
> > +
> > +&xtal {
> > +	clock-frequency = <40000000>;
> > +};
> > 
> > -- 
> > 2.47.3
> > 


