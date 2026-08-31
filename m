Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EB43BBFC7;
	Mon, 31 Aug 2026 06:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788158413; cv=none; b=KeCK7q3De/lpgb3k6zNBEOIJK44oU6jOAP919kx+MtkXX1IAXOeIxsasdnPPSqjC/wgB5Nvj1AtsmPp7hBO+eFpRVeh4Voz+yWTqV9228XUQrM5hAllgXCzfseyKeVxFcGinOOHjVeG0lHgStdjl7F6L7vjSZb6Uqo7S6ejXaJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788158413; c=relaxed/simple;
	bh=xEYskKPPHRAzKQ2JxjPwFUvRJdNmKZNeq4QYv1cFtTw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=QDv1HfMIWM5mJ2d2TjFCOEvUVPBAzB/ecwALGzX2NY6sOO0uCv1PHHY5/lmBPqgrDLT2n3/WIogGz9cjHBQdeT60bYnWCVehjtB0zsDdUqTxE6ZltyR5MKwYKgEJhdWfmcLI6PmQSbJGPN9wSza60aAuCSuvSMl5T7A1r1V2KI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=E4lX4t8J; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="E4lX4t8J"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a9ae:3688:6dfb:71b0])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 53FF24BB;
	Mon, 31 Aug 2026 08:38:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788158319;
	bh=xEYskKPPHRAzKQ2JxjPwFUvRJdNmKZNeq4QYv1cFtTw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=E4lX4t8Jzc2hBnhHPSsWMUqlJmSYf7oLs885v2uc+s94o9WrFmgqRZDNPoFqvTkOm
	 CqHTlkztwv/0O6DKy1VMD7bz1RxzRWZxca1zDiAeOCd09YdMQyZ4SAkki0VhkpnXRf
	 DLzP3gJ0jHk+rIUu7VkWyL6iXmAHNLiqTBS0uqxU=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-b4-vchiq-isp-v3-5-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-5-fb8235e15c68@ideasonboard.com>
Subject: Re: [PATCH v3 5/9] platform/raspberrypi: vchiq: Add helpers for vchiq driver data
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>, Umang Jain <uajain@igalia.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Mon, 31 Aug 2026 15:40:02 +0900
Message-ID: <178815840263.1005982.5693616363350713202@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-07-17 20:04:20)
> Add helpers to set and get vchiq driver data. vchiq_set_drvdata() and
> vchiq_get_drvdata() wraps dev_set_drvdata() and dev_get_drvdata()
> respectively.
>=20
> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  include/linux/raspberrypi/vchiq_bus.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/include/linux/raspberrypi/vchiq_bus.h b/include/linux/raspbe=
rrypi/vchiq_bus.h
> index 9de179b39f85..6eff6b0bf599 100644
> --- a/include/linux/raspberrypi/vchiq_bus.h
> +++ b/include/linux/raspberrypi/vchiq_bus.h
> @@ -37,6 +37,16 @@ static inline struct vchiq_driver *to_vchiq_driver(str=
uct device_driver *d)
>         return container_of(d, struct vchiq_driver, driver);
>  }
> =20
> +static inline void *vchiq_get_drvdata(const struct vchiq_device *device)
> +{
> +       return dev_get_drvdata(&device->dev);
> +}
> +
> +static inline void vchiq_set_drvdata(struct vchiq_device *device, void *=
data)
> +{
> +       dev_set_drvdata(&device->dev, data);
> +}
> +
>  extern const struct bus_type vchiq_bus_type;
> =20
>  struct vchiq_device *
>=20
> --=20
> 2.54.0
>=20
>
