Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 284773750CB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792156211; cv=none; b=IdNaLgLI463zEiD3ly4KORnIzVs1wZbYHFV0S8aNR7Ojc/PNjWZniWY/8GbFSfYyzJ/F8+mRhfe6TEIoTA092bwy7tJ0PT+sw4RZ73JyxfbxgE3hDYbAVF07mYmuoNofQGev+YBeAWV4QYg8cfAaCJcwvjzHsfHNQN/yNUvqZ+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792156211; c=relaxed/simple;
	bh=FQ09vxMYGYd2ttuL80Iy/iCi50C6RG5783hdiIeKPfQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kwuGxJToORlyX5XGKlfNwPrHOYCd0jxYFsuFA69X1qcQM6xS6jvJc4bNpPPuL7vTegQoykOGdvnZsZXrxLWCoIoAVTnZ2vMJ1imiYNDdZRs5ZP6sX9FcWW+Qw7/PkTlQAF+3tw+RyEpkqPzG2xjgEfdkAKpBtT7Y0+ZlokJuT4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zp1d5DrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zp1d5DrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB2A11F000CB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792156210;
	bh=FQ09vxMYGYd2ttuL80Iy/iCi50C6RG5783hdiIeKPfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Zp1d5DrQ+g9gZOqi1ktuml9geH1/C+rDv7YqCvb4CkbBbMuDZHftL8I4yOx4/FIf4
	 OPwb7NuuMkeRC30FxjGqpvUL1ILYq+kJ0k3EL40eVoVSW+qECwU3hKL2gQVHuEWirD
	 RqInfzwRSTFeqGS4GCRl9RG3R9KWpMnTCCItiV7GbXYM/MwZrRipgcudFQjeHI53bJ
	 bmUrni3nLo84fLh14aPUtB8K+1gGoCJfuvTbzzifN0CxQmOtJTKlgM9sA32knvlvxM
	 SXzql84inrJwPZFcnQQisuL0NuXETlcn3ezCbPTgI8eZbAeD4MTfJ7u9x/BRD3s902
	 WDkBvi0oS68rQ==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a980c01033so24180921fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 06:10:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxgrE8lVW46rI2gV2nnNt/RV9JHTDOm/81Yaq5CDNVTovR6AH/eyxe+1rx+7mXAyrkd+L32ocmlxRFnWjU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzFAB2XK//avUG1WItcxf+3Feu+bqc+WuO5UxSzPfMqEZiarvA
	obsBWxlX94VUYjKG0Lg3Hn0MICj4Zint6XMEAhF7qKIJbs5YDUEgaxan/XqZpdgL9KML3wbv9hj
	qhf0QXr8QUr2RnwnNFWBwtmeTbHGA9EE=
X-Received: by 2002:ac2:4c56:0:b0:5be:494a:f966 with SMTP id
 2adb3069b0e04-5be494afb99mr795645e87.44.1792156208704; Fri, 16 Oct 2026
 06:10:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261014-gpio-shared-fwnode-lookup-v4-0-2253ad645fd6@oss.qualcomm.com>
 <20261014-gpio-shared-fwnode-lookup-v4-1-2253ad645fd6@oss.qualcomm.com>
In-Reply-To: <20261014-gpio-shared-fwnode-lookup-v4-1-2253ad645fd6@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:09:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLnNLryFVBvxwTrw0N9JoHorP0E_SUJcBEQz50i9QnRUuw@mail.gmail.com>
X-Gm-Features: AclHuK9TuCFmvkGVc_qKE21bFcDzH5CIbWg6ZWuK5Fbj6e2kEGf1TDNPflTSDE4
Message-ID: <CAD++jLnNLryFVBvxwTrw0N9JoHorP0E_SUJcBEQz50i9QnRUuw@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] gpio: shared: fix use-after-free bug when adding
 shared proxies
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 11:38=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO lookup table can stay alive for longer than the kobject whose
> name string's address we're assigning to lookup->dev_id. Fix a potential
> UAF by duplicating the string.
>
> Cc: stable@vger.kernel.org
> Fixes: a060b8c511ab ("gpiolib: implement low-level, shared GPIO support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

LGTM
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
