Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629394;
	b=qSBkFFinzSiTGLcpKRck7RDYYLLdBmjPeUVPl9U3AqXKMoKMNC4vK7rEgF5bsScQVUw4
	 WAYd1tyZPb7aHO3bOXpy8XtRAfAcqeNwG0aPMI6t2OKQIHAN2XbmbBbs2gWXXoY3c7IrV
	 Nop1eBe3JYG7i90SdLAcYpnPhyCzfv7BmVmnk7hGAD4oxaIxyAyfjdg2u2zcPHJNicqqG
	 ewGaLdGlnhGZg7PwCzDxqOTyDA8LPnnu5PV8SZ79urxEQpF3T3iNK37xUwvFBsNKgUT3s
	 rThIiPvxWyQkY1S3Ez/JGc+zZv5Lt70V523U0khHtTCSNa5hI/Vwkdl8VrGuZGai4rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629394;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
	b=2SkLRq8slKbqyhWa3pUMo3PA/6TeTgcoJkUyBxQF5EzGw0YkxpRCq9T7UT9xBmqDJs8B
	 bGoctWN0CuFrgJT+p2TTyH8CIqVfBkUIxztbXdWYVySQ2Dbj5RuFQoMGVcb6w2D5XRZFa
	 h77FtqXwkgRUkyHWEspX/LvILpYaEIYfk9gWvsmMiYYIoMwv2F4MDtyRWjMpEAF3kqVSV
	 16Bd/wQ+2hTtyCeTIlKcncYVJ70fEmil2RWhxuFH+C+IAcAzXaZQ25FVnMt6RBRTOuH3v
	 Cgf2Z54ThBb6Vfqg17/vVbujejwQ5qRtzYn3etE6VEwbTIcTU4kQj7lha9QjKT2q1VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FsI8JKf;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E3360A2613
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8E3360A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0FsI8JKf
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2eb5251724bso6308885ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793629393; x=1794234193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=0FsI8JKfdwQmudyzyfmTQVlPByzYNYayujLicTy5q2pnwA3kjZGMJapOQ6MTLzgTey
         sv2u3Pk+lLXkuI+OC+/J3DjbHekDnHy+c5G087tA2Le9rNkjzfaYr2cQe7PNC7prgD4v
         F+9K4c2P73XReb2VxRYXhhQhkKpKws04CBX4cZ5d0fhkSlP4nDszMoFcdsGkg0xPddpj
         FAEJZ6ff2ipqfgiKbYhKpnZI7et2OEME8aCu3hutxuVw+Fj2dc2lwsCvNoRtZpmnwGCh
         LwR0fZsw6bzXxE1UxIDLU2FvH7e6K5z679/E5PBYLQgS3k3Zkp0liWioZKsz4vJIC5wd
         FcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629393; x=1794234193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3gGF/z34qzW/NHH0K5bqzl6N3TvYgzHsW7PQwuk+Eb8=;
        b=ri15T+qP9YFxBN3kRNjs64ePDOj3N2PWtWMXIpJShjgyq4MFVe5fPbIyo3OJUbaqn+
         x0OrUzYupHOamFPRQhWGzah7R5KHykqcWS3ZyfbASF+vU65oaba8Dzy/kvhrPYpmveUw
         zDSlxUwHwafvxZslsfshwWl1xt5kFE1Hh++x7Z6BJ9N8R3LnZ6EmSpckYuNW/b+ZyFm/
         ww+TmEUkJOs2wpJCQgUosyQvTSQkmqFK6jvciTAJa0WcV7nh0TYPYMMOcPGQQuQwE7B4
         0fhhWP1G/T1BdKS8ZmXyFxP+Fct6NxQei/I/PFihenrIj8pWDQOnWavSkmIRGBzUq9pI
         +iSQ==
X-Forwarded-Encrypted: i=1; AKwUvBxAagDUUjPN4wBan226v/Cmf5qpSfk5VCtkxH6atccPgFYD5Fc2Pnf4OVNCpX5yTMlqE6uRmFXvSnEJ2yc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ccMY5mXCI0C7piMDoH2Ze0wPsk1J1X/lBL5zAc5iEGsCYyI9s
	2vc3VmVKeiltZpp1tn9LiI6aoftAvZjoZT+vBnMrxIvT9+150RrurG2v
X-Gm-Gg: AYBFou0IAwsfIXT5dQbycXyaOJXc8TP/VKlInBfnaWgLUcDxPhSsGFbNpJiAs0dya4g
	3JwcZGilxTLbeUd7i2Pp5xFH0SkUWif/qyxqgSPEIfjxRkR/w+fU41EQT73etvg43b/Za86BcEo
	OYGMhVc06XsngE2zGmSHP+uQ0XrDUeymM5w1fvjkKvRynXGggPzNMIQjlRdqbczvv3jTxdVI082
	7UijR1QUTNyZlV++j3rPBq9xQ8XsWoyVg3P2ewP7/W4+brTt3Fnk4drCbFmouXEsg7chgBm1dSX
	9aH/qkZmUEnhqFnp92VHcPDDUBiE1aDPYUGMTGwAx/Kr4kmmglhYUuRaGuETkAaf6ty2MT3n8fR
	JUJdtp03nJO7pv1GuiYOFvb1KYyOAYIU45XNqtztAZ2OHgcnkrFAsMRv0UjDXWfluMQl/gk0BRt
	CYFpqoysvR5K9sOhbunLOmsJVlMFsR4Yk8dwwmHuZIDfqdSSB8QHARwlLqBBqStguL/NtRZi1+q
	T9qfwYWttSISHdn+OocZp+kC/7mNXazojHO4J+g1ieoNDvS6rF97SdrwK9dOUOxDD2XJ7EiCGCu
	aeBvrvPJox5LdiILpAH6caeBtdoDNav+sHpr29xnahmQR3ONO6EcTbpEeg==
X-Received: by 2002:a17:902:f70c:b0:2e9:5829:9b3b with SMTP id d9443c01a7336-2eb364b55b9mr86204895ad.35.1793629392936;
        Mon, 02 Nov 2026 06:23:12 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392486d5sm29700245ad.29.2026.11.02.06.23.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:23:10 -0800 (PST)
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
Subject: Re: [PATCH 17/18] riscv: defconfig: enable A210 support
Date: Mon,  2 Nov 2026 22:22:53 +0800
Message-ID: <20261102142300.3784622-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261022-concrete-rebound-593001f1ac18@spud>
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

On Thu, 22 Oct 2026 19:50:51 +0100 Conor Dooley <conor@kernel.org> wrote:

> On Thu, Oct 22, 2026 at 03:53:37AM +0800, Han Gao via B4 Relay wrote:
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Enable A210 platform drivers and reserve ten 8250 UART ports.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  arch/riscv/configs/defconfig | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 04ae305d5511..b9b3bca12089 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
> >  CONFIG_ARCH_SUNXI=y
> >  CONFIG_ARCH_TENSTORRENT=y
> >  CONFIG_ARCH_THEAD=y
> > +CONFIG_ARCH_ZHIHE=y
> >  CONFIG_ARCH_ULTRARISC=y
> >  CONFIG_ARCH_VIRT=y
> >  CONFIG_ARCH_CANAAN=y
> > @@ -149,6 +150,8 @@ CONFIG_KEYBOARD_GPIO=y
> >  CONFIG_KEYBOARD_SUN4I_LRADC=m
> >  CONFIG_SERIAL_8250=y
> >  CONFIG_SERIAL_8250_CONSOLE=y
> > +CONFIG_SERIAL_8250_NR_UARTS=10
> > +CONFIG_SERIAL_8250_RUNTIME_UARTS=10
> 
> Why are these options needed?

The A210 has 10 UARTs and the TH1520 has 6. With the default of 4,
UARTs beyond the 4th don't get a fixed ttyS index and end up in
whatever slot is free. Raising both to 10 keeps the index stable.

> 
> >  CONFIG_SERIAL_8250_DW=y
> >  CONFIG_SERIAL_OF_PLATFORM=y
> >  CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
> > @@ -167,6 +170,7 @@ CONFIG_SPI_PL022=m
> >  CONFIG_SPI_SIFIVE=y
> >  CONFIG_SPI_SUN6I=y
> >  # CONFIG_PTP_1588_CLOCK is not set
> > +CONFIG_PINCTRL_A210=y
> >  CONFIG_PINCTRL_TH1520=y
> >  CONFIG_PINCTRL_SOPHGO_CV1800B=y
> >  CONFIG_PINCTRL_SOPHGO_CV1812H=y
> > 
> > -- 
> > 2.55.0
> > 
> > 
> 

Sent using hkml (https://github.com/sjp38/hackermail)
