Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660301;
	b=wfyTw/9Y+pnKKo3+/ZU7UOeEXs4kv5fhJZkx2PtZFDeB4uR5v70rTTRAt05KHeO9VwoN
	 3XKF9o1gCIJ7i5XP6Ml3lu/CQ/BnqCx/nEeAOkHzqY3Yuj16hl3xrQPKXuyHncgHopheQ
	 JorgLvcf2wuF/NcRyzzQv4epIfki+uyI9AE+28s81h5EsbnhJe+IfHZTWL3eeoSCUMyc3
	 /rWaa7j4/B6enu/1iXW1p9xJwZqmZvX48r7mPKxJdpbA+ASe4vVL7aAFLCmWKT6SGXW8y
	 bn/0Gcu18GOjQb3LVR69KYmxWU69rg6+ydWFKLS4OeSXDV6luKasocWSV3xBftiDWrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660301;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=p/rWYroWakeh+XKdFXLD4/hTsWddof8wuTHxvaKPBIs=;
	b=WUw+MWb7wfk1vyfqa17OBn3uYv2qMn9+6+dN4Zsteuy6Se78mzhVQQr5ue4kzo89DTbI
	 iyOggNGxsn+bc5tk+Smf9Quqx0qW7M9S7rjbg4VyYMtcUYuC0zE4izK4OTJC7mp3JtXg3
	 GfGS4jBmDOxBY5EsusNXv/JBQcfNqfLgykp/ZJA/JROmXVdMjLaFhdSti1z0zuybf4vOF
	 vpK89dSofPhrUsPHI36RnH6bLhtMx41q/gPJ4AdxcD3KAFtVoNYJ59kz0a/Wsp8hzCKSc
	 tEX85+boJn/DCtKdZLQNjjST2yhF4Nj+/Q2UQsPQnZzLSryeu9AL0lJgDRY9xEqyj4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgXn7b0F;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D927606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JgXn7b0F
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F021F000C7
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 09:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792660300;
	bh=p/rWYroWakeh+XKdFXLD4/hTsWddof8wuTHxvaKPBIs=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=JgXn7b0FPQxh81xw+phuxyPgQ9fuRV/9DmFkK0eOdg8ypWV4kydREYNqip5Nm2b14
	 p4ve/6KD56vOpkpFi3Yp90WjnlYiMR71N4Kr1/nwbH1PWsfBtzhN2Wq5tUym79Hrc7
	 1fds9Tn6ugtgU7PlIwDFioK/oxKiJXXk/IKuvoSpaemVzVMjQGqO6JpDHof8OsDbz3
	 NvArg4bpbV/VJxnT0S7+nU2Xl88zgTEGjg6NP7+hRPX3AyMX4brriLK2xVeTrfJ52z
	 iGhrkI+U0FhRoeUNwiv1BcFnJWygwCDJGbgrIj18u8YrQ3W5RCXqWoTipeBEs32Q56
	 sAPgrSgr0lZfQ==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso13853171fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:11:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwsv5hqkjvYDeOUy8ktPw6deClC+O//Cdv6RgUGIOb6NBX82m3Sj/DUZhhiHtIK1KxFr1GA5cWB2CG82/8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI7zygx9cFpKw//UdeF+2UXDr8KLWKe8ey6SiQIL6k75dhl+RLs
	FsnT/Zvd8PaywF8YzsNc8+ZX0Y47nnfo/Nx4VsJPwY3Q6W4DLRukXqmnL/WTXLyeElr4o3Wlgt2
	j7rBfqt5Z4FTGGdzqwY/Fv1dtIl5H+mWAkNvMs1qbQQ==
X-Received: by 2002:a2e:be9e:0:b0:3a9:d937:7540 with SMTP id
 38308e7fff4ca-3ac4416243dmr12975201fa.9.1792660299462; Thu, 22 Oct 2026
 02:11:39 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 02:11:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 02:11:38 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
Date: Thu, 22 Oct 2026 02:11:38 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com>
X-Gm-Features: AclHuK_hz-v2b1ECvbFN520xl5CJy3PF0_qpuWYzZq4NEyeOn4Gq02HoHw6YzK4
Message-ID: <CAMRc=MdHEzHBXx=P1-0Ut80P5=sQnPDwZRD-zdpoE75iHcJjBA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] gpio: Introduce helper to dispose IRQ mappings
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Samuel Moelius <sam.moelius@trailofbits.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 22:44:42 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> I have noticed that a few drivers use almost the same code to dispose IRQ
> mappings. This series to deduplicate the efforts. I only converted a couple
> of the users (there are potentially more) in order to stay in the same
> subsystem.
>

The "few" being 2 testing drivers of which one (mockup) should ideally go away.
Do we really want to add more code to GPIO core that will only be used in
testing module(s)? I don't think this is useful, sorry.

Bartosz
