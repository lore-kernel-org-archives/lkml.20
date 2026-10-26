Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793008149;
	b=zwWwGxb/oMthsRJONUkqYxqt0qdDYT3EAVpKRwWqgHzo8zHeIKHE2OYxtXd6cpY47iWy
	 zXQfhqY/JvpOj7Vgfbz7QSXkBiUdzNA02/QcUu3z642T20Sbt0A1cXIrwEoaMFsxQGcHr
	 BDzLe3zpphUB5FY2gX4tU5LKpKXD0Ov8/Uw+TgumZCAat5KTimko3nrYng5yJ4iEirM9r
	 jjisiLXUiPwLoaxInmxkZfsInOkrJ6U8xJEindBk5ap/YIVAWZmSPmXrprEt0gnfYrD5e
	 TQH6yjQplB5nufr5Ho0uIoA8u4agRph+Q00mgkl0W5WinwCux1mM3NnDY5eRPTwr/zA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=FuUzM1WaQyok0e/qkOj26iucNld9X/+5dUm21tLW5Ng=;
	b=SRfIp2yt13qjwopYOxl8F6qlJjZvtHw4MU6SmUxjHoRMOhePNHim1jH7mws/bMScMl7h
	 qFpbaf3Tl0JQ1Wu0X0tPh/ZByXCNBsHZri3mQaKgTB+v7ibk2RNuHlKHp3Q+v5oqr78Xs
	 FPIPOvfHOrr/O3arpSBfOB45iv6qcBuG6SILkB6thpmeaZ7lF24fc6DszXAGFwWvhHJ+B
	 58wXMwbLgfE/jIYxw0bpIaJSMO67HHza1BV3zTzhGcjUcR+zEYG5WwYryRsb3ug6+/4DE
	 F3rkbzsmRl1IwcPAFCxmRdRWPfXw3T9NC3qZhaRHZNaEfBevtHADhGKgGsbgyvtN6+g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=miget.com;
	spf=pass smtp.mailfrom=miget.com;
	dkim=pass header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=MFsRk5Mg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.54
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E771A606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E771A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=miget.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=miget.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=miget.com header.i=@miget.com header.a=rsa-sha256 header.s=google header.b=MFsRk5Mg
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-7037daaa820so1022840eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793008148; cv=none;
        d=google.com; s=arc-20260327;
        b=Jp5qUM9dQQottudN1X9XjoA/QCJW1BukPPmMvDzeYAZoIN2VJgAibGiNnoq0Fh1J/s
         NNSgBsGbYiP6yB8sxcRsC2lkmxyH208v+7qsFN7jOcbA5Y1g+/jEzt/fqJIU9Nh6WUDs
         WCnMnxMqIevaD0lrEHXIW2HWmxKyRQ8BYAesE5/K46V+xsvqBJdX1I/KFKIs/v/pBc7V
         mFz4IUzI4q2zP71TSSZK1g4J96e+/cyDm0NdSl55f8WjW2aF+fYGEckn3FYNzhz7OeA5
         ztBSUJEW4yHlUcQF9FQc1hXZQ1PyS8che6zPgkn8TnuK6ouJFN5zDDnVfXpuGFGrUxNo
         Wo2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FuUzM1WaQyok0e/qkOj26iucNld9X/+5dUm21tLW5Ng=;
        fh=NEUlT8aLBABOTbiLFxMZTpml0CD2iolcvQul9Zg5Wp0=;
        b=HsyXULpyuBio8CBHvVatX/LXyrGpIBy//Y+VpMQwL4b5gPaUwy4SdVHfpu7yEz9mfN
         Miw3widLIdtMZFW8Sz5XK1QPDbI9F2FTydLC2DSmR78tj87UQOS1W0N8VtDzHOiQVnCj
         P0ydXHD0DQ/UbqodK4rNPa64BjTVE33foiZQQ7WvtZ8OJrdkal2I5MJ2jlQcIYT4UIJy
         ihhDUlNK5+tKWngxRf8C1gV70iam9ZVEtI7nIUxxHQogPgEZxc5vHg8rkwqn+4lHEhUl
         +cFIBlnG33/CAzJJQfXYQSxKyK8a/u1ydyS1V/CvLx7LyHzezVU2l9tWYADX2PTgLYFC
         Q+EQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=miget.com; s=google; t=1793008148; x=1793612948; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuUzM1WaQyok0e/qkOj26iucNld9X/+5dUm21tLW5Ng=;
        b=MFsRk5Mg23obbBNpKJiXdyAqBhEoxn2+qZ/llSvpkFxqxqWje4AigorkPeosfp7DHB
         4us1KTiC3i9s6hUDz8+iipZtIcbNs7qkGMUZBQPZuVqZsrVEOH/et52QW3kqAYlSgNUw
         538/x7biZ8zwMjsgKiaE2MU6cofOUF5kKJc2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008148; x=1793612948;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FuUzM1WaQyok0e/qkOj26iucNld9X/+5dUm21tLW5Ng=;
        b=Fyosxvufumy94jh7ObxHXw7ZKk1J8FmYGXDBKJa9uE17ROtdEyyytafUt2wcLnJHUs
         7tF6kmUtXnXnp+YJzQnuyd6Vj3WRzlor3GLqr2PXEALIKv4LREomyBhRJ0YPcO1pKleg
         jaU+YsUXIvHt3tRymIcvl4kOXVESkDHZXAi5L+iexlE+//4h3WrwYrYsg+kYIkXhBiRV
         v0X0Fj1wdoV66EdyJtGMSq7ELgJM8Xrh7CXY79Zv9VceXoj3dttDzBQdhlK7mj0nCSWZ
         rAdmmwujtLQ6eEYYJvM1EesHBVQUc5oueoD3HMcY1zf9s8Sjuti23r29eNde7XZY0ExN
         l3lA==
X-Forwarded-Encrypted: i=1; AKwUvBxhopU1QenT+1PyR82h0lC9eZAka5RRx4VIHkb4HF0iQRLTCNoiM/Q0cO1XUEYr5zylMqicffOJ9LVcwk4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhBNPDpx/aap44fm+VRoOkUTMD+QiGjY0SsTghEM6fXH5FU0gj
	vI3D7hr86F4T4/mtnniONRFdqieQV6sGy7oX3Gf1DLi3bZZ6t/PxXP184qYtCOIBd1sVXF7Hiug
	cLq/afVaLo6u5SpMJwY4pJXUEgW+XvTwaL3fY87Z0cQ==
X-Gm-Gg: AYBFou1bSV1QD4nxCDecOcAgex6JAtS72utku8lpBurnEHfRIp5MiWIKjJprVDxSAe0
	Fkz6XwGP0+KWZb5tXPWtCzO1eo6aFmgyvHGtmjluKHnjSBkmiQPRbF8JNhrdhUutDU8vXQMJv8A
	CDm/kobmLPZxVFMoskOEcSSrFXyxEzpuE9/0Zl1uo476gh6LjTYCifmKGqxSZ1F1AuRMnrf/wIW
	8XEt3RZnyUOX2MVvKQVwrMpHssaZsqG3P/ZY8H+rT3hTd+GSI5ptMP8Xf0gdvrCl+AEtbuxgcqn
	FY3vjLWjMPNYtDixry8Jf9Ok7coIYlbiBN2H7femJzRHpREwRWZsc9PqIhb2YCgZEywDueXCDmI
	aNH7jPB4o20SzvAIwemTfCWguRggaVWI3wkT2qaY387FPozRNDS/eSe+mgreCl4b2FzbCnw==
X-Received: by 2002:a05:6820:1393:b0:6f9:59ee:cfb7 with SMTP id
 006d021491bc7-70ba0e6375fmr3568051eaf.23.1793008147879; Mon, 26 Oct 2026
 02:49:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025195456.43414-1-chris@miget.com> <20261025195456.43414-3-chris@miget.com>
 <5360953a-ed8a-450b-93c2-f55876af8600@gmail.com>
In-Reply-To: <5360953a-ed8a-450b-93c2-f55876af8600@gmail.com>
From: Chris Taraszka <chris@miget.com>
Date: Mon, 26 Oct 2026 10:48:55 +0100
X-Gm-Features: AclHuK8ozhNoswhNuPdRnKi6YYcff8kxUXP8CRTlrzEGAMZVA7mXrrYS6jcIhps
Message-ID: <CAAcRvKM2CQeJLWDnUhQJ+pKxiduY3XakeBbJCTbnY8=beE5MLw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] platform/x86: bitland-mifs-wmi: Don't fail suspend
 or resume on profile errors
To: Mingyou Chen <qby140326@gmail.com>
Cc: Hans de Goede <hansg@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ilya Gladyshev <ilya.gladyshev@linux.dev>, Armin Wolf <W_Armin@gmx.de>, KentoNion <kento@kekto.ru>, 
	Matias Civadda <matias.civadda2342001@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 26 Oct 2026, Mingyou Chen wrote:
> What value does the firmware respond?
>
> This patch fixes the suspend problem, but it hides the real driver
> problem (unsupported profile entry).
>
> I saw 0x04 in your patch "platform/x86: bitland-mifs-wmi: Add Xiaomi
> Book Pro 14 quirk".
>
> If result.data[0] in laptop_profile_get actually equals 0x04, the
> function should be succeed, but it doesn't.

Hi Mingyou,

It does succeed with patch 1. The firmware returns 0x04 (I also read it
back from EC 0x68), and with the TM2424 entry laptop_profile_get() maps
it to performance. Since then the machine has suspended and resumed
several times without the warning.

The test in the notes was run without patch 1 on purpose, on the v13
default table, where 0x04 is not listed. That is the state of every
Bitland machine that has no entry yet: the TM2424 before patch 1, the
TM2107 before Matias' patch, and whatever model comes next. On those,
the aborted suspend is what users hit first. Before I knew the mode
values, logind retried the suspend every 15 seconds with the lid
closed, and the laptop drained about 40 Wh in one night.

> Is there another no_set (for read only) profile entry for the
> performance profile?

No. GET only ever returned 0x02, 0x03, 0x04, 0x09 and 0x0a here, and
all five are in the table.

So patch 2 does not hide a problem on this machine. On a machine
without an entry it keeps suspend working, and the "Failed to save
platform profile" warning still shows that the table needs an entry.

Thanks for the review of patch 1.

Chris
