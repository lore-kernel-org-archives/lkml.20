Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435AE385519
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790598154; cv=none; b=fEul176vkemeWQZEsGi0N3mhwDiGLcNVAp1XSL3r6+fmVTN9mWamyjluoRyMHSZBv/3lrk4rTiuqrxcZlNfiFf8KZwRP+Y7y1qlRJ1VW8S+SBATDqaCsGlKBWSxLTBqg5M17KhFI/akJDTfnwn0kfS5NUYoPUcXlDLJ2JgwEY50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790598154; c=relaxed/simple;
	bh=CYr46wE5XAX7Y1vwDFvlJRJLa3xImyeWpZgtt6PYaaY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tq47YMELeJpYLuKDh5qFINkWc6Dfe8TncqrTBb7KCqz4aGWneKGvimfzjLKTnk9GCE1jUUAnGEhCiAYl6nrC91CeSheibHUBlN7hE33XI+83J0jmY423iLh7uulymr54uC+jq3/N8vwgy2qM57J0lCHJFDvvo5uD4rM5Ue85GpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yp5pldoC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yp5pldoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1F61F000FF
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598151;
	bh=CYr46wE5XAX7Y1vwDFvlJRJLa3xImyeWpZgtt6PYaaY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Yp5pldoCFMC0JiPqxHh8tvKEvJMqEfjGcdYwitMww7msuDHlhnzLKPuqYuY6lT7se
	 AHqdAuyLRQrDytmaSft8DRu++0XgkLYotdvumKjgj+KQzmjyAAa0BcG4H73IgnEspg
	 b/b9pZQqK5CNqWN2Ko3lVBRBaaucOlBINUQldz8jS67WEaaeUqihakEe67vfUoPsSu
	 P40c62EYrnIsRCfIoJlV1plUMP9fEE684fE5J0FDyuR2uJbkDcR4lSj3Rev7VprgWg
	 OvHoyzhSDRxeT0h8pkIJTzoZFWNp59gMfiqHGUg0R+QTyWDJdfMWnMXZvlLI1dPmm5
	 4KEJ6lHU8MQig==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8e911e665so2218520e87.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:22:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByrL4PPB4EBLPJlMa+2IKnxB1Cf7kzvQC++TIJ627wzAUK+SNwxF2kGMB7kjp3t9o+qICXh9rM+tF6doE8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIISoX+whQqjTFPNKCKFwmDXht+UH+EqiLjRdAMIwu/M/qZLxHJ
	/1KWCxQcpx7Z4LlDK+uHNuWp0he97MF5EeB/nZVc400eeSLJKo4Y20TI4kBOr4ELSr80+jh6Xeb
	V9S9OrmXbADQa2pSpWNwmdcgQHM2LiZyPekTYRW81hA==
X-Received: by 2002:a05:6512:3c84:b0:5b8:e2de:6f67 with SMTP id
 2adb3069b0e04-5b8e2de6feamr3570218e87.33.1790598149932; Mon, 28 Sep 2026
 05:22:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 12:22:28 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 12:22:28 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260928112546.631440-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928112546.631440-1-fanwu01@zju.edu.cn>
Date: Mon, 28 Sep 2026 12:22:28 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mf0+O7393fxkcupH2Gs3q9L4-hZn=ORE_zC_c9FFM67KQ@mail.gmail.com>
X-Gm-Features: AclHuK-nfTnJntkhEiDwnqhH1uYRFQ3P8cKjQ9tdRKoWajTwO1i7cEA4_kF9RF8
Message-ID: <CAMRc=Mf0+O7393fxkcupH2Gs3q9L4-hZn=ORE_zC_c9FFM67KQ@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mpsse: fix race when arming the IRQ poll worker
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, songl@zju.edu.cn, linusw@kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 28 Sep 2026 13:25:46 +0200, Fan Wu <fanwu01@zju.edu.cn> said:
> gpio_mpsse_irq_enable() schedules a poll worker before adding it to
> priv->workers. gpio_mpsse_disconnect() can miss the worker while
> tearing down the list, after which the worker can access freed priv.
>
> Publish and schedule the worker while holding irq_spin. Set dying under
> the same lock before disconnect tears down the list, so a worker created
> after teardown starts is neither published nor scheduled. Use
> kfree_rcu() for such a worker because irq_enable() runs with the IRQ
> descriptor raw lock held.
>
> This issue was found by an in-house static analysis tool.
>
> Fixes: 179ef1127d7a ("gpio: mpsse: ensure worker is torn down")
> Cc: stable@vger.kernel.org
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---

Please always include the changelog between iterations of the same series. I
have no idea what changed since v1.

Bart
