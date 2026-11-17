Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794929158;
	b=NGopyOaLK0Itu1Fsyq4doPKtvbp62YvPEzQbuEzLFB0y5tiGm2VMzQDLfcjsay/VByc7
	 /BwtLhQnMZ/XfP4508MqFjygkq62+k4ez64OWU/lFegURq9boE4LQxQh5Mse+xm8kRuOU
	 wWN1xQ2hITydTAvZx2EKOnrfpalFSoE/tbOhuBAY9DGAuyeZvLRMTbwOjdxV87DJ7HzkK
	 R6Jq5IH+opcNdSuA476nMnD1+yAqzKBg+EromPxwQrFcJGfwgd6mMyPAQEYC/0CBsViiU
	 K9doEjBQtNnMieGgFGAc/6GEBhnnbQ85f3fcbDywSfvSxGWkkqstA2+fYyeTUrVk65Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794929158;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KBdVW29HVJ4wR0PbCoFLY5q8sXCExkR+hunNaQ0mJo8=;
	b=h7XnIBZW/hogJxubXT3s9UWSQ3oYAM39diu+fU+wJtgkAKj4UTGrZx7cC3xEfog2USBi
	 UMZyoGosVs1sW5zcup8HKCF3rECRF59/SIzG9feLyDiXJTTtUVjzI2D0zqc5zO1BpMpfm
	 iggiBwf3XpelTA7owRpgt1uvmhoLNqOq6MnJ7YjzfpBEukZSO6Jg+4xh6cwlh76tlpoQu
	 I13RJJE7CHkOqa6COvsajHjUno5Dr6Agg6IRPesd6h9JP8LpREC7aOU0tmiZt7+Q3K/bv
	 jz5NvuajxNRLkM44zmFggdXIWaBTN0OUE4dtcGiBH0dJuXKkla4UK/JPhMGIQ+BqNDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnIRjXwR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA642606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CnIRjXwR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70A51F000C6
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794929157;
	bh=KBdVW29HVJ4wR0PbCoFLY5q8sXCExkR+hunNaQ0mJo8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CnIRjXwRpNVUgqYvQWE4WOgRijmCokWzHFBLSjBGVSNTb8cHLqhJGaC8kBn8ZRi7A
	 6cXpGyWmj2XAp0X/TQi1kD2I1ZHD8R1y5slWiBHHHLk/iqBzmZedeXzjKPuTsYikWt
	 /9PaMJGaJhRf3y9xLHljY7HtWOOu1/T/xuvn6/Q+sWpu9ORWo4ncMpsl69W9HNloAV
	 XUe2L6gt4MR/hgoMamFRE8FEJ+SshFmoi3dnkuTE9wAXTjKDNe/WF5x8dc4RZAR8OW
	 0TvSt473tr+zU0I2BCYNcfkNbaMPkGq9KC7zrb4IM2uaXQ2erNsn8G0F2oZYU0TjOj
	 ZGPCzjAqwnpcg==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c14470729eso4014204e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 07:25:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFOmb8ei9MZ2Iw2r18+nQKrdRY63u3WdTXqnW93ygj2nsGwivol9AKJNK2SJTG3lJzRIo73zaU3sHRe3gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+uhZZRgEXF4srXfLnw46KYrs+Vza9GBPzIuiynHoWsk2alfUud
	vmD39nBmWV3Ae1dwUVDv+rqLnGiOkhF40WDZNJPn/KarFq6vlDJUrmNXwFF2fkRtsyEq1QhJl5/
	x4zHaJnxJKRnLm7RPAICHJzFW0RcBBP4=
X-Received: by 2002:a05:6512:3c9b:b0:5bf:d54c:1fb6 with SMTP id
 2adb3069b0e04-5c170b669a5mr5364150e87.44.1794929156283; Tue, 17 Nov 2026
 07:25:56 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117101336.980216-1-johan@kernel.org> <20261117101336.980216-8-johan@kernel.org>
In-Reply-To: <20261117101336.980216-8-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Tue, 17 Nov 2026 16:25:44 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0j2DAPFBPA206VmWEiyUub7yuXFQeAvUtg95J=DwmKTDw@mail.gmail.com>
X-Gm-Features: AclHuK-hF4u064HXJHyD_Ul8WiKkjgi6nackBFOWJTHQRR2q8VH5bYUJg9XjRV0
Message-ID: <CAJZ5v0j2DAPFBPA206VmWEiyUub7yuXFQeAvUtg95J=DwmKTDw@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] software node: fix software_node_notify() primary
 node comment
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	driver-core@lists.linux.dev, linux-acpi@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:13=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> The firmware node pointer in struct device may point to either a primary
> or a secondary firmware node and driver core sets the dev pointer of
> that node when registering devices.
>
> Fix the comments in software_node_notify() and
> software_node_notify_remove() which incorrectly suggest that driver
> core only sets the dev pointer of primary firmware nodes.
>
> Fixes: 37e586675993 ("software node: add fw_devlink support")
> Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

LGTM

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  drivers/base/swnode.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
> index 95283d8bda26..78e224539b02 100644
> --- a/drivers/base/swnode.c
> +++ b/drivers/base/swnode.c
> @@ -1162,8 +1162,8 @@ void software_node_notify(struct device *dev)
>                 return;
>
>         /*
> -        * When the software node is the device's secondary firmware node=
,
> -        * the core only records the owning device on the primary fwnode
> +        * When a device has both a primary and a secondary firmware node=
 the
> +        * core only records the owning device in the primary node
>          * (see device_add()). fw_devlink resolves a supplier device thro=
ugh
>          * fwnode->dev, so without this a consumer referencing the softwa=
re
>          * node could never find the supplier device and would defer fore=
ver.
> @@ -1198,9 +1198,8 @@ void software_node_notify_remove(struct device *dev=
)
>         sysfs_remove_link(&dev->kobj, "software_node");
>
>         /*
> -        * Drop the device pointer mirrored onto a secondary software nod=
e in
> -        * software_node_notify(). For a primary software node the core o=
wns
> -        * fwnode->dev and clears it in device_del().
> +        * Clear any device pointer set in a secondary software node in
> +        * software_node_notify().
>          */
>         if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.=
dev =3D=3D dev)
>                 swnode->fwnode.dev =3D NULL;
> --
> 2.56.1
>
>
