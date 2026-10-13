Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA54C4E4C22
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791934670; cv=none; b=GuUOdyQFnWI4Msd+nCN1bulP4BHASHsGLr871n1JHVvLi+r+OZ6I+UdIPwBWq2xhhXb2WiH5sw7HH/wNsEmCucNG46bm70o+M87ongzBqQ7aA7bz7pBfCaZmkq+goMWRNxk7HezLqJXmt9Yvn08w0pln8oXKHRjpal2onGChEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791934670; c=relaxed/simple;
	bh=NRYL7unWirl86XjxWCIqaCAbuQfLBqkk+D9GKLD5pWg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d6ZidYvaWe+Ot0rtmCXqnCq0IazDQ6p3zyJ+xkj2lfzuLtj8orVmvLjo9a0jgc4N25rlhjYYR4VcvrEuYzOkTpzzpnadDxZ+m6ASTF+i/J8lZxxDqNNkhyiOoTI1+RB/gZu0ZKnoWN5NMcT1DS2nCk9wQ1qKBvJoZo3H2JLzWgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoqZ6dxe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoqZ6dxe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67ABF1F00899
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 23:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791934665;
	bh=wiNbuPmyHWvBDHH4TW2Sjy48ZttxSv2iyqaxH8oE7rE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QoqZ6dxeYqGlPOIJat6pK5YMTTV3YTmEo3O5ZvSlYHMd2jbkMyWMXEc9EeCYwxXYP
	 SNs3OR9kY82yBuz2xQG6HyB61dkjVXw3q52Hur7ulfucGANvW57mi5Es9FXSum4vLS
	 R1jE9ExOCHairEE2iK/vBAufAtYJ32IiD7MzbDC8HEY1Q75YaIW9Itet9MFtm2xICF
	 pO5Xw+NEd/IPnTqAEgI+KkWZxoeHZyhriOz6yzoTntwX/gzuW7CsY4V7t7JJiZraCM
	 6A1HdIJIs1USLZvuza6wmhZvm6FEe+/6/5l4vZ+fP+RDm6A60MToCoTzaDRI+L3Icn
	 XHy9Y8rJ1ulDg==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5ba35c0df4fso3103596e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 16:37:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyGy/SDkW2w09SgHEndke06rXhmQpG/OJyj5uphqUYoF4OI9fDG/xAfY17bx/MjnEpng52Aq6rkyfYqSE=@vger.kernel.org
X-Gm-Message-State: AFq9FYLh2kyFQNZtyHeFouYCw2mFTEISjM1m5/N33jCSOxL/0QCVDRIo
	9hx8hzMYMW7TiQhctC0C+apyrhY2VG+JXw/JvYBLzI767/+6DLnzPf9bzJWTYUtbvFYQKk/PJrx
	mwtugLKTiAKrwKDsrN2UNXDHFjtmmCH4=
X-Received: by 2002:a05:6512:3b24:b0:5bb:7829:741c with SMTP id
 2adb3069b0e04-5bcde35ea87mr4836395e87.1.1791934664181; Tue, 13 Oct 2026
 16:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011061722.3159941-1-make_ruc2021@163.com>
In-Reply-To: <20261011061722.3159941-1-make_ruc2021@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:37:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLnHiKZ0OuD4Yb=+YoB7mM7KVPCNAzy4qRuRq1P3LEQDLQ@mail.gmail.com>
X-Gm-Features: AclHuK9TqHDzu3p9JgxKkHBWbUqRTWvhKXq68f01GBj1YgfR4EN8Zm8P75JUKC4
Message-ID: <CAD++jLnHiKZ0OuD4Yb=+YoB7mM7KVPCNAzy4qRuRq1P3LEQDLQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: stm32: Fix fwnode reference leak in stm32_gpiolib_register_bank()
To: Ma Ke <make_ruc2021@163.com>
Cc: antonio.borneo@foss.st.com, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, andriy.shevchenko@linux.intel.com, 
	fabien.dessenne@foss.st.com, linux-gpio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	akpm@linux-foundation.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 8:17=E2=80=AFAM Ma Ke <make_ruc2021@163.com> wrote:

> stm32_gpiolib_register_bank() walks the "gpio-ranges" property with
> fwnode_property_get_reference_args().  As documented in
> drivers/base/property.c:
>
>  * The caller is responsible for calling fwnode_handle_put() on the
>  * returned @args->fwnode pointer.
>
> The returned reference is never put.  The function calls the helper
> twice, once directly and then repeatedly in a while loop, and each
> call overwrites args, so only the last reference is even reachable
> and all the earlier ones are leaked for good.
>
> Put the reference as soon as args.args[] has been consumed, both for
> the initial call and for every iteration of the loop.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: bb949ed9b16b ("pinctrl: stm32: Switch to use for_each_gpiochip_nod=
e() helper")
> Signed-off-by: Ma Ke <make_ruc2021@163.com>

Patch applied as nonurgent fix, look into Andy's comment
and see if you can follow up with a thorough fix.

Yours,
Linus Walleij
