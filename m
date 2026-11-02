Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793594773;
	b=3cjyawKSuGe7BIIg6IqrqkScdgi25ynaQ36go8Uh1SjAdmyIPWFoqjP+AK2mNXATGopI
	 ZgQWFIk0cUcNnaqSzzD2BI8DcPenTdKCDtCXoVTNMxPyD9mQyCH4FnD89V5Li7gZatzAD
	 JdywYerrqn0T5NgxMYf1D1NJFS+yhGaiVPrvXuhxYeGFTuhgGY/MurBLmnjpvNpBgjqht
	 B6XxYdtx1/NaElos+6Eqn9JQUPrkIADqtf18sNA3lfFcl8LzozeNT62MRrDRp98a6Aly/
	 Ep5qQtK2iz8avPDVTpnm33pB6yOQzxoMtcKwYL+MNadM1GZ/mqn9hRtKVL3YQBPKcZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793594773;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yB6wEIyzc0Neh33c9nuixn5SD09vP1yiHRmy677LGXo=;
	b=3XJhxN0LTBnM/tRbWaA4G59AGmp59VoiPhIK+d/1HzRZdpEEpYf/jiR4iXuc5fRNs1ce
	 P/Wdki6wr2ww1sLLbM/LZrmJVV2nRJ87tZ+l4OS9eWyUnheGZUTr09REDQ7/2gOSqKAlf
	 14f1s0nwg7u1jn/lz4GDN+CVsdVsWXsjG8iGDbix2dQu7WBXPQqF/xW1Gqf4elO/SmLJ6
	 PHg23S/IZn4Jn6gCqvsvFY9uQvWSbVXAy+MEXD61OnEWO0Z17lL04xmQC1V7zb+0N+2Iz
	 UZkvZsFLWO12Y7gfJyQ5aVmQYeWgy/z9KNLivrrRTcY66qC6R0kMVwztOX/FmQKyn4A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0qXwYij;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.41
Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB72606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:46:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EB72606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0qXwYij
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6798eb0d13fso1797140d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:46:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793594772; cv=none;
        d=google.com; s=arc-20260327;
        b=jmqEOiMRvX7ErVQJODFhFh4bkxfq2AnFUhVM/c2KYsKWYtt+SyUX3NhRrnviNe9p7N
         RyWGb/ZTUFieuTXPjAUErcQhm9S5nGNACcYumJeyGhwx1fmFJXQAFxuzVOjHZi8R1SpB
         H8DOKQOry4tY29leT8WzGtEt0coeVWUN2qBAjLacLVxkKljCPGSeV6byfJy65LMqiUbj
         TU2F98CtxS7lRljlmd/KqEAAyuucB/5XZHqsyWLOSh0fnn2k7OS4J6LdtJpt3M6RTqvr
         8dSp88gs7uqDxvSpQqtwjsjfPx9HfGrjU7c2kO51i0rW/WvvaJxRilbr7rIw4Jgg20t2
         WSJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yB6wEIyzc0Neh33c9nuixn5SD09vP1yiHRmy677LGXo=;
        fh=BNQcXEzddhwggJkTNexQgXpopNcz+caPDyGTBS0dv74=;
        b=ZiwTodcJ9PrsYjNzCIeM3TRdnj3xl18Mjl9FPbmds32zqYl/D2KK/EkFsXkQ3Bb03X
         tNS0iIC8kjfb7OOP720EVh4QgW0EOYS4OXqRLQ/qG61rdpLVluJLY2XSlXmUsIXC8FGl
         U724OwOrDbPjZTbA8go4W1v5wyAsdR+idH97iBD7nswVlBze7GHiEP9ig7FwKelxUE6K
         wxKdD8e0+CjCZVlh5UKhMtK5z8xZPB6jkvwwAM0jVYoX2/iuVcPuDMuE/WpW9oTNb4Uu
         95q/Ab453H2ECSwCn9vZ7RPfnhPJD83R2WwvjKMARbb4o7Q7IgypmL1bD+KDaPHiBhwR
         Rqqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793594772; x=1794199572; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yB6wEIyzc0Neh33c9nuixn5SD09vP1yiHRmy677LGXo=;
        b=o0qXwYijoiqbPUT/iMnRKJL9Rcry0sFtNbg0F5j3Mt0+g50S+K06I7S1CklQyFLVIu
         +SUPWRQXKjPbvM2QOzn6WzwhmMCtXazaQySSfexzNppseiinIHNY3ZCYGyNWbkFyRBJY
         re0yvBy89VXMKN16ll5S4w8k0VL07fXetc1kSlDN0il4lU1r5zeHOYy3nThW0PluRkT7
         evKBoSow1sBRJ6m17g5cN4RaeJJZ1WHMmU3k2mwKik+JV+ne9fMtxjNyE9yy8zEKkJma
         flwyNSb/P1TP5pGp5E37AhGaxUwabhL60ftv8MuhRDwpbdk8hk28thhsElg4ANLxV7lb
         0akA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793594772; x=1794199572;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yB6wEIyzc0Neh33c9nuixn5SD09vP1yiHRmy677LGXo=;
        b=Xce3aClR/EcQ10cd1teQJ/bxs+6DiniyDdDTr1nMGaappTMbvCiPmxzaMz1jPNHJ2y
         I0ujU1O6gn3S5zcyFq6+3vxmXa20TIyoHxyAJ/VMcpBvLJ35on3DagEpeIoybp+vGDLz
         h626km8RtWjL7NOCNU8ihirMwLeCe/f2Y6ZWIoHAGm10+wMryPr57KhVdy7C+3yp50HS
         tA4ATJLEG/h3vemm8a1KBciRl5c9NncgPIj8fTjEiTJMeIIFrS7fe452gb3lBIBam9kv
         rgHpgVBkQfOOagQ+EIIYL5l1lQHA5Z4j63YparRep2/+04C+MUUGhaY6roPc/UxL8C7t
         YYEA==
X-Forwarded-Encrypted: i=1; AKwUvBxKj3pzJtxTKGp70Um4qc0NLYheqS2iyevHeKChTXOUUnfZYjs6BtlA0DdiXdjw11mo/EanKxr022Jbz5E=@vger.kernel.org
X-Gm-Message-State: APuU4Z+JnnDWWyZZveee1HrFTlrXWIVx9HykXZNYvR2ogujPB0hHuCGT
	dhxWRsE3jV3uzJ2TTQMfG8iW7JpFdsBTJk6RCIDl3kXjaXWqRQflipWjhQBSWYL3eWsyPvmfGX8
	AQa/7KUCigBp3bagElONg+kSogcldrAI=
X-Gm-Gg: AYBFou1K5hkIrB84pp10bW6Q16Z3LXfabUVaabZ9SFHDPkHZgLZpIAssIlifRPslJzH
	4fH2mNhTB6WDQRkC/SPMLmpFk18ZIZtBSi+6+qKHlu1cOsJa9PNp7KR87V5DUbqo5Bc7HvIzi4a
	eswhy4CWlYTc6BDh1nwotNqG2g2+NDGyeMMiSBIe68NheDxolJi4GSkB1ZZ6YSZpe6e/MppRyv6
	Bi5z5i6BoYb/RG9IKDFUQ3Ob4yich7MqusFZ8pfS7x0cw5ksuIig1PK9KhqVCXf6DpyJ1jx2OAC
	NrOLkEPKcwQEYppEcfkPQik/zXBl8Pp5Ir50Hxv7WeyUYiupVr74VZqADa4hdnz3oSvlOvVkHZT
	rFfvuo+FDSlZSZ2HSfsZKYJF0xY+Mi+xaTPX93LH48h7g8Lw8ruyiJ8+GQoz+
X-Received: by 2002:a53:ac90:0:b0:679:a47a:d414 with SMTP id
 956f58d0204a3-67ba50520d1mr4698256d50.148.1793594772269; Sun, 01 Nov 2026
 20:46:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031-tty-dont-use-autosuspend-removal-v1-0-7bdadcadc4dd@kernel.org>
 <20261031-tty-dont-use-autosuspend-removal-v1-5-7bdadcadc4dd@kernel.org>
In-Reply-To: <20261031-tty-dont-use-autosuspend-removal-v1-5-7bdadcadc4dd@kernel.org>
From: Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date: Mon, 2 Nov 2026 10:16:00 +0530
X-Gm-Features: AclHuK_YfQrdtG8grRC3sDl9M88bqx3_75JwW2gTYOzUBxf8mRI61Vj_PHN10uM
Message-ID: <CAKfKVtG5xCzn3mHcR_7+Q9mdq+46eXAk0qu12KE1UsS_-zNbLQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] serial: uartlite: remove redundant
 pm_runtime_dont_use_autosuspend() calls
To: Joshua Crofts <crofts@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Peter Korsgaard <jacmet@sunsite.dk>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 31, 2026 at 10:40=E2=80=AFPM Joshua Crofts <crofts@kernel.org> =
wrote:
>
> Since commit d1706f9da9f4 ("PM: runtime: call pm_runtime_dont_use_autosus=
pend() on reinit()"),
> driver core is now responsible for undoing any
> pm_runtime_use_autosuspend() calls on driver exit.
>
> Remove the redundant function call.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
Reviewed-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
