Received: from mail-vs2-f12.google.com (mail-vs2-f12.google.com [74.125.227.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DFC352026
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 15:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788967267; cv=none; b=fgFm7647jamGbgQhUQDiwB4bX9vzF1kARw+laIy8PTK2nckFtItbPY1XJiaJ1kiFBpuXSOCNGEZnsk8A62AOSFipbfujVETV3lg+hc34fywPTgjkP/mutuB/mawUZLt6r0IP0yGMU8aVVWUVKe4W/LPlyznJGxGM/8zIQ42uND4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788967267; c=relaxed/simple;
	bh=XkIfu4GFpqkkfkfU2ELXJLd/gzXud8DjECfS0dWQbGw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CHTRyHdoTNPzQHOnNwY9SP/u/EXj5FsEFdK9e7/wrYOnfYo+0koEMqSjdcfiT2xR9x7mNOmgFxIOG3/PJB7zG/q86e0Ic/OmkL6PCAEJVrxk5//oP59mcj/WEqhdpCAuTdAq2QM6YbdDdiQtXELr5eisiURFjJV41lfAEGoqMY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f12.google.com with SMTP id 71dfb90a1353d-5c67e518329so503512e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788967265; x=1789572065;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xIh1wPKDMe5t+fT3IE0obOGyRNurvI4tDRD2p56gTg=;
        b=ZgtexwEpG63yG1cNreP2Ion2BDjanwNGLLqNmqx/YdvVP3n8QpOOFmMbEymvUgiP8Q
         pSWq33+Ge5frZDHKP3IhTj/8qtOsB5Fu1/CTtnngluxCcHIZhZsLyHeeEg6cQOkii/sk
         mdiX0zd5EyFRvQ3h8U2W+Dzi8S22YaL3dQA3M7PyJXrgVxfRg8oWH21MMJV0C9n7T/Wu
         RVQXvY0Ec2/HXhXTwi3aAaSuDNaRBhLbnqKGsC6DwxpHIGXjb5C10VU4ZoF/0AYNlyI2
         LTyT2+3e3pd0j4gYF1h8/P1pQJFMAgpp4EOOAA6Jx4A+0Qqf0Lgu+s8t8i6FggNADeOq
         +DCw==
X-Forwarded-Encrypted: i=1; AKwUvByc3cAePWvP/1V8P/GN6fEhZ8dW/md5+QubaFJrMD3eVYNFPCqd+6PXjNksQB7jFuRlb7Wkr5BjQ+6TO9k=@vger.kernel.org
X-Gm-Message-State: AFuF++mkxaAJzlxKYWh5xFo8srgh6bXnywQj9AYhb+DLUeEkyAsiDWlK
	Otkkzpc3zr3DeiF2DstTbP3In09IGkkOhzRtdm7tBB/0JHx1YBMdd/h6z+D/DbrEags=
X-Gm-Gg: AYBFou13X9UJaTjkGB+TquH7EG+tJAthWeKBwCtjDw+cShta6XDTkCrwD/gJduxAgP1
	X9BhSvbltNpLGdB+unM1moVjxwXWzIMCHLhYKQve/hlcXKudmCg6GBMf+NbKeKTAHb9+zN5TTmu
	ez2IukfA5AMCb3XZI1m10jtQORRygp5DoBQZE08Nt1RvIChiJNoLzR1XhEPxMuK3CWSz2Ot1tjt
	x/gvq4g3OefBuX5u0PPFMMIbaAoHwQIIXzcjWPP5olKmpzl55yjYdz9OrDWYih0j72LaJR2Yw9g
	0K0ovf64MVtPQ5rnpNt3/LUd1UJWODxF8pQzqXg6IJo0hJ7kRrfNTySrkkH6KZQ6kEMoiC02BNM
	JdPYyHOcmZENG3ENtdBc+LqyraX4u/WXZMTVX70j1Wj7xLRS0+OR5Qgjnz/59Q3EGjFNFQJnz4b
	wLqlkVjrl7LjC3FgCTuGghoUiXjp+lF+vxr5WPoL7vBmCzy6XID+lrEqGigdMRU7EU2f0gTJSS2
	8S+BWKR20zlmsTefKE13xckyiuom+ScA2gW
X-Received: by 2002:a05:6122:8ca:b0:5c7:f1ba:aa12 with SMTP id 71dfb90a1353d-5c81a890efemr4731770e0c.4.1788967264879;
        Wed, 09 Sep 2026 08:21:04 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c7ec366bb5sm12553348e0c.13.2026.09.09.08.21.04
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 08:21:04 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-78a338fe106so4668748137.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 08:21:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3B+iNZumNfJURNuGTZ3wvkfvxRHD+1rqNou5+3p6IiNoLkE+W4UOj73BxFlOcaE2/oRaozLgmi4NZiUg=@vger.kernel.org
X-Received: by 2002:a05:6102:8308:b0:76b:2548:560a with SMTP id
 ada2fe7eead31-78a2efe5c6fmr8198191137.16.1788967264493; Wed, 09 Sep 2026
 08:21:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808025724.131943-1-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWvLX7OZSkfEBA34wKtnoZ4asB6rWFJiLa=2+=fezqsCA@mail.gmail.com>
 <f82ae578-fbe7-4834-bdde-d11e194a507f@mailbox.org> <CAMuHMdXQKL_srr80mUmsnznqJ_qxAoh0TdwyvJ41=CN=2pDjCQ@mail.gmail.com>
 <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
In-Reply-To: <c784aab5-c0c9-424f-9f9d-a0330f60a0ef@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 9 Sep 2026 17:20:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWi7ou=pbTfHXHfjCLShwqWOcYYd3vpLPmUHzMMNFJ+fA@mail.gmail.com>
X-Gm-Features: AcwNN1X2mn0ov-erdE-79oChYQokKwSLC2Xb3xUhMRJG7PmcUAF6Kj0jO0aTaU0
Message-ID: <CAMuHMdWi7ou=pbTfHXHfjCLShwqWOcYYd3vpLPmUHzMMNFJ+fA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Add overlay for
 WaveShare 2CH CANFD HAT
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, 9 Sept 2026 at 17:16, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 9/9/26 9:56 AM, Geert Uytterhoeven wrote:
> > On Tue, 8 Sept 2026 at 19:02, Marek Vasut <marek.vasut@mailbox.org> wro=
te:
> >> On 9/8/26 2:02 PM, Geert Uytterhoeven wrote:
> >>>> +&pfc {
> >>>> +       msiof0_pins: spi-ws-2ch-canfd0 {        /* SPI_0 */
> >>>
> >>> Node name should be "msiof0".
> >>
> >> Do we also have to fix up
> >> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts this:
> >>
> >> "
> >>    755         msiof1_pins: sound {
> >>                             ^^^^^
> >> "
> >> ?
> >
> > Might be a good idea, to increase consistency.
>
> Submitted as
>
> [PATCH] arm64: dts: renesas: sparrow-hawk: Align MSIOF1 PFC node name
> with label

Thanks!

> >> But I wonder, shouldn't the DTOs contain unique pinmux node names, whi=
ch
> >> cannot accidentally overlap with the base DT or other DTO node names ?
> >
> > In general, the answer is yes.
> > In this case it is about pin control subnodes. If the base DTS already
> > uses msiof0, its original user needs to be disabled by the overlay
> > anyway.
>
> The original DTS does not use MSIOF0 .
>
> I think the proper solution here would be DT connector ?

Keeping an eye on Herv=C3=A9's work...

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
