Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866274;
	b=ETyLohEECPjQTfVMm7BV40OOg82SnkQO1GFwqF0vZ4T7mXPSRNefKBwDpr07+dkXH+yq
	 QyWZZJqbFq10CQDQoCWlxP/ovHXUxezInPm8KypjKGcnw1/8pCiwlQ5Zx4MgKf4hXtFbL
	 GnvhcsUbFpwuaIG2cjHRvwOwl51aq1Bl+CBbS9x8b+PO2fZ67l2PtfIEz87+pFLVKaBWa
	 eXh504/E4VgbSjdvATeaNPM//6mpwMCB/tmp6L0onNGaPlLh0Rb6WjcFZmFg4Bc0JfVgh
	 kwdWlQk1p1zPcXvHS8H6cyB3fD7XR6tFN7jtAjl0llF7WOGed9IX1GZMlimxGYJOFAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866274;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3k0TlYcqzV7mPVkptjvVxsR+HaSBcK1pGyBNv8k5DuQ=;
	b=wujjnTwtuFuXeK00ije1l/rTMc/3nyT1kWo4BdwdNaxgeHl+SnSpZhDUu4NbxWwKZ9ju
	 MwNmbwqzS6eD50m6D9Y41D2SLGim+djVQwQNSm/gU1FX1+HsqQljn0F73AVTW/i/PHs+4
	 sueye4HUrOcUCKXMGHB1seqoqL+C6uwrhARp23Q3f2MsDfDJuwUjLih91lllayN/3662+
	 02vqwOzWBo5XKlXL7hLTIq0OpW7bHNrDjxC0BdKzwps4wRRtMwtFXb83sRjYJ9dZPJl1o
	 qkd9GySlFn/x/9jw65eFM04VhhWsljWxt00Bl8cQ2AgCUVj+ZN9KPIy/18eNuCorgLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jTgbbLIY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAEB606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jTgbbLIY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F011F00A16
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866273;
	bh=3k0TlYcqzV7mPVkptjvVxsR+HaSBcK1pGyBNv8k5DuQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jTgbbLIYx0AnEDYBjH5tCg1RJCrEGCLqNEN5ZhzT9oifFd4Azor5PKL/CeNzJK5tC
	 vHa0+q8+EMQJ7MnUCDS77VHnB0uCpvX5Eg70srV1JfhfdRH0cAjnYprOnAZ9Pj6pkW
	 Hq2OtPL6ClpS8m8kpgWf6W9fVANo358EM5Ht50Adxm2OEMoxiT1a4SyGPB746f2mwP
	 ZDluvNpUcouAK9IP8OxLadg83pjqOjfloLrgA5R+mblAAgpr8kAkLX1kbJIxku6LeY
	 dflrIv9V1Uc5KzEqSApxsfoJZ9Ap8SnxUPACA8JQ7tmRbz34lQdFDHh9/xuGkP+Sqt
	 4FYO2wEfJdaww==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bfbc25a76aso484353e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:11:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxJaJS7Tc57lErF4w5dZL5ULk8wrzJzd8A2E7N7mMoyW+1g8UVp1TAPIUaRq8ZFcFz+WVd4F1nSJjOMZn4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GIKflscyIC4V1zjjYMUCQ6fY0BCIBiB7T2AOj01hBM1ilY7XI
	t7sNF4fkbpvj/am9lf9bT8w7uZYFYd0WQbR+wDjxy+NxHGQqmL65vcyDp3jiaIcFaSiUK5pWknr
	Tl5+7yMHC4chLSEpgdHjQeFsIuq2pueM=
X-Received: by 2002:ac2:4e98:0:b0:5bf:faba:373a with SMTP id
 2adb3069b0e04-5bffaba3853mr277123e87.3.1793866272701; Thu, 05 Nov 2026
 00:11:12 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104150013.32879-1-sinha.aryan03@gmail.com>
In-Reply-To: <20261104150013.32879-1-sinha.aryan03@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:11:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLkygr1hdLU3njWx6V0KpMdLAhrUkfDu88La6=fUKDKMVQ@mail.gmail.com>
X-Gm-Features: AclHuK-I9aBVLakE6JYacknndMqjpPK5ZRSL0PyrvLGNqISRkoulYx-ojyMrIVA
Message-ID: <CAD++jLkygr1hdLU3njWx6V0KpMdLAhrUkfDu88La6=fUKDKMVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: jhb100: use str_enable_disable()
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:00=E2=80=AFPM Aryan Sinha <sinha.aryan03@gmail.com=
> wrote:

> Replace the open coded ternary in the jhb100_irq_set_wake() function with=
 the helper
> from string_choices.h. Gives same output.
>
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>

Patch applied!

Yours,
Linus Walleij
