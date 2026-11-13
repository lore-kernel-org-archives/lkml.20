Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564569;
	b=AP4Byifbk8WEeMtzaNdt5o1qKGeHgGBsm9Q03c3caGg1+qSWjdQWpghloiJgjOyfC2qx
	 CisnXkCIyU57twT0VuOYwASHhp4OI4hZgXuUzlAsLMsRuEQLeHScLLIAPwn5V+aGwT6UN
	 zzjOEaim/1PSh72D8pjSxk8Wp+TVKQS3LB7Fh5NV9z/GU71Pc54m8TStFPAzWtu+cCe+J
	 pEunmhzxg3HwYUmGIfx60z0PNb4WpS29POnLde21D3LBN8vAQV2RFK0sGuSZTogox5Bcp
	 uJiXqXQwbJ9jNSvEdBDC2rQoYxM25/oQeR/iFXTLqxssfMKH/1j4FtdywgUL4PiV6aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564569;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lHtGW/alZjcgKTPZf6fIR74OQ4JRsfsRwol3QZcsyok=;
	b=g5yAg9NEzNgXxQUwDqBPuw88vgkUmFNxYzsdJsq9sg8LyIFlVZy+vjoPikty4RrkwkVj
	 65N8tyexMx2nOWbwSDVJhX0CW0XDmrouMw0IZMXV7Nfxzdj0I1LxQTOf3boPk0vMxcvuk
	 0L91dm7991A4RG9MLzsRhtTbiZ3QEFakFKB0JB8zS7ObOcmsTNrFa6WvKgiSc6Mig4m42
	 ZSZjofc/yAl9HHKxdiZdixQ2082LhlYSheAOxugzWYHzj0rDAszjclPnw3pmwTMEwYnE1
	 S1yNXzCf4kRUQjM7JTDdYdaobUolqoglMUTSoi8UCgp2qkekfFBXtuaTCVtNO5yamqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW7UDdEw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3507606A32D
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gW7UDdEw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78BBD1F000CD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794564568;
	bh=lHtGW/alZjcgKTPZf6fIR74OQ4JRsfsRwol3QZcsyok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gW7UDdEw6q+5j8PL5LPh1L1vrI7/MIoKJeAjSu2NDHrd1buG3qVpd1qYhNaa9PhEZ
	 0uUEqdklHY9Gbm+Ha9sUVGqC2s/1YeeDkfa483PuNbOwjkxP+CuS1Cq7pixdDBXc0R
	 v8QNxCJfMDXzIkIbjr1I/9MdJDOrw5/S0pgMg9lGdK7+71Aqu3QtTLGZtdE5rfj8sP
	 qBFGJ7jZOhrUemFPQdY3GuTbnZ9Tcy0O948NOaWNp92zja8/3HvsEPDwQXwO5lakfG
	 Lp8avRshrUm2G/L0CF6u+KsL4b/b4JItR3lH9LpYwzqjlbuhIzWXdmkjW/xWIb50Fo
	 jehn/M9xrMB9w==
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-716d052dc23so254177eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 02:09:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFGioPgO7u+VDmOMhvQkg4dAi4DaLbwdKet6iltLfy2YNCFOi2DPVfmKK7Gt8SrNbY/+4IzATE5NNQk7ek=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qio2vuvzrO0m4j4G94PhDP+Ts+JMIgmvao6CEoIGvEv9cP2WW
	zjqOtYf7RzQxi5QkRiNEPKm+wDmoiimM15ZDBDo+iGhUctc+UDb7UsiYiisciiG9hyc576J8YrF
	MY3HiDxZzaBFBxRg3Clmpric6VTSmg4E=
X-Received: by 2002:a05:6820:a294:20b0:6e0:8fc2:84a3 with SMTP id
 006d021491bc7-71ab510c545mr836854eaf.39.1794564567683; Fri, 13 Nov 2026
 02:09:27 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
 <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 13 Nov 2026 11:09:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLkcbCEvBYY3cdfM89kj3r6Nz-KSd25yypqom7TpbM1HHA@mail.gmail.com>
X-Gm-Features: AclHuK8B628wWVXl0NuYQCslLhyar4b72cZPwoixzCfMqUSGPYc6JmsCw2evP6o
Message-ID: <CAD++jLkcbCEvBYY3cdfM89kj3r6Nz-KSd25yypqom7TpbM1HHA@mail.gmail.com>
Subject: Re: [PATCH 03/11] pinctrl: scmi: send the settings without argument
 as enabled
To: =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Peng Fan <peng.fan@nxp.com>, Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
	Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:58=E2=80=AFPM Cl=C3=A9ment Le Goffic
<clegoffic@baylibre.com> wrote:

> bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
> drive-open-source and drive-push-pull take no argument in Linux, so
> they were sent with the value 0, which the protocol reads as disabled.
> Send 1.
>
> Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl=
 driver")
> Signed-off-by: Cl=C3=A9ment Le Goffic <clegoffic@baylibre.com>

Patch applied for fixes.

Yours,
Linus Walleij
