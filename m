Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFFE3AA1B2
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 07:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792135453; cv=none; b=GDZ+4MAajbPvox5OHanBCZQOYe9sjKghxoYRyrF2CTh2TQ+j6BpB3WeU+2ZF6HEnUR+CO0m/7KkUUd361cBlVIXHAu5Z09L0Qo9z5OZTZFXp4yu1EMvgyH99nldx/BE3xI9CYtxctEAL7wPyV3+2+dIeCaCiSR9FjLVCa+Az1Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792135453; c=relaxed/simple;
	bh=51L8G0Ydbv4ExcyJQfSfsKUKGUlZkJRcRFAI4PJwzig=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uMTJbnGWkK3WQYKQXwS9ViQ9OOiiCbS46XQb1VS9beOAncnH2ai37TjMWD2mxpPueD55EKa9nr7RJ44iVKCEpV1ICp9q+SlXu03b/ZKBsn2Ydxtrez2+Q7BC62vifkG16JhqqciGfnUF94p3bmHaCk/d2bhskAXAweKNj2AiA6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=dtsAq3HR; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="dtsAq3HR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792135450;
	bh=51L8G0Ydbv4ExcyJQfSfsKUKGUlZkJRcRFAI4PJwzig=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=dtsAq3HR/yIkLteEMeejIpvz+NFb0MqLZDWN1oZ/nn8XDvST1JUoStd6PkaA7nWhF
	 Q2snl0bqrOOdLR5IrAAviODCXeXpmnOpEwzJ/qgNo7BWGMXQayqCoMbuZ94b3rUHjn
	 M401Hrtyn5ePxXuFBr/UVMIbsaifONXmISpsiUZ2t9qQf3H869FYx6AZ5TFPI0sjiT
	 6krZEeg6hLlggEr7ssllZalqQvUwvdaTi7954NJenPffkL2jYOnvBBHyw9bvYiLpCl
	 s4rzd2mHG1s6q7aRxqp3siMYs2p/Oyy4nYpibEBcTeE6ZiIuAegRd+0G5LV1KArPEI
	 s0XxWpSoCfktg==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C223A17E0411;
	Fri, 16 Oct 2026 09:24:09 +0200 (CEST)
Date: Fri, 16 Oct 2026 09:24:05 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/panfrost: Enable cycle counting when perfcnt is
 enabled
Message-ID: <20261016092405.14eebba9@fedora-21.home>
In-Reply-To: <20261015-panfrost-reset-races-fixes-v1-1-bb74c1786a0b@collabora.com>
References: <20261015-panfrost-reset-races-fixes-v1-0-bb74c1786a0b@collabora.com>
	<20261015-panfrost-reset-races-fixes-v1-1-bb74c1786a0b@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 15 Oct 2026 19:22:31 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> From: Boris Brezillon <boris.brezillon@collabora.com>
>=20
> If we don't do that, we end up with invalid timestamps in the block
> headers.
>=20
> Fixes: 7786fd108777 ("drm/panfrost: Expose performance counters through u=
nstable ioctls")
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>

Also, you need to add your SoB here.

> ---
>  drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/dr=
m/panfrost/panfrost_perfcnt.c
> index a9def452d5ef..b26da057a1a0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
> @@ -17,6 +17,7 @@
>  #include "panfrost_device.h"
>  #include "panfrost_features.h"
>  #include "panfrost_gem.h"
> +#include "panfrost_gpu.h"
>  #include "panfrost_issues.h"
>  #include "panfrost_job.h"
>  #include "panfrost_mmu.h"
> @@ -52,6 +53,7 @@ static void panfrost_perfcnt_hw_disable(struct panfrost=
_device *pfdev)
>  	gpu_write(pfdev, GPU_PRFCNT_TILER_EN, 0);
> =20
>  	if (perfcnt->owns_as_ref) {
> +		panfrost_cycle_counter_put(pfdev);
>  		panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
>  		perfcnt->owns_as_ref =3D false;
>  	}
> @@ -84,6 +86,7 @@ static int panfrost_perfcnt_hw_enable(struct panfrost_d=
evice *pfdev)
>  		return ret;
> =20
>  	perfcnt->owns_as_ref =3D true;
> +	panfrost_cycle_counter_get(pfdev);
> =20
>  	as =3D ret;
>  	cfg =3D GPU_PERFCNT_CFG_AS(as) |
>=20

