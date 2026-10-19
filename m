Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0C24E1C78
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792407991; cv=pass; b=qMCCfI04Mf//LPbLOUSADW9DVATlQSNd1bn0ImjFo/Cve7eXEJ3lXS1N36I7zcIvaHdgRGEAIz2C/Lq40g/Y7MvVsY1HXtIbno7pSxS3wDcHSP3kjaETlPnQ65wB4ejAHDPGqBxp3g4XlXsIfF0MoVLD9c0BtNkZ5hIoqJqpxxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792407991; c=relaxed/simple;
	bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bm5sFmeMYEx3cR4oToYjaCrZajmguEXjEu991BB5QEVDtrAoxoVid8Q3UFDFEuryiswjAD/Nldg6YAHHympONzIMToAFqDd64MGzkorr5z6fVKRqii0J8485pOUXtmf8ymy9wjI7wnPo2jKRMNIZh8iz7gtl95mg1sjPkjtWv44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=royPCape; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="royPCape"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-679a2b5fe87so1685823d50.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 04:06:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792407989; cv=none;
        d=google.com; s=arc-20260327;
        b=gXQcD8Bt5Y93vWb33ls6K4kmn/i9CCzj0GJ12Q7HOtqgMDenSXqvz07r6U6p6+05UM
         Zx9qN8YaCUQSdhMKtPkyeC81RkTYPc4ibqs8FAaeFfKROdpZHgQ+TJ+QQoEsa6+UK9Ov
         dMxLp2XQb9O5D//kP/mnmbTpcSPsPYjsn6p2bfYAcNp2En/6SQ72UlWgSPNsN3x22SFu
         8uKFoGoNpACz/iJOtprzCjpOqKrx8NE2g1ckhEUWlLSyyl6Jr8ecQvP52nFIHNU3ge31
         AepOs5VfQJpwydZAdW+iYhyn196vNCn6B9s/38yWC8yAecHOPAEn79E6855n/esdGiLC
         gZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        fh=I8YhnQIWUNGQslerpPUI0gLxe5Hbs5D/V0Pkho5rEV4=;
        b=me5Qx2LLaRWDk2EhVpMFyC+PvcyIEcjRPDYdnctsm32c0NpGVnhw+aY/d7w1YIvNGb
         bHH43COvjdph3Gf75xwevZK/cfYvB5294vVVSphpCDdtJRi4xb+Xa2UUb12VgoN/OS5E
         AqOJnUymGPGQ/Gmwy9ZmDqm0N+5nEOg/2FjcqB1JsT6M7jfAwgplSDAjYf+GhCCwLVcH
         0VJkWvFuEqWeyXRpp5XKGAGl3ueBR71qVH3vDa9SWNOhc0ZqBVWb4aKggZMCsEt415/H
         NemtZ7NmCaeFFe2UlYMe8vVzcDsaCyuhAxHSfSjbv+O96bFtoy27VI513pm0Ysmk+fhN
         ou+g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792407989; x=1793012789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        b=royPCapeeg/TQgjtdyW6XI1Z3Y9e0kRCaONDaRN4LR9+5/t2f+H0XhtfNxbSsaAPSZ
         7i3m8d7zAS5+SENiU/wHZU2/Te3ph1w8kjCx19pE0D++Xt3XA6TtH0yu9xuJIlS9MpKA
         q2o4pB+JXo499xZg3jH9iivZgQH1EFi2QlrvuHZPxqp2IwMTVSEUj/JSbrN8kADmBlYA
         5JfLtbg1dRt6PlOBtRpDvYrISOrrLEGMV9wSQ2T2gKTQrNT+WD+PLc0y/l5ZlHXGmCS5
         ULU6yinAJQlOC8/TC1Lg+Q2LMxFj7MrJp4+0qF2AEfNPsK6sXkpZ+ejwMsDUyKWBZiGa
         0XdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792407989; x=1793012789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ast1zHJ9Uz2YssWCBu1jREzUx8HTb4eQoYAKdnW9yDE=;
        b=lklAt7VDAzfeuOqz8lqwZt4EjSP26up0KIxdxB02TrIXbReXTfwRQ3ImJ+hO6VVF0r
         pYwP2pm49qxxVA5M5WIGtczetKyU6AqjcfoeUcjLGzpaLRv6Tl3KcCLj4/Py1LL08ro/
         X8RiwuycNb1yzNQ2je4h9YxaVIqaOGg8V7WbetYtj5s/DFzNqxOiXwqM4frwQuo1eJt7
         nKiEpuIIiC+eKAA587l5jRWTB/EoLNmwJCZBcSpIEpLyMXQVU1bgvGYGezhu2eZu0NL9
         vIDKXQb6lRubyxTK5339nqgud0r93xz+g0/DF/d91U34E+UL+5/d8ONyJEw6lAE+3Ww5
         8a2w==
X-Forwarded-Encrypted: i=1; AKwUvByE9Mk/GZw2V6i+Bup7eqXuTwoPZZ6a0F92wTnXUbkaEnJ/58JAelttA0+UFQWE9CLei/XE2fPlYPifqfw=@vger.kernel.org
X-Gm-Message-State: AFq9FYJIWr5viOjj1ETXh7RRTCA54e8Am2TrlDDQXsL8TqG/BlTGsRGd
	JsX3o4xXEMEd9KO4yk6ithBfQUpEPV7Q70pm8rukFYm9y32qFkXxOuwKn7dO4aF3R7JX2Y543C3
	LKrYEFhSVjxyAr3OhPkL04snq5ZHWj74=
X-Gm-Gg: AYBFou1YEcnY43wM4gQCuRmKVru342jVR6T114N1mOC9eeagG0PrDgfkWhiYVnd9yaX
	WhysKNWMKc99CdbKBItisnhy+y+iT4/68LqbRnH9YRaB/Qtr0i+QNo5oUiKgGiJ+f5tIn+WCRk9
	j71tnxgNCvmDV77CQ4lOtqYwC+ybtF3aObIJcM5k4cssEN75xrlvRMlUDiaWsL0mVJGPCXl2nGk
	QTSAZr3F8uwLt4ryC4G27MF9OZls2LXSW3O8v7ulS6s8gq2kU9Vk4R9g6LMXUxEYhhWmaupoLO3
	4hP2cvU6RFsfG4Mc1Vd9gtBOQM01xd5aSBk7sRxNrfwVkAiYQQKs3e1hchUMok43nd4P7bLjv8Y
	zkqvJqCq6S507eLcIb66xAK6Q4cnFeMD+IbZMnoImZAnjWjoLTMPYhtYWoQkpxq7vTq39ienADF
	fA+gnLnw==
X-Received: by 2002:a05:690e:4004:b0:676:e85e:5ec with SMTP id
 956f58d0204a3-679ca93e9c2mr2047972d50.139.1792407988921; Mon, 19 Oct 2026
 04:06:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261016162912.64581-1-lukapanio@gmail.com> <20261016162912.64581-3-lukapanio@gmail.com>
 <atX2Sf4GJNFYq2ZY@aspen.lan>
In-Reply-To: <atX2Sf4GJNFYq2ZY@aspen.lan>
From: Luka Panio <lukapanio@gmail.com>
Date: Mon, 19 Oct 2026 13:06:17 +0200
X-Gm-Features: AclHuK9BPbEV3xXNig3O4K-KotL1JMndrdN2hrEB4vNyiT7qjydGuoSSOSI_klY
Message-ID: <CACi=Ov4qxW_HmgcjRJLg3SWGKd2S+3rcevjpp8ELf6z7RBP3qw@mail.gmail.com>
Subject: Re: [PATCH 2/2] backlight: Add Awinic AW99703 backlight driver
To: Daniel Thompson <daniel@riscstar.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, pavel@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, deller@gmx.de, 
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Mon, Oct 19, 2026 at 12:51=E2=80=AFPM Daniel Thompson <daniel@riscstar.c=
om> wrote:
>
> On Fri, Oct 16, 2026 at 06:29:12PM +0200, Luka Panio wrote:
> > Add a driver for the Awinic AW99703 3-string WLED backlight controller.
> >
> > Register values follow the AW99703 datasheet (V1.6), the structure
> > follows the aw99706 driver.
>
> Given how much the structure follows the aw99706 driver I'd expect there
> to be more code sharing between the drivers.
>
> Cold AW99703 support be implemented by extending the existing aw99706
> driver?
Thanks for the review. The register maps differ completely (chip ID,
brightness split, enable bit, current range, boost options), but the
driver flow is the same, so I'll turn aw99706 into a per-chip-data
driver and add AW99703 support to it in v2.
>
>
> Daniel.

Thanks,
Luka
