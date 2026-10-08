Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AC53A48ED
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 22:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791497056; cv=pass; b=uSMIRy070oRJSJKr7H/qZl1P7KIHyDhlJq5hBTzeEW0qzUz0ni5jCtLRsElqzaj8dXHbwPh274YhFnb4J4g9JRkGfc3WuPfgqx5TPwnn8xvNASBnO8/10l7Ex0txVbFOWq5gGcxXFRsmvbBtvb5+pMd44NN+j0P6rQTYrWMxQmE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791497056; c=relaxed/simple;
	bh=gvUAdpamxXtaqgfWuRF+Xu3rDJSYXuAquSVPo4qgmdE=;
	h=Content-Type:From:Mime-Version:Subject:Date:Message-Id:References:
	 Cc:In-Reply-To:To; b=Jen78cizdhghmrHMKWJnYD8hWrgBdJCiQCpfU2W8cCGwveq4IOAW8/vG3ieCRvHg4ykV+u4SHS5Dq53YFcf/yLaskP4cLI7Sz05lOFEOqoTTGf22ynGyplVEndDtFs7MyV2JhaEn9KtwXI+lmX4grFMHP60LFM4c6fcCRx/i0J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=I4KUbjwR; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="I4KUbjwR"
ARC-Seal: i=1; a=rsa-sha256; t=1791497039; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G4AieDmk+ieHFzhAsuVWjTKnnCT5+jbUNvQUTThWMPS9kpqZG7ZLwDR01tU3ojd8kyZHWasM6E7X33pa9FXHxwGkXXOPs+FVeHEbDqJ8gCaGVmpiT4qPLyjB9s2JsXvhP2AKGmqAfOepOjyvV+RCVQ9GbesTt7MsxMVhnD6Z9AM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791497039; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=1IdyAD+6eJaw51gazvh2AzyurM3uxUxl45xkK9GGQSw=; 
	b=clfolC4Uel3D9ldJWAL9+ExsrOwE3yiUOdqns4op1lzxiIIvqLtCknYN8kl9g7uPk/OKyFkm0NNEb4fuaru1edhI2tZXCJZSVifREb+XwD8G/CXSA43jWg1mhx3nwTKZ3yhKtJOsj5yGQhT1xm6GDUSwoiiDIXROb3EgXOxIHos=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791497039;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=1IdyAD+6eJaw51gazvh2AzyurM3uxUxl45xkK9GGQSw=;
	b=I4KUbjwRo8Vp8xxxlBsfFSperY5OObd/p8Nc3nkzZ6u2baVDDynNGUNDo4wV2nmb
	2mfKtGHCLA7V547LxC9Tda0GHEX6zt/RFEHG++Hc8gP6SErPoubIg9z/g9kqYBxy1QE
	PbjIZdvArw1fS7DwbYLat2OCNAdvwB6m851sybLk=
Received: by smtp.zohomail.com with SMTPS id 1791497039246856.5585967911123;
	Thu, 8 Oct 2026 15:03:59 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] drm/nouveau: Skip the Turing CE workaround object for non-GR channels
Date: Thu, 8 Oct 2026 19:03:43 -0300
Message-Id: <FDA5DD6C-28C2-4A88-AF4B-366856512515@collabora.com>
References: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Mary Guillemard <mary@mary.zone>
In-Reply-To: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
To: Mary Guillemard <mary@mary.zone>
X-Mailer: iPhone Mail (24A437)
X-ZohoMailClient: External




> On 7 Oct 2026, at 11:36, Mary Guillemard <mary@mary.zone> wrote:
>=20
> =EF=BB=BFThis workaround is here for the old Gallium driver and predate as=
ync CE
> and NVDEC.  Instead of only skipping it for NVDEC, let's only apply it
> in case of GR channels.
>=20
> This should make async CE work properly on Turing by stopping the assign
> of a GRCE. (here CE0)
>=20
> Signed-off-by: Mary Guillemard <mary@mary.zone>
> ---
> drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nou=
veau/nouveau_abi16.c
> index e907c1d07887..e876f154963d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -488,7 +488,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>            goto done;
>        break;
>    case NV_DEVICE_INFO_V0_TURING:
> -        if (engine !=3D NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC) {
> +        if (engine =3D=3D NV_DEVICE_HOST_RUNLIST_ENGINES_GR) {
>            ret =3D nvif_object_ctor(&chan->chan->user, "abi16CeWar",
>                           0, TURING_DMA_COPY_A, NULL, 0,
>                           &chan->ce);
>=20
> ---
> base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
> change-id: 20261007-turing-async-ce-fix-42e179e27d4a
>=20
> Best regards,
> --
> Mary Guillemard <mary@mary.zone>
>=20

Sorry, it didn=E2=80=99t occur to me to do this instead of the NVDEC only fi=
x.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=

