Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794592208;
	b=4P7/BCNkoQkSVJVsCiy/nE5Zr3PKANUWhLNvZDF3O8pF7351EXQL7zda1jn6xoejC7BS
	 dcnhWczHUqyPRbuDIJjZDvKYpODWGXEg/Gw8t/av5GslKNZyhPfY9KUwu1Fclm1AMZgPb
	 yVQ54FlrN4aUH6TKciXKjRPFoAq6eGacbwNj6z4RIi+gw8IacS7QgDXHtfkrMl4cp+O0v
	 3tFSpLPHb/hD1D8W0zg7grLY+TdAUQhgO85adqkFI74Bv5iIrmDefdDMNhfuQj7J1OXU3
	 sc7yqcKhglTnxtjbo82mSg2VGazYUW0xA/8d+26UFEjADqQl/pJur7GhVI1MvdoFF6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794592208;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=EU1uYM/NmLFZaI8ig83tMQonoDZ93Lw71raJgl086sU=;
	b=LPcJsmqbYdZSvqUyNlEJCqlTrSvKOHh9aBDSrYvdIp/YNtcXKcgbzhdn2swKLFB2WKsR
	 7snqHHrT5sWDc6eoTE6dehsgssRe6fWNrgAm2xLOwDyIL8ftyJ5r97XjDInEsHGnBIuTR
	 +5rRrT6WKtFI9oHeBbmK0IF41J7KJRYNof/jx2H6i+Ft44qhmzXhWaAfpZZmY9hEN2RHD
	 NcXfC64FBOQ4gHQph6CIpMKLWxViQbFVq6hLjLYpRTUiJPnX21THbBfUoEkH0H50jBWvc
	 1N/IgRn5DYA2fy32xqIhEhdum6gYJ+yBmZzEajAaL39GTabQ0hMZIWH1ypUxw137lpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Dg/XM+NI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48186606E204
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Dg/XM+NI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0069C1F000CC
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794592208;
	bh=EU1uYM/NmLFZaI8ig83tMQonoDZ93Lw71raJgl086sU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Dg/XM+NI0+gCVjw/yecJMjbmKBBSfE2wlXhMcQtR9lHWl+bXw9zUXNym1Y+7AiDM8
	 QGsNJLuqzOPq0bvQCen+dpaMUs2D6MZIlWS2JmEcwn41DzaHWrCpsN83hD1sa8/wg/
	 D8LpmwK9QPL3uQlzsv/dOXW4uW7LOJT9eDMY4YBtOVc2FKM9qZEOilXfGgopTAIpbO
	 tv7gyXBPNSHv2652X/AvZJD2yLyGP3/ERoRoQfCEZsBAWFeLBwvKjBBiXhgwqgtVMl
	 9uinftxMT9ZCsiVUjNeMI7hvy3gHLCrh4cCAICE86maSohX5DyRtbFotG61krg3Okw
	 szadMia1T+cdA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c08539c827so1335534e87.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:50:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHe0ckXn0H0+eYZZ23fHeh8KCw5UG4LEXn5MtBD3wKc7wPoTYu5il62I26H9sjclDtu4V4qEE4Lj1QfTLw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WNKsPfoZ3k0dSrZiLkqK8Wn2wFdfBoagnlcKSGRFup6LmKG3s
	PlxhSKExtH/PebqnoeLgMD9qlahKvneBay8gfLREbdajBbyVOCpGyBqt8OxEwdJECb13iDSBiWR
	4/+aUPVMaH1fWl5PxxoNLCMH4Smu0aMo=
X-Received: by 2002:ac2:5683:0:b0:5bf:dd04:8d7f with SMTP id
 2adb3069b0e04-5c17075c348mr1704210e87.11.1794592206322; Fri, 13 Nov 2026
 09:50:06 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110085125.2535508-1-johan@kernel.org> <20261110085125.2535508-9-johan@kernel.org>
In-Reply-To: <20261110085125.2535508-9-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 18:49:54 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0g+X0etuZSoTrFr2OXgF9o0q+LLLTcQSfvo0A3dib9M4Q@mail.gmail.com>
X-Gm-Features: AclHuK8FkWmm3X6Ez4fQpYts4d02b-gmJ11NIGOgqEPyiws4gYW8Iu7-IoWq1Cs
Message-ID: <CAJZ5v0g+X0etuZSoTrFr2OXgF9o0q+LLLTcQSfvo0A3dib9M4Q@mail.gmail.com>
Subject: Re: [PATCH v2 8/8] device property: fix fwnode_get_next_child_node() comments
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, driver-core@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Xu Yang <xu.yang_2@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:52=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> The parent pointer in fwnode_get_next_child_node() may not point to a
> primary firmware node so update the comments to reflect that.
>
> While add it, fix an indefinite article in an earlier comment.

s/While add/While at/

> Fixes: 190069255582 ("device property: fix infinite loop in fwnode_for_ea=
ch_child_node()")
> Cc: Xu Yang <xu.yang_2@nxp.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/base/property.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index 51109794d727..32df0c6724ac 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -810,7 +810,7 @@ fwnode_get_next_child_node(const struct fwnode_handle=
 *fwnode,
>
>         /*
>          * If this function is in a loop and the previous iteration retur=
ned
> -        * an child from fwnode->secondary, then we need to use the secon=
dary
> +        * a child from fwnode->secondary, then we need to use the second=
ary
>          * as parent rather than @fwnode.
>          */
>         if (child) {
> @@ -822,12 +822,12 @@ fwnode_get_next_child_node(const struct fwnode_hand=
le *fwnode,
>         if (IS_ERR_OR_NULL(parent))
>                 return NULL;
>
> -       /* Try to find a child in primary fwnode */
> +       /* Try to find a child in parent */

I'm not sure if this comment is still useful after the change, so
maybe drop it altogether?

>         next =3D fwnode_call_ptr_op(parent, get_next_child_node, child);
>         if (next)
>                 return next;
>
> -       /* When no more children in primary, continue with secondary */
> +       /* When no more children in parent, continue with any secondary *=
/

What about

  /* Direct children exhausted, go to secondary */

>         return fwnode_get_next_child_node(parent->secondary, NULL);
>  }
>  EXPORT_SYMBOL_GPL(fwnode_get_next_child_node);
> --
