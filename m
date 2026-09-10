Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2872C234E
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024162; cv=none; b=UJkrRZHxUvR/Xgek/NrQE9xe0R1gLdGTcRvJblgyCkcP1TQFUYHESJV13QNcWhrG2/YD3tIaW9+cMnnpL/uAchR+d0z2+UoNQre5a974zHAlcJ245jjFGB4Qj+4Nl8Y/3IE8MUCqlujj8130WizSy6wXaiU3zbjc/MWh0tRtfuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024162; c=relaxed/simple;
	bh=Dp/YqaDoF/ouiyVFLBYoMFFKpvsa7+z8npNE91rEcsU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KUhAD3Nl3yLHeSpr4LDJGj1OOa+Xj3/mT/R0dWaqBz6jatD9WnoaVcdDvLVI9DRivNaAzGlYaz7TlVLGcfj84LBFDKOtacdtt906a934J2pmQBeGOhuq97ce8wXvrmNctXd8bgEEF5oU1dbNDp5p34tuxkMhbbTHxqAWTTyAMOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.66])
	by APP-01 (Coremail) with SMTP id qwCowABXLPCZV6JqEVKWBw--.33934S2;
	Thu, 10 Sep 2026 15:09:13 +0800 (CST)
Message-ID: <35cf76a67f7473d5ef86d01c812d680abc41687e.camel@iscas.ac.cn>
Subject: Re: [PATCH 1/2] drm/verisilicon: set blend mode for the primary
 plane
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 15:09:13 +0800
In-Reply-To: <20260901171703.1161592-1-zhengxingda@iscas.ac.cn>
References: <20260901171703.1161592-1-zhengxingda@iscas.ac.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID:qwCowABXLPCZV6JqEVKWBw--.33934S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW7Gw4xAFy5WFykuw4kZwb_yoW8Jw1xpF
	srAFWqkrWFywsrJa47Ja9FkFW3ua1fG3s7Wry8uwnrXwsrtr15uF4ktr90gFW5JrW7Ww1a
	qrn7CF1UCr1UCr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
	C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8OzVUUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

=E5=9C=A8 2026-09-02=E4=B8=89=E7=9A=84 01:17 +0800=EF=BC=8CIcenowy Zheng=E5=
=86=99=E9=81=93=EF=BC=9A
> Blend modes are now required to expose pixel formats w/ alpha.
>=20
> As it's the primary plane and blending is explicitly disabled, just
> expose PIXEL_NONE blend mode.

Gently ping for reviews.

Thanks,
Icenowy

>=20
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> =C2=A0drivers/gpu/drm/verisilicon/vs_primary_plane.c | 3 +++
> =C2=A01 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> index 1f2be41ae496c..8d58682d88ef8 100644
> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
> @@ -7,6 +7,7 @@
> =C2=A0
> =C2=A0#include <drm/drm_atomic.h>
> =C2=A0#include <drm/drm_atomic_helper.h>
> +#include <drm/drm_blend.h>
> =C2=A0#include <drm/drm_crtc.h>
> =C2=A0#include <drm/drm_fourcc.h>
> =C2=A0#include <drm/drm_framebuffer.h>
> @@ -179,5 +180,7 @@ struct drm_plane *vs_primary_plane_init(struct
> drm_device *drm_dev, struct vs_dc
> =C2=A0
> =C2=A0	drm_plane_helper_add(plane, &vs_primary_plane_helper_funcs);
> =C2=A0
> +	drm_plane_create_blend_mode_property(plane,
> +					=C2=A0=C2=A0=C2=A0=C2=A0
> BIT(DRM_MODE_BLEND_PIXEL_NONE));
> =C2=A0	return plane;
> =C2=A0}

