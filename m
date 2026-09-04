Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C7C42FCBF;
	Fri,  4 Sep 2026 09:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788513521; cv=none; b=F+ZmDseEWaiNzyx2mKptoBLTwYXqDKxr/5QnGVJkdf7gyODDLJZ/UoHX4cl+ETN0XhK7oRJ3HQlYghqzpLLE5iVh/LQE9s0kCvgRTYNz4qPOLRGpX/1I60pEDHR6yNFSxO0mu+HzNR+MB4jpkBypxST4VWosdxVQoc/K7PUUnX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788513521; c=relaxed/simple;
	bh=FsmESms8kMlBgNhzNNBfJsWIaYlP55jaMJUyORLu3bk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=U222NRZxxImwjhxZVwvIDyu62qam0TN7y917tvKsFwxEEl1FkwacmfiROf3A4QKvkWo9WSYPw95BZ9RzVt720nCy8/77TZJajTheAAs36gC+s82Pzle8Fx4McFhEGYHN1fxTI/cz/Uzp4NG0KWaLIBkws2/lMsWOi7BvqolzH3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=C1bmSw87; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="C1bmSw87"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:689f:2649:270a:a60b])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AE21E236E;
	Fri,  4 Sep 2026 11:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788513426;
	bh=FsmESms8kMlBgNhzNNBfJsWIaYlP55jaMJUyORLu3bk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=C1bmSw87OmS1iSH/HYt1xLv0sUhuh8VhYF27f7Qroip0HrymknhnvQewF2yas1lGu
	 RrVhkk/Hf1rbkksZaH+YGrzwS0WbaC2ryYn2p/BYXjYzIhwwKkqXSnMmeYTFUxONz4
	 O8YeC+o9Cwb+0UqHFtPF0Vet8FdJ20zstnye9wso=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-b4-vchiq-isp-v3-9-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-9-fb8235e15c68@ideasonboard.com>
Subject: Re: [PATCH v3 9/9] platform/raspberrypi: vchiq: Load bcm2835_isp driver from vchiq
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Fri, 04 Sep 2026 18:18:32 +0900
Message-ID: <178851351285.52643.5318822749962167471@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-07-17 20:04:24)
> From: Naushir Patuck <naush@raspberrypi.com>
>=20
> Broadcom BCM2835 ISP driver is managed through the VCHIQ interface, so
> register it to the VCHIQ driver, similar to the audio and shared memory
> drivers.
>=20
> Signed-off-by: Naushir Patuck <naush@raspberrypi.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c | 2 ++
>  include/linux/raspberrypi/vchiq_arm.h                    | 1 +
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/d=
rivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> index ec951ab19d67..f35b40bdd963 100644
> --- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> +++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
> @@ -1415,6 +1415,7 @@ static int vchiq_probe(struct platform_device *pdev)
> =20
>         mgmt->audio_dev =3D vchiq_device_register(&pdev->dev, "bcm2835-au=
dio");
>         mgmt->vcsm_cma_dev =3D vchiq_device_register(&pdev->dev, "vcsm-cm=
a");
> +       mgmt->isp_dev =3D vchiq_device_register(&pdev->dev, "bcm2835-isp"=
);
> =20
>         return 0;
>  }
> @@ -1423,6 +1424,7 @@ static void vchiq_remove(struct platform_device *pd=
ev)
>  {
>         struct vchiq_drv_mgmt *mgmt =3D dev_get_drvdata(&pdev->dev);
> =20
> +       vchiq_device_unregister(mgmt->isp_dev);
>         vchiq_device_unregister(mgmt->vcsm_cma_dev);
>         vchiq_device_unregister(mgmt->audio_dev);
>         vchiq_debugfs_deinit();
> diff --git a/include/linux/raspberrypi/vchiq_arm.h b/include/linux/raspbe=
rrypi/vchiq_arm.h
> index d59837eaaa8c..ea1bd419e471 100644
> --- a/include/linux/raspberrypi/vchiq_arm.h
> +++ b/include/linux/raspberrypi/vchiq_arm.h
> @@ -63,6 +63,7 @@ struct vchiq_drv_mgmt {
>          */
>         struct vchiq_device *audio_dev;
>         struct vchiq_device *vcsm_cma_dev;
> +       struct vchiq_device *isp_dev;
>  };
> =20
>  struct user_service {
>=20
> --=20
> 2.54.0
>=20
>
