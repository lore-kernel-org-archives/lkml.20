Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16C83A7852
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789025573; cv=none; b=frMlXfFYwee9LiARMvwcY8DqNhGTodJpBjVlSFEudFR/dkxbwu3p1xkWQMjGkMU8lNsMkeJTNm90MBk7roacuG5uc7tisy0hQu57iI/FsKkYwjQlk4Fh/GHgHZtkenzWlAybCz5TzpnEtpt7F4x563TNCHIt3reyNYzZNR3CoCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789025573; c=relaxed/simple;
	bh=tqGDeeCw0ZZ0kOz2Y27wv+jzBY8TUXJeH9q+uOekUdw=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F628IoV1M0Jnp+x+GWoTruBjpmwW7k8I30wcSHgOfjsBG9Qx5EQ4FhGH6JbGOiIF6LII+whRIcUbbeWaEILqoscOI20jPZFCO8X7tstAtTtdeOs/ck4/S5TsVNsDlXG32aWSXa00T/0yVGj35V+AjaWkOadEGP37XfhDd8ggU0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XjFh76Mm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XjFh76Mm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617081F008A4
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789025572;
	bh=LGLu7zrAyz0OUeB1ZyR3Xf9SNjyg8yVsXY4ZJ78eRTw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=XjFh76MmF+pl+g1urQmrJle8LzlKKcvg/rd4qf/TX7u1TVVtavOwVpayMbBQcmvJJ
	 sGp9FR2GA/TxPwzRsTZ3QDO3XtBEjmLdGNeQzDDnJ3FFZkel4Ls0VKMPll4ClxX88g
	 AnijTvBK4HMm8pF2HLI8n4cSKhRvkt9WQ6x2bVorNk38hMLPAH9Xwqxpx+MauXKM4N
	 kf48lXlo+80D9R2n8oFvU2qS075qu4xliAy/45ES9ieVjc7UZwIjSl6U1/zGm3J1Ed
	 LNDOJY5uNtuIB13xaVb65mstkQcgATcGi4Cit+/hSh7/HPTMD39pN/2kNM0Ac7NuGz
	 8sSzPF4tRG4qg==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a302c23fb2so8733811fa.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 00:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzqtfMynLck60wFJKJG0R9uZeHL5iTjose3SrPlT2s/4xLmLci/ofjJbE0J3m39K0+GyOE6P7B/zbRi5KA=@vger.kernel.org
X-Gm-Message-State: AFuF++moBlqGvIfyJhlIspBjTIx1uIG7DRvVe58qlSl07GX7d6/bTa/1
	bXBYvPqM7Q7ArDdz3qFCj1+aR0Xkc/ZvB/lHgGcGC6FhhP2AK9Vw+g0nG4vLzE+7PMpFi63SDzf
	1ARss3dXtptOlq+PDxnjiYerFk6PbuYJnqKufjET7qA==
X-Received: by 2002:a05:651c:a206:20b0:3a1:aab7:9bdf with SMTP id
 38308e7fff4ca-3a58d33cfcemr4662881fa.5.1789025570943; Thu, 10 Sep 2026
 00:32:50 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:32:48 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 10 Sep 2026 00:32:48 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260908134223.13638-4-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908134223.13638-1-tzungbi@kernel.org> <20260908134223.13638-4-tzungbi@kernel.org>
Date: Thu, 10 Sep 2026 00:32:48 -0700
X-Gmail-Original-Message-ID: <CAMRc=McssNYy09bnzUpf9LEB94UOWimyVZNOrKRPn1EUVF8iTg@mail.gmail.com>
X-Gm-Features: AcwNN1Um9M2zEZd0yculW6bylHE5dCGPQd89AongUiHY1k1rNNzEAmN8GFshh4w
Message-ID: <CAMRc=McssNYy09bnzUpf9LEB94UOWimyVZNOrKRPn1EUVF8iTg@mail.gmail.com>
Subject: Re: [PATCH v12 3/3] gpio: Leverage revocable for accessing struct gpio_chip
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sep 2026 15:42:23 +0200, Tzung-Bi Shih <tzungbi@kernel.org> said:
> The underlying chip can be removed asynchronously.  `gdev->srcu` is used
> to ensure the synchronization before accessing `gdev->chip`.
>
> Revocable encapsulates the details.  Leverage revocable for accessing
> the struct gpio_chip and remove the `gdev->srcu`.
>
> Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> ---

Could you address the following issue pointed out by sashiko?

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 66d2325bfae87..a7d3c4d9018c8 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -898,10 +897,10 @@ static void gpiodev_release(struct device *dev)
>  	synchronize_srcu(&gdev->desc_srcu);
>  	cleanup_srcu_struct(&gdev->desc_srcu);
>
> +	revocable_put(&gdev->chip_rev);
>  	ida_free(&gpio_ida, gdev->id);
>  	kfree_const(gdev->label);
>  	kfree(gdev->descs);
> -	cleanup_srcu_struct(&gdev->srcu);
>  	kfree(gdev);
>  }

Could this cause a use-after-free crash during concurrent device removal?

The revocable object chip_rev is embedded directly in the gpio_device struct.
The new access cleanup pattern drops the SRCU lock before dropping the kref
on the revocable object.

During asynchronous device removal, revocable_revoke() executes
synchronize_srcu() to wait for readers. Because the reader drops the SRCU lock
first, revocable_revoke() will unblock, proceed to gpio_device_put(gdev), and
gpiodev_release() will execute kfree(gdev) while the reader thread is still
active.

The reader thread will then attempt to call kref_put() on the chip_rev that is
embedded inside the now-freed gdev.

--

Thanks,
Bartosz
