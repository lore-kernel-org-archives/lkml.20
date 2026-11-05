Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867568;
	b=N9b1LQpDSsYKgrWYOECr8haOY4pPyD6+kHYkVqLr0DqJUMYsvbUWZ5KSHJaRS+nfg+X/
	 ajYR/CQIUP43pajPhAAH/RamoRSWyfrEJrRVbMDXbWuTY8NZUTCUzQbBosH7aa2OnttgN
	 B3X/2eYwjxwE1Cp35FF/gvLEj6D2uaFCjrtnXXQEmeRHbABVF5HlOuDaVzKfcNj9htaVf
	 ZtG+6LW0hbDxdNheYqDXDZWpKkRpKP2POvs8/ZnOsUD/UHt1MwSY7m4un3KciP6P0vi7T
	 FTeVXlHLdctUJLkBN3HdsBcOQ55CcMtzKV3tte6XXgcimZHnCFEGnE7dUINCoomY67Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867568;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9G6iLyQ27qSO6+jySl/BSygI1MuIdzR4p+hafZm2OuY=;
	b=HVpK5LwUeiRGN1ik6SNr409xNTQSGWwWdHWY2UBRbBbVfm8GqKZbNj83su/X4nwU6hLY
	 zwrYsskOF0b1n670ytDT+uUJB9fhlDXyGQbBO7A88/jis94wyfB8kn7saBNRJa6Lyp9GS
	 GiYN5tM7rdZM1/ymB3qj8RcCZiNkCImTuph68i/kq5XIYhV2a7C4fXKRu5a7/Mr5YWu7S
	 kFAO+PIh+mC8uDQDoCyKYpkqoMM6rRGvzQp6yj/XxG+reXqgLwad3pGXsfRVNx3DR5OBa
	 ZxO+tkbUUEBpunNxYQwgEH786grpGljL1f/DWtaa+PN3zWIXuig8Tnkd2w7badJpy+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENBMEQYw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FD9606A335
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENBMEQYw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890971F00919
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867568;
	bh=9G6iLyQ27qSO6+jySl/BSygI1MuIdzR4p+hafZm2OuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ENBMEQYwUKLp+rvTag3iQxGfQvFALKFvWzDGMvkQZAE0gQHDxADfPDayM81rcu60c
	 vwsfRZ3dVO+fy1syM2n71wGVrXhYzAxuicxQEpij/IC73cnLMuzZXNI9frDB1MiX//
	 lQitXaHcfWTPQlhLNYrOyEkKm+Di1SfFfnRDPY1dj3iUHzSHxgqTN6D/9WpXY8syvt
	 WZqR5Y4pFZOi9/uAksjtwUNCI0ijYVWhetoOpa6lOsUIsXH0A1VCAmBev4GtCFx6du
	 DyDW5cC/b8nevAKCMxOpykFfTl3rUjv6zCetE9e36B+/mGwyZ09h3cOejbKuGoYDFM
	 DM3nzV+xe8DxQ==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5be4c78e8caso1291127e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByNh77A1dwOVkFtEFNlHj0bj4u0fM0i7LjdTbn45qqtmnyPI+Pa+1lF5wUlywLpKQt3dMvF7CrpUMb64As=@vger.kernel.org
X-Gm-Message-State: APuU4Z9xe1RRTjUxduQg8GE3gC1BSoksUJWCoZouQxmetp/y6SUYqV6b
	fv1zJHpkwwLV8khk41MHBNnjYzzl6IKD2E0dG4eEc9JGr0q7CoRY3aRt0voVVVZoXb/rumO7Vwz
	ZvsRUp6Xi26HB7boxRzW10d7BHLCUNVw=
X-Received: by 2002:a05:6512:124a:b0:5bf:d60c:9f98 with SMTP id
 2adb3069b0e04-5bfd9583912mr7021382e87.59.1793867567355; Thu, 05 Nov 2026
 00:32:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:32:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkD+j5HNA48vzuyVDxSJ+J2mYpTD_kaDAtDBYvWLV5y7g@mail.gmail.com>
X-Gm-Features: AclHuK-_e7x6gp0MSxZ4qc8ym5mKcmCBlv1VkGDlRNSYFA2jkqkO8_sgAxCWvSM
Message-ID: <CAD++jLkD+j5HNA48vzuyVDxSJ+J2mYpTD_kaDAtDBYvWLV5y7g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:52=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull one final fix for Qualcomm pinctrl drivers for this cycle.

Sadly missed the v7.3 window because too late.

Pulled in for v7.4-rcN

Yours,
Linus Walleij
