Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C3A349CF0;
	Mon, 31 Aug 2026 05:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154648; cv=none; b=SxyXFbCRGlKqCNLWxEKjnjN2INla5Ao/aQ6nx60RRjR8OGjm1a0Wt4Q3yj6KRg7Hl0YWYG1/cJNeugBJBoHRL2p6rNtBVrXFHkj/N+C76Uvg8YTpM5st8SSOZUX/Urz715YOmAg3AsuOhr+Y5/3hbop40n1kSNwgHSBQx+Po6n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154648; c=relaxed/simple;
	bh=9bGltRCzgW+BuF/oL+KMF2/hKOoNqHv7GE9mOnSjwNk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=KL5ofom52+hO+JU2UKSyC++yWvAZubAz4AwBmqcpEJozNHVC8wZLCQnD/AVesAlJHFy8wC4rL7jYUiO8u8FxtRb/WJ8Zvthg/wCPFGK+QzpZBqhIMQgbu8n5DqdAVZTAcRp8mcEXTf6L++3WuBOzALXVgjAaundRVOX8EmDfTRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=VjBqv4+r; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VjBqv4+r"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a9ae:3688:6dfb:71b0])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 05C964BB;
	Mon, 31 Aug 2026 07:35:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788154543;
	bh=9bGltRCzgW+BuF/oL+KMF2/hKOoNqHv7GE9mOnSjwNk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=VjBqv4+rEtAPKpnfOBHTnNk5Tji3YinMgKQcfrcjKhFaPXugt2XUl/H5gSNj4yHSk
	 4zdz/z5RGrk0o9HmVRuJrKGWSU1fWW+CU1ohtQ1fddKFNSeP7tXqqCCt1RnWPyuiZv
	 QAsqJY8qH4af08mcW2j81RgBja8FbdLfHTE+LtLk=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-b4-vchiq-isp-v3-1-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-1-fb8235e15c68@ideasonboard.com>
Subject: Re: [PATCH v3 1/9] platform/raspberrypi: vchiq-mmal: Include missing headers
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Mon, 31 Aug 2026 14:37:07 +0900
Message-ID: <178815462733.1005982.18403340332888309359@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-07-17 20:04:16)
> The structures defined in mmal-common.h use types related to lists and
> videobuf2 framework, but are missing the explicit includes for them.
> Include those.
>=20
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
>  drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/driv=
ers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> index 6c5092a68b99..c9976bdd7490 100644
> --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> +++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> @@ -16,6 +16,10 @@
>  #ifndef MMAL_COMMON_H
>  #define MMAL_COMMON_H
> =20
> +#include <linux/list.h>
> +#include <linux/types.h>
> +#include <media/videobuf2-v4l2.h>
> +
>  #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
>  #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
> =20
>=20
> --=20
> 2.54.0
>=20
>
