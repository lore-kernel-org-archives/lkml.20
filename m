Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793891202;
	b=pa+TR4a/KmeLACusEnkH/urVdBAeJ4SM+pbpwwyDGXfDg9Py1/CnUeL5fWYbCdmCV9hr
	 8+XCIv3t6AMrXyDOZjs1QU/2NrgqMDGivoesmPUOhoMHbR0CFhcQPj+yj7WA5a6U1b4TY
	 lFATK8kQOGXADtTEAFsDGg4E3FvhbpbU9Kp9qobbtfhVi371Wl5NwQWICrvs58NG522op
	 pohvdDFJrJXoc5hNzdLvvLTapr2thOlgwr4S/9jyaauFuaHYA0fWIzDj0DQs/wJk/zE7T
	 2nViNV8e/QHIaeIDUWtnzTU7QIaDM9lLbYDpd0eFXhjnyYjfeo7BSRDkbvOXFd6LrPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793891202;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lbu6CYbZmlg9LDpHvg31OE0O9sdelylvCrdhRi2mD7M=;
	b=JmM/fDMUood7uk5NcK7bHS+GfYJtwaQ3iJWhAbvsE8iX4BPb5C0gkUTtcBf8aZVjoc2k
	 WG1Pr84NqAOIr2J6kjgugWnkezJJ+zBT/cfm0aTmar3M6pdCH5NCx+FUTV1c8MFz1RyVR
	 rMD8o7nGVsMi5SABvF0E3eUsxZanfayhghjczs9bvmEpOadS+sOdEvB6XdfdX47LzxIxo
	 oc92tLnx0+yn0JXjuSUOmCut3nPosxkellkFu2itb29kYO/YTnAjG5YcwVby9dH93otYZ
	 BxbcpzHC/42XzELU7WHBT0mrdgux/Q0hyv/WEx7djqWaVURPs02kEfOWlDUyyoMpdOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ln31vRMh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98A606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ln31vRMh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1161F000C1
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 15:06:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793891200;
	bh=lbu6CYbZmlg9LDpHvg31OE0O9sdelylvCrdhRi2mD7M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ln31vRMhbFvxkAtvzVW75Y4HBOLjjrZC0SmEKIotyieRcq6ES6mnQJRuRutgvH4na
	 2ntrXnFKWKITMWAZDTiek9ZeFMQEUUB4NGEi2Eu0bNaA7hZoFrl3esKlIeoxQpstlP
	 KePk/w8r8S8D/uxBr+FuQ5L8SwZ+izhxnROeVnAgjSXp1NqLSl9MqJocmALEoO6rNX
	 zrIqZEf7SHMIsj1kXWMvhq75PgcbWCWYYrY3OtcMtIQuqevvJt3ppSSdrpSe26Cxli
	 WwCbuMef7RBXF2M9c5Qo5l8pNwwemhlpMcyMXahWz3nvCEa4pFLdfNv4nlc9T1WEB6
	 zv2yO2mIsvHyw==
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b561b60b78so1077920a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 07:06:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwhnmUgZ97hYqqLR/pw5XYW9XlA3RfP4jWU2hBCdVPaxOHKRSusAvPbrsr3Lr7PmvW8h1+T58JwPU/l4ZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z81ZHO+i+C5wN9+sTuJPlMxecnxjsiP+R3OanlBvfiHaYcg/2HI
	zwWP089GUM46FSeh4l+yG0ULNOIRTgt3ArxGTvRyFiqt2TCGPywuXqvrREm93a1X7OithKE/11e
	Ur8qsS1VFxBg+6NQ39DdDwLODCqc08g==
X-Received: by 2002:a17:906:c102:b0:c46:d493:47be with SMTP id
 a640c23a62f3a-c4d206aede3mr244770366b.19.1793891199414; Thu, 05 Nov 2026
 07:06:39 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105144920.2796623-2-robh@kernel.org> <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
In-Reply-To: <krvg6bwsueypasvt6fqszh7itqr3gu3qsqbji2ernqqy6g3t4c@b7hqenmaugik>
From: Rob Herring <robh@kernel.org>
Date: Thu, 5 Nov 2026 09:06:27 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
X-Gm-Features: AclHuK9D1vVYdU6bP9ipfCUqtMD7cNI9yWkFwUZwsKz1kc9xgefpf4aNgPCbR6A
Message-ID: <CAL_JsqLETyrx7ew0zirS9r6+3=GEFaRE0g96OZHYwqjxMCZKcQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: dts: nxp/imx6: Drop unused .dtsi
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 9:00=E2=80=AFAM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> On 26-11-05 08:49, Rob Herring (Arm) wrote:
> > These .dtsi files are not included anywhere in the tree and can't be
> > tested.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > v2:
> >  - Rebased
> >
> > It's been nearly a year and these are still orphans. There was a promis=
e
> > to upstream something for the kontron ones, but that hasn't happened.
>
> That's unfortunate, but these includes are used at least by the barebox
> bootloader [1,2], dropping these would cause a DT regresssion.
>
> Would it help to upstream [1,2]?

You said you were going to do that on v1:

>> I will add the som.dts, please don't remove the kontron dtsi files yet.
