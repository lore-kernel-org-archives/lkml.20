Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDA13B8958
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774729; cv=none; b=Q63PeLlYa67KYiYoKtpA4bZ2+oI8B8OvwYqhmw1dc7/LLB/DrVYtil4ffO1hEBDxe6R3qDh7TLeXdm8x3KJ2hNZhqdkcY2bbFwvBTpySKgke01q5/M381WNJshzSvbU+EMXq7220QD6la+lHYAh1Fmj3lwroT8jZNO2iu2SnocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774729; c=relaxed/simple;
	bh=LWlNm4Hqu/6yss+FNCzGhtjesCrAp81WnXy+gDh5wwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXgh7REjllh1FYbbEQpj6GoyfQWeiQn3qFBwsj2WNjcD1l2mD+jROhE5I2AuKyyZ/DIVkT9zYxiXXc9jgl2vN1lXzrFPbCToso+O0sTz6dUljtWHHi7CWtOH6Lk2vNWsgtZfLwBWLEKZsYXqLpwB1Iav6TdA0kCy7k9Enru4NV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNDNhU34; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNDNhU34"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089801F0089A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 13:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790774719;
	bh=LWlNm4Hqu/6yss+FNCzGhtjesCrAp81WnXy+gDh5wwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VNDNhU34xfQdoQi4d0Alm7ZohQ//9Nvt51fn275dq5pUxqzvdJyigdv3+zG0iE4PB
	 q/5kuB3J6JUsk3SS2Rp8jowZLyO9LJY9S1qcu9Xe+iIh+/YYgFDJ7rRoNFcQKc7oUa
	 OLI97kpi/cgpnMW9Qy6gOcurtjn6xECLxqZ/RSEVstqIuhHDaUQzxsnZg4Ver/Tq2S
	 wO4lW6PrDVWHIiOk4GChGQ9NkjN5Qosm1MhM5aM2qBOyeXqmetKYXdae+a+mo/h39O
	 wcaNYIcsWAj6deZ6SRb0cyO109Fkx3iQib/7HsJMLhNNFmXHLP07PT+eS/Wk8OUKHs
	 Ed1vBd352J9ng==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba390408cdso1417487e87.0
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 06:25:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPZtfMv3jQmO5a8aryYnlDOhV+AI2lr91U3K8l82VNE4EcV/Jx5bC7A3yUKNfrDC4u1T8dwQ8OknkKs0w=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4CyNevPs1QDd1Gzzj32ES0H6xuvxTSDqoMbbWDgl6rOowb1aG
	1rg9Hv6fW/bxHVlHF4sjqYr2IrQOqTKqM/jx/GojcwiUTEmXmIDcpmDolGP5ZrOznZnoHXbv+X/
	RInBSOcT3gBmP7djcT6bZi3u4okRaXDM=
X-Received: by 2002:a05:6512:66d0:20b0:5b8:f7c0:cdab with SMTP id
 2adb3069b0e04-5ba40601a87mr483807e87.53.1790774717776; Wed, 30 Sep 2026
 06:25:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917230650.117403-1-rosenp@gmail.com>
In-Reply-To: <20260917230650.117403-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 15:25:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkrAxKynTeBn_aSj7RXzZKz46ubEHCkW0C27Ov8zYPELg@mail.gmail.com>
X-Gm-Features: AclHuK9iCfQA9adOSkkO--8ZsscDbZSc4jPsWtSvpOWhQkt94d5SJSMX3Aphlcw
Message-ID: <CAD++jLkrAxKynTeBn_aSj7RXzZKz46ubEHCkW0C27Ov8zYPELg@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:07=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

> The Armada XP variant keeps the per-CPU edge/level mask registers in a
> second I/O window (percpu_regs) rather than in the main GPIO window.
> The suspend and resume paths however read and wrote them through
> mvchip->regs with the per-CPU offsets, which hits the global
> GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
> was therefore lost across suspend/resume, so a level line could end up
> unmasked behind genirq's back and trigger an interrupt storm once
> interrupts are re-enabled.
>
> Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
> both the suspend save and the resume restore paths, matching the
> mask/unmask handlers and the probe-time masking.
>
> Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
