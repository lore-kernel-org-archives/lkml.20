Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ADF54A64DB
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789551748; cv=none; b=owYc7vOIW3X9xUja3QbfedvqBhQ38HupkOOKIi0QJhWOJf8T7nOqNDMFiVevOpBl3BmExwXgZrQuyIB/uxndNEmbslv4x3dcI8ZN3FJwIJfxZzPv/8V5kY6qVeDS7TWTTSWoZ3xVeYC0QItz8CSynEzV8UQYeyOUh1cGeCfcWF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789551748; c=relaxed/simple;
	bh=OAYn1OR/urJcX7Y1PYkiEnveKTXrW8w2C8NfOif91L8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZU1cC4L0nrYgGtgMXA5/oTdbVPGvDAMvKIT3VKWJ0yjg6VFgdG7Dbq8SYN79qHUfVROeTnHgitTVVh2PRzDDsFv4jU6gGpQCZ5JaYnX9n4jdivJnoKXY7N432TaTPZTbpprtqlti/U/Bi8bgig2nr/1Of2dP8xvWQXJBsfmoekI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DIBXyWb7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DIBXyWb7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9371F00899
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789551737;
	bh=OAYn1OR/urJcX7Y1PYkiEnveKTXrW8w2C8NfOif91L8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DIBXyWb7UH5fiTMzXNE37a2F+G9RIUwumVarRFiKNAZBsd99X6vZXzaa9EATH9e0P
	 /+ofei18bmy0VfPJC4iHaMTvZnQs6kyqXxu/UUHKaK385/aV7yYjBIl+xBhHJ2mGIE
	 14L0i49LA/xQPxgMOQ2waI9AzgehLyjrTCAln0GBeyyu6a3JEZhq2sW6VblSycwkn4
	 T1zQS4e1h7dc7R123LzQUJzZgyqxLihnLBPKyg7YHcpmc2prefCKoozmsXKfkTlZNT
	 D1iTlKgwEuKzjP413TGKYMB8MMlQq79pjYd/phOTBhUcUZgVzzlHRBvpGchaO5BRPV
	 581T61ApkigvQ==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a59fa3112cso6629931fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 02:42:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwJU6hrHDsMaosWiDzhfhStP49KH2yyF0lMmwuCvzIeY/QdEGFTLf1ROFy++7618pYhToh8UUNVAcnjhIM=@vger.kernel.org
X-Gm-Message-State: AFuF++nhA4aZ3y3VwGYIJXvIcVPK9np9XVGSQ1meKmjQPP/0g3mLvmPR
	kw5y3ypVssWlm9ZkPZk7GdOoKWZzXoIqkOFHfgk4G6fUouwtkC/G480Zn52rau+CWSlQioFKBta
	Z4w4UZlwB2TGB1Glsuksh6bCkGxFmRUHDxv9DPtoTjg==
X-Received: by 2002:a05:651c:2107:b0:3a5:bb28:3324 with SMTP id
 38308e7fff4ca-3a5dca282a3mr3987981fa.28.1789551736240; Wed, 16 Sep 2026
 02:42:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 09:42:15 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 09:42:15 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Date: Wed, 16 Sep 2026 09:42:15 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
X-Gm-Features: AcwNN1UbxaY2LXeizQ7uYjEouexjsvFGbwv4lQlNYZHZGCxRnPnk9_dWQHfZ6g8
Message-ID: <CAMRc=MdmqkG02q=4_wJAVjeBzP_8KqQWNx6cBaL=FUTn_wxw-Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] gpio: mmio: report the line direction on chips
 without direction registers
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Haibo Chen <haibo.chen@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 10:04:57 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
>
> On trees: Linus offered to take patch 2 through pinctrl, and patch 1 is
> pinctrl as well. Patch 4 gives wrong answers without patch 2 (an
> undecoded pad register would seed every requested line as an output), so
> I would rather the two pinctrl patches land first or in the same cycle
> as the two gpio patches, whichever way you two prefer to split it.
>

Linus can put the first two on an immutable branch for me to pull.

Bart
