Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793004664;
	b=ey7uLLaVi+bTEQg/NFZLNQXeYoqIbNjwjrL870w/5rjyjnAtPvQqNJdZHhJl4N8iIZA0
	 9y9rv2EN5D9PwAJKDH7+voR6jOo4xGBFKFQ70Yh0x2Ca1aR1e9XNtyVrbCrkdVChMCBPo
	 56t7a/48M9tYq5cXZ3a3IwrL449i0LAbqiZd19v8uDu8FPktMABXGTe+mraNRbcq4OOYQ
	 FcoG7raQYdLuuo+U9+aBhvSa7Pi5UOf5/S+mceLZ5g5q+swtjZUQjaT0ERFCjiwnmDcCG
	 b+vYzoW8yWIK6wNqRq8InnVcqOu5veVv+P/8qs2jg5DE1XsKQMBKkWECznO+YCReSmA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793004664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=AkYXn6onLTJUFDnVxOEC6DFAsMb9fumAoXKz09PsQuM=;
	b=3DV6ypBabfvjnSM4v1nyg4TVtnRMI61jGxtNB0KvRLOjy7DYx/bKMo+tjq2dJxv4X6Xj
	 kPZe5nBRVT7BZYelek9LFvMAT7T9Be8e7pdpfdXQEsCyM4uxn5BDlXMzT1hvsFpb5ElZU
	 6OBj6VyWhARkzzHbAKvaDn5H4mUvxlrlpt6bOIuAJQL2AFbJcP+C5Ro5A8gyrZ+5BFf3z
	 Fi0jC1YoXBPDlJwaDs75SyO83Hyo+klKDLGWMVe8RFBGn/Q5Dl/TCs7P/vvTZyOnk/qLX
	 wGumJrHsRtcyu4AXzLnfKVvED5h9r2oW9rTEYtICxfVzb2DnQDMeORwlCkiGXP3zneg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oh2lU9lh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FAD606A31D
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:51:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0FAD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oh2lU9lh
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so4589383eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:51:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793004663; cv=none;
        d=google.com; s=arc-20260327;
        b=cGwhHqpiyuSdi5mz2uaRgcES9BqFFMN4T3LSXHC+42gE8L6jjZraR6DDlNmlov4G6E
         G9XtBucwEaiodqfTwdVzuzzoRNKkLuhUdB5USklX7u8eksO+dSyXHdd+Q9gnCPgYg3AF
         NV98HHfLJPj+R7stLTev8aH52UcwlY48ZT65iN65QjT2m2c05pdvNa0zVy43GKab2CnT
         tkEP+cacXmzlb9/XUuob5+Z2oY2E7f+lEn0DJeVDk0GBZJieObJ9reASbdaVNZYyxPrk
         HAzQfxRistVwZgvmclqE3HJqWVwO42VJ7nBqwzoVwLLmzhzjJwK9YMOgA/Qk7C1o0kvX
         Nqkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AkYXn6onLTJUFDnVxOEC6DFAsMb9fumAoXKz09PsQuM=;
        fh=ZeqW7xme3sBHONUkLN8oF0sbqRiP12RaXiTujC/Xtr8=;
        b=bD2J5C6okW9SNVklBFDdm6wAXIn/qW17opavbQDE67NP/+B58GRP/OnJsgTmd5PUp9
         4cyol5HddgOcqrSuhqnBA5wmESCmw6tzI9GaD9J9f/gGyf18swLGFfqSqAaqwpcLZtR8
         8P4FcrJz1ZwokwsCyMO40njeXMft6oEUT/K5iPVVxT4XoL1+MMOScNVQvgU2bzxyJ9F3
         SFodimrfCOSHh9jDxG9bBkkugDo1kjSGL5oe1KO4XMfCLPbHno0dUt+JiMxJFna+FdJz
         hsdTt/mbVB+IMZ+WYQy9v92mEVCDp4AIkDRBTzFWqnz6ClGsy8m5KJZhesVzX7sTtq4g
         XnqQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793004663; x=1793609463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AkYXn6onLTJUFDnVxOEC6DFAsMb9fumAoXKz09PsQuM=;
        b=oh2lU9lh2XW5bOMIoZggPWD/M/w208pLutnXYKtqzP4b2JJ18pW6eKn/KP+fPwj4R3
         mJpwRBZtjw5JnMaXltAZ3+pKOxs/hLeOtkp5pZfFcWLpzypC6IJXH421xJ2LMwnfRlKp
         iU4DLNYUBFycQEAnXJlnNPoJS/84qHhQ0TZfCFg9RlzuSsaiCGLhH94a7bdHammdeDc6
         w0HeWoPpOek8aeQyfPlzrX/2hl8c9V8en0t0VIeqVCoRISPKKz5KQLH55rtOfwuA6nfy
         GVVqgUyBUKDqBbhrnLFbZMZ8sE0jKUvp9DqEXfi/mqUnrtrB2jK4BD/iWysVxfpDWVfD
         1P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793004663; x=1793609463;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AkYXn6onLTJUFDnVxOEC6DFAsMb9fumAoXKz09PsQuM=;
        b=M4GUXFKMymuvoPcBQFGy0zDLYGZcAt37GqRJrbN0BTQoCEOCGDnvw6SCauXn1O0GIy
         JlHCg94jqdHfozgjXhUhYrlYW5yKtRU8dFF13sZpi7d/coG49WKYeB7CwZ22zQex+O1N
         xAkHsM+BRjVjwBMDRbkGXkz9sTjZQCBjVvZmlEP85aS+QftwUgMJDYagziF/ob/x9CKn
         hZu6pikYH77sB4Jyf8hNspa/8+BfsEJy74sXV5g+PcrSU+xdbmKv9q6WIQyrVDgmtoUZ
         QPLsSc4GAgwCs4Z66KzO5+MaNXkOBmKcimAG833pK672b049p0gk5moxysCu1bS2rlvi
         WJrg==
X-Forwarded-Encrypted: i=1; AKwUvByTa0nLqLKG8CatWDKYV85FhtQkeCcb2aeVOUWwFA9vQvgh7yOwKpuzgkkbX1ul14pAptMat7q5LYHPaFA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtuB+xlO83A9DGsdxI/ZlF9yyMzKubftoi0XNH4wLSE/W5Kwse
	5A4510koiuO2+xTUEByeXcqkxNjvw6KYxK+lL8qsASe0OBxHHBgBzE3aywZVrWOaec1u5DraXWD
	4rB4U0eSb/MRrqePWlsEHVmH9L2w450M=
X-Gm-Gg: AYBFou3cPqynnFPJeFpepBmHVtbGsgNKOdRI77l5gfFTQI6oygVhzyt2jE+XqshzQ1l
	hVr5zT77it07/nKqpzVEkR/LlLBzbjqHsLiMtbb6mFjuVFkx9qwWl+ls/PK/m0+fD4NDoJDZGaW
	KD63DAzCCenVFaG5MnhP7yokTQtA/tq+gYZTQAbgr1DBc7hyKPffpI/vBpsdrHk+kMogp1izmGf
	7NQ4bkousxIqH+KSrXIroZDIvtwBjnoM42Pg8QJ42hhPws2eJKob1Z+X4J0RSsty+elN0agg4Qb
	JRgK+TmNvwwPyCUDRPAQWnYQrijvT9K8TgPYMmIrcArsoMIuhLJpNsZhpGNLEyHVUnpl5Sl+Rf8
	Sm8XZ02kQKsbmuXOubFueotzCtFk3gPoqIa6j23OUOA5PBlKM6zFS1O6JzMAzQEXbQrDcTg==
X-Received: by 2002:a05:7301:db85:b0:369:d486:457f with SMTP id
 5a478bee46e88-369e834e14amr8992878eec.2.1793004662453; Mon, 26 Oct 2026
 01:51:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025-upstream-serial-tegra-overflow-v1-0-267b5b7a79ee@tsv-stahl-riesa.de>
 <20261025-upstream-serial-tegra-overflow-v1-2-267b5b7a79ee@tsv-stahl-riesa.de>
In-Reply-To: <20261025-upstream-serial-tegra-overflow-v1-2-267b5b7a79ee@tsv-stahl-riesa.de>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 26 Oct 2026 10:50:51 +0200
X-Gm-Features: AclHuK-MLwyI42-tjUetBxMw3Pp3JS4p0iAKrtkhDYxpLMnE-AgEIVtlDEnzRGY
Message-ID: <CAPVz0n0bc8Ox8jLmeGZTHhT9+=xKmw-poX0gM+e2SE55zYf26w@mail.gmail.com>
Subject: Re: [PATCH 2/2] serial: tegra: Fix overflow in tegra_check_rate_in_range()
To: admin@tsv-stahl-riesa.de
Cc: Laxman Dewangan <ldewangan@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Shardar Shariff Md <smohammed@nvidia.com>, 
	Krishna Yarlagadda <kyarlagadda@nvidia.com>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 26 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:5=
0 Patrick Fischer via B4 Relay
<devnull+admin.tsv-stahl-riesa.de@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Patrick Fischer <admin@tsv-stahl-riesa.de>
>
> tegra_check_rate_in_range() calculates the deviation of the configured
> from the required clock rate as (configured_rate - required_rate) *
> 10000 in a long, which is only 32 bits wide on 32-bit ARM. This
> overflows as soon as the two rates differ by more than about 214.7 kHz,
> so the check lets through exactly the large deviations it is meant to
> catch.
>
> On the Tegra Note 7 (Tegra114) the Bluetooth UART ran at 45.33 MHz
> instead of 48 MHz at 3 Mbaud (-5.6 %, see the previous patch). The
> check calculated -0.18 % and let it pass, although the limit is 4 %.
>
> Do the multiplication in 64 bits.
>
> Tested on the Tegra Note 7 with a tolerance of -500 for 1 to 4 Mbaud,
> which gives 45.33 MHz at 3 Mbaud: the driver now logs
> "configured baud rate is out of range by -555" and does not apply the
> rate. With the tolerance of 136 (48.00 MHz) it logs nothing.
>
> 64-bit platforms are not affected.
>
> Fixes: d781ec21bae6 ("serial: tegra: report clk rate errors")
> Cc: stable@vger.kernel.org
> Signed-off-by: Patrick Fischer <admin@tsv-stahl-riesa.de>
> ---
>  drivers/tty/serial/serial-tegra.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>

Tested-by: Svyatoslav Ryhel <clamor95@gmail.com> # Tegratab (P1988) and LG =
P895
Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
