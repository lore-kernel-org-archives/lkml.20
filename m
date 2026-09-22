Received: from mta0.migadu.com (out-128.mta0.migadu.com [91.218.175.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62CC486B8F
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790100696; cv=none; b=usbv5vmgXi1RHV4gw0f+pEY/IsX38JVUMIJU5LSbJeI+sjRNFZmPgXr5NmD99J/RmtdHZgSawAlh3R42WCJV9NPkCy34u+FbO+E4ROxv75C9DMXGwEn/ba7LB+WAiaFxLSzCw8nTpQUC+7LJUf1NaQJWibWKJ5kP2mgpRWbP2Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790100696; c=relaxed/simple;
	bh=2yklJXh1jDhjZosVDlDIrp4aXiVIg5PtSRAofTMK6Zo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=bRBeikEg5E2AyThJDnGvqpPF560niKckVb7+WYJTVMXC9VkysOMRPQbIxy7897nFCpgUUTWocYm6xsWYH2w5d1em2S/cSRvdTgjRSQOcxbsXm/pgLEgZNYq41gDTd/uX1sk+NpTgYxsSUGbWGpIxChCnoN4nNv+P/SKVPUQE3ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com; spf=pass smtp.mailfrom=cknow-tech.com; dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b=Ih5WkYKG; arc=none smtp.client-ip=91.218.175.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow-tech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow-tech.com header.i=@cknow-tech.com header.b="Ih5WkYKG"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=2yklJXh1jDhjZosVDlDIrp4aXiVIg5PtSRAofTMK6Zo=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790100688; v=1; x=1790705488;
 b=Ih5WkYKGRceqGE0b6Bvw0wDkK7rDAkYvMXrNr5w7HfqtLjKsuDJ6RPwgQZ6x2W1EmmPFWPGx
 4mISAuTi9S/bX3wQOxWPUYygkl+U8qNgju0JL0T82IGPNqmHkb+VH7jwJKDNLg+HRA+XH0qRsmY
 nmzw/LSllhNVthgNVlpGvMj/i6V47agMA3IdqVy7LGnpf5i3epN9c0NoZdAz26N2wyGn5tM0ERj
 PkihUeaYxlSoF6g2ChxkEBOM54F5fjipuiIptNhAziJid7NuR352T869zycUTjjA6xMomOjaCVQ
 Luh23R/bw2qwr42Kcaqq/XWkPyFpIfWhpO9k0QjsDnBYg==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id ab83d78d1a42a1f1;
	Tue, 22 Sep 2026 18:11:18 +0000
X-Mizu-Trace-ID: ab83d78d1a42a1f1
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 20:11:13 +0200
Message-Id: <DLM1Q8SJMXVA.5DQFQM21KJ82@cknow-tech.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm: rockchip: add
 drm_plane_create_blend_mode_property
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Johan Jonker" <jbx6244@gmail.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-24-g39041fd9f179
References: <20260909-blend-v2-1-37e27af4faee@gmail.com>
In-Reply-To: <20260909-blend-v2-1-37e27af4faee@gmail.com>

On Wed Sep 9, 2026 at 11:20 PM CEST, Johan Jonker wrote:
> A validate_blend_mode_for_alpha_formats() function was added that
> fills the kernel log with warnings for Rockchip VOP version 1 SoCs.
> Add a drm_plane_create_blend_mode_property() function as fix.
> VOP version 1 doesn't support blending with a pixel alpha background
> layer, only with a constant alpha. Advertise blending capability with
> DRM_MODE_BLEND_PIXEL_NONE.

On a 7.3-rc1 kernel without this patch, I saw the following:

Rock64 (RK3328):
```sh
root@rock64-test:~# dmesg --level 4 | grep PLANE
[    7.567004] rockchip-drm display-subsystem: [drm] [PLANE:35:plane-0] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    7.567083] rockchip-drm display-subsystem: [drm] [PLANE:38:plane-1] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    7.567132] rockchip-drm display-subsystem: [drm] [PLANE:42:plane-2] pix=
el format with alpha exposed but blend mode not setup. Please fix.
```

RockPro64 (RK3399):
```sh
root@rockpro64:~# dmesg --level 4 | grep PLANE
[    5.695597] rockchip-drm display-subsystem: [drm] [PLANE:35:plane-0] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695636] rockchip-drm display-subsystem: [drm] [PLANE:38:plane-1] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695665] rockchip-drm display-subsystem: [drm] [PLANE:42:plane-2] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695692] rockchip-drm display-subsystem: [drm] [PLANE:45:plane-3] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695718] rockchip-drm display-subsystem: [drm] [PLANE:48:plane-4] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695745] rockchip-drm display-subsystem: [drm] [PLANE:51:plane-5] pix=
el format with alpha exposed but blend mode not setup. Please fix.
```

And on a (7.3-rc4) kernel *with* this patch, those warnings were gone.
Thanks! Feel free to include

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64

Cheers,
  Diederik

> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>
> Changed V2:
> Add comment line
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop.c
> index 0090d8ff0c79..0bc5b606f021 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1850,6 +1850,8 @@ static void vop_plane_add_properties(struct drm_pla=
ne *plane,
>  	if (flags)
>  		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
>  						   DRM_MODE_ROTATE_0 | flags);
> +	drm_plane_create_blend_mode_property(plane,
> +					     BIT(DRM_MODE_BLEND_PIXEL_NONE));
>  }
> =20
>  static int vop_create_crtc(struct vop *vop)
>
> ---
> base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
> change-id: 20260909-blend-c89d2c9f6984
>
> Best regards,


