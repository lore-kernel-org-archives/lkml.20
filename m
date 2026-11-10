Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794353852;
	b=Pn2XVPTor2VaJODY6mMt7DG+HdukaLcRnMaDZPpASn70ulvL2v9aI7p85moqOdbhLKzP
	 CmzPweqYXuMgqqtgWNaVi4UrdocByeODIVE9apl49z1t9LLU4yXJToTlk715dmRwJusTZ
	 vLyqDTFPk1XiArXEQIuaICmNvuxCjN95/r34pA6sZZ+rS6QaWN/NYkKCSGJzb2jSIEZ9Y
	 yE4XpB30xChkG/urUlCg2bNiVvK/XUMcolka9LI+OD6MwMnMcdxt7LDquUXGjpVfepmRP
	 F1ar8qtfI6WsKRMqcYynCksnz/ZfWnHJ7PSaT8AI/+lPBIPglLfFOhV6tzuIQ1QFj1w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794353852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
	b=23nRye1t3b0gf4mw6vTJrHsp1DqocB2FZn1dAwGcjhmfj+O/6OThHBAfA42Lq7Ugd7C+
	 guK/ocwOZ17sHguHwdpoiBL4wg5I2jNwECjUfHXryy6+e0pjhe7u9UaQupPJ2xYAIXjOK
	 wiHwrSccJLVwUGkeVSRK3R290G8VH25dEykzowdFq+cc6cHTQtXbtrf2+UNe/rAHXIsdt
	 MA/HYzlPbiM5eDK0sWDjIRN3O0TTVAoJ+GDmn7huMuxPL4Ej068wz3tWICwUHDIM9+a7P
	 gy1YYdGsj5GbQV9mEUYA9BX38G7ybzg+pfl+Y5y3fNRZ6C02ho7lSbe6atsxAwH189Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elQltWuO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E24606A320
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52E24606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=elQltWuO
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so3777387a12.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 15:37:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794353850; cv=none;
        d=google.com; s=arc-20260327;
        b=YqxrvFKJcI0NDh0AFb8L38UwY7GYHMKsnLO4v5s7pK1Ch4PiLZpqWyVUhoBOIYWIio
         aoHiBXuwJw8DRhsn53MtksIklQgsFJoqE+Saq5MRr6oz3I/6as+4AxiC5wPFIhtEn6GA
         6NMuV3Fb9Bf+vXqNkTR6QGfS7tgsHNn+X+J03Uo5I2qhfIEIheCeqJRF2otrHPwHypWw
         a5MS25aMddiv+kxL2zoUpAlcXH9twdXLZZJcTg8O7Tcu6f6wc5Z8EM83gZicOg9yRk2a
         MZz1BJ6xdrrZixX8mmIPlNVs6HGgsO15eBSrYxkBa2kOjgWFaM3MDQ8X+4XPZGDXPlFx
         7UOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        fh=AJphZX0iLKJrHCNkARkMEoYbu+GQxFC0a2N0XnwlQxo=;
        b=iS46kpsNedOvYbEteZxh7mOUUibxFve4N5PNBeJNhCxBgwDkFrdIpytKvqiFfaet52
         0RGkxKFBxP4xu+73WsTQdDoZCPeZl0rGz9PU7HZ3r0Io2nhBehzgjMWoUWpWkD1NhLQj
         kqC1XvsB2tBI0YoiphplGBDOtPH2re/yDyNSTIP3MeAalEvXOBC1QZ/ZJst6Yl9+/I7n
         B9DI57BXCKvd5NQoCGPAO545scAL+pBJ0wXtIc8IlSQL0KcTusp1viDx7zmNq3+36Aj1
         q194sij/BRlKnoRZSq4dluDK6I7ZCO+V5j56V6JgjLc4MkKiU+SOe2jSuE/KPA6DgOkP
         2WzA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794353850; x=1794958650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        b=elQltWuO/DkdGyaaLFYg0iABITYog+QbXRiK/p+gfA+oyGOiHjeAF+1qPdhV0er1z6
         19g2uFdXYKkYpF/n8Lo0CGEIrykr640l7VNsN9N+m/sZgVkvwKmQKCoxboYB5jX1S5o7
         nKm3+f2zmLDWFiaDmYao2vDAmaVxaGRm75JdGfHFgftaIHQsqBw7pnIHQU1eYzHWI+Zf
         MJp/WiosLChIPSTcgQ+ewBGDaKX9lFvg4TGCaQBU2lG0GZ9gYxBzzrFBglQZQSLwmtpM
         iZA68RQuU2bQHNTLXb6gPsxIfWvurVpdkBeLU5D44jSRmRIdPU9aoWCWrXJeTGm2rpg1
         gTRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794353850; x=1794958650;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nrecAgNB4IPHxby0RgRP2xGuUTMOX6YDBh8HwXWvxx8=;
        b=2M14vO1vI6IIarYzkGp7K/0RJgQhoNz7UFiH4dmycWpNxIJGeveDWn6wt41crTiSxb
         KZ3wo7PYZ9cg2mTyuS+6Z3zYPGyduKUGz+uwIInzHnzPOdnOfRUpWZQc+g00031unRrS
         rzIkGslIdbQtzJz+YzN8lgMm9p7tKCamUM/l8prP9pfr66L65AgfoFgrHJ0KrsarYbIU
         ayUEbCgMd7ZNR9xfB0YHmD+VQWe6999j5UmTE0ydR5wIwMrHPA2DM1sjV0S5y/RvLTBO
         Nx8FoaBBq6Qa0NJ1ERRVhgCNcL6bXJH1fw3OCwT9a2kmNuFxlh/hwQ+Pv93EuMfm10nJ
         bdlg==
X-Forwarded-Encrypted: i=1; AL+hErHBOxjNq/MViLJ9fhKinTEUWiv52eiiZh1Y2xSW3KdEUjiqihOGPAeNv+oE6UVKTcTNXAnab7FGLo7KS5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QLpKX5hsSPZ0+8Qcj4NSofvxOggZcSOyJPW3r86ZLvoJzFYbj
	KN0/B6elE6G20LxIjsRPCMxJnl0Lr0JAoHNFAb5a+TJe37sP4orcDhPr4YqwERFiaUn6ojH+gnF
	g41NyqKaSuGsjnt9HGxDuHXX48GJRtJU=
X-Gm-Gg: AYBFou3mxZ2m3d+R210zWwealE7yDxs69o8Wbnmhwg/YEc6dX747hGEiICrWRaxm8LX
	bxfaEQkrQhGXRtcXsxrfW5eRc7OYtucYSGsE51B7BpEICVkL/R0JnRJYx9vcrKYi8pPAeBueFlI
	hdre1MXZ41HcPn3KNtvknNkuH5T//ifnp4IJ5QHzS5iw5JGuLUESSwna+wOYvUNy0ctYJRYn+5D
	Y+PNQSlDZeVW/UFW6F3kW9nw1crZHBqHj+D8NZIrhrqEB9XD8mTOq0N4esV5Fq5UyuSyKuBe0LQ
	WNsVkybE6nqTDRUEkgSdZuNL/2N6PK2kJO+fTAe2oAmw273W75uSXh3Yt1U0VmoGOQ/G8sbT+e+
	KZQAz23IN71rQ3pj5sM9efWPxndlauk5Cq0MPqYE2UAPQ5+mqsq+ehFZ8c1QvKROcHpP264m/us
	r2CkYHMWS0YlVD2lAJFD90eqqOnuyX1zPm0VEco8XzaPCbCpaf9Nwti83d0M/ro+rdQ6HD7oP82
	EQurXzAPISjx3qGaKSdbC4/a8TvYmjakNYpTIFO9OKOMaVkgw==
X-Received: by 2002:aa7:c609:0:b0:6ac:7d0c:2cb8 with SMTP id
 4fb4d7f45d1cf-6b7775eac3cmr391908a12.30.1794353849465; Tue, 10 Nov 2026
 15:37:29 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110013646.1582970-1-rosenp@gmail.com> <20261110013646.1582970-4-rosenp@gmail.com>
 <20261110-lean-pug-of-business-cbca5e@quoll>
In-Reply-To: <20261110-lean-pug-of-business-cbca5e@quoll>
From: Rosen Penev <rosenp@gmail.com>
Date: Tue, 10 Nov 2026 15:37:18 -0800
X-Gm-Features: AclHuK-3dfP8GdD8w98u8UzvEILGcuTgL-XQqP_bC0ngHEJTsAE1kfgHk-4bdUE
Message-ID: <CAKxU2N9y_=m6Rkk86q38yZhK3E=M_OvYUs9uVMFEB_agrEcFig@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: ath79: add the UART1 clock
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Alban Bedel <albeu@free.fr>, Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:25=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Mon, Nov 09, 2026 at 05:36:43PM -0800, Rosen Penev wrote:
> > AR934x has a second, high speed UART that is compatible with the
> > qca,ar9330-uart one and can run from a 100 MHz clock instead of the
> > reference clock. Add an ID for its clock.
> >
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
> >  include/dt-bindings/clock/ath79-clk.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-binding=
s/clock/ath79-clk.h
> > index eec8f399b9e6..f8a98e4d206d 100644
> > --- a/include/dt-bindings/clock/ath79-clk.h
> > +++ b/include/dt-bindings/clock/ath79-clk.h
> > @@ -11,7 +11,8 @@
> >  #define ATH79_CLK_AHB                2
> >  #define ATH79_CLK_REF                3
> >  #define ATH79_CLK_MDIO               4
> > +#define ATH79_CLK_UART1              5
> >
> > -#define ATH79_CLK_END                5
> > +#define ATH79_CLK_END                6
>
> You cannot change that, that's fixed ABI.
There are commits like 2f4788cca881 that remove CLK_END. I agree with
those commits. This define should not be here.
>
> Best regards,
> Krzysztof
>
