Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26093A9611;
	Mon, 31 Aug 2026 05:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155152; cv=none; b=gyPLfQ9FEIVclkjL99JbEgzpoicoCK+Lzf52UKZxuBUresPZrT8Ick59lKW40vE8y9VZQQ7I3kqG9FyqdgmQBq1wwtzj6AqGrY/n41Z9+gM62r5hh+UbXnUwhXU5r4JtzxIsCXLnkdJPk4kCnXlF1Nup0wFb6xKWcR5xoxeIjNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155152; c=relaxed/simple;
	bh=ZBy5f3YIs+HPHeNGQbgNnVreK4PHfNj6LSMcH3+gr4w=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=DlGfWimOsy2OryE9Wxz0nbkreAGF03ORir1Y7H8haSEgDc+McZGGvTpTINIrTAVHk2deTX3xvoj4wU4jBqV9Vc2qzxpUu3JssPGq+vop6g/HIwkDxt8296gO2hFA9MNM3F0psVPNgT6Z6VBRFVWzYYwBvXTkSIUSFqzDBiTPXYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=i1agS4Ur; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="i1agS4Ur"
Received: from neptunite.rasen.tech (unknown [IPv6:2400:2411:160:2f00:a9ae:3688:6dfb:71b0])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C15BB4BB;
	Mon, 31 Aug 2026 07:44:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788155057;
	bh=ZBy5f3YIs+HPHeNGQbgNnVreK4PHfNj6LSMcH3+gr4w=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i1agS4Ur9MZs/4XCx02eKMZs0OAJE6nCbd1ZG/M39j/SQ7dTGiOKItGaddUAH7ogT
	 Gm1GYBZHShM77lIYROufvvarrInhDqTFXaWsZnVpSNV+SiWdpdjpkwQrVx4uBYgM92
	 2BDvOhOoooIDzADsjREBkm7XHDK4eBTk7p47IyKg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-b4-vchiq-isp-v3-2-fb8235e15c68@ideasonboard.com>
References: <20260717-b4-vchiq-isp-v3-0-fb8235e15c68@ideasonboard.com> <20260717-b4-vchiq-isp-v3-2-fb8235e15c68@ideasonboard.com>
Subject: Re: [PATCH v3 2/9] platform/raspberrypi: vchiq-mmal: Move headers to include/linux
From: Paul Elder <paul.elder@ideasonboard.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Naushir Patuck <naush@raspberrypi.com>, Stefan Wahren <wahrenst@gmx.net>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Daniel Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, Jai Luthra <jai.luthra@ideasonboard.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Tomasz Figa <tfiga@chromium.org>
Date: Mon, 31 Aug 2026 14:45:40 +0900
Message-ID: <178815514049.1005982.6076319807701926619@neptunite.rasen.tech>
User-Agent: alot/0.0.0

Quoting Jai Luthra (2026-07-17 20:04:17)
> Now that VCHIQ interface is destaged, different drivers (like ISP or
> codec) no longer live under the same tree as VCHIQ-MMAL, but in their
> relevant trees like media or audio.
>=20
> Enable access to the MMAL headers for such drivers by moving them under
> include/linux/raspberrypi with other VCHIQ headers.
>=20
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>

Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

> ---
> Changes in v3:
> - Split missing includes patch
> - Update commit message
> ---
>  MAINTAINERS                                                      | 1 +
>  drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c             | 9 +++=
+-----
>  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-common.h       | 0
>  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-encodings.h    | 0
>  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-common.h   | 0
>  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-format.h   | 0
>  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg-port.h     | 0
>  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-msg.h          | 0
>  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-parameters.h   | 0
>  .../vchiq-mmal =3D> include/linux/raspberrypi}/mmal-vchiq.h        | 0
>  10 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f81226569eb2..d570a293b1d1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5114,6 +5114,7 @@ F:        Documentation/devicetree/bindings/pci/brc=
m,stb-pcie.yaml
>  F:     drivers/pci/controller/pcie-brcmstb.c
>  F:     drivers/platform/raspberrypi/vchiq-*
>  F:     drivers/staging/vc04_services
> +F:     include/linux/raspberrypi/mmal*
>  F:     include/linux/raspberrypi/vchiq*
>  N:     bcm2711
>  N:     bcm2712
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c b/drive=
rs/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> index ccd8910c315f..80406e1f4bdc 100644
> --- a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.c
> @@ -22,17 +22,16 @@
>  #include <linux/mm.h>
>  #include <linux/slab.h>
>  #include <linux/completion.h>
> +#include <linux/raspberrypi/mmal-common.h>
> +#include <linux/raspberrypi/mmal-parameters.h>
> +#include <linux/raspberrypi/mmal-vchiq.h>
> +#include <linux/raspberrypi/mmal-msg.h>
>  #include <linux/raspberrypi/vchiq.h>
>  #include <linux/raspberrypi/vchiq_arm.h>
>  #include <linux/raspberrypi/vc_sm_knl.h>
>  #include <linux/vmalloc.h>
>  #include <media/videobuf2-vmalloc.h>
> =20
> -#include "mmal-common.h"
> -#include "mmal-parameters.h"
> -#include "mmal-vchiq.h"
> -#include "mmal-msg.h"
> -
>  /*
>   * maximum number of components supported.
>   * This matches the maximum permitted by default on the VPU
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h b/incl=
ude/linux/raspberrypi/mmal-common.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-common.h
> rename to include/linux/raspberrypi/mmal-common.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h b/i=
nclude/linux/raspberrypi/mmal-encodings.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-encodings.h
> rename to include/linux/raspberrypi/mmal-encodings.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h b/=
include/linux/raspberrypi/mmal-msg-common.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-common.h
> rename to include/linux/raspberrypi/mmal-msg-common.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h b/=
include/linux/raspberrypi/mmal-msg-format.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-format.h
> rename to include/linux/raspberrypi/mmal-msg-format.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h b/in=
clude/linux/raspberrypi/mmal-msg-port.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg-port.h
> rename to include/linux/raspberrypi/mmal-msg-port.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h b/include=
/linux/raspberrypi/mmal-msg.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-msg.h
> rename to include/linux/raspberrypi/mmal-msg.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h b/=
include/linux/raspberrypi/mmal-parameters.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-parameters.h
> rename to include/linux/raspberrypi/mmal-parameters.h
> diff --git a/drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h b/inclu=
de/linux/raspberrypi/mmal-vchiq.h
> similarity index 100%
> rename from drivers/platform/raspberrypi/vchiq-mmal/mmal-vchiq.h
> rename to include/linux/raspberrypi/mmal-vchiq.h
>=20
> --=20
> 2.54.0
>=20
>
