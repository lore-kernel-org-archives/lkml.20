Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF3143F8D9
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789128103; cv=none; b=U0OlBcsvWM5J2CD1I+b0ONjZV/5DyehGUTNhjkaOC6meYa2h4OQsm/4RydittmtItVi6gJN98h8v/nEx5zqEBd14IEcF408uYGdJdaGAjhemqBiUvQx3OIbjV7yD+pT4VKe272Z/Pf/txp18KOvhZSEkx9loqdXVR5F09+lhRTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789128103; c=relaxed/simple;
	bh=s3UruXpS/KTBGJovzguGpZdeym3vIr7RNIIDPtdn32E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MykFDQ3ggJQxS8xDyB91QZ6hFML/nmphrR20ntn7eIunFcEYxb/cf3VLr1Nvd000DdkjQvsmHVmBPr51XlnkZiELEJNga5jdN2ypqcKLMVp8ONEwmk3MRwuGKYOQCEAkPt4ATCgmb7wSxQjUFvRYMurKsJdolaGOQvSkN/orXuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pdHq5BaW; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pdHq5BaW"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-482e067e908so567308f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 05:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789128100; x=1789732900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3FYS3uxJgkEj1kDQ2zGiFPej21csKYbphEoF4mzTvJw=;
        b=pdHq5BaWF9Kf6IDKerQ/ev7zyViOpzgyCgznLXnDs6Pcc6giHMVNe4P5a7S+O+LNo/
         aUlu1NXxRIemDhjeWZdSGOEOEM0YOgwLVSuZZqrtqvNd1RoplACW2tuakCbmKGE5tVTj
         EUkaLa3v1I0HNpMxaRVWIIZw1ouAuRRC2Namm+i9X3X6axXqNOgzgu478dfx9OXPT8eV
         GOF016KC9es4sJiA3BAFRBoaA5d2ZIOM10BsGQ8eJze+3FbiyoiMn4SATwjWYryrETOE
         Y7nz1vhH3n0abdvAFG/IQi95t+zk0Z1anvm9xh+RGqdW8cWOOqPjYVFdkHVVaKGAhmiC
         ZlkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789128100; x=1789732900;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3FYS3uxJgkEj1kDQ2zGiFPej21csKYbphEoF4mzTvJw=;
        b=oajczQDuIqp9aqtE3KpxFVX7PSmmjoyuLV/+hke4VKh5dzwE83w4OkQ9mnq5CcawaW
         91fcHi7moWksbCcZIAQsQX6pH5d/ZpTTr8FCUXCFwAcRH98gOkgF17McmgDBgsSAO36c
         d0cryIC7vaORSKh1xwNC+Ltw3LnHKfMdN2DS1xIW85u+RzYPh/uCHlM4WmdJLz10iyJm
         rPRyg95bcUrHwUiGWU693fKfGV2vAeG4zyleSp206K5nLzQJvRLhdD8mDOfvG9HY8yM5
         aFnEOzkJ1/6ppvVf36vsn8IPw5zUsFgOOExPOGCl/+M7vQxijzW68Zf2ptrDgmmgSm0c
         mHrA==
X-Forwarded-Encrypted: i=1; AKwUvBzYjm9L62/VYoQOeJbnYM9EEN54JpspgrmLV7yiaCmRh0k1yNEj85ZW3IaELfteOXoL1x+x9hg6KR/7jm4=@vger.kernel.org
X-Gm-Message-State: AFuF++n2QPoEM0rpsM1/qs5Yl6fTqnAxZL79hNzjZim/noPITOfs0wK+
	l+kj50vB5EWZnkjSa7yKGDMl2D5YM9V80CF7oq7J8zRBAPToJOdVeF7a
X-Gm-Gg: AYBFou15LUsyskoPmZ+eWEHb2DTuftbuFKoICqsT0qKWJ8VK/bIKsoaOkvDkaE6Kukh
	SURBDi2J1W1id7hRh+61Txyq39hc+wb2mhXMTAnFvLw6W//rHPxANujwrnyu0/lA6I/fQY4E1U6
	6wZjCCz8J91YU34kPyU/8f1EgiiT+Zm+eed7q8p8HalNdUG9wvH55tVDBJgtIH+6CBakX+ff04P
	XbO0+yaN/RMGCTQY80DwD1N4ydkSl8SaY2OKfQLB/RBD11Hlgrph5saO1bZixusq+mZUihaQogE
	cdnLWjj05QG5Nj8yO+m2CmGytUfCIOTKN0NpDSXHVBVrcQCuZytn7q0j5MnLPrsa9wQ/3B6rGFs
	Os59n1VnW1L5I/Pro2WP1IHUqnSIZyQ07ulYqxIhwEIuryuTaZ7JaMbB9yjQtZza7AzSJuwG/sI
	trO1nu6E2vZk49FoYwyLPW9XXwkowtYLf+NQoxyr3CahWCIdZOFBRHXKD3I/3xljjg20W1u0nad
	JXISrD7
X-Received: by 2002:a05:6000:290f:b0:486:f36e:28c4 with SMTP id ffacd0b85a97d-486f36e2a84mr982673f8f.5.1789128099794;
        Fri, 11 Sep 2026 05:01:39 -0700 (PDT)
Received: from foxbook (bfg95.neoplus.adsl.tpnet.pl. [83.28.44.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm5729836f8f.13.2026.09.11.05.01.38
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 11 Sep 2026 05:01:39 -0700 (PDT)
Date: Fri, 11 Sep 2026 14:01:28 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>
Cc: Mathias Nyman <mathias.nyman@intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "quic_wcheng@quicinc.com"
 <quic_wcheng@quicinc.com>, "broonie@kernel.org" <broonie@kernel.org>,
 Selvarasu Ganesan <selvarasu.g@samsung.com>, "linux-usb@vger.kernel.org"
 <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: xhci: clear dangling sideband pointer in
 xhci_free_virt_device()
Message-ID: <20260911140128.2f05ad5d.michal.pecio@gmail.com>
In-Reply-To: <TYUPR06MB621762AD5F5F586DD177A77AD2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
References: <TYUPR06MB621762AD5F5F586DD177A77AD2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Sep 2026 10:22:37 +0000, =E8=83=A1=E8=BF=9E=E5=8B=A4 wrote:
> xhci_free_virt_device() must not leave any dangling pointers.
> If vdev->sideband is still set at this point then something is
> wrong, e.g. the sideband client did not unregister before the
> virtual device was freed. This can happen when
> xhci_setup_device() gets COMP_USB_TRANSACTION_ERROR (device not
> responding to setup address during bus reset recovery), causing
> xhci_disable_and_free_slot() -> xhci_free_virt_device() to free
> vdev before the sideband client has a chance to unregister.

When and how is the sideband client driver supposed to learn that
its device has been reset?

There is some code in xhci_discover_or_reset_device() which sends
notification that endpoints have been removed. Does it run before
or after vdev can potentially be freed?

BEFORE: it seems we had an opportunity to get rid of the sideband
completely before running into trouble here.

AFTER: freeing vdev will break those notifications, is it a bug?

The suggestion by Mathias that sideband should be fully destroyed
by the client *before* USB core begins reset doesn't look bad.

>=20
>   hub_event()
>     xhci_setup_device()                  <-- COMP_USB_TRANSACTION_ERROR
>     xhci_disable_and_free_slot()
>       xhci_free_virt_device()
>         kfree(out_ctx), kfree(vdev)
>         xhci->devs[slot_id] =3D NULL
>     ...
>     usb_disconnect()
>       uaudio_disconnect()
>         xhci_sideband_unregister()
>           xhci_stop_endpoint_sync()
>             xhci_get_ep_ctx()            <-- CRASH (deref freed out_ctx)
>=20
> Unable to handle kernel paging request at virtual address dead000000000122
> Call trace:
>  xhci_get_ep_ctx+0x0/0x38
>  xhci_sideband_unregister+0x68/0xf0
>  uaudio_disconnect+0x70/0x144
>  usb_audio_disconnect+0x7c/0x268
>  usb_unbind_interface+0x13c/0x340
>  device_release_driver_internal+0x1c4/0x2bc
>  device_release_driver+0x18/0x28
>  bus_remove_device+0x158/0x170
>  device_del+0x1c8/0x320
>  usb_disable_device+0x84/0x190
>  usb_disconnect+0xe8/0x338
>  hub_event+0xbd8/0x19ac
>  process_scheduled_works+0x200/0x9d8
>  worker_thread+0x154/0x3b0
>  kthread+0x11c/0x1a0
>=20
> Fix this by clearing any remaining sideband pointer in
> xhci_free_virt_device() before freeing vdev. If vdev->sideband is
> still set, set vdev->sideband->vdev =3D NULL to break the dangling
> pointer at the source.
>=20
> Additionally, in xhci_sideband_unregister(), check sb->vdev before
> issuing stop endpoint commands. If vdev is already NULL (cleared by
> xhci_free_virt_device), skip endpoint cleanup as the xHC has already
> disabled the slot, but still remove the interrupter and free the
> sideband instance to avoid leaks.
>=20
> Fixes: de66754e9f80 ("xhci: sideband: add initial api to register a secon=
dary interrupter entity")
> Cc: stable@vger.kernel.org
> Signed-off-by: Lianqin Hu <hulianqin@vivo.com>
> ---
>=20
> Changes in v2:
>  - Move fix to xhci_free_virt_device() per maintainer suggestion.
>  - Use xhci_dbg per maintainer suggestion.
>  - Ensure interrupter cleanup is unconditional when vdev is NULL.
>  - Clear dangling sb->eps[] when vdev is NULL (per Selva).
>  - Update patch commit message.
>  - Link to v1: https://lore.kernel.org/all/TYUPR06MB6217000B59003EDF233D7=
246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com/
>=20
>  drivers/usb/host/xhci-mem.c      |  9 +++++++++
>  drivers/usb/host/xhci-sideband.c | 28 +++++++++++++++++++++-------
>  2 files changed, 30 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index af8d4b74c4ba..448d28aaff3e 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -15,6 +15,7 @@
>  #include <linux/dmapool.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/bitfield.h>
> +#include <linux/usb/xhci-sideband.h>
> =20
>  #include "xhci.h"
>  #include "xhci-trace.h"
> @@ -922,6 +923,14 @@ void xhci_free_virt_device(struct xhci_hcd *xhci, st=
ruct xhci_virt_device *dev,
>  		dev->rhub_port->slot_id =3D 0;
>  	if (xhci->devs[slot_id] =3D=3D dev)
>  		xhci->devs[slot_id] =3D NULL;
> +
> +	if (dev->sideband) {

Could be:

  if (IS_ENABLED(CONFIG_USB_XHCI_SIDEBAND) && dev->sideband)

> +		xhci_dbg(xhci, "vdev for slot %d has sideband still set at free, clear=
ing dangling pointer\n",
> +			 slot_id);
> +		dev->sideband->vdev =3D NULL;
> +		dev->sideband =3D NULL;
> +	}
> +
>  	kfree(dev);
>  }
> =20
> diff --git a/drivers/usb/host/xhci-sideband.c b/drivers/usb/host/xhci-sid=
eband.c
> index a5deeee4d5dc..f979ce517163 100644
> --- a/drivers/usb/host/xhci-sideband.c
> +++ b/drivers/usb/host/xhci-sideband.c
> @@ -472,12 +472,25 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
> =20
>  	scoped_guard(mutex, &sb->mutex) {
>  		vdev =3D sb->vdev;
> -		if (!vdev)
> -			return;
> -
> -		for (i =3D 0; i < EP_CTX_PER_DEV; i++)
> -			if (sb->eps[i])
> -				__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> +		/*
> +		 * If vdev is NULL, xhci_free_virt_device() has already
> +		 * cleared sb->vdev and freed vdev (e.g. on
> +		 * COMP_USB_TRANSACTION_ERROR during address device
> +		 * recovery). Skip endpoint cleanup as the xHC has already
> +		 * disabled the slot.
> +		 *
> +		 * The interrupter and sideband instance are host-level
> +		 * resources independent of vdev, so still remove and free
> +		 * them to avoid leaks.
> +		 */
> +		if (vdev) {
> +			for (i =3D 0; i < EP_CTX_PER_DEV; i++)
> +				if (sb->eps[i])
> +					__xhci_sideband_remove_endpoint(sb, sb->eps[i]);
> +		} else {
> +			for (i =3D 0; i < EP_CTX_PER_DEV; i++)
> +				sb->eps[i] =3D NULL;
> +		}
> =20
>  		__xhci_sideband_remove_interrupter(sb);
> =20
> @@ -486,7 +499,8 @@ xhci_sideband_unregister(struct xhci_sideband *sb)
> =20
>  	spin_lock_irq(&xhci->lock);
>  	sb->xhci =3D NULL;
> -	vdev->sideband =3D NULL;
> +	if (vdev)
> +		vdev->sideband =3D NULL;
>  	spin_unlock_irq(&xhci->lock);
> =20
>  	kfree(sb);
> --=20
> 2.48.1
>=20
