Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794590600;
	b=ksY7t8E/9sJQzt0goug/0y5oEaJIxNiIWeBjQ9dcB2TbWqAE4vRaIAz4A/lcdzFfF6ER
	 lndCH521pHR7rxgsV4GHscWyRGbMQk+kgUHgFgRADsDuSkdUjyFVaoSciFepfsQ2ZTgmA
	 MVdNIbV1wimi8SimxhSvKe4ZL18Fp/EfzfE4drxjXe7YdNGX9ezO4H1vPnzwG5ViI4Ov2
	 v/XYx8zWe2odCPLfGmyQOThV+EF/pHTEiiMUH5ggcmo2EmzVP6VXx4GxQjoogWUJWHEwi
	 wGm5CXMQWfnlaXr1symFRmE8EI0AV1k6BuxriJJfCz/kqKW+yseh71Yx7JZ5YtjFcRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794590600;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2c+SwvVe+TYvB1ck0x9BFmui9dOGJzGDRlpiqG9Cfj0=;
	b=iao+R021TWcQs8CIsX+U8MninGHqAvoAEmIxnZmEHbfoiPZoEEIJjf8JI+8Eifa7c7C5
	 VKZqRl9/NxRsqUrJiScmkuSyTho8sUAR1Kwtye0s7KxdObystGise2M13cMn07D9xAG6V
	 vJF2JImQ+5HM7Zok+uFPDWr0a5d5rXOQI7pyuXARYzu0QsXCrNFz/5mZ+wQfUpzZJc4+Z
	 9V1OXi6f8lzcLhUuV13YgADxhIpdnwMizXEqtoo4UUlo05FYZpGpR1P/v656m6ySy0vN/
	 ulY5SLtjHSaEyUta71+/uy9kXN67k+Kq8/5q3I6tUofMQ1341oe2pd83YCMrgLV+2jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="c/YJO4bh";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C518606C0B5
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c/YJO4bh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C9A1F000D0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794590600;
	bh=2c+SwvVe+TYvB1ck0x9BFmui9dOGJzGDRlpiqG9Cfj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c/YJO4bhCrQWIhSM6EQGg1502+mq+by4yptqz28H6C2QAcVcxo/sv5SDoxBQPi1+y
	 rzOHHIcEX1NvwpOu1r8J5FHs0ccpqC1d6zeN0+LYuTvlctR3ztCM8VVjeiVYrgp14C
	 OIp/N0FawMMtckqcRN4VhblDLHRSNpdrpQQZ/Q6DXwI870gA3SD+bAfI55J58DzlE6
	 eFLNGmVmhfR9N1sOd/QzaGwqCjAdUSacbRwPOtpTJ4srPN+GGxXELmx6ToYKiOBrJG
	 WbaEz1fWYfaoaPxTLCGdfIUr3m53hxVLM380qbZboiGT3br3uDUtj6Cf+rlK6qDfip
	 3Tc71H311BoCQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so16026731fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:23:20 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHLvVT0JWG4uYkoRwMIMrZrNubz+PqX8oUsr+I0ZsdfQKbi5h4CAqkq6KBT2I968bny0xIxKrb4RRLhKjg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Rjxk1Q+xwBvc0bm0Sz9bW+FqtM6yCcOiWRubOg5p5oICS3/u0
	Z6DqiPtXxaCjE1wD9IZqC6BokP1UFXpUN3k2nT593Hy3aiH8IUQ1P5sArvqLK0d2OrR+6vnS3Mw
	f3Ixy5VO7Cqbug+HH6Rb1X39HP8ai0dY=
X-Received: by 2002:a05:651c:1a2c:b0:3a3:5a01:a794 with SMTP id
 38308e7fff4ca-3ae2b48e201mr12006811fa.1.1794590598539; Fri, 13 Nov 2026
 09:23:18 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110085125.2535508-1-johan@kernel.org> <20261110085125.2535508-2-johan@kernel.org>
In-Reply-To: <20261110085125.2535508-2-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 18:23:06 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j+GZ_v3=ji4Tcv9mahU3rBvX+WX0H5BwQ6kjhc6HpVpA@mail.gmail.com>
X-Gm-Features: AclHuK8jFghVnxRICo3FkWZ1EaLI4NGbOw-Xw0BnT0rGkVeLLEHZH-dtxA8z2So
Message-ID: <CAJZ5v0j+GZ_v3=ji4Tcv9mahU3rBvX+WX0H5BwQ6kjhc6HpVpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] driver core: platform: fix swnode use-after-free
 on device release
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, driver-core@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:52=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> When a device has a software node, device_remove_software_node() may
> drop the last reference and free it during platform_device_release().
> If the software node is the also the primary node then the device fwnode

s/is the also/is also/

> pointer is never cleared.
>
> Use a temporary variable to track whether the firmware node is a
> software node to avoid a use-after-free in is_software_node() and having
> fwnode_handle_put() call a function pointer via poisoned or reallocated
> memory when the primary node is a software node.
>
> This issue was flagged by Sashiko when reviewing a related fix.
>
> Fixes: 7d80509ff0da ("driver core: platform: unify release path")
> Closes: https://sashiko.dev/#/bug/linux-b860000b-f1d0-46a0-ab52-d47cec8ea=
b99
> Cc: stable@vger.kernel.org      # 7.3
> Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

I have not found any issues in it apart from the above, so

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/base/platform.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/base/platform.c b/drivers/base/platform.c
> index 979593e5cca1..be5d2f315fdb 100644
> --- a/drivers/base/platform.c
> +++ b/drivers/base/platform.c
> @@ -598,13 +598,14 @@ static void platform_device_release(struct device *=
dev)
>  {
>         struct platform_object *pa =3D container_of(dev, struct platform_=
object,
>                                                   pdev.dev);
> +       bool fwnode_is_software_node =3D is_software_node(dev_fwnode(dev)=
);
>
>         device_remove_software_node(dev);
>         /*
> -        * If the primary firmware node is a software node, its reference=
 count
> -        * was already decreased by the call to device_remove_software_no=
de().
> +        * If the firmware node is a software node, its reference count
> +        * was decremented by device_remove_software_node().
>          */
> -       if (!is_software_node(dev_fwnode(dev)))
> +       if (!fwnode_is_software_node)
>                 fwnode_handle_put(pa->pdev.dev.fwnode);
>         kfree(pa->pdev.dev.platform_data);
>         kfree(pa->pdev.mfd_cell);
> --
> 2.56.0
>
