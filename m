Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792725944;
	b=KhJ+Y+KB3KUmLlhaK1opzDcVr3+lwBkxxHQ97YDEb5ZeJTpd+P8/1olJIxvZ2BGB9u1R
	 L1Et0RyR1q8whkADhJiBrnzZNxrmRxpgmYV98NXnLLaBQn8XIoPR1h2NeMBEO9TKG5LTD
	 HOdhztC2hIuh2TeiujDX7+gygo8Uq3bz4WguorwDY07o7hnvwovj7A4AHBc8H6Mwck5hr
	 vXe7QM/d2l4z80wRCHfBeNpzPpr8N/BAwoy09InljB1M0gCfivDcbkYg+8raYjYxstYcG
	 ggDBpa5lrQIanyCe1nu1LdOzE46MPhzKK9J1jUX/NxWR1N7X2/bQ/tcVzpHk54hsapQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725944;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=uaSfqiQ4FrRQdMg9pQ8MmVZnbE5vzFmaYPRmyjeQAhk=;
	b=LzPMkcPRM6NQtPOgDMjlJFRSVJyCfOchmspVa73gMVFos6OuWgbXuIoRY67qn0uFF1Gh
	 zuD4UDDgPRgaEcRmeIk+9lUylxVg/NVFtK1PV0USB8yU/f7CHvcx22aG0MXE6ubJZ3Ehd
	 SPRKsqhd/mgZvZY/gG646ZoMkLmUcYg/6j1TEbZVdP+gQ8bfBPdxe0qMBbdHXpMAcKdZD
	 PSnNCA0oMJ9755r4g9BD4V+Rv764uxtWudvILwzZ1PpXSc6Lx3bAUtb5HJ7H7Um+fcgqm
	 EMojvInVQ/V6cE8mfYT59R0u9li3lRCLFmUgGlvaEf7PK3QjSHF38/FTpewWSc0lWNw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jlq1Gyl4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2542606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:25:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2542606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Jlq1Gyl4
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so294654e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:25:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792725942; cv=none;
        d=google.com; s=arc-20260327;
        b=kvLFJqAomi/hPwstbCWinF/03I1saTZr0WLyDH6yNc77W9Mw0B7oUpAAqe+ExhfCqa
         O+7tCNaAzHuqNe7dd/g0nw0vDivrAfev2WcNvvnbTjsmvHlp0DGWD+5/c79mfqgtBj1X
         3NxfguhaK662nUdae74TJs5tJlOg4CZb+7iZC+5j9DkVFe8d7tni72FvEmzKDtI5/v/r
         TgsoL41Ahy8sPbmhlr3AqVIaYPQCRglgBHdd5ExT9GwiZ3IP1ZTD5K5UzOLohCvZvNO8
         sZ+xoHEBx9/WkAHPeujWwADlP0XKiQiYYCl3X4g2YG4MzGKcblvqcFgN3KtFqDQVHPkt
         i8Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uaSfqiQ4FrRQdMg9pQ8MmVZnbE5vzFmaYPRmyjeQAhk=;
        fh=evaMa001y0Ak75kxoMP0f+V9VNOHP/xSVmbJZCwl/bI=;
        b=HJqnQfPwhDkcJvz6nz1wGS/KTizZ+tRzdWyXrQBstBxMS4fOTPcaBu6f6/4uAyLRHF
         5UXe4phJpT2UJ7b5RfqGbqcvCiUzJ1bbeLSJDJWgwaPUeJnzNreQaSUwvZEIQ87mpYbK
         hsMPJsUMgh0FrB+UVuqq5DAHpw0aQ162igP7RZ7kWzVl6ncYmO0DKsdtE6qhgxcVTZ9N
         P6vzcyYLMFmq+mqIDUM6cPH8oFP2CdhKPLBekIQj2hnngZfJCSFZ+Hnw7sod5B6lO/p5
         GazENcVZc1ySDzHj7ThnkfW0cK8hjNnDpRfnJo92+0jDLa2xarsB93Ym0WoWPwTBj5xM
         oCJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725942; x=1793330742; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uaSfqiQ4FrRQdMg9pQ8MmVZnbE5vzFmaYPRmyjeQAhk=;
        b=Jlq1Gyl49tvExxyUuCAPtiTpo6qQJsjdunC3JfX0NPPEpNilTTYCvVrkCBnNLsDJ/q
         DQepKK2cvOMgbHKkpgepIFY0EwmtMdGWhLP4IBN1K/YnwWxTD5x45YO4gfWaka5Yvsr2
         Ucy6Ey3rjk+6wGEXd/fGL7X0Xuya7ViMRYUNbs1hfx9eapVzmW/on3JhgNFdoVy9Y7j8
         4H17oK1h6kdeA0l2xiRQmb8nLSDmnZJsV3+Nd09nQ0zY3g3ybbmuxAneKpvspLz97fl1
         JNsWL/l5HbbWcfZePxqFzoCNBUj1OgzD6KygD/tiWQszQBB8flOl60dKZLzVgsKNRfCS
         jTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725942; x=1793330742;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uaSfqiQ4FrRQdMg9pQ8MmVZnbE5vzFmaYPRmyjeQAhk=;
        b=wUJZOvjPvneK4N3C/sp+KtrTG3iLyhJiEm3ELheyqYVYXNNYl+kgqW9TLr98AMv2Wo
         6rp8+tytnP/msKlApCC+EYgHE9/+fFyxtoWPpHaqSorzobJDAcehVDgT7OlrfOwU6wGe
         v9wnbKwS5p03qSpYK1P1HD4tG+dLKkHiFCYtUXYBQZQPG7BmeYCk12X1geGfd2UKtVHr
         NyosHo3GqXUWdCj2AEPpMXLm6TW6KydNP7o5lEgGlKUsqYJ4EXpcLI4Do+nd95kXLRbr
         jaQTD+3cJEfIB7dxlzyNs57R9TCjIoLhysQEUzGPdhYtAUcrh43mQC7hDPD0UMuNQKEa
         dS/A==
X-Forwarded-Encrypted: i=1; AKwUvBzv0cIOpUsezm/AIl4NfNXhwYXymBVwl5mM5niAK1oFXt8F2s6oAGjgpjG3GcK2Kg65xU4ZiCqQg9I/B40=@vger.kernel.org
X-Gm-Message-State: AFq9FYI8/gxB4SE6MPPve26xFGEr68n+pkJW1QF3Qqfe3I/daqvvaDbk
	RYmRzTIkso6YBnYvbIQGykbGl5s25tm179I5GoX40RaB1pIocaxRZbFnXcAuzaJYgSIUwrUDZtG
	gFDk06WUKZ/+LfhH0YuJkFPWXusTmFlI=
X-Gm-Gg: AYBFou3yfLbtCRkLcnCIXJ03Qx5iyahLwFDv8CZzFZsHOiUrghHaeqlUwNxB2cfgeR2
	Xlh6A34cmP8ybpybp78fUoQV7nmWAdHX6JelQ8TIEBT7R0tLRPA2pPon4vvxKTX6XZBdVRh35NI
	eyO2XHGjqp8pgBc37I11D0/u92t8C17swfpscIaFs7OObdmiBg2M2otEbeCDpUOZkLAnSymon8r
	R25KNLUBgBIyf4SuChCamcDmNJc5Vff5jGcRsaDChBtjM/jhWmAiUktPj2UYfZXJZM8HlNGATFV
	f68rWKe4RcHlcxykU8mpYZs4ORHgTjIzvSpaaVUZVHoXM1Jj24wWhIaftcYsW4O4VSOkTLb7Av8
	sPbkv9bRU16DnqYFnFUZE/fToxbIFlZUUrIzX
X-Received: by 2002:a05:6512:6686:10b0:5bf:b144:fcbf with SMTP id
 2adb3069b0e04-5bfb144fdbbmr118545e87.11.1792725941650; Thu, 22 Oct 2026
 20:25:41 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021065750.2069795-1-anilkaushikwireless@gmail.com> <179256621789.3290.7142786984430868325@kernel.org>
In-Reply-To: <179256621789.3290.7142786984430868325@kernel.org>
From: Anil Kaushik <anilkaushikwireless@gmail.com>
Date: Fri, 23 Oct 2026 08:55:29 +0530
X-Gm-Features: AclHuK_d_hZRKbJNpdkbqa9tJF3np4JnVtczVtRePxLBpAVKzzWcz50egBKIldw
Message-ID: <CAG0Mgm-nXSvuA78MnGaxDPLaRM1p4WGnj61GxSEL8cOmZvGf-w@mail.gmail.com>
Subject: Re: [PATCH net] gtp: Require 'CAP_NET_ADMIN' when joining the gtp
 multicast group
To: netdev-bot+sinfo@kernel.org
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Harald Welte <laforge@gnumonks.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Simon Horman <horms@kernel.org>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	osmocom-net-gprs@lists.osmocom.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 12:33=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrot=
e:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
Found by manual code inspection: GETPDP requires CAP_NET_ADMIN, but the
multicast group that sends the same data did not.
Thanks,
Anil

> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.
