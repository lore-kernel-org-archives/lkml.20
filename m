Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792609552;
	b=qYD+nf5P6BZujb6mG3wzIuyPhaMtIt9cugIj+Eo+uQoTXmrpfYYxci3wTSJWMFgLGATi
	 6uVAL6U06pnkdYoI++wKuxfTenoRAv2hQOTKIzrgBfCELOWVqrtGgKYPUEbDlVzF8hHkN
	 TYD912TcKUr6MgL1+ly/W9l1HbA/P9b+NSiU++RdNMf6GZRrVFNDlaK49iEugCNG1FSYm
	 VMdW5zzjxsDK+47co2xRw5SlznyTo3dMJ4cQSbMbL4AZfZRDKuquRT7M6ocoTvlsB8Rnc
	 TTaUJi2w4VtWGFGzhwS6UBBgP0JBxvbYBiTk7W7KCzp4ULgH5d/Rm6TlMScxVfdYG7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792609552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z00SrWlszHpZynVRy5jxyVkBhEbL3MzPGCc+RRugLZs=;
	b=Tv1lWJnRxOswA2ArOxOE493riVrLEYrocDmZL+H5c7KRrQeqP53tke+8bskMfXaurniV
	 Oc+L5v5kW33gyRb8TcL0Y0N8uJhHUSv4HGhSQsemPwsZsBeO4zFsbyvl/0fiY/iK535YX
	 GkbWgKhFuB+ICaaDKrPsTWhq/UFBGIoOv1S3YN48KqbaKVr9J0jydkjnb31tEP9THM+M6
	 yC2xddx+r5aD0zlH20w1qpft/53iSM7eyp6CtBrCfYw/F4s5ZWYin24eCtfQFS/c6T+5s
	 1UkTeHoEcWQcffOBfUvPjVRDj1VUCC7772kHJXYFBJRYHAkstt3yUybUi3hd2GpC0Kg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b="nmoE/Y69";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79310606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79310606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=nmoE/Y69
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48df54150dfso684603f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 12:05:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792609551; cv=none;
        d=google.com; s=arc-20260327;
        b=gh3fUs0NHj03VrT8D9DmtgYvCrdkzSRwBuzRF4a9d8/FBZdQa0JNJNvZFx9wJTkZUl
         CI2/3SLSjAsXP/itetmNX59er9G4e9HV+tgaLzweQkOYFs2xn5hxWjOkzREUDgfNzW3+
         LPZxrDbWrysIDOwd4Stm8fei1fHIFsq2U6n4x+kjkJATTb4ZLUzkCqjNHT3q/Cr9bxSY
         fWSGY/kFnvRRhEExd3qA/HFBj5AdSf6JRhhfolLrT/ljDOzsVGkgeU4V+Cnyj6noz16E
         71g5iTAzZBkuO6y0fdmHEJpgs2/laNG/PMG0hnJf2TGqwLXnjBHia4f6zp6f/nJjgsuG
         PU+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z00SrWlszHpZynVRy5jxyVkBhEbL3MzPGCc+RRugLZs=;
        fh=6FtUukI+GNniQlauNj6oT0QNyKLOmrlO+UNDwL/A1rg=;
        b=C8KFKNXZAX2/WVVPZxlzZ76yxt47UX3DSw5LH+4K9wrTabr/9EgyN3xYT8PsOL6yVa
         UZMirrxxYXIycaLp/EOFzhgvPxH5X/pW9bfzihVmNSvRL8+P8IGu5CW5p5shSm3zS/tz
         8D2xYcOXNNIcxB9WzwOCBKLbJ31GUaUWZotnCqwmesMDysU1zNSvbBta86IwEotH3AqV
         Wmms1M+kqGoD+uvfAntWqbLat+M9eTtSSwJdUCaqAjIbN5DBHqgbdi1x3h9ulLbW8uxf
         Se6yHtVW1DvX0Y9tSeC/sdCI4nf3FGJQWZQ7Yjx35NtR//+6vlKePBW9kvT7/1ocO+af
         gnFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792609551; x=1793214351; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z00SrWlszHpZynVRy5jxyVkBhEbL3MzPGCc+RRugLZs=;
        b=nmoE/Y69/25j6kHV0YS+oWwKwo1dfNazY8/JLKbhdgoabTW+0lpZpcmaIDz04JMb1v
         dz8q8mMsbq1SqnUsIxWGIfwNAKBOL1N0OpXuu5YScXpErgqlMYfcDCReESGC2wpbMk3e
         uNWDMTXvd8ZWpibgWBEF+VCLqkgbkHSYW5QY8m2lXjGNTJ9PAIycSY151wi33wiTgOnC
         fVFxUPf4jhSAUnTH4J3buGJ3hFhFZlHJMVPA7YvHhKHNgGrEZQzjo8lYaNYCu2qdsRqL
         dNjjfIj9QA69mwjk9Ap8w1CUon4usmO2xLZDy/l0Jz+5XEk8+Ubxz+Djd1dKMTFSP8xI
         0ACQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792609551; x=1793214351;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z00SrWlszHpZynVRy5jxyVkBhEbL3MzPGCc+RRugLZs=;
        b=htLmKNpkRYHRuzZetMMOehcjE/JFwHougvYNIQUIr2I0OB9CM9GDDBviPPud3YLkPh
         fQWiisHjJk0ClTMFetQFGvYyNaKpZM1WgjYS4Bn/O/gc+HoBxN3/6UbST5sPfOVaqiFC
         B+L7Yv8DJC4s7f5BdOlguZIRHpXeHTS6mmATsc+9hVXOpO1Sz2hbdlAw8Zinx/aNV/2a
         Y787bha8ILchlvEzRL0ShpeP9y1dhG2YESOha6Q6AsX4FlraO45taxi5D35YIJ1cw8HH
         gf3O7gXRDY7lX+GdI0NfulVbAOspzph5RGMQiAxWypDZ3Pcjv8U3cn8bnKGBelQCvbWO
         n+sA==
X-Forwarded-Encrypted: i=1; AKwUvBwhjSxfhbWCfzNunCDc+hLFI+gxpvGgQHeVdyZypk9f5DT6uPeHZLW1ffdOVDsFnjV4In7HIzF2efpucbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYL66wp5bud6r7FDb0MIQ6KPAo/TbMR5tWn3dJFW28y3mX82KazQ
	CllB0qgC3jvkDYPdT2iYbKrueUBOuMQ0VE0cMqu72JdcUKwfU6ySUJYqFTWPSNT36u48CoJwZ71
	ZL65Xt0Ws2Szpcbytnw5KlayVH9FetsgnLGU2ycQ=
X-Gm-Gg: AYBFou3v+uAzip5mOBzwkQvxfzUIxlZXp/iHy4TkLIvJZ/Ws34lFNdoErRLpea6af64
	0wQfp59nCCDRA6uAbkoCpMkzYVpXdi2WNkbAOZPEI5AU9nw9WyznP7MSmfGe0rY7g02jcjKpztY
	TjScQXBO2suTN/GGs2+XMso/LmPpyeJMSFp5MWmKrwgYdrVMetI/E+I1udHvTFI7Menh5Qovj0t
	MZ6DvKxJ1JWHfSX8m7Qe3V1Ztx03ZCZuwGzHN1IfNoxTqoWlKsnShqD76uxMruGQgvX9FCp/O1P
	Q+fqhmTSJseH7a7jh3BPDsGYYUoqCOb+lr+S9POuCHZ3OOBKV0KYYqQ0GfFqqli9mVGCC0PdXsb
	pDWHMRpD0pYRhOdwjDaRIg9qEXtlaG/dqTenqH2YIH9eEhqIxO0JiGIJi10hQVCU5+S2WklmeoL
	Anx+Itk1BoPa9Zl4V6z/yP8eQvmeLnbv9cEvX6JPPOuKm/Kb44N8KPnl8IE+6VYBbTekNQkTnJ9
	pBFQc5qevtVj7Ove/S9GBvr+dlpxGr7fsyjeokcWQDbr6j4q2wtkg==
X-Received: by 2002:a05:6000:2312:b0:48d:fa9c:7838 with SMTP id
 ffacd0b85a97d-48e2644efc7mr6970071f8f.2.1792609550188; Wed, 21 Oct 2026
 12:05:50 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261001202134.33929-1-dwmw2@infradead.org> <20261001202134.33929-3-dwmw2@infradead.org>
In-Reply-To: <20261001202134.33929-3-dwmw2@infradead.org>
From: John Stultz <jstultz@google.com>
Date: Wed, 21 Oct 2026 12:05:37 -0700
X-Gm-Features: AclHuK-Rz1O1m0hGBsRFHPugmEnm5cEYXxGkC5fE3xshZBCll1_LAqLlOpf5T-M
Message-ID: <CANDhNCpvi=twGMmXQ3N6Qn9=RTqvtiC8d=jN=N22Nn_C8DDY1Q@mail.gmail.com>
Subject: Re: [PATCH 2/5] ntp: Recalculate skew_delta when the phase offset changes
To: David Woodhouse <dwmw2@infradead.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Miroslav Lichvar <mlichvar@redhat.com>, Rodolfo Giometti <giometti@enneenne.com>, Ryan Luu <rluu@amazon.com>, 
	Julien Ridoux <ridouxj@amazon.com>, linux-kernel@vger.kernel.org, 
	David Woodhouse <dwmw@amazon.co.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 1:21=E2=80=AFPM David Woodhouse <dwmw2@infradead.org=
> wrote:
>
> From: David Woodhouse <dwmw@amazon.co.uk>
>
> The skew rate is recomputed only by second_overflow(), so when
> time_offset or time_adjust changes mid-second (hardpps on each pulse,
> adjtimex, adjtime()) the stale rate keeps delivering until the end of
> the second, and the misdelivery lands in ntp_error. Pull the
> computation out into ntp_update_skew_delta() and call it from the
> writers. Settling of an opposing time_offset/time_adjust overlap stays
> paced at one chunk per second, via the settle argument.
>
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Assisted-by: LLM

Acked-by: John Stultz <jstultz@google.com>

thanks
-john
