Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866414;
	b=NHfS01iQMyjJ1t2l5AQoeBLiXhqefvruHf0J+3JoDS6UW2uxsnlRiiz09rikIqGWBCNk
	 cJW2ntveo94DzC8isoBiV76fXBc8Ja+A9zAgJCyMGQJEZciXsV88rtWaEi0khF/mzQCfr
	 xTY5+HSqcoFmSTFxZ7ChFSI57Oabqm6rIPRN2FsTCTh+F2GU33/Vqc0VKF1kInjbh67K2
	 Q3fheVMdrMNKU8gQJ1sYiFG2lzqj3VGRt1jDeRsUO8T2fyVXTi7Vs8ZPd98rj+32NeUKf
	 buyI1J5f6f/uAXVhz8J/d2z+T1UyNl1sXN3HLeY4id0ReuaAcxRpfNpZA4Hlonb/ZMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866414;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jlWCa+Ofak2MkmBMb9UdsVFuinXs/6ER7CxYuPtulJY=;
	b=eUNRABuzZVm5UFYBEXLA3CL+jQX9TmXaLqJVsbeSpasuNMQg3eVEO4tzfblvItGo9mTz
	 XhgGhC3mU88OAPJrevySYb8DUV0yEJrTyjH52nh/t0Whtd1hbKOCGXk2L53deAI3d8+T6
	 le3qECkFSUhGAhR1+pmHEH11I5o1lM4fj0z267C4cglRPkZl+0bydi7Qjema+aGDN6/7U
	 uDJICIFJdexk87jmskLBTc8cNqgI7L6TFtnkokM2dmMVlUI+TvSwYt4egGA6yB/lJqXmL
	 bhbOax0Avp73M9Lutw3z8yVxI0Ux73qxdgr8siaJ5TF9G/nu3HU6d3DkmfXONFOkDEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rn91bWU7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252BF606A31B
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rn91bWU7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92EF1F00A16
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866408;
	bh=jlWCa+Ofak2MkmBMb9UdsVFuinXs/6ER7CxYuPtulJY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Rn91bWU7eEk1jRt5O9Cye/gdcgByxVo4QUbrZuuv03hpN/T3v99LrhoOyk84PGAku
	 PU+gRrRpcKgclU54vnrT90xjd3CikDDaYjaW4UL/0nY4+/yEUSV6Jg502Ref4l9hj5
	 7ciZnp890RXp0WeMShEo2TGD5+wBp9vAG0R1SYfMSU+2nj4T5I/L1wddQIu3tJ32Rx
	 GVgeCxi2vTl/1KkeckMNoSYYgFFxYqOnh7MUeXsElyfwzVh0fNH65gJwFUeajhlTTQ
	 dRqNmmFAl0ybZKll3xxxVfTsmLLmWD4VWJcSNzUhDSTE6ReRyHSrnGMxoDGT5QA0XE
	 JLRYO2WDjMrOg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfbc67991cso993666e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:13:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByOlOr9V9w7+YZcyIjpopPtfUEuqEOm54fX1ZhqX62e7FgmnrRsAyzdoWmFrED4dMuVc77aQrAHeyKVrOc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tKyou0RZfZa9jzxu60rBJvLZDjVn8ljaMIjFL9rBt+PFFEgJt
	THkv8n7nHmSEZ7uzf7SeCWGgT6xcalYvXvfCOjMwEnSdaIy69bB/sthsDw648ABVjsk5ySzo4ng
	+oHQoRsligTZvB9qqL4HMg6lofGHwSRM=
X-Received: by 2002:a05:6512:3e20:b0:5bf:d206:bc26 with SMTP id
 2adb3069b0e04-5bfd94c7e0amr6889566e87.0.1793866406812; Thu, 05 Nov 2026
 00:13:26 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
In-Reply-To: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:13:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkS7OPcA5hA2tLhhFFkji29Lcr460a3DPV5=UeXyc5sJQ@mail.gmail.com>
X-Gm-Features: AclHuK_bhtGwCSU9thh38-UOS8a9eTleEx-MeSVkCBr9loj6IWXhGYq_ixlEevs
Message-ID: <CAD++jLkS7OPcA5hA2tLhhFFkji29Lcr460a3DPV5=UeXyc5sJQ@mail.gmail.com>
Subject: Re: [PATCH v1 RESEND 0/8] Add ADC, eMMC and VGA pinctrl for StarFive
 JHB100 SoC
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 11:23=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, pe=
r1,
> per2, per2pok, per3, adc0, adc1, emmc, and vga.
>
> Series [1] completed the submission of the first 9 domains; the current s=
eries
> provides pinctrl implementation support for the remaining parts.

Patches applied for kernel v7.5!

Yours,
Linus Walleij
