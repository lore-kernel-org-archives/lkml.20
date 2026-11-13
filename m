Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794591146;
	b=NsVXxKHLMXWGr4t3B1OX76pvCsjQkYi6O3dfuFZ4ma9Q1cpW5nRjW9fCREuTcpY4YFnj
	 o9IuyXadPDSlSmnRgOubb51zdPV1qnvwBxn0tgIM/cYV6R+rrwXDxXCBOYflOx7DJPPpW
	 m8NThksq0JtfNJipAChw8PsmeEaQf7cYuYfXbVPa7ygcNHh3g6BazQIh1dhVFHKklL0md
	 noCVOfrQuacm3IlarKdiihZZh7lJJriKkKTp4O8xX3GT4qGNyHMV0+VFX8HGUF1HKqzSw
	 Y0grGFrRxnQyCvYSTRHucOjDhIY8VKjBWAC+2gITBQQvbP0tl/kfLo0j3QqndZjZFrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794591146;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=nSptiMb1CVuYUc/SgcCJgKBFQaoryOlduTQ9oVYzLTc=;
	b=3oPs55my4Cp+AFCXGihdIA88exGj1jU6PIzmTly3T5mWSjUAWslA5lMat7/WYBr4DiqP
	 x7KqjMWUX22pHNuimY5N2nRex/2q3cA7Qa7L35OpMNVtQbBXqiVK24fEuiR8EhIE0dUr1
	 vJ8sOy9e8Wz5ZaYwZakTCiEyH2rqWRj/ebC3si8eVXMF8lF0o0QsQTSCcy9ie2RsgXyvd
	 xSiwyPio62e70u5mDUkg+mOjZih1fvmc7Bt9yfR9wuVeRqu2pUIIwLT5GR5rQgrYW14+g
	 SXN8nsCcUky5kJvtQt6iGDnH3iCw81r5X8sC32zq+pU/12jw6r4KRCOa3rvCn8hQUUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBwS4+YW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F286084360
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fBwS4+YW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A797F1F000D3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794591146;
	bh=nSptiMb1CVuYUc/SgcCJgKBFQaoryOlduTQ9oVYzLTc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fBwS4+YWYjlGM2XruT7oZuYziu8O0IeHH2cqLgir27v+6/kwOyMUls9MDQhorSVyr
	 DvWqxw5rv00g8RoHKX/YBzAVPI2LxuhAuh090kBFMwxkOro1ooLHj3TOGXEVNw0Wbk
	 toCAFS4YjLogX7VNoBpQZ8ppXgLeBwc5DdE81McOJIHEyYgtpUKpzBo8tNtzjn1CHB
	 bvpfWwiIXkHn6UYXsx4mwLkpYaaSK0dj4NvLCCtB2amZJ97a6ncggTwMKancXO1qs4
	 V4NCLHIGUzw/HkiOxMVq8KCroE30mT1iwLxW8aKwFe54M3a1EpH+SSFxq9QPPjgcjm
	 rtvbNieDVCwjw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3acd523a802so17163611fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:32:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEo72UPKq7OuDwETurA8M8Nj2V+8kbEPtg6YvP6mMRcLOALnJQ6llpY/RqXH/8pZAJHmHBA7usk9P4cWpM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ga5CwjA3Evti6qF5OQtkSwg2M9IFBIRrCxJ+vSXvpNJchrZ1B
	bfbTvgnS/329PkDkd4rHfgDUmybrbR9J9oCKAHTJYqZnyb4QjHQLgaUsC5R6aoIrVPfFo26EjYl
	BCQ4jqql973qBuU4JKGE93Z01VBGFKHY=
X-Received: by 2002:a05:651c:b2c:b0:3ad:fb2d:a757 with SMTP id
 38308e7fff4ca-3ae2b5302cfmr9849351fa.24.1794591145071; Fri, 13 Nov 2026
 09:32:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110085125.2535508-1-johan@kernel.org> <20261110085125.2535508-7-johan@kernel.org>
In-Reply-To: <20261110085125.2535508-7-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Fri, 13 Nov 2026 18:32:12 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0gZQ1LL8ZizAK-kQdAUxyEL5uBLyzOOnMzi2DDVF4pRtQ@mail.gmail.com>
X-Gm-Features: AclHuK9F5GTbS6yo98TrXJgh2sPuvWLUYJkvQopVJlBgnULLF0J572bpzAoTEkk
Message-ID: <CAJZ5v0gZQ1LL8ZizAK-kQdAUxyEL5uBLyzOOnMzi2DDVF4pRtQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] driver core: platform: tests: fix swnode reuse
 test description
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, driver-core@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 9:52=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> The description of the software node reuse test is misleading as a
> software node being registered does not prevent it from being reused
> (e.g. as software nodes can be shared).
>
> Fix the description by clarifying that the test would fail if the
> secondary software node is not removed from the device so that the
> reused primary firmware node still points to the software node.

LGTM

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> Fixes: 397f0a3958c9 ("driver core: platform: tests: add test cases for co=
rrect swnode removal")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/base/test/platform-device-test.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test=
/platform-device-test.c
> index 9ce563f76aad..b0cc37d166ff 100644
> --- a/drivers/base/test/platform-device-test.c
> +++ b/drivers/base/test/platform-device-test.c
> @@ -273,9 +273,10 @@ static const struct software_node platform_device_te=
st_swnode =3D { };
>  /*
>   * Check that reusing a software node works correctly. If the call to
>   * platform_device_register_full() fails after adding the secondary firm=
ware
> - * node, the software node must be unregistered in the device's release(=
)
> + * node, the software node must be removed in the device's release()
>   * callback or the subsequent call to platform_device_register_full() wi=
ll fail
> - * with -EBUSY due to the software node already having been registered.
> + * with -EBUSY due to the primary firmware node still pointing at the
> + * secondary software node.
>   */
>  static void platform_device_swnode_add_twice(struct kunit *test)
>  {
> --
> 2.56.0
>
