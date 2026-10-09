Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F923339B41
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582462; cv=none; b=OuW5rca6rxmguuK3Dln+NOwfwX09XeAxUR1CuzPDO6DutWtQNU/9RH1341KWzBeD/dE/p4grNS+s6VbrkuhCZuYaZhr0/lQTfYSkdXqYIiE9hRRMoo3qP2ASEji3t8QZNijLcSj+qnLp8JQquarPWFjk6+Cy+AbY2Jdif+oa8Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582462; c=relaxed/simple;
	bh=DTA2wgLek/W2W0dujTIKYx+ttg03B4G6tQ9cdU/qZs0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=mOM4ajzp9XIgKKx9T8eXNpjbknoBq68ngzU5hwbtIKuD0SaN3oh34jPA0LtwO8Etwye27fjUSxptH3hPZWEomsY94zcffyAv5dONNL9OSYSzeHoCUuM4VRtLCl9Hf8htiqtWZov0ZZy2/fA3pGTZQlTTLXnyi9ikXafmz6fzRgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V0y2aEKw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V0y2aEKw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1C11F000FF;
	Fri,  9 Oct 2026 21:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582460;
	bh=suwJGILMccxLxos8LqCKfSO7hRPSeKli3vME6xF73Lk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=V0y2aEKwxiohi5Nm+RiAI/Ea5J9jtC0EZ7bdD8fVEePKMy1YmHqecBW3NC3rPGRtb
	 yrflB4WzIJNtTSCCEmYq266ibzwBYqxyPxYfrnY1tYvgDZD0XkqpXiPoDJvSMWUfzj
	 QJBTgeRlI7ERzbNH4zv3EOXaRL2WRwwcTrkPESLjRIpgK+qiyvf4Glo+TPTX2Tri3t
	 LdbbDmjn3P6mQatxlE1ZXQHDMrGohm3mBBQ0MqxrCMah1INinTKsWmNrlujb5OCmOB
	 ZlxS02SwmmpXqgdDmgBWXzjL/pc8Stf+4sYuFpn0F0pPSwGJkchfiAB8vwz2Ffu9cW
	 ZhLP0wGtVUNfw==
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 23:47:36 +0200
Message-Id: <DM0MZ6DRWX8E.6AK134LAA45Y@kernel.org>
Subject: Re: [PATCH v2 1/3] nouveau: Fix NULL pointer dereferences in
 GETPARAM ioctl
Cc: <jim.cromie@gmail.com>, "Lyude Paul" <lyude@redhat.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Dave
 Airlie" <airlied@redhat.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Daniel
 Campos Ramos" <Capitain_Jack@yahoo.com>
To: "Jim Cromie via B4 Relay" <devnull+jim.cromie.gmail.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
 <20261009-my-fixups-v2-1-839e2bbe514d@gmail.com>
In-Reply-To: <20261009-my-fixups-v2-1-839e2bbe514d@gmail.com>

On Fri Oct 9, 2026 at 7:44 PM CEST, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>
> When hardware or firmware initialization fails, the graphics engine
> (gr) or device functions may remain NULL. Attempting to access these
> during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS) results
> in a kernel NULL pointer dereference, causing a crash when userspace
> (GNOME/Mesa) attempts to probe the device.
>
> Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in the
> ioctl handler. Return -ENODEV to signal the missing hardware state to
> userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
> kernel log without risking a console flood.
>
> NOTE:
>
> I encountered these crashes while booting unrelated code (in
> dynamic-debug) on real HW.  There was also some fwupd updates around
> this time, so it could all be transient/unreproducible.  But it did
> happen, and could happen again in unforseen circumstances.
>
> @Capitain_Jack tested the error path in v1 by deleting the FW
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>

Do they need to be separate patches? Do we need a Fixes: tag? Why not CC st=
able?

> ---
>  drivers/gpu/drm/nouveau/nouveau_abi16.c | 22 ++++++++++++++++++++--
>  1 file changed, 20 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/no=
uveau/nouveau_abi16.c
> index 4542d5f4ded8..3f130cd4fbcd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -306,6 +306,11 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>  		getparam->value =3D 1;
>  		break;
>  	case NOUVEAU_GETPARAM_GRAPH_UNITS:
> +		if (!gr || !gr->func) {
> +			NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no gr engine or func\n");
> +			return -ENODEV;
> +		}
> +
>  		getparam->value =3D nvkm_gr_units(gr);
>  		break;
>  	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
> @@ -315,10 +320,23 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
>  		break;
>  	}
>  	case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
> -		getparam->value =3D nvkm_device->func->resource_size(nvkm_device, NVKM=
_BAR1_FB);
> +		if (!nvkm_device || !nvkm_device->func || !nvkm_device->func->resource=
_size) {

How can any of those ever be NULL?

> +			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_BAR_SIZE: no device func\n");
> +			return -ENODEV;
> +		}
> +
> +		getparam->value =3D
> +			nvkm_device->func->resource_size(nvkm_device, NVKM_BAR1_FB);
>  		break;
>  	case NOUVEAU_GETPARAM_VRAM_USED: {
> -		struct ttm_resource_manager *vram_mgr =3D ttm_manager_type(&drm->ttm.b=
dev, TTM_PL_VRAM);
> +		struct ttm_resource_manager *vram_mgr =3D
> +			ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
> +
> +		if (!vram_mgr) {

Same here, how can this ever be NULL?

> +			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_USED: no vram mgr\n");
> +			return -ENODEV;
> +		}
> +
>  		getparam->value =3D (u64)ttm_resource_manager_usage(vram_mgr);
>  		break;
>  	}
>
> --=20
> 2.56.0

