Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792464168;
	b=Mg0m4DUegC80Wb0/sZcNllQSJPGQ+uPz+pYb0TR2VWJQAJK1rs0Cy5EAAx+YF0K1MUPH
	 OC6Fm6A6zdw0e4WYDzR7VnzlRIEMJzDbfJr82oYvj7WtO8QmjevvKfHlhw5RBj1gfqBu0
	 kgfsQ/gX3a//R4LuuQo+Q7SYa2ljkZwpolJTF0w/3XGzBvM41RW0+C0164Oury0w7BeF+
	 f2UMDUQh2FOAP0ZyiJestNdXeIdJHXyRQ/UrOgANfmYmzBWJ06vyg8KnxOVrerJyIEuQJ
	 hxkMDBzM8Hem4MzfsPxU4BnrfCWgAdeBpICovC9XqbzqsSPXvxhWG4Af7FSECCRfuqg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792464168;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
	b=BE5yyiSoa9kppe6UihiFlgTjmx7UmXfNtGVl7Sdb7Cyk+fbeMQfVzIKaRy2r88EB3SKR
	 D8CE+iBl6E3VU/B1l5VwKQan0h65XV9m3y4kRidhDY+1Gidf6c6a4097ZeuiQOb4iUXZl
	 qq7NVPqfscgltsbS3x8xVOb4IvvwOrzQ38K1+Did9xixlptTGE9olJRTKeLFoA0hjyleN
	 lT3MhrIkE6IOnM/xytRg47gOKyeeXzO/txh7V6jkMdmEkUr1mwmnJfCiW43TDGglXlZcY
	 4PbEaeGD8oVgnhtDiE+smoywMiFb9RJglVz1gML9iP0Egi8Leo1Qu4fG+gDsLKiQj5Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kjcm+Odz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12094606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 02:42:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12094606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kjcm+Odz
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-48e9476e26aso831661fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 19:42:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792464167; cv=none;
        d=google.com; s=arc-20260327;
        b=Llf8gtoL/9Cmj1iSJv0UpGGrifjRF8ii84PHQgvLxots+C/uTNiisIjOltEK61pq40
         Nfktr56/v1fB9fLv/cTFFjpYRzFwsp5iow4+vodQjXfpvcKPen3uOL0ljurGoyqrvh49
         KolmictIi+wY9S4Cvialr7ZtDGcHn7izN+TdABbG7h8m/xMIUAX8HQsnxV4CcD/f/2fJ
         G9lO/Q5NT0NmkeONhcxNlImoUHgAQlIAfRDUOtJVWnHGsV3t5aaEdbjr26PoZxDw8xMW
         CijEd7Akk7o8bpWGBUFPKpO5xoy78MY89yaFq0Wq4y0IdsPbd4VtCXce4/0acOcnNSGd
         IPxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        fh=T2e14PI8fBZtkBD/ildOGP4DlasE3A8MZQkCa4XMsYA=;
        b=jQOZ5gWBrk27vOC2QwJHnf8vGNJnHBmh6fiuhlvJew+aSut8Btcj2LMfibJpTZKk69
         5gH3WliJtzNgKETPWbgzKmIPi/G63Vkp5s4g6n08O5/DPGBQhrLXx+764LHqSy/HYdJ4
         ovwM7hfQ0+MEK22BvkVelV8Otd4TpTaolSsEjLc52ji75ckZAh6vqNU+lYQOtfz1B8GV
         f1fEA5aCNAQDRe0EaIeudMe0hEkRbT8f1DXJWlMwRrvRzMIzY1SZCchhdWL3Bg2l7OFk
         wjIhn4mVj+xJia9/Ri/ROigh0+1Kr9jiaoVodg0xj9m/H4SNJjsHgI0lk9wAWJkdh1rk
         uxbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792464167; x=1793068967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        b=kjcm+Odzv6zxqutyfnR50l9AiphFnUwJXezUB7Lw4Xo9T7q3daidTG8VfofH0p3c1d
         sZIJBAskARDPOuvNHgoB89/i1q4Fwbj6zcVT9OSm3QXzwsRtcF/cPg/qdpJYAO/4XJw5
         XUnhuwGLMRUbHWu9rUhfFKA/RnsgJ/jhBu72j1ca4NZQDOYdmWzdUrkUYptCRKbMLO7C
         dRif4RxMJeibshd+MB+f1X3q7hEBuqDFMIfxv0cC9nYDJ2dttxGXMWBpgro7PK4Xaj6f
         XW6CaXA3gRTmBx1lGImD2gel2u0dbLKQQdKqXWwlQlH+dW8/K6SM9jVoaBaD0D+9TUHj
         y6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792464167; x=1793068967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8OYBYLm+3KIQaLQWB50G+yMGf6VXI81nazyohmh2FJM=;
        b=Pnf9aI8kuRnlZrLEqcf7OaPKdHwP4gzTnn+kLs83gExLyaQZVQTm5Ay02KBsxbQ8H6
         YOKM8HvAM7gOM1C8p1lQAPe7XtOI75A0+MKRK7Z3NFYLcsZuEcY3+YFedxjA+loE1NwX
         e5YBWFYdiw42OC+o3JI0UR6ox6BTLDla8aPrYb1RJFdJFgTBetbNZ5+/iS2S1ScnrAM+
         l0w7pzrd2hoxXyafDCOgfxILWoxflAQUI2REAI8Esx4dsKOjy1gULjXPgTRcjZ01LdN+
         RMosivQQXpqljtE7TnLmpA3tpVZUuRS5t66TR2xNUzk6XtVEuzLbWi/vcD75OmwAm6xI
         nVEw==
X-Forwarded-Encrypted: i=1; AKwUvBwY+YevzlGvkBWmi6bFNyNYCpAYf8Dl/e/cvGK0NrZY1NK+/7U6cEfeU5V9IsM4yJvLQDxur4tbBcIpz0k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIKKHiZl2MoGtSYSMiJVbnzeeOvkp3LiBW0sQ3cHZADbC+E9oGY
	jBI0//Q+DLyrYhMzEtmkgAHqFmIJQVehu8+8ETM9HH+J0+OVXXzrD26iOTzCqH7doe5+3dAx2GO
	JYfeEQyFHWGvv2p/erbmHTnuhya9pQoQ=
X-Gm-Gg: AYBFou23XtZDxH0blprKUMr4dTt1NVo8i3xQ6h4dfEsBolFsAiOlAa8vFrl3Hl4QA7C
	6uy5uAHbqqKTpXvpzgJr0P7f86iAHKyIbxEpSNFmL/WnSNEDHv0n2DMri1LpMfsn3oCdLiCsUhs
	F5k7IBoDy3lYVIMqfHkF58IcTpdCsuFU7Esz/1P/Z8/CWdbfYMO4Ema5a78yQvuiE0NzjIXTB8o
	SGEvpI2ssPBhElct1//+5Woj/2+GfPymgw6Cwdy1rJuSKq1FrFm2JPjqfBJBRpMzXvf+f0Eyxyk
	X1JyxWfYhMeRY0C8wbcbfk/QGwEDs6CLkDtL61RqNwac0unI2BDJRMpX
X-Received: by 2002:a05:6871:e014:b0:475:a112:1270 with SMTP id
 586e51a60fabf-4a757a3d072mr7064152fac.29.1792464167002; Mon, 19 Oct 2026
 19:42:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016-wedfix-v5-0-8b02e78fd34f@gmail.com> <179214234859.408196.13768026652794039093@kernel.org>
In-Reply-To: <179214234859.408196.13768026652794039093@kernel.org>
From: Zhi-Jun You <hujy652@gmail.com>
Date: Tue, 20 Oct 2026 10:42:36 +0800
X-Gm-Features: AclHuK_uSJLvIyJgGxf5INrqsdVDsAIH1iMF8upEY8ZK_RGHk9iIGwKJao2ZKNo
Message-ID: <CAHGaMk_gjN5v0HBQ8U-8FoS--nWCS-8j1M6LUSSma=rY6pYFKg@mail.gmail.com>
Subject: Re: [PATCH net v5 0/5] net: ethernet: mtk_wed: misc fixes
To: netdev-bot+sinfo@kernel.org
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sujuan Chen <sujuan.chen@mediatek.com>, Rex Lu <rex.lu@mediatek.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 5:19=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

Patch 1,2,3,5 were found by Sashiko

>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Patch 1 compiled test only since I don't have a WEDv3 board.

The rest were tested on a mt7986 + mt7916 board.

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

I will send a new revision addressing issues found by review.

Best regards,
Zhi-Jun

pw-bot: cr
